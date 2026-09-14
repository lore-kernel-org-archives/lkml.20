Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022096.outbound.protection.outlook.com [52.101.66.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2524A21FF2A;
	Mon, 14 Sep 2026 15:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398304; cv=fail; b=Sys/7lGgu92s1h9HZouz4e2qVgibNeipQLuA4IM2RkbLLFYMQkPCmO3ZBYhHomuHnbg30rXnE7Mwz6Wo98oh8arJkQzBhMrc6/B33i31LMrAmpzinKA3hq038cmeGeXvWPOZNIUqSj+7akYDBJlkpHEJdHIO1/7E/ivGXSEzbrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398304; c=relaxed/simple;
	bh=O87Fhk9bkuGEtZJBB0SNC5OtJL2pwkQNj8ASh8N0tQE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IYJS2DitWI6sHFzJmrojijPYIM0hdhYxevAe74o3zvQKbDKL8spmdxYb8bZlEqGhTvMIT54eXvPflDFkbNQM+nE2d0VA0aHC20+ewblaD2/sJ8WBw7skrcXd6ksGbzQ0kgwGhIQ+44Sd80cr/IJhaRx/8vPBC0fUqxOZ47/l5BI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=variscite.com; spf=pass smtp.mailfrom=variscite.com; dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com header.b=AjDvCVPc; arc=fail smtp.client-ip=52.101.66.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=variscite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=variscite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com header.b="AjDvCVPc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTnjG7iBYrZwSznj2dRlDfXSqpdM4I33wLLjClKo+bSvfTORP3mS9PFRGbCpKSAPWGSRrBiZeIqAs4VAATsEisG1ZwOhTYn6TkfAWQmLHnzhgBPl/KnIFk/GuYyHg4Tg6auVxPJC01KaK5kvnAefpM1EI6T1bYoMchZglE4UMRrC62MbBL7lT8QeIaO95FHiRbnppufHpry6UXHQJ5rHeKjB4GnvvF+A1KrSmFZpSmtfb8x3BK3YE4cMqS1amEoORJtcgVHUzH88cQYVGUGedCAWsVCWTxAVB3FC0WVL2PWmNZrAWhjSm/3sFli2+tTY/zHQle8k9Pmf+PoD7X3RHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O87Fhk9bkuGEtZJBB0SNC5OtJL2pwkQNj8ASh8N0tQE=;
 b=wxlEoFATEsm0Qe6gVFmrbp08zRV8u/C8onpAhfFdArsuXYEB2c0/NmmSGpemseEOPJvOKlxq1Wk3gayEECjnklL3140Sj+dLmj6X/yUQ6b/wAxNhZhThWY5R7Dc2Uf5n9cVRkO8NehPTGmVOGfeU7aSTsJzC262R3MCRYTxKG5im24m2fiV65x+gvzKm5B2pJOUATtEhVE+inqi2bd8jCq6UgJPTSd2ESD0rNJsvf0gFifuMjlLoDzEF87qta0cX6kPnzIDExw2s0dsCHDtAJ5KKnOlqjYTTVuGGz/5aDAd/VqDTS87FA72uLcN1CP0uCn6BUYXNwnMeFzuJXC9vGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=variscite.com; dmarc=pass action=none
 header.from=variscite.com; dkim=pass header.d=variscite.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=variscite.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O87Fhk9bkuGEtZJBB0SNC5OtJL2pwkQNj8ASh8N0tQE=;
 b=AjDvCVPcL832BTPqoHZqAlJcf1DYJnAA946NCmZ5EAwOCWrf982ihce4vf+Sp51m5QtgHFioJG/kBLAWqf7CNxlsYUmKbdP/2dL6w0vGPz+IBxFWagnFOZl3S8behrBbOYsyvk6QYPl0ypTP4fGEMwWZ1oFTK0jhPb9oQndQ7Z9ABXfLfHNxrbY5KFZyUoLCkNhB60gDT+u8ThIRa+Lq1a0ASY0p6OXxdhOxqPc4ptA9Gw8dP6jMnYswxocsrNdeeOvoOaL3OeiyCVdlb/Pl+UJ0B0YEirwoxBHsuP1fnNpNyGLGCcuHgrtZ73EwBRBjSDGvejgAxYZ7c7uKn8RYEA==
Received: from AM6PR08MB5256.eurprd08.prod.outlook.com (2603:10a6:20b:e7::32)
 by BR0PR08MB185883.eurprd08.prod.outlook.com (2603:10a6:2c8:2a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Mon, 14 Sep
 2026 15:04:59 +0000
Received: from AM6PR08MB5256.eurprd08.prod.outlook.com
 ([fe80::5caf:2af8:a051:9b55]) by AM6PR08MB5256.eurprd08.prod.outlook.com
 ([fe80::5caf:2af8:a051:9b55%5]) with mapi id 15.21.0428.004; Mon, 14 Sep 2026
 15:04:59 +0000
From: Stefano Radaelli <stefano.r@variscite.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Garrett
 Giordano <ggiordano@phytec.com>, Wadim Egorov <w.egorov@phytec.de>, Robert
 Nelson <robertcnelson@gmail.com>, Tony Lindgren <tony@atomide.com>, Nora
 Schiffer <nora.schiffer@ew.tq-group.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>
Subject: Re: [PATCH v4 14/15] arm64: dts: ti: k3-am625-var-som: Set MMC clock
 pins as OUTPUT
Thread-Topic: [PATCH v4 14/15] arm64: dts: ti: k3-am625-var-som: Set MMC clock
 pins as OUTPUT
Thread-Index: AQHdQKUDcE0ywzI9uUWoDpMBLxOA67bOMpf2
Date: Mon, 14 Sep 2026 15:04:59 +0000
Message-ID:
 <AM6PR08MB525643EB520DE6D9A781EE7CE9BB2@AM6PR08MB5256.eurprd08.prod.outlook.com>
References: <20260909214743.899477-1-jm@ti.com>
 <20260909214743.899477-15-jm@ti.com>
In-Reply-To: <20260909214743.899477-15-jm@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=variscite.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR08MB5256:EE_|BR0PR08MB185883:EE_
x-ms-office365-filtering-correlation-id: 1120e26f-50d4-4b53-c20e-08df12718b8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|7416014|38070700021|56012099006|4143699003|10067099003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info:
 U/TfPjc9LOUODyi4PwIDyq6U3DEe1RHgxlYIfNEBAkRaU2G9fe9p820bZkTA3ubhKbds7C4lylyx5kD2LEO0PkvWT8m4x/mXFgsapS8Yks/gcR9u2EFdpTQlxRr9UjlaYGMoX+QJTv3OaA1gITOLr/xSOPN+JUKSuKlmtqZ/Qwb14AsJnflLZah09cAdu7C0Xp7HcPzncptc7jB5vE2NKpREM4KhX1rkUmdkCFJuFgE8z8N/f7y0HDmvZd4c8d/6eJjWgdSe0D8/8RJolDbro0wJJgbYbWndsVsoe7JUaV74qgXBqumr6yDPiSx6cTpLRPofqECmtLWtuDZO2HIGD7CGXabgFAxB+dIFOxNUZH/HF0q9Kzi1x4qkO4PasG93PHVrtK9xDwYtlxKsTfJ2qMx5eMedBFVNi+UIWj0IsVeGRRMLOSm3gifcN/EPf7x/YIpd8hkjDWk1XzZBeLPq8R2C0fTL3toC82b2hhmZBl1Numx4AqlPBB6Cbzj2vTDgWv9fw7NHIgwaHoiHdl6V/rDGYK+lvd24nmPYHq2z1Ra2ECSjg+tRuy0UKuYlVCCkF5NKSgVb+5ArkkO8XNbGI4fTdxjTwYTXnbGDQuN9I1/pR9SpBMKcArlxb7Ydm3mNW24GurUGfoBGWiTXscGk4j9xJs0EbPbybDnthlSSG0PoCX7zLR1yH/oQxCNIYcxfsfr4qtpSSM5rBZCgvOoXguGfXEixBzF1pzuC4AvYTvY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB5256.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(7416014)(38070700021)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?bdpdBVZBv2enpGOVYA072zUFCgCJ6yS55ShOaOg397p1d/qUEJC4PWVjV5?=
 =?iso-8859-1?Q?i3yRVTteShMrDUnNKZoAbQjEm0fTx+Ebz/0Wl9SmuFTiZxvf00yeK74BcM?=
 =?iso-8859-1?Q?zM0Fa7acQDkQS97uWfSLqSp7P6JhUGZ5dlFFKNrf0raXKkJoxYrGql6wH4?=
 =?iso-8859-1?Q?aZ+kMFStIjdZGo0pFBBC8lsGk42yi7zspU6TFzm5uYlSS8NIulXZbycE9L?=
 =?iso-8859-1?Q?Z744Qb+7jFlaarrdlC36LbLkWF9hOGeJSqQOXRlWtTFJ3qX0b782z21IqM?=
 =?iso-8859-1?Q?8bKWIvc2q/h28TcteRiYjUBg1hyFmwzHJj6/O7Rq3f8IZeuj4bCoUx7lb1?=
 =?iso-8859-1?Q?aTcNU7pQh0gqNbfMfZUywLZDN/Ed7mzdhWquUKkh6PIYLuZ2YUljMQE12N?=
 =?iso-8859-1?Q?GF3QRpSRrkeZvzEldHI6BRperEgOCBHdv94n6BPSncP+RxbprmYZxbNDBx?=
 =?iso-8859-1?Q?M7Je85H69Sa/XhfPuCYmaWQeo3tuaoSMOi8VkcuMUZpQkwa5rRIJg/C6WU?=
 =?iso-8859-1?Q?pq7XfEN2ycRaCPus1rxLGImwQ4a50LLyLfJbG9i1aox20+1H0T7NZlCNYo?=
 =?iso-8859-1?Q?LGIF2k6I5KlumzyQRmFLQznM4yoADusfEgrnjEl3UU3KvfkJyhwVwrTsrd?=
 =?iso-8859-1?Q?LL0EE+08wkl50pOGmztcYvizBQA29hbm3q1J88++Xk5ScFKM9WPMjHyLjm?=
 =?iso-8859-1?Q?71WNbXmY7wyPEB7YaArEhoA2MtllBLQxjT6X6YvsURXilKiHrX/ap6mMOW?=
 =?iso-8859-1?Q?UlETZwUk3xaVNmdhRcgMAPstQnwjJMIi9V7cF9QQP7C2eGdRa6rZCc2vwa?=
 =?iso-8859-1?Q?PNyl6EHd+sgaDWvY10LWLPZ3oIjFotgaaD/zb+LBWb9zEiVIcsRRSOeslZ?=
 =?iso-8859-1?Q?WFB/EasG9FDAZZIzGCldB2LVEjte/r78tfO7nXVmnAfpceX+neSwLR1qy5?=
 =?iso-8859-1?Q?KLKSJ60LP+8/XpguSH5F1C8Q7Hlv1lR8XOrnFPBFb5KZ3jY5WZKAvmZ6d7?=
 =?iso-8859-1?Q?XUNmHXiVunwAWJP+J7oOtqe9QEH3ug2/W8Xp0/yUtZyLEkdsLuMtLNfzct?=
 =?iso-8859-1?Q?9BoqIyndc+VnfCq62PekO/LbF5zlvxmESqV5tBDKZN8SSUeTeE65iVleZ5?=
 =?iso-8859-1?Q?HV1GW4qCkju2G9NtHsqz5S4ttIGKzF16a0OTqFEfDpXAZQSisNuS2VCXoZ?=
 =?iso-8859-1?Q?Q3t60FhZAqGzyYxGxdBFYh8BAi/F/9QwiFUYU/NUWCIo9Q2/UJqDKQruHG?=
 =?iso-8859-1?Q?9BcgkJLP22HEF1pxbAtRnYe+gp5VU3Pn3LDfAqKQfo35+BFBxQAh2Ixa+W?=
 =?iso-8859-1?Q?vzyY5xqOUCk0wmfplvS0hyCD6sNBm2LA1Q2M0iTX1syWr6sMtWf6n4J4Gf?=
 =?iso-8859-1?Q?ZGq/cqiekOtZjgI9E4fO1E/y77onlGFlk2baKLuxu1wD/A8Bl1Yzvrxt8N?=
 =?iso-8859-1?Q?WIt96GN6I1CKPLlspQQoYhY/A5TOsfXF8FRpDNDDXs2SGk2oYL+gYFfbXb?=
 =?iso-8859-1?Q?v/IXXY1g76RUDjokI4lQw/P8s3KwZ2cEyedAEDe9Mym3i6ITmjofmszAAi?=
 =?iso-8859-1?Q?byN2dlOl78GjgtShfhnltrL9jwsbHXOWp3wNBOF+XIAkYtFOVUgRjxTFV/?=
 =?iso-8859-1?Q?6ff+U+6ZNisAfj+eEDhlocmmjnSkkDeBWi8pCn3d9Gr5ghtnRgFbNTm27c?=
 =?iso-8859-1?Q?7qOd/FnQUuhbXR1MH6mVTr9s8rXicn9KrGM3bvmjdl/n0H+5Ao8c2Lp3H2?=
 =?iso-8859-1?Q?aRVnhvzleYsLaRlKkVpxu0EM9vsxXBbqUuNdw4Vi4uC/DoZw5IZ1MJUP4W?=
 =?iso-8859-1?Q?mHRLhFcsFA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: variscite.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB5256.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1120e26f-50d4-4b53-c20e-08df12718b8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2026 15:04:59.1608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 399ae6ac-38f4-4ef0-94a8-440b0ad581de
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /2+bT3tWILlwbi5Xu+TTLq6h5jZ6/Mn7UP2fTyRtxW3qWwXGIfFzbg8liiyTd20Ty6EL0Hwru3EY+zPqVC+WWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR08MB185883

> MMC clock pins must be configured as OUTPUT-only per TRM [0] with=0A=
> receiver disabled (RXACTIVE bit =3D 0). Change MMC CLK pins from=0A=
> PIN_INPUT to PIN_OUTPUT to match documentation.=0A=
> =0A=
> [0] https://www.ti.com/lit/pdf/spruiv7 Rev. C: Table 12-246. MMCSDi I/O S=
ignals=0A=
=0A=
Fixes: 887d9e03c487 ("arm64: dts: ti: Add support for Variscite VAR-SOM-AM6=
2")=0A=
Cc: <stable@vger.kernel.org>=0A=
Signed-off-by: Judith Mendez <jm@ti.com>=0A=
---=0A=
=A0arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi | 4 ++--=0A=
=A01 file changed, 2 insertions(+), 2 deletions(-)=0A=
=0A=
diff --git a/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi b/arch/arm64/boot=
/dts/ti/k3-am625-var-som.dtsi=0A=
index c2daa56c35e17..c23b6a90b8b13 100644=0A=
--- a/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi=0A=
+++ b/arch/arm64/boot/dts/ti/k3-am625-var-som.dtsi=0A=
@@ -277,7 +277,7 @@ pinctrl_mmc0: main-mmc0-default-pins {=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bootph-all;=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pinctrl-single,pins =3D <=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AM62X=
_IOPAD(0x220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AM62X_I=
OPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AM62X_I=
OPAD(0x218, PIN_OUTPUT, 0) /* (AB1) MMC0_CLK */=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AM62X=
_IOPAD(0x214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AM62X=
_IOPAD(0x210, PIN_INPUT, 0) /* (AA1) MMC0_DAT1 */=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AM62X=
_IOPAD(0x20c, PIN_INPUT, 0) /* (AA3) MMC0_DAT2 */=0A=
@@ -292,7 +292,7 @@ AM62X_IOPAD(0x1f8, PIN_INPUT, 0) /* (AC2) MMC0_DAT7 */=
=0A=
=A0=A0=A0=A0=A0=A0=A0 pinctrl_mmc2: main-mmc2-default-pins {=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pinctrl-single,pins =3D <=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AM62X=
_IOPAD(0x120, PIN_INPUT_PULLUP, 0) /* (C24) MMC2_CMD */=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AM62X_I=
OPAD(0x118, PIN_INPUT_PULLDOWN, 0) /* (D25) MMC2_CLK */=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AM62X_I=
OPAD(0x118, PIN_OUTPUT_PULLDOWN, 0) /* (D25) MMC2_CLK */=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AM62X=
_IOPAD(0x114, PIN_INPUT_PULLUP, 0) /* (B24) MMC2_DAT0 */=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AM62X=
_IOPAD(0x110, PIN_INPUT_PULLUP, 0) /* (C25) MMC2_DAT1 */=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AM62X=
_IOPAD(0x10c, PIN_INPUT_PULLUP, 0) /* (E23) MMC2_DAT2 */=0A=
--=0A=
2.34.1=0A=
=0A=
Reviewed-by: Stefano Radaelli <stefano.r@variscite.com>=0A=
=0A=
Thanks!=0A=
