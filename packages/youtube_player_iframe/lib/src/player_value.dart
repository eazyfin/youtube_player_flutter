// Copyright 2020 Sarbagya Dhaubanjar. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'enums/playback_rate.dart';
import 'enums/player_state.dart';
import 'enums/youtube_error.dart';
import 'meta_data.dart';

/// Youtube Player value
class YoutubePlayerValue {
  /// The duration, current position, buffering state, error state and settings
  /// of a [YoutubePlayerController].
  YoutubePlayerValue({
    this.hasPlayed = false,
    this.position = const Duration(),
    this.buffered = 0.0,
    this.fullScreenOption = const FullScreenOption(enabled: false),
    this.volume = 100,
    this.playerState = PlayerState.unknown,
    this.playbackRate = PlaybackRate.normal,
    this.playbackQuality,
    this.error = YoutubeError.none,
    this.metaData = const YoutubeMetaData(),
  });

  /// Returns true once the video start playing for the first time.
  final bool hasPlayed;

  /// The current position of the video.
  final Duration position;

  /// The position up to which the video is buffered.i
  final double buffered;

  /// The initial fullscreen option.
  final FullScreenOption fullScreenOption;

  /// The current volume assigned for the player.
  final int volume;

  /// The current state of the player defined as [PlayerState].
  final PlayerState playerState;

  /// The current video playback rate defined as [PlaybackRate].
  final double playbackRate;

  /// Reports the error code as described [here](https://developers.google.com/youtube/iframe_api_reference#Events).
  ///
  /// See the onError Section.
  final YoutubeError error;

  /// Returns true is player has errors.
  bool get hasError => error != YoutubeError.none;

  /// Reports the current playback quality.
  final String? playbackQuality;

  /// Returns meta data of the currently loaded/cued video.
  final YoutubeMetaData metaData;

  @override
  String toString() {
    return '$runtimeType('
        'metaData: ${metaData.toString()}, '
        'position: ${position.inSeconds} sec. , '
        'buffered: $buffered , '
        'volume: $volume, '
        'playerState: $playerState, '
        'playbackRate: $playbackRate, '
        'playbackQuality: $playbackQuality, '
        'error: $error)';
  }
}

/// The fullscreen option.
class FullScreenOption {
  /// Creates [FullScreenOption].
  const FullScreenOption({
    required this.enabled,
    this.locked = false,
  });

  /// Denotes that the fullscreen mode is currently enabled.
  final bool enabled;

  /// Denotes that the fullscreen mode is currently locked for auto update.
  final bool locked;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is FullScreenOption &&
            runtimeType == other.runtimeType &&
            enabled == other.enabled &&
            locked == other.locked;
  }

  @override
  int get hashCode => enabled.hashCode ^ locked.hashCode;
}
