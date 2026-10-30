Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.113
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793356481;
	b=PLbdbrxzyVIcM9L0dJmFsDrtYD23IYSNRjqc3z9qcs6LoaRuyp0zHSehzJNgx/SUPowi
	 3LLVnjAX+NUmDL/cjHZgZPuhrLwB6kPiE1SgBxwRsBJAiT67FU/WTNDcUOTGugKyhCizo
	 EljSFrbRNYAxuixaHkvITgix5vsjNhJW7IkkUVHtvs36KZTpArtgvz+ZINCKPjhA+5X5G
	 P5myWbzZ+VFeNbpWPDy2FZZ0eC/FQbLjfFUi2b0eqrZOnsWBaO7Q49wdDTlRahhUq2e2V
	 mqXA/lIKPjFFoD2UbXUECW7LMruaIbToRyaV6vAG4JfbZaaUbGQ6BRCiTwYKrwUrUBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356481;
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
	bh=qKDaawHmY1myn6Ai8bxwnYli+FYFFJIRuNIy2M0kO/0=;
	b=frg7Ffjzpc4WHQ8lq6jaqs5Nlwn4/XckvxLuClEvy4sYNcpZ0t5LZoSbY4whG5yzCXET
	 rKASlnRM6SypXkHa6AxV6fam1VvhnzKFTX98TOd8wYZL/lYQHw5FCa7Q2/YcD36J45ZHt
	 pjuk7E/xF/bC0mK1er7agJ8dW1gTBNAGNjMs0rw1ZuQre8+OaeMt0FgegQfMedqcIjdSY
	 FidjiBHJv7nZejQ8+HuisXuvVKpTezKMqL/l675wNSBP+tHf7uH1t9imm8ST5k1GKjdtP
	 5RQm8mFiiD9w/QS+Sa1uV1esM38qeAbpnBGE2v4SUmY7BCkeotyvSB20i8pKp0CFPQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=UmdXZ2HB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.113
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021113.outbound.protection.outlook.com [40.107.51.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0359E60A6F6F;
	Fri, 30 Oct 2026 10:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0359E60A6F6F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=UmdXZ2HB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ya0iNUxPRg8Duc8dUooQy8zJF0vcUwf/ZJxIaGrq+HqQISgE19QEMndkgSlwMjR3FYLmCCmKNoqMCFdroTYu8WVu+APlH8ZkJipTt0ctag/BOOvAW/Msy7d5qnnsT4KBsmSGBrHKHOtvCiUJKnYx8Yiz/IC0tu9xjg93IJvbRoiAMpLmNGnZkYXQyqbS/SJrvFS3gqJuuw/Q9TgTLFGlQ1OJn92M5Jt0nf2xBclhGzdLijJB4MX9zNlnw7/+jNUQXARqm+7ANgfX+FUKdsLBhKKvBU+oiQQSCO8UNHCKf7yyOo94a5dUcGWzRKFwxYhP2v06AeCkFa96ONBZrwWXTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKDaawHmY1myn6Ai8bxwnYli+FYFFJIRuNIy2M0kO/0=;
 b=gogFMHPAtA3w9eWy3F2mZz1ytBETlxWxA4frYUBnj6BDB4nykrJt9xKOL3BW3x7xqwfva7hins8x3+iZRppVNQLV9bPK0ZBCJZH0TDVjP9C3OFkC2+lnIjWfE2gM06NgoM/V+IQY7FBCvs5fww03gHq9R5q5oNUz1BOq0T1dkrZYCeBSDbBJmfMHiWmEAnRgyJxbd69JYbC27oHZrknD22wdMQRqELmf2Hb6q92lCHz5Ng+ImPdYBMD5CZyS/476g4wur5YDhcxKQqEI6PlVpWmEEBzJzZGcozS2a62P0aYvj1B8A4vVJ4CldlWx3/l1Ix0AxyRHAhAe43wN7WaXOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKDaawHmY1myn6Ai8bxwnYli+FYFFJIRuNIy2M0kO/0=;
 b=UmdXZ2HBfjuLoGunsD1AuM59lBxcFNSYekU6vPHQvZc/6kx02bpVWXlukxi+nU+CQzp7z40KiI0i6LF2Wa+aOffW/Y0I/69vm8nJrM6rNA1yv4n0fZIAA3VFYPf0wUO6Mt+faAf5oFa60tP53s2E+2BQHBIWTtLKk9eYJMvjMRUryMj4xbkHMdixcSD9iCKicz7WV69sY2Rb90R6beLYAMV7XqE2xzbQIBywDpUM+MV6hbyzfeLU6uvonQsU5d/wOWvSYkVuYR1SBVZk6ugJOTo4fgnGtAWDPF5TcE9CYl5nbMdDfdA+auWC/x9x24yVwoh7Y7oO4fINbo5tneL9kA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNYP287MB5378.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:309::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:34:37 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:34:37 +0000
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
Subject: [PATCH v4 13/15] media: i2c: os05b10: keep exposure default in sync with the active mode on VBLANK changes
Date: Fri, 30 Oct 2026 16:03:45 +0530
Message-Id: <20261030103348.1222201-14-tarang.raval@siliconsignals.io>
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PNYP287MB5378:EE_
X-MS-Office365-Filtering-Correlation-Id: c7a2ae27-fe99-4c90-3a1a-08df36716569
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|18002099003|22082099003|38350700014|261009223027099003|261022105027099003|261022075727099003|56012099006|261028144727099003|261026140227099003|10067099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
 abuXYV0wQBaJijnmyLhYqWKlR3fcOUk63Do8EGjelEWkr9dVSD6AT7VfE9/zKuFqOWcwH8+xERlOlw2wrqoBHlZ/ze5Cz7L7hHeClL4WNFy7lG/E83WvATsM2xHd8IL4Wip8eHH3HbhLoKvkukFWqZhKRssBRkql4l2RHNqPE9d9/jgOSKr2GCYvD9tAmFdCYpt355C6NuxKTnWN7Zk7d2dpCmBvSpGFp6Gm0URQrldMc7ONWp0QnCNqP7zdkMxztpJ2o0d06HT5bvvmB5oRL2IfxE9reGHcpofIGzyQrobdnhnoLrhHstd2qUyWqH+b1b17ekiYKkes7d0P3SubdJRthBbGTVOYjCJyfuWagD4mPWgWXzvXGM2+90ihaPJh59HFk7S8cE62+yBpRWQQexQryMvKB/t+U/FAkSLNP1H8KfnHEDnY+YumGAKmHuePLRZDp2tRusYugYfptMXLRBzwq6tEDDN0FsUMUv5PzGasoWCDj4p/x98YQ9D+LvZofUx8czSgOxwyAHy7gktkoexQZ8zrLYZPAhB8+Ek9MWUkAc0joufD7RBJm4EzBl0kJGnJRYDBxCcd+g1wey5WWJ+tFzVXKFTHSMnlZfNg8DDwFfHpWD2cDa9YgaNa06AVL2y7M0IaOpLKacXPZRj6zeRf44JomCae8RMSd1Li8ICqIftou5fXyH9hufYtgVhy+K6r2aewU5gGKxRkZn5k2IKoPe5OeT7gaq0KKxAy5Iw=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(18002099003)(22082099003)(38350700014)(261009223027099003)(261022105027099003)(261022075727099003)(56012099006)(261028144727099003)(261026140227099003)(10067099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?EcpDDxPhL5ew24p9zTfU71pmCggLkU6V6ZCeUrlPWQHnPzl6Qe3enyhzkXm7?=
 =?us-ascii?Q?82BNMfqIp8J8sQ+XpSqXSd1yeZfw4zSf+CDbaYE3IfDr0rciAjMbZQE29UAa?=
 =?us-ascii?Q?+tx7y87UAza+pM00Qr9uIPT6kY9C9570+ZvkKluELiI3SH4GFFVU8vuQ1ppe?=
 =?us-ascii?Q?0VF5MA2UtVlUGg8OfNmTLUWWWKnzRwppH1D5ti5YXN6aJrwt9PttjdJ3UzcI?=
 =?us-ascii?Q?kV3/7nfS07CZCBt+aJtMMPcF9xTXFh+ohuHRJW8PAVmqDayhKbex0yLeZDZV?=
 =?us-ascii?Q?DUrwAfjEhylzG7ZUj2CBeInzAIZXEsqXrzxnHgx69gy+XD3REyzYRQZubZdt?=
 =?us-ascii?Q?bObOKwX4bL39mBrbNlIgr+o5MPzuN+nIOzvOt6hA+3x/9KPrRwzWpB8ApRBF?=
 =?us-ascii?Q?eqsRgplpEzeas4GIoFHHULMzhxFj38/D/bb1lgaeBIJnIK8if8Ar8BfKWgcZ?=
 =?us-ascii?Q?omKuhEdHoMCltyE+QrxwLj1c6kI1KasjjGLH1VurOpbIqwTrxi7EuGoPhoTR?=
 =?us-ascii?Q?1lsR5qMbA8smbX8u3bOl5dRc5Y0a03mbGzA0eBHa15YNQadYfBzvaBYkbFZF?=
 =?us-ascii?Q?lhtXlwDijSLlmUfYjsak51rsXTH8L+jEPaMGq2OhgYJjmnxcfLRSFpBzVZtX?=
 =?us-ascii?Q?M0RoaByqKHq//wAL/ihleeM6bwF62+BB56W9yvLRl8aVjuhgB4Je0O1mDjdC?=
 =?us-ascii?Q?3udx2Almw4dr9qdyNdWEeZB1Cr/mEIJ3xgan4TzLC8OKd+xZ5EXNTCcnbdFR?=
 =?us-ascii?Q?9PtvxZIJ0RRPii2Qkpbuyj34EsFYCHoNEF+HsBTY7IsOXLzmClorkQHuZh9x?=
 =?us-ascii?Q?5S9EiDQiEDlFZ6zMYE/bq03jgqnswhUDixzdZu4wbGpOZoP3necFOLpA8gd3?=
 =?us-ascii?Q?pTGLU32mMC+Y+zH7tLctXwAZ2cKWoKl4Csb2TrRL20Uj6C05E+EWVG+EKQvC?=
 =?us-ascii?Q?K/UwDqlIpWC29emdB4ixEjtWEQU4OPrIkzHcI+uYdRsl2hZFnPYnvP8T0MbD?=
 =?us-ascii?Q?5dJVDo7KS8aIyjErANhxjqqmVhjf192jXYXyFG+C2at5bU00luOx52GzFUcX?=
 =?us-ascii?Q?Luuy26jvycr2uAuFLCE2PPzPR9YrgMqdSOqF3Mlnyo4rIf1nTonGBCqMrPV7?=
 =?us-ascii?Q?kq2eqKrLOO/TbQqJOWm0wfw3k5H8Sdt5SksbgitOj9e6nUDK9DDZh3pV9Q1m?=
 =?us-ascii?Q?wb0LRZD7B9IPSIcRhU+kSGCEKQcBajddKHWPYY2EypoqxZxsr1NB9xQyyUtr?=
 =?us-ascii?Q?QW6o6dZ4f/oFl13eFMf1cdb8FZ3fOjuA7p0sKovksAzzAMgVGUg4SIYzlM4Q?=
 =?us-ascii?Q?ly8MeCBOG0Aa4CX3HEft0EoLVO4rVc08nKRBYZhoAW0sD+hV6ZvaTjie4dOt?=
 =?us-ascii?Q?ZdIyZmQOUQ2LHUZywFODquGcfNPG6CwxOCqC84daaVYbLv3xD+SoIfmY0c4v?=
 =?us-ascii?Q?//UUJEia2yWOcikQxqbVra56FzDy7GEdABTcTRAPPBuXigUwfMqhgseL+SV4?=
 =?us-ascii?Q?/GvesQGeCWzIKdhMZ+nU0/85ZyxzU1lzPVqDDDjT9bX5tvZs+lqQCBTgRgmg?=
 =?us-ascii?Q?30lFpag5jS2A2q6xciPbwtxxLbTLsAcZM/4xUjpz1X8sfLZ15pFcvreMejNK?=
 =?us-ascii?Q?/E8DgkSvufFj7vpNz+3Z+bQ9TaRijJ7L0OABOW7SXJv6SSblSWaDrDIeIT58?=
 =?us-ascii?Q?6K0Bx9iH5WKA1LHHIrn/v24rSD1aML9cbanRI1TPxgTDGUkT1IaWBQ3+JUOB?=
 =?us-ascii?Q?mQGdBfFovT99FmupNimoWEaw04HruUM=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a2ae27-fe99-4c90-3a1a-08df36716569
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:34:37.1494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: finhZFNBqo+EE6FIkCeQGbsNcB7ITIfVA5Ed9jW7ibhluDJWNzae3eSIZDxIiUDF+L808ROsFdXxX3VutU2ra6HuMngvMqWl2ScV80uVeuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB5378

Update vblank through the control path on mode changes so exposure
limits and default values are recalculated consistently from the
active mode.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/i2c/os05b10.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 48c406b2e544..507d714fbd21 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -16,6 +16,7 @@
 #include <linux/err.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
@@ -751,13 +752,23 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
 						     struct os05b10, handler);
+	const struct os05b10_mode *mode_list;
 	struct v4l2_subdev_state *state;
+	const struct os05b10_mode *mode;
 	struct v4l2_mbus_framefmt *fmt;
+	unsigned int num_modes;
 	int vts, ret;
 
 	state = v4l2_subdev_get_locked_active_state(&os05b10->sd);
 	fmt = v4l2_subdev_state_get_format(state, 0);
 
+	ret = get_mode_table(os05b10, fmt->code, &mode_list, &num_modes);
+	if (ret)
+		return ret;
+
+	mode = v4l2_find_nearest_size(mode_list, num_modes, width, height,
+				      fmt->width, fmt->height);
+
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		/* Honour the VBLANK limits when setting exposure. */
 		s64 max = fmt->height + ctrl->val - OS05B10_EXPOSURE_MARGIN;
@@ -765,7 +776,7 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = __v4l2_ctrl_modify_range(os05b10->exposure,
 					       os05b10->exposure->minimum, max,
 					       os05b10->exposure->step,
-					       os05b10->exposure->default_value);
+					       min_t(s64, mode->exp, max));
 		if (ret)
 			return ret;
 	}
@@ -851,15 +862,19 @@ static int os05b10_set_framing_limits(struct os05b10 *os05b10,
 
 	vblank = mode->vts - mode->height;
 	vblank_max = OS05B10_VTS_MAX - mode->height;
-	ret = __v4l2_ctrl_modify_range(os05b10->vblank, 0, vblank_max, 1,
+	ret = __v4l2_ctrl_modify_range(os05b10->vblank, vblank, vblank_max, 1,
 				       vblank);
 	if (ret)
 		return ret;
 
 	max_exp = mode->vts - OS05B10_EXPOSURE_MARGIN;
-	return __v4l2_ctrl_modify_range(os05b10->exposure,
-					OS05B10_EXPOSURE_MIN, max_exp,
-					OS05B10_EXPOSURE_STEP, mode->exp);
+	ret = __v4l2_ctrl_modify_range(os05b10->exposure,
+				       OS05B10_EXPOSURE_MIN, max_exp,
+				       OS05B10_EXPOSURE_STEP, mode->exp);
+	if (ret)
+		return ret;
+
+	return __v4l2_ctrl_s_ctrl(os05b10->vblank, vblank);
 }
 
 static int os05b10_set_pad_format(struct v4l2_subdev *sd,
-- 
2.34.1

