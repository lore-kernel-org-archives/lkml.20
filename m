Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.103
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793357400;
	b=Us4zAdG4xVQUaWtYlAVfYjEtjYRrEYw5ZDw36900nrdqC09Yu8TZRgYPZBMb2Nxm7+p2
	 gTmD+A+lE4yImta0PM9DyRRxV+MA8f47lC2S6QsO/+2zBha60bKNBi+/XC4tX8OwZ+Io/
	 Oi3CbrAl5Nf2MZdx3Tm39TMlVIh//AlgLUKk90XN+HhEKvvzMEMKzDiiEF2N4Tqr2i8yO
	 SP+lDmJ+Z/IWvKGyqq9caD7GB1GD+NdWOpKk+jY0WogyKXHPMtUsWtyO6TNoJw1hHqOom
	 zcyOJj8IHsN9XEoPGASlYbwEtwI2uz1EbLj26MyPwI0qQMr4GaYO+8Z3EvmV4JaBARg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357400;
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
	bh=koENmtD5NcsRdmfzVREjg2pFo+rAudbV1bAN4vwml3Y=;
	b=nIevtW+vIUGMFOiU6rP+PduB0DRONyvWNAIsGekCBvZE/YgLrZxv7qEYP50V+V99jCpX
	 /THIIuVqX1IATu+7DKq6VnnkNYP703THlpeTYzB7urInMH7esJVWszTjiR3LfhrlAiK6B
	 ewaU1pZh1oA6X2/ewPWPWm/oM7tk1uNe3YmfkJENxFXj/CcJI+nyz8fkIChAG7iBDmeTf
	 BD+3rJg01pxsYNH5BRyRAx8+BUmUniBgqKaW90R9US9xQdKaWc+TcEB7ydLxU1pY2i3Yn
	 uIh9futJySbGv4fFp+eD5MWhmOw3Ur2IMMgDKJ4CAVHYejskM2JJKp9+yuCDFwP8Ydg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=IhIy8LMh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.103
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021103.outbound.protection.outlook.com [40.107.57.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FC5606A31C;
	Fri, 30 Oct 2026 10:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30FC5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=IhIy8LMh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yc3UOznFp85/cBjGbA25M//P4sqBB/os+EbJez0F/kR53/bd1vLnjBHzkhz6DS29QssMXlQCgmyuwQ5JVfhnKdn5+pUzYKp2KF8MNE01KYRl04+blcipXpKXiOSrTz0aXGn3wj8J3AWeVBLV0djUjKI049riuDLVHHPm6/O9tFHyurVxa4HDNMqT3mY2i7gAg/p1FNiLEuqaU5+KKGkPH7nUTZVSvZX6glW0+vgV/WB73LnQDcfQixy7DWlH387TfpEizZSGi335ACg2rzYVrHYv0wLPyLYV9ruyuF070+O3vfZqbIIMvFHFdsq1bE6gJ4B4F9EO75tS+HTk5BpF6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koENmtD5NcsRdmfzVREjg2pFo+rAudbV1bAN4vwml3Y=;
 b=U4KnnBKr8U4YBy9OomXbnGjcoEtkI1Jq8vi0t8QCHAr8fcdExSeYEtwqtmGw43xY07mRobwxXF6ryMXiSuUbv8uuneFRmnHVTh5uUKihWrtijecvS8rSOmr4IwDRWHNwqCFUqL6vxY7Y9Y909x82S+aZJKXdnrykk233ZxMUbxjpI8ifJkdZaoXtInkGnNTPWQzjTrY1FCaV4ZHyEbGNzHGe7pmWgwdGKZzqL3it0V/ogf+yIzxX6WQ21Qdogu7pZtT5tgGw6MGngao8bXbh18wrdMgph7mzqxRYB8dG9bMde6m2A7lM20EZZssoexkwCNE0615GZc6eiSVGqxCHyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=koENmtD5NcsRdmfzVREjg2pFo+rAudbV1bAN4vwml3Y=;
 b=IhIy8LMhCCeh7DT69peFbys2zszG0WqmbThh+VGhvYxSMoP3uNyLoTsgSoklpK67mlWc31Vj6GqunHfoQQLjQSAQX4sEqRw/NSI2CJAihclOEj5dPX0reGccGw4JYiLVfTXBwbNIhqFcheznTkx00ShktMRdDkB7zpib3T9TKx6LqS9VeA9tVDOqyb+ixdF8lh+ZGfD4t44e7l9eV8nsiqRfm/HMP0JwboqFQTbsYqcX/B8z/VFiAYb0Lx0WvYl/f1eOnXtE9T8u3Ly05RcyZe4WWXPu86BU773W6uA0gmu2OxIMv9juRJDNQl5qSEMED1PmH8gvo04a8D0qklw5tw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN2P287MB1787.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b1::8)
 by PN2P287MB0975.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:136::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:49:55 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::3d7f:7f9:3b6e:4781]) by PN2P287MB1787.INDP287.PROD.OUTLOOK.COM
 ([fe80::3d7f:7f9:3b6e:4781%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:49:54 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 07/15] media: i2c: os05b10: remove unused control fields, simplify error handling
Date: Fri, 30 Oct 2026 16:17:56 +0530
Message-Id: <20261030104806.1223991-8-tarang.raval@siliconsignals.io>
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
X-MS-TrafficTypeDiagnostic: PN2P287MB1787:EE_|PN2P287MB0975:EE_
X-MS-Office365-Filtering-Correlation-Id: 8400df70-d8ba-4cf5-ebf6-08df36736345
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|23010399003|376014|10067099003|18002099003|22082099003|38350700014|56012099006|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
 GMz6BW9K3uKCKKiFH2n61UoqVsjmCADDv+qA8t+LmVslMoBiEpbq+rFmXMbCKQf6QAua+ZVTzGb0i9+oEjSbyMxwL1bGpweRldF1rQzjgX+D66sHi7ajr3Rn9+u8rTdsYddNMYBvL+kkSOH/UGOXZNCEavSov7ZgseQYEPSRjfGHX/JjI3h3Ik67WqyTgS8VhPQanjt+yHrQvXnYrFBclPOoVD48aohZlRa/nHRlmGS4kC6pZ5hYFTpbTWTPhVA6KC7RJz/ZGDqv/ZfjabRiE+kjtAsEhkE/6fZ/h0SQjeb9rDk8HVNsiZFF9R1cGQB2FpKZXalsudf8WjXc+Rdo2QNBvV7C+1qHf3zvIm20VGHlUV0maUstBRzrhg8hp6XP7naQpm/oR3HLMxlb2ZXu48W2Dj+yq3GTofL5u7d3EwGgG6vIqdko7JQyx4ZkEAfW/I5UyperzcB+q4+x6HgGJIbGzzxO6WuMn3NZhWTUHkWBgld3SzGNDOcJMs0rhqU+9Si6enc7gsIyLbuHpbZqP8bN40531dFtFaC9VBT/I91CvYmc6QgjX9fA6nuxVLoXzgCvjsaa9qu4QcBWsJiYmdmfchQDLLPCK2EdGVsNYJaNY9N1Dw1oh8DO+l3382glcNIMlCU01p6c+A7RAuy4v2IFD/OlH4onjvpBQ8+UgbHLovkguWS40FRyRgriQvL4gHcApqNEKKtgDLBhOVqYjjFIfomg92P337u7+zizVPk=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2P287MB1787.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(23010399003)(376014)(10067099003)(18002099003)(22082099003)(38350700014)(56012099006)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?nT9L9pOwpE8fsBAMqgt8Nf90NornANe9t9ezRW1pNOxRBkx+SgcIrQ7m9bbL?=
 =?us-ascii?Q?AOizWMh7KbRiaYAlgtHvI0XOAMWWcVD1/JQsxLdNXZHVwEqY+gc2yr7fKmKg?=
 =?us-ascii?Q?/lDwRTzFeU2fxd7B2TDnzJkc9cfvGIZimSbLVH+GkZHaops3Y1bvH2KWh2xy?=
 =?us-ascii?Q?3kSucqn9xKKJ3vlfjCsqTvOHoM70u2IGUq2h9z2Hzpk17A7xRp6p2LsFkI61?=
 =?us-ascii?Q?mV5usEqu2aAQAYwa4eipJyZpksFs33yZuPozX+9KpJUabFBR9ssIduJAdI/f?=
 =?us-ascii?Q?z6k3svQwB1XMWiiwbCUvazFEBtvCygOvLJ35r3YJv6jSfZEOctD7MiNUmZ62?=
 =?us-ascii?Q?PMbIjcUrGj1gHicsMDE8Q8W/SXVKvyYmjr8DLYuocU4xewTzgwnAoiXfiqTI?=
 =?us-ascii?Q?xA5D2gDF/c8tkQu3uQAmlhMfZYv5wvM97LdcALB90aiFv1po0xgNTVrKblFx?=
 =?us-ascii?Q?nBJsiT5t+zI4AcJl5gUfokxkSfGLvgp594u1KAMJjcWOUnoIPTHWQ86c7DtF?=
 =?us-ascii?Q?8FFGyRcaHhpvYIEYxB71Kw/qpVHlF6bzwEGsb9ryHwdpefMFj7lcySn0HRrj?=
 =?us-ascii?Q?aB4uQd+Dvg3EyRAWu81/EQ7s7KaZAWvn0kw9RdVcP7UYWXCQS2wAPsnVMd/y?=
 =?us-ascii?Q?Y4XEnkmIxWAXQ5swDeAOt1RBEzUTgfl6OCI1eiACS6UWP8q5CsiFPxNtJoqK?=
 =?us-ascii?Q?ChZ/tGqbq3PNOTSbl4Jr92n+k0bdVr/j0dhkEvkEP7FDWvZiAcK8UN7pOiV2?=
 =?us-ascii?Q?sjupiakIjZCIVND8aRpZQdNfFk6Bi08Lw3M3IDbVoBk9OrDPHXd6aqokNDYG?=
 =?us-ascii?Q?IlT4l9LA2FBaWnEt4KjHgDauwNV3DcPWR13EEB4VS3Ir3uTK+whjuc/aVT1K?=
 =?us-ascii?Q?ZhafQBIc2mESpuvpF4KSz7EbxSALCDez76kQOtvZmg3YHVp02VJvaleovS7Q?=
 =?us-ascii?Q?LO1C1+VvPQIjKRTStQw1L/nKyzEYsQ7lezRxozQPJ8cgiB6HRuKAjOVBqPi0?=
 =?us-ascii?Q?p+6kxDh+AwTPaGQSpjLypXPn1ceM6AX+NulMC7U1+fJIHDb1ijoEcvgh+NT5?=
 =?us-ascii?Q?LxRf2BsA/Gkn+Us4EhKrL0mi4mcM2O+7O7OD9EiKb/8R03Sxs3K0ci6nzLRX?=
 =?us-ascii?Q?Yr2k1ryx8B4md9cqQyPnD1dFN26amWxnpeoM0N8iucXDBmh10CC5DdxiGs++?=
 =?us-ascii?Q?MI6YJjYyDH1MXbCTZywmV0a8vUsYw6DcqPbm/ObxLZHvHQ/+oNJQTf01dvwX?=
 =?us-ascii?Q?KXFph9l9PsO7+5l74KkyfCx9mX+x+ncuHZuRpNB1fn43KWHgBj2Ms8At6gKi?=
 =?us-ascii?Q?wkeDVtkupalZoylPaHudRy2CaQjVbLBk3r963d0tz2Ou57KiKxis27kOxCXG?=
 =?us-ascii?Q?XbAC7yNkqc0DTBn3VFXoAv2E+1kmqXyWG6l5b4aFkfckwLAqisze/e1J7IFF?=
 =?us-ascii?Q?hZd4AX7/d/LLQXMt3ujwCRKwf9ajazU1t189lewhlmnVyGPVJQmJ5eTK18rP?=
 =?us-ascii?Q?LUTAZ8lgdygET+ign1Rfkm5kSuhqNpQNo4SjeaOe9SXCjFQgDldTc784sSXW?=
 =?us-ascii?Q?8BT0ZqN9Wub3Dws4qFY0LSOY/ZfVNDsKFI03BIuosNLn0yyYkY/V/k3AOm9S?=
 =?us-ascii?Q?iX0MmtIZV/Rm5sacBnxRJhPEtfvWRo4Z3Trb8LurGHQFzhowNfNFYHHjasZk?=
 =?us-ascii?Q?4H9QrbUQUhyKvCaD/rUBAhVRxARMPrRp+91umOIV3xWzAG34DLqgon4tyR5i?=
 =?us-ascii?Q?TecMNYmZ/2jeyv3PPAgvqAzcY+g0aCU=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 8400df70-d8ba-4cf5-ebf6-08df36736345
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:48:52.5438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L/hvy8cfuxp7hHC6PBWlqqKV3R6pBxp8lwSIFeqTMBmiOLONy/u4Wo2daiA346u3QdQMxphX3flpQadViM66bJpvqPxfkZXQwb0HRAp7QhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0975

link_freq and gain don't need to be stored in struct os05b10; make
them local.

Parse the fwnode properties up front and register them before the
single ctrl_hdlr->error check, so all controls are covered by one
check and the per-control NULL guards before setting flags can be
dropped.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/os05b10.c | 46 +++++++++++++++----------------------
 1 file changed, 18 insertions(+), 28 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 46d514d2a479..abcb7c766754 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -457,10 +457,8 @@ struct os05b10 {
 
 	/* V4L2 Controls */
 	struct v4l2_ctrl_handler handler;
-	struct v4l2_ctrl *link_freq;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
-	struct v4l2_ctrl *gain;
 	struct v4l2_ctrl *exposure;
 
 	u32 link_freq_index;
@@ -920,8 +918,13 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	u64 hblank_def, vblank_def, exp_max, pixel_rate;
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
+	struct v4l2_ctrl *link_freq;
 	int ret;
 
+	ret = v4l2_fwnode_device_parse(os05b10->dev, &props);
+	if (ret)
+	        return ret;
+
 	ctrl_hdlr = &os05b10->handler;
 	v4l2_ctrl_handler_init(ctrl_hdlr, 8);
 
@@ -929,21 +932,16 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
 			  pixel_rate, pixel_rate, 1, pixel_rate);
 
-	os05b10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
-						    V4L2_CID_LINK_FREQ,
-						    ARRAY_SIZE(link_frequencies) - 1,
-						    os05b10->link_freq_index,
-						    link_frequencies);
-
-	if (os05b10->link_freq)
-		os05b10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
+					   V4L2_CID_LINK_FREQ,
+					   ARRAY_SIZE(link_frequencies) - 1,
+					   os05b10->link_freq_index,
+					   link_frequencies);
 
 	hblank_def = mode->hts - mode->width;
 	os05b10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK,
 					    hblank_def, hblank_def,
 					    1, hblank_def);
-	if (os05b10->hblank)
-		os05b10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	vblank_def = mode->vts - mode->height;
 	os05b10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
@@ -958,27 +956,19 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 					      exp_max, OS05B10_EXPOSURE_STEP,
 					      mode->exp);
 
-	os05b10->gain = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
-					  V4L2_CID_ANALOGUE_GAIN,
-					  OS05B10_ANALOG_GAIN_MIN,
-					  OS05B10_ANALOG_GAIN_MAX,
-					  OS05B10_ANALOG_GAIN_STEP,
-					  OS05B10_ANALOG_GAIN_DEFAULT);
+	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
+			  OS05B10_ANALOG_GAIN_MIN, OS05B10_ANALOG_GAIN_MAX,
+			  OS05B10_ANALOG_GAIN_STEP, OS05B10_ANALOG_GAIN_DEFAULT);
 
-	if (ctrl_hdlr->error) {
-		ret = ctrl_hdlr->error;
+	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &os05b10_ctrl_ops,
+					      &props);
+	if (ret) {
 		dev_err(os05b10->dev, "control init failed (%d)\n", ret);
 		goto error;
 	}
 
-	ret = v4l2_fwnode_device_parse(os05b10->dev, &props);
-	if (ret)
-		goto error;
-
-	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &os05b10_ctrl_ops,
-					      &props);
-	if (ret)
-		goto error;
+	link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
+	os05b10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
 
 	os05b10->sd.ctrl_handler = ctrl_hdlr;
 
-- 
2.34.1

