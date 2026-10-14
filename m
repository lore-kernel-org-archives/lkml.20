Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023097.outbound.protection.outlook.com [40.107.159.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB61B4ED1AA;
	Wed, 14 Oct 2026 13:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983877; cv=fail; b=WD9Tb2pxzz+5g8Qwlt/Dtn716KWfmJKJ9zD8x+5Md3GSiSLYZ7lvTYftxKlWF4RAX2EgJSZNOPmPSFisOh/Uynj5c0Lk0FkfrLZx6WMJQ+AtMZnKSbPznTPx/2gUCH4jA9R4ksdnpUi61MjsdNWa//FICwGypQ2Ptqzaklz9O1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983877; c=relaxed/simple;
	bh=geMjtst9dFZzx9DdoC+y9c60lFL4PJlCYNE95/CASPQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tI0TcC/4jXIQiYQcVd3G855UH58L2PWl7OupLzb5fQLGdiBgE+2F7WFAsk68V/ltWPyL0ACWQbTgz7D40hmeFsttJIPldTHV/biahsTQmfjrLtwMXfMRApIZ0UaWhNXuBj24Wc7uuke66sJE6y5ZKKx0XrZRkCWRfDtBeMwsinA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com; spf=pass smtp.mailfrom=htecgroup.com; dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b=ZBCVe23C; arc=fail smtp.client-ip=40.107.159.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=htecgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=htecgroup.com header.i=@htecgroup.com header.b="ZBCVe23C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvjGqfXcrlOw4NAfTrMZsZXgqjVGnaHuaC/qAzLHhIQtvV+XP8WZOzpbsgFN5UtNm1fM9sOmTbpQrmZsD+hAFP19WqO1QPB78xKv48xW4u9u/WtczWPk1A33tN6zlCZAVWP/dTAJezoToN54t1BF53O3O1gN6ab8HHETqqgjliC2LpYwcOPd7bRzRrCH5qUl5hZdkZZVhcSmlPDsQBX+Sx+ktvFMLYbCt8VPyCIl21gXCoV0+/DWAsi0IIL7oajAzc7AJLtu2fp+1qZy5HqsVd8mSPqYrqw3rv8mCNlTDsKRFN+ZZn5/r2hytLgOYyAlkqka0WrooD9YkqZsQkAdMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geMjtst9dFZzx9DdoC+y9c60lFL4PJlCYNE95/CASPQ=;
 b=e7VjtIpvLILL2VEdFmRwcZ+sOksO/2/TKMFo+LncU40sANBDJ0u7ZIC/mokha49DA3SOVgGP5DB1nIfNDjlnnshLVMAF5jt2TpdtdqJFTG6FBOq8h+GWajWbpDCtJIXTDym6ugmsUbbTcB0ZVj4/+7IvDscXiHURbD5dnuxVR1F4Ms7ru549N8ZNScPjXbSv+31/It7QiAwsuusClqDXINz6Twdpp20kjf8qqC8Do5EmZuuHahSUdKfLiaEvevCzy3TZGxmaUJ9lXnXbsa2t39hsJo1scibC2gf/DPP353Ocr/cj6XkpiQa+St7eEVUJOlKG2/nq77SJYxBQEgLawg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geMjtst9dFZzx9DdoC+y9c60lFL4PJlCYNE95/CASPQ=;
 b=ZBCVe23CsikFxUoYIXSuu074lW7O59+nuHUa6x1JTdvyLR+QKELy1bAKsv9ZtSJi3pEsF6ZgzimuxPw6I3shdopx1xfsfwP+NmJvjQWk6r3pNTyHXHRpZWdcp4fKeWwk3uDTVqaP23w8VxB96O20kbUf2G/O0goE1vlhl/lf6TeTCgVGoMr+5te3BQkRrAttuqM64cIKNq9/tPXnaTXs/ea3eN/mQBFMNsbBcUDtL2CVuUEut/gC073aZ0SJbgpV1yiRA1nrqkCWc/PiFHIvHy7Q52ENw0wYVEIUS8gMrlFetYWsJwzlL7HWMQRY2hwv/tfcz7ux/g0QDGh4RE1W3g==
Received: from MMZPR09MB547520.eurprd09.prod.outlook.com
 (2603:10a6:190:56::10) by BR0PR09MB670163.eurprd09.prod.outlook.com
 (2603:10a6:2c8:53::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Wed, 14 Oct
 2026 13:17:50 +0000
Received: from MMZPR09MB547520.eurprd09.prod.outlook.com
 ([fe80::5b5:f191:1ccc:f9ee]) by MMZPR09MB547520.eurprd09.prod.outlook.com
 ([fe80::5b5:f191:1ccc:f9ee%3]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 13:17:50 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: "macro@orcam.me.uk" <macro@orcam.me.uk>
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
	"radu@rendec.net" <radu@rendec.net>, "robh@kernel.org" <robh@kernel.org>,
	"tglx@kernel.org" <tglx@kernel.org>, "vladimir.kondratiev@mobileye.com"
	<vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH 3/9] dt-bindings: riscv: Add MIPS Boston board compatible
Thread-Topic: [PATCH 3/9] dt-bindings: riscv: Add MIPS Boston board compatible
Thread-Index: AQHdRFDNcAlfINcodEeR7s5jjfhkNrbP7wkAgALXuYCAKm1tgA==
Date: Wed, 14 Oct 2026 13:17:49 +0000
Message-ID: <bd4f57cb-213a-43cf-a119-0facdb1fcf5f@htecgroup.com>
References: <alpine.DEB.2.21.2609171254060.15569@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2609171254060.15569@angie.orcam.me.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MMZPR09MB547520:EE_|BR0PR09MB670163:EE_
x-ms-office365-filtering-correlation-id: dd571f82-2a93-4216-f69a-08df29f58bda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|10067099003|38070700021|11063799006|22082099003|18002099003|56012099006;
x-microsoft-antispam-message-info:
 ysr+Y7i7m3ji3P2N0lRL41bmijD1Nwq4tg5L+JrHtm2M6O4wLcaTqtshys8l5V/TLVcd/xPCXwzruJLr1jnOJsPa29RdUbBk5t4rE0XyrC/OXwn7fb2IhkabPxOYBCSWH5IeKAjwmPB20c3AX36SYP65nGq8r2g+3QyKxpAcf2VnWuAjyuxA0mpTwnKNPQSB5hcQVx2Hdc4QnyaTXggGL0yK6S8SHHl9GERbnkYC/57PuAeBjkdu/imYhG3xX3FW2FviUzkwg2HqV7zybst446EovZP3DzW7q5baxd0Magw6/uYzmadefZfnYjTJTlGN+RehafByLNH2SUnnAvTx+YSO7sAVHH8ujZikPeO5NEA/+vlhz8Jc24n+/w3Ux+tpKfG/EjpNcba+VgbONTMSMuwBEqFb+JNwPxgqBk5JRQNvDZ10vp+2AM3334XM8Ld6Y2Hb+pdXhy2IE0xkaW/Ydalybd7WNNB8z30LJcxshhIu+6JlEnIF9tHhc5vbv+XQRoORtoonxpcEJdRvls53Sm9DF21U2nloVRyCd8i4HV3LV/CoIiWi8hXCkSmjUy0BBhimoNu/13C6+6G3ekbRx3sXqaIAcDYakwxtXqazebpV8/bEuDXXprusyZwxAy7Y5f9siPwptPLtUCHyFdQCI0ZFskfPB9hZWuK07PQy0h0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR09MB547520.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(10067099003)(38070700021)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MStIKzF5bzk5ZERvUUx1N3JVaVBsUFdkWjNFUHo3UWJyZ3BGSU5ZYkdqZHhN?=
 =?utf-8?B?S2thMkJ4ekd6NXJvVVBQdExWVmJDSEFldVdkcW9nTS9wOTVyN0hHOUJoVHRy?=
 =?utf-8?B?T0RhQlFIbGZxMTNXcVpjRWRoQmEzTk1aeHFUYUhRQTZEUXBUaFdHamNPVGpk?=
 =?utf-8?B?TEdqczVvams2NEpYZysrajZhTS9mOUNuVmowVlRiT1BwV2NXZkcyS3EyNDh4?=
 =?utf-8?B?djQ3TGRDNUNvWENYKzltM0pXRXNXaThvMUxub0VmOHJzZ3BialdYQnNVbGJF?=
 =?utf-8?B?RkdwaE5NaWp2SGN6SnM5Z1ZmWm5sd3dvQUFheXRGSEQ1ZHljb0hVK1RnV0FN?=
 =?utf-8?B?Q1Rtbm1EWWN2WCtnNnpGZzFVeEUyL25PU2o5aldNK3BpSUd3QWUrQ09ZZUx1?=
 =?utf-8?B?WHRwUTFPZE1CcDNTYjNGNzRVNU5DN2JyVmRDRS9PMW9na3J5RDhJbFo0MTBN?=
 =?utf-8?B?ZkJENk5QV2dwRWM1UlNZNE5DaHllb0JodXVKVGVySnpOMFhwaTBpU0lUbkZp?=
 =?utf-8?B?aHpYL1ljck1GT0tyTnBvRldheDBrcS9pYXAvZndoRktyQi9qVUVnOFpoRjl6?=
 =?utf-8?B?K1pEZXhmVzczVm9CUmowSCtWWFN5Z1dlM3NrMVRHRGdKRHVEZkdpWS95d3Vu?=
 =?utf-8?B?aWxRRFc3QUlHSThSUWZrMUNqbWRqQWhPWFE3dm1RVjltNXZmQ0xoN0hFNXZS?=
 =?utf-8?B?NTNCN3ZBZE9WN2ZoQzcwcFhSNmdGekloL0p3VWhoUjZqNXRKQTRSaHVpOFNq?=
 =?utf-8?B?UUZtMS8waVpPWGJkMVNkTEJIYzVyeVNLQ1BxVzRKZjFmcWttMis5TjhUaVBF?=
 =?utf-8?B?MUpqUGZoRG1McGFFaW5PRlpKM3ZSQThGRTF1a2ZhZjZiVkVDWElWVFdKdDVX?=
 =?utf-8?B?LzNwakpId0x0OVhxNEJkUFFva1NTOU81OVBoUGhGYUFuck45SmF2SEFQR0Jt?=
 =?utf-8?B?SUZ1dGFydUhJVy9WN0FWUHUxcXl5N25JSlV2bFVGai9NTCtpNjNndjJMcG15?=
 =?utf-8?B?WWgyVis1NGgyWDB0YllQdGhNQ3R6dFFBWkkreXU0bkt0aDlhcjNqR0lUV2Yw?=
 =?utf-8?B?VW55dnpyT2MyTVdnOHcwMy9KQjhJSWJoOVRtQmh2Umw0YmRNWndCdy9PM05N?=
 =?utf-8?B?S3pFUnB4VHlGcnJoeWZJTHZWNVo1cGtxMHIzNjZHcnFTL0FVNUd1cVFabmFN?=
 =?utf-8?B?RVpvUnh6V2VVNzRtdjNqMmUrVkNQVlhDNG5PcEt6RTRtWHViUFJ1cTRGUWlq?=
 =?utf-8?B?bTV3RVRPeGFGNHlyTkJVOGZwZnFwSDBpdWVQdmlkWFN4VXd2Z1FmUk1vaHlR?=
 =?utf-8?B?N2V2aGdOU01PQXB6cU5UN3ZZN3l4QXhXbnQvTEIrRjIvNDVPYjFyZTVFR2RL?=
 =?utf-8?B?QUxjS04zM0dxUE9rVzM2MmI0TE5MZ2NPMWI5ZEpkb0t5M29vTDhSQ20vNXpt?=
 =?utf-8?B?enhjbTJoeWhPeE1jT0w3N3FZZi9SdTQyM25SVVRQS1g3T3VaUjhtREFkOUJn?=
 =?utf-8?B?MkJVcXZzS0hGUkdpOGZjQ0ViMGxWVEdhOUJzdnp4N3RHSDNIVE9vK0NaU04z?=
 =?utf-8?B?TzYzejZpKzFFdjdtVkVhckRLTGdadXk4R0RoNUE4eUtTczNYYjUrbEQ1VkF5?=
 =?utf-8?B?QStxUGgreHJGTlFYNXlITVdBWXVNNHRqMW5VM1NiZkxZeHpxR0dxZEtMSE4r?=
 =?utf-8?B?REpsSVJ5cFJVSjlGd2paRVJXRXpheWNTZHVzL2JtN3JJaExzLzRScE0wMTY3?=
 =?utf-8?B?Ylh5ZVlIcVprYWFjdkNvTzdueUlsa3JXRW9uUVpOR2RkSFZNVXBWR25HZVVZ?=
 =?utf-8?B?b2NUWnk5RlM4a0o4S2c5Vk93MU1LRFNLcE5taU5jZ2Q0bWxJRmdqL2tHWG44?=
 =?utf-8?B?VXd2UDV6Y3BzVHBEdDlNSTJvanJaLzBTamZjZ3hQNU5tOFhWTUZwMmxUV3Bi?=
 =?utf-8?B?bVdGb3Bib2tETUpKUmFZUmpvZFhud3NldkwwL05pTGRlRVo5VGlxcWR0R2J3?=
 =?utf-8?B?bHovS3JOWFhEZklPM0xINVUwZHA2RzJBaTFyeGZuMVJaMjUzRERROVVUb2ND?=
 =?utf-8?B?WURIbElJZzQ4M3VMcmtrY0tIZzJuQUp4MlR2SU1PN0lhd3lqK05yY01VcGk1?=
 =?utf-8?B?VDNkdjVOQk1SSkxyM0dSOHg4VmVMV3FOTnM4dDRXOXcvMGdBT0ZKWWEzUEpK?=
 =?utf-8?B?eVRhMjJBTE5PUXRGZU50MGZpM25uM1drQXh5MlQvRTA4VGdQWXduNlJpbHdO?=
 =?utf-8?B?dVN0bGt5K294RmpGY3RmYW55NDd3Q2krMFZXVHQrMHlmbzBCamlsWHNiMGFx?=
 =?utf-8?B?ZG4zRnl4QUhodXhkYThyZ2lnMVA3ZnF1dUlpcDI1REtqOEZ6QzZWQUFWWVpr?=
 =?utf-8?Q?3My70emBM4D4rEUg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E5793968388B14FAD9FE53F421BE277@eurprd09.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dd571f82-2a93-4216-f69a-08df29f58bda
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 13:17:49.9178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8pLb4oz8Om0KhV/EuNJN+/f8AXYRkq97tQbdXp7Ua1bL6qKG7iRSY75lO9FgZBycm+11uCkJQvbAeBygqUhfR0Xzxkq0pYQC2mJOqB3GrPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR09MB670163

T24gOS8xNy8yNiAxNToyMywgTWFjaWVqIFcuIFJvenlja2kgd3JvdGU6DQo+IE9uIFR1ZSwgMTUg
U2VwIDIwMjYsIENvbm9yIERvb2xleSB3cm90ZToNCj4NCj4+PiArICAgIG9uZU9mOg0KPj4+ICsg
ICAgICAtIGRlc2NyaXB0aW9uOiBCb3N0b24gRlBHQSBkZXZlbG9wbWVudCBib2FyZCB3aXRoIGEg
TUlQUyBQODcwMCBiaXRmaWxlDQo+PiBJJ20gbm90IGNvbnZpbmNlZCB0aGF0IHRoaXMgaXMgc3Bl
Y2lmaWMgZW5vdWdoIGF0IGFsbC4NCj4+IEkgaGF2ZSBhYnNvbHV0ZWx5IG5vIGlkZWEgZnJvbSB0
aGlzIGRlc2NyaXB0aW9uIGlmIHRoZXJlJ3MgZXZlbiBhDQo+PiBzcGVjaWZpYyBGUEdBIGludm9s
dmVkIGhlcmUgLSB0aGlzIGNvdWxkIG1lYW4gYSBiaXRzdHJlYW0gdXNlZCBvbiBhbiBBbHRlcmEN
Cj4+IHBsYXRmb3JtIG9yIGEgWGlsaW54IG9uZSwgd2l0aCB0b3RhbGx5IGRpZmZlcmVudCBjb250
ZW50cy4NCj4+IEknbSBvbmx5IGhhcHB5IHdpdGggRlBHQSBiaXRzdHJlYW0gY29udGVudCBiZWlu
ZyBzdXBwb3J0ZWQgaWYgaXQgaXMNCj4+IHZlcnNpb25lZCBzdHJpY3RseSBhbmQgbWF0Y2hlcyB3
aXRoIHNvbWUgY2xlYXIgYW5kIG9idmlvdXMgcmVsZWFzZXMgZnJvbQ0KPj4gdGhlIHZlbmRvci4g
SSBjYW5ub3QgZXZlbiBmaW5kIHRoaXMgYm9hcmQgYnkgZ29vZ2xpbmcgaXQsIGxldCBhbG9uZSBm
aW5kDQo+PiBjbGVhciBpbmZvcm1hdGlvbiBhYm91dCB3aGF0IHRoaXMgY291bGQgY29ycmVzcG9u
ZCB0by4NCj4gIFRoaXMgc3R1ZmYgaGFzIGJlZW4gYXJvdW5kIGZvciBhIGRlY2FkZSBub3c7IGNm
LiBjb21taXQgNmU2MmE4ODgwMjliDQo+ICgiTUlQUzogZ2VuZXJpYzogU3VwcG9ydCBNSVBTIEJv
c3RvbiBkZXZlbG9wbWVudCBib2FyZHMiKS4gIFB1YmxpYw0KPiByZXNvdXJjZXMgaGF2ZSBiZWVu
IHNjYXJjZS4gIEhlcmUncyB0aGUgYmVzdCBvbmUgSSBjb3VsZCB0cmFjayBkb3duOg0KPiA8aHR0
cHM6Ly90cmFpbmluZy5taXBzLmNvbS9jcHNfbWlwcy9FeGFtcGxlcy9NRDAwOTAxX0Jvb3QtTUlQ
U19FeGFtcGxlX0Jvb3RfQ29kZV9mb3JfTUlQU19Db3Jlcy5wZGY+Lg0KPiBFeHBlY3QgZGlzYXBw
b2ludG1lbnQsIGJ1dCBhdCBsZWFzdCB0aGVyZSdzIGEgcGhvdG8gb2YgdGhlIHBsYXRmb3JtIChw
Lg0KPiAxNDIpLg0KPg0KVGhhbmtzLCBJJ2xsIHVzZSB0aGlzIGZvciB2MiE=
