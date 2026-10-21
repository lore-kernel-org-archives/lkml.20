Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792587466;
	b=MmEfHLNecNyFVM8473zS9giaFH0XQWOHbgl7L/yQy6Po/GSVfujnftjWVXFSUWoAItff
	 jPaR7cY+4mSxoEFaHUt7buxaT1Kkz7ucRL/D+0Meq3U+b5vAazSpG7WYKflFOi5+Tiip0
	 A0q/th1i5YJDB40Eb5dynLLfSP9YBapUgHq/zzGOlrGPOMZ/CXeP740QMNZF4d2C0cEcG
	 qAMYmS25hQVfQOcLRR71XblMVFWjahDG+CBO0PhGcEjdM1DCjC4W0m9P8u/56ky5LHcn7
	 Gr81QcWAugrKWK4/h5/oPbjiqWlwiS3i+Fa87iR9Rgoook5FKbrFQRXaor8p9/5aELw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587466;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
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
	bh=v6z7/40ZLCjV9piUnHGPVBDFOHF0W6q2hzZXdgn+uvw=;
	b=gW4Ir2uPb6KN19lBMrfNhDKO8c8aeDnQnqQLv4DYICD1075U9sm9pIaXS3nNM6MqHs5i
	 WiX7CrsQ33pH7LJlResBqvu5HNBjdByaGmTqJGZBPpw/ipckVkcCjbE1cWkKwLOQ5fGmB
	 muNphT0CGC3UL9fNSrub8PeSjybvRkGMFSjbgayS5dRV0O7N3p9bmmfw+GMi2jO5dF1vc
	 o2nfgZTrrM7vOh6Y0+zp0bvEGQoEgneXaIr6O9B57NnMAnvqMFctujo2qD+UU+dnhl+mb
	 jx/aMnInK37P8vtxu6r7aHve3dBqTA1Dvf4KDCCUGJtOI8U8G6Bh0fS4RhlR+aOi5uw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QgrBvXDQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.70
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012070.outbound.protection.outlook.com [40.107.209.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41A8606A31F;
	Wed, 21 Oct 2026 12:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F41A8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QgrBvXDQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FW5ktSwThOrW07WrSvS5yRuL34AvnRQoQhG+34EZAyyrxviR8ypVIV9NU/XJkLmMLFpV3poX7Ki23zbkSGuB5hPgXLWz5mGgyKTZFQWnoATd5KmIdF0D7uhqvV75xByqke6mNxQlqRsBmIa/XPD3I7anyJeQDnKTOP2ZTNrFEO9ETbE+HGtMzKobfWkGc1qH7OLySHGHyem2byNweNlhEPsW0Il9pWw59ooVu2d02P/Ef85gKfpcnbeJyVm2pZVA6Pfka/Bc+vODY5JyoxKv1mknGf/2GvbW8X5pjALcPbRoo5erAp8fdJ+TOMlFvMI39vsub2cMNs3EEPDbGjXixw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6z7/40ZLCjV9piUnHGPVBDFOHF0W6q2hzZXdgn+uvw=;
 b=jWGzVVa6gXiuXZr9BQg3+ZqXbpTaDavTNh9FmpW/6RcXYKg8HhdPFlwpGdzUq7wQi2iLTl5jjWC3ELcGiXL7rpump2FZmumBHmpA47UIkeoio75/ZNm1TqNVyMmJ3Ig/lIEImvWpuTP7b7GcmphuyfNEsArDr6LZKBqvOo+MwwQzpmjIriPQa/4S7YlUIaJHYyeF5O2O76v9gZXAo4evUaSp5frNbrkguCzyWWG/9TA939V3tybb0n//pso8xZEwlzdtTSwFytF7TWi1745p8yAQUxxm6B8kieW+9R9E0rtuzFGI94DrS61+duW7KW1hErY0TToOItvKtbcp4Kzunw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6z7/40ZLCjV9piUnHGPVBDFOHF0W6q2hzZXdgn+uvw=;
 b=QgrBvXDQ17ic97AxBMnclC5RKl/VO99bTuRUw3bAWyMouOOPCvRpXXJGaBlabYnrLhRKrK7WiMjx14XgPAyPtXgbxQBHwksu+pPZJs0QZ9ipP75UOirv4fuLfYa0usAXn8FLrzCDBltLFzZoHEdQOADR/ZlHf2U9b60vuZQjb1s=
Received: from MN0PR05CA0013.namprd05.prod.outlook.com (2603:10b6:208:52c::7)
 by DS7PR12MB6359.namprd12.prod.outlook.com (2603:10b6:8:94::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 12:57:37 +0000
Received: from BN7PEPF000000A4.namprd05.prod.outlook.com
 (2603:10b6:208:52c:cafe::82) by MN0PR05CA0013.outlook.office365.com
 (2603:10b6:208:52c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Wed,
 21 Oct 2026 12:57:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN7PEPF000000A4.mail.protection.outlook.com (10.167.245.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 12:57:37 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 21 Oct
 2026 07:57:36 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 21 Oct
 2026 07:57:36 -0500
Received: from xhdrveggala50x.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Wed, 21 Oct 2026 07:57:32 -0500
From: Rama devi Veggalam <rama.devi.veggalam@amd.com>
To: <bp@alien8.de>, <tony.luck@intel.com>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <james.morse@arm.com>, <mchehab@kernel.org>,
	<rric@kernel.org>, <git@amd.com>, Rama devi Veggalam
	<rama.devi.veggalam@amd.com>
Subject: [PATCH v4 2/3] firmware: xilinx: Add XilSEM firmware interface
Date: Wed, 21 Oct 2026 18:27:21 +0530
Message-ID: <1792587442-2794880-3-git-send-email-rama.devi.veggalam@amd.com>
X-Mailer: git-send-email 1.9.5
In-Reply-To: <1792587442-2794880-1-git-send-email-rama.devi.veggalam@amd.com>
References: <1792587442-2794880-1-git-send-email-rama.devi.veggalam@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A4:EE_|DS7PR12MB6359:EE_
X-MS-Office365-Filtering-Correlation-Id: 89c4c29d-1987-4c04-a483-08df2f72e1e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|7416014|23010399003|56012099006|5023799004|11063799006|261009223027099003|18002099003|22082099003|6133799003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	wKat01VPJrGLG4rUBUqdXyrpldS1Il7UbC5CvhjkcmRYDEv8qnkwZfU5k4d6M+Xv5FN/O656nJvlV7Z2MiNFAW8ycxbGKrnS2uQiaiNuN6JJpq4g/k+olq36rk3+yuj8qf8C6WykDgYO/B0DDakPGrvwfJ+2qcMZdzsPcC/7XE10035sHrbOpSIsv6pIPje1fEUo3vCK5auQeAJ/4X7USLUpFRkkyXy1THLdvggjFD7jCSGO2Pqg2itRktyQqCPz8wAypHSxl5ipxJ1WIWmWLNHa3OVS7zsW7dktKA3JQaOhJQjB2iDbBaoDfH4OHdhde++xLn2N2ZRNZI/jeAiLLtWHZ105wMFywADlnrHj/mtyhK8IxWpCeb8ScPvBZPx1XdsA4zylIjUrKBztL+MfUO/KvAOaCe+dqYhf+4n9wGsGX2vRMheq5/OUU34Bqk6o+utfBW+5ouplePxLEUmbi2RTymJAPZXgX7peQ2p5C+jJZRHZWJachMXdiNiz/1R0p0kRUF8zMo2l+6puT48aldI0l9OvjeLeRC7r9IT2o+c/Q50/7j2vwaNBKMTk94ErYDcujX3gzmEBJyLuyzbz2c4/d0nakUMmK0iazKezqDajC7G+ESI+mvfKrRdpvenk0gVz8a4WVvyWv+T1QQ1OiQSPGUpD03Bid8r75BYKtMEhMxEiVhPM5kceVQQKT9Y6P2YPxp3GhO1JeRq6lOOI9A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(7416014)(23010399003)(56012099006)(5023799004)(11063799006)(261009223027099003)(18002099003)(22082099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5ATG11VAgrGHVFXP3AYTDE5GQuuT7RskDqqIW0IRaX8nww2k/Hcg+gX2EweEFf1X3Vn0ZzmBBY0QjfD9mYvMLIUibR9HngHXWGi3nslpiv0x+iSgB3TN0EY9p+mNNyIsk0K/RQ1998PTWK/pGdyrlnEaW9dLp2ElxN5SRzIqeXYaoLz9fhnE0VdO7EXwVv7UhqPLfwX8uMV/cnZXjefNHgaCafCb0pxYqnapZ0XvEB6KdR3UuH0WIspNiOmGw8Tnw9B5HvMuxrDrjsPLPGOFYhLMhvHND9nhp39Y5KHlm0h6NpTvl9ck58zAAMtXwJt9/yV9OujloNKd7w9UtfaJhf4FCaBZ9z/xXPZO/G4FQQVhBEiml3oJzhoT5RE4G2FAWpOMqnGW3jZFNYHbhpHfKvIFMHGS+S70lQqmhcfZqOUVC/fL8kLtVW3MWgEtxAKf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 12:57:37.2424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c4c29d-1987-4c04-a483-08df2f72e1e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6359

Add the firmware EEMI interface used by the Versal XilSEM (Xilinx
Soft Error Mitigation) EDAC driver. XilSEM runs as part of the
Platform Loader and Manager (PLM) on the PMC and performs CRAM/NPI
scan and error-injection operations on request from Linux.

Add drivers/firmware/xilinx/zynqmp-sem.c with the
zynqmp_pm_xilsem_*() wrapper functions (scan control, error
injection, ECC read, config read, SSIT status read, CRC read, total
SSIT frame count).

Add XilSEM error event node ID and error masks, used to register for
event notification.

Update xlnx_event_manager.c to recognize the new SW_ERR node ID as a
valid error event for both the Versal and Versal NET family codes.

Signed-off-by: Rama devi Veggalam <rama.devi.veggalam@amd.com>
---
Changes in v4:
- Added XilSEM error-event node ID and error masks to the existing
  include/linux/firmware/xlnx-zynqmp.h, used to register for error
  event notification.
- Updated xlnx_event_manager.c to recognize the new SW_ERR node ID as
  a valid error event for both Versal and Versal NET.
- Added full SSIT (multi-die) support.
- Changed all firmware responses to use typed struct xsem_*_response *
  output parameters (7 response structs) instead of raw buffers.
- Added xsem_narrow_dma_addr() to validate and narrow coherent DMA
  addresses for the two calls that take a DMA buffer.
- Added NPI error injection as its own scan-control operation, CRAM
  error injection has its own dedicated call and is not reachable
  through the generic control-ops entry point.

Changes in v3:
- created separate file for Xilsem ATF EEMI calls.

Changes in v2:
- Patch created on top of dependent patch series
"enhance zynqmp_pm_get_family_info()"
- Removed non-relevant SOB names in error event header files
- Updated copyright information
- Merged Versal and Versal NET error event definitions to firmware patch

---
 drivers/firmware/xilinx/Makefile         |   2 +-
 drivers/firmware/xilinx/zynqmp-sem.c     | 229 +++++++++++++++++++++++++++++++
 drivers/soc/xilinx/xlnx_event_manager.c  |  16 ++-
 include/linux/firmware/xlnx-zynqmp-sem.h | 196 ++++++++++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h     |  50 +++++++
 5 files changed, 490 insertions(+), 3 deletions(-)
 create mode 100644 drivers/firmware/xilinx/zynqmp-sem.c
 create mode 100644 include/linux/firmware/xlnx-zynqmp-sem.h

diff --git a/drivers/firmware/xilinx/Makefile b/drivers/firmware/xilinx/Makefile
index 8db0e66..a71919a 100644
--- a/drivers/firmware/xilinx/Makefile
+++ b/drivers/firmware/xilinx/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for Xilinx firmwares
 
-obj-$(CONFIG_ZYNQMP_FIRMWARE) += zynqmp.o zynqmp-ufs.o zynqmp-crypto.o
+obj-$(CONFIG_ZYNQMP_FIRMWARE) += zynqmp.o zynqmp-ufs.o zynqmp-crypto.o zynqmp-sem.o
 obj-$(CONFIG_ZYNQMP_FIRMWARE_DEBUG) += zynqmp-debug.o
diff --git a/drivers/firmware/xilinx/zynqmp-sem.c b/drivers/firmware/xilinx/zynqmp-sem.c
new file mode 100644
index 0000000..599033f
--- /dev/null
+++ b/drivers/firmware/xilinx/zynqmp-sem.c
@@ -0,0 +1,229 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Firmware layer for XilSEM APIs.
+ *
+ * Copyright (C), 2026 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/export.h>
+#include <linux/firmware/xlnx-zynqmp.h>
+#include <linux/firmware/xlnx-zynqmp-sem.h>
+#include <linux/string.h>
+#include <linux/wordpart.h>
+
+/**
+ * xsem_narrow_dma_addr - Validate and narrow a coherent DMA address for the
+ *			  XilSEM SMC calling convention
+ * @bufaddr:	Coherent DMA buffer address. Must be representable in 32 bits
+ *		(e.g. obtained under dma_set_mask_and_coherent(..,
+ *		DMA_BIT_MASK(32))) - the XilSEM SMC calls cross the calling
+ *		convention as a single u32, so any upper bits are rejected
+ *		rather than silently dropped.
+ * @out:	Output: the lower 32 bits of bufaddr. Valid only if this
+ *		function returns 0.
+ *
+ * Return: 0 on success, -EINVAL if bufaddr is not representable in 32 bits.
+ */
+static int xsem_narrow_dma_addr(dma_addr_t bufaddr, u32 *out)
+{
+	if (upper_32_bits(bufaddr))
+		return -EINVAL;
+
+	*out = lower_32_bits(bufaddr);
+
+	return 0;
+}
+
+/**
+ * zynqmp_pm_xilsem_cntrl_ops - PM call to perform XilSEM operations
+ * @cmd:	Command for XilSEM scan control operations
+ * @slrid:	SLR (Super Logic Region, i.e. die) id on which scan operation to be done
+ * @response:	Output response
+ *
+ * Return: Returns 0 on success or error value on failure.
+ */
+int zynqmp_pm_xilsem_cntrl_ops(u32 cmd, u32 slrid, struct xsem_cntrl_ops_response *response)
+{
+	u32 ret_buf[PAYLOAD_ARG_CNT];
+	int ret;
+
+	switch (cmd) {
+	case PM_XSEM_CRAM_INIT_SCAN:
+	case PM_XSEM_CRAM_START_SCAN:
+	case PM_XSEM_CRAM_STOP_SCAN:
+	case PM_XSEM_NPI_START_SCAN:
+	case PM_XSEM_NPI_STOP_SCAN:
+	case PM_XSEM_NPI_ERR_INJECT:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = zynqmp_pm_invoke_fn(PM_XSEM_HEADER | cmd, ret_buf, 1, slrid);
+	if (ret)
+		return ret;
+
+	memcpy(response, &ret_buf[1], sizeof(*response));
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_xilsem_cntrl_ops);
+
+/**
+ * zynqmp_pm_xilsem_cram_err_inj - PM call to perform CRAM error injection
+ * @slrid:	SLR id to inject error in CRAM
+ * @frame:	Frame number to be used for error injection
+ * @qword:	Word number to be used for error injection
+ * @bit:	Bit location to be used for error injection
+ * @row:	CFRAME row number to be used for error injection
+ * @response:	Output response
+ *
+ * Return: Returns 0 on success or error value on failure.
+ */
+int zynqmp_pm_xilsem_cram_err_inj(u32 slrid, u32 frame, u32 qword, u32 bit, u32 row,
+				  struct xsem_cram_errinj_response *response)
+{
+	u32 ret_buf[PAYLOAD_ARG_CNT];
+	int ret;
+
+	ret = zynqmp_pm_invoke_fn(PM_XSEM_CRAM_ERRINJ, ret_buf, 5, slrid, frame, qword, bit, row);
+	if (ret)
+		return ret;
+
+	memcpy(response, &ret_buf[1], sizeof(*response));
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_xilsem_cram_err_inj);
+
+/**
+ * zynqmp_pm_xilsem_cram_read_ecc - PM call to perform CFRAME ECC read
+ * @slrid:	SLR id on which Frame ECC read to be done
+ * @frame:	Frame number to be used for reading ECC
+ * @row:	CFRAME row number to be used for reading ECC
+ * @response:	Output response
+ *
+ * Return: Returns 0 on success or error value on failure.
+ */
+int zynqmp_pm_xilsem_cram_read_ecc(u32 slrid, u32 frame, u32 row,
+				   struct xsem_cram_readecc_response *response)
+{
+	u32 ret_buf[PAYLOAD_ARG_CNT];
+	int ret;
+
+	ret = zynqmp_pm_invoke_fn(PM_XSEM_CRAM_RD_ECC, ret_buf, 3, slrid, frame, row);
+	if (ret)
+		return ret;
+
+	memcpy(response, &ret_buf[1], sizeof(*response));
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_xilsem_cram_read_ecc);
+
+/**
+ * zynqmp_pm_xilsem_read_cfg - PM call to perform Xilsem configuration read
+ * @slrid:	SLR id for which configuration to be read
+ * @response:	Output response
+ *
+ * Return: Returns 0 on success or error value on failure.
+ */
+int zynqmp_pm_xilsem_read_cfg(u32 slrid, struct xsem_read_cfg_response *response)
+{
+	u32 ret_buf[PAYLOAD_ARG_CNT];
+	int ret;
+
+	ret = zynqmp_pm_invoke_fn(PM_XSEM_RD_CONFIG, ret_buf, 1, slrid);
+	if (ret)
+		return ret;
+
+	memcpy(response, &ret_buf[1], sizeof(*response));
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_xilsem_read_cfg);
+
+/**
+ * zynqmp_pm_xilsem_read_ssit_status - PM call to perform Xilsem SSIT status
+ * @slrid:	SLR id for which ECC read to be done
+ * @bufaddr:	Coherent DMA buffer address to get the status information.
+ *		See xsem_narrow_dma_addr().
+ * @response:	Output response
+ *
+ * Return: Returns 0 on success or error value on failure.
+ */
+int zynqmp_pm_xilsem_read_ssit_status(u32 slrid, dma_addr_t bufaddr,
+				      struct xsem_read_ssit_status_response *response)
+{
+	u32 ret_buf[PAYLOAD_ARG_CNT];
+	u32 addr;
+	int ret;
+
+	ret = xsem_narrow_dma_addr(bufaddr, &addr);
+	if (ret)
+		return ret;
+
+	ret = zynqmp_pm_invoke_fn(PM_XSEM_SSIT_RD_STS, ret_buf, 2, slrid, addr);
+	if (ret)
+		return ret;
+
+	memcpy(response, &ret_buf[1], sizeof(*response));
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_xilsem_read_ssit_status);
+
+/**
+ * zynqmp_pm_xilsem_cram_get_crc - PM call to perform CRAM Row CRC read
+ * @slrid:	SLR id for which CRC read to be done
+ * @rowindex:	CFRAME row number to be used for reading CRC
+ * @response:	Output response
+ *
+ * Return: Returns 0 on success or error value on failure.
+ */
+int zynqmp_pm_xilsem_cram_get_crc(u32 slrid, u32 rowindex,
+				  struct xsem_cram_getcrc_response *response)
+{
+	u32 ret_buf[PAYLOAD_ARG_CNT];
+	int ret;
+
+	ret = zynqmp_pm_invoke_fn(PM_XSEM_SSIT_GET_CRC, ret_buf, 2, slrid, rowindex);
+	if (ret)
+		return ret;
+
+	memcpy(response, &ret_buf[1], sizeof(*response));
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_xilsem_cram_get_crc);
+
+/**
+ * zynqmp_pm_xilsem_cram_ssit_tot_frames - PM call to perform total frames read
+ * @slrid:	SLR id for which total frames read to be done
+ * @row:	CFRAME row number to be used for reading ECC
+ * @bufaddr:	Coherent DMA buffer address to get total frames data.
+ *		See xsem_narrow_dma_addr().
+ * @response:	Output response
+ *
+ * Return: Returns 0 on success or error value on failure.
+ */
+int zynqmp_pm_xilsem_cram_ssit_tot_frames(u32 slrid, u32 row, dma_addr_t bufaddr,
+					  struct xsem_cram_ssit_totframes_response *response)
+{
+	u32 ret_buf[PAYLOAD_ARG_CNT];
+	u32 addr;
+	int ret;
+
+	ret = xsem_narrow_dma_addr(bufaddr, &addr);
+	if (ret)
+		return ret;
+
+	ret = zynqmp_pm_invoke_fn(PM_XSEM_SSIT_GET_FRAMES, ret_buf, 3, slrid, row, addr);
+	if (ret)
+		return ret;
+
+	memcpy(response, &ret_buf[1], sizeof(*response));
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(zynqmp_pm_xilsem_cram_ssit_tot_frames);
diff --git a/drivers/soc/xilinx/xlnx_event_manager.c b/drivers/soc/xilinx/xlnx_event_manager.c
index f733dc4..d832ee6 100644
--- a/drivers/soc/xilinx/xlnx_event_manager.c
+++ b/drivers/soc/xilinx/xlnx_event_manager.c
@@ -75,6 +75,16 @@ struct registered_event_data {
 	struct hlist_node hentry;
 };
 
+/*
+ * Error-event node ids are per-family firmware IDs, packed at
+ * 0x28100000 + n * 0x4000. The same value names different nodes on
+ * different families: 0x28110000 is VERSAL_EVENT_ERROR_SW_ERR and
+ * VERSAL_NET_EVENT_ERROR_PSM_ERR2. Compare a node_id only inside the
+ * arm for the family that owns it. For this predicate the overlap does
+ * not change the result, because 0x28110000 is an error-event node on
+ * every family that defines it. The family split is required for ids
+ * that exist in only one table.
+ */
 static bool xlnx_is_error_event(const u32 node_id)
 {
 	u32 pm_family_code;
@@ -85,7 +95,8 @@ static bool xlnx_is_error_event(const u32 node_id)
 		if (node_id == VERSAL_EVENT_ERROR_PMC_ERR1 ||
 		    node_id == VERSAL_EVENT_ERROR_PMC_ERR2 ||
 		    node_id == VERSAL_EVENT_ERROR_PSM_ERR1 ||
-		    node_id == VERSAL_EVENT_ERROR_PSM_ERR2)
+		    node_id == VERSAL_EVENT_ERROR_PSM_ERR2 ||
+		    node_id == VERSAL_EVENT_ERROR_SW_ERR)
 			return true;
 	} else if (pm_family_code == PM_VERSAL_NET_FAMILY_CODE) {
 		if (node_id == VERSAL_NET_EVENT_ERROR_PMC_ERR1 ||
@@ -94,7 +105,8 @@ static bool xlnx_is_error_event(const u32 node_id)
 		    node_id == VERSAL_NET_EVENT_ERROR_PSM_ERR1 ||
 		    node_id == VERSAL_NET_EVENT_ERROR_PSM_ERR2 ||
 		    node_id == VERSAL_NET_EVENT_ERROR_PSM_ERR3 ||
-		    node_id == VERSAL_NET_EVENT_ERROR_PSM_ERR4)
+		    node_id == VERSAL_NET_EVENT_ERROR_PSM_ERR4 ||
+		    node_id == VERSAL_NET_EVENT_ERROR_SW_ERR)
 			return true;
 	}
 
diff --git a/include/linux/firmware/xlnx-zynqmp-sem.h b/include/linux/firmware/xlnx-zynqmp-sem.h
new file mode 100644
index 0000000..f2b66cd
--- /dev/null
+++ b/include/linux/firmware/xlnx-zynqmp-sem.h
@@ -0,0 +1,196 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Firmware layer for XilSEM APIs.
+ *
+ * Copyright (C), 2026 Advanced Micro Devices, Inc.
+ */
+
+#ifndef __FIRMWARE_ZYNQMP_SEM_H__
+#define __FIRMWARE_ZYNQMP_SEM_H__
+
+#include <linux/types.h>
+
+/* XilSEM commands */
+#define PM_XSEM_HEADER			0x300
+#define PM_XSEM_CRAM_ERRINJ		0x304
+#define PM_XSEM_RD_CONFIG		0x309
+#define PM_XSEM_CRAM_RD_ECC		0x30B
+#define PM_XSEM_SSIT_GET_CRC		0x30C
+#define PM_XSEM_SSIT_RD_STS		0x30D
+#define PM_XSEM_SSIT_GET_FRAMES		0x30E
+
+/*
+ * Valid cmd values for zynqmp_pm_xilsem_cntrl_ops(). CRAM error injection
+ * has its own dedicated firmware call (zynqmp_pm_xilsem_cram_err_inj()) and
+ * must not be reachable through this generic entry point, so it is
+ * deliberately not a member of this enum.
+ */
+enum pm_xsem_cntrl_op {
+	PM_XSEM_CRAM_INIT_SCAN = 1,
+	PM_XSEM_CRAM_START_SCAN = 2,
+	PM_XSEM_CRAM_STOP_SCAN = 3,
+	PM_XSEM_NPI_START_SCAN = 5,
+	PM_XSEM_NPI_STOP_SCAN = 6,
+	PM_XSEM_NPI_ERR_INJECT = 7,
+};
+
+/**
+ * struct xsem_cntrl_ops_response - Response to zynqmp_pm_xilsem_cntrl_ops()
+ * @hdr:	Command header
+ * @status:	Error code or status
+ * @slrid:	SLR id
+ * @status1:	Reserved for future use
+ * @status2:	Reserved for future use
+ * @status3:	Reserved for future use
+ */
+struct xsem_cntrl_ops_response {
+	u32 hdr;
+	u32 status;
+	u32 slrid;
+	u32 status1;
+	u32 status2;
+	u32 status3;
+};
+
+/**
+ * struct xsem_cram_errinj_response - Response to zynqmp_pm_xilsem_cram_err_inj()
+ * @hdr:	Command header
+ * @status:	Error code or status
+ * @slrid:	SLR id
+ */
+struct xsem_cram_errinj_response {
+	u32 hdr;
+	u32 status;
+	u32 slrid;
+};
+
+/**
+ * struct xsem_cram_readecc_response - Response to zynqmp_pm_xilsem_cram_read_ecc()
+ * @hdr:	Frame ECC read command header
+ * @ecc0:	First ECC word
+ * @ecc1:	Second ECC word
+ * @status:	Status
+ */
+struct xsem_cram_readecc_response {
+	u32 hdr;
+	u32 ecc0;
+	u32 ecc1;
+	u32 status;
+};
+
+/**
+ * struct xsem_read_cfg_response - Response to zynqmp_pm_xilsem_read_cfg()
+ * @hdr:	Config read command header
+ * @cram_cfg:	CRAM scan configuration
+ * @npi_cfg:	NPI scan configuration
+ * @status:	Status
+ */
+struct xsem_read_cfg_response {
+	u32 hdr;
+	u32 cram_cfg;
+	u32 npi_cfg;
+	u32 status;
+};
+
+/**
+ * struct xsem_read_ssit_status_response - Response to
+ *					    zynqmp_pm_xilsem_read_ssit_status()
+ * @hdr:	Status read command header
+ * @slrid:	SLR id
+ */
+struct xsem_read_ssit_status_response {
+	u32 hdr;
+	u32 slrid;
+};
+
+/**
+ * struct xsem_cram_getcrc_response - Response to zynqmp_pm_xilsem_cram_get_crc()
+ * @hdr:	Get CRC command header
+ * @crc0:	First CRC word
+ * @crc1:	Second CRC word
+ * @crc2:	Third CRC word
+ * @crc3:	Fourth CRC word
+ * @status:	Status
+ */
+struct xsem_cram_getcrc_response {
+	u32 hdr;
+	u32 crc0;
+	u32 crc1;
+	u32 crc2;
+	u32 crc3;
+	u32 status;
+};
+
+/**
+ * struct xsem_cram_ssit_totframes_response - Response to
+ *					       zynqmp_pm_xilsem_cram_ssit_tot_frames()
+ * @hdr:	Total frames command header
+ * @slrid:	SLR id
+ * @row:	CFRAME row number
+ * @status:	Status
+ */
+struct xsem_cram_ssit_totframes_response {
+	u32 hdr;
+	u32 slrid;
+	u32 row;
+	u32 status;
+};
+
+#if IS_REACHABLE(CONFIG_ZYNQMP_FIRMWARE)
+int zynqmp_pm_xilsem_cntrl_ops(u32 cmd, u32 slrid, struct xsem_cntrl_ops_response *response);
+int zynqmp_pm_xilsem_cram_err_inj(u32 slrid, u32 frame, u32 qword, u32 bit, u32 row,
+				  struct xsem_cram_errinj_response *response);
+int zynqmp_pm_xilsem_cram_read_ecc(u32 slrid, u32 frame, u32 row,
+				   struct xsem_cram_readecc_response *response);
+int zynqmp_pm_xilsem_read_cfg(u32 slrid, struct xsem_read_cfg_response *response);
+int zynqmp_pm_xilsem_read_ssit_status(u32 slrid, dma_addr_t bufaddr,
+				      struct xsem_read_ssit_status_response *response);
+int zynqmp_pm_xilsem_cram_get_crc(u32 slrid, u32 rowindex,
+				  struct xsem_cram_getcrc_response *response);
+int zynqmp_pm_xilsem_cram_ssit_tot_frames(u32 slrid, u32 row, dma_addr_t bufaddr,
+					  struct xsem_cram_ssit_totframes_response *response);
+#else
+static inline int zynqmp_pm_xilsem_cntrl_ops(u32 cmd, u32 slrid,
+					     struct xsem_cntrl_ops_response *response)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_xilsem_cram_err_inj(u32 slrid, u32 frame, u32 qword, u32 bit, u32 row,
+						struct xsem_cram_errinj_response *response)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_xilsem_cram_read_ecc(u32 slrid, u32 frame, u32 row,
+						 struct xsem_cram_readecc_response *response)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_xilsem_read_cfg(u32 slrid, struct xsem_read_cfg_response *response)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_xilsem_read_ssit_status(u32 slrid, dma_addr_t bufaddr,
+						    struct xsem_read_ssit_status_response *response)
+{
+	return -ENODEV;
+}
+
+static inline int zynqmp_pm_xilsem_cram_get_crc(u32 slrid, u32 rowindex,
+						struct xsem_cram_getcrc_response *response)
+{
+	return -ENODEV;
+}
+
+static inline int
+zynqmp_pm_xilsem_cram_ssit_tot_frames(u32 slrid, u32 row, dma_addr_t bufaddr,
+				      struct xsem_cram_ssit_totframes_response *response)
+{
+	return -ENODEV;
+}
+#endif
+
+#endif /* __FIRMWARE_ZYNQMP_SEM_H__ */
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index f4b3df6..80ca1dc 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -121,6 +121,12 @@
 #define VERSAL_EVENT_ERROR_PMC_ERR2	(0x28104000U)
 #define VERSAL_EVENT_ERROR_PSM_ERR1	(0x28108000U)
 #define VERSAL_EVENT_ERROR_PSM_ERR2	(0x2810C000U)
+/*
+ * SW Error Event Node Id (0x4000 stride from PSM_ERR2 above). This
+ * value coincidentally equals VERSAL_NET_EVENT_ERROR_PSM_ERR2 below -
+ * harmless, since each family's node IDs are an independent sequence.
+ */
+#define VERSAL_EVENT_ERROR_SW_ERR	(0x28110000U)
 
 #define VERSAL_NET_EVENT_ERROR_PMC_ERR1	(0x28100000U)
 #define VERSAL_NET_EVENT_ERROR_PMC_ERR2	(0x28104000U)
@@ -129,6 +135,8 @@
 #define VERSAL_NET_EVENT_ERROR_PSM_ERR2	(0x28110000U)
 #define VERSAL_NET_EVENT_ERROR_PSM_ERR3	(0x28114000U)
 #define VERSAL_NET_EVENT_ERROR_PSM_ERR4	(0x28118000U)
+/* SW Error Event Node Id */
+#define VERSAL_NET_EVENT_ERROR_SW_ERR	(0x2811C000U)
 
 /* ZynqMP SD tap delay tuning */
 #define SD_ITAPDLY	0xFF180314
@@ -146,6 +154,48 @@
 #define XPM_EVENT_ERROR_MASK_NOC_NCR		BIT(13)
 #define XPM_EVENT_ERROR_MASK_NOC_CR		BIT(12)
 
+/*
+ * XPM_VERSAL_EVENT_ERROR_MASK_XSEM_CRAM_CE_5: Error event mask for handling
+ * correctable error in Versal Configuration RAM which is reported by
+ * Soft Error Mitigation (XilSEM).
+ */
+#define XPM_VERSAL_EVENT_ERROR_MASK_XSEM_CRAM_CE_5		BIT(5)
+
+/*
+ * XPM_VERSAL_EVENT_ERROR_MASK_XSEM_CRAM_UE_6: Error event mask for handling
+ * uncorrectable error in Versal Configuration RAM which is reported by
+ * Soft Error Mitigation (XilSEM).
+ */
+#define XPM_VERSAL_EVENT_ERROR_MASK_XSEM_CRAM_UE_6		BIT(6)
+
+/*
+ * XPM_VERSAL_EVENT_ERROR_MASK_XSEM_NPI_UE_7: Error event mask for handling
+ * uncorrectable error in Versal NoC programming interface (NPI)
+ * register which is reported by Soft Error Mitigation (XilSEM).
+ */
+#define XPM_VERSAL_EVENT_ERROR_MASK_XSEM_NPI_UE_7		BIT(7)
+
+/*
+ * XPM_VERSAL_NET_EVENT_ERROR_MASK_XSEM_CRAM_CE: Error event mask for handling
+ * correctable error in Versal Configuration RAM which is reported by
+ * Soft Error Mitigation (XilSEM).
+ */
+#define XPM_VERSAL_NET_EVENT_ERROR_MASK_XSEM_CRAM_CE		BIT(7)
+
+/*
+ * XPM_VERSAL_NET_EVENT_ERROR_MASK_XSEM_CRAM_UE: Error event mask for handling
+ * uncorrectable error in Versal Configuration RAM which is reported by
+ * Soft Error Mitigation (XilSEM).
+ */
+#define XPM_VERSAL_NET_EVENT_ERROR_MASK_XSEM_CRAM_UE		BIT(8)
+
+/*
+ * XPM_VERSAL_NET_EVENT_ERROR_MASK_XSEM_NPI_UE: Error event mask for handling
+ * uncorrectable error in Versal NoC programming interface (NPI)
+ * register which is reported by Soft Error Mitigation (XilSEM).
+ */
+#define XPM_VERSAL_NET_EVENT_ERROR_MASK_XSEM_NPI_UE		BIT(9)
+
 /* Node ID for all peripheral devices */
 #define PM_DEV_ALL_PERIPH	0x18224FFFU
 
-- 
1.9.5

