Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011018.outbound.protection.outlook.com [40.93.194.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA114F55C0;
	Tue,  8 Sep 2026 10:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788863258; cv=fail; b=e5u0HoQT/E2SndLjeAklmwRYhq06WBcEWsyFmzOpbEOpZRuM15f9WwUeQ8Vo8KD+kFxwimvYOP9sus2ybFBANsKMoJXjiasIqmJllUV6gFPvUtw4dh+6743KO+75omqyiXbvQlCc4k7Gq8xq/voRKuhtTBYvQ/UHWwGBBcgCma4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788863258; c=relaxed/simple;
	bh=o6rxzlyWotmYUbGiHxOsX4Jl0s8xYxeXbHRjo/E+Ypc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A4A7A5tiL1FlXFIGXTYoZLhH1eJtxuzYSeNURC7G28+VkMPyEU0J+5NZcf4XJlDGI8ALGj2HotYoSjpcP8YcPWOki8efdkX4CRiEYSS01t6KgPkK0uga6Tp/E6B+2mozKTP60ATUjF99VjAUpOmza7Cya9z5vGSW+xvp6aAzCNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vVrpITeo; arc=fail smtp.client-ip=40.93.194.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vVrpITeo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+JGB3KBFmPOYP3lEZagA/Jwhs+i0d3DJRKgIZkvm2m+Ayc0LQ/jIY1B2MIcLF3wCh1+8DD/XTDOJQbRVtDm6hPreD4Sjf4k7DLDbI2qtkLFAv+fjKXh/bzoPYoJN6FFfPnoatFzflVxyyUnG2O+DpXluDVqmd7IHP7mHRJLYmTUEh87ONisBxcyg52gl9biJ+KnI0rDPTw3iQSqHHExozfhc/vOBL/+omYjxaFbW130i5OZgdWh/Mf6JQySepOht3rkSitXNHg5dK3LqCqvrTBjff0n5XCQLJMB7jbuOqPVHAGByyx4cgraQRtAUaALYfcQov3pR9zCT2UYq3t4xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/+y8hPf1Di9UD5w20r/uk56lBkqoDg+7UQEDTfy/ro=;
 b=QzVBR9l3RpDKGnYs7pMr4ckXtu70FQkOOVpCHkPsn6iRwx+iI1fWWC5WHffmqgLv/HIP2R/QWSoIAIN2+P39SdwlQ8BIH5cqM7iwvSZlgPodvAl7jxs26FYCBfLPVlx7po0l09oHagHr30OkG+olH7XZubdFJMpVi7zCEH8JPI8+WbsbPTcfp7xYoiwUEG6HCIbgSQk0Yquybnq8NXqXezW5m7lHyfTpHtkMYQdA4arEmO0Kp3Z84c5lTVeDZVAC4gJKm2XCmNG2iSf+rysQxGoKK2TV81ZiXh3ZI+RLdCLnd/mOgdnb4hKtrJNiazlIxsr8udnG6WAmRKeFmsSqCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/+y8hPf1Di9UD5w20r/uk56lBkqoDg+7UQEDTfy/ro=;
 b=vVrpITeowzjPGVfbhJIWldBwLdvT6+8bacUz0a/CfA2XEZXlwM+ligKsRXr5+mQZ2YZKPumDAEIIRPtDi4ZlnX1VEfvlLV8bKmwALJYO49mEulqCK//L5tNMKm11uWJjqv8lw3FRoX488vuaByGKLd/8v2eWr9wmVDma3H6ScMs=
Received: from CH0PR13CA0060.namprd13.prod.outlook.com (2603:10b6:610:b2::35)
 by SJ0PR12MB7476.namprd12.prod.outlook.com (2603:10b6:a03:48d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 10:27:32 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::89) by CH0PR13CA0060.outlook.office365.com
 (2603:10b6:610:b2::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Tue, 8
 Sep 2026 10:27:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 10:27:30 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 05:27:29 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 8 Sep 2026 05:27:27 -0500
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <meaganlloyd@linux.microsoft.com>,
	<git@amd.com>, Shubham Patil <shubhamsanjay.patil@amd.com>
Subject: [PATCH] i3c: master: dw: Clamp GETMRL/GETMWL to controller FIFO limits
Date: Tue, 8 Sep 2026 15:57:24 +0530
Message-ID: <20260908102724.3232660-1-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|SJ0PR12MB7476:EE_
X-MS-Office365-Filtering-Correlation-Id: a8724bcb-abb2-42d4-d790-08df0d93c9e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|18002099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	h7UHRflTAhVWE5bv4G0mctc3VB/TFefoJ4sqJAUgQdDJul6oNO0krjSm1l4kW3vONJ1xwDKveSpUDxyFpPd5LPYIc23iniTbsh0Xo/sQIAztBnh927oieToTZKvuX73GVQbLkpm1rdfalWs8MeR0Isof+6Lg8zEcjgla94Z1+ZeHmQEM5cJoZjOyfc4odXGPkh8G33TExOLOK43qbfBvzlMoQe6//2TC/r9pmZBaXFktrLNUYOxjWmQltt9ahj8GC2+ridGTkR6GrJcVKFTFeFCfbAHHoERl5pYFtk9BqdYXhErZDce/5JfBpr1AlUlI9MWGMO9qk2jCz3GO17mK4bSGaezpGL9QRy77KcXZap0P2qCP3qO95zuX+gMiaEw6P+4JxS1fvbStSqSZTQtNkxo6ktgsg9/YKKqqLGBH7pNzEt8WuBNLGFMqfJ166NpKAXq2Z3XZPrN16mrPk43o8y2zSyvzYJissaESiUNwedDHUaK4LF+xrEl98P3x5vaMbFcpI7TSXZRVcB51w0FEAPfGX0Cz1Wq50pvhFDIpQF6nHW0sNglOEAVilOK5U8gOzDfx/0gjdOtyLyEX9mFbqpwc2PfgVyu9GaCPOA9N0/eTM3ElvxOriCwbKic3w4F43FrOO9SH9nGXna6cZQGklwdhXs0D6Mr1qxdukeucV639oke1K2EMxXehchxmkF1PPSkXpNNDmwxo18yYfvPmIA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	235ZB+qMOZGAO+VPg+YfsZUkW5cGfdeIvU+xh4K56BgYXknGU8WEX8ukBb1cIn9h3O6E/q91uf9vevQMeZLqMTffWzvyBioyDlxH5Z93h0FPXhtdY48hLxylmYrf7sdfVhW6gM+vR7uIWdl2PQRnreocVuuJOwR+hykZ3Bt/vUbUTsyPSvNtBKTV/FTJtYM7EhFKJHEhjYFnWDiquH33KgdL7rpBQt5G4k+gkKfoHcxyxukQ0TgDhhaJssi8/q+PGRRS4aZ5rj5+Jz+ldtf6fBfLAr8y7ANgHULFR42LBuDEtkAJTOfeiLCt91N/SWkH1t1zRYx5Sw8saCFSl70XfvJQ0jQXt3v9p5XRmCtbI42wV9VwY8kP21BKXQFXTdELRYA561eoswJbcQNnCkEKtaxdFZLFS9NzBXGcvX07PrE2pvx6tQ+5DFK5J9dRLKZB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 10:27:30.8190
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8724bcb-abb2-42d4-d790-08df0d93c9e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7476

The DW master rejects private SDR transfers larger than
caps.datafifodepth with -EOPNOTSUPP. Targets often report MRL/MWL
values larger than that FIFO, so the core stores limits the controller
cannot meet.

After a successful GETMRL/GETMWL, issue Direct SETMRL/SETMWL to the
same target with lengths capped to the data FIFO (in bytes), then
rewrite the GET payload so the core keeps the same values. Only update
the GET buffer once SET is acked, so a failed SET does not leave the
core and the target disagreeing.

GETMRL is variable length: the optional third byte is max IBI payload
and is only present if the target returned it. Clamp that IBI byte to
the IBI queue depth from QUEUE_SIZE_CAPABILITY.IBI_BUF_SIZE (bits 19:16
at 0xe8, encoded as 2^(n+1) dwords).

Rename the unused EXTENDED_CAPABILITY macro at 0xe8 to the databook
name QUEUE_SIZE_CAPABILITY.

Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
---
 drivers/i3c/master/dw-i3c-master.c | 149 ++++++++++++++++++++++++++++-
 drivers/i3c/master/dw-i3c-master.h |   1 +
 2 files changed, 149 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 4563d8761ba0..51defcb57761 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -203,7 +203,13 @@
 #define BUS_IDLE_TIMING			0xd8
 #define I3C_VER_ID			0xe0
 #define I3C_VER_TYPE			0xe4
-#define EXTENDED_CAPABILITY		0xe8
+#define QUEUE_SIZE_CAPABILITY		0xe8
+#define QUEUE_SIZE_CAPABILITY_IBI_BUF(x)	(((x) & GENMASK(19, 16)) >> 16)
+/*
+ * IBI_BUF_SIZE is encoded as 2^(field + 1) dwords: the smallest buffer is
+ * 2 dwords and each increment of the field doubles the depth.
+ */
+#define QUEUE_SIZE_IBI_BUF_MIN_DWORDS	2
 #define SLAVE_CONFIG			0xec
 
 #define DYN_ADDR_LO_MASK GENMASK(4, 0)
@@ -844,6 +850,130 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
 	return ret;
 }
 
+/*
+ * Cap the limits a target reported through GETMRL to what this controller can
+ * actually transfer, so the core never asks for a private read the data FIFO
+ * cannot hold. The optional IBI payload byte is capped to the IBI queue depth
+ * instead; since that byte is a u8, the IBI cap only ever applies to
+ * controllers whose IBI queue is smaller than 255 bytes.
+ *
+ * Direct SETMRL is optional, so a target may implement GETMRL and NACK the SET.
+ * Clamp the values handed back to the core either way: a failed SET only means
+ * the target keeps its own larger limit, which is harmless as long as the core
+ * stays within ours.
+ */
+static int dw_i3c_master_clamp_mrl(struct dw_i3c_master *master,
+				   struct i3c_ccc_cmd *ccc)
+{
+	u16 max_fifo_bytes = master->caps.datafifodepth * sizeof(u32);
+	u32 max_ibi_bytes = master->caps.ibififodepth * sizeof(u32);
+	u16 actual_len = ccc->dests[0].payload.actual_len;
+	struct i3c_ccc_cmd_dest set_dest = { };
+	struct i3c_ccc_cmd set_cmd = { };
+	struct i3c_ccc_mrl set_mrl;
+	struct i3c_ccc_mrl *mrl;
+	bool clamp_ibi = false;
+	bool clamp_read;
+	u8 ibi_len = 0;
+	u16 read_len;
+	int ret;
+
+	/* Need at least the 2-byte max read length field to act on. */
+	if (actual_len < 2)
+		return 0;
+
+	mrl = ccc->dests[0].payload.data;
+	read_len = be16_to_cpu(mrl->read_len);
+	clamp_read = read_len > max_fifo_bytes;
+
+	/* Optional third byte is valid only if the target returned it. */
+	if (actual_len > 2) {
+		ibi_len = mrl->ibi_len;
+		clamp_ibi = max_ibi_bytes && ibi_len > max_ibi_bytes;
+	}
+
+	if (!clamp_read && !clamp_ibi)
+		return 0;
+
+	set_mrl.read_len = cpu_to_be16(clamp_read ? max_fifo_bytes : read_len);
+	if (actual_len > 2)
+		set_mrl.ibi_len = clamp_ibi ? max_ibi_bytes : ibi_len;
+
+	set_dest.addr = ccc->dests[0].addr;
+	set_dest.payload.data = &set_mrl;
+	set_dest.payload.len = actual_len;
+
+	set_cmd.rnw = 0;
+	set_cmd.id = I3C_CCC_SETMRL(false);
+	set_cmd.ndests = 1;
+	set_cmd.dests = &set_dest;
+
+	ret = dw_i3c_ccc_set(master, &set_cmd);
+	if (ret)
+		dev_dbg(&master->base.dev,
+			"SETMRL not accepted by target: %d\n", ret);
+
+	if (clamp_read) {
+		mrl->read_len = cpu_to_be16(max_fifo_bytes);
+		dev_dbg(&master->base.dev,
+			"clamped target MRL from %u to %u bytes (FIFO depth limit)\n",
+			read_len, max_fifo_bytes);
+	}
+	if (clamp_ibi) {
+		mrl->ibi_len = max_ibi_bytes;
+		dev_dbg(&master->base.dev,
+			"clamped target IBI len from %u to %u bytes (IBI buffer limit)\n",
+			ibi_len, max_ibi_bytes);
+	}
+
+	return 0;
+}
+
+/* Same contract as dw_i3c_master_clamp_mrl(), for the write direction. */
+static int dw_i3c_master_clamp_mwl(struct dw_i3c_master *master,
+				   struct i3c_ccc_cmd *ccc)
+{
+	u16 max_fifo_bytes = master->caps.datafifodepth * sizeof(u32);
+	struct i3c_ccc_cmd_dest set_dest = { };
+	struct i3c_ccc_cmd set_cmd = { };
+	struct i3c_ccc_mwl set_mwl;
+	struct i3c_ccc_mwl *mwl;
+	u16 write_len;
+	int ret;
+
+	if (ccc->dests[0].payload.actual_len < 2)
+		return 0;
+
+	mwl = ccc->dests[0].payload.data;
+	write_len = be16_to_cpu(mwl->len);
+
+	if (write_len <= max_fifo_bytes)
+		return 0;
+
+	set_mwl.len = cpu_to_be16(max_fifo_bytes);
+
+	set_dest.addr = ccc->dests[0].addr;
+	set_dest.payload.data = &set_mwl;
+	set_dest.payload.len = sizeof(set_mwl);
+
+	set_cmd.rnw = 0;
+	set_cmd.id = I3C_CCC_SETMWL(false);
+	set_cmd.ndests = 1;
+	set_cmd.dests = &set_dest;
+
+	ret = dw_i3c_ccc_set(master, &set_cmd);
+	if (ret)
+		dev_dbg(&master->base.dev,
+			"SETMWL not accepted by target: %d\n", ret);
+
+	mwl->len = cpu_to_be16(max_fifo_bytes);
+	dev_dbg(&master->base.dev,
+		"clamped target MWL from %u to %u bytes (FIFO depth limit)\n",
+		write_len, max_fifo_bytes);
+
+	return 0;
+}
+
 static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
 				      struct i3c_ccc_cmd *ccc)
 {
@@ -866,6 +996,18 @@ static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
 	else
 		ret = dw_i3c_ccc_set(master, ccc);
 
+	/*
+	 * Clamp GETMRL/GETMWL responses to the data FIFO depth, and the
+	 * optional GETMRL IBI byte to the IBI queue depth. The GET itself has
+	 * already succeeded, so its result is never overridden here.
+	 */
+	if (!ret && ccc->rnw) {
+		if (ccc->id == I3C_CCC_GETMRL)
+			dw_i3c_master_clamp_mrl(master, ccc);
+		else if (ccc->id == I3C_CCC_GETMWL)
+			dw_i3c_master_clamp_mwl(master, ccc);
+	}
+
 	pm_runtime_put_autosuspend(master->dev);
 	return ret;
 }
@@ -1728,6 +1870,11 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	ret = readl(master->regs + DATA_BUFFER_STATUS_LEVEL);
 	master->caps.datafifodepth = DATA_BUFFER_STATUS_LEVEL_TX(ret);
 
+	/* Read the IBI data buffer size advertised by the controller. */
+	ret = readl(master->regs + QUEUE_SIZE_CAPABILITY);
+	master->caps.ibififodepth = QUEUE_SIZE_IBI_BUF_MIN_DWORDS <<
+				    QUEUE_SIZE_CAPABILITY_IBI_BUF(ret);
+
 	ret = readl(master->regs + DEVICE_ADDR_TABLE_POINTER);
 	master->datstartaddr = ret;
 	master->maxdevs = ret >> 16;
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index 17ad817d1f8e..54c3912374c8 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -15,6 +15,7 @@
 struct dw_i3c_master_caps {
 	u8 cmdfifodepth;
 	u8 datafifodepth;
+	u32 ibififodepth;
 };
 
 struct dw_i3c_dat_entry {
-- 
2.34.1

