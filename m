Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794900085;
	b=OzuK1+8X68XY6w0/9YaXFaIiJ5obVsTKqehY3jobmD78OcOAjA/RQcreWkN+Fza0cUkf
	 Ha232++ZayrVtm8LmK4ILjWsoaONkslgYPoqVtcTZCnd7WS0RWflIPlO78bqszAtzYY95
	 //kZa5BQidMgvH4wT2p6fJq9vdbim2FKWzLQDvpObb9Ryf3udTmT4Ix5GZGlPA4680wmH
	 Kk7LBqCQWdXmdZ8a4TNLkw5VDSpR8OPm38LX7k9US1E24GYyzJ9arv5iStYoP/X+xT4ba
	 j/KFVlDkBIeZtXWATYCfvpptKHehec7oWYDUp3albl6XoU8e6wj/RN4LeMagxxVl/9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900085;
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
	bh=/oGCjA21Mezs4lGT+Ksf8wO79hIwF9rkQi37f8nGcBM=;
	b=RlO+P7aWmc4g+hS+bfAPeX3LLXHlAeJgl5Ruu0O0srWqVKn7wLX/+RrqlMqEBeqLzeZn
	 GdNoMdHFE/Yvozhg1d45xPbNKLblBjv8GQiS6/snOxkI0wwm2cs4BRnmRxOKljZmcE/N7
	 z1RfUZ7Kxv5y7fX/SsO7tSzdJoku4OvSt6JbzvngIPHD6ZQQwSXCQwwfgnA7kHrlD7qwb
	 rsG+vRiHW2tFkBF8mx6uicH/vJnek1PsVeQ/UDlCwr00bTfijgrBx8Wnz4k2WFTrJ6jmc
	 HvUFsawDmL1DydAKNxb21ovIGjO+CHSllQjnrUC8uVUaolNwdESaBU0+sVWbRs4NnAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lmYWvmkm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.68
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012068.outbound.protection.outlook.com [52.101.48.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1457F606A334;
	Tue, 17 Nov 2026 07:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1457F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lmYWvmkm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wffQExFYeJ2aTPAvoXdX5FxElJQr9uhOyOOCicqaWekWGc9alFE5uzwdpMw/SVTrBW2YIZp87hKl00BsuTQe3Wqpkui5es58B0xiwBP4sturuCEykwmzm2Lx00xUPkcd/8hQg8GfmInmhlZdwb50bQ4Kn98B4ce/c3ZAqeXuCbwXm/tnh8ajM6+TTDhqP1UWcPFRQ/SYCvXspbyPYul+TJiXbt8jUO+acon/E2+SThy98GtYP3T+PDaL1q7nqGmo9/5CnxKTxfqywEN76kYlnn/xtsSuJY9sgAUHoX6/KIqV8MMP8OXqW86RT3DXBCxtsYqO7XipwJC7sAaj66qqsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oGCjA21Mezs4lGT+Ksf8wO79hIwF9rkQi37f8nGcBM=;
 b=o4ZAgKHNBS1BhY54NesU4Y2M5+ZqBJew7aL+v8YSr73SDYBkjb6iPjbwUOQMG46Np2aZv8q1Dfd+qPEeL4HF1OQQx+lA6PxuUuOGIB9GEy0/kgC3JrVynKRROp8woOYUWawKDDAqsjRCayCihlxjXksuqwk1nlC3JSUoAptg9mTp5qtg8lY27uwDfAu0f4DYCRtc1u53qjeCOb8FQIaLcWX7MTTbHq/2fiLs7sB90xOpCXbYwxm8dMu4b8KRxvRBoqWiP7LwOiPQGSNqsqAUfKKcpSFWr+f3ZxI3M38IQFqkjTWvHomtSXJ7eG+nC4R08OCTeMix0COe5iLJWJppGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oGCjA21Mezs4lGT+Ksf8wO79hIwF9rkQi37f8nGcBM=;
 b=lmYWvmkm8XFpG7kfo5Nsq1MDVeGwfPROp8KDhD+NcQylBlxafpTK37HwGRe46xNrVzZNSCk6tbR6P10NJoXphvMZCZ74moCoEXY3TdKz4LNuLzFiVlZaXecZOFzcCESGFXtOzAg+uppwWDW8qi5PS+33t2YjMKzzk9H5XQDzP4E=
Received: from BN0PR04CA0050.namprd04.prod.outlook.com (2603:10b6:408:e8::25)
 by DS7PR12MB9476.namprd12.prod.outlook.com (2603:10b6:8:250::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:21:21 +0000
Received: from BN2PEPF0000A804.namprd02.prod.outlook.com
 (2603:10b6:408:e8:cafe::4c) by BN0PR04CA0050.outlook.office365.com
 (2603:10b6:408:e8::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 17
 Nov 2026 07:21:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000A804.mail.protection.outlook.com (10.167.245.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:21:20 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:21:19 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:21:16 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 08/11] soundwire: amd: populate hw_ops and wire all call sites through acp_*() helpers
Date: Tue, 17 Nov 2026 12:48:17 +0530
Message-ID: <20261117071927.830373-9-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117071927.830373-1-Vijendar.Mukunda@amd.com>
References: <20261117071927.830373-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A804:EE_|DS7PR12MB9476:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f1b882a-083c-4567-301d-08df447b60e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|11063799006|56012099006|261026121527099003|261026135527099003|261026140227099003|261028144727099003|10067099003|261022115727099003|261021130227099003|261021135927099003|261021133027099003|261022075727099003|261021123027099003|261022113327099003|261021121427099003|261022105027099003|261026130827099003|261102123227099003|261009220027099003|261009221727099003|261009223327099003|261009223027099003|261009221227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ieMkNXBo3olV3JG4w6AtkDGDJw3k5TNFcw3kHs+hH/GMaWXdls0+v1049SywagnbmkV1IPfzTojFRMtnD/MkZpNyvzHtj4ABQfe5I5AmGkXuddQKEAJtnFK3TJbu+XvqOSwPf+KyFeOLI3QhiZDsmtx9dWeXKhGjRpAqcnxZZpTpALhLHI58+C0V7VVgEZ/qQNH+gGJrqkDdSSbreS29BWzRWH2tX/0TDRVGSGMeM3DCvwySjEQGuDVRBR7TtsHz46eLSuUc0Kp6G6sUzu2JamazpT0E+fbLFSrInmo99IEb4wXVDb/Lu3dt9MJ4CzFP1MtIl3cOrEqXf9r6mG+oeYPCJ8RHAXnp6K1arFlEgech3WfoYJgHEJUMrBYJahzosCiYUvVS6q8SF3b1s7LZhqP42G5/oUNv4aOOIX6vSoqS4tQKyZ8+gU+7QZEIt7cCtjxljpd+FrDplKhimD2EkR7PCPgIlVmcP+h3PhS/RgaCB2iX9schTGcf8JoQJLZzVcx16CtZCw4xbTEoQKL3fGJR7TOPHbsqfffSgcHzasD/knFHcaC3RgwubVTkeEynFm4kJO/gtVfL7upB9ixRWcT40eh+2eysqK7hmG5PB7bt2irwiaxH3Vc7bBsnqqD9hF1fI3b8wK7Ps5U5SHEcyt+ZQBSpYLL3Fz5a6i293sZtVxWLEQ2CVrIldRprY4UpiFTGot9FIDf2etnALDRpug==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(261026121527099003)(261026135527099003)(261026140227099003)(261028144727099003)(10067099003)(261022115727099003)(261021130227099003)(261021135927099003)(261021133027099003)(261022075727099003)(261021123027099003)(261022113327099003)(261021121427099003)(261022105027099003)(261026130827099003)(261102123227099003)(261009220027099003)(261009221727099003)(261009223327099003)(261009223027099003)(261009221227099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NVBidb6dLpJsO/VFJPpn09LwPY88kgegGjxRKNa/VlNKgcmP4RGg/99k8Aunsz5MDNN25jVFG5aBYIVPdsdGIhQZMlFn9k5WgTzaWvVdHQ5uJPfae0Kxm/1QntdJ5I9trdcYanj35jJnDHGB0TpHbwfA7SOeaqFX+GHe/MD4/jrVvDetSofQ86+9Qtxa07C7N01ICILWupOViRKK8P2q5rVUJszggGN7peAQ5AtGaE9W1Ns8YriRCkFteXQ5odbqRX6laFUwDdBgW0lzzJ4DVsdn9G7cG1HluhioFAjTiYbFcXyrgqGvHs+vAUkENEqtc+1P4ohiXKoculcjdreN1WARej5U6/aWTn99vvJsTSM4Z+7hWHa8PkT6lZAnL8egOo+EM9mLm3TKHIs64vutqbMhFLTbW5KcuTOviPNo1vTjdMCaYcsMSRGx/8WqXMa6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:21:20.7032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1b882a-083c-4567-301d-08df447b60e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A804.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9476

Populate the amd_sdw_hw_ops dispatch table introduced in the previous
patch and convert every direct amd_acp63_*() call site in the driver to
use the corresponding acp_*() inline helper.

Introduce a static const struct amd_sdw_hw_ops amd_acp63_hw_ops table
that registers all amd_acp63_*() callbacks. Add amd_sdw_hw_init_ops()
which assigns the table pointer based on acp_rev, and call it from
amd_sdw_manager_probe() so hw_ops is set before any dispatch helper is
reached.

Extract the PM suspend/resume logic into amd_acp63_sdw_suspend(),
amd_acp63_sdw_suspend_runtime() and amd_acp63_sdw_resume_runtime()
hw_ops callbacks (taking struct amd_sdw_manager * instead of
struct device *). The existing amd_suspend(), amd_suspend_runtime() and
amd_resume_runtime() device-PM entry points become thin one-liners that
delegate to the corresponding acp_sdw_*() helpers. All direct
amd_acp63_*() calls within the extracted callbacks are replaced by the
corresponding acp_*() dispatch helpers; no functional change is intended.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_init.c    |   5 +-
 drivers/soundwire/amd_manager.c | 357 ++++++++++++++++++--------------
 2 files changed, 208 insertions(+), 154 deletions(-)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index b4fad6f0f1fc..fb395fb32959 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -16,7 +16,8 @@
 
 #include "amd_init.h"
 
-static int amd_enable_sdw_pads(void __iomem *mmio, u32 link_mask, u32 acp_rev, struct device *dev)
+static int amd_acp63_enable_sdw_pads(void __iomem *mmio, u32 link_mask,
+				     u32 acp_rev, struct device *dev)
 {
 	u32 pad_keeper_mask, pad_pulldown_mask, pad_schmen_mask, pad_oe_mask;
 	bool needs_schmen_oe;
@@ -117,7 +118,7 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 		return NULL;
 	}
 
-	ret = amd_enable_sdw_pads(res->mmio_base, res->link_mask, res->acp_rev, res->parent);
+	ret = amd_acp63_enable_sdw_pads(res->mmio_base, res->link_mask, res->acp_rev, res->parent);
 	if (ret)
 		return NULL;
 
diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 64034a1b5cea..50f48d6aeecb 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -418,8 +418,7 @@ amd_program_scp_addr(struct amd_sdw_manager *amd_manager, struct sdw_msg *msg)
 	scp_msg.buf = &msg->addr_page1;
 	scp_msg.flags = SDW_MSG_FLAG_WRITE;
 	amd_sdw_ctl_word_prep(&lower_data, &upper_data, &scp_msg, 0);
-	if (amd_acp63_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data,
-					    &response_buf[0])) {
+	if (acp_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response_buf[0])) {
 		dev_err_ratelimited(amd_manager->dev,
 				    "SCP_addrpage command timeout for Slave %d\n", msg->dev_num);
 		return SDW_CMD_TIMEOUT;
@@ -427,8 +426,7 @@ amd_program_scp_addr(struct amd_sdw_manager *amd_manager, struct sdw_msg *msg)
 	scp_msg.addr = SDW_SCP_ADDRPAGE2;
 	scp_msg.buf = &msg->addr_page2;
 	amd_sdw_ctl_word_prep(&lower_data, &upper_data, &scp_msg, 0);
-	if (amd_acp63_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data,
-					    &response_buf[1])) {
+	if (acp_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response_buf[1])) {
 		dev_err_ratelimited(amd_manager->dev,
 				    "SCP_addrpage command timeout for Slave %d\n", msg->dev_num);
 		return SDW_CMD_TIMEOUT;
@@ -501,7 +499,7 @@ static unsigned int _amd_sdw_xfer_msg(struct amd_sdw_manager *amd_manager, struc
 	u32 upper_data = 0, lower_data = 0;
 
 	amd_sdw_ctl_word_prep(&lower_data, &upper_data, msg, cmd_offset);
-	if (amd_acp63_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response)) {
+	if (acp_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response)) {
 		dev_err_ratelimited(amd_manager->dev, "command timeout for Slave %d\n",
 				    msg->dev_num);
 		return SDW_CMD_TIMEOUT;
@@ -564,7 +562,7 @@ static void amd_acp63_sdw_read_and_process_ping_status(struct amd_sdw_manager *a
 	u64 response;
 
 	mutex_lock(&amd_manager->bus.msg_lock);
-	if (amd_acp63_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response)) {
+	if (acp_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response)) {
 		mutex_unlock(&amd_manager->bus.msg_lock);
 		return;
 	}
@@ -582,7 +580,7 @@ static u32 amd_acp63_sdw_read_ping_status(struct sdw_bus *bus)
 	u32 slave_stat;
 
 	lockdep_assert_held(&bus->msg_lock);
-	if (amd_acp63_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response))
+	if (acp_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response))
 		return amd_manager->ping_slave_stat == U32_MAX ? 0 : amd_manager->ping_slave_stat;
 	/* slave status from ping response */
 	slave_stat = FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response);
@@ -1082,7 +1080,7 @@ static void amd_acp63_sdw_update_slave_status_work(struct amd_sdw_manager *amd_m
 			       ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7);
 			writel(AMD_SDW_IRQ_MASK_8TO11, amd_manager->mmio +
 			       ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
-			amd_acp63_sdw_read_and_process_ping_status(amd_manager);
+			acp_sdw_read_and_process_ping_status(amd_manager);
 			goto update_status;
 		} else {
 			dev_err_ratelimited(amd_manager->dev,
@@ -1158,12 +1156,12 @@ static void amd_acp63_sdw_irq_thread(struct amd_sdw_manager *amd_manager)
 		amd_manager->instance, status_change_0to7, status_change_8to11);
 
 	if (status_change_8to11 & AMD_SDW_WAKE_STAT_MASK) {
-		amd_acp63_sdw_process_wake_event(amd_manager);
+		acp_sdw_process_wake_event(amd_manager);
 		status_change_8to11 &= ~AMD_SDW_WAKE_STAT_MASK;
 	}
 
 	if (status_change_8to11 & AMD_SDW_PREQ_INTR_STAT) {
-		amd_acp63_sdw_read_and_process_ping_status(amd_manager);
+		acp_sdw_read_and_process_ping_status(amd_manager);
 	} else {
 		/* Check for the updated status on peripheral device */
 		amd_sdw_update_slave_status(status_change_0to7, status_change_8to11, amd_manager);
@@ -1199,17 +1197,17 @@ int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
 
 	prop = &amd_manager->bus.prop;
 	if (!prop->hw_disabled) {
-		ret = amd_acp63_sdw_clk_init_ctrl(amd_manager);
+		ret = acp_sdw_clk_init_ctrl(amd_manager);
 		if (ret)
 			return ret;
-		ret = amd_acp63_init_sdw_manager(amd_manager);
+		ret = acp_init_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
-		amd_acp63_enable_sdw_interrupts(amd_manager);
-		ret = amd_acp63_enable_sdw_manager(amd_manager);
+		acp_enable_sdw_interrupts(amd_manager);
+		ret = acp_enable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
-		amd_acp63_sdw_set_frameshape(amd_manager);
+		acp_sdw_set_frameshape(amd_manager);
 	}
 	/* Enable runtime PM */
 	pm_runtime_set_autosuspend_delay(amd_manager->dev, AMD_SDW_MASTER_SUSPEND_DELAY_MS);
@@ -1220,117 +1218,6 @@ int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
 	return 0;
 }
 
-static int amd_sdw_manager_probe(struct platform_device *pdev)
-{
-	const struct acp_sdw_pdata *pdata = pdev->dev.platform_data;
-	struct resource *res;
-	struct device *dev = &pdev->dev;
-	struct sdw_master_prop *prop;
-	struct amd_sdw_manager *amd_manager;
-	int ret;
-
-	amd_manager = devm_kzalloc(dev, sizeof(struct amd_sdw_manager), GFP_KERNEL);
-	if (!amd_manager)
-		return -ENOMEM;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENOMEM;
-
-	amd_manager->acp_mmio = devm_ioremap(dev, res->start, resource_size(res));
-	if (!amd_manager->acp_mmio) {
-		dev_err(dev, "mmio not found\n");
-		return -ENOMEM;
-	}
-	amd_manager->ping_slave_stat = U32_MAX;
-	amd_manager->instance = pdata->instance;
-	amd_manager->mmio = amd_manager->acp_mmio +
-			    (amd_manager->instance * ACP63_SDW_MANAGER_REG_OFFSET);
-	amd_manager->acp_sdw_lock = pdata->acp_sdw_lock;
-	amd_manager->acp_rev = pdata->acp_rev;
-	amd_manager->cols_index = sdw_find_col_index(AMD_SDW_DEFAULT_COLUMNS);
-	amd_manager->rows_index = sdw_find_row_index(AMD_SDW_DEFAULT_ROWS);
-	amd_manager->dev = dev;
-	amd_manager->bus.ops = &amd_acp63_sdw_ops;
-	amd_manager->bus.port_ops = &amd_acp63_sdw_port_ops;
-	amd_manager->bus.compute_params = &amd_acp63_sdw_compute_params;
-	amd_manager->bus.clk_stop_timeout = 200;
-	amd_manager->bus.link_id = amd_manager->instance;
-
-	/*
-	 * Due to BIOS compatibility, the two links are exposed within
-	 * the scope of a single controller. If this changes, the
-	 * controller_id will have to be updated with drv_data
-	 * information.
-	 */
-	amd_manager->bus.controller_id = 0;
-	dev_dbg(dev, "acp_rev:0x%x\n", amd_manager->acp_rev);
-	switch (amd_manager->acp_rev) {
-	case ACP63_PCI_REV_ID:
-		switch (amd_manager->instance) {
-		case ACP_SDW0:
-			amd_manager->num_dout_ports = AMD_ACP63_SDW0_MAX_TX_PORTS;
-			amd_manager->num_din_ports = AMD_ACP63_SDW0_MAX_RX_PORTS;
-			break;
-		case ACP_SDW1:
-			amd_manager->num_dout_ports = AMD_ACP63_SDW1_MAX_TX_PORTS;
-			amd_manager->num_din_ports = AMD_ACP63_SDW1_MAX_RX_PORTS;
-			break;
-		default:
-			return -EINVAL;
-		}
-		break;
-	case ACP70_PCI_REV_ID:
-	case ACP71_PCI_REV_ID:
-	case ACP72_PCI_REV_ID:
-		amd_manager->num_dout_ports = AMD_ACP70_SDW_MAX_TX_PORTS;
-		amd_manager->num_din_ports = AMD_ACP70_SDW_MAX_RX_PORTS;
-		break;
-	default:
-		return -EINVAL;
-	}
-	amd_manager->max_ports = amd_manager->num_dout_ports + amd_manager->num_din_ports;
-	amd_manager->port_offset_map = devm_kcalloc(dev, amd_manager->max_ports,
-						    sizeof(int), GFP_KERNEL);
-	if (!amd_manager->port_offset_map)
-		return -ENOMEM;
-
-	prop = &amd_manager->bus.prop;
-	prop->mclk_freq = AMD_SDW_BUS_BASE_FREQ;
-
-	ret = sdw_bus_master_add(&amd_manager->bus, dev, dev->fwnode);
-	if (ret) {
-		dev_err(dev, "Failed to register SoundWire manager(%d)\n", ret);
-		return ret;
-	}
-	ret = amd_sdw_register_dais(amd_manager);
-	if (ret) {
-		dev_err(dev, "CPU DAI registration failed\n");
-		sdw_bus_master_delete(&amd_manager->bus);
-		return ret;
-	}
-	INIT_WORK(&amd_manager->amd_sdw_irq_thread, amd_sdw_irq_thread);
-	INIT_WORK(&amd_manager->amd_sdw_work, amd_sdw_update_slave_status_work);
-	dev_set_drvdata(dev, amd_manager);
-	return 0;
-}
-
-static void amd_sdw_manager_remove(struct platform_device *pdev)
-{
-	struct amd_sdw_manager *amd_manager = dev_get_drvdata(&pdev->dev);
-	int ret;
-
-	if (pm_runtime_enabled(&pdev->dev))
-		pm_runtime_disable(&pdev->dev);
-	amd_acp63_disable_sdw_interrupts(amd_manager);
-	cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
-	cancel_work_sync(&amd_manager->amd_sdw_work);
-	sdw_bus_master_delete(&amd_manager->bus);
-	ret = amd_acp63_disable_sdw_manager(amd_manager);
-	if (ret)
-		dev_err(&pdev->dev, "Failed to disable device (%pe)\n", ERR_PTR(ret));
-}
-
 /*
  * AMD SoundWire clock-stop sequence shared across all ACP revisions.
  * Differences between revisions in this path are minimal; a switch/case
@@ -1461,7 +1348,7 @@ static int __maybe_unused amd_sdw_host_wake_enable_by_rev(struct amd_sdw_manager
 	case ACP70_PCI_REV_ID:
 	case ACP71_PCI_REV_ID:
 	case ACP72_PCI_REV_ID:
-		return amd_acp63_sdw_host_wake_enable(amd_manager, enable);
+		return acp_sdw_host_wake_enable(amd_manager, enable);
 	default:
 		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
 		return -EINVAL;
@@ -1469,9 +1356,8 @@ static int __maybe_unused amd_sdw_host_wake_enable_by_rev(struct amd_sdw_manager
 	return 0;
 }
 
-static int __maybe_unused amd_suspend(struct device *dev)
+static int amd_acp63_sdw_suspend(struct amd_sdw_manager *amd_manager)
 {
-	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
 	struct sdw_bus *bus = &amd_manager->bus;
 	int ret;
 
@@ -1482,7 +1368,7 @@ static int __maybe_unused amd_suspend(struct device *dev)
 	}
 
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
-		amd_acp63_disable_sdw_interrupts(amd_manager);
+		acp_disable_sdw_interrupts(amd_manager);
 		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 		cancel_work_sync(&amd_manager->amd_sdw_work);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
@@ -1491,9 +1377,9 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		amd_acp63_enable_sdw_interrupts(amd_manager);
+		acp_enable_sdw_interrupts(amd_manager);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
-		amd_acp63_disable_sdw_interrupts(amd_manager);
+		acp_disable_sdw_interrupts(amd_manager);
 		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 		cancel_work_sync(&amd_manager->amd_sdw_work);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
@@ -1506,7 +1392,7 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		ret = amd_acp63_disable_sdw_manager(amd_manager);
+		ret = acp_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
 		/* System suspend: tear down all pads */
@@ -1521,7 +1407,7 @@ static int __maybe_unused amd_suspend(struct device *dev)
 	case ACP70_PCI_REV_ID:
 	case ACP71_PCI_REV_ID:
 	case ACP72_PCI_REV_ID:
-		ret = amd_acp63_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
+		ret = acp_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
 		if (ret)
 			return ret;
 		break;
@@ -1532,9 +1418,8 @@ static int __maybe_unused amd_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused amd_suspend_runtime(struct device *dev)
+static int amd_acp63_sdw_suspend_runtime(struct amd_sdw_manager *amd_manager)
 {
-	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
 	struct sdw_bus *bus = &amd_manager->bus;
 	int ret;
 	u32 val;
@@ -1545,7 +1430,7 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		return 0;
 	}
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
-		amd_acp63_disable_sdw_interrupts(amd_manager);
+		acp_disable_sdw_interrupts(amd_manager);
 		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 		cancel_work_sync(&amd_manager->amd_sdw_work);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, true);
@@ -1554,19 +1439,19 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		amd_acp63_enable_sdw_interrupts(amd_manager);
-		amd_acp63_sdw_wake_enable(amd_manager, true);
+		acp_enable_sdw_interrupts(amd_manager);
+		acp_sdw_wake_enable(amd_manager, true);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
-		amd_acp63_disable_sdw_interrupts(amd_manager);
+		acp_disable_sdw_interrupts(amd_manager);
 		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 		cancel_work_sync(&amd_manager->amd_sdw_work);
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		ret = amd_acp63_disable_sdw_manager(amd_manager);
+		ret = acp_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
-		amd_acp63_sdw_wake_enable(amd_manager, true);
+		acp_sdw_wake_enable(amd_manager, true);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, true);
 		if (ret)
 			return ret;
@@ -1592,7 +1477,7 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 	case ACP70_PCI_REV_ID:
 	case ACP71_PCI_REV_ID:
 	case ACP72_PCI_REV_ID:
-		ret = amd_acp63_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
+		ret = acp_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
 		if (ret)
 			return ret;
 		if (amd_manager->wake_en_mask) {
@@ -1611,9 +1496,8 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused amd_resume_runtime(struct device *dev)
+static int amd_acp63_sdw_resume_runtime(struct amd_sdw_manager *amd_manager)
 {
-	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
 	struct sdw_bus *bus = &amd_manager->bus;
 	int ret;
 	u32 val;
@@ -1625,7 +1509,7 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 	}
 
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
-		ret = amd_acp63_sdw_clock_stop_exit(amd_manager);
+		ret = acp_sdw_clock_stop_exit(amd_manager);
 		if (ret)
 			return ret;
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
@@ -1666,17 +1550,17 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 			}
 		}
 		sdw_clear_slave_status(bus, SDW_UNATTACH_REQUEST_MASTER_RESET);
-		ret = amd_acp63_sdw_clk_init_ctrl(amd_manager);
+		ret = acp_sdw_clk_init_ctrl(amd_manager);
 		if (ret)
 			return ret;
-		ret = amd_acp63_init_sdw_manager(amd_manager);
+		ret = acp_init_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
-		amd_acp63_enable_sdw_interrupts(amd_manager);
-		ret = amd_acp63_enable_sdw_manager(amd_manager);
+		acp_enable_sdw_interrupts(amd_manager);
+		ret = acp_enable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
-		amd_acp63_sdw_set_frameshape(amd_manager);
+		acp_sdw_set_frameshape(amd_manager);
 	}
 	switch (amd_manager->acp_rev) {
 	case ACP63_PCI_REV_ID:
@@ -1684,7 +1568,7 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 	case ACP70_PCI_REV_ID:
 	case ACP71_PCI_REV_ID:
 	case ACP72_PCI_REV_ID:
-		ret = amd_acp63_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D0);
+		ret = acp_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D0);
 		if (ret)
 			return ret;
 		break;
@@ -1695,6 +1579,175 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 	return 0;
 }
 
+static int __maybe_unused amd_suspend(struct device *dev)
+{
+	return acp_sdw_suspend(dev);
+}
+
+static int __maybe_unused amd_suspend_runtime(struct device *dev)
+{
+	return acp_sdw_suspend_runtime(dev);
+}
+
+static int __maybe_unused amd_resume_runtime(struct device *dev)
+{
+	return acp_sdw_resume_runtime(dev);
+}
+
+static int amd_sdw_hw_init_ops(struct amd_sdw_manager *amd_manager);
+
+static int amd_sdw_manager_probe(struct platform_device *pdev)
+{
+	const struct acp_sdw_pdata *pdata = pdev->dev.platform_data;
+	struct resource *res;
+	struct device *dev = &pdev->dev;
+	struct sdw_master_prop *prop;
+	struct amd_sdw_manager *amd_manager;
+	int ret;
+
+	amd_manager = devm_kzalloc(dev, sizeof(struct amd_sdw_manager), GFP_KERNEL);
+	if (!amd_manager)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENOMEM;
+
+	amd_manager->acp_mmio = devm_ioremap(dev, res->start, resource_size(res));
+	if (!amd_manager->acp_mmio) {
+		dev_err(dev, "mmio not found\n");
+		return -ENOMEM;
+	}
+	amd_manager->ping_slave_stat = U32_MAX;
+	amd_manager->instance = pdata->instance;
+	amd_manager->mmio = amd_manager->acp_mmio +
+			    (amd_manager->instance * ACP63_SDW_MANAGER_REG_OFFSET);
+	amd_manager->acp_sdw_lock = pdata->acp_sdw_lock;
+	amd_manager->acp_rev = pdata->acp_rev;
+	amd_manager->cols_index = sdw_find_col_index(AMD_SDW_DEFAULT_COLUMNS);
+	amd_manager->rows_index = sdw_find_row_index(AMD_SDW_DEFAULT_ROWS);
+	amd_manager->dev = dev;
+	amd_manager->bus.ops = &amd_acp63_sdw_ops;
+	amd_manager->bus.port_ops = &amd_acp63_sdw_port_ops;
+	amd_manager->bus.compute_params = &amd_acp63_sdw_compute_params;
+	amd_manager->bus.clk_stop_timeout = 200;
+	amd_manager->bus.link_id = amd_manager->instance;
+	ret = amd_sdw_hw_init_ops(amd_manager);
+	if (ret) {
+		dev_err(dev, "Failed to initialize hw ops (%d)\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Due to BIOS compatibility, the two links are exposed within
+	 * the scope of a single controller. If this changes, the
+	 * controller_id will have to be updated with drv_data
+	 * information.
+	 */
+	amd_manager->bus.controller_id = 0;
+	dev_dbg(dev, "acp_rev:0x%x\n", amd_manager->acp_rev);
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+		switch (amd_manager->instance) {
+		case ACP_SDW0:
+			amd_manager->num_dout_ports = AMD_ACP63_SDW0_MAX_TX_PORTS;
+			amd_manager->num_din_ports = AMD_ACP63_SDW0_MAX_RX_PORTS;
+			break;
+		case ACP_SDW1:
+			amd_manager->num_dout_ports = AMD_ACP63_SDW1_MAX_TX_PORTS;
+			amd_manager->num_din_ports = AMD_ACP63_SDW1_MAX_RX_PORTS;
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
+		amd_manager->num_dout_ports = AMD_ACP70_SDW_MAX_TX_PORTS;
+		amd_manager->num_din_ports = AMD_ACP70_SDW_MAX_RX_PORTS;
+		break;
+	default:
+		/* unreachable: amd_sdw_hw_init_ops() rejects unknown revisions earlier in probe */
+		return -EINVAL;
+	}
+	amd_manager->max_ports = amd_manager->num_dout_ports + amd_manager->num_din_ports;
+	amd_manager->port_offset_map = devm_kcalloc(dev, amd_manager->max_ports,
+						    sizeof(int), GFP_KERNEL);
+	if (!amd_manager->port_offset_map)
+		return -ENOMEM;
+
+	prop = &amd_manager->bus.prop;
+	prop->mclk_freq = AMD_SDW_BUS_BASE_FREQ;
+
+	ret = sdw_bus_master_add(&amd_manager->bus, dev, dev->fwnode);
+	if (ret) {
+		dev_err(dev, "Failed to register SoundWire manager(%d)\n", ret);
+		return ret;
+	}
+	ret = amd_sdw_register_dais(amd_manager);
+	if (ret) {
+		dev_err(dev, "CPU DAI registration failed\n");
+		sdw_bus_master_delete(&amd_manager->bus);
+		return ret;
+	}
+	INIT_WORK(&amd_manager->amd_sdw_irq_thread, amd_sdw_irq_thread);
+	INIT_WORK(&amd_manager->amd_sdw_work, amd_sdw_update_slave_status_work);
+	dev_set_drvdata(dev, amd_manager);
+	return 0;
+}
+
+static void amd_sdw_manager_remove(struct platform_device *pdev)
+{
+	struct amd_sdw_manager *amd_manager = dev_get_drvdata(&pdev->dev);
+	int ret;
+
+	if (pm_runtime_enabled(&pdev->dev))
+		pm_runtime_disable(&pdev->dev);
+	acp_disable_sdw_interrupts(amd_manager);
+	cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
+	cancel_work_sync(&amd_manager->amd_sdw_work);
+	sdw_bus_master_delete(&amd_manager->bus);
+	ret = acp_disable_sdw_manager(amd_manager);
+	if (ret)
+		dev_err(&pdev->dev, "Failed to disable device (%pe)\n", ERR_PTR(ret));
+}
+
+static const struct amd_sdw_hw_ops amd_acp63_hw_ops = {
+	.init_sdw_manager		= amd_acp63_init_sdw_manager,
+	.enable_sdw_manager		= amd_acp63_enable_sdw_manager,
+	.disable_sdw_manager		= amd_acp63_disable_sdw_manager,
+	.enable_sdw_interrupts		= amd_acp63_enable_sdw_interrupts,
+	.disable_sdw_interrupts		= amd_acp63_disable_sdw_interrupts,
+	.set_frameshape			= amd_acp63_sdw_set_frameshape,
+	.send_cmd_get_resp		= amd_acp63_sdw_send_cmd_get_resp,
+	.wake_enable			= amd_acp63_sdw_wake_enable,
+	.host_wake_enable		= amd_acp63_sdw_host_wake_enable,
+	.set_device_state		= amd_acp63_sdw_set_device_state,
+	.read_and_process_ping_status	= amd_acp63_sdw_read_and_process_ping_status,
+	.process_wake_event		= amd_acp63_sdw_process_wake_event,
+	.clk_init_ctrl			= amd_acp63_sdw_clk_init_ctrl,
+	.clock_stop_exit		= amd_acp63_sdw_clock_stop_exit,
+	.suspend			= amd_acp63_sdw_suspend,
+	.suspend_runtime		= amd_acp63_sdw_suspend_runtime,
+	.resume_runtime			= amd_acp63_sdw_resume_runtime,
+};
+
+static int amd_sdw_hw_init_ops(struct amd_sdw_manager *amd_manager)
+{
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
+		amd_manager->hw_ops = &amd_acp63_hw_ops;
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
 static const struct dev_pm_ops amd_pm = {
 	.prepare = amd_pm_prepare,
 	SET_SYSTEM_SLEEP_PM_OPS(amd_suspend, amd_resume_runtime)
-- 
2.53.0

