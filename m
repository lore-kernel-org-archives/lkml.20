Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.128
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793692179;
	b=unizh55ZybYnSSs+D63Uffe/yo8SIMvNZUOCBEc0gonifgXq5lOdUBtkcwZOCFi6+Zwq
	 u9j6hbFHYurX+HWO82Y2Q8Pfj/W+4s4YfESY2CtGZDh0E/bIstMDdKdgm4r4DjFlOxyvH
	 KfRVX8SNQFVYD3ulDo9kwVcaHRYsc37MyWc+TZpdA0g2SU5HXAfsAN7px7aZFk9Y3QnKl
	 rHSpYRuQLWjmed+6uSuM8RW+QWn3V0vYSjUeBwRzNcQ8WejKR7Kh+iQ0T5BJxXi+3DvAg
	 QZ2WIXysnCn71TNNIGfc6/aKVrDsiMVpJj1mWFmkh60MWOn71NBUkkGCwhJZDD9Nm1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692179;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=5YcfFNXNNcRZyr3B/sjj3rTxXoE6LY9E9r1V3OH9k5Q=;
	b=Uk9AZRhb3k8ym4f6pF+wkoWDQYLrw9/zc+6440uHxgidbPGpB4bDGrYP4QOEnxDphald
	 nN+mymH5CAsQjLOSOBe6Zu7kdbShgJnbGPNSH3d5m19Dc0v+5QYOACojSrn7KF0zXYSEm
	 YSzx2ab1Shu6HIhYcNtXamfcByvracA5ADkU/QNEwD9hEEBwBdC2RKmgISDu/hKWfjYzt
	 WTzQsPi7hhyexQYz7XcIixwzbwJA5rmwNK/0Pl2RC++EhHwsiy9xHGR2FH9n98Ml787wA
	 GsJAcMr09Q8+MEMVjl5O5Fq9/I9+oj7ca3PO7Xx4fy6yU6ZoA0Kn4MJea1Lnb2wmjGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.128
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023128.outbound.protection.outlook.com [40.107.44.128])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB20C606A324;
	Tue,  3 Nov 2026 07:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB20C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxVY0bErICYu2r0iDfyc6TS9e96Y24oHzV01vzi4Xz/JqikBcitwFKD5m5/w+sbldIxkAr3eza9Da6Xe439OShd75L+tzTzWHze5q1wxJsfMLJnfqeea8mM34tURzcW6jEyZSoCZBtXcR8HPQS09nBWwNlXO9yWcIviiY2JiLwUjbVeUolJyBzxvndM4Ce8Lv/V5ayYaYiVmKrSINQ/OcrIW/EqdNBHQ3/0cylMcU2DW5UxHTStuk/XocEX5agyHEGIw2JF6atdn6+H4oKUNTPemT580LlZTuPONKZLKoAnPZ5j9GpVJEXfepr0LtCwroBPIkp7YY4NWtRN0LhsDhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YcfFNXNNcRZyr3B/sjj3rTxXoE6LY9E9r1V3OH9k5Q=;
 b=EoY3pIXxgkkDG59ScAlwzRXZl2Il4n9Qn1gG+dKmsnusVmEj75guqzfMx63z4Oiaey0RKTMh0QdXngyfOMtG3a0UROTIvMLZ1hPTlvcm5n1H0cm6urcr+peyv3fNfiYmXsa5Vi7hcFTL5l6Rr2pqT13C1JTQ4m8JWAjlp7BjYNfmtRNE4K3A9pfkk2X7rzqJ8IuyTi4tNPwhnZpoWOhgFFHjUwK0cAlI5YJfw11cQBDyqPHKM0LlnPUvgxyr7oe4nsQ3th6cvBLNoh0xXj6hsuWLf7wN9R0ZdROf5k+2OZfy0lL9hhPMAnR/2mDoZfM5Z5fXnzGNZTJbi21djXm1hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com (2603:1096:301:80::7)
 by SI3PR06MB8753.apcprd06.prod.outlook.com (2603:1096:4:2a5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 07:49:35 +0000
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac]) by PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac%3]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 07:49:34 +0000
From: =?utf-8?B?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?=
	<hongliang.yang@cixtech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen
	<peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, Roger Quadros
	<rogerq@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, =?utf-8?B?R2FyeSBZYW5nICjmnajmlrDkvJ8p?=
	<Gary.Yang@cixtech.com>, =?utf-8?B?RnVnYW5nIER1YW4gKOauteWvjOWImik=?=
	<fugang.duan@cixtech.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>,
	=?utf-8?B?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?= <hongliang.yang@cixtech.com>
Subject: [PATCH v5 0/3] usb: cdns3: Add CIX Sky1 USBSSP controller support
Thread-Topic: [PATCH v5 0/3] usb: cdns3: Add CIX Sky1 USBSSP controller
 support
Thread-Index: AQHda2fe/wkB55iUgkOIZj/rFCPKsQ==
Date: Tue, 3 Nov 2026 07:49:34 +0000
Message-ID: <20261103074929.1971195-1-hongliang.yang@cixtech.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4439:EE_|SI3PR06MB8753:EE_
x-ms-office365-filtering-correlation-id: 17b68d9e-bb12-4005-6f81-08df397f00e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|921020|38070700021|56012099006|261009223027099003|261028144727099003|261026121527099003|261022075727099003|261022105027099003|261026140227099003|261021121427099003|10067099003|18002099003|261102123227099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 /KvVvDY6+Paa4yY7D0SEnehn4zt/Ro3ri0i3b6bKT0EsDsrvO+M/gOnJubZ8k7/PwR5ClEEXA7DeHK3meOFoAMGINLkwVXV8htK53k3sr74WaylWrsEa1fRiOUHCmJS+BoT+XoYPOkzVkA/Soq5gkmoBTzYyBYrumScI8j6v4MjZ1jF1CSZ1ovlOqUl+lK+HcgiQTWU74Qg6zl/j9Y6ZOUbGtZobjeiK/sLIKjUr9KHDxR7VBJflydLjQuKgabes9Vu7WefH9HzIG0o7iG4Psa5cHTd5j6WDDfJK5R+Wtf74UmY9/vwyO7oAMNKqFkC62y7k5pCCAXIdraZ4wlpJdE3nCv/y5HfzLEnnPZg7ya/9pLXwXq1ZKVP3HnXMZiy3JxYSgFVC7uu97gUEepWdm8ORVfCJh8vBxH41+RXEbmwJl34EyEoP/PHgxmkLcdjDt2R8YD3NCayx3Xic2Wcm/NpEYjTDwaMrNrz890zwKt/2PK20/aD4qq7TwkENm0mdfznzCUQlyTDB5IfqhLK98lXKUbbBLUfL9w01+Q5+wcuJuCBmxSlUz7Bz8qu2ciQIqtLYUZPvRyH7WBGWnFC3aQJbc0t3Muuf0AA4hJ9JgxnW4miZuzvo+wO1wEekSV5Fy75vc0Up7uJOizdeCeUPpuIq1dk6LEif7+9eMvw3AuV5kvmqJFi0q+UvcPBb/OF41Uk9C56kdDm1H/Q5n4wbD77BS2dHuFoY2s9xaa+pDRI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4439.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(921020)(38070700021)(56012099006)(261009223027099003)(261028144727099003)(261026121527099003)(261022075727099003)(261022105027099003)(261026140227099003)(261021121427099003)(10067099003)(18002099003)(261102123227099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MjBGSW9FQlhuMFpiM2JBRTdiemxjdDZ3QWVyalZXUHhUUExKUTc3aDUyMG91?=
 =?utf-8?B?WFlPSmFra1NaV1M5SnJvdE4wN1NNb3FvU1FwMXVXU1F1NUJDRjYxL1FJQmxQ?=
 =?utf-8?B?RSswMTVrZE1UMk4rY2lOQnR5QkhjWVhQUDd6UzMweVZNc3hUb3hnbXAwTGhY?=
 =?utf-8?B?d2RMcXhmdVQyL2xsb2VqT3dZZWdiUm93Z1FKRUtwaVVhZFJGcnM2UGtTYUZl?=
 =?utf-8?B?NFFRay9LaHhCMGpxTGFyVXA1dStNOTBVTlVGZXlld0hpbUh5RkJjVit6UnN0?=
 =?utf-8?B?STQ5WVhNdm5wNVRWVHozNHFIbTF3OXBGTXRoY0RKOGFuVS9tNmVQRUZBVDk1?=
 =?utf-8?B?dnBsbFAxS2ZxbGdGZkZPaU9GZTZTTWZPVm8vRE1kWUZTcTJJZGRUVEF3SldV?=
 =?utf-8?B?Wk1oVlIzVHdDend4cVdPZjFhVHNMWTRwcU1mYzhZTUVvRVNmajFURHk0c0lu?=
 =?utf-8?B?Q0pEV1RZNlJ1YW9Id2hrb1FxbU1RMWhGblhvQ0ZiUVBpMXcrbDY0RXhsbU9W?=
 =?utf-8?B?dWZMTmxDSjI2dlRPT0JaMitzVXllbHNIN2VIcUEzeFh6TzZjZmw2enF3enFv?=
 =?utf-8?B?SlczbnVhbnNMWHduaUdodUhEaVdQVSt2U1I4WlFTVnh6dE1QNjE3VGZPM05w?=
 =?utf-8?B?ZnVYbTIrSTc1N1l5NU45bnJJUjQrcWoxUXQ3djlxaVJ0eVBGYytUME9OazBW?=
 =?utf-8?B?MWVrdHRUZzNQM25DRWZsRis2ZlFDK3ZkbWdEazg2WU1tS0JCaGdINHEwTXlC?=
 =?utf-8?B?MzA5d0RScEtYT2hGNE9Ld0xIeGtEU00zaERDN1hmVHlBeXVpRWVyZG40aWlx?=
 =?utf-8?B?eXppeHJkZkdWSjdUZFVkQXF1RkhkNGJTbHhwVGRrMU42MkJ3WXJkYVNPZnpU?=
 =?utf-8?B?UUd0cEFrUmR3UDZTekZiZ1I3OXc1TzNjUk5hRXZ5L1BKUHpLd3ZFc3FtNmRp?=
 =?utf-8?B?V3JNSWhTai9zaE5aMWFnMWVOVE5jeDVKU1ZLbldZL043T1h2NkxLRGhUS214?=
 =?utf-8?B?QXI3T29vUmdYazl5SEpoSmhaL1VHNktUSWdGeWthTWZWN1ZKK05EdXNvQkNX?=
 =?utf-8?B?K1dCUWtEaXJhLzY0eEM0YWdhNnFEQkF6Yy93TFdwZE5Sd1l2ckFhTURKamNs?=
 =?utf-8?B?S0NMUCtLUFhNR3pObVhYdFZXWmJGTFZOV3B2eGluanl1MUJWSkQ3Y21xMmNs?=
 =?utf-8?B?T3F0U2w0OXZ0MFQ3NG0xR0ZEZGNWZHBjNUswTHM1aXMvVjBNd1NhaHB4RVBD?=
 =?utf-8?B?RXNhSkJndTVDdjNLV2RZR2tXdlBRd0pqS1VFcGFJbStVb3dPemF2bmo4SXRK?=
 =?utf-8?B?NE1oa3MySDhnSGpKREhwbzd6Q0lkbEZzWWlpUFJPSVZONVVkb3p0aWx1RnVi?=
 =?utf-8?B?dzU3bWIvSlplT3BZd0RwR2M4ZHFyRmUvNUt2L2ZFQVhSQ1hscDFkOTlEU0FF?=
 =?utf-8?B?WUxranZGZ1I1eWdTUXRUdHNZQkh5RHJjNUhCMHBsWjRCdWROUWRBM0lnb3Fj?=
 =?utf-8?B?a2lYSkpwcTh0OCtTaDA4b3doaHRUOFk1Q1FGY0QzMXVwV0gxMW9nMzB2N2dQ?=
 =?utf-8?B?U2RISFIwQk9FUUFEK2pscHdSVXUrUDBIVFVzY29qUmsxa1JERFJXTzRwSU9z?=
 =?utf-8?B?SFpUSUE4cG0va2tLODkrYXlVeTV0Nmx4eVpMZHhIbFhaK2xEcGxQMVZwbk15?=
 =?utf-8?B?ZktpSmpzTExkQnhCc21XZHdna21CRHRtZlRRKytFMHZVSFk3cUMrTTV5NHFS?=
 =?utf-8?B?dGJmVHBLc2JDaUJHTGdNQSs1MmlJNzFvQlNpTXVJaFhpSzN3TEtVaXFmOSsz?=
 =?utf-8?B?TFF5NkN6RWJXb0JnenZ4cnhjZTJEWVJjQ2tBVXFJSnRZWkpENU02ZzN0SDRM?=
 =?utf-8?B?YlB1K2VIeWlXczR2SXplMEZOSEwxZ0NHdjR3Q1VMMzNPaFMwdHh4ejg5bkF2?=
 =?utf-8?B?RVJzOVduWWFEK05UMTAxbWdnenR4aWprVjkwUVh5cDhQRDZGa1hMWTBZZkRj?=
 =?utf-8?B?ZDJEL2FscU03YUV3Si95cDZob0NhVS9QTWh6bEtyeE94SDltTWZ0YnNzcFVI?=
 =?utf-8?B?LytrdS8rVFFVMENVWlhweHpodXFuV2JGeDVoTTlXcjVJV1FXSFpOSUpzdE5D?=
 =?utf-8?B?UnlwYnNtWGhvVXNWMW1GeWlwaFRMQm9oSlVnSFlhb1RaZ1lRRklZeHBuUjB1?=
 =?utf-8?B?cWZlcG1pZ2JpTVg5cUtGWldVdEFNOC9wUTBMWmxKeUl2TUF5V1VJT3BhWUNK?=
 =?utf-8?B?cFB3V3QwUDgwWDZFMzBnYkZiL3ozU041TDZzT0U3MnM1S1JhTTRYa0ZVR0Nv?=
 =?utf-8?B?TTZ5ZzlYV3AwZmM4MjBpKzV1UWxzVW5UeWZIeDhGQnZaNVYzZERBZk5OYUky?=
 =?utf-8?Q?tOlrYkuu/wV5ZPiU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3FA2FF274FD0F1499B5094CBB8F453D8@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4439.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b68d9e-bb12-4005-6f81-08df397f00e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 07:49:34.8343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W989IN/Btj8D8qbXwlqzLBfeJELJVvtZr/pO5mDsYC4+m6NNmNT0nrZVL2yA5ngdV+qlC48vdPZ6tfxCwRazRyI2j/bB7hrMW0BHwINp0gs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI3PR06MB8753

VGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgdHdvIENhZGVuY2UgVVNCU1NQIERSRCBj
b250cm9sbGVycw0KaW50ZWdyYXRlZCBpbiB0aGUgQ0lYIFNreTEgU29DIChVU0I0IGFuZCBVU0I1
LCB1c2VkIGluIGhvc3QgbW9kZSBvbiB0aGUNClJhZHhhIE9yaW9uIE82IGJvYXJkKS4NCg0KUGF0
Y2ggMSBhZGRzIHRoZSBkZXZpY2UgdHJlZSBiaW5kaW5nIGZvciB0aGUgQ0lYIGdsdWUgbm9kZS4g
RWFjaA0KY29udHJvbGxlciBvd25zIGFuIEFYSSBidXMgYXR0cmlidXRlIGNvbmZpZ3VyYXRpb24g
cmVnaXN0ZXIgYW5kIGENCmNvbnRyb2xsZXIgc3RhdHVzIHJlZ2lzdGVyIGluIHRoZSBTb0MgUkNT
VSByZWdpc3RlciByZWdpb24uIFRoZSBnbHVlDQpyZWdpc3RlcnMgb2YgdGhlIHR3byBjb250cm9s
bGVycyBhcmUgaW50ZXJsZWF2ZWQgaW5zaWRlIHRoYXQgcmVnaW9uLCBzbw0KdGhlIHNoYXJlZCBy
ZWdpb24gaXMgZGVzY3JpYmVkIGJ5IGEgc2ltcGxlLWJ1cyBjb250YWluZXIgd2l0aCBhbg0KYWRk
cmVzcy10cmFuc2xhdGluZyByYW5nZXMgcHJvcGVydHksIGFuZCBlYWNoIGdsdWUgbm9kZSBtYXBz
IGl0cyBvd24NCnJlZ2lzdGVycyBhcyBvZmZzZXRzIGluc2lkZSBpdC4gVGhlIGludGVybGVhdmlu
ZyBpcyBub3QgYSBwcm9ibGVtOg0KcmFuZ2VzIG9ubHkgdHJhbnNsYXRlcyBhZGRyZXNzZXMsIGl0
IGRvZXMgbm90IHJlcXVpcmUgdGhlIGNoaWxkcmVuIHRvDQpiZSBjb250aWd1b3VzLg0KDQpQYXRj
aCAyIGFkZHMgdGhlIGdsdWUgZHJpdmVyLiBJdCBlbmFibGVzIHRoZSBjb250cm9sbGVyIGNsb2Nr
cywgcnVucw0KdGhlIHJlc2V0IHNlcXVlbmNlLCBwcm9ncmFtcyB0aGUgbW9kZSBzdHJhcCByZWdp
c3RlcnMgdGhyb3VnaCB0aGUgU2t5MQ0KUzUgc3lzdGVtIGNvbnRyb2xsZXIgKGNpeCx1c2Itc3lz
Y29uKSBhbmQgcmVnaXN0ZXJzIHRoZSBDYWRlbmNlIGNvcmUgYXMNCmEgY2hpbGQgZGV2aWNlLg0K
DQpQYXRjaCAzIGFkZHMgdGhlIFNvQyBub2RlcyBhbmQgZW5hYmxlcyBVU0I0IGFuZCBVU0I1IGlu
IGhvc3QgbW9kZSBvbg0KdGhlIFJhZHhhIE9yaW9uIE82IGJvYXJkLg0KDQpUZXN0ZWQgb24gUmFk
eGEgT3Jpb24gTzYgKFNreTEpOiBib3RoIGNvbnRyb2xsZXJzIHByb2JlLCB4SENJIGlzDQpyZWdp
c3RlcmVkIGFuZCBVU0IgMy54IGRldmljZXMgZW51bWVyYXRlLg0KDQpQYXRjaCAzIHJlZmVyZW5j
ZXMgdGhlIFBIWSBwaGFuZGxlcyBwcm92aWRlZCBieSB0aGUgQ0lYIFNreTEgVVNCMyBQSFkNCnNl
cmllcywgd2hpY2ggaXMgcG9zdGVkIHNlcGFyYXRlbHk7IGFwcGx5IHRoYXQgc2VyaWVzIGZpcnN0
Lg0KDQpUaGUgc2VyaWVzIGFwcGxpZXMgb24gdG9wIG9mIHY3LjQtcmMxLg0KDQpDaGFuZ2VzIHNp
bmNlIHY0Og0KLSBBZGRlZCB0aGUgTUFJTlRBSU5FUlMgZW50cnkgZm9yIHRoZSBnbHVlIGRyaXZl
ci4NCi0gRml4ZWQgY29udGludWF0aW9uIGxpbmUgaW5kZW50YXRpb24gcmVwb3J0ZWQgYnkgY2hl
Y2twYXRjaC4NCg0KSG9uZ2xpYW5nIFlhbmcgKDMpOg0KICBkdC1iaW5kaW5nczogdXNiOiBBZGQg
Q0lYIFNreTEgVVNCU1NQIGNvbnRyb2xsZXINCiAgdXNiOiBjZG5zMzogQWRkIENJWCBTa3kxIGds
dWUgZHJpdmVyDQogIGFybTY0OiBkdHM6IGNpeDogQWRkIFVTQjQvVVNCNSBub2RlcyBmb3IgU2t5
MQ0KDQogLi4uL2JpbmRpbmdzL3VzYi9jaXgsc2t5MS11c2Jzc3AueWFtbCAgICAgICAgIHwgMTUy
ICsrKysNCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDIgKw0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvY2l4L3NreTEtb3Jpb24tbzYuZHRzICAgICB8ICA0
MiArDQogYXJjaC9hcm02NC9ib290L2R0cy9jaXgvc2t5MS5kdHNpICAgICAgICAgICAgIHwgIDk1
ICsrKw0KIGRyaXZlcnMvdXNiL2NkbnMzL0tjb25maWcgICAgICAgICAgICAgICAgICAgICB8ICAx
MyArDQogZHJpdmVycy91c2IvY2RuczMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgICAx
ICsNCiBkcml2ZXJzL3VzYi9jZG5zMy9jZG5zcC1za3kxLmMgICAgICAgICAgICAgICAgfCA3MTYg
KysrKysrKysrKysrKysrKysrDQogZHJpdmVycy91c2IvY2RuczMvY2Ruc3Atc2t5MS5oICAgICAg
ICAgICAgICAgIHwgMTI4ICsrKysNCiA4IGZpbGVzIGNoYW5nZWQsIDExNDkgaW5zZXJ0aW9ucygr
KQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
dXNiL2NpeCxza3kxLXVzYnNzcC55YW1sDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdXNi
L2NkbnMzL2NkbnNwLXNreTEuYw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3VzYi9jZG5z
My9jZG5zcC1za3kxLmgNCg0KDQpiYXNlLWNvbW1pdDogNjYyOGU3ZDRjNmIyNWM4ZDE4ZjEzNDVl
M2EyMGQyMTgyOWFhZTdlNA0KcHJlcmVxdWlzaXRlLXBhdGNoLWlkOiA0MjJkYTZlYzA2NTYxNzNj
ZDMwOGJhZjY3MjVhN2RhYmZlZGIwOTIzDQpwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDRmNDUwNDhi
ZTJjMjQyMjgyNjhlMzI0ODFhNjM3MjQ4ODRiMGNlMDINCnByZXJlcXVpc2l0ZS1wYXRjaC1pZDog
ZDFmYThhZWM5ZGU3NWU4YTJiNzdjZjAxYjY1MzczODI1NzQ5YmFhMg0KLS0gDQoyLjU0LjA=
