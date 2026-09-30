Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010001.outbound.protection.outlook.com [52.101.84.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965191FFC48;
	Wed, 30 Sep 2026 02:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790735976; cv=fail; b=IyyUL1bPGrG2Yt9pA/TYckhNBHviUYJa2/863xncA8iuECwrFqUk4UzKwY1hxLi0qojV440f2VsPM096E4AYCQ0oKxuBzRlfA3YuUXyZsp2XO+CiWGiVHwy6HMdS+M4hYZmF4w7jTo0o5CxqximO19Gf8vKf8hO2odQjQcx8iAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790735976; c=relaxed/simple;
	bh=48wNLjDNWqkvlg67sMWn+Qp5aOcQHBFdKI4CnTV0yrc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ENCPW5J0QzDucKZVowFWoKjwfsq+KThHk2+K+mMhFgqNyvSkWqRub7X7hnxL1MmMOnI4hn06+7mzSuaLhCJWeSD4w7ZikgOdFbW2UonXJjIJHsPUNZBmg5FoscnBee+x3LgmFxf6fxNCFwqPn76D5yNbCyKA9hnzWhgOmdrg2uM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jdjLV3wY; arc=fail smtp.client-ip=52.101.84.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jdjLV3wY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T5beVV4o0jMgYBZDWukiouit6j+DUkYV9d3H36wKVB+ip5pPddm9upaspulVbg+fYH4wR7sUZPUssyWr/CV/KdEVbhQZwb7ujJVGRsxTMf542MAT2JiL5a0bnw/ZSZleNGvy6hwdc27f/aDfyqIrwjQ40SpqsuJlmDFPwIMstwVJK8dFfeIoeZ8B1regUEouEax+XdW/uMcS1EJxLJLbFefJtVzk6ulS4kAgeLRB7sGKt0v+pgKNWD180jBrFKZAiLgzyukzYgLe3Va3uR9+58wtJFiQFphMHMYXIVIdHSxcKePRbr3dDYShn4gVC+Ya2l6A8I6ZiPJOL0/vXIjHrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48wNLjDNWqkvlg67sMWn+Qp5aOcQHBFdKI4CnTV0yrc=;
 b=gLOk4DuEFU5ySG0CpuFE3EHByaeTbu/OeNfw0hYfp6cOTQQN+GWQaDw/eJFUO5TDaiBCWoyuP6SxL7zQOz/noJ7irhZv+I7+KZQi+3glKnua8MMIBd063ampo8/Zc1AXNeWS6LXgu0hzink032coaoaW7vj8eE0UeqJnec+prMR3ED43m5t2E6ysP2f1G24AtuefUFa/0rBuj+xNN7akfufZ2JaXXLR3ZJky+44IC7ORv8cUIdj8bvxg8Z8XrkDRw+QDs681EDY0GXE2XDxyT1IFcfFhQTqOIC+ycE9neZxCPQtlbbahCIfxsNfurzVJOy1Gl9D1gc3iRreXZ2hSHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48wNLjDNWqkvlg67sMWn+Qp5aOcQHBFdKI4CnTV0yrc=;
 b=jdjLV3wYglb0myyZA9QtDIcBdwky2OS+KCKO18q5BTTV8wwQa1srr9Ke5JLpAT4oESArrcEVsWlF2D+le+D1+YFyCksAqugkBXyvHX8Ckz0cN0uhFthuBQmbiPN63v1bErLxlzP7tQf/ecNPWxzwTfF6RPSOkXPoToa6Q8jSUb21IOVktymjWL9BdxpfiVqTQgIZUFRrJSayK9cHznKh0anc8HUEXnC2UxWfqR8v23fQKfbiuDzWYkXlP4Uj0wPPHCI1ewFpJE91Vxq++ggIHjTSuTNyEDqDp0idXjPf1bWI/Tin1hU1TqriBA8yPQcr71wEqRXrw4+w/9VQ9LPpGw==
Received: from AMBPR04MB335523.eurprd04.prod.outlook.com
 (2603:10a6:20b:7db::5) by DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 02:39:29 +0000
Received: from AMBPR04MB335523.eurprd04.prod.outlook.com
 ([fe80::de1e:8baa:a70f:1813]) by AMBPR04MB335523.eurprd04.prod.outlook.com
 ([fe80::de1e:8baa:a70f:1813%2]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 02:39:29 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Frank Li
	<frank.li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Loic
 Poulain <loic.poulain@oss.qualcomm.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: RE: [PATCH v4 07/11] media: imx8-isi: Select MSB-aligned RAW input
 from pixel link on i.MX95
Thread-Topic: [PATCH v4 07/11] media: imx8-isi: Select MSB-aligned RAW input
 from pixel link on i.MX95
Thread-Index: AQHdT+9Zni85qYZHS06ZyxjKmxILBLblnpMAgADJ2OA=
Date: Wed, 30 Sep 2026 02:39:29 +0000
Message-ID:
 <AMBPR04MB33552339734BB7E14CCC940412FA8B2@AMBPR04MB335523.eurprd04.prod.outlook.com>
References: <20260929-isi_imx952-v4-0-e69f89c7c651@oss.nxp.com>
 <20260929-isi_imx952-v4-7-e69f89c7c651@oss.nxp.com>
 <arvLxIDg9Z85BQL9@SMW015318>
In-Reply-To: <arvLxIDg9Z85BQL9@SMW015318>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-09-30T02:33:58.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBPR04MB335523:EE_|DB9PR04MB9626:EE_
x-ms-office365-filtering-correlation-id: d144c0d9-4fb9-4f90-f453-08df1e9c0d4e
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|23010399003|19092799006|1800799024|10067099003|56012099006|11063799006|3023799007|4143699003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 UJmpxwjmm80/SAiGQEpvAHtRyVZEZSknu2D0oqGjPTEWOFKoGWtKo3pdYxkNujo27AtJ1JcGhPNy3m84EoOYo4vg1EO5Imx621l/YAS4BCLNPa9IuXGbknchYhEtycIEoERRPQOTOgFIORLHy5GfBTbejkutvzZDnoinzQ0ZgXcSegUfz4oGWGXrYfCbTjOyIjxNzKGZ9D38tRvaUpDH2lXNvTIh9qb2YvkHys9GHA2IX1t6cavo6l975Lph9Y9jZnS2ZdplSrw05H2q4hj54xpiddj3ojY4A5WqnZInl9IoNDXcrt46aRXXE7p67dZ7+oHUYOMyXu43pWl+aQxJV0yfZC+yvshwRKnJC1rmh9rXuGSFv5+EqBSk0CpUy3G+K+4x9D5378Bz/91GOFPxAjflhD/OrZF3vW18kEKVFk3q0WbGxzb5LnzX1+vpOCj8cY/iwC/ShFQyx+Ql0VU/p+KyMiCgpSVn8Rmupb5SEmTBXn7L/wsXNPrj9k1DFGGUXD5gUI/R7NVgVptaFj54tH57RHEoz1XTCrTpbNWIkMuLNSGLzcMNlzgeUYpsBfbFjEM9/sWEY7YOAdjC2L6xJUqM+5T06PVTmMzaoR+7qgazH/tXcNLNCt10zrnVo6dK5MvdtgXVdO15Y8hqeILkF6go+QMvef/UZpSWqoK/sNE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB335523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(19092799006)(1800799024)(10067099003)(56012099006)(11063799006)(3023799007)(4143699003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bjdGYXoyMkVpNG9YUTM1OUlTWkFHZE8xSWIrb2Nobk45MUdrODUvWkxVTzR1?=
 =?utf-8?B?dlQvZFQ3UEdVblgzQXZPMTk2RTJnMEVvMWc5RjNoL1QrZDZKOTBlNjZtcDRB?=
 =?utf-8?B?QTdzcHNvOU5GWHlHYndGUldZcDBjVWwzSm5VSE1oSkwydmkycy8wVDQ5NmpW?=
 =?utf-8?B?SzU4RURDQ0dKVVRjN0xSbjNTNXFTRStaSEZqSlFwSngyckxuL1BjdFdGN0o0?=
 =?utf-8?B?M3VEVTVOSSs4TVRsODZQSGQ5ZU10WVdabjVLTWdOUmR1SXpXbzZCcUpsMUI3?=
 =?utf-8?B?ZGFLcnJUaGVxaTgreDFzKzB4OVQ0bUtOU1Q0cHo0ZzR5amFvV2ljQkZqbndB?=
 =?utf-8?B?b1poUndSOGZRZ3p1aFFodUJLMThMeWdUSzlrT0lzR0NRTnAxeXhqM2cxcWxR?=
 =?utf-8?B?Z0Vyai9CZkpRMVpSOEgrdzI5T29xUTNwSElEWU1KWEROSGU5eXlDdmJrTTJp?=
 =?utf-8?B?aG5pRWRNeWpmbCtXZTRlYnhNUVpWSGlCUklKZG1HUitrY0d2c3ZLNGs3YlB3?=
 =?utf-8?B?Q25ldnhNTXk4MzhIbXU1ZUNsYm9hM2lGaFY5eFg1Rkt4MU9RU05UekMrRHRh?=
 =?utf-8?B?RFRRZXAwM2NseTFlSldYNWJJOUNWQ1pkQ0VTRU56angxMjk0ZDhOQXlzbXFp?=
 =?utf-8?B?WmlQZ2dnUGhZZ2s4bHhkK0dnOU9KYnVwaSt3TFNIeWhFM1YveWtLR1g2MGc1?=
 =?utf-8?B?bVRXVEhwdVpxSWc0SG0xMmRwNzg4Q1MyT1BiR1RvM0RQb3JRc3VVTWtuMWNk?=
 =?utf-8?B?azkxaE9ZQXFKRGVFcU1WN1F0SFZwNDFMcmVSTDVlbXdFQTZaRWxXcjlPSTdo?=
 =?utf-8?B?S2owZlhJZCtLWFBybEE1OHJmNW1USGFCZVpZRzM5Q3hBaFJPZ0svNEFoTFdo?=
 =?utf-8?B?OUJ3alB3c0xlTFhsKzY0QlhTR2dNbndJWHl1ZnFaTGJFaXg4eHZKYjZuVGts?=
 =?utf-8?B?VENrbkZBSW1nSHJtQ0hCTnZ0eTJUcUMxQUpuY2hiaVpqcUQxVytEWUpDYURt?=
 =?utf-8?B?Zkt1YWxJQVUzVFlJRVE3ME5ER09wZ2JXcm5FZTdWMWVXYnc5MnRzMytTcWQ0?=
 =?utf-8?B?YVI3cVg0SEVRMzM4Nnp1cG5pYlNTNFlVRDZxRkY1TTRQYmZqUk1pTTgvV0JE?=
 =?utf-8?B?aGVsNjNSSnYvSDZxTXBVakNPU2t1anF0MVRtTDZDN0tFUjlnbFVuSDV4V1Y1?=
 =?utf-8?B?bU5CVUhBbldxczIxczg3bUd6WFlkWmR3OFJiTUZ5T0dkVDlPUlYzUFpBOEJH?=
 =?utf-8?B?MUhadXVWOEJHUjZ4WTFuR21oLzF3eTJ3aFlVSGVteGVhT2UyTHp0THhMZUc3?=
 =?utf-8?B?Tms0MmlIbnZvYjlyQ2NVazhBWmpwcjJOWHBpN213b3FZSjFZUVJpdG5iVGlM?=
 =?utf-8?B?VzUwbWpIZWkxNnVLUkZzMEVwMWtyZ3pqWG5NcXF5aDNMelB1MzJBUFZtVXI3?=
 =?utf-8?B?QjAyTnQrcmRhcyswLzl6TXE1M244T3FlbDBud09CZGJCenpIMDVJSUlZTFBs?=
 =?utf-8?B?OEpRMTVNeHRJbjEvYXpuL09KMUF2Z2RiSVV5dVh3eForaEcyekVVaG9yc3My?=
 =?utf-8?B?QmE1UWx2U1UzMlZWcEFScEFKWHByVlNJRmdib0puYzYzWXdaSVBNZDRsUTVo?=
 =?utf-8?B?YWFKcko3d2U1Y1ZlQ1VNbjdudG9qYmxCd2F6Ri9FQjdmd1J0djdUbzdndmVW?=
 =?utf-8?B?cUJiUDkzdm4vYlRXSDNrMmhKekRmdEhOVHpCT3pOQnV2UjhTbEIxcWRiUmdn?=
 =?utf-8?B?azZKVCtVblh0T21aeS90VmZZYkM2bHJRSmZIVzVxUXozRFpINEVDQzJhNzJp?=
 =?utf-8?B?S3dvQzg4ZkJ6bkVXa1dWdE9ybE1VY1RId3hEOUxOK1NCR200cFRUTEJBWElC?=
 =?utf-8?B?Z2N0bDZFVkpHVHpIVjcyL2tFeCs0blF6OFRGUGZaVThGT2c2VmpSUklPRGx2?=
 =?utf-8?B?RVFnd3VSTGFEUGdPWTBGSDV4TmQyRERtbzdVYmNXd1Q0aURCa3FtRWJMQXFl?=
 =?utf-8?B?N0E5ck1yb05mcjRMNTVjbldlM3JITzJHY29Ja3N5Z2hHMWR3THNTeER0SXRa?=
 =?utf-8?B?UkJkcWR3ZXlVZm9EYlRqWFZzUVJFd0N5YUdMT2RVOU1mYlQzNzJwMzNLc0N6?=
 =?utf-8?B?c3k3M1VmMjJKUmNTOW5XemNtVkNwRktQWVpJUGNqWjJIY1dreTJvMHN1MklI?=
 =?utf-8?B?c0o2bGJDL3B2Q1hEMG1hYW5LYXJXdGl6TlhqTzZ5ckppUTAxSytZOUN0d0J5?=
 =?utf-8?B?NTc4OGdyZ1JMVEpELzhneVNQQ2VVV0RkSnp4bFFveTJheG1KNHVCMUtZaHpz?=
 =?utf-8?B?NGRuVjJsVFllZElESDl3a2NHRlpqVE1IeUdhWk00SC8wT0R2RGVCZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB335523.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d144c0d9-4fb9-4f90-f453-08df1e9c0d4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2026 02:39:29.6667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HYbDypxWW5TpW4Ne2ygEZpJFSWGwMi+w5C2KSML/1QwkLQjM0r/TMkNgbuQgR6G6Na7ZAXAuDIOE6X6buXjo8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9626

SGkgRnJhbmssDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcuDQoNCg0KTlhQIENvbmZpZGVudGlh
bA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBGcmFuayBMaSAoT1NTKSA8
ZnJhbmsubGlAb3NzLm54cC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAyOSwgMjAy
NiAxMDozMiBQTQ0KPiBUbzogRy5OLiBaaG91IChPU1MpIDxndW9uaXUuemhvdUBvc3MubnhwLmNv
bT4NCj4gQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJk
LmNvbT47IEZyYW5rIExpDQo+IDxmcmFuay5saUBueHAuY29tPjsgTWF1cm8gQ2FydmFsaG8gQ2hl
aGFiIDxtY2hlaGFiQGtlcm5lbC5vcmc+OyBTYXNjaGENCj4gSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0
cm9uaXguZGU+OyBQZW5ndXRyb25peCBLZXJuZWwgVGVhbQ0KPiA8a2VybmVsQHBlbmd1dHJvbml4
LmRlPjsgRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPjsgUm9iDQo+IEhlcnJpbmcg
PHJvYmhAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9y
Zz47IENvbm9yDQo+IERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz47IExvaWMgUG91bGFpbg0K
PiA8bG9pYy5wb3VsYWluQG9zcy5xdWFsY29tbS5jb20+OyBsaW51eC1tZWRpYUB2Z2VyLmtlcm5l
bC5vcmc7DQo+IGlteEBsaXN0cy5saW51eC5kZXY7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVA
dmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMDcvMTFdIG1lZGlhOiBp
bXg4LWlzaTogU2VsZWN0IE1TQi1hbGlnbmVkIFJBVyBpbnB1dA0KPiBmcm9tIHBpeGVsIGxpbmsg
b24gaS5NWDk1DQo+DQo+IE9uIFR1ZSwgU2VwIDI5LCAyMDI2IGF0IDA0OjUyOjI4UE0gKzA4MDAs
IEd1b25pdSBaaG91IHdyb3RlOg0KPiA+IFRoZSBJU0kgcmVjZWl2ZXMgUkFXIGRhdGEgZnJvbSB0
aGUgUGl4ZWwgTGluaywgd2hvc2UgYWxpZ25tZW50IGlzDQo+ID4gZGV0ZXJtaW5lZCBieSB0aGUg
U29DIGludGVncmF0aW9uLiBCZWZvcmUgaS5NWDkzLCB0aGUgUGl4ZWwgTGluaw0KPiA+IHByb3Zp
ZGVzIExTQi1hbGlnbmVkIFJBVyBkYXRhIHRvIHRoZSBJU0kuIFN0YXJ0aW5nIHdpdGggaS5NWDkz
LCBib3RoDQo+ID4gTFNCIGFuZCBNU0IgYWxpZ25tZW50IGFyZSBzdXBwb3J0ZWQgYW5kIGNhbiBi
ZSBzZWxlY3RlZCB2aWENCj4gPiBDSE5MX0NUUkxfUkFXX0lOX01TQl9BTElHTiwgd2l0aCB0aGUg
ZGVmYXVsdCBrZWVwaW5nIExTQiBhbGlnbm1lbnQNCj4gZm9yDQo+ID4gYmFja3dhcmQgY29tcGF0
aWJpbGl0eS4gRnJvbSBpLk1YOTUgb253YXJkcywgdGhlIENTSSBmb3JtYXR0ZXINCj4gPiByZXBs
YWNlcyB0aGUgZ2Fza2V0IGFuZCBvbmx5IHByb3ZpZGVzIE1TQi1hbGlnbmVkIFJBVyBkYXRhLg0K
PiA+DQo+ID4gU2V0IENITkxfQ1RSTF9SQVdfSU5fTVNCX0FMSUdOIG9uIGkuTVg5NSBzbyB0aGUg
SVNJIHNlbGVjdHMgUkFXDQo+ID4gc2FtcGxlcyBmcm9tIHRoZSBoaWdoIGJpdHMgb2YgdGhlIFBp
eGVsIExpbmsgYnVzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogR3Vvbml1IFpob3UgPGd1b25p
dS56aG91QG9zcy5ueHAuY29tPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgaW4gdjQ6DQo+ID4gLSBO
ZXcgcGF0Y2gNCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1p
c2kvaW14OC1pc2ktaHcuYyAgIHwgMjANCj4gKysrKysrKysrKysrKysrKysrKysNCj4gPiAgZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktcmVncy5oIHwgIDEgKw0K
PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4LWlzaS9pbXg4LWlzaS1ody5jDQo+
ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4LWlzaS9pbXg4LWlzaS1ody5jDQo+
ID4gaW5kZXggY2M1MmE5MGMyNDc3Li5iM2YzMmI5Nzk2ZDUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktaHcuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLWh3LmMNCj4gPiBA
QCAtMzAzLDYgKzMwMywyMiBAQCBzdGF0aWMgdm9pZA0KPiBteGNfaXNpX2NoYW5uZWxfc2V0X3Bh
bmljX3RocmVzaG9sZChzdHJ1Y3QgbXhjX2lzaV9waXBlICpwaXBlKQ0KPiA+ICAgICBteGNfaXNp
X3dyaXRlKHBpcGUsIENITkxfT1VUX0JVRl9DVFJMLCB2YWwpOyAgfQ0KPiA+DQo+ID4gKy8qDQo+
ID4gKyAqIFRoZSBJU0kgcmVjZWl2ZXMgUkFXIGRhdGEgZnJvbSB0aGUgUGl4ZWwgTGluaywgd2hv
c2UgYWxpZ25tZW50IGlzDQo+ID4gKyAqIGRldGVybWluZWQgYnkgdGhlIFNvQyBpbnRlZ3JhdGlv
bi4gSXQgb3JpZ2luYWxseSBzZWxlY3RlZCBSQVcNCj4gPiArc2FtcGxlcw0KPiA+ICsgKiBmcm9t
IHRoZSBsb3cgYml0cyBvZiB0aGUgUGl4ZWwgTGluayBidXMuIFN0YXJ0aW5nIHdpdGggaS5NWDkz
LA0KPiA+ICsgKiBDSE5MX0NUUkxfUkFXX0lOX01TQl9BTElHTiB3YXMgaW50cm9kdWNlZCB0byBh
bGxvdyB0aGUgSVNJIHRvDQo+ID4gK3NlbGVjdA0KPiA+ICsgKiBSQVcgc2FtcGxlcyBmcm9tIGVp
dGhlciB0aGUgaGlnaCBvciBsb3cgYml0cywgYXMgYm90aCBMU0IgYW5kIE1TQg0KPiA+ICsgKiBh
bGlnbm1lbnQgY2FuIGJlIHNlbGVjdGVkIGluIHRoZSBnYXNrZXQuDQo+ID4gKyAqDQo+ID4gKyAq
IE9uIGkuTVg5NSwgdGhlIENTSSBmb3JtYXR0ZXIgcHJvdmlkZXMgTVNCLWFsaWduZWQgUkFXIGRh
dGEsIHNvIHRoZQ0KPiA+ICtJU0kNCj4gPiArICogbXVzdCBzZWxlY3QgUkFXIHNhbXBsZXMgZnJv
bSB0aGUgaGlnaCBiaXRzIG9mIHRoZSBQaXhlbCBMaW5rIGJ1cy4NCj4gPiArICovDQo+ID4gK3N0
YXRpYyBib29sIGlzaV9yYXdfaW5fbXNiKGNvbnN0IHN0cnVjdCBteGNfaXNpX3BsYXRfZGF0YSAq
cGRhdGEpIHsNCj4gPiArICAgcmV0dXJuIHBkYXRhLT5tb2RlbCA9PSBNWENfSVNJX0lNWDk1Ow0K
Pg0KPiBDYW4geW91IGFkZCBib29sIGluIHBsYXRfZGF0YSB0byBhdm9pZCBjaGVjayBtb2RlbD8g
SW4gY2FzZSBmdXR1cmUgb3RoZXIgY2hpcA0KPiBhbHNvIHVzZSBtc2IgYW5kIGNvbXBsZXggY2hl
Y2sgbG9naWMgaGVyZS4NCg0KSSB1c2VkIHRoZSBtb2RlbCBmaWVsZCBoZXJlIHRvIGJlIGNvbnNp
c3RlbnQgd2l0aCB0aGUgYXBwcm9hY2ggc3VnZ2VzdGVkIGJ5IExhdXJlbnQNCmR1cmluZyB0aGUg
djIgcmV2aWV3Lg0KDQpJbiB2MiwgSSB1c2VkIGEgQm9vbGVhbihib29sIHJhd19vdXRfbHNiKSBp
biBwbGF0X2RhdGEgdG8gZGV0ZXJtaW5lIHdoZXRoZXIgdGhlIElTSSBSQVcNCm91dHB1dCBzaG91
bGQgYmUgTFNCLWFsaWduZWQsIGFuZCBMYXVyZW50IHN1Z2dlc3RlZCB1c2luZyB0aGUgbW9kZWwg
ZmllbGQgaW5zdGVhZC4gQmFzZWQNCm9uIHRoYXQgZmVlZGJhY2ssIEkgZm9sbG93ZWQgdGhlIHNh
bWUgYXBwcm9hY2ggaGVyZSBmb3IgdGhlIFJBVyBpbnB1dCBhbGlnbm1lbnQuDQoNClBsZWFzZSBz
ZWUgdGhlIGRpc2N1c3Npb24gaGVyZSBmb3IgbW9yZSBkZXRhaWxzOg0KaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYWxsLzIwMjYwOTE1MDAwNTIwLkdCMjgwNDc0OEBraWxsYXJhdXMuaWRlYXNvbmJv
YXJkLmNvbS8NCg0KQmVzdCBSZWdhcmRzDQpHLk4gWmhvdQ0KDQo+DQo+IEZyYW5rDQo+DQo+ID4g
K30NCj4gPiArDQo+ID4gIHN0YXRpYyB2b2lkIG14Y19pc2lfY2hhbm5lbF9zZXRfY29udHJvbChz
dHJ1Y3QgbXhjX2lzaV9waXBlICpwaXBlLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGVudW0gbXhjX2lzaV9pbnB1dF9pZCBpbnB1dCwNCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgdmMsDQo+ID4gQEAgLTM1Nyw2ICsz
NzMsMTAgQEAgc3RhdGljIHZvaWQgbXhjX2lzaV9jaGFubmVsX3NldF9jb250cm9sKHN0cnVjdA0K
PiBteGNfaXNpX3BpcGUgKnBpcGUsDQo+ID4gICAgICAgICAgICAgICAgICAgICB2YWwgfD0gQ0hO
TF9DVFJMX1ZDX0lEXzEodmMgPj4gMik7DQo+ID4gICAgIH0NCj4gPg0KPiA+ICsgICAvKiBTZWxl
Y3QgTVNCLWFsaWduZWQgUkFXIGRhdGEgZnJvbSB0aGUgUGl4ZWwgTGluayB3aGVuIG5lZWRlZC4g
Ki8NCj4gPiArICAgaWYgKGlzaV9yYXdfaW5fbXNiKHBpcGUtPmlzaS0+cGRhdGEpKQ0KPiA+ICsg
ICAgICAgICAgIHZhbCB8PSBDSE5MX0NUUkxfUkFXX0lOX01TQl9BTElHTjsNCj4gPiArDQo+ID4g
ICAgIG14Y19pc2lfd3JpdGUocGlwZSwgQ0hOTF9DVFJMLCB2YWwpOw0KPiA+DQo+ID4gICAgIG11
dGV4X3VubG9jaygmcGlwZS0+bG9jayk7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLXJlZ3MuaA0KPiA+IGIvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktcmVncy5oDQo+ID4gaW5kZXggNWY2NmI3
YzljZDFjLi4zNTQzOGFiZjMxNzIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktcmVncy5oDQo+ID4gKysrIGIvZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktcmVncy5oDQo+ID4gQEAgLTIwLDYgKzIw
LDcgQEANCj4gPiAgI2RlZmluZSBDSE5MX0NUUkxfQ0hBSU5fQlVGX05PX0NIQUlOICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDANCj4gPiAgI2RlZmluZSBDSE5MX0NUUkxfQ0hBSU5fQlVG
XzJfQ0hBSU4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDENCj4gPiAgI2RlZmluZSBD
SE5MX0NUUkxfU1dfUlNUICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVQoMjQp
DQo+ID4gKyNkZWZpbmUgQ0hOTF9DVFJMX1JBV19JTl9NU0JfQUxJR04NCj4gICAgICAgQklUKDIy
KSAvKiBpLk1YezkxLDkzLDk1fSAqLw0KPiA+ICAvKg0KPiA+ICAgKiBDSE5MX0NUUkxfQkxBTktf
UFhMOiBpLk1YOHtRTSxRWFB9IG9ubHkNCj4gPiAgICogQ0hOTF9DVFJMX1ZDX0lEXzEsIENITkxf
Q1RSTF9WQ19JRF8xX01BU0s6IGkuTVg5NSBvbmx5DQo+ID4NCj4gPiAtLQ0KPiA+IDIuMzQuMQ0K
PiA+DQo+ID4NCg==
