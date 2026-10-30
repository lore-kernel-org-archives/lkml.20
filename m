Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.104
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793356469;
	b=5tek+Azw3VM1nJbHNtv4G4LQu4gtyaa6B97vwAj3sSTAPViB282km0++KFwVHWpUFRi1
	 6PpxX2nFfzK6beYEsVIyoNdeekw5ZDO1CXzEf+ZAH58baM/JKEG0M2FMl4w7uNTflD+sh
	 2ViFjk5yFVIO5hZEynzG0GK5doLgqu75YXgGuOJbT7fxWPHtJgvvD8WOPGCfqDYFgsnOz
	 HmELEzkjC8uHP1K2duFX0Z8gxrcfOY6+dBFPA9MGpPAKh8xb5+43kaYgJfKHoRT2VYkrf
	 Jiq1QSGMhhf+l34X7DTok4grQ+nCuxdAsAc6TygvNBdY/v2JSojDeY5n0LBNaF8yqqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356469;
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
	b=eAuRmp1iXpKkjCQ+h1lnZG+kLRqOVQ+N7nA+b+pid4/Cj+fhfJPTURvp70A1DPjv0yyc
	 qiHgfX2+crATCE8wsbXxl7QLGI0CDCkSHcG4msyKmtxHgAusY2iBkP8bCeDso9yMuhK8F
	 ztiXV+qkqUtntMDEze62HYI2L8MPJ3zEMyFtpCxzObkbhVTDUbO2wZrNUdUsXklcMUXcX
	 XK6hBsTFX2GHcGpBkM6X08FBmRvsqkk5RYEtFRLscJkelkN6Vio2gXH3NbwaZrTM1EFls
	 C3a8cwWBV/Xa67lZwjLkrab2Ek5cJVue68B+iqCg/DAT6ySZNjmICPj4ykftMx+5VKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=bV2XsauH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.104
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021104.outbound.protection.outlook.com [40.107.51.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2803606A329;
	Fri, 30 Oct 2026 10:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2803606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=bV2XsauH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y3UpzEpgJGyHH+kIpOSrqgxWUnWHvi81Ifs9HCO1F5AjfURpBnhD+/K/WsBJZzyH71Xq7lXceJ6AHugrYuvIC7q4HUct4ELRWHs7tpqbwB4A4dQjflaZeXFfL2XTAck81aRkHfjqnpheMhYd8y8XQ9S4yD92eYdzSwnqTy3/05puevMwT9CRKxawavCTmhAnldrMytfIfBSgrQ1mOs0zlgonxnvS9MgUZyA+Yhu/YjuNSOaTY2gWLh7Kw57+5acZUeY+EiuvijezV60u1iBdgSSkaFrOwyM7aAY9Hw533S2O7l7XXiniYsjR3/TCAvpGr7no2drbPZnntdv78LDuaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koENmtD5NcsRdmfzVREjg2pFo+rAudbV1bAN4vwml3Y=;
 b=N00aAdogLtZ/fC200dfZ5luNk/AyrvE2q/iKAxBRZr4y/do4EPGA/jKz7eBCdbuzb2/04USF1ixSwZAcb2HuC10dTNcxhVkXa4kjKlW97F/YrgyveDfJDZKVZpjwHO8zyZJsPXxW13grfxiA8R0ocbd6GQWMbCVh9Ey7DBiLowxJDId6wY9Z2xSjv0OAxtXrzqBBmVI0RCUj1PZvdqWKJT3XrgEOsMy+Mtoq4n9BVFv7BKEXHZX6kxU+jy0zCeQv5LYH4cnVSGCQDr10RrpzqffXBOCwvpIuIEmJoFZKUjN2RSf7Jb8cjFAwKkFneWORi/S21iAijf9axBzap4dETA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=koENmtD5NcsRdmfzVREjg2pFo+rAudbV1bAN4vwml3Y=;
 b=bV2XsauH9dWAIMgpCFlkFx4J5OhgC9Ii6FnBB5ZUivHB8dOOx4EIMpch7MNuTVVbGCSaY/x3+tT/Y1fPTVMLqydDLXW/Xxd+Vj1AXZ2Jn7svXTfbJ9kYX9rqAPowHWz6CAdAvF8spwHIO6zppD3PM2wnbBCy4f9STNLwDuabhUhdr12JiTpFFjc4ihMID1Fr9/L2CAF1jLBDEHtpQi54G6R6Q6TA4TwWhdVxa0sqHEbnb81+0f+EusTbU9mG0W37CpKqCh8h+RiRLdcVvEofbkFGwIdqC5L/6AfALfSItSqrd6HbYPF2s5oYBuVj9khaC8w8IhpH5RqqIUuygTBTjw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNXP287MB4299.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2c1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:34:25 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:34:25 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 07/15] media: i2c: os05b10: remove unused control fields, simplify error handling
Date: Fri, 30 Oct 2026 16:03:39 +0530
Message-Id: <20261030103348.1222201-8-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030103348.1222201-1-tarang.raval@siliconsignals.io>
References: <20261030103348.1222201-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::32) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PNXP287MB4299:EE_
X-MS-Office365-Filtering-Correlation-Id: 43422937-a13c-437e-b33d-08df36715e77
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|23010399003|376014|10067099003|18002099003|22082099003|38350700014|56012099006|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
 IBA56jQSRQKgyqYg+9IS/FFyyh9dJryMHMgbxyMtIE+z427KchJz3OSOym92oHOgE3affd2JW0Lseo42pxtFlkkZIG5mS+oczUj7XwWdzY+NkicbCPRzRlFx55Sj3bHwwZbCjgAOCLxSv09Yn3oVNley8cbHSv+wcqCbrnKUEy5bvSzQSIY0kQ0Wv1Gyx0gbb6gZbSP2i/FXeZ90CVjte7cbNXdQNjFCxnEwFX5t0W38FoWlKIOJhzCOCz3f9gLhvSNwvoWyJhxSJIjWq9W+qdlsRLCJZwY+e1NBj1H1GmjW6uBHrM2ZGMa7TwboAzsqeCK0t3ZP8pB77yYwHXZHhedshkUveOyEeQ2h50LhtEZbVfL92rYWH/tOaRudkSsJmtqut1UwohRx3YnIXFh8tsvHQM0/pxcV7yVQsMZt1g+POoXeu1M+c7PDLaABJcV0C3aLhVsFTUlm/apTWJa/Y7ZeGr1xPCsyCI1bTWopCjOu8u4DnRS5nlYo3EsSNbVCyv/lrXsdRU0yTOv42bh12kGTlyoNY3B2rztHrhWtXcGS623MmJJmUtIbz/8jjPjJLG7mrUYcLdU7eQ/yuGfvIQGk7Mj2pUZwY3D7Vl4t93YHYIeKJwPDLaOMqEsiHFIAcIqFDCO1E3I3lzflvX0kC+dvcKHRYEvR28sW4bMvJqmDLFUKFXD6+1k8xb2Ou8ZXWq2l0QabbUhQYxmoMEm9QR6gwR0zfPchGXxAbyCgEfo=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(23010399003)(376014)(10067099003)(18002099003)(22082099003)(38350700014)(56012099006)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?s33e4h/GcICMLvMF6K9r21MRclAkHZFrylPUbhiC+7XZp9hZysUQzDXsQ0DF?=
 =?us-ascii?Q?SHKqHiMQnlCVykkpOP/gHIRr75A21+udbD5xocb1k4UJ373lhbZqUv1DL/92?=
 =?us-ascii?Q?sd5v3ltdkwnvGxeaCM0axDNOCtRTCLJGJWshk84NWooAjzPYaTVdQjLReC/g?=
 =?us-ascii?Q?tVkZxWnkbPvvQL355MoWlmkYlBJfPfGcQLbj9UG43xx43kCkO8N+lBp6aQif?=
 =?us-ascii?Q?HTXwRAgHrU/hACdAzP9g8OEe67pFIdCugma05X5guJcuhXB3uN45OYvMVwrR?=
 =?us-ascii?Q?dtLmM5zbuT4Nw8qhUcTcZF77QBGhQEEHmTvz1vHHPBTXMtXjRHjTcnbQB/zc?=
 =?us-ascii?Q?28RT5LlYrrYm5DrIdaPqeE0fgF3D4opMrOoIFWN3lUsu+vB8NLuZrb+UOB1r?=
 =?us-ascii?Q?SnMYjSCBqiLT90soclLkqgWRKHloJOsoT5kiEUrVt7A34Apde0ly+FWqx2d2?=
 =?us-ascii?Q?AE5EKy1CjYM/HK2r1LbslmGCmtr0yRE8fu560Zufu9LMRQqmBaDGmFucYOxF?=
 =?us-ascii?Q?UIu4amNPT76QkdI3AKlM3Ix7N2SCwkJYMtuuehPNTKYTa+FKugGuKXukBGua?=
 =?us-ascii?Q?xHY1zldW1IQwQSyl3vq3s/Tf5jaJLbGMW78V6d3l5Tx4/2+nd6jE4F39b8x2?=
 =?us-ascii?Q?gEiXh5NRSaLh6oUxT8fK4JjqaK6e5b14PZUEdjb0svKiqAppn2EclO2WSokI?=
 =?us-ascii?Q?8/1H1N280e3I5jIzOXN1Zu5W3ACvD/WX1L2tz3U+kbHP4tDGNEDVjtdUvLhT?=
 =?us-ascii?Q?XpFeRk4Y2+/n8J+Khr58SCRvgvPF8KfiWZhywX0SqrGQgtkAW0LDeofOhnkh?=
 =?us-ascii?Q?axO4KckKPBNYCvVP23tQH4wOobXYhy3WJqDsg5vrCC4xHh39At6sulqBykXU?=
 =?us-ascii?Q?+BdqhuQRLLpUTRWgvAIXHYPbiP76gZcNbyETZR7hBHNCPDub6YmTh9eGNaw0?=
 =?us-ascii?Q?PCrbkLKv0EJrGsIxxH33JjgK6CHb4mteKRvxFlY9rOYoolrDyDAPzF+CbtG1?=
 =?us-ascii?Q?TLBVXr7QhdlW20w3iEcGnvObW6ZioTGBQqu0t9I2+rzwp+JUSjEsMtLB7dF1?=
 =?us-ascii?Q?UIZ7Uwuxt5GC1Kcs5ncci1wgMGsitqiDJxe7Go6axF7Flwjm3vs7TnZlv66V?=
 =?us-ascii?Q?YXCyhSp6x4utjy3AJBn5M6GCmf0/QpZJ+N3nr1OqdDLuc/NA/QCzjc0Wbt1D?=
 =?us-ascii?Q?owaWSdxh1E4UGDHcFerBp5p8fRDql7ShriDingsrb29mypTSCKhuQbtEASM3?=
 =?us-ascii?Q?BS923G9d4zHtCAYkt+I6jPg0lHO3ZdsRBlzifC+9STH7Ypvl72g6Zeh3eVi6?=
 =?us-ascii?Q?ARmAi3nZcz/1+hXzBq3f2VsXzWXJ/scfwGEKdm+PhmszyJbkARKSq/xPNZD9?=
 =?us-ascii?Q?i391glydns9cww2SRYOkqQJL9MkGfzIEujNCkw2yVglMTPqR4bhzXFckigMX?=
 =?us-ascii?Q?B02JPZYYLCSlj5rcZxjcDTDdzEBBjOoNsCPxQfNDJcreQqVaJ3Hh6aUtUtUH?=
 =?us-ascii?Q?8jm4l9C/IT+ftVlOYwernwDTKARToHZZasKw4CUDctQqhbVPxyWjCtKH8GUe?=
 =?us-ascii?Q?ClRKz0PCO0OkWUj0w01AqjUJWVY2E54T9CfR/rXo20inHjFzIFjEwLVBl7BE?=
 =?us-ascii?Q?6NvXobHUe+7Hbt2+v8xtwxPdx2d3C9Df3oglJI+lCbhoxdQjs9hPM8HRKDtm?=
 =?us-ascii?Q?4buqVw2IUi+Im4Se5obv8QwsHT5XEwuRwC5VdT9E0+cAf+YC4uv2EcZbcsP6?=
 =?us-ascii?Q?gqwHTz4T9H3Utri+IcnKvgxCXZvlBPE=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 43422937-a13c-437e-b33d-08df36715e77
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:34:25.5395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xhb7RgzqgCJk8JpeKK9Goa6n/tHqV5Rhxc+9wnaw2tQQ+3fREc6o6LrnLDxKqhhCHdU6xcpAxd5Z4f3ekQoYoDDGxYJCTcwyalZME/b+FHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB4299

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

