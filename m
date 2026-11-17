Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794899460;
	b=2zAunsAfoeyfs6D0lQ5JAlW8XfA8iyyARJqbCT6aC07FF53h9mxELNk3SuRjwg7PRb2R
	 zNnW8QFcaiCdyVnWK/S5Ht8UF1uHtZxfF4fh5I4c98FRG9AUq6b2q0/8mJJtKSPjHMdC8
	 k+QvcnU11S0sSLJHsSYA47IPVJi9ULSBaEZZAaDqE40Rt7MROUqpPq5Y1F78gvdOeifzZ
	 9LFD/I7GulSuOBQplB6qf3EI99UJ53VXggXlDvElfF8o2DaPbk/3PJo1ZvqcTErhk0YX/
	 FsYjoErzsBwAHrS11TWlYrbszQSLr7snVHPTp1zy42gfraNRh9cRf24oIon+clZFVhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899460;
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
	bh=hba/4DLpukgFxN09f9SIv+Uf3GEnrlHD8EHZzBzElzY=;
	b=SKAzUcVkEcy0JMkaSz+kumXN/mbE+/uyEQWCzl7/yIihjkdr3a/un+XREbWDgFLQbs+P
	 y+kHD+CsjKkvoZjSvfd2HfCfEDgg1M4fqO7Jf54e02/dW/ZsrgCGzPZ1LkJ07WnTLo3lc
	 OcMe4qA7FaLWdYjf3kpqq0rxRr3Q8bvwf/UqPcAoJt5JCHGVLDVfdfQmI+wMeoCeYvllQ
	 63B/ShZ70pE2SQUImuVoSEGOStCVLtiZPrXcA1EIyLLCVDnQOyhOFo0UCXBPlIQ0uvEg7
	 HTIaMQ1y7izV+t9eJkZNh7iLk0S41at+dsG4YvaR26sEGIL9jY3UYFCj0fDqJEhBtrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uhHEunAj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.57
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011057.outbound.protection.outlook.com [52.101.52.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2550F606A323;
	Tue, 17 Nov 2026 07:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2550F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uhHEunAj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tEnqpwI3jf24UvkWSK2tVlaCgmdqFtLXlaLbW8YCNb0ARkLDKtuW+gecZbB9DAldzSd8kDMMrlg1s1hDgxch6atYqk/v3qQ0k8fog5/fXn6FcqhbfC1I025JbB9Q+eHbqxWcpDA+5xyYKyqeNeM7T5DHAJCtT381JuRo6sgKfHFIUvZeDh0M9DJ1W0QKjfU6mB/Uh71XOMUdgJOyZorUUjOHxifA9oRQ9UprgF3mUYkTZXQoi64zF08VU9dO8tlIP51Qx2o0JNDlOoP8t9gWtHJsTuBakNidXRYKPmNFaQ/FILbKAWNXKKQvnfKZL3zJIR2NX1+9xyFyjFBWpVS0Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hba/4DLpukgFxN09f9SIv+Uf3GEnrlHD8EHZzBzElzY=;
 b=GXGlrnF7el6U6v+XsICOq/P+OIqtnpradQMLhYFtWWH2bRt7/5/rnAS0SPLtojzScgXoVfv0mXFNYZRZywzit5LtONS43Vbdi7uv28h99RaKs9lJexUHHkRXJkuXQ7iboLZYiY8QUl40/9TvaiH5/MUG68nTWQXBHmc4XV38IOHJGqMaPcz1dRa6hPPem2scu1YZ5InkvX8aSJqpnwdQiMMc9UVEehEgqUzmTra5Eotpu1QNcUlJwrYvPwTDYu4KYHt0yuO/4k4wp0CqLJhTkGG8WC31eMrPc1xvbYaEI1Rkn+iNaEWO/L0mIJrYcawmk1XPuH7Rq5WZI2OQocXynA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hba/4DLpukgFxN09f9SIv+Uf3GEnrlHD8EHZzBzElzY=;
 b=uhHEunAjNe6ahf841H/Vuoxt2Tm2YzdrXieqdK4UP3CRwaD5xr/KQQzE0kFb/OU+HmehD0A8+98l/RAfT9PFcMe9LkN+C4gsNOzEk9Ta7oHJh/Kd8imtO9xVFnvUgLEj1KJ+JMbsU+K07mlxeitbG2RrZ8PrKQpUWedawQ9DC10=
Received: from CH0PR07CA0011.namprd07.prod.outlook.com (2603:10b6:610:32::16)
 by PH0PR12MB7838.namprd12.prod.outlook.com (2603:10b6:510:287::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:10:52 +0000
Received: from CH3PEPF0002457B.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::34) by CH0PR07CA0011.outlook.office365.com
 (2603:10b6:610:32::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 07:10:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0002457B.mail.protection.outlook.com (10.167.252.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Tue, 17 Nov 2026 07:10:51 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:10:51 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:10:47 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v6 07/23] soundwire: amd: remove STATUS_8TO11 clear from amd_sdw_process_wake_event()
Date: Tue, 17 Nov 2026 12:35:42 +0530
Message-ID: <20261117070906.803139-8-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
References: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0002457B:EE_|PH0PR12MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e36069e-2220-47a3-5c3f-08df4479ea06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|10067099003|11063799006|56012099006|261026140227099003|261021123027099003|261022105027099003|261028144727099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fiet0O3kGBwP9I6id5rLSfCNAFYhWo9QgG8up7IldAu/HDVq7NTKCaJs/lARexh/KeC8aSUo4GTizPgxgHi8QVfziqyGzysDnxgq2CccSz/j3tRKeTcZw5Y/V8tZwoGPhAK5yXBpX4obZ2vAgj2YMQtawRVLVr8ZU2b4yzxY2F0+PHm71+zwwARxP1ApC88jKCxEuC7bcWrXfoPeZShLXrXghtFc4pObW9jOSyOH/ypY1EeOuhGDP8u5z5wS9LQG9trwvQEt8J7oUbT4Hre5lohsQ7EQ5kDk/+tYJJrU93fIBY+di/iF+QWrzbglca9JjSIEWBoa3F6c/eUeYTtVZvqy8c505MSrZaM1/MqPu0hN60QH4JUXNO24cxavo9sdAlSPxZ2JbmJcbJnkvV1wlz5zTWbFuetTmsYwaL4Qh9J5U9gX+9pfB1o2opgTxIcWJBKI7Tcmy+EhHjJM07+VaqJmEQpMQNMblTdM2M9iPPPx5WERQwHTR+iMXlW8tPnJmYfEM/081FrDu4PdtQMIiRM7YKGCZ+RBxSMYVaTrXUZsmEP8AZT4bHbwHVXaQ8mvxZw7hxuNBtVCFwLs6eBle9lIPVEM0xKwr284d81QKl4sOJw7HgxpgyFNhO2KJS1HfAx6GCrOGnyNGJFcFpeRPgs76xeX0GN8YJM7Xoc6yQPqdYgkI1YGc5AsRjzhvs9f98nGQimTg+C0ySQTg36wRQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(10067099003)(11063799006)(56012099006)(261026140227099003)(261021123027099003)(261022105027099003)(261028144727099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pkGOYT/MKl5LWGn8L7rPHXI1zVMX55G1Qh9eay/FaklcFH+6QYAp+yx3KE7n7KSL18HEUZZZzwt724d9IxFGwhGEC9R2Gfwf46IJ096qsko1a5RZkr7nftFOeh6Otf7avE/+EMMwimPV3/RvfzmVMTGcq73wjIrw4nzwauTm4sCGuIqI43lmNxLYOw4SEsJ3ioEGuBflUcoF+cEDU2OZEv4kEaaWo6YgVC5l+avlZr3JjH0R7UoBst2ziDXMcrptIPrmZu+7ZIXYuXp7WDN3k6jWcgrAMA+aD1Zl2qc28iArjrXacrASv2AfZi1bAhikFO4fMzZjxjQEZLupQS1ZVOMS5D9tfEH37OBI8bWVJJxp237KzHsP+R5oHuLsgas/kzBC7kovfCgrLC4GSJHscuZLalcechWGnR2JDQ8lsamhThR34IAi30om48MTWq7U
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:10:51.7352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e36069e-2220-47a3-5c3f-08df4479ea06
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0002457B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7838

amd_sdw_irq_thread() falls through after handling a wake event to
process any coalesced PREQ or peripheral status events, rather than
returning early. With the fall-through in place, both
amd_sdw_process_wake_event() and the tail of amd_sdw_irq_thread() write
0x00 to ACP_SW_STATE_CHANGE_STATUS_8TO11 in the same invocation.
Any status bit asserted by hardware between those two writes would be
lost before the next invocation reads the register.

Remove the writel() from amd_sdw_process_wake_event() so that
ACP_SW_STATE_CHANGE_STATUS_8TO11 is cleared exactly once per invocation
by the tail of amd_sdw_irq_thread().

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Fixes: 66c878838f37 ("soundwire: amd: handle SoundWire wake enable interrupt")
---
 drivers/soundwire/amd_manager.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 65626ca590c9..438cf52a212c 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1093,7 +1093,6 @@ static void amd_sdw_process_wake_event(struct amd_sdw_manager *amd_manager)
 	dev_dbg(amd_manager->dev, "SoundWire Wake event reported\n");
 	pm_request_resume(amd_manager->dev);
 	writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
-	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
 }
 
 static void amd_sdw_irq_thread(struct work_struct *work)
-- 
2.53.0

