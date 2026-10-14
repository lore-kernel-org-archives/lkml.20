Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011059.outbound.protection.outlook.com [52.101.57.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F251D4F648C;
	Wed, 14 Oct 2026 10:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973209; cv=fail; b=qV6xJajHtITRwgIJ7D60iO7hmE5GlYUSXoMU0lQiWMaf6dGf+ZwFw+AB9Dd7jpU6O0amw038qU0DFeDzJJCOacH7B3JTJ0LLEuINJP7x6s8IlAZ7H5C3+mh5TNTvUxt3A/+bRWLgisZe5q4Rgw0c+a3uc4fIuL2onVz6dDaNGYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973209; c=relaxed/simple;
	bh=vNenaGru92jM+jT4gxGI7gSVHXm6DKybvVeiqWiIyoo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aZhtn2Ut+SOgxAxprI5X2uHgfjC0qwDsOh5CQzICeTRLMzEDoMpCiMKEVV69DFSbDE+kd7S9TUCkSHPWQAe4OoWg7+qnNt1yeAOGWJI8jVFEECWz0LGsRIlc9llzvdhEuqlnoJfkMXrGinx/SU/AzlzOuHcWxlwPAQTcmyvOrrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=H8H/4nKR; arc=fail smtp.client-ip=52.101.57.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="H8H/4nKR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=swJBpI/CAd/T1h/2MW52WTZgEXLPFWOkLC0UTs/RDhTjMe4noj3p2ZRP5dJvT2a7lGxQFPjHz2Mi0tw+0hb05XYCktGmcZLEgbzEZQqsGFaxtTGBpBReaWj16jfyIpwNvvpskCHiwIv9k8iEcr348Kp2BN/1kD6d7k7Qi/AufYZ9fpn5Qe48Y+oyB3XL44NnhyIZYOk56h30dj13MuKQbTxdnYaYuykO8g2izEK4u5bppqk6YU+RYCbtXn5nD0DjmySh++2BfQST9jdwqLSSq2bfhbDYMMTTM2qlHKAutPtEM/mK0zGcS0yK5D4YkkhIgPjPxCOt9HzrFkdz6pEOwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9u4eydexlOBYPSSsgrJ2OSq2SEcBXEC+1UTd1jwR/g=;
 b=y6mYQ3KsBmRegRoBS6KeJ7EYF9ts4N4H7he/9qfy1YS5eRfRs+s/9IHeEvG6ijKQUYRF52xaYWSeoWOPMIRb7kort6BKhvzzPIorsE8RisEnsFnEEFOkJPjk6iOkHbndU6oXeiwby49R8ud0KKovSE8+62puzRYhO33jAKuL7mcbRtojlGTXnIo+jxTxpabW1VqPJRVPyeVjwepE9fCsZbLQfHaY0FZPQhlr6veTleHfwGe0JANuuvDDjQetSvl54ee99MDAWt/uUS6Q3xSoj6isxRT8qqw2aFIVRukpXP0F4S/oUlENfaT4GKTHKS280xeH05ogY+4FLjL7S4D9bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9u4eydexlOBYPSSsgrJ2OSq2SEcBXEC+1UTd1jwR/g=;
 b=H8H/4nKRhKt/rxV7H1nbTqJKzvHqOUsHIGEz6Ca66VjkxjiwEjH8nafepec+zjpeTwBrGZbEg47nlVWRIbfrFu4Bjb7d2aeuJyHJrs79y/33ai+qe/AjZm1xHBgMLWAdN8gxvYECJpFdX9yrGKSrQVR3ngRihWIo2+rP6vrfqxU=
Received: from PH7P220CA0028.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::17)
 by PH7PR12MB6788.namprd12.prod.outlook.com (2603:10b6:510:1ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Wed, 14 Oct
 2026 10:20:01 +0000
Received: from CY4PEPF000392DB.namprd03.prod.outlook.com
 (2603:10b6:510:326:cafe::5e) by PH7P220CA0028.outlook.office365.com
 (2603:10b6:510:326::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed,
 14 Oct 2026 10:20:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF000392DB.mail.protection.outlook.com (10.167.247.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 10:20:01 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 05:19:54 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 05:19:54 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Wed, 14 Oct 2026 05:19:50 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <yung-chuan.liao@linux.intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<Vijendar.Mukunda@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>
Subject: [PATCH 09/13] ASoC: amd: acp: fix MODULE_AUTHOR missing closing angle bracket
Date: Wed, 14 Oct 2026 15:46:28 +0530
Message-ID: <20261014101817.1240200-10-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261014101817.1240200-1-Vijendar.Mukunda@amd.com>
References: <20261014101817.1240200-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF000392DB:EE_|PH7PR12MB6788:EE_
X-MS-Office365-Filtering-Correlation-Id: 97310bd5-f5f3-4f46-8c9b-08df29dcb4b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|10067099003|18002099003|22082099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	kQBoKwDmTWnx7/7hQJKuJeiTy7rjQ6tUtMSTnwLGGaVRTdi7GJ75+U0iqEveYxsArKyi3RK3r50jIxAuCQ2Mr2ZXsoN6flho4y9zjdkB/vH87dtUA36ppx0aMlChG95A3bjSo4mg5RFKMxqfgE1qWBk8lIvKbw06LI2eYSmyY5MLMPbOwoLXAUigudUtDPqPP1eiftsvNOEVyex1nJnl4gHJvlScp4s8MpJHDyCXdip1fHAPjHvZULzA/i1z8LprW25nGnnygzntA248Gqexz8E64gG82LS30mj8sogZ3y2M8c5w2+jy89v0k89zA+boE4PzxK6BIVOywmAXDfqCD4RQkzsRuGErL8tgP/Ihu0hocCA+X4hhhF+2eVJjQGNI6sP7NrRjn0pq7t6LFt3c8PLK6FCOibXiRbh6TDnAiTwIOGDRFezXYwRfhVl4qXQGywDhcExh0s8wJs32VPqVNdOE33a+0j9bOfJhlIBxiekLrd2rUKHtrY8ZZCpt1Sluz+BNQiAoHS3Ze5UTAacjO2uOmTQN84ht/5+0t2YfEAlzGONOVFEGqQv82yimjjY1WNtt0cBDIK+H9QuHgIZkEYQlUjK7dD5X1pcsavknWKFmqyWFEgQ5+tdpEhGsyu8BIjoUP9BFLap5g/1/t76g4UK7KYrC0apoVwkuyOCBymWt0uxZPxl3xPVJVH32JYyU/po7ItzKW0KsxT/KI30cJw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wCHR5kknL/wu9rsI5T5QLhA1IE1llrq1FoluXRk2HMjbqT7yW2DHjjdOPeBUoq7xoNHMURilPrCGT4w53Gc4fO3lm9XwHVbCNM0BqtQrvjeDB7KeFILrKpepvtEgf2BqjvYeMuaYG012bbp+hmFSvSWaHcFTECYt+TJwgGB0HmopQAESE4GZYWAFRMllnfTvA9OKtNV8oaxna4Bj7tMTFTw+EJSrQ1aCNk6I6JJpqtHvEgttyFdGjVhy2C0FoLebeQo68vitj8EHCqoBfSltLWFmQZdNV/OdeKTysFfB3IN6/7V9xuqO4d56HlHhSVaIokLKdXI17EVDcXBnfrOrGvh2f6wzIQOKbQ+ZerR1xxyRORNTedE6V652XJyelbpIoPi1N3Wocj957UjTxlJ9zjYpuuKZYLwaaYRQ2cETK15+pxurRYAqjpS3rUP3zJM6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 10:20:01.0361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97310bd5-f5f3-4f46-8c9b-08df29dcb4b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF000392DB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6788

The MODULE_AUTHOR macro call was missing the closing '>' for the
email address angle bracket notation.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index b80accf7817c6..db469813e3175 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -544,7 +544,7 @@ static struct platform_driver sof_sdw_driver = {
 module_platform_driver(sof_sdw_driver);
 
 MODULE_DESCRIPTION("ASoC AMD SoundWire Generic Machine driver");
-MODULE_AUTHOR("Vijendar Mukunda <Vijendar.Mukunda@amd.com");
+MODULE_AUTHOR("Vijendar Mukunda <Vijendar.Mukunda@amd.com>");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("SND_SOC_SDW_UTILS");
 MODULE_IMPORT_NS("SND_SOC_AMD_SDW_MACH");
-- 
2.48.1

