Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794066568;
	b=0bf7tLfK1ILzawPKh9vVN5R8Kel6fVqDRG9JnvLUCjWJfn2zafCQZI6NT0yS9Undam7u
	 Ai9p51G6BLOi93vukh/7P8kT2GxjdUkcEVPF7xVW4fXYzvEiicNefTBcXD8yGoQi5OFL3
	 2qahO8BmxQ6+pvniOEDaQSzYubHCzNg0gKIIRbszjBO0wUISF4soaVZcJGe2aWHOrwklY
	 09pYPQhwaRZn0AcGKXKm3ERpGoeHxDeENygG7da6gyUcPvajRDtQWqzLMlT6gO3/ZVNY6
	 PjdlJX1S9jq4yNZqX0xvBWLM/5WxDsN4tkMKAqS3JR/p88DkHjAXk+ERp/XUIJeMefA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066568;
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
	bh=nm7MHPAT98johtIlUDIq/rQVA0GQZIfxtE6UuO05BcI=;
	b=YJpiZdm0BqLP5K0OfjHgWJSChdMRPuSxFes55LqPZ8AkJk0NZwslEtUPY0uGSYq0U5y/
	 /Gnpct3NlE1obrsHJHQ5izioSd8T4+QXylqm/n4Dvkc8KBYRKtd8/nDsJKUZU96RpsJxM
	 MgsZLRH/xiRVfCiOMqJvFYMG7FOtQyLh9uzBgwWEjCJoBrpdPuoMrc4EJyrwuIcHVP1E/
	 j6N+gA/6LLM/oTQfzjD+K9dYvWBsQ3lJ8Qo1Sagcia1uiCaBXog7Tb8/RWwXvYnI8jIzq
	 ZHwlle7T0CipEiq8KmsTXYGZpMN8T5WAgJ+7GlLXTCZjvVQ+iQoX/6v85lVyvjWwoPA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1cjivWLk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.36
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011036.outbound.protection.outlook.com [52.101.57.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A0A606D804;
	Sat,  7 Nov 2026 15:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6A0A606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1cjivWLk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KmuhH2J96WTSeQvW8tUUjYvvQU8avscI5jLV2xhAhGZHsW1SDIt6zDLVxeGM1da6cVgmti8HWFW8v1ptjWpsw1pGlR0tgKH3ldOnNbHbIFQFKDlBcOmRDu5qASQDKAkc9WhGhzSCPO/izDfERlDi2WDqAw/MskfpxcwNsYwrDBh35o3K+DptG830saHpDE12glcgLDfUH89RMogxjXCGuhBUpfhqclPMis0nUPhDAy/drm3AM+85SWJZ+3OJm9CDY/trFifmY/Vyu5qFHhjsaDvNSunTfLcBzRpPkAY4d5jWU6iHFIAbCtlJqzkXJsXFa7jKoxsQjCNSnTHSEO+jKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nm7MHPAT98johtIlUDIq/rQVA0GQZIfxtE6UuO05BcI=;
 b=lslBrNvwaBpPB3ZgdyT6ZD0cPM6Kzb0Gl+uMUXKHZBvhBbCBcV8Aw2QbeCR0B+53fyRllKfoC+s7O9KZxDOKCSGeNEV8Zm1ddbBIYNNSKizSL+QsuSN3BsZs+2qZm3HQXiX/LcdheZOItqQ6OWAds4cM92YPo2VTbHsCSMuCjaitXxcHAn+GIrj1AR+A4V7dZbZM/seKRefL+ZI6PDzz+2xYkbkuSHbvXzwI6aiYj1BB8P9B8JtV/GUNcQ3luM/gQvYVEZc8UfsPPHO3rLQROcp6xOirX96Tl2FJ/ktKttckemamvbDP/Tj3TLHHZ9TwGmKR0juZlkJtBfYJup9G0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nm7MHPAT98johtIlUDIq/rQVA0GQZIfxtE6UuO05BcI=;
 b=1cjivWLkbLg4HFXgH+MZl/EWU1iAJJBK3STj97U6063VKP8XFWaHmBZ4sPjh7owXJ++gt0TczV9qvtEQ9K30uNBeTLMsWqkv6y8bQ2BF3120VlfiyQt+XQZtvSoM57qNuOjQctYNodOOwXd5vKj9vwGIaZOOoW6ioUmrZfVl+F4=
Received: from PH8PR05CA0012.namprd05.prod.outlook.com (2603:10b6:510:2cc::11)
 by BL3PR12MB6452.namprd12.prod.outlook.com (2603:10b6:208:3bb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 15:49:23 +0000
Received: from BY1PEPF00026965.namprd05.prod.outlook.com
 (2603:10b6:510:2cc:cafe::53) by PH8PR05CA0012.outlook.office365.com
 (2603:10b6:510:2cc::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.6 via Frontend Transport; Sat, 7
 Nov 2026 15:49:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026965.mail.protection.outlook.com (10.167.244.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 15:49:22 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:49:21 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 09:49:18 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <lee@kernel.org>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v5 18/25] soundwire: amd: delay *sdw_ctx publication until after startup succeeds
Date: Sat, 7 Nov 2026 21:15:27 +0530
Message-ID: <20261107154659.3358223-19-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF00026965:EE_|BL3PR12MB6452:EE_
X-MS-Office365-Filtering-Correlation-Id: 35266319-169f-49f2-fddd-08df3ce6b199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|261026140227099003|11063799006|261009223027099003|56012099006|261022105027099003|261021121427099003|261021123027099003|261102130727099003|261102123227099003|261026121527099003|261028144727099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	iz8fwfvuDK9TB4w3rcWvNcPLBXXejBGv062zJjtEIJ05SRseu4EDutTJCT5vSH0XhigqqKWO7C0A7l4LIiq3n7REboeza1OdB87o0Iv4TwyrCdr6jouENsaIT7JXGNZtSjP+MfwkROy3yAtY3mtwvAqmQnhh3l2mct72Z98CqoKRJItj83HitgADedLuhXQRo0s16K3HY3MzQdyaRsO/WxLWiShD9/oQXhg3qqyKHlX4TK5Fw7cH9kmCOQOz35nn97ejYHgJE7ttZGbQ0MSI5LvQTR5Y4ssFcvyeIsEIih+PZcYzINb+GgsHiTKAK7hax3HRM+GeD0sg6KRvPaRnkdbZkWBGOtWiHQwcFsKfsCdHQOsL0RfIeY2T+2s8wPmPGS9AIJGtiWd2kOd1FNTsJxstLMG7AeMWz3u9WMH4PiseRNGl3U8As71rK9yz7KpA5JEz98GDC0N1IE2zeoN8YbBIc0USnffcXe4gFzrBrktpM9jJf7E2qcGmN9tO1HzuvVETMp7XCTmbqMBPeSQnhRaAkCIs2yPQ8Dr/XHXBck2E9vdMUPN0UURC11HrPKBDB+sj+vzDXz7MYXuOKWRU3CU4wkvp27uM9ViI2CDmwfO02maiyOj0SigKnLw5iPCOQLYP9uyj5WLWr388WfuHDJEEmRinD2IhyhhqarmrbR/whGPLoDYaTmYKhX7Wd968ualPzhNn3pP0+d7ZkJfqzQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(261026140227099003)(11063799006)(261009223027099003)(56012099006)(261022105027099003)(261021121427099003)(261021123027099003)(261102130727099003)(261102123227099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UWw4WwNhCBH7gmW3sQLgK0KL3h5zJu0tESWohcBK5z+w749hbQmD5tckBlhrNGufwqtghiZPmMUaRrnYDpbARJN4tIAYFATW7UCKFEVPmNFcaFWMy93d0ox6KSDlJYF2I7rVsYaMSVIGUygKEoeeSsaqiYNHWITbomJ2mK3ccei3Di1k0R+m0VER9P7uUhXyh0VS5izV31hD+Cq550FWy1dxReOSzB+aK1gf9OnjW7Yzwzm69evxLtz1wP3I9+JiwryZNAOD0mnYbpFNHz9hE4NaST/7bj98m0VapWtrRvSQyNXS1LCXc5v5nD4QG9QbpuiNg6HWl9EjnJIg5BZQXClbTHrUx9GDrV1CHjkzKCNkkzjho3L2YSLEtF/TuSJGUjJFwhLqO1ofaASn2zh7TqJLSUpwcc5pGyLnfisbwx6sgiHSiBhP/GEiSCNBx/lM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 15:49:22.8432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35266319-169f-49f2-fddd-08df3ce6b199
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026965.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6452

sdw_amd_probe() published *sdw_ctx immediately after probe_controller()
returned, before sdw_amd_startup() ran.  Two problems follow from this:

1. If sdw_amd_startup() fails, the error was returned directly, leaving
   *sdw_ctx pointing to an allocated context whose platform devices were
   already registered.  The caller has no way to distinguish this from a
   genuine probe success, so the context and devices leak.

2. A concurrent ACP IRQ handler on another CPU can read the non-NULL
   adata->sdw pointer between the sdw_amd_exit() teardown and the
   *sdw_ctx = NULL assignment, and dereference a freed context.

Fix both by using a local variable for the context, running
sdw_amd_startup() against it, and only writing *sdw_ctx after startup
succeeds.  On failure sdw_amd_exit() is called on the local pointer and
the function returns without touching *sdw_ctx, so callers never observe
a partially-initialised or freed context.

Fixes: ed5e8741b8db ("soundwire: amd: refactor amd soundwire manager device node creation")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_init.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index 032697ea3590..ce40b1e5dbf3 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -176,11 +176,20 @@ static int sdw_amd_startup(struct sdw_amd_ctx *ctx)
 
 int sdw_amd_probe(struct sdw_amd_res *res, struct sdw_amd_ctx **sdw_ctx)
 {
-	*sdw_ctx = sdw_amd_probe_controller(res);
-	if (!*sdw_ctx)
+	struct sdw_amd_ctx *ctx;
+	int ret;
+
+	ctx = sdw_amd_probe_controller(res);
+	if (!ctx)
 		return -ENODEV;
 
-	return sdw_amd_startup(*sdw_ctx);
+	ret = sdw_amd_startup(ctx);
+	if (ret) {
+		sdw_amd_exit(ctx);
+		return ret;
+	}
+	*sdw_ctx = ctx;
+	return 0;
 }
 EXPORT_SYMBOL_NS(sdw_amd_probe, "SOUNDWIRE_AMD_INIT");
 
-- 
2.53.0

