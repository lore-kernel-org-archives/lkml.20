Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD111439F8F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790142097; cv=none; b=Ethb0jixKnayk9LOVciBXUw/0E8TYDJWBGr/v6R2uiOH/7a4pdjuOP3n5hYw6zaj0Ej7MG6q1ZeD0kKj9s+Gd7vVObaGetUZzxQLj6pc4k9PdoETsGEWFEsUWXXLPfera92kKB6nI5vA7EnH48XpFO8SisUaC3HkumuL1NAI9mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790142097; c=relaxed/simple;
	bh=67CbZqerRkZC4oUP/wtI6pL38KFZkOkXjSO541+1Mfw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A2C7mn1sFroy9N745HRI6eZ5mba9nPED/p/p9R8GrRBtTG6mz67zLFX3mRXgIMdDIl25v23YfIpCsUHrcrxOY2WhLF3F0t/WeXPJFBn173icl4dTd27XVbBULoFK49hQQVkhOqy87FpNZ+mWB4DYIovJoJZ7a1V9Hl4BvS2rkD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 65a597ceb71111f19a56ed5b684f684d-20260923
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:3f46ac60-9fdc-45d0-8356-3c8e26f16035,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:84aacf2d787561eb15f7a6b4d03d5c08,BulkI
	D:nil,BulkQuantity:0,SF:102|123|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 65a597ceb71111f19a56ed5b684f684d-20260923
X-User: yaolu@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yaolu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2037494426; Wed, 23 Sep 2026 13:41:17 +0800
From: yaolu@kylinos.cn
To: kenneth.feng@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: asad.kamal@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Lu Yao <yaolu@kylinos.cn>
Subject: [PATCH] drm/amdgpu/pm/powerplay: factor voltage index bounds check into a macro
Date: Wed, 23 Sep 2026 13:41:11 +0800
Message-Id: <20260923054111.209370-1-yaolu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lu Yao <yaolu@kylinos.cn>

commit 3a8a05477cda ("drm/amdgpu/pm/powerplay: bounds-check voltage index in SMU7 lookup") and
commit 6fa33f594e46 ("drm/amdgpu/pm/powerplay: bounds-check voltage index in Vega10 lookup")
added the same block.

Move the pattern into PP_CHECK_VOLTAGE_INDEX().

Signed-off-by: Lu Yao <yaolu@kylinos.cn>
---
 .../drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c   | 28 +++++----------
 .../drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c | 35 ++++++-------------
 .../gpu/drm/amd/pm/powerplay/inc/pp_debug.h   | 12 +++++++
 3 files changed, 30 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
index bdf1e489369e..aafb52bf94ff 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c
@@ -2216,24 +2216,18 @@ static int smu7_patch_voltage_dependency_tables_with_lookup_table(
 	if (data->vdd_gfx_control == SMU7_VOLTAGE_CONTROL_BY_SVID2) {
 		for (entry_id = 0; entry_id < sclk_table->count; ++entry_id) {
 			voltage_id = sclk_table->entries[entry_id].vddInd;
-			if (voltage_id >= table_info->vddgfx_lookup_table->count) {
-				pr_err("amdgpu: sclk[%u] vddgfx index %u out of bounds (%u)\n",
-				       entry_id, voltage_id,
-				       table_info->vddgfx_lookup_table->count);
+			if (PP_VOLTAGE_INDEX_OOB(table_info->vddgfx_lookup_table, voltage_id,
+						 "sclk[%u] vddgfx", entry_id))
 				return -EINVAL;
-			}
 			sclk_table->entries[entry_id].vddgfx =
 				table_info->vddgfx_lookup_table->entries[voltage_id].us_vdd;
 		}
 	} else {
 		for (entry_id = 0; entry_id < sclk_table->count; ++entry_id) {
 			voltage_id = sclk_table->entries[entry_id].vddInd;
-			if (voltage_id >= table_info->vddc_lookup_table->count) {
-				pr_err("amdgpu: sclk[%u] vddc index %u out of bounds (%u)\n",
-				       entry_id, voltage_id,
-				       table_info->vddc_lookup_table->count);
+			if (PP_VOLTAGE_INDEX_OOB(table_info->vddc_lookup_table, voltage_id,
+						 "sclk[%u] vddc", entry_id))
 				return -EINVAL;
-			}
 			sclk_table->entries[entry_id].vddc =
 				table_info->vddc_lookup_table->entries[voltage_id].us_vdd;
 		}
@@ -2241,24 +2235,18 @@ static int smu7_patch_voltage_dependency_tables_with_lookup_table(
 
 	for (entry_id = 0; entry_id < mclk_table->count; ++entry_id) {
 		voltage_id = mclk_table->entries[entry_id].vddInd;
-		if (voltage_id >= table_info->vddc_lookup_table->count) {
-			pr_err("amdgpu: mclk[%u] vddc index %u out of bounds (%u)\n",
-			       entry_id, voltage_id,
-			       table_info->vddc_lookup_table->count);
+		if (PP_VOLTAGE_INDEX_OOB(table_info->vddc_lookup_table, voltage_id,
+					 "mclk[%u] vddc", entry_id))
 			return -EINVAL;
-		}
 		mclk_table->entries[entry_id].vddc =
 			table_info->vddc_lookup_table->entries[voltage_id].us_vdd;
 	}
 
 	for (entry_id = 0; entry_id < mm_table->count; ++entry_id) {
 		voltage_id = mm_table->entries[entry_id].vddcInd;
-		if (voltage_id >= table_info->vddc_lookup_table->count) {
-			pr_err("amdgpu: mm[%u] vddc index %u out of bounds (%u)\n",
-			       entry_id, voltage_id,
-			       table_info->vddc_lookup_table->count);
+		if (PP_VOLTAGE_INDEX_OOB(table_info->vddc_lookup_table, voltage_id,
+					 "mm[%u] vddc", entry_id))
 			return -EINVAL;
-		}
 		mm_table->entries[entry_id].vddc =
 			table_info->vddc_lookup_table->entries[voltage_id].us_vdd;
 	}
diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
index 05b1e69116fd..96783710afe3 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
@@ -691,12 +691,9 @@ static int vega10_patch_voltage_dependency_tables_with_lookup_table(
 
 		for (entry_id = 0; entry_id < vdt->count; entry_id++) {
 			voltage_id = vdt->entries[entry_id].vddInd;
-			if (voltage_id >= table_info->vddc_lookup_table->count) {
-				pr_err("amdgpu: clk_dep[%u][%u] vddc index %u out of bounds (%u)\n",
-				       i, entry_id, voltage_id,
-				       table_info->vddc_lookup_table->count);
+			if (PP_VOLTAGE_INDEX_OOB(table_info->vddc_lookup_table, voltage_id,
+						 "clk_dep[%u][%u] vddc", i, entry_id))
 				return -EINVAL;
-			}
 			vdt->entries[entry_id].vddc =
 					table_info->vddc_lookup_table->entries[voltage_id].us_vdd;
 		}
@@ -704,44 +701,32 @@ static int vega10_patch_voltage_dependency_tables_with_lookup_table(
 
 	for (entry_id = 0; entry_id < mm_table->count; ++entry_id) {
 		voltage_id = mm_table->entries[entry_id].vddcInd;
-		if (voltage_id >= table_info->vddc_lookup_table->count) {
-			pr_err("amdgpu: mm[%u] vddc index %u out of bounds (%u)\n",
-			       entry_id, voltage_id,
-			       table_info->vddc_lookup_table->count);
+		if (PP_VOLTAGE_INDEX_OOB(table_info->vddc_lookup_table, voltage_id,
+					 "mm[%u] vddc", entry_id))
 			return -EINVAL;
-		}
 		mm_table->entries[entry_id].vddc =
 			table_info->vddc_lookup_table->entries[voltage_id].us_vdd;
 	}
 
 	for (entry_id = 0; entry_id < mclk_table->count; ++entry_id) {
 		voltage_id = mclk_table->entries[entry_id].vddInd;
-		if (voltage_id >= table_info->vddc_lookup_table->count) {
-			pr_err("amdgpu: mclk[%u] vddc index %u out of bounds (%u)\n",
-			       entry_id, voltage_id,
-			       table_info->vddc_lookup_table->count);
+		if (PP_VOLTAGE_INDEX_OOB(table_info->vddc_lookup_table, voltage_id,
+					 "mclk[%u] vddc", entry_id))
 			return -EINVAL;
-		}
 		mclk_table->entries[entry_id].vddc =
 				table_info->vddc_lookup_table->entries[voltage_id].us_vdd;
 
 		voltage_id = mclk_table->entries[entry_id].vddciInd;
-		if (voltage_id >= table_info->vddci_lookup_table->count) {
-			pr_err("amdgpu: mclk[%u] vddci index %u out of bounds (%u)\n",
-			       entry_id, voltage_id,
-			       table_info->vddci_lookup_table->count);
+		if (PP_VOLTAGE_INDEX_OOB(table_info->vddci_lookup_table, voltage_id,
+					 "mclk[%u] vddci", entry_id))
 			return -EINVAL;
-		}
 		mclk_table->entries[entry_id].vddci =
 				table_info->vddci_lookup_table->entries[voltage_id].us_vdd;
 
 		voltage_id = mclk_table->entries[entry_id].mvddInd;
-		if (voltage_id >= table_info->vddmem_lookup_table->count) {
-			pr_err("amdgpu: mclk[%u] vddmem index %u out of bounds (%u)\n",
-			       entry_id, voltage_id,
-			       table_info->vddmem_lookup_table->count);
+		if (PP_VOLTAGE_INDEX_OOB(table_info->vddmem_lookup_table, voltage_id,
+					 "mclk[%u] vddmem", entry_id))
 			return -EINVAL;
-		}
 		mclk_table->entries[entry_id].mvdd =
 				table_info->vddmem_lookup_table->entries[voltage_id].us_vdd;
 	}
diff --git a/drivers/gpu/drm/amd/pm/powerplay/inc/pp_debug.h b/drivers/gpu/drm/amd/pm/powerplay/inc/pp_debug.h
index cea65093b6ad..efe5f6df8c9b 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/inc/pp_debug.h
+++ b/drivers/gpu/drm/amd/pm/powerplay/inc/pp_debug.h
@@ -54,6 +54,18 @@
 		pr_debug(fmt, ##__VA_ARGS__); \
 	} while (0)
 
+/* Reports and returns true when index does not fit into the lookup table. */
+#define PP_VOLTAGE_INDEX_OOB(lookup_table, index, fmt, ...)		\
+({									\
+	typeof(lookup_table) __lookup = (lookup_table);			\
+	typeof(index) __idx = (index);					\
+	bool __oob = __idx >= __lookup->count;				\
+									\
+	if (__oob)							\
+		pr_err(fmt " index %u out of bounds (%u)\n",		\
+		       ##__VA_ARGS__, __idx, __lookup->count);		\
+	__oob;								\
+})
 
 #define GET_FLEXIBLE_ARRAY_MEMBER_ADDR(type, member, ptr, n)	\
 	(type *)((char *)&(ptr)->member + (sizeof(type) * (n)))
-- 
2.25.1

