Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010057.outbound.protection.outlook.com [52.101.228.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352F251A12F;
	Mon, 21 Sep 2026 22:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029617; cv=fail; b=gWuJFijcELQO6mLs0fe1pLOXwhf/uD+EOF3mzBrzqC5DwFXHvbIC0OqXvu0PEMPTQAysMgpkHLARsO092ZQGVOJmO8Ar84pLnlfxnRU1JTHUPYP6w/KOkGDh/0F+vqhvh2R28NcwfMGgRYGIWLo+SUMB698jM9c5kEf5Ipopf5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029617; c=relaxed/simple;
	bh=GzJ/L8DF6oZPJhvHMVPr3tAhJ43gevMJxOaMN3kzG8k=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BRDrcRnX+kKClJ3ZKkBKrRkGB0f+JKHqttMrs2v3YR5K+zHTptnc2BjPuTcjiDjStSrncqBKkFwgnHTVtvTJ7ukxxvA8ESBRQAQV+IragwJ8ZDLMiprX7dDvaNvlj8BP1H0jqvx7OnGUZF95zQXUP4w0jzkuNkit8dEAURhL0p4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Avam3KdS; arc=fail smtp.client-ip=52.101.228.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Avam3KdS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dYrWo+ZkYkZurqG5uVTjHAlaEyg8iZOVnG+/dYk2g4JTKj/zfdhrW+fJoExEQtKH/UR/PSQRb5JmI/c3gW2tiwcPK5eE0oXYrY79P/99N3nw3vP9XT3giSzQig7uYQkr57Fni2Lmds9usfi/hnFho7hKwEvPzRLICJYTSL3ov32V9FVawB2w0cxcEByMYFcfUQHp/Pq/ES836tDc2ZzHBufYAg8fWdNYVAajh6kWzAF8rMg28TE0nfNLVlEJS2kUZ8ruOp3RDhVRnMjbzLFdiGlzIM/tw819eB4SPVUjmLtsy24X+IIC0SZ4jNJ8/Io3IHCUirD/pdooSdOJoZu3CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRbtPu2IT+nmQM+t2sxA/ZqItvpMKgMcNpN/sABEZl8=;
 b=mhtt3oYJqwVoWceo5cSkVx1dAql0sBiORuLrN5KuIoKTEyjQ8CdlUzNMwXgHAUIFX6Lz2O9bjO0OfXIPIi/C8LxsA2TELlvjT5LmoVzR2iH8uKXroNOvSArNGN7ZBpcXQEjICpyhAG3Q+y+K1wvkkIeSEJ+RMaJyMoWH3RGMrxyVrnTyruSJ63ySWSEvAN87WwQBLlq9eSvPN61aAawH9EhEsO2WlpCyKO0hameYPrUrXz39tFCgSe98Lj9nk/JkEqLrWt52PfXaf3deaE3D9d7M5RadeuL3IHKU6/BDaeupeuCzeJ7wHzPrbT4cLtHW78Df+4x3C1fJaReFUwLMXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRbtPu2IT+nmQM+t2sxA/ZqItvpMKgMcNpN/sABEZl8=;
 b=Avam3KdSXjZGvE3OtWb/cVjwj+2p7H9fR5xZyi2go3IFM3VrITiMDvZTUwzXuxCTGt1lxgR4QvqcD0aZNJ5ZwP795Y56v+eHyd+bcZc2Df6ehOdiRNWMXPzQRquXRXx+0XitwSodkEX4BBTWmMdfeEw1dWQGXGOla2Ff3bH9UyE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYCPR01MB9927.jpnprd01.prod.outlook.com (2603:1096:400:20a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 22:26:50 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 22:26:50 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] Add USB2.0 support for RZ/G3E
Date: Tue, 22 Sep 2026 00:26:22 +0200
Message-ID: <cover.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::8) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYCPR01MB9927:EE_
X-MS-Office365-Filtering-Correlation-Id: db8a51dd-be5e-43d0-4e02-08df182f6de3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|52116014|366016|38350700014|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ch3I8iFUbrifcJ0+L/8jDK7g65uItHbgPBpAhJB1nixilCrDIg6mbhKxShjr7zhUGH9MZCXkNRFOMOOfaBBgFs+kOAYPywvnkVfS5sciJbJngmjFtBkOLnr0NJx9SKL7fxIrXHIAx3f9YL3pu4TyxRik7hZYHxMhVqY5wZH2Sk96PFz8uPMmkJzt9cSr6LjUm2Ynpq//Phx6wllyiPdjJkvb6Sf+Zn3mqnicZ36UbGu+YFm1TTR31U9tqtNp+QTdifs3r/lU7FL/FWGtW22qRPLWWQzrXMkyP2j5Lu3kvoRHpknvDpGr2x+fJc24Q1gjySCBEd99tFCNuBKrf3qfUeajv079d4GRxm7QtFTAup8tYAkFnXWIJMGXRbGOlorQRS0cQw4g7t5vGcWPc1nd3H5YIFXcDf02fHtI82ZilAvdKE/ukyTQBzznF3IekiFqSAbKliq0Ft7X3mr2HwPD6uHRtCqQMM8YalfaWyoEw3mX8Z4t0JXNGVFmxbkelTxVCsUmdcd6dwJdujNLH8kaKscPXY77J5mlRvSKtNA7pQvdKiJDG9E5FMy1xglBmnXNdtm94EE1UluS4at8pIRYNipYOmAO/I4Ba5+8j1IN+HuCEycI+QV1M3E33zbHF8KLAvvQL7lJt5YLQA2PPMnkvkEoSzA/PwsyXj8qcWr3zs4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(52116014)(366016)(38350700014)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/Yd4zIq627NTp++nvAKgN7spIgh0iqZQIT9tOcrnb/SFqNMx1fRLPMg9Tp/Y?=
 =?us-ascii?Q?DCi54j+E4PcPU4qHPnQGtD4fA8epB6LouRphq0WFh1l4yJPZ01KcvPrYRlXs?=
 =?us-ascii?Q?lCiRv483BD4GClDs8ueUdwv7ps9Fck0lG+p5ilUwuRuaSw8lvYjaiSNXG+u3?=
 =?us-ascii?Q?MtF1qCU4xtOSsKInp3aHyCHxkL9rIOpOUSWibENjfxZU1QUzJcvsEriAhB4v?=
 =?us-ascii?Q?cLjbko6PulfzXme9Glj9c8yfiCymsNMnwUS90AYVqA8DFeVo+ICuGHQpdOhy?=
 =?us-ascii?Q?jz91xECK33B8C2LoivWFRNQc+KWZZ1ccbyMK+ZxgjGYQHH7NiVGkmHDK5Eqv?=
 =?us-ascii?Q?bTvMQgMbuZK788SZTKIrSFR0QsGkE2NJ5ZTiKDFN2SsHCWSxrz9r0LXY/fSM?=
 =?us-ascii?Q?bhFlSVS41lUkmdexE39POPaqEVazQyqv0S16UEIHxZQT6NZOakmjj28Wu6mD?=
 =?us-ascii?Q?ILbjsKwuTpNyNvSXpms7cFMrLPZL0tNlBpmKpMuLSM/jAYHK6NubSJuW0ewd?=
 =?us-ascii?Q?Cv0hLca88U6bIwuDLyvSwla7YhnRILUiwfp/Z9jAq/JMWUrG8ui1TN5xJVjs?=
 =?us-ascii?Q?bLnXQQLcfTsZ3ucWCB0efJ/N67WcZls1mSiHjhKQr/ScuOoU57GNJ+c4gcpK?=
 =?us-ascii?Q?s6Jt5FD687QDqK6qtjoEmWyM/hDdTpvIakyIIffuXLc0FMX4EYbUZFHFkX3K?=
 =?us-ascii?Q?7hm444Q/4IXLgNq5z7sVLV/ItiWJ2sJHkQKd75+hDhsgVe32gEeVQimE4JLu?=
 =?us-ascii?Q?7Cd+3/XVbaiXBjMhSBhHolHpML7ipWXxPuSThMtp+eTSxf7LUB6v008n9jlC?=
 =?us-ascii?Q?3k6qey1TcBspnQjZ62LCLQF59NhIp4wRSt6CpYMLbpjx1q6F8VlWGct/anqL?=
 =?us-ascii?Q?6HZWTMlDfGdaQXY/M8JuQJHPspNYv3L70mzNAjG2n0QXpk5SdsTJea+LdwMc?=
 =?us-ascii?Q?zHIv0/6bqZx6sjp50owqfLc/o4K2sTqdYu3GJoTFqU5OHeUYTzufKFf4ugps?=
 =?us-ascii?Q?5YVhDqHeP1ngwGWjh4KYjZz/gL5vf2y7fYJ9mlk09XQa5UbtM4xrS1TtbpC4?=
 =?us-ascii?Q?3ACaU++WrMtclcfepH7oiGfxfE6wnwrp1YpmP0WgKRKSi06MWJidYL/AvHQP?=
 =?us-ascii?Q?O1ie6XtcpEowHte1VO17ExLJ6+SyXy+AnapHzmmmsZi/co8XECVgGO1XBp0Q?=
 =?us-ascii?Q?BNLMnIm+ji9KAS2uLSKcSraZp68eQNYJtVnnoLlRrRxOJjh5RcTSYnwvF27e?=
 =?us-ascii?Q?byEiyU3N5sKTVZzVApMIWvGSR6blA4TNn2je8vx4LLfXbTj2t702Shr+TRnA?=
 =?us-ascii?Q?d2Q0FMErQE2yBow42i+B4kokkZDEBEjnTS3+JQwpLncXFwdjlCFIRUJBC8Ou?=
 =?us-ascii?Q?dPIROQVl1CypQFMW7taydB3lzZyvBLVYUue44/+fPZsMXTVg2UWXXWfLCSQT?=
 =?us-ascii?Q?oKFUwTZ1brgRWptDkCiCmMGOlttRscobAoX/p29c12ifKK3YeUEWK+dV3fsO?=
 =?us-ascii?Q?GjdzsxXSSz/YesumMr22ghBV8kA8270hwR893d8/Nr73G46RxnvB76g7gCCe?=
 =?us-ascii?Q?fXCSHGL8uQzaFomH43SUbFI2xPJakO4R9VIzNBCNvGpLw/pkqJ1mAjpKhsWr?=
 =?us-ascii?Q?WVDrYsyvj3aWqa3Zs26+DzTnJiN6Ef2z2OSx4Qo4d0Et3rKXktoSR1iaO9ZR?=
 =?us-ascii?Q?Go2y1LiDawyATO+eohhx3JNxJzxZ6kOcVJS+A6FAJT2nBFolLVTsOqDLzwG9?=
 =?us-ascii?Q?E2+5FwIFAdqJLTsXD4SIqvbJ+yq6ZwYmbhO6nhZlB1VdWrlHNkjP?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db8a51dd-be5e-43d0-4e02-08df182f6de3
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 22:26:50.0404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XfTf+vInTyVo9+Y59YHUd9mmcWjOyF+oX3SXddbU46pW2tSI7qZxB1nQGCQQrJ28938KFvMUFOi+Y/BCPeMGXA5mtbTyA/8OtxDLQrIE+AK67rDCy+dKwxEP0oWNRArH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9927

Dear All,

This patch series adds USB2.0 support for the Renesas R9A09G047 SoC and
enables it on the RZ/G3E SMARK II board.

Kind regards,
Tommaso

v3->v4:
 - Readded v1 RZ/G3L placeholder patch.
 - Drop usb21_pins.
 - Collected tag.

v2->v3:
 - No changes just rebased on top of next-20260908.

v1->v2:
 - Included PATCH v7 7/9 and PATCH v7 6/9 from
   v7: https://lore.kernel.org/all/20260812141940.246223-1-biju.das.jz@bp.renesas.com/
 - Drop placeholder patch
 - PATCH 4/4: Disabled RZ/G3L common nodes from r9a08g046l48-smarc.dts.
   Update commit body, and improved usb20_pins, usb21_pins comments.

Tommaso Merciai (3):
  arm64: dts: renesas: r9a08g046: Add USB2.0 placeholder nodes
  arm64: dts: renesas: r9a09g047: Add USB2.0 support
  arm64: dts: renesas: r9a09g047e57-smarc: Enable USB2.0 support

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    |  25 ++++
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  20 +++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 124 ++++++++++++++++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  31 +++++
 .../boot/dts/renesas/renesas-smarc2.dtsi      |  25 ++++
 5 files changed, 225 insertions(+)

-- 
2.54.0

