{
  MIT License

  Copyright (c) 2017-2018 Marcos Douglas B. Santos

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
}
unit JamesData;

{$include James.inc}

interface

uses
  Classes, SysUtils, Variants, DB;

type
  IDataStream = interface
  ['{698868A5-9C57-4F1F-9E84-4AA7580CB01A}']
    function Save(Stream: TStream): IDataStream; overload;
    function Save(Strings: TStrings): IDataStream; overload;
    function Save(const FileName: string): IDataStream; overload;
    function AsString: string;
    function Size: Int64;
  end;

  IDataParam = interface
  ['{2C6B41D7-CB75-488A-85D4-59CE4D5388E5}']
    function Name: string;
    function DataType: TFieldType;
    function Value: Variant;
    function IsNull: Boolean;
    function AsParam: TParam;
    function AsBCD: Currency;
    function AsBlob: TBlobData;
    function AsBoolean: Boolean;
    function AsCurrency: Currency;
    function AsDate: TDateTime;
    function AsDateTime: TDateTime;
    function AsFloat: Double;
    function AsInteger: LongInt;
    function AsSmallInt: LongInt;
    function AsMemo: string;
    function AsString: string;
    function AsTime: TDateTime;
    function AsWord: LongInt;
  end;

  IDataParams = interface
  ['{650DE166-6452-4F22-80F8-F364B9BF4C50}']
    function Add(const ParamName: string; DataType: TFieldType; Value: Variant): IDataParams; overload;
    function Add(const AParam: IDataParam): IDataParams; overload;
    function Add(const AParams: IDataParams): IDataParams; overload;
    function Get(Index: Integer): IDataParam; overload;
    function Get(const ParamName: string): IDataParam; overload;
    function Count: Integer;
    function AsString(const SeparatorChar: string): string; overload;
    function AsString: string; overload;
  end;

  IDataGuid = interface
  ['{F7269A91-B5E7-4067-BB8E-8712BC99EE08}']
    function Value: TGuid;
    function AsString: string;
    function AsSmallString: string;
  end;

  IDataHash = interface
  ['{69A5ED2A-7E06-4942-A6EA-48B36670F360}']
    function AsString: string;
  end;

  IDataResult = interface
  ['{9E1AB274-707A-4770-94B9-659945547A19}']
    function Success: Boolean;
    function Data: IDataParams;
  end;

  IDataFile = interface
  ['{E700F3AE-3DD6-4146-A256-E516B692BC0A}']
    function Path: string;
    function Name: string;
    function FileName: string;
    function Stream: IDataStream;
  end;

implementation

end.

