Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B784028F2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792186907; cv=none; b=XYJwNaMLA69oYYNPH0qqrXpMrXNakuS1q4P4i9rXbnfcTHqjx18B/xa5+HEnChwqJ+Ha/cfEsn4rg5Ll49XIzSgY2cS1xD8QHhfrq0oAWKl47SpVhy5SKTO9LDk86vgaUX8nDzJIXiTtBCYlXxRizKOpqziAdVJQCCsmfcTNNKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792186907; c=relaxed/simple;
	bh=fnn5a16LYBEP4gf82jET/hVXcWW0KoRLAp0Y56S+HlE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=CuJzDyiF+tMZmUfThfU04Y+y9jXHQ06GdH8ImgiVeSvEPt5ImuftIHOwmsyTYZZX6sXLWKyDrbqI3ymxKVsHt6ykiE3jLqW5SofWBQ61k/BuiNgjUhs38Wn9i/XBNq7r8eaYnLSuN4J26gw24R0pdUBSKBA3zJMB+Eb6ZaumuBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=CtTpV4Zh; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="CtTpV4Zh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	To:From:From:Reply-To; bh=CQIp3s4SHSP2WYubrQw6v7dKizWc+DvH4FxnAsBz514=; b=CtT
	pV4ZhL20pDDMA59NhqgBusQC1xjIO4qTRv983K8pk1ik3tPstTN9yvpkGcOdIbK58TLDfvxADdTHi
	RoSC5aMTyGPMDPicUxr0R1Bd7dqstCF0v1QGxKIRX5gbzXYtXhtWBXC6a5PQwYLZBkoIzbMlv4U1i
	YRGbtrYxorn4zDA3gLAJ214mIkm2XG5/Iq/wbQgJax2BqQZ/oKNO+N0siC029+9+AwWMkH82P9/Ez
	1zciYiyYDZ5sQHfd9cLMWa0+qB+tVxXo1avzf7ApKZaALcKJmIZoqFbskBFGKKBwUP7/V5m3BvbB1
	a79B61jPYQxw4EXavz2PSICCXpjwn1g==;
Received: from [179.190.179.102] (helo=toolbx)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xHpg2-001FWJ-Dk; Fri, 16 Oct 2026 23:41:22 +0200
From: Helen Koike <koike@igalia.com>
To: rodrigo.vivi@intel.com,
	demarchi@kernel.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	tvrtko.ursulin@igalia.com,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	koike@igalia.com
Subject: [PATCH v3] drm/xe/lrc: Restore CTX_CS_INDIRECT_CTX_OFFSET programming for pre-Xe2
Date: Fri, 16 Oct 2026 18:40:50 -0300
Message-ID: <20261016214112.1647202-1-koike@igalia.com>
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
Context. Thus, at restore, 0x0 is programmed back to the GPU, which is
an invalid value according to the PRM.

This causes sporadic hangs on Alder Lake when executing test
IntelAngleEnd2EndTestCases (error VK_DEVICE_LOST).

Fix it by partially reverting commit c9dfd66cb91e ("drm/xe/lrc: Allow
INDIRECT_CTX for more engine classes"). Re-add the programming of
CTX_CS_INDIRECT_CTX_OFFSET for pre-Xe2 (in theory it should apply to all
platforms, but we got an unexpected behaviour on Xe2 that still requires
investigation).

Fixes: c9dfd66cb91e ("drm/xe/lrc: Allow INDIRECT_CTX for more engine classes")
Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Helen Koike <koike@igalia.com>

---

v3:
  - Commit message update:
    - s/programed/programmed
    - s/for ADL/for pre-Xe2
    - Add sentence saying it should apply to Xe2 too, but we got an
      unexpected behaviour and it requires more investigation.
  - Remove comment "Enable INDIRECT_CTX leaving..." since it is wrong.

v2:
  - according to intel CI results, it seems that this default is not valid for
    LNL and BMG platforms, so limit the change only to ADL.
  - program the default only on ADL.
  - restore the comment, but add note with exception for ADL.
  - update the commit title/message with "for ADL".
---
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h | 3 +++
 drivers/gpu/drm/xe/xe_lrc.c             | 8 ++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

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
index 35b4e8289b5f..18f247bc8865 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1449,15 +1449,15 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
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
+	if (GRAPHICS_VER(lrc_to_xe(lrc)) < 20)
+		xe_lrc_write_ctx_reg(lrc,
+				     CTX_CS_INDIRECT_CTX_OFFSET,
+				     CTX_INDIRECT_CTX_OFFSET_DEFAULT);
 
 	return 0;
 }
-- 
2.54.0

