Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794066547;
	b=wmK1UfJNFp8IPfUXlQQY6Jjgi/15SCv5/eAmc+X78SCeZOtb+QvG0z9a9ZUxZUa6ts8Q
	 W/BPDooHzxwC+7L5FUaq6v73cgwmd5sDQrdiHztv8UKnGO1ZZkimA1WfYvOfDK67mEJGQ
	 hxEonxBocS4MwbBDGIBZIS+n4CNgdATiS0tuaSkewsOQjQYT5BHHMH5t6EGjat62ktDrM
	 otAEjqd7C9M4BsNAQsMbtMhx/coKkd2ra5PSsFudfHw0qxgFEhEd3bZEMu7DYcw7Er2Ft
	 SUhZdUfnN9P0bD14e3IDw2ZqxSSqHJA5HXzU1AoOh6h4O57pVTXIfWp9xvYdmuBo24g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066547;
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
	bh=3FW3cMmn9klCDxUqIf+iJDy69yjWsRe+P6dpRY/AtXY=;
	b=q2o6/3owp4fKqIf2J3YnIuOrXxMClW/3TF2VR+0IxIJlHrQmWFZD3yoD7D64MJqX8NQX
	 matD5sNv6pFfcm7Ru5XsPP4dqHDDr6x3fJp+Lvd5V4qF/tKQnFjvYJIYoAV5nPuH0O0sI
	 0l3x+5EZZWQEhV1fLGOOIWZ4oi4RrWsreXPJr8BjN1+WZYWzGpWaosXnlY25FaxnbXhOE
	 C8x0kIeW6Vh509pUafsuC2/tg/ZmFCcZu0Q7jMNHiDwakxFbO1MRn2NXaLH8DZ3HRxBwc
	 Q+hQPuw8/bDJjAnNDNFZF3y45Mn+2HE2JiTcU8tURBplNPdIDVaTmJGToQM3utIFEqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Wiyy9zt5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.66
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012066.outbound.protection.outlook.com [52.101.53.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694BA606EEA1;
	Sat,  7 Nov 2026 15:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 694BA606EEA1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Wiyy9zt5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sa+lb4PU1tfadWW7Abm1NmNc8wBjotLOOU35tYHEFtrze3omP6YP8XJ2GgBBIXYqn2Cd47XneNsDrskO7vuQjh0TSNGaEGTSAj9Dv0S7n2v5fIKX4PT8f7TgRNA8KYjtcw7ybiNoPl/ZUXeLBPCZqDw9Nk/Ga425LW5zqmgbOJqxGIH9g9q65/Z04XHjE0D7no97wYXs8Miv8z6o7uHRt0UPsjq6kuJpjaXOEZKAM/tvtTUZp93D2K5GuYSPUlqEKGGi/sLEFlqCFjA76PQukHjTlTW251uuZXn0N6zVryzxIJCdoSruKtWMljtNcwqBQs5CoNAsn3t5/N7N9fg58A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FW3cMmn9klCDxUqIf+iJDy69yjWsRe+P6dpRY/AtXY=;
 b=m/iIbBgZnydfC7TG4b1IrCKJ7mnyzo7lSQOsQLqc4ZfaXXG0/53rAJrq/mhyJPMPhjJxFNwf3knGTba74HYLCU5K98RzmBH9Bh+QurSfrY/usNJ7nsYzMhMX/bT6n4yWwMCKimXS6TxCzD59wKUQjJornoy6fM4rHHjPul2F9xeL0yZvbiwqpAThW6F9MZm3LwYEMFAf0uJqubAU4bFV/XLBmmwIkRC86WNOZF5uzF+RWy4xazZTceTPwAlAUQxKAApm4fXIU8jbaVI5IeuWtOky8FEPpynMkRqaEsmudyTlhuLmrLPbALnopIWOuq83IZvxCgp5qJ3qyOoYNhZQjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FW3cMmn9klCDxUqIf+iJDy69yjWsRe+P6dpRY/AtXY=;
 b=Wiyy9zt5VFhUAQBnbz6kz0V9l4NF5EzzDtRmpbaDXOjQJPWlmwaIsSs7QgDqI4JoLLuArSGTv0fE9w7UXkyqw7CI5yMJAJojrH+lAofHv3E4oxZ2fbnDZJTeYRienp+M/Jnmv12Kuc0vBY+na4PqR6ytjdPAJdkdwhMMXX/0ezc=
Received: from PH7P220CA0125.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::18)
 by PH8PR12MB6699.namprd12.prod.outlook.com (2603:10b6:510:1ce::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 15:49:01 +0000
Received: from BY1PEPF00026964.namprd05.prod.outlook.com
 (2603:10b6:510:327:cafe::60) by PH7P220CA0125.outlook.office365.com
 (2603:10b6:510:327::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 15:49:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026964.mail.protection.outlook.com (10.167.244.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 15:49:01 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:49:00 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 09:48:56 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <lee@kernel.org>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v5 13/25] soundwire: amd: assert msg_lock is held in amd_sdw_read_ping_status()
Date: Sat, 7 Nov 2026 21:15:22 +0530
Message-ID: <20261107154659.3358223-14-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF00026964:EE_|PH8PR12MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: 2afe5650-cb6d-46e1-27d5-08df3ce6a4b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|22082099003|10067099003|18002099003|56012099006|11063799006|261026121527099003|261102123227099003|261022075727099003|261022113327099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	/90ICxU3d0EabZ0CFUcvVSIPWbf2OaYH8+BrlcgZKhEMt9R4+6k9QId1/fkqHeqdqidcdQwlfId2+8h7szOsPdR7IB7wzVqC6ywgnPgI17pPCEtUTsFADZnrXq5GbyLpeH6IhQEbXawpy9dU9QatJvjEfnRaKM91M6wsEPPx+mb14b/EVzbnjrxtHAUcu7gMT4hfSMUrwZJAAT5inAIVaEjw7mZmN2Xrpgij+sRYykf/hiec/fBP99Uy/BMH2EIPIIhTcSkKZFyPU/XFi6cIfiEQGvhC1qtIUo654oqfiJgW+PhenQZpU/6YoLNkFbbwEtVfhvbT4bU2J8YnJZSOiXwY0Q7/jvqaHpAiD/NAqqlPOmtKpSWE1J7mXuYbYwZMqZXOqTJOg7PMiLMNfwK9CnoWS77CVodnVTkOqNl2+1ZcExbDHfmBaavnL/vgh294mWIozzGoEZ7UFpEXDEY0dYVN7KKdIVKG5h2k5qZA6V58srwBvVmLMtxOd0f84il0PcIu9HRcUk+NVR+jypQOGnClqlGyPJPiqAQBrdondgNwaYcJntF7slRXsSpc2EHT6OLwXFaaCOG4b6SJ3oqdmPz486zuVTgImD6rl4wh1mfa/gYYH1OAsXC/NDDa/Vle85YunHIN0YyupXs3UohAc3D2ZE0VurCrUJHXGHezxurgqdhtVynJt0U2CFZccSrjSru3M9Kk3O4zSkC5IgruMg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(22082099003)(10067099003)(18002099003)(56012099006)(11063799006)(261026121527099003)(261102123227099003)(261022075727099003)(261022113327099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	B0RcbmjOE8YiU2FJxLq9OUbJyxvjyIg2m7kMvI7F3bOAOliGBkGbFZAU/X32HZMufB6r8cCSupOkQwLp3FDqUVHAkjUtZvvu3+hzHKTKKnMVImRwqoNkD4T3oNDU/HN6Y1jgtPHSqScjyhtwLFAWscP6JVPTex1/bW/mCAwTMn/+RYwPve5PXTAm6OIkQJ2ddUSbDhEjyiZ8RCC5q0ruXqigrsFFfaQOhmRzpDX8HADqZecguj4hvWpYbTYcZu0RCSydsIvHvoS3eWadizPNOE2zpoEaiu4W1LoCXA/Q9vMzFl3It/CaL2Lpxdu86rZN2gVBYChfXtACCf3EbBDP9r8oiTNEHvk/MSH+KxDrJ7+8qiRH051n+PWrDq5zPJDtY5lHF5wEGBEe2sRTkDUNgTSUgV97/NFYe75qIRoxzI0awjYfAFOdMXD22aYo0yYc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 15:49:01.2058
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2afe5650-cb6d-46e1-27d5-08df3ce6a4b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026964.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6699

amd_sdw_read_ping_status() is always called from sdw_show_ping_status()
which holds bus->msg_lock. Add lockdep_assert_held() to document this
locking requirement and catch any future callers that omit the lock.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index ebd3787ee6c8..767bc5510dfe 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -571,6 +571,7 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
 	u64 response;
 	u32 slave_stat;
 
+	lockdep_assert_held(&bus->msg_lock);
 	if (amd_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response)) {
 		dev_err_ratelimited(amd_manager->dev, "SDW%x ping status timeout\n",
 				    amd_manager->instance);
-- 
2.53.0

