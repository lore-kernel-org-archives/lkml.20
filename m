Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012058.outbound.protection.outlook.com [52.101.48.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738283DAAD5;
	Wed,  9 Sep 2026 07:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938052; cv=fail; b=o4XLdRWbQZU9dpn0SThGGTWAgE4YmJY9pnAGzhqF/yOL0tTuTgsBcoJkCSTXbthRE2CmJJeB1nt3Q1nyOnqT3Uf1vug57FULa3hHHGSLd51CTeJO4UZ1nWrxDUwfg6ZxcnTLuUTEVnZbjizK4q8xmJebHu+SCzmyYmdUbT6bAw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938052; c=relaxed/simple;
	bh=bDoZOjMS/8tClhHRAgyGIFd3Cn83r7IkoMI5WvnmH/c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ppbKLgMGoUuFgLFgwbwvknIiee0QM4GQjihcz/RKlbqaqQOzCI6JVo0+WJ1vFJ+wP7IvchoOtP09h3sKSgKsw3sOkseIQRMk7gj12fbDqEhQRwoRaZxFoyzgCftDJgwyi+BkLHKCwpTUqk/7tR0NVhyl58b8QCbCoWUFFEF7zEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Eg3YWkIP; arc=fail smtp.client-ip=52.101.48.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Eg3YWkIP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jVhbksEgagi+jSQ0MiSQZ7KNAoEgJDO+9iPQjRkYc7V12gfn6QanXwVxyT6/6TqfnbSo+0cOpBXsV38Pn583zh8aOaLnVY1xf1d2v/xOxszt4jZ7svx/GbeYcACUSOpWfePAUG37ELnsc1ufRHB6Ea09VUZkC2m/cqswMrcpGW1+5fdpqHk+jPUm1i1GD+E2gXLFVOQAeOr47kuObOalWI7MOBvAPe5G6q+Wrurd2rwS8ZnaH51styQffxIMgec6FikXgkjfQ3mnmDLbLclqNyGmp6n8DYnaBhgQXeYzVtmSp66XG25r4ct4C2iqRQ4bIiIHy/BgFics1m26RnRiVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pNPzaM24FVvhUbiwQRA8cpUKg8KuDopP40un+fZWYqM=;
 b=XmM1HR+TfnKaLnFEZv/BaKablLX8duULmVnNxrybc+6rgu9b0Ziwdvoi/dqoU52ek1h/Ck+84/PZhRfenv4QEJfv9JYA/PwzyGzPbCh2jjfmBh5OLKvvHJonqp9bLInr15f+kDmtSqwZdSbmPzE09DKqJ+ksQN4Tm4lXdB1PHRTuW3ZmRh7oOwR0mBoju86KalsxsmeO3NbhLI4kGd+22ih2UU64Bq0LCkG4BOMhEF5zZ4R+qb/clW3JD9W0uF15l9RnjyncDGU2Zbua+CvRZvz7ORbz+l/5jAGVUYMI8rrHE/surpgZB5uOLVyQmUKx9AyAvDCsGCRscRsJAkfycg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pNPzaM24FVvhUbiwQRA8cpUKg8KuDopP40un+fZWYqM=;
 b=Eg3YWkIPTs5f3645afZHnHQ47GvEiLk5l0EIsaLaKXkQg0GrUg8L02SAPiek4hvDtVqxziKm2uAQBD4T8wNLa3uJmwuG83cU7TuL9O7CtcV+gxhZYDDQzr03ohQ7YDh8S2HLDASOh1yh2NBJNweJU9WyqB4Ri0QirX+GIGdvqOI=
Received: from SJ0PR05CA0094.namprd05.prod.outlook.com (2603:10b6:a03:334::9)
 by DM4PR12MB6614.namprd12.prod.outlook.com (2603:10b6:8:bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 07:14:06 +0000
Received: from CO1PEPF00012E80.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::77) by SJ0PR05CA0094.outlook.office365.com
 (2603:10b6:a03:334::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Wed, 9
 Sep 2026 07:14:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E80.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 07:14:05 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 02:13:58 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 9 Sep 2026 02:13:56 -0500
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Shubham Patil
	<shubhamsanjay.patil@amd.com>
Subject: [PATCH v4 3/3] i3c: master: amd: Add hot-join support
Date: Wed, 9 Sep 2026 12:43:40 +0530
Message-ID: <20260909071340.3649271-4-shubhamsanjay.patil@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260909071340.3649271-1-shubhamsanjay.patil@amd.com>
References: <20260909071340.3649271-1-shubhamsanjay.patil@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E80:EE_|DM4PR12MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: 71798dc7-22a8-4973-e840-08df0e41ef39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|11063799006|5023799004|56012099006|3023799007|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Bj71sATUF45RScuoNJpmWleJ3681qhLZdDNW0zFgiio2DMYGkExVH0ilsgeJrmb8ndX3xQ7OabColBXmxpxhfofOlmh5O/gS8Rur5eF7uBnLOibpVL4BIa1uiYKNCGYZr4NNF2/w14Cf5rGG5h+i3YE2R+e7RgwJZa/mcKCWEi1Y/tqXPZs755ocYM/tsNBwHGQCvHtjiISc2GaoMGxIBt5MeMP5zIRkHQqjExWDuqJs5WBm4YU21Lg7cf0L4HD4IwilIgiF4gcB7EkGQWVnPsMf5OBNcXckQ5dxL6R04CmgsS8v9Ay0Iuuy6rxIlGsebIoalJY1O60GgBDA+ESojlU4w15R5TNSkBUcbTIxUwruc7XsrqhPO0HlFThsz1JdpkqnuJqpRlNeOzqlB84JnyYJqJ02CGIHq9Fd18+nTKJLrgHybAQiSlxjuCw5/IK5twRV+pWXG4VkohgILEURAweDNMzIdIa2a5Mk1pQnd1s7vSir+yAsnxwLb9c2hFBkw546+2GQlNDr1QFzHyin2oHnhCxtFmR5YWYTZO3cos9Il8sotvYIyTLNVn1STz0bDVObQ+hclTD1PXlyeyZf1LrtatJCZPJQ8cWIgQJRyTpKVgMFj3tiRVz6+2B/QxBEkl91sBiIAhBaX2GTJrxuiQAu77Lpo3nL8yToH+yoqnuGRC0Mk8xGN0k45JSV807ZBZOz0X/sttV5crhfBK4Lvw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(11063799006)(5023799004)(56012099006)(3023799007)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BY/VLb12m9h7kk6lyCCrP5yelJ9TO/EFoESCFBvHjfFlbec0d5RS9f03DWVCfAkQiuGegeXiVNmdpKGJXu7tSmSKVlHJHHV/EhgcQPRyjdzYC44Qr30hjn2drd0AM5p0IEf8Hif3wM5/kTZG22BcJ45/a1955ZSjxzmQvxlgv85KOXvv3qB3c4/1foPYLn6z16Epyf4uyjCBOj0IbeRdDWZdQ/b8OHxXXChvo8U/HpWrjpmRFQGzPmpl47KC0jBAiMqDdGKRekaG4BPAMR1+SXD2XllbaxACKUiUCvsRLkZirjpqHSylOUYKKRVmxK8eR4/dzgJCzcDQ4khVgIGSewmn72rFm74M11nRh8/yr/WRh/5/dntNw7ldJS6VqNIZH7lqpKhgVE8kbkcanPk9bhhqiyFHpwv1Lk/pDjHYt9N1U3zFqhPikExGrJBTY5Hh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 07:14:05.8342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71798dc7-22a8-4973-e840-08df0e41ef39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E80.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6614

Add hot-join support for the AMD AXI I3C master controller.
By default, the hot-join acknowledgment is disabled. Users can use the
sysfs entry to enable it. A hot-join event is handed to the i3c core
with i3c_master_queue_hotjoin(), which runs DAA from the core workqueue
so the new device is enumerated.

Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
---
Changes in V4:
- Probe "xlnx,hot-join-capable" again, matching the restored v2 binding.
- Update the commit desciption accordingly.

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
index a50445530a43..400bf15e0299 100644
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
- *		 support ("xlnx,in-band-interrupt-capable"); also the
- *		 condition for the controller interrupt being present.
+ *		 support ("xlnx,in-band-interrupt-capable"). Since Hot-Join
+ *		 requests are ACKed by the IBI machinery, this is also the
+ *		 condition for the controller interrupt being present at all.
+ * @hj_capable: True when the IP was synthesized with Hot-Join support
+ *		("xlnx,hot-join-capable"); implies @ibi_capable.
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
 					  "xlnx,in-band-interrupt-capable");
+	master->hj_capable =
+		device_property_read_bool(master->dev,
+					  "xlnx,hot-join-capable");
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

