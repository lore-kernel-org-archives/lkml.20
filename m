Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792989976;
	b=WrrGsYgRrJXAE3dY9MymO+F1XtmHTin7w/qd5evCj+kYEQxXdyMPsPMS+ScfJxSXJ6Lj
	 PwtzPnoOh7DuSQMf0HXjEFztq5rXv5sJ/ZWBhBesxAiCQh0ORSLU6iyuVQtUoJXTknhjb
	 tGK8u7HTj37BMwhjdMeCYBFIJYLLAE9CaAzxFcZ7Eg9NPO6M430jDpxoGEcgMwwlgu4Yu
	 n+SG2V1oQFblXNNM9UvJro6OLPkQ+uRcaP7NWq54Hluv9nawRwWGDYK3MqTepOEv4FfR4
	 ZGH6GIOJlG7+0Q9Dfi8bsyebTC1c/RSwD/iuWXn0Nq+2vq2qW+NLM8um+82Y1lnyPhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989976;
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
	bh=Ggxzu8Kd1bd8Yx2gE4fbc9xPMxpjYWVWy9gcsuFTRXU=;
	b=hJNWqpThVKnt/XEvKJVLIDg9Ya/FnZaq6RfCSe7sv95o/9GIUYbK5x3xjb22WUHdsNKW
	 KKIwCbNQ6WJ6l0uZgJX2+hDR0FeYKDJpa6AsdQrrlM0KyO1cDcShbZ+GFbdOG7zNFNk1b
	 FSI+X/B8ditxqCjlQaSHuTBve1OvM633y0/HKF+kQIF5+qEpV01k4gNwGD1yruVQRXLX/
	 ExyxDI5P8M6OkAZ0UR0kKKtY4TNWnJ1gQQSdxgLK3cGNTG9ZuTf9XJPATJPP54jwBLMZM
	 dSfTRr0fi9JNq5RdyGs2EMCkYnDvmhHB94c02lAxOE/Rk4Lqi/wkYbe+OmJd7PnwFcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Fzq54ofc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.61
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012061.outbound.protection.outlook.com [52.101.48.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9A5606A325;
	Mon, 26 Oct 2026 04:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D9A5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Fzq54ofc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUdJDN5/Q3jLFPUONh3FnLAQ/C/qoKc2BRrBfbdmdvli/FIObcVs71K5ObzGbWzzzyw1IjyemkX6lXpgFdD9MbONcA/xLIjMKOgsSFbvbvZSzXLFBpxJgtZKBJ+K7ytRECgecZA1aiszU9aq23Ne2WLxJ3ZA4ljlcuRfPY8to+uIve3CI6AtguWemXbckMbl/QgWJ7fQHZ7l5EQ65NJULF+nu4WmRK5Rg//Hut3fyraAZ+ZW9L3uSV1oTwU2Lj5t6gcWNyyvrz0MDbOQgTJwq/ckYc3p6BWhbEpYYKiLrBV6rCcQyRJDbubEaL6lQJpwxRbRSC4mzZLQJJRrs2FHPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ggxzu8Kd1bd8Yx2gE4fbc9xPMxpjYWVWy9gcsuFTRXU=;
 b=QLbUQWcB+sWAzZbDr3Dihb6nop6sFrDdO9sFOleJnffdXgDIWkUIzLbF0TwEDLAsyrNxcVeWcd+7q1Y+3kTe2bR01FixmXo9g8/L9OyHWQ2bf3mRF6qQJY8OXhtjTZaZ1BpaC9em1lszDqxtBaBSdCuNPhEtvfgikFxSNR5miH/pa+4VmmIkix3pLqdT3nJ2js8xN5lvXfe0afyMWH0sLlIQwtAAf2FHygfHmSfhQPjQ1oxqHIQuiUVqAAMBlqmqdqk2h4s8e3xgwEtcIWIJOS18ZeH9Pv/NGeXPzrzJj68AfyU7Hx0k4xlD14zqxWXmZ7g46D+Atqm7bNvYeWg/Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ggxzu8Kd1bd8Yx2gE4fbc9xPMxpjYWVWy9gcsuFTRXU=;
 b=Fzq54ofc+fRIfMi4D1ZqyQmXN25qmwoKuEpqbOp/BViUibcO3c4K+PRs3/yKyv0L2InK26r+YYqZOMOIuAE/puM+ckOYJdSMY2Hyan4oAi7Li/dEsM05RVhGirpuny9eyVepCoxSFL7wCFu70RV+rlhAAZiRNxZgBAwld2OvgOM=
Received: from BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::10)
 by PH7PR12MB7020.namprd12.prod.outlook.com (2603:10b6:510:1ba::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 04:46:11 +0000
Received: from MWH0EPF000C6190.namprd02.prod.outlook.com
 (2603:10b6:a03:59d:cafe::4d) by BY1P220CA0003.outlook.office365.com
 (2603:10b6:a03:59d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Mon,
 26 Oct 2026 04:46:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6190.mail.protection.outlook.com (10.167.249.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Mon, 26 Oct 2026 04:46:11 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:46:10 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 25 Oct
 2026 23:46:09 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sun, 25 Oct 2026 23:46:06 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 01/13] soundwire: amd: fix SDW command timeout return value handling
Date: Mon, 26 Oct 2026 10:13:32 +0530
Message-ID: <20261026044507.2310694-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026044507.2310694-1-Vijendar.Mukunda@amd.com>
References: <20261026044507.2310694-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6190:EE_|PH7PR12MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: e50a5f7a-24f1-4534-37df-08df331c0ee9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|23010399003|11063799006|56012099006|261009223027099003|261022105027099003|261021130227099003|261022113327099003|261022075727099003|261021135927099003|261022115727099003|261021133027099003|261021123027099003|261021121427099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uY8i0LbuKt2F6DqurDgFf/+ic/DO2B1vZ3ofz3eLSJu/+qgxAz1XMHW2sPvGjOpxWcIGY3H62IMDakLUJty3WmomNZEHI3TLrcD2vPBodEnDnzXrq/JTkDtXBpgA7gj6Gjueu+UswsDGPGBtIWELvVodNaDAMLT16UEy4kwIkVhNv8BODMfW2L/JZZEOmioBXRmngZFfo/gVhUUvm8Z0scCl1gaAetJaWtvhb+Bdgvx031wU+OBLMHIgm6svdfo9upQHTSOLgI2/elMTSXbDPdwKqcgW4inJaC5i82rqExSAb5zd8WsWCIfKdnzNai5EU8mb/D3hj66erHbZ5hBBs8/JLJ799wJ7UVx8/AZxxcnqHUA8IaL112Mj2ZXHVoTLnscW7ViWQBWh4c61Zu+S5xQgj8S1Vn5X2dL1HlFTRUd6y6EPGd/7K34x4kz0ebL3llUANj4j/L2e167U831ql/o2/SwHROfuWlS1PAT03mj/0DhvG5zpnqQDIIAelag/Um3PoE6I3d8LxgtBFsfO1fXUEE9PYQcoCmDWUjTORAj17J8uewBinc4KerzFnB8aededsp+sgF6mWNAdiPI/TsZacpuCn0BgOHm9LxPi3Y1A1y+6i8UpEd1eau9+TIxg4FiQPOAk9AygvRkU6XydYO2zSuaPIAtozN5vpgeNtFAdnQd1+GYkggpMe9KW29YgXogWakTDk28LOXXEKdoi+A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(261021130227099003)(261022113327099003)(261022075727099003)(261021135927099003)(261022115727099003)(261021133027099003)(261021123027099003)(261021121427099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qSbSkEo1uf002gLiyldGGl09tunhkljIJIYJFOW26gqO/232LXhxjeaILhQlGjpAdocUNW0+Hg8gT/w3xqbt5nner8ChC+E6/toK9S/S0KAbK3MGLsqF6tugwlMJ74aT+9o54wQIpzqEbREkfQgzNwj5NfkvCSgc29iFNxVvzaCHzztMb6Wv0DQRevHzcOX73q1pokX8J/ZpK9mciS8n+45VIqadaSTw5Cu11c4a5/vdQprYK7g415t4R3Rmbh1P7UBear7StAFUDhP0s7n/Rj66u9QROP/iyg5zoqCGuGoIkZtUzq6ubQTOweWjWm41QlWI/UMs6fc9HP5LgD9wR0idEHIbDr4YAh+8CahNl56B0O4WMGyx/M06o3R+/PYnSWZq5+GJS7ofebcaOlsnasK9gRfiSGBHHGSfPWKW0o6o4fDspPVgKarB8y3ms6J7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 04:46:11.0816
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e50a5f7a-24f1-4534-37df-08df331c0ee9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6190.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7020

amd_sdw_send_cmd_get_resp() returned u64 but was returning -ETIMEDOUT
(a negative int) on readl_poll_timeout() failures, which silently
widens to a large u64 value.

Change the return type to int and pass the raw u64 response through an
out-parameter. Timeout is detected directly from readl_poll_timeout()
return value.

Update all callers: amd_program_scp_addr(), _amd_sdw_xfer_msg(),
amd_sdw_read_and_process_ping_status(), and amd_sdw_read_ping_status()
to check the return value and handle timeout explicitly.

Fixes: d8f48fbdfd9a ("soundwire: amd: Add support for AMD Manager driver")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 54 +++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 22 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index a3316efdf8ac..307cbfdb9442 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -250,10 +250,9 @@ static void amd_sdw_ctl_word_prep(u32 *lower_word, u32 *upper_word, struct sdw_m
 	*lower_word = lower_data;
 }
 
-static u64 amd_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager, u32 lower_data,
-				     u32 upper_data)
+static int amd_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager, u32 lower_data,
+				     u32 upper_data, u64 *response)
 {
-	u64 resp;
 	u32 lower_resp, upper_resp;
 	u32 sts;
 	int ret;
@@ -291,9 +290,8 @@ static u64 amd_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager, u32 lo
 			amd_manager->instance);
 		return ret;
 	}
-	resp = upper_resp;
-	resp = (resp << 32) | lower_resp;
-	return resp;
+	*response = ((u64)upper_resp << 32) | lower_resp;
+	return 0;
 }
 
 static enum sdw_command_response
@@ -309,19 +307,22 @@ amd_program_scp_addr(struct amd_sdw_manager *amd_manager, struct sdw_msg *msg)
 	scp_msg.buf = &msg->addr_page1;
 	scp_msg.flags = SDW_MSG_FLAG_WRITE;
 	amd_sdw_ctl_word_prep(&lower_data, &upper_data, &scp_msg, 0);
-	response_buf[0] = amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data);
+	if (amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response_buf[0])) {
+		dev_err_ratelimited(amd_manager->dev,
+				    "SCP_addrpage command timeout for Slave %d\n", msg->dev_num);
+		return SDW_CMD_TIMEOUT;
+	}
 	scp_msg.addr = SDW_SCP_ADDRPAGE2;
 	scp_msg.buf = &msg->addr_page2;
 	amd_sdw_ctl_word_prep(&lower_data, &upper_data, &scp_msg, 0);
-	response_buf[1] = amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data);
+	if (amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response_buf[1])) {
+		dev_err_ratelimited(amd_manager->dev,
+				    "SCP_addrpage command timeout for Slave %d\n", msg->dev_num);
+		return SDW_CMD_TIMEOUT;
+	}
 
 	for (index = 0; index < 2; index++) {
-		if (response_buf[index] == -ETIMEDOUT) {
-			dev_err_ratelimited(amd_manager->dev,
-					    "SCP_addrpage command timeout for Slave %d\n",
-					    msg->dev_num);
-			return SDW_CMD_TIMEOUT;
-		} else if (!(response_buf[index] & AMD_SDW_MCP_RESP_ACK)) {
+		if (!(response_buf[index] & AMD_SDW_MCP_RESP_ACK)) {
 			if (response_buf[index] & AMD_SDW_MCP_RESP_NACK) {
 				dev_err_ratelimited(amd_manager->dev,
 						    "SCP_addrpage NACKed for Slave %d\n",
@@ -366,11 +367,7 @@ static enum sdw_command_response amd_sdw_fill_msg_resp(struct amd_sdw_manager *a
 		if (msg->flags == SDW_MSG_FLAG_READ)
 			msg->buf[offset] = FIELD_GET(AMD_SDW_MCP_RESP_RDATA, response);
 	} else {
-		if (response == -ETIMEDOUT) {
-			dev_err_ratelimited(amd_manager->dev, "command timeout for Slave %d\n",
-					    msg->dev_num);
-			return SDW_CMD_TIMEOUT;
-		} else if (response & AMD_SDW_MCP_RESP_NACK) {
+		if (response & AMD_SDW_MCP_RESP_NACK) {
 			dev_err_ratelimited(amd_manager->dev,
 					    "command response NACK received for Slave %d\n",
 					    msg->dev_num);
@@ -390,7 +387,11 @@ static unsigned int _amd_sdw_xfer_msg(struct amd_sdw_manager *amd_manager, struc
 	u32 upper_data = 0, lower_data = 0;
 
 	amd_sdw_ctl_word_prep(&lower_data, &upper_data, msg, cmd_offset);
-	response = amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data);
+	if (amd_sdw_send_cmd_get_resp(amd_manager, lower_data, upper_data, &response)) {
+		dev_err_ratelimited(amd_manager->dev, "command timeout for Slave %d\n",
+				    msg->dev_num);
+		return SDW_CMD_TIMEOUT;
+	}
 	return amd_sdw_fill_msg_resp(amd_manager, msg, response, cmd_offset);
 }
 
@@ -446,7 +447,12 @@ static void amd_sdw_read_and_process_ping_status(struct amd_sdw_manager *amd_man
 	u64 response;
 
 	mutex_lock(&amd_manager->bus.msg_lock);
-	response = amd_sdw_send_cmd_get_resp(amd_manager, 0, 0);
+	if (amd_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response)) {
+		mutex_unlock(&amd_manager->bus.msg_lock);
+		dev_err_ratelimited(amd_manager->dev, "SDW%x ping status timeout\n",
+				    amd_manager->instance);
+		return;
+	}
 	mutex_unlock(&amd_manager->bus.msg_lock);
 	amd_sdw_process_ping_status(response, amd_manager);
 }
@@ -457,7 +463,11 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
 	u64 response;
 	u32 slave_stat;
 
-	response = amd_sdw_send_cmd_get_resp(amd_manager, 0, 0);
+	if (amd_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response)) {
+		dev_err_ratelimited(amd_manager->dev, "SDW%x ping status timeout\n",
+				    amd_manager->instance);
+		return 0;
+	}
 	/* slave status from ping response */
 	slave_stat = FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response);
 	slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
-- 
2.53.0

