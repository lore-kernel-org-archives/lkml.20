Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010000.outbound.protection.outlook.com [52.101.61.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C8031D367
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386533; cv=fail; b=BmBWVvb32GnpukIaxnC7Tp0Vw2CpD7H0uFJ5JdkOssHw48Q21BReJOJSscuS/8HgIUa9PNuceQg0ibcK4Y3fKA/7ySy+rZOvWCAzassKk6Zv/ykksHCe/JTZ+JOB5yTLBFfrS1uSnnb3O8dWht22ou64YSHn8M43u80zGkvDzI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386533; c=relaxed/simple;
	bh=Dl7ZPQa3iaPBANIHxygoEzf0bWA3ipdD0fPOzP4gdrI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O8bPRPpj8478DE5OnkSt4WRuAWfJypmzr11NkvJdlfIoKTjNhwShc5xICoMKe2//rU9vsQVySmyhdzt1mWHxft2T2t51XeGfeA+ZjBc19ueDAksmgV0H7a/uq74DxiwPCLB8WAQvokJ6DS4stBJB6a4TA8YaW+O/LiZnN7vynWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vhWctblB; arc=fail smtp.client-ip=52.101.61.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vhWctblB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JmKD35cScSNzPTFDkn4QAMFWDT8zS+VVP7kHqID9sFWi1FDxrJRivYFnz5+o+IFFx2a5UkfWxKdGWJshRCeWxTTbwonpgBb10veds9Rz3jxhaNQDc2a94jSB9L3LdEFZ33OSDuy0Sw49xfGsWHcmL1hOAGQdNA4d80Gz9Of3TWGHQZnCxQiqRqwkf+ldYvRjkfZRjgRJOg6viVaqR/Mm5mhNIbNQZP0rcB6V8Hh77J6hsNysJ5/tIDKWlTMSdJgvMKA2it447PLeX0WJA5vgEAIjLND5PB3/V7i9DXpuqKJ0arw91mZEPlVQmZP+3eHiudTwcO7OFHq7422QDXd2Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrckLY5XP6JsxvAze1xN1/85TSOKxXHCiN6tugOyyHU=;
 b=cUu8Ht6OQAxx9TU/ffNZ0KdFp0Sl4wpE4iD/J6WGSFCVgkvnoM5GB4P+S+Y916atWZuHXpPl5AmhsXMaaY+fv9IiRWusPPUCZQTYFxY+64/84g5R3JBAnaZUpKQstAwwLYNfglMIXVnQiWke3OohBsMrwwlXCTA3zovguH2BRw9I/dLn4rjWDzIApamyCT2GYL8Uo9eOY3NwBmeJt8PoMytXdfH8JpNnY+nmxFpCxWfKeXp/EgL+MvuCZ4hR1QrlHS/HeEgNwNVIlD0avdXs0/vLHxhRzc6kIzuL71lpdf1CdtIoSWUepbiJZbVFPNtV8EjUVOaUUJnfunh50fCx+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrckLY5XP6JsxvAze1xN1/85TSOKxXHCiN6tugOyyHU=;
 b=vhWctblB4RiHubKgO/9ah49TpN8LLX5YCl3ck0E0ok5HukSw6GRFtPr9U2wgJGnHuRJqHvPizsa+0zLr5db+a1oylkHohBZ0keIlMtAelBRTJTs3/hnTG2iMIR8cUpYny6Pmb+6k1AvoPZDekg65vEBBgbLOcJOWpeivRjSc/00=
Received: from CH2PR12CA0028.namprd12.prod.outlook.com (2603:10b6:610:57::38)
 by CY3PR12MB9577.namprd12.prod.outlook.com (2603:10b6:930:109::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Sat, 26 Sep
 2026 01:35:25 +0000
Received: from BN2PEPF0000A7FE.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::34) by CH2PR12CA0028.outlook.office365.com
 (2603:10b6:610:57::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Sat,
 26 Sep 2026 01:35:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A7FE.mail.protection.outlook.com (10.167.245.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Sat, 26 Sep 2026 01:35:25 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 25 Sep
 2026 20:35:22 -0500
Received: from xsjdavidzha51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 25 Sep 2026 20:35:21 -0500
From: David Zhang <yidong.zhang@amd.com>
To: <quic_jhugo@quicinc.com>, <karol.wachowski@linux.intel.com>,
	<max.zhen@amd.com>, <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: David Zhang <yidong.zhang@amd.com>, <sonal.santan@amd.com>,
	<mario.limonciello@amd.com>, Hayden Laccabue <hayden.laccabue@amd.com>
Subject: [PATCH V0 06/21] accel/amdxdna: Add AIE version query to aie4_get_info
Date: Fri, 25 Sep 2026 18:34:33 -0700
Message-ID: <20260926013448.3840921-7-yidong.zhang@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A7FE:EE_|CY3PR12MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: 65c2561c-c3b3-463b-8fd5-08df1b6e701d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|10067099003|11063799006|56012099006|6133799003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	h5lj4P5dIYPM9uePjFAKLgREEVKrtYl1j+C0Utq5TqRyhdUnUjTWE5jJqvIY41aqAyyipGOcxg7Y8E+UM6V7Q5G01hjS1sIYVQ+H8T9tRpmc1AZv+vjwEMi10NWxv9UB7s9Ctn8O6kWCb12+AnVqmcPW7OfrTEExkpvyZyx5AKhL1S0LJvVgtHhnNdjZ1obfSkJqmNPum4BxZPkyMNWo3wbsBzSlb4dQmpyCqa4jJ8TJDuoxoa03Mcy3jmfSbEn2ThkEZQxxeDZoMCIaplbbxRojPr1/h6oLJ64W7gihRmBdygBWpvayoB39PBoxFVZJE++EzBJwZB2pw/gk/skymaBnZdaWLtWPZcdRS85TxEHnpb4VLbGHSzYK4U1irZQWvZpc/3d8HTem8osHLKpYugW8S7zNpsiVu9NAqa9+QKFQEf01AjCp/9hyfMSDUVbkkMdv7a0Tti9qVviEqYcEv/4G1P2EdV5gHxAopNs07bQNSFGj45F6pn4FhfRYhyErjaXJJGk9mSOUcdEF+qxHgLuEqYiSTJrkvyzIATVxjVbZ9VSGK5w6Wwv078Ju9vCXyoEapsrcaTFM9z8lqdHFOlJkj0sl15OL45sAaMnGvlzCJ8FEr8+i8H+DMMSyhdsSqdtg+ZG62lVNZgZ8kb7kMiLYUZYmHwQygDxrUzK9bT9k+2qv5ydrIjat+lRDppeJUzWLaX4BZI+nsDKB2XibDA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(10067099003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lyJwYL7g2THTL/RpMiL8y/GN+O8V2uQetqvU8+SN4zP1QFZF0cGsNzv/G7Kh5sYZbDDPIxEam5LjvwJSO/3LQwxevqSDJDT7zqoByEmfhRKWUsO023zT7KwUzosii6AThIK1/dxMwKcMnIuWWAeiwpmbFx7Rsto/PMxztn8x9PW75rI41kgWiWwmZuL9F04IfH4rvqU6gIytkjDqez5Fxm6MELHQ17OdDxP2tIa5uJQEQKGLxNTNDRrjHn5WKxl+cq/pLBsglWQImD6Pz95lViCeamuB3XT15nrlbxH07LfgOP8z0SffhC2ph6Y24WgkxTHwIFrfG3sFEMbBDYc0/cpVt+BrTRF1eBq//kKtD8/tKzXreXn+EP0FFw23wPYoo6875lEtYhwEzOjeutkp06LEgDU/IursCl0ssGgv9/LXVGqp3E4ng7NLKeW5Rapg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2026 01:35:25.0848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c2561c-c3b3-463b-8fd5-08df1b6e701d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A7FE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9577

Add AIE version query via DRM_AMDXDNA_GET_INFO. The NPU firmware
version query already existed internally; it is now also exposed
through this ioctl alongside the new AIE version query.

These versions are mandatory once released, the firmware management
interfaces must support those queries in their stable version.
Propagating any failure to abort device initialization is intentional.

Co-developed-by: Hayden Laccabue <hayden.laccabue@amd.com>
Signed-off-by: Hayden Laccabue <hayden.laccabue@amd.com>
Signed-off-by: David Zhang <yidong.zhang@amd.com>
---
 drivers/accel/amdxdna/aie4_message.c  | 20 ++++++++++++++++++++
 drivers/accel/amdxdna/aie4_msg_priv.h | 11 +++++++++++
 drivers/accel/amdxdna/aie4_pci.c      | 10 ++++++++++
 drivers/accel/amdxdna/aie4_pci.h      |  2 ++
 4 files changed, 43 insertions(+)

diff --git a/drivers/accel/amdxdna/aie4_message.c b/drivers/accel/amdxdna/aie4_message.c
index 0bb1d18df027..17cc335f0656 100644
--- a/drivers/accel/amdxdna/aie4_message.c
+++ b/drivers/accel/amdxdna/aie4_message.c
@@ -74,6 +74,26 @@ int aie4_query_aie_metadata(struct amdxdna_dev_hdl *ndev,
 	return 0;
 }
 
+int aie4_query_aie_version(struct amdxdna_dev_hdl *ndev,
+			   struct amdxdna_drm_query_aie_version *version)
+{
+	DECLARE_AIE_MSG(aie4_msg_aie4_version_info, AIE4_MSG_OP_AIE_VERSION_INFO);
+	struct amdxdna_dev *xdna = ndev->aie.xdna;
+	int ret;
+
+	ret = aie_send_mgmt_msg_wait(&ndev->aie, &msg);
+	if (ret)
+		return ret;
+
+	XDNA_DBG(xdna, "Query AIE version - major: %u minor: %u",
+		 resp.major, resp.minor);
+
+	version->major = resp.major;
+	version->minor = resp.minor;
+
+	return 0;
+}
+
 int aie4_query_npu_firmware_version(struct amdxdna_dev_hdl *ndev,
 				    struct amdxdna_drm_query_firmware_version *fw_version)
 {
diff --git a/drivers/accel/amdxdna/aie4_msg_priv.h b/drivers/accel/amdxdna/aie4_msg_priv.h
index b9f7c61f36e3..81842fa1d6ce 100644
--- a/drivers/accel/amdxdna/aie4_msg_priv.h
+++ b/drivers/accel/amdxdna/aie4_msg_priv.h
@@ -22,6 +22,7 @@ enum aie4_msg_opcode {
 	AIE4_MSG_OP_CREATE_HW_CONTEXT                = 0x30003,
 	AIE4_MSG_OP_DESTROY_HW_CONTEXT               = 0x30004,
 	AIE4_MSG_OP_AIE_TILE_INFO                    = 0x30006,
+	AIE4_MSG_OP_AIE_VERSION_INFO                 = 0x30007,
 
 	AIE4_MSG_OP_ATTACH_WORK_BUFFER               = 0x40001,
 };
@@ -160,6 +161,16 @@ struct aie4_msg_aie4_tile_info_resp {
 	struct aie4_tile_info info;
 } __packed;
 
+struct aie4_msg_aie4_version_info_req {
+	__u32 resvd;
+} __packed;
+
+struct aie4_msg_aie4_version_info_resp {
+	enum aie4_msg_status status;
+	__u16 major;
+	__u16 minor;
+} __packed;
+
 struct aie4_msg_query_cert_firmware_version_req {
 	__u32 resvd;
 } __packed;
diff --git a/drivers/accel/amdxdna/aie4_pci.c b/drivers/accel/amdxdna/aie4_pci.c
index 880619e3a4a8..aea3edd51b4f 100644
--- a/drivers/accel/amdxdna/aie4_pci.c
+++ b/drivers/accel/amdxdna/aie4_pci.c
@@ -282,6 +282,10 @@ static int aie4_query(struct amdxdna_dev_hdl *ndev)
 	if (ret)
 		return ret;
 
+	ret = aie4_query_aie_version(ndev, &ndev->aie.version);
+	if (ret)
+		return ret;
+
 	ret = aie4_query_aie_metadata(ndev, &ndev->aie.metadata);
 	if (ret)
 		return ret;
@@ -588,6 +592,12 @@ static int aie4_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
 	case DRM_AMDXDNA_QUERY_AIE_METADATA:
 		ret = amdxdna_get_metadata(&ndev->aie, client, args);
 		break;
+	case DRM_AMDXDNA_QUERY_AIE_VERSION:
+		ret = amdxdna_get_aie_version(client, args, &ndev->aie.version);
+		break;
+	case DRM_AMDXDNA_QUERY_FIRMWARE_VERSION:
+		ret = amdxdna_get_firmware_version(client, args, &xdna->fw_ver);
+		break;
 	default:
 		XDNA_ERR(xdna, "Not supported request parameter %u", args->param);
 		ret = -EOPNOTSUPP;
diff --git a/drivers/accel/amdxdna/aie4_pci.h b/drivers/accel/amdxdna/aie4_pci.h
index 940e67347d74..5ae5e8427a3b 100644
--- a/drivers/accel/amdxdna/aie4_pci.h
+++ b/drivers/accel/amdxdna/aie4_pci.h
@@ -69,6 +69,8 @@ enum aie4_fw_feature {
 /* aie4_message.c */
 int aie4_query_aie_metadata(struct amdxdna_dev_hdl *ndev,
 			    struct amdxdna_drm_query_aie_metadata *metadata);
+int aie4_query_aie_version(struct amdxdna_dev_hdl *ndev,
+			   struct amdxdna_drm_query_aie_version *version);
 int aie4_suspend_fw(struct amdxdna_dev_hdl *ndev);
 int aie4_attach_work_buffer(struct amdxdna_dev_hdl *ndev);
 int aie4_query_npu_firmware_version(struct amdxdna_dev_hdl *ndev,
-- 
2.34.1

