Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD02D2931D5
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787792897; cv=none; b=OYK2ZWHpBB5RQwMNgjy4oZNBXxGA6BNfFiZ+BHfsvprVd+joWS5vvM52rEX1OiYXa9WRvCejw6s68ZPw74TuNkFOdbNO4sbxc3e5JpUOfyKYmpOIADibaLN30C8plcuyG7OZjv8cWzjDf+ha52RXNfbLzpQdzTJJE6WEeEZYonA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787792897; c=relaxed/simple;
	bh=p9jb4SZyvm6HR3mUvLv+68wZ1px6C2vDJxzW1XERtP0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Yx94ub1XTkPm27jGD0BLZAZMil2sadxoZUecsJMEy5vX6TN6yqstEEK9OsFMz+daLxyTn/5pO9pcexoyLtWyjAEAiObD074KpzNLZRN812JeALaww2/jIXSLDhnLQWGPHunkn0Bg8//c3udLRnNDMMawr3T7tAbPgsqxsVSSsiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: c40d9438a1b311f19a56ed5b684f684d-20260827
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:96c0cc05-3e7b-441c-b281-c055d2eb5c28,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:6fc1603edcbcc9bb94a20c64b10ec073,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:5,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c40d9438a1b311f19a56ed5b684f684d-20260827
X-User: yanglinlin@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yanglinlin@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 910434891; Thu, 27 Aug 2026 09:08:08 +0800
From: Linlin Yang <yanglinlin@kylinos.cn>
To: harry.wentland@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Linlin Yang <yanglinlin@kylinos.cn>
Subject: [PATCH] drm/amd/display: fix misspelling of "overridden"
Date: Thu, 27 Aug 2026 09:08:02 +0800
Message-Id: <20260827010802.56422-1-yanglinlin@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix misspelling of "overridden" (missing a 'd') in comments.
No functional change.

Signed-off-by: Linlin Yang <yanglinlin@kylinos.cn>
---
 .../gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c    | 2 +-
 .../gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c    | 2 +-
 .../amd/display/dc/link/protocols/link_edp_panel_control.c    | 4 ++--
 drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c               | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
index 33b5136f7ce3..75bdad22bf69 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
@@ -1805,7 +1805,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 	v->DISPCLKWithRamping = 0;
 	v->DISPCLKWithoutRamping = 0;
 	v->GlobalDPPCLK = 0.0;
-	/* DAL custom code: need to update ReturnBW in case min dcfclk is overriden */
+	/* DAL custom code: need to update ReturnBW in case min dcfclk is overridden */
 	v->IdealSDPPortBandwidthPerState[v->VoltageLevel][v->maxMpcComb] = dml_min3(
 			v->ReturnBusWidth * v->DCFCLK,
 			v->DRAMSpeedPerState[v->VoltageLevel] * v->NumberOfChannels * v->DRAMChannelWidth,
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
index 8064c4b3fd25..3f62ea493787 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
@@ -2045,7 +2045,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
 	v->DISPCLKWithRamping = 0;
 	v->DISPCLKWithoutRamping = 0;
 	v->GlobalDPPCLK = 0.0;
-	/* DAL custom code: need to update ReturnBW in case min dcfclk is overriden */
+	/* DAL custom code: need to update ReturnBW in case min dcfclk is overridden */
 	{
 	double IdealFabricAndSDPPortBandwidthPerState = dml_min(
 			v->ReturnBusWidth * v->DCFCLKState[v->VoltageLevel][v->maxMpcComb],
diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
index 16951a9550f2..d3fe6e024891 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
@@ -108,7 +108,7 @@ enum dp_panel_mode dp_get_panel_mode(struct dc_link *link)
 			/* alternate scrambler reset is required for Travis
 			 * for the case when external chip does not
 			 * provide sink device id, alternate scrambler
-			 * scheme will  be overriden later by querying
+			 * scheme will  be overridden later by querying
 			 * Encoder features
 			 */
 			if (strncmp(
@@ -124,7 +124,7 @@ enum dp_panel_mode dp_get_panel_mode(struct dc_link *link)
 			/* alternate scrambler reset is required for NUTMEG
 			 * for the case when external chip does not provide
 			 * sink device id, alternate scrambler scheme will
-			 * be overriden later by querying Encoder feature
+			 * be overridden later by querying Encoder feature
 			 */
 			if (strncmp(link->dpcd_caps.branch_dev_name,
 				DP_VGA_LVDS_CONVERTER_ID_3,
diff --git a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
index 204375f1eff8..587d26c742cd 100644
--- a/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dmub/src/dmub_srv.c
@@ -584,7 +584,7 @@ static bool dmub_srv_hw_setup(struct dmub_srv *dmub, enum dmub_asic asic)
 		return false;
 	}
 
-	/* set default inbox type if not overriden */
+	/* set default inbox type if not overridden */
 	if (dmub->inbox_type == DMUB_CMD_INTERFACE_DEFAULT) {
 		if (default_inbox_type != DMUB_CMD_INTERFACE_DEFAULT) {
 			/* use default inbox type as specified by DCN rev */
-- 
2.25.1

