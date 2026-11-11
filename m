Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794428713;
	b=XilXjNffJOPgBfH/ZQmEsACRcLQ+2q7sUqesnRJ1LHkhrgWz2tZGZDywdRr5FpUwaF2P
	 cxDkOazQMwvnGya9/+XKfA6FwmHkPmaozrRDB8uPDivxaudWpueroKmnPq55MXSdam+KZ
	 kqAPycku4m4nkAUA+LTdRkmdiGbtf/DA9YfpilMQ76cZM8FHqfOqhG80eddf1xlGLYQk+
	 lbr+778D37VVpGmX0Pz52CobDlZq0NMs58TDmrESi7Vpe7JF87tz0wRvhwzWXjCQ/EnIw
	 Yurv7KnI1DbPL1n6QCPBgJuZfN5f5zapPwDUp3/k3xj6pbqygFVX8m2X/QNrKxtyxRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428713;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=gnzH4q7owPiZKmjuHrVF957jHf7zZ6R0abAqg7fzdxE=;
	b=SLsFPqDA0489k372abh28257hp032jaV9P8s8rSx03QrON7iQBXFyTl5Z7xf0WUcHXtY
	 utc24/8PD13Hdk7TJYdPMbZwNyZRm0vA8tOT/boT2t4T7FbZSJ3DlQxchklZHMSgBTp+Q
	 mwzBIfqVZujsJa2K8Fcf5DsWbiF5xckdvOU32JbIL+LASJe/v3lDX2Oqp6FpXsYQIq+u/
	 ZEd0h91hNx5C9X7ZeqWUc8o9A0wfKjCGmbW9Dm9FREJXgF08GKH+9QKPOxK9wVFCQcoY7
	 naXDIt0f/e9KoDBz3arohoHRuR2penMKNExLWY3EQgBdttQyzs4kaQ8dC/Awlb4nK5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dYM9miPo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.0
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011000.outbound.protection.outlook.com [40.107.130.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52410606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52410606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dYM9miPo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fx4eA5MX/AgU8GVpa+G75AuyKGKaFmNytDbkzH6KGutVkVNiKUIeRZpQutQllJEaIp+9d20FLsuL8trd/gFjUwHDUcP0+sb5PigrBB4YizNtM9sjkQevD4wndYirdUc4KJJSvqxC6dUc4E0/H5z0/K4rFl5zl800SLQGKJAOXuaOnNq/ppdKYI7tULiiJT7lvSZIkBJ+JOHyolxWCowhD7QWxLHui/b+D4gjwa3zplv0jRTzfagVBpSY/cBIY80kdoyGzKBVBF941bxIn5woMAcABNMkVyMWB92vGyGC+SNFCLwdw53QVLiABXEnIsQpV0NVQL+3vvF+MvmPyOiUeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnzH4q7owPiZKmjuHrVF957jHf7zZ6R0abAqg7fzdxE=;
 b=qZhxf0qezAk5RBX1GIPu9vfnAomGiKtkvy8QkVQeTI3eH1qpZWgjf3sW3CcW3JtSV/+e6t/dVxOgaf0CvBmAUq5ju8mXWkZkFedCFRNA/+rqFcHehZfrAQyoKIaDFWKQ+C7F8fXe8w1bUvZHcvYOnHly4NoNzciuXzuyn2NFbSb0v6U/qbq8v9Ugg04Gcr0telljhTEX7yNC3OzwfFYvOwYxlm/YFrLiBcIh8ah5RQg+rrkTyJUOmpKizA81igRzknaZ/LzWh3WYfZzUYqaY+N8VwFb05jbMvKVJFLD+MWT1UWUoG18UegWSQa9ruov8Tm9G6SLu9UU9y5c7oxhs4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnzH4q7owPiZKmjuHrVF957jHf7zZ6R0abAqg7fzdxE=;
 b=dYM9miPokmOO3srwA7i3n56eqQD0czYmkRPLG4TbpV15kje/kchXeCcqcoUo1xKH3p5W0T0ZCgb4T0eMqU6qEZb2IFuFO+WD3Z0L8jELx9oSX3HSa9V113dmwXjZVtW91102tEF0UC+VcuNSYgSms+z1mLPDruhBYifcwtpxLBwd7rOG/ctV+S++Nh56YJLLnQLF8mMn+wvo1tVS+ESiWu52SaIxlPMEvpqx4/41VGZLxbPdhUHQf2P8YIHi8qhkcqgk8RcXIFX4uZQKLkjZ/jcHd3iW546swDp81K0arDZXSUieaFwikI+tH7wFrnatQmn981Hev9H5EgMB68CfXg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU4PR04MB10363.eurprd04.prod.outlook.com (2603:10a6:10:55f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 20:25:09 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 20:25:09 +0000
From: Frank.Li@oss.nxp.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Frank Li <Frank.Li@nxp.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Chen Ni <nichen@iscas.ac.cn>,
	Kees Cook <kees+treewide@kernel.org>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	linux-mtd@lists.infradead.org (open list:CADENCE NAND DRIVER),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] mtd: nand: raw: use dmaengine accessor API functions
Date: Wed, 11 Nov 2026 15:24:45 -0500
Message-ID: <20261111202502.3860647-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DSSP220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:3d3::6)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU4PR04MB10363:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d620cce-d287-43ed-10df-08df4031e1a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|19092799006|921020|11063799006|10067099003|261021133027099003|261022075727099003|261022113327099003|261022105027099003|261022115727099003|261021135927099003|261021130227099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003|56012099006|261026135527099003|261026130827099003|261026121527099003|261026140227099003|261028144727099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hVSPCR5cTb8EirgtOf/Hcy3YyGMZX6mI9m231sWmVlUJxrSZ2eh8/h/iWcM3aWJcCMBklJkMrg/lGojiMBRzcdo6JXAkzc/WlZfxTmvwKD2rpvhXw2ckTFC9dF3oKiWVoWYwXnLy6h5dHS82wMrTck6V7r4CqOJ8ro/vRhYcTNZOec6L7KYmkn8u6zjjZr0emUuh1rot9QpbnSzbzbSxwcp9c95ssVozzXw294gijnmM92/86YSwrMTllcQ6W9MiuSEaIGrPiHz7IwKYy8kECjk2dFS00Wo73ypFWvm30LZNMK0bAXR2sMmpyaYCAgviK6lQSI0i8NanZeaMuQ2Otud3Hx5ag72JJM38Q2BoGGOYW2tCuQSTEpU2QYUlHOz6B4y5P/3JeeW7PMxlTS81rn160lSTyvE0VXUfefv02ZUO/WAHLm1lu3yXEcRvAK9uNzCbyTKNvnX9nHul7DfefQaIUHbP+1sd5ubXMbIQv/a4TvfTt1yYmEUspXnZ8qqkRg+QzXeROErVFsOd0nsesxZxeUPYpXkr2+IgKsHCt5jD6jHCVMFalU9gAvG0pPF5IEax6Jnp1W3beCqrU1sz25GEyR8ZokPBkNcFuiMshH5jFwp2ivVyWE9EfA4wawDERBbFENaFNhh5Ih/FBArNY+c/gwzZeSgUWGBWW2q07MYJQrb6c4brU6VjiJoqLaOM7DgoEFkNO09T78Pj6s+WRA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(19092799006)(921020)(11063799006)(10067099003)(261021133027099003)(261022075727099003)(261022113327099003)(261022105027099003)(261022115727099003)(261021135927099003)(261021130227099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(56012099006)(261026135527099003)(261026130827099003)(261026121527099003)(261026140227099003)(261028144727099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wjck7MX4rlX1n8a5KLdaAbSwdJ6HTPZ37m7LTG8SS+bXxb4f/VXQFVQqxEv3?=
 =?us-ascii?Q?q7/K22BwHa9XQ0B9CUzIc2tXL/oTEB3uDYvEh5ITajrrrGlXS5Z3/CCF+Vua?=
 =?us-ascii?Q?4MHFXZTkYCNw9Lwp01QBf4zpGWOlMbYdxIPb9EDYdRqK/4yy/BxO09XzU15R?=
 =?us-ascii?Q?1LDWUaPyO36ik5/r+73ViX4N1IZawfFwDHZtQheCBJg39O2tAbhHO8sLcrP8?=
 =?us-ascii?Q?xDL48lGhDcEjbHTELq8NNlPNQA59NzXMDrnb2u6khYbmwsyzCiKYeUm32w55?=
 =?us-ascii?Q?0A4HqwFYRBmyDbcMvacwWtyNz8krGHR9Bo8NokQ6Yr61MGXIh4UTtW5EtZy+?=
 =?us-ascii?Q?Do/qSu2EfZXJnY9ZVX5Q/A1L0kO9Wc085ZBL9nFcnBzV2YLFwOmKTwnje+qa?=
 =?us-ascii?Q?GVddfdyr9sHODZMORqvnr4VygPaPZGzoSjIhxmMU+mhA3fsT8RNfNlyvuLf8?=
 =?us-ascii?Q?UdjukaE6WCE/VcK1nLY8NHzhCMP594QVhM6xBX1IYtnv7t2WtkbHeyFNiBJl?=
 =?us-ascii?Q?A5KgirWTEXTMkcTNPFKE0qWAD3N+l9gA/RRTk+XAML9ruO3fr/a4yhu2rXSO?=
 =?us-ascii?Q?z47xBRBuwu8d01a6kxtdsD9cNbD03qikte+RQ01zEH1oGKnftHo7pdetpf1u?=
 =?us-ascii?Q?iFUViHyagSGLiT0dwjxEuUdHh+7ceCAPWuDtbZzyWid6YkQwX1YE2XOt+PaI?=
 =?us-ascii?Q?vQDOB6HthfA8xALKzf0kIL8teMzIncITn/HSluzrvAtX6MOemVIvwKzeab25?=
 =?us-ascii?Q?L4sBma85c3zuvi44DKxPrMTH4xjo4om+t7oWTr1Y7oBy7dJejkj/WcKvL7b8?=
 =?us-ascii?Q?yrV5vSWByhm/HxDvNpOw13GRqa5kZf8EHNCc6OtdhDqlTtQRzVFsqgdtE6uL?=
 =?us-ascii?Q?4Qszj8EX4SrmyuZohwkG2dC7yD6ErzkXs3TESeEQ3EzI9EuQziEa6F/d/GKm?=
 =?us-ascii?Q?ZJZwGrFgFFSoEyki7S2cYsTVSdvQmmL1m7nYQFMrRCxcjtS6QGsEXZpGkDj4?=
 =?us-ascii?Q?ClBKIEgiFCnYTPtXrMh2SUawFD3GTyeBDSVErlDDtjyTdghcDx4ahkhjDp96?=
 =?us-ascii?Q?7kLeFrZoQxuR86jK5qI1/eC4HAZhDLVbNppWNOIbT9ORvTqNfA2JyPLY60Zj?=
 =?us-ascii?Q?PIg21UZjtZ8hrfUaQyTj7C3Ueih+dAvBXeoEsEmfcN54hLGGXlh4gQYfjcS3?=
 =?us-ascii?Q?/XRxMIXIbMNmXmbxL7tssfE7eMqeA1dkTdCWpHciIgVljOjm5/nsgsCJlGMI?=
 =?us-ascii?Q?ROnvpLJlwbFcxwHvRUuadaUxs7OdTSvjfLoIygWSS7+JuVXZ8pBBglIeOA3B?=
 =?us-ascii?Q?/LgnBXLdzvN5+1Fp2bmJp4wOkI9Ub+w6UcoGv0HLqEpcj6FdHHO81/iU2XpT?=
 =?us-ascii?Q?sErPaDwcI6MAf2ftkK1tEaOptgOnTAjGvJP8WsX0NJQDwsKBCsV2SegDAicz?=
 =?us-ascii?Q?QsjVUv8pI34DmURIruF1yjVvfIjLuLkTq0r/A0fjIPiHRaTuuZtesKT21zqN?=
 =?us-ascii?Q?NPi9NWOSnDvdhesmtCKqbeIcY2RdAwkJ0yql5iqweUoRlA0r3PyzuTzreUaD?=
 =?us-ascii?Q?gfqSfhhP7XVMUOKdAaMddIWZWtJNq+yU+Cdf5s6pn3y1NkK2aA9AWPc5UoSb?=
 =?us-ascii?Q?LskDJNe/g7oQy8QnU2Wn/cb/hGIpyQt7+HhHzovld8GXc/gsUTfS6u1kxdjf?=
 =?us-ascii?Q?zl1UAkVHKC+z4ppwFJOodR2/e4YAzIjNzXm2Jwtx5LEHSd9JWK1WJB0i8SYV?=
 =?us-ascii?Q?RoIwWUJMxwqw6hLhJoKRo2NGPmZnMmrw2x9RLkaBDM+M893NY1M1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d620cce-d287-43ed-10df-08df4031e1a9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 20:25:09.4036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1/u5kMvZX+TCF6pZxpBn35wULPAQ33fspsBgZRiY85SOLnXShpkNwT8VA5ipvYsVKRK91aa/6KxlCy/FozhnosBWzBhJx+I2tMcoaV4sU5vbhrHTqIUdcfs2EcL/LSY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10363

From: Frank Li <Frank.Li@nxp.com>

Use dmaengine_get_dma_device() instead of directly accessing chan->device
and use dmaengine_prep_dma_memcpy() instead of calling the function pointer
directly. This follows the dmaengine API convention of using accessor
helpers to decouple drivers from internal dmaengine structures.

Affects cadence-nand-controller and fsmc_nand drivers.

No functional change and prepare to move struct dma_device to private.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../mtd/nand/raw/cadence-nand-controller.c    | 22 +++++++++----------
 drivers/mtd/nand/raw/fsmc_nand.c              | 13 +++++------
 2 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 41a5219a4d4ed..256a372119655 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -1873,16 +1873,16 @@ static int cadence_nand_slave_dma_transfer(struct cdns_nand_ctrl *cdns_ctrl,
 {
 	DECLARE_COMPLETION_ONSTACK(finished);
 	struct dma_chan *chan;
-	struct dma_device *dma_dev;
+	struct device *dma_dev;
 	dma_addr_t src_dma, dst_dma, buf_dma;
 	struct dma_async_tx_descriptor *tx;
 	dma_cookie_t cookie;
 
 	chan = cdns_ctrl->dmac;
-	dma_dev = chan->device;
+	dma_dev = dmaengine_get_dma_device(chan);
 
-	buf_dma = dma_map_single(dma_dev->dev, buf, len, dir);
-	if (dma_mapping_error(dma_dev->dev, buf_dma)) {
+	buf_dma = dma_map_single(dma_dev, buf, len, dir);
+	if (dma_mapping_error(dma_dev, buf_dma)) {
 		dev_err(cdns_ctrl->dev, "Failed to map DMA buffer\n");
 		goto err;
 	}
@@ -1913,12 +1913,12 @@ static int cadence_nand_slave_dma_transfer(struct cdns_nand_ctrl *cdns_ctrl,
 	dma_async_issue_pending(cdns_ctrl->dmac);
 	wait_for_completion(&finished);
 
-	dma_unmap_single(dma_dev->dev, buf_dma, len, dir);
+	dma_unmap_single(dma_dev, buf_dma, len, dir);
 
 	return 0;
 
 err_unmap:
-	dma_unmap_single(dma_dev->dev, buf_dma, len, dir);
+	dma_unmap_single(dma_dev, buf_dma, len, dir);
 
 err:
 	dev_dbg(cdns_ctrl->dev, "Fall back to CPU I/O\n");
@@ -3125,7 +3125,7 @@ cadence_nand_irq_cleanup(int irqnum, struct cdns_nand_ctrl *cdns_ctrl)
 static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 {
 	dma_cap_mask_t mask;
-	struct dma_device *dma_dev;
+	struct device *dma_dev;
 	int ret;
 
 	cdns_ctrl->cdma_desc = dma_alloc_coherent(cdns_ctrl->dev,
@@ -3169,12 +3169,12 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 		}
 	}
 
-	dma_dev = cdns_ctrl->dmac->device;
-	cdns_ctrl->io.iova_dma = dma_map_resource(dma_dev->dev, cdns_ctrl->io.dma,
+	dma_dev = dmaengine_get_dma_device(cdns_ctrl->dmac);
+	cdns_ctrl->io.iova_dma = dma_map_resource(dma_dev, cdns_ctrl->io.dma,
 						  cdns_ctrl->io.size,
 						  DMA_BIDIRECTIONAL, 0);
 
-	ret = dma_mapping_error(dma_dev->dev, cdns_ctrl->io.iova_dma);
+	ret = dma_mapping_error(dma_dev, cdns_ctrl->io.iova_dma);
 	if (ret) {
 		dev_err(cdns_ctrl->dev, "Failed to map I/O resource to DMA\n");
 		goto dma_release_chnl;
@@ -3203,7 +3203,7 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 	return 0;
 
 unmap_dma_resource:
-	dma_unmap_resource(dma_dev->dev, cdns_ctrl->io.iova_dma,
+	dma_unmap_resource(dma_dev, cdns_ctrl->io.iova_dma,
 			   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
 
 dma_release_chnl:
diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index e28a69ceb0663..7b5e74dff7bdd 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -486,7 +486,7 @@ static int dma_xfer(struct fsmc_nand_data *host, void *buffer, int len,
 		    enum dma_data_direction direction)
 {
 	struct dma_chan *chan;
-	struct dma_device *dma_dev;
+	struct device *dma_dev;
 	struct dma_async_tx_descriptor *tx;
 	dma_addr_t dma_dst, dma_src, dma_addr;
 	dma_cookie_t cookie;
@@ -501,9 +501,9 @@ static int dma_xfer(struct fsmc_nand_data *host, void *buffer, int len,
 	else
 		return -EINVAL;
 
-	dma_dev = chan->device;
-	dma_addr = dma_map_single(dma_dev->dev, buffer, len, direction);
-	if (dma_mapping_error(dma_dev->dev, dma_addr))
+	dma_dev = dmaengine_get_dma_device(chan);
+	dma_addr = dma_map_single(dma_dev, buffer, len, direction);
+	if (dma_mapping_error(dma_dev, dma_addr))
 		return -EINVAL;
 
 	if (direction == DMA_TO_DEVICE) {
@@ -514,8 +514,7 @@ static int dma_xfer(struct fsmc_nand_data *host, void *buffer, int len,
 		dma_dst = dma_addr;
 	}
 
-	tx = dma_dev->device_prep_dma_memcpy(chan, dma_dst, dma_src,
-			len, flags);
+	tx = dmaengine_prep_dma_memcpy(chan, dma_dst, dma_src, len, flags);
 	if (!tx) {
 		dev_err(host->dev, "device_prep_dma_memcpy error\n");
 		ret = -EIO;
@@ -546,7 +545,7 @@ static int dma_xfer(struct fsmc_nand_data *host, void *buffer, int len,
 	ret = 0;
 
 unmap_dma:
-	dma_unmap_single(dma_dev->dev, dma_addr, len, direction);
+	dma_unmap_single(dma_dev, dma_addr, len, direction);
 
 	return ret;
 }
-- 
2.43.0

