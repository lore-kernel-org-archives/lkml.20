Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68484D5989
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616835; cv=none; b=oegDGCwK4s9jZH4vlD1afTJoQl/ikozGtrCRxsB05Pdm/4l3I/cDHqFRQ1JiTyG/tQvaMbvc4zmZF7grH9TxDfpOKrQpyMrPCV8kyoHgsk720ZJbBZiv4D9n9r+inncmT7bkUJQnKxYSZ9c6X0jTZT8+iViA/R+Kl8eyAtOf+v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616835; c=relaxed/simple;
	bh=nlgTWbSo/WswzQFWi8ApI1E1kcgIVxLcpXdx5PRyfDs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=lyOuptTcpaipoVb2z616bgb2auG1AXDwHTtEzvIfsfioXQtZWE5uLR6J1QUENraQVlzVKUF8oZKtQPZyzGEYNS0TUyXw0Hq3zD82Zhgd8TpKDE6qu0yVA8xl171s/61eEfrpn15AgmBgr/bKMNq4RtQjOGkIBssGdx3zjPIPsEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=oXqC6i6n; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="oXqC6i6n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	To:From:From:Reply-To; bh=wSQkPbxO8IC2kuhUdnJV+rtmX5/hHYXc1xtZnALlBbQ=; b=oXq
	C6i6nfdIU5oei/4pkmqqw9VmpHhGa1of9z9AqxnipbJB924kaLxqOCs62kAffWk9RjBg9rZaaJR5r
	GBKpxZRJ7LJB5elymQYJwT3Rg0ItMQK0ctf59RdCB2DYQ9c+XCqmE3T0kmFSIP60iT82zJnypHsDz
	396wodWoNrIEtT2OOjf/LsEmsJRDzHgiSqRYCC7BP6ZOWTu7SMXzvnCBNgoj6p2XeLbU5QjxHiX5G
	KUDRgVYYI0Onmqb67imgxMzxYr+cU8p5KRGTpPTRtCgHfDO8bCUERh25U8v8WBbaGV+QDkLMJ37Zu
	VQMVDQJygt+3P5V0j8qTPyCbR5oqxuQ==;
Received: from [179.190.179.102] (helo=toolbx)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xBFEQ-008UxH-DC; Mon, 28 Sep 2026 19:33:38 +0200
From: Helen Koike <koike@igalia.com>
To: rodrigo.vivi@intel.com,
	demarchi@kernel.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	tvrtko.ursulin@igalia.com,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	koike@igalia.com
Subject: [PATCH] drm/xe/lrc: Restore CTX_CS_INDIRECT_CTX_OFFSET programming
Date: Mon, 28 Sep 2026 14:33:25 -0300
Message-ID: <20260928173328.45024-1-koike@igalia.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CTX_CS_INDIRECT_CTX_OFFSET default value is not retrieved from the GPU
by inhibit+context save mechanism since it is not part of the Engine
Context. Thus, at restore, 0x0 is programed back to the GPU, which is
an invalid value according to the PRM.

This causes sporadic hangs on Alder Lake when executing test
IntelAngleEnd2EndTestCases (error VK_DEVICE_LOST).

Fix it by partially reverting commit c9dfd66cb91e ("drm/xe/lrc: Allow
INDIRECT_CTX for more engine classes"). Re-add the programming of
CTX_CS_INDIRECT_CTX_OFFSET.

Fixes: c9dfd66cb91e ("drm/xe/lrc: Allow INDIRECT_CTX for more engine classes")
Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Helen Koike <koike@igalia.com>
---
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h | 3 +++
 drivers/gpu/drm/xe/xe_lrc.c             | 7 +++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
index 4ab86fc369fd..e4c7c3549735 100644
--- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
+++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
@@ -43,4 +43,7 @@
 #define INDIRECT_CTX_RING_START_UDW	(0x08 + 1)
 #define INDIRECT_CTX_RING_CTL		(0x0a + 1)
 
+#define CTX_INDIRECT_CTX_OFFSET_MASK	REG_GENMASK(15, 6)
+#define CTX_INDIRECT_CTX_OFFSET_DEFAULT	REG_FIELD_PREP(CTX_INDIRECT_CTX_OFFSET_MASK, 0xd)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 35b4e8289b5f..1a0e39089a67 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1449,15 +1449,14 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 	finish_bo(&state);
 	kfree(state.buffer);
 
-	/*
-	 * Enable INDIRECT_CTX leaving INDIRECT_CTX_OFFSET at its default: it
-	 * varies per engine class, but the default is good enough
-	 */
 	xe_lrc_write_ctx_reg(lrc,
 			     CTX_CS_INDIRECT_CTX,
 			     (xe_bo_ggtt_addr(lrc->bo) + state.offset) |
 			     /* Size in CLs. */
 			     (state.written * sizeof(u32) / 64));
+	xe_lrc_write_ctx_reg(lrc,
+			     CTX_CS_INDIRECT_CTX_OFFSET,
+			     CTX_INDIRECT_CTX_OFFSET_DEFAULT);
 
 	return 0;
 }
-- 
2.54.0

