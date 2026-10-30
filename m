Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.92
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793356465;
	b=FLavBopWMdcLj8EuRmUKO6nisbHtyovJ072o00MYQ17Rf4isU4BhdYzvgEnYr4+sdMZz
	 TvOISRtSU5MPJ/xcNGQ3dJE07fKP2VZYcpJ9Ymld3sMhQD0TRiv4IwJgTkYm/I+VObJDe
	 pDomKViYBPWpv7PBw9CW7QuUDbAJspHbFVQpE0vGlzYbH3FMmBX8DiFkosXlCpFBOeObe
	 dIUEEWB6x098S2wrEswnBRuNr3c7x6FZwPUpJoxBtCAJm1/z2bRKwqiLTyuJqq2aqBY0t
	 9FBSqpnNyOe6uZSxCE2kIbOjuFNEIOlf8FmraWE9md3fIVJGMn2KJxBCrq04NGOwfig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356465;
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
	bh=EFa9H0DOJfAGUAuUI/NEV1TFJF/b8DmJzU/Ou2CZuNA=;
	b=d4eXherTl7wKwLmKmK+9Dce+Hu4lN7nzNpmStpphNWZXhw+HUV5hXx6JSWIccGtqswpR
	 KLBx9X+zG7o+f6JHtO2og8w4JeVLEjYhXkS0UlxuFukpyK+KmYPZZs1kTRhz6EiYapA81
	 XfQzInYhifnE2X90LDkwVloTYr/xtMkh8lX0ABU4yMBAfTRlrmLqf0XRy3VE2BTH19ycz
	 J+5nWwMnxeBfPQK5ijcLlu4UXnLBHaXNCptYqlY6HyHVJdPc4BnuLMJaZIsVMKQeXpDVL
	 TI7MqMzTU0YWoQ/Mj68w28OjQ5jPGsdcJ8NzEY0pwaPfXjf5GaS7H2kpgxOhgTn4Q/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b="AsI/6mQe";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.92
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021092.outbound.protection.outlook.com [40.107.51.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0FC60A2604;
	Fri, 30 Oct 2026 10:34:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF0FC60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=AsI/6mQe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GixqeAD/n4SrMiBxrterLqBKgBukj1RK8hBiJqZmEL2mDdCwL7FBu9VKw9HW/nD2qHifwz++uzuznTbeEVgI8RQHzuaMryglq8+o6CwLSTBUWGWPslhPkNMJxt9SyBY140GEymSlAbjP6fr2BNLKJCGC2s5osBkArGa43SBdTJMBs6RCb9EpyMtxJ829nETdSYoHCSW82/rn9/umcsngISfQabBFljdQ96EBKowQ49GABs67ky65EKvpVxDqKHt1DbR0jfbErx8fjPdmuOv/fQtLXqP6ImeYw+uKCyVntuBa5qoxzNZPAf6r+LxyXa5FGEKTaIEby0GBC6XOeVKQmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFa9H0DOJfAGUAuUI/NEV1TFJF/b8DmJzU/Ou2CZuNA=;
 b=n8KDitXrQYo33ySyAiK9D0TthDaSTm8rqcb9ebsTux6v3yE2diBVFrC6XSDRn5pYPUe76Rk3F3ChyN6U0Nciimkej/O/SxKIZK4Xvx0ksvEAOEP1Yftm7oiDx7qvsaBA9AsCk2FeKRGVLvIRfcacp0PBvFGlS4jwbZO5CNS3qdslOjvUi4TFApuCxY8Sth4uXAv+TAIUa1EpDjmrTQnFQj/v5IcU7OAavuF6Qs/dSSlBJyv8EtAo/GWsCFH68fMgh9hBbHLcrTSOB9pJxXKf24DHvwaknbn8pv4FRA4DC81H1rPZkTEC/hCtQ0SJII3P9Dh0mHR+JF/M3abFKHaHpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EFa9H0DOJfAGUAuUI/NEV1TFJF/b8DmJzU/Ou2CZuNA=;
 b=AsI/6mQeMgSvqsRpgihvAqRzCFiFilwtWRwLiq8oy9arRDh/RjFB3k1HVRNLk3zbPmI8ed5mWq1AG/iri5oeI3RfjIhNWl6DvKTYdScfM+xZ3dDu2Wf9bR2wIk9/dxw0ekHg7yLo2ZgAqd3iKSkg2KI5ATz5twPuotrW7pME5haljiV90butg9Km+GDojOwyh7dAq3ImKj4UK+3FWY3sMaf57dRksvjFBGcjYiVHlpwaYdLvFqbsULVsw9qFQSJgitnTSl67xnhESMKl8f4fCk+K1Vtas/it1Q5mPL7mP05rfF62Cz9XL7rqZpfiHRsJO/JQq/jI7rjBR6o0RGOyMA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNXP287MB4299.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2c1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:34:22 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:34:21 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 05/15] media: i2c: os05b10: add register definitions and use them in init table
Date: Fri, 30 Oct 2026 16:03:37 +0530
Message-Id: <20261030103348.1222201-6-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: a543a6c4-3697-45c7-340c-08df36715c09
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|23010399003|376014|3023799007|6133799003|10067099003|18002099003|22082099003|38350700014|56012099006|261026140227099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
 zBNOUaactWcxVcExdl1NqmmB1VglCelmK4Qgp103P5i2YpYj7K1Y80enxDpEXw9uvCU4KoPTL1q104KbDq27ZGMT5B/ikq2xOXjCl3Ieb7APp0mpOVzTAOl9tR+RpMzZTIWCzETI8p3m+CGEmHA1XVw4cA5wn2FVRDeEyE941qdQ6JWkSmawvFQd5emI5GAQFCvpJ9x5Jex9Q1ArZMNWd5lmFDA/I82bk9WCNeaL1XztN6lEoFwRjHyRGg3ZG44nMZTeNuykukzpZb4mKe/XWea/XaKN5HOtcouFPaGwz/tyWX/zOAWNwJQa9VJK1CSQjAbxcRBZBsrVcdNP8LZL/ljEA4bXzoaS8682P9QlXdI3AAlslEK9HSJqVOOS98BXs17ZnAYRwG+YxBJcL0//8TtaQhPCM4Txw7XN6nut0xiLmYgn+ieaspnG1VCrXRmwRBoSOxMX7QP8IG7jhX2annGlMlRBU5B/HQl4gwlj8WYaY0C61WeRjbjgpFXayJ+Emrsc+X+lPwPUib8VFWSzUk7KyuYeIEKjIHhTKRLM81x3e8yNnKaqJCpU/S84tLd2ndVfT7Vno5sJdF1uQpc5bhmQbe8XC4B4rRr8z0IMW/fvZijfV/QGhQ0W5uxJlIvDO1vQjFgOBT9Wdlga9Y4R4OVJt5ZkSL5XEJlI0DdurSr7Gzv3Wv2iukukeJczssRw0VYEdZjkGgmMQ4x4vpVFPqnoJ3u0EXnRXolL4M1B0oI=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(23010399003)(376014)(3023799007)(6133799003)(10067099003)(18002099003)(22082099003)(38350700014)(56012099006)(261026140227099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?bU/Ia6Au1P5bJDC+HdT2qvQexN0j9dmDkBY4qGy27A5lqGMGizlRP6kZ73IX?=
 =?us-ascii?Q?TbGJXuiUvB6rO/DfPQp4afkEtAmp2IuHBdvF9s3/5RJ4huj7swb58o4MxxrH?=
 =?us-ascii?Q?n2882DJpFHV/T5QmgnJLWF+XvK6rS/yhs6EF7jIAGGJBaZXoQriFPJaBTX9c?=
 =?us-ascii?Q?vsELteqzutf6Ga1kmmDEG4j1lq1Xqj1Zcc0RYZsmqnGI+1J8gzumPbi69kV2?=
 =?us-ascii?Q?LIGsqhHPgstX9amasboaskssZxRanM2yo/uq61q9DvcwT3oZQ2FWB+uHwvGl?=
 =?us-ascii?Q?VP5TErjufpHju8AKjR19yX4WHe06dTYTAZPs5Y/CGTvk5eSBmjS4C/uQY10f?=
 =?us-ascii?Q?CtV1THl10fVpT3WVda7w7oO1UL4JagFeSgtYkiyQPSqftfVZg6hcGauZrQDg?=
 =?us-ascii?Q?KRsDaqHkZKv2CvqurdQ//WZrMN1ow6ChMTd5LVDh+fhfp2Yi8VE0a8alhC4Y?=
 =?us-ascii?Q?myNqRP2Y71t3mGUMMlPHtPuvo10baJaiSV1S03tgPrYR1gJOGSOb6Lb2772R?=
 =?us-ascii?Q?Jrv/c/m0F6L8lng8dcCicE5E5czxaf88ae1/WfOKSzS3VkCJuu0EGN40FaG4?=
 =?us-ascii?Q?4lvGI+nyDDejjFpbLp/GTb+dYhqmTfJ77b+M2Fe/dzhJgSRsktyxIym0JI3B?=
 =?us-ascii?Q?ibcgDTw3HXjwc/xz7Bd+FcaIqXFygvtypdr7j3o5pNqjqrGPaof3BkWdbUQL?=
 =?us-ascii?Q?Px8MzNfLMxCNZDjjfVFkIayIUIn7PYPRjP//TfuhL0zGCDDVE8Db9gUf03G8?=
 =?us-ascii?Q?0CoTiWadKHNuSI4udXTSHkBMrXMqDKW95X//+bxd8cisUEF0ywj3gO9JPooP?=
 =?us-ascii?Q?3ml4SJa8tUbemSmS7upTcknc3tsDee1tENeobDEE7G3ok1XL1FxWlGxYD9OS?=
 =?us-ascii?Q?IScOPDnifW0yJhZfrB/60GJt7YzIqp5LkLD8hh1w1tHyWSSsPKj10So3ieHK?=
 =?us-ascii?Q?IN3rTpVYBTFO/2+tNkAu0KuqCaL8z1SQ0rjH+UqaKbcO/u4qJWpnx3t58rO2?=
 =?us-ascii?Q?gwfYkBJj6RGVjIhSUgb0GXCuENsOeUPX5X0amirzL5q0KsWsInyeaAIWEYNv?=
 =?us-ascii?Q?fKVF13gjdQqlkU91cxroQB8AKZ8ZlSs50UC3QZtJSwKbHEtX4Mg9x5j5GLaT?=
 =?us-ascii?Q?Ld3BSPm3n1TbqtNnHaYcPzMC8yTzJlMUS1vxm0ohJdGV92yhvVb1zMiFnltK?=
 =?us-ascii?Q?LMQYjkk0UqfutNm1sVxxJa30J5kpUNUfPd72JEHiMpWhDoDpSkTvwo8wshar?=
 =?us-ascii?Q?ABo2oO8xkZ9Dg9XjTev1HIz/AH4u6RVISnPTlcnrOxr76idD9I07VMn3oDYq?=
 =?us-ascii?Q?9oKuD0eJmL+LnyDjMzgreARPmjbVdLX7g3V2Psa/RylcVb0R+fjmcUwR60U6?=
 =?us-ascii?Q?T8sZw8OjFOaXe3FPTwOTkAvDpOkzHjNm2GKjp8pPBFT+EdaMgN4qUYx4sYWX?=
 =?us-ascii?Q?6/jFMIT6UJe4cpTV1pA6ksDL3zahGFta5FJFRzHEx1k/rwKnZzb+JLppb0bH?=
 =?us-ascii?Q?5P9Nqf6f/YSxhONRZI16yT60qw0rOqQEyUMykdSv/4pYiNtNXaWRXzhcVPlp?=
 =?us-ascii?Q?fWNHwh1xsYlaoKD76zNnICFWMBKzlN5L7sgqtlMZskNz6CaLeYTM7t7vjino?=
 =?us-ascii?Q?XHSDakSJIE4oDAAowUp7+3URk1tPJISevabv9wwlpKZPd13nTFVcQ6fFWHGc?=
 =?us-ascii?Q?1uQeGoZw+fojed0bZr4zpXVNU6UFAECohO7ng17QL97TiaCj2m+dOGPayeZn?=
 =?us-ascii?Q?+YCUS7kWvDbN9SrWQLL+UnVKAZu3EJk=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: a543a6c4-3697-45c7-340c-08df36715c09
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:34:21.4308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxA79WiHP10Rfz2/n/Ds9OOdjyVZtCMlTa1Km1YphNfRt983IZsyFHoAnDtckN+k7+gvdmQ1R/QAyY54siYwGLPUu4/83shbW0EujrSS4yc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB4299

Define named register macros for OS05B10 and replace raw register
addresses in the common initialization array with the new definitions.
This improves readability and maintainability without changing
functionality.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/os05b10.c | 108 ++++++++++++++++++++++--------------
 1 file changed, 67 insertions(+), 41 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 7f6cb4c7edc8..3f478bad1fbc 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -38,6 +38,16 @@
 #define OS05B10_MODE_STANDBY		0x00
 #define OS05B10_MODE_STREAMING		0x01
 
+#define OS05B10_REG_PLL_CTRL(n)		CCI_REG8(0x0300 + (n))
+
+#define OS05B10_REG_MIPI_SC_CTRL	CCI_REG8(0x3016)
+#define OS05B10_4_LANE_MODE		0x72
+#define OS05B10_2_LANE_MODE		0x32
+
+#define OS05B10_REG_MIPI_SC_CTRL_1	CCI_REG8(0x3022)
+#define OS05B10_10BIT_MODE		0x01
+#define OS05B10_12BIT_MODE		0x61
+
 #define OS05B10_REG_EXPOSURE		CCI_REG24(0x3500)
 #define OS05B10_EXPOSURE_MIN		2
 #define OS05B10_EXPOSURE_STEP		1
@@ -47,13 +57,43 @@
 #define OS05B10_ANALOG_GAIN_MIN		0x80
 #define OS05B10_ANALOG_GAIN_MAX		0x7C0
 #define OS05B10_ANALOG_GAIN_STEP	1
-#define OS05B10_ANALOG_GAIN_DEFAULT	0x80
+#define OS05B10_ANALOG_GAIN_DEFAULT	OS05B10_ANALOG_GAIN_MIN
+
+#define OS05B10_REG_DIGITAL_GAIN	CCI_REG16(0x350a)
+#define OS05B10_DIGITAL_GAIN_MIN	0x400
+#define OS05B10_DIGITAL_GAIN_MAX	0x3fff
+#define OS05B10_DIGITAL_GAIN_STEP	1
+#define OS05B10_DIGITAL_GAIN_DEFAULT	OS05B10_DIGITAL_GAIN_MIN
+
+#define OS05B10_REG_ANALOG_GAIN_SHORT	CCI_REG16(0x350c)
+#define OS05B10_REG_DIGITAL_GAIN_SHORT	CCI_REG16(0x350e)
+#define OS05B10_REG_EXPOSURE_SHORT	CCI_REG24(0x3510)
+
+#define OS05B10_REG_X_ADDR_START	CCI_REG16(0x3800)
+#define OS05B10_REG_Y_ADDR_START	CCI_REG16(0x3802)
+#define OS05B10_REG_X_ADDR_END		CCI_REG16(0x3804)
+#define OS05B10_REG_Y_ADDR_END		CCI_REG16(0x3806)
+#define OS05B10_REG_X_OUTPUT_SIZE	CCI_REG16(0x3808)
+#define OS05B10_REG_Y_OUTPUT_SIZE	CCI_REG16(0x380a)
 
 #define OS05B10_REG_HTS			CCI_REG16(0x380c)
 
 #define OS05B10_REG_VTS			CCI_REG16(0x380e)
 #define OS05B10_VTS_MAX			0x7fff
 
+#define OS05B10_REG_ISP_X_WIN		CCI_REG16(0x3810)
+#define OS05B10_REG_ISP_Y_WIN		CCI_REG16(0x3812)
+#define OS05B10_REG_X_INC_ODD		CCI_REG8(0x3814)
+#define OS05B10_REG_X_INC_EVEN		CCI_REG8(0x3815)
+#define OS05B10_REG_Y_INC_ODD		CCI_REG8(0x3816)
+#define OS05B10_REG_Y_INC_EVEN		CCI_REG8(0x3817)
+
+#define OS05B10_REG_FORMAT1		CCI_REG8(0x3820)
+#define OS05B10_MIRROR			BIT(3)
+#define OS05B10_FLIP			GENMASK(5, 4)
+
+#define OS05B10_REG_FORMAT2		CCI_REG8(0x3821)
+
 #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
 
 static const struct v4l2_rect os05b10_native_area = {
@@ -77,30 +117,25 @@ static const char * const os05b10_supply_name[] = {
 };
 
 static const struct cci_reg_sequence os05b10_common_regs[] = {
-	{ CCI_REG8(0x0301), 0x44 },
-	{ CCI_REG8(0x0303), 0x02 },
-	{ CCI_REG8(0x0305), 0x32 },
-	{ CCI_REG8(0x0306), 0x00 },
-	{ CCI_REG8(0x0325), 0x3b },
+	{ OS05B10_REG_PLL_CTRL(0x01), 0x44 },
+	{ OS05B10_REG_PLL_CTRL(0x03), 0x02 },
+	{ OS05B10_REG_PLL_CTRL(0x05), 0x32 },
+	{ OS05B10_REG_PLL_CTRL(0x06), 0x00 },
+	{ OS05B10_REG_PLL_CTRL(0x25), 0x3b },
 	{ CCI_REG8(0x3002), 0x21 },
-	{ CCI_REG8(0x3016), 0x72 },
+	{ OS05B10_REG_MIPI_SC_CTRL, OS05B10_4_LANE_MODE },
 	{ CCI_REG8(0x301e), 0xb4 },
 	{ CCI_REG8(0x301f), 0xd0 },
 	{ CCI_REG8(0x3021), 0x03 },
-	{ CCI_REG8(0x3022), 0x01 },
+	{ OS05B10_REG_MIPI_SC_CTRL_1, OS05B10_10BIT_MODE },
 	{ CCI_REG8(0x3107), 0xa1 },
 	{ CCI_REG8(0x3108), 0x7d },
 	{ CCI_REG8(0x3109), 0xfc },
 	{ CCI_REG8(0x3503), 0x88 },
-	{ CCI_REG8(0x350a), 0x04 },
-	{ CCI_REG8(0x350b), 0x00 },
-	{ CCI_REG8(0x350c), 0x00 },
-	{ CCI_REG8(0x350d), 0x80 },
-	{ CCI_REG8(0x350e), 0x04 },
-	{ CCI_REG8(0x350f), 0x00 },
-	{ CCI_REG8(0x3510), 0x00 },
-	{ CCI_REG8(0x3511), 0x00 },
-	{ CCI_REG8(0x3512), 0x20 },
+	{ OS05B10_REG_DIGITAL_GAIN, OS05B10_DIGITAL_GAIN_DEFAULT },
+	{ OS05B10_REG_ANALOG_GAIN_SHORT, 0x0080 },
+	{ OS05B10_REG_DIGITAL_GAIN_SHORT, 0x0400 },
+	{ OS05B10_REG_EXPOSURE_SHORT, 0x000020 },
 	{ CCI_REG8(0x3600), 0x4d },
 	{ CCI_REG8(0x3601), 0x08 },
 	{ CCI_REG8(0x3610), 0x87 },
@@ -274,34 +309,25 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37f5), 0x00 },
 	{ CCI_REG8(0x37f6), 0x00 },
 	{ CCI_REG8(0x37f7), 0x00 },
-	{ CCI_REG8(0x3800), 0x01 },
-	{ CCI_REG8(0x3801), 0x30 },
-	{ CCI_REG8(0x3802), 0x00 },
-	{ CCI_REG8(0x3803), 0x00 },
-	{ CCI_REG8(0x3804), 0x0b },
-	{ CCI_REG8(0x3805), 0x5f },
-	{ CCI_REG8(0x3806), 0x07 },
-	{ CCI_REG8(0x3807), 0xa7 },
-	{ CCI_REG8(0x3808), 0x0a },
-	{ CCI_REG8(0x3809), 0x20 },
-	{ CCI_REG8(0x380a), 0x07 },
-	{ CCI_REG8(0x380b), 0x98 },
-	{ CCI_REG8(0x380c), 0x06 },
-	{ CCI_REG8(0x380d), 0xd0 },
-	{ CCI_REG8(0x3810), 0x00 },
-	{ CCI_REG8(0x3811), 0x08 },
-	{ CCI_REG8(0x3812), 0x00 },
-	{ CCI_REG8(0x3813), 0x08 },
-	{ CCI_REG8(0x3814), 0x01 },
-	{ CCI_REG8(0x3815), 0x01 },
-	{ CCI_REG8(0x3816), 0x01 },
-	{ CCI_REG8(0x3817), 0x01 },
+	{ OS05B10_REG_X_ADDR_START, 0x0130 },
+	{ OS05B10_REG_Y_ADDR_START, 0x0000 },
+	{ OS05B10_REG_X_ADDR_END, 0x0b5f },
+	{ OS05B10_REG_Y_ADDR_END, 0x07a7 },
+	{ OS05B10_REG_X_OUTPUT_SIZE, 0x0a20 },
+	{ OS05B10_REG_Y_OUTPUT_SIZE, 0x0798 },
+	{ OS05B10_REG_HTS, 0x06d0 },
+	{ OS05B10_REG_ISP_X_WIN, 0x0008 },
+	{ OS05B10_REG_ISP_Y_WIN, 0x0008 },
+	{ OS05B10_REG_X_INC_ODD, 0x01 },
+	{ OS05B10_REG_X_INC_EVEN, 0x01 },
+	{ OS05B10_REG_Y_INC_ODD, 0x01 },
+	{ OS05B10_REG_Y_INC_EVEN, 0x01 },
 	{ CCI_REG8(0x3818), 0x00 },
 	{ CCI_REG8(0x3819), 0x00 },
 	{ CCI_REG8(0x381a), 0x00 },
 	{ CCI_REG8(0x381b), 0x01 },
-	{ CCI_REG8(0x3820), 0x88 },
-	{ CCI_REG8(0x3821), 0x00 },
+	{ OS05B10_REG_FORMAT1, 0x88 },
+	{ OS05B10_REG_FORMAT2, 0x00 },
 	{ CCI_REG8(0x3822), 0x12 },
 	{ CCI_REG8(0x3823), 0x08 },
 	{ CCI_REG8(0x3824), 0x00 },
-- 
2.34.1

