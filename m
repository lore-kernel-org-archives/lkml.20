Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010068.outbound.protection.outlook.com [52.101.61.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D301F344D95
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386570; cv=fail; b=W3UBSm9TNEFR9PQrj1KY/Sm77fb0ZKUENSEFPdoSyku+8yDiyNBc1nZsXz3Eoec/DWratttOuTlG+cVu7MsR6W0sPDNcKg24Vkic8ETkD5UI0NQIZYoFKGUdBT0ot16aHPRet4Ba0VGt9JEILhV4FC8Vna2mKNJu2t0gsVX+aiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386570; c=relaxed/simple;
	bh=CZwz6la3FgSj1Fwzbd80ILbJ4LjRTHYPArUu8xVVY7w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uHjxwcFVsELJgusI5776cB++JhCHesrQd/64GMIpWB30Zp03p0B7pwii8w6Mz3oboP8wnyU+cNhoMobKRGiKbGZazjI78snoljp0ZsIFJ6IagS+oroKWUDlyH+/73F9mlwaAimLY+m+k1Eapsy02Ms11LeipLGFuCQtcCaYYaSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=34S+nhOa; arc=fail smtp.client-ip=52.101.61.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="34S+nhOa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YkluyF5cbe4kYnpvKrmrwVh1i353xj2acx1/i09joZf3SnOqgm0NQofTGxduaoPJYivuI+dNk6UbDYApvJVQZmpFDiDVyimYIMR7yLYDkeexz5LvTdRtiaWQyBC94gxKYMi7aja0zEzv6JmhzqpnUphQKB9pu/R5aoFeB7yNNo/CSATbrTFFfR4Hl6A4F08Sk5z1Ko350TrvoLXaxLP6xL2HANGzCA93P9VNSed6TaZJna+iAxehRBC4JUmtYV23o8uuHIQGPLhUA2ACg1E/39wtoQd0qdxanE+3nwfCJgkXQ/uyUszXy17oISIl9X3nCzrJfSC6vtSeCYCbTZsAlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xIeLhV7IlVBF22UN6I+L1bEI275kVAa+wRYBmVKT0o=;
 b=T3prIbTud/xD/VBawQWDMakhHjGrHP0ka5ddpAC/rRZzoaGn0GNruksdbUkSmwlcxrFngWQyXmn5HMnOk37uOE6vFFTbuPhSVsfMVIOOmbp25ZHBISR5qsEVH+qhYbOawByj57Vb68MMdCO9IXYuC/0jnkErHD74RbyC27wXQ+byKrzuTI7LFieRDmKSgeCRGbnLg8K4TsFWuOejCXVvLhQ/rCKBi10FSrK2jEuUxGjMB0AkYR+vZTE0XaCxLfX0MajoK3yUqZPGlLRyhlo8ZUssU6BJCYp6k0Uo0icr+gOsRmHQf5C+vhoryVmCTDMn16q4WwVqbUoz1tLegriGXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xIeLhV7IlVBF22UN6I+L1bEI275kVAa+wRYBmVKT0o=;
 b=34S+nhOa7ivroBBCks8/1PfuFiVWvtR56uXXZkXYDyOhgC+p7BW9gJR2p2tHBzNKGECEz26g0hTDa7obLWR8TE+sSmB+lUEuY5EWT3JPUlcLGDQp2lLn+wxmrzI4bXJDjSWMLEd04XyphA43+VomZGnpAeC/+ArEs2OSKONUPuY=
Received: from BN0PR04CA0136.namprd04.prod.outlook.com (2603:10b6:408:ed::21)
 by CH3PR12MB9170.namprd12.prod.outlook.com (2603:10b6:610:199::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Sat, 26 Sep
 2026 01:35:38 +0000
Received: from BN7PEPF00000091.namprd03.prod.outlook.com
 (2603:10b6:408:ed:cafe::2) by BN0PR04CA0136.outlook.office365.com
 (2603:10b6:408:ed::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.19 via Frontend Transport; Sat,
 26 Sep 2026 01:35:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN7PEPF00000091.mail.protection.outlook.com (10.167.245.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Sat, 26 Sep 2026 01:35:38 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 25 Sep
 2026 20:35:35 -0500
Received: from xsjdavidzha51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 25 Sep 2026 20:35:34 -0500
From: David Zhang <yidong.zhang@amd.com>
To: <quic_jhugo@quicinc.com>, <karol.wachowski@linux.intel.com>,
	<max.zhen@amd.com>, <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: David Zhang <yidong.zhang@amd.com>, <sonal.santan@amd.com>,
	<mario.limonciello@amd.com>
Subject: [PATCH V0 21/21] accel/amdxdna: Add stub hwctx_config for AIE4
Date: Fri, 25 Sep 2026 18:34:48 -0700
Message-ID: <20260926013448.3840921-22-yidong.zhang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF00000091:EE_|CH3PR12MB9170:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f015d45-735a-49b0-298b-08df1b6e77d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|6133799003|56012099006|4143699003|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1lV3YHvF6Z81l6h1zCaWPLqJurQJtegH6YUA+HeMtrYiSJYEVFcYQDS+iSvHnk0bePYRB9XtUSc01WbXgGbkMQ3ztXi7hdxMrZ39itIW6yTn5eiaBFDzpNd7Ix3D9j+DsmIxuRXIwbAyQpuKUPUYnhG0scPesNGqSf8z7yEPfmb9mbDUFQX6AXKueqNsiQuPWrW1dU3dDSawg5SyndzRhc9FVGQSjTTMkLkLYXWTcjLRDfnxJWgpAKyWQfxCnaOpssFQc6APrfcEFyM+eQBegkrDUh7Zp6pbXKXAGojZFlMwVe7VkBamFAWn60C2d2k8B4HJ2Sp3Jt6DHhaBo/NRMMVAELVmHYzFvq4IAKTq0SIjWih65fQR3zAdSH1gmS5NTDYX+Z8pOHhSdwspuxW1FnfsLDIOQqgGwuPgs19UoC/O4Ky9pPrlD7Tmj0QRvuHzZuTekqlYGieamVcBM5QvLQ0bht70OJtepUbLskPgPoCOHCLUJV4Km5lYR9rPcKtmnujZ/GWUktIjRMUj/cibFyZaZNDXNW2F7Ozb/KRxNlTbzDEzqsjfN4mr33nubSz7ZnnCD1Ka2iUF7ptIz4Yp7X7otZymWEDlahipc5T4lRdiVYt+Y7WXDGEQtPjXa8Oj4OGRzH63hlORg50cnekiUIvUaZnetUxBjFeyqcvKBCIbylvcoM1lytmtl2c5/dhoSXdb6zaWTBeBAE7bqLKZgA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(6133799003)(56012099006)(4143699003)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bsj2KBvxkOOgp4YTUD3vsmOGNRzHoGsyeuDm8SLfn2FhAl2+xvCMJ4dvzFha4g8BGj1W29W4uNaERIToX6nsPGcvAwmDbGfzRAyOyZrce8rugYhJ2eba7lJCczxctEPvEXErtvHbTKoxAs44riEG7Ms4RVRBHM+kiVgsva407/fUxavdMj6dCo+DzAFz10v8oC4G/YdddWpDv7WVf/e7yqfAKfLiamIGdtcVE9fvxQwOASEpGU66xsZxV5ueOQyLrpM6yFCOHy2VIbXQxBoaVYnTL7euYSH1jxLkE1s1bjuqVoKTEZPBUxTcrmWxytx8fwsEkMNpKX/NXGtF/a6cbm23OvVqLVOPv+cPgeVIlUfEEfhcM4Lzjl5AAvUw9dDYs3wLRKXYEtD9KtyjR/T//Y0KeYCYZFHg1lEIhlGX/un4CFHHucjIXdYJR/QlKw19
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2026 01:35:38.0281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f015d45-735a-49b0-298b-08df1b6e77d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF00000091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9170

XRT issues DRM_AMDXDNA_CONFIG_HWCTX during hardware context
initialization. If hwctx_config is NULL, the ioctl returns -EOPNOTSUPP,
causing userspace validation tests like GEMM to fail.

Add a stub aie4_hwctx_config() returning 0 and wire it to aie4_vf_ops
and aie4_classic_ops.

Signed-off-by: David Zhang <yidong.zhang@amd.com>
---
 drivers/accel/amdxdna/aie4_pci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/accel/amdxdna/aie4_pci.c b/drivers/accel/amdxdna/aie4_pci.c
index 28ac7940b200..5a94d41ae5f8 100644
--- a/drivers/accel/amdxdna/aie4_pci.c
+++ b/drivers/accel/amdxdna/aie4_pci.c
@@ -1368,12 +1368,19 @@ const struct amdxdna_dev_ops aie4_pf_ops = {
 	.runtime_suspend	= aie4_pf_runtime_suspend,
 };
 
+static int aie4_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value,
+			     void *buf, u32 size)
+{
+	return 0;
+}
+
 const struct amdxdna_dev_ops aie4_vf_ops = {
 	.init			= aie4_vf_init,
 	.fini			= aie4_vf_fini,
 	.debugfs_init		= aie4_debugfs_init,
 	.hwctx_init		= aie4_hwctx_init,
 	.hwctx_fini		= aie4_hwctx_fini,
+	.hwctx_config		= aie4_hwctx_config,
 	.cmd_submit		= aie4_cmd_submit,
 	.cmd_wait		= aie4_cmd_wait,
 	.get_aie_info		= aie4_get_info,
@@ -1390,6 +1397,7 @@ const struct amdxdna_dev_ops aie4_classic_ops = {
 	.debugfs_init		= aie4_debugfs_init,
 	.hwctx_init		= aie4_hwctx_init,
 	.hwctx_fini		= aie4_hwctx_fini,
+	.hwctx_config		= aie4_hwctx_config,
 	.cmd_submit		= aie4_cmd_submit,
 	.cmd_wait		= aie4_cmd_wait,
 	.get_aie_info		= aie4_get_info,
-- 
2.34.1

