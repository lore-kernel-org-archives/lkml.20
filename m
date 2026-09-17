Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012000.outbound.protection.outlook.com [52.101.48.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFB04A2A54;
	Thu, 17 Sep 2026 09:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789635943; cv=fail; b=ubSF/Uprz5/514MWSNkzRhbjLZSBkA+K6JfZQ1p18xIxGqZ5i7bMrB2Dm8B1HRF1u1yCe7R3M7AaeaqP+dH/iIX0XMsCtPN3us/XpEdes9mSO8FYNe/NvpJgE+yl3R0fqzzjxVo4rixmdJzP+dVDP9Q6yBav3q7nf2fDKUYoRcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789635943; c=relaxed/simple;
	bh=YSSQrdV7BmQKdSoU1T4QBn+YPn1TlUiP+1ferx3ULUI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PDAuqolDImZng3dspN3tzWCQV8xCCivuJUFdG8uN20PbNDxU5vN89R+1kppaQhQ7rRPOjDnezDuN7Z0NkKJPt8rdTY5ccILncQ+yJ/2TQt5NIb7VZpobanKgabV8afsRy4oFkHMzGOPBCrHFDXwDhIBW7p5gDPibM7zN+SLqTk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HhoZuD0B; arc=fail smtp.client-ip=52.101.48.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HhoZuD0B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jbtDg/HFSPshBeR2LsNA9nZS1mA2l2oBFkq82oGD31vcMYCQxjNcqt698/7KOEAaadlc5ysPhNO5sNW0rlqoeQnjX38OwJBPsQLQkbTJdJPbeDAVl+2PrrYzxRFytUh0RfoJ/JqSwLUvsHpol/7Ve2ahvqinyGRyu+koT5+kXYIp6GO1sa9h92PAwHxz4RTWQXR8t+eV6ZYWJRb9mL8Gk0AM5RiYiXUH0l53Dfxw4BiFu6CqQbuuyy7mcAL4EoPrXpW67rIOdCJjb9vK7jaCXlTcIy68Ex9o+39hgE/IiGjQ2d7YBR51xVp4/5RLsJW6YEcRwepLLy20mrQyh1pZMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMFjFzdLLdPA59SJMKW7OUIjFs65o69E4r9JeLM+4tI=;
 b=pPxSYSzOQ3QhhCOWe03tzOdnOmCG9jQLPcqPitd52ouoRPkgnOkDFEhlZiZTQLE3oiC1Ps/Vpfi/foIDlmk3zJjQ3urzzQilcsx6oy6gYOYsLi3HqcooPuF6eNQc+0SWrcLanj9aPvHslG3WlOKZcmsqoUGNyMmQ28XPwW7uJbmNP3n4dv1KaqTnb7gTDZssDm0qjsITGFwphoYh6IEovBsbBFkvN9GZUcoUkSdSD8GrZzpF1NnsPkzYPLRj3WnMaSXTtsP7L/qx6bNapMHxfjUDM6rGIXAz4JaiSBZ4KOzEgch5W88IZlMz6Kq0Pc1QcwgYniofQ9DRtZSNe8a/ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMFjFzdLLdPA59SJMKW7OUIjFs65o69E4r9JeLM+4tI=;
 b=HhoZuD0BeMYPwVtc1mEZ3C/AnV8MxykMpCm4VYOq1MKdZu3GmxKQpnSk9dAUAzVzELWiE6OAnAJIYjjux4uZ3I4fCklgu8Q5oNnq4rvsvTFkRDH0TJiPdcKkvTPkq2oc6hXL24aXqmKGNAf0xjGh7HNrW11CN/JRdUBiyg0q9fc=
Received: from SJ2PR07CA0010.namprd07.prod.outlook.com (2603:10b6:a03:505::27)
 by DM3PR12MB9434.namprd12.prod.outlook.com (2603:10b6:0:4b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 09:05:38 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::93) by SJ2PR07CA0010.outlook.office365.com
 (2603:10b6:a03:505::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Thu,
 17 Sep 2026 09:05:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 09:05:38 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 04:05:30 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49
 via Frontend Transport; Thu, 17 Sep 2026 04:05:27 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 3/9] soundwire: amd: allocate sdw_amd_ctx pdev array dynamically
Date: Thu, 17 Sep 2026 14:32:51 +0530
Message-ID: <20260917090407.3828816-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260917090407.3828816-1-Vijendar.Mukunda@amd.com>
References: <20260917090407.3828816-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|DM3PR12MB9434:EE_
X-MS-Office365-Filtering-Correlation-Id: c6227c23-2065-44ec-7f1e-08df149ad7af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|22082099003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	O0gPQQZGury5r58DvgEBsAQxZcpQMGX4AF6LDBbjF+sElnaSuIXztZhh092blD425+OsGycnG1I3nNWUgg9mQGiwRkyn9EGnpSCiILIg4B1pDfALml6lgtx3sdmd6GJBEePk0MBu5xz0Go7/FKr2YSxxKfNiO/Ihxs75Urmcnat455naypJFj0smqUkX3DtIEQbFrUAxAgcAVkyBfikxppotUAZ34Itye4bZ/NZxZV8cFWQExOS4h4IKu06014BIamOyr4aGH0DVIsB2uh+ZK4rD9ESMMRXpnaP17K6MH5iuTSppejqcGTtEeIK2O8wneu7x8Pd9JbK5uX314L8W2dA73CimYoWDY+mWNhSchN91NKpWO9m0eEoXU64YR0Vgjg+VMN9/Ih442TpR08h6BQ2Je8ZYm+qfoHiwQP7BGfDfzfX+YV4x4kMP43EY2uUXrz3TVW0mgl0WSjrBbkEvbLASBgu9gphpXzu9OKe5zaYr//6XDg7EWe45uahQdCV4k1Op8fzeyj4idVqYsAlZH1hQMa4MhsYv+KlwhZBsf3osQ73q9mDUSCwd+upBrS+SP/MEDe0b8QmN02zWBo3oFyLzgR1arUMCKU+yeyo7iVCXhnBGqxjGCmFNz6GvPKBCiv/Rfu4fD4v0FZIzF65YQ+wW4RLBPpNGY5mZOXgvnr2iSTAP3lGB+t3+NivYP+q6xTWaKs6dUFAjaI+44u08yg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(22082099003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	koeA7a0sNtCoNBix20hhzNkHS0kDnxW78BmR2syVZdCBp5p50txvm7UToxjX6wEH/WY4kHcq6al1I6jluP1HV9xdjTL5+noQO3QGeVRtboxCdOl5+57MoKQGaeMgevavWUDbIznbbg7PfySefMot2KzLoZEV6KXn0zeu1vjmJbh8Jqw4J0Ul45c1pv2RqnyAXwHeltVIyovzV5J7I+VCLHFrL50fu7y+R5ZNdnWMBBtb70rr8guGabSWhvKGeZgQeNy6FI1BINlhSRZerZvsteXxk/WwTUkF2speE3NxAdiBOHaJNUnBcAfVHPtaDMXj3fVAyN+ilALPokR9a5QECbPp0R+h8WlH4E6rZr+m4tx2ocCSMmPIg3QgZTFzcEl9OMj0a4bci0kfQczHKcov+2TxnDxwDZgSRdzP0/fxF8xz73GMgnpLZcu4XFZ0PcSi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 09:05:38.5374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6227c23-2065-44ec-7f1e-08df149ad7af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9434

Replace the fixed-size pdev[AMD_ACP63_SDW_MAX_MANAGER_COUNT] member of
struct sdw_amd_ctx with a dynamically allocated pointer array. The array
is sized by max_manager_count via kcalloc() in sdw_amd_probe_controller()
and freed on all error paths and in sdw_amd_cleanup().

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_init.c      | 12 ++++++++++++
 include/linux/soundwire/sdw_amd.h |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index 15d117172bdb..94d766b3f8af 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -62,6 +62,7 @@ static int sdw_amd_cleanup(struct sdw_amd_ctx *ctx)
 			continue;
 		platform_device_unregister(ctx->pdev[i]);
 	}
+	kfree(ctx->pdev);
 
 	return 0;
 }
@@ -116,8 +117,16 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 
 	ctx->count = count;
 	ctx->link_mask = res->link_mask;
+
+	ctx->pdev = kcalloc(max_manager_count, sizeof(*ctx->pdev), GFP_KERNEL);
+	if (!ctx->pdev) {
+		kfree(ctx);
+		return NULL;
+	}
+
 	struct resource *sdw_res __free(kfree) = kzalloc_obj(*sdw_res);
 	if (!sdw_res) {
+		kfree(ctx->pdev);
 		kfree(ctx);
 		return NULL;
 	}
@@ -127,6 +136,7 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 
 	sdw_pdata = kcalloc(max_manager_count, sizeof(*sdw_pdata), GFP_KERNEL);
 	if (!sdw_pdata) {
+		kfree(ctx->pdev);
 		kfree(ctx);
 		return NULL;
 	}
@@ -134,6 +144,7 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 	pdevinfo = kcalloc(max_manager_count, sizeof(*pdevinfo), GFP_KERNEL);
 	if (!pdevinfo) {
 		kfree(sdw_pdata);
+		kfree(ctx->pdev);
 		kfree(ctx);
 		return NULL;
 	}
@@ -171,6 +182,7 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 
 	kfree(pdevinfo);
 	kfree(sdw_pdata);
+	kfree(ctx->pdev);
 	kfree(ctx);
 	return NULL;
 }
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index 40ba84c3b2cc..476de2c30389 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -139,7 +139,7 @@ struct sdw_amd_acpi_info {
 struct sdw_amd_ctx {
 	int count;
 	u32 link_mask;
-	struct platform_device *pdev[AMD_ACP63_SDW_MAX_MANAGER_COUNT];
+	struct platform_device **pdev;
 	struct sdw_peripherals *peripherals;
 };
 
-- 
2.48.1

