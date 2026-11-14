Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794681038;
	b=giDBntFJNamnSXOxhbFNIOZlONTCys5OMzwhAZ583hJWxWtygWyT+/p/S8Q/arLm0OCe
	 Zlq0fdA6ep9LYgjRsmvVjvcWpO3pZa0oQv17LdcjmvD9DyJEc/QodTQs+YfGxjoV0KmDl
	 tjf8vjAc+KB4wfiA1J1tVipmkNa1neJNrNyJufFCbdnF4Uhcu3Rpkpda+HC0+iKQ+lGfO
	 GoqQAMdWw0rgoyJXubQEBcjP0W0a64f28ju+qQgEf3ZYZBM4s8IWjvNBMrytwhs53aNRC
	 TDy4NAOgVQyZlrWcNYqIdF4TrkpmROLz8gpreepEroQlYCyi3uwLS4Xy6vQN4BLZqkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794681038;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=wcBIFLC+j0u0R3L+ChvCJO2e9RUeydCJGVhQySv/Yd8=;
	b=RAWGpro0DDfRZo4FQlAGHxUZop5OfifwnRGFq5XoEz2TWfSsuUxRtkDRvhohGIGKdSfL
	 j3fWzte8WbnSASOC0YjsaSXTYH+aehOYpQkLx0nmfgIfwgIjApYya0ck1IdezSHyPdBKi
	 uABSAXDHnSY8zSlonl1wlZ6IdhVWruH4SfjhTiqPFNWlKNoCQ0Be3VKPV3oYnnfPBvn2Z
	 lZ7rmRjmmXyqpA061tBYQv2APq3iyu1vv5CTfy2XgK9uSIKT+6hzmeTMBmfjtyBbtYfcS
	 GuIWzChliUO4Qq2RnxcjaLDj73IyaKDVRyKQhK57WQwP6UC4MTYDMClk/jsbw8vXn9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=aESrtdBH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.15
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013015.outbound.protection.outlook.com [40.93.196.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C49606A337;
	Sat, 14 Nov 2026 18:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92C49606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=aESrtdBH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ox8J6Xfx/iNiu8M17niLpR7wl8De6GjEBGQ4C1VtK8pogrjUPRi3L8o5bio7zwysMtA68P4JF/3l+sqZKUZ/vFKtAb88UYXlafJlObcg4P8nt2NTxRSHx+Is0t7GV4SswEdHqOUX+2eFk67a1+vQhybhrSVg8TMZoTJholkxAmr9UqeG3wxy05DD/+Pw/SEYo5x3bjJWBiHirZHrxv7QkR+lxp3ICbPeEPdsOyZLvZ+P2sBj4AG9Gpm9WOrkGyOn3aYnIxHRg+zdVQmObx7psZXowQwYSfIKGiWMmqZ9v9D3tigNJTjux+l0t9e4OWFHPPgg9Mn0tuWcqbECmZZotA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcBIFLC+j0u0R3L+ChvCJO2e9RUeydCJGVhQySv/Yd8=;
 b=nilO/XRqjpNNPWokocJ4cUQJheWkTOBIeuDHHVy8OAUnpz90cH7spd/wAhrqOgegegmRLrFATPXFNas3eH0PJIZe4P2hr8lA4B67+X0on9oNPmxLFdPw+Fsen1hGr2VgH7K2v4GT5o0WLJHmGyCypVnVfAh8H2RNz5asKMrSP9ClxS2ohvr1azLLDDjkAgriMBpfaf2If/86W9//SGAFbdoGJaTFU0puU0tfBTUpzsj4FBsA0eWFy+734eLBVGBKnyFl245WFmBbal5QJsTU2puEIe7QdndyGqCVFKu3h4VZD+jWadTctF4e6MnmhKLxOpm6z2AY4Ct4HxzG/tQTzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcBIFLC+j0u0R3L+ChvCJO2e9RUeydCJGVhQySv/Yd8=;
 b=aESrtdBHXPIwmEq53jd1aseYLa2igAiiMwfhdFKCFmOwRFoRTgM/XHRwdiH5o0Rokwy2NZq5o9LkLDKCRtc9GcgXeGhtR/Ipy8cwfA2Mp+O6TQYPf6HVceu//2fGpL88f1ymsFmhDkXRskclrfhRYuw+cU1IuDXv93wIuN9+TWo=
Received: from SJ0PR03CA0081.namprd03.prod.outlook.com (2603:10b6:a03:331::26)
 by SA3PR12MB9226.namprd12.prod.outlook.com (2603:10b6:806:396::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Sat, 14 Nov
 2026 18:30:29 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:a03:331:cafe::a2) by SJ0PR03CA0081.outlook.office365.com
 (2603:10b6:a03:331::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Sat,
 14 Nov 2026 18:30:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 14 Nov 2026 18:30:28 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 14 Nov
 2026 12:30:24 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 14 Nov
 2026 12:30:23 -0600
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sat, 14 Nov 2026 12:30:20 -0600
From: Suraj Gupta <suraj.gupta2@amd.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Michal Simek <michal.simek@amd.com>, Russell King <linux@armlinux.org.uk>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH net-next v5 6/6] net: xilinx: axienet: Add statistics support for XXV ethernet
Date: Sat, 14 Nov 2026 23:59:47 +0530
Message-ID: <20261114182947.2908628-7-suraj.gupta2@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261114182947.2908628-1-suraj.gupta2@amd.com>
References: <20261114182947.2908628-1-suraj.gupta2@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|SA3PR12MB9226:EE_
X-MS-Office365-Filtering-Correlation-Id: 535f1584-fe85-454a-f118-08df427d5b99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|82310400026|1800799024|10067099003|11063799006|5023799004|56012099006|261022115727099003|261021135927099003|261021121427099003|261021133027099003|261028144727099003|261026121527099003|261021123027099003|261022113327099003|261026140227099003|261022105027099003|261009223027099003|261026135527099003|261026130827099003|261022075727099003|261102123227099003|261021130227099003|22082099003|18002099003|10063799003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	BtL3Pcx5JUBplbT1wCLjBp2sleQTX+1mdmi1DMhDsPFrq/RFhq5fWo7G+gjmST4kQlALoKr5Rz5lL0PdzyJZhrz+or/d09delGsErhocZXUVF4PZae3p9CDgGXw0+8NMb9ZE3jqPm41pr3Qyo9EWEGxWk1zQ6JmwBpQHZQkskPodG+tltpgYbw8mLoQ60gw5z973hCnJSTxqwdtBwKiB9H8Jt2ZRkGJTWZYV8464nIW0i5O/8/ZeeFlL4qyo0HcY9F4myRXLq0ZAzlMFG/ymMEt8aXRHN6gCWigALWbIhoGKaDH3DTBPkPaFQ8NE0aBVfOhIKBikSNlPuO09MPquTF1sLUyFuxwSkjX6Qlp7HiixRS6gcIOFJF2miQqI2oxEzMLcCbf5wMvXw2RjnIZms7soVyqDCzHCw1nRO6GvVJ9C2s2klLelv/tHh/qLQTrS3VW6DqSAmiM/1sQXL5fWhu8ST3HsdnNxHQQELb6vEmA31NV85O7Ik4ZMuJmlcECSXrCrUEmh4Fclf9NerkivyPDe7vU29axNt5XAAqgOdDqJRQMv8rke1NE+ugjXpPupNE7+wGOjnm8YbiLXgKkijww+xgoeZU5rSaTKyJmETKvaftK6ApjRjj8qx0KPRY1tpYk6E9ANfejdTA+ZmiknzM93P5xEUWB5Rhaq4qtwjapS4L4mHPasZvyN/2qop72cXyarDAsHyT/Jinz2wrCxjw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(82310400026)(1800799024)(10067099003)(11063799006)(5023799004)(56012099006)(261022115727099003)(261021135927099003)(261021121427099003)(261021133027099003)(261028144727099003)(261026121527099003)(261021123027099003)(261022113327099003)(261026140227099003)(261022105027099003)(261009223027099003)(261026135527099003)(261026130827099003)(261022075727099003)(261102123227099003)(261021130227099003)(22082099003)(18002099003)(10063799003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	x5u4JvRL4L/EfkrYKBL0g3+vdfD6Hg1MxzcBTZbA0JCubk7qq1pt8sxZh1xul8KPzXxR0c5Ud+KEp0UvStay6GUVSrekAdxRNizul3DhWqCeb9GDfaLaExylLvKJzZbELakjFMCY01uy2YHPoUzp9FDo6YvNbTrs1mpi/IwrnTeg1uuYYrfSqCshKpCJxvzLjrydVJwaONIFahLUuVL6ewx9RjyAbzv0aEOybaNdjViW9l8I8YhrcgGCo+/1AusZOH+xhwaQnynfokznUHhIK1U7QmQ4ODZGFUuWDG0LDEYNciiRhDivQYPeIE/Hbgodea/TWGmBzMQ3y+ws5z0MA5Y1RUFLIMiYBbBRc9789UuCFsR7MungqFov+l8Cf0E174xicEIieiuAdzka9896NQkaFwGMUf9E+Vo9JIqPS0C4y06wmrvHtgRRxXkBBgaz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 18:30:28.4229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 535f1584-fe85-454a-f118-08df427d5b99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9226

The XXV ethernet exposes a dedicated statistics block whose counters are
clear-on-tick (PG210): writing TICK_REG latches the internal accumulators
into the readable registers and clears them, so each post-TICK read yields
the count for the interval since the previous TICK. Software accumulates
those intervals, so no last-counter delta (as used by the 1G MAC) is
needed. The readable registers are not reset along with the accumulators
and hold unknown data until the first TICK, so axienet_xxv_mac_init()
drains them once the GT is ready and before RX/TX are enabled.

Feed both ndo_get_stats64() and the ethtool statistics (-S, pause, MAC and
RMON) from this accumulator path through the axienet_config statistics ops.
MAC control statistics stay unsupported as the hardware exposes no matching
counters.

The counters are an optional part of the IP, selected by the "Include
Statistics Counters" build option. Unlike the 1G MAC, which advertises
XAE_ABILITY_STATS, the XXV register map does not report whether they were
included, so gate XAE_FEATURE_STATS on the "xlnx,has-statistics-counters"
devicetree property instead. Gate the TICK_REG drain and the periodic
statistics work on that same flag, so that a design built without the
block is never touched in the statistics register range. The work
previously keyed off the presence of the stats_update hook alone, which
a config installs unconditionally.

Readers copy the software accumulator and do not tick. The periodic
statistics work latches it, and axienet_stop() takes a final snapshot.
ethtool -S and the pause, MAC and RMON callbacks use that same copy, so
they can lag the work interval; the work is deferrable, so on an idle CPU
the lag can exceed it. ndo_get_stats64() may run atomically and cannot tick
these clear-on-tick counters itself. PG210 defines the counters as 48 bits
(LSB [31:0], MSB [15:0] holds [47:32]), saturating at 0xFFFFFFFFFFFF, so
the existing work interval cannot wrap them at 25 Gbit/s. Mask the MSB
register to those 16 bits when a counter is read, so that bits outside the
counter cannot be accumulated into the software base.

The final statistics snapshot added to axienet_stop() is gated on
XAE_FEATURE_STATS, so it also runs on the 1G MAC when that MAC implements
the statistics block; it is therefore not strictly XXV-only.

Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet.h  |   6 +-
 .../net/ethernet/xilinx/xilinx_axienet_main.c |  36 ++-
 .../net/ethernet/xilinx/xilinx_axienet_xxv.c  | 282 ++++++++++++++++++
 .../net/ethernet/xilinx/xilinx_axienet_xxv.h  |  58 ++++
 4 files changed, 378 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h
index 7468fed1416e..10cb73bc460d 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
@@ -520,7 +520,7 @@ struct skbuf_dma_descriptor {
  * @reset_in_progress: Set while we are performing a reset and statistics
  *                     counters may be invalid
  * @hw_stats_seqcount: Sequence counter for @hw_stat_base, @hw_last_counter,
- *                     and @reset_in_progress.
+ *                     @reset_in_progress and, on XXV, @xxv_stat_base.
  * @stats_lock: Lock for @hw_stats_seqcount
  * @stats_work: Work for reading the hardware statistics counters often enough
  *              to catch overflows.
@@ -551,6 +551,9 @@ struct skbuf_dma_descriptor {
  * @rx_ring_tail: RX skb ring buffer tail index.
  * @rx_submit_lock: Protects RX ring resubmission vs teardown in dmaengine path.
  * @xxv_ip_version: XXV IP version.
+ * @xxv_stat_base: Software accumulators for the XXV clear-on-tick counters.
+ *                 Serialized by @stats_lock and published under
+ *                 @hw_stats_seqcount.
  * @axienet_config: MAC-type specific configuration and operations.
  */
 struct axienet_local {
@@ -605,6 +608,7 @@ struct axienet_local {
 
 	u64 hw_stat_base[STAT_COUNT];
 	u32 hw_last_counter[STAT_COUNT];
+	u64 xxv_stat_base[XXV_STAT_COUNT];
 	seqcount_mutex_t hw_stats_seqcount;
 	struct mutex stats_lock;
 	struct delayed_work stats_work;
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 329b6adf2475..c2ee2cc17e4e 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -637,13 +637,23 @@ static void axienet_refresh_stats(struct work_struct *work)
 	struct axienet_local *lp = container_of(work, struct axienet_local,
 						stats_work.work);
 
-	if (lp->axienet_config->stats_update) {
+	/* Gate on XAE_FEATURE_STATS as axienet_stop() does: a config installs
+	 * the hook unconditionally, but the counters themselves are optional,
+	 * and on XXV the registers are absent when they were not built in.
+	 */
+	if (lp->features & XAE_FEATURE_STATS && lp->axienet_config->stats_update) {
 		mutex_lock(&lp->stats_lock);
 		lp->axienet_config->stats_update(lp);
 		mutex_unlock(&lp->stats_lock);
 	}
 
-	/* Just less than 2^32 bytes at 2.5 GBit/s */
+	/* Re-arm the poll before any counter can overflow between updates: the
+	 * 1G byte counter reaches just under 2^32 in this interval at 2.5 Gbit/s.
+	 * The XXV counters are 48 bits (PG210): the LSB register holds [31:0] and
+	 * MSB[15:0] holds [47:32]. They saturate at 0xFFFFFFFFFFFF and clear on
+	 * tick, so this interval cannot wrap them at 25 Gbit/s. This work is
+	 * what latches them between queries.
+	 */
 	schedule_delayed_work(&lp->stats_work, 13 * HZ);
 }
 
@@ -652,7 +662,16 @@ static int __axienet_device_reset(struct axienet_local *lp)
 	u32 value;
 	int ret;
 
-	/* Save statistics counters in case they will be reset */
+	/* Save statistics counters in case they will be reset.
+	 *
+	 * The XAE_FEATURE_STATS blocks in this function read the TEMAC
+	 * statistics registers at XAE_STATS_OFFSET, i.e. they assume the 1G
+	 * counter layout. This is safe because __axienet_device_reset() is
+	 * only reached on the non-dmaengine path, which the
+	 * non_dmaengine capability restricts to the 1G MAC. MACs that use their
+	 * own statistics mechanism (e.g. XXV, which is dmaengine-only) never
+	 * execute this path.
+	 */
 	mutex_lock(&lp->stats_lock);
 	if (lp->features & XAE_FEATURE_STATS)
 		axienet_stats_update(lp, true);
@@ -1880,6 +1899,17 @@ static int axienet_stop(struct net_device *ndev)
 	axienet_setoptions(ndev, lp->options &
 			   ~(XAE_OPTION_TXEN | XAE_OPTION_RXEN));
 
+	/* Final snapshot after RX/TX is disabled, so no frames are missed.
+	 * Gate on XAE_FEATURE_STATS rather than the stats_update hook: a config
+	 * always installs the hook, but the counters are optional in both MACs,
+	 * so only probe_init() knows whether they are there.
+	 */
+	if (lp->features & XAE_FEATURE_STATS && lp->axienet_config->stats_update) {
+		mutex_lock(&lp->stats_lock);
+		lp->axienet_config->stats_update(lp);
+		mutex_unlock(&lp->stats_lock);
+	}
+
 	if (!lp->use_dmaengine) {
 		axienet_dma_stop(lp);
 		cancel_work_sync(&lp->dma_err_task);
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c b/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c
index 3c204dbbf6ae..83782bfbce4c 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c
@@ -8,9 +8,12 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/ethtool.h>
 #include <linux/iopoll.h>
 #include <linux/netdevice.h>
 #include <linux/phylink.h>
+#include <linux/property.h>
+#include <linux/string.h>
 
 #include "xilinx_axienet.h"
 #include "xilinx_axienet_xxv.h"
@@ -96,6 +99,66 @@ static const struct axienet_option xxvenet_options[] = {
 	{}
 };
 
+/* PG210 statistics-block offsets indexed by enum xxv_stat. Each entry is
+ * the 32-bit LSB register address; the corresponding MSB is at +4.
+ */
+static const u32 axienet_xxv_stat_offsets[XXV_STAT_COUNT] = {
+	[XXV_STAT_RX_TOTAL_PACKETS]	 = XXV_STAT_RX_TOTAL_PACKETS_OFFSET,
+	[XXV_STAT_RX_TOTAL_GOOD_PACKETS] = XXV_STAT_RX_TOTAL_GOOD_PACKETS_OFFSET,
+	[XXV_STAT_RX_TOTAL_BYTES]	 = XXV_STAT_RX_TOTAL_BYTES_OFFSET,
+	[XXV_STAT_RX_TOTAL_GOOD_BYTES]	 = XXV_STAT_RX_TOTAL_GOOD_BYTES_OFFSET,
+	[XXV_STAT_RX_PACKET_BAD_FCS]	 = XXV_STAT_RX_PACKET_BAD_FCS_OFFSET,
+	[XXV_STAT_RX_INRANGEERR]	 = XXV_STAT_RX_INRANGEERR_OFFSET,
+	[XXV_STAT_RX_MULTICAST]		 = XXV_STAT_RX_MULTICAST_OFFSET,
+	[XXV_STAT_RX_BROADCAST]		 = XXV_STAT_RX_BROADCAST_OFFSET,
+	[XXV_STAT_RX_UNDERSIZE]		 = XXV_STAT_RX_UNDERSIZE_OFFSET,
+	[XXV_STAT_RX_FRAGMENT]		 = XXV_STAT_RX_FRAGMENT_OFFSET,
+	[XXV_STAT_RX_JABBER]		 = XXV_STAT_RX_JABBER_OFFSET,
+	[XXV_STAT_RX_OVERSIZE]		 = XXV_STAT_RX_OVERSIZE_OFFSET,
+	[XXV_STAT_RX_PAUSE]		 = XXV_STAT_RX_PAUSE_OFFSET,
+	[XXV_STAT_TX_TOTAL_PACKETS]	 = XXV_STAT_TX_TOTAL_PACKETS_OFFSET,
+	[XXV_STAT_TX_TOTAL_GOOD_PACKETS] = XXV_STAT_TX_TOTAL_GOOD_PACKETS_OFFSET,
+	[XXV_STAT_TX_TOTAL_BYTES]	 = XXV_STAT_TX_TOTAL_BYTES_OFFSET,
+	[XXV_STAT_TX_TOTAL_GOOD_BYTES]	 = XXV_STAT_TX_TOTAL_GOOD_BYTES_OFFSET,
+	[XXV_STAT_TX_BAD_FCS]		 = XXV_STAT_TX_BAD_FCS_OFFSET,
+	[XXV_STAT_TX_FRAME_ERROR]	 = XXV_STAT_TX_FRAME_ERROR_OFFSET,
+	[XXV_STAT_TX_MULTICAST]		 = XXV_STAT_TX_MULTICAST_OFFSET,
+	[XXV_STAT_TX_BROADCAST]		 = XXV_STAT_TX_BROADCAST_OFFSET,
+	[XXV_STAT_TX_PAUSE]		 = XXV_STAT_TX_PAUSE_OFFSET,
+};
+
+/* XXV (PG210) counters exposed via ethtool -S. Only counters that have no
+ * standard uAPI are listed here; the totals include errored frames, so they
+ * are distinct from the good-frame counts in rtnl_link_stats64 and the
+ * IEEE MAC statistics. Every other XXV counter is reported through the
+ * dedicated stats64, pause, MAC and RMON callbacks instead.
+ */
+static const enum xxv_stat axienet_xxv_priv_stats[] = {
+	XXV_STAT_RX_TOTAL_PACKETS,
+	XXV_STAT_RX_TOTAL_BYTES,
+	XXV_STAT_TX_TOTAL_PACKETS,
+	XXV_STAT_TX_TOTAL_BYTES,
+};
+
+static const char axienet_xxv_ethtool_stats_strings[][ETH_GSTRING_LEN] = {
+	"RX Total Packets",
+	"RX Total Bytes",
+	"TX Total Packets",
+	"TX Total Bytes",
+};
+
+static u64 axienet_xxv_read_counter(struct axienet_local *lp, enum xxv_stat stat)
+{
+	u32 off = axienet_xxv_stat_offsets[stat];
+	u32 lsb, msb;
+
+	lsb = axienet_ior(lp, off);
+	msb = axienet_ior(lp, off + XXV_STAT_MSB_OFFSET);
+
+	/* MSB[31:16] is not part of the 48-bit counter. */
+	return ((u64)FIELD_GET(XXV_STAT_MSB_MASK, msb) << 32) | lsb;
+}
+
 static bool axienet_xxv_ip_has_gt_status(u32 ip_version)
 {
 	u8 minor = FIELD_GET(XXV_MIN_MASK, ip_version);
@@ -113,6 +176,13 @@ static bool axienet_xxv_ip_has_gt_status(u32 ip_version)
 static void axienet_xxv_probe_init(struct axienet_local *lp)
 {
 	lp->xxv_ip_version = axienet_ior(lp, XXV_CONFIG_REVISION_OFFSET);
+
+	/* The counters are an optional part of the IP (PG210 "Include
+	 * Statistics Counters") and nothing in the register map reports
+	 * whether they were built in, so trust the devicetree.
+	 */
+	if (device_property_read_bool(lp->dev, "xlnx,has-statistics-counters"))
+		lp->features |= XAE_FEATURE_STATS;
 }
 
 /**
@@ -202,6 +272,12 @@ static int axienet_xxv_mac_init(struct net_device *ndev)
 		    FIELD_PREP(XXV_RX_MAX_LEN_MASK, lp->max_frm_size) |
 		    XXV_RX_MIN_LEN_DEFAULT);
 
+	/* Drain pre-open counts now that GT reset-done is complete and RX/TX
+	 * are still disabled, so statistics start from zero.
+	 */
+	if (lp->features & XAE_FEATURE_STATS)
+		axienet_iow(lp, XXV_TICKREG_OFFSET, XXV_TICKREG_STATEN_MASK);
+
 	lp->options |= XAE_OPTION_FCS_STRIP;
 	lp->options |= XAE_OPTION_FCS_INSERT;
 
@@ -335,6 +411,204 @@ static int axienet_10g25g_clk_init(struct axienet_local *lp)
 	return 0;
 }
 
+/**
+ * axienet_xxv_stats_update - Latch and accumulate XXV hardware counters
+ * @lp: Pointer to the axienet_local structure
+ *
+ * The XXV statistics counters are clear-on-tick (PG210): writing TICK_REG
+ * latches the internal accumulators into the readable STAT_*_LSB/MSB registers
+ * and clears the internal accumulators. Each post-TICK read therefore returns
+ * the count for the interval since the previous TICK, so software accumulates
+ * those intervals into lp->xxv_stat_base. A last-counter delta (as used by the
+ * free-running 1G MAC path) is not needed.
+ *
+ * Readers copy @xxv_stat_base and do not tick. ndo_get_stats64() may run in
+ * atomic context, so it cannot take @stats_lock and tick itself. The periodic
+ * statistics work, and the final snapshot in axienet_stop(), are the latches.
+ */
+static void axienet_xxv_stats_update(struct axienet_local *lp)
+{
+	u64 counter[XXV_STAT_COUNT];
+	enum xxv_stat stat;
+
+	/* Latch the clear-on-tick snapshot and read the counters outside the
+	 * seqcount write section, so only the accumulator updates run inside it
+	 * and the reader retry window stays short.
+	 */
+	axienet_iow(lp, XXV_TICKREG_OFFSET, XXV_TICKREG_STATEN_MASK);
+	for (stat = 0; stat < XXV_STAT_COUNT; stat++)
+		counter[stat] = axienet_xxv_read_counter(lp, stat);
+
+	write_seqcount_begin(&lp->hw_stats_seqcount);
+	for (stat = 0; stat < XXV_STAT_COUNT; stat++)
+		lp->xxv_stat_base[stat] += counter[stat];
+	write_seqcount_end(&lp->hw_stats_seqcount);
+}
+
+/**
+ * axienet_xxv_get_stats64 - Fill rtnl_link_stats64 from XXV counters
+ * @lp: Pointer to the axienet_local structure
+ * @stats: Output rtnl_link_stats64 structure to populate
+ */
+static void axienet_xxv_get_stats64(struct axienet_local *lp,
+				    struct rtnl_link_stats64 *stats)
+{
+	unsigned int start;
+	u64 tx_hw_errors;
+
+	do {
+		start = read_seqcount_begin(&lp->hw_stats_seqcount);
+		stats->rx_crc_errors =
+			lp->xxv_stat_base[XXV_STAT_RX_PACKET_BAD_FCS];
+		/* Both in-range length errors and frame-too-long (oversize)
+		 * frames are IEEE 802.3 length errors, so fold them together
+		 * into rx_length_errors; rx_over_errors is reserved for receiver
+		 * FIFO/ring overflow, which the XXV MAC does not expose.
+		 */
+		stats->rx_length_errors =
+			lp->xxv_stat_base[XXV_STAT_RX_INRANGEERR] +
+			lp->xxv_stat_base[XXV_STAT_RX_OVERSIZE];
+		stats->rx_errors = lp->xxv_stat_base[XXV_STAT_RX_UNDERSIZE] +
+				   lp->xxv_stat_base[XXV_STAT_RX_FRAGMENT] +
+				   lp->xxv_stat_base[XXV_STAT_RX_JABBER] +
+				   stats->rx_crc_errors +
+				   stats->rx_length_errors;
+		stats->multicast = lp->xxv_stat_base[XXV_STAT_RX_MULTICAST];
+		tx_hw_errors = lp->xxv_stat_base[XXV_STAT_TX_BAD_FCS] +
+			       lp->xxv_stat_base[XXV_STAT_TX_FRAME_ERROR];
+	} while (read_seqcount_retry(&lp->hw_stats_seqcount, start));
+
+	/* Fold the HW TX error count into the software tx_errors seeded from
+	 * dev->stats by the caller. The XXV xmit path bumps dev->stats.tx_errors
+	 * for frames dropped on pad failure before they reach the MAC, while the
+	 * HW counters only cover frames the MAC actually transmitted; the two are
+	 * disjoint. This runs once, outside the seqcount retry loop, so a racing
+	 * stats update cannot make the accumulation re-add on retry.
+	 */
+	stats->tx_errors += tx_hw_errors;
+}
+
+/**
+ * axienet_xxv_get_ethtool_stats - Copy XXV counters for ethtool -S
+ * @lp: Pointer to the axienet_local structure
+ * @data: Output buffer sized for ARRAY_SIZE(axienet_xxv_priv_stats) u64 values
+ */
+static void axienet_xxv_get_ethtool_stats(struct axienet_local *lp, u64 *data)
+{
+	unsigned int i, start;
+
+	do {
+		start = read_seqcount_begin(&lp->hw_stats_seqcount);
+		for (i = 0; i < ARRAY_SIZE(axienet_xxv_priv_stats); i++)
+			data[i] = lp->xxv_stat_base[axienet_xxv_priv_stats[i]];
+	} while (read_seqcount_retry(&lp->hw_stats_seqcount, start));
+}
+
+/**
+ * axienet_xxv_get_strings - Copy XXV ethtool statistics name strings
+ * @data: Output buffer for the statistics name strings
+ */
+static void axienet_xxv_get_strings(u8 *data)
+{
+	memcpy(data, axienet_xxv_ethtool_stats_strings,
+	       sizeof(axienet_xxv_ethtool_stats_strings));
+}
+
+/**
+ * axienet_xxv_get_sset_count - Number of XXV ethtool statistics
+ *
+ * Return: Count of XXV hardware statistics reported via ethtool -S.
+ */
+static int axienet_xxv_get_sset_count(void)
+{
+	return ARRAY_SIZE(axienet_xxv_ethtool_stats_strings);
+}
+
+/**
+ * axienet_xxv_get_pause_stats - Fill ethtool pause frame statistics
+ * @lp: Pointer to the axienet_local structure
+ * @pause_stats: Output ethtool_pause_stats structure to populate
+ */
+static void axienet_xxv_get_pause_stats(struct axienet_local *lp,
+					struct ethtool_pause_stats *pause_stats)
+{
+	unsigned int start;
+
+	do {
+		start = read_seqcount_begin(&lp->hw_stats_seqcount);
+		pause_stats->tx_pause_frames =
+			lp->xxv_stat_base[XXV_STAT_TX_PAUSE];
+		pause_stats->rx_pause_frames =
+			lp->xxv_stat_base[XXV_STAT_RX_PAUSE];
+	} while (read_seqcount_retry(&lp->hw_stats_seqcount, start));
+}
+
+/**
+ * axienet_xxv_get_eth_mac_stats - Fill IEEE 802.3 MAC statistics
+ * @lp: Pointer to the axienet_local structure
+ * @mac_stats: Output ethtool_eth_mac_stats structure to populate
+ */
+static void axienet_xxv_get_eth_mac_stats(struct axienet_local *lp,
+					  struct ethtool_eth_mac_stats *mac_stats)
+{
+	unsigned int start;
+
+	do {
+		start = read_seqcount_begin(&lp->hw_stats_seqcount);
+		mac_stats->FramesTransmittedOK =
+			lp->xxv_stat_base[XXV_STAT_TX_TOTAL_GOOD_PACKETS];
+		mac_stats->FramesReceivedOK =
+			lp->xxv_stat_base[XXV_STAT_RX_TOTAL_GOOD_PACKETS];
+		mac_stats->OctetsTransmittedOK =
+			lp->xxv_stat_base[XXV_STAT_TX_TOTAL_GOOD_BYTES];
+		mac_stats->OctetsReceivedOK =
+			lp->xxv_stat_base[XXV_STAT_RX_TOTAL_GOOD_BYTES];
+		mac_stats->FrameCheckSequenceErrors =
+			lp->xxv_stat_base[XXV_STAT_RX_PACKET_BAD_FCS];
+		mac_stats->MulticastFramesXmittedOK =
+			lp->xxv_stat_base[XXV_STAT_TX_MULTICAST];
+		mac_stats->BroadcastFramesXmittedOK =
+			lp->xxv_stat_base[XXV_STAT_TX_BROADCAST];
+		mac_stats->MulticastFramesReceivedOK =
+			lp->xxv_stat_base[XXV_STAT_RX_MULTICAST];
+		mac_stats->BroadcastFramesReceivedOK =
+			lp->xxv_stat_base[XXV_STAT_RX_BROADCAST];
+		mac_stats->InRangeLengthErrors =
+			lp->xxv_stat_base[XXV_STAT_RX_INRANGEERR];
+	} while (read_seqcount_retry(&lp->hw_stats_seqcount, start));
+}
+
+/**
+ * axienet_xxv_get_rmon_stats - Fill RMON statistics and histogram ranges
+ * @lp: Pointer to the axienet_local structure
+ * @rmon_stats: Output ethtool_rmon_stats structure to populate
+ * @ranges: Set to NULL; XXV exposes aggregate RMON counters only, not
+ *          per-bin histogram ranges.
+ */
+static void axienet_xxv_get_rmon_stats(struct axienet_local *lp,
+				       struct ethtool_rmon_stats *rmon_stats,
+				       const struct ethtool_rmon_hist_range **ranges)
+{
+	unsigned int start;
+
+	do {
+		start = read_seqcount_begin(&lp->hw_stats_seqcount);
+		rmon_stats->undersize_pkts =
+			lp->xxv_stat_base[XXV_STAT_RX_UNDERSIZE];
+		rmon_stats->oversize_pkts =
+			lp->xxv_stat_base[XXV_STAT_RX_OVERSIZE];
+		rmon_stats->fragments =
+			lp->xxv_stat_base[XXV_STAT_RX_FRAGMENT];
+		rmon_stats->jabbers =
+			lp->xxv_stat_base[XXV_STAT_RX_JABBER];
+	} while (read_seqcount_retry(&lp->hw_stats_seqcount, start));
+
+	/* XXV currently exposes only aggregate RMON counters, not per-bin
+	 * histogram buckets. Keep ranges NULL until histogram bins are wired.
+	 */
+	*ranges = NULL;
+}
+
 const struct axienet_config axienet_10g25g_config = {
 	.jumbo = true,
 	.sw_padding = true,
@@ -348,4 +622,12 @@ const struct axienet_config axienet_10g25g_config = {
 	.get_regs = axienet_xxv_get_regs,
 	.phylink_set_caps = axienet_xxv_phylink_set_capabilities,
 	.pcs_ops = &axienet_xxv_pcs_ops,
+	.stats_update = axienet_xxv_stats_update,
+	.get_stats64 = axienet_xxv_get_stats64,
+	.get_ethtool_stats = axienet_xxv_get_ethtool_stats,
+	.get_strings = axienet_xxv_get_strings,
+	.get_sset_count = axienet_xxv_get_sset_count,
+	.get_pause_stats = axienet_xxv_get_pause_stats,
+	.get_eth_mac_stats = axienet_xxv_get_eth_mac_stats,
+	.get_rmon_stats = axienet_xxv_get_rmon_stats,
 };
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.h b/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.h
index 6530344e40c7..83682d1524ed 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.h
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.h
@@ -66,6 +66,36 @@ struct axienet_config;
 #define XXV_STAT_GT_OFFSET		0x000004A0
 #define XXV_STAT_AN_LINK_CTL2_OFFSET	0x000009F0
 
+/* XXV statistics counter registers (PG210). Each counter is a pair of 32-bit
+ * registers; the MSB register is XXV_STAT_MSB_OFFSET bytes above the LSB.
+ * MSB[15:0] holds counter bits [47:32]. The upper half is not part of the
+ * counter and must be masked off before the value is accumulated.
+ */
+#define XXV_STAT_MSB_OFFSET			4
+#define XXV_STAT_MSB_MASK			GENMASK(15, 0)
+#define XXV_STAT_TX_FRAME_ERROR_OFFSET		0x000006A0
+#define XXV_STAT_TX_TOTAL_PACKETS_OFFSET	0x00000700
+#define XXV_STAT_TX_TOTAL_GOOD_PACKETS_OFFSET	0x00000708
+#define XXV_STAT_TX_TOTAL_BYTES_OFFSET		0x00000710
+#define XXV_STAT_TX_TOTAL_GOOD_BYTES_OFFSET	0x00000718
+#define XXV_STAT_TX_BAD_FCS_OFFSET		0x000007B8
+#define XXV_STAT_TX_MULTICAST_OFFSET		0x000007D8
+#define XXV_STAT_TX_BROADCAST_OFFSET		0x000007E0
+#define XXV_STAT_TX_PAUSE_OFFSET		0x000007F0
+#define XXV_STAT_RX_TOTAL_PACKETS_OFFSET	0x00000808
+#define XXV_STAT_RX_TOTAL_GOOD_PACKETS_OFFSET	0x00000810
+#define XXV_STAT_RX_TOTAL_BYTES_OFFSET		0x00000818
+#define XXV_STAT_RX_TOTAL_GOOD_BYTES_OFFSET	0x00000820
+#define XXV_STAT_RX_UNDERSIZE_OFFSET		0x00000898
+#define XXV_STAT_RX_FRAGMENT_OFFSET		0x000008A0
+#define XXV_STAT_RX_OVERSIZE_OFFSET		0x000008A8
+#define XXV_STAT_RX_JABBER_OFFSET		0x000008B8
+#define XXV_STAT_RX_PACKET_BAD_FCS_OFFSET	0x000008C8
+#define XXV_STAT_RX_MULTICAST_OFFSET		0x000008E0
+#define XXV_STAT_RX_BROADCAST_OFFSET		0x000008E8
+#define XXV_STAT_RX_PAUSE_OFFSET		0x000008F8
+#define XXV_STAT_RX_INRANGEERR_OFFSET		0x00000908
+
 /* XXV MAC Register Mask Definitions */
 #define XXV_GT_RESET_MASK		BIT(0)
 #define XXV_TC_TX_MASK			BIT(0)
@@ -73,6 +103,7 @@ struct axienet_config;
 #define XXV_RCW1_FCS_MASK		BIT(1)
 #define XXV_TC_FCS_MASK			BIT(1)
 #define XXV_STAT_RX_BLOCK_LOCK_MASK	BIT(0)
+#define XXV_TICKREG_STATEN_MASK		BIT(0)
 #define XXV_GT_RESET_DONE		(BIT(0) | BIT(1))
 #define XXV_MAJ_MASK			GENMASK(7, 0)
 #define XXV_MIN_MASK			GENMASK(15, 8)
@@ -88,6 +119,33 @@ struct axienet_config;
 #define XXV_RX_MAX_LEN_MASK		GENMASK(30, 16)
 #define XXV_RX_MIN_LEN_DEFAULT		64
 
+/* XXV (10G/25G) MAC statistics counters, used to index xxv_stat_base[]. */
+enum xxv_stat {
+	XXV_STAT_RX_TOTAL_PACKETS = 0,
+	XXV_STAT_RX_TOTAL_GOOD_PACKETS,
+	XXV_STAT_RX_TOTAL_BYTES,
+	XXV_STAT_RX_TOTAL_GOOD_BYTES,
+	XXV_STAT_RX_PACKET_BAD_FCS,
+	XXV_STAT_RX_INRANGEERR,
+	XXV_STAT_RX_MULTICAST,
+	XXV_STAT_RX_BROADCAST,
+	XXV_STAT_RX_UNDERSIZE,
+	XXV_STAT_RX_FRAGMENT,
+	XXV_STAT_RX_JABBER,
+	XXV_STAT_RX_OVERSIZE,
+	XXV_STAT_RX_PAUSE,
+	XXV_STAT_TX_TOTAL_PACKETS,
+	XXV_STAT_TX_TOTAL_GOOD_PACKETS,
+	XXV_STAT_TX_TOTAL_BYTES,
+	XXV_STAT_TX_TOTAL_GOOD_BYTES,
+	XXV_STAT_TX_BAD_FCS,
+	XXV_STAT_TX_FRAME_ERROR,
+	XXV_STAT_TX_MULTICAST,
+	XXV_STAT_TX_BROADCAST,
+	XXV_STAT_TX_PAUSE,
+	XXV_STAT_COUNT,
+};
+
 extern const struct axienet_config axienet_10g25g_config;
 
 #endif /* XILINX_AXIENET_XXV_H */
-- 
2.25.1

