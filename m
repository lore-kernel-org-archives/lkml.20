Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010053.outbound.protection.outlook.com [52.101.85.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C430A3876C3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 18:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372617; cv=fail; b=FIVsdaEL5e6zxZMT7elEGyohT5iUn1jY1CA0DhosanCiNGK0JpX83Ud4bmSrUsv1gXmYwCnF4n+DzHYVOdlG0WGFWLfFfpytRxdUbpdrxZA+PEdkFlMr8njs+JFMT/iOez2MX8swl7LSWcN1ghLeXpsMMZFhxG2gJlX6uSaSg24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372617; c=relaxed/simple;
	bh=bDevJWmJEdK91yqS2dRIuee81fpc5KtVmIhIZ3aY0qI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jzfT+6OSOMVXYBMzgw233B5Gvw57Jc2qK1VHMPVap/dcZYc8aA40Z3XmnXPSPyvrwftZii1EV2x8fkYb5lzQp6ZxTfM6ctKjD2Em8wesmK1gJVIBmU9tTVLK190BbiXBRnXDbYdRiVQaQUuN0pIIsEBXOWb6Uy9VTL+7AeMv1Z8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ZlorMQCQ; arc=fail smtp.client-ip=52.101.85.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ZlorMQCQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V53cR6U/RPSAcLSu4c2Hbaie+aOQriiEB7oZ+FFBF+wPKZYpIvn21X7rBLQCp7dYGXP+hGuFvwChTGgKOwAZL1QS+KDEw+Aux2eVXrVPYOsFSiH+3HGyUAS3JauvfqB4P2do/FK3xYj1ji0wazhMA4Shf12DaQ2KhVbRYSc09vLOEhUyanvlvMYZ75sJebN4IMFWiwnNZO+XNDmQR4g7smqkyzFfUIahK411i9d7xclMwiQ/C9x7KFg4uQ9uGbPWVSAVlCi7E5SLnEI88qV+BQj4Fbd7/lyeelqoWvxOFVTPVcOloKidmUomSt4/dxb/f15lUv+6ekvDJBmiqBdanw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9oR6Wr20QcjjHkj1yftejogZiMvuFwNAS7+sE0geNao=;
 b=XRGzoYRH/Lxk5UGi4/WXF25tXSd2x/4nRZZRgq5GDqEjuyUBMg0S8mKC3HUqDm6lUqyXpVjzEsbcukfGwGlMMPKS21rEmXLVU2eqK9fhNl1rgnzbG0mqnPq5KmdgzgoEM1nSKoqgH7nOhBArjruH8nSry6BQqV1jzR4/lWIVeVfJB4kUSS259LroYlp0Lp3DPsenZz6RdXsQnsj/Kx4IItlTu/0Jb2SSpRLsi63Y3RnZT+iqZM1EIL2yZlxla1yAMtLilsO44a8HMEjv0FUZ9vsyb+fz19Kwd1T+lRsyisVPkJwV/90DmSVBlNNtOBqv7AlelGwh3cSDwbTRLuMsMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9oR6Wr20QcjjHkj1yftejogZiMvuFwNAS7+sE0geNao=;
 b=ZlorMQCQjGvp00kwx5zMZOWzdp4rDNrQNSR5qe4vcPJ2Q0pfofmlng7FbBzNRswFG/AXvo0HZOCdLRw753EWxhcAgqr6vQQ7tLHwxd7cceHC6BQt3VULsSYYiqCm1xKh3IFW6n+tn5xOo+bJyf9Kw2PNYMn3tGm1WAJZP/cWR74=
Received: from MW4PR03CA0019.namprd03.prod.outlook.com (2603:10b6:303:8f::24)
 by LV2PR12MB5823.namprd12.prod.outlook.com (2603:10b6:408:178::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 18:10:09 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:303:8f:cafe::44) by MW4PR03CA0019.outlook.office365.com
 (2603:10b6:303:8f::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 18:10:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 18:10:08 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 13:10:07 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 13:10:07 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 2 Sep 2026 13:10:06 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
	<dri-devel@lists.freedesktop.org>, <mario.limonciello@amd.com>,
	<karol.wachowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
	<max.zhen@amd.com>, <sonal.santan@amd.com>
Subject: [PATCH V1 2/2] accel/amdxdna: Fix potential deadlock in BO open and close callbacks
Date: Wed, 2 Sep 2026 11:09:55 -0700
Message-ID: <20260902180955.3999242-2-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902180955.3999242-1-lizhi.hou@amd.com>
References: <20260902180955.3999242-1-lizhi.hou@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|LV2PR12MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: c562d5dd-509b-4d09-45dc-08df091d6c7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|23010399003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hLgnFiv5xQ1BenjKuw8JH1aPDcWFMxJm5xCNW/q4GYKcUDr56zsS9eKB0scKFn7OWL1c1Iy+2ZSVIt44fnkiYEuWrjZR1GM6aO+ltowNJ/AEXqLp0+eFDCv2NFZQuYTu1QEyMHSo1Pb+vcrPNWM7KuHB4DaRFyDLFAq5Lq5MmBpUvC4hkK4HZ45Pfwr9f15HCMzNWPcREcTeuyBUBtVf85MGf77UjjGPeok6MMKh6eMt7ZU/wt9ns9la9kM1JWWHj8J8yMaIEaZiwQN347/c7A8UoaXDO9HMjHIHPEWaTSp7HfcSGVSVkrv+TplQW+zMgPUY74gi1sZelBrdoalbywLfqzgH6kq0q5cOJgVhBd1omeYI5pK/noiKpWtm1BW0MRx+U5cTfpnNCvaRufMwfDPk8P5q3S/mOepb/vxCu3rvG/CAMzRqACrvAzOAnPCptetYD1o7jv2Qb25GDxQfuragKBulW45yGDnzFgatxYO3a2E+41Fn4n1gVEMOl8rfUow5IulIlyCHGHd/18ptOHTkkffbvgPIokczsWRJWuBWMu6Bh/vn82xMGAJFURXfZYJqk8437qu3+wCMt7R96fpQyQ0SSUyyGZ+DphOwgcK2TGNx26Z/6Uy9rhe9z7FYI2Qal3uW6d235JWYpFnBrLK/Xcbh24IJQSeE11Q3lx0lRQe96k0m6Ev/dsb9o6Tn/2vwqePS3nEIaIYynTsuxg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EKqpDiC4FQiZdt53BcMI346JlCIBXDUKytP47i5c3eUGXdOu9DqkVIguI3Y6orIlesGI7LNkcP7rDPWyxG4gX0W90qxD/xsXKMNusNniadhijYQUGvMVLyf4dUESydrVIQmwzpj2OQDkf+h+aPFkIiaW3zis1S95+dsMa36/zmFf/1ukGWFSOIa7DpQSJUWU614eqQeWVO0l1MpNhprvcow3VliPHwBAVOcWHZJLAyILmnw8llfqYNxTKS+PiILMkse4brkpP49tU34/z/8hpnFaS7SoVS6xzGMf3+VhwsMF0FcPwWiJe1UFvvjUoVKpoS2R/yLUD9iVKI8p2aZVLJden5gs1bQnoXW2dHwp4pC2UVUYuXD50PPLDqieQ4a0uTVFYr2GXl3CNp9hiHkobMZQFPX87qK+W8ItPyDgAdzLw60sB1fx+0NpnRVomzBu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 18:10:08.7489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c562d5dd-509b-4d09-45dc-08df091d6c7d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5823

In amdxdna_gem_obj_open(), abo->lock is held when calling
amdxdna_gem_add_bo_usage(), which then acquires client->mm_lock.

However, the heap update path may acquire these locks in the reverse
order, creating a potential deadlock.

Fix this by saving the client pointer locally before acquiring abo->lock,
and releasing abo->lock before calling amdxdna_gem_add_bo_usage().

Apply the same change to amdxdna_gem_obj_close().

Fixes: 1f513a3ec3a9 ("accel/amdxdna: Add per-process BO memory usage query support")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/amdxdna_gem.c | 34 +++++++++++++++++++----------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
index 1353393194e2..0d165b66c1fc 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.c
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -641,10 +641,8 @@ amdxdna_gem_skip_bo_usage(struct amdxdna_gem_obj *abo)
 }
 
 static void
-amdxdna_gem_add_bo_usage(struct amdxdna_gem_obj *abo)
+amdxdna_gem_add_bo_usage(struct amdxdna_client *client, struct amdxdna_gem_obj *abo)
 {
-	struct amdxdna_client *client = abo->client;
-
 	if (amdxdna_gem_skip_bo_usage(abo))
 		return;
 
@@ -656,10 +654,8 @@ amdxdna_gem_add_bo_usage(struct amdxdna_gem_obj *abo)
 }
 
 static void
-amdxdna_gem_del_bo_usage(struct amdxdna_gem_obj *abo)
+amdxdna_gem_del_bo_usage(struct amdxdna_client *client, struct amdxdna_gem_obj *abo)
 {
-	struct amdxdna_client *client = abo->client;
-
 	if (amdxdna_gem_skip_bo_usage(abo))
 		return;
 
@@ -694,14 +690,20 @@ static int amdxdna_gem_obj_open(struct drm_gem_object *gobj, struct drm_file *fi
 {
 	struct amdxdna_dev *xdna = to_xdna_dev(gobj->dev);
 	struct amdxdna_gem_obj *abo = to_xdna_obj(gobj);
+	struct amdxdna_client *client;
 	int ret;
 
-	guard(mutex)(&abo->lock);
-	if (abo->open_ref > 0 && filp->driver_priv != abo->client)
+	mutex_lock(&abo->lock);
+	if (abo->open_ref > 0 && filp->driver_priv != abo->client) {
+		mutex_unlock(&abo->lock);
 		return -EPERM;
+	}
+
 	abo->open_ref++;
-	if (abo->open_ref > 1)
+	if (abo->open_ref > 1) {
+		mutex_unlock(&abo->lock);
 		return 0;
+	}
 
 	/* Attached to the client when first opened by it. */
 	abo->client = filp->driver_priv;
@@ -712,26 +714,34 @@ static int amdxdna_gem_obj_open(struct drm_gem_object *gobj, struct drm_file *fi
 		if (ret) {
 			abo->open_ref--;
 			abo->client = NULL;
+			mutex_unlock(&abo->lock);
 			return ret;
 		}
 	}
+	client = abo->client;
+	mutex_unlock(&abo->lock);
 
-	amdxdna_gem_add_bo_usage(abo);
+	amdxdna_gem_add_bo_usage(client, abo);
 	return 0;
 }
 
 static void amdxdna_gem_obj_close(struct drm_gem_object *gobj, struct drm_file *filp)
 {
 	struct amdxdna_gem_obj *abo = to_xdna_obj(gobj);
+	struct amdxdna_client *client = NULL;
 
-	guard(mutex)(&abo->lock);
+	mutex_lock(&abo->lock);
 	abo->open_ref--;
 
 	if (abo->open_ref == 0) {
-		amdxdna_gem_del_bo_usage(abo);
 		/* Detach from the client when last closed by it. */
+		client = abo->client;
 		abo->client = NULL;
 	}
+	mutex_unlock(&abo->lock);
+
+	if (client)
+		amdxdna_gem_del_bo_usage(client, abo);
 }
 
 static int amdxdna_gem_obj_vmap(struct drm_gem_object *obj, struct iosys_map *map)
-- 
2.34.1

