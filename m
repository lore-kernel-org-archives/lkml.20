Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011054.outbound.protection.outlook.com [40.107.130.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F27346C82B;
	Fri, 11 Sep 2026 09:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118562; cv=fail; b=VxwcIFE0Fx4r4WCGKjUxVQr7yDKaUyOkmGRSUQdES+KWWiAufCfFIANRXObQGxBlTgWUtV7Qab2mpPx3qfq1KeasD8n0k+8vV5bQQk8c3PlMPaw8jmzjXUHiaua+5bLmKuB7LFsTSkT7P4RQqYgGLKUSIYPXk5UR14UpGhdXrJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118562; c=relaxed/simple;
	bh=KIAiydCb+hVoPTeiBDx/Vc6oJqgaKY6HJ1ck3GwS3Zg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LTumzspbWkJFR5uFHS9wmexpW4LXQ3NUC22t9ANkygbzfQw8eFa7St96uNkLoAsM/eCdKtOcT2UjbcqhG+UdGuW62CCB9kGmW6ttZELVg0BqPpCEXaZCKfcZIQyR4ysY/QW+kkO7NPtLtWvQ3AwVQrlovFawSQYutSytI3AbgGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Y/z5z6XM; arc=fail smtp.client-ip=40.107.130.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Y/z5z6XM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSw10wFflIOPLXXcaV0y0MjbRmAtN0Q8SUvUswGuenpwK9g24h6sFpVN5nRAGd3f8KOR5pUmstKs9KCCU4x/xb78Ufj7egEvbCWOoX724F7T2khjfBxAHFgDCR5YP+4UTtehFmDlFhKPUysSofV59G5dVZbanHbLEb5TeKCZKeQ409dpI7Hb5ABCALE6QKCcHuUvtEmE4LyydewTS7khz78cJD/CyNsezpLAlnb7AKGs2D4LnMuyf3SSXbvBOZCsV3wD35h52JgawH8vcpSDRNeTrbUkITnib8DpYHyYPGuNnBnyef3pg0e1y+OiM2chFXr0mSzQipUL6BwD8uQUMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIAiydCb+hVoPTeiBDx/Vc6oJqgaKY6HJ1ck3GwS3Zg=;
 b=VK1guv+/cJ/zj1SZYWYP97n8dKI4evRN6U8G9TsL5AmOyPGy0WXAO6zBbxQCUAQoGeLEKZ48wNVNSWCMAykpdcuMa7E+maiLHY/NISSUS3x6JPwDLVKE0jzF+uUE/Uh+0rvd1X7ba5rf9JxIy/ioNHbGTJCIS1x7Zce8Op0t7qW7pRzhk47Ulchm574qKUjuZrJpCGhKrbFxBNMt3TfRraVTQlB+hvi5nIpF+Dt91D9Q/nFswW2evmiWdhSnLAl+O/AUvgsuu68AGYSUIAOOwLh9a3kZ8t8QGojOWLkf/rjLUCu733V3SuTZbVQEYkYUCtxT/JH3hjLl0ynbnbMprA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIAiydCb+hVoPTeiBDx/Vc6oJqgaKY6HJ1ck3GwS3Zg=;
 b=Y/z5z6XMDYN9FnWLFWrwX72n4of+pFLDo7KeAp9NVqDlGMaNCwZZsDZM15c8JvyXrLTQ+J92iNdb+FfqD3NLVMSCcgk+TJ/A0+qWjL8I24GSSSavQmOrsx0VtbYffLL4zHPZDUCn0iLT2lAg4n423MfFzSEApBdoJsDn1zkb3ps9yA9iyiD9ltfRxJy5SgALRhK7KZMbxMtCWlNBSAT9K1lsyp9kMLvGXbS9FxQg2txBnoc8XXSPn0nJyo3sCv9wAWWuU6RrhfWlDwTmI9SQHMs5isVD/j5nuwFUyixmpkVpNMpzOn0aNXdpCShjO+dPD8RhnyOE9+CuLToY//EJPQ==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by DB8PR04MB7146.eurprd04.prod.outlook.com (2603:10a6:10:127::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 09:22:35 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 09:22:35 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"lee@kernel.org" <lee@kernel.org>, Frank Li <frank.li@nxp.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>
CC: Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>, Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: RE: [EXT] Re: [PATCH v18 3/8] dt-bindings: i3c: Add NXP P3H2x4x
 i3c-hub support
Thread-Topic: [EXT] Re: [PATCH v18 3/8] dt-bindings: i3c: Add NXP P3H2x4x
 i3c-hub support
Thread-Index: AQHdO2x0AO2+wF04XEe0sNATnkYckrbFzByAgAAQBwCAAALZAIAAFO0QgAMyH8A=
Date: Fri, 11 Sep 2026 09:22:35 +0000
Message-ID:
 <AS4PR04MB936261B25BA49E704DF2BD14FBBE2@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20260903062108.2712296-1-lakshay.piplani@nxp.com>
 <20260903062108.2712296-4-lakshay.piplani@nxp.com>
 <f33ff763-136e-4c10-bd77-d40bb4baf02c@kernel.org>
 <AS4PR04MB9362BEAE2ADA8087F00DADFEFBB02@AS4PR04MB9362.eurprd04.prod.outlook.com>
 <624665dc-8f5a-4818-8786-c1c2356e58e4@kernel.org>
 <AS4PR04MB93623E44246D2F29684491D6FBB02@AS4PR04MB9362.eurprd04.prod.outlook.com>
In-Reply-To:
 <AS4PR04MB93623E44246D2F29684491D6FBB02@AS4PR04MB9362.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Enabled=True;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SetDate=2026-09-09T08:29:55.0000000Z;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Name=NXP
 Public;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_ContentBits=3;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|DB8PR04MB7146:EE_
x-ms-office365-filtering-correlation-id: a07dd7d5-c1fd-4dc0-98a6-08df0fe63770
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|23010399003|366016|11063799006|4143699003|38070700021|56012099006|10067099003|22082099003|18002099003|921020;
x-microsoft-antispam-message-info:
 sCOnoUzdK1s7gFe5QEz/HiYo//K0baSXIUcc/E/8zgJTckAlJE2nTM9LwfpJI5djjWl505S+ALCa4BFP+hpKYepx7bfZcdmwqU2pKQNg6BANkxFzXFZki3bQLZs6mAGl9iiXlgL69+IKkM0xqKO7HsMltAJbPbOcXuYSWKxb+FxK70sCGarqeYltg/cpgzBnEp6NV3LTLM/+hAysLntQ6Nd0YsdaW4kgibuTa6mAG/1rS9zpRw5/HS7+BB8yboUSuIh7SyvAh3WPLvfl+wum8RbqB6sH3X5JQJlbdBF9q9fs8JuSb2b9FUnyAbBtKrMPzkYC8P2hG6yNz2woyvX+wGD5QZOnv4OAYI/gxnLZgt5kGrjgJ2kOcUfc4zN0z/YWNwbIiR6S3DRcID4b0aRyDQyYNrK4Phz7T5EjZZBIU2UyVB9hpf1DFIZaimsZ0ahnVM5UUedc+jMK+kLLOYpJPASVkrfQdXo6ssSQQ1aKSYjfLGummOyxKdC1T7q+jraN49X8c4y4W1M+s3KyQVhmPjSnQRpgAXnB+EJiHbtbS4IzodRHddBQeBnSpCdVkn5gYWQeeH6glTQvEiOmAz4OA0RE6y5zHFp4+isXSWkLUXYo8Y6JMvDowHgd+uzVplCm6xAQPyYE0Ov/STdeGr7V00OClBrKyPMxl3ZGb4y/DxQ+PNI4h+wJj1odFngWQEUHprxwTxOyc1i7Zr//b4ebLGBkC+y/MVDGC6jCzNNHxX4MbfLVT9heyBNJyBgtW3r+
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(23010399003)(366016)(11063799006)(4143699003)(38070700021)(56012099006)(10067099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZXVGRXV6bkxJNVBWMVBHTEp0OXlMajB4cW9CRW9kUm93eTQwVzhHMUlva3U1?=
 =?utf-8?B?WDNHUnM3aGhoQ3lnaXgrbUE1SUlEL1lUOUwyd0xCRWJkZUJ5UlRSZkFEMHYv?=
 =?utf-8?B?VnJiRTYzM0VGQ2ZJS3N0d1RQYW1JeEUrWmFCdjFsWlNqa3d5eGo2YzFOUUNR?=
 =?utf-8?B?ZlVkUTVuWVkrQ3NJUEZXM1hjUGh1YUJEb01Oays1Y0EwaVk5UTB0bWtnU3hO?=
 =?utf-8?B?ZzlGT1BkdGZuUW9BVUlXdHdVUHB6eUhRSzZDNmdNYS9ML1BGL2hBS1dVK2lQ?=
 =?utf-8?B?aDNrUFE1SnJkbDlwT3ZmMWZhWmlyVThNRWJpRnZYTjl0bXhFa0lyYk1IekFj?=
 =?utf-8?B?VXVLSnIrMndUN2dNTmlncDIwanp5YlhkcUhqWXBpVmNaVWxTamtGbnQ5eEZU?=
 =?utf-8?B?U3l4SlVqSzlOLzlON05GYXZlQ0lwcnBFZE5oWGtuZUloWHpNMjRyMzJxZkVu?=
 =?utf-8?B?OCtZQUZhRFVIcnVTUEw2amtvUldRVy9xbzNPUmhtQllaajQ5eHNVSEVqZDBh?=
 =?utf-8?B?U1htMDI0cXhwSUJRME1vN09YZE50QXF6d3B1S0FoUmlWUDIrQWZxZEU0ZTVq?=
 =?utf-8?B?SmM2T2lGOUsxNXpnTlVkdVRjMTJhRTM1ekhIZHhoaFZRYlNzQVNJQWYvSFVp?=
 =?utf-8?B?Y0g3bXBPWWdrRk9sRzUyckdFM2Z5QVd6U21SSWtHc29GSiswVCt3aUwxNTQ4?=
 =?utf-8?B?TWxYa3Q1ZGliV0liY1ZJQUY0aVdTNG0xY1hhUldrbXUzeXZLaktLalZZcHhJ?=
 =?utf-8?B?bm1wUFgxR0FWQ0lRQ0xpZzZYSjhpYTdHdmkzMUN2VWZFQ3lTTzVzUHhEeXo0?=
 =?utf-8?B?d2JvN2NiSHBNNHZiT2tJd1hrUjI2ekJFMFRLWTBMU2FTenZEekFtWlBMUHFt?=
 =?utf-8?B?ZFg1MVE2bkRZOG5ZOFVDeWtjZlBubWVxd1J6UXFidnE4VFE5bG5veDZXdnpn?=
 =?utf-8?B?R1pxNEh2WVBSd2hjQXdLRVo4SlFjMWg2QllVMzJENjdLNnRZZXMyRUdRbTBS?=
 =?utf-8?B?TkRieGRjUHZGSzBSODdiKzAveTkwTFhOR25Sem5TbWNyRkp5ZldrWTZGR1kx?=
 =?utf-8?B?TkgrV0o0ZlBiN1R1T1NPQWhxYmVrbmZxQzdSQzhITnVGT1NIQ29SLzErT0U3?=
 =?utf-8?B?Z0hRV0p6amNkWTFhdm1qVWpNVXZiZDB6dnNQTDhhcXp6TDZIZmdheGVxejlw?=
 =?utf-8?B?cVp3b0lnc3dZYTl0ZmJwYmFWU1RoMldsZXdKNyt0TE1tL3d1RmN1M01XU3Ir?=
 =?utf-8?B?TjZuejFNSFZtV3NsUStuZ0ZkVUYrZW1TSFVxN0h6K2dUeklsSWZVNlRCZlhL?=
 =?utf-8?B?MzFEaEp3R0pxa21wRHVJZ2pCd0lYL05jc0pNWXA1YmRiM3g2RTgwNkJ3ZExE?=
 =?utf-8?B?cTdGT1BTcHRjaHRIcitWczArSjg4Q2R4SkNPUkJleGNONDk0bVc1Q21uWlVt?=
 =?utf-8?B?S3haUzlBbU1ySGhFLzN3b2xjckZHanJFdHlaY0tJamV1VmcxMFI2REFSUmFw?=
 =?utf-8?B?V0ZGTE91MWRXV2xFZi92cG9nR09VVEZuTHQ0RzNxdXBPQktyb0RvL1NDNFls?=
 =?utf-8?B?UXFGamhWdjVCNy9uRlhyL21wTEZOU04waWxxejZCekNMbCtWYkpadEVpZ0V5?=
 =?utf-8?B?aDNXVXlOSUx3eG9iaTNvSUFuRFREeUYxRTRoZ1U4TmhRdWIzRXk4RHFob2JB?=
 =?utf-8?B?RzREM3pvbUVIMWtFQy9tWGZCbm5VVXFyUUpiakE3VWVtVHNCajhhaEV3cGJn?=
 =?utf-8?B?QTFwWGIwcVE4dVdwVnIyaUQ1cjRDNHF5ejcyekJ1Q2NmczV6REpvY2xsN2Nm?=
 =?utf-8?B?MUljbjBlSnQ0NlRZRklvdDdJSmVzUXloZDh4SXo1ZXUvbDB3SndMb2lReTJw?=
 =?utf-8?B?ZCtsUks5RlBVdmxDRzhYVS9QRnNhYklvcG1iZ1BoN1NGSm4zeWh3UXRRem5Z?=
 =?utf-8?B?RlBPRnhJL3Z2dFVPMERQY29Pb29IUGVkS2ptYXVUdWtTaXZEOEhOczN2dy9k?=
 =?utf-8?B?SEYzckR4WG9OTE1pRUo2TFdaM3pmUWV6RjBScjdUSnZTSTVCUVlIY29Ta0Jv?=
 =?utf-8?B?d1hDUkYzZjZGMU5xbTBvc2Fyc1V1b2Q5NTc3WHVXdWlhY05Ua2J4L29NTHp5?=
 =?utf-8?B?RUZiYzdUTFJIMGY1TzFCSzFlOTVKczkzWWFSaW5CelczaDN5Y2IrVXd2YlRu?=
 =?utf-8?B?UjJUNEtocnUvTzFiZEZEQ0tRWG8vTW42Uy9VR2l3QmtjNUZzeEtzZnNxaDlQ?=
 =?utf-8?B?S1IyT0tlOFgyY1NNeC80cVloTkQvNUdQalEweUJ5Wk1YaVV3NjVKK3BGanVy?=
 =?utf-8?B?VDN1dXM0NTZ4VWMzQlYxeVRsMUQ3ZjBJWk8zU0tMYTZDYU91SnREUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9362.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a07dd7d5-c1fd-4dc0-98a6-08df0fe63770
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 09:22:35.6760
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ndWZXjMFJ1otda8pA/lSQ7faGg8chP1QVs58WPrws4f4AurjzMEPQIVBypOFFMDVZCpdmr5NvbHLGyPlpovEkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7146

SGkgS3J6eXN6dG9mLA0KDQpBIGdlbnRsZSBmb2xsb3ctdXAgb24gbXkgcHJldmlvdXMgcmVwbHku
IENvdWxkIHlvdSBwbGVhc2UgY29uZmlybSB3aGV0aGVyDQpteSB1bmRlcnN0YW5kaW5nIGlzIGNv
cnJlY3QgYmVmb3JlIEkgcHJlcGFyZSB0aGUgbmV4dCByZXZpc2lvbi4NCg0KUmVnYXJkcywNCkxh
a3NoYXkNCg0KDQpOWFAgUHVibGljDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IExha3NoYXkgUGlwbGFuaQ0KPiBTZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciA5LCAyMDI2
IDI6MDMgUE0NCj4gVG86ICdLcnp5c3p0b2YgS296bG93c2tpJyA8a3J6a0BrZXJuZWwub3JnPjsg
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtaTNjQGxpc3RzLmluZnJhZGVh
ZC5vcmc7IGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tOw0KPiBrcnprK2R0QGtlcm5lbC5v
cmc7IHJvYmhAa2VybmVsLm9yZzsgY29ub3IrZHRAa2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2
Z2VyLmtlcm5lbC5vcmc7IGJyb29uaWVAa2VybmVsLm9yZzsgbGVlQGtlcm5lbC5vcmc7IEZyYW5r
IExpDQo+IDxmcmFuay5saUBueHAuY29tPjsgbGdpcmR3b29kQGdtYWlsLmNvbQ0KPiBDYzogVmlr
YXNoIEJhbnNhbCA8dmlrYXNoLmJhbnNhbEBueHAuY29tPjsgUHJpeWFua2EgSmFpbg0KPiA8cHJp
eWFua2EuamFpbkBueHAuY29tPjsgQW1hbiBLdW1hciBQYW5kZXkNCj4gPGFtYW4ua3VtYXJwYW5k
ZXlAbnhwLmNvbT4NCj4gU3ViamVjdDogUkU6IFtFWFRdIFJlOiBbUEFUQ0ggdjE4IDMvOF0gZHQt
YmluZGluZ3M6IGkzYzogQWRkIE5YUCBQM0gyeDR4IGkzYy0NCj4gaHViIHN1cHBvcnQNCj4NCj4g
PiA+Pj4gKw0KPiA+ID4+PiArcHJvcGVydGllczoNCj4gPiA+Pj4gKyAgY29tcGF0aWJsZToNCj4g
PiA+Pj4gKyAgICBlbnVtOg0KPiA+ID4+PiArICAgICAgLSBueHAscDNoMjQ0MA0KPiA+ID4+PiAr
ICAgICAgLSBueHAscDNoMjQ0MQ0KPiA+ID4+PiArICAgICAgLSBueHAscDNoMjg0MA0KPiA+ID4+
PiArICAgICAgLSBueHAscDNoMjg0MQ0KPiA+ID4+DQo+ID4gPj4gSSBkb24ndCBzZWUgaW1wcm92
ZW1lbnRzLg0KPiA+ID4+DQo+ID4gPg0KPiA+ID4gRm9yIHRoaXMgb25lLCBjb3VsZCB5b3UgbGV0
IG1lIGtub3cgaW4gYSBsaXR0bGUgYml0IG1vcmUgZGV0YWlsIHdoYXQNCj4gPiA+IHlvdSBoYXZl
DQo+ID4gaW4gbWluZD8NCj4gPg0KPiA+IEkgcXVlc3Rpb25lZCBpZiBkZXZpY2VzIGFyZSBjb21w
YXRpYmxlLiBJdCBzZWVtcyB0aGUgYW5zd2VyIHdhcyB0aGF0DQo+ID4geWVzLiBTZWUgd3JpdGlu
ZyBiaW5kaW5ncyBkb2MuIFRoZXJlIGlzIHBsZW50eSBvZiBleGFtcGxlcyBzaG93aW5nIGhvdw0K
PiA+IHRvIGV4cHJlc3MgY29tcGF0aWJpbGl0eSwgaWYgdGhleSBhcmUgY29tcGF0aWJsZS4NCj4g
Pg0KPg0KPiBUaGFua3MsIHVuZGVyc3Rvb2QuDQo+DQo+IFRoZSB2YXJpYW50cyBzaGFyZSB0aGUg
c2FtZSBwcm9ncmFtbWluZyBpbnRlcmZhY2UsIHNvIEknbGwgZXhwcmVzcyB0aGlzIHRocm91Z2gN
Cj4gZmFsbGJhY2sgY29tcGF0aWJsZXMgd2l0aCBueHAscDNoMjg0MCBhcyB0aGUgYmFzZSBjb21w
YXRpYmxlLCBlLmcuDQo+IGNvbXBhdGlibGUgPSAibnhwLHAzaDI0NDEiLCAibnhwLHAzaDI4NDAi
Ow0KPg0KPiBUaGlzIGZvbGxvd3MgdGhlIGZhbGxiYWNrLWNvbXBhdGlibGUgcGF0dGVybiB1c2Vk
IGluIG90aGVyIHVwc3RyZWFtIGJpbmRpbmdzLg0KPg0KPiBJcyB0aGlzIGZpbmU/DQo+DQo+IHBy
b3BlcnRpZXM6DQo+ICAgY29tcGF0aWJsZToNCj4gICAgIG9uZU9mOg0KPiAgICAgICAtIGNvbnN0
OiBueHAscDNoMjg0MA0KPiAgICAgICAtIGl0ZW1zOg0KPiAgICAgICAgICAgLSBlbnVtOg0KPiAg
ICAgICAgICAgICAgIC0gbnhwLHAzaDI0NDANCj4gICAgICAgICAgICAgICAtIG54cCxwM2gyNDQx
DQo+ICAgICAgICAgICAgICAgLSBueHAscDNoMjg0MQ0KPiAgICAgICAgICAgLSBjb25zdDogbnhw
LHAzaDI4NDANCj4NCj4gUmVnYXJkcw0KPiBMYWtzaGF5DQoNCkEgZ2VudGxlIGZvbGxvdy11cCBv
biBteSBwcmV2aW91cyByZXBseS4gQ291bGQgeW91IHBsZWFzZSBjb25maXJtIHdoZXRoZXIgbXkg
dW5kZXJzdGFuZGluZyBpcyBjb3JyZWN0IGJlZm9yZSBJIHByZXBhcmUgdGhlIG5leHQgcmV2aXNp
b24/DQoNClJlZ2FyZHMsDQpMYWtzaGF5DQo=
