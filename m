Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794068130;
	b=zejWja65rO3CqSLWRtwJVc4rHJAatcKkRSq/JObXVmTbZfhdmfhBdop1yWXvtyTi0ND+
	 3kA5giPiWEoYWR/D5up4h4CEcUnunKSDiDFF/wbAIS80DQnZYmwLKdF0l+PVBIUQwPpyp
	 7SCnkGgH1/h7bFcAs+gj83guxsWjx8UwVVI6+DUzDeK5p+G+AShd0TrvXmnW1vSKxICMo
	 Vn6cbayE8/mVmk/1VQsuxH+Gu2F6ogMj21/EESLUsswy5Y47AAhv62bwnDHzoU93cnnYs
	 4v7debjZSffTp3rW9GXkUzaoZYiyES43pp0lTw4tOGbVJrx/+eZPxlMNO8vTAplIe4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794068130;
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
	bh=LwDKikbcGEkEB6yEAdnn0GkKN4lVq8SnjR3ZRiKtX8k=;
	b=rmFjHtSIipIXP55uDcN39KRp1Tuk4VSj+l56p0ciAbXsVNCbOFb9cUU5LyfrO21jNt/t
	 4hc5mktltr50PU/nQArSDgo+OmYDMHSBS6qjbNn8LvEKomIvyJDAubp0Ld+2305bX25Ew
	 DAsoQ1YKb5lEB1iQwyuzYI/KfFrX8bUIGnkjAZRziHdi7+FhnGS/DItDFWoXGL/OmzRjA
	 3Am+eWybddwpDJ5VfbUQQ7FQuu1HusgKO1wXFQPiuaHESo0tRnp4BhFKbDni57ImLN1GE
	 0m4RxDciXoipJ47+7GZOWCbCdPG9jAjzZ6kYuWYwTqi7dYXvT3Sr8dRy75uQP1bKp4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gQAZH6Vb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.30
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010030.outbound.protection.outlook.com [40.93.198.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E24B606D3F2;
	Sat,  7 Nov 2026 16:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E24B606D3F2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gQAZH6Vb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DOD09VKvW4KfZe/+RAXAV2qkUCsG8EKUOPw3ri6IJMPGKJ0xYfpyeSp1PWIV7lizq2F6vnpEfUua8hgY75+jqsSPtPS5B8xircwNncfIZrpZpvKfuNLhbdEcrfHizSeBF/Dfa1wkle1iL2APoh+Be4DHTpZ3fVog5kDCJIqAANdkEFtg380JWJP+EdepEH0cEYMKAo72s+Ly2HaaWWkfCw4wVli8SgH9Tf+agRdb1/Z/MtUvb6PNRyiyfvMfQjS6ED8K4hw2ZhAueNhsHxtdROkDs27eXjJIjW+tv0xN3NMNagN2S4h/2CXiEzAGNAGCpXGANY2edDA8Q0RCiR18OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwDKikbcGEkEB6yEAdnn0GkKN4lVq8SnjR3ZRiKtX8k=;
 b=nINnm/2sPCd1d+tNPFApADqVmyBBLsYtzffNvdCpVTPer/c8N0J0RerPpjwH5P/Qah3XRE1j6goZVcdLuj5mdO0pZOPjDbfrRtsynWZojpzxUtWOYcBUfEDoMUj2/eqrEB1e5TthE6lYyQLFR479v+YldFCn3uegbFq3HAnH13cJMa+CYlrQaTL5gFTRZf7SE9iE6/Slpjomk2GOMZ5XfsjIGB9fN8rD0Ajs3pT6LyYJw1eOmz1ojgJ0L+wn3Uew5nTTEv61ImuV3xCe/AnlNo+xpFnETBb59OLfaBfz1nBvHZDU2+bekhFooZJRwFvGaHIlQoxz8mo1jpgnh0B3OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwDKikbcGEkEB6yEAdnn0GkKN4lVq8SnjR3ZRiKtX8k=;
 b=gQAZH6Vb+T/NC+uaoTqsXO+O912IN2FCoW83pvl3H/wE/iYtwLmsUkjKiJV2xRV1jM7l5p21hW32WCBZh+CyS9j+E23RHMWAJY+Og7IAgkFrmbODWIqBs2JRqQh2jdrihC958fOqfkwtu+W+fsqT0kNxrJPS77+xwot0tzGzWNo=
Received: from SJ0PR03CA0147.namprd03.prod.outlook.com (2603:10b6:a03:33c::32)
 by SA1PR12MB7174.namprd12.prod.outlook.com (2603:10b6:806:2b1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Sat, 7 Nov
 2026 16:15:24 +0000
Received: from MWH0EPF000C6184.namprd02.prod.outlook.com
 (2603:10b6:a03:33c:cafe::3e) by SJ0PR03CA0147.outlook.office365.com
 (2603:10b6:a03:33c::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.11 via Frontend Transport; Sat, 7
 Nov 2026 16:15:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6184.mail.protection.outlook.com (10.167.249.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 16:15:23 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 10:15:22 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 10:15:18 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v3 08/11] soundwire: amd: populate hw_ops and wire all call sites through acp_*() helpers
Date: Sat, 7 Nov 2026 21:42:25 +0530
Message-ID: <20261107161345.3411491-9-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107161345.3411491-1-Vijendar.Mukunda@amd.com>
References: <20261107161345.3411491-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6184:EE_|SA1PR12MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: e0dcd65e-ae01-4f5f-cceb-08df3cea53a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|261026121527099003|56012099006|261022075727099003|261021123027099003|261022113327099003|261009221227099003|261009223327099003|261022105027099003|261102123227099003|11063799006|261009221727099003|261009223027099003|261009220027099003|261026140227099003|261028144727099003|261021121427099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	G6t5s5H9VWUE4ZOChastGHHx1kVPme4NfZS+k4QLba+NQ87uvw3lkWQKU4m1HKke4Uba0LqJBSiRUusKQcO5zwvExJ1y+l3h6Ri1pQB4ulTq35RSJWnM3Au1uCqA700v601X9BnZ5Do91/CidMoG7SmxLKRzpHb0G5iOQPoG76ez+ByKUxxKmC10Qk8qrA4eSHOHicgpF2golRDtWaNCb+sVdWhGDq7P4kE47omUSMdWpsHIh4NsIHOPGu45hL7bXp6N1TbHC+y/pvnzXYFvECkvJ5DWN8hXnjWNKSSJORFolRJMRVvRpzzAEyTzEB9bqDS1R65eEl2VyqtJL0UE7aZdUIndfEIu99yeMkQq/EcKwRS5BkaQUycA6phZOdX/vPAgTQVDYe2Bcc9LIbTpxNZxtVw+ZdZlxIZRZ/CaLAsogQgQ7dlcjdCN52t+ul60RqOyEeHuwY8eSYk0HdRyjU9J0zWD5Y9nlMuKuNxy7uCC+0Ouizh7m+1fDS5uNuYT7VBi5DX5mn+xq1lmeXuCmLZAntTbULuifrx3xeJfyXkp/iLZzY+/EgaoNrBaR3HNII5Ce5XWZRpVEqp2FHGB0yXnwnkknbdhBBhy371ty8uWkmCmCk36O/3TsQxEML7I/4ikhG01YjfN9xIhI/JSfBzHppA2aC1+VrscQ09DqjhHUOhgH0bLA0vWT+SMEvUaJPj4lseplSpGNkR1zW/XUg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(261026121527099003)(56012099006)(261022075727099003)(261021123027099003)(261022113327099003)(261009221227099003)(261009223327099003)(261022105027099003)(261102123227099003)(11063799006)(261009221727099003)(261009223027099003)(261009220027099003)(261026140227099003)(261028144727099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Gu8sKCWAfqAbvxfMzwGey7lSmg6lQLZMIyj4HEDbvGjMNYS/8qvrw/z9DrPQ578IP6UJYQqMTjs/TqXBZcn5s1hWwm0ebSwixZWAyaV/pwGWV9jMXa4LaIXJBLonimn8gwETnvHee7hZmriwXFoQcmQ5S31oSeuh6mf47RsWHbeqItehJGIVqmsfb93/zD6N6ooAtBEEZ7LDKUJXyfM4J2oh8gfW3rCP+oycM+sqaZ77BmPl80UzBepu2bzwwTk0D9wKcj+a+sow2WhRkrjouGT1vmlqJejdyOe9xF8vkD3GDFwUKE/BjgRnux8Kihjv0B/MQ9reSainHWK8JWNFrpJ9D26dXE8hNESU/UL/wweLQ9qSe4SP9hRq9bxVyQF9NlxKf25ApNrLhrETrglCkBnwRrGkmP2wu51McymD+PAF3AI0+2YvNTWmi2uFfpv2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 16:15:23.2192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0dcd65e-ae01-4f5f-cceb-08df3cea53a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6184.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7174

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
delegate to the corresponding acp_sdw_*() helpers.

The system-suspend CLK_STOP_MODE path in amd_acp63_sdw_suspend() gains
the interrupt-gate sequence already present in the POWER_OFF_MODE paths:
interrupts are disabled and both amd_sdw_irq_thread and amd_sdw_work are
drained before the hardware sequence begins, preventing new work from
being queued during clock stop. amd_sdw_host_wake_enable_by_rev() is
now also called in the CLK_STOP_MODE path so wake signalling is disabled
before clock stop. acp_sdw_wake_enable() is called after clock stop to
match the POWER_OFF_MODE ordering.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_init.c    |   5 +-
 drivers/soundwire/amd_manager.c | 361 ++++++++++++++++++--------------
 2 files changed, 210 insertions(+), 156 deletions(-)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index 2d3b88cdd484..d8e559439cef 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -16,7 +16,8 @@
 
 #include "amd_init.h"
 
-static int amd_enable_sdw_pads(void __iomem *mmio, u32 link_mask, u32 acp_rev, struct device *dev)
+static int amd_acp63_enable_sdw_pads(void __iomem *mmio, u32 link_mask,
+				     u32 acp_rev, struct device *dev)
 {
 	u32 pad_keeper_mask, pad_pulldown_mask, pad_schmen_mask, pad_oe_mask;
 
@@ -111,7 +112,7 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 		return NULL;
 	}
 
-	ret = amd_enable_sdw_pads(res->mmio_base, res->link_mask, res->acp_rev, res->parent);
+	ret = amd_acp63_enable_sdw_pads(res->mmio_base, res->link_mask, res->acp_rev, res->parent);
 	if (ret)
 		return NULL;
 
diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 83d5f0e79cf1..820fbc6422e7 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -422,8 +422,7 @@ amd_program_scp_addr(struct amd_sdw_manager *amd_manager, struct sdw_msg *msg)
 	scp_msg.buf = &msg->addr_page1;
 	scp_msg.flags = SDW_MSG_FLAG_WRITE;
 	amd_sdw_ctl_word_prep(&lower_data, &upper_data, &scp_msg, 0);
-	if (amd_acp63_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data,
-					    &response_buf[0])) {
+	if (acp_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response_buf[0])) {
 		dev_err_ratelimited(amd_manager->dev,
 				    "SCP_addrpage command timeout for Slave %d\n", msg->dev_num);
 		return SDW_CMD_TIMEOUT;
@@ -431,8 +430,7 @@ amd_program_scp_addr(struct amd_sdw_manager *amd_manager, struct sdw_msg *msg)
 	scp_msg.addr = SDW_SCP_ADDRPAGE2;
 	scp_msg.buf = &msg->addr_page2;
 	amd_sdw_ctl_word_prep(&lower_data, &upper_data, &scp_msg, 0);
-	if (amd_acp63_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data,
-					    &response_buf[1])) {
+	if (acp_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response_buf[1])) {
 		dev_err_ratelimited(amd_manager->dev,
 				    "SCP_addrpage command timeout for Slave %d\n", msg->dev_num);
 		return SDW_CMD_TIMEOUT;
@@ -505,7 +503,7 @@ static unsigned int _amd_sdw_xfer_msg(struct amd_sdw_manager *amd_manager, struc
 	u32 upper_data = 0, lower_data = 0;
 
 	amd_sdw_ctl_word_prep(&lower_data, &upper_data, msg, cmd_offset);
-	if (amd_acp63_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response)) {
+	if (acp_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response)) {
 		dev_err_ratelimited(amd_manager->dev, "command timeout for Slave %d\n",
 				    msg->dev_num);
 		return SDW_CMD_TIMEOUT;
@@ -568,7 +566,7 @@ static void amd_acp63_sdw_read_and_process_ping_status(struct amd_sdw_manager *a
 	u64 response;
 
 	mutex_lock(&amd_manager->bus.msg_lock);
-	if (amd_acp63_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response)) {
+	if (acp_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response)) {
 		mutex_unlock(&amd_manager->bus.msg_lock);
 		dev_err_ratelimited(amd_manager->dev, "SDW%x ping status timeout\n",
 				    amd_manager->instance);
@@ -588,7 +586,7 @@ static u32 amd_acp63_sdw_read_ping_status(struct sdw_bus *bus)
 	u32 slave_stat;
 
 	lockdep_assert_held(&bus->msg_lock);
-	if (amd_acp63_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response)) {
+	if (acp_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response)) {
 		dev_err_ratelimited(amd_manager->dev, "SDW%x ping status timeout\n",
 				    amd_manager->instance);
 		return amd_manager->ping_slave_stat == U32_MAX ? 0 : amd_manager->ping_slave_stat;
@@ -1091,7 +1089,7 @@ static void amd_acp63_sdw_update_slave_status_work(struct amd_sdw_manager *amd_m
 			       ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7);
 			writel(AMD_SDW_IRQ_MASK_8TO11, amd_manager->mmio +
 			       ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
-			amd_acp63_sdw_read_and_process_ping_status(amd_manager);
+			acp_sdw_read_and_process_ping_status(amd_manager);
 			goto update_status;
 		} else {
 			dev_err_ratelimited(amd_manager->dev,
@@ -1164,12 +1162,12 @@ static void amd_acp63_sdw_irq_thread(struct amd_sdw_manager *amd_manager)
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
@@ -1205,17 +1203,17 @@ int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
 
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
@@ -1226,117 +1224,6 @@ int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
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
@@ -1467,7 +1354,7 @@ static int __maybe_unused amd_sdw_host_wake_enable_by_rev(struct amd_sdw_manager
 	case ACP70_PCI_REV_ID:
 	case ACP71_PCI_REV_ID:
 	case ACP72_PCI_REV_ID:
-		return amd_acp63_sdw_host_wake_enable(amd_manager, enable);
+		return acp_sdw_host_wake_enable(amd_manager, enable);
 	default:
 		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
 		return -EINVAL;
@@ -1475,9 +1362,8 @@ static int __maybe_unused amd_sdw_host_wake_enable_by_rev(struct amd_sdw_manager
 	return 0;
 }
 
-static int __maybe_unused amd_suspend(struct device *dev)
+static int amd_acp63_sdw_suspend(struct amd_sdw_manager *amd_manager)
 {
-	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
 	struct sdw_bus *bus = &amd_manager->bus;
 	int ret;
 
@@ -1488,7 +1374,7 @@ static int __maybe_unused amd_suspend(struct device *dev)
 	}
 
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
-		amd_acp63_disable_sdw_interrupts(amd_manager);
+		acp_disable_sdw_interrupts(amd_manager);
 		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 		cancel_work_sync(&amd_manager->amd_sdw_work);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
@@ -1497,13 +1383,13 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		amd_acp63_enable_sdw_interrupts(amd_manager);
-		amd_acp63_sdw_wake_enable(amd_manager, false);
+		acp_enable_sdw_interrupts(amd_manager);
+		acp_sdw_wake_enable(amd_manager, false);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
-		amd_acp63_disable_sdw_interrupts(amd_manager);
+		acp_disable_sdw_interrupts(amd_manager);
 		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 		cancel_work_sync(&amd_manager->amd_sdw_work);
-		amd_acp63_sdw_wake_enable(amd_manager, false);
+		acp_sdw_wake_enable(amd_manager, false);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
 		if (ret)
 			return ret;
@@ -1514,7 +1400,7 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		ret = amd_acp63_disable_sdw_manager(amd_manager);
+		ret = acp_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
 		/* System suspend: tear down all pads */
@@ -1529,7 +1415,7 @@ static int __maybe_unused amd_suspend(struct device *dev)
 	case ACP70_PCI_REV_ID:
 	case ACP71_PCI_REV_ID:
 	case ACP72_PCI_REV_ID:
-		ret = amd_acp63_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
+		ret = acp_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
 		if (ret)
 			return ret;
 		break;
@@ -1540,9 +1426,8 @@ static int __maybe_unused amd_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused amd_suspend_runtime(struct device *dev)
+static int amd_acp63_sdw_suspend_runtime(struct amd_sdw_manager *amd_manager)
 {
-	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
 	struct sdw_bus *bus = &amd_manager->bus;
 	int ret;
 	u32 val;
@@ -1553,7 +1438,7 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		return 0;
 	}
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
-		amd_acp63_disable_sdw_interrupts(amd_manager);
+		acp_disable_sdw_interrupts(amd_manager);
 		cancel_work_sync(&amd_manager->amd_sdw_irq_thread);
 		cancel_work_sync(&amd_manager->amd_sdw_work);
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, true);
@@ -1562,19 +1447,19 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
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
@@ -1599,7 +1484,7 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 	case ACP70_PCI_REV_ID:
 	case ACP71_PCI_REV_ID:
 	case ACP72_PCI_REV_ID:
-		ret = amd_acp63_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
+		ret = acp_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
 		if (ret)
 			return ret;
 		if (amd_manager->wake_en_mask) {
@@ -1618,9 +1503,8 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused amd_resume_runtime(struct device *dev)
+static int amd_acp63_sdw_resume_runtime(struct amd_sdw_manager *amd_manager)
 {
-	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
 	struct sdw_bus *bus = &amd_manager->bus;
 	int ret;
 	u32 val;
@@ -1632,7 +1516,7 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 	}
 
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
-		ret = amd_acp63_sdw_clock_stop_exit(amd_manager);
+		ret = acp_sdw_clock_stop_exit(amd_manager);
 		if (ret)
 			return ret;
 		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
@@ -1673,17 +1557,17 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
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
@@ -1691,7 +1575,7 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 	case ACP70_PCI_REV_ID:
 	case ACP71_PCI_REV_ID:
 	case ACP72_PCI_REV_ID:
-		ret = amd_acp63_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D0);
+		ret = acp_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D0);
 		if (ret)
 			return ret;
 		break;
@@ -1702,6 +1586,175 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
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

