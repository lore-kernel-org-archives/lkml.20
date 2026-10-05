Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013019.outbound.protection.outlook.com [52.101.83.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE64C4CC63C;
	Mon,  5 Oct 2026 17:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791222153; cv=fail; b=nSloTTwNoHF6xOKPoSUxd98RJw+orSsPHqWULs+G1HxL0tVIsp/1oB/4Zts3y2O5Mh0iyRC27qAmhR4e1BpIvxqjY0rxaAm3gD2gFidk6hyOk8Ys/A6pTiJmllkoDpPQvQ5ADswQdVgb2SkL3RtRKllB6KmEZN2vf9yojGVVoCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791222153; c=relaxed/simple;
	bh=v80/2z8/Y5cERp4pp9GUfOyQp/93ZMcOmMzezA5yBn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bdVfwWtRwH/P0L8Jxne2bMQt1fWU1Awvl4Z7s4b3rW+sVYBHMoA/AGUR7+HkYl1uLadRc5nEusK45OhrU5T6EqGa/TpICdEuQ288w11IK/VMQhXrh7LVIFax2x3yMBz0kVdgP7XKBmEk3FXwjiVKAw50DboiTLkbXZw2HF8osUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AjXFkp8j; arc=fail smtp.client-ip=52.101.83.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AjXFkp8j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xiz8bfwSODdeYDn92vdogNk+pEXUjFySeF7LxphrTz7eJFGBGH18ygZslPDIjGljCe+NNZxPpxOZWeNjFKrJM1h2tNLeDqVHZ8VeiiGDDzPFRcHShy/0F9P1XOisDhJuFHvhqyK3uZkHaaA1bdVehdx1MMTD+0pAWmNQZc7cujNtS4Mfn6NFXMVcy5dnPhnKtWARklAM5hmO/6spH6Q+6/QGMLaSE8abN6bT/QfxAHbTylladN2H2yObqnvu8/pXIA5aeP5PDVmHH8spQMUUeHiZwL32ADkSy/tpG+ca95MGAsoOQgU/93RHri36roIA6bCyzGrLwITVRlMhykpWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxqTs6xHafInPqfzWfAQhTSq/beW8/e5cG5wsUwbDG0=;
 b=Bp6Qf+l0jZRnWR5Uf/A6dNotdyP31j5zBexUtaRebsKc7o6q4PTvgAAt0L/FEQi0Md16yv0WUSL1AW9EyXotwvuJpGVGck56xI+HIeOISDiBEdxB9vDYJY7Z4iztkk2sdt7HSPebjyOKi5F7rD1W244fquf6XNQvj6is8tuEt49jxNtTCwfMjtroZ/zzntDN4WVBCi3mP08cfjZS1cSYvc0pz68koNZ7NjcbFo4ct7Imuxt+E7j+BHTiQMnbCGzJkpjbez4Ke/lhwiYTCiNGkzPb+NML1F+3huN9Y17l+A5p+ihFIRT6QgyX0gk390EP3kjLhUm+AOMS/1h1LRxByQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxqTs6xHafInPqfzWfAQhTSq/beW8/e5cG5wsUwbDG0=;
 b=AjXFkp8jWXU+QbmMgqd8eQRF6kdHXqKjGpwGdIl/5THEw9N2bcaK3hir+gykwP12tHZYvC+G1TEFmBrOxV7dvTxhnm3HebBiLPjaDG7vqMv8O1coZtgFcBm9HRboxMqh/78ummxosTMJ4EmzhJnYPew7NatCCGAL6NfRDNbw51TTOgRaeRQz76zLLRw3gAr6h6z7XaWtxqqlAu37DldTF4ORP1xLrhk1v8fj/5TiikgMQw/+DJjrDbhynFKZv31dL1CiEs2cx2Id6mgTM7h9hGo+8vNL5nMbxeQ3bOFDMWD7llLp3fbpy8BJicIa4kLvnY0EYhMoJtI6kJOobw4psw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by PAXPR04MB8096.eurprd04.prod.outlook.com (2603:10a6:102:1c7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Mon, 5 Oct
 2026 17:42:21 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538%6]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 17:42:21 +0000
From: Mirela Rabulea <mirela.rabulea@nxp.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	r-donadkar@ti.com,
	jai.luthra@ideasonboard.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	laurentiu.palcu@nxp.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com,
	kieran.bingham@ideasonboard.com,
	johannes.goede@oss.qualcomm.com,
	dave.stevenson@raspberrypi.com,
	devicetree@vger.kernel.org,
	robert.chiras@nxp.com,
	tomas.babinec@nxp.com,
	daniel.baluta@nxp.com,
	frank.li@nxp.com
Subject: [PATCH v5 3/4] MAINTAINERS: Add entry for OX05B1S sensor driver
Date: Mon,  5 Oct 2026 20:51:01 +0300
Message-ID: <20261005175102.2358881-4-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005175102.2358881-1-mirela.rabulea@nxp.com>
References: <20261005175102.2358881-1-mirela.rabulea@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM8P251CA0023.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::28) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|PAXPR04MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: 61972fd9-5fa0-48dd-b7da-08df230801e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|19092799006|1800799024|376014|23010399003|56012099006|10067099003|11063799006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	dKwLzY9AEfjAcV/MAbs9Yp5Lkyw71nDa4E7VVo6+wgnfSGgkYDAQy65ykZXhmjyxQeHlN7q90OeR1kVQFhc0VILNeesw629YFmUBgS6Og6FOG9F3qLp/EWoFXzw9lIpt0I3lSfh9SiJDfSM1mkKvHO6l0pQkMzVi6kuCZ6CiVyUtdMGUp1dihCp5zrX65eplzazuV47I5gsdM3GcANiw16GzfwyWSuz5lsSKraHqY7Z8MqWoPS4GgSbKUXlH8G6ipEHF0RD4QXjtwZ+jT9LDUN3IBHjmaPeLn1xUOp+84CNdu8nLGLfWZRymr7fBCinOy2C5qo5ovyBS3k5iwoL5GtuSHhg1g+GD+2kSB/aZXNwDo2XHnudtwvB+GmtVnAMGL9/3rzXx92XVhcbI0KkGdw8gfokSV+GdcELX6rNnT2B8ldZp+oR1Zu1u1vrYHkZZmQlBf05CQ4ehqjbqJ/g9c18cAY3paC/yhQ8FI/a88r1EYZTxc2oszH9y3J0jId4Q70bYhRVdsUxPyQNcwL/27xV5l1YlHfJ2IVRJ77CrrfHgdA/OE8L7oK9yMwOwEoKx1cDoFSJXmgSpsF3ueYs4ZLWgU/18If3ngfmCBxqm8kOnSqDaB0Q6N7vMSCk2GMP7BzG74sBrqHg/UvgduvqC6oqrzcs0YoryaRYnL8P/ZZuflXRaIbCQN3234mPd6xbpikWCigdjmSuoRnJWIElGvA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(19092799006)(1800799024)(376014)(23010399003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w35mWDl85kT/nZtEyOB2Unt0vt6S0QzRBhFGFVsTFp/aDZyd68jJfvbd5Y5X?=
 =?us-ascii?Q?U/bgPKjWQ2QLjnTTgS9D06OOEo//pmqXnuCzEcuU6IVeSIFwZl03MnMZd9fS?=
 =?us-ascii?Q?XuGR4a18ehQZzDjq6R9C6sexx5A9r8zXsGHKXi+A3Jr5X5R2xVEeZzu8Mc9K?=
 =?us-ascii?Q?sST6G3P3AT98ss9Lhfjg/xYyFRh02jCFEO1dhuOMJ4ztyjorQsZnWXh0EJ5s?=
 =?us-ascii?Q?JThP8yi8O8mV8AMyv/mbQPd0XMKfReh7zXnbY/U/iCH+LyCBIu/X/HsU3WZ4?=
 =?us-ascii?Q?7UeSsdeO2OsgcRT2ZNsFUJpAEm8FYqq3lXVivTqBcp47FMZ/2TqgOYy8tdhs?=
 =?us-ascii?Q?FooTb/G9pfpFvEG+f5Bm3MJKEA4aAgBsjLrGusYXdjBmcWItJAfNzRtlW7ZH?=
 =?us-ascii?Q?kgs7vQghi8yq2bEjYkBH1xEhmX0PeEIpc8aHw1yRU0dc+AUkiIMfNv1YxfFq?=
 =?us-ascii?Q?SnDUV9/uwuRjcebfwZgjlFVpF9TAzwNW7o/zaJILH+iD3XkNZUBybAWQqV62?=
 =?us-ascii?Q?XXoz7DGwSAox9vSv+7f8FSmzo7CyifD5Xi+zI1RmsmmG461oTCIoawbMKXKn?=
 =?us-ascii?Q?KObHfqlr0l14BFfxBdJLwF/5ncrxZxBdZJ2E3kqTB/z5fnkCUFHJv7NTHJBR?=
 =?us-ascii?Q?OAP80VeQSGld0/nkr/PKglz8jdqoOoaRGTgANK7tqApO8QmlpgAQO0l/vIuX?=
 =?us-ascii?Q?ZnqjI8NgQrsCaM2ysPl1mmx5VZQSbjS1+JTrO4UwHzv6Ec6hteutOE+Zf/s+?=
 =?us-ascii?Q?E8tkE/EreBQpUinpb7W9HYxwW9DAdud5i1Rt+aMyhSB9IHC1GTSd1LK+EZJM?=
 =?us-ascii?Q?EjvhIBY026p4pwbfk/HcRBSTuO5bl5ubnAMpmx5Wsi2XtgMLl+oC/s4mMZdo?=
 =?us-ascii?Q?fd3DpS/3g301vaHGDjsQpNyinYdmPL3e4T83PdglR/aWJXbiDP9NMnECE1XR?=
 =?us-ascii?Q?0N7/N692da+Wl1K/rLHN5YcVCnnV6CygFNGf4lT6YOWjwINVB3veiRAmbWBq?=
 =?us-ascii?Q?EWr6qwqn7qoM5epMgOZJN9Z0Hf6BbJODLfk//T2bvLmACYoOGM2RFg/IhVfy?=
 =?us-ascii?Q?7a+T08E+SAtLXxgwczXt/XsGgGoVSigvwDdbPP9MT/lQ5ktIdDdsxZUxl838?=
 =?us-ascii?Q?V1Z9mX/k5FEARkJXkh0t91R2+GZuqD4W1Gb+zfEujSiWP/U3kW26BjAWRttD?=
 =?us-ascii?Q?FYGaaY5pLaHzIKdBmRtafeQajAS5ncPpmz4nPG6Xw/5DsaRvdro/3NMA02gB?=
 =?us-ascii?Q?rBHr3uCCY3NdH1ae74EN4E9hdtyyv4D/oSS4JHj11I1ZxuEPtjhqClX9MYld?=
 =?us-ascii?Q?Jf7p65DS1eKfzNTVrehJldBs2wSxFMQgUVTgY5FdoY6YTo6QmnJ8sSvGB6iw?=
 =?us-ascii?Q?jMDO2ej45ceJABSW5Rsbi4rphyDnDff0RXVxbMZGeQzdPE1GPyxMem4i6g4/?=
 =?us-ascii?Q?oewoM1erzvf9pRzaQfnaW29YVUINVLEqzXoL5uXxYp0kjNTtT/Zk8zVJ04qk?=
 =?us-ascii?Q?RDMdMc6u4gaEamtCkYbIgARUsA7uFAuqfmrm1Uai74+UtiRFIOGPaGeD1u5A?=
 =?us-ascii?Q?kFtepMGEZnB/a9zTaNXLuUShTry700UAOaLEEggCjKjJto8Zr+k1LgvYkoGe?=
 =?us-ascii?Q?saEpSmv7Rdc1zzUgZ2euzFVR55QEWraKQjuGYpjEflvsn3n+HbbfxY6Y43O1?=
 =?us-ascii?Q?la8x34vDmsCVpG2k60LlejIPo5g29dw4OvByDDxYtuS8XvZEoCVLz+B1+4fe?=
 =?us-ascii?Q?8ohpHsEjAg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61972fd9-5fa0-48dd-b7da-08df230801e5
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 17:42:20.9833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1f2+R4YfpkadP9/96GgmjQMyNYjY6LhO1HE0jqw6+mULq2pRjO+jHhlPXmIcO3M42Z4RYws38aDF3hgKUiZYYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8096

Add maintainer for Omnivision OX05B1S sensor driver.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
Changes in v5:
	Update to git://linuxtv.org/media.git

Changes in v4:
	None

Changes in v3:
	None

Changes in v2:
	None

 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 70a11f2ff61d..49826cbe34c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20650,6 +20650,16 @@ S:	Maintained
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/i2c/ov9734.c
 
+OMNIVISION OX05B1S SENSOR DRIVER
+M:	Mirela Rabulea <mirela.rabulea@nxp.com>
+R:	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
+R:	Robert Chiras <robert.chiras@oss.nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media.git
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
+F:	drivers/media/i2c/ox05b1s/*
+
 ONBOARD USB HUB DRIVER
 M:	Matthias Kaehlcke <mka@chromium.org>
 L:	linux-usb@vger.kernel.org
-- 
2.43.0

