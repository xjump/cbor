/*
 * Package : Cbor
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 12/12/2016
 * Copyright :  S.Hamblett
 */

part of cbor;

abstract class output {
  typed.Uint8Buffer data();

  int size();

  void putByte(int value);

  putBytes(typed.Uint8Buffer data, int size);
}