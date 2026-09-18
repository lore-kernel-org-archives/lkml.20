Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010021.outbound.protection.outlook.com [52.101.84.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746254DE72D;
	Fri, 18 Sep 2026 14:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741270; cv=fail; b=FoUbrkS/7DZUS2jMhBCfUmkXFPEsNrsI+8wIEvYBt5CNyTXGHvYqkQg37Tg8vfpMruNEEMCLTBG1y9VnWnZTFU3NbaDWh8wt+9kA08X8DvleHBEOwUX7smmtmHVScgW/+Sop30PWdy1Wmopbub6jb0+pJX60IluYhRiuv7tROK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741270; c=relaxed/simple;
	bh=6fnsbXIsnlntJV9ex6i37PemSqrV2GcQU8jNutzfIW8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TBM2g8CeWMTCOg2vCFbXilPAxWClM9+mKfK+4vIioPCUD/DqEg4WiFTuIoC7we03yfXq5bhIA2gwwvwFpkFbYvqGcjQWrPrDy389C1BpcMRveFN8g04m3cUEiVDOugMJ8oDdKcMJX0h/JksAlS1HbciusNQp2dLcs99Vmrm0m+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=D34+Z1UU; arc=fail smtp.client-ip=52.101.84.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="D34+Z1UU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Id/9usXDjRMOa31yMGSVSUvPYOoY8W8mP5pef9KYs5b4KJvSHl1cgk2CvqD0JQzPqGFVIq0fofuhx1Sez9kTHcYBlcEiyFnmikWqjk6BvTTv58WYgHa66A6JqevWBspKBRdDbL67gXuRf0n5JYpsAMu4wBnynYaLYIaryDvDnYOLp+4WVgevARzq/o6wktCZrtNtFIeV7pZfaor6mGZjndu7cPttdhZ8qaHsdG7ErRh/wZUgeswD7OsyjpeX7F+GgopwvgeJJ1K89rjo4tqMu0dVzBvEfAY15zd9H/pLoHSYjvHU4ZJI+u8AaLL+M3oz1IPFEcW1XBSy466dCSaovA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3AX102tRQ9Pdii26PIkDP8Hlt0eNur5DxVd0un9AL4=;
 b=IkBhYrjOrL1lgxpU2XGFZujbzTulib/4Z22c5lsoADRKDjl8uFCyc3/tO0nMwQRDResL+1eNknepLDCzwd9Iw7mcIITs6VDaZx5VAr/xOXZZ9/iYN8EWSo80/VQeUmrXIReWn5NkgqpasI8KrWqpHsm6MVzjodbk+APMttTUqKa+J86Fujh8Hcut1SGq6NYRredE9fPn32+DOiYHRbvvKEUSi/Nq9i97YnQiPnDnJWUlG0E0F8cfLGP2neDzGyK/Ms3lJ4f82m8qA4h/tQlHzkHwmzT28v7TwL+lIz095m+i9jdsNcnwNArP9ZOIDsPv8vvKwlOylSIaYVKsR5Egag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3AX102tRQ9Pdii26PIkDP8Hlt0eNur5DxVd0un9AL4=;
 b=D34+Z1UUmh7OTJb5HbWMrVFZiZEd4KYk7yaEW15GEyz/aMKKFmGxXs57D4k+fj7o9sjdTAqccOfq6O7cvV/L2Z4v7gtySZdcBb/s1ac4W+ORkLCfDVPC0CfZ7y6CILMixFi9qgyYrI6ot/0Sgf0crknEat4voAuY/e1xZxXRpkouvUTG/MYnyQ7pZIbmXZkI+QhDaLK+6FXLeofVPPVpbXNerdmj/ne99XsZ3dHRab2wF92GQdPgeXzFWPnkVgPoBm+W7kAltMT/b6ZzpoaY8F8TCGMcAYY4E1WMTkTn4AtP7jEC15f/NoOnx6vxwCt1KJP89Bv9wIs/w7C0uVLY/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GVXPR04MB10069.eurprd04.prod.outlook.com (2603:10a6:150:121::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 14:21:02 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 14:21:01 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] soc: qcom: use assign_bit() where applicable
Date: Fri, 18 Sep 2026 22:18:32 +0800
Message-ID: <20260918141833.3023124-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::18) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GVXPR04MB10069:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b61a1c8-69fb-4f1f-8fe9-08df159010dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|376014|1800799024|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	ixLIYr05gOWPQpyl3h0AMrGmq2KiTw9exei5WSWW4dZ11wVAeEHeuFp7DB/MpQNY0xoOeK3RRRx/Cl8DAI3gMMD/sly3ffjKZB06aU9/k+DfpUoE9RTZSNQgzc6kl4KXg95v/1Q9mqL+A9m+q85rRmu5ckOc3xcRZVWu64ClLhFbZju0i28yW+Epw5et2noTpZflXUOrsZWV0xdZJjJTTT2VARAKbB2T0E+4R/fM4nb+J7HV5wCh8TGQsfmZxGNknWLd3Kew1d2YU1d4w8vtW5XoGuhfSiSQy0myC0K1BN4Rg86bRHZMw/bScyCw0Mx1yeebfy5kgjK2JWrBgJxHDvfhcctmF0OXWfFkf/ZX8O8Lrrzn93ve+5+sw/GKEiTZ6HKsPnCG5k6Ll5tM09114JdokisX2SRO2AEPLAijPAM6rRVU2iYUkdRwomlCinXB70HjyPQKaIB0KOldmF+KVmfEVUFscGBGoFAsW/31C06OF+MWn6w63Hh1CNMAZCpnU8kYr3hpdvFVSJvk4X8kCWzv7SPEPxcbfT+6nIc13pqrmgK+WIlOmbSJPMbHR76tjTbo58JOa/qZf0BbexdqyPi7gBdfVRVhjW5Noyn5t7qrH9yAHQKus0L2uq2wAb1ercoSDiowVMwC4E4d4x8qk6Qw+lYvabXfgTrNMHcZtRY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(376014)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yRW6Dfz3Wdaa5BKaxnbMkPKyv8gmxoRY7YAbEwRT/3M9oku2vCM+3XC7Oncr?=
 =?us-ascii?Q?382GD73A7H3AM+URrfvth7J0q4wyPXhs0hYLiGtCvro/tVuaZN2DEjUOhwkd?=
 =?us-ascii?Q?cqQsCydVm5+zF6DsehI8H6TKDWgP8/58/K3PWBJFat9IWQK12Sih+VPcIZYP?=
 =?us-ascii?Q?n/NCs66Xq8hMMOGSCW5GAAlUXfrXBwFL7q/6M4+shO8Hu0BgNmMm1zQsXmjj?=
 =?us-ascii?Q?TMHtFoh6Ra+qfNoQFF1B0TSIf48iZSXKcFzfM0dkzDLYVw26PYeinEd7690n?=
 =?us-ascii?Q?VuYNG0VZ7rv/pwGML4kIQ18FjMS04pWEfagwprD/YfJ9RHIawpnAK78PlwHM?=
 =?us-ascii?Q?Qmztm5bWZrNYm6GE6di7xJElnOzn2RT4NHKl+/6JWAP8xVHC8FqB1I7T+XQ/?=
 =?us-ascii?Q?GxjalLvGuXldE5nBi9KhME0PuWPIvpmb42In/kwPf0Z6FJiLkG5DmAVIhWeM?=
 =?us-ascii?Q?dzGuHcPAMCPXmxVc/LjqsR2NEpySyp06VvBl8GIeLsP4D7kATekrPqoGK2wK?=
 =?us-ascii?Q?4Fhj0i5BNmIqelqbwPtl6WblPHmb5C2lylQ0w5EpAD80FEOKTEruNlr0J2q7?=
 =?us-ascii?Q?DDAiahUY1nMd3Dxtr/4jk2JaUasfVAZCTMXDhe9XWr06493rM9dlvn8G0g0U?=
 =?us-ascii?Q?JuDuN4HMwMyXrfyT+DwYEPVNwMESjSucDB0WZEINCtycHRN9LfVqMl+PW9UA?=
 =?us-ascii?Q?HVTa754ez7dCd8iaYeUj0Q7T2NcxAZeQOvNa+qLghUNIVesNPBaSWdQRDXML?=
 =?us-ascii?Q?TNirTHvYsBe50BhQzYyi4qzXcOPs6UyMn1Vgqep7U+7lEgyiQwvyoIw5iQEs?=
 =?us-ascii?Q?L6JQyMZkORneumG+8LcZ67p70EsTqIGJgiqPogTSpftBQdQuWyYDtmRDfFX6?=
 =?us-ascii?Q?DrsBqwTbw1EaZM9tGaDHRN8mns/f6aZ5pVna4gYdm3hY/i8mG/VbKoXFy0U/?=
 =?us-ascii?Q?QdHF7jQbj35Gx+a/18GZ8HJD8T63qIlwpFp4flxDthh0Q8lY+DRbGdW6OSt5?=
 =?us-ascii?Q?xm27AgAn5AG6bDkB+WIkl0D3vh3T7XkntRRPqSVWslDGRMzRI/Yx3q2GbgEL?=
 =?us-ascii?Q?Jd12nCTbKqpnZDpr7Mjqrx/AtwMPtH4JUJ0XmnfFt63kal0mevhSoice7pDL?=
 =?us-ascii?Q?39zoV4Uw9crW9YmhF6GD+iPwIfPFtZbq5RrESMlFPtq5qRVV/MFOhQsktmZ2?=
 =?us-ascii?Q?agXxZx4U7uhoCl0VYCTWewghwtyhSteMFhLZDMt3BLy5+ChB8m8+rohtJayO?=
 =?us-ascii?Q?S+Zsdj23NOU/F3EigCTwzi+mgR5uHMKZAveYvm2cF48rCkkiGYjRY2F7FNLK?=
 =?us-ascii?Q?depQftP9B9Q1jUCFAe9Y3Oo5o9DtaIHcR694K8wLdCVSxwWK5dDozY18oDY7?=
 =?us-ascii?Q?PcBywQlUMGr0pfTQZGPyQUP1Soh69+ywCKWrfS9d9dQYqBcgCBw6p2Ji8Eqj?=
 =?us-ascii?Q?JX1N0UtTyy7ATCx7bs78RaowSvlf7/oTJ8GG7IxMMz3jIPgfE95O1O5xXfrA?=
 =?us-ascii?Q?4Xw+KIJrKJCv8KkvvUecMlsD0d+p1rWdOpSI1tL1GddyO65JZ6yjznBkWKCw?=
 =?us-ascii?Q?CeBga874yGTNGYCOhVIieW8NU5e7NnaSTy4jkkSXa87oUT+7EuHKejoABZkQ?=
 =?us-ascii?Q?M35eZrGyPX0E6UA9Nbkv6J8wyUrvrfelyCbwIhifFFHL9NvNzkmZXxefTDmT?=
 =?us-ascii?Q?DsKOjWgPLk/xFzlTVVDcHp3FsBkP27FrOT/5/0faNm8ma6NwjDeM2tBUQdSK?=
 =?us-ascii?Q?V0qHKQEL7DP+DcqDuKGiYI0vezpcooq+3hrvS4OyiV9S2BgyIPKG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b61a1c8-69fb-4f1f-8fe9-08df159010dd
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 14:21:01.3127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3hBXi1nrCwwGG/6lJ3uMneWm5PVZnMG0VP7cL8wWafZcWut9Z7K8XpdsWGKmEcAGmMS9PXV86Od9MsGCJW9rjELdPJ+kIwbrsxPzUKQa0UQz4JFZXQ/q7/cbTYZs8so
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10069

From: Peng Fan <peng.fan@nxp.com>

Convert open-coded if/else with set_bit/clear_bit and their
non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
API.

Done with Coccinelle semantic patch:
    // set_bit -> clear_bit => assign_bit

    @@
    expression cond, bit, addr;
    @@

    -if (cond)
    -        set_bit(bit, addr);
    -else
    -        clear_bit(bit, addr);
    +assign_bit(bit, addr, cond);

    // clear_bit -> set_bit => assign_bit

    @@
    expression cond, bit, addr;
    @@

    -if (cond)
    -        clear_bit(bit, addr);
    -else
    -        set_bit(bit, addr);
    +assign_bit(bit, addr, !cond);

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/soc/qcom/smp2p.c | 10 ++--------
 drivers/soc/qcom/smsm.c  | 16 ++++------------
 2 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
index 3104e31f91c9..01b8580c9f27 100644
--- a/drivers/soc/qcom/smp2p.c
+++ b/drivers/soc/qcom/smp2p.c
@@ -411,15 +411,9 @@ static int smp2p_set_irq_type(struct irq_data *irqd, unsigned int type)
 	if (!(type & IRQ_TYPE_EDGE_BOTH))
 		return -EINVAL;
 
-	if (type & IRQ_TYPE_EDGE_RISING)
-		set_bit(irq, entry->irq_rising);
-	else
-		clear_bit(irq, entry->irq_rising);
+	assign_bit(irq, entry->irq_rising, type & IRQ_TYPE_EDGE_RISING);
 
-	if (type & IRQ_TYPE_EDGE_FALLING)
-		set_bit(irq, entry->irq_falling);
-	else
-		clear_bit(irq, entry->irq_falling);
+	assign_bit(irq, entry->irq_falling, type & IRQ_TYPE_EDGE_FALLING);
 
 	return 0;
 }
diff --git a/drivers/soc/qcom/smsm.c b/drivers/soc/qcom/smsm.c
index ac3c85a2597a..bb487bf6bf03 100644
--- a/drivers/soc/qcom/smsm.c
+++ b/drivers/soc/qcom/smsm.c
@@ -277,10 +277,8 @@ static void smsm_unmask_irq(struct irq_data *irqd)
 	u32 val;
 
 	/* Make sure our last cached state is up-to-date */
-	if (readl(entry->remote_state) & BIT(irq))
-		set_bit(irq, &entry->last_value);
-	else
-		clear_bit(irq, &entry->last_value);
+	assign_bit(irq, &entry->last_value,
+		   readl(entry->remote_state) & BIT(irq));
 
 	set_bit(irq, entry->irq_enabled);
 
@@ -304,15 +302,9 @@ static int smsm_set_irq_type(struct irq_data *irqd, unsigned int type)
 	if (!(type & IRQ_TYPE_EDGE_BOTH))
 		return -EINVAL;
 
-	if (type & IRQ_TYPE_EDGE_RISING)
-		set_bit(irq, entry->irq_rising);
-	else
-		clear_bit(irq, entry->irq_rising);
+	assign_bit(irq, entry->irq_rising, type & IRQ_TYPE_EDGE_RISING);
 
-	if (type & IRQ_TYPE_EDGE_FALLING)
-		set_bit(irq, entry->irq_falling);
-	else
-		clear_bit(irq, entry->irq_falling);
+	assign_bit(irq, entry->irq_falling, type & IRQ_TYPE_EDGE_FALLING);
 
 	return 0;
 }
-- 
2.51.0

