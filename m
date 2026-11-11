Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794417219;
	b=tETykBWLqBCtpW+5QuYLxR7hZOqGuDu1WyUNC6L40XLwamVtdpuiqrO5xDHDTR9tf2P9
	 DcvdC7rjOsETzoI/1FscS69dML84DmfFf2C3rAw7wqvvmnr3s3aDlG+ltNVx1gBVQS5kW
	 1MFrlZA07qpfjYKfh3Do8hvhMkSeZXjwEaLT+b5qZ+u2dFsVLjY/BwmkT7n9waNTSeDeq
	 Fjyrj5QM6p+bHYMfLIjVt2bfuJDXliFswBsEZt9K82BKAu+fth08nhlmxt89QOs0nF1dW
	 rkibMS3ZRAhY9fMLqMOnDe3tgyP8Q3hlRxPkInAArmOQQIpmZS8Na51opOAXha/zFqw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417219;
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
	bh=JG06NaVvVnvwu7OzMEyIC6gEHaXMxVKLUDfPJ3H8sx8=;
	b=oYk2AosCDQgulymBWYhCRDyBkbLDi2GPq/oPkcAiMb7e5nbMp+kSG4GDbxMXhW34LnbE
	 94MIeOjcl5NbXQg9vwwZIyuNNchTtsRl++nvRWdBAB3oyZCvKyjjnjo0CbXuA7/4nQ8wY
	 sw0HJJCc52oq6JiL9rRQkHngz9G28nM6jAgPvGiHKcYcEpv7qoaqIbrLkV47JirNUXz8J
	 VjizuBkxKEWFEe5UxhrdYmLCS2r3FB+a2jP1fzQqpqjRdh0ULUwvibBLmD1oUuYxr2vpd
	 QpfSNCOmdd25ovgewxNtbN2pyvbngF2lWHqGrRgJ/vdcQloBUTQvpN6VXwkfEgwMY4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dvImE6rk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.26
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010026.outbound.protection.outlook.com [52.101.69.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F77606A336;
	Wed, 11 Nov 2026 17:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73F77606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=dvImE6rk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v2n+PfCExXGkXTrQANJXvYA67TZoQb47eLbP+UNDkDWsKrX0L440cxNZaB9tDOAlDkpsl3n1jUI1PKzUNJhlaokIioiaR0Ih2+JMZqZQxik6v8aaqvuligTkGDfQdTDMwIBKxyADCXRaGjM+bQ0rJhDhlssuKJTuIsJPdh3zzqKlXKVsaiTV8+eDx4UzD7rbsqZP5FqlX83MfvBRfgzytFRLsuXjxtgO3R9hke8jPQb0VOb0AZ6h2aO5PFVzXu4xvVz3iXCNddfNG2CptlDbAnpuCk8bcLlmG1HIaWUSYl6htJdRNwiWKpJjTl1UL6w00XX44IFG53jcIpBQm4KO5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JG06NaVvVnvwu7OzMEyIC6gEHaXMxVKLUDfPJ3H8sx8=;
 b=d6hEtWYRdXGOMYWolojLoXSrx9iM8wtxfNh3fveeITy5ywkn89LfvwYyMgxTOUoXBUNw/Och1/Zf3gvqU8z+JC1AFYnQurIjvt/Dl8iYqC69jXBSbBpsi+BHpOmtI8X5GyMYdYR8UfftWMFw/PkcdiPPy942tK2UOakvkmutpElpHKcHMeVW5vF74iSME3+g8p623vrF+54RHqctXfezbqhYGgGLer+h6/yFIlK54PIM34wXUwzXOI4nenTNpM9q4BZYa3UyBk5Ow43hiy0Uwn2ISw48jXOI+gnWME3Kx03YzPGk59VTPWAKuGN07QNWIze92Y59nZNgbH2KriFH4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JG06NaVvVnvwu7OzMEyIC6gEHaXMxVKLUDfPJ3H8sx8=;
 b=dvImE6rktwTDfqnsXliZL5kgoK8ksrntt/TFwXH1Ux4TJKlqTy6fzstt99aYRhrWVvtpRyFZgh0E/Es6NRtenlJoMCdoPey1XJdYLk+IgYvKTqDrS9FrmB5/8uRbUnrJzaPyo30D/fS4Sh7ebg5AcP2X1O42cRvOuv3Tw16JH6s9nerYfWVa5K7DhyeLBOWcG+mwgHOts4Rd90CABsumd1lJUrdmPQbaHO6P8xpjzAEsNI09jZlkMS3XyhH2L+asxsoJD2V0vGFIF0OQ2def00fILwfhIbE2wKbHjJIQbr9qtRTnCKYIcS5U096JXLwT7CAgWDAJV3AMsvqRfExVAg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI0PR04MB10298.eurprd04.prod.outlook.com (2603:10a6:800:21b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 17:13:34 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 17:13:34 +0000
From: Frank.Li@oss.nxp.com
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-media@vger.kernel.org (open list:XILINX VIDEO IP CORES),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	vkoul@kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 1/1] media: xilinx: Use dmaengine_get_copy_align() accessor
Date: Wed, 11 Nov 2026 12:13:24 -0500
Message-ID: <20261111171325.3424645-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR15CA0007.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::10) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI0PR04MB10298:EE_
X-MS-Office365-Filtering-Correlation-Id: 70afd9d3-c8d7-493f-b89a-08df40171e5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|19092799006|261009223027099003|10067099003|261021123027099003|261102123227099003|261021121427099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	fQ/tquZcF9hqzB+U4OIrOYI32gmd0wyyvpzxjOAMQKQKN2SZU8Qs1Yx8g1hiRpN5Szt6dwQ8AizsI+Kirp3t9S38WjXrnYrhZd1/Mv+Mq+c0HxrZ+nJMdL5KoNITwNIA39xYTnt7ivnXf3xAgvzufla1vNOTRgVvtNr5kT413VPgCZMYv6XnwCZ84SoGnJE4gVMc+jKjD3QbPwCP8KU0aUtJpvgKuC2erF0kAP1vfjce4se6Ot7jqlWgvw7pdgb1yZgMU97kB+F3mu30VBANVh4+pgF9wiRjfrjJjL0eTbiPzNQFZpH374s8KNKA1XWLky9LaD2Kf2ZTEc9jofOyoSttyrsUSLrIBcSYkPTpvv05IlcGXIQQ6v1YZh9jdO16xqw4zpYkGq/xa1QtpgyiLXC4J5hI5EECqm+vvr9uWFLt2qvcfRt2Wl+xcLxaGMJ1mLhg5XFoM2nUkXgmJy1cDf/nFjxrDxC8QWsV3kUPPZSvWw1xulH2YbDV/H3vqLiWq1rPoG37AteLL14/zaIOMZhW7A8apZ4meFaJgP3L8uiuDInA4ZmpxlPQmPlnQ7AG328yt4A0DF5QlGugT6PH+wPnte/dJRBNLIZBaLRb7INf0NES/E5He/ijPXzo1LOmcxOpoBDe3KZ5vVJ9YPeCUdUz3IYf4ltmSlTeDFwguAQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(19092799006)(261009223027099003)(10067099003)(261021123027099003)(261102123227099003)(261021121427099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l2cylP7gauOmKMV41ObLiYTUZvBwlfnk2+Ex6lWD75Ta6VAL+7IYj5lAQb+/?=
 =?us-ascii?Q?GNRsC4noVdcF6QjPDW6Ly4L7jO4Y1Xir6WA8fKwicy7BSCXFIi+L7Q+He/F0?=
 =?us-ascii?Q?SdSaDONFr6RW5GuDuYKAINUV5k5adTZrzHoOykOOqVEyhJw7ZfUbXakj+ROU?=
 =?us-ascii?Q?R4Vtue/60VUREz6aVRoV38VHQ/j/M9VA0B3jSdGpVTiVZQbGww3ghNGHDyNH?=
 =?us-ascii?Q?86B38KcMEvIUKSLgFA27gDLeCvaTtiK1NS606I0UPPcsxthjwkIPnd8fpaLz?=
 =?us-ascii?Q?ypb/efIeFa5ycJfvE697uJyrMgIOen2aSzMr9X5x2wY15cBdepUXLLNsmuX4?=
 =?us-ascii?Q?gcg7UoV3pluyLKXFAO/sJ5aguoyptSkLH1tw2y98lqDDCxargjGVzv3YNcMl?=
 =?us-ascii?Q?uswF7r0RNBvTo72kins0gBZg0cqIwHz1XmxEuXnShdRv5vrkkv9+M2a/IeJP?=
 =?us-ascii?Q?Dy+qXupdQTiwJdw/iRAPV4IgsDb3QHc5lxVjcvomw4goTz2a8oQHayfeDp5a?=
 =?us-ascii?Q?+UNb5D021MibOXqffVVf56UvtSYoyGvZcuWR+yxc5scstEwsF0VMFfxuIK2k?=
 =?us-ascii?Q?zNNrMcfqmq+fsQjOnM2uacoUTdouJMbZ94IkuC1BAPrVMHKkzO3H7SzoUrUO?=
 =?us-ascii?Q?3dCgRvMSrkohQa6rwdBg5/EI+u0aQr3Or43drIwywT239oKM04UtcgrDFgxX?=
 =?us-ascii?Q?8GF2lypwefWFBIVXI9+mCS5hSnD1pJ1aWBlJVd2jWF+jRb+nQOcJlxXVp8ed?=
 =?us-ascii?Q?gpzmehweWWGInIicvdw+pLNpaDq3B1/sO6vI1uIwL54ybLu+2MmGsUhiLQu/?=
 =?us-ascii?Q?Jq5xheiU8rHAw98zVhKk85WqLpJQzcdFvuXPvxlVgOzgjYpwH96BmeSx0Whi?=
 =?us-ascii?Q?H2HD1ZZ+t7CiNNhmIZD420qCkNruNyIPvh5/2r93hiunTN0UhYrrY4UhRYxt?=
 =?us-ascii?Q?RoK5CkcxusGhqWPGpwHn/T3e5PWv5FkEDcSSJGXyybrkrXzVsvTw8foGq1HV?=
 =?us-ascii?Q?eOoQjhYj/bGuLG1MUQJVTwXJEWCKJ/G1divR49VevuRHTZ19tVONHYXiCNqY?=
 =?us-ascii?Q?ggIkzLuSZP1P79yLGBy60tBV+rQGI4h/j45CFkroA2fXGGzEd8USJYayBeLk?=
 =?us-ascii?Q?BKs9tfaJq+kul8+nfaVGlgSa93BVDQ8PizeumimaCOH2CiXOPxKYGO335lAZ?=
 =?us-ascii?Q?4xkKEDA3MQeDIcynp5tHyRf0VmCu5/mN6PLwxXG55g6jTuUB+VsEbbMgnRNs?=
 =?us-ascii?Q?igVazCxo/MlWWC1S23ph1509UXbQrfOqILUOIHFncpxM+ob5zskJlZuFKMCq?=
 =?us-ascii?Q?Js/KBSbUjAYakNQdR8eMEswwiNHtBnLFoIU7/zgz9aT37kVmRIhh1l6SBYpH?=
 =?us-ascii?Q?Fg84yF6RdnpBeksVL5jTyXuJsA1Dn2OH2SQ1ojUkJLmCWYC9snkhVp1ALKNM?=
 =?us-ascii?Q?MTVqYH+gCMRAeY1X+gN7SJvEPqxmENcWRXiFQKxZvdelLlIQ5TioFpqc6men?=
 =?us-ascii?Q?OaSPYEsvIZJrgLdAWM9funH5Pr1STmXXHjJ5BlymAqtd7aEeMjQaCGjp6mkC?=
 =?us-ascii?Q?5cefIOanZ7ev5eKYWXbK0wbieZGmPl0lR5K7+MdXBTjPWiRkogmXg8Xezzmj?=
 =?us-ascii?Q?cXwsnTj/wa+yaINmEil4BiqisTfXuDLQEX2anorEPN7oKktHBmOBc8kmdcGu?=
 =?us-ascii?Q?foZTXlNFI10UMJU7CWUQrEzLjrS3yeoMgfrrwBOrH4f+WPRt2Ti40dlPMMgQ?=
 =?us-ascii?Q?uZcbMHzFk/1iw8w4UlmGcFKYhX+6qGvBwLV7y8ii/brGVAnz2tPA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70afd9d3-c8d7-493f-b89a-08df40171e5e
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 17:13:34.8528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4LxbEHmOfgvg81mW0u7M3dcOAL/5963ShTkwfp6RnnN43yvzyVnroJPhCwvO+UGRHo9qEWlndb1tuV/jWnjmvHPNlv8UJPDYg8IIKoF6Rmt4YaibjutfMdKicXjrArNs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10298

From: Frank Li <Frank.Li@nxp.com>

Replace direct access to dma->dma->device->copy_align with the
dmaengine_get_copy_align() accessor function.

Prepare move struct dma_device to private.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/xilinx/xilinx-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
index ece2116639fc0..e01bb40bc39c7 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -710,7 +710,7 @@ int xvip_dma_init(struct xvip_composite_device *xdev, struct xvip_dma *dma,
 		goto error;
 	}
 
-	dma->align = 1 << dma->dma->device->copy_align;
+	dma->align = 1 << dmaengine_get_copy_align(dma->dma);
 
 	ret = video_register_device(&dma->video, VFL_TYPE_VIDEO, -1);
 	if (ret < 0) {
-- 
2.43.0

