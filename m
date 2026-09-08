Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011010.outbound.protection.outlook.com [52.101.70.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851FB39E18F;
	Tue,  8 Sep 2026 20:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788897739; cv=fail; b=Ylm417FBIMQoTzAC+9PVd+ompG13gkD3qbjyj2PfJMNLo4L4+mmeIkIuSNPHiQ/BxUJjaeGKodssBH1Dl/nHyGrsdECSVtGxRWDL9ILhvZKcaR2jgaMsg2NsCmM/9zYOboe8OUhCEYuoWGQYlrZigK24tZ3RZcOcJZa1OsoEV4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788897739; c=relaxed/simple;
	bh=yOzQWtCK1aZj4RXgCdkxY16S6G54m3DHTkrd1aHIAHM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sk2APnoebWYfzOhpz0xUIxzlRhzOcKLlYQEkqlqyJNqg9OVad5k+MDs8E25iIFjxsQjCoXUJLXVme+1ziaU0aFpPLVpw/GX3WDSeOdPGFTserx0+2183/xSZtY3L8cxnOWuXENK4HEIOOyTOWNF8THCt53gJaPHMN1qa7zwxzIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=JscijGAU; arc=fail smtp.client-ip=52.101.70.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="JscijGAU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xgodQm0JZEmrjsQO+8238mDH3Kc3PXYoqOpclmXcZYx9SyZKgT8fC5Pf/+9qZYQK9BA+CSbZvHugDkJzisp5mWKGr0IfYWKFWDdpxpZqA8ppNd75g39iGH1TghcCJ3jDa7NryI264d0Ev3iKS+FecAQdIpZ7Xbx+ShGcWoMrniR4dlge31sgLTKOGVAOz6xgBhs2weCKG5giHZVRrHPJH4DkgLJtwLWfskzBwGaFsx3ykUkiwuRAciicTwCtGeBfQOq8y1OEZTCr2PBUBnM3Od631qh16pKpybNfnV2kzI9YZByiyqlFo14WRw5tjUkMlwvi6xU5PY90j6fwWxJpfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOzQWtCK1aZj4RXgCdkxY16S6G54m3DHTkrd1aHIAHM=;
 b=wv1WV1tYsAYx0biteocCl2sFHmAnxqH9QH7SVCRCG+YO26Xz5gqkO4gTDR2bsuCjNxoco4iPD10ko13Jck7Jqm69fAfvsCJwNr2FjlN1cENrJdbZBZ2ojO/5Z3lY+CMy2GKYixznvt/EHfOZpP9wb330YE4532R5rbDzYLpjE1NTpyLHk2C8un+73H81nfZ2Ns1LEV9uUS7sfBpveAhx5Gv5rNRXRqUstlSIAtaxiGGchYuPxg7Cix5m9BIUCGIrscJOBllq1IjIpdJADgIY+kUrrveESmgJWOI7TNU7AYjgFn8u6tTLnfNsbRfmvwf3VyWQuaXUW0IC0TkJXDbnZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOzQWtCK1aZj4RXgCdkxY16S6G54m3DHTkrd1aHIAHM=;
 b=JscijGAUZEMvSBngYonwMYwZU7AHIMrW3TSCzT66nAHMkrxoaERYoc5UEf8/WSz5G28tnfxVChAYGBbCt6ejznlpKKig9MWrNdBjYO2jdSlGGlfuvXVJgzmZLcX8KrPX8JfJddONdYW2loxCRw3t/PUrsDHHAVgIxeAtds6HRa89LnRvCaL/c6RZ3+jdINryQVg36GWmn59ZDE0G5Gzc5ujN80Csj7L3+AcQ86MCYb/ex/RsyUfPcRYsjUh36orS5tS42Fv97gJ91IOD03g3IluOy5D0ws9T5Gbtj8KsQJDRm13elviApUw1z40JeKSb43gLEeNocbmQlvTBGgdV0w==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by PAXPR10MB5382.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:286::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 20:02:14 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%6]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 20:02:12 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "arnd@kernel.org" <arnd@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "anders.berg@lsi.com" <anders.berg@lsi.com>,
	"arnd@arndb.de" <arnd@arndb.de>
Subject: Re: [PATCH 13/13] ARM: axxia: remove entire platform
Thread-Topic: [PATCH 13/13] ARM: axxia: remove entire platform
Thread-Index: AQHdP6cIPkef5oAhoUK0WtpEZmevUbbFGo8A
Date: Tue, 8 Sep 2026 20:02:12 +0000
Message-ID: <b38756ef71ffc0b28cfe1399a59e5cdbb9e06ff6.camel@siemens.com>
References: <20260908152808.3928630-1-arnd@kernel.org>
	 <20260908152808.3928630-14-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-14-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|PAXPR10MB5382:EE_
x-ms-office365-filtering-correlation-id: f0bddea6-2523-42a9-3efd-08df0de412be
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|10070799003|366016|376014|10067099003|56012099006|11063799006|4143699003|18002099003|55112099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 f31LVmz5/TPBsEMX6Lol7ho2RGMud7FMQsvUQeipSO2y1mY0IBdhgj+wpBb2Gv1kZVAtxxrnxGDNZmKQIeSx4PMSMq3QHT0wSbuPw16WqLe9oNBP8d0UERD7EcDQfr3YHFuYt3IMLxRP+NXoCTBt80T7EtKiY6q2+075j0RbPqWKJZV22G6sS9IEA2KokNS6/6op0zBIgP/sjzFKVORy/WsL68QdtwNqyv5WdLh+q7f4Mu8Nrq3N1eIvmiOs+OM8xYX4aI6rHajrE5QCV6LeNJlOo1hlTbPVeHjivRESkJjvD6u+kCfmoiWJIM52Da0S63AZ5JfTby29tv/OyVMZwLSFUwMf1cl3BurdKNm7pahGhdFBR4ghyFDyXbxITapRpGBIoTjq80vHMIzY4HPiyzYcw5M1qJ4hMm+TBuu57NcLOreP4Sb5on4VxT78e136zhANPu7c9Qn3PNIH6YV96tvwFtRnYdFd0CMpKwNiulpVBIqEvcSABOJRQOD591TV1/kSLhbVots37AxPohdX18JWCSE29nL8EVjDYDFiEpHY0R4H7XZBxnkIxp85z+XQjTtYJ3lU//3+NoJJKqZuC/Vzt3JJ6GgEyjtc0LNofHs1g4LW6KzyYXDQH5yYprpcCaKRPLJrHpvBgz/VsLaGUMkI7HU2bhcjsSzLqANmXyM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(366016)(376014)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(55112099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U3U0bkQzUU9ReUlHeUNmWEV4eTlpTG05Rzl0VHM4TXNKVXlzejhHWE1LY2Iw?=
 =?utf-8?B?Snd6ZDhBVjNVM2c5RzFFaVgxay96d3NwZnloK0NobHRLb0NzZHpLR3JJYWRy?=
 =?utf-8?B?R2tqVzRTN0I5QlZka1h0UHpqSFI4RXBPZFZwb041N1hwUGswUXExSk92YlRl?=
 =?utf-8?B?OHRaYXVBNDNEM05jTjM0aFY0aHlIaFdFL1liWGhVeGtaNWF2cUpnd2J2bUxv?=
 =?utf-8?B?eitnL3k0YVBTVGRQckk5eGJlN0VqTVA2Q2lGaGN3Y09UdlVFZ2ozM2tvNVBa?=
 =?utf-8?B?dGRFOG10M2o0ZXZEZkh2OUN4NEN3ZzR5OXh0YTZoZG9FWldpQkxsS0toNE4x?=
 =?utf-8?B?NnFINW5wQmNiQ2dCWnN5ZUgyZTZBSDBaM2hoUmNtUnlQSzJSanFRMFk1d1N1?=
 =?utf-8?B?T3VWMUJvMElxcktXL1d6NlorYURIUzhhdEFyb01xZmlSUEwvZ29xWlBPRU12?=
 =?utf-8?B?ZjRRTEJDZ2IvSGc0THFMNFlvZWlVNkZ2eHlMVVlFUG92VUhwRGczK2prTE9q?=
 =?utf-8?B?R1VhajVZQ0ZnNG42ZysweEZybGdGWXRtbHpXSXBjNE1PWHdyKzZDSUtPL254?=
 =?utf-8?B?TCtYUzc1eGVsZVFNN1dmcnFtMXZnaWFuaTJuYk1HMmtaSjZBeUo4YlI5TDd1?=
 =?utf-8?B?OWl0b2RLUXY0UDRzbmlveHo1bll5anY4aEJJZVNJUFM5d1c3Q1J4L3hyYmEw?=
 =?utf-8?B?d1QyR3NUaktReHBjZjUrelR5Q1lmWlNtK05CaEtUc0xrMlZsbiszeHJzSzll?=
 =?utf-8?B?K3h3OCt6ZTIrWGt3UHdTNHVHbzhnb1RoNFNaNnBnS2laN2l2QlIrOUJDV1Av?=
 =?utf-8?B?TXVDSnZpNmMxMS90YjVlTXRrWlkrVUlaRUNvWXZKeXNCWWIvMWt1N0hncGxM?=
 =?utf-8?B?ZldnYnNvWW1uajhpT3ZVKzMxWk1IU2FUVXFneHpRYmpmbVFONkIyVVg3a3hZ?=
 =?utf-8?B?ejJ1S1R6bUhmVkpxdkFKS2RIVGpDelRwaUVJMFdWVGRvK1BuNFNkTzA1ZUNG?=
 =?utf-8?B?eWk2Y0xZQ1ZGdHZnQTMvaGduclB4Q0g5UnlJV0hORW1nWnFqamZlTXdFL1FF?=
 =?utf-8?B?S1BKcENFeUpqOEhXV1d2eVhkNXV1c24wb0xlbEJVVzRjQlhMc0lnWGNRV2VG?=
 =?utf-8?B?S05TdUtOZ1lZNmJCblhKOVJUODJ4WFYvN0VOUHo0OWk3UFlxdGVLTHd3VVRt?=
 =?utf-8?B?TmhyZlpJRDg0OGZlVTQyaVFTL2hiQUg0bFduMDkwak5YaWpjL2ROTVY4MXEv?=
 =?utf-8?B?TW5qa1F2S0ZnQWhFVEphbmhxYkI3QXh5cStodzh3b3d1K3NmbFZteHQ0c1No?=
 =?utf-8?B?OVNWTVkxdWQxb1E4aXpMTUFSYXM1NU96VnNiRGgvME9mSUVHRTVFMDlTcnI2?=
 =?utf-8?B?RG9lYjhGQjVCbTlZeldvcWhzMDg0eEIrTFZhaEpKcm5wT1R2VkhnRzRVeWli?=
 =?utf-8?B?VGVSaU1MS2FVNEQyTEJYcEtVamVNcUVJUmtXeXRFNEpTRnpKMlg1bWo1aDVx?=
 =?utf-8?B?aVMxU09wck1rUVJiYzNKVUhldjd4T0xxODhHR29kQnd6VjBNVkZwYkV1NlF6?=
 =?utf-8?B?ZFAyb0taOVZxN3B2LzVDdlc1SWloN2pIcHRsTHRUUHVuaDBwLzJFUkJ6NHlo?=
 =?utf-8?B?R0VBRUJxS3dlODZQNnlDdWUwU3FTSWlFQ2RjcXNOT1pFNlpOanE3S201L2t5?=
 =?utf-8?B?UytNSkxPTFY1NVg5RFZxa1Eyd3VBRFArc29iRytFcFI3V0dhd2tNWkhHNWVn?=
 =?utf-8?B?N245YWpXVUlkT25aam95c0tIY2ROdXJWaHZtYzBxNmNlN3BFbGg5aWRPSzBM?=
 =?utf-8?B?MzQyM0drVTNTVDJ2aU5iRjFoR3JEZHJuenM4L1lOTCtGaWJiQXFEdFpYUW1X?=
 =?utf-8?B?RGVDVTg5MzlRckNHTUlrR2lzVlhQTVRxNHlKNStnZTRaRkY5V3grbHk5SWY1?=
 =?utf-8?B?bFlrS2lOcGpHVXdlWDlOMGsxQWVPSUNaaXlPZWVqeENFUVgzN3FEeU9aZFNL?=
 =?utf-8?B?VHAwenk5UDRqSEIxVTA0YnAyc3lVOXczR2tUamhtSlhySUV4NFVqTHhMRWRD?=
 =?utf-8?B?c0MrZ0k4SldyVkFQdWJweTFEZENQZXJGa0hvRmYrelkvS01JV09TZ3FtaXFo?=
 =?utf-8?B?RW9BT0kxd0FFeFpaY0hnV3BLS3JaK2hhc0VlT3pveFUya1pmOTJZM1hwU08y?=
 =?utf-8?B?eVRCU3RpY09Mc2NuQk9tVjMrV1o2M0ptN1NxQkhGMWlkWnUvTGlETFFhcTV1?=
 =?utf-8?B?YkV6VTdTaGIyeDZZR3dYUGZFaHltOCsxS2xtcEdVeVk2NXNXYjNZQTlaL2xt?=
 =?utf-8?B?eTFNeDYveWhONVdWSWJJWmlaSFh3VUIyVWxaZUxWSG5GNEc2TVlYczJseWhB?=
 =?utf-8?Q?d8UevaBx45mPgAKzrsjUE203AYEfC3Zu1mTrZS/eWM/0m?=
x-ms-exchange-antispam-messagedata-1:
 DzlLyDaCBhJfuDnNlITniQylZJTNHK2LkoDXXr8TdYCpyejF6r+1ZLt3
Content-Type: text/plain; charset="utf-8"
Content-ID: <99F24C6C42AB034D82FD8A371BAB5BEE@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f0bddea6-2523-42a9-3efd-08df0de412be
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 20:02:12.7477
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z2e0SiGjj920Xopaf1nY47U23CGy06pVBOoW/dnZCHVi6oCQDDXqmUZ2v0pnzHTvMeV6eZdTkMiUcB2MvVzQC+qkDLj9HIxoQVjLI/d2JMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5382

T24gVHVlLCAyMDI2LTA5LTA4IGF0IDE3OjI4ICswMjAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+
IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gCj4gVGhlIGluaXRpYWwgQXh4
aWEgcG9ydCB3YXMgY29udHJpYnV0ZWQgYnkgTFNJIGluIDIwMTQsIGJ1dCBuZXZlciBjb21wbGV0
ZWQKPiBhZnRlciB0aGUgc2FsZSBvZiB0aGUgYnVzaW5lc3MgdW5pdCB0byBJbnRlbCwgd2hpY2gg
a2VwdCBzdXBwb3J0aW5nIHRoZQo+IGJ1bGsgb2YgdGhlIGRyaXZlcnMgaW4gdGhlaXIgb3duIGRv
d25zdHJlYW0gQlNQLgo+IAo+IFRoZSBkb3duc3RyZWFtIHdvcmsgaGFzIGFsc28gZW5kZWQgbm93
LCBhbmQgdGhlcmUgaXMgbm8gcmVhbGlzdGljIGNoYW5jZQo+IHRoYXQgYW55b25lIHdvdWxkIHJl
d3JpdGUgaXQgYWxsIGludG8gYW4gdXBzdHJlYW1hYmxlIHBvcnQuCj4gCj4gUmVtb3ZlIGl0IG5v
dyB0aGF0IHRoZSA3LjNMVFMgcmVsZWFzZSBpcyBvdXQgYW5kIGNhbiBiZSB1c2VkIGFzIHRoZQo+
IGJhc2UgZm9yIG9uZSBtb3JlIGRvd25zdHJlYW0gcmViYXNlIG9mIHRoZSBkb3duc3RyZWFtIHBh
dGNoZXMgaWYgbmVlZGVkLgo+IAo+IENjOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5l
bC5vcmc+Cj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gQ2M6IENvbm9yIERv
b2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz4KPiBDYzogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4
YW5kZXIuc3ZlcmRsaW5Ac2llbWVucy5jb20+Cj4gQ2M6IEV0aGFuIE5lbHNvbi1Nb29yZSA8ZW5l
bHNvbm1vb3JlQGdtYWlsLmNvbT4KPiBDYzogQW5kZXJzIEJlcmcgPGFuZGVycy5iZXJnQGxzaS5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KClJldmll
d2VkLWJ5OiBBbGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVyZGxpbkBzaWVtZW5zLmNv
bT4KCj4gLS0tCj4gwqAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXh4aWEueWFtbMKgwqDC
oMKgwqDCoMKgIHzCoCAyMyAtLQo+IMKgTUFJTlRBSU5FUlPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA4IC0K
PiDCoGFyY2gvYXJtL0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgLQo+IMKgYXJjaC9hcm0vTWFrZWZpbGXCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDC
oCAyIC0KPiDCoGFyY2gvYXJtL2Jvb3QvZHRzL2ludGVsL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgwqAgMSAtCj4gwqBhcmNoL2FybS9ib290L2R0cy9pbnRlbC9heG0vTWFr
ZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNSAtCj4gwqAuLi4vYm9vdC9kdHMvaW50ZWwv
YXhtL2F4bTU1MTYtYW1hcmlsbG8uZHRzwqDCoCB8wqAgNDcgLS0tLQo+IMKgYXJjaC9hcm0vYm9v
dC9kdHMvaW50ZWwvYXhtL2F4bTU1MTYtY3B1cy5kdHNpIHwgMjAwIC0tLS0tLS0tLS0tLS0tLQo+
IMKgYXJjaC9hcm0vYm9vdC9kdHMvaW50ZWwvYXhtL2F4bTU1eHguZHRzacKgwqDCoMKgwqAgfCAy
MDAgLS0tLS0tLS0tLS0tLS0tCj4gwqBhcmNoL2FybS9jb25maWdzL2F4bTU1eHhfZGVmY29uZmln
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIzMSAtLS0tLS0tLS0tLS0tLS0tLS0KPiDCoGFyY2gv
YXJtL21hY2gtYXh4aWEvS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqAgMTcgLS0KPiDCoGFyY2gvYXJtL21hY2gtYXh4aWEvTWFrZWZpbGXCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDMgLQo+IMKgYXJjaC9hcm0vbWFjaC1heHhpYS9h
eHhpYS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxOSAtLQo+IMKg
YXJjaC9hcm0vbWFjaC1heHhpYS9wbGF0c21wLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqAgODcgLS0tLS0tLQo+IMKgMTQgZmlsZXMgY2hhbmdlZCwgODQ1IGRlbGV0aW9ucygt
KQo+IMKgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9hcm0vYXh4aWEueWFtbAo+IMKgZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRz
L2ludGVsL2F4bS9NYWtlZmlsZQo+IMKgZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3Qv
ZHRzL2ludGVsL2F4bS9heG01NTE2LWFtYXJpbGxvLmR0cwo+IMKgZGVsZXRlIG1vZGUgMTAwNjQ0
IGFyY2gvYXJtL2Jvb3QvZHRzL2ludGVsL2F4bS9heG01NTE2LWNwdXMuZHRzaQo+IMKgZGVsZXRl
IG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL2ludGVsL2F4bS9heG01NXh4LmR0c2kKPiDC
oGRlbGV0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybS9jb25maWdzL2F4bTU1eHhfZGVmY29uZmlnCj4g
wqBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vbWFjaC1heHhpYS9LY29uZmlnCj4gwqBkZWxl
dGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vbWFjaC1heHhpYS9NYWtlZmlsZQo+IMKgZGVsZXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvYXJtL21hY2gtYXh4aWEvYXh4aWEuYwo+IMKgZGVsZXRlIG1vZGUgMTAw
NjQ0IGFyY2gvYXJtL21hY2gtYXh4aWEvcGxhdHNtcC5jCgotLSAKQWxleGFuZGVyIFN2ZXJkbGlu
ClNpZW1lbnMgQUcKd3d3LnNpZW1lbnMuY29tCg==
