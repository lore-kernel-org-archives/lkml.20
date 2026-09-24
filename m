Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68904E01E4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284464; cv=none; b=vB0lvMN6Xq7R26qK+iElcoE81m1A8dJZmnzsqBZyzc9/CzV1HSuXuYFR3eenLsSqo6caDQDBpIwnuySEqaWpeS1ez19SzuQHL0V/fneJanvLccterFDnM72dRn0Qah+KoJ33pKi7FRClXxkxbPblfWdxICqpcEGnaSur7TrNfjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284464; c=relaxed/simple;
	bh=/xMdARFdv+i7yPr44eAzLUIFGnVxEOHXlBh6UCOZ3F4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IKoq0N0Dt1T5aRt2oU1QBfHWK3ljlKvIdoYx6w2XqmOg5I9e82vida3IZH5cAzcS3RbdMX7NO+Me0p9ly/NrqYhoRVCKXeyqiRym3LUCT9vfnYZBoYx+eGg+yWCrxLZXNqUQKhGQhKgSQTyZ0yFhRagv7Il9Sp1pJhTm0rsv/xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=XcwxXNo1; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="XcwxXNo1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=B3SL+RwYfETd680bdp3EfbyiaDsc5lg1fcQcX5CbXK8=; b=
	XcwxXNo1K6yHgvFm+dS8pSIwTQqhQl4z8MViDd2520DQXDYt5tii+Y4qdpT1sYqdWdk8rwAGP2hg5
	Qc/e5SJlWqmae1aiK/eW3y1US9rDtKmVUJGu/eXvnRulg9lxv+i2wakEqJulkPgWxpR9JpVjvBEEJ
	267GoNjAR4uuW0Vr6PlJJmONV4l+e5I0HJl4QakX3psg+AjhU/y66smamaN1kEv0CG+qzN1xfzFnD
	qygPhuSEjdV4Jr2heCz6tZQfGzpyid/frgErrt3+PxYhHJ4mbRla/ONJuBB7AcnpFomwzENOJHgz+
	47jO7Wm3tbJJ18mblodsywriAoJBqgpTlw==;
Received: from 113.red-79-144-92.dynamicip.rima-tde.net ([79.144.92.113] helo=killbill)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x9qlh-006qf4-4y; Thu, 24 Sep 2026 23:14:12 +0200
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com,
	alexander.deucher@amd.com,
	aurabindo.pillai@amd.com,
	Aurabindo.Pillai@amd.com,
	christian.koenig@amd.com,
	David.Francis@amd.com,
	harry.wentland@amd.com,
	simona@ffwll.ch,
	siqueira@igalia.com,
	sunpeng.li@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	Harry.Wentland@amd.com,
	kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] drm/amd/display: remove duplicated prev_p_state_change_support assignment
Date: Thu, 24 Sep 2026 23:10:05 +0200
Message-ID: <20260924211410.867686-3-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924211410.867686-1-mwen@igalia.com>
References: <20260924211410.867686-1-mwen@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The prev_p_state_change_support trace entry is assigned and printed
twice, remove the unnecessary duplicates.

Fixes: 13b5ca42ca9c ("drm/amd/display: Add tracepoint for capturing clocks state")
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
index cc70aeb75798..887ebac8c97e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
@@ -523,7 +523,6 @@ TRACE_EVENT(amdgpu_dm_dc_clocks_state,
 			   __entry->p_state_change_support = clk->p_state_change_support;
 			   __entry->prev_p_state_change_support = clk->prev_p_state_change_support;
 			   __entry->pwr_state = clk->pwr_state;
-			   __entry->prev_p_state_change_support = clk->prev_p_state_change_support;
 			   __entry->dtm_level = clk->dtm_level;
 			   __entry->max_supported_dppclk_khz = clk->max_supported_dppclk_khz;
 			   __entry->max_supported_dispclk_khz = clk->max_supported_dispclk_khz;
@@ -533,8 +532,8 @@ TRACE_EVENT(amdgpu_dm_dc_clocks_state,
 	    TP_printk("dispclk_khz=%d dppclk_khz=%d disp_dpp_voltage_level_khz=%d dcfclk_khz=%d socclk_khz=%d "
 		      "dcfclk_deep_sleep_khz=%d fclk_khz=%d phyclk_khz=%d "
 		      "dramclk_khz=%d p_state_change_support=%d "
-		      "prev_p_state_change_support=%d pwr_state=%d prev_p_state_change_support=%d "
-		      "dtm_level=%d max_supported_dppclk_khz=%d max_supported_dispclk_khz=%d "
+		      "prev_p_state_change_support=%d pwr_state=%d dtm_level=%d "
+		      "max_supported_dppclk_khz=%d max_supported_dispclk_khz=%d "
 		      "bw_dppclk_khz=%d bw_dispclk_khz=%d ",
 		      __entry->dispclk_khz,
 		      __entry->dppclk_khz,
@@ -548,7 +547,6 @@ TRACE_EVENT(amdgpu_dm_dc_clocks_state,
 		      __entry->p_state_change_support,
 		      __entry->prev_p_state_change_support,
 		      __entry->pwr_state,
-		      __entry->prev_p_state_change_support,
 		      __entry->dtm_level,
 		      __entry->max_supported_dppclk_khz,
 		      __entry->max_supported_dispclk_khz,
-- 
2.53.0

