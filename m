Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794681015;
	b=AtRcdi8HNoB+pY4+yJcSxZHo8qNvZSh8hT2hnoPJeZRDhwngiI0xjncwbIrrOG0rjBJS
	 Dabg4QDqg0enVXjMqmuIpsaP8A1nawXKuofUPNAB89Vgi1cdFsqmcUKlqwnUiPAtDIIFm
	 XS+I4dj0VfhHXfso+aObNeeev5pzdAH/SajDax+xhcvSfx5TNggVHTFJ2GJ8fFhG714v2
	 xMRIZPW5QPrN7rA7zfR8zsG7RsRZnOy6ila6+vwUlwYmMrJ+4FRCXCJrGrkX0hVjN/MZG
	 UDAmWtmTc2mbQdBtUDl0/nqLiWlE/1PV2ksK/XkjgwVLYQznyim+TRAMQqnX+WIVgTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794681015;
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
	bh=3Ag4YvhCnk2U72UDMW7Mcin/E4miUl3MEaQN7j7SHR8=;
	b=bjPrr63tAnw8KkVPTPEA8JpQzIMGFSXprylQ+B5rVnF9pJbSJA5eUx03kAYb7mIgCArj
	 QNwc1qDPYqNgri+zhX884n/ZNgk/PrwrXyccO53VRbmkFF3kSJ3FUxkIr1dKR+5R3cqk1
	 W8BFTa5jTljHo4xwKBF3+USX6CyPJ60cXS5OYhGSuNCRbjv42P+VQyASMvxiIWviCX+2F
	 ko+gZO9RRNAngqwhQkWsQBoAxtgsogq1TVrmP9geLJK7okxujRzSucKLcGJQktHHSGRcB
	 e/DGdFD9vXFp8B4UFfD3SkQSAbgRlf09DUlNF6H98Gama0hz+Ou1OLQ7Bfqsif1tN4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lGla5CMW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.54
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013054.outbound.protection.outlook.com [40.107.201.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFA7606A881;
	Sat, 14 Nov 2026 18:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DFA7606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lGla5CMW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSc0An+99fcLTxPVPseczfJdxkgIkA+YnBUzp+HqFEhvGPRBEh1YhbWmKKLMLZZiONUD9Jd0sN5+utlhcBnUg25pdqvTa7rP0lNjBytsflI7qSXkjEz5tiTbvH53HPJckuINzVIZ/AoXJ4M6LMvRdhDeTx5zrGaeaHPCTyIicvHDgWu9rrLy+D5y27pIhN70BSVE/4FJN0BiyY1zhyHsND6VR2QP/voClrYtI01bqhtvmcDG2la5mwNWPmrP0lE1VWJ2g/geXJ9DRnMcKJiSp6Qbza+3AwoNzgibbl6ODpymDzUNoS7kwT8nbXKvuwRn/T4NFMWiljC2H937vVqRQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Ag4YvhCnk2U72UDMW7Mcin/E4miUl3MEaQN7j7SHR8=;
 b=W+ONIXylYEqJdpRlwq++ttjwpqZeO7YYMK6PW+YytwRxhanDeuXcGnLlHbDyiVhryEm+vskRyTWpaHislLyvG4PGPohHq+DeDH2/92nTedG/lClxCAiaHcwJxa79wsbPeVrE9UW1PN/0l+tStc4cRSHBStsi/43BW+7YHYpGHSOk/8HpMURRF573rmbeLiT9bW3pl1B6R1kp/ZkVPATOrtUtKacARuEzxCRzUKAL6l6LY/b5lIoF4Wxt8rnDwutyg4hxzy/oZhLTtJLjwYmWw1LFGjRCWq+dj+iGqdPn6taj8UN6JgJSVloBh1IWkcMB9YWW3qqgyhS+vC6Ytq44hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Ag4YvhCnk2U72UDMW7Mcin/E4miUl3MEaQN7j7SHR8=;
 b=lGla5CMWzh3wCYFSsmx7Menm0RM56i3OANM6uVxMNo7lVoULNcF4Wd9fbobi4YJUvCQ6w/JT1D114KrKgcSKlRzMMc8wDSxSD7hhsEqLnRjbcHgSHMcTq7WjHBKG4P+2WKbgu+PYKgiOBOpx9/4aBQEvsYkEVhkBpw5zjYIsNXU=
Received: from BN9PR03CA0238.namprd03.prod.outlook.com (2603:10b6:408:f8::33)
 by DSWPR12MB999177.namprd12.prod.outlook.com (2603:10b6:8:36f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Sat, 14 Nov
 2026 18:30:04 +0000
Received: from BN7PEPF00000092.namprd03.prod.outlook.com
 (2603:10b6:408:f8:cafe::6f) by BN9PR03CA0238.outlook.office365.com
 (2603:10b6:408:f8::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Sat, 14
 Nov 2026 18:30:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF00000092.mail.protection.outlook.com (10.167.245.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 14 Nov 2026 18:30:02 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 14 Nov
 2026 12:30:02 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 14 Nov
 2026 12:30:01 -0600
Received: from xhdsuragupt40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sat, 14 Nov 2026 12:29:57 -0600
From: Suraj Gupta <suraj.gupta2@amd.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Michal Simek <michal.simek@amd.com>, Russell King <linux@armlinux.org.uk>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH net-next v5 1/6] net: xilinx: axienet: Introduce axienet_config for MAC-specific ops
Date: Sat, 14 Nov 2026 23:59:42 +0530
Message-ID: <20261114182947.2908628-2-suraj.gupta2@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF00000092:EE_|DSWPR12MB999177:EE_
X-MS-Office365-Filtering-Correlation-Id: a84a4cc2-d686-4669-c582-08df427d4c3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|23010399003|22082099003|18002099003|6133799003|10063799003|261009223027099003|11063799006|56012099006|5023799004|261022105027099003|10067099003|261028144727099003|261102123227099003|261021123027099003|261026121527099003|261026140227099003|261022075727099003|261021121427099003|261021135927099003;
X-Microsoft-Antispam-Message-Info:
	YEvW1FjH7LHTwMiLXp+cm37TcQYz6lucbpNVJNYtBggZuKGqZy8ZLM3KsYKB0RgmFnv7S0DuUAcCuBUkbvVxbQ2fyECpMuIlKmf9iICY1MbUHViH4KwXDP9BQ/AIbA2Z9pBdP3p4nA6fBjdVdwmftY4CnPL/lunpB624gxh4vIro7uAhAQpBi+PDeQ62WUwbuQGKz9L4eVxZDsj5UkN6SAKf8LQ0l8jMzFz9e+9a9KbhnGPWOCQPiugIHSfE9VZQsPXtC8vqsbEW+Ynpe+Ri+qSDpPArkMWuCylzAidwf9KDsmBc8AvsBqwOQfCoUv4kM5/zqJuF8cVySFjxy7DGTV5PUY9K8p+pwMxncKera8Cs8lH/L2pNZEewi+3FJKPcZ8D/zYLMZBU4/Jd+tS6/BS17zGKLYAJiVvZtBRlb7OkjtRL2NXSVjZFoQUuyQ+tHQ5ONxkW3f7Q4l177Uj3ixK2+5SeOb6k6lXL87WH61+RoBKhnnTCCWSfX2j8NG41uADD8owu/DPL2boWT+mMfBZsYr3eG4abU3QavXJoG9Sc3oznZrDBQe/qYc4/Nm1Vzo3usFyDt2aWiqwEd0JGnSWoBogTDonZqTKWGG0GmigPqbweuiO0sS3MFbXDvP326g38LkYikzRGbMEflNKMLvKxlUye9VBUqic1I+Yjzxn71M45dOgNre+hnn539qjQ8HJPz9HHOK6pfsO5TVRFCPA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(23010399003)(22082099003)(18002099003)(6133799003)(10063799003)(261009223027099003)(11063799006)(56012099006)(5023799004)(261022105027099003)(10067099003)(261028144727099003)(261102123227099003)(261021123027099003)(261026121527099003)(261026140227099003)(261022075727099003)(261021121427099003)(261021135927099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dEZ94AgGuPNRFGaxO5VNYe0bSOTC0FMNFqQCpFERu8IdErC+5gjBYohDgMrRbqgehj1vXFWlYVU8H2XrwyrYHvdHhUL/oTfSXj8o5Nw+zAKu9aFXOyfvna99i0oOWvEN5neVJS6yNQy+Deul+DqNlVumMushqhUU+w27IHKYajcd3DKPsye87X3nHHrO5NZJhs+Rqsj8iCeRPZrYKjQt277zX7iDN6R1F1SmyaefPyBeBDy2TzJGxLcBiSlvkTheYGEEj8qP7K+INTbjAOq6iW6oxkplQU97tGvBzgFsPhJJCuy/+e+SvDLBbzq8telhTZeFlQMNOd/8jEDXyq7UnHgsZ5rOfIIzEmVlyhQzGvq579SyaBaKcJm/pIBtunRJbHR5vLZzFwORzrZiSZ1qsM6pJAJRcTF/pxtXJ4vVctjlgvQdj+1PvzJDzlgesR67
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 18:30:02.6937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a84a4cc2-d686-4669-c582-08df427d4c3d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF00000092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR12MB999177

Introduce an axienet_config structure to abstract MAC-type-specific
operations, preparing the driver for supporting additional MAC types
beyond the existing 1G Ethernet.

Add axienet_config with capability flags (mdio, mac_irq, non_dmaengine,
uc_filter, mc_filter, vlan, jumbo, tx_csum, sw_padding, internal_pcs),
the register-dump count, the MAC option table and callbacks (clk_init,
probe_init, gt_reset, mac_init, mac_link_up, get_regs, phylink_set_caps,
pcs_ops, stats_update), and populate it from the OF match table. Convert
the common code to consult these capabilities and callbacks instead of
open-coding 1G behavior, so a new MAC type can be added without adding
MAC-specific conditionals to the shared paths.

The MDIO teardown in axienet_remove() is now guarded by a NULL check on
lp->mii_bus. This is required by the refactor, because MAC types that do
not provide an MDIO bus (such as the XXV MAC added later in this series)
leave lp->mii_bus NULL. It also hardens the existing 1G path: a failed
axienet_mdio_setup() already left lp->mii_bus NULL while probe only warns
and continues (e.g. a 1G device using a fixed-link), so unbinding such a
device would dereference NULL in mdiobus_unregister(). Apart from this
guard, no functional change is intended for the existing 1G path.

Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
---
 drivers/net/ethernet/xilinx/xilinx_axienet.h  |  56 +++
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 387 ++++++++++++------
 2 files changed, 324 insertions(+), 119 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet.h b/drivers/net/ethernet/xilinx/xilinx_axienet.h
index c63d99686d0b..a87cfa079502 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet.h
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet.h
@@ -547,6 +547,7 @@ struct skbuf_dma_descriptor {
  * @rx_ring_head: RX skb ring buffer head index.
  * @rx_ring_tail: RX skb ring buffer tail index.
  * @rx_submit_lock: Protects RX ring resubmission vs teardown in dmaengine path.
+ * @axienet_config: MAC-type specific configuration and operations.
  */
 struct axienet_local {
 	struct net_device *ndev;
@@ -629,6 +630,61 @@ struct axienet_local {
 	int rx_ring_head;
 	int rx_ring_tail;
 	spinlock_t rx_submit_lock;
+	const struct axienet_config *axienet_config;
+};
+
+/**
+ * struct axienet_config - MAC-type specific configuration and operations
+ * @mdio: MAC has an MDIO bus for external PHY management
+ * @mac_irq: MAC has a dedicated core interrupt
+ * @non_dmaengine: MAC supports the non-dmaengine flow
+ * @uc_filter: MAC has unicast address filter registers
+ * @mc_filter: MAC has multicast address filter registers
+ * @vlan: MAC supports VLAN frames by default
+ * @jumbo: MAC supports jumbo frames
+ * @tx_csum: MAC supports TX checksum offload
+ * @sw_padding: Short frames must be padded in software before transmit
+ * @internal_pcs: MAC has an internal PCS that phylink should poll; when set,
+ *		  the PCS is registered in poll mode at probe
+ * @regs_n: Number of MAC registers exposed through ethtool -d
+ * @options: Table mapping the XAE_OPTION_* flags to the MAC register bits
+ *	     that enable them, terminated by a zero @opt entry
+ * @clk_init: Callback to get and enable the MAC-specific clocks
+ * @probe_init: Callback for MAC-specific probe-time init, or NULL if unused
+ * @gt_reset: Callback to reset the serial transceiver (GT), or NULL if unused
+ * @mac_init: Callback for MAC-specific bring-up after the DMA reset
+ * @mac_link_up: Callback to program link speed and pause on link up, or NULL
+ * @get_regs: Callback to dump the MAC registers for ethtool -d
+ * @phylink_set_caps: Callback to set phylink MAC capabilities
+ * @pcs_ops: phylink PCS operations for this MAC; required when @internal_pcs
+ *	     is set, as the PCS is registered without a further NULL check
+ * @stats_update: Callback to latch/accumulate the periodic MAC counters, or
+ *		  NULL if the MAC has no periodic statistics counters
+ */
+struct axienet_config {
+	bool mdio;
+	bool mac_irq;
+	bool non_dmaengine;
+	bool uc_filter;
+	bool mc_filter;
+	bool vlan;
+	bool jumbo;
+	bool tx_csum;
+	bool sw_padding;
+	bool internal_pcs;
+	unsigned int regs_n;
+	const struct axienet_option *options;
+	int (*clk_init)(struct axienet_local *lp);
+	void (*probe_init)(struct axienet_local *lp);
+	void (*gt_reset)(struct axienet_local *lp);
+	int (*mac_init)(struct net_device *ndev);
+	void (*mac_link_up)(struct net_device *ndev, int speed,
+			    bool tx_pause, bool rx_pause);
+	void (*get_regs)(struct axienet_local *lp, u32 *data);
+	void (*phylink_set_caps)(struct axienet_local *lp,
+				 struct phylink_config *config);
+	const struct phylink_pcs_ops *pcs_ops;
+	void (*stats_update)(struct axienet_local *lp);
 };
 
 /**
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 5b4998e2ca14..83f35effbf37 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -66,18 +66,8 @@
 
 static void axienet_rx_submit_desc(struct net_device *ndev);
 
-/* Match table for of_platform binding */
-static const struct of_device_id axienet_of_match[] = {
-	{ .compatible = "xlnx,axi-ethernet-1.00.a", },
-	{ .compatible = "xlnx,axi-ethernet-1.01.a", },
-	{ .compatible = "xlnx,axi-ethernet-2.01.a", },
-	{},
-};
-
-MODULE_DEVICE_TABLE(of, axienet_of_match);
-
 /* Option table for setting up Axi Ethernet hardware options */
-static struct axienet_option axienet_options[] = {
+static const struct axienet_option axienet_options[] = {
 	/* Turn on jumbo packet support for both Rx and Tx */
 	{
 		.opt = XAE_OPTION_JUMBO,
@@ -470,6 +460,9 @@ static void axienet_set_mac_address(struct net_device *ndev,
 	if (!is_valid_ether_addr(ndev->dev_addr))
 		eth_hw_addr_random(ndev);
 
+	if (!lp->axienet_config->uc_filter)
+		return;
+
 	/* Set up unicast MAC address filter set its mac address */
 	axienet_iow(lp, XAE_UAW0_OFFSET,
 		    (ndev->dev_addr[0]) |
@@ -519,6 +512,9 @@ static void axienet_set_multicast_list(struct net_device *ndev)
 	u32 reg, af0reg, af1reg;
 	struct axienet_local *lp = netdev_priv(ndev);
 
+	if (!lp->axienet_config->mc_filter)
+		return;
+
 	reg = axienet_ior(lp, XAE_FMI_OFFSET);
 	reg &= ~XAE_FMI_PM_MASK;
 	if (ndev->flags & IFF_PROMISC)
@@ -581,14 +577,14 @@ static void axienet_set_multicast_list(struct net_device *ndev)
  * The Axi Ethernet core has multiple features which can be selectively turned
  * on or off. The typical options could be jumbo frame option, basic VLAN
  * option, promiscuous mode option etc. This function is used to set or clear
- * these options in the Axi Ethernet hardware. This is done through
- * axienet_option structure .
+ * these options in the Axi Ethernet hardware. This is done through the
+ * MAC-specific axienet_option table in &struct axienet_config.
  */
 static void axienet_setoptions(struct net_device *ndev, u32 options)
 {
 	int reg;
 	struct axienet_local *lp = netdev_priv(ndev);
-	struct axienet_option *tp = &axienet_options[0];
+	const struct axienet_option *tp = lp->axienet_config->options;
 
 	while (tp->opt) {
 		reg = ((axienet_ior(lp, tp->reg)) & ~(tp->m_or));
@@ -627,14 +623,25 @@ static void axienet_stats_update(struct axienet_local *lp, bool reset)
 	write_seqcount_end(&lp->hw_stats_seqcount);
 }
 
+/**
+ * axienet_1g_stats_update - Refresh 1G MAC hardware statistics
+ * @lp:		Pointer to the axienet_local structure
+ */
+static void axienet_1g_stats_update(struct axienet_local *lp)
+{
+	axienet_stats_update(lp, false);
+}
+
 static void axienet_refresh_stats(struct work_struct *work)
 {
 	struct axienet_local *lp = container_of(work, struct axienet_local,
 						stats_work.work);
 
-	mutex_lock(&lp->stats_lock);
-	axienet_stats_update(lp, false);
-	mutex_unlock(&lp->stats_lock);
+	if (lp->axienet_config->stats_update) {
+		mutex_lock(&lp->stats_lock);
+		lp->axienet_config->stats_update(lp);
+		mutex_unlock(&lp->stats_lock);
+	}
 
 	/* Just less than 2^32 bytes at 2.5 GBit/s */
 	schedule_delayed_work(&lp->stats_work, 13 * HZ);
@@ -745,6 +752,32 @@ static void axienet_dma_stop(struct axienet_local *lp)
 	axienet_unlock_mii(lp);
 }
 
+/**
+ * axienet_1g_mac_init - 1G MAC-specific bring-up after the DMA reset
+ * @ndev:	Pointer to the net_device structure
+ *
+ * Return: 0 on success or a negative error number otherwise.
+ */
+static int axienet_1g_mac_init(struct net_device *ndev)
+{
+	struct axienet_local *lp = netdev_priv(ndev);
+	u32 axienet_status;
+
+	axienet_status = axienet_ior(lp, XAE_RCW1_OFFSET);
+	axienet_status &= ~XAE_RCW1_RX_MASK;
+	axienet_iow(lp, XAE_RCW1_OFFSET, axienet_status);
+
+	axienet_status = axienet_ior(lp, XAE_IP_OFFSET);
+	if (axienet_status & XAE_INT_RXRJECT_MASK)
+		axienet_iow(lp, XAE_IS_OFFSET, XAE_INT_RXRJECT_MASK);
+	axienet_iow(lp, XAE_IE_OFFSET, lp->eth_irq > 0 ?
+		    XAE_INT_RECV_ERROR_MASK : 0);
+
+	axienet_iow(lp, XAE_FCC_OFFSET, XAE_FCC_FCRX_MASK);
+
+	return 0;
+}
+
 /**
  * axienet_device_reset - Reset and initialize the Axi Ethernet hardware.
  * @ndev:	Pointer to the net_device structure
@@ -760,19 +793,23 @@ static void axienet_dma_stop(struct axienet_local *lp)
  */
 static int axienet_device_reset(struct net_device *ndev)
 {
-	u32 axienet_status;
 	struct axienet_local *lp = netdev_priv(ndev);
 	int ret;
 
+	if (lp->axienet_config->gt_reset)
+		lp->axienet_config->gt_reset(lp);
+
 	lp->max_frm_size = XAE_MAX_VLAN_FRAME_SIZE;
-	lp->options |= XAE_OPTION_VLAN;
+
+	if (lp->axienet_config->vlan)
+		lp->options |= XAE_OPTION_VLAN;
 	lp->options &= (~XAE_OPTION_JUMBO);
 
 	if (ndev->mtu > XAE_MTU && ndev->mtu <= XAE_JUMBO_MTU) {
 		lp->max_frm_size = ndev->mtu + VLAN_ETH_HLEN +
 					XAE_TRL_SIZE;
 
-		if (lp->max_frm_size <= lp->rxmem)
+		if (lp->max_frm_size <= lp->rxmem && lp->axienet_config->jumbo)
 			lp->options |= XAE_OPTION_JUMBO;
 	}
 
@@ -789,17 +826,9 @@ static int axienet_device_reset(struct net_device *ndev)
 		}
 	}
 
-	axienet_status = axienet_ior(lp, XAE_RCW1_OFFSET);
-	axienet_status &= ~XAE_RCW1_RX_MASK;
-	axienet_iow(lp, XAE_RCW1_OFFSET, axienet_status);
-
-	axienet_status = axienet_ior(lp, XAE_IP_OFFSET);
-	if (axienet_status & XAE_INT_RXRJECT_MASK)
-		axienet_iow(lp, XAE_IS_OFFSET, XAE_INT_RXRJECT_MASK);
-	axienet_iow(lp, XAE_IE_OFFSET, lp->eth_irq > 0 ?
-		    XAE_INT_RECV_ERROR_MASK : 0);
-
-	axienet_iow(lp, XAE_FCC_OFFSET, XAE_FCC_FCRX_MASK);
+	ret = lp->axienet_config->mac_init(ndev);
+	if (ret)
+		return ret;
 
 	/* Sync default options with HW but leave receiver and
 	 * transmitter disabled.
@@ -967,6 +996,13 @@ axienet_start_xmit_dmaengine(struct sk_buff *skb, struct net_device *ndev)
 	int sg_len;
 	int ret;
 
+	if (lp->axienet_config->sw_padding && eth_skb_pad(skb)) {
+		/* Pad short frames; the MAC does not append Ethernet padding. */
+		ndev->stats.tx_dropped++;
+		ndev->stats.tx_errors++;
+		return NETDEV_TX_OK;
+	}
+
 	dma_dev = lp->tx_chan->device;
 	sg_len = skb_shinfo(skb)->nr_frags + 1;
 	if (CIRC_SPACE(lp->tx_ring_head, lp->tx_ring_tail, TX_BD_NUM_MAX) <= 1) {
@@ -990,19 +1026,21 @@ axienet_start_xmit_dmaengine(struct sk_buff *skb, struct net_device *ndev)
 		goto xmit_error_drop_skb;
 
 	/* Fill up app fields for checksum */
-	if (skb->ip_summed == CHECKSUM_PARTIAL) {
-		if (lp->features & XAE_FEATURE_FULL_TX_CSUM) {
-			/* Tx Full Checksum Offload Enabled */
-			app_metadata[0] |= 2;
-		} else if (lp->features & XAE_FEATURE_PARTIAL_TX_CSUM) {
-			csum_start_off = skb_transport_offset(skb);
-			csum_index_off = csum_start_off + skb->csum_offset;
-			/* Tx Partial Checksum Offload Enabled */
-			app_metadata[0] |= 1;
-			app_metadata[1] = (csum_start_off << 16) | csum_index_off;
+	if (lp->axienet_config->tx_csum) {
+		if (skb->ip_summed == CHECKSUM_PARTIAL) {
+			if (lp->features & XAE_FEATURE_FULL_TX_CSUM) {
+				/* Tx Full Checksum Offload Enabled */
+				app_metadata[0] |= 2;
+			} else if (lp->features & XAE_FEATURE_PARTIAL_TX_CSUM) {
+				csum_start_off = skb_transport_offset(skb);
+				csum_index_off = csum_start_off + skb->csum_offset;
+				/* Tx Partial Checksum Offload Enabled */
+				app_metadata[0] |= 1;
+				app_metadata[1] = (csum_start_off << 16) | csum_index_off;
+			}
+		} else if (skb->ip_summed == CHECKSUM_UNNECESSARY) {
+			app_metadata[0] |= 2; /* Tx Full Checksum Offload Enabled */
 		}
-	} else if (skb->ip_summed == CHECKSUM_UNNECESSARY) {
-		app_metadata[0] |= 2; /* Tx Full Checksum Offload Enabled */
 	}
 
 	dma_tx_desc = dma_dev->device_prep_slave_sg(lp->tx_chan, skbuf_dma->sgl,
@@ -1855,7 +1893,8 @@ static int axienet_stop(struct net_device *ndev)
 	}
 
 	netdev_reset_queue(ndev);
-	axienet_iow(lp, XAE_IE_OFFSET, 0);
+	if (lp->axienet_config->mac_irq)
+		axienet_iow(lp, XAE_IE_OFFSET, 0);
 
 	if (lp->eth_irq > 0)
 		free_irq(lp->eth_irq, ndev);
@@ -2024,30 +2063,18 @@ static void axienet_ethtools_get_drvinfo(struct net_device *ndev,
  */
 static int axienet_ethtools_get_regs_len(struct net_device *ndev)
 {
-	return sizeof(u32) * AXIENET_REGS_N;
+	struct axienet_local *lp = netdev_priv(ndev);
+
+	return sizeof(u32) * lp->axienet_config->regs_n;
 }
 
 /**
- * axienet_ethtools_get_regs - Dump the contents of all registers present
- *			       in AxiEthernet core.
- * @ndev:	Pointer to net_device structure
- * @regs:	Pointer to ethtool_regs structure
- * @ret:	Void pointer used to return the contents of the registers.
- *
- * This implements ethtool command for getting the Axi Ethernet register dump.
- * Issue "ethtool -d ethX" to execute this function.
+ * axienet_1g_get_regs - Dump 1G MAC registers for ethtool
+ * @lp:		Pointer to the axienet_local structure
+ * @data:	Buffer for register values (zeroed and sized by the caller)
  */
-static void axienet_ethtools_get_regs(struct net_device *ndev,
-				      struct ethtool_regs *regs, void *ret)
+static void axienet_1g_get_regs(struct axienet_local *lp, u32 *data)
 {
-	u32 *data = (u32 *)ret;
-	size_t len = sizeof(u32) * AXIENET_REGS_N;
-	struct axienet_local *lp = netdev_priv(ndev);
-
-	regs->version = 0;
-	regs->len = len;
-
-	memset(data, 0, len);
 	data[0] = axienet_ior(lp, XAE_RAF_OFFSET);
 	data[1] = axienet_ior(lp, XAE_TPF_OFFSET);
 	data[2] = axienet_ior(lp, XAE_IFGP_OFFSET);
@@ -2088,6 +2115,31 @@ static void axienet_ethtools_get_regs(struct net_device *ndev,
 	}
 }
 
+/**
+ * axienet_ethtools_get_regs - Dump the contents of all registers present
+ *			       in AxiEthernet core.
+ * @ndev:	Pointer to net_device structure
+ * @regs:	Pointer to ethtool_regs structure
+ * @ret:	Void pointer used to return the contents of the registers.
+ *
+ * This implements ethtool command for getting the Axi Ethernet register dump.
+ * Issue "ethtool -d ethX" to execute this function.
+ */
+static void axienet_ethtools_get_regs(struct net_device *ndev,
+				      struct ethtool_regs *regs, void *ret)
+{
+	struct axienet_local *lp = netdev_priv(ndev);
+	u32 *data = (u32 *)ret;
+	size_t len;
+
+	len = sizeof(u32) * lp->axienet_config->regs_n;
+	regs->version = 0;
+	regs->len = len;
+
+	memset(data, 0, len);
+	lp->axienet_config->get_regs(lp, data);
+}
+
 static void
 axienet_ethtools_get_ringparam(struct net_device *ndev,
 			       struct ethtool_ringparam *ering,
@@ -2724,13 +2776,9 @@ static void axienet_mac_link_down(struct phylink_config *config,
 	/* nothing meaningful to do */
 }
 
-static void axienet_mac_link_up(struct phylink_config *config,
-				struct phy_device *phy,
-				unsigned int mode, phy_interface_t interface,
-				int speed, int duplex,
-				bool tx_pause, bool rx_pause)
+static void axienet_1g_mac_link_up(struct net_device *ndev, int speed,
+				   bool tx_pause, bool rx_pause)
 {
-	struct net_device *ndev = to_net_dev(config->dev);
 	struct axienet_local *lp = netdev_priv(ndev);
 	u32 emmc_reg, fcc_reg;
 
@@ -2767,6 +2815,19 @@ static void axienet_mac_link_up(struct phylink_config *config,
 	axienet_iow(lp, XAE_FCC_OFFSET, fcc_reg);
 }
 
+static void axienet_mac_link_up(struct phylink_config *config,
+				struct phy_device *phy,
+				unsigned int mode, phy_interface_t interface,
+				int speed, int duplex,
+				bool tx_pause, bool rx_pause)
+{
+	struct net_device *ndev = to_net_dev(config->dev);
+	struct axienet_local *lp = netdev_priv(ndev);
+
+	if (lp->axienet_config->mac_link_up)
+		lp->axienet_config->mac_link_up(ndev, speed, tx_pause, rx_pause);
+}
+
 static const struct phylink_mac_ops axienet_phylink_ops = {
 	.mac_select_pcs = axienet_mac_select_pcs,
 	.mac_config = axienet_mac_config,
@@ -2784,7 +2845,6 @@ static const struct phylink_mac_ops axienet_phylink_ops = {
 static void axienet_dma_err_handler(struct work_struct *work)
 {
 	u32 i;
-	u32 axienet_status;
 	struct axidma_bd *cur_p;
 	struct axienet_local *lp = container_of(work, struct axienet_local,
 						dma_err_task);
@@ -2821,16 +2881,10 @@ static void axienet_dma_err_handler(struct work_struct *work)
 
 	axienet_dma_start(lp);
 
-	axienet_status = axienet_ior(lp, XAE_RCW1_OFFSET);
-	axienet_status &= ~XAE_RCW1_RX_MASK;
-	axienet_iow(lp, XAE_RCW1_OFFSET, axienet_status);
-
-	axienet_status = axienet_ior(lp, XAE_IP_OFFSET);
-	if (axienet_status & XAE_INT_RXRJECT_MASK)
-		axienet_iow(lp, XAE_IS_OFFSET, XAE_INT_RXRJECT_MASK);
-	axienet_iow(lp, XAE_IE_OFFSET, lp->eth_irq > 0 ?
-		    XAE_INT_RECV_ERROR_MASK : 0);
-	axienet_iow(lp, XAE_FCC_OFFSET, XAE_FCC_FCRX_MASK);
+	/* This error handler runs only for the non-dmaengine flow (1G MAC),
+	 * whose mac_init() cannot fail, so its return value is not checked.
+	 */
+	lp->axienet_config->mac_init(ndev);
 
 	/* Sync default options with HW but leave receiver and
 	 * transmitter disabled.
@@ -2844,6 +2898,100 @@ static void axienet_dma_err_handler(struct work_struct *work)
 	axienet_setoptions(ndev, lp->options);
 }
 
+/**
+ * axienet_1g_phylink_set_caps - Set 1G phylink capabilities and interfaces
+ * @lp:		Pointer to the axienet_local structure
+ * @config:	Pointer to the phylink_config structure
+ */
+static void axienet_1g_phylink_set_caps(struct axienet_local *lp,
+					struct phylink_config *config)
+{
+	config->mac_capabilities |= MAC_10FD | MAC_100FD | MAC_1000FD;
+	__set_bit(lp->phy_mode, config->supported_interfaces);
+	if (lp->switch_x_sgmii) {
+		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
+			  config->supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_SGMII,
+			  config->supported_interfaces);
+	}
+}
+
+/**
+ * axienet_1g_clk_init - Get and enable the 1G MAC clocks
+ * @lp:		Pointer to the axienet_local structure
+ *
+ * Return: 0 on success or a negative error number otherwise.
+ */
+static int axienet_1g_clk_init(struct axienet_local *lp)
+{
+	struct device *dev = lp->dev;
+	int ret;
+
+	lp->axi_clk = devm_clk_get_optional_enabled(dev, "s_axi_lite_clk");
+	if (!lp->axi_clk) {
+		/* For backward compatibility, if named AXI clock is not
+		 * present, treat the first clock specified as the AXI clock.
+		 */
+		lp->axi_clk = devm_clk_get_optional_enabled(dev, NULL);
+	}
+	if (IS_ERR(lp->axi_clk))
+		return dev_err_probe(dev, PTR_ERR(lp->axi_clk),
+				     "could not get AXI clock\n");
+
+	lp->misc_clks[0].id = "axis_clk";
+	lp->misc_clks[1].id = "ref_clk";
+	lp->misc_clks[2].id = "mgt_clk";
+
+	ret = devm_clk_bulk_get_optional_enable(dev, XAE_NUM_MISC_CLOCKS,
+						lp->misc_clks);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "could not get/enable misc. clocks\n");
+
+	return 0;
+}
+
+/**
+ * axienet_1g_probe_init - 1G MAC-specific probe-time initialization
+ * @lp:		Pointer to the axienet_local structure
+ */
+static void axienet_1g_probe_init(struct axienet_local *lp)
+{
+	if (axienet_ior(lp, XAE_ABILITY_OFFSET) & XAE_ABILITY_STATS)
+		lp->features |= XAE_FEATURE_STATS;
+}
+
+static const struct axienet_config axienet_1g_config = {
+	.mdio = true,
+	.mac_irq = true,
+	.non_dmaengine = true,
+	.uc_filter = true,
+	.mc_filter = true,
+	.vlan = true,
+	.jumbo = true,
+	.tx_csum = true,
+	.regs_n = AXIENET_REGS_N,
+	.options = axienet_options,
+	.clk_init = axienet_1g_clk_init,
+	.probe_init = axienet_1g_probe_init,
+	.mac_init = axienet_1g_mac_init,
+	.mac_link_up = axienet_1g_mac_link_up,
+	.get_regs = axienet_1g_get_regs,
+	.phylink_set_caps = axienet_1g_phylink_set_caps,
+	.pcs_ops = &axienet_pcs_ops,
+	.stats_update = axienet_1g_stats_update,
+};
+
+/* Match table for of_platform binding */
+static const struct of_device_id axienet_of_match[] = {
+	{ .compatible = "xlnx,axi-ethernet-1.00.a", .data = &axienet_1g_config },
+	{ .compatible = "xlnx,axi-ethernet-1.01.a", .data = &axienet_1g_config },
+	{ .compatible = "xlnx,axi-ethernet-2.01.a", .data = &axienet_1g_config },
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, axienet_of_match);
+
 /**
  * axienet_probe - Axi Ethernet probe function.
  * @pdev:	Pointer to platform device structure.
@@ -2894,27 +3042,13 @@ static int axienet_probe(struct platform_device *pdev)
 	seqcount_mutex_init(&lp->hw_stats_seqcount, &lp->stats_lock);
 	INIT_DEFERRABLE_WORK(&lp->stats_work, axienet_refresh_stats);
 
-	lp->axi_clk = devm_clk_get_optional_enabled(&pdev->dev,
-						    "s_axi_lite_clk");
-	if (!lp->axi_clk) {
-		/* For backward compatibility, if named AXI clock is not present,
-		 * treat the first clock specified as the AXI clock.
-		 */
-		lp->axi_clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
-	}
-	if (IS_ERR(lp->axi_clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(lp->axi_clk),
-				     "could not get AXI clock\n");
-
-	lp->misc_clks[0].id = "axis_clk";
-	lp->misc_clks[1].id = "ref_clk";
-	lp->misc_clks[2].id = "mgt_clk";
+	lp->axienet_config = device_get_match_data(&pdev->dev);
+	if (!lp->axienet_config)
+		return -ENODEV;
 
-	ret = devm_clk_bulk_get_optional_enable(&pdev->dev, XAE_NUM_MISC_CLOCKS,
-						lp->misc_clks);
+	ret = lp->axienet_config->clk_init(lp);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret,
-				     "could not get/enable misc. clocks\n");
+		return ret;
 
 	/* Map device registers */
 	lp->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &ethres);
@@ -2925,11 +3059,12 @@ static int axienet_probe(struct platform_device *pdev)
 	/* Setup checksum offload, but default to off if not specified */
 	lp->features = 0;
 
-	if (axienet_ior(lp, XAE_ABILITY_OFFSET) & XAE_ABILITY_STATS)
-		lp->features |= XAE_FEATURE_STATS;
-
+	/* Only honour the TX checksum offload property on MACs whose DMA path
+	 * can complete checksums. Otherwise the stack would hand down partial
+	 * checksums that the hardware never finishes.
+	 */
 	ret = of_property_read_u32(pdev->dev.of_node, "xlnx,txcsum", &value);
-	if (!ret) {
+	if (!ret && lp->axienet_config->tx_csum) {
 		switch (value) {
 		case 1:
 			lp->features |= XAE_FEATURE_PARTIAL_TX_CSUM;
@@ -3005,7 +3140,17 @@ static int axienet_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	if (lp->axienet_config->probe_init)
+		lp->axienet_config->probe_init(lp);
+
 	if (!of_property_present(pdev->dev.of_node, "dmas")) {
+		/* Non-dmaengine mode is only supported by some MACs */
+		if (!lp->axienet_config->non_dmaengine) {
+			dev_err(&pdev->dev,
+				"Non-dmaengine mode not supported by this MAC, use dmaengine\n");
+			return -EINVAL;
+		}
+
 		/* Find the DMA node, map the DMA registers, and decode the DMA IRQs */
 		np = of_parse_phandle(pdev->dev.of_node, "axistream-connected", 0);
 
@@ -3091,7 +3236,10 @@ static int axienet_probe(struct platform_device *pdev)
 		struct xilinx_vdma_config cfg;
 		struct dma_chan *tx_chan;
 
-		lp->eth_irq = platform_get_irq_optional(pdev, 0);
+		if (lp->axienet_config->mac_irq)
+			lp->eth_irq = platform_get_irq_optional(pdev, 0);
+		else
+			lp->eth_irq = -ENXIO;
 		if (lp->eth_irq < 0 && lp->eth_irq != -ENXIO) {
 			return lp->eth_irq;
 		}
@@ -3145,10 +3293,12 @@ static int axienet_probe(struct platform_device *pdev)
 	lp->tx_dma_cr = axienet_calc_cr(lp, XAXIDMA_DFT_TX_THRESHOLD,
 					XAXIDMA_DFT_TX_USEC);
 
-	ret = axienet_mdio_setup(lp);
-	if (ret)
-		dev_warn(&pdev->dev,
-			 "error registering MDIO bus: %d\n", ret);
+	if (lp->axienet_config->mdio) {
+		ret = axienet_mdio_setup(lp);
+		if (ret)
+			dev_warn(&pdev->dev,
+				 "error registering MDIO bus: %d\n", ret);
+	}
 
 	if (lp->phy_mode == PHY_INTERFACE_MODE_SGMII ||
 	    lp->phy_mode == PHY_INTERFACE_MODE_1000BASEX) {
@@ -3172,23 +3322,21 @@ static int axienet_probe(struct platform_device *pdev)
 			goto cleanup_mdio;
 		}
 		of_node_put(np);
-		lp->pcs.ops = &axienet_pcs_ops;
+		lp->pcs.ops = lp->axienet_config->pcs_ops;
+		lp->pcs.poll = true;
+	}
+
+	if (lp->axienet_config->internal_pcs) {
+		lp->pcs.ops = lp->axienet_config->pcs_ops;
 		lp->pcs.poll = true;
 	}
 
 	lp->phylink_config.dev = &ndev->dev;
 	lp->phylink_config.type = PHYLINK_NETDEV;
 	lp->phylink_config.mac_managed_pm = true;
-	lp->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE |
-		MAC_10FD | MAC_100FD | MAC_1000FD;
+	lp->phylink_config.mac_capabilities = MAC_SYM_PAUSE | MAC_ASYM_PAUSE;
 
-	__set_bit(lp->phy_mode, lp->phylink_config.supported_interfaces);
-	if (lp->switch_x_sgmii) {
-		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
-			  lp->phylink_config.supported_interfaces);
-		__set_bit(PHY_INTERFACE_MODE_SGMII,
-			  lp->phylink_config.supported_interfaces);
-	}
+	lp->axienet_config->phylink_set_caps(lp, &lp->phylink_config);
 
 	lp->phylink = phylink_create(&lp->phylink_config, pdev->dev.fwnode,
 				     lp->phy_mode,
@@ -3231,7 +3379,8 @@ static void axienet_remove(struct platform_device *pdev)
 	if (lp->pcs_phy)
 		put_device(&lp->pcs_phy->dev);
 
-	axienet_mdio_teardown(lp);
+	if (lp->mii_bus)
+		axienet_mdio_teardown(lp);
 }
 
 static void axienet_shutdown(struct platform_device *pdev)
-- 
2.25.1

