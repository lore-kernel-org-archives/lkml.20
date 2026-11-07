Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794089441;
	b=P7899nVUdkERYn5NfcN1PSmDvp87DfJOrBoQfVIud5PiaDHbYLLZEIsrVaq8uFSTkxes
	 WcQIG9IAVBgn03aRPNYL/xKCUiHsuHXJPrBinmpxyVYhnEhWuYPrEi0/okAfarMlQwe/u
	 u4DMXjL2LEqltXWKtRT/uFgG79MzX6uHTmoWYFxfIFkNYRTykN+IezDBL5lh9sqe23osQ
	 I+4RH63hP4qjD7muPstSGhzwMXHQRl3og/wTuiYTz5EoUU/yA9NNwlrG2tgzmPvS3v7mH
	 A+wqphu4CYDqnhDzczKknFHfhjD8+JNJm6UqxMl7xUcpcPpU2wH2qwA/QVRuAKzSiUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794089441;
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
	bh=jtEu+4ecD/GswfYkbc8RChzQkPJsXVFb8us1qZGIp/0=;
	b=WuXeGwHKlk8EJKCO+xGCi8q72r8CZj6EnOkuXofB419drcDm25W7gHTaZp7dJCC4riwF
	 MwUurR0U50PZpp99Lr8Ctbd+ysW/+9Ut0cybWrTZSdyucMN6A+ME1v/6IwFGhFaPomkjD
	 aRqDZArrbFhB4UNo7HxWxMh5YIXBQgx7Xe03CUGTDs8Rnwm0Miq/Jaz1KvLQUEQ14Kera
	 ssVp4SB0AH6yt+lkZUk/HrPjIfCd9NhqIogjOxahVG8xl3/cGa0Vleb79OLsDnGqan8TJ
	 LpHUMX8SVR7d6XF32RAx+/N4QKr9DrFwjWUeO/dMy6SVHWaG4GIhHNW6vBWn78KcUZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=U8ilZPPf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.43
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012043.outbound.protection.outlook.com [52.101.43.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA596606A333;
	Sat,  7 Nov 2026 22:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA596606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=U8ilZPPf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5gje0G2vG6WacQit8RmB2O4rNS9lbiRCgb5Om86VuHNgOkwJkh0e295n9yJS4TKlwlGA28xnKwEm1HojRoMHS4ndqMQs83JG1QD5X8mb0tKAN7LACxUsyv3oSLaT3V+iYDgbK6NiM4I6N84QHbn7pHzt2PhvPQPFQyLss+iS/cWWq1G03UYXCjHZLEIqjMxByWgo+S0tLZmgUqJa+9IPOq29huVjPVgR12tCgyobBW3XcFype7mT2H27Abi+Y7eEnRzaewhFykmK57jPOTP5fvg/U3XE/i7bd9GG+RyVenebfu4Nj9Yf3pSymQX43SyOWdaDNiqICdrDJkZJGJ88Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtEu+4ecD/GswfYkbc8RChzQkPJsXVFb8us1qZGIp/0=;
 b=AoVrzuddC4B991nPSLpBj1mRptY8NwM8yzKriKOCHk9fSbEHGnZX6fV6aIofZ2qWK+CfaabB6vpwOsNI84+yWuoPziYBrvvchtq1fI6vPAnR585g3+J2MQ60hv9DF0UyC2WLAjnlaZ0kJJDcTwDtNaYVutPzAQ6JWRl33dWzPmZmjGReHuo6DUl9sVz3VL/hQTO9HRz3hXfjHmYQcgHg7kBYnahPl8mAOz98wv22OgM0W3hlAAJYBMyfFA/1rc0a1hw2sJwEKFu455ARr/+yPRDDrh6Hln8YhpTMoVqxH416ijfcRHVF7LCOTM4GPRI8jVcbeFMhadcmL4yPp2SH3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtEu+4ecD/GswfYkbc8RChzQkPJsXVFb8us1qZGIp/0=;
 b=U8ilZPPfRjbIJF93ohpxQQuNGbR4XO/4V//77RT59Jr4MRTfcHXSXVZrskuCZaG6jmRlO6eG5AptO2mvDCL3Ht844SXv4kXBCUO1i8klUF543Jy5Fi3Zr+gtw3AakogkotKkiY3ZUljdPAYJkKZq/N1xLMWyCSOSYXvfdZhHDmA=
Received: from BN9PR03CA0099.namprd03.prod.outlook.com (2603:10b6:408:fd::14)
 by SA3PR12MB078285.namprd12.prod.outlook.com (2603:10b6:806:58d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 22:10:37 +0000
Received: from BN3PEPF00022BCC.namprd03.prod.outlook.com
 (2603:10b6:408:fd:cafe::50) by BN9PR03CA0099.outlook.office365.com
 (2603:10b6:408:fd::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 22:10:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BCC.mail.protection.outlook.com (10.167.248.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 22:10:37 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 16:10:36 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 16:10:32 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>, <Poojitha.N@amd.com>,
	<sravisar@amd.com>, <Richard.Gong@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 03/11] soundwire: amd: extend ctl_word_prep to set SSP_TAG for ACP7B/7E/7F
Date: Sun, 8 Nov 2026 03:37:58 +0530
Message-ID: <20261107220913.4058072-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107220913.4058072-1-Vijendar.Mukunda@amd.com>
References: <20261107220913.4058072-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCC:EE_|SA3PR12MB078285:EE_
X-MS-Office365-Filtering-Correlation-Id: fae64eda-7b4f-44f7-1887-08df3d1bf3cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|11063799006|56012099006|261021130227099003|261021123027099003|261021135927099003|261021121427099003|261021133027099003|261022113327099003|261022105027099003|261022115727099003|261022075727099003|261009223027099003|261026121527099003|261026130827099003|261028144727099003|261026135527099003|261026140227099003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tP/PQmAkv9IIUGN7qs68qfJht7pIsb47XzOqg+c5KR0Xl+QcymimuotMhhPZw3OoknILu75pHDNmrkOMClVo4l88R/jVjYstkcl3LMqNKuwGUiy/oEEVbrGnnhtcQ4NXwtoILsMNRPcfg0d8BeSln4UsDvRZifH0axsq9e+cLogy4OQzrFk4UoCrZCSviZXRI+IjD8+6yA5NPPYjmvpx7+MiacUoLzvbJ3139UfmaSFJOIro3Q6BVu5q/8/3DmtnDqN9+GEkv0MDj7M+oCrxjJnwfUbkO27x1ZwY7T4ZTud83N6yChWQU57yOpsvULrgJ5glxV3Fy6du2/jG4VzYNBF3YtG5MWah1u3ZccrI7jP85PpjLFxEiLJiEAniQggouT5FtywQzyrdH3lY3sP+GnTWiWC9FU5lqfQNZIpjC3Ea66uVkuu2AP8Dty9XVRp3Vkg95WFihZEN3L7S3atvkcTrp7qJdVNNVpumcbVBttbYdiF7S+HiGNCMJKbMJHaDnrbIDJxZujxjxMy2IRVDrk8oqLTcJWmEYLmPytNhVUJ49NTNKWHDi2IaXdo+kvkqDjTSHD1K8SJJoh3bLxHnESJakCQRcfb/k9Gg1pVQh+6bT7IozlY2OOB/mwuul0DIfNydXKoBnSUz1OU1nkKluW/6O3EnGn82BICSigOd3SxTdZBK9qfTbA4e3FKIiZSvdcaT2gWHdF2GgQkqN2TNRQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(11063799006)(56012099006)(261021130227099003)(261021123027099003)(261021135927099003)(261021121427099003)(261021133027099003)(261022113327099003)(261022105027099003)(261022115727099003)(261022075727099003)(261009223027099003)(261026121527099003)(261026130827099003)(261028144727099003)(261026135527099003)(261026140227099003)(261102123227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	K79AfP95Q6g/vfrYv2/D+SwRGQVd+zr5QSqsxRagqr0NpEYkTIx38WONwnVWNKKgKEXFrtwZG46x/WCjj28LcZmzhwptSSHEtEH0UJtsruDtgwRY5TKjs2cP7FFsZ7gu5fFjJ+701QFR1RJGosGKuECD+72VVYyiXcvceuKcvhmxBRBGKSqK5BpZhzU1Xi17HVCcajlDQ+VnloCG8ODJ6YvzBgs/mH4YyrzMqkeH+jig+4lfpdymeFlhkV7dJDGFF9cXKlPIUX8KLQWYFihseUpdSW5lnPV+l8RI/VgM7QNNsopNL5fU3c+1kygSJh4nwwoK5deuUNZZ+qKS/h3Vf1GxIk+bHKSrmzuyIU2X5tMWUdKTg1BCQAHX1grcymVXY7SwlKuqNcLR9OMxq3v+O508umdkLAqAKsHsZdOnG4GxnrP3zQxOt5kVddOn0AgT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 22:10:37.3087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fae64eda-7b4f-44f7-1887-08df3d1bf3cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BCC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB078285

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
index 6f75b6395e91..0234ffec71f9 100644
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

