Received: from mx2.cyberprotect.ru (mx2.cyberprotect.ru [176.10.93.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B585836C0C8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.10.93.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398970; cv=none; b=b7ME9L9tKa2jQmumvxtvU+efPxF7l5ngHgzfcgTzcySesfZAHcDPaY3Dwe6Fu37oNawkxlOs1W9+LUVIx+in0XTDGgPyCSPhjrvl7kGFH2/aOvn0+gn/JS60nXDRNKPdxCYxmk+oVsYYUgJHXTWxg537Lpt0DF164BFyyeujmd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398970; c=relaxed/simple;
	bh=BgHBCYGXjROhQ/d7IdLv542O9fFL5ylMndakTbQxU98=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CW0n/eyYKTAy9jDt2ETT+6+NT6s0ivYPK+H9kYdpzJ3geqtFBK0YSGv59FbOXLYjUNlKM8Y6uWYS3y977xOfeZoyPl8Pl4b1gXUg0WHAEo0Yo+lPuMWBV3wYlYK/0lCGQqoAYhjs/k9D5yOVopG8W7XAVAbx0vIMj3f6OPfueyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cyberprotect.ru; spf=pass smtp.mailfrom=cyberprotect.ru; dkim=pass (2048-bit key) header.d=cyberprotect.ru header.i=@cyberprotect.ru header.b=jQgUtWJm; dkim=permerror (0-bit key) header.d=cyberprotect.ru header.i=@cyberprotect.ru header.b=iH+0PQWr; arc=none smtp.client-ip=176.10.93.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cyberprotect.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberprotect.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cyberprotect.ru header.i=@cyberprotect.ru header.b="jQgUtWJm";
	dkim=permerror (0-bit key) header.d=cyberprotect.ru header.i=@cyberprotect.ru header.b="iH+0PQWr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cyberprotect.ru; s=dkim-r; h=MIME-Version:Date:From:Sender:Reply-To;
	bh=RdvBOVnEKQdDMFBx5aH72LXneDiwa7iML9qml3N/n84=; b=jQgUtWJmwNKw1hsXIaa+KnSSfo
	fZGI8a9YpV01Tor+l0gK6kmC5kSEiZL4xsR6a0+FWXhcela7Cx7abQISYIrNiVgCAzUppfOyskxd9
	ZOJDz7QfoQB6dvhPhoEu0jBwJjXx+loDO6o49dbk8l15nuJJF0XfqbUvvUpLzA6N+oUN+BIROlYmF
	5mRS07PG62zUh8YNKOuT2ARVjmJ/8Fng+eeeoaGIpTEjA5eBAbJY8KwwoFr/m3T5NgA/qcyAZYAp+
	RKLrdAskaorCHc722Iimdr/FQXaDsq7MU77PA0f6LOHLkgx0zvrIVE2RdkxUhiIPODESF2Z7ndneJ
	5TkY2/RQ==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cyberprotect.ru; s=dkim; h=MIME-Version:Date:From:Sender:Reply-To;
	bh=RdvBOVnEKQdDMFBx5aH72LXneDiwa7iML9qml3N/n84=; b=iH+0PQWr4FzqmqQctLMfFKUiaq
	G+UVxyqir2zVBRTA5K0Q5xjWLJiAlGG0/zpjxhckkuCfNiOZn9GTdsZYh4Cw==;
From: Dmitriy Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
To: Austin Zheng <austin.zheng@amd.com>
CC: Jun Lei <jun.lei@amd.com>, Harry Wentland <harry.wentland@amd.com>, Leo Li
	<sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher
	<alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Dillon Varone <dillon.varone@amd.com>, Nicholas Carbones
	<Nicholas.Carbones@amd.com>, Wayne Lin <wayne.lin@amd.com>, Ray Wu
	<ray.wu@amd.com>, Gaghik Khachatrian <gaghik.khachatrian@amd.com>,
	<amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>, Dmitriy
 Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
Subject: [PATCH] drm/amd/display: guard NULL secondary pipe in dcn_validate_bandwidth()
Date: Mon, 14 Sep 2026 18:14:46 +0300
Message-ID: <20260914151446.94380-1-Dmitry.Chumachenko@cyberprotect.ru>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AIP-EXCH-1.aip.ooo (10.77.28.101) To AIP-EXCH-1.aip.ooo
 (10.77.28.101)

resource_find_free_secondary_pipe_legacy() returns NULL when no free
pipe is available, but the result is only passed to ASSERT() (a
WARN_ON_ONCE() that does not stop execution) and then dereferenced in
split_stream_across_pipes() and dcn_bw_calc_rq_dlg_ttu().

The sibling resource callers (dcn10/dcn20/dcn201) already NULL-check
this function's result. Do the same here and skip the split when no
free pipe is available.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 74c49c7ac14f ("drm/amdgpu/display: Add calcs code for DCN")
Signed-off-by: Dmitriy Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
---
 drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c b/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
index 61553e24d53e..de54807ade43 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/calcs/dcn_calcs.c
@@ -1261,10 +1261,12 @@ bool dcn_validate_bandwidth(
 						/* pipe not split previously needs split */
 						hsplit_pipe = resource_find_free_secondary_pipe_legacy(&context->res_ctx, pool, pipe);
 						ASSERT(hsplit_pipe);
-						split_stream_across_pipes(&context->res_ctx, pool, pipe, hsplit_pipe);
+						if (hsplit_pipe)
+							split_stream_across_pipes(&context->res_ctx, pool, pipe, hsplit_pipe);
 					}
 
-					dcn_bw_calc_rq_dlg_ttu(dc, v, hsplit_pipe, input_idx);
+					if (hsplit_pipe)
+						dcn_bw_calc_rq_dlg_ttu(dc, v, hsplit_pipe, input_idx);
 				} else if (hsplit_pipe && hsplit_pipe->plane_state == pipe->plane_state) {
 					/* merge previously split pipe */
 					pipe->bottom_pipe = hsplit_pipe->bottom_pipe;
-- 
2.49.0

