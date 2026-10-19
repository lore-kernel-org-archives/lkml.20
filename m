Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023103.outbound.protection.outlook.com [52.101.72.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A592C483BF3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416665; cv=fail; b=bL8qu3AkJDda1OkgVuKtMhsc9lm0g8lWaRDQHDpY/jm3VowjkgIZGFlJMm0fpNs/v2E8nT9RgouSvYqkw+wssaC5HiIVrO9AIRf7NnNdVc6RXTVmKzDEH44qLzX1nk4bigySIzcaiePQPTtN6QiQT6qPZsOJKytd8zwP/hedQqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416665; c=relaxed/simple;
	bh=wzKDbKNhAjYcPCc94F8olr0zh/jUfz2LaEHXN7hYmUE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h6f5RkLOgIatTgI6UJ1LhTG8nyEjbWEVYmHzXG1MpJlpmvDB1RvapK3CDlCmBwHfKeMcFOarrewrWURd6Y1Qse5xVWDAUfydYH4Kkaz9Z6otf5c56752iiW+kkeYQYCJTCQponU8D5Cl5okkclrtueVUl/dyq/ESa8qSsG8mOXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com; spf=pass smtp.mailfrom=htecgroup.com; dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b=imMm4J4p; arc=fail smtp.client-ip=52.101.72.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b="imMm4J4p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vl2i0ApbJsSPJgcux9vVPXZGa432FjotV7pIpkqaqEGMnfI2xZ2VM1/OYRhYUT5eBpetG/1pLCgcjKbF+cocCHvfsTeFOHOPDmrlIsJYQoLVBWrVMNH+IsbnqvN1jS274H4Vae/o+nwoAgF9JTC3O7OZ7kMLp6kjeDcwW7dF+RYwIZISXfFpaBkloiJEq4Gi5N4VBGJgdpqB3z4lBcBe+MbtJFvXWxW97Y8aqvcLV2H6OnvrfjfgeVSv5Dpc0XDfRC2hEMRqOK6FGWdBLmn8I8X+RHOC5M9bLP3mT7jIsU6hbsY5g4qoqe3ltcfVYhwrYKknLKfllY6grcvLnRMYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzKDbKNhAjYcPCc94F8olr0zh/jUfz2LaEHXN7hYmUE=;
 b=UhrvVPksdzu5XYh4escUYxD6Invlz8q13vbx1R4aBjbJ0hB+2uSuSjHKyBXLu1PKJcm22X4WX4FA6OluaJ1e8kVP3am9GtbDjWuFIihAyCQoIRRswBvVAc+8s9Y/1hanRZhCmMnHk6pp9xF2zmofJ9xBSPayBsbN04e0enzzt+6nsgPdP1Wle3E2sN2UCZdX3z7ppOXz4tOKGiynFDn3ibzZfL2xTfUz6xmIzTyIIAis2LzACPo1XVk4ckaZtNVVOfjtZUuq8gq/qZqM9nQRJYbKOwvrt+jU5KQgtY1YHYBUoG3GmMy+fetTfn9f141K8bSOgCaGgHKQyQJImoE2Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzKDbKNhAjYcPCc94F8olr0zh/jUfz2LaEHXN7hYmUE=;
 b=imMm4J4pWKCR2wbeCp+7l5mQfoufXx+bCiMqvySUfw+pvdR9GXykNyhsJe0X+ArwvYM8h7gtjUEBXuTQdIjOzIgFHJdildKu6aeqDP18cOzEZYAN/k2bsiBcYu3gth98X+oxzVe+4WBzZ98vRBdqY+4fd8aWBymS1kEn964p8ePgGjMXQtIa96MNzjG+niHmWGZEBVtDi/3CpswsxdCqAlxMAVvYMcY8FdagtWJRUcwbAgZTuSiViokoJGXseWN/ZXGDfDpe3FO7LKT/emXpLq+DVydkDDEsVWB/qoyrXjG8ZZs6549havASRmP+Pzg0+J1nQi8XfJFml5PuQVN2DA==
Received: from MMZPR09MB547520.eurprd09.prod.outlook.com
 (2603:10a6:190:56::10) by AMBPR09MB182651.eurprd09.prod.outlook.com
 (2603:10a6:20b:7e5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 13:31:00 +0000
Received: from MMZPR09MB547520.eurprd09.prod.outlook.com
 ([fe80::5b5:f191:1ccc:f9ee]) by MMZPR09MB547520.eurprd09.prod.outlook.com
 ([fe80::5b5:f191:1ccc:f9ee%3]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 13:30:59 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "kmehltretter@gmail.com" <kmehltretter@gmail.com>
CC: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"arikalo@gmail.com" <arikalo@gmail.com>, Djordje Todorovic
	<Djordje.Todorovic@htecgroup.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "mikey@neuling.org" <mikey@neuling.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"rvishwanathan@mips.com" <rvishwanathan@mips.com>
Subject: Re: [RFT PATCH] riscv: errata: mips: Skip vendor extension lookup
 during early alternatives
Thread-Topic: [RFT PATCH] riscv: errata: mips: Skip vendor extension lookup
 during early alternatives
Thread-Index: AQHdXa1I09BmvVgD3kWHOJIVa91o2LcE4L6A
Date: Mon, 19 Oct 2026 13:30:59 +0000
Message-ID: <98bc2e3f-0cc6-4fed-a7cd-50895552131a@htecgroup.com>
References: <20261016203052.2026-1-kmehltretter@gmail.com>
In-Reply-To: <20261016203052.2026-1-kmehltretter@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MMZPR09MB547520:EE_|AMBPR09MB182651:EE_
x-ms-office365-filtering-correlation-id: b01c3f0b-477d-4a43-1b97-08df2de53686
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|22082099003|18002099003|10067099003|3023799007|38070700021|5023799004|11063799006|56012099006|261009223027099003;
x-microsoft-antispam-message-info:
 q7gVOfmcNGAmGvOp10YArc/Ili4JkKMvsgkuNRQrWabEe71Zj+k6jsdt5jA/xmJ3rrYXRYThZueGR99CQwq6H0NwCR4OE77/85k5rhx3KCxWPhAfh5l4ozYsCN9sF8Zi913qVwTgXhKH9BOQgIEBWpQ5OiddpUFTV2+kKK556ujdxrLXkxr1BD84Gw5jlsGSmr6d0/dvgd5qlenyCFsx0kENLn/5Bg6DVjz5QhHVReMVXc1+K/zRGJ/da4hGIy+SEOVNYPK9r/HlmvJGMJnRZAvsMn3QAblyDcOJTW3kkZxkSAmo+3qrmfb/6DUcvdescvIxYW1MlwbbDGPi2eOXtN0JFEGrQKN2ynE0BAG8s/WjMuyeuiIcsn9j00qOtYJj6zwFT7CWX+BYA4X80FVbjbyYBQh3Gm1gtewSHzTDNLM0PUPQc4AYlt2mFha1FHzefvXXCgps7vtSec4xl+6pdwbQ0iqvoG+bAIbA34S58AfFUeGJscu5SVJm8j2ATYgbjXed4QSnK2w0xe9N1InfvHcpyqfSkFjGouegFWp4mxNbtTnLY0w+uWRQBwCv3bJwGOO9n5UVXiyO1MLpwjwVCsdEBdghkKW9C7CtvvtBkBUJWZyQYRAg0yRvLhQlzsxXS5RkSJAsCVwTGnnGX0I7z7QJrOg2BjnuLwzL07o7AY+hpUoaLT53uvaESmTJf+tn4NJCtYQ+ZCl5tdDVk+XJUA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR09MB547520.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(10067099003)(3023799007)(38070700021)(5023799004)(11063799006)(56012099006)(261009223027099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aGxNMzE2d01uUmIzWTcyV1dWcEw5S1JpOHpISUNCRHdLc2Z1U1hpVmN5TjlB?=
 =?utf-8?B?NUUrWlR4b1laTGNQemZIY1JNTUtRdTFBVkZSc0RuWWRaMkhidmtWVjRscGta?=
 =?utf-8?B?WlFKeTFsOWNFMjhkanU1QUV1MlJQQ29JS3FjU05uelBaU1FhRnJ6WmdtRnA0?=
 =?utf-8?B?dC9YVXNpNkRlUUt3K2laOExDY0Q4SWpMbU8rTTFEbHhZL3BQUjlIejBJWThU?=
 =?utf-8?B?bkphc25vbXVDS0E1MnY0em9mRmk0RzZHQ21OY2ZheHhQU24rZVR5cEVrZHR6?=
 =?utf-8?B?dHZ2dk1DUnByQnRZQWovQmNlSlJ4cHFEdmNYTnVYbThONW9QVHBNcWxkYnA2?=
 =?utf-8?B?Ymd5WUtIN3FhTFlMNFRTOExBK0N6SVFyeFpKQkZvSGVwU2l5RWNUbUdSbS95?=
 =?utf-8?B?Y1hZSUh2ZFZhNm5TRllvYWVVY05zSjJ3TWo2OE4rOVU4UzV1Y0w4bVZBWG9x?=
 =?utf-8?B?dnk4MjlSK2ZXNHVsS1dVL0RoQmlJM1VESEZQZkFiOU5jSVlNL1RsdnBYSnlJ?=
 =?utf-8?B?LzYrRVJsVnZPMnV3OGROQTJxVkFPam1DbG5tKzBEZnMxTXNtSlA1bDVvbEU0?=
 =?utf-8?B?c3BydjdoR1E3N2hxR08zY0dWSHJQMEJwZC9COWJoczl2NGpWVjN6Si9Bb0hZ?=
 =?utf-8?B?U2g2MDAxQ2ROZTlIbk5saXRqQkhqbWt2OUdKY0xhOHkySDBwTHhHdDB2aTRB?=
 =?utf-8?B?a0NKK1F6UFdqQzNWOUtWOG5aTlorVEkvZHJ2cHNPL2RtN2p1MjRvNy9KVGhZ?=
 =?utf-8?B?eFg4RzB6N3dsNXJ5YVBrSFp3ZlY1TnRWRmZ2UDh6cUNDaU1OajE2YXF2cGp2?=
 =?utf-8?B?R2xVZXdoNVNXVGhwdU13SkhaK1lrSXUvenFZa0R1Vmo1ZU93K0F5eWRQS1B1?=
 =?utf-8?B?aHM0RC9SN3M4ZXQxbG90ajBRS1RDYnZ0RU8zUERVOGVYSThMUzB0UC9YT0o2?=
 =?utf-8?B?Zk1yUGZ4UFZCaXUyTzQxRFlOMFo4YXlnYUt0WnpPTDBJL2pJM0tYZXg5U0Np?=
 =?utf-8?B?aU9Mckx3dHBvQk0xbGNqSkhPZXA0em4wNkhtejNrdG5jZm1WRXJqK1Rrcy9H?=
 =?utf-8?B?OS9iYTYwcWhRNHFGNkROayttb1B1OE0yWnYvcjJOZHFXQWVqRE90dzNhaWdj?=
 =?utf-8?B?K05MNDhIcVJlKzNWY2J3SXd6ZVc2MjFWd1FQZ3ZSdHNjVnJ1UURvd0hxMTIw?=
 =?utf-8?B?NHVZRzRYalRLL20zWkxQK3M5MDdLcEVrdW01enBMR20za2EzUUlmdm5Cdno4?=
 =?utf-8?B?dEk5eDg4WHJNaE8rRnR5dEdHTUpvbjVGaUljWFZhM290bzV0ZHNlMjhPbEJQ?=
 =?utf-8?B?M0dKY1hIWmttYjVlejFUd1UzbTNORkJVR1VRSEZhN0Z2UU5EZk02bncvNm9i?=
 =?utf-8?B?V2hwNS9zNzdaVkw5UnBoSTBqaVNyME1VVi9DN2dHenUwQWladlVYR2k4c2JQ?=
 =?utf-8?B?TzVhWWJkRkt4M0dGK3IwYlljR3VLdzRKYytERDI1aHhpbnVRL3l4SWc4MHZr?=
 =?utf-8?B?SnFNQk82Tm9UektuNVpWNmxDTDJJbHJQT1R2aHdCOWZCVWhTYjBVRjkybk9a?=
 =?utf-8?B?d0I0NVdtaW9ybFhsQ0tCRHlBT0cyZ0oxNFBVa1I3bDdCT29BNXNaZ2srVisr?=
 =?utf-8?B?bk53WEZSc1dlK3pEYmUyZ2Q3a0VwYU5UUm5Ba2ZoMG1oSTFTSC9zaGh4UE85?=
 =?utf-8?B?R2JFWnZQZENBcVh4WUFVZWd2bVNCV2VvdFZ5Q2RjaVJxUW90bTNIRmFWejZr?=
 =?utf-8?B?VjhuYnlDU1REbmo1KzZXTVEyaEFZWTVXdVdBRFVyaFp4azNvMlpsZjdwNGJ0?=
 =?utf-8?B?UjZoeTNGcDV5bUd1ZmVnY2x5TnNKSC9BUmlUZmxxNElYcHdvSjEzK3VTRkxn?=
 =?utf-8?B?UVJFNFJiN1plSXlHSWliM0VJbFFmanIxMnFtMmZpblZMS2dla1BHMW0rMWpC?=
 =?utf-8?B?aEZBWnRPNmw4UWJRSHg3NW5FYlNkMVFhOC9tOTZlSWtnZHlENjV1ZUhEMFN5?=
 =?utf-8?B?dEhSbEp4YTV5c3hpaG5nWUhGaXFvSnc3enllUzZNakY3ZTJWMVRQeUVYc0t1?=
 =?utf-8?B?Z05MQXQyZHFiVmdVazAzajRMZWpLa1FSVUNrZlZ3UVprc2FvVS9JRUZYWW40?=
 =?utf-8?B?R0RYeDNneE5CbklQc0Vpdzg4S1RnWTUyeEx2UDJkcVExT2tZazBybG13NWhN?=
 =?utf-8?B?bFd0TWhsMnNCTXo3SWtTdmtwbHNoYTJXWm9naVBuK3YwTGNnR3Y0TCtUeTZp?=
 =?utf-8?B?OElHRlBFNUF1Zmx4N29KUzk1Yk92MXdna0x2dHh2dnE1MEFOZGg5KzVEbXVx?=
 =?utf-8?B?Y25td1ljRjlPQVFnaHoyRUtoaGJDdGQwZUV5UGx6azNhUlY2T1JrMml6ZlRE?=
 =?utf-8?Q?97wej8Px4uQsxryw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4DAAE04843507344BE7E8F56B8D40033@eurprd09.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b01c3f0b-477d-4a43-1b97-08df2de53686
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2026 13:30:59.5100
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h1vJIPdxF3hKjPov1SlTk/uK6Hhro5mM7FAyUp4R9wOjoYKu81tpJaiSOHQwWjGekBuVjaG4+vsRLVnp39vR1lVONzYFvlJ1ffZEpAX29+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR09MB182651

SGnCoEthcmwsDQoNClRoYW5rcyBmb3IgdGhlIGZpeCENCg0KT24gMTAvMTYvMjYgMjI6MzAsIEth
cmwgTWVobHRyZXR0ZXIgd3JvdGU6DQo+IFdoZW4gYW4gZW5hYmxlZCBlcnJhdHVtIHNlbGVjdHMg
UklTQ1ZfQUxURVJOQVRJVkVfRUFSTFksDQo+IGFwcGx5X2Vhcmx5X2Jvb3RfYWx0ZXJuYXRpdmVz
KCkgY2FsbHMgdGhlIE1JUFMgZXJyYXRhIGNhbGxiYWNrIGZyb20NCj4gc2V0dXBfdm0oKSB3aXRo
IHRoZSBNTVUgZGlzYWJsZWQuIEVhY2ggZW5hYmxlZCBQODcwMCBwcm9iZSBjYWxscw0KPiByaXNj
dl9pc2FfdmVuZG9yX2V4dGVuc2lvbl9hdmFpbGFibGUoKSBiZWZvcmUgcmVqZWN0aW5nDQo+IFJJ
U0NWX0FMVEVSTkFUSVZFU19FQVJMWV9CT09ULCBhbHRob3VnaCBuZWl0aGVyIHdvcmthcm91bmQg
aXMgYXBwbGllZCBpbg0KPiB0aGF0IHN0YWdlLg0KPg0KPiBLQVNBTiBpbnN0cnVtZW50YXRpb24g
aW4gX19yaXNjdl9pc2FfdmVuZG9yX2V4dGVuc2lvbl9hdmFpbGFibGUoKSByZWFkcw0KPiBzaGFk
b3cgbWVtb3J5IHdpdGggc2F0cD0wLiBPbiBRRU1VJ3MgbWlwcy1wODcwMCBtb2RlbCB0aGlzIHJh
aXNlcyBhIGxvYWQNCj4gYWNjZXNzIGZhdWx0LCBhbmQgdGhlIHRlbXBvcmFyeSB0cmFwIHZlY3Rv
ciBwYXJrcyB0aGUgYm9vdCBoYXJ0LiBUaGUgZ3Vlc3QNCj4gcHJpbnRzIG5vdGhpbmcgYWZ0ZXIg
dGhlIE9wZW5TQkkgaGFuZG9mZi4NCj4NCj4gTW92ZSB0aGUgZXhpc3RpbmcgZWFybHktc3RhZ2Ug
cmVqZWN0aW9uIGJlZm9yZSB0aGUgZXh0ZW5zaW9uIGxvb2t1cCBpbiBib3RoDQo+IHByb2Jlcy4g
QWxsIGxhdGVyIHN0YWdlcyByZXRhaW4gdGhlaXIgZXhpc3RpbmcgbG9va3VwIGFuZCBwYXRjaCBz
ZWxlY3Rpb24uDQo+DQo+IEZpeGVzOiAwYjBjYTk1OWQyMDYgKCJyaXNjdjogZXJyYXRhOiBGaXgg
dGhlIFBBVVNFIE9wY29kZSBmb3IgTUlQUyBQODcwMCIpDQo+IEZpeGVzOiAyY2YwYjI5OTIyMDMg
KCJyaXNjdjogQWRkIEVSUkFUQV9NSVBTX1A4NzAwX1dGSSB0byByZXBsYWNlIFdGSSB3aXRoIG1p
cHMucGF1c2UiKQ0KPiBBc3Npc3RlZC1ieTogTExNDQo+IFNpZ25lZC1vZmYtYnk6IEthcmwgTWVo
bHRyZXR0ZXIgPGttZWhsdHJldHRlckBnbWFpbC5jb20+DQo+IC0tLQ0KPiBCYXNlZCBvbiBSSVND
LVYgZm9yLW5leHQgY29tbWl0IGE1YWUxYmY2NWNlZS4NCj4NCj4gVGVzdGVkIHdpdGggUUVNVSAx
MS4wLjIsIHZpcnQvbWlwcy1wODcwMCwgZm91ciBoYXJ0cywgYW5kIGdlbmVyaWMgS0FTQU46DQo+
DQo+IC0gVGhlIHBhcmVudCByZWFjaGVkIHRoZSBPcGVuU0JJIGhhbmRvZmYgYnV0IHByb2R1Y2Vk
IG5vIExpbnV4IG91dHB1dCBpbg0KPiAgIDEyMCBzZWNvbmRzLg0KPiAtIFRoZSBwYXRjaGVkIGtl
cm5lbCBpbml0aWFsaXplZCBLQVNBTiwgYnJvdWdodCBhbGwgZm91ciBoYXJ0cyBvbmxpbmUsIGFu
ZA0KPiAgIHBvd2VyZWQgb2ZmIGNsZWFubHkuDQo+IC0gV2l0aCBhIERUQiBhZHZlcnRpc2luZyB4
bWlwc2V4ZWN0bCwgYWxsIDQxNCBQQVVTRSBhbmQgNiBXRkkgc2l0ZXMgaW4gbGl2ZQ0KPiAgIGtl
cm5lbCB0ZXh0IGNvbnRhaW5lZCBtaXBzLnBhdXNlLg0KPg0KPiBRRU1VIGRvZXMgbm90IG1vZGVs
IHRoZSBwaHlzaWNhbCBXRkkgdHJhbnNsYXRpb24gZXJyYXR1bSBvciBQODcwMCBQQVVTRQ0KPiBi
ZWhhdmlvci4gVGhpcyB3YXMgbm90IHRlc3RlZCBvbiBQODcwMCBoYXJkd2FyZS4gUGxlYXNlIHRl
c3Qgd2l0aCBLQVNBTiBhbmQNCj4gYm90aCBQODcwMCBlcnJhdGEgZW5hYmxlZC4NCkkgdGVzdGVk
IHRoaXMgb24gYSBCb3N0b24gYm9hcmQgY29uZmlndXJlZCB3aXRoIGEgc2luZ2xlLWNvcmUgTUlQ
UyBQODcwMCBDUFUuwqANClRoZSBrZXJuZWwgd2FzIGJ1aWx0IHdpdGggS0FTQU5fSU5MSU5FIGVu
YWJsZWQuwqBSZXByb2R1Y2VkIHRoZSBidWcgYW5kIGNvbmZpcm1lZA0KdGhhdCB5b3VyIGZpeCB3
b3Jrcy4gRldJVywgSSB3YXMgbm90IGFibGUgdG8gcmVwcm9kdWNlIGl0IHdpdGggS0FTQU5fT1VU
TElORS4NCg0KVGVzdGVkLWJ5OiBBbGVrc2EgUGF1bm92aWMgPGFsZWtzYS5wYXVub3ZpY0BodGVj
Z3JvdXAuY29tPg0KDQpCZXN0IHJlZ2FyZHMsDQpBbGVrc2E=
