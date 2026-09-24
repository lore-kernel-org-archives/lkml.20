Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5674DF4AD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284463; cv=none; b=ncHspqJ87tOCxGknTxVeSZpXBGXVyRRiJU3GgguEHHfVsZn3GpM0+hbY8P7SezOUM+eRUgh3MBwvQk4LaRhSI9F7qS6KaqVke5/yzXMh3ZTNEEb8myP2tWC6JzuYMEUUDeT9BfeRB2RlRL2aww2EMDJQhqnwHthK/xAxLVG7sDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284463; c=relaxed/simple;
	bh=tBNIAUAXiQjKtfq79vCBUb6yC/b6HS3EM09hxvB4hl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KWfJW+4+Lotsd4QXa6KnWPQv1su6qD+gtFLU4n4DhgHQxqxHqZD7DikVL2tgMurJXw7gpd0Xv/n+YjBJ4EqPTa9Rd2M1u2dGtI+FrvDmFwacdhaRdugi2uqEb0Qc3MKylZE13yuaS92rWSPAniwPZsb0GzLqDr3WMiBuO2MB1P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=qi1iBxsa; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="qi1iBxsa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=EIkF23NjgV8nXYfE/L51lvBhE+rTYxH5esChBahY2vg=; b=
	qi1iBxsayvBkDgVMT3/qHK0TXGjj1ACMfJtje+CXPnHh+x7q2Shagj48CqevCrC7zU7c8ViDvjSh7
	I3bFDOOVtRFkSTAHI54fAq9W96sSsyDBbWUjSKaZD3+oJMNqh3aDiJu0aw4Hboh9FpfdL9ksMhGJ/
	9mqh63piEx1ylwT8+4f0dyWKI5s346MrT1UZ4nizOFXPathcWxStXOeUZ2diZB0noxjDcM/XAhhHA
	a6bSPhPuE1a/y5WBJIPP66EO5cqn0bNc8IBCrxHctMoazM6L7l1OyL9G5Vy/SXlRHCmNJnOJRuPEp
	9/jeLBsCmvcLYw68cKh2nGbExN6Vps1b2A==;
Received: from 113.red-79-144-92.dynamicip.rima-tde.net ([79.144.92.113] helo=killbill)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x9qlg-006qf4-Gy; Thu, 24 Sep 2026 23:14:12 +0200
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
Subject: [PATCH 1/8] drm/amd/display: assign missing trace entry in amdgpu_dm_dc_clocks_state
Date: Thu, 24 Sep 2026 23:10:04 +0200
Message-ID: <20260924211410.867686-2-mwen@igalia.com>
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

disp_dpp_voltage_level_khz is declared and printed, but never assigned.
So when using clock tracepoint the value of this clock is just garbage.
Assign clk->disp_dpp_voltage_level_khz since this is stored in dc_clocks
as other entries.

Fixes: 13b5ca42ca9c ("drm/amd/display: Add tracepoint for capturing clocks state")
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
index f33a2c1e0da5..cc70aeb75798 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
@@ -513,6 +513,7 @@ TRACE_EVENT(amdgpu_dm_dc_clocks_state,
 	    TP_fast_assign(
 			   __entry->dispclk_khz = clk->dispclk_khz;
 			   __entry->dppclk_khz = clk->dppclk_khz;
+			   __entry->disp_dpp_voltage_level_khz = clk->disp_dpp_voltage_level_khz;
 			   __entry->dcfclk_khz = clk->dcfclk_khz;
 			   __entry->socclk_khz = clk->socclk_khz;
 			   __entry->dcfclk_deep_sleep_khz = clk->dcfclk_deep_sleep_khz;
-- 
2.53.0

