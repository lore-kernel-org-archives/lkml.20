Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6831F31F9BD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 05:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788846734; cv=none; b=kiIgGlzAJvrH5j9kUR3SpzonIdkaYifY5HMR2Ugxddg/Th7wxm8pZmkOzjt3lnBR+7Otdgq9tIy66tpd/pE94f5AJJGtNE+KC3u2tHbPrC14k4UA/mywy2oPjb6AYBV/GM3UjRaN6MARBGbJ2uSd7aTjDQV62ged6aCz03rnolA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788846734; c=relaxed/simple;
	bh=wU6FiEko+twMFcXhEpEPaLFQs2Tga4HvBXaTg8TNw+M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GWoqDoyujvVI9io/0SyEM5WatFef218tACD0syqsR59melJXyBjNOlSaAKNbCJ1fabdkiOJXMDRZW1/EanvIYVMeqCDVUPt5LB4ySpPghGzVvOZRAD6hEJC9dTdq5WbIwu2HEy9DDMuYFm3v31KxYV7d2rWzHLloN5KxDyEkVnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 6d6cb81cab4911f19a56ed5b684f684d-20260908
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:982b90af-3da6-441e-a97d-6da7fe760f5e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:2d98655e2908a986242d351f33c91fcd,BulkI
	D:nil,BulkQuantity:0,SF:102|123|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6d6cb81cab4911f19a56ed5b684f684d-20260908
X-User: yaolu@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yaolu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1027593847; Tue, 08 Sep 2026 13:52:08 +0800
From: yaolu@kylinos.cn
To: austin.zheng@amd.com,
	jun.lei@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: ivan.lipski@amd.com,
	Roman.Li@amd.com,
	aurabindo.pillai@amd.com,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Lu Yao <yaolu@kylinos.cn>
Subject: [PATCH] drm/amd/display: Fix wrong plane index in dcn6 writeback latency loop
Date: Tue,  8 Sep 2026 13:52:02 +0800
Message-Id: <20260908055202.141884-1-yaolu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lu Yao <yaolu@kylinos.cn>

Use plane_descriptors[k] for the loop bound, matching the loop body.

Fixes: 7f7d7ea1fa51 ("drm/amd/display: Add new sources for DCN6")
Signed-off-by: Lu Yao <yaolu@kylinos.cn>
---
 .../dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c
index a4e2f8604650..60e873edf13c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn6_calcs_dchub.c
@@ -1252,7 +1252,7 @@ void dcn6_calculate_watermarks_and_dram_speed_change_support(
 			DML_LOG_VERBOSE("DML::%s: k=%u, VActiveLatencyHidingUs = %f\n", __func__, k, p->VActiveLatencyHidingUs[k]);
 		}
 
-		for (unsigned int j = 0; j < p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[j].stream_index].writeback.active_writebacks_per_stream; ++j) {
+		for (unsigned int j = 0; j < p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].writeback.active_writebacks_per_stream; ++j) {
 			double byte_per_pixel_luma_in_buffer = 1.0;
 			double buffer_for_luma = (double)p->WritebackInterfaceBufferSize * 1024.0 / 2.0;
 			if (p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[j].pixel_format == dml2_444_64) {
-- 
2.25.1

