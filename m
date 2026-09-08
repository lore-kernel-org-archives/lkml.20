Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010051.outbound.protection.outlook.com [52.101.193.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7238531B08;
	Tue,  8 Sep 2026 09:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860614; cv=fail; b=fU//Utz8QTDJMXMcPhrKw16MzZDUAbkGYCEZp6i+wAJ9b/oBCuS33Fh5XBG2wS/gwoLslyenCOynz9cB0s63DVnJ+BGbG1vDVSFzTFFfyypezst8w/blreZN+jMPQ22zdVm/rtPOj1mEZ3I2UkcrVl0GBcegYGah+I3gpkwGfWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860614; c=relaxed/simple;
	bh=wWkz9p/HMMWWtQBty786vGBgd8JsWNzJpzJgHzwWRnE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S2NNQTHImtwz2tpiHY63jPV6xb5Rs98eRH0ad7i4UUF8Lvy7M6twMchVPwqlZ1Twk0UaVUARpMHufcuHzWcm5sXiL/UKXWVNPx5uo3XLmc2Q/32SelKCKmZCy/xB8f4lJAgv+r5IJnU6fwUiSJ0V07mCRiYj6rcfYWJYaPCfAMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qou/ZcTV; arc=fail smtp.client-ip=52.101.193.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qou/ZcTV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ds20mwdl2mNcfVsQwO5+NjSj/+W0JHLSU3rQknhGVnHyiok7KsXGyZnX8Qji/wKvdOaDisP4CPn0b3oYwRaf0SSKLb+KlAkzKH7IqBRXFV4g81IUMMUNiGLpf1rX1VkXTomTK3FjlQ0lROMXKU31KWfH/Zyeo5Hh/YulCHQOk78XDSvKWFSeCeTBF0a/mvbFw+7ydP68MyVDivgMMOIM0sYSCY6fgIBi9oYdri0bXpgRXH4PUHGNY8dmrRtGtQs0LPAZOgtPU+GDOH14F1xo3hjF7dO9WDvvo4zlCkE1dT+74C5fO5iEo1Ks2kMWKXzweoxkW9HxmFG2hT/Gy+K6yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sR+JYdUlDRdg8ESq6cYDi2KOjlOXlcyrXuQK9IDCNXg=;
 b=N0ZLgsLQPsm8NPo4u9YoG4WPc3QePBpMCkaLssBAJFXdsSe0+fiPv/VysipZE5CnzJHOn3N+txNiccS163xr6qwK3pb3dZZ+30ATb6MxNNXAypBeelETrXqGjoi2rRFRpaMECpi6+elGj03r8HQUavCNLFoEjPChYQGnMsXGoq3+tqpYVSsuZ5H5c+PSVm+qpTo1dQU0pdwsL8Wu66l8HvQEchSTuXirHPR0ArFzRc9+1YPQs83HL/DXAHmYyM8QVlQfdwkT/THZkFCXp2KoNH1CQzewEiL/WDBMd+Axp0wgJqKYumfscO02gS7lxttRBhb69a6xslVfjM0cSkFB9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sR+JYdUlDRdg8ESq6cYDi2KOjlOXlcyrXuQK9IDCNXg=;
 b=qou/ZcTVxBq7qWT9et4LCEymZ3vcWtnW90/379BDjyEqVgHvSSDfOHj+SP8BKjDniwBmK5Qx8zqyCJ/l50EwDNOieFGuamo1NqbXtOQ4P242NlIBns/U4dDUldNNWhaxcVUDcHEwfNHMPOIuAnuOBPNAiC3BWPsG2ZWNRlBdQDA=
Received: from SJ0P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::34)
 by BL1PR12MB5996.namprd12.prod.outlook.com (2603:10b6:208:39c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 09:43:27 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::3c) by SJ0P220CA0003.outlook.office365.com
 (2603:10b6:a03:41b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 09:43:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 09:43:25 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 04:43:20 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 04:43:19 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 8 Sep 2026 04:43:16 -0500
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Shubham Patil
	<shubhamsanjay.patil@amd.com>
Subject: [PATCH v3 3/3] i3c: master: amd: Add hot-join support
Date: Tue, 8 Sep 2026 15:12:57 +0530
Message-ID: <20260908094257.3196120-4-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908094257.3196120-1-shubhamsanjay.patil@amd.com>
References: <20260908094257.3196120-1-shubhamsanjay.patil@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|BL1PR12MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c39f5d5-a955-4af2-6ab4-08df0d8da0fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|3023799007|5023799004|11063799006|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	am3VxkYu3J4G1jAuuWXDuP6e4Ia/OXiKAxhiynaM0BLK2E6L2UWUOZXAbHwxMReMPiA7kXt9GLkPUG4MB81EnFlu76G6h0J0dXyEgv3rWMbVFcOIEp98qiMe7Kdpgb6L5c/OeaAafD63kc7Sw0/tJ+uB9y/xjC5TQA30F0oIFIzqKaYowc+WDugSzBCx/wotqoHreB9TT2ICfS+kGP6GWo6MO8fxXCz8hodnkkZbwJl1XTLiRDzv4BohiIEda9bG2HXZFsNKzjv5Rhy8puSVoEWCq9mCGphNS6Z++DdNSD0H06JikU7odv/n8xMuOrNvaAJ06EHCYpSnbpbeo2ZpHGgESJ/lu5aOH6CH9mOBsc5fYgltWZNst998EBsw4tlU4Y+B9hG9Qv9sLuRWzhCaBUHSt6XZylywQEPX82ZTnVUXeZQEjG5E1/0ULmvjw3KYQGgmrT+RiljCRLkldKJ4hWVKCsVNJlK7Vpn575QgcY3tTSJ8QA/WH4lWck0isNBg/qOwY3CYRLDTk5vxMqa/3Pc3ZlkwCNC1Q/QEffGbCVX1d6Ik4yFWpGdra7jPuQnAQelbHCCxghASer14TXodq0eiYk5Cq6Xxe2nwed9ZPS9gKpOoPQ7TjPzBO7wAsVg/i2VhSKQIm2/gEwSCTzPXl9d3m2VAGVpnA1FuPBh4OCGhSavmYdJtw6/ypAOPoBzdX3CB5w+Nc74bPYBMJ7dXRQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(3023799007)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XZDyScyfn8c8Yp9Z2nwv9Sw8EjElMnlo+IPyND5xkkWCXo8c9ngrLv5Blzhe4dYIHmQfptCMsWC7ob7eHYxg4puXY1g0VW7ux6OV2C1WoDQNrsIa+6ajCAtuux3xRZEAdfDlI3iIf5O6AX9sRqeAPd2Vj1egwM1ODFQLYhvKPFPTry7DkD2gnlWOYyhq7h0guX5wpe6L63Nzu9aw1UQ/L5y+E6vim0O82NjDy3KaXDXhJdjLT1u2EWdwTDZoOdKD7DPKCDgKADYlCnfilhfOBDIFQIeQTNwNy8tvX9IvbLtwHNdTbNRIc2M65t8PZWNr39GP6OhH+x18fyr/D+8eOjAnWLqzSwz1acUrnyWVbdjNbdRsutja9qlqlGrMIJqXFM3iq9Q9LlXxK6hUe8VE3li3uT3129BRtCElf34R8sM6q8NDuY4S+QzVUuykyFl2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 09:43:25.0978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c39f5d5-a955-4af2-6ab4-08df0d8da0fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5996

Add hot-join support for the AMD AXI I3C master controller.
By default, the hot-join acknowledgment is disabled. Users can use the
sysfs entry to enable it. A hot-join event is handed to the i3c core
with i3c_master_queue_hotjoin(), which runs DAA from the core workqueue
so the new device is enumerated.

Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
---
Changes in V3:
- Probe "hot-join-capable" instead of the xlnx, property.
- Update the commit description accordingly.

Changes in V2:
- Use the core's i3c_master_queue_hotjoin() instead of a private work
  item, and only queue when hj_capable is set; the core owns the work
  and cancels it on unregister.
- Update the commit description accordingly.
---
 drivers/i3c/master/amd-i3c-master.c | 67 +++++++++++++++++++++++++----
 1 file changed, 58 insertions(+), 9 deletions(-)

diff --git a/drivers/i3c/master/amd-i3c-master.c b/drivers/i3c/master/amd-i3c-master.c
index 8a8ab3cd2fa40..6214fef14081f 100644
--- a/drivers/i3c/master/amd-i3c-master.c
+++ b/drivers/i3c/master/amd-i3c-master.c
@@ -55,9 +55,11 @@
 #define XI3C_CR_EN_MASK				BIT(0)	/* Core Enable */
 #define XI3C_CR_RESUME_MASK			BIT(2)	/* Core Resume */
 #define XI3C_CR_IBI_MASK			BIT(3)	/* IBI ACK enable */
+#define XI3C_CR_HJ_MASK				BIT(4)	/* Hot-Join ACK enable */
 #define XI3C_SR_RESP_NOT_EMPTY_MASK		BIT(4)	/* Resp Fifo not empty status mask */
 #define XI3C_RD_FIFO_NOT_EMPTY_MASK		BIT(15)	/* Read Fifo not empty status mask */
 #define XI3C_INTR_IBI_MASK			BIT(7)	/* IBI event (INTR status/enable) */
+#define XI3C_INTR_HJ_MASK			BIT(8)	/* Hot-Join event */
 
 #define XI3C_BCR_MASK				GENMASK(23, 16)
 #define XI3C_DCR_MASK				GENMASK(31, 24)
@@ -190,12 +192,15 @@ struct xi3c_xfer {
  * @xfer_resp_valid: True once the in-flight transfer's own response word has
  *		     been taken from the shared response FIFO. Guarded by @lock.
  * @ibi_capable: True when the IP was synthesized with In-Band Interrupt
- *		 support ("in-band-interrupt-capable"); also the
- *		 condition for the controller interrupt being present.
+ *		 support ("in-band-interrupt-capable"). Since Hot-Join
+ *		 requests are ACKed by the IBI machinery, this is also the
+ *		 condition for the controller interrupt being present at all.
+ * @hj_capable: True when the IP was synthesized with Hot-Join support
+ *		("hot-join-capable"); implies @ibi_capable.
  * @xfer_resp: Response word claimed for the transfer in flight; valid while
  *	       @xfer_resp_valid is set. Guarded by @lock.
- * @irq: Controller interrupt line, used for IBI events. Only valid when
- *	 @ibi_capable is set.
+ * @irq: Controller interrupt line, used for IBI/Hot-Join events. Only valid
+ *	 when @ibi_capable is set.
  * @ops: Controller ops handed to the framework, assembled at probe time from
  *	 the base ops plus the callbacks the design actually supports.
  * @ibi: In-Band Interrupt slot tracking.
@@ -222,6 +227,7 @@ struct xi3c_master {
 	} daa;
 	bool xfer_resp_valid;
 	bool ibi_capable;
+	bool hj_capable;
 	u32 xfer_resp;
 	int irq;
 	struct i3c_master_controller_ops ops;
@@ -1244,13 +1250,14 @@ static void xi3c_master_bus_cleanup(struct i3c_master_controller *m)
 	struct xi3c_master *master = to_xi3c_master(m);
 
 	/*
-	 * Disarm all interrupt sources and the IBI ACK so the controller can't
-	 * assert once disabled; reset the refcount that tracks them.
+	 * Disarm the interrupts and the IBI/Hot-Join ACKs so nothing is left
+	 * armed for a later bus_init(); reset the refcount that tracks them.
 	 */
 	scoped_guard(spinlock_irqsave, &master->reg_lock) {
 		iowrite32(0, master->membase + XI3C_INTR_RE_OFFSET);
 		iowrite32(ioread32(master->membase + XI3C_CR_OFFSET) &
-			  ~XI3C_CR_IBI_MASK, master->membase + XI3C_CR_OFFSET);
+			  ~(XI3C_CR_IBI_MASK | XI3C_CR_HJ_MASK),
+			  master->membase + XI3C_CR_OFFSET);
 		master->ibi.enabled_count = 0;
 	}
 
@@ -1552,6 +1559,32 @@ static void xi3c_master_process_ibi(struct xi3c_master *master, u32 resp, u8 da)
 	xi3c_master_drain_ibi_fifo(master, len);
 }
 
+static int xi3c_master_enable_hotjoin(struct i3c_master_controller *m)
+{
+	struct xi3c_master *master = to_xi3c_master(m);
+
+	guard(spinlock_irqsave)(&master->reg_lock);
+	iowrite32(ioread32(master->membase + XI3C_CR_OFFSET) | XI3C_CR_HJ_MASK,
+		  master->membase + XI3C_CR_OFFSET);
+	iowrite32(ioread32(master->membase + XI3C_INTR_RE_OFFSET) |
+		  XI3C_INTR_HJ_MASK, master->membase + XI3C_INTR_RE_OFFSET);
+
+	return 0;
+}
+
+static int xi3c_master_disable_hotjoin(struct i3c_master_controller *m)
+{
+	struct xi3c_master *master = to_xi3c_master(m);
+
+	guard(spinlock_irqsave)(&master->reg_lock);
+	iowrite32(ioread32(master->membase + XI3C_INTR_RE_OFFSET) &
+		  ~XI3C_INTR_HJ_MASK, master->membase + XI3C_INTR_RE_OFFSET);
+	iowrite32(ioread32(master->membase + XI3C_CR_OFFSET) & ~XI3C_CR_HJ_MASK,
+		  master->membase + XI3C_CR_OFFSET);
+
+	return 0;
+}
+
 static irqreturn_t xi3c_master_irq_handler(int irq, void *dev_id)
 {
 	struct xi3c_master *master = dev_id;
@@ -1572,6 +1605,9 @@ static irqreturn_t xi3c_master_irq_handler(int irq, void *dev_id)
 			xi3c_master_handle_ibi(master);
 	}
 
+	if (master->hj_capable && (status & XI3C_INTR_HJ_MASK))
+		i3c_master_queue_hotjoin(&master->base);
+
 	return IRQ_HANDLED;
 }
 
@@ -1592,6 +1628,11 @@ static void xi3c_master_init_ibi_ops(struct xi3c_master *master)
 	master->ops.enable_ibi = xi3c_master_enable_ibi;
 	master->ops.disable_ibi = xi3c_master_disable_ibi;
 	master->ops.recycle_ibi_slot = xi3c_master_recycle_ibi_slot;
+
+	if (master->hj_capable) {
+		master->ops.enable_hotjoin = xi3c_master_enable_hotjoin;
+		master->ops.disable_hotjoin = xi3c_master_disable_hotjoin;
+	}
 }
 
 static int xi3c_master_probe(struct platform_device *pdev)
@@ -1627,10 +1668,18 @@ static int xi3c_master_probe(struct platform_device *pdev)
 	master->ibi_capable =
 		device_property_read_bool(master->dev,
 					  "in-band-interrupt-capable");
+	master->hj_capable =
+		device_property_read_bool(master->dev,
+					  "hot-join-capable");
+
+	/* Hot-Join requests are ACKed by the IBI machinery. */
+	if (master->hj_capable && !master->ibi_capable)
+		return dev_err_probe(master->dev, -EINVAL,
+				     "hot-join-capable requires in-band-interrupt-capable\n");
 
 	/*
-	 * The interrupt only carries IBI events, so it is only described for
-	 * designs synthesized with that feature.
+	 * The interrupt only carries IBI and Hot-Join events, so it is only
+	 * described for designs synthesized with those features.
 	 */
 	if (master->ibi_capable) {
 		xi3c_master_init_ibi_ops(master);
-- 
2.34.1

