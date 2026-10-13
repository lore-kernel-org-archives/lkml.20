Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013002.outbound.protection.outlook.com [40.107.201.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB28F3BB669;
	Tue, 13 Oct 2026 08:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881572; cv=fail; b=GENRgtFAxthfRZ1QJS1Ag+um5wr3m70bw+IiO3brlKEpbnauuQ1Eq3owaRR2Bc9Bevs68/66Uh7Fm7p8cQOdIwZ9wbd706s4jfslcwJCsvGOWG/zw5NicvI6RG8ddKmqjSKzitJLyrcO5Y5rQOOmqegxbIUvZS7neTpee9awLqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881572; c=relaxed/simple;
	bh=NWmfg8PkXWApSrD/HNGOAmbgIvhW5yLjpA1/mMVGrMs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tqGRcpQfRhmropuAjiXWKLk4uLj0hAdsk9jC4YRbyOrziQacNEqTC+rzZLvc5TruvnXgv7g+XxQE9PqyGKktFcX3DQxn6uWzKO9dlDkpi59KCeZ8Vd7RnAoI6E+MzcN3MIRYUQmrhgDXx+Td+utdxjfn1/T7qzrUdVBbXKfLabI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=izPNmSbq; arc=fail smtp.client-ip=40.107.201.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="izPNmSbq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Te/WmBgCgui+Htf2lvqZ23ONBDT6L69gRkXbU3uU17mKtOLuc/zDePBZSCkDl2W+FE7pTF1PuXVOoJfJn56+SXyP+pOQofahWxqxxqyWOe0oNxPCt7qlPHBRkjykqBjL7DfVMwvdR+aFMqDB9e9pc/6zXd8rdQaLfDQjzVuAeO713giS58r6jMJE1U0W5I95eI9EERbBGdts9GzrDJnP+/QFgFNfc1qfWLkIfRpjEvo0fTM6cps9k7I6dOiXKiOzNz1KvnMT5UefmeVt2YV7I8/v/u7/QxzAkISYYYfRHsMA7AfwkXDEvZoy3/Yvm/wKRiKbPed2R5TY3+JFU/BDCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/BB4mj2h1naswNQfVcvWfadcd+r4Z63Ld2vw1mUC84=;
 b=koTBs4/12NvUmQQAY2Qo2MsoSmFBZDsxgdOmDKttKJpd0adJo9ad+ubjzKTspRt/K6Qsp2hdwgJpfdi5ZPQhU40r9IsIWxZznT6h/oGb26yC5ko7wiTO+mopGsIjthenQTSu9NASMqKOJMsaWKgyUme9n4GUlBnxllibLFYLXxK+Lw8KXWSC/Yw0nawuHhE9qtMrUeOB9O1iFGaQpC0i+/QSpXMaoGis50r03DASZjSqntOsYvSvkHbTUFJVt/WDg0PjjeAijXM5hTrYeCruQPdlgJVEmgCj8S8//GtUuWEnc3vkxS9PL/PWr6aBpMoetMeuaR9Lm9zgQjIv/oXVRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/BB4mj2h1naswNQfVcvWfadcd+r4Z63Ld2vw1mUC84=;
 b=izPNmSbqQ0fP2Fi9kCAAWf/dNkgab26hrYztzeqZ+PuLumN0UIdsg+RzzKuBPvkWFGzXr3CH0EaDYABXXOo0lhEh0HMPNRtJsLjeYyL3LrVjjyTrsuf4ku7qPUorXtsYHsAifqhog+WDk+r0d/EczcWKbuCUHI5JId4McXeHAok=
Received: from PH5P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::17)
 by IA0PR12MB7752.namprd12.prod.outlook.com (2603:10b6:208:442::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 08:52:46 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:510:34a:cafe::6d) by PH5P220CA0002.outlook.office365.com
 (2603:10b6:510:34a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Tue, 13
 Oct 2026 08:52:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 08:52:45 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 03:52:31 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Tue, 13 Oct 2026 03:52:28 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 07/10] soundwire: amd: drop amd_deinit_sdw_manager() in POWER_OFF suspend
Date: Tue, 13 Oct 2026 14:19:28 +0530
Message-ID: <20261013085111.2009061-8-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261013085111.2009061-1-Vijendar.Mukunda@amd.com>
References: <20261013085111.2009061-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|IA0PR12MB7752:EE_
X-MS-Office365-Filtering-Correlation-Id: d05e11e9-d2ef-4568-b982-08df290759f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	sm25K84CboZlggyyHrfFvyNvP9wW81m3gKoHLXQLFFoRV/tzxlD2ap4wpsOxpzWuz2X7JS969uuK3wWe3w9nUPmQUYxZXxMuMQSkcMJBt/uSBNim9g48Nc2CuRZwp/s14H0nXBvk6PIJOBnz2/4R1xZP4z6tQ0GvwRgbdI/wLVY67OR6UDqoucEulDoV+4cY44f+2k3ZgUiXJaJRKqGBjF7Kt7p+pzGbdaFRAz/VB4jYizHPRzBol2UOpf2xOQnRBAKi92DFJKsivg620GSDwiV5AvaPtXYtR+vfoPu5nqdstPr6t4Mo1Q8ip3MwgUFEiYBVeUnWSXOsSWqhvhIGhgKxmdFjpd2HJU3LkprPwIdzYyFnVdHwzWtltYKR/Ozl5E8/TbM7GIk1zP9iZMQ+09o9CWwa5Htq+BFvveGh/21oCTepVofURYEW0aIfveNFZpY2Snv5YmLB4xR31mMaOmpNO2+mJ0os8AOU7YBxF2qy3Om95P2LrqQXwQGkSKFdmi4ln+JRtqqTWBTATPZT2VPjDasFQ4f/IAmd2REPBsnVFY6YlX5+OYM+XZNKnYiHzZ0YNZ7PGE5U7tYL9A0XhVYlKulWiI8Y7tw16NLwxT0bZGKWC8U+AbQcQ/pmc18L7zkTgN8gykMLl5Kgs0QSFWA7rBKVtZKHyJAKxKuA2AooVucrWWh3wiMxG+SrnEgCG+QdSaRlZx1rBQbGSQLOKw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ojesKvRirMsN3221xNdG879+fpPtvJPQxEaTHFmxYRQYzj0laWhPcQ+F3SMYFpflxwMH8yzLY3KUSK/iU0ewR/5MmojpltZVU3NAo8c7k4hUX+ylbPenTum87RNL8SQYFCAdLa5g6VFMdRJ32nhde3yXTTSyv1G5qYYV42FRg9F6G0qhRpyLRHbTK3iM9X96jsA1jTNlwonNsfLDyYt8wiy54GaEHwfFLERI9STMMyPqm9J7FpLb/n5WWadJqURTsqjglObzAhuiQvNG75/57U4NFBPueNnKKeqzsST5egMEOUxw7Nz7CJvqfvfibmghaSNSXAEfmL6k5Lr++NHYiDJaTKDC9pmXOksuwZs4JavaLbBxenJV6rTpJfiZs7fUifwfS7309+sobqOfn3xmVeZRtatoiTgnQrWG7NdgKxulNCgbKlnX2XIfvPAOYZ+3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 08:52:45.9287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d05e11e9-d2ef-4568-b982-08df290759f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7752

amd_deinit_sdw_manager() was a small helper that bundled
amd_disable_sdw_interrupts() and amd_disable_sdw_manager() together.
Expand the two POWER_OFF_MODE call sites in amd_suspend() and
amd_suspend_runtime() to call those two functions directly, then remove
the helper. No functional change.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 2d2f628230ee..6af224ca54a3 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -146,12 +146,6 @@ static void amd_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
 	writel(0x00, amd_manager->mmio + ACP_SW_ERROR_INTR_MASK);
 }
 
-static int amd_deinit_sdw_manager(struct amd_sdw_manager *amd_manager)
-{
-	amd_disable_sdw_interrupts(amd_manager);
-	return amd_disable_sdw_manager(amd_manager);
-}
-
 static void amd_sdw_set_frameshape(struct amd_sdw_manager *amd_manager)
 {
 	u32 frame_size;
@@ -1336,7 +1330,8 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		ret = amd_deinit_sdw_manager(amd_manager);
+		amd_disable_sdw_interrupts(amd_manager);
+		ret = amd_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
 	}
@@ -1380,7 +1375,8 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-		ret = amd_deinit_sdw_manager(amd_manager);
+		amd_disable_sdw_interrupts(amd_manager);
+		ret = amd_disable_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
 	}
-- 
2.48.1

