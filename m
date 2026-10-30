Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.142
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793357410;
	b=NGqYL+MYRRgiNDNNOgWR6ZSJ7kWWOfSZqAjRU7KXUaX9tkl0wF11tUirCctHE3tUEums
	 Ld1FJjeHWTZRGiY9m0lXVfrmHwOoIt7BLeIJma8Vtq5GAxNDaFxSmNJRyrBRBTSHjDg4R
	 Mj6nXXyweLY6lVY6CwEKjDLcNv3JNy8krFH6i0kanwwLuVskEsohrwD4F+ykAdivxFiKL
	 mNMuzWx9X61Z+cJS8BV105aSy8nNUEm6d7pnPzyzuJZmvvO+Ao4EKxlxwvIOA6vBHQZDI
	 Ylm9uoh+ymnZecndIwzvtqrAtS812IGTTbj3uze3q+GNh1/nT5O8an1V9kIPrwYdD5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357410;
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
	bh=34l92fuSWBfBiI1jw65D1tqtfwlCxSdGncszDtgyJGU=;
	b=eGgYQSW0j9wooWUAkjAVF7bUYbDepk16TpN4s7i9B7MvNXnF1fbJ5aUIGdcgd3kkGFPU
	 sIjGvjoA+3M8Y0V2QxmNA7p//MPidB0BM/19tjAlrTZNbJeH63tdkUbkGBCDMzXK1Zx9Z
	 H49/bVf262x1r8hN4QChvYEsJpXd7Y6kUp8BF0utf5UqSREykj7Ps2aUOx6pk1UGQMTf/
	 kvEDlfZwRGHhLCDv8b7O/e/Qa0lQ4ctljfcMNqzzwX/Kl/5SKq8X2tJ2LO4RRZN6hJixP
	 QvobBmecVB1x8U55Mk7nQvfdpFs0NtCBkvi2cs/KCKPWtWxhIJqx9RGP0T7Ff8bhPAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=ipaiom+t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.142
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020142.outbound.protection.outlook.com [52.101.225.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134B160A3835;
	Fri, 30 Oct 2026 10:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 134B160A3835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=ipaiom+t
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shUYOOSWuBTJkeI50HVB638e2iT6CkoYwqnErQusW7TYr1dQOBV6aB1FLneT8sBnZ68lFEX7fq7vK19zKegQ6/wM3dRocrltyhhKWnAzjzfQLQO/GCBaCxM4kpAqD31E2byxEuHJWFIXYrYV2SWRp/zVBd7NInOxwA35M69D49Ehp9X1jCeUkN7aLU+Qgk0v3/9MewlE6m3zk0IQ+C+EgR8YI1OfVHSu1v/FzyCaifUmW/lYtId34syFhW3muzhOSJOpK8S39K86Lh3s7OHgxYvEhEXlSY5PJ2RM976+eN7qt5dNeo+sb/K5cmY2Ton2DPN8giPWoKzpIx/57wsPbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34l92fuSWBfBiI1jw65D1tqtfwlCxSdGncszDtgyJGU=;
 b=eTmi3h1hPpxquGucjJIld/L2GizWUJO8OSwCXbkXWPYEPU3MJQ3ouTmVvFnLFnFOcZaAgkXAmS9Q9eCIJDQBLiJnQezasZqe0LQEVUtyTZdi/DJpUqGJe4CWTXswKC0mzJ54WIo31dD2cvPk4feqRUZM0RKdVido8nddqeJBz08ixBa3PWGGLQIP9cWspjcreihII8cKdssQelG+dH0GwUJdQM1zakACTRwNPeDH0SQScClpPV2OfvO55l7AFjaYIfWII8i116jn0kOpTSzWhXiOyJP/37eWuCnkAs3JU9FYjXviSopOq8UDfApe8AXN+b6zxzRQq4FlgC3lJlm94g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34l92fuSWBfBiI1jw65D1tqtfwlCxSdGncszDtgyJGU=;
 b=ipaiom+tdMNrnyWXL6ITD9XSEUwbMcR6rzMUw72Gn9H+Ic9Lzx1PVq61lglbVc1iVPtNdwpL+SPCSSglOoN7CzPIAzd0YAoOzeFSTRLqPcAmgbaHEboqLgz5pyaIAUsdV6ingUgQ5JXHxTi/gpaWBL/+BkOtb+37UHURd/g6qCc8D7y6a06HPe0oDl9nPYwtFe+RIdzM/vMW9u3sYpxUO6ehqX9FXRAO/rdMxEI8MoUS8zwsA8GJiyOISIEQUSknxSvcxoQuE2OpBVy88irsFR0+jKUJFiwV/Y5tNOyXKxgSlgadl+je34ePmDTsQOnhmFGunKZbCRQBuetiFHI97w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN2P287MB1787.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b1::8)
 by PN2P287MB0975.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:136::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:50:07 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::3d7f:7f9:3b6e:4781]) by PN2P287MB1787.INDP287.PROD.OUTLOOK.COM
 ([fe80::3d7f:7f9:3b6e:4781%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:50:07 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 14/15] media: i2c: os05b10: add 2-lane support
Date: Fri, 30 Oct 2026 16:18:03 +0530
Message-Id: <20261030104806.1223991-15-tarang.raval@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: 5086b787-9a4f-45cf-ac8f-08df36736b3f
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|23010399003|376014|6133799003|10067099003|18002099003|22082099003|38350700014|56012099006|261026140227099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|261022075727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
 ObTAkxCfoWrU/CGpH69Zz6YQG0EG+L8CuQVxHchz1dXwAJZp++q7Pl7uHG6vqioAzn3UCBYqTl49fppynYnhGLru2My2q48F9y5nBgPUjFPr7WCpAsWYnPMHSMXG15YkK2Y7rTxgOpkzOrgdQI1dyTrHBN4HaYbn+ASou4uwIoJxMMjM1S/zap6Opltbu/akBRzZwLEYABh2RQhX40leUEv1H/IENQU9w9yhza+cpBLhktlJ9s/PFNHx1XMORhoX1b0F7+m5z29lTqWucFWUMIWUEloOoZ4zcrDQK0kfZYWH6aPp05n4ySeuVmrcya3jZrz9fyJMGZV3DBEMAxJUmS8gpNhE3gJlrJU1gmPRlWZ04siPSmJhwYmHXta5nppwrBxOCm5389r8pGLkha20+9k1g0dEZdBWg3mDoZ+Ri9DCr+1aDOq9uQ+tEYeJkIN40n174m41GmZ/hHnUxhqulLuxfZoEsfg0b7F8BcG2cjcVCfPj6rO+iT3fuxAZMXfA8P7uN6HavPCtf+0FLssJuUdKYvfooJxXNtFng2CXpLEIyqB6SeOGayjTosigHAMn2ibfH5JwGfs8mZvoczV21BHYwduYurPLfvcEMJDkEbtAsz6KRIWCXjhjEzcPfwqp6CyGfU79t3rVtE2JdqnfKOVd3jW6YAklGPV5XZ94/XKTK3OlmoFv+I28W1oC5RzW/VW5k/ut75UOGYQ/8eYBo2s01IcYZdNrLGLcegdccYM=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2P287MB1787.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(23010399003)(376014)(6133799003)(10067099003)(18002099003)(22082099003)(38350700014)(56012099006)(261026140227099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022075727099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?3MUh+Ts9LT1uI3XoFvbyPh18m9rv3e93D5NOcdT+PaGnbT2TTabB0v7e7W9O?=
 =?us-ascii?Q?wO2bE80d7F3Vlwn8MWkSLaE5gT5r96LmU/hSFsne9Aja/cCbaoxMRP9PRy6C?=
 =?us-ascii?Q?l8WfiL+eMJD+UQn7usg6jSqJiRZAW6sLk9MdAvcsWjKacgXTj5DOy/W32tDm?=
 =?us-ascii?Q?hW3w0yQFJR5W4K/2u2g88Mxxl25UQYb+puabd58UBRMFuBIOdf1l0I+SsEgy?=
 =?us-ascii?Q?vtlDoiXTNDLbLH3e8DukMwkdkjxXLukFk7aOGv+WoPMX2xPg8hBtu1cZcMsw?=
 =?us-ascii?Q?E1ePUaPecF72ACS2jLEPc4nxi6dsZ6ufWzUOCOXbYltPQ2mxLVtHy/Zj8tGM?=
 =?us-ascii?Q?8Me0rPFR3ih/ufNmGcCKyy4y/ZHZwBTOWu4trfiKzjDKHbmCT/rxdTP0/EzI?=
 =?us-ascii?Q?RnD9CpcNHEGKMR2D2GILnoAwg9B+lKT7Wccz2IztHs6ToVek/3sTPq9zJFxb?=
 =?us-ascii?Q?E5JPhSOkx4gM2zJuQg4w8uKzTo4rqGrINYsb/emZuzt1ygLdkhhFGmMzz9/B?=
 =?us-ascii?Q?LShrPO7zfOEdzOJgEpOGxXDdKquP2TERrFXTdlG7LeuJal7aoHK9wlkB3Bes?=
 =?us-ascii?Q?rgetuxDnnrT45OLTq7lnk/uoJTYx8f+CLpFxEooHvN6dduaIFmwwuHF0Pjbm?=
 =?us-ascii?Q?lvdVPPYhFoazG6ttbqC1Ch1ZedqZ7mpdJwzhC5AOUsJgLLofv7ovLXKgcGHu?=
 =?us-ascii?Q?nrgf/DSqNg5xzDxho0eFJ5cEQO/H8DZBYMRioM+hqkTROe18SfZvDD2XKbop?=
 =?us-ascii?Q?9Txxd9rYnPCKxHobkyRtOJtTyVMq3Svy8OM/CU8C+IZYx0kUZNK66OvTE6Dy?=
 =?us-ascii?Q?D+lbZyFIuMw5jy9eX+FR9LntzKt2wvVBTOdiVHXd/3t7fSte+7EceHH0eyOm?=
 =?us-ascii?Q?susJlDX4uZRiIDXWGbYdW4kNagtWTGDmeeO/rob2qwevE5e4tiaXGgsFr7zn?=
 =?us-ascii?Q?pi9MqlQ03hgvC7BlU9p5aEZcOzwLU4Cs5KGE97rOc+gnkm1/klcqmMGtO5Gu?=
 =?us-ascii?Q?euljRzQCqHoJt/AnQK0CWN0m8JZBaNxUIv6rCTawxlV2RTsLsR5m7EWNQ42G?=
 =?us-ascii?Q?7rQEY2KoswcigR/CznnTHg9RquCVdzU+7Y+7el/gN5ru+fjsOOHwCnUraWD9?=
 =?us-ascii?Q?USYRSieOJAdjvuPS1w2BC38fg9p4fUQPVKv4IrULXlNWd/m36t9H1rGk6Dqe?=
 =?us-ascii?Q?wcqqVH48z39fjgNMSf1NYA05GG4Y+odKfMpT69GEWH9fhWCTvkhv+y1TkD9H?=
 =?us-ascii?Q?LTRlOpr4GuMWt80hSCAfYu5j/geEZQlO/7qoVykFY9Vlhah5oPtkWDxKRj+b?=
 =?us-ascii?Q?j1v4Y+d1GVa1QskgdYnETbnXt7640OsHT9w2pviFLLLANU5CbYKb9KD/iDHI?=
 =?us-ascii?Q?HF2ABqn9u3Wxer+rZ2YyFT/Xv4yyS6gOo4dOMRFDPmFYdKXYnpGg0sZMnco+?=
 =?us-ascii?Q?tjd5yp9ko2fj5iglNv5maXnWpi4fB/jpMleC4zYR9ReAMgZHEbINqQHSYnz2?=
 =?us-ascii?Q?X9FUHPWzLfkczP0AMFDo1vt2nJ600adkhFO6CF8mXLf+PmK44tnrG3AUIpyl?=
 =?us-ascii?Q?d6ReskDJ5b8yI6zMB8ts26THJJ4XcY1ZabzAZtIozhtmjmXVtuss0kGF/40W?=
 =?us-ascii?Q?973VLbW9xsIRDRztOQlSUpVIkZ85KDZjp5SgT4LfVRPXU2x/QvC+zuDZxNa6?=
 =?us-ascii?Q?ViALeDT9c1jTmK3gsNRRyhjpXfz3syz60NjkJldIS18YJPZTXRNhN86Y0qjr?=
 =?us-ascii?Q?t4OwDzMZ4tOE0eUzAxvFpAh/nFWjxlk=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 5086b787-9a4f-45cf-ac8f-08df36736b3f
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:49:05.9297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 791Btnubm51YOFqVXNQMszSW+Mpn0a46AchHYFFI8Z8dhJhwEZhtCCBlxR5bcmKpPVugfX6oLWUlooUdZa+3kMYEKAAbcz7yEZAZ8n9cGSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0975

Add support for 2-lane operation.

The link frequency depends on the number of data lanes: 750 MHz for
2-lane and 600 MHz for 4-lane. Select the matching frequency table while
parsing the endpoint and use it for the LINK_FREQ control and the pixel
rate computation. Accept 2 or 4 data lanes in the endpoint.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 70 +++++++++++++++++++++++++++++--------
 1 file changed, 55 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 507d714fbd21..9284b21a92c7 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -111,6 +111,7 @@
 #define OS05B10_ROLLING_BAR_EFFECT	0xc0
 
 #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
+#define OS05B10_LINK_FREQ_750MHZ	(750 * HZ_PER_MHZ)
 
 static const struct v4l2_rect os05b10_native_area = {
 	.top = 0,
@@ -133,13 +134,7 @@ static const char * const os05b10_supply_name[] = {
 };
 
 static const struct cci_reg_sequence os05b10_common_regs[] = {
-	{ OS05B10_REG_PLL_CTRL(0x01), 0x44 },
-	{ OS05B10_REG_PLL_CTRL(0x03), 0x02 },
-	{ OS05B10_REG_PLL_CTRL(0x05), 0x32 },
-	{ OS05B10_REG_PLL_CTRL(0x06), 0x00 },
-	{ OS05B10_REG_PLL_CTRL(0x25), 0x3b },
 	{ CCI_REG8(0x3002), 0x21 },
-	{ OS05B10_REG_MIPI_SC_CTRL, OS05B10_4_LANE_MODE },
 	{ CCI_REG8(0x301e), 0xb4 },
 	{ CCI_REG8(0x301f), 0xd0 },
 	{ CCI_REG8(0x3021), 0x03 },
@@ -529,6 +524,24 @@ static const struct cci_reg_sequence mode_1280_720_regs[] = {
 	{ CCI_REG8(0x4837), 0x0d },
 };
 
+static const struct cci_reg_sequence os05b10_2lane_regs[] = {
+	{ OS05B10_REG_PLL_CTRL(0x01), 0x44 },
+	{ OS05B10_REG_PLL_CTRL(0x03), 0x02 },
+	{ OS05B10_REG_PLL_CTRL(0x05), 0x64 },
+	{ OS05B10_REG_PLL_CTRL(0x06), 0x00 },
+	{ OS05B10_REG_PLL_CTRL(0x25), 0x3b },
+	{ OS05B10_REG_MIPI_SC_CTRL, OS05B10_2_LANE_MODE },
+};
+
+static const struct cci_reg_sequence os05b10_4lane_regs[] = {
+	{ OS05B10_REG_PLL_CTRL(0x01), 0x44 },
+	{ OS05B10_REG_PLL_CTRL(0x03), 0x02 },
+	{ OS05B10_REG_PLL_CTRL(0x05), 0x32 },
+	{ OS05B10_REG_PLL_CTRL(0x06), 0x00 },
+	{ OS05B10_REG_PLL_CTRL(0x25), 0x3b },
+	{ OS05B10_REG_MIPI_SC_CTRL, OS05B10_4_LANE_MODE },
+};
+
 struct os05b10 {
 	struct device *dev;
 	struct regmap *cci;
@@ -547,6 +560,7 @@ struct os05b10 {
 	struct v4l2_ctrl *vflip;
 	struct v4l2_ctrl *hflip;
 
+	const s64 *link_frequencies;
 	u32 link_freq_index;
 	u32 data_lanes;
 };
@@ -644,10 +658,14 @@ static const struct os05b10_mode supported_modes_10bit[] = {
 	},
 };
 
-static const s64 link_frequencies[] = {
+static const s64 link_frequencies_4lane[] = {
 	OS05B10_LINK_FREQ_600MHZ,
 };
 
+static const s64 link_frequencies_2lane[] = {
+	OS05B10_LINK_FREQ_750MHZ,
+};
+
 static const u32 os05b10_mbus_codes[] = {
 	MEDIA_BUS_FMT_SBGGR10_1X10,
 	MEDIA_BUS_FMT_SBGGR12_1X12,
@@ -983,6 +1001,19 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 	if (ret < 0)
 		return ret;
 
+	/* Write PLL and MIPI lane configuration */
+	if (os05b10->data_lanes == 2)
+		ret = cci_multi_reg_write(os05b10->cci, os05b10_2lane_regs,
+					  ARRAY_SIZE(os05b10_2lane_regs), NULL);
+	else
+		ret = cci_multi_reg_write(os05b10->cci, os05b10_4lane_regs,
+					  ARRAY_SIZE(os05b10_4lane_regs), NULL);
+	if (ret) {
+		dev_err(os05b10->dev,
+			"failed to write PLL and MIPI lane registers\n");
+		goto err_rpm_put;
+	}
+
 	/* Write common registers */
 	ret = cci_multi_reg_write(os05b10->cci, os05b10_common_regs,
 				  ARRAY_SIZE(os05b10_common_regs), NULL);
@@ -1194,9 +1225,16 @@ static int os05b10_parse_endpoint(struct os05b10 *os05b10)
 	if (ret)
 		return ret;
 
-	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
+	switch (bus_cfg.bus.mipi_csi2.num_data_lanes) {
+	case 2:
+		os05b10->link_frequencies = link_frequencies_2lane;
+		break;
+	case 4:
+		os05b10->link_frequencies = link_frequencies_4lane;
+		break;
+	default:
 		ret = dev_err_probe(os05b10->dev, -EINVAL,
-				    "only 4 data lanes are supported\n");
+				    "only 2 or 4 data lanes are supported\n");
 		goto error_out;
 	}
 
@@ -1204,11 +1242,13 @@ static int os05b10_parse_endpoint(struct os05b10 *os05b10)
 
 	ret = v4l2_link_freq_to_bitmap(os05b10->dev, bus_cfg.link_frequencies,
 				       bus_cfg.nr_of_link_frequencies,
-				       link_frequencies,
-				       ARRAY_SIZE(link_frequencies),
+				       os05b10->link_frequencies,
+				       ARRAY_SIZE(link_frequencies_4lane),
 				       &link_freq_bitmap);
 	if (ret) {
-		dev_err(os05b10->dev, "only 600MHz frequency is available\n");
+		dev_err(os05b10->dev, "%u MHz link frequency required for %u lanes\n",
+			(unsigned int)(os05b10->link_frequencies[0] / HZ_PER_MHZ),
+			os05b10->data_lanes);
 		goto error_out;
 	}
 
@@ -1223,7 +1263,7 @@ static int os05b10_parse_endpoint(struct os05b10 *os05b10)
 static u64 os05b10_pixel_rate(struct os05b10 *os05b10,
 			      const struct os05b10_mode *mode)
 {
-	u64 link_freq = link_frequencies[os05b10->link_freq_index];
+	u64 link_freq = os05b10->link_frequencies[os05b10->link_freq_index];
 	u64 pixel_rate = div_u64(link_freq * 2 * os05b10->data_lanes, mode->bpp);
 
 	dev_dbg(os05b10->dev,
@@ -1255,9 +1295,9 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 
 	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
 					   V4L2_CID_LINK_FREQ,
-					   ARRAY_SIZE(link_frequencies) - 1,
+					   ARRAY_SIZE(link_frequencies_4lane) - 1,
 					   os05b10->link_freq_index,
-					   link_frequencies);
+					   os05b10->link_frequencies);
 
 	hblank_def = mode->hts - mode->width;
 	os05b10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK,
-- 
2.34.1

