Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794902662;
	b=kvxBWDuSNdsE9AvZ9rygJfaTK8YEHsx6EstrT5XKDOIjdQoc+WmVJLEtStCMWBv6E83Y
	 fQk3Z4N0t17pQxPWdIFGwi1lCENiihvcM+x08M9tiw/TgEPOFoDv6w/Yy+kmvxb6QPlaK
	 MNXDuGQ8yKaW9BX1N8Bfuf/LGOvxRhUN7n+dAPp3zBYU5ziDRhw6Z3A1a8iu3CPzz2str
	 Bfdl7ZGl5wiwHwVNu6usQD5b0nVwaB6A9iTPfZKg6nQbokPYVnYAZqQFQwcPtqrPUpGld
	 SqD558NHrcwtm42SX3juaz0YJQoD6m6b6kAxpNF/Grwo2MfVZJmweLsypivT3+ZGhyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902662;
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
	bh=mBSWyxwXjUNUWcNnBoRNho+7M0fc5w1lD+fEYNei2kY=;
	b=PT4XlkC5Y3v/tEQFNP3ICb9Lz+04dnnO+KP1YI6TgAQBTxCvBm1Nq6SPPVD2cIpbdWRR
	 Ipz0/TfyJ2k9JFci+ixrgLMlBv6EXbyuvSCxBYTs3BDBdFnE1QpxtCp5CvNZYtxwt8sV+
	 EUm1/Kb4/PXe+j9iZfJgnF1udy5hdTc+MmMn0msw3VbefD97BblS0Q7qYTrCvrzVOPd9H
	 lIF9nAKj9Kd/LEbwhs7H2z4ruTTGWbrrVN2CM54AYK6FQWqd7auMez4RoXwDEEzyLs2WJ
	 BmxrIHpjF5NVEn75sIt5ZMquLKZsIQsH/DaACQBp8FGcSlcdMfErLlueNsaxgCMy9SQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jz9R00zg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.7
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010007.outbound.protection.outlook.com [52.101.193.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB1C606A332;
	Tue, 17 Nov 2026 08:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAB1C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jz9R00zg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hx9Sn2CkfvpQ2hRrV9jgFmeF62DfunqAjz3pHH0yGPH5leIB3YgRSy010QcEjdZQeOr9x61dfOFpQmUUSIS6L8gSR04FLtc+1XHl3T7wVjhYQ2bxf+mY43rilOMuEbq8ivledw/aY9NpbVukJZY+7EKB/vRuFo/ubsWwquza83jVrICSgNnCg9VAKLMwUe7YncszD3G77acayH6j26HjKl0lsAtMVMKaOLH3AytMJJIgs8+FRuazQMMUXeOPPifYOcJKkONGJ7ZDA2jYRI3djQ6AXTvr+Ge/qO5M940LB7Rn7zZJPzTQzyGdrYqQ8SuijlMKSnJVgNPAlXHqxCvQ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBSWyxwXjUNUWcNnBoRNho+7M0fc5w1lD+fEYNei2kY=;
 b=NM7Md0IEacp32tNx4eMURqsD4sv4tvCFwnrw5SsfiAL4fr8a+6s6QYRU+8BaYdYkHeXTJRYcrYm3G+XuaRcASlHqMDiZ3LgF1ErK1tX1AA0OENkl1pXZ1YGHHXXC43BZWGaiR+PkBC0Wnp8ErZDbn82NE+eUybjdreGFRQrVE6Brbjzy4mvPkraNePbpSvGjp0LaNLrNLJOulcHqWuoX74q63RjbbLWO3oL1mGrQoQApbyzGA4ukJyQeOf+LRKL8NL0xV7T5GppN5p4cK06Y/PSAF0atPUDXNtZrfSs5fC9vzjU1vLnEHzi2450Rn3no8aZnoMnNWZKLKrU7yArUFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBSWyxwXjUNUWcNnBoRNho+7M0fc5w1lD+fEYNei2kY=;
 b=jz9R00zgRYOM9CzrlrG7pXhmMKYqvdobW95vcO1mQbFSVOAtZrhqtBfKgRirCR54QIRuCYiOEBTdl4bQhGZ+qXNgKY/HgbK6yXvTnE+tXyfbPncPvR3DqOVtRLCCIMqKK2Tjh9x7l2r+Ouaagj11XkmevUx8DBaRE1KO1LYS8Bc=
Received: from BN9PR03CA0317.namprd03.prod.outlook.com (2603:10b6:408:112::22)
 by SA5PPF8BD1FB094.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Tue, 17 Nov
 2026 08:04:16 +0000
Received: from BN2PEPF0000A98F.namprd04.prod.outlook.com
 (2603:10b6:408:112:cafe::9c) by BN9PR03CA0317.outlook.office365.com
 (2603:10b6:408:112::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 08:04:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000A98F.mail.protection.outlook.com (10.167.248.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 08:04:13 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 02:04:11 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 02:04:08 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v2 03/11] soundwire: amd: extend ctl_word_prep to set SSP_TAG for ACP7B/7E/7F
Date: Tue, 17 Nov 2026 13:31:42 +0530
Message-ID: <20261117080239.918428-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117080239.918428-1-Vijendar.Mukunda@amd.com>
References: <20261117080239.918428-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A98F:EE_|SA5PPF8BD1FB094:EE_
X-MS-Office365-Filtering-Correlation-Id: 54663fff-4e1f-4118-b31a-08df44815eb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|22082099003|18002099003|261009223027099003|261022115727099003|56012099006|261022113327099003|11063799006|261021123027099003|261021121427099003|261102123227099003|261028144727099003|261022105027099003|261026130827099003|261022075727099003|261026140227099003|261021135927099003|261026135527099003|261026121527099003|261021133027099003|261021130227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	iIV22fMYT5CToHRE9mqkOhW+XsbpRw0YL1qcWsXUdQE1PKEn4qjJgJgX/7x8+4oKFDq0WyLzkW78doziejPn18GgFfiLwOSUj4gvpGxe+V98I6rK5QoNY+jNLhRMhrI4lLQKGE01AtrjT9aVLb7B2JfCvEIsaqNxUmrZwaroPQ7lQHRhMSGxA3STkBfet9p3nTOz6seliprJUImDbA4Cb324nT0bcGYeE1vkvWXoDiM0uexHtaof3O/J8eiZMCZOuinf7S1Y9Ei9kWj2Fzw2W8J7HStZnd7m1yb2w9tv/ACQYzD5J6d3/FhuNsgN4VwVL3IyZr6OzxweQYdiWfZrSgcGVLa3n1NyK8SjD1FsJjKlHYSxLrMuf/XupBYHfEjuG8mqdwW1M4pAxNvLBg9i/9phxnFl/Xc2goNNVuRB2cWrUFX1a7sdlvB7/4O3nK8kxnBwvIMz6AvRly+zfjWI7fHSZGiuYlXGF73K0Imj9BPOE6WnJDIzYa3CQ75+mcAaNtoa6LdeL82WVPjGtPxPenihGsrcxFcFHUoGkfSTkrSWBJCDWks7Qe/35y2j3fjOZDT583hn/7i+pxk6rHWXkAhOV+aB5ilfS1D0c5LZl+G1RTdVPuC7sFM+gNuxlEsPx77XEFI6ngLx70xKRqyscxr+703bVkhaoGQ8J56wgVmtYdKlTE5/r2gaz8P3iKlNoh574du/yyAtiainpVc+Kw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(261009223027099003)(261022115727099003)(56012099006)(261022113327099003)(11063799006)(261021123027099003)(261021121427099003)(261102123227099003)(261028144727099003)(261022105027099003)(261026130827099003)(261022075727099003)(261026140227099003)(261021135927099003)(261026135527099003)(261026121527099003)(261021133027099003)(261021130227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	po1NQ/DQ6323ligWQ5YpQtJT1YOfxLR0OHVv0Wtrp2ytsgq40qYTcvsW+wqnYQRiBT14yoZql4UrxUcRKfpOJHSjpGBky1s3wGF6e/r8vBncWKXMjdbrE9trM3+e9EylvSbhQCYXAZt9nNAfYoAhWy6VTAJ8NMiQ8PyrszRY/nFRDxfwuaMQZKQkQZrhLoyYnp7RiFGUMPxCVjowrWiCecl2a950iP20iVodt3G5nVa5jWGDAQbH+030PFwebi4W1qJsEMk6UZxTZhh93lmUTrcbdY98xNIc1FXMSuqOriWWOKvId1sXT6y0NFeJWKqDlQcX6bVmGlV7JnbNzKrK/QAIQpK5osm+38GenZhau0EyQKeSeYnH4BTC27+T5PU7nHZCqpouIfcahE7k3g/Y6Eea3vrVScPpVMNhAOwwh/Jh2F1Qjn7soe6v6QxQX9Jk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 08:04:13.9936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54663fff-4e1f-4118-b31a-08df44815eb5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A98F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF8BD1FB094

ACP7B/7E/7F SoundWire hardware requires the SSP_TAG field in the
upper command word to be set from msg->ssp_sync for each transfer.

Add an acp_rev parameter to amd_sdw_ctl_word_prep() and use a
switch/case to conditionally set AMD_SDW_MCP_CMD_SSP_TAG only for
ACP7B/7E/7F revisions. ACP6.3/7.0/7.1/7.2 do not use this field.
Update the three call sites to pass amd_manager->acp_rev.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager_common.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/amd_manager_common.c b/drivers/soundwire/amd_manager_common.c
index f9c362fd6337..4c1765cac1e7 100644
--- a/drivers/soundwire/amd_manager_common.c
+++ b/drivers/soundwire/amd_manager_common.c
@@ -28,7 +28,7 @@
 #define to_amd_sdw(b)	container_of(b, struct amd_sdw_manager, bus)
 
 static void amd_sdw_ctl_word_prep(u32 *lower_word, u32 *upper_word, struct sdw_msg *msg,
-				  int cmd_offset)
+				  int cmd_offset, u32 acp_rev)
 {
 	u32 upper_data;
 	u32 lower_data = 0;
@@ -45,6 +45,20 @@ static void amd_sdw_ctl_word_prep(u32 *lower_word, u32 *upper_word, struct sdw_m
 
 	upper_data = FIELD_PREP(AMD_SDW_MCP_CMD_DEV_ADDR, msg->dev_num);
 	upper_data |= FIELD_PREP(AMD_SDW_MCP_CMD_COMMAND, msg->flags + 2);
+	switch (acp_rev) {
+	case ACP7B_PCI_REV_ID:
+	case ACP7E_PCI_REV_ID:
+	case ACP7F_PCI_REV_ID:
+		upper_data |= FIELD_PREP(AMD_SDW_MCP_CMD_SSP_TAG, msg->ssp_sync);
+		break;
+	case ACP63_PCI_REV_ID:
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
+		break;
+	default:
+		return;
+	}
 	upper_data |= FIELD_PREP(AMD_SDW_MCP_CMD_REG_ADDR_HIGH, upper_addr);
 	lower_data |= FIELD_PREP(AMD_SDW_MCP_CMD_REG_ADDR_LOW, lower_addr);
 	lower_data |= FIELD_PREP(AMD_SDW_MCP_CMD_REG_DATA, data);
@@ -65,7 +79,7 @@ amd_program_scp_addr(struct amd_sdw_manager *amd_manager, struct sdw_msg *msg)
 	scp_msg.addr = SDW_SCP_ADDRPAGE1;
 	scp_msg.buf = &msg->addr_page1;
 	scp_msg.flags = SDW_MSG_FLAG_WRITE;
-	amd_sdw_ctl_word_prep(&lower_data, &upper_data, &scp_msg, 0);
+	amd_sdw_ctl_word_prep(&lower_data, &upper_data, &scp_msg, 0, amd_manager->acp_rev);
 	if (acp_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response_buf[0])) {
 		dev_err_ratelimited(amd_manager->dev,
 				    "SCP_addrpage command timeout for Slave %d\n", msg->dev_num);
@@ -73,7 +87,7 @@ amd_program_scp_addr(struct amd_sdw_manager *amd_manager, struct sdw_msg *msg)
 	}
 	scp_msg.addr = SDW_SCP_ADDRPAGE2;
 	scp_msg.buf = &msg->addr_page2;
-	amd_sdw_ctl_word_prep(&lower_data, &upper_data, &scp_msg, 0);
+	amd_sdw_ctl_word_prep(&lower_data, &upper_data, &scp_msg, 0, amd_manager->acp_rev);
 	if (acp_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response_buf[1])) {
 		dev_err_ratelimited(amd_manager->dev,
 				    "SCP_addrpage command timeout for Slave %d\n", msg->dev_num);
@@ -146,7 +160,7 @@ static unsigned int _amd_sdw_xfer_msg(struct amd_sdw_manager *amd_manager, struc
 	u64 response;
 	u32 upper_data = 0, lower_data = 0;
 
-	amd_sdw_ctl_word_prep(&lower_data, &upper_data, msg, cmd_offset);
+	amd_sdw_ctl_word_prep(&lower_data, &upper_data, msg, cmd_offset, amd_manager->acp_rev);
 	if (acp_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response)) {
 		dev_err_ratelimited(amd_manager->dev, "command timeout for Slave %d\n",
 				    msg->dev_num);
-- 
2.53.0

