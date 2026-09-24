Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012065.outbound.protection.outlook.com [40.107.200.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDFB5477E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258807; cv=fail; b=AXarCPC1iutTW3Oyz0LyBAEQNsD9rZ58U68yvUYl77VhROWn95nMThZOOUjr1XZjQgEn4nSun0DjUfKL56rvcEvFVKA/OeOdFqOnp6N5RA0byLe8RxLK2BtRLLBe9eN3qyG4ajvUFOXcsAcorJd/dA0Dgong6IhnHGVYL5wYOZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258807; c=relaxed/simple;
	bh=OK4KFq9S1tokjfJoaHfPZZVSwgKkSK8lZLGIds+XA8A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D9vGpI8hBbKN3Sub+yKiJfGbtvAprIil4kr2B31yKzKXFxa5DDNMAS5ApJcaOzNQ19vOCROnYzTZxJox1MkrmhYftd03u5xCg4l+6AA8d0zCOMG9bNOmYsv0Cpk03IEG/PifH2qqub6BiMptJQydm5smPJLQwCkXbV4nvJM10XI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CWrZ80iZ; arc=fail smtp.client-ip=40.107.200.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CWrZ80iZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jw5Hlgi3lMYUA0pD4XtcSfOxWyQi8r90XkTU5bpsgtVb+N+oO9sW74ov6TA9dB/gXvlql81Z9Pkx9nEnnbEM4p+6A8YLZPBA23gTvlg6ncVOlixUomoh34XJLYDrx6kUIMEFt5TOpPALFOHiw/52fPRhVf459dB/WOZLZ/BlfaZshCXqmVWykvjJpmDSfwiGmpVHxrIvN0K9PU51YbyV+NQTdjYpzlt+AFulovQWyEZdYgLoHAOYsUNvpom3v8G3zsK69xBANsPlGwVBvqxwjIKhHPgibsPDF/SLAcn0PVB+lsnf1TxJlR5QyDJGsQm7ocPwovnH3sdA2JB46V5xfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVZ7ZMac/Ja63Pz8kzNrZwtUZZAGUooo35qJFP5wzWk=;
 b=rQmiIelQWI8ddvoGeLZ2HZ6cpZ/5C+DS1c4guW2YHbgLQatJEOS8c/JycPr+x6M9Vcdra2/7vAbf4047fwxZqo3pT35qdJ2zVD3BBp7UrYZuF6cx4U5i9rRmzzV37bSUCrSghvSx3LGm5EML+2iXUreOGYeCPEMoh7E/wvkQTzSJzjlcYr9yYylrCsbW7kMrDMRCEuF5bceW1C5i4+rIU+IY1icWAk2TcoTxgQ/UV1NAZlabIYoG3DJY3u16ONGGoreyFdL7SJpKDJruR/IqtSIvMJNwFDWdSmYC6gfsSqGg358A8ykIuR9JFb0MCL7osrWOTqfMMBa04+bXB0ZPlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVZ7ZMac/Ja63Pz8kzNrZwtUZZAGUooo35qJFP5wzWk=;
 b=CWrZ80iZ6vc+HhpiRQv8LoIdzzB6zQEtRJf5WpVdQWcIqM/M9dSS5USFX7YXBQvQgeDqSueSWdya3K83WaVUog0vpFbhEw4sJXBURmAffybgGmdsva3AITaluqiWZ8rWm7TkriGBaCaalbJAhXcw6VXm6J2xbA1RVZrvBgoGY9o=
Received: from MN0P222CA0029.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::34)
 by LV2PR12MB966079.namprd12.prod.outlook.com (2603:10b6:408:3a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 14:06:43 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:531:cafe::9b) by MN0P222CA0029.outlook.office365.com
 (2603:10b6:208:531::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Thu,
 24 Sep 2026 14:06:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 14:06:43 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 24 Sep 2026 09:06:39 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Pierre-Eric
 Pelloux-Prayer" <pierre-eric.pelloux-prayer@amd.com>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/amdgpu: implement workaround for sdma dcc corruption
Date: Thu, 24 Sep 2026 16:06:16 +0200
Message-ID: <20260924140616.2647-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|LV2PR12MB966079:EE_
X-MS-Office365-Filtering-Correlation-Id: cba0b78e-2daa-41a0-e529-08df1a45104a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	X5eLabG11oZEKyQVpuclcYMzr4lQDXYndtBz+bNsBAgQhd+AYt2jHcEdoVPr3h8RLt7pWTAQk4CJEyFkeGrWKliVVASwSWlQDeGbI4AZz2V0jVtivRYxl5sW7CR6A7YbMFDDg4WkJVd928Pc2lqSL/sku1SvN7FQiR6+Pq8CjvXH8lYpo/7zOkEJkxwEPp9r6iP0ftT+5t8aXHC9mmQBrdCKhReBWw/BeQvh9X55I4GVmJg3623hp9zMF6fU15cp6iVqEBaFdXej/yPh9OzBMyWd4++of28PBy3j92li3Af4Q+24SOzHrGFYaOnJuwL3G898C768HILYyTh9XPAZcftI1lugs78nez4xD5AbXSXQecqpI1zdPB+fT30j7UQWQFy1MNByu+DVE4ovrFUvA9OmwcSycGZYtK3SiMm1TdFJOATAClfg7MDubvCI+0Vs/f+vgK1EJHZlqPUfNzUZGe15JxYBBklB3e0HWnLLtEIZonryzrH2tXNiv0dwDyScmKhb/P9KW5m37yZHPHW90NdN0XpR2w6k3FbjXlmPnuif1edMruG0kX0wfGWr/OtCjTz5tv4x+cMXPNyT2mieNY5JfShF5KcXXoG42XKJjq0Ios5LNQFNIsW7bjtxXRlPlss0G7+NqyueST6lRcZCxg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R2O4l+gz9AIievSFt/q45yijXerj6U80lmIku3ul7L5nsjb/+DHrBWjH3nLHPzm7ZhX6Q77X2vCLL5fvVVy29UUNDbViuOyMnX4qTXoZnPLxKQKWFRpdsKEw5IV5zoEJ+61ksQNDcHiJEfAVoKhpt63qibpiQC/CuyGyKu05sah+FWFnWGv6mQ260Iigv2f68stAIWUU1/hps/8lxWtO+OvV5T8mD63ormvffLAjfwwZbIGRfUGT+/2HhBOgaN5/lzQ7Y7fRm8ySRUnfeNp/8cf+ujGq24ERCqUtvQmAdcipZLTiGdgiAmK7lYAb8//tI50nPRMMo9IAbNJ2Rc3Y80+QbE/LfQIfcb9iuSWjYVLKHweY4dQRavswT53sjgn29YgtdlFibYBkA71xf1z+98vqbygS1chptCXXSI3ZZfgkLYA+mVkvtMSEdvH5lWPp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 14:06:43.7868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cba0b78e-2daa-41a0-e529-08df1a45104a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB966079

For unknown reasons, on gfx12 using multiple entities can causes
random corruption of BOs with DCC.
This workaround seems to prevent the issue until the root cause
is understood and fixed.

Link: https://gitlab.freedesktop.org/drm/amd/-/work_items/5663
Fixes: 3a6f6eeb3db5 ("drm/amdgpu: give ttm entities access to all the sdma scheds")
Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 3d620ec2937f..e9de5c4b7f63 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2367,7 +2367,7 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
 void amdgpu_ttm_enable_buffer_funcs(struct amdgpu_device *adev)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
-	u32 num_clear_entities, num_move_entities;
+	u32 num_clear_entities, num_move_entities, sdma_ip_version;
 	int r, i, j;
 
 	if (!adev->mman.initialized || amdgpu_in_reset(adev) ||
@@ -2392,6 +2392,12 @@ void amdgpu_ttm_enable_buffer_funcs(struct amdgpu_device *adev)
 
 	num_clear_entities = MIN(adev->mman.num_buffer_funcs_scheds, TTM_NUM_MOVE_FENCES);
 	num_move_entities = MIN(adev->mman.num_buffer_funcs_scheds, TTM_NUM_MOVE_FENCES);
+        /* TODO: workaround for DCC corruption when moving BOs from multiple queues at
+         * the same time: use a single queue until the root cause is identified and fixed.
+         */
+	sdma_ip_version = amdgpu_ip_version(adev, SDMA0_HWIP, 0);
+	if (sdma_ip_version == IP_VERSION(7, 0, 0) || sdma_ip_version == IP_VERSION(7, 0, 1))
+		num_move_entities = 1;
 
 	adev->mman.clear_entities = kcalloc(num_clear_entities,
 						sizeof(struct amdgpu_ttm_buffer_entity),
-- 
2.43.0

