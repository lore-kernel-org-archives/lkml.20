Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793868895;
	b=CcuaxNdnoB8Vu//BSwWnH1qe3/MNlOP4Yee3IeC4d6aMU9X7f02fxFAXbkIwkyGo4q2L
	 RzYlp8Xgjh3s60sK8XyE25T9gIG4gSXLFjPZwAgGBj7saNUwsr672Di7DcTMMO27WioW2
	 I3wWhATOpbi6PDcF/U6WRzytYGxD6drRh42br2di2WvvHAfYj9FQfvOwmqcDFR/uYj47x
	 mxihNQg6Cicc9FbaD/HScj3rzQbBW5k+P0lVs95oLvGnwBhHZlDsfHeIpPoayDZznou0o
	 EMPYcY2eBKSWpblkP+PwWx3n4o9J+Erd3ElZ04wBCQutf7HinV+q3p5qeEKT9MLWUpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868895;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=++/D0Gom4IWiDmfhCChR+1k10XRXP+Q1IPkhaeDrwCY=;
	b=Ssc0k5ryI/eFlruoG9QbznOYtbGW01gRAHkeHsO+AkRh9RM3JW8ULxU98qTVLKRDqoI/
	 8er70ccVnHypujoJiH22zvQ+IiA4T087mFuUPNfVatuBR5jFtcx4d76W07OgZ7ukQfYfp
	 XQlVyBPOVHOEEBa3Xog3GlkiT8HzKo+rkDC6bj6ogWuqA0bvJZG3ufkaDP9smc342WRDP
	 9tlpRgA5DCsA5D752D4TswANQjblI0OQTWLz2ZMBf2LDO3SqmWrC4BGMqArnJzzcmkqrF
	 /a/q6xMY6PS9WjV7lR06J3ZwpwH96+xuJfuLYzUtikWcW+3/Dv91F9OjOMejypzOXAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ZetGqSg4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.18
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010018.outbound.protection.outlook.com [52.101.201.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A013E606A337;
	Thu,  5 Nov 2026 08:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A013E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ZetGqSg4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytioRoVXbLGDPn/RH/8XDMLyfFbjAebXacOnKDBVL3nxmEMzgqNZlqkx5vjbO1Yp16NB5bxdpeOjwrpBZYssamUF2RZ/rKQmMaM1LNfWgldn9NlxDCenKf3LfLjr8SrKMRut9Dq2F2NdBjShtWAlwmDFxjrAyXP1/2SM1wmg+wjwh9QeJZsaRGYdSsZs9mQbpMkxGYxq3mCzAkQ95W1XnXsi0BKn8CDgxa6Erlf+eGn1CQ7vahV2bAYyzGfw9K1aiy87vSHdspuaseJXVA2Z3ndjza2Ijzwj64AFNVjhCOu2z9buSY6jpoqUtuGVGd8NXG8E+71HHWAxiFyL5fIYJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++/D0Gom4IWiDmfhCChR+1k10XRXP+Q1IPkhaeDrwCY=;
 b=na5LlQU3ZmHMyx+pDEu5CfxSHU2WQxlXwQnnWqIbejsKFGwlAQl6XLo/OvDDOEeqt/vgKedTj9JrLjq1Zd4KqgEgnmhsw9NfQhaypuUuKjtMbE7LOIuPixXsUaqDf3zKurM6198s4GBdWNa4Te34tYjT+c+X8ydG3FXoxjFpo6+tWneNZs5tYpU5bn3SCl6L1YmXcFo6hPTuTpATJK3zzVsoHKdbFJYdgguPid40/v5mYXHYtnG9P2P0lBsJmcb3/iJAzjxH0vLe3wYcRG6f/theCyK3rMcOlThsls9Udh2Wk4eNP4PMRAiWr5SpS6y9CUdvZqgixdbGHLohxBWClw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++/D0Gom4IWiDmfhCChR+1k10XRXP+Q1IPkhaeDrwCY=;
 b=ZetGqSg49SPOuawfp5DsQ7+Kxq7W7KZ0fYV8zGkVkrBg2hgXtrgFPAqrDu1H9alqLhObqqxSQ9bcy7gjopDcSrZx4/K3TfS6tL3/XqBRKgS0uTZPNRyKiz5aQ8HKpr97om9HA/bm15ojqKLAAf7I9n8SASLYMHK6SxyMOXT22Jo=
Received: from SJ0PR13CA0164.namprd13.prod.outlook.com (2603:10b6:a03:2c7::19)
 by CH3PR12MB9079.namprd12.prod.outlook.com (2603:10b6:610:1a1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 08:54:49 +0000
Received: from BY1PEPF000264B3.namprd02.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::6a) by SJ0PR13CA0164.outlook.office365.com
 (2603:10b6:a03:2c7::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Thu, 5
 Nov 2026 08:54:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264B3.mail.protection.outlook.com (10.167.242.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 08:54:48 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 02:54:46 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 5 Nov 2026 02:54:44 -0600
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <meaganlloyd@linux.microsoft.com>,
	<git@amd.com>, Shubham Patil <shubhamsanjay.patil@amd.com>
Subject: [PATCH v2 2/3] i3c: dw: Track the transmit and receive buffer depths separately
Date: Thu, 5 Nov 2026 14:24:24 +0530
Message-ID: <20261105085425.3418230-3-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105085425.3418230-1-shubhamsanjay.patil@amd.com>
References: <20261105085425.3418230-1-shubhamsanjay.patil@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B3:EE_|CH3PR12MB9079:EE_
X-MS-Office365-Filtering-Correlation-Id: 6371f795-852b-47a5-c87d-08df3b1a724a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|261026140227099003|261026121527099003|261022105027099003|261102123227099003|261028144727099003|261021121427099003|261021123027099003|10067099003|11063799006|261009223327099003|261009221727099003|261009221227099003|261009220027099003|261009223027099003|3023799007|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	nnWi43r0cjy002Mk9VdW1gMfr8S/M1CT8non0TlBWDibgLEBYh/5ZwmrOBbYI49vHx2TnqLi7B0vxif12HwzZP+nHKNT4WCdxQVnzxi285DubHYzQVQ/bsjFLXLx4LwBUQkBE+x37GCsEiLVRsZ+6TbOsLdT/vsSod3bR3hcXmDte2paFo2RJ4eDDoQCCadlaxnDUeU4mrYIv4892YGXjRqjgNxeO8EWlsJ/KNpDnvMBoHr5e+W/+I5Rf/Qpg8Y9s4IS0dWf3XqxBTb8M6FwwC0/xO9bq0gggs6EigKM0APInsPw5SnXxYkmWPqnPnIBEtw5DAROozKEwY6cKVgZ2O4uu1IQP95qOh0pK5G/aAYpYdvr8KqOfM4TAf/dXIJ13ukOPFD8PZtMHlzy7c+U+3ebj7bvkwzR/bXXN5Tkrsi7Dg5z17KQ4IFZOEsLtmPikeNgvUistS5hh+WxUc04MXFCH/StZAavZbW3OEJw+N/dKh+J7HuZSXU2udC2ulfN8Fi79V21ALtxW6LdfNkMMJNx2m0gKTQrd6jSdwaSeWXi3xWEj7dhHaLfYlQRXNJdO7bKLdQmEqVDZ6MOAlEHQu3VmmMVGp1iBS3BjLEsY09BHcOWsRgnBbcVdRUJmrExEONJwu0uSWOgIVdhgK/Zwb2FIHaEjWMlwqizgFuFT5lZxsLu2QturahecVcsazxNrh5Y8MaTL/zh/b5aanyi2A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(261026140227099003)(261026121527099003)(261022105027099003)(261102123227099003)(261028144727099003)(261021121427099003)(261021123027099003)(10067099003)(11063799006)(261009223327099003)(261009221727099003)(261009221227099003)(261009220027099003)(261009223027099003)(3023799007)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9BSAmhIn2pJWPSg3MnmqgAEId94NivtcKfVUGmXW5uWoabbS9eofBakM81ytbQziHqxc73bllqNaXBKmO1wCY+bCoXtKVVPwXFEVqDitbNvEBcTCpPVFa518emZkJt77VhUO0lBHjyQD4s0bS5EZAUcE/vh83gBH7XVWSxwLkAjCfn4tx8ciIL0N/dv/faMrbAZY4UwIqeZxmwEflGz3ElG4VAtg6Ve+vR5MfyUB8cR56EMe8zzMUNCaoW9ZsqYWhfGsVmmNiBAt5t6wC83l5sYQJnIssyR/URtFqHyAHX5SPIS9fce06dV5ote8C/Yz+V1T4QGPLgANAWhZjjzPnbU2PMQDjwxDIfs+SZOM9ny/RZ2GFuZV1Tzx5eoP7zrSLcufX2fJy5HBdQZITZ2JaA+1kmEcgBRUlFB68GwT34j7ZNiX8H/3xFT8nBGP5L5R
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 08:54:48.1334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6371f795-852b-47a5-c87d-08df3b1a724a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9079

The driver currently uses the transmit buffer depth to validate both
transmit and receive transfers. Since the transmit and receive buffers
can have different capacities, receive transfers must instead be
validated against the receive buffer depth.

QUEUE_SIZE_CAPABILITY reports the configured size of each buffer. Take
the receive depth from there, leave the transmit and command depths on
the status level registers they already use, and split
caps.datafifodepth into caps.txfifodepth and caps.rxfifodepth so that
each direction is checked against its own buffer.

That register was already defined at the right offset, but under a name
that does not appear in the databook and with no user at all. Rename
EXTENDED_CAPABILITY to QUEUE_SIZE_CAPABILITY and add the field
accessor.

Publish both depths in bytes through base.tx_fifo_bytes and
base.rx_fifo_bytes, so that device drivers can size a transfer this
controller will accept.

Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
---
 drivers/i3c/master/dw-i3c-master.c | 22 ++++++++++++++++------
 drivers/i3c/master/dw-i3c-master.h |  3 ++-
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d1119f203d1b..dd5462b12951 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -203,7 +203,10 @@
 #define BUS_IDLE_TIMING			0xd8
 #define I3C_VER_ID			0xe0
 #define I3C_VER_TYPE			0xe4
-#define EXTENDED_CAPABILITY		0xe8
+#define QUEUE_SIZE_CAPABILITY		0xe8
+#define QUEUE_SIZE_CAPABILITY_RX_BUF(x)	(((x) & GENMASK(7, 4)) >> 4)
+/* Sizes are encoded, 0 meaning 2 DWORDs and every further step doubling it. */
+#define QUEUE_SIZE_TO_DWORDS(x)		(2U << (x))
 #define SLAVE_CONFIG			0xec
 
 #define DYN_ADDR_LO_MASK GENMASK(4, 0)
@@ -978,8 +981,8 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 			ntxwords += DIV_ROUND_UP(i3c_xfers[i].len, 4);
 	}
 
-	if (ntxwords > master->caps.datafifodepth ||
-	    nrxwords > master->caps.datafifodepth)
+	if (ntxwords > master->caps.txfifodepth ||
+	    nrxwords > master->caps.rxfifodepth)
 		return -EOPNOTSUPP;
 
 	struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, i3c_nxfers);
@@ -1136,8 +1139,8 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 			ntxwords += DIV_ROUND_UP(i2c_xfers[i].len, 4);
 	}
 
-	if (ntxwords > master->caps.datafifodepth ||
-	    nrxwords > master->caps.datafifodepth)
+	if (ntxwords > master->caps.txfifodepth ||
+	    nrxwords > master->caps.rxfifodepth)
 		return -EOPNOTSUPP;
 
 	struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, i2c_nxfers);
@@ -1738,7 +1741,14 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	master->caps.cmdfifodepth = QUEUE_STATUS_LEVEL_CMD(ret);
 
 	ret = readl(master->regs + DATA_BUFFER_STATUS_LEVEL);
-	master->caps.datafifodepth = DATA_BUFFER_STATUS_LEVEL_TX(ret);
+	master->caps.txfifodepth = DATA_BUFFER_STATUS_LEVEL_TX(ret);
+
+	ret = readl(master->regs + QUEUE_SIZE_CAPABILITY);
+	master->caps.rxfifodepth =
+		QUEUE_SIZE_TO_DWORDS(QUEUE_SIZE_CAPABILITY_RX_BUF(ret));
+
+	master->base.tx_fifo_bytes = master->caps.txfifodepth * 4;
+	master->base.rx_fifo_bytes = master->caps.rxfifodepth * 4;
 
 	ret = readl(master->regs + DEVICE_ADDR_TABLE_POINTER);
 	master->datstartaddr = ret;
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index f5b4491b247a..e23554bfc5e4 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -14,7 +14,8 @@
 
 struct dw_i3c_master_caps {
 	u8 cmdfifodepth;
-	u8 datafifodepth;
+	u8 txfifodepth;
+	u8 rxfifodepth;
 };
 
 struct dw_i3c_dat_entry {
-- 
2.34.1

