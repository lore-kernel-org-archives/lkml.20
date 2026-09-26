Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012063.outbound.protection.outlook.com [52.101.43.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4C3306746
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386527; cv=fail; b=jUPWS2MqqqNYj33U9LWosJ0K5wGwXlQcLH9CfBr+q2LtfmRL/uTC0Vlkyj0H5Mdf2PWATD2LpjhEozMnxbObvNjFoBa4iLIcFQuJ2xI+0zOT/nJuW0UuFv0jX6FXGs+RPh7EBvuyHNRlpd/y6W8PGs03VO/XKkeXMba0wjBJUwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386527; c=relaxed/simple;
	bh=WUZKk22ux8GK3iaYPQmhn19Ejm3cXzk6JT/EVJQ93Gw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FUfTpdpdXXDpXGHh98ZwHTFJmpR20xLaBuduOZ/a9HfKPzs9AiK/rBqSYzXtkCoonyUrj4IcQSt1A9YJIsWFc+/mnYXps8ThALajNy5Lb/ra3Tr8S1TnaIdasyO/Vob5ZR3s5Dg+u/6qVEw2aDsai0qfA0upgDGF41ZOrCoO3d0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4yMB6UuX; arc=fail smtp.client-ip=52.101.43.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4yMB6UuX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ka3xZ0/fP3jsAxWllXTU3rmtOWuUkarCHpQ8mMmZE32dq5B+wqg5KEijeQ8dd2NruYkkI6lr4jvO9v8fWTuvgrC9Qt27qt4skx/0qoNEr8FsfC8+X19J8ki2h8FVCUOUUOnAjNjAm6ueqboLsUW5Feibt7iqPk/pytGOeF7K9I9Bl4cC4rgHwRxsaIDmCpcqj2CHFSrRoOdBcSgoLKHfGmqBqXTV+MIhZylDtgVFAGy8iTEVzLYgZKIKvhLZKYXVWS7/IhcpbJj8eczgFpa5mwNt8kgwhsK8kHNct0/PU/n4ZSPA/SFX+iFLzQ8Tr94ddrcUK17AS9xbD7XMQnKP4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USEZ9Vq9X9/bvUoahsLbqlJDt9bC0WFukiuVAXa0dnU=;
 b=ycFoSHDzsAQtEvshj/j7RiRgZkjZEgSa+ued3oUPvhkP3couzQSS935iG0TSOesuaAHOwoXba4WkQgrl6u94zZMMIlHbaH6unxQ+mbYLBFcMqziZnYOL5gbp1jEH7x/Oeg3xtrO0s9o8cK8R/sCDQNWPheTmwW+f7Udccgez+74npZSSwhKVT9wvxS/2ZycBvfykyjutT8n5xnHvUvzajHbhIxL7IgxfKKZYGyPxxDI2xnwtQ13dDcnIGMAUoFmfeUCl/SDIPboxvaZTsEYp9UPKIcxS9mDB78Jn26H7Pp8j2zs+pqdL055VprnfaN9CHM3HSjRvKUrPSFi9sBtD7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USEZ9Vq9X9/bvUoahsLbqlJDt9bC0WFukiuVAXa0dnU=;
 b=4yMB6UuXkXGkxK4Zbd3N9c/kKGW21A+MYKystl4IZwch8cMAh2BNHngtWCfI9U1/ElaB6jLiGZj/LvFO4UoKMRXIqNcbWNFa8tQtMwgtzWNYgYcJnES2sGLWEp479yCDKkcyOuKACxhm47cMGbxLJrgPp5mJ3h0yVaDVznz/sEc=
Received: from BN9PR03CA0089.namprd03.prod.outlook.com (2603:10b6:408:fc::34)
 by SN7PR12MB7201.namprd12.prod.outlook.com (2603:10b6:806:2a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.22; Sat, 26 Sep
 2026 01:35:19 +0000
Received: from BN5PEPF0004698A.namprd02.prod.outlook.com
 (2603:10b6:408:fc:cafe::6b) by BN9PR03CA0089.outlook.office365.com
 (2603:10b6:408:fc::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Sat,
 26 Sep 2026 01:35:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN5PEPF0004698A.mail.protection.outlook.com (10.167.245.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Sat, 26 Sep 2026 01:35:18 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 25 Sep
 2026 20:35:18 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 25 Sep
 2026 20:35:18 -0500
Received: from xsjdavidzha51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 25 Sep 2026 20:35:17 -0500
From: David Zhang <yidong.zhang@amd.com>
To: <quic_jhugo@quicinc.com>, <karol.wachowski@linux.intel.com>,
	<max.zhen@amd.com>, <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: David Zhang <yidong.zhang@amd.com>, <sonal.santan@amd.com>,
	<mario.limonciello@amd.com>
Subject: [PATCH V0 01/21] accel/amdxdna: Rename NPU3 firmware files
Date: Fri, 25 Sep 2026 18:34:28 -0700
Message-ID: <20260926013448.3840921-2-yidong.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260926013448.3840921-1-yidong.zhang@amd.com>
References: <yidong.zhang@amd.com>
 <20260926013448.3840921-1-yidong.zhang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698A:EE_|SN7PR12MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: be65bb3b-73b8-4036-d190-08df1b6e6c76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|23010399003|1800799024|10067099003|11063799006|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	2XyH6SwHnO14yDQo27KvX25TIULbENXKTZKWOVVrvduvlAbHXRotmHZVJ+fnfRHOo1cMjckyZsJc23AxZbVQYCDaXxrxdUG91Sqw4SO6070b0bxUskCMVBGRoHuacGRjVZk5Zf1QreuA0o/H1RdUrYCP2WqgysoZjtyldF9YZt/kWNZGNoZW8p83EMY1ULfIsKk/V9UOoIccG+MhR/8lQK7RS9ePRkzkcNNYGm7waZwqK+Gu1lV77/+GlI1RVX+dUocDmiJwn13+E6HkrN0QTn4hpMurEZPt5JrUmgE0leWFkOyi3Jnwr0KyVxdcbH7cDUhwgNAzhu6BscYLovwTol4HD0BRZpvhrt7hWex1rSAGV+PJs4Wn6/rKBONF3g/LgJCXUo1UNoPopMuwQI7ciLaQJuFSh4e4c9U/pgoFdKafUgYkA/BOesy78G3Ig4fjw4pBs3Fus9EooyFINxwJKwOS+3o1CKA78BaCKINl3/DucZ9E7RIx6oZPsZP5IUhUPif94JjV5gwokCZHrCNBuleT16h93CkZ3aS8j/uiRWWKWRNSgc2IPceVIyzX5aqTvI4UGWOeSzvQXdoXczFMwhXxqG72huJtygt6zD3K2h9f+28tgl6mCrTYf5mh8DRdEPk3qO3ZkPNQGmZTFobzr7hBsKlWLd/pycqc+Ghc7UsT9HWgxba1GdHrLCVnxpF9O8Z1mBT1WAATQgc4UBehOA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5WL5RwnGTWq/L68TGeFEamX4pLmUmNwlRkdQIQU3+lM343MzVbrVx6FL4RpQUilMVKqtm1LxUvuQw4W/7b3LqZYv/KAqacwmqC0CbDy2k4QZzaVsik6UCWe7ksWKGUISLZp4txkYoPDpdKByen02I+HCZAbMsC+7R9nxIOvFThrKoKdIEz6ubquw568Os+UyOA11stPLkX4RTgyXOr3fmANIyF6wvkPF6x/IyDE06zSwX+ioziAJ2+5Miit/8xLm52bq6BFxYh2LR4x0DDBJJRXn2O4fMzmjbSkv+7DIduoEn5X2PCXXeqfWu64Xv1fQ9W+yxoJYSXkyvbxJ92BFtVgeZlqn60+i8xLR2B83fJJQhTKSDcxLhsu1C/Oub3oXjbZ5YNE80bbbNNeWBY48Qp7dAQ5HoZm0j7LMu04zJFUnSjmedP0uPc1gB9k40rs+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2026 01:35:18.9601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be65bb3b-73b8-4036-d190-08df1b6e6c76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN5PEPF0004698A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7201

The NPU3 firmware files will be released as npu.sbin and cert.sbin.
Rename the current firmware names to match the firmware release names,
and add MODULE_FIRMWARE() declarations for the new 17f2_10 npu.sbin and
cert.sbin names.

Signed-off-by: David Zhang <yidong.zhang@amd.com>
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

