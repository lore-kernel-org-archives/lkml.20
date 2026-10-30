Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.116
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793357326;
	b=wND7GLnfSCuGiR3UoKLeVZH/Q20jEvYGW3oaDVwCtKDkYDaNMd+3JbTKUXgv8DDYYwDR
	 JD6bt8p+PyT8Nn2XBYRDCS/v6J9cfSE2T5M8zm/Re4ivBb3Tqbjn99sx+MNUxhG+e1OD5
	 t1yZuL/dmodEWNrX9kHcQafgd1tXl6LC6S19nTq42jujUo6ZdC5iesPLVb5S+2v5jUlUE
	 KoHoAM5GS3ExpgTQuNTY0NQgkE355Y2WiK2T9UBMizvebbtSZvK4HnboGwlFy1A2bf+jO
	 SmroNcAfewW+9ALNS7fVeblSBvNXHuDKAidPc0IxCxJfn1iN92P8hYYEM8rwx2z9DYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357326;
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
	bh=D6FvhZ5+At1ZrRQr11bWTfcW5PI/WkQqodL9x0y200M=;
	b=1CDeIe7quoDg1GEz4XxEVoWUwFmr+2yyKh/hRse5Jt4OqJP29QAc3J2LIXBsu07dhK6U
	 OAOJMQa+fahODdmzxDe6PnhQ64na9sYVGgt4cWud0WWnxXjLqai+lh2BzzduZ3eqZJGd5
	 LPaTmX2T99aC4ey4GgwmvKQ6UuHvR8+oIzW5ctYJlt2F0R8Yt1vRZ1g1vewjFvV411o5L
	 lEZeNxQ4xjo/ARE4Y68/V/Ces/Sx3ogjpjVQz4HqDEvJGn5Q8f8X8ofa7SUklPhVmQnOk
	 M+TfCi5ze2tP4HwqVGLC+zieT299ExMwp21NoOR091k1Y3oPDY7UhAiaisx2/ZxG/3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=TEflsqLk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.116
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020116.outbound.protection.outlook.com [52.101.225.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AE5606A335;
	Fri, 30 Oct 2026 10:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95AE5606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=TEflsqLk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wiUTTXiK99BwO9vBfGcbuXxnGoxfo2OX1ArYG0sqsA3DcgJsSHGnm7VI6La8f8PdSgrQN7TqQ1q0R8KAYM3TSIaoIYxm62Kx23fdhHq5cjEJ4STleCHdHXlG5nh38xteYAgrZx3gWHLU25MMnfJSCKjEkDhX0g5TW6UZCG9vMuVjKCVOdP6Gc1sw13IBRsN91vL8tCEggSAWrAOrJtzibbhz1TNheWDVqvoyEMarFfGu2kS4GclLoyduZPgmtG2zc0RrrLfkrQIHcjbtB4qYvOkgeJOf/UHWURy8YGzLDC4RrhOvtVbC/StqA5AA4VG6zeXfmhMjUPvtLH2aBGUxzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6FvhZ5+At1ZrRQr11bWTfcW5PI/WkQqodL9x0y200M=;
 b=jnkDKbyXa803/BCTEwVIy10q2dV1T0+SyVlu3y/63/16hsMgX+y7w6Rxjv4c0quJMc7+YZfu3zpBUTv49axNzTGY69FTerotvcI+FR8u9YBOlV2cK9RkVZdjWyeHL5KIVl5qMISgdd6KWFMXDpddBVs/8bsi0s4Uu5ajsa4uTVR/bB/n732CwSlZlbpNAGzwr6zrEKuQIrkSqifAkqMKpA/LWAY2xk1bt0MAEvnWMM+ui7lQ7GP6Y4uqk1d8+UUgDruaRFr5Aq0YHDJgW/9WnP47hwDeo6dsVmQwXvDCFNMygnHGw8aaHa1NhnzQeUATfk0HHg3yFV+GWwSIKVzT0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6FvhZ5+At1ZrRQr11bWTfcW5PI/WkQqodL9x0y200M=;
 b=TEflsqLk9Eev9T45+YtZlRQHQMGOYvmVWsGMf9NAkfShROz9iLxkIQAARcJz4saeP+VYdg2JsvI2ltJKRKr22e0qEOc+ikpy6DYHEWnLoTXDGtN5yxWRV/RWcXfqh1gwS71ni3qJOJLlydNRvuS6z3QCdxOGJdnuToPOPkLFXbLJIv8Ovk2wyyB3fj8jSLvEhPVuf5r0Fn7P7xhyYJCKn62kvvfCqO130pjKTQeeckoJ2gqTP3gP8tYkXprXE3eQlGTbo0f6S86K7T3DVXiHO2qFPtAXo9Imr1L3WIQ9B1jPT0E0rIqJnxiqvcUTYKZXYLyYKwv3E6FUiMNcihKcag==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN3PPF0599420C1.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::86) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:48:41 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:48:41 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 01/15] media: i2c: os05b10: drop unused group-hold programming
Date: Fri, 30 Oct 2026 16:17:50 +0530
Message-Id: <20261030104806.1223991-2-tarang.raval@siliconsignals.io>
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN3PPF0599420C1:EE_
X-MS-Office365-Filtering-Correlation-Id: d233a2f1-83fc-4fa4-7f0a-08df36735c92
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|1800799024|366016|23010399003|18002099003|22082099003|10067099003|38350700014|56012099006|261022075727099003|261026140227099003|261021123027099003|261028144727099003|261022105027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
 pDB/IWLdRQ3gKW8q0OgWxgXyCAqlOtPpQf6Cj7RFBxjOxA241TsMcU2Vkm12aefYOlnyB0ez3zpZqe8+MeEtWyU+2EelFNy/YDqd9AHmkIqtb/yTlETxWlTNcRBmkNbn30Jd4ATOarSqc47Hhwy1AU+bcIbbmYgG1+YMpsY3dCvi3npYlPshjk8+qnPvklOEehG/n6ig8IFbeq3xSeXEgnEUgofP24zhSuzQas4YlrzExXXf5mKgmJJaa+1uEVHuVUEuY8qOfhfZYK4eDmmVHTvoTG9brjyR3SQp8Rf7Ou0OYJ4/C17zh4Saf9BpYfNuretpslgPq5oUoZ63yHJx7u31soHY+Ie1asANHIMO7ErDNnbiOZvMu+26pQ72TopPbrTHbn30+B9w+tbg4fUf9DIDWmUF3FsMEbHQoEmwEDtY7XuW0C1A+frblOXlNt/BcnS84JqtOStnqk9tsdwsPWWnJF/6Kbfhfe5OUBcw7YmB9Qx9K6M62wl+nCcc5zta/t0DBKrxH2XuXHcqSshEDWisoz9Mrm7ZfE+TEDKEvnKVE9mLMYTi7la7TQGGrHsylJAevSzLdelPFl0obF0JT53GstGPWDtr+HhApCbyxMUih/y0Mi+52VRxJfwlYkbZj2hVT5Me2i8J2kRlwbawPBuJR6laayMyXZdcRbt9rW39DLi5K2oDtXm6qt+3HZwlweIYN4N2vumyViGFJKUWUjJ8OWk24m/cLxpD1uQQItw=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(10067099003)(38350700014)(56012099006)(261022075727099003)(261026140227099003)(261021123027099003)(261028144727099003)(261022105027099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?cu+CNX3yshS91SLDW0ZIjKfqFqIuARlyMXOEUesXox8UAPdTTivYUA1UlELa?=
 =?us-ascii?Q?bGotMa6CEaf3gu82HRAYQ0WKqndYZj1FW0u8hEGL/HZS1AIoxj9+F+jv4q40?=
 =?us-ascii?Q?tZ66z1P59JCbbXZ8WskJusJtKw0LiIxAl7ZRJkiehn/30g5bINcaBKKxfwyk?=
 =?us-ascii?Q?oukYgz7YpTTL/9eaORH/msRmaMJyC4tklgN4YuSM4dXRH0xNTQT2KpewiCGN?=
 =?us-ascii?Q?kAu3K1DG3+nWORmuJY5HITIp6pQoY5B2IYr4hecaHscQ1OKpUbyP605Aq5U5?=
 =?us-ascii?Q?ACxz6Jgpx25hvRNUlRxZ/+sXQ3FLU/tHCYQmMA6KjHezqlzxkFINZz+Q/SYw?=
 =?us-ascii?Q?l0WiQ0rp/TeJdpKqldeF28POYfLymNj6yMGp7AbEZyEGkZQkVWCEOY5vxDsg?=
 =?us-ascii?Q?YqtlWd420ddi0GLm2vqMCPln+yUWXjT3uXvOquJP/BVNSAZelUbmNV47frxX?=
 =?us-ascii?Q?SRsBqDeBrbdZjIcLoM1lf0EpQI0zitAdoeOyc6WIstdkBX+w3uEp31XXvqjh?=
 =?us-ascii?Q?bQTEOxEjyOttRZCFg+D4xfG2obsVNxqJoIaTbRhwbdUsMCAyd0Fc1uvikbl+?=
 =?us-ascii?Q?oMptL/iR5frDNT4WRRQaB+qwTCeMxQT4gI2Hi36sNnFRz5us8NGVT/b0GNSE?=
 =?us-ascii?Q?NdN8VJTrehIjch+KuYzue8vhvx9HUIFegagDJcATAvKIyP6XPRm0mgtR3TnA?=
 =?us-ascii?Q?qKUlj3SnP/75loiwOQTBpOe4KVlHA/sjUxA6582tpOSur/rWmw+rw+fhcj1b?=
 =?us-ascii?Q?RnVGdWDCobg1lE5/2h3utxfmDN5HnIo5mtXGaiQk17kczQu671BAM2MraDv7?=
 =?us-ascii?Q?pJ2V+pZL8lsAQt13LIryaOSPH/yoRT3gLrTvTMbsgepUKGFMpmMsKKSlwthM?=
 =?us-ascii?Q?qklZHdl+7+yaaOskXUVepVVmCRsAcSdgtflSOryYfBEBJZ2tI0IMsQVsRe/f?=
 =?us-ascii?Q?OsxJA7BuK9Ht5d0j6AzYcAViNJ/i5tGQ5k7RtXr2J5m1AE6zxW/dJn41+EtR?=
 =?us-ascii?Q?fQQ0z9i1PHmehzpqc+1wmOo5PSGMTUkL9diWZKaQA2xsaP5Kb0P+WJt+xa4A?=
 =?us-ascii?Q?UsIw8S0fUuUCj+tJvJemYpLiHUmsoiW1qejdfAqEFNRTiSpzxkg4Cl/soCvI?=
 =?us-ascii?Q?vzN6+rKZ2fNSsbs7ju3s+pUcOwKFEm7dATVcx2t2ZE2nrlEWesnOdZH4MRRU?=
 =?us-ascii?Q?Q8oZOuG66B3DKV4b7AKsu3zsGx1o3x1eoETkHtrBLrqa94Kh8wFmRQlpgJdt?=
 =?us-ascii?Q?0LjBowV7TfEH6LWTvLgg/WH76akE/1XPTKSqzW2im4e14JYRtOBKFeOosA12?=
 =?us-ascii?Q?EQNf2Q92CJF1qiYpx9ZP5tkKANbs8psr9TwhPQtc9XmWS0oc0OCAgAdS3/L2?=
 =?us-ascii?Q?pNtjn1yLbvE79CANiotbZUQaJAv8h7eFydKfyKYEKLQKvBL4J4XPs/jC1nVE?=
 =?us-ascii?Q?CwkqqvwV6fEl/FeQ449kq4jZ0ajdS4cP6RUJJTk0r+k6VHPtFfIxBFu1ii+L?=
 =?us-ascii?Q?bk+CxCzmF9m7WjFkUgwPoz4L0Tpmb/rWNjJfcjNay9KD1ut0CfhKT20HJvNK?=
 =?us-ascii?Q?esVYyD1g2iFR4Mh5PrGEm6jHy2kYWZut2lnxj/bxYFd1PtJxv8CfvwHqBdck?=
 =?us-ascii?Q?0yvNwkT0RHzTb9t2n8uysvtL5X37k6jxi8oGHT6+auXOzFJ+DrqXGvQZWpAM?=
 =?us-ascii?Q?Bu7ICyLujOALHpFSjTvvLRz9tOKQLIWvGUI7/kEVd3boutFz2OHTJFW+sOgl?=
 =?us-ascii?Q?fodN1vfnhycYRy7IOSWJJXGKGhNME1w=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: d233a2f1-83fc-4fa4-7f0a-08df36735c92
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:48:41.3040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vpX2pRlQXTd+p45DlgI/X0si1oxV7Rmh6ur0j6e+XDTnwBcu36RwPmMUarrYoR+0mr0GehvKEQBF/nxUhC0LCZ4iSEeuDSvh98mgNvDk8Gg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PPF0599420C1

Register table included group-hold (0x3208) sequences for
groups 6/7/8/9 that only stage alternative tuning values in SRAM but are
never launched by the driver. Remove these group-hold blocks.

Also remove a duplicate register entry for 0x37bf.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
---
 drivers/media/i2c/os05b10.c | 37 -------------------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index a46cfa513e98..d5f573b1614a 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -250,7 +250,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x37ab), 0x0e },
 	{ CCI_REG8(0x37ac), 0xa0 },
 	{ CCI_REG8(0x37be), 0x0a },
-	{ CCI_REG8(0x37bf), 0x05 },
 	{ CCI_REG8(0x37bb), 0x02 },
 	{ CCI_REG8(0x37bf), 0x05 },
 	{ CCI_REG8(0x37c2), 0x04 },
@@ -415,42 +414,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x5820), 0x00 },
 	{ CCI_REG8(0x5821), 0x00 },
 	{ CCI_REG8(0x3222), 0x03 },
-	{ CCI_REG8(0x3208), 0x06 },
-	{ CCI_REG8(0x3701), 0x1d },
-	{ CCI_REG8(0x37ab), 0x01 },
-	{ CCI_REG8(0x3790), 0x21 },
-	{ CCI_REG8(0x38be), 0x00 },
-	{ CCI_REG8(0x3791), 0x5a },
-	{ CCI_REG8(0x37bf), 0x1c },
-	{ CCI_REG8(0x3610), 0x37 },
-	{ CCI_REG8(0x3208), 0x16 },
-	{ CCI_REG8(0x3208), 0x07 },
-	{ CCI_REG8(0x3701), 0x1d },
-	{ CCI_REG8(0x37ab), 0x0e },
-	{ CCI_REG8(0x3790), 0x21 },
-	{ CCI_REG8(0x38be), 0x00 },
-	{ CCI_REG8(0x3791), 0x5a },
-	{ CCI_REG8(0x37bf), 0x0a },
-	{ CCI_REG8(0x3610), 0x87 },
-	{ CCI_REG8(0x3208), 0x17 },
-	{ CCI_REG8(0x3208), 0x08 },
-	{ CCI_REG8(0x3701), 0x1d },
-	{ CCI_REG8(0x37ab), 0x0e },
-	{ CCI_REG8(0x3790), 0x21 },
-	{ CCI_REG8(0x38be), 0x00 },
-	{ CCI_REG8(0x3791), 0x5a },
-	{ CCI_REG8(0x37bf), 0x0a },
-	{ CCI_REG8(0x3610), 0x87 },
-	{ CCI_REG8(0x3208), 0x18 },
-	{ CCI_REG8(0x3208), 0x09 },
-	{ CCI_REG8(0x3701), 0x1d },
-	{ CCI_REG8(0x37ab), 0x0e },
-	{ CCI_REG8(0x3790), 0x28 },
-	{ CCI_REG8(0x38be), 0x00 },
-	{ CCI_REG8(0x3791), 0x63 },
-	{ CCI_REG8(0x37bf), 0x0a },
-	{ CCI_REG8(0x3610), 0x87 },
-	{ CCI_REG8(0x3208), 0x19 },
 };
 
 struct os05b10 {
-- 
2.34.1

