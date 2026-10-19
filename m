Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023088.outbound.protection.outlook.com [52.101.127.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6912472F87;
	Mon, 19 Oct 2026 12:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412256; cv=fail; b=i4Tmqi3gONtUuSgek5Zw0YxZKH7Ctabi0LFG4rug1jo+8SanXN40z55XR5OOeStn4Zy8VVKul2JHlgXgeASGV51znvFRjcV3eSy6xQCXJkigPEscTJVFU4DJ3XXC1OAHPrjMrujMhlSVr9aG46bYHsdiu6JASFLtk8X3+63sCm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412256; c=relaxed/simple;
	bh=Tb5JhQtpP4vtOH+HJtmiezDmT7QUwUWOmP8WZ0m6uW0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LcBPeuqPONj0D75lTl2DsQXltHofNLAXSdWkvWuipnMfNIQI+mnFKHjQxsoTExdp5SOeQtFUAbjj+U8ISpMRlUcn1iqZzEK4ZRtPnBRXwOC8RkxktwfsdjL6OoW38PgUt2JQff9nv2r28CcObsXbm21t8J3XG1t/q7HephnHkJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bfxpXyldIPwgNE4Wvd9XnfSEOn65Hy0w9m8Dfu0vDMT6VFi3w3UMDDF15Idk0n0KiDC4U0x5smT9VKUYaFqFLdoKiyUJ4EsuFvYpUWym+UnbPaz1mb6Vc6cTcUfFYbJaUgLa4gUjtd1PplCsV2mug3XbRJUoKbp1Jcic/yKotafRHSIHB8WEQtcG56O6soTm2QumHvyfXWjEfGxu0pkxmh8F7ekksUeHP3WBlHu3xFFU2bZvI6efM+kfAbGO5G+CuqPNcsHCGBPLV9EGE4j3IQqBMLL/RSGRZ5+l31/fQi8cYPX2jmPmtkEzErq7078qqTh6TRoI+JhNWcJSpO3IQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tb5JhQtpP4vtOH+HJtmiezDmT7QUwUWOmP8WZ0m6uW0=;
 b=gBv5JGNAV8ebYL5jNzDbicRJhhuAPj/I2cJBenduyVJMkZq5LuFbGp/Ftqjjuv9kDtUh5M5Zpc+rU04yfRdPu0Gfm1V3iMwJSNJbGd4iYGU3m2X8HNxaXaP52mmlo508ydpG4z0WchkLJHd/mwtGcLn66Wt34153yMLP12BqtSAOX6F/FH6U0/nCN7PKRTPEs3yhccekluarXQ9AG28r7V8aejzvshPZh58ud4u0tCXrmtM4r43uZDSVMi7h+bqlZnCwyFVK++To4HR8Dr6CNYi/O4n/PmdCHA6meK2fvKEHD/pTlhrgKAv1EeFACM04OHcHED77GJoEA7RdIzkCdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from KUYPR06MB8673.apcprd06.prod.outlook.com (2603:1096:d10:8b::5)
 by TYNPR06MB8528.apcprd06.prod.outlook.com (2603:1096:405:3d0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 12:17:28 +0000
Received: from KUYPR06MB8673.apcprd06.prod.outlook.com
 ([fe80::2b5f:4b04:8fc6:747c]) by KUYPR06MB8673.apcprd06.prod.outlook.com
 ([fe80::2b5f:4b04:8fc6:747c%2]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 12:17:28 +0000
From: =?gb2312?B?Sm9ha2ltICBaaGFuZyAo1cXHv8fsKQ==?= <joakim.zhang@cixtech.com>
To: Rob Herring <robh@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v3 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
Thread-Topic: [PATCH v3 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
Thread-Index: AQHdV9A2NV62TPNWeUuoFGF/mpke47b1QdEAgA9tzLA=
Date: Mon, 19 Oct 2026 12:17:28 +0000
Message-ID:
 <KUYPR06MB867377E7D906CC7FA15DFF7782982@KUYPR06MB8673.apcprd06.prod.outlook.com>
References: <20261009092552.2377960-1-joakim.zhang@cixtech.com>
 <20261009092552.2377960-2-joakim.zhang@cixtech.com>
 <20261009141606.GB1631855-robh@kernel.org>
In-Reply-To: <20261009141606.GB1631855-robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KUYPR06MB8673:EE_|TYNPR06MB8528:EE_
x-ms-office365-filtering-correlation-id: 74e1a05a-4bf5-4240-a8ca-08df2ddaf181
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|261009223027099003|10067099003|56012099006|3023799007|22082099003|18002099003|4143699003|38070700021;
x-microsoft-antispam-message-info:
 MqBYx9RMifSjZGjFetCrDmMqwuVV74Gs0sdMyK014O3tEyyIvTsP653FWIfjSJHJ9uSfDyyGbGmegNPgwoscj9UXIHterYwCYUC5ATP0NdRrWKWKcgKE0JE+9eZCNaCyy01s60AJ1riRcb1FGLqRWXM7Y0dxt5BP2ZtQRepXtZyHR+FvSZ0WFQ9/J1kIS19dHrJbtz79jwehFZtmPb7+lseyY1T6pLk9wwj0VRkT3PHQ2VTT2+p/Lq6KBcUj9f/PGt2yvMK2wLyaJW3crL/u2dWi5F/DJtlHObUJ8NE790UWLu55WUPm5NGubnbZm5fR7xl+Hbe5RsnisDliwvbv9ipS18ZBe8Kl6m6AVavxa7nIWWaAM1zWep7l4tvY8zwUrK65rnbHhFrXRPY0CIYPbGmCxxhZfKmuODUFJA6NY37GF2+r2moSGbzwpKz5jtb/SXvmtcSz5xLqms8bxaJyB9NqdCks+E0KPzJMVVBrPSK0AooSDgwGaZ2ghbP4GqCYETx4aiaMQpkh++nQhWMKwiBOE8V7ys/7jan8ABNp0p/y1KdpeXoQ4ij7E2zwZ8sKBW0fteRqw5DNPRT28SLHFQ8lq/S83mb6gdMWscF3eejvPEyXG2B34dsBP6xEUBYOV4SQLXLmXVpj+MQ5t/EgmLhpSE85bfuv9HYRnAm6XxE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUYPR06MB8673.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261009223027099003)(10067099003)(56012099006)(3023799007)(22082099003)(18002099003)(4143699003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?dDZMYUpGaVlnUmljZDAzM1JkeEVoT3QvelJwR1F4Q28zZDZhUkxsMm9DalE0?=
 =?gb2312?B?ODF5UFhORlBKbDNLNFR1S0YyczByNXJqTGRyTDlvY2s0YXpVYytHZmx0UWl6?=
 =?gb2312?B?NEo5c2EvREFuSG5xSlg3RmtvYWdOTnFOKzRHeUJtWjZzVDVqWjgySGE1VlpN?=
 =?gb2312?B?c1E3U0FsbnNZYnRTN0lxVHFaM1B5YlRzYWpsNC82WTBXUGRIc0VaeEd4cG1k?=
 =?gb2312?B?Qi9oT2F4c20yTnRsS0VOMXJLUytMUUF3L08vNmFOSm9obzNkZmJRcUMramVo?=
 =?gb2312?B?RkdXdFVZdU9XWnhEd3YwakNlb2MzN05SZ2dNYmtkTVhiRVIySmNtWUpKRW1N?=
 =?gb2312?B?WUM5QzV0R1lTTk9ZcCtBODR0RStuT0QvNTl3SS9uQ2ZMZmpBNWtoZ01pbnkv?=
 =?gb2312?B?RkNXVTBhNWZuakdTa3RFdVhXb1YzY09GZEhUdGJYeDZ6a3J6eUw0NitYMmNn?=
 =?gb2312?B?Wm1uRkNiMVpsY2txcXExd01vZ1NtYXhURG1TZlVoS1AzRVE1TytUZGZTU2ph?=
 =?gb2312?B?ZGRHaktMa1J4OFBCbXE2SUwwaWFnTFpmQ2F5eTJNa0ZHVld1RnIwZ2hNb3VU?=
 =?gb2312?B?cGIzZ0t5cERCTDU3NzBmR2Rncit1Sm5hUzY1VjZHV2U5MFZ5Rzl6WnJGZVVO?=
 =?gb2312?B?Z0JQd05uS2JnT1drWWxPLzh6VUQ5WWw0ZTRzOTdXYlZFWElGc3dodXNRQkdn?=
 =?gb2312?B?K0FrMWI0cC82ck15SHJsL3RRYW52THBvaWlrMERMOWJWamJKcldlZXkwN0l1?=
 =?gb2312?B?TTZTa0pFTklaQzJCcURPT3FjQ1gxbnJURzFjZ2NSVVRIMUdHLzJjQzZzVTIw?=
 =?gb2312?B?eFVlenhpbzlUWWhKSVVMMk1CWG9UbElSakNNU2lkWVViMy9wMDlWTkV5ZUdX?=
 =?gb2312?B?dVBUTnhPeERTNmR3NTNsajdNY1F3ZTMyclB0OXZCUWt3Yi9Td3REeVc5VHla?=
 =?gb2312?B?SWRKdCtYZjJjZ3YzSzNjMy9vT2tzUGI3aVFpcEw4aWFJQytFUHJNS2pCQWY2?=
 =?gb2312?B?bHlNQ3FuMnh5eFhrOStjOEJQSkxsaTdSSitjTXYvMjlwbVJMM211VkIzZnY0?=
 =?gb2312?B?NnR6dVk3by92dXJJbGVSWmhjbzBPRllLVXliM1pVUllmRzlwVnlRd2RmMmRE?=
 =?gb2312?B?UjVGdjlFNW9lY0cvS0FrMms5ZkZvZW9tOVJxTE1VQkxuWktEODVtVGFvVklK?=
 =?gb2312?B?TEdSTEM2UTRQL25zWGdVSTRVTUcvRlJwSXpmcTcrRzYzOXdTLzdvRURrRytD?=
 =?gb2312?B?TWNSU0FKcE5QYzZGMHl3cHFWNXM0bDVLekhZa2JFTGM2bERrQ3lNMzMrd2ZY?=
 =?gb2312?B?YlVpY2ZhRWpyd0ZhMTUzdVpDbUFqNXd0ZFhlUmZnTThxQ2dzaTlXUVR6UzZk?=
 =?gb2312?B?STRHQUxUbzgvVnNRWVFkMGJ3eTFFN0QyNnJoTHpxUXFFNmpwejZlVXpWRUph?=
 =?gb2312?B?YkNLcnpzekwycko3NCtMUWdRV1NlbjFaWVJrWmdPODFVT3RMVzVsTjAxc3V5?=
 =?gb2312?B?RjhodDhBNmJVVFF1bE1Fc29kaTJDZEFzUXdiOWtrQlFiUVI0bnEySzJVN3Ar?=
 =?gb2312?B?WXdmTnVVRURZakx0eFNpeWM2NStXQ3ZlaUJGK05WNXluMDRMWUROWmVlMXZ6?=
 =?gb2312?B?VERtdXZISk95WXViZm1YbmJXSzVlR3BBNVMxYU9xN1UzanJCZTkxeEVDNXRF?=
 =?gb2312?B?M25ndDZyU1JtLzQyY1o3Tno0Mm91ejBVa2dsK3V4R1d2WGc3Y2cyN0c1enFv?=
 =?gb2312?B?TUlsTEVjN2hDa3ZnOGVLQUdablMzaE5XaU1aTkpRR3g0eXJXZXRidS9PUnlD?=
 =?gb2312?B?VXB1K1dJbExTZEhyRk5tTkdrQ1pyWXc0ZnF3UHlKbjNCWjhqWDJGRXRIa1Vq?=
 =?gb2312?B?dTc3U2JrQzl5NTVsTlVqYXlVYmx6S1NKSHVaNWM4SHVxa0o3VFNUaWE2SVlZ?=
 =?gb2312?B?dHF6SUpobkFITzAzMWFoMkt6cDFhS2p6d0hyMVhsWmQrMGdDbUx3cVJTRjl1?=
 =?gb2312?B?MFhKeUVaTmdCREJRa1VTNmpIMndidEpka2tHeERXOEZ4ZmVjVW9jc0Frejd5?=
 =?gb2312?B?ZDNVTzZ3UDI0L1RWRlFrT3JIQ1JuY1UwTUdKQWNIT0JvT0Q3T0taYitDR2Ev?=
 =?gb2312?B?K0oycTcrMDVCclUxeDRPVlRMVkZKM2I5cnJHcExrYklSaEVOVmw5bDVUZnRG?=
 =?gb2312?B?b2N6YjhiVTVSUEJYa1NxSkhyOFhRS1NuRE4vQ1E5MzY0ejVnT084ZVBNTHY3?=
 =?gb2312?B?YTNYL0tKdm1McGhOQUFEMC9qWlBoTHU4MXpjM3VtNEZXdEFoNEJIcjZJd0hy?=
 =?gb2312?B?YTRwZU9qTTdIdnhmVzlYNlVJY1hEME9sUEpaOUhUT2ZuOFEwYzJ4UT09?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KUYPR06MB8673.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e1a05a-4bf5-4240-a8ca-08df2ddaf181
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2026 12:17:28.7625
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mi8ZyLfnPRgc7scFcGb5WeJ3pSYwD8wNjkqT0M/I6aUiI0NLmtJMYmO2iuxoJCP3V1PFkxp6ipMXLaZEGLHKGDlyNkXUADjlC6FAWEkv/2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR06MB8528

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4NCj4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDksIDIwMjYgMTA6MTYgUE0N
Cj4gVG86IEpvYWtpbSBaaGFuZyAo1cXHv8fsKSA8am9ha2ltLnpoYW5nQGNpeHRlY2guY29tPg0K
PiBDYzogbGdpcmR3b29kQGdtYWlsLmNvbTsgYnJvb25pZUBrZXJuZWwub3JnOyBrcnprK2R0QGtl
cm5lbC5vcmc7DQo+IGNvbm9yK2R0QGtlcm5lbC5vcmc7IHBlcmV4QHBlcmV4LmN6OyB0aXdhaUBz
dXNlLmNvbTsgcC56YWJlbEBwZW5ndXRyb25peC5kZTsNCj4gY2l4LWtlcm5lbC11cHN0cmVhbSA8
Y2l4LWtlcm5lbC11cHN0cmVhbUBjaXh0ZWNoLmNvbT47IGxpbnV4LQ0KPiBzb3VuZEB2Z2VyLmtl
cm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnOw0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2MyAxLzRdIEFTb0M6IGR0LWJpbmRpbmdzOiBBZGQgQ2FkZW5jZSBJ
MlMtU0MgY29udHJvbGxlcg0KPiANCj4gRVhURVJOQUwgRU1BSUwNCj4gDQo+IE9uIEZyaSwgT2N0
IDA5LCAyMDI2IGF0IDA1OjI1OjQ5UE0gKzA4MDAsIGpvYWtpbS56aGFuZ0BjaXh0ZWNoLmNvbSB3
cm90ZToNCj4gPiBGcm9tOiBKb2FraW0gWmhhbmcgPGpvYWtpbS56aGFuZ0BjaXh0ZWNoLmNvbT4N
Cj4gPg0KPiA+IEFkZCB0aGUgRFQgYmluZGluZyBmb3IgdGhlIENhZGVuY2UgSTJTLVNDIGNvbnRy
b2xsZXIgaW50ZWdyYXRlZCBpbiB0aGUNCj4gPiBDSVggU0tZMSBhdWRpbyBzdWJzeXN0ZW0uIEky
Uy1TQyBpcyBhIGZ1bGwtZHVwbGV4IHN0ZXJlbyBjb250cm9sbGVyDQo+ID4gc3VwcG9ydGluZyBz
dGFuZGFyZCBJMlMsIGxlZnQvcmlnaHQtanVzdGlmaWVkIGFuZCBEU1AgZm9ybWF0cywgcGx1cw0K
PiA+IFRETSBvcGVyYXRpb24gd2l0aCB1cCB0byAxNiBzbG90cy4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEpvYWtpbSBaaGFuZyA8am9ha2ltLnpoYW5nQGNpeHRlY2guY29tPg0KPiA+IC0tLQ0K
PiA+ICAuLi4vYmluZGluZ3Mvc291bmQvY2l4LHNreTEtaTJzLXNjLnlhbWwgICAgICAgfCA5MyAr
KysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5MyBpbnNlcnRpb25zKCsp
DQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9zb3VuZC9jaXgsc2t5MS1pMnMtc2MueWFtbA0KPiA+DQo+ID4gZGlmZiAtLWdpdA0K
PiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL2NpeCxza3kxLWky
cy1zYy55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQv
Y2l4LHNreTEtaTJzLXNjLnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4
IDAwMDAwMDAwMDAwMC4uM2ZkZjIzMzRjNDkyDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9jaXgsc2t5MS1pMnMtc2Mu
eWFtbA0KPiA+IEBAIC0wLDAgKzEsOTMgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpICVZQU1MIDEuMg0KPiA+ICstLS0NCj4g
PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9zb3VuZC9jaXgsc2t5MS1pMnMt
c2MueWFtbCMNCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1h
cy9jb3JlLnlhbWwjDQo+ID4gKw0KPiA+ICt0aXRsZTogQ2FkZW5jZSBJMlMtU0MgY29udHJvbGxl
cg0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBKb2FraW0gWmhhbmcgPGpvYWtp
bS56aGFuZ0BjaXh0ZWNoLmNvbT4NCj4gPiArDQo+ID4gK2Rlc2NyaXB0aW9uOiB8DQo+ID4gKyAg
VGhlIENhZGVuY2UgSTJTLVNDIGNvbnRyb2xsZXIgaW50ZWdyYXRlZCBpbiB0aGUgQ0lYIFNLWTEg
YXVkaW8gc3Vic3lzdGVtLg0KPiA+ICsgIEl0IHN1cHBvcnRzIGZ1bGwtZHVwbGV4IHN0ZXJlbyBw
bGF5YmFjayBhbmQgY2FwdHVyZSBpbiBzdGFuZGFyZA0KPiA+ICtJMlMsDQo+ID4gKyAgbGVmdC9y
aWdodC1qdXN0aWZpZWQgYW5kIERTUCBtb2RlcywgYXMgd2VsbCBhcyBURE0gb3BlcmF0aW9uIHdp
dGgNCj4gPiArdXAgdG8NCj4gPiArICAxNiBzbG90cy4gVGhlIHRyYW5zbWl0dGVyIGFuZCByZWNl
aXZlciBhcmUgc3RhcnRlZCBhbmQgc3RvcHBlZA0KPiA+ICt0b2dldGhlcg0KPiA+ICsgIGJ5IHRo
ZSBjb250cm9sbGVyLg0KPiA+ICsNCj4gPiArYWxsT2Y6DQo+ID4gKyAgLSAkcmVmOiBkYWktY29t
bW9uLnlhbWwjDQo+ID4gKw0KPiA+ICtwcm9wZXJ0aWVzOg0KPiA+ICsgIGNvbXBhdGlibGU6DQo+
ID4gKyAgICBjb25zdDogY2l4LHNreTEtaTJzLXNjDQo+ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiAr
ICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIGludGVycnVwdHM6DQo+ID4gKyAgICBtYXhJ
dGVtczogMQ0KPiA+ICsNCj4gPiArICBjbG9ja3M6DQo+ID4gKyAgICBtYXhJdGVtczogNA0KPiA+
ICsNCj4gPiArICBjbG9jay1uYW1lczoNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGNv
bnN0OiBoc3QNCj4gPiArICAgICAgLSBjb25zdDogaTJzDQo+ID4gKyAgICAgIC0gY29uc3Q6IGF1
ZGlvLWNsazANCj4gPiArICAgICAgLSBjb25zdDogYXVkaW8tY2xrMg0KPiA+ICsNCj4gPiArICBy
ZXNldHM6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICBkbWFzOg0KPiA+ICsg
ICAgbWluSXRlbXM6IDENCj4gPiArICAgIG1heEl0ZW1zOiAyDQo+ID4gKyAgICBkZXNjcmlwdGlv
bjoNCj4gPiArICAgICAgT25lIERNQSBjaGFubmVsIGZvciBpbnN0YW5jZXMgd2lyZWQgZm9yIGEg
c2luZ2xlIGRpcmVjdGlvbiwgZWl0aGVyDQo+ID4gKyAgICAgICJ0eCIgb3IgInJ4Iiwgb3IgdHdv
IGNoYW5uZWxzIGZvciBib3RoIHRyYW5zbWl0IGFuZCByZWNlaXZlLg0KPiA+ICsNCj4gPiArICBk
bWEtbmFtZXM6DQo+ID4gKyAgICBtaW5JdGVtczogMQ0KPiA+ICsgICAgbWF4SXRlbXM6IDINCj4g
PiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICBlbnVtOiBbIHR4LCByeCBdDQo+IA0KPiBBZGRyZXNz
IHRoZSBzYXNoaWtvIGNvbW1lbnQuDQoNCkJvYiwgdGhhbmtzLg0KDQpKb2FraW0NCg==
