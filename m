Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.83
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793357329;
	b=MqQRBA7x8Mu791OJmzSMn8uYyjK0TjdLrfrflHsZcL2MMfGv+3vj3iCiYnZvVr4MTHLC
	 BiUSLTDRdFPnEPuXoUbEy8UBu5B1qig5l4X3bKEy5HT/KZjpIDGSJOaMdLMacUmDfW1Sc
	 J/jXCelA+QQDw2+ziWMDZalrX0o2mI+IRaYyLk2XCJJchiDDJvk6qitNFYGTLdeBvVeaD
	 l48IlnapXlxOtogvNHrXyY2x+sq2gUulC/iGCTZOfYy5rQvOM4UhRJp41lbfM0Yw9GMcB
	 4L0paMyw1o6qR4qeKoRSADzALgfUAIrUA1Gvf0oeCPZZ/FVeElJQTL0FuwfFvJvhFgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357329;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
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
	bh=y2/kzQrNyTwTgyUCqUSmim9urUqccLyozgMUuH+Qgfc=;
	b=RCo52Uy1ju45XVF/D4NyP2aLgGMQycsN9c+SPnnbptiizbwtGTXE2ELZ6kxX3WaVbO4d
	 B1h5+cABVloRGosqhdLpzw3KKuK7dBtrJkQr7AAO4Kbwb4V7mXwXIio/7PqPM6FiKe50y
	 W6f8OouO/up8DkWSGneCzh3wHPCUoz/XjYLF8oXhMqvWriQM0HfiD0GWU+NxGRR0gmcMW
	 vWCRWjyWTSaU3k6At18LqbpT3WN+EY3ggqSwnKzZGSdd9qugwB66THIPEIah9tWPruegi
	 WZb8dOEaFC7om9YRLc4rGnCa/KK/ytHGiYRfS7FoXaDKmqm4CBn8YB4I+N3325Pdixw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=dz7Ftlui;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.83
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020083.outbound.protection.outlook.com [52.101.225.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC15606A31A;
	Fri, 30 Oct 2026 10:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFC15606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=dz7Ftlui
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWZAx8QZCut7+XmC3Nrd/0he4GJT/jpMrN/gsteqJzYu+hiBTA8bZe9lgqrVfEkxdLB4ezf+lcGbJJFaLuSmvMZnteVGTGDtsrVV5V0FfWx6ZY4bSkKPr1bMssi25AZgya1lNLqU0Nl7dl27750Ribf+3Xg2m4j3E0v8Oe6NPjm7qKVDOjgvVPxsMxxe+g/m+vLNta4aBeilB8o0D1ftSBQ3cJXEBCarSDYPkkGUYPCeuqi2ipS1P8nGbHGVSEiuD88ndLV5hDBGYAoUhJbw48ozZ4Bu2EhsRCExMhbA/89PwO9VxYVFFrbWlp7QHodyOYzGPGoOZyEy0t1HyEqPwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2/kzQrNyTwTgyUCqUSmim9urUqccLyozgMUuH+Qgfc=;
 b=xahx8r4BxrNBQrpDUzCzxDZh8B/jp3vulJvG6omez+w5iAJ/j9RFPS9AN7E1jPq8lHXgFPQ6GaV0esEDuPX3xJXCJjb4wNG3uBZOfm5RT4/z3i00+ABslh0lIgEY2/0qVJVTr0pAAszlNVg1D/LfrJz2ST8HOmswoKKLYg9HsSLDzKhR1kFZmvSIUqHdUqL5IB5HrV/G/tLjbvapi4/mMLLRDRcmNWfaimdpKZmdL3RiIoBsauz9/h1y8gk11D9+paFo68cSPCnn/mfEaZYG3qnOudtgfD8Iz1oV2rEzdzSPI5aEK1EjjblcOluk22hVcXc+7wmrrtfggqu7FAsMdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2/kzQrNyTwTgyUCqUSmim9urUqccLyozgMUuH+Qgfc=;
 b=dz7FtluiGT+z+Ctzx8miUc31GjmDsXS/b1/xAfae81wDEc+l4IfA9VEb80nTrEKOFY1LBHuMlwwgqdwoymH1nbww0eAT7hGXKnjpfF85Yixre1oSjyrgycesbQvq3ygBFKxY7smPHzIu2dDR1oZIEZvYlVOfmzSRV4Wdyx8ujEohksyNX+YpHAV1rQAhYk81inR13i0dMftIb0PPQEt5dXXG8XEgQb/xTGL6NOt0QcOwhB/1hbwxrYgO1iWccrnIOkUUAE/qScrYjJrUWM0CUm0TYgO6mUNJjpwcJsZaF+c+gA5RvF0zw7SmJNRezIMkvhal3T4trbDmHVTK8PkNTg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNWP287MB5476.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:31c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 10:48:43 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:48:43 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 02/15] media: i2c: os05b10: Rename vmax variable in VBLANK control
Date: Fri, 30 Oct 2026 16:17:51 +0530
Message-Id: <20261030104806.1223991-3-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030104806.1223991-1-tarang.raval@siliconsignals.io>
References: <20261030104806.1223991-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN0PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::11) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PNWP287MB5476:EE_
X-MS-Office365-Filtering-Correlation-Id: 18ee8e17-9dae-454d-6eb9-08df36735db2
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|52116014|23010399003|366016|18002099003|22082099003|38350700014|56012099006|261009223027099003|261026140227099003|261028144727099003|261022105027099003|261021123027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
 AEgYYVfpPs1kRmu/dFUD6vDH39jDTZ2AtQcpLRxyAMjLDDpvX8Jl9bJgrXOCWCM/voPHR3el1lgSJsLAdbp4TlpLRYS5XTd+2umMbq6EG9vx07knNHEO3/thKiy5KlWNIyiqJYBujtGlkMTdSGCh3cDdxg47+PeUgeSakIa4jDWcqWNkcjtjY5Z134q62YL6Nnn4OOoAsR4yzW6aAEziY5zVhelSmmLcIixQJxxZ78Vkjf/UKoIPuKed3sBLauPML2wTPjK1eKxdiiyEnScL9J+2CUlHVhSvDdpKYGU+a59qJZVwCOkXHPHxGQGTxNSgac0QRMD2kCKvLRCEbt2iJQ/fFXGWotX4A2uT3POSHmHFARisjlfibdDGIsU0uxQEjnzcJTyrVvZVmI7kxncir3R44fqCyHGYcSqW4+yI7kcrURU6NprpKP/Fp7v15tCsPoxD4yTJcellpJov6ZggWqBbU6eRmQbWfJEWjszcykFe7Wfy0jjPRWJchtwgzxeJY62qvE99K8y99zHln1yLnWXT8igmaHtPKQxyxZkVwOmsa7DhiPOsx7x5MNYg+8k2LmoiMrKZEJ8hsy8YnnNNYM972dMCVF0Lwo2WPVCrg6EvYdhNKMQgweIwv78CFwXAMmhCq1hC65ogNVFmZEVkh1YJ0NaFZPUwWesC4OYp+g9A9DgmnLaTgWr923KjyGUTJ5j/yALso+5leAvgrn9a3LJtXucWYg8hQRBmCMWSa0M=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(23010399003)(366016)(18002099003)(22082099003)(38350700014)(56012099006)(261009223027099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?TDfqJj1oozyJMxU7/CgjXP9Z11KDo61jUUy0zjtpkb8JFvx6kHbNV9JBFP7S?=
 =?us-ascii?Q?XpYEkwCLqJ+T/HvB1UgDmMF0Vx/3gvkX0yF61B82ZbrkpG0zAV7J0Ri9KQe8?=
 =?us-ascii?Q?lb6unk6eY83I21QsuU2lyI5O5mE7BxONJyjadb7VlzxqPto4EQXhsLDIyyt3?=
 =?us-ascii?Q?EqNAtxS37lnhS/Z9UkhyLQojFJ6+RYcQKbuZDx58xNR7ae5+yWshP3HSXjQW?=
 =?us-ascii?Q?f8fxwSSmZhbPkJr+dInjpE5BkbwtkwWvIcOsV1gR5LEj+IQ6JESwsPoRKgEW?=
 =?us-ascii?Q?7nRr8IkhTznZ6fNs/jMhxPaO1qr2IFG2zKXSCnncHwBivMMCzqqFilTdVcsA?=
 =?us-ascii?Q?oTy+gbZlVTTFzLR6QQIWD/lyvG8Kn5TLp4T8hoNVmIibhdwYAK77f+VSh3Lm?=
 =?us-ascii?Q?Lm6HAD8gX5YS6F2Mx9YL7cq7kTfbNjfKfuwKMDw8z3burQZ8E4vCddU3/rM1?=
 =?us-ascii?Q?AKlmRSzXM6OTTNmN+MROwIVdkoYl6wH9z5LaFQ43RwnZ3lX/DBxj1wHfcffv?=
 =?us-ascii?Q?esd7MrryLIjLrWLW6VC3tacwV57qhWmJBhqLZmdUUPs9+S+w6SJp8kCXrXGk?=
 =?us-ascii?Q?V3PvJoQ6dYm7T71SlRT/lW3AlU7ovWYtqKjA47pXMqFkW6sIQq6zOpxIg3KK?=
 =?us-ascii?Q?AUUStZqru/gG1JUEvHACIbMlqkCp+FQRTm8L28dL7nl/Sf+RnaKNyY1YenCG?=
 =?us-ascii?Q?IFL2h/kFwNuR7qPlD9wNa0eK5+i+GzYbmGUhxZ8gapAkxr1M9uiJ4mEt98Ez?=
 =?us-ascii?Q?aL1/JGBcOD4Yx29Za/bnSoTNbXW7vTJPc23EQgTXSesz9jAN9dGl1H9I3E1o?=
 =?us-ascii?Q?u1WxaV5JfbAH/40TRu+lvM2ndxuv9Lj/4q0Q8kHOk74RgS4VZ8rpFjbjKYQO?=
 =?us-ascii?Q?wLclPb/bgv80MHChCe94l+ldEX60gR8MgJJz92di1uxwkwWmGEq9QiRjptSH?=
 =?us-ascii?Q?LY/NTi2B4XPRyXSvdDDWaS7zzD82Gr9r1bClmEHwb9CNEXqg0eX5dKAuUnX3?=
 =?us-ascii?Q?ncy2wqx0gK5CQ1KfXtT4AFoyRxMIIPRVFmKIwgDG468vyOZOdi5h5msIH28M?=
 =?us-ascii?Q?akwO7rocCYCxL0hvhK8N8Z3dmf6Bz/8vJt+1N9lMuOE4bkctAAOQeRIEViLi?=
 =?us-ascii?Q?Ca0OMmWIzeT24ggVRXOnBNd5qkStY3Stn6SLE1lw8M2G/evg1dEcKX48I6TO?=
 =?us-ascii?Q?gAJNcfUzF4mchVtizow7ppi+7vEWy1k1gC6ofUZ1dkvJI4O70B9ZmQAr5yt3?=
 =?us-ascii?Q?swqhlH+z9vSamEILUZ6Gq72AcWZp5Pj/bTLHVreibNkUGDtO/9UKvFQHLEeR?=
 =?us-ascii?Q?pZUXWsn0F0u6K6VraHZRWHX4xxn30m9q7MFedEu6zmziUAJeDr64mR2N0puf?=
 =?us-ascii?Q?51NIrGLo8KtUHdMMKVP80w1z/6yzpXsHihBI36azA3Mjrwp/NeFu77p25uep?=
 =?us-ascii?Q?3OFVlkoqjbF+NzzjdPFjpRMDm9mpa1FCePcZjztyXi2UY5yWAiKVGSILP6oB?=
 =?us-ascii?Q?f+9q07DAWLgudQjuHELwmWqnjPkFi52ybWKdOmVSSjdZWQPcxMwSnGVcOmvp?=
 =?us-ascii?Q?MqwqzkbdoMKU7byzE00deeWEotDPuFjVuEX5csL/zW65Wx1Of3FL9gqqNThU?=
 =?us-ascii?Q?HiGrgv8UJjHYC6u5E8Ttm+pUmXkZfakTFOeg1R9R5Aw8p2+kwGPkoR1LThWS?=
 =?us-ascii?Q?3Sx8sa4lavx1DhaLfd8dvvBORRpvge2AJVDcxXdfqA79vUHY0psn43t++SDJ?=
 =?us-ascii?Q?9sBtiJHkdWkQTDs8QagZewOjRPiJqf4=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ee8e17-9dae-454d-6eb9-08df36735db2
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:48:43.1944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGK0RaAH22wKeJAocKqy9OxZ1lehDDXbKrCh9Wu4U42N7sxVgE35BznqPclbgEckRoOQDAHTIOTFmTWgvG/m6jZBL71TOicZ6TTK4QhIfkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNWP287MB5476

The VBLANK control programs the sensor VTS register. Rename the local
variable from vmax to vts to match the register meaning and improve
readability.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/os05b10.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index d5f573b1614a..46246d297a44 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -477,7 +477,7 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 						     struct os05b10, handler);
 	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *fmt;
-	int vmax, ret;
+	int vts, ret;
 
 	state = v4l2_subdev_get_locked_active_state(&os05b10->sd);
 	fmt = v4l2_subdev_state_get_format(state, 0);
@@ -499,8 +499,8 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case V4L2_CID_VBLANK:
-		vmax = fmt->height + ctrl->val;
-		ret = cci_write(os05b10->cci, OS05B10_REG_VTS, vmax, NULL);
+		vts = fmt->height + ctrl->val;
+		ret = cci_write(os05b10->cci, OS05B10_REG_VTS, vts, NULL);
 		break;
 	case V4L2_CID_ANALOGUE_GAIN:
 		ret = cci_write(os05b10->cci, OS05B10_REG_ANALOG_GAIN,
-- 
2.34.1

