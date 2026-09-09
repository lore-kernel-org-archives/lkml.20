Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011021.outbound.protection.outlook.com [52.101.62.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70053DB96F;
	Wed,  9 Sep 2026 07:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788938051; cv=fail; b=gJXfX5BFE6bW9vuqeeBIHRKLTZ9yDY1p5R7byHI/xHfKumbSlVPZZiRK3sYa8tKYOgcaGAkCde0rJbcWD/8v0j/MFP0lYplxkwQoBtZsxAcLKy6lTKlgDErfRma/Ts8kHzHxUZ4y1kBya/Q/4kGOgtcF3aAMFZChUVRkTWVS+6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788938051; c=relaxed/simple;
	bh=m5o27FzApFw5ZRESeiGOB/eUca0XoA/NryXsz2LQLPg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BOkGRgvASu0aMTeK4p9t4h+9W6a+/GdiybcXuk93qDKoeCskbHIPKzSEuTvuqLgAYhg2NxdZXkpyjSgcBgIxMs0w/03D/h4240vE8IwV69pa7Oo6RKQxuKP9f8tpy52fqKqL5aonexuoi12iBFel/ZbfVj84B6tfO64dqtw64+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UxfY+f8U; arc=fail smtp.client-ip=52.101.62.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UxfY+f8U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AaRA4r+Qtx2cohRwEHR8oXy96Dpx20fnlkLwKQKisYLx5NTYoDh1kO9dJXZNZkb9mGHWjwpDm25iCjXJLWJBv7GoLwQwf/MV7Tot+ugsvW/CFMc/mGawgDjE1fh7dADvj7hdQl4dshObI/ney4HJu4qlYRQ2gve2CJfJnPBsVtLCwbaFB56cvWGEWR/DNSaiR8iinevV4NfSYt2CTtQz6Pg2YfBKhaYFQYsR1LgAcJwgukvc1nFFOdBuDCz3RbRDcQUnWOYvoIFKRFG5iL6KdYhnXJH3D3LJCU+RcughEeMGAKCRg4KZ7qH7KLAM9AciAOxj+SqAXdqd0PH8j/3SCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fXop8VTjR8MOuVk8msR0FSilWfVHwx9rdAVgzQyjGU=;
 b=v4rO+ParkKXTnvX0vvx3RovNH4abTJJf6hK23dLYQHMdVcLymO7+tG228F+YK+RBlF9gf4qeD8t9fqBxItsvZNM+s2Yv88gQzPtO4q4BURVM53r/1hDly5eXWvcNCyK0tvKmswoz2QGSd0oYXXQ8TfUO6PG7uJxXx05F2TxXgDkSkPMvO0EQXXLUMHovdjLRlkpAV4ezzUDX/JgtpEC6e7stKCvZ5kMzgNMYeOZK7Po3erPXYiBPiriVAcL8pCH6ojPR0Ij/eihfn3G25krh+QEU7g+u/dTKnHltMpCLYDti4JN+CntMo3fR1PjOSeTFHVRH8vqkehN22zlerCG0NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fXop8VTjR8MOuVk8msR0FSilWfVHwx9rdAVgzQyjGU=;
 b=UxfY+f8UtatQG2y5+cZLlUOQeFtXt5XNnOLg6upSMW1nshDzBSv83DxdOwJw2T/A2r9zSx1GvCb6bZSqdxBmxDjl9xqtAJofULCiifBBGF/Ve9HgCaoEVNzHdfjIC+VhlYrUa1C6dkGmrqNcxMelXZrMd5eBY2jgQwsUh9ZfzpE=
Received: from SJ0PR05CA0117.namprd05.prod.outlook.com (2603:10b6:a03:334::32)
 by IA0PR12MB7776.namprd12.prod.outlook.com (2603:10b6:208:430::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 07:13:59 +0000
Received: from CO1PEPF00012E80.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::a4) by SJ0PR05CA0117.outlook.office365.com
 (2603:10b6:a03:334::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Wed, 9
 Sep 2026 07:13:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E80.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 07:13:57 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 02:13:55 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 02:13:54 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 9 Sep 2026 02:13:51 -0500
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Shubham Patil
	<shubhamsanjay.patil@amd.com>
Subject: [PATCH v4 2/3] i3c: master: amd: Add support for in-band interrupts
Date: Wed, 9 Sep 2026 12:43:39 +0530
Message-ID: <20260909071340.3649271-3-shubhamsanjay.patil@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E80:EE_|IA0PR12MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: 293790e5-c5a2-4cc2-a45c-08df0e41ea07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|10067099003|6133799003|3023799007|18002099003|22082099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	YnJAHdN5bmdXlq2pv3QmvmcaIWTi7sPEZB/rSCRlzyLTP7yN5hrc+1OnvXkZQS9QzbGrov+nON2c6FDglYPlDKBV2I9zz8e48EAuNU5M1Wpe+Ja4sWltkY4/rV0hSMtapu0usVM/3h4hXwbnMAJSGckXxE4AEXtQN9OUcW2aKsFiGBZlOA9/jRfrjKe+dESU2UH20YU9UE+YU5ltpU/59J/ap4VWBs4Iv3BTF74YcwLROxk76DvpwX6iCL5SJBo2BPG0G+xrmAFbx7M/2NeC5LnPplCnLqpcgPjPyFpIr+ctUtCMh4jyZlg/JZ/w9wYwcSl6PMCaJV4+/O1Gc5C5Mka+6rSxgyT0PZD7kjenV2MgKxvPz7QZ7xAyjKQbm3Lu+cnGks8ebqXrJIb4YfrXg8x4Lxu5uv7MAHRvB8NahbW3HHZWMsbpZ78U8lS5UZPKENLAI6GCG1Oh7NqMcY/x3fo8sGZ3wI4btzobxsTIC3r1uCrGQb0D+bJYVDqaOLD2nzjeD9eHiHfYqlGpT2T6qLrzqW8UWMRsVAJkQ+yCjXzmYUt1M5qD7E/+eig5WO3dEV4DaqjFk+LsRW7Bfmah1F8TrLYNhMFyT+082d020QUyZEmcbWP7o1sgyxOSSQiMhOGWKYZmaSWOWOpi4lmRWt/P03Pe4ZZFXk2DP5eJBOjWUnEBaZeTT6cBRutnq4VdEAecAb+tnXpKzVQg663l6Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	drseYVOJ774aXvCh5n4dVug1oTFK/ZPocVJgb4axQzfUoWsJRO5+bgYNwn7ImHcB5LmO1Tp/VZkblZEz4S4qeeApqDliqler4MvWIymcjiAPQl4GXNVDvTVdv3/beEJesLaOBmN+SH8UGxKimtPrgqHt6XNh26/EgpBMa0ZHiARMVS17AnPW+1FSYw14D0n6+1kPj1/oIyjBlZZTIvStv+296euPsBv0qDhxzHL9I9TZRyBfG/0x+wR3zCfM01mks/bHZd6gtUuSy8oXdzMYdZkS0JApjss1l9JsZn1n9jhm5eYw7kecr8XLNR3yEDtE5pmRBFOWrwiXksYfYc7fUSwmOxSE6+gXNUk/RsEtQYdRZgyBr/hh4nyyID6HpfiklatpCAfKfbuyI/SFx1GtH7C2OLVBuZDeL92gMq0lo8aqK0ViU8wTUC0HPAvk/PB/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 07:13:57.0565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 293790e5-c5a2-4cc2-a45c-08df0e41ea07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E80.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7776

Add support for receiving and dequeueing I3C in-band interrupts.

IBI support is optional at synthesis time, so the ops are assembled at
probe from the base set plus the IBI callbacks, and the callbacks are
only registered when the "xlnx,in-band-interrupt-capable" property is
present. The controller interrupt carries IBI events only, so it is
likewise only requested for such designs.

The IBI ACK enable and its interrupt mask are controller-wide rather
than per-target, so they are armed when the first target enables IBIs
and disarmed when the last one disables them. Per-target control stays
on the bus via ENEC/DISEC.

IBIs share the response and read FIFOs with normal transfers and are
tagged with the reserved TID 0x0F. Masking the interrupt for the
duration of a transfer keeps the handler from running, but does not
stop the controller from ACKing an IBI, so the ACK is held off for the
duration of a transfer as well and a target retries its request. One
ACKed just before that takes effect can still queue its response word
and payload ahead of the transfer's own. The polled transfer path
therefore demultiplexes the response FIFO by TID: an IBI response and
its payload are handed to the IBI path, and the transfer's own response
is claimed into the master state for the caller to consume.

Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
---
Changes in V4:
- Probe "xlnx,in-band-interrupt-capable" again, matching the restored
  v2 binding.
- Update the commit desciption accordingly.

Changes in V3:
 - In xi3c_xfer_resp_available(), read IBI_TARGET_ADDR before
   popping RESP_STATUS_FIFO so a raced IBI is not paired with the next
   address (or garbage).
 - Call i3c_dev_set_master_data() before publishing the IBI slot so the
   IRQ handler cannot see the device with NULL master data.
 - Probe "in-band-interrupt-capable" instead of the xlnx, property.
 - Update the commit description accordingly.

Changes in V2:
- Do not lose an IBI raced with a transfer: hold XI3C_CR_IBI_MASK off
  for the duration of a transfer so the target retries.
- Deliver an IBI accepted just before that through
  xi3c_master_process_ibi() instead of draining it, which could also
  consume the transfer's read data.
- disable_ibi(): return early on DISEC failure instead of disarming and
  desyncing ibi.enabled_count from the core.
- synchronize_irq() before disable_ibi() returns and before free_ibi()
  frees the pool.
- Update the commit description accordingly.
---
 drivers/i3c/master/amd-i3c-master.c | 607 +++++++++++++++++++++++++++-
 1 file changed, 587 insertions(+), 20 deletions(-)

diff --git a/drivers/i3c/master/amd-i3c-master.c b/drivers/i3c/master/amd-i3c-master.c
index ef5ad5abb788..a50445530a43 100644
--- a/drivers/i3c/master/amd-i3c-master.c
+++ b/drivers/i3c/master/amd-i3c-master.c
@@ -12,6 +12,7 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/i3c/master.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
@@ -19,7 +20,9 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/time.h>
 #include <linux/unaligned.h>
 
@@ -28,6 +31,8 @@
 #define XI3C_CR_OFFSET				0x08	/* Control Register */
 #define XI3C_ADDRESS_OFFSET			0x0C	/* Target Address Register */
 #define XI3C_SR_OFFSET				0x10	/* Status Register */
+#define XI3C_INTR_STATUS_OFFSET			0x14	/* Interrupt status event (W1C) */
+#define XI3C_INTR_RE_OFFSET			0x18	/* Interrupt rising-edge enable mask */
 #define XI3C_CMD_FIFO_OFFSET			0x20	/* I3C Command FIFO Register */
 #define XI3C_WR_FIFO_OFFSET			0x24	/* I3C Write Data FIFO Register */
 #define XI3C_RD_FIFO_OFFSET			0x28	/* I3C Read Data FIFO Register */
@@ -42,13 +47,17 @@
 #define XI3C_TSU_STOP_OFFSET			0x50	/* I3C STOP Setup Register */
 #define XI3C_OD_SCL_HIGH_TIME_OFFSET		0x54	/* I3C OD SCL HIGH Register */
 #define XI3C_OD_SCL_LOW_TIME_OFFSET		0x58	/* I3C OD SCL LOW Register */
+#define XI3C_IBI_TARGET_ADDR_OFFSET		0x5C	/* IBI source address register */
+#define XI3C_TARGET_ADDR_BCR_OFFSET		0x60	/* Per-target {DA, BCR} SPRAM */
 #define XI3C_PID0_OFFSET			0x6C	/* LSB 4 bytes of the PID */
 #define XI3C_PID1_BCR_DCR			0x70	/* MSB 2 bytes of the PID, BCR and DCR */
 
 #define XI3C_CR_EN_MASK				BIT(0)	/* Core Enable */
 #define XI3C_CR_RESUME_MASK			BIT(2)	/* Core Resume */
+#define XI3C_CR_IBI_MASK			BIT(3)	/* IBI ACK enable */
 #define XI3C_SR_RESP_NOT_EMPTY_MASK		BIT(4)	/* Resp Fifo not empty status mask */
 #define XI3C_RD_FIFO_NOT_EMPTY_MASK		BIT(15)	/* Read Fifo not empty status mask */
+#define XI3C_INTR_IBI_MASK			BIT(7)	/* IBI event (INTR status/enable) */
 
 #define XI3C_BCR_MASK				GENMASK(23, 16)
 #define XI3C_DCR_MASK				GENMASK(31, 24)
@@ -57,6 +66,7 @@
 #define XI3C_REV_NUM_MASK			GENMASK(15, 8)
 #define XI3C_PID1_MASK				GENMASK(15, 0)
 #define XI3C_FIFO_LEVEL_MASK			GENMASK(15, 0)
+#define XI3C_RESP_FIFO_LEVEL_MASK		GENMASK(31, 16)
 #define XI3C_RESP_CODE_MASK			GENMASK(8, 5)
 
 /* Controller response codes; PG439 page 34, Table 46 */
@@ -69,7 +79,9 @@
 #define XI3C_XFER_SHORT_READ			1
 
 #define XI3C_RESP_BYTES_MASK			GENMASK(20, 9)	/* NUM_BYTES processed */
+#define XI3C_RESP_TID_MASK			GENMASK(3, 0)	/* response transfer ID */
 #define XI3C_ADDR_MASK				GENMASK(6, 0)
+#define XI3C_TGT_BCR_MASK			GENMASK(15, 8)	/* TARGET_ADDR_BCR: BCR field */
 #define XI3C_FIFOS_RST_MASK			GENMASK(4, 1)
 
 /* Command FIFO word layout (bit ranges encoded in the GENMASK/BIT args) */
@@ -121,9 +133,15 @@
 #define XI3C_POLL_INTERVAL_US			10
 
 #define XI3C_I2C_MODE				0
-#define XI3C_I2C_TID				0
 #define XI3C_SDR_MODE				1
+
+/*
+ * TID tags: I2C/SDR are driver-chosen for normal transfers;
+ * 0x0F is the spec-reserved IBI response TID.
+ */
+#define XI3C_I2C_TID				0
 #define XI3C_SDR_TID				1
+#define XI3C_IBI_RESP_TID			0x0F
 
 #define XI3C_WORD_LEN				4
 
@@ -132,6 +150,9 @@
 /* Software guard: 1 s (ms, for msecs_to_jiffies) to bail out if a transfer never completes */
 #define XI3C_XFER_TIMEOUT_MS			1000
 
+/* IBI response wait in hard-IRQ context; software-chosen safety cap. */
+#define XI3C_IBI_RESP_TIMEOUT_US		1000
+
 struct xi3c_cmd {
 	const void *tx_buf;
 	void *rx_buf;
@@ -160,9 +181,33 @@ struct xi3c_xfer {
  * @membase: Memory base of the HW registers.
  * @pclk: Input clock driving the controller.
  * @lock: Serializes transfers and CCC submission.
+ * @reg_lock: IRQ-safe lock serializing read-modify-write of the shared
+ *	      control (XI3C_CR_OFFSET) and interrupt-enable
+ *	      (XI3C_INTR_RE_OFFSET) registers.
  * @daa: ENTDAA enumeration state.
  * @daa.addrs: Dynamic addresses assigned in enumeration order.
  * @daa.index: Number of responders enumerated so far.
+ * @xfer_resp_valid: True once the in-flight transfer's own response word has
+ *		     been taken from the shared response FIFO. Guarded by @lock.
+ * @ibi_capable: True when the IP was synthesized with In-Band Interrupt
+ *		 support ("xlnx,in-band-interrupt-capable"); also the
+ *		 condition for the controller interrupt being present.
+ * @xfer_resp: Response word claimed for the transfer in flight; valid while
+ *	       @xfer_resp_valid is set. Guarded by @lock.
+ * @irq: Controller interrupt line, used for IBI events. Only valid when
+ *	 @ibi_capable is set.
+ * @ops: Controller ops handed to the framework, assembled at probe time from
+ *	 the base ops plus the callbacks the design actually supports.
+ * @ibi: In-Band Interrupt slot tracking.
+ * @ibi.lock: Protects @ibi.slots against the IBI handler.
+ * @ibi.slots: Per-device IBI registration, indexed by slot.
+ * @ibi.enabled_count: Number of devices with IBI currently enabled; the
+ *		       controller-wide IBI ACK/interrupt is armed on the
+ *		       first enable and disarmed on the last disable. Guarded
+ *		       by @reg_lock.
+ * @ibi.suppressed: True while a transfer holds the IBI ACK off. Arming leaves
+ *		    the ACK to that transfer, which restores it from
+ *		    @ibi.enabled_count. Guarded by @reg_lock.
  */
 struct xi3c_master {
 	struct i3c_master_controller base;
@@ -170,10 +215,32 @@ struct xi3c_master {
 	void __iomem *membase;
 	struct clk *pclk;
 	struct mutex lock; /* serializes transfers and CCC submission */
+	spinlock_t reg_lock;
 	struct {
 		u8 addrs[XI3C_MAX_DEVS];
 		u8 index;
 	} daa;
+	bool xfer_resp_valid;
+	bool ibi_capable;
+	u32 xfer_resp;
+	int irq;
+	struct i3c_master_controller_ops ops;
+	struct {
+		spinlock_t lock; /* protects slots[] against the IBI handler */
+		struct i3c_dev_desc *slots[XI3C_MAX_DEVS];
+		unsigned int enabled_count;
+		bool suppressed;
+	} ibi;
+};
+
+/**
+ * struct xi3c_i3c_dev_data - Per-device controller state.
+ * @ibi_pool: Generic IBI slot pool backing this device's IBIs.
+ * @ibi_slot: Index into &xi3c_master.ibi.slots, or -1 when unregistered.
+ */
+struct xi3c_i3c_dev_data {
+	struct i3c_generic_ibi_pool *ibi_pool;
+	s16 ibi_slot;
 };
 
 static inline struct xi3c_master *
@@ -206,23 +273,89 @@ static inline bool xi3c_is_resp_available(struct xi3c_master *master)
 			 ioread32(master->membase + XI3C_SR_OFFSET));
 }
 
+static inline u16 xi3c_resp_fifo_level(struct xi3c_master *master)
+{
+	return FIELD_GET(XI3C_RESP_FIFO_LEVEL_MASK,
+			 ioread32(master->membase + XI3C_FIFO_LVL_STATUS_1_OFFSET));
+}
+
+/*
+ * Discard an unconsumed IBI payload from the RX FIFO, keeping the FIFO
+ * aligned for the next transfer.
+ */
+static void xi3c_master_drain_ibi_fifo(struct xi3c_master *master, u16 len)
+{
+	unsigned int words = DIV_ROUND_UP(len, XI3C_WORD_LEN);
+
+	while (words--)
+		ioread32(master->membase + XI3C_RD_FIFO_OFFSET);
+}
+
+static void xi3c_master_process_ibi(struct xi3c_master *master, u32 resp, u8 da);
+
+/*
+ * Tell whether the transfer in flight has had its response posted, claiming
+ * that response into @master->xfer_resp when it has.
+ *
+ * The response and read FIFOs are shared with IBIs. A transfer stops the
+ * controller from ACKing new IBIs, but one ACKed just before that takes effect
+ * still queues its response word and its payload ahead of ours. Deliver such
+ * an IBI here rather than leaving it in the FIFOs, so a transfer cannot
+ * mistake the IBI's response code and byte count for its own, nor the IBI's
+ * payload for read data, and the event still reaches its device.
+ */
+static bool xi3c_xfer_resp_available(struct xi3c_master *master)
+{
+	u32 resp;
+	u8 da;
+
+	if (master->xfer_resp_valid)
+		return true;
+
+	while (xi3c_is_resp_available(master)) {
+		da = FIELD_GET(XI3C_ADDR_MASK,
+			       ioread32(master->membase + XI3C_IBI_TARGET_ADDR_OFFSET));
+
+		resp = ioread32(master->membase + XI3C_RESP_STATUS_FIFO_OFFSET);
+
+		if (FIELD_GET(XI3C_RESP_TID_MASK, resp) != XI3C_IBI_RESP_TID) {
+			master->xfer_resp = resp;
+			master->xfer_resp_valid = true;
+			return true;
+		}
+
+		dev_dbg_ratelimited(master->dev,
+				    "IBI from 0x%02x raced with transfer\n", da);
+		xi3c_master_process_ibi(master, resp, da);
+
+		/*
+		 * IRQ is masked for this transfer: clear the event serviced
+		 * here so it does not fire again once the IRQ is unmasked.
+		 */
+		iowrite32(XI3C_INTR_IBI_MASK,
+			  master->membase + XI3C_INTR_STATUS_OFFSET);
+	}
+
+	return false;
+}
+
 static int xi3c_get_response(struct xi3c_master *master, struct xi3c_cmd *cmd)
 {
 	u32 response_data;
-	u32 resp_reg;
+	bool available;
 	u8 code;
 	int ret;
 
-	ret = readl_poll_timeout(master->membase + XI3C_SR_OFFSET,
-				 resp_reg,
-				 resp_reg & XI3C_SR_RESP_NOT_EMPTY_MASK,
-				 XI3C_POLL_INTERVAL_US, XI3C_RESP_TIMEOUT_US);
+	ret = read_poll_timeout(xi3c_xfer_resp_available, available, available,
+				XI3C_POLL_INTERVAL_US, XI3C_RESP_TIMEOUT_US,
+				false, master);
 	if (ret) {
 		dev_err(master->dev, "XI3C response timeout\n");
 		return ret;
 	}
 
-	response_data = ioread32(master->membase + XI3C_RESP_STATUS_FIFO_OFFSET);
+	response_data = master->xfer_resp;
+	master->xfer_resp_valid = false;
 	code = FIELD_GET(XI3C_RESP_CODE_MASK, response_data);
 
 	switch (code) {
@@ -247,6 +380,19 @@ static int xi3c_get_response(struct xi3c_master *master, struct xi3c_cmd *cmd)
 	}
 }
 
+/*
+ * Wait for a response in hard-IRQ context (IBI path). Uses the atomic
+ * poll variant since the IBI handler must not sleep.
+ */
+static int xi3c_wait_resp_atomic(struct xi3c_master *master)
+{
+	u32 sr;
+
+	return readl_poll_timeout_atomic(master->membase + XI3C_SR_OFFSET, sr,
+					 sr & XI3C_SR_RESP_NOT_EMPTY_MASK,
+					 0, XI3C_IBI_RESP_TIMEOUT_US);
+}
+
 static inline void xi3c_writesl_be(void __iomem *addr, const void *buffer,
 				   unsigned int count)
 {
@@ -331,10 +477,28 @@ static inline void xi3c_master_disable(struct xi3c_master *master)
 
 static inline void xi3c_master_resume(struct xi3c_master *master)
 {
+	guard(spinlock_irqsave)(&master->reg_lock);
 	iowrite32(ioread32(master->membase + XI3C_CR_OFFSET) |
 		  XI3C_CR_RESUME_MASK, master->membase + XI3C_CR_OFFSET);
 }
 
+static void xi3c_master_suppress_ibi_for_xfer(struct xi3c_master *master,
+					      bool suppress)
+{
+	u32 cr;
+
+	guard(spinlock_irqsave)(&master->reg_lock);
+
+	master->ibi.suppressed = suppress;
+
+	cr = ioread32(master->membase + XI3C_CR_OFFSET);
+	if (suppress || !master->ibi.enabled_count)
+		cr &= ~XI3C_CR_IBI_MASK;
+	else
+		cr |= XI3C_CR_IBI_MASK;
+	iowrite32(cr, master->membase + XI3C_CR_OFFSET);
+}
+
 static void xi3c_master_reset_fifos(struct xi3c_master *master)
 {
 	u32 data;
@@ -356,6 +520,11 @@ static void xi3c_master_reset_fifos(struct xi3c_master *master)
 
 static inline void xi3c_master_init(struct xi3c_master *master)
 {
+	/* Mask all interrupt sources and clear any stale latched events. */
+	iowrite32(0, master->membase + XI3C_INTR_RE_OFFSET);
+	iowrite32(ioread32(master->membase + XI3C_INTR_STATUS_OFFSET),
+		  master->membase + XI3C_INTR_STATUS_OFFSET);
+
 	/* Reset fifos */
 	xi3c_master_reset_fifos(master);
 
@@ -437,13 +606,19 @@ static int xi3c_master_read(struct xi3c_master *master, struct xi3c_cmd *cmd)
 		return ret;
 	}
 
-	if (!(status_reg & XI3C_RD_FIFO_NOT_EMPTY_MASK))
+	/*
+	 * No data queued means this read produced none, unless what is queued
+	 * is an IBI response that raced with it; xi3c_xfer_resp_available()
+	 * consumes that case so the wait for our own data can continue.
+	 */
+	if (!(status_reg & XI3C_RD_FIFO_NOT_EMPTY_MASK) &&
+	    xi3c_xfer_resp_available(master))
 		return 0;
 
 	timeout = jiffies + msecs_to_jiffies(XI3C_XFER_TIMEOUT_MS);
 
 	/* Read data from rx fifo */
-	while (cmd->rx_len > 0 && !xi3c_is_resp_available(master)) {
+	while (cmd->rx_len > 0 && !xi3c_xfer_resp_available(master)) {
 		if (time_after(jiffies, timeout)) {
 			dev_err(master->dev, "XI3C read timeout\n");
 			return -EIO;
@@ -503,7 +678,7 @@ static int xi3c_master_write(struct xi3c_master *master, struct xi3c_cmd *cmd)
 
 	timeout = jiffies + msecs_to_jiffies(XI3C_XFER_TIMEOUT_MS);
 	/* Fill if any remaining data to tx fifo */
-	while (cmd->tx_len > 0 && !xi3c_is_resp_available(master)) {
+	while (cmd->tx_len > 0 && !xi3c_xfer_resp_available(master)) {
 		if (time_after(jiffies, timeout)) {
 			dev_err(master->dev, "XI3C write timeout\n");
 			return -EIO;
@@ -547,22 +722,38 @@ static int xi3c_master_common_xfer(struct xi3c_master *master,
 				   struct xi3c_xfer *xfer)
 {
 	unsigned int i;
-	int ret;
+	int ret = 0;
 
 	guard(mutex)(&master->lock);
 
+	/*
+	 * IBIs share the response/read FIFOs; stop the controller from ACKing
+	 * new ones and mask the IRQ so the handler cannot take this transfer's
+	 * response.
+	 */
+	if (master->ibi_capable) {
+		xi3c_master_suppress_ibi_for_xfer(master, true);
+		disable_irq(master->irq);
+	}
+
+	/* Discard any response claimed but not consumed by an aborted transfer. */
+	master->xfer_resp_valid = false;
+
 	for (i = 0; i < xfer->ncmds; i++) {
 		ret = xi3c_master_xfer(master, &xfer->cmds[i]);
-		if (ret) {
-			/* Count commands sent on the bus; the rest never ran */
-			xfer->nissued = i + 1;
-			return ret;
-		}
+		if (ret)
+			break;
 	}
 
-	xfer->nissued = xfer->ncmds;
+	if (master->ibi_capable) {
+		enable_irq(master->irq);
+		xi3c_master_suppress_ibi_for_xfer(master, false);
+	}
 
-	return 0;
+	/* On failure @i is the command that failed; the rest never ran. */
+	xfer->nissued = (i < xfer->ncmds) ? i + 1 : xfer->ncmds;
+
+	return ret;
 }
 
 static int xi3c_master_do_daa(struct i3c_master_controller *m)
@@ -1052,9 +1243,338 @@ static void xi3c_master_bus_cleanup(struct i3c_master_controller *m)
 {
 	struct xi3c_master *master = to_xi3c_master(m);
 
+	/*
+	 * Disarm all interrupt sources and the IBI ACK so the controller can't
+	 * assert once disabled; reset the refcount that tracks them.
+	 */
+	scoped_guard(spinlock_irqsave, &master->reg_lock) {
+		iowrite32(0, master->membase + XI3C_INTR_RE_OFFSET);
+		iowrite32(ioread32(master->membase + XI3C_CR_OFFSET) &
+			  ~XI3C_CR_IBI_MASK, master->membase + XI3C_CR_OFFSET);
+		master->ibi.enabled_count = 0;
+	}
+
 	xi3c_master_disable(master);
 }
 
+static int xi3c_master_request_ibi(struct i3c_dev_desc *dev,
+				   const struct i3c_ibi_setup *req)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct xi3c_master *master = to_xi3c_master(m);
+	struct xi3c_i3c_dev_data *data;
+	unsigned long flags;
+	unsigned int i;
+
+	data = kzalloc_obj(*data, GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->ibi_slot = -1;
+	data->ibi_pool = i3c_generic_ibi_alloc_pool(dev, req);
+	if (IS_ERR(data->ibi_pool)) {
+		int ret = PTR_ERR(data->ibi_pool);
+
+		kfree(data);
+		return ret;
+	}
+
+	i3c_dev_set_master_data(dev, data);
+
+	spin_lock_irqsave(&master->ibi.lock, flags);
+	for (i = 0; i < ARRAY_SIZE(master->ibi.slots); i++) {
+		if (!master->ibi.slots[i]) {
+			data->ibi_slot = i;
+			master->ibi.slots[i] = dev;
+			break;
+		}
+	}
+	spin_unlock_irqrestore(&master->ibi.lock, flags);
+
+	if (data->ibi_slot < 0) {
+		dev_err(master->dev, "IBI: no free slot for addr 0x%02x\n",
+			dev->info.dyn_addr);
+		i3c_dev_set_master_data(dev, NULL);
+		i3c_generic_ibi_free_pool(data->ibi_pool);
+		kfree(data);
+		return -ENOSPC;
+	}
+
+	return 0;
+}
+
+static void xi3c_master_free_ibi(struct i3c_dev_desc *dev)
+{
+	struct xi3c_i3c_dev_data *data = i3c_dev_get_master_data(dev);
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct xi3c_master *master = to_xi3c_master(m);
+	unsigned long flags;
+
+	spin_lock_irqsave(&master->ibi.lock, flags);
+	master->ibi.slots[data->ibi_slot] = NULL;
+	spin_unlock_irqrestore(&master->ibi.lock, flags);
+
+	/*
+	 * Clearing the slot above keeps the IBI handler from finding this
+	 * device, but a handler already running may be copying a payload into
+	 * the pool. Wait for it to finish before the pool is freed below.
+	 */
+	synchronize_irq(master->irq);
+
+	i3c_generic_ibi_free_pool(data->ibi_pool);
+	i3c_dev_set_master_data(dev, NULL);
+	kfree(data);
+}
+
+/*
+ * Arm the controller-wide IBI ACK enable and event interrupt on the first
+ * device to enable IBIs. Per-device SIR control is still done on the bus via
+ * ENEC/DISEC; this only gates whether the controller reacts to IBIs at all.
+ */
+static void xi3c_master_ibi_arm(struct xi3c_master *master)
+{
+	guard(spinlock_irqsave)(&master->reg_lock);
+
+	if (master->ibi.enabled_count++)
+		return;
+
+	/* A transfer holding the ACK off restores it once it completes. */
+	if (!master->ibi.suppressed)
+		iowrite32(ioread32(master->membase + XI3C_CR_OFFSET) |
+			  XI3C_CR_IBI_MASK,
+			  master->membase + XI3C_CR_OFFSET);
+	iowrite32(ioread32(master->membase + XI3C_INTR_RE_OFFSET) |
+		  XI3C_INTR_IBI_MASK, master->membase + XI3C_INTR_RE_OFFSET);
+}
+
+/* Disarm the controller-wide IBI enable once the last device disables IBIs. */
+static void xi3c_master_ibi_disarm(struct xi3c_master *master)
+{
+	guard(spinlock_irqsave)(&master->reg_lock);
+
+	if (WARN_ON(!master->ibi.enabled_count))
+		return;
+
+	if (--master->ibi.enabled_count)
+		return;
+
+	iowrite32(ioread32(master->membase + XI3C_INTR_RE_OFFSET) &
+		  ~XI3C_INTR_IBI_MASK, master->membase + XI3C_INTR_RE_OFFSET);
+	iowrite32(ioread32(master->membase + XI3C_CR_OFFSET) & ~XI3C_CR_IBI_MASK,
+		  master->membase + XI3C_CR_OFFSET);
+}
+
+static int xi3c_master_enable_ibi(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct xi3c_master *master = to_xi3c_master(m);
+	u32 val;
+	int ret;
+
+	/*
+	 * Program {DA, BCR} into the IBI SPRAM; the DA field self-selects the
+	 * row, so a plain write keeps the entry fresh after DAA reassigns the
+	 * address.
+	 */
+	val = FIELD_PREP(XI3C_ADDR_MASK, dev->info.dyn_addr) |
+	      FIELD_PREP(XI3C_TGT_BCR_MASK, dev->info.bcr);
+	iowrite32(val, master->membase + XI3C_TARGET_ADDR_BCR_OFFSET);
+
+	/* Arm the controller IBI path before allowing this device to SIR. */
+	xi3c_master_ibi_arm(master);
+
+	ret = i3c_master_enec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
+	if (ret) {
+		dev_err(master->dev, "IBI: ENEC failed addr 0x%02x (%d)\n",
+			dev->info.dyn_addr, ret);
+		xi3c_master_ibi_disarm(master);
+	}
+
+	return ret;
+}
+
+static int xi3c_master_disable_ibi(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct xi3c_master *master = to_xi3c_master(m);
+	int ret;
+
+	/*
+	 * Keep the controller armed if DISEC failed: the core still counts this
+	 * device as enabled, and the target may still raise IBIs.
+	 */
+	ret = i3c_master_disec_locked(m, dev->info.dyn_addr, I3C_CCC_EVENT_SIR);
+	if (ret)
+		return ret;
+
+	xi3c_master_ibi_disarm(master);
+
+	/*
+	 * The core samples the pending IBI count as soon as this returns, so
+	 * wait for an in-flight handler to queue its slot; otherwise the count
+	 * reads zero and the pool is freed while the handler still holds it.
+	 */
+	synchronize_irq(master->irq);
+
+	return 0;
+}
+
+static void xi3c_master_recycle_ibi_slot(struct i3c_dev_desc *dev,
+					 struct i3c_ibi_slot *slot)
+{
+	struct xi3c_i3c_dev_data *data = i3c_dev_get_master_data(dev);
+
+	i3c_generic_ibi_recycle_slot(data->ibi_pool, slot);
+}
+
+static void xi3c_master_handle_ibi(struct xi3c_master *master)
+{
+	u32 ibi_reg, resp;
+	u8 da, code;
+	u16 len;
+
+	ibi_reg = ioread32(master->membase + XI3C_IBI_TARGET_ADDR_OFFSET);
+	da = FIELD_GET(XI3C_ADDR_MASK, ibi_reg);
+
+	if (xi3c_wait_resp_atomic(master)) {
+		dev_err_ratelimited(master->dev, "XI3C IBI response timeout\n");
+		/* Controller parks in STOP on failure; RESUME to recover (PG439). */
+		xi3c_master_resume(master);
+		return;
+	}
+
+	resp = ioread32(master->membase + XI3C_RESP_STATUS_FIFO_OFFSET);
+	code = FIELD_GET(XI3C_RESP_CODE_MASK, resp);
+	len = FIELD_GET(XI3C_RESP_BYTES_MASK, resp);
+
+	/*
+	 * TID 0x0F marks an IBI response. A transfer masks this interrupt and
+	 * demuxes the response FIFO itself, so its response must never reach
+	 * here; draining one would eat that transfer's read data.
+	 */
+	if (FIELD_GET(XI3C_RESP_TID_MASK, resp) != XI3C_IBI_RESP_TID) {
+		WARN_ONCE(1, "XI3C: transfer response in IBI handler, dropping %u bytes\n",
+			  len);
+		xi3c_master_drain_ibi_fifo(master, len);
+		/* A non-success stray response parks the controller in STOP (PG439). */
+		if (code != XI3C_RESP_CODE_SUCCESS)
+			xi3c_master_resume(master);
+		return;
+	}
+
+	xi3c_master_process_ibi(master, resp, da);
+}
+
+/*
+ * Hand an IBI whose response word has already been taken from the response
+ * FIFO to its device, consuming the payload that goes with it. Runs from the
+ * IRQ handler, and from transfer context for an IBI the controller ACKed just
+ * before the transfer suppressed them.
+ */
+static void xi3c_master_process_ibi(struct xi3c_master *master, u32 resp, u8 da)
+{
+	struct xi3c_i3c_dev_data *data;
+	struct i3c_ibi_slot *slot;
+	struct i3c_dev_desc *dev;
+	unsigned long flags;
+	unsigned int id;
+	u8 code;
+	u16 len;
+
+	code = FIELD_GET(XI3C_RESP_CODE_MASK, resp);
+	len = FIELD_GET(XI3C_RESP_BYTES_MASK, resp);
+
+	if (code != XI3C_RESP_CODE_SUCCESS) {
+		dev_dbg_ratelimited(master->dev,
+				    "IBI: non-success code %u, dropping %u bytes\n",
+				    code, len);
+		xi3c_master_drain_ibi_fifo(master, len);
+		xi3c_master_resume(master);
+		return;
+	}
+
+	spin_lock_irqsave(&master->ibi.lock, flags);
+
+	for (id = 0; id < ARRAY_SIZE(master->ibi.slots); id++)
+		if (master->ibi.slots[id] &&
+		    master->ibi.slots[id]->info.dyn_addr == da)
+			break;
+
+	if (id == ARRAY_SIZE(master->ibi.slots)) {
+		dev_dbg_ratelimited(master->dev,
+				    "IBI: no registered device for addr 0x%02x\n",
+				    da);
+		goto err_drain;
+	}
+
+	dev = master->ibi.slots[id];
+
+	if (!dev->ibi) {
+		dev_dbg_ratelimited(master->dev,
+				    "IBI: addr 0x%02x not fully set up\n", da);
+		goto err_drain;
+	}
+
+	if (len > dev->ibi->max_payload_len) {
+		dev_dbg_ratelimited(master->dev,
+				    "IBI: payload %u > max %u for addr 0x%02x\n",
+				    len, dev->ibi->max_payload_len, da);
+		goto err_drain;
+	}
+
+	data = i3c_dev_get_master_data(dev);
+	slot = i3c_generic_ibi_get_free_slot(data->ibi_pool);
+	if (!slot) {
+		dev_dbg_ratelimited(master->dev,
+				    "IBI: no free pool slot for addr 0x%02x\n",
+				    da);
+		goto err_drain;
+	}
+
+	slot->len = 0;
+	if (len) {
+		xi3c_readl_fifo(master->membase + XI3C_RD_FIFO_OFFSET,
+				slot->data, len);
+		slot->len = len;
+	}
+
+	i3c_master_queue_ibi(dev, slot);
+	spin_unlock_irqrestore(&master->ibi.lock, flags);
+
+	return;
+
+err_drain:
+	/*
+	 * Reached only with code == SUCCESS, so the controller is not parked in
+	 * STOP; no resume needed (PG439).
+	 */
+	spin_unlock_irqrestore(&master->ibi.lock, flags);
+	xi3c_master_drain_ibi_fifo(master, len);
+}
+
+static irqreturn_t xi3c_master_irq_handler(int irq, void *dev_id)
+{
+	struct xi3c_master *master = dev_id;
+	u32 status;
+
+	status = ioread32(master->membase + XI3C_INTR_STATUS_OFFSET);
+	if (!status)
+		return IRQ_NONE;
+
+	/* Write-1-to-clear the latched events before servicing them. */
+	iowrite32(status, master->membase + XI3C_INTR_STATUS_OFFSET);
+
+	/* Event latches once; drain the queued IBI responses (TID checked per entry). */
+	if (status & XI3C_INTR_IBI_MASK) {
+		u16 pending = xi3c_resp_fifo_level(master);
+
+		while (pending-- && xi3c_is_resp_available(master))
+			xi3c_master_handle_ibi(master);
+	}
+
+	return IRQ_HANDLED;
+}
+
 static const struct i3c_master_controller_ops xi3c_master_ops = {
 	.bus_init = xi3c_master_bus_init,
 	.bus_cleanup = xi3c_master_bus_cleanup,
@@ -1065,6 +1585,15 @@ static const struct i3c_master_controller_ops xi3c_master_ops = {
 	.i2c_xfers = xi3c_master_i2c_xfers,
 };
 
+static void xi3c_master_init_ibi_ops(struct xi3c_master *master)
+{
+	master->ops.request_ibi = xi3c_master_request_ibi;
+	master->ops.free_ibi = xi3c_master_free_ibi;
+	master->ops.enable_ibi = xi3c_master_enable_ibi;
+	master->ops.disable_ibi = xi3c_master_disable_ibi;
+	master->ops.recycle_ibi_slot = xi3c_master_recycle_ibi_slot;
+}
+
 static int xi3c_master_probe(struct platform_device *pdev)
 {
 	struct xi3c_master *master;
@@ -1090,16 +1619,54 @@ static int xi3c_master_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	master->ops = xi3c_master_ops;
+
+	spin_lock_init(&master->ibi.lock);
+	spin_lock_init(&master->reg_lock);
+
+	master->ibi_capable =
+		device_property_read_bool(master->dev,
+					  "xlnx,in-band-interrupt-capable");
+
+	/*
+	 * The interrupt only carries IBI events, so it is only described for
+	 * designs synthesized with that feature.
+	 */
+	if (master->ibi_capable) {
+		xi3c_master_init_ibi_ops(master);
+
+		master->irq = platform_get_irq(pdev, 0);
+		if (master->irq < 0)
+			return master->irq;
+
+		ret = devm_request_irq(master->dev, master->irq,
+				       xi3c_master_irq_handler, IRQF_NO_AUTOEN,
+				       dev_name(master->dev), master);
+		if (ret)
+			return dev_err_probe(master->dev, ret,
+					     "Failed to request IRQ\n");
+	}
+
 	platform_set_drvdata(pdev, master);
 
-	return i3c_master_register(&master->base, master->dev,
-				   &xi3c_master_ops, false);
+	ret = i3c_master_register(&master->base, master->dev, &master->ops,
+				  false);
+	if (ret)
+		return ret;
+
+	if (master->ibi_capable)
+		enable_irq(master->irq);
+
+	return 0;
 }
 
 static void xi3c_master_remove(struct platform_device *pdev)
 {
 	struct xi3c_master *master = platform_get_drvdata(pdev);
 
+	if (master->ibi_capable)
+		disable_irq(master->irq);
+
 	i3c_master_unregister(&master->base);
 }
 
-- 
2.34.1

