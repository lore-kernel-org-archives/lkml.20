Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010007.outbound.protection.outlook.com [52.101.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B990B58F066;
	Thu, 10 Sep 2026 19:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789067057; cv=fail; b=BrGwGFpxI3+FgKipLeaiSGbO0diq3ie+iE9Pd26dxlHlegFBUnVMurJ7cGCu/OBd64/86/dLhKlmDvg61vfJ0WoCMKkYryrH+Y7pCb3xG4/HombTszEAeJMZDUmxOLCjwEjyupL/MZS++xDoqdw1sQcYxlJ8JsnJob0WaAg0/jU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789067057; c=relaxed/simple;
	bh=ZtbntJycbmSbN6o0sZVzksLKG5qXW2LBBgQv3q0WiPQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VPcmk0nwveXCXGWBkzBNPrGrMc/4PxgmT+7dgndKa6J2UCypLyEuCGe59ic3GVHSPkYg82OUK2HISTykwD5NU+bF4WaA0FWGa74MsSGhXIlccnCyD/NbQSV4meKOBTRfXW+yqUbGkRLq+4HYfXft3ziJdwiHPRiz+hTzFKuZELo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bzCloybx; arc=fail smtp.client-ip=52.101.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bzCloybx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJC4zOtoYoGkGRc+2OZ/IKdSA2nN6SsxrISUJF7dxcfhllMkILpw+nJ1TdRCsUdsDhLwC52z1trrPN/soKLj6Ho7HG406YpSR7HaRTb8/u+vXU+E0GFJOpAroXfaJHLPDZvlsBelO6ztsfL29832ypaTmCVQntZupyrw3Ub7ND3WuZ2na3oOfGO5kvc1cEKOC5QYiwkAUAPsRJj0ZY2lU0WHOA1z61jqwxNjapG7CY+xLNSyJfCGpSVnWpraQxBOMDiGEuSA7UxWGB9t0jWHFX9LLNec+21dZgdBkF1pD3kdUQ9iTLa3YCuG7sbGpzv4mm2NXOoL+e8tzYeD9vOPWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fS3oxGWZfkHEQHkHrwT/tlXhEfWx6AObVf3HmcYXOhs=;
 b=e1xeRJ8XjQNm5IqC+YkSgPJZTZXwJx1vjJB6eOz0nQWgAoUehZbV53+z0yUM6OCxz4jGG2FmPjerA50Oaaqn7HNq+29McFqLSlZ8vJjonZGwgNwgB/aiGwaHvuNXvU2yzqvZMrAVGWWzGQ+97131SY7/mGWfav7R3UTVgdAscFbqwOs0AeeUbCNt53xgeezs8M1zRYu0J1puHrBKUbDpiH3qvwAY3p06Dpi5PHHXgXwOHXllGjrXqS6tl02ILcOO18AQm9cIQctgogSb+5p+Wz1j/5WV/fXawHgoJHJ4TRfaj/5w2F5YIVfOQxqZPg3lfwkN/PTf63os1UATZBjKqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fS3oxGWZfkHEQHkHrwT/tlXhEfWx6AObVf3HmcYXOhs=;
 b=bzCloybxDOJjZEkwcT4pu5eDL0/nDEtl+heB5qtok7/6hwQBTUs58oH9g+ZuyX5Qff/Gmlb50mwoP/wHf1ZZv4e5HBxas68tkyypQ6F5XbqoMF8P0mZc0rsflX1tvYOWBf9nDAVnYSjukmwLBi/IajgRHDG/gmoWIYvEixTxocg=
Received: from PH8PR22CA0020.namprd22.prod.outlook.com (2603:10b6:510:2d1::27)
 by DS0PR12MB999106.namprd12.prod.outlook.com (2603:10b6:8:301::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 19:04:12 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:510:2d1:cafe::5a) by PH8PR22CA0020.outlook.office365.com
 (2603:10b6:510:2d1::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 19:04:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 19:04:10 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 14:04:05 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 14:04:04 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46
 via Frontend Transport; Thu, 10 Sep 2026 14:04:01 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 5/8] soundwire: amd: propagate amd_init_sdw_manager() error on resume
Date: Fri, 11 Sep 2026 00:30:53 +0530
Message-ID: <20260910190240.1604447-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260910190240.1604447-1-Vijendar.Mukunda@amd.com>
References: <20260910190240.1604447-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|DS0PR12MB999106:EE_
X-MS-Office365-Filtering-Correlation-Id: 460784e0-48b3-40cd-97b1-08df0f6e4bfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kpvNFlLaq+4t0OGte2bzAkgBtku0fJh8IUj4nqiM1l45rpDDoSVtNquwmdLuuS2NRjCpAq/WWovtyFdkUbctd8v3yVcOOvJbAQWSuKJs7XlRyn6t5mdgDCBsmGKkOtX7Wd6Lpuxztuky3N5NJD1y53lajUsqxAvLNsDL/8FqtlxkQb372bn/mtwN9TAYWVUiGvoqeCMuQzdYEd+IyQgn7LhQWfdoYusHmcody5iEv0LcZQt+sgfFIUYJj4pu7Vru5RUiI1cfTeaSPgViLWBGEobSvdybCiXVzT9gJGp4o8K4z9icxfimI+/uQJ4BBrPIFqVpndQkQG3DmK/CkFS/9dDO52IY+OniuHUft5m2VG+Dot/WgsMS2BZTvPsjeBY/pZ4xNypYBJ7SMd54zDNoQQTaQpJ1MfLHcWMrZF4ZQPV0G6yifdjHlof2Alz0nIyJGdlGJnySAIN58TOd50qmJiC5JQs0icDKP8cFg5+dfxEnCdrKUNxDG7JMQWJwxz6v7UjZS+oXCzlQdkRRiUsjyC0s1BvHJNlGWfZXwGem8GazXzgAyvz8k6BPFViLsIahxdau25Znp5No3zLbAUVv4F+7DGZ5hb6st4RRX8wy9R0QNemr8GGA81KDSNisQPTPYLfyppFysermlEeGxHDVQ3VuqqS1saE10vuzYtSGMgNDQ3Rh+vf0Iw+rH5wQvMuPJMFt6NWvSfBaOKPmUG82nQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9gaR+oIuUIzKgNxbxyZVtODwzwRUDv2j6vQ6Vnppq13hSaIm+3HIjjLERXo1Z7YdzBkWRp9JkIGQCm0SmBUs/wtbDMWfC/LHPHNWT+eYSkvbU6Bs2q3/zm9hIuIQdzW85TREhvwKf1kuJsgNGzc2sC+liv1lG0dYflYr5JwnTw8z1RWa8jolnHz+0G2c+TQMUObf80p4PJlaLUG7UvRtjhtjXfYc0tFduCRhtFrTY0yez7OY+ZZTxGXa5zyfHnRuWGUF6YiitJBzJjAg0Mas5lQsDQgF91V8CS6OdcRol/CV6j0p43dro/Q687Ngc+IaKusoGwC140cTWPJ1GvdxROFLNHrSfWJCy/yrrjznwSjGY3BEeseA10sTt5A52W9m9kWDUzNXdKnkT5hGG9wOFyYOMTm7qoekr52uQ7PxXXzvmQP5fVaNbPFqgbe0d24K
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 19:04:10.4606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 460784e0-48b3-40cd-97b1-08df0f6e4bfd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999106

In amd_resume_runtime() POWER_OFF_MODE, amd_init_sdw_manager() was
called without capturing its return value. The function performs
hardware bus resets using readl_poll_timeout() and can return
-ETIMEDOUT if the hardware does not respond. When that happens,
execution fell through to amd_enable_sdw_interrupts() and
amd_enable_sdw_manager() on hardware that may still be in a broken
reset state.

Fix by capturing the return value and returning early on failure.

Fixes: 81ff58ff71ad ("soundwire: amd: add runtime pm ops for AMD SoundWire manager driver")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index bbe1e73ed255..2d2f628230ee 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1456,7 +1456,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 		ret = amd_sdw_clk_init_ctrl(amd_manager);
 		if (ret)
 			return ret;
-		amd_init_sdw_manager(amd_manager);
+		ret = amd_init_sdw_manager(amd_manager);
+		if (ret)
+			return ret;
 		amd_enable_sdw_interrupts(amd_manager);
 		ret = amd_enable_sdw_manager(amd_manager);
 		if (ret)
-- 
2.48.1

