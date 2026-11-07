Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794066534;
	b=Lw/HwLHKvWP3W7rHHIrtOf+vmDVmrj/zsYme/Szpkf0exY2jXz87Osx/+au7yp8K0m8l
	 gLWJx87Hxl8uXBc0p/Hhm7x6BZbUkPPN9VcuHzqL/v3kCV0hq1nCCRaRR8Osc3asvW973
	 C84Xw9PsPoLFSdwG0BQN5KRMuo/ezTHVS9BvQ6qyTE35GDfhiU7qRA0T6uD51Nik5mG+U
	 WlSEwaYDto/OoK049hXXoOcGk0kiCPdViaiwKdLRtLjnU8GRIj/YJWZ/PDR2v/dnh+tVP
	 3eMtg92F3jbOlW5JXIVslXDI8+SI5j9fjnNiN9Ph8nUVOZ0hUppqUo0YAizYl9+2DjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066534;
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
	bh=HmKBCmKk7hRUwNt1A1mdws81hJGlC1N2BVaPlnuItqU=;
	b=BFZptgL6VhYT+mPXJ8ova45gQYKsH42EEeJ8v4lBFHp7tXjaGJYIJyAMPhZZhWBTJuth
	 ue0PD2g+tjf3d/ZdewhFa1hIZCG7AyFQbD0LTuZn6hWZd0P5nPcNyd9yjyjX/ItGynw8J
	 gXJBXTWsNR1+j4L/MSYAulTL7XW2hOJ6OGKjHi2C8g5smqi5dkIj7D9d+WsSbLTGVFk5z
	 Jrt98OnIGOPpbwOe14ihYV5x0jY95zQSkN0rPCSmh7rqd8cYWRwE+x6YPOt46RrYD7YH2
	 vBry9ATG3etK15WYOY+M3zf3hpu1tjYPVdL2K+F/F+Nh/ySJl/1MWznv5wjBGai79kA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Rl4hxD3N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.50
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011050.outbound.protection.outlook.com [40.93.194.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4786D60A2631;
	Sat,  7 Nov 2026 15:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4786D60A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Rl4hxD3N
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Feqr+pwysfsux3TQSLHerww6Rmc2QNEoHiKloPECGVtEhQ0HJFN/EfyGLnn4orMfFsDwkqkMFhsTweLMTpWxis1veG1nfVqC1M4Z/u0670FWfh49uiFnXib+Z68Y1naTxX7+yqlWeT15ZBOJRDrM9oW+7Ioa+kwEIZ63YFPR1YuF8rqG/firn+KG8RgXqdQtJHmbkRec61kGCaKKvRuVZPlVIL3QXj2Tqi4mfZEQmY4/EC2iH2m8ilxy8uPVwTZI4UYU+8hm86mLx/w4myK8efArYts39Hr98YnpZMhDrW+/pBJp5VuUc6uy+yD6PXWCdlIUnI6G6f7IpucMAC1Bqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmKBCmKk7hRUwNt1A1mdws81hJGlC1N2BVaPlnuItqU=;
 b=pKDLXe0QK4g0iDcIOpYEA6iD6P++U/J4Zo9qnLT9DAv9eATSXdcXNvV/qZKN4nIxyuRgTwKPVZC5qCKVc2b5dqvsfsKUNwTHwdNx2glQELaZkd/q6B0zz5J9rcBKE/rxSNq6y1uN1WTrlI6jW2b5pmwt9khqfYZ/QWGQ8pMWPTooMWhM3ELaigffggkYenk+cZje8a3qvIne0CCbG3Gm3KbKcwTmC+HQdDR/cUzXmei9xWHiW4tVferdX62fB6zdGeiJYArKtjXZjyedQvyayi4P8UwJz5JD7rtCXqYecXpzekHtuir4ORS4dyizFAMbkUpmaKNyf9nQbEoVNnQ4lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmKBCmKk7hRUwNt1A1mdws81hJGlC1N2BVaPlnuItqU=;
 b=Rl4hxD3NVK3t9kHrk6SyyPR+M56734wySeoMgVdpfyzpbcF/bIgDyFgAknwyG5dRNMv9YLjiu8kD0iHcSQGTXspUko5A2kEFg4z91wq0X+edU+mSvzOcu+7KstOZJrx9F68wBNvMTt5obpEm7geNcIjZmWSHI8oWtd0AC9VAN9g=
Received: from BN1PR12CA0015.namprd12.prod.outlook.com (2603:10b6:408:e1::20)
 by CH8PR12MB9766.namprd12.prod.outlook.com (2603:10b6:610:2b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 15:48:49 +0000
Received: from BN6PEPF00000072.namprd03.prod.outlook.com
 (2603:10b6:408:e1:cafe::56) by BN1PR12CA0015.outlook.office365.com
 (2603:10b6:408:e1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 15:48:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN6PEPF00000072.mail.protection.outlook.com (10.167.248.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 15:48:49 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:48:47 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:48:47 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 09:48:43 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <lee@kernel.org>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v5 10/25] soundwire: amd: return response on IMM status cleanup timeout
Date: Sat, 7 Nov 2026 21:15:19 +0530
Message-ID: <20261107154659.3358223-11-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
References: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN6PEPF00000072:EE_|CH8PR12MB9766:EE_
X-MS-Office365-Filtering-Correlation-Id: a5e97306-c107-4bec-79e8-08df3ce69d94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|261026140227099003|11063799006|261022075727099003|261009223027099003|56012099006|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261028144727099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	8r8P96ybPxjI1UCMWfOaMtEfahSZAZ6zJZ31cNrYsoCC7tV4wjun3RVvHOvrl/thBuZyLr9D2WANTADWG335rtpZGSyWdd7FMlmdZ+7acNx6i9/I17AOpbmtXDqWSPv8G5rrs52xCAhDyO/Ax21pJZ4EA/Zi5f+bXS6fU6JchXGY5EK/wWJXY3h4hp8ZlnPpDBKN5z+NbHJDHFSvI29zmsC4Xq93RrprP7NNrzU5rfEoyF3AdKChgFTJ2xPnw4lHp2zxnT4NGN2adeanurpnGnnxaEqXVxgNHiWlSJKBdKyOWxkPN0DHYDkvXNx+coSxGbilDxkvtLhOMC+ov/+phnNMDLfZzc7aBP0zfNj3ZqG6YI9jplnfiW6CshAh/4k2mqTmCAAPN2NSlNt+AtpwwZBe4uRiLf5+BrIQfm3aBHcMQVv12+TQL4fifMRr9/Tv4RKO/WPZOiFSPpprbU7Y6mChHv2iMxjxXHkidEjIhZiP2Ly9nTlAV1R225hsR3LwjhH10xKz6XfIHnZA5I7mLAxJswkKzV+rlBN/+HKurLyJKsRrmyHQoMr0R351fQok5XePOZDbGWLYet7S1FCrhBgAZc6flN94Eay9ghKIZGhXiHAITaIlGYUO7wY74n93t63A7ssBdn9lBJnQ0sncbtcJcwTwDTRrC3MgXQ8f55sjfe8O2RgiPcl33x/XbwsKSDhVWajgXxg5ukNcYj1SHw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(261026140227099003)(11063799006)(261022075727099003)(261009223027099003)(56012099006)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261028144727099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	b77PUz8DSpekrE8l+p0knuM30JWrCKKPBKkqzVKTTh3A5a2sxQirpuLSzphh3QSQ6Px4DI+s6IGY/d9rD3E/RJ6SgJ39kBQ5BeZS4aKD77eQ6jBeaHoh1Mg/iQy/q7ac38KLLsmwCUgj9Ob8uDoZPFjoiqANy7FhouPliFmTvRXI1FrLJFCeAGGpNDOF1gwjM7CCEOyu1w7Cd8dODi94k6ySkgxpewnGsppy3XoR7nmDJ1Q7tn6PEY2t1ug/dfYA2JaNe/Ra0AKWyaXio3Ct64Spff0zNt1RGVugH9RIoajuVTfh8mcZIC0wFLJzWhgpTYtPkfg56+h+7Qq/1JcQtpfuE+H8rE4kRLnRGh1kcVYfNYP9rhf8snPG/x9nPWnc44GmbD873bgE11ZypOBSPBYfPKLCpI9g0/kn4eKvM0qLZBh1hfuDF1nVM0+hLQNs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 15:48:49.3361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e97306-c107-4bec-79e8-08df3ce69d94
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000072.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9766

amd_sdw_send_cmd_get_resp() reads the hardware response after
IMM_RES_VALID is set, then writes IMM_RES_VALID to acknowledge and
polls until the bit clears (status cleanup handshake).

When the cleanup poll timed out, the code returned the error without
writing *response, causing callers to report SDW_CMD_TIMEOUT and
discard a valid response - upper_resp and lower_resp had already been
read before the cleanup write.

The cleanup timeout indicates the hardware was slow to acknowledge
the clear of IMM_RES_VALID, not that the command exchange failed.
Log the anomaly at warn level, then write *response and return 0 so
callers receive the valid data. The stuck IMM_RES_VALID bit will be
cleared at the next invocation by the existing bad-state guard,
provided IMM_CMD_BUSY is not also stuck at that point.

Fixes: d8f48fbdfd9a ("soundwire: amd: Add support for AMD Manager driver")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index f2ed0490aa82..579b12946c0c 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -384,9 +384,12 @@ static int amd_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager, u32 lo
 	ret = readl_poll_timeout(amd_manager->mmio + ACP_SW_IMM_CMD_STS, sts,
 				 !(sts & AMD_SDW_IMM_RES_VALID), ACP_DELAY_US, AMD_SDW_TIMEOUT);
 	if (ret) {
-		dev_err(amd_manager->dev, "SDW%x cmd status retry failed\n",
-			amd_manager->instance);
-		return ret;
+		/* Response already latched above; timeout here is non-fatal.
+		 * The residual IMM_RES_VALID bit will be cleared by the bad-state
+		 * guard on the next invocation, provided IMM_CMD_BUSY is not also stuck.
+		 */
+		dev_warn(amd_manager->dev, "SDW%x cmd status retry failed\n",
+			 amd_manager->instance);
 	}
 	*response = ((u64)upper_resp << 32) | lower_resp;
 	return 0;
-- 
2.53.0

