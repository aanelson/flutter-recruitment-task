// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MovieListCubitState {
  List<MovieItem> get movieItem => throw _privateConstructorUsedError;
  Loadstate get loadState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieListCubitStateCopyWith<MovieListCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieListCubitStateCopyWith<$Res> {
  factory $MovieListCubitStateCopyWith(
          MovieListCubitState value, $Res Function(MovieListCubitState) then) =
      _$MovieListCubitStateCopyWithImpl<$Res, MovieListCubitState>;
  @useResult
  $Res call({List<MovieItem> movieItem, Loadstate loadState});
}

/// @nodoc
class _$MovieListCubitStateCopyWithImpl<$Res, $Val extends MovieListCubitState>
    implements $MovieListCubitStateCopyWith<$Res> {
  _$MovieListCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieItem = null,
    Object? loadState = null,
  }) {
    return _then(_value.copyWith(
      movieItem: null == movieItem
          ? _value.movieItem
          : movieItem // ignore: cast_nullable_to_non_nullable
              as List<MovieItem>,
      loadState: null == loadState
          ? _value.loadState
          : loadState // ignore: cast_nullable_to_non_nullable
              as Loadstate,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MovieListCubitStateCopyWith<$Res>
    implements $MovieListCubitStateCopyWith<$Res> {
  factory _$$_MovieListCubitStateCopyWith(_$_MovieListCubitState value,
          $Res Function(_$_MovieListCubitState) then) =
      __$$_MovieListCubitStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MovieItem> movieItem, Loadstate loadState});
}

/// @nodoc
class __$$_MovieListCubitStateCopyWithImpl<$Res>
    extends _$MovieListCubitStateCopyWithImpl<$Res, _$_MovieListCubitState>
    implements _$$_MovieListCubitStateCopyWith<$Res> {
  __$$_MovieListCubitStateCopyWithImpl(_$_MovieListCubitState _value,
      $Res Function(_$_MovieListCubitState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieItem = null,
    Object? loadState = null,
  }) {
    return _then(_$_MovieListCubitState(
      movieItem: null == movieItem
          ? _value._movieItem
          : movieItem // ignore: cast_nullable_to_non_nullable
              as List<MovieItem>,
      loadState: null == loadState
          ? _value.loadState
          : loadState // ignore: cast_nullable_to_non_nullable
              as Loadstate,
    ));
  }
}

/// @nodoc

class _$_MovieListCubitState implements _MovieListCubitState {
  _$_MovieListCubitState(
      {required final List<MovieItem> movieItem, required this.loadState})
      : _movieItem = movieItem;

  final List<MovieItem> _movieItem;
  @override
  List<MovieItem> get movieItem {
    if (_movieItem is EqualUnmodifiableListView) return _movieItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movieItem);
  }

  @override
  final Loadstate loadState;

  @override
  String toString() {
    return 'MovieListCubitState(movieItem: $movieItem, loadState: $loadState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieListCubitState &&
            const DeepCollectionEquality()
                .equals(other._movieItem, _movieItem) &&
            (identical(other.loadState, loadState) ||
                other.loadState == loadState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_movieItem), loadState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MovieListCubitStateCopyWith<_$_MovieListCubitState> get copyWith =>
      __$$_MovieListCubitStateCopyWithImpl<_$_MovieListCubitState>(
          this, _$identity);
}

abstract class _MovieListCubitState implements MovieListCubitState {
  factory _MovieListCubitState(
      {required final List<MovieItem> movieItem,
      required final Loadstate loadState}) = _$_MovieListCubitState;

  @override
  List<MovieItem> get movieItem;
  @override
  Loadstate get loadState;
  @override
  @JsonKey(ignore: true)
  _$$_MovieListCubitStateCopyWith<_$_MovieListCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}
