/*
 * Package : Cbor
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 12/12/2016
 * Copyright :  S.Hamblett
 */

part of cbor;

/// CBOR decoding constants
const int majorTypeShift = 5;
const int minorTypeMask = 31;

/// Major type constants
const int majorTypePint = 0;
const int majorTypeNint = 1;
const int majorTypeBytes = 2;
const int majorTypeString = 3;
const int majorTypeArray = 4;
const int majorTypeMap = 5;
const int majorTypeTag = 6;
const int majorTypeSpecial = 7;

/// Additional information constants
const int ai20 = 20;
const int ai21 = 21;
const int ai22 = 22;
const int ai23 = 23;
const int ai24 = 24;
const int ai25 = 25;
const int ai26 = 26;
const int ai27 = 27;
const int aiBreak = 31;

/// Numerical constants
final int two8 = pow(2, 8);
final int two16 = pow(2, 16);
final int two32 = pow(2, 32);
final int two64 = pow(2, 64);
const double halfLimitUpper = 65504.0;
const double halfLimitLower = -65504.0;
const double singleLimitUpper = 3.4028234663852886e38;
const double singleLimitLower = -3.4028234663852886e38;
const int simpleLimitUpper = 255;
const int simpleLimitLower = 0;


/// Half precision mapping tables
final typed.Uint16Buffer baseTable = new typed.Uint16Buffer();
final List<int> shiftTable = [
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  23,
  22,
  21,
  20,
  19,
  18,
  17,
  16,
  15,
  14,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  13,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  23,
  22,
  21,
  20,
  19,
  18,
  17,
  16,
  15,
  14,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  13,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  24,
  13
];

void init() {
  baseTable.addAll([
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0000,
    0x0001,
    0x0002,
    0x0004,
    0x0008,
    0x0010,
    0x0020,
    0x0040,
    0x0080,
    0x0100,
    0x0200,
    0x0400,
    0x0800,
    0x0C00,
    0x1000,
    0x1400,
    0x1800,
    0x1C00,
    0x2000,
    0x2400,
    0x2800,
    0x2C00,
    0x3000,
    0x3400,
    0x3800,
    0x3C00,
    0x4000,
    0x4400,
    0x4800,
    0x4C00,
    0x5000,
    0x5400,
    0x5800,
    0x5C00,
    0x6000,
    0x6400,
    0x6800,
    0x6C00,
    0x7000,
    0x7400,
    0x7800,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x7C00,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8000,
    0x8001,
    0x8002,
    0x8004,
    0x8008,
    0x8010,
    0x8020,
    0x8040,
    0x8080,
    0x8100,
    0x8200,
    0x8400,
    0x8800,
    0x8C00,
    0x9000,
    0x9400,
    0x9800,
    0x9C00,
    0xA000,
    0xA400,
    0xA800,
    0xAC00,
    0xB000,
    0xB400,
    0xB800,
    0xBC00,
    0xC000,
    0xC400,
    0xC800,
    0xCC00,
    0xD000,
    0xD400,
    0xD800,
    0xDC00,
    0xE000,
    0xE400,
    0xE800,
    0xEC00,
    0xF000,
    0xF400,
    0xF800,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00,
    0xFC00
  ]);
}