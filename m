Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794681026;
	b=DqDN84JMGRoVa9/xP7/yv8gIqw+VzGnlr0Vw0XKE7sLoyo0PpBH2cReuZmYkCP88T4jF
	 RHK21hD1uMqCGaK9JUxfD8v9awDnGfTI0+AifVSV91TZI/0ExZriEZl5+wMeuelk+EPqn
	 5JywzIjnxZHnpOsaaw2UfF4yEAZ/sVMrXOw3o2nJT786NYz+SYZYDehIM+jxvyKyRKqB2
	 YZ49YuQsaUf6dSORvvBzo9ZKqmJ2nMMCe8R0u6Ujg0cLmbYqrF8V6jgMFLuYxXauvtgcd
	 1GOTxzsI7CndVqQtjtvy85u3+LWCiIuijwUjUYSHvR9lplRPeuZjbK7Mm+WonnhkPuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794681026;
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
	bh=LTXyI/t9OwsCOGXtzC73Sjn1HQUuv/ELc0h8QjXktcU=;
	b=BnjjqejZR8KnONaDHYqDYCQv72XaRnLCEMsDjNxxScKDFONR7tMHDiuZkgQ8uZA6aIXJ
	 HpgalG89zndpU9PxPAcR7Tn110E4SBnFNCk5y6EoOsrTikuFnctID2cXHOtNtqMW16U0i
	 9MEXyTDVG6fMEwq1aLejGi9Q1X1Oxs5O6w645zO50i15enPJ0TQb+tMm+2Xcx7NbWVo1F
	 3mE0isFGltcf/Op6h5CzXBDjPObkN24jkTNBEJgQi0siFuq/MstiMHZ6pdByKfxnyh2oA
	 Nr4kgvrQC+ZUWbJ02NwHVHnwLMZMRjdVD872EYn6lk3aTTkvq9JzAyiL1wyWcL6SVNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=flDZcY7E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.12
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010012.outbound.protection.outlook.com [52.101.193.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E88606A335;
	Sat, 14 Nov 2026 18:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4E88606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=flDZcY7E
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uP5LwdmeEUl9Z/IlbsInGRlzlch7g5uSqkxczyZ94ctcSCXbsaLUAynjunVYOYFZf6/KYK939uH9W/zaogdTK5/JXmZ1f+WBUqru7FOmIajufVr3eLXLv72J4DQLbFPcDSC0c5ZBnHY7vTjVjF+wzcHO5lERQEHqyMymyxlLLnqeKHFgHxAT1hi2OIFpY2CuXDQk8kqJNBMYanD5jCGbu9OPcwJScF1Ssm2z4xbgkmg2as6T4IxlVNLhiMBbqbccTZtT4q3MIf5QVHiuEAXtl+QAYaNPPUkU0cESCXhBMdKJJ01Q2CScDWOla4a1kKmoX2s32ZBWm0lE+PE4mAJp4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTXyI/t9OwsCOGXtzC73Sjn1HQUuv/ELc0h8QjXktcU=;
 b=LCH7z5GFrt4ZDRKoEa0dnDSLXTKfdNP2H/R9t2p8HKstTYeSrr/upvX8maqXvDAG4WIOU2hS2R2pyUt5sP37oQJCUKaAYKYBIpL/YTL7RRyhEL9HcKMA2nQXE4KIa/zyWacznoeAL/2LT0ualcMVxVqQXzD+3u4WTvBCH5bFdoNaLmiM8QS7u7CzaiVELp6V14u7rHtMCG/EgF/CleBcsTst91iNELfiWYuc5quTPhEvYH8SLC8Ucey9cAsOOTOVWtntw46oQm1UuEOdCvMmZcQ1sb8wvjyhUrVpzKtEhnIq1fq9LTogofKUXhfwQTjTeg93jNzvx38fbgewcizA3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTXyI/t9OwsCOGXtzC73Sjn1HQUuv/ELc0h8QjXktcU=;
 b=flDZcY7EwZJLRhHbUxnd4z587QwHDM0kfTdto1XviRXMonpLPmBuzYP1XGrzVgNungGnFiYcrZ6CZWqLWqg9Rykx8DihYWmIi0pUiRIR5mnuPK/O6CLT/Om6vKWOImaBuEGKhM2AofV9/DjXw1IQunUUS229sR2+/olUiDyfuM0=
Received: from MW4PR03CA0055.namprd03.prod.outlook.com (2603:10b6:303:8e::30)
 by MW6PR12MB8733.namprd12.prod.outlook.com (2603:10b6:303:24c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 14 Nov
 2026 18:30:16 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:303:8e:cafe::7e) by MW4PR03CA0055.outlook.office365.com
 (2603:10b6:303:8e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Sat,
 14 Nov 2026 18:30:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 14 Nov 2026 18:30:16 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 14 Nov
 2026 12:30:15 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 14 Nov
 2026 12:30:14 -0600
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sat, 14 Nov 2026 12:30:11 -0600
From: Suraj Gupta <suraj.gupta2@amd.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Michal Simek <michal.simek@amd.com>, Russell King <linux@armlinux.org.uk>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH net-next v5 4/6] net: xilinx: axienet: Add 10G/25G (XXV) ethernet support
Date: Sat, 14 Nov 2026 23:59:45 +0530
Message-ID: <20261114182947.2908628-5-suraj.gupta2@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|MW6PR12MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: 823813b0-cdd1-4643-96bb-08df427d5465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|82310400026|36860700016|261009223027099003|11063799006|261102123227099003|261021123027099003|261028144727099003|261026140227099003|261022105027099003|261022075727099003|56012099006|261026121527099003|261021121427099003|10067099003|18002099003|22082099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	hrrwyJLxyTl9sKu9JESkXp+O41ngNgpSyus4JUU1Yj6hOSVoAq5KEM1M9k8UJTRCAPd2L2D7B6yZDSuTseohhmLkFaOBJE009vO3vsIcuproVOG66RtkG+q7/eCNdXq1xj42T2vFsX/BCLEJOMswdImrs153O8e8XCc/80KIqgTNmKAaYiu9D+ezJc4wc1ADsAZqSxw7jp4viJrVG64W8prLyrx+77Iun/dTJrgC0nxFEvZOHFDaIeYHsfFarghDuZYmZBm9E9KvPImYKvaPR86jYjsY4ZyWkiXOfZbKZBlVHAYXWh32pDesbVz+8iLiWDQI8HYEgCUPFzbOsSQm/U9rAIBClcRE/GOg/g9BgNGkiEGe0IwVvT2HuYccYxaA2qY7GqF/Kv3fFVarEWG7ud8dx+y+/L1k8IljlkLUTzZXhg1CrnVeJ1v9Xg47HS5LrtpFvMSUby5QQVulK7uStWg5FStgjAqxRu9d/J9zf0B9tknQNSPfCxigMILNwdqFHLexo+1c1lthYnth8w0WTY1Gc2xAYEuSRePSlU3Rr7iOmdP0l4B7nhyxakURmuPpzFr287PjwMemkOP4ei9Myg9Kb+rCApasmcc3l+LzRVNLr4Q0ztt1cPeRyKl8nPDc3OR9gzrVGkxBJNVtTZMRhmvxEIZmnhMQQbW2xs76Kdy2BHYeKKU7bdj8Iqi6SKFTlY5cCIzDUNcZNeq8i7dsVw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(82310400026)(36860700016)(261009223027099003)(11063799006)(261102123227099003)(261021123027099003)(261028144727099003)(261026140227099003)(261022105027099003)(261022075727099003)(56012099006)(261026121527099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xnYIPUpaoX9a9MY+q7WuXv46XHTuQCGAGU3UESnDlKFeIo9/wxsUxr59z9GTbWpYoRt/T9P7OmfqnJxv5JZ2UQr/IiVNwON+fBxELo2Hn9JFg5PZ35hQWgPBmllqEjDKiAPLECsftMcVy7w5GPktdkaIm1ANSp5LGNeRS+2VB1HDcv9LRabzWTc63OL6Uc0e5IQKwA0wNHwRCxZN7oym/lzCmp/YNua7MblNSvPA9IY6BCNhttHx6YcNOHLOAqnhVhVBoMrfRQ3wgu9sQJ9bUR6sW/In2oNnnwuC6dfczMDXsGQR1pZJZTA4mf9pQAl8yUEe7Tv7k10s2JMSejU4ganixslxvXQgmGKkDdfEWz6U3KM4ltsZvzLVOfmLeOB+VN+Jgo8j++x2nm7DKVrXDV7hrQUteeFEAceICec4eheyUz4jLGh31pHgyhYag/9f
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 18:30:16.2808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 823813b0-cdd1-4643-96bb-08df427d5465
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8733

The AXI Ethernet driver currently supports only the AXI 1G Ethernet IP.
Add support for the Xilinx XXV Ethernet IP[1], which implements a 10G/25G
Ethernet MAC with PCS/PMA driving a high-speed serial transceiver, as
specified by the 25G Ethernet Consortium.

Add the XXV-specific logic in new xilinx_axienet_xxv.c/.h files and
describe the MAC through an axienet_10g25g_config that provides the
capability flags, the MAC option table and callbacks (GT reset,
link-ready polling, phylink caps, PCS ops, register dump and probe-time
init). The shared paths consult those capabilities and callbacks instead
of MAC-type checks; the only interface-specific addition is handling the
10GBASER and 25GBASER modes in axienet_mac_select_pcs().

The register, RX and GT DRP clocks are required. The GT reference clock
is requested as optional, because it is usually a fixed oscillator that
Linux does not model; where a board does describe it as a gated provider
it has to be enabled, as the GT otherwise never reports reset-done.

The advertised rate comes from the required phy-mode property rather than
from the STAT_CORE_SPEED register, which PG210 provides only on the 64-bit
AXI4-Stream builds; a node declaring any other phy-mode is rejected at
probe. Cores built with runtime rate switching are not reconfigured to the
other rate, and flow control is not wired up, so pause support is not
advertised either.

The XXV mac_init() can fail on a GT reset-done timeout, which is why
ndo_open has to propagate a device reset failure as of the preceding
patch.

[1]: https://docs.amd.com/r/en-US/pg210-25g-ethernet

Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
---
 drivers/net/ethernet/xilinx/Makefile          |   3 +-
 drivers/net/ethernet/xilinx/xilinx_axienet.h  |   9 +
 .../net/ethernet/xilinx/xilinx_axienet_main.c |  23 +-
 .../net/ethernet/xilinx/xilinx_axienet_xxv.c  | 351 ++++++++++++++++++
 .../net/ethernet/xilinx/xilinx_axienet_xxv.h  |  93 +++++
 5 files changed, 470 insertions(+), 9 deletions(-)
 create mode 100644 drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c
 create mode 100644 drivers/net/ethernet/xilinx/xilinx_axienet_xxv.h

diff --git a/drivers/net/ethernet/xilinx/Makefile b/drivers/net/ethernet/xilinx/Makefile
index 7d7dc1771423..db90e691fec5 100644
--- a/drivers/net/ethernet/xilinx/Makefile
+++ b/drivers/net/ethernet/xilinx/Makefile
@@ -6,5 +6,6 @@
 ll_temac-objs := ll_temac_main.o ll_temac_mdio.o
 obj-$(CONFIG_XILINX_LL_TEMAC) += ll_temac.o
 obj-$(CONFIG_XILINX_EMACLITE) += xilinx_emaclite.o
-xilinx_emac-objs := xilinx_axienet_main.o xilinx_axienet_mdio.o
+xilinx_emac-objs := xilinx_axienet_main.o xilinx_axienet_mdio.o \
+		    xilinx_axienet_xxv.o
 obj-$(CONFIG_XILINX_AXI_EMAC) += xilinx_emac.o
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h
index 140383749996..56570b49574e 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
@@ -17,6 +17,8 @@
 #include <linux/phylink.h>
 #include <linux/skbuff.h>
 
+#include "xilinx_axienet_xxv.h"
+
 /* Packet size info */
 #define XAE_HDR_SIZE			14 /* Size of Ethernet header */
 #define XAE_TRL_SIZE			 4 /* Size of Ethernet trailer (FCS) */
@@ -548,6 +550,7 @@ struct skbuf_dma_descriptor {
  * @rx_ring_head: RX skb ring buffer head index.
  * @rx_ring_tail: RX skb ring buffer tail index.
  * @rx_submit_lock: Protects RX ring resubmission vs teardown in dmaengine path.
+ * @xxv_ip_version: XXV IP version.
  * @axienet_config: MAC-type specific configuration and operations.
  */
 struct axienet_local {
@@ -632,6 +635,7 @@ struct axienet_local {
 	int rx_ring_head;
 	int rx_ring_tail;
 	spinlock_t rx_submit_lock;
+	u32 xxv_ip_version;
 	const struct axienet_config *axienet_config;
 };
 
@@ -689,6 +693,11 @@ struct axienet_config {
 	void (*stats_update)(struct axienet_local *lp);
 };
 
+static inline struct axienet_local *pcs_to_axienet_local(struct phylink_pcs *pcs)
+{
+	return container_of(pcs, struct axienet_local, pcs);
+}
+
 /**
  * struct axienet_option - Used to set axi ethernet hardware options
  * @opt:	Option to be set.
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index f338029cf870..a37aad4432ce 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -800,6 +800,12 @@ static int axienet_1g_mac_init(struct net_device *ndev)
  * Ethernet core. No separate hardware reset is done for the Axi Ethernet
  * core.
  *
+ * It also recomputes @max_frm_size from the current MTU and runs the
+ * MAC-specific mac_init() callback, so it is the point at which length-related
+ * MAC configuration (such as the XXV RX max-packet-length) is reprogrammed.
+ * Because it is reached from the open path, a new MTU takes effect on the next
+ * interface up.
+ *
  * Return: 0 on success or a negative error number otherwise.
  */
 static int axienet_device_reset(struct net_device *ndev)
@@ -2720,11 +2726,6 @@ static const struct ethtool_ops axienet_ethtool_dmaengine_ops = {
 	.get_rmon_stats = axienet_ethtool_get_rmon_stats,
 };
 
-static struct axienet_local *pcs_to_axienet_local(struct phylink_pcs *pcs)
-{
-	return container_of(pcs, struct axienet_local, pcs);
-}
-
 static void axienet_pcs_get_state(struct phylink_pcs *pcs,
 				  unsigned int neg_mode,
 				  struct phylink_link_state *state)
@@ -2784,7 +2785,9 @@ static struct phylink_pcs *axienet_mac_select_pcs(struct phylink_config *config,
 	struct axienet_local *lp = netdev_priv(ndev);
 
 	if (interface == PHY_INTERFACE_MODE_1000BASEX ||
-	    interface ==  PHY_INTERFACE_MODE_SGMII)
+	    interface == PHY_INTERFACE_MODE_SGMII ||
+	    interface == PHY_INTERFACE_MODE_10GBASER ||
+	    interface == PHY_INTERFACE_MODE_25GBASER)
 		return &lp->pcs;
 
 	return NULL;
@@ -3014,6 +3017,7 @@ static const struct of_device_id axienet_of_match[] = {
 	{ .compatible = "xlnx,axi-ethernet-1.00.a", .data = &axienet_1g_config },
 	{ .compatible = "xlnx,axi-ethernet-1.01.a", .data = &axienet_1g_config },
 	{ .compatible = "xlnx,axi-ethernet-2.01.a", .data = &axienet_1g_config },
+	{ .compatible = "xlnx,xxv-ethernet-1.0", .data = &axienet_10g25g_config },
 	{},
 };
 
@@ -3051,9 +3055,10 @@ static int axienet_probe(struct platform_device *pdev)
 	SET_NETDEV_DEV(ndev, &pdev->dev);
 	ndev->features = NETIF_F_SG;
 
-	/* MTU range: 64 - 9000 */
+	/* MTU range: min is 64; max is finalized once the MAC config (which
+	 * tells us whether jumbo frames are supported) is known, see below.
+	 */
 	ndev->min_mtu = 64;
-	ndev->max_mtu = XAE_JUMBO_MTU;
 
 	lp = netdev_priv(ndev);
 	lp->ndev = ndev;
@@ -3073,6 +3078,8 @@ static int axienet_probe(struct platform_device *pdev)
 	if (!lp->axienet_config)
 		return -ENODEV;
 
+	ndev->max_mtu = lp->axienet_config->jumbo ? XAE_JUMBO_MTU : XAE_MTU;
+
 	ret = lp->axienet_config->clk_init(lp);
 	if (ret)
 		return ret;
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c b/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c
new file mode 100644
index 000000000000..3c204dbbf6ae
--- /dev/null
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.c
@@ -0,0 +1,351 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * XXV (10G/25G) support
+ *
+ * Copyright (C) 2026 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/iopoll.h>
+#include <linux/netdevice.h>
+#include <linux/phylink.h>
+
+#include "xilinx_axienet.h"
+#include "xilinx_axienet_xxv.h"
+
+/* readl_poll_timeout() sleep interval (us) for the GT reset-done and PCS
+ * block-lock polls, which both run to a DELAY_OF_ONE_MILLISEC timeout. The
+ * interval and that bound come from ZynqMP/Versal bring-up; PG210 does not
+ * specify either.
+ */
+#define XXV_LINK_POLL_INTERVAL_US	10
+
+/* Number of XXV (10G/25G) MAC registers exposed via ethtool -d.
+ * Covers configuration and status registers per Xilinx PG210.
+ */
+static const u32 axienet_xxv_reg_dump_offsets[XXV_REGS_N] = {
+	XXV_GT_RESET_OFFSET,
+	XXV_RESET_OFFSET,
+	XXV_MODE_OFFSET,
+	XXV_TC_OFFSET,
+	XXV_RCW1_OFFSET,
+	XXV_JUM_OFFSET,
+	XXV_VL_LENGTH_OFFSET,
+	XXV_TICKREG_OFFSET,
+	XXV_CONFIG_REVISION_OFFSET,
+	XXV_CONFIG_1588_OFFSET,
+	XXV_CONFIG_TX_FLOW_CTRL1_OFFSET,
+	XXV_CONFIG_RX_FLOW_CTRL1_OFFSET,
+	XXV_CONFIG_RX_FLOW_CTRL2_OFFSET,
+	XXV_CONFIG_RSFEC_OFFSET,
+	XXV_CONFIG_FEC_OFFSET,
+	XXV_AN_CTL1_OFFSET,
+	XXV_AN_CTL2_OFFSET,
+	XXV_AN_ABILITY_OFFSET,
+	XXV_LT_CTL1_OFFSET,
+	XXV_SWITCH_CORE_SPEED_OFFSET,
+	XXV_CONFIG_1588_32BIT_OFFSET,
+	XXV_TX_CONFIG_1588_OFFSET,
+	XXV_RX_CONFIG_1588_OFFSET,
+	XXV_GT_CTRL_OFFSET,
+	XXV_STAT_TX_STATUS_OFFSET,
+	XXV_STAT_RX_STATUS_OFFSET,
+	XXV_STAT_STATUS_OFFSET,
+	XXV_STAT_RX_BLOCK_LOCK_OFFSET,
+	XXV_STAT_RX_RSFEC_STATUS_OFFSET,
+	XXV_STAT_RX_FEC_STATUS_OFFSET,
+	XXV_STAT_TX_RSFEC_STATUS_OFFSET,
+	XXV_STAT_TX_FLOW_CTRL1_OFFSET,
+	XXV_STAT_RX_FLOW_CTRL1_OFFSET,
+	XXV_STAT_AN_STS_OFFSET,
+	XXV_STAT_AN_ABILITY_OFFSET,
+	XXV_STAT_AN_LINK_CTL_OFFSET,
+	XXV_STAT_LT_STATUS1_OFFSET,
+	XXV_STAT_LT_STATUS2_OFFSET,
+	XXV_STAT_LT_STATUS3_OFFSET,
+	XXV_STAT_LT_STATUS4_OFFSET,
+	XXV_STAT_LT_COEFF0_OFFSET,
+	XXV_STAT_RX_VALID_CTRL_CODE_OFFSET,
+	XXV_STAT_CORE_SPEED_OFFSET,
+	XXV_STAT_TSN_OFFSET,
+	XXV_STAT_GT_OFFSET,
+	XXV_STAT_AN_LINK_CTL2_OFFSET,
+};
+
+/* Option table for setting up XXV Ethernet hardware options */
+static const struct axienet_option xxvenet_options[] = {
+	{ /* Turn on FCS stripping on receive packets */
+		.opt = XAE_OPTION_FCS_STRIP,
+		.reg = XXV_RCW1_OFFSET,
+		.m_or = XXV_RCW1_FCS_MASK,
+	}, { /* Turn on FCS insertion on transmit packets */
+		.opt = XAE_OPTION_FCS_INSERT,
+		.reg = XXV_TC_OFFSET,
+		.m_or = XXV_TC_FCS_MASK,
+	}, { /* Enable transmitter */
+		.opt = XAE_OPTION_TXEN,
+		.reg = XXV_TC_OFFSET,
+		.m_or = XXV_TC_TX_MASK,
+	}, { /* Enable receiver */
+		.opt = XAE_OPTION_RXEN,
+		.reg = XXV_RCW1_OFFSET,
+		.m_or = XXV_RCW1_RX_MASK,
+	},
+	{}
+};
+
+static bool axienet_xxv_ip_has_gt_status(u32 ip_version)
+{
+	u8 minor = FIELD_GET(XXV_MIN_MASK, ip_version);
+	u8 maj = FIELD_GET(XXV_MAJ_MASK, ip_version);
+
+	if (maj == XXV_IP_VER_GT_MAJ_MIN)
+		return minor >= XXV_IP_VER_GT_MIN_MIN;
+	return maj > XXV_IP_VER_GT_MAJ_MIN;
+}
+
+/**
+ * axienet_xxv_probe_init - Initialize XXV-specific state at probe time
+ * @lp: Pointer to the axienet_local structure
+ */
+static void axienet_xxv_probe_init(struct axienet_local *lp)
+{
+	lp->xxv_ip_version = axienet_ior(lp, XXV_CONFIG_REVISION_OFFSET);
+}
+
+/**
+ * axienet_xxv_gt_reset - Pulse the XXV GT reset line
+ * @lp: Pointer to the axienet_local structure
+ */
+static void axienet_xxv_gt_reset(struct axienet_local *lp)
+{
+	u32 val;
+
+	val = axienet_ior(lp, XXV_GT_RESET_OFFSET);
+	val |= XXV_GT_RESET_MASK;
+	axienet_iow(lp, XXV_GT_RESET_OFFSET, val);
+	/* Give the GT time to enter reset so that axienet_xxv_poll_link_ready()
+	 * cannot sample a reset-done left over from before the pulse. The delay
+	 * is not a documented hold time (see timeout note above).
+	 */
+	usleep_range(1000, 2000);
+	val = axienet_ior(lp, XXV_GT_RESET_OFFSET);
+	val &= ~XXV_GT_RESET_MASK;
+	axienet_iow(lp, XXV_GT_RESET_OFFSET, val);
+}
+
+/**
+ * axienet_xxv_poll_link_ready - Wait for XXV GT and PCS block lock
+ * @ndev: Pointer to the net_device structure
+ *
+ * Poll GT reset-done on IP v3.2+, then RX PCS block lock. GT reset-done
+ * depends only on the GT reference clock, so its timeout is treated as fatal.
+ * Block-lock additionally needs a live link partner, so its failure is logged
+ * but not propagated: an unplugged cable must not fail device bring-up.
+ *
+ * Return: 0 on success, or a negative error if GT reset-done times out.
+ */
+static int axienet_xxv_poll_link_ready(struct net_device *ndev)
+{
+	struct axienet_local *lp = netdev_priv(ndev);
+	u32 val;
+	int ret;
+
+	/* Confirm XXV Ethernet is up: the GT status register exists only
+	 * on IP v3.2+, so wait there for GT reset-done, then poll until
+	 * RX PCS block lock is asserted.
+	 */
+	if (axienet_xxv_ip_has_gt_status(lp->xxv_ip_version)) {
+		ret = readl_poll_timeout(lp->regs + XXV_STAT_GT_OFFSET,
+					 val,
+					 (val & XXV_GT_RESET_DONE) == XXV_GT_RESET_DONE,
+					 XXV_LINK_POLL_INTERVAL_US,
+					 DELAY_OF_ONE_MILLISEC);
+		if (ret) {
+			netdev_err(ndev, "XXV MAC GT reset not complete! Cross-check the MAC ref clock configuration\n");
+			return ret;
+		}
+	}
+
+	ret = readl_poll_timeout(lp->regs + XXV_STAT_RX_BLOCK_LOCK_OFFSET,
+				 val, (val & XXV_STAT_RX_BLOCK_LOCK_MASK),
+				 XXV_LINK_POLL_INTERVAL_US,
+				 DELAY_OF_ONE_MILLISEC);
+	if (ret)
+		netdev_dbg(ndev, "XXV RX block lock not yet asserted (no link partner?)\n");
+
+	return 0;
+}
+
+/**
+ * axienet_xxv_mac_init - XXV MAC-specific bring-up after the DMA reset
+ * @ndev: Pointer to the net_device structure
+ *
+ * Return: 0 on success or a negative error number otherwise.
+ */
+static int axienet_xxv_mac_init(struct net_device *ndev)
+{
+	struct axienet_local *lp = netdev_priv(ndev);
+	int ret;
+
+	ret = axienet_xxv_poll_link_ready(ndev);
+	if (ret)
+		return ret;
+
+	/* Bound the MAC's RX max packet length to the posted buffer size so an
+	 * oversized frame is truncated to a single buffer instead of spilling
+	 * across several DMA descriptors (PG210 CONFIGURATION_RX_MTU).
+	 */
+	axienet_iow(lp, XXV_JUM_OFFSET,
+		    FIELD_PREP(XXV_RX_MAX_LEN_MASK, lp->max_frm_size) |
+		    XXV_RX_MIN_LEN_DEFAULT);
+
+	lp->options |= XAE_OPTION_FCS_STRIP;
+	lp->options |= XAE_OPTION_FCS_INSERT;
+
+	return 0;
+}
+
+static void axienet_xxv_phylink_set_capabilities(struct axienet_local *lp,
+						 struct phylink_config *cfg)
+{
+	switch (lp->phy_mode) {
+	case PHY_INTERFACE_MODE_10GBASER:
+		cfg->mac_capabilities |= MAC_10000FD;
+		break;
+	case PHY_INTERFACE_MODE_25GBASER:
+		cfg->mac_capabilities |= MAC_25000FD;
+		break;
+	default:
+		/* The binding allows only the two rates above. Leave
+		 * supported_interfaces empty rather than guessing a rate;
+		 * phylink_create() then rejects the devicetree and probe
+		 * fails.
+		 */
+		dev_err(lp->dev, "unsupported phy-mode %s for XXV ethernet\n",
+			phy_modes(lp->phy_mode));
+		return;
+	}
+
+	__set_bit(lp->phy_mode, cfg->supported_interfaces);
+
+	/* The integrated PCS/PMA manages the link in-band and there is no
+	 * phy-handle, so resolve to MLO_AN_INBAND.
+	 */
+	cfg->default_an_inband = true;
+
+	/* Flow control is not wired up for XXV yet; do not advertise pause. */
+	cfg->mac_capabilities &= ~(MAC_SYM_PAUSE | MAC_ASYM_PAUSE);
+}
+
+static void axienet_xxv_pcs_get_state(struct phylink_pcs *pcs,
+				      unsigned int neg_mode,
+				      struct phylink_link_state *state)
+{
+	struct axienet_local *lp = pcs_to_axienet_local(pcs);
+
+	state->duplex = DUPLEX_FULL;
+	state->an_complete = !!(axienet_ior(lp, XXV_STAT_AN_STS_OFFSET) &
+				XXV_AN_COMPLETE_MASK);
+	state->link = axienet_ior(lp, XXV_STAT_RX_STATUS_OFFSET) &
+		      XXV_STAT_RX_STATUS_MASK;
+
+	/* The core runs at the single rate phylink was configured for, so
+	 * derive the speed from the interface rather than from STAT_CORE_SPEED,
+	 * which PG210 provides only on the 64-bit AXI4-Stream builds.
+	 */
+	if (state->interface == PHY_INTERFACE_MODE_10GBASER)
+		state->speed = SPEED_10000;
+	else
+		state->speed = SPEED_25000;
+}
+
+static int axienet_xxv_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
+				  phy_interface_t interface,
+				  const unsigned long *advertising,
+				  bool permit_pause_to_mac)
+{
+	return 0;
+}
+
+static const struct phylink_pcs_ops axienet_xxv_pcs_ops = {
+	.pcs_get_state = axienet_xxv_pcs_get_state,
+	.pcs_config = axienet_xxv_pcs_config,
+};
+
+/**
+ * axienet_xxv_get_regs - Dump XXV MAC registers for ethtool
+ * @lp: Pointer to the axienet_local structure
+ * @data: Buffer for register values (zeroed and sized by the caller)
+ */
+static void axienet_xxv_get_regs(struct axienet_local *lp, u32 *data)
+{
+	bool has_gt_status = axienet_xxv_ip_has_gt_status(lp->xxv_ip_version);
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(axienet_xxv_reg_dump_offsets); i++) {
+		u32 off = axienet_xxv_reg_dump_offsets[i];
+
+		/* The GT registers only exist on the IP versions that report
+		 * reset-done. Leave their slots zero on the others so the
+		 * dump keeps a fixed layout.
+		 */
+		if (!has_gt_status && (off == XXV_GT_CTRL_OFFSET ||
+				       off == XXV_STAT_GT_OFFSET))
+			continue;
+
+		data[i] = axienet_ior(lp, off);
+	}
+}
+
+static int axienet_10g25g_clk_init(struct axienet_local *lp)
+{
+	struct device *dev = lp->dev;
+	struct clk *ref_clk;
+	int ret;
+
+	/* The register, RX and GT DRP clocks are mandatory for MAC+PCS
+	 * operation, so fetch them as required.
+	 */
+	lp->axi_clk = devm_clk_get_enabled(dev, "s_axi");
+	if (IS_ERR(lp->axi_clk))
+		return dev_err_probe(dev, PTR_ERR(lp->axi_clk),
+				     "could not get AXI clock\n");
+
+	lp->misc_clks[0].id = "rx_core";
+	lp->misc_clks[1].id = "drp";
+
+	ret = devm_clk_bulk_get_enable(dev, XXV_NUM_MISC_CLOCKS,
+				       lp->misc_clks);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "could not get/enable XXV clocks\n");
+
+	/* The GT reference clock is usually a fixed oscillator that Linux does
+	 * not model, but enable it for boards that describe it as a gated
+	 * provider. Without it the GT never reports reset-done.
+	 */
+	ref_clk = devm_clk_get_optional_enabled(dev, "ref");
+	if (IS_ERR(ref_clk))
+		return dev_err_probe(dev, PTR_ERR(ref_clk),
+				     "could not get/enable GT reference clock\n");
+
+	return 0;
+}
+
+const struct axienet_config axienet_10g25g_config = {
+	.jumbo = true,
+	.sw_padding = true,
+	.internal_pcs = true,
+	.regs_n = XXV_REGS_N,
+	.options = xxvenet_options,
+	.clk_init = axienet_10g25g_clk_init,
+	.probe_init = axienet_xxv_probe_init,
+	.gt_reset = axienet_xxv_gt_reset,
+	.mac_init = axienet_xxv_mac_init,
+	.get_regs = axienet_xxv_get_regs,
+	.phylink_set_caps = axienet_xxv_phylink_set_capabilities,
+	.pcs_ops = &axienet_xxv_pcs_ops,
+};
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.h b/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.h
new file mode 100644
index 000000000000..6530344e40c7
--- /dev/null
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_xxv.h
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * XXV (10G/25G) support
+ *
+ * Copyright (C) 2026 Advanced Micro Devices, Inc.
+ */
+
+#ifndef XILINX_AXIENET_XXV_H
+#define XILINX_AXIENET_XXV_H
+
+#include <linux/bits.h>
+
+struct axienet_local;
+struct axienet_config;
+
+#define XXV_REGS_N		46
+
+/* RX core and GT DRP clocks, fetched through lp->misc_clks */
+#define XXV_NUM_MISC_CLOCKS	2
+
+/* XXV MAC Register Definitions */
+#define XXV_GT_RESET_OFFSET		0x00000000
+#define XXV_RESET_OFFSET		0x00000004
+#define XXV_MODE_OFFSET			0x00000008
+#define XXV_TC_OFFSET			0x0000000C
+#define XXV_RCW1_OFFSET			0x00000014
+#define XXV_JUM_OFFSET			0x00000018
+#define XXV_VL_LENGTH_OFFSET		0x0000001C
+#define XXV_TICKREG_OFFSET		0x00000020
+#define XXV_CONFIG_REVISION_OFFSET	0x00000024
+#define XXV_CONFIG_1588_OFFSET		0x00000038
+#define XXV_CONFIG_TX_FLOW_CTRL1_OFFSET	0x00000040
+#define XXV_CONFIG_RX_FLOW_CTRL1_OFFSET	0x00000094
+#define XXV_CONFIG_RX_FLOW_CTRL2_OFFSET	0x00000098
+#define XXV_CONFIG_RSFEC_OFFSET		0x000000D0
+#define XXV_CONFIG_FEC_OFFSET		0x000000D4
+#define XXV_AN_CTL1_OFFSET		0x000000E0
+#define XXV_AN_CTL2_OFFSET		0x000000E4
+#define XXV_AN_ABILITY_OFFSET		0x000000F8
+#define XXV_LT_CTL1_OFFSET		0x00000100
+#define XXV_SWITCH_CORE_SPEED_OFFSET	0x00000138
+#define XXV_CONFIG_1588_32BIT_OFFSET	0x0000013C
+#define XXV_TX_CONFIG_1588_OFFSET	0x00000140
+#define XXV_RX_CONFIG_1588_OFFSET	0x00000144
+#define XXV_GT_CTRL_OFFSET		0x00000154
+#define XXV_STAT_TX_STATUS_OFFSET	0x00000400
+#define XXV_STAT_RX_STATUS_OFFSET	0x00000404
+#define XXV_STAT_STATUS_OFFSET		0x00000408
+#define XXV_STAT_RX_BLOCK_LOCK_OFFSET	0x0000040C
+#define XXV_STAT_RX_RSFEC_STATUS_OFFSET	0x0000043C
+#define XXV_STAT_RX_FEC_STATUS_OFFSET	0x00000448
+#define XXV_STAT_TX_RSFEC_STATUS_OFFSET	0x0000044C
+#define XXV_STAT_TX_FLOW_CTRL1_OFFSET	0x00000450
+#define XXV_STAT_RX_FLOW_CTRL1_OFFSET	0x00000454
+#define XXV_STAT_AN_STS_OFFSET		0x00000458
+#define XXV_STAT_AN_ABILITY_OFFSET	0x0000045C
+#define XXV_STAT_AN_LINK_CTL_OFFSET	0x00000460
+#define XXV_STAT_LT_STATUS1_OFFSET	0x00000464
+#define XXV_STAT_LT_STATUS2_OFFSET	0x00000468
+#define XXV_STAT_LT_STATUS3_OFFSET	0x0000046C
+#define XXV_STAT_LT_STATUS4_OFFSET	0x00000470
+#define XXV_STAT_LT_COEFF0_OFFSET	0x00000474
+#define XXV_STAT_RX_VALID_CTRL_CODE_OFFSET	0x00000494
+#define XXV_STAT_CORE_SPEED_OFFSET	0x00000498
+#define XXV_STAT_TSN_OFFSET		0x0000049C
+#define XXV_STAT_GT_OFFSET		0x000004A0
+#define XXV_STAT_AN_LINK_CTL2_OFFSET	0x000009F0
+
+/* XXV MAC Register Mask Definitions */
+#define XXV_GT_RESET_MASK		BIT(0)
+#define XXV_TC_TX_MASK			BIT(0)
+#define XXV_RCW1_RX_MASK		BIT(0)
+#define XXV_RCW1_FCS_MASK		BIT(1)
+#define XXV_TC_FCS_MASK			BIT(1)
+#define XXV_STAT_RX_BLOCK_LOCK_MASK	BIT(0)
+#define XXV_GT_RESET_DONE		(BIT(0) | BIT(1))
+#define XXV_MAJ_MASK			GENMASK(7, 0)
+#define XXV_MIN_MASK			GENMASK(15, 8)
+/* The GT control and status registers exist from IP v3.2 on (PG210). */
+#define XXV_IP_VER_GT_MAJ_MIN		3
+#define XXV_IP_VER_GT_MIN_MIN		2
+#define XXV_AN_COMPLETE_MASK		BIT(2)
+#define XXV_STAT_RX_STATUS_MASK		BIT(0)
+
+/* CONFIGURATION_RX_MTU (XXV_JUM_OFFSET) field layout (PG210): bits [30:16]
+ * hold ctl_rx_max_packet_len, bits [7:0] hold ctl_rx_min_packet_len.
+ */
+#define XXV_RX_MAX_LEN_MASK		GENMASK(30, 16)
+#define XXV_RX_MIN_LEN_DEFAULT		64
+
+extern const struct axienet_config axienet_10g25g_config;
+
+#endif /* XILINX_AXIENET_XXV_H */
-- 
2.25.1

