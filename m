Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793830559;
	b=3K6POuSVGr6+JYTbfX87XTVdDqi8D3fEgcSrrgoNqI9sEd1w91OUIY/86BERNxdoOPQT
	 jRPMpHKOcR8aWQ2jLKikPK3OUUuYqEY7GES63wZVysOc/iYe7E6Ec3mIYCrhfGCHnn3KZ
	 A+5WORAPl4plym9XUx7kAm8U6FWP5/aP22QO5JlPDrLKa9YdAfT9/tD/ls7pnXt3rz3hc
	 FYY3VnraNQO92hooRr+xviwN3X7sjYRXEcvd6LkH/Zz6zxYNe60v/XD1rj09MeGhfI5OL
	 Scvk9jZjdl+O0lTjOCP4GwC2JS08Gam+S9CkZJBmYzygqVx7vLuXWocv/ebii464O/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830559;
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
	bh=jphZs+PgWEjkGrkMJwxvxoxHtLPPImvS7uY5Bp5w4t0=;
	b=1hp5GxLU3r3dJgnhKld/pcInn174Sj/QwibSYtjzT8BEREoneoG7amtbj6l+HPwU7iLU
	 PPqB9YAeRmvkOZQd5Au88K4NA6O8V8iKDWihiuPRxcUSbnBkRV4tq35bQnwQSWqhRhQRi
	 +aQRUYd6/Bgm7hqFWpxRsOtN+jKMK/tXJWmq+JSuTNDezI2vkEBoYn7vO60vT0luHyg4N
	 YxKKhDVqYgfX7kxZKFBRsasnTfeITY+rkYBwiZv85Zh1IMO9YQGLIur8mhOzmQlrtuJcM
	 E4TTF3R1OrgYTGEAFjyoQUgPpri9MVB7TA0zKydh9ozKkCBFtK4roQBK5nRzhxh2rsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xHrnIKnX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.28
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012028.outbound.protection.outlook.com [52.101.53.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF2C606AB1A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEF2C606AB1A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xHrnIKnX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVVBGvut6gXV17PhkjEkn5kKxstbcXNjcGyr29D+fNCXN58l0/S3q7n6CkgtR8MTfBmWky3RU0TD46UMtgecskNRlzp2tNjEJHHtZmg/yf/l6HFasqVxBYCl/SzXgksdq18QQoHCY+GVXklzvqhMutmWLbPmC6G8n+62VvUE5I0HSOh2Tu+kkkTRist2rNkKI5M07zQaRVM6al9noCvYeFD4G3vy6VVaiJ3xepMm7J2hewXQLGzHOSrwKJU0j169wmLAknNnWHMOBs1UlZ9RW1BC4Vb3zWHHs6NuoN7W8uuw6EoxiKfMYmFLINrX3qY4UQqadwY+6bRGzDZGXDXsAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jphZs+PgWEjkGrkMJwxvxoxHtLPPImvS7uY5Bp5w4t0=;
 b=JrdFV7K/5QcRd6MyTyGW68GYTTiOte+DofZ06TxCgUomLNsF72vth1by4TwGibV2EqTggyPLY80aHhIcA+TG5B2PNtQMaN0gQVDeZ4si3srQjOmadBfhiFg+1wbshyyl9In1+uYvxNaLrI7Wh0APe+n8f56ksCoAzSSlBByXPJ1DSNmD/fqQrCJ8bZsFtjsqmvLrWSM1nOdedmG38D1nl4JvuWCL61st83I8bTZDLZ7n9v4fOlOnO1cuJXqduQZ0BjSeWEBi0ijql0OOexvtji4ESEx2CVJxqHpGGuUPC92y7ubEvHw7kI513XEWZt3OXkZiKwxmv+ICMx/Poo4M+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jphZs+PgWEjkGrkMJwxvxoxHtLPPImvS7uY5Bp5w4t0=;
 b=xHrnIKnXt57frSeFO2FxGxRAeoo+l1hRQt/lcw/1F82COaWiAWwZYORHjQFvksESGExositSx4R0vWqOEwnB9PFQGBEqXV4h1FnjL+lDyvahOqOkuboMxdiujvPpYEY3yxBLU7w0F+WfsRHSaNBOnpp+hHJF0m1IPhMaBA9Rq+8=
Received: from CH2PR11CA0028.namprd11.prod.outlook.com (2603:10b6:610:54::38)
 by CH3PR12MB8726.namprd12.prod.outlook.com (2603:10b6:610:17b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 22:15:52 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:54:cafe::1e) by CH2PR11CA0028.outlook.office365.com
 (2603:10b6:610:54::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Wed, 4
 Nov 2026 22:15:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 22:15:52 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 16:15:49 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 16:15:49 -0600
Received: from xsjdavidzha51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 4 Nov 2026 16:15:48 -0600
From: David Zhang <yidong.zhang@amd.com>
To: <quic_jhugo@quicinc.com>, <karol.wachowski@linux.intel.com>,
	<max.zhen@amd.com>, <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: David Zhang <yidong.zhang@amd.com>, <sonal.santan@amd.com>,
	<mario.limonciello@amd.com>
Subject: [PATCH V1 1/4] accel/amdxdna: Add NPU10 and NPU11 devices
Date: Wed, 4 Nov 2026 14:15:37 -0800
Message-ID: <20261104221540.631182-2-yidong.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104221540.631182-1-yidong.zhang@amd.com>
References: <yidong.zhang@amd.com>
 <20261104221540.631182-1-yidong.zhang@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|CH3PR12MB8726:EE_
X-MS-Office365-Filtering-Correlation-Id: e2241b7e-c510-4817-fe54-08df3ac13080
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|261026121527099003|261022075727099003|11063799006|4143699003|56012099006|261021121427099003|261009223027099003|261022105027099003|261026140227099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	20MYwY+ItPMet7Wa2PxKoeZuj3rQPJRknFnt9H99DoWVAxG1Vbs7ZfB65KOcc+X/z9Iz4d/ZZoiqNt0hCsaCPkGQu2tfhXpPldlVOxBIof/mUcOfuibOVneaeGYJ7gyb1D5rhSwnCKMKPYnHokTbpDWGCTUpxbXbHqqQWnj4ybj6n9LSFQhK0hzErgiEhWdL8A5M89DRZz9i7bc5vyJ5SMr85XIEreXZw5lVjusiM/rNmTra94rsaNTcY3Hu+ZSsH+gP/silrhasU1vHsj4PxPGqe2G4VD/bw13C4ltNUJsoVsUp7kXrIlUL9qoJmo0t6iIZmuZFBevlIRoLWFRkEDUyhweQ0T3qhVnW1fJ+fw5fptL3PG3j5Q0bpF7TpmRAenSVnY/fYJyRnfBdaRB/1uYQmIncjEh7AOCngA5khXGuJnZdEoElc7/kmsEjZk5qRTwoaEQBdIuKV9GmzSHLyUyo99mOnLF6WoIP74YEQUe4O5TS/JE2FO8yqze9wl8vEk6k3tNLoYwR1/HFwInq0m3TfGX92QL3Zny0O0NjH0QQu/fkLdXnBL1kthvvAf2seJaMUD6S9v3iLrPpL+GTdyhJoD4ID/V7S45YZXr+Y5jv08f2hD44Ejm+WdxyCiwYbdh4Y55jnQJA7MuZ+KJBY5PmYonjvlkd6lYh8+R3oFFzh/i+k9YPt8aQ3BOXotMEalWdcjjTNX9OUZMry9XXwg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(261026121527099003)(261022075727099003)(11063799006)(4143699003)(56012099006)(261021121427099003)(261009223027099003)(261022105027099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	C7ZXB9EmY0PBqiyeBtzmff2o53ykNGxakOs1VN2ZTtO5fNbu/0j2BSjmdb9E0w1R5NFH9hKvjj+mwT5nTFNE5i2A3EosGuvJNZ4kooeSNvegNHxZyBUcvsEawwOSnrV7j5Z/VmLDvObt+1x2pldNR3mfdF9aTXvosR84yE3uR/94hsR0eJOwrGpcVD8sNV9HqFVT4fqfRsN9f1EBK43HZ0hSX6YLRq//+knexjookO6NC5TcQH8nLTdjzAyYyFxyMx7rG5jNbR5LF+kon4tDMb74SMvk0UoUA/PBC95zaiU3W4FFLG/6KfBU9D7MCMLkjFUoTzrdrioTyUikb5zPmGPVbc4zsk/43MyKj6Uh3WBjtLWToMOEAE4YlQnkuhuCOU43ogHtneP4VqVJn86hCv+yl1v40IIC20PeYjWDFUklzrPm65rDHhC6Gp4wSQOw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 22:15:52.6200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2241b7e-c510-4817-fe54-08df3ac13080
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8726

NPU3 revisions 0x14 and 0x15 are NPU10 and NPU11. Add their classic,
PF and VF devices with their firmware files and report each by its own
name. They otherwise use the NPU3 settings.

Signed-off-by: David Zhang <yidong.zhang@amd.com>
---
 drivers/accel/amdxdna/amdxdna_pci_drv.c | 14 +++++
 drivers/accel/amdxdna/amdxdna_pci_drv.h |  6 ++
 drivers/accel/amdxdna/npu3_regs.c       | 78 +++++++++++++++++++++++++
 3 files changed, 98 insertions(+)

diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index f233eb70a295..685fe1a7dd56 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -37,6 +37,14 @@ MODULE_FIRMWARE("amdnpu/17f1_13/npu.sbin");
 MODULE_FIRMWARE("amdnpu/17f1_13/cert.sbin");
 MODULE_FIRMWARE("amdnpu/17f2_13/npu.sbin");
 MODULE_FIRMWARE("amdnpu/17f2_13/cert.sbin");
+MODULE_FIRMWARE("amdnpu/17f1_14/npu.sbin");
+MODULE_FIRMWARE("amdnpu/17f1_14/cert.sbin");
+MODULE_FIRMWARE("amdnpu/17f2_14/npu.sbin");
+MODULE_FIRMWARE("amdnpu/17f2_14/cert.sbin");
+MODULE_FIRMWARE("amdnpu/17f1_15/npu.sbin");
+MODULE_FIRMWARE("amdnpu/17f1_15/cert.sbin");
+MODULE_FIRMWARE("amdnpu/17f2_15/npu.sbin");
+MODULE_FIRMWARE("amdnpu/17f2_15/cert.sbin");
 
 /*
  * 0.0: Initial version
@@ -81,6 +89,12 @@ static const struct amdxdna_device_id amdxdna_ids[] = {
 	{ 0x17f1, 0x13, &dev_npu3_classic_info },
 	{ 0x17f2, 0x13, &dev_npu3_pf_info },
 	{ 0x17f3, 0x13, &dev_npu3_vf_info },
+	{ 0x17f1, 0x14, &dev_npu10_classic_info },
+	{ 0x17f2, 0x14, &dev_npu10_pf_info },
+	{ 0x17f3, 0x14, &dev_npu10_vf_info },
+	{ 0x17f1, 0x15, &dev_npu11_classic_info },
+	{ 0x17f2, 0x15, &dev_npu11_pf_info },
+	{ 0x17f3, 0x15, &dev_npu11_vf_info },
 	{0}
 };
 
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
index 27593190dcf6..5ca32c5b1de0 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
@@ -187,6 +187,12 @@ extern const struct amdxdna_dev_info dev_npu1_info;
 extern const struct amdxdna_dev_info dev_npu3_classic_info;
 extern const struct amdxdna_dev_info dev_npu3_pf_info;
 extern const struct amdxdna_dev_info dev_npu3_vf_info;
+extern const struct amdxdna_dev_info dev_npu10_classic_info;
+extern const struct amdxdna_dev_info dev_npu10_pf_info;
+extern const struct amdxdna_dev_info dev_npu10_vf_info;
+extern const struct amdxdna_dev_info dev_npu11_classic_info;
+extern const struct amdxdna_dev_info dev_npu11_pf_info;
+extern const struct amdxdna_dev_info dev_npu11_vf_info;
 extern const struct amdxdna_dev_info dev_npu4_info;
 extern const struct amdxdna_dev_info dev_npu5_info;
 extern const struct amdxdna_dev_info dev_npu6_info;
diff --git a/drivers/accel/amdxdna/npu3_regs.c b/drivers/accel/amdxdna/npu3_regs.c
index cff99ddd3a55..4d38aeaea6d0 100644
--- a/drivers/accel/amdxdna/npu3_regs.c
+++ b/drivers/accel/amdxdna/npu3_regs.c
@@ -197,3 +197,81 @@ const struct amdxdna_dev_info dev_npu3_classic_info = {
 	.cert_feature_tbl	= npu3_cert_feature_table,
 	.ops			= &aie4_classic_ops,
 };
+
+const struct amdxdna_dev_info dev_npu10_pf_info = {
+	.mbox_bar		= NPU3_MBOX_BAR,
+	.sram_bar		= NPU3_MBOX_BUFFER_BAR,
+	.psp_bar		= NPU3_PSP_BAR_INDEX,
+	.smu_bar		= NPU3_SMU_BAR_INDEX,
+	.default_vbnv		= "RyzenAI-npu10-pf",
+	.device_type		= AMDXDNA_DEV_TYPE_PF,
+	.dev_priv		= &npu3_dev_priv,
+	.fw_feature_tbl		= npu3_fw_feature_table,
+	.cert_feature_tbl	= npu3_cert_feature_table,
+	.ops			= &aie4_pf_ops,
+};
+
+const struct amdxdna_dev_info dev_npu10_vf_info = {
+	.mbox_bar		= NPU3_MBOX_BAR,
+	.sram_bar		= NPU3_MBOX_BUFFER_BAR,
+	.doorbell_bar		= NPU3_DOORBELL_BAR,
+	.default_vbnv		= "RyzenAI-npu10-vf",
+	.device_type		= AMDXDNA_DEV_TYPE_UMQ,
+	.dev_priv		= &npu3_dev_vf_priv,
+	.fw_feature_tbl		= npu3_fw_feature_table,
+	.cert_feature_tbl	= npu3_cert_feature_table,
+	.ops			= &aie4_vf_ops,
+};
+
+const struct amdxdna_dev_info dev_npu10_classic_info = {
+	.mbox_bar		= NPU3_MBOX_BAR,
+	.sram_bar		= NPU3_MBOX_BUFFER_BAR,
+	.psp_bar		= NPU3_PSP_BAR_INDEX,
+	.smu_bar		= NPU3_SMU_BAR_INDEX,
+	.doorbell_bar		= NPU3_DOORBELL_BAR,
+	.default_vbnv		= "RyzenAI-npu10",
+	.device_type		= AMDXDNA_DEV_TYPE_UMQ,
+	.dev_priv		= &npu3_dev_priv,
+	.fw_feature_tbl		= npu3_fw_feature_table,
+	.cert_feature_tbl	= npu3_cert_feature_table,
+	.ops			= &aie4_classic_ops,
+};
+
+const struct amdxdna_dev_info dev_npu11_pf_info = {
+	.mbox_bar		= NPU3_MBOX_BAR,
+	.sram_bar		= NPU3_MBOX_BUFFER_BAR,
+	.psp_bar		= NPU3_PSP_BAR_INDEX,
+	.smu_bar		= NPU3_SMU_BAR_INDEX,
+	.default_vbnv		= "RyzenAI-npu11-pf",
+	.device_type		= AMDXDNA_DEV_TYPE_PF,
+	.dev_priv		= &npu3_dev_priv,
+	.fw_feature_tbl		= npu3_fw_feature_table,
+	.cert_feature_tbl	= npu3_cert_feature_table,
+	.ops			= &aie4_pf_ops,
+};
+
+const struct amdxdna_dev_info dev_npu11_vf_info = {
+	.mbox_bar		= NPU3_MBOX_BAR,
+	.sram_bar		= NPU3_MBOX_BUFFER_BAR,
+	.doorbell_bar		= NPU3_DOORBELL_BAR,
+	.default_vbnv		= "RyzenAI-npu11-vf",
+	.device_type		= AMDXDNA_DEV_TYPE_UMQ,
+	.dev_priv		= &npu3_dev_vf_priv,
+	.fw_feature_tbl		= npu3_fw_feature_table,
+	.cert_feature_tbl	= npu3_cert_feature_table,
+	.ops			= &aie4_vf_ops,
+};
+
+const struct amdxdna_dev_info dev_npu11_classic_info = {
+	.mbox_bar		= NPU3_MBOX_BAR,
+	.sram_bar		= NPU3_MBOX_BUFFER_BAR,
+	.psp_bar		= NPU3_PSP_BAR_INDEX,
+	.smu_bar		= NPU3_SMU_BAR_INDEX,
+	.doorbell_bar		= NPU3_DOORBELL_BAR,
+	.default_vbnv		= "RyzenAI-npu11",
+	.device_type		= AMDXDNA_DEV_TYPE_UMQ,
+	.dev_priv		= &npu3_dev_priv,
+	.fw_feature_tbl		= npu3_fw_feature_table,
+	.cert_feature_tbl	= npu3_cert_feature_table,
+	.ops			= &aie4_classic_ops,
+};
-- 
2.34.1

