Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022073.outbound.protection.outlook.com [52.101.66.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CC251E422;
	Wed, 14 Oct 2026 13:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984704; cv=fail; b=SuX07Bi8q51h5+e1bfpsSXfA3Vx15NEreWlokZ7s3a9hL69ZPCHNjpa6uHfVLM55AleNNlraPVMKyMy0PT26mdrm8DlgRxYDrOG7Zco5nf4rG7C8XTNIIkRj0sqt6D6EEYOskop4IlxgaIWCUm2RHTr5CCFhFX1BN7oQbYl7xto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984704; c=relaxed/simple;
	bh=wBpWt5lon/s1+V2fEGdw2DqdteyKqHF1R+fKWEadCwk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dS3oRtp/nmAZtZY3GLtoYel9UM8aPNWVS1WkmxRRheXe6ZuPgsyoLnoRxjqxgD5Zl7+5qd3GgT3AAGQDVcjxpMiwVYuCnel83lmol5zZNMLVRTRGjM7svTKJamUXmK06EjbWX107xcbg+7QONeBqk6iKd66gnT9gNYYi9Sqd234=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com; spf=pass smtp.mailfrom=htecgroup.com; dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b=LP9K3N6z; arc=fail smtp.client-ip=52.101.66.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b="LP9K3N6z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDBLPkd4sIU3Voa4bgpBXBu3yHUHFNVTRJFIHM+KFJklpNKG+TkqJQvBfPtNEoHUk/0NDqJdRhDx+DxNInfPjOYxJevl3a5cDvpCK1XlOCY1QEBBIdX+q9O1Kh2kFoAotdDrKtefN49BP4XS/CAA1Rf7n0CnjCmuD80rM4RiKt1cpj0gzOHHlRTeluPAFicTZcDK8ExKNfiSON+uN690zj4HD6YPOQx+5K5ZvOBstXx88gTDwKXpVftd9DCjtBbf4iDZgjdGOflfuskdGZzFvwUTm4ZzsnvJDw2N0LDl/pr1Ok4HsxTnov0vrU/wr8onvjGKGdhScPOmpKI8C4jlfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBpWt5lon/s1+V2fEGdw2DqdteyKqHF1R+fKWEadCwk=;
 b=v8SvLsOsLZp5IsNv5Nhci46j2ieZKkzRblTI7dCPa5ihyviwsfL5Px0dj+O/QnjBWf117dphMdNtoDICkTLI9+fA13ccWzoHhC/2Jkz8ChxkIX+Fqq1AtgyscVRvT5RVec1Xe+kslfl1KceJ7ZWZMJbrTB6pDU5UapW3bPdzOFNVgriffWHqDJpbVDrX530PfwqHZCSxm+xbHj8qsaKfLnR/kOPGyd7CVA5Q2I0ReS+p2zRBDcod7Qr5v0pn6T6ZoO83wFCxlgzbwCNX6Sc2eb3FSxaRONw9KmqiB6Gmbj2FBPEYoCAiCHiOSHU0xBvz8nPetV40U4xXEpTe1dl0Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBpWt5lon/s1+V2fEGdw2DqdteyKqHF1R+fKWEadCwk=;
 b=LP9K3N6zYB+S55QDdnpsMvIz8cXV5jz9GdZHVinZnVY41jAPDmp0a1a8pHv/ZvlnNrT/jAko3WWn3hmlufUFTZPX4+e5lt+++zmEtBkAbzYkTEKgFWTcDSP9BZW/lZbhrK55PaG8nO9ytpnbK06/f3nKMLNsRaiGoTRt19KQgad5EHPgrsj7ZEF5DjV1Weu7Q+hjwL+oOWwPlWEKG40d4m1DSMQW+FqVkDw8z671bElmGd9C02CbMAqKntg3lsHjY9QIFrRoMnGfevd0PfquUShnCAMDaehesEAWQHhdWVLSImpzlf9UwsxZ077uMDiV/iVaWS8vpIPmR2Xoo9vmvg==
Received: from MMZPR09MB547520.eurprd09.prod.outlook.com
 (2603:10a6:190:56::10) by VI3PR09MB108268.eurprd09.prod.outlook.com
 (2603:10a6:800:383::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 13:31:32 +0000
Received: from MMZPR09MB547520.eurprd09.prod.outlook.com
 ([fe80::5b5:f191:1ccc:f9ee]) by MMZPR09MB547520.eurprd09.prod.outlook.com
 ([fe80::5b5:f191:1ccc:f9ee%3]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 13:31:31 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "robh@kernel.org" <robh@kernel.org>
CC: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "anup@brainfault.org" <anup@brainfault.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "conor@kernel.org" <conor@kernel.org>,
	"daniel.lezcano@kernel.org" <daniel.lezcano@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Djordje Todorovic
	<Djordje.Todorovic@htecgroup.com>, "inochiama@outlook.com"
	<inochiama@outlook.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"radu@rendec.net" <radu@rendec.net>, "tglx@kernel.org" <tglx@kernel.org>,
	"vladimir.kondratiev@mobileye.com" <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH 7/9] dt-bindings: interrupt-controller:
 thead,c900-aclint-sswi: Add MIPS P8700 gf compatible
Thread-Topic: [PATCH 7/9] dt-bindings: interrupt-controller:
 thead,c900-aclint-sswi: Add MIPS P8700 gf compatible
Thread-Index: AQHdRFDNS/Uxibn8Q0ymreOTPAaOObbU6o2AgChNdoA=
Date: Wed, 14 Oct 2026 13:31:31 +0000
Message-ID: <bd3f4237-e0db-4db9-b44f-7b7dd0f1cc36@htecgroup.com>
References: <20260918220353.GA2420517-robh@kernel.org>
In-Reply-To: <20260918220353.GA2420517-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MMZPR09MB547520:EE_|VI3PR09MB108268:EE_
x-ms-office365-filtering-correlation-id: 01ee1ba6-c4d1-4b13-82cd-08df29f7758e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|7416014|38070700021|11063799006|261009223027099003|56012099006|10067099003|260925021311599003|260925021911599003|260925022911599003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 aYsXERs9JoTlQTngjK5nrZ4HWM318NkbL8eQvkhfYJ4qgWh4a5nROsJ+gD1bDh7f1dC2xrjg3EStLpXPALkqP3OQWh/e14pOR9FfsN2xSwwWCmz1t6TqebUYtO1kzyAMjfj3tafkowPxCdWV1YsLo3bFYobeeQen13OZCcynwjncVbbssKn5OxX4sox0xDGUleslg6oug7Rg2K/QW/4rLamg/j7h774Qqgly+AEOsQ690MRVh3nsikdU2r67gAbjqv9hC9+BjYopPG6q+vQmlBSwIehge6sfqccoTeafkHC3WFfwfoe6MDaHR493tBppIs0GulIi7B67JWpvM8se5pN91ynvMyJrNdvPa7Fof4jmB2LRT14i7GNKIeg7bTpdmLWIpxirMoQG+sdrpWRmq3Z1l0skcU2NzXB5RBo0h/aafL9NkHOCKKHUSHvOWWYPL53uKiwBJJ5ErNqAKctPzSX29sHcGjkUx0Ey89RfR2zszwCMRHOhaVCGJGuV7JNK7aDL7grdc+u7etjXDetoHiIixd6u8KlEYhtjG2V08iKYxpNQyenu6AwXvg/TTDrc2QtTy5g5OADngCfUfAiI3FHWjp0cfEiTSlQsEpciNWGouuN4OPhRvOin9FYvMaoCTpV+31NuSTL8F4VJXuJtfIE0G9nsMBKF1ka0KSK4WsoBEtgOk5eZTUQQBD8oJhZmUFMFrnhjP8u4ef9okO46B0+KuXkehOfc7QY0MJOVS4U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR09MB547520.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(7416014)(38070700021)(11063799006)(261009223027099003)(56012099006)(10067099003)(260925021311599003)(260925021911599003)(260925022911599003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RVFkT1ErR0xLbzBNaFpZaXlmMjFURFByQ2dHS2Y2TlluYWtreVNJRFN3emlp?=
 =?utf-8?B?U0dwMXVtS3NrU3RCYVcrc2Q5OXdBbnM5ZlQ1RmRVNU9zbXlNOEQvdit5NGxP?=
 =?utf-8?B?ckJFR2R3ZEEyVVJvbTFKY1VDaUJua3ZKa2p3TUVZd1F6VnlISGVPWXBTRUR3?=
 =?utf-8?B?Wk1XcUMzSWlaWGxhd1VLNU1GM3Flc3F2cThZTGk0c25tYTNkclNRUytvRExp?=
 =?utf-8?B?dEZmUGJ6ZlRBMmVSZmQwRnAxcFNJSTc1NUFzbkJyR1JxeWc0RHpHQytCTnRZ?=
 =?utf-8?B?cDBYLzVCcEphZDNVK25zVXhJazZuYjNldW9xZE5LZU1SQWFseVNiUVBwNVd6?=
 =?utf-8?B?ck1nbmhOajBLMFdqTUlXa0RpMnoyVlh0VE9VYVpodHVpdXB0SnhzKzRjTmwv?=
 =?utf-8?B?QldTaW9ieXZrZFRvVExXQWhxcWltOFhkNUxLcW0wV3lrM0pLQTJQeTV0S2cx?=
 =?utf-8?B?R2FiUjFsM004bk8vcnYwczI5STFMK081ejg5QlR6OGNGKytGQUp1Ryt6dFkx?=
 =?utf-8?B?OW5mazBWVUF3QXFDb1U1QWt6a3BpM2FqTlNteTVkWmJZVkVabmhFY0NDRCsv?=
 =?utf-8?B?YzVpWWM2ZHcwNERwQzNGNnNnWUVCL2RKNmJFZXorbzlGeC9DYyt0MzJUNlZY?=
 =?utf-8?B?OUNjMjc2R0RaTDBZS1k5bmlUbC92bWc4U1VpWlA3eE5lem1yRWRhUTh5SjJD?=
 =?utf-8?B?dVlkRVNIU1ZwTzd4d244R3Ura25RRWgwbFQ2Z0JGL1lOS3hyQVdzR0pqdkdC?=
 =?utf-8?B?OXdFa0hPZFZMOUpDbHl0NHNIZFdRMmk5b0thclQyTHNONUdITWVZaVdaMk1h?=
 =?utf-8?B?WW1mZVIvMVJ2UU9Ga3hhYlNCU2hydVU1R0cvMkxTNkNrZXdPcjc4NGUrWWFk?=
 =?utf-8?B?Z1NpblNWc1UxNU9TRVBFSVpIb1hqR2RLYzRqcHFzOUdFelROL0psbVFGWmN1?=
 =?utf-8?B?aWJYWE1YNENiNGg1Szl4cTY3L1NmcEN3VU9pKzZ5VzhsZklralVQMloxN3hT?=
 =?utf-8?B?b3JKbXFzVnN2VXZoQnRJbjcyTzVFSDl2MUxwNTVsTUVYRzA1WjROSk5CSUp5?=
 =?utf-8?B?dzJxTkRzZXhucldZZm45WUtscnYyM1dzYXNqMmwyc3owUzV6KzBCcThDa0c3?=
 =?utf-8?B?dWpjNWJiaXU5TlVXUGEwRTN0alRwT0VKTzkwQy9ldU5ZOWJ0N21BOGNhLzdh?=
 =?utf-8?B?ZzlQb0ZtOC9tMTFlZ0Y3MXRxR2RCWTRQM2U1SHlwZ0lFREhBL3VmalVmNm5j?=
 =?utf-8?B?MGg5THQzQVVnU0lYbS9wVzVEUnNHOEhWVDZLL1p1MU93cGp5czBnaXdHcm5l?=
 =?utf-8?B?ajVzTm8wZE1yYUZNQnBJMjgzTElJMmlOY2NmdmZyRWIraTc2azNJN3ZoQmIx?=
 =?utf-8?B?SjVFQ25CNXJHZm1DK0RvWWd4ZjB6b01QUGp5VndzNFJOUWQ4WXZ0Z3kxaGtD?=
 =?utf-8?B?SnNKUEp2T0ZwY0Y2QUhuejdMWEhxUFNaMVJQN1NxSmI4V1ZpYUQzL2E2SHhD?=
 =?utf-8?B?TU44bUxlZmpSMlpIeHdKWjFCWU42QWVwa2hSR2M5cmFGbWtsTUtDclEvaWJH?=
 =?utf-8?B?bWR6WllWSWVmdi9SUkI2cENxdEZ1eXhhOU96TlQ4ZVZzYit6aWlRTis0UmNO?=
 =?utf-8?B?VHN1UHR4ZGpCblFoNTBucW5hQTJRMldjeUtma2J1UDNNamlyOTg0aFpGcDVQ?=
 =?utf-8?B?SDlyMkhxdzJiL1NNWkN5bVc3SGhoM29Yd0pyRkFXalVsLzFCdzdvQVVqdHhG?=
 =?utf-8?B?OGVBUU8vRFZraEVPeC9EL3VjZGxlU0pGSWRtbEF6VjFyMzhqOHlkVXJuSnYr?=
 =?utf-8?B?R0JrOHhHYjBsTW9sc2ptYjdSaG1HcG9IcTAyQjlBTU9XT1AwMitKaE5xOHpv?=
 =?utf-8?B?S1J3Zy9TQW9TdE9hOGREZEhGL2hLdDIwNVlTTjc0M3NtVlhZNm80R1dCd0dH?=
 =?utf-8?B?aitReTVGRkhiM0xHOTNKUEFqdUZBZTd6M0NONFYyK0ZWd0dRc0xrUUM4TVJp?=
 =?utf-8?B?cXRxL2lPMlNMejk2Rkx3alZwK0pOYUpKazA2S0taakdGVlB4U0hIV3ZaY0th?=
 =?utf-8?B?NE51SmNoTG5QKzhZcG0yMjh2QzQ2aUhrZ3VKTXp0U2JLbFdZRkJrcWFuNTF3?=
 =?utf-8?B?aWRxb1FEbUhGQ3BxZ2l1U0pIK2VMRTNvZkM1UkhQWUtEK2YwNzBUMExUdjd3?=
 =?utf-8?B?T25mNXdGM2lEYWlSdEZMSko2QWpZQ3FTRVByWFdaM0RsOFM1VUlldGliRVZy?=
 =?utf-8?B?dU9PWEtiSlk3T1p1OGRaOGFJZ0NROGZOWTNBRVJyY1I3aGhZZHZJWnE3UnZV?=
 =?utf-8?B?VHJMOExLaW5icFJiU3pmR0NIeWk0QnhIbXNPdVdjVkxQelFLT3VENVhIZ0J1?=
 =?utf-8?Q?JUf1mc4HlCbmWtx8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5D7C47C6209484FAF8A7D14820D9CFF@eurprd09.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MMZPR09MB547520.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ee1ba6-c4d1-4b13-82cd-08df29f7758e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 13:31:31.5339
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zcO02CPm/oe+X8iU3Vto6W4s0M+JdsUFTYoLGI6CKwUp5oocsWZQOh8ludq+VE8fh5NQ319TJ1hJeP+T2IbiV4hjw4QFgck8HFR3+NCksSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI3PR09MB108268

SGnCoFJvYiwNCg0KT24gOS8xOS8yNiAwMDowMyzCoFJvYsKgSGVycmluZyB3cm90ZToNCj4gT24g
TW9uLCBTZXAgMTQsIDIwMjYgYXQgMDM6NTU6NTVQTSArMDIwMCwgQWxla3NhIFBhdW5vdmljIHdy
b3RlOg0KPj4gQWRkIGEgbmV3IGNvbXBhdGlibGUgZm9yIHRoZSBNSVBTIFA4NzAwIEFDTElOVCBT
U1dJLCB3aXRoIHRoZSAiZ2YiDQo+PiB2ZW5kb3IgcHJlZml4LiBUaGUgb3JpZ2luYWwgY29tcGF0
aWJsZSBpcyBsZWZ0IGFzIGlzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFsZWtzYSBQYXVub3Zp
YyA8YWxla3NhLnBhdW5vdmljQGh0ZWNncm91cC5jb20+DQo+PiAtLS0NCj4+ICAuLi4vYmluZGlu
Z3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvdGhlYWQsYzkwMC1hY2xpbnQtc3N3aS55YW1sICAgICAg
ICAgIHwgMyArKysNCj4+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQt
Y29udHJvbGxlci90aGVhZCxjOTAwLWFjbGludC1zc3dpLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvdGhlYWQsYzkwMC1hY2xpbnQt
c3N3aS55YW1sDQo+PiBpbmRleCBkMDJjNjg4NjI4M2FmNzkwZDc1MzU3Zjc3YTcxNDU1OGY2OGJi
N2QxLi42Yzc5ZDdiNzA1OGE2NGJiMzkxNDFkNTY1ZjBhNjMwNDM2NTk5MWYyIDEwMDY0NA0KPj4g
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9s
bGVyL3RoZWFkLGM5MDAtYWNsaW50LXNzd2kueWFtbA0KPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3RoZWFkLGM5MDAtYWNsaW50
LXNzd2kueWFtbA0KPj4gQEAgLTMwLDYgKzMwLDkgQEAgcHJvcGVydGllczoNCj4+ICAgICAgICAg
ICAgLSBjb25zdDogdGhlYWQsYzkwMC1hY2xpbnQtc3N3aQ0KPj4gICAgICAgIC0gaXRlbXM6DQo+
PiAgICAgICAgICAgIC0gY29uc3Q6IG1pcHMscDg3MDAtYWNsaW50LXNzd2kNCj4+ICsgICAgICAt
IGl0ZW1zOg0KPj4gKyAgICAgICAgICAtIGNvbnN0OiBnZixtaXBzLXA4NzAwLWFjbGludC1zc3dp
DQo+PiArICAgICAgICAgIC0gY29uc3Q6IG1pcHMscDg3MDAtYWNsaW50LXNzd2kNCj4gTm8sIHdl
IGRvbid0IGRvIG5ldyBjb21wYXRpYmxlcyBqdXN0IGJlY2F1c2UgdGhlIGNvbXBhbnkgZ292ZXJu
YW5jZQ0KPiBjaGFuZ2VkLiBUaGF0IHdvdWxkIGJlIGFuIGFic29sdXRlIG1lc3MuIE9uY2UgeW91
IGhhdmUgYW4gaWRlbnRpZmllciBmb3INCj4gc3BlY2lmaWMgaC93LCBpdCBuZXZlciBjaGFuZ2Vz
Lg0KPg0KPiBVcCB0byB5b3UgaWYgbmV3IGNvbXBhdGlibGVzIHRoYXQgYXJlIHBhcnQgb2YgcDg3
MDAgdXNlICdtaXBzJyBmb3INCj4gY29uc2lzdGVuY3kgb3IgJ2dmJyB0byBiZSBjdXJyZW50Lg0K
Pg0KVGhhbmtzISBSZW1vdmVkIHRoaXMgcGF0Y2ggZnJvbSB2Mi4NCg0KQmVzdCByZWdhcmRzLA0K
QWxla3Nh
