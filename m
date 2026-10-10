Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010067.outbound.protection.outlook.com [52.101.84.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11484339B3D
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791620813; cv=fail; b=f2OxNEVP7nqXKE96QiE7gIN+5P3LZJlqA27muyoArQiQksQzBOCokYueg+iw8VPIFSQpd7eoztDQbuZC3NMq3XMi73ABeGpgbZuyy8GzhEBfdEcBo2XLmbfZbivdm3sV95vgH1od9W25KeG7ppYgBsHBU5S6+jHLgtQ2HjkbDRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791620813; c=relaxed/simple;
	bh=eXS6vfn7bIpGU+fESckBW7gLjrdBVio0x+aiTPu4zKk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C2uVX1FsJN2WnviCTexJm662mKS0pPZljp4FIFe9Qa5XM5fSN3KspdgcylDoiMB4xWkZs/Clf9a4bzbq72sF3SE6Ue6L8Pr4+4yDZ/gt6GL1Q8n94r0ie8pONkOC7jNtfLiISR7pwiwotVEzfA7KiF9dJaGiKbZ65rsGVXNjczs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nogSwgHH; arc=fail smtp.client-ip=52.101.84.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nogSwgHH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PihmlSLNSEPUCjI2x8uQdwNpqfQQIDZNZpanAa0nqgJFE3aclSCpH23NNAzP9QQWuu7EVH1z3TxaGerp9LGatI685qaKR4/S1AxvODmUbV/ElmX2A+gqaCv6qoq9vkz2BLt2itjnDngFY/1OcNg4efXQBw7u0U8vSq+ZMwa6v1IvdGK8LTyee2AlHJYYX8GF6gUlDsyDF9DMmKNVZYn2e+dpP1MmL5UnywUV+iBQGf4yLsz3aS2mmkL1VecvYzGCHtKJuIQwrjcNTJM1WPF+SO9uPzF5FMex/iXBngi1KT7cujvJ00JZt9TCgaN+DoinNHDhWhYGVKtC7OanKxZuow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eXS6vfn7bIpGU+fESckBW7gLjrdBVio0x+aiTPu4zKk=;
 b=pb754xGER5c4aUWo04wYnI+pmTUSVFidKp41pGZljfh35zZjVdoyZedknXgVixurSzNXQ9DznEOIuXDRPHJpxfcaoVXIbn/Rn23YivAJJXs4wdFiAY+P1HcTcqyY5Yf6OSGIFN0B1DWtVmy3f0bkMQcPWfuQtriVOCLAorFCSVtuPth6Es8kt9Wrn3+TifHpILeFe2QI2xbgwXED4WDA5YYH9qBdwkD5xjDkeqVrlYo0tOJ2AREomG0Yr/Zc6pFHoN/V6LMrJEa2x/SIVrkPpjoLt9g8RebDfmTkj+G5TFR1AkTTkpwwqTR784WNY+eHMA4fHZ4pSEl55qDBgd5jzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eXS6vfn7bIpGU+fESckBW7gLjrdBVio0x+aiTPu4zKk=;
 b=nogSwgHH1cEgTJAjf/WCSgk0xQ+XZnRQVF2Mi+RQzxEXWg8iBh/pze6krYvFCiKhn70F6cCrZI7gSXfr2K+6Zf7AulRl3ufNf9POA5uhay1KlNCWRY5Js4BgOSeEA8hnwdycsMZEYdj+UmSVbuR4VWBhh8TllLvRyQ75q6vfYuWRC+0B/FQvugKKfK/1R0SWan2Fn+2ZUR4kdvBuKzKI23HaaSyHYSp2IcHncCan4Fug3CLXMU63WyJOfftYnyLX5DH6PfChbxdHb65exv7ILQHeeHHAHvrBPfnmCq2C9DN5vLGnYE4C7sEuOsyOrCJgrTm+l4E/VBt3vl9/qlg1aA==
Received: from VI0PR04MB12350.eurprd04.prod.outlook.com (2603:10a6:800:30f::9)
 by GV2PR04MB11446.eurprd04.prod.outlook.com (2603:10a6:150:2b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Sat, 10 Oct
 2026 08:26:45 +0000
Received: from VI0PR04MB12350.eurprd04.prod.outlook.com
 ([fe80::5a14:6ce3:f50:495e]) by VI0PR04MB12350.eurprd04.prod.outlook.com
 ([fe80::5a14:6ce3:f50:495e%4]) with mapi id 15.21.0496.017; Sat, 10 Oct 2026
 08:26:44 +0000
From: "Zhipeng Wang (OSS)" <zhipeng.wang_1@oss.nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "Zhipeng Wang (OSS)"
	<zhipeng.wang_1@oss.nxp.com>
CC: Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>, Frank Li
	<frank.li@nxp.com>, Radu Rendec <radu@rendec.net>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Jindong Yue <jindong.yue@nxp.com>,
	Xuegang Liu <xuegang.liu@nxp.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v6 4/9] irqchip/imx-irqsteer: Convert to
 devm_pm_runtime_set_active_enabled()
Thread-Topic: [PATCH v6 4/9] irqchip/imx-irqsteer: Convert to
 devm_pm_runtime_set_active_enabled()
Thread-Index: AQHdVwPob9a7fzEWtUOKOELBAOYCT7b0HL4AgAJWA2A=
Date: Sat, 10 Oct 2026 08:26:44 +0000
Message-ID:
 <VI0PR04MB12350BD5EF98B9EC922D797F0EB912@VI0PR04MB12350.eurprd04.prod.outlook.com>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
 <20261008090231.796511-5-Zhipeng.wang_1@oss.nxp.com>
 <asf_9lgB-ULFooH9@SMW015318>
In-Reply-To: <asf_9lgB-ULFooH9@SMW015318>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-10-10T08:21:47.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12350:EE_|GV2PR04MB11446:EE_
x-ms-office365-filtering-correlation-id: a99f9ce4-d517-49b1-2592-08df26a83819
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|19092799006|366016|261009220027099003|261009223027099003|38070700021|4143699003|11063799006|5023799004|261009223327099003|6133799003|10067099003|56012099006|261009221227099003|18002099003|22082099003|261009221727099003;
x-microsoft-antispam-message-info:
 WNhfID0NDdAxKoh0hynOvbAgelRKgFlr6pP+9i9+WfTv9bjV7s+Ei5PutZx2BWKsVn2y0lcmofr9O2BODWfdYEY5cFNkfBD+kcBmHvuig06VGpmXrQ3Sfkabb8aXnskvpRdPqe9fH1j9hT5udAKg15cE06YuQrWAQ2couXye3lZHNIlu3nxWJWKJ8Ea/VGdsncv2u/3KQwZ9TdWQ87BbAhNc7GwWXf4H1DDvBT8IqHzzAZe6dtOJmbc2C8DzFHfx6VlPZWPOqVPgf+CvFWsGSOF8ud4IzPg56cBTTFVfcPjZhOc8sSyBerQpxQ6scMfyka9qMDo3laSeBnMkoc6llrPol1sjZwTc6UJEXU5GYyCkMlor46g8g7bhg8hxaMQn0sbZy0mqsYIEu1tk3ctPXR83HNvnfIHq/n9syjzmv/ACIhDKV9tP05MDIxsnDPw+kRTi1o36nsnxHwFSIlCrlVxAvpECLqcpYOESpgvUMcIzNiDXL3HJPFax7e3Qlet79j5+ao4WtRBLrDpZke+/t+KGDru0wtY2lAPxzx96QE+29xaKA1gtkHD0Lkaqn8DI0DO1wcE55pomzInt3rmVjO+YEFinIFIC859cSq1+SPsj83qIJZl07xGVkDN2aFiXbTQe/JVDj3Hv2DzpMUKBhR+VCOKIB9hwtdvhbDjxMM8yzfGf72UUEEORZqh5+7mM2Wgbn/MokkZFHT+y8roEkXw5rWTLakvsqtm2lyI2o90=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12350.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(19092799006)(366016)(261009220027099003)(261009223027099003)(38070700021)(4143699003)(11063799006)(5023799004)(261009223327099003)(6133799003)(10067099003)(56012099006)(261009221227099003)(18002099003)(22082099003)(261009221727099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NkQzbElCYWRYUitWT1ZuZjdzY1E1UDlKN1ZVdzhDbEFHMkQzY0VhMVdlUWg1?=
 =?utf-8?B?Um9EREIxMlZzbHFjdUhOMFpzTG1samdHNFB6OXRIUlljTE45dGV6NThxb0o2?=
 =?utf-8?B?dlBVOGRLeFo2Nm9oZFpKSlZjQmFwYzU3bCtSZ0JEY3BDVGxYUVVZbGhtQ3I3?=
 =?utf-8?B?NHMvM2tuMm9oNDFxWksxM2R4Mm1iOHFmNE4wd29QdWtYNEdEUWphaEwxTFpE?=
 =?utf-8?B?R3duMTFzdkdWTnMrUDluZUhpZ0F3T0hXN0RvQzQ5YmxzVmVBZzc5YjAwVnU5?=
 =?utf-8?B?ejdvNVQ2QW9NRVZQUlEzZDVzR2M3RW1LYnFUZklNd1ZKT1NvSWJBc1NpR2RH?=
 =?utf-8?B?SE4ydlZNUWxITndneDJWMzI1c3h0bVJmMTJITEZ5dHBLcTVHMTRVN0dzOFJq?=
 =?utf-8?B?V1Rld09HZU5iUVBEaGdUc0FLNVMrUEs0Q0hVL1JCRVlnU09rRk8xaGFSV0c3?=
 =?utf-8?B?eER1eU5qSHpvdC9Qcit6OSs5cUFYWkgwNEZkL0E5U3RUd2lPU2R3dE54NWFy?=
 =?utf-8?B?bGJ2NHVYNlBCTUY1MStDNWhVVThZNEN0dWNnQlN0a3dRb1FuNC9xMGQ0eGxq?=
 =?utf-8?B?ZVF3aUZ4RURrbSt5MTkxS3VTSW1qOGtieXBqUTRTNFkrWUxVN00vSHpNQ3hU?=
 =?utf-8?B?NFpqOTc4OUNBaHNRYW92c09tYVQyRG5LNW1pNTVtSWlabUlXMndIaHFIWDRh?=
 =?utf-8?B?M1NyMUhscmNIWkVSbHdlend2WTZtYTQwK2MwMnhQT2JCUFgxZ0pKc093MjUv?=
 =?utf-8?B?VFQ3UFpKajdua1ZRcmYyVGpEQnN2L3VnRGJodk9kMThveUlRcVlyMlhIL2R2?=
 =?utf-8?B?WUl5OVdXUzNJNU5qS2Q4YjEreUNvamg4WlJQVS9TSXdkLys0am1aVG92bDBj?=
 =?utf-8?B?ZzZ0S2hRMFZNUVIxd1Iyd2dDYktEbTI3Rll3NnJ3OFlMMnQ1TDd6Y3NLclAx?=
 =?utf-8?B?YmQ2c1A0dUpGMUY0OHlvTzAxcllxdEdQMkN5Wi91WXpETi9OYmJZWHgvMkRs?=
 =?utf-8?B?T0Y1cXpkV3NORElNY29SSndvQW53OE8va09kWllxUlI2RG42UjM5VkhsMVZM?=
 =?utf-8?B?N0pXUnZ2YmZ6a0doL1V3SFhPckJUNmU5L2RkNDYwbmVJaS9nUlNjdlNjRVFD?=
 =?utf-8?B?aWlmWTRVYVpJK2pLUW9LU1FCMjA0WWU0TytRZU4xZDVycVl3czE4ZnJSTzlp?=
 =?utf-8?B?bTVXcXMxOVMxb09NZXprWUFRc21nWCtZUjBqc2NsT2M0ZG1janlaN2lQZGJJ?=
 =?utf-8?B?Y2pyaXdocDQ3VWVpanJzQSt5dmFOK2lweGNNWll4emJFcFE0OCthRWNaZkRq?=
 =?utf-8?B?YXAvVnBOOGkwRXRIc0NncERYMDFlbU1rU2pJMGQwM2VCTG55Yy9nRkt1dEJN?=
 =?utf-8?B?ejcxajJ1cnlxeEZTVXpDTGwzVVpKMmhLZ2lHYkVYeUpkd245eDZDMGpnVk1u?=
 =?utf-8?B?VlljSzJVdHVsWEVGc0RvZUlhM0RzaGMrc25nUHRZeTZLUUIwZDdpUUJjdzBU?=
 =?utf-8?B?cmhPOWpkSVlWWDJEbGNxZHU2SDdKODkvQW5wZFlJYlgyRnBEOGFVVGM1R0Fl?=
 =?utf-8?B?VVdDSHEwejV5TjlPQWM1U2lxdk96ZTdKUzErYkJTY3dJUFQ2OWx3SkJxMWc3?=
 =?utf-8?B?dHJGRW5zUDFkdVhhQ1NiRXZ5dnU4YWJHSm9YYlAxM0JCRG9yRXBQSWhZd0RN?=
 =?utf-8?B?ZFF0ZVV2ZzhiTDQzZUNBUzAxK2NvRTA3aktpaWROdm11c3VXREVNTmowV05u?=
 =?utf-8?B?b2IwRTB1dUc3SEZVbnJMSUFMZlNZWG1xdzN4NUo3a1NhUkM1U2xJOFBaamRK?=
 =?utf-8?B?SEc2YTQvUkJUQWhBdjhyTUJ6QVJheEVBMEdHbkVINHRMS3hWeXNTV3FYcVlV?=
 =?utf-8?B?U1pYamdyd1NIb2lSeWpqK21ncXkyWkhvQkdzYTNQN0JxeWdKNXowN0trQ3U5?=
 =?utf-8?B?MTJlSzFNams3eDNCME9oQTF3M3JoYVhJU1NiMlpKZlo0T3M3NXFOTm5aVGhx?=
 =?utf-8?B?SERtWDNBbFMvb1dRYTErRU9SM3VSVXQxT1AvbHUrTFFyK2tIeUM2R3czR2lP?=
 =?utf-8?B?ckgrUkR0YVpYeHQ4Ty8wSmNhTGIvSFQvcjgwT3QrbStCbnQzNFhRclMrM3li?=
 =?utf-8?B?YS9ZYWZ1RXA2VWVYdFBaZ2l6SVNJZXlBUkxaaW9ORjg5Zy9hRk5PeTRVTm1Z?=
 =?utf-8?B?M1d0UG16REhENDdQdDhxUGViQ0s3UWgvdlRQU3JtVnhBbzE5bFpkd2RGak9l?=
 =?utf-8?B?UjFBNk9iQittQkx6NUtMOFNSd0dGNmkrZmd6c1RuUlZyK2xTaHZMbXhiNThp?=
 =?utf-8?B?Z1hUYlozMXlhdGkzNkVXTEh5cVJnN1JmZjZxMlNaK2hpUThRZlhrUT09?=
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
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12350.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a99f9ce4-d517-49b1-2592-08df26a83819
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2026 08:26:44.7409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SAuodPjGMMFnbFw4TVt2CLCCNf/fthC1cF0dAQfZuaNY9kEqlFvytMgVb7XGlO78GEMeeYc7di5aYJb/VrvEvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11446

PiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDQvOV0gaXJxY2hpcC9pbXgtaXJxc3RlZXI6IENvbnZl
cnQgdG8NCj4gZGV2bV9wbV9ydW50aW1lX3NldF9hY3RpdmVfZW5hYmxlZCgpDQo+DQoNCk5YUCBD
b25maWRlbnRpYWwNCj4gT24gVGh1LCBPY3QgMDgsIDIwMjYgYXQgMDY6MDI6MjZQTSArMDkwMCwg
WmhpcGVuZy53YW5nXzFAb3NzLm54cC5jb20NCj4gd3JvdGU6DQo+ID4gRnJvbTogWmhpcGVuZyBX
YW5nIDx6aGlwZW5nLndhbmdfMUBueHAuY29tPg0KPiA+DQo+ID4gaW14X2lycXN0ZWVyX3Byb2Jl
KCkgZW5hYmxlcyBydW50aW1lIFBNIHdpdGggcG1fcnVudGltZV9lbmFibGUoKSwgYnV0DQo+ID4g
aW14X2lycXN0ZWVyX3JlbW92ZSgpIG5ldmVyIGRpc2FibGVzIGl0LiBSdW50aW1lIFBNIHRoZXJl
Zm9yZSBzdGF5cw0KPiA+IGVuYWJsZWQgYWZ0ZXIgdGhlIGRldmljZSBpcyB1bmJvdW5kLCBhbmQg
cmViaW5kaW5nIGl0IHRyaWdnZXJzOg0KPiA+DQo+ID4gICBVbmJhbGFuY2VkIHBtX3J1bnRpbWVf
ZW5hYmxlIQ0KPiA+DQo+ID4gVXNlIGRldm1fcG1fcnVudGltZV9zZXRfYWN0aXZlX2VuYWJsZWQo
KSBzbyB0aGUgZHJpdmVyIGNvcmUgbWFya3MgdGhlDQo+ID4gZGV2aWNlIGFjdGl2ZSAobWF0Y2hp
bmcgdGhlIGVuYWJsZWQgY2xvY2spIGFuZCBkaXNhYmxlcyBydW50aW1lIFBNDQo+ID4gYWdhaW4g
b24gdW5iaW5kLCBrZWVwaW5nIHRoZSBlbmFibGUgYmFsYW5jZWQgYWNyb3NzIHVuYmluZC9yZWJp
bmQuDQo+ID4NCj4gPiBUaGlzIGJlY29tZXMgcmVhY2hhYmxlIG9uY2UgdGhlIGRyaXZlciBjYW4g
YmUgdW5ib3VuZCBhbmQgcmVsb2FkZWQsDQo+ID4gYnV0IHRoZSBpbWJhbGFuY2UgYWxyZWFkeSBl
eGlzdHMgdG9kYXkgb24gdW5iaW5kLCBzbyBmaXggaXQgc2VwYXJhdGVseQ0KPiA+IHdpdGggYSBG
aXhlcyB0YWcgZm9yIHN0YWJsZS4NCj4gPg0KPiA+IEZpeGVzOiA0NzMwZDIyMzMzMTEgKCJpcnFj
aGlwL2lteC1pcnFzdGVlcjogQWRkIHJ1bnRpbWUgUE0gc3VwcG9ydCIpDQo+ID4gU3VnZ2VzdGVk
LWJ5OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBuYWJsYWRldi5jb20+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogWmhpcGVuZyBXYW5nIDx6aGlwZW5nLndhbmdfMUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+
ICBkcml2ZXJzL2lycWNoaXAvaXJxLWlteC1pcnFzdGVlci5jIHwgMTAgKysrKysrLS0tLQ0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+DQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtaW14LWlycXN0ZWVyLmMNCj4gPiBi
L2RyaXZlcnMvaXJxY2hpcC9pcnEtaW14LWlycXN0ZWVyLmMNCj4gPiBpbmRleCBkMDVkZTNkMjZm
YjIuLjVhY2MwNDUwNGU1MiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLWlt
eC1pcnFzdGVlci5jDQo+ID4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1pbXgtaXJxc3RlZXIu
Yw0KPiA+IEBAIC0yMzksNiArMjM5LDEwIEBAIHN0YXRpYyBpbnQgaW14X2lycXN0ZWVyX3Byb2Jl
KHN0cnVjdA0KPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gICAgIGlmIChpcnFzdGVlcl9o
YXNfY2hhbmN0cmwoZGF0YS0+ZGV2dHlwZV9kYXRhKSkNCj4gPiAgICAgICAgICAgICB3cml0ZWxf
cmVsYXhlZChCSVQoZGF0YS0+Y2hhbm5lbCksIGRhdGEtPnJlZ3MgKyBDSEFOQ1RSTCk7DQo+ID4N
Cj4gPiArICAgcmV0ID0gZGV2bV9wbV9ydW50aW1lX3NldF9hY3RpdmVfZW5hYmxlZCgmcGRldi0+
ZGV2KTsNCj4gPiArICAgaWYgKHJldCkNCj4gPiArICAgICAgICAgICBnb3RvIG91dDsNCj4gPiAr
DQo+ID4gICAgIGRhdGEtPmRvbWFpbiA9IGlycV9kb21haW5fY3JlYXRlX2xpbmVhcihkZXZfZndu
b2RlKCZwZGV2LT5kZXYpLA0KPiBkYXRhLT5yZWdfbnVtICogMzIsDQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmaW14X2lycXN0ZWVyX2RvbWFpbl9vcHMs
IGRhdGEpOw0KPiA+ICAgICBpZiAoIWRhdGEtPmRvbWFpbikgew0KPiA+IEBAIC0yNjAsOSArMjY0
LDYgQEAgc3RhdGljIGludCBpbXhfaXJxc3RlZXJfcHJvYmUoc3RydWN0DQo+ID4gcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQ0KPiA+DQo+ID4gICAgIHBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGRh
dGEpOw0KPiA+DQo+ID4gLSAgIHBtX3J1bnRpbWVfc2V0X2FjdGl2ZSgmcGRldi0+ZGV2KTsNCj4g
PiAtICAgcG1fcnVudGltZV9lbmFibGUoJnBkZXYtPmRldik7DQo+ID4gLQ0KPiA+ICAgICByZXR1
cm4gMDsNCj4gPiAgb3V0Og0KPiA+ICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUoZGF0YS0+aXBn
X2Nsayk7DQo+ID4gQEAgLTI4NSw3ICsyODYsOCBAQCBzdGF0aWMgdm9pZCBpbXhfaXJxc3RlZXJf
cmVtb3ZlKHN0cnVjdA0KPiA+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPg0KPiA+ICAgICBp
cnFfZG9tYWluX3JlbW92ZShpcnFzdGVlcl9kYXRhLT5kb21haW4pOw0KPiA+DQo+ID4gLSAgIGNs
a19kaXNhYmxlX3VucHJlcGFyZShpcnFzdGVlcl9kYXRhLT5pcGdfY2xrKTsNCj4gPiArICAgaWYg
KCFwbV9ydW50aW1lX3N0YXR1c19zdXNwZW5kZWQoJnBkZXYtPmRldikpDQo+ID4gKyAgICAgICAg
ICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGlycXN0ZWVyX2RhdGEtPmlwZ19jbGspOw0KPg0KPiBB
cmUgeW91IHN1cmUgbmVlZCBkbyB0aGlzPyBzdXBwb3NlIHJ1bnRpbWVfcG0gdGVhciBkb3duIGNh
bGwgcnVudGltZSBwbQ0KPiBzdXNwZWQgdG8gZGlzYWJsZSBjbG9jay4NCj4NCj4gRnJhbmsNCj4N
CkhpIEZyYW5rLA0KDQpJIGRvbid0IHRoaW5rIHRoZSBkZXZyZXMgdGVhcmRvd24gZGlzYWJsZXMg
dGhlIGNsb2NrIGhlcmUuDQoNCmRldm1fcG1fcnVudGltZV9zZXRfYWN0aXZlX2VuYWJsZWQoKSBy
ZWdpc3RlcnMgdHdvIGRldnJlcyBhY3Rpb25zIHRoYXQNCnJ1biBvbiB1bmJpbmQ6IHBtX3J1bnRp
bWVfZGlzYWJsZSgpIGFuZCBwbV9ydW50aW1lX3NldF9zdXNwZW5kZWQoKS4NCnBtX3J1bnRpbWVf
c2V0X3N1c3BlbmRlZCgpIG9ubHkgc2V0cyB0aGUgc3RhdHVzIHRvIFJQTV9TVVNQRU5ERUQgdmlh
DQpfX3BtX3J1bnRpbWVfc2V0X3N0YXR1cygpOyBpdCBkb2VzIG5vdCBpbnZva2UgdGhlIC0+cnVu
dGltZV9zdXNwZW5kDQpjYWxsYmFjay4gU28gaW14X2lycXN0ZWVyX3N1c3BlbmQoKSBpcyBub3Qg
Y2FsbGVkIGF0IHRlYXJkb3duIGFuZCB0aGUNCmNsb2NrIGlzIG5vdCBkaXNhYmxlZCBieSBydW50
aW1lIFBNLg0KDQpBdCB0aGlzIHBhdGNoIHRoZSBjbG9jayBpcyBzdGlsbCBtYW5hZ2VkIGJ5IGhh
bmQgKGRldm1fY2xrX2dldCgpIHBsdXMNCmNsa19wcmVwYXJlX2VuYWJsZSgpIGluIHByb2JlKCkp
LCBzbyByZW1vdmUoKSBoYXMgdG8gY2xrX2Rpc2FibGVfdW5wcmVwYXJlKCkNCnRvIGJhbGFuY2Ug
aXQuIFRoZSBwbV9ydW50aW1lX3N0YXR1c19zdXNwZW5kZWQoKSBndWFyZCBpcyB0aGVyZSBmb3Ig
dGhlDQpjYXNlIHdoZXJlIHRoZSBkZXZpY2UgaXMgYWxyZWFkeSBydW50aW1lLXN1c3BlbmRlZCBh
dCB1bmJpbmQ6IHRoZSBydW50aW1lDQpzdXNwZW5kIGNhbGxiYWNrIGhhcyB0aGVuIGFscmVhZHkg
ZHJvcHBlZCB0aGUgY2xvY2ssIHNvIHJlbW92ZSgpIG11c3Qgbm90DQpkaXNhYmxlIGl0IGEgc2Vj
b25kIHRpbWUsIG90aGVyd2lzZSB0aGUgZW5hYmxlIGNvdW50IHVuZGVyZmxvd3MuDQoNClRoZSBs
YXRlciBwYXRjaCAiTGV0IGRldnJlcyBvd24gdGhlIGNsb2NrIiBzd2l0Y2hlcyB0bw0KZGV2bV9j
bGtfZ2V0X2VuYWJsZWQoKSwgYW5kIGF0IHRoYXQgcG9pbnQgdGhpcyBtYW51YWwgY2xrX2Rpc2Fi
bGVfdW5wcmVwYXJlKCkNCihhbmQgdGhlIGd1YXJkKSBpcyByZW1vdmVkLCByZXBsYWNlZCBieSBh
IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoKSAvDQpwbV9ydW50aW1lX3B1dF9ub2lkbGUoKSBw
YWlyLg0KDQpUaGFua3MsDQpaaGlwZW5nDQoNCj4gPiAgfQ0KPiA+DQo+ID4gICNpZmRlZiBDT05G
SUdfUE0NCj4gPiAtLQ0KPiA+IDIuMzQuMQ0KPiA+DQo+ID4NCg==
