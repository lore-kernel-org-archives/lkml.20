Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013055.outbound.protection.outlook.com [52.101.83.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1992434988
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788897510; cv=fail; b=mRcK7C2rxHqyKsqPcB4xiGqmcghZO0sLLXRKbIHGDIEZjEMOZIA6Vqb7WYgnLuGz+FSkVncemFJXEVtaXsvDk/3RHHQrD1+YFCHYoyhhswqAa0CgWrl7OfnuvJ5i9gGqlrw5+GEcirk8ebNVoglYk4D7qDayvRQ5N/r+fMVT/mU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788897510; c=relaxed/simple;
	bh=5cDvXYUrgIA7ibB33RnF1Tl3oubwxgAhGbNTW2g78pM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ewgd0xioAWRqa1/TPikf43RMSMVgpgtwL4wWRAAiB803GFGUeFP3LjJo8GA1XMrEW/roDzhiM6iaOW2CeLoWRykVGhixymci/7E0LQUMtIM23gd3y32VE45ygWgdlXqH82BRaG0jCB4iylP+dcTyPsrm1xy0KboL/1wen4UxZBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=G/ZrXANJ; arc=fail smtp.client-ip=52.101.83.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="G/ZrXANJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uw55yGMEA/DbPshH8RRloGcsxHyjjW6AdXdlMSZwqQll16xJhkM+RJEPF9q+50AG4lxmqdKm/38+uagUHvdVuQOz2DpWjVHqO1daWm7j/DWtXV/ZHXfvmbR3nujm3MtVscEoviBqbJ4lBlikNWLwVbIJ3McflwA/Em57XjoetEli8RM5X/RLJh9ez1qDKf6LLGZvA53S3N3lSA/fwpP6GRXw7gb+aFtHsKfTJ3ZePLhfxi7Jz+c6DXQcsLM3KALQHGPl8UtdVET1EhUGXZViyZMPHFklsDaid0QlalkXNBBxoxl0I6vlM9AvZ6CT6tvuDiYoqN8zttAFpTSZyH1RHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cDvXYUrgIA7ibB33RnF1Tl3oubwxgAhGbNTW2g78pM=;
 b=bg9jq1VqxZA+zCe4o+jOzC7wC5ECJpQzXIWX1uVjwCPNzUQd9NZpMY9/JTzR2rCRj1v8NXs3veb+3EgJ1bxKDIby0UwGwXQOR1+Hso/oMlDyxHuum/XV6sqbh2bpxU1GVmTD3bg8UsWHfkZjyvd9vyFEiFedA2N+LR6WCveujabP1YL1kwpjPrukQNcI4n1nxkyjtnPiDUP79LMnELrKu+/FyOo/1JHCzapyQgsWdmLFw1g5y//xLzt9HF7GAd1fil8tevspW6kh1hDfq5c1FUFG5GIpFy/CZHhXNzUyKcNI7SlCxKdwwYeCuJmHwCwzm5Lu5XVQYEGLrc3T/JGjLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cDvXYUrgIA7ibB33RnF1Tl3oubwxgAhGbNTW2g78pM=;
 b=G/ZrXANJbSc01ux2ZMVUfumR6nqe/Yd+9q9TZskPT50Rekhm1xyiN4U8aNUdFeLHkJJDThpvIR1pHOqvcLzxM/DEUaYDtGYsMcZd8ibYokFfcxFIwHwJBKmsEYWFh2UXJM72YNvT6n+p5u/r489KBGZ02npqtjCa3ej+8YKnfSME9W3c81q50vcia8Xfh+1b2qOfTcmngyYTtwC5Pt6TcvYB8Tb7Js/2U9BD282FK3RX9yfSUYsN9N2Usg2padipkwL2iW+O0iy6sOok1gGmGSQuWIz+KaIAMPebfdggjQTfeOk5f5VSsDEibvrSlgZazU51pFPgxf0RqJ7ru4yS6w==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by PAXPR10MB5382.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:286::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 19:58:24 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%6]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 19:58:24 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "arnd@kernel.org" <arnd@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>
Subject: Re: [PATCH 12/13] ARM: at91: remove samv7 support
Thread-Topic: [PATCH 12/13] ARM: at91: remove samv7 support
Thread-Index: AQHdP6cC1Ou8CiaUuE6cyMOMQkVbc7bFGX8A
Date: Tue, 8 Sep 2026 19:58:24 +0000
Message-ID: <3029e8239a0282d95f18c1c7d1b26aa04a940d02.camel@siemens.com>
References: <20260908152808.3928630-1-arnd@kernel.org>
	 <20260908152808.3928630-13-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-13-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|PAXPR10MB5382:EE_
x-ms-office365-filtering-correlation-id: 9935e0f8-1bad-47e1-942a-08df0de38a8f
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|10070799003|366016|376014|10067099003|56012099006|11063799006|4143699003|18002099003|55112099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 vcvxgjgNeIKCKs5hbLgAQ5aLf/tWIn3DreWtm2w/NG6EEqtamGbVn2tOthXkE+bA3V47kaMRanpMk+NBCuT2joL+ji++1X9wmK9/1sSLb0SuTv44DjhmrqgCA4T2jNjWniPmo8ZA553z9SxjJ9DSz7a4w6nI1zY1dWgizzqzHMudvrbVWp3I9CZsps98AVa1rto9EaHdCXPy05Nfc37jIjbc9QtyxSAqbb+xyH0+jTbGlgf0pRCtcXQmmEIZkLjLi4/ZYXOc6BLmH+flOCChlS2xkri/Gtarq2hn3DLSv4QPFFoBcKX3tFFyz08RiJEmw7xCWmMrZstvhEg/5GHVFRwAXVES0YgS9y0DexuKnZ4axj73FDTxT9pLiDalfan2CpIm7HvEtYrwNtRZIF8bmQY6S6uVAUM7ocdpgz5z+2d9SqiVKnEJdg9+OkkdROtUUyhilspI9n+jLYb2dJqoArFOkGa6/ldwvMetbZw67Nx7i+xcsR2XYV37huiA9/ZC3cd0HQsAbVxQZyb0SNyoc5ONaf75XqDjUSkEluPEHPMf2e8Wo4z/1cUlY2G7VDMznHqcDLfeaL6MZwwfW2/56DAz8SFht8s4OF8De6ASKwIw43VCjDj5cBwvvi4Du+CAOWNLSQsmzojyFMHi+lSqjqsiY8+Uc9PiE/z76c8LsfQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(366016)(376014)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(55112099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?djJvQ2ZSeTYyTG92YitHdFBCLzBHQ0FhcHJHdE5qVU9oNlNwVnhFVUtDdVZy?=
 =?utf-8?B?N3RuRGswTkZlUVpoTWFBOWVOK0t2TExkdCt5dFovSkRsQXZIZjlyU0xlQ2hN?=
 =?utf-8?B?N0hUS0JkakZ2MUl2S05EemF1VkI1N1U5QTVrRUo1OHE2ZDl4R1R3cXo0ZVVV?=
 =?utf-8?B?d01nVlFxeDA4UVZES1I1cTA1M054akF6VWJiL25TYjZTYjcxdi9MbXRzZi90?=
 =?utf-8?B?a3h6TXgweXdHQTJTVVpnSTB4R1ZORFhRMktlbFBGVS9rdU13VnAwT25Ec3py?=
 =?utf-8?B?blhzdEhoWTljTkRXQWpGdnhKcCt4bkdJSW9FdTdvNTNMUDAvV0pxSFBjamtC?=
 =?utf-8?B?TytBMlRsTHU4SU13ZFBTZFBGQ3dkUVYzUXo0cGc1L2ZsV3FJNldvbjV1dmd2?=
 =?utf-8?B?ZDVRUmRPQ2xZZVNERGFYdVJ2cGJXYU9CTFZCbklhMzc4cnMrSkUwcjFkZUJR?=
 =?utf-8?B?dHNDYURETXFMMjdHdkpyYzFUUXpTbFNCTnNYVlpMYitLNnBqdlgvWGtKeDRR?=
 =?utf-8?B?Wk1abVoraXdGaXoybmsyTEs0Y0FRTzlTU2N0OE5ZaFlWbnFBTVdCMmgwei9i?=
 =?utf-8?B?RGRVOVp3dHpMTWFldS9paEhxUHkzMURWYU5NdG9aaFFlbG9QUUFTN3RWcXFs?=
 =?utf-8?B?aWEyN2Y0U0lXVjNNVUcwZ2h6TmxuQzhsZGZEYmJIUys1TWVEcW5xalV3emN4?=
 =?utf-8?B?ajdGNjEwdGIrUzF3QWo2YkxBNngyRmgwMWVLZmd3SkdielN0cStIa1dLejh3?=
 =?utf-8?B?QmZodXk4cGd5K3BKVXcwQUFHbWhPT1VKV3MxMTRUclpxRTJVcUtwWlFHL2dF?=
 =?utf-8?B?eGt3cEVDTVdCTW9vLzRqTHBwQW94aUZGWUhxS3FKRURPRFVmajVJOWlYL1k4?=
 =?utf-8?B?L3dCOWErc3FWK3krTHptWjZ6Y214Y3NNRmd5TWh4aFlMV055ejJIbGx2SlFZ?=
 =?utf-8?B?WUZubjZqTVEyMTBzaklRYmwzY3dyeGdrUXA3OU1RY0hCS1NVRmNlRkIxWGk4?=
 =?utf-8?B?MWllOEhKOWwrMVRERWRQUW5lcVFTNzVVTmRvUzZaYWRRRGhGYjZjTUkrZnhk?=
 =?utf-8?B?Y05LMkhzRTNVVzV1U0VXM1R6a0FxSlc4QTF5L1pyVDFOMGI0RHY0dkh3QXFS?=
 =?utf-8?B?YWo3Z2VvRCtuK3lmUUdnbHFPZ2RzclZ2U0JoSUhSTmNrYVJhM0xFOGdweG1t?=
 =?utf-8?B?NVRQUkFXd1Qya1RnRGIwK2EveHRuS2JjRmI4Y1JtdXJyM1B0bXB4aDlPb1BS?=
 =?utf-8?B?c2VLQXFOL2ZWOUtRRHhIN3ZEMGJTdDMvVWlLUHNCS1oyVUZLNXI5NDRHdnJo?=
 =?utf-8?B?WFhHVGh1VklHcXBFNFRnb04vdU1LNG5iem52Y3RkTlMzQkt4aEc0N2ttWjMv?=
 =?utf-8?B?SExhUzhITTUwc1JtRU9sT2RJZWlqdmlMaTQxaDhmZFhWYjRLSHA3L3FadERh?=
 =?utf-8?B?TWNuZkVSRjJJdkZiSUZRR2NSOWVFU0d0MkhDRXUrVG9FTmxDbmhCQ1VMaEJk?=
 =?utf-8?B?WXAwU0hjOERCSVBCRjFOdFlFK2sybzBqL0ZYQTYwV1l4N2tFRlpOVDlMU0ZX?=
 =?utf-8?B?SUJnNXhzdXNIY2xpVmozRUVCUEVRakZ6QVh5YkZiNlNGZXdheFZ3dDR6eTlu?=
 =?utf-8?B?L1YxOFV0TjRNWFNMUS9mbWxnSWx4a0Jzb2NJZSttMk5rMXVkZHdtMC9YZ1da?=
 =?utf-8?B?ZmYrd0gxWUs4Z00zMS9FVVQ4RFNKYm5icVllcnNxVkZHT3Y1RVcvR28yTmRM?=
 =?utf-8?B?dys4SVhLYjV5ZVJZSDFIZ3B4VWpHNllobDRENkJJTHlCanFkV25qNnFQYTZ2?=
 =?utf-8?B?bnlrRnhnUHRlemF5VXE4ektCUitVNG1XUlhoYzVwanU1am55YmlVU3FocTEr?=
 =?utf-8?B?RE4wMXErbTlYNUVzM3hBUSs4ZUlmZVI4ZDlsTUhWaFhveC9YT1gyWVRFbDd0?=
 =?utf-8?B?ek9VbDBqZG4ydGF2NW9CZGJ2Y2J2UVVCQXgwUHRkaVBkTFhOOUZKeEtMYXkz?=
 =?utf-8?B?SVlHeWVoeVd4TFAxbG9KbkwzR0M4MWlNN3RTTTVMelFmZ3VqZk82NnR6TXd4?=
 =?utf-8?B?dGFMMW5mVmJGUEtIMFhQL0lzSW5zWkJPL0tFY0NMZnRqNzZmU1Z3QUF5SDBt?=
 =?utf-8?B?anpwN0QvT2cyM0M3U1JESS9jVml0MStJQ00xbzdMQWtXVXd5ZHdWSVRTc3hL?=
 =?utf-8?B?U2QyQ3d0ZnJuTUNpbEFGNlVIdjJoaTdRbkg4ZTMxR0R5OHZBZ0swdnJBOElW?=
 =?utf-8?B?TUYzUXFKRlcrT2hhbHN5T3c3bk1hZW1YSUNLS0Z3VGdod21uVWFPR1g2c2Rv?=
 =?utf-8?B?NDM4YTVhanJJcyttcUZqTmdhUVY3MjdTanFzODVGeGk0ekk0UVprSjRSZnBu?=
 =?utf-8?Q?dDQ6nTZ1smC2gY1x+dUIXQXvxMA9z4losr1S8paMWtKQY?=
x-ms-exchange-antispam-messagedata-1:
 o9pz1jzM8xLX3YKBya/6qE1vWCz2YLjC6aSBxDOLX4hAFY2w89doUj59
Content-Type: text/plain; charset="utf-8"
Content-ID: <E75C7EAC1E86274C955257B7DEF0CDCB@EURPRD10.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9935e0f8-1bad-47e1-942a-08df0de38a8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 19:58:24.2658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KBoHsbAIQDFOkECS37oUdp1yvDM+LuOtRh7JeT0mddV7uCeAfSm4uYmb4L8IOHMFbS8UCrhVXx561461GMTh11mVPlajMauCLt2q9wRYLnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5382

T24gVHVlLCAyMDI2LTA5LTA4IGF0IDE3OjI4ICswMjAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOg0K
PiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KPiANCj4gVGhlIEF0bWVsIGF0
OTEgbGluZSwgbm93IGtub3duIGFzIE1pY3JvY2hpcCBTQU0gY29udGFpbnMgYm90aA0KPiBTb0Nz
IHVzaW5nIEFSTTkyNiBhbmQgQ29ydGV4LUEgQ1BVcyBhcyB3ZWxsIGFzIGEgbnVtYmVyIG9mDQo+
IG1pY3JvY29udHJvbGxlcnMuIE9ubHkgYSBzaW5nbGUgb25lIG9mIHRob3NlIE1DVXMgY3VycmVu
dGx5DQo+IGhhcyBMaW51eCBzdXBwb3J0LCBhbmQgaGFzIG5vIGtub3duIHVzZXJzLg0KPiANCj4g
VGhlIHNhbXY3IHBsYXRmb3JtIHdhcyBkZXByZWNhdGVkIGluIExpbnV4LTcuM0xUUywgd2hpY2gg
d2lsbA0KPiByZW1haW4gc3VwcG9ydGVkIGEgd2hpbGUgbG9uZ2VyIGFmdGVyIGl0IGlzIGdvbmUg
ZnJvbSBtYWlubGluZS4NCj4gDQo+IENjOiBOaWNvbGFzIEZlcnJlIDxuaWNvbGFzLmZlcnJlQG1p
Y3JvY2hpcC5jb20+DQo+IENjOiBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlA
Ym9vdGxpbi5jb20+DQo+IENjOiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24u
ZGV2Pg0KPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KDQpS
ZXZpZXdlZC1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5Ac2llbWVu
cy5jb20+DQoNCj4gLS0tDQo+IMKgYXJjaC9hcm0vS2NvbmZpZy5kZWJ1Z8KgwqDCoMKgwqAgfCAx
MCAtLS0tLS0tLS0tDQo+IMKgYXJjaC9hcm0vbWFjaC1hdDkxL0tjb25maWfCoCB8IDExICstLS0t
LS0tLS0tDQo+IMKgYXJjaC9hcm0vbWFjaC1hdDkxL01ha2VmaWxlIHzCoCAxIC0NCj4gwqBhcmNo
L2FybS9tYWNoLWF0OTEvc2FtdjcuY8KgIHwgMTcgLS0tLS0tLS0tLS0tLS0tLS0NCj4gwqBkcml2
ZXJzL3NvYy9hdG1lbC9zb2MuY8KgwqDCoMKgIHwgMzYgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo+IMKgNSBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNzQgZGVs
ZXRpb25zKC0pDQo+IMKgZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL21hY2gtYXQ5MS9zYW12
Ny5jDQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJkbGluDQpTaWVtZW5zIEFHDQp3d3cuc2llbWVucy5j
b20NCg==
