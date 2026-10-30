Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.104
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793356470;
	b=Q8AkkcAjYku+traMtuBH1/iW3DeDTKn98knWukXYSTwPCkhmT4drfVEjKNgXovhlL7to
	 c+aYnl+tCIxePNEPp+Bnsgr5G2qIZmdrlY7pFqgc9g4v2biPedEsG8e6FJ9AErS6WFRqL
	 saOOd5VznJSkwv0UIQCNbtQ4UbYY+Kzwe3U4rwpwINzgN9fAeG4ZBkUCMgEda3RLZSiYW
	 uiNM234XhaouTU0lZPRzXLBwYOrMLzay6l9XV/Jo0S2DLN+N7yNQrrwwi85PFAIv1wnbS
	 XPqguP9Dopq2Dtm697D8cmQuJWBMn/G8cfLIKND6WqK1tM+sxMwRxJXLePJ9DRF5QxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356470;
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
	bh=ZH+sD9T4of3jSMlnS9hZ1u2ceZOAPUeGZdT84zHyXDU=;
	b=4X6cy3i9RkyyoCKs3ImiV2/LdaHFqYV5xTpctDBtgc2SCy5s1pvKSlBoTboJTlkACZdU
	 TOa840Og2P2yHdWr4ykqE1g/e2b7RAUO8l9ByABF7BkSeAO7OHr5dpX4zepbUT3BK6hG3
	 7QjBTF+Yl5N2OSfz28MEsowuNgtUNmBvYMagl880YKWF37H+qfNxOjRY+jDRbbd1hzxmj
	 17YobW/UW6hGhGN3r4SnzroRqC3T9tbHSyjCovrBVRdQyRQguQHgatHZpEdXMbiCtTtRB
	 z2xoB4QLILgvkjuIQ898DK/6p7eV+jePOqzI82zWvJjoKnTFxDEW01dLunuhfJPJajA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=gM7+nQmH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.104
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021104.outbound.protection.outlook.com [40.107.51.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C432760A263C;
	Fri, 30 Oct 2026 10:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C432760A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=gM7+nQmH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PL5XpyBvkeCpyyj68T6Z6ex3yPhZ2Ib/h5ro8jOg2i/Hjt8xrkh7a7HCP2vv/iGnM0gIUw9eVkT1Ap36+u0Mvn4aDgOBKKk5U3RuXuZyWs8fs8qK2nCG7LZSxEVvf9/R0jDesw8COIrfNPJ1kPxwhe7/DioO3yWbO1xHDQNn9S/jz2j3A7j26um76ryOtU8dsOuyJAtrkT9Q/lkfLgvKBq5gTpGxzJFAaXuQlPBCBmldC150kCURgRzAczSjTjcyv+lRrECN34OxXckJT3+RYvD3HXJSc98/sOC1t8RVMejykANIJx8RNDKRR+J9hAxI8d9D8wwshG5pRdrJP+qchQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZH+sD9T4of3jSMlnS9hZ1u2ceZOAPUeGZdT84zHyXDU=;
 b=WngoeDxhY3X72u0etl+r2VQu6npgcvvqnwJzuepynhC8P8ozaS4KQ5F0x9OQTrzHKbRpEhYbH32tCPL5gYyoRpHKNnFwqrIG6xRqqokFTWOUnrwiI5ujIxxu6vFmwND6bVIejNnETRtHazSkjBFFC8zM9gQWG7wyYtiEEsqHPWLZ7NbKY1cSna5rIcs1SqIf+6T6fw1SLpgUqMR6e4H2CtrvCDBfMF1jo04d6P3UnXD1+ktTyOVHdlG9MXZsMgE7xZL2RFcJDNC1Dtc6a2ss02yOmaGSgNVHwEcekhlujj5NXv5O/ilchodBTqXDEeITB/PSEDrwanZ74afraxvfGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZH+sD9T4of3jSMlnS9hZ1u2ceZOAPUeGZdT84zHyXDU=;
 b=gM7+nQmHZgpMfFBW8VYzDZdHOAj0gdY6WXTlJKM7SgZ9fJgDMHoRAfCvESA5v/ZNqn3wqC0xpAkaM1lXTaamFNH0/jAX6OBbKrt9l0sQpKo1aE7UrFQ1NhKku67CE3G6rLUEFMCha5Q6RQB3an+Xia4qEwH2wP271luH0xnHK+2SCbwKfrYTIYbEUth8VZ7VDQj0IwacVO1fYdEzicQaBIWvnkJFYqgcv/C/SJOjbFGwNn8DCDuy7aNHrCyCAGtZg9itnV4xrikV+lhj/F3P/5Ku7s52CRZCo5HxrXVmBlT7t63zeIR4aTfOqTVeQWJ5LgTuEG545V+N0XwIy0910Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNXP287MB4299.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2c1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:34:27 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:34:27 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 08/15] media: i2c: os05b10: add V4L2 digital gain control
Date: Fri, 30 Oct 2026 16:03:40 +0530
Message-Id: <20261030103348.1222201-9-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: 97fa778d-48ce-429b-892f-08df36715f89
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|23010399003|376014|6133799003|10067099003|18002099003|22082099003|38350700014|56012099006|261026140227099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
 jMxjPCPCc4wsB9Fi0rNQMwOjwCddxcUZzeUjpWtAyQwR/8MKY81gVVHo0d1yAijzvLh7RDaHZObF5shWFva1r8duKh+D+xiWcE9D12Sz/hCcWXxOQENxNqEQ487sjj3jzNHSuPgRj+f5PGHWbZfMqc9Tmpcqx01zlkp1DvCPxugUkHZyKEeT+vl/CQCcdbZs5IT5UeGwQe4lg/Kklcv017tLDWu0DYVEDNJ4OspOkcCrSUaD7kBPP00z7Iu21NHpuliFRqElleH8I4hrRvWD7gSJM9ggX8KnnATNpk3euKHaddvP4whraotJ0bXPV+YBVJWgqitsF7nnLF2QfGTNdcOh+wQfMDYrtA05j0L8Xvw7Ayh0dH/Y3AMWoRwZjCUdyOgITdE9Y7aCdM76HP2eODo+inRMLpSgvMZkN5I+N3XzGaChIDBcP5J4IkOFcx0UTAgpKfYSZRU+XaPuSwcyOl6mCcb2R8G247b8cjTTXOvF7E8qdGI1aq5Y+C83Ovn4YRgSiopb5NOx5jXujAg8w0MYAVlxb62H0MBpxN6sLAlQtA19z2Zaxw09zzB0ybGk7hAxzbfN+FAi++WPAmRWi+UeNBPzXbXMgdw6jlp83xWPWKUN2GGHPG62BvoeaRpT3LlxbRx4h9aFC5u+yOesmGXCCdRzyp4948CWEgiXHtag79kd9sERD/4YMKG5iZH50GIjPL2DZwkkMMuOREICyA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(23010399003)(376014)(6133799003)(10067099003)(18002099003)(22082099003)(38350700014)(56012099006)(261026140227099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ZGBQnSmdxbgSfqqZj8a5a211Nvroq5tbXFpdY9kCFbotk1hfwYpI8Mgxioxf?=
 =?us-ascii?Q?ySvk8mvpnC4aXjWqA+etBWr1MKHRejYijI4SSl4JCbvSVW7DQKzBaejrDwPB?=
 =?us-ascii?Q?2iFPaiiysBwSuL5VJJiXATuGEudcyThpPL7gH1G3HsNWg++8Ne/7aVj8XHEV?=
 =?us-ascii?Q?otBs+nBprGOEzzXrGLAWADLigvvNkHU7YR3ncrR1e8ZarhIigpCcQsR+CUwF?=
 =?us-ascii?Q?ZOdsyTuNv60DHwzZsI9qWNHxSLvnasGC4uAQeMh383y8BjV23/iu8zTP9zHH?=
 =?us-ascii?Q?dOQqkt0lRa1ail+Ur3GnN2tezkpKKR3rfdeIkB3OSfdb4pBeOu2b1I2eshsZ?=
 =?us-ascii?Q?DplRKqHk7Zl6RRggbCHY4YZY781pbQmwVx3cgRw14hxB2N0AeEoT4z7duIes?=
 =?us-ascii?Q?DRHv+5Zx53mDyGfSle7CMDklB2tAqbBuq5FwBE6CfopQwOLVGUeu9pu5xd0w?=
 =?us-ascii?Q?jx501VKE7GhXeaNw6FvFhm2CR/9tdb6nlSb8b+S3WW82ZyMiJgSDA8q03As/?=
 =?us-ascii?Q?FU1FstCiYrfkdNndJ3GJWdyM1+8lQdRypW4LovDj2yX/q9F6FpR1wlwkT3w5?=
 =?us-ascii?Q?CkoLj2StPC4j52ZCrjlKlaICBdZeQoEGlnVTWz3Q6i0BfnwaSSB/Y10kfEpg?=
 =?us-ascii?Q?FIhlHNebrkDODdy5xbhwBO2bZHwO4lgJquCC4hEmwcAI4dZMbRvj4izkg/Zl?=
 =?us-ascii?Q?GGv1gIneDifa+Jj2pyFldmTXUIOQieiSrVpgPwCz6IPoHqP95w78s5Ko7wy9?=
 =?us-ascii?Q?IuY7YDpjIdpqDMHs13p+Ah6H9K8zr43szUEerRUJclu3cCMqYW+yG02+EarA?=
 =?us-ascii?Q?c/LRjlhvgDnN7119O30CqmlHLTQmbJiLHFCFtGkxgcbNW/a4xWqcdUhsgQuh?=
 =?us-ascii?Q?mvbMci9kUVpbYCZUDIdUT3/2SIf1ibpt78ekXUyAvUVYi28KEqwqeVoHQgN2?=
 =?us-ascii?Q?WksTVO21gjHlRYfDNgokwyDwF4ByQnSFVksXK2S50PL9SYZ80eG8Vs98dVFV?=
 =?us-ascii?Q?aVltLWb1CiGfHKTbqcetb81cIyu4E+eqa+PS5Skld+BK1ARhSz7cEtlzUj4c?=
 =?us-ascii?Q?cT5SHgL+59aaqrVQp2WSqtBstcSCVlJ1iVRNv99cGAvknhJzM36zdL9u4QhX?=
 =?us-ascii?Q?oPDf+/7PYDK/dkgtVXxA0DH0FsBLJsKRqtfPTutH9XwM7DMO4hjecIs0rDbS?=
 =?us-ascii?Q?AUw6N6jRnmFQ7clJrLyhgjTOG/EeLlTtclv0lzFGAtSY4a0SW0hQwe6Kf8Fg?=
 =?us-ascii?Q?spwKbHQml0JyTtqhmScubJVLjXJZPiYSzNmKkDDF8wKJWfwgrYsosbBC/l9S?=
 =?us-ascii?Q?s/azCryPseqi9+HiFi+PW/bP9a2U2qKcZ+avmP0jEfa7pt7bfhG4v5X3gdFR?=
 =?us-ascii?Q?0S2bzWnGAjzQwmjmgXgg85TJk29cvguUioKqNwcTr/8L51Q4fxkhILtAmEuT?=
 =?us-ascii?Q?kWtdulOy7o3iaPTiNoqOLVU0JbH6BaetZmi/vLx3yFzEkTwbKSNo67x2brEz?=
 =?us-ascii?Q?ainvwi5QzkjrLhXfTsKCB8JJFbkRuWNXMhQX4pfxojoG6NN6FZ/RwPlLjgWr?=
 =?us-ascii?Q?xt6TDVCw59954YVQyIaPUhhN4D5tR22pNIZihdhoq4GKTeJVpaU/qQb7GKaI?=
 =?us-ascii?Q?jtFaTwf8GP9r8CMXPk7t5izCjBuM/7+ysFOKLVdZbuv7blnKeHbnsBY+GKO7?=
 =?us-ascii?Q?vyOiGWYpUbstqLRapeOfE1s1HX6gPncwuf0hlF38YsFoMslnfiHSTci+RlfU?=
 =?us-ascii?Q?o4wgzLID7x2jiBpKlQFx9ONx+JMpaeM=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 97fa778d-48ce-429b-892f-08df36715f89
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:34:27.2942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tzYlkijkDGNFk9kTdjwF4FUXJRKK6X/1MgJyOHEUf9NnsLHOW3cj68ix0OswG8/xboddlKiNQXsmRg8VBPCx3JdiCFdJ2V3ybB9VfO7KJ58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB4299

Stop programming digital gain in the common register sequence and expose it as
a V4L2_CID_DIGITAL_GAIN control. Initialize the new control and handle writes
in the ctrl callback.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 drivers/media/i2c/os05b10.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index abcb7c766754..14046f1c9324 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -132,7 +132,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x3108), 0x7d },
 	{ CCI_REG8(0x3109), 0xfc },
 	{ CCI_REG8(0x3503), 0x88 },
-	{ OS05B10_REG_DIGITAL_GAIN, OS05B10_DIGITAL_GAIN_DEFAULT },
 	{ OS05B10_REG_ANALOG_GAIN_SHORT, 0x0080 },
 	{ OS05B10_REG_DIGITAL_GAIN_SHORT, 0x0400 },
 	{ OS05B10_REG_EXPOSURE_SHORT, 0x000020 },
@@ -543,6 +542,10 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_write(os05b10->cci, OS05B10_REG_ANALOG_GAIN,
 				ctrl->val, NULL);
 		break;
+	case V4L2_CID_DIGITAL_GAIN:
+		ret = cci_write(os05b10->cci, OS05B10_REG_DIGITAL_GAIN,
+				ctrl->val, NULL);
+		break;
 	case V4L2_CID_EXPOSURE:
 		ret = cci_write(os05b10->cci, OS05B10_REG_EXPOSURE,
 				ctrl->val, NULL);
@@ -926,7 +929,7 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	        return ret;
 
 	ctrl_hdlr = &os05b10->handler;
-	v4l2_ctrl_handler_init(ctrl_hdlr, 8);
+	v4l2_ctrl_handler_init(ctrl_hdlr, 9);
 
 	pixel_rate = os05b10_pixel_rate(os05b10, mode);
 	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
@@ -960,6 +963,10 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 			  OS05B10_ANALOG_GAIN_MIN, OS05B10_ANALOG_GAIN_MAX,
 			  OS05B10_ANALOG_GAIN_STEP, OS05B10_ANALOG_GAIN_DEFAULT);
 
+	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
+	                  OS05B10_DIGITAL_GAIN_MIN, OS05B10_DIGITAL_GAIN_MAX,
+	                  OS05B10_DIGITAL_GAIN_STEP, OS05B10_DIGITAL_GAIN_DEFAULT);
+
 	ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &os05b10_ctrl_ops,
 					      &props);
 	if (ret) {
-- 
2.34.1

