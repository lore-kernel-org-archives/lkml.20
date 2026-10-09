Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011015.outbound.protection.outlook.com [40.107.208.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78ED72DB7BE
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 22:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791586434; cv=fail; b=ASqhao07xjtHrUy8QoKBo2PQe9Qv7M7OBhhn7nE9vFf4x+Z7h3l2p7e98NoqS2GWmH7KBjawRgwWYReu/qm+5ihU1XriYuOH094WTJeAAo8GDR2t9Q5rj7V1BhtnKvkJebwSSBdXTspQFEhq+IV20G+pTsn5ph6reACkHuCJIag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791586434; c=relaxed/simple;
	bh=D9qtpuIzWKXuj/V5gNMPh4FVCXcggkZ5XgNZ6CiF5DE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c0eZ5aGVuuLylo+q2YpQPRtCgzrbc/c8/zxWE5NFgAVVmUSHM2e8Dsgl5wur2Om0DDcuPQ7C82N056xMxWPwT+WrnnfDxCM0/E8OwR7JhbBwx3k1JzuZS6AgH5McBkBatfD0uXzGR6akMqCBZfuENsczePsBX0M0rFjvA9aY4Zk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=l2LNbjP0; arc=fail smtp.client-ip=40.107.208.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="l2LNbjP0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZxzD15ihRKr0oA1X4FtoAEKQXNAey5yr9mjMVLVdKZhgLIvhdoRi+3z3p9gz2Q5utkwq5FCz+hcnklGrO63zF0r/Wib6CzC3G7+dn3JxvzQaGmTrTB/uN1uwtgNVQkNH/wnYuEdDWQrDKDMO/KabFPxrGf9fxk0skF18hMEcs8+BZyfQSuYkpAIgnZvrYO1dlChTVKts2d/QoisL25yFmsYA3tGYBbaVbUef6qa6phRCygXkZb+pFhk0O+E9kwt+jPVbvnrpsWrS9LlL4xDG9b+ahn06fCs56WIqcKmFgTi0cs5k5IONkM74WzjBL66U6PzageSb/04ovdXLT/22A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rF1u17LOajU99h9A93l3jH0PLIzkE6/S40gRuQo2Yto=;
 b=PvMsXfJtdM25lMPdQKaTx9fX/QI2DPFgMvM2krzkz+imhSY1o0TLXIh+BO+3ySa6Q5iLNB50CV6AkDsocVINcTlxApimEMYOpyoxX5jYfQW71r/Wh5kcMieAgUK06ECX0Lif1SCPgMjz9uHNTVx2AcbJ93vzHMeCH8CgvTPfZ21djIj0G3Wv/vgRp2nyyAEV0DGnz7DTrnGucjsFUWLh4+cmCsOO4vifS9cJbLU6xBhfepd+gaXVkBxAlM+46pQxnWkclhlBlKGEjSLlNW9Ldv/28nymVRHbNw17VWtEzKe75PP2gO8r60zMybN0iBF7aVW7LznjQ4zUAJnGCEnwNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rF1u17LOajU99h9A93l3jH0PLIzkE6/S40gRuQo2Yto=;
 b=l2LNbjP0dp97DWnBN6xB0Ki7H3WhmXKOJCasTr/NCObk7tpBSN/qWKfZLY5qUyMnF6/3dRgkv8Tg3tHgUTCCz2s8hL117mKTKeOHsjw1j4RdqvEpo9EL2u8lmHfdZn716ybtdClnm5TlCQ4dIs4ACWb3OvYUTrkIYfTv3gPY/wI=
Received: from BN0PR04CA0017.namprd04.prod.outlook.com (2603:10b6:408:ee::22)
 by MN0PR12MB5740.namprd12.prod.outlook.com (2603:10b6:208:373::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Fri, 9 Oct
 2026 22:53:48 +0000
Received: from BN3PEPF00022BC1.namprd04.prod.outlook.com
 (2603:10b6:408:ee:cafe::2f) by BN0PR04CA0017.outlook.office365.com
 (2603:10b6:408:ee::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 9
 Oct 2026 22:53:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF00022BC1.mail.protection.outlook.com (10.167.248.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 22:53:47 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 9 Oct
 2026 17:53:42 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 9 Oct
 2026 17:53:42 -0500
Received: from xsjdavidzha51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 9 Oct 2026 17:53:42 -0500
From: David Zhang <yidong.zhang@amd.com>
To: <quic_jhugo@quicinc.com>, <karol.wachowski@linux.intel.com>,
	<max.zhen@amd.com>, <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: David Zhang <yidong.zhang@amd.com>, <sonal.santan@amd.com>,
	<mario.limonciello@amd.com>
Subject: [PATCH V4 01/19] accel/amdxdna: Rename NPU3 firmware files
Date: Fri, 9 Oct 2026 15:53:25 -0700
Message-ID: <20261009225343.3079074-2-yidong.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009225343.3079074-1-yidong.zhang@amd.com>
References: <yidong.zhang@amd.com>
 <20261009225343.3079074-1-yidong.zhang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC1:EE_|MN0PR12MB5740:EE_
X-MS-Office365-Filtering-Correlation-Id: a2c3c9c4-4d5c-4af1-6b08-08df26582de8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|376014|36860700016|56012099006|11063799006|4143699003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	MJTi28TEqJtth+2JOT5xThUoV2ij0Bsi/mxg4pvnF3ZXVhdSAC1Ws3InpAhFAHHFaeKsrwhMbIkLNUU4+trj7qQyrYS4dJXD6ZdBOuT6OVlZLUuDM0nw72FYpChBAgWOx/hIWa4lqKdLCyCAQM+mMadAIYskujypfG6GfYlM2D36nKCvNb0lnWWkxaWw/Z1+vQQuAByhJk/IT4sUL9qxr9npvHfpTvFokMHm4gQEmyBKO04TJmq9xZzwbR+0uYDo3i3oAr6UAypKrhWWexezThSGyxQVTchB0s3V/K/oIRQx+OOAaa7VTzcq7eJW0LZLo+JML6eKf5T8SLh5xTfIr4NK/zEn8HD++omLj2V/nIzBJNJSvB6CEx3yk/edRQPckAIcmDPdZ0UGDNLSII6Ioh22sQJqBt4bELpfu4b29kNJKwfjYgI1oJb0coLPJE7mlnEDIiEb564CI9BlX0ZzIAvqGqRna54skXiWBAfABonMFjQLVOwQi8q7zZlDOheAD/O1BVeRReR844FHxp/s097KHW+LBZoqQy9kIcdOanD3BBZiI+ZBQUid1PxurfrycfCEkR8qVSh0Vlmozn/cFGfaNnReFHSlTKl7FGWZsgvgkSYsA7GNZ77+amfOdVf51x5efLijkKmY8bau4eFN4mSJde4G4+5Cul2dfNMDKdDRZbQegTvUuNQhL6ZnGSraZWMCrxkl7en3+Bc3smV/JA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(376014)(36860700016)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Os3OhZ9gZQ4VC2Qzjui8jeXzAF/iqG7dgn/6G1AEh+3cNNxMWWQ/3bclSeTuxwvNnX04WbyD9N7XYWS8mF5PetkARbMr2ifujl7vnG2aDT9qM0iN7fUIDILOIAcf0r1PJMHWsscUPxtuRhsCVR2jvydDoosC1MSBnSnxnHbrj2iv1nPI2JcKZz6LWuMt19KZ6veWIe4no5ozndOmsTkjYrKwUZQ6W+FfaXtj6996Sa4aXQ2usRAJOHJLQOBMLP6JeJjELZ38U7PWHy81lB73NKTtgYfBlgOnStxEg50EplefIAFdUR2hTbH5tGikqL7g2AzTBSMX2jRGs+umr8XWFPTApGSEXIJ4TtFXlUbmAPdt9Ab0wYkbjh9QeMLi4qeQpgSyl3HrIyTv6yEWAWJEJ0d3pwLWSexi+gr+ld+WWGsLh4f4eID/ll3I5LfwgJ57
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 22:53:47.8654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c3c9c4-4d5c-4af1-6b08-08df26582de8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5740

The NPU3 firmware files will be released as npu.sbin and cert.sbin.
Rename the current firmware names to match the firmware release names,
and add MODULE_FIRMWARE() declarations for the new 17f2_10 npu.sbin and
cert.sbin names.

Signed-off-by: David Zhang <yidong.zhang@amd.com>
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/amdxdna_pci_drv.c | 2 ++
 drivers/accel/amdxdna/npu3_regs.c       | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index bb339e641416..d9e2e71d3e05 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -28,6 +28,8 @@ MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
 MODULE_FIRMWARE("amdnpu/1502_00/npu_7.sbin");
 MODULE_FIRMWARE("amdnpu/17f0_10/npu_7.sbin");
 MODULE_FIRMWARE("amdnpu/17f0_11/npu_7.sbin");
+MODULE_FIRMWARE("amdnpu/17f2_10/npu.sbin");
+MODULE_FIRMWARE("amdnpu/17f2_10/cert.sbin");
 
 /*
  * 0.0: Initial version
diff --git a/drivers/accel/amdxdna/npu3_regs.c b/drivers/accel/amdxdna/npu3_regs.c
index d76b2e99c308..8d287ef32fff 100644
--- a/drivers/accel/amdxdna/npu3_regs.c
+++ b/drivers/accel/amdxdna/npu3_regs.c
@@ -43,8 +43,8 @@ static const struct amdxdna_fw_feature_tbl npu3_fw_feature_table[] = {
 };
 
 static const struct amdxdna_dev_priv npu3_dev_priv = {
-	.npufw_path             = "npu.dev.sbin",
-	.certfw_path            = "cert.dev.sbin",
+	.npufw_path             = "npu.sbin",
+	.certfw_path            = "cert.sbin",
 	.mbox_bar		= NPU3_MBOX_BAR,
 	.mbox_rbuf_bar		= NPU3_MBOX_BUFFER_BAR,
 	.mbox_info_off		= NPU3_MBOX_INFO_OFF,
-- 
2.34.1

