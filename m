Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011054.outbound.protection.outlook.com [52.101.65.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8323F926D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678229; cv=fail; b=ga8V6lievTgkAb7KN76La6uaipbkyxKLS84o8zXmze0Ktj2zsXmD4yBXCUY8SN6MvQBfaVwrQ6xe1/vr3z0IvTQLXccjAjime+cvM/qYBOc33FYAG+vgXA3I894tgsKnKcU1Hwo5IJvcUdkWqDbDhkZZzf5i6F9GM+hPSgxPIeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678229; c=relaxed/simple;
	bh=/Fgv/dhwQL2MfGtrm/XuvheBxcgiyiOzKMCFifeJ6ok=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=n3ocJ7/UouyLNYKzqriY8mIoXHWhlv44srvHari6EDSirDrrvrqOUq8iBHmTgeXspiKbbo9Vakav9hvdu5DcVRrI0t4xxR9+/ftU3tENLGdg5gH9G8OU0jhqIWlBwWLMtBM0FdK7r1KB52P///DyzDAouLvRrSoyb+u2sCPBD6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bfFcwM9t; arc=fail smtp.client-ip=52.101.65.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bfFcwM9t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+2aKpVXitfTEh/Godv/o5GR5yg9s0Ht/ipjVtPR3iSGnt6CPXw3DlFvIrlGYvt2jmJk1uvQ2Ym7/qzGlrm3hN/F9KxNSoB0MjEoZ/jm65jRp5W6yy88qy/YLH5vJ2XNPAnw+sZNvKk0JOQdEtIkgXyM8ghpfm/JHai8D8hOI3qqcPpJwSt3sScQDJmt2IYuBrO+aHrWGSmqTQuH7rrjUOqCqFT0h06cPr1adfnWew8/pPL7fOImSAGx8ySN9Y9DvTbII1WAFb5CPBi7fwjJKPLNWK5fmOIRWnYeNgkyrrIe6NWsvpqXvvGkH5t+PVRx1yzbslny1CgU+EdHYvs9sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHuHA7Kncv74QS7awywouJe1gsvwPcIahW0IyXeiCIw=;
 b=yWEczWfn3HrZ62pxxkadl61UEoELVNxPPetTtmf1EWHw48NNpLE456XtBjvTPKC2CvEgmFEjCk0AWqsvDta3fpK0H+3K0jlIjLZLnErKsafRGbObVEv4BMJL/Kz/oC4YCF4N62RDY0l0otLzm4v/uWQB9HFdQfLdAUcgDxalj8A6zbZdtYmd7P/2q0byEoMKGQO7FXqroeop4JMMfWw/mNi6nDY5QQryLLBvcq+MsPvymXq9WuiZEoLMV4iaAeYHOD/0jP1puBlwxKEx5QAg8GyQvGKkZ0kufa4NBLSCMiYZ5qe+IBSY60lhqxP54ZLmuByS1XmiDmDBeRFX0NkftQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHuHA7Kncv74QS7awywouJe1gsvwPcIahW0IyXeiCIw=;
 b=bfFcwM9tGNVozJVSLHKk6zTiTr0fF8gO1DVOpQPb05eUYaYPeqsrS6RMk9KZMzN4hugqEO/p5FF1PlPsKCLTZ7DxoYhIq5jrKUCqg/c39DtAGs2AEBaFrez87MB7WN4v4VoAnoiX3CE6NlDL7QjYOV4h/MoZRDmWv5Mjt5xg46kmA+2502y3PGNFe8kJfqxqzwKw6xXguR4AXv5rdmHLSF0vnt7+QUwR5jelWt0jBl2rmsMSYG2RhLzlNIYodb2NkYve727qx4P7+Vl6yb7PTfHRH7k5cB+kKYXW5AsPPXmyiViowotgASN7gDDH4nIKOYpTWF+BE4hfB8QRCsKkAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by PAWPR04MB11572.eurprd04.prod.outlook.com (2603:10a6:102:50d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Thu, 17 Sep
 2026 20:50:24 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 20:50:24 +0000
From: Frank.Li@oss.nxp.com
To: Matt Porter <mporter@kernel.crashing.org>,
	Alexandre Bounine <alex.bou9@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Kim <james010kim@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	vkoul@kernel.org
Subject: [PATCH 1/1] rapidio: use dmaengine_get_dma_device() instead of chan->device->dev
Date: Thu, 17 Sep 2026 16:50:12 -0400
Message-ID: <20260917205016.1293317-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR13CA0026.namprd13.prod.outlook.com (2603:10b6:930::20)
 To GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|PAWPR04MB11572:EE_
X-MS-Office365-Filtering-Correlation-Id: 3afb18d5-37d0-459a-07c4-08df14fd4b61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|376014|366016|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	0tPOkOyHjcxGLvPygM1sfWLKhIEgr6GKVImRXkywTtvcvzi9fdW9ZR+ORAGmX+nligSxLEPJaAeXGFpg8H2TQBZCPIIGWNYiF87jQw10WyPSc775+pkERzk66qYqYXd7OpgfHYo5OKqtCcmQS9+qyB+rm/8JtQzdwsmg2YICJMGCggz7ZzbksAF/H9Md0HqhDSG0uObrbtr0rfR2/FLhjrLkQq0kRPKTcARc376F+TxBjGGw3AKtD4HW2OTpL2IHsSM8WkG1bitDAUU7uDQ6qm8T+sVS6BM5bpyNKUPLEKvn0fpAWxOJwRWZgS7P70uf123MV+TN6Ru3vXmzmhs/J2vFEVa2/k6iWi7jt55SifNC9nyRAeunLYnVP6QwpjIaWxO6+vz4YUEQtwbvyVFSqwg8mHJGB/yBrzP3pO7rzbUrHT8r4LV6Bw+60iqdEVkIOtbK7O9R9jQXCWUOC7CigWBsC0ZtZDWvINki66J+nwYBFmpdE4PBw7rId3KI/MvjCNfNIyO/E6lPaTJVpUYnjw5qxjM7BJ0Xmk5uXCL7FnIAEwRywLn6JHvQjlAvZIUiBlukDd+OqqoJHtQvN2VpFoCZwO37YPDxOpdh+cZW/FIPyAw5xEOOZNYeivb+tG9DcvzfNpxQ+gNV+96fsNITrE/2Rnt7pWY3Ref9bRdwtwM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(376014)(366016)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ilRbt6ZmnEmktvk0YgHJMHGZsNDEGYk+jmXotuQiKL0cO842J/8SQN5VXtK0?=
 =?us-ascii?Q?QzRZip3AU/NQkDxfjGhTpKRZlU2oGygOocj/TjJEDH4xJ9Nj8iLXSqIsID1k?=
 =?us-ascii?Q?5mI2oktMAGxso++9Ds5BecHdiF0KM1r8gFdaUGkzmhBLntprgurt+6dvDiUZ?=
 =?us-ascii?Q?HI1Il5mY9NZ6ipI4uz+qOFnIQLSnWYQhpHabdGMv7iIZQ6BxGTrjSQXkjFvI?=
 =?us-ascii?Q?pF3qNLuaOnCcnzaQAuPtnes0vJXqXz3n30uKjyqB+6fv2RCpzIK161SaX62M?=
 =?us-ascii?Q?cJgxtm/SNXQ6A9hHd7qje9J/gK0+EJeaHVF3p2iPbEF2ugpp3kQshjKGg4KQ?=
 =?us-ascii?Q?HbwT5PnBHnEz3aC/G9rpnV9HlIfDR9NOvnVJj9nq/M1G1O6KBsAFw3ix/gsI?=
 =?us-ascii?Q?/IAqVJO+oeqsYNiY5pZp/jE9oDLzc7VLarJSGu+RUgMwLnuXfSmBiDZftdWO?=
 =?us-ascii?Q?hW0++eyZSmNr80C2OSsiXFRCDT+t6xURGUYaZZBCKkFqEwwpSxx66SUWBP2l?=
 =?us-ascii?Q?F9bmQqPFYfg71ZyUDPv81wJUUXUFjtJihHg2fS1mCGwxh4kWpE0oQoMiVTEi?=
 =?us-ascii?Q?VgtrU1CCB7xp/liuSW8yvh3OCRmWfqpzuPza5UHY8TM9b0GVm6yx9OcQcfye?=
 =?us-ascii?Q?OzAHmzFQdguon8mGuEPk+iW5FSIjm/k75wh0AcE47swoLNzLlBJldukQbFVA?=
 =?us-ascii?Q?r4RzXHvAJzVz+0OXwfjDzs9AfyFqsQ4BfbjfuWKy7s3dOKooypcEHZIVkqGH?=
 =?us-ascii?Q?enwab+GR4Wq9bPzMVWBnI59hMbfKyEcSumsSu2tt2cWzGGp7IK56WkK36t8S?=
 =?us-ascii?Q?mjPkX5847wFc1exejPm+jgtcJSe/5hkD62X5OsqxjHr2pUNT4WCOn2XoLwvX?=
 =?us-ascii?Q?ue7p41+Obl0XLBaNxC2CrmD4V8z1jo2QgeRIeNj8ZcRBW8wdB7JD00LL96UF?=
 =?us-ascii?Q?P6TPz4Bog289O+3dcrOJfZhqrLEev0plcSbsja75OqSALBjmctAS0/vO2JRr?=
 =?us-ascii?Q?qNFe/KMna7ly0dgcqY6n44/p64MTaVe8X8Ebig6kw9WC8tFdp/Nbym5YNb0m?=
 =?us-ascii?Q?qV9ILXtSYnmQlES6ljMUlAopBojB1mojAFfaa10koIjQl7oYrdDbjFTy7P9L?=
 =?us-ascii?Q?kthXsjp6e0QWNNkE8ZVF1uYb5HYb0de5FvSD1syIp0MwsRwOU6RnzC52Kkxw?=
 =?us-ascii?Q?nRhUrkaEYkc1VKXX5J//QEni5NVorJARzZMosGEw5U8HWWFiuz70PAIuaGqg?=
 =?us-ascii?Q?78YXknsm8Q7XV5CUWa2Le1FO2badst/i34CZzwWsfIuY8yqz6KO3UOXkw13M?=
 =?us-ascii?Q?na/XTUzaEGbO0PpidjasMylZB21V5umEdzsGv2FTePhfcfhiy/E+FUET05jA?=
 =?us-ascii?Q?GnVr1IYT4DXZaLOiWY9695XMrhg8/Q3xSmndzNA9sZ6PsIhcqIta6ZelgOBe?=
 =?us-ascii?Q?CY47sWvZqbb+tsZDNZADBYHf8Rb+2SrG8YnqMqd5xUoIrKKrsaAGKXgPLtCv?=
 =?us-ascii?Q?wbBTRpK150LT50ipJNn/OVXUQKvWxdJrqo8LSr9jwAaMfyaquUISb2XZQVDY?=
 =?us-ascii?Q?X0MrCZKFMcD+MW7kRgA4ZrmO1RA3jixkoiRD+xagLzoFGn0qsrO9FLhq1O5D?=
 =?us-ascii?Q?GE/HNhZb4RqiA5o7cIDr6Hv+6AvGWpScm3iAPUZNyCLZCdver06zizR0PWGt?=
 =?us-ascii?Q?t1/IFr3GIxe3kBEwtOSxABukcmo84KFPfi1gQE7gwSX/Cjf8gOBrUNIlr9Rg?=
 =?us-ascii?Q?TrOdesQjehO/8LbV0QlIWN33+97O+3PS//cxL2gFDaYlKz7fTQk6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3afb18d5-37d0-459a-07c4-08df14fd4b61
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 20:50:24.2666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zsJsbex+v0AjVgXDQeKEsLggsHzRHHGrg5okEt6zchc/ElX4qKtHXM5EVKDR+SKVtA5krRzZQ/xWYHCp7rC/VVOQfOdfPLfDVC5dJfKSjnKlArzKyGSswzJi0/92e1Fa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11572

From: Frank Li <Frank.Li@nxp.com>

Replace direct dma_chan::device::dev access with the proper
dmaengine_get_dma_device() for consumer API.

chan->device->dev is not always the device used for DMA mapping.
Some DMA engines support per-channel IOMMU mappings, so different
channels may use different DMA devices.  dmaengine_get_dma_device()
returns the correct device for each channel.

This also prepares for making the DMA engine provider data structures
private. DMA consumers should not access DMA engine internals directly.

Assisted-by: LLM
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Cc: imx@lists.linux.dev
Cc: vkoul@kernel.org
---
 drivers/rapidio/devices/rio_mport_cdev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rapidio/devices/rio_mport_cdev.c b/drivers/rapidio/devices/rio_mport_cdev.c
index 47ba34b4afb29..40d2953a9a7f9 100644
--- a/drivers/rapidio/devices/rio_mport_cdev.c
+++ b/drivers/rapidio/devices/rio_mport_cdev.c
@@ -555,7 +555,7 @@ static void dma_req_free(struct kref *ref)
 			refcount);
 	struct mport_cdev_priv *priv = req->priv;
 
-	dma_unmap_sg(req->dmach->device->dev,
+	dma_unmap_sg(dmaengine_get_dma_device(req->dmach),
 		     req->sgt.sgl, req->sgt.nents, req->dir);
 	sg_free_table(&req->sgt);
 	if (req->page_list) {
@@ -916,7 +916,7 @@ rio_dma_transfer(struct file *filp, u32 transfer_mode,
 				xfer->offset, xfer->length);
 	}
 
-	nents = dma_map_sg(chan->device->dev,
+	nents = dma_map_sg(dmaengine_get_dma_device(chan),
 			   req->sgt.sgl, req->sgt.nents, dir);
 	if (nents == 0) {
 		rmcd_error("Failed to map SG list");
-- 
2.43.0

