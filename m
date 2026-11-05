Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793868889;
	b=2nbTIrJZl0BoDFKGYUQmEQPJMt0IUV9L5OfByZHNT747GFaC2YLKnNMe1FqVZLcWFj09
	 PU++M3qpu2unC3OKhGwm56nPeal6Z6qzkfHQ2FyxZPAcPrkhzr3sKzYUXM/9eeeNg6Uat
	 zNtqpLWCEYqlWV50kO/+JzgIwKn3gFXnpX92hLoADCxriWWUU6D40QiOWY9wfqks3HZwM
	 U08Uuw21AJqOZ9SrdgVfhj0B2YQlCKAX+584KSHWUmfVqcIOYGtt017rhSSJeGMxL3G88
	 Ty8wZgBnmkp3+iy3NWOYK6bXWgr8NjE8DRP/FinOKAuU53PvHhfoZvcGD1g0zCMA+jw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868889;
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
	bh=cxlnERCCRe8RFVm2YDYFQfIUZL74+5D8TEnz+OePIZ4=;
	b=GZR7FDHANxncaJ3eu7XuT+2ogoRKQwx+pdnX9W4rwFiXXmVSCru1RnfWrczu4OEn/7XA
	 /hCK9Dtxh7iwvHT1WBJINIW/gOrHTokU+vG0HXqBsj11R9jpLm8wYbbcvv3dyfBHKWTGf
	 OhD5OeOjLMjbFpvFC7Xext1vOAGWVOydbzQPafkaUXjB+294A62agMSEuogBulysKaMlP
	 G4XTaPA17/EK2+GhXViCuOvtt8rP3/a4uiSh6/XYdZ3Ww4YFaf2nGHDIyJAORSnvFVhzF
	 wK/iIgfbRgcGdLMttwyMWT6S4joG0k4P+NTK3cHuMTNtt4i4cxO5rh1snOBgPtcUy5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="cx/6JUkG";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.62
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013062.outbound.protection.outlook.com [40.107.201.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2B1606A329;
	Thu,  5 Nov 2026 08:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F2B1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=cx/6JUkG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uf6Bl6eY29/O/aIh1QzuLCEvgh2ZuU8r4zu5hsTXm3NBHISVOgG1bcKStfTr/I6Cj+TBDC8vsjRX8jy4JMrcMDr5tVIBZUa6QWAATByLdJpXsuaUg67iqC+mFJ1qsYv+b+RFqiJmsJPnSM1Ld72LwvOPLXNu/2NQ6kHyKPNul86vmHNlFNTO2D2fx0/CLB62XL/EmhCfNoQsLuV8cpkVVDn29RYfZcCs/ZMRAX48qbnDVFGs9uqBa8RUbUh+RVgDDzHnpR77leA+ltJ8APeK60blYlTgTIflaXhStb5GNblhNK5iORNDmyJxXjTjBsr/SM1PaY28SZfbsFeFreffyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxlnERCCRe8RFVm2YDYFQfIUZL74+5D8TEnz+OePIZ4=;
 b=fZ+5c3JOX9ve1FmQPOExh7wbBXTZqELD7CLlSx67oFsEg4gQnB3F8uADTW277hK6bMd6hEtUtiX5M6Mer84K3nGYEpe/qgRJFC7YvY9G9jlLDVfKXnyEtzEqdgQZP105I0Qbu0GVnjN+YhZzPtmTmcz2k82n7kkpXsV5fTr42ONYdXyeHYPPCGBN3TD6mnYv+mvelUpX4FFyg7h0EDZyDhBYrzC+mpL/c9Mz5mwCbk87uy8if+DtHzf2v/k4pOcmILq/zoUfJZ1YGZyaoAUA9eeg8wRdz3N9kB//G54bfcUljwmbfg2vg4ktk9+6RXcRH43fdVR3clWhRHuxLmwI6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxlnERCCRe8RFVm2YDYFQfIUZL74+5D8TEnz+OePIZ4=;
 b=cx/6JUkGKwlrpC4Zvx4J+9V8t37kDZpUzSqHw1/ZVLb+kSIuU1CnwAe7jRvIIcVxhJKUtfBABUnV0EwW1Q/hSceSAFhK2jXaCyq/46FrAnBI2hEeSSNktRgteKT5YF1G8cxI57vYREA+C5tuiHLhD5ljH4au79L6kMhfLBuZgzI=
Received: from MW4PR03CA0173.namprd03.prod.outlook.com (2603:10b6:303:8d::28)
 by CH8PR12MB249853.namprd12.prod.outlook.com (2603:10b6:610:702::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 08:54:44 +0000
Received: from CO1PEPF00018864.namprd03.prod.outlook.com
 (2603:10b6:303:8d:cafe::78) by MW4PR03CA0173.outlook.office365.com
 (2603:10b6:303:8d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 08:54:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00018864.mail.protection.outlook.com (10.167.249.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 08:54:43 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 02:54:41 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 5 Nov 2026 02:54:39 -0600
From: Shubham Patil <shubhamsanjay.patil@amd.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <meaganlloyd@linux.microsoft.com>,
	<git@amd.com>, Shubham Patil <shubhamsanjay.patil@amd.com>
Subject: [PATCH v2 1/3] i3c: Add helpers to get the maximum transfer size for a device
Date: Thu, 5 Nov 2026 14:24:23 +0530
Message-ID: <20261105085425.3418230-2-shubhamsanjay.patil@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00018864:EE_|CH8PR12MB249853:EE_
X-MS-Office365-Filtering-Correlation-Id: dbea85ce-8800-42c5-ce56-08df3b1a6f8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|11063799006|5023799004|56012099006|261021121427099003|261021123027099003|261009223027099003|261026121527099003|261102123227099003|261102130727099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VCZzEpJcO6FCwHXz2CX1hTgVCzcNTilk6dbb9CDxdHyzgF/TpX1z3NwrbYk32leYDjzvD1Stc5PaY7/Lh4nallT1QmF6PZv3DgoKHZiaZa8QD00htkHqu3fQu2MNFK0NnAv+Pr/kGe2Tq15nd99We66a9IElZn/xh6aberlBBZtT1o2ERxYxFIHFgv4j/qAaOiOrmRnGf5rZbji7+Rdo8FV49KEBSdC/4sAd8xz1s6W2cuoDqyPRUd/2l6cEmMsjwtzHEIyj9TvtTW1tdt5Y+dDWG69jAjGkzdw+Abtm8Ws++CFwsVpfRez3hqRJlBBOp3QA2aJNfnAQRW/drNfZyPef6Zlnf6LFu+l35YPF/rYjQpmvGR0CDzWzE75qWSrmkN8qWtduG1A6sXGUj1lVsixKwjJR2FYFcfjo2+sbyctgbdXwDMHZa+a2w/Eyh7QzkIWqKxdpIlj8GqFBC8Qv0mGZX/hiExiw5R8TKlyW4/Zqewl3q1JJAyJMWRrmD5FF0cX1z+OXRZGXWayARwtTxM0wen5logucpCE1kRxkvDI+bpcjT8OSMRdk79vxMqJQe0zELbespXeVLQ+CgH/eYUEJDvF8uqctd1yuCwL5iqpfSa6B/msxUnA86lOzMj69vIt1EC89YHxf2OY8kLDg7+5EGRAx1PtRQHhWGHNJ+uDuzeQTI09OGR4JztrV07d/R7Y4TfWoOcag+T/QozAjvA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(11063799006)(5023799004)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(261026121527099003)(261102123227099003)(261102130727099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ns7i6gXP5WRH8eN48NrbnTFeV6KbibFVFSQDpsAfkmheXP6iVjDkmHmGD8zTING0LsdIDwIkRIIQ0YmxrH8c0MJzHCHDr0vXV982vj+ZXqbwrgSeBaRGTrk38pPUNZoOTlvitSIyFV9HiWuAFb2tCBCTp2pPTGnCYbwJ5+wRV4C0G8RhXMftaf0h1P9M45kIi9k4ZcvLACnMhPj4sHLfZ8O/OrM9bA6qTO735zojOqGvAXujxKVJaZHnG29V8dik3Av8s8I5rYCttRwt2lctHo3IibpPbS5vXv0gsptUvDKNYfjArRsOVI45lnTRr0EU7pqZ9sPORKDVRrd2zVn+a26Rn/C24HLzFM36VAvcXuzVaE9DlkqpWK8yLwXYCvA+OaFDsvAoTW/mwky1mIlRjnQBFzTnaj8MWsx58kJ/HtEoESKRcj/zK0judttumEie
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 08:54:43.5307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbea85ce-8800-42c5-ce56-08df3b1a6f8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00018864.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB249853

A target's MRL and MWL, retrieved with GETMRL and GETMWL, describe only
what that target can accept. They say nothing about the controller
driving it, which may impose a smaller limit of its own: the DesignWare
controller, for example, rejects any private SDR transfer that does not
fit its data buffer. A device driver sizing a transfer from MRL alone
can therefore build one the controller has to refuse with -EOPNOTSUPP.

Add tx_fifo_bytes and rx_fifo_bytes to struct i3c_master_controller, to
be set by a controller driver before i3c_master_register() when it has
such a limit, together with two helpers returning the smaller of the
target and controller values for each direction.

Both inputs use 0 to mean "no limit reported", so the helpers combine
them with min_not_zero() and return 0 only when neither side reports
one, leaving each caller to apply its own default. struct
i3c_device_info keeps the raw target values untouched.

The returned value applies to a single message. A controller is free to
budget its buffer across every message in one i3c_device_do_xfers()
call, so a caller batching several messages in the same direction may
still be rejected.

Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
---
 drivers/i3c/device.c       | 49 ++++++++++++++++++++++++++++++++++++++
 include/linux/i3c/device.h |  3 +++
 include/linux/i3c/master.h | 13 +++++++---
 3 files changed, 62 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index 4df4682af150..588f66b3af6d 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -9,6 +9,7 @@
 #include <linux/bug.h>
 #include <linux/completion.h>
 #include <linux/device.h>
+#include <linux/minmax.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
 
@@ -106,6 +107,54 @@ void i3c_device_get_info(const struct i3c_device *dev,
 }
 EXPORT_SYMBOL_GPL(i3c_device_get_info);
 
+/**
+ * i3c_device_get_max_read_xfer_bytes() - get the maximum readable message size
+ *
+ * @dev: device the transfers would be directed to
+ *
+ * Return: the smaller of @dev's MRL and the controller's receive limit for a
+ * single message, or 0 if neither reports a limit.
+ */
+u16 i3c_device_get_max_read_xfer_bytes(const struct i3c_device *dev)
+{
+	u16 mrl = 0, rx_fifo_bytes = 0;
+
+	i3c_bus_normaluse_lock(dev->bus);
+	if (dev->desc) {
+		mrl = dev->desc->info.max_read_len;
+		rx_fifo_bytes = i3c_dev_get_master(dev->desc)->rx_fifo_bytes;
+	}
+	i3c_bus_normaluse_unlock(dev->bus);
+
+	/* 0 means "no limit reported" on either side. */
+	return min_not_zero(mrl, rx_fifo_bytes);
+}
+EXPORT_SYMBOL_GPL(i3c_device_get_max_read_xfer_bytes);
+
+/**
+ * i3c_device_get_max_write_xfer_bytes() - get the maximum writable message size
+ *
+ * @dev: device the transfers would be directed to
+ *
+ * Return: the smaller of @dev's MWL and the controller's transmit limit for a
+ * single message, or 0 if neither reports a limit.
+ */
+u16 i3c_device_get_max_write_xfer_bytes(const struct i3c_device *dev)
+{
+	u16 mwl = 0, tx_fifo_bytes = 0;
+
+	i3c_bus_normaluse_lock(dev->bus);
+	if (dev->desc) {
+		mwl = dev->desc->info.max_write_len;
+		tx_fifo_bytes = i3c_dev_get_master(dev->desc)->tx_fifo_bytes;
+	}
+	i3c_bus_normaluse_unlock(dev->bus);
+
+	/* 0 means "no limit reported" on either side. */
+	return min_not_zero(mwl, tx_fifo_bytes);
+}
+EXPORT_SYMBOL_GPL(i3c_device_get_max_write_xfer_bytes);
+
 /**
  * i3c_device_disable_ibi() - Disable IBIs coming from a specific device
  * @dev: device on which IBIs should be disabled
diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
index e30ea2cb13cb..cb3374e4f9fa 100644
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -331,6 +331,9 @@ int i3c_device_do_setdasa(struct i3c_device *dev);
 
 void i3c_device_get_info(const struct i3c_device *dev, struct i3c_device_info *info);
 
+u16 i3c_device_get_max_read_xfer_bytes(const struct i3c_device *dev);
+u16 i3c_device_get_max_write_xfer_bytes(const struct i3c_device *dev);
+
 struct i3c_ibi_payload {
 	unsigned int len;
 	const void *data;
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index d58070a72a49..3084cc7a21be 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -551,11 +551,16 @@ struct i3c_master_controller_ops {
  *            context (notably the resume path), and is skipped if the
  *            controller is shutting down
  * @dev_nack_retry_count: retry count when slave device nack
+ * @tx_fifo_bytes: maximum number of bytes this controller can transmit in a
+ *		   single message, or 0 if it has no such limit
+ * @rx_fifo_bytes: maximum number of bytes this controller can receive in a
+ *		   single message, or 0 if it has no such limit
  *
  * A &struct i3c_master_controller has to be registered to the I3C subsystem
- * through i3c_master_register(). None of &struct i3c_master_controller fields
- * should be set manually, just pass appropriate values to
- * i3c_master_register().
+ * through i3c_master_register(). Except for @tx_fifo_bytes and
+ * @rx_fifo_bytes, which a controller driver may set before registering, none
+ * of &struct i3c_master_controller fields should be set manually, just pass
+ * appropriate values to i3c_master_register().
  */
 struct i3c_master_controller {
 	struct device dev;
@@ -580,6 +585,8 @@ struct i3c_master_controller {
 	struct work_struct hj_work;
 	struct work_struct reg_work;
 	unsigned int dev_nack_retry_count;
+	u16 tx_fifo_bytes;
+	u16 rx_fifo_bytes;
 };
 
 /**
-- 
2.34.1

