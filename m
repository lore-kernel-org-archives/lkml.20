Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792739562;
	b=wm5LEylJvg9Mz5X8AXVd6rKSK9SSxhK4FUA/JzbVZvMhrqWfOKNJo1dQybJogsLUzR42
	 6vwjAr8HBslV5XLCPSDulaFTPdK1DxcpGI6TdN1KA1kqz9eqyevKKQuU9J+OjXR0qmAlw
	 q8rAzOFD5SJ+fYRTIVxioSjqJ9IX2CkpKfMEhOu/GQ04CXuITHfLZZeprC6O1bNRO4j0Y
	 DrOjd+17DxYLcxrTRrFkdieIYHIF1ayiwwS64a8RiVpj48XD/dTosrILg+1H4IhjgBwZR
	 Waxbjl665Yr/LC1G8CgkUPIX16RLTo3vZ+3I3JUICnEbp/JOg/vtdxh7a/y7Bf6uYmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792739562;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=IRNALFQZSBwWGLSG0LgFp22zZYAi9QFbOrJFYWu0POw=;
	b=KexYaHd1BcD1hONzP1m8MvC1h99HXjiML62SpjpV5XLZk/8AYwA+MBaCSJcAsthJO0t/
	 BrKrfUAek+yOgnTsYKM75FIDkWrOOpjvzrX49i9zloGs5qpoje8mz1LMXqgstLHEafCH0
	 qPtTT/5g0G3FjHT0s0mi8x3Sz/mmvj3RgbhDgO5MgN0b9JD5MUEkWvRw55KPIqaj02BDf
	 3uMLHTF6FNyCtu+fFtkOslYjMW3w31UDLme9cu9p1px0Yh8sofIvax5Sd/jSms8y7/AKN
	 OHJlE4lzFxoyyynxAMc8B1LfbWmPYI1rK1SsTz0e7AWHrx4f2IPY+d44PnEs/+doaBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=L0hqgQ+Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.10
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011010.outbound.protection.outlook.com [40.107.130.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5EA606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:12:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B5EA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=L0hqgQ+Z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aLiq9dm7EkWxuaG1yyQbQxXIxQrz3KyEIq1Mkk7fIMCZPOhYV/BP3opDQRLqfH1oA9Dd3xxd//aRhQrj/pNLdHOH8pc2FUsKXasHvQc7oZm+OoMGcMdqX2kjYPzqN3+DBTsQdCVEy5cAkkB+xy1NWaRHgXp51N/kqwiz0Qkrbvq+tEePHfzSbpN6wvnzZDVHyv+w9aTWacc//kn3JMM9ZBDrs41xQYFSHK1sT6ewB3773G6sihikhGnydqLHMUK2UzzUozFB8UUypk+kLQDH90NNWHTI6e7pGrn1/HZ8cbw17jYB4gOyxfrYC5y7WOC78ubkUpUqwXOwjmz1KXCgTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRNALFQZSBwWGLSG0LgFp22zZYAi9QFbOrJFYWu0POw=;
 b=p3rblq2WzmH8ZKsaWHxUvAijLjX9aVvxMLyvK9MOlP6AomfxBbw3zGMtOfRYVJ6EEd5PgCY7Wb1fD9tkUc68/q06DZPhbuYzzWbN8No7dild7qYqC1zTT44IT1R3tPyIFMsCUTGUwckk4jbvk64mifNB3PTlEP/95MM6w7v2pofSLe+CAdYAHQW+sW8cMz1Jl0fpZn8jfy0yjSrQTs+9r+NL2ILUulR5l51LuJizoWl+mJkhuxaU2ZEwceYrY9AzRO2Yl2WAC7wGVd2Ukyh56NddyAOvayDl3IWkXTNKoFsPg1CIAbZ8Ja0ie88EuiigRK62IXZCHPBfF5GMwDjdPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRNALFQZSBwWGLSG0LgFp22zZYAi9QFbOrJFYWu0POw=;
 b=L0hqgQ+Z3pBHJa6FULUvViE6cDZVwI7A9zWEzCGW8JaNfxXDPzBsivA7J59lv+8Mn97eOiWbhbW3cU+17gUsYI6ZSWWKcamC/6gtoLFjGfke/59A6jOHsaEXkySUVE24QWWBZ1uroSrdEQP5ysJ3BGQjTfOVNLgo9+EXULfy4ouJZAB3mHg1ktJ7us2DJofJfVHIfBM3ADf3jzKVAEj0dXdk2ShpcPe+nJaGfxcGNhrYB0NNGeo/POQdUSDPXCaRsID3BtIGWNxy7HUySMS+kkYUUIAMvVnXhQHRMAKjjmROcDpYgZH6CnejuC/8z4BQGvYVYIlGkp4Gz6YRSWcBZQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by AM8PR04MB7412.eurprd04.prod.outlook.com (2603:10a6:20b:1df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Fri, 23 Oct
 2026 07:12:38 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 07:12:38 +0000
From: shengjiu.wang@oss.nxp.com
To: p.zabel@pengutronix.de,
	krzk@kernel.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	broonie@kernel.org,
	alvin.sipraga@analog.com
Subject: [PATCH v4 1/2] reset: core: Serialize concurrent deassert/reset of shared resets
Date: Fri, 23 Oct 2026 15:16:08 +0800
Message-Id: <20261023071609.3795354-2-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023071609.3795354-1-shengjiu.wang@oss.nxp.com>
References: <20261023071609.3795354-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::17) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|AM8PR04MB7412:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b06ee97-335e-472b-0bfe-08df30d5055e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|23010399003|6133799003|18002099003|22082099003|10067099003|5023799004|11063799006|261009223027099003|261022075727099003|261021123027099003|261022105027099003|261021121427099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	aCCL4YllfO1ddXj/zhMaYr+/c6jo3LAMCYkBILUjC5dM0h+Aa4uzwpB771V7XEAaNQFE0cXMQDzX7c6m2dflQNz48q3c8JcnbQlhJTDHDaQDSEziB1UQwCWFhDVO4X7PVGATuLHLZwjMQuU58H1/XAgmaOQ/k8Jd9FzMNywyai/wtNsuHtt1xvdpLHz24092ocjdf2I02A2r8FZEdcJ+vABhch8cqIquBu/x+t6k+DIrw1bFGMn+dguT5ZG6GgvWzgEp1i7AWAbaN3RI8zND5C0Y7nxcsiCHp8gkVGapoOIiFF3tyhFBjsftOa/AJeu9MRB/nzky3XcB09r0350KQUeuz4PV9FHsNs9Ym5Wfy1lXiuby3wB4OiZ5P4ag1sW29sxYv7thMSASPHpPBNCQClPAdUeB7ZJIN9JzX0s97vWbL8XDuGPMU0SnMAJoOZzmw4IX5MfJ64wPPpefvjInbs33EbKUyZQb58J+rkFzreZ3l7+prXI3u40FRQGyqJvZDduwdDiB3QRNafEGJJFuJPnp0Eg8trk/pju6GxX57d6nh0Vvy97RLd34A5Jv58wkjJl09dx8F1IwMki3Zf0yyVoqySuUO6gKtTQiDrQcJiJH5P7JxjRNz+oyigAgX1O9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(10067099003)(5023799004)(11063799006)(261009223027099003)(261022075727099003)(261021123027099003)(261022105027099003)(261021121427099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vNoB73NGgPkf+2ijbJwtKPdXAOQMgj4CPBpqHaRhJhsEV5hpP0CxZGA44sSQ?=
 =?us-ascii?Q?vngi9Zy36TAXUOLL/yt2tBOPlAurhqUIKzWiYSwSSRdCRikLrzUUWsFbQsGy?=
 =?us-ascii?Q?ppXHT/NQAxtv3dAkENOk5azsn+kXx24fz5+ZuSTDWq6TOpQWfkYSAs+uYZiE?=
 =?us-ascii?Q?wsWGOQDR7Bi2AS3OxXapFA03tv27lNUZWFFX7zLeG/rTc6sQKrJ+aa2LrV+X?=
 =?us-ascii?Q?K4Ss28G/NnaHr7mvZWVOCgLcDPpl0eTu6AVDqjAWOFY508Y93maBmG8mA5q7?=
 =?us-ascii?Q?jnH1A0RY9qETp0n9Fk4TdBD94jTJnMCl1+DNx1o4kJ7rRSo01QbgZgAj1+mA?=
 =?us-ascii?Q?ZI/q6igC21TNdOHr1Rp7BkIUAgVmY4m0dzUuZnG2KTipXlZ5NWhOfaq4dYC4?=
 =?us-ascii?Q?aF7+tB1fYSxkw0Q2o0RuWn90QsiYVMg2FggJ7pk5bTSr5vnjx97WdzEa7J2X?=
 =?us-ascii?Q?SzU/6O9SnKHlfgTs0Wzvp8ZFmoCTReA5s4/CtweMc8Iwn5pdEkyWivTSWTOp?=
 =?us-ascii?Q?ihxHdh3HK5XTJk+QZVG/TFychoIMruFo87wVJ2hAToko15qVW5oEPo8Q1gVG?=
 =?us-ascii?Q?a+rVBljz20UJ8RKmYZ8P8xTniBxloAXPSC0byL8/YjRFNz+loEoyg/XfyKRf?=
 =?us-ascii?Q?RxxZ6uBUhLjM2ftUZkMcZE32k/XCK8r2n3mUANC9NrwWskqlFU5Auq5apnBB?=
 =?us-ascii?Q?2WGYgsLxLEF6IsR0PHTOuznN9clZ3ph9+OBwpxzKQ17MQo52T98d7fRs3EKw?=
 =?us-ascii?Q?sUJjdfmjynUa7JImPFPbEatJQFUQnxgVeiB4CCdP0nfqVkldD4Ku4ClvzBou?=
 =?us-ascii?Q?b4PKlobbUW011hrRbVch0lXQvnHzlGs3JazpXRHHxkIMOx2fPEGtnlYwoiRq?=
 =?us-ascii?Q?gZpWycICxS8t/cHlZhyJRIzEgddcCajSrA0PDdI2Bq4EDoJ6KD9C+bsrwXQY?=
 =?us-ascii?Q?GFcL83KOWFmptnHWrv8tisxEA6nxbQbx/JN159KOGxTS7C4vTY9ReyAGPs3v?=
 =?us-ascii?Q?apPUzzZ8mNSVRz2O9xb3/Tv/IQCdhxNAbLZVmvKzYSInWZSimIjAbi2fXS5f?=
 =?us-ascii?Q?Qaz5uP/QsQ6rZj8H5woev10/FOkznFyfUt9OKY6DwQKlJMlHvKpyiDCj0O5+?=
 =?us-ascii?Q?EdZBIDkM4JKmEKAOgQBJwpBGbvQ6tqQu1bJbKT4nS9tJeXeyvcKHsSCrn5U0?=
 =?us-ascii?Q?OJM8ZcLh0WAeiJmJLrbxlWYca+ifcoeDykdX8jaTadGYi2oNZwuTWk1MBBJ3?=
 =?us-ascii?Q?yKW5RpIzwgIuka7vZAI6LM3f1OZFHIpBnV+OuR29goghlbIK2iIV3ThMbBtA?=
 =?us-ascii?Q?khPevTbstvIBOuGC3Rt3mIAmQkjjIf1tqXahY5sOfYCTRvaafQYPRiw/eYlo?=
 =?us-ascii?Q?i+egCWNkqaPrScZvsK61xCFMb68CnkrqDzOplVEx7Tn9rTtzd0R6y1ag1VcJ?=
 =?us-ascii?Q?SsyiRw0AN+ECuacWFpvritcL+IebMGeXGvthZMxxLiH81daGWSi0arfqMPJn?=
 =?us-ascii?Q?FSjq68SWxrkXJIImvQNUKr929prF0ntA3pu/pb3nNz6cbdOuoKFrq9R04Lz5?=
 =?us-ascii?Q?pbkhy6dTSHusgUJpPz469LtTyeM9705+sNHItLpUuNi8uRlZu36WGnV4nIU1?=
 =?us-ascii?Q?DcQOUdce5fv1EYeDkCWVCjPMpy+N7a8PPf6wGkPjzLkYkYJDjwc9PVaRD4AC?=
 =?us-ascii?Q?Vu628VeNvlcN+12ZCm5pfpShE1LDkA42yY1QGnij9vYMWQsCAJS01vff3dZK?=
 =?us-ascii?Q?u91tO08l1ytIVUF50gGjnq3E3ONFOiXLZYXIO55VZokkf1pPLUj7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b06ee97-335e-472b-0bfe-08df30d5055e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 07:12:38.8223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LMW9gnNICJ3EY0sIP8BpxeXv+x8EEYfJ+EyDyGnMgYW3yEaDolXJPGhCYuH7FlBMdMX4oLJuBlffShqAXZemsk1xwmFWRwXdTuLLpGs6U4ZYwj0nnyL6E/MTMOeYMbN3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7412

From: Shengjiu Wang <shengjiu.wang@nxp.com>

Add a reset_controller_dev::can_sleep flag that a provider sets when its
reset ops may sleep. When it is set, serialize the shared refcount update
and the hardware op in reset_control_reset(), reset_control_deassert() and
reset_control_assert() under a new per-control mutex, taken inside the SRCU
read-side critical section. Providers that leave the flag clear keep the
existing lockless path, so callers in atomic context are unaffected.

reset_control_deassert() and reset_control_reset() are documented to
guarantee that the reset line has been deasserted, respectively that a
reset pulse has been issued, by the time they return.

For a shared reset only the first caller runs the hardware op; the other
callers just bump the refcount and return. When the op can sleep this
breaks the guarantee: a second caller can observe the bumped refcount and
return before the first caller's op has finished, and then touch hardware
that is still in reset. A reset_control_assert() racing a concurrent
reset_control_deassert() can likewise interleave the two sleeping ops and
leave the line asserted while the refcount says it is deasserted.

Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Link: https://lore.kernel.org/all/aszDZlJ0KahNwgZO@analog.com/
---
 drivers/reset/core.c             | 205 ++++++++++++++++++++-----------
 include/linux/reset-controller.h |   4 +
 2 files changed, 138 insertions(+), 71 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 38e189d04d09..7eb4575413d6 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -52,6 +52,9 @@ static DEFINE_IDA(reset_gpio_ida);
  *                   only used for shared resets, which means that the value
  *                   will be either 0 or 1.
  * @lock: serializes the internals of reset_control_acquire()
+ * @shared_lock: serializes the shared refcount update and the hardware op for
+ *               controllers whose ops may sleep (rcdev->can_sleep); taken only
+ *               inside the SRCU read-side critical section
  */
 struct reset_control {
 	struct reset_controller_dev __rcu *rcdev;
@@ -65,6 +68,8 @@ struct reset_control {
 	atomic_t deassert_count;
 	atomic_t triggered_count;
 	struct mutex lock;
+	/* serializes the shared refcount update with its hardware op */
+	struct mutex shared_lock;
 };
 
 /**
@@ -355,6 +360,32 @@ static inline bool reset_control_is_array(struct reset_control *rstc)
 	return rstc->array;
 }
 
+static int __reset_control_reset(struct reset_control *rstc,
+				 struct reset_controller_dev *rcdev)
+{
+	int ret;
+
+	if (!rcdev->ops->reset)
+		return -ENOTSUPP;
+
+	if (rstc->shared) {
+		if (WARN_ON(atomic_read(&rstc->deassert_count) != 0))
+			return -EINVAL;
+
+		if (atomic_inc_return(&rstc->triggered_count) != 1)
+			return 0;
+	} else {
+		if (!rstc->acquired)
+			return -EPERM;
+	}
+
+	ret = rcdev->ops->reset(rcdev, rstc->id);
+	if (rstc->shared && ret)
+		atomic_dec(&rstc->triggered_count);
+
+	return ret;
+}
+
 /**
  * reset_control_reset - reset the controlled device
  * @rstc: reset controller
@@ -362,6 +393,10 @@ static inline bool reset_control_is_array(struct reset_control *rstc)
  * On a shared reset line the actual reset pulse is only triggered once for the
  * lifetime of the reset_control instance: for all but the first caller this is
  * a no-op.
+ *
+ * After calling this function, the reset line is guaranteed to have seen a
+ * reset pulse at any point in the past, not necessarily during the function
+ * call.
  * Consumers must not use reset_control_(de)assert on shared reset lines when
  * reset_control_reset has been used.
  *
@@ -371,7 +406,6 @@ static inline bool reset_control_is_array(struct reset_control *rstc)
 int reset_control_reset(struct reset_control *rstc)
 {
 	struct reset_controller_dev *rcdev;
-	int ret;
 
 	if (!rstc)
 		return 0;
@@ -388,25 +422,18 @@ int reset_control_reset(struct reset_control *rstc)
 	if (!rcdev)
 		return -ENODEV;
 
-	if (!rcdev->ops->reset)
-		return -ENOTSUPP;
-
-	if (rstc->shared) {
-		if (WARN_ON(atomic_read(&rstc->deassert_count) != 0))
-			return -EINVAL;
-
-		if (atomic_inc_return(&rstc->triggered_count) != 1)
-			return 0;
-	} else {
-		if (!rstc->acquired)
-			return -EPERM;
+	/*
+	 * For a shared reset only the first caller runs the hardware op while
+	 * concurrent callers bump the refcount and return. If the op may sleep
+	 * (rcdev->can_sleep), serialize the refcount update and the op so a
+	 * concurrent caller cannot return before the op has finished.
+	 */
+	if (rstc->shared && rcdev->can_sleep) {
+		guard(mutex)(&rstc->shared_lock);
+		return __reset_control_reset(rstc, rcdev);
 	}
 
-	ret = rcdev->ops->reset(rcdev, rstc->id);
-	if (rstc->shared && ret)
-		atomic_dec(&rstc->triggered_count);
-
-	return ret;
+	return __reset_control_reset(rstc, rcdev);
 }
 EXPORT_SYMBOL_GPL(reset_control_reset);
 
@@ -474,6 +501,44 @@ int reset_control_rearm(struct reset_control *rstc)
 }
 EXPORT_SYMBOL_GPL(reset_control_rearm);
 
+static int __reset_control_assert(struct reset_control *rstc,
+				  struct reset_controller_dev *rcdev)
+{
+	if (rstc->shared) {
+		if (WARN_ON(atomic_read(&rstc->triggered_count) != 0))
+			return -EINVAL;
+
+		if (WARN_ON(atomic_read(&rstc->deassert_count) == 0))
+			return -EINVAL;
+
+		if (atomic_dec_return(&rstc->deassert_count) != 0)
+			return 0;
+
+		/*
+		 * Shared reset controls allow the reset line to be in any state
+		 * after this call, so doing nothing is a valid option.
+		 */
+		if (!rcdev->ops->assert)
+			return 0;
+	} else {
+		/*
+		 * If the reset controller does not implement .assert(), there
+		 * is no way to guarantee that the reset line is asserted after
+		 * this call.
+		 */
+		if (!rcdev->ops->assert)
+			return -ENOTSUPP;
+
+		if (!rstc->acquired) {
+			WARN(1, "reset %s (ID: %u) is not acquired\n",
+			     rcdev_name(rcdev), rstc->id);
+			return -EPERM;
+		}
+	}
+
+	return rcdev->ops->assert(rcdev, rstc->id);
+}
+
 /**
  * reset_control_assert - asserts the reset line
  * @rstc: reset controller
@@ -509,39 +574,18 @@ int reset_control_assert(struct reset_control *rstc)
 	if (!rcdev)
 		return -ENODEV;
 
-	if (rstc->shared) {
-		if (WARN_ON(atomic_read(&rstc->triggered_count) != 0))
-			return -EINVAL;
-
-		if (WARN_ON(atomic_read(&rstc->deassert_count) == 0))
-			return -EINVAL;
-
-		if (atomic_dec_return(&rstc->deassert_count) != 0)
-			return 0;
-
-		/*
-		 * Shared reset controls allow the reset line to be in any state
-		 * after this call, so doing nothing is a valid option.
-		 */
-		if (!rcdev->ops->assert)
-			return 0;
-	} else {
-		/*
-		 * If the reset controller does not implement .assert(), there
-		 * is no way to guarantee that the reset line is asserted after
-		 * this call.
-		 */
-		if (!rcdev->ops->assert)
-			return -ENOTSUPP;
-
-		if (!rstc->acquired) {
-			WARN(1, "reset %s (ID: %u) is not acquired\n",
-			     rcdev_name(rcdev), rstc->id);
-			return -EPERM;
-		}
+	/*
+	 * For a shared reset the last caller runs the hardware op while the
+	 * other callers just drop the refcount and return. If the op may sleep
+	 * (rcdev->can_sleep), serialize the refcount update and the op against
+	 * a concurrent reset_control_deassert() so the two cannot interleave.
+	 */
+	if (rstc->shared && rcdev->can_sleep) {
+		guard(mutex)(&rstc->shared_lock);
+		return __reset_control_assert(rstc, rcdev);
 	}
 
-	return rcdev->ops->assert(rcdev, rstc->id);
+	return __reset_control_assert(rstc, rcdev);
 }
 EXPORT_SYMBOL_GPL(reset_control_assert);
 
@@ -575,6 +619,36 @@ int reset_control_bulk_assert(int num_rstcs,
 }
 EXPORT_SYMBOL_GPL(reset_control_bulk_assert);
 
+static int __reset_control_deassert(struct reset_control *rstc,
+				    struct reset_controller_dev *rcdev)
+{
+	if (rstc->shared) {
+		if (WARN_ON(atomic_read(&rstc->triggered_count) != 0))
+			return -EINVAL;
+
+		if (atomic_inc_return(&rstc->deassert_count) != 1)
+			return 0;
+	} else {
+		if (!rstc->acquired) {
+			WARN(1, "reset %s (ID: %u) is not acquired\n",
+			     rcdev_name(rcdev), rstc->id);
+			return -EPERM;
+		}
+	}
+
+	/*
+	 * If the reset controller does not implement .deassert(), we assume
+	 * that it handles self-deasserting reset lines via .reset(). In that
+	 * case, the reset lines are deasserted by default. If that is not the
+	 * case, the reset controller driver should implement .deassert() and
+	 * return -ENOTSUPP.
+	 */
+	if (!rcdev->ops->deassert)
+		return 0;
+
+	return rcdev->ops->deassert(rcdev, rstc->id);
+}
+
 /**
  * reset_control_deassert - deasserts the reset line
  * @rstc: reset controller
@@ -605,31 +679,18 @@ int reset_control_deassert(struct reset_control *rstc)
 	if (!rcdev)
 		return -ENODEV;
 
-	if (rstc->shared) {
-		if (WARN_ON(atomic_read(&rstc->triggered_count) != 0))
-			return -EINVAL;
-
-		if (atomic_inc_return(&rstc->deassert_count) != 1)
-			return 0;
-	} else {
-		if (!rstc->acquired) {
-			WARN(1, "reset %s (ID: %u) is not acquired\n",
-			     rcdev_name(rcdev), rstc->id);
-			return -EPERM;
-		}
-	}
-
 	/*
-	 * If the reset controller does not implement .deassert(), we assume
-	 * that it handles self-deasserting reset lines via .reset(). In that
-	 * case, the reset lines are deasserted by default. If that is not the
-	 * case, the reset controller driver should implement .deassert() and
-	 * return -ENOTSUPP.
+	 * For a shared reset only the first caller runs the hardware op while
+	 * concurrent callers bump the refcount and return. If the op may sleep
+	 * (rcdev->can_sleep), serialize the refcount update and the op so a
+	 * concurrent caller cannot return before the op has finished.
 	 */
-	if (!rcdev->ops->deassert)
-		return 0;
+	if (rstc->shared && rcdev->can_sleep) {
+		guard(mutex)(&rstc->shared_lock);
+		return __reset_control_deassert(rstc, rcdev);
+	}
 
-	return rcdev->ops->deassert(rcdev, rstc->id);
+	return __reset_control_deassert(rstc, rcdev);
 }
 EXPORT_SYMBOL_GPL(reset_control_deassert);
 
@@ -879,6 +940,7 @@ __reset_control_get_internal(struct reset_controller_dev *rcdev,
 	rstc->id = index;
 	kref_init(&rstc->refcnt);
 	mutex_init(&rstc->lock);
+	mutex_init(&rstc->shared_lock);
 	rstc->acquired = acquired;
 	rstc->shared = shared;
 	get_device(rcdev->dev);
@@ -901,6 +963,7 @@ static void __reset_control_release(struct kref *kref)
 	}
 
 	mutex_destroy(&rstc->lock);
+	mutex_destroy(&rstc->shared_lock);
 }
 
 static void reset_control_put_internal(struct reset_control *rstc)
diff --git a/include/linux/reset-controller.h b/include/linux/reset-controller.h
index 52a5a4e81f18..587fb57c2c52 100644
--- a/include/linux/reset-controller.h
+++ b/include/linux/reset-controller.h
@@ -47,6 +47,9 @@ struct of_phandle_args;
  *                id as given to the reset control ops, defaults to
  *                :c:func:`fwnode_reset_simple_xlate`
  * @nr_resets: number of reset controls in this reset controller device
+ * @can_sleep: set by the provider if its reset ops may sleep; makes the core
+ *             serialize the shared reset, assert and deassert paths under a
+ *             mutex
  * @lock: protects the reset control list from concurrent access
  */
 struct reset_controller_dev {
@@ -64,6 +67,7 @@ struct reset_controller_dev {
 	int (*fwnode_xlate)(struct reset_controller_dev *rcdev,
 			    const struct fwnode_reference_args *reset_spec);
 	unsigned int nr_resets;
+	bool can_sleep;
 	struct mutex lock;
 };
 
-- 
2.34.1

