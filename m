Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010057.outbound.protection.outlook.com [52.101.69.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4642937AA95;
	Mon, 31 Aug 2026 20:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207336; cv=fail; b=mD96+kgWC67xDqow/tX9Gj1VvpIWt1/vXSQz9MV45LMhzthnxnhy7U0LI1GGHSu1hnSfz4/KJBPZaR2FVoIAxETBbIr3nwV3E4NPIk0nblS9zo9fJBr8BPazvVIcwa+qljePq3DKI3MGj8oXCuzVv6ZgKmIDdn5Wb2OJK5Bkzok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207336; c=relaxed/simple;
	bh=07U2srK78SzqTkAxp3eNThPLuzMjkRf4P/OoF4BG5tY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=P52ett+LcTf8lIIsjDEoX2vEgFSPi5nATtnGOJxTgGUWW2rCQj4/x8cE22QAmkHsnynFH4P/UBwfbN9KG27RbLsis7L58WOU2redjMljC7Mr9Eucc0+krIkjK2y93K5XgvOgsVhyjggkjUquEMqSMIiP9L/4TMIk4DzqVObjnGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pODoxqjN; arc=fail smtp.client-ip=52.101.69.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pODoxqjN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvtE0zA/ZSpPFiSN+YAYQ4VOrMDw2dMH6s6RtJCfbHVVbM8Z8QyDNH0dMTnT5Mvje7pNIYDa6zrSr5BroRb2yc1qKZBTanD31BnN6kxws17N9n6fA9909ALz1M1fM/eff78KHz/AhhaSxjism72XoxKdtLghOFwa0tUbMj1TW15Ab/NDk3SB9kvRc7STb5l0BR7t4JCH7+eQdLCNaJkqkg8d0/fb6Ed68ee0BdLPjia2T+BnGk8XRASqBRMWgpZOuJDgNkuJWFLPPAFk10kaEKsiolq1zJF7Qz6YdyVa2T2m3Q8KnNwqvRUV2RXJEX5AdG3fmZavEH2r3wFrqXgxFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E34rbpYZaYYijtQZYux5AXbOB+XlF2Uma18tp+TaJlk=;
 b=dS6oe26AXZjjXit1ksIY1QMVCFuEGQx5bM5XaYajnm9G/Z3Pqtez7cZGSrwfBhhjP7T5ANtdYnyUPmUqevuC+gmbdFROUx9/+oPr3AqGVRdy9mXx/f550dgl+UQw6EszlQalccmWKWJ8C5iFGgGVL1NrVXdbJQJoxuNbo6xbLkv1/GHc2lgqE4vQLBAu5egBYIunfJ6IEVBygDaIetHW+ry3xzT7mmYNsTrsDSypqDpuI4TBTTZkAkwlnRjqyrWPviSlyPPQzKqhTTqdZVouLMCchvpgd1ZChH/7ZrFyF2epjTZQaXbNoCLWnVXWu2JFNDEXES6xZrZeyUo6uT36kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E34rbpYZaYYijtQZYux5AXbOB+XlF2Uma18tp+TaJlk=;
 b=pODoxqjN6g70Yd/2jza3rUsXTBU3wmICyvA8RZEw+PaqbnfUJDsTYMxAq3eAk6Q/ctFJlikdSvfR+BylzSDM/7v21KMM3++NTKhrVXiWhNIJKgextfZr223ob8FFbpXw+HyII3iBu1s2Mc4cYxLx/GJnjhNbVy7TFjqy+8Km3xV3Vf+SDAxdi7MWogJ/2rMfcXzlOnCpRknu9PYFt7QutnT3CKQvIR0FKW5tG7hyG2bbks+EtkDWovf2kRyb80PQz46y+jTQxw0MXjCXevy2niuuuJNxG5yTLYNnGyCftzC298U+vQb6nFseb+BUQ6yUIMn8smZ8FlSEEfCd3sPwPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11959.eurprd04.prod.outlook.com (2603:10a6:150:2f1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 20:15:31 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 20:15:31 +0000
From: Frank.Li@oss.nxp.com
To: Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	mfd@lists.linux.dev (open list:MULTIFUNCTION DEVICES (MFD)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: mfd: da9052: allow dlg,da9053-aa fallback to dlg,da9052
Date: Mon, 31 Aug 2026 16:15:21 -0400
Message-ID: <20260831201522.51294-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11959:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c68c7c-fbf3-4822-19f5-08df079c9b14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|376014|1800799024|56012099006|10067099003|11063799006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	6WoyiLY8Si1q2YGDnYQugvrQZmWkFqHdW0o9N+RU4Lp7AtUZj5DfDihQkqolYByCL/cMTYYUt1s8qX0I1stO+tn3DKv57J713b4wRuj0wCC+4UE1rMkXN10fV5XccKwtS3QjipHuxaPsUuidP3hrZFHhzQF5CZnOPDtxOve61NXVqNv+8c+W4MeL2eFl9gxB0YHWdg91qzTaJgDWtP5P6a16YsfPj5N/rei2CrtXkbEFWijYIbbt1XeZceVUNK+4yG84ut+Uec4dFrmIcWxC2QTZEgnfGAcouPKlcKk5IGLYP1FszWKhspqvKcFSElfO1/DcTDMVQISerfJan7UTfGfUEtobkGeXUcEAJV7JusNMEfHcqAA4MmxVX2mKLXGZyzNddpL83G3DhUiA1K0GmBmiNNjxlrKL8Xv/BoPkkFjjrqV9ihwgqw7Mr13qzgbvCawpnRd1ns+M0jrpG5xFZ/TCcJ09YyGDckh9DRPeBX5ORMhxxQbUa+9Nu4oS2fHJYwM1IpjzrVLPHNJwG3p5/11xpMEug9Kj+32WAHna/+fDMC27QqflzpKyN6Hh0F8ZQyetIocLWa9XVz3gyRi+f1II0qpZOpwVkgtMiPk6oAP3YbGc/voqwqVHpwynSH70
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J/HIaODeM4Q11D5nEWTigG3khBwA2Xw2uoJ0q2k5yB6A6fcgf0vFQJNPRttU?=
 =?us-ascii?Q?1rdSL2m1E/B4hArfG2MnKmi3/vSH5NOyrHoAcdG9BQK8GlWtjVi7Ub2vYCnm?=
 =?us-ascii?Q?kBHNcIVYpcm4gXcq4tgUO+kGwiQoFjN5KgjMRuzCL9Xw8Qtn3hGtGz1SYIY/?=
 =?us-ascii?Q?TvaHRq+9BoLkuWEj4SpS0yXsdBS8K5ZqB6Je/Vx+EBE1nv5Ruc8qlz4Hinog?=
 =?us-ascii?Q?X2zz1IOrFTG7omhjtp+eMUe8WTySzoZNPwIs0uHDPUhrFM31mBbiigsku2ma?=
 =?us-ascii?Q?LXLrm96e1fC7rMZqap2YLOIgmY270lxqi46DXwP2Nwh4yJ+RJ4TAIQTfPULC?=
 =?us-ascii?Q?0M+GklSFwiZEMR0vhVuv0v4SGWNtUMqSpDBTpSPGYqc/9jyb6FpPvIFXI1O9?=
 =?us-ascii?Q?LGrF9nhxUz4YNpbfXbiEnlSV4dlsUdat9f4uPImHBLhdCmwKAK6IXBbMX4hK?=
 =?us-ascii?Q?dwOm7HRaHXwloLvpZUfAClXCSW4NLULufkyXKIeuPYRGlrRqQ6+mZKDQtEY2?=
 =?us-ascii?Q?/JzbOJOufzjJ7VjJyzqaf3gChMDBXZ03y3JxrGfDKU2sP+NT9vP6GENO4eOx?=
 =?us-ascii?Q?gw6QCz80cTvax1bubtiy2ms84TpCZaX6MUBVGoDC/bGdSJb/cyuK7/CHtqgo?=
 =?us-ascii?Q?8pOCXrJnwHqLFJbjeWCYhmXghat5X5H3uiEYfF3048ieVl3Womb+caQolvkv?=
 =?us-ascii?Q?9Q9KW0OT/qvvHumsw2pLq4loPwk8/0TGm+sPuszrrW2Fc80iCFgWkiG6Bb/a?=
 =?us-ascii?Q?v1xkb7X2KtJFaH/jQGCWQy9EiTozz6+CSbwqXjPPWbSBoEkCrpVAcGGE9dBU?=
 =?us-ascii?Q?k6+itN+dSdql1o/H8IVxGgKVd+j1CIkyDeQbKBz/mw+V5PxRmXMd7pPjkqIx?=
 =?us-ascii?Q?tXM7ayH/1ruwqKjkSxCOuDIHV3CWqMNwnTqtdE/FuyeAatrD16RBwQ3X4wkC?=
 =?us-ascii?Q?urpfyrNDGD4GVMXXRha7v3rmwyZcI6cMS0uBRyq7k3qaqj1AKi4J0JTi9ipS?=
 =?us-ascii?Q?k2wsfKE30vssV5mJB4FJtimBLyl/yU1MDaCsZuougEcmOaSJAsdTdd7wWhKG?=
 =?us-ascii?Q?MPDO9IZA7EhoVOlJXWtvDT136cLIpuWz2injEWccK81XSiupjRr2l93DM0eC?=
 =?us-ascii?Q?CpqzZRF+m2xpf2J3uZhF4NvizBKO85nWMeellOUGMvbDIrTHPh6cnTEjHLm/?=
 =?us-ascii?Q?hlXQFryfy076dFBtkjsCrNOEGlI6xf0anFOaCDIN+bNZSbGkI+8miTNP28O/?=
 =?us-ascii?Q?PhwV1m+DsG3jEr7iN2Iw8yl8++X1R7acLkwo5iQMBNZR0lOl5US1sdikK+/O?=
 =?us-ascii?Q?lSvtMISCesfdV8cEp8Jcy+s/hm4y9MYfFhFESR0a5srcWjj0QxSwtzKC9Kmn?=
 =?us-ascii?Q?zYkhQkcxXkWbisuGamBGNOMLVcs+GK92GD7QXrSFabOgWydP1PpvZD67QdrH?=
 =?us-ascii?Q?8E9WNLnM0ffjNg60lshwzmh2coo+VkC8rogwDh40VtXquD0+BAS4WbWTFjGL?=
 =?us-ascii?Q?65dZ1qv5zxZX6L3bRSMcV2Blwx+/1Tt9cqQBsDtCE7ueEHZMESQWUZbfFPZh?=
 =?us-ascii?Q?XZfVJ3vy8+Y3zTm7Ipa28NTwKr6x3nr4L1hhnPwDVT28YhwmmQ6bt78k7/sn?=
 =?us-ascii?Q?P77rftEvp38V7iSBLy88UdxxrJJq1obZJgS5l0ZEQtxcaw1UwX7tNseJmgkV?=
 =?us-ascii?Q?j9lt8HlOXBzHglMfYM0EXgJCOV+7ajm/R5iHXaYDx8VX70PmzLfsGw8Zn6y+?=
 =?us-ascii?Q?tywuyBcVUrsWsmXA1t7Gn8h/ZX5RjzV0fM+ydLbm6hnKNYt2rogA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c68c7c-fbf3-4822-19f5-08df079c9b14
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 20:15:30.9837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WSCZGzzgbFobSopEZETEcOPtDg7dWPMA9cukx/PRd14VdHtoaHbUwdot1AHRY36a/Z3u2KOCDNLauCKljjeU9yYCgowR8gZqtFIRN8Y77wR2qexiJV5jQ8i3rDQz2GYh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11959

From: Frank Li <Frank.Li@nxp.com>

Allow dlg,da9053-aa fallback to dlg,da9052 to fix legacy platform (> 10
years) check_dtbs warnings:
  arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dtb: dialog@48 (dlg,da9053-aa): compatible: ['dlg,da9053-aa', 'dlg,da9052'] is too long
        from schema $id: http://devicetree.org/schemas/mfd/dlg,da9052.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Previous try drop dlg,da9052 at
https://lore.kernel.org/imx/20260404-thoughtful-placid-boobook-da26da@quoll/

but Krzy have concern about compablity.

https://lore.kernel.org/imx/20251107-matrimony-showdown-ba6ce6996b2f@spud/

Conor prefer update old dts.
---
 Documentation/devicetree/bindings/mfd/dlg,da9052.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/dlg,da9052.yaml b/Documentation/devicetree/bindings/mfd/dlg,da9052.yaml
index 1103a8cc5cea4..d1d23c7c4d0c2 100644
--- a/Documentation/devicetree/bindings/mfd/dlg,da9052.yaml
+++ b/Documentation/devicetree/bindings/mfd/dlg,da9052.yaml
@@ -18,6 +18,10 @@ properties:
           - dlg,da9053-bb
           - dlg,da9053-bc
           - dlg,da9052
+      - items:
+          - enum:
+              - dlg,da9053-aa
+          - const: dlg,da9052
 
   reg:
     maxItems: 1
-- 
2.43.0

