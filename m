Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011035.outbound.protection.outlook.com [52.101.57.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249053FB07B;
	Tue, 13 Oct 2026 10:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885873; cv=fail; b=XqRmKagT5xe7aJwVw13MddqQanHyM4Mk96v9BVj049F/JbLEBXSZ0s+N46mT286eQsPAXlY8cqNZxIXbUKCbgF0PcOmHTkdRGIxnGrmjApl2IGfmfa1Yf6ggB941OB8kP5Z202ZTX0dfzS65q0zvJ2wONtnhb8gms7EqNC2U8vQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885873; c=relaxed/simple;
	bh=YSSQrdV7BmQKdSoU1T4QBn+YPn1TlUiP+1ferx3ULUI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I13gTpmui9DGD3wW73N5sodQABqy8ZDFngmOzf59S4Pk25XQrdWdBZ+2L1qm1u/rjneJEmEIdJXWIe3hOnJy4AgdMHxMQf4uDJKScGiyFPRRMG7w4RyH+EPntHBnmmFHfyfcXBD8EOFvUhFQxikR5hIur22QPT8R0UOI4CLYa9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XTeiqnZw; arc=fail smtp.client-ip=52.101.57.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XTeiqnZw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEEyCo6RW2qWtlfJrDw9W/Nd9Q1koYoxXsMCwp2d7tG2uIr6MrGqVBuc2NxZF8WWhsIGKWIUUbVhq4eecxR/ByWTDZnKoahpTNvJn2621mXUrQpDr/jxgk2OYdFvQOIofGEzlW3eYg+LK78IvgcyVr/Mls1aPzygAeFXQXK9zzJao69pjpl+fRXhWP7qClU4OZ4g+Tg+eQrt4HMxQrNGmObpjjrSU7GFuVCynT7lovNjSfkiorPvPUa8GpLlj2Y3+j5K4SCZtAfLWUKLy6qBb+u3tGWgIWT5g6DX8vSJGSlCU9JtOFB60dSy+UXth2NtprRZ8jEqNvEYaEyS4yUMUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMFjFzdLLdPA59SJMKW7OUIjFs65o69E4r9JeLM+4tI=;
 b=dzmKWau9hLDkKVW05wKyGZnKITPLaKSIKG4rsqrJ+JI/wxH1TLJacDSF/DerN+BTocG0hgStzARNvogKt7HYmzNUnB1xVTOGO39Wp4ZazeMLniYImb4hz+EGcSZjl+/0MwcnwOfPg5nC8+kzNsYWgLxF3KDhdZpXBdDkUrBY4Yn/65FvPszBF0ApFR7vYh4dB8mgfkUC3/5hkyNFJ0l6amdtjaJwePgRV3c8pfN3cPQ+Hk1CdwQcNqxeEkAUtmRXYaK2vBbOm7oMzBuk3OiWSDkYce+0Dsre+4AEQq6utkYkm+VEDn7xlPuIrknUpMz6niRSJLVx7c6DNQiklFmOAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMFjFzdLLdPA59SJMKW7OUIjFs65o69E4r9JeLM+4tI=;
 b=XTeiqnZw1xxzWOHAERhjbeUy3z6QhkLjZZM8UeuzmjDI35zUTFbSPIsxeCnBKZpqjMIrIy4JrwvpnMM3bIEQnqGYulg7fy2myOxp0XV7VRnw2fGEvlzuh9PgxrlVA/gTf4wVLcAaG9EPDgJ7uAU4lZziwyOkB4Dzb2mWogUtvSM=
Received: from BY1P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::16)
 by CY3PR12MB9701.namprd12.prod.outlook.com (2603:10b6:930:103::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 10:04:26 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::4a) by BY1P220CA0021.outlook.office365.com
 (2603:10b6:a03:5c3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Tue, 13
 Oct 2026 10:04:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 10:04:25 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 05:04:14 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 05:04:10 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Tue, 13 Oct 2026 05:04:06 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<Vijendar.Mukunda@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH V2 3/9] soundwire: amd: allocate sdw_amd_ctx pdev array dynamically
Date: Tue, 13 Oct 2026 15:28:49 +0530
Message-ID: <20261013100306.2921771-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261013100306.2921771-1-Vijendar.Mukunda@amd.com>
References: <20261013100306.2921771-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|CY3PR12MB9701:EE_
X-MS-Office365-Filtering-Correlation-Id: cac7cca9-4900-44fb-6c55-08df29115cf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5jaR5xoHf8XuuYtZB8Gn/kHTra8/WJgwLpqpcC5NpTJph1ty+78PmK7TidkHFBxyApJADVEglo47I3K7+46mXesoKNC8/iHvL/aBrfeRhqrb/+YvciLTk6sNuzTVLPK8z0ucULQgomziTWagcBI937mK+GX7oh/jKTrxgHO5pgXfQ2OtXRpvNXFeFopN6T/g20a3ZimB94bQURd6EJJ1LcBtb/IQWkhfHDK5W54QpFHjwhfEYuwnYBiFQn6TZqTOi1lNUKIPCHz03Za9qfwARwVTvQwp440b/R6h715A6+/r2bAQIeh4bsX7sKHGNmMcrfieUbsZbmCwi4M5+wFcq5C+MOLHgHorUeNB2KpA8VsbniOz0XDjw0217+EfVP9qzXob510Visw2pSFgpx7IPXKEPwMrjtmcFm/Mtn7Zq6i5JkAGKs4Ht9EaPHvpc3SN0YnRXHKRC/UhbyrjQBjq+e67kXDypjxAnn5puBhsbmyO4lbHPEr3G6o4nU76R0yYsbE2e25pCDsW13SR+LydiyOq/ssH5rIACN6CQByM49qPl/2rfeQdMxswyLtOPftJ3PCV/wuKbkAZUafX+12oH9kMsGjg6nC8AIYFDyvGQUn7759P56sfPx8pJj3DccDh1OiDKFS68R49YcQCoc6ZWkt6JuUcrqx/C+Dt+VYGJhrkotN9V2pjKJApCzST92d4IAiZvERP6Vlv2MnGFzp1kA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aaDRk1Ob0pvDwDRTKPfJVaj+r3IPtJcQb0J8Csww+gG86h6pj53nFB6FAw4bV3vJe7AwqOg4VY4DE6QLHGqtStJB1PwUHLj7jY5T8126YmSvyZqmGn7degRFF2JzwyMAYcWvCMzYusCkgG9JZe0uJRbKwgQQ4Aee0QprWpw4LjPVGpe1VBBMJ2mJ0Epq54vkrDVFexqLC0k1TARyXm2dgBqRPvPSoVQXsXgPLixxzJox5Bu5p70vk8knAeQKATgxhR2XpNsWRaeHOKMnQ3uHwxtMN+eCLfPQpmfSTXbkMohjRALsCdY3lEVjkJtLPQu7TCM6ZGsWP21qodEaPb5pA2GjLb9xD2MWGLvtlqrZRqRTz1N4xqZWNRe4M1Cr2NAPcboLtbROSVhDG6iFGJYN7FkQNZ/PlVGh1opNVL7Q/23ArgB2kNthDohjPD+cFa6P
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 10:04:25.9583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cac7cca9-4900-44fb-6c55-08df29115cf4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9701

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

