Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924354D2EFE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790787904; cv=none; b=KNVmbuqJU1hxbEclFwT17CR8VDE8/2c+WYQ2WLZ7J+EPIR2wFGzZaPQ66rYucTXb8dQrGUQXCHXwCQ0jb+5tmeM46zVh+lYJnWvT3RPRcO+l3y136/Iklkoya6VYkcBKdQ+ULngdp7oByT64kr2vek0K70BvfSQiCSMe+Hmhv0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790787904; c=relaxed/simple;
	bh=VVktehg2l9gnlmSaL3bwXVcqvyGolH2aYLtDhUvh8po=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=YryRpqvnD58ONnSLfvdFA9DajJ791Szu0MnUHrucVbhAGaxhT//ArMKlYeOMWXIad81rxyZAtFhcIXsKd7spn6Iusq0XFzqcByGtL+Bcin/Iwd13RyJldEq9ORcUY7aQiqmwNnzYSrmyCHcWfgtIm/qhFdlIlvZjhVIpd6/Mw44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ex0E+w3S; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ex0E+w3S"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	To:From:From:Reply-To; bh=tnPMQqIX3sMv2i2odt5STz12Tj4ZHlCMpcZpEhmJXhc=; b=ex0
	E+w3SjMJYuZzYrg9cch4xncBLul+wt6jQdx5/Rt1YJPE3KcLS9kmA4+jvX2tCk6Agik0JS10jSYw/
	LLzQ0V7jLmTPqn7AqHr+4M3fWlE85kcPcimu9+81CmC3vlBZHnOXNTa09xCJH8/Zo3G7CK+ExlkSq
	yUX7nfYlm2kgkKnrJLAfnL1GNFG55EkeHLY7OzTaGXsFgvWGk1g811bdR1mBI3c0QsfE8E8gA/Ssm
	HaxUatwMTr56A00H0H/i4jteZKFmgCwaJRD5Ya6z/wDLGPfG1vGRNNvkysn+tSJurUtd0O06BAxAV
	plTuF9DL0YXhLh/Hg7RukSBZXnjRcBA==;
Received: from [179.190.179.102] (helo=toolbx)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xBxjX-009XHC-I2; Wed, 30 Sep 2026 19:04:44 +0200
From: Helen Koike <koike@igalia.com>
To: rodrigo.vivi@intel.com,
	demarchi@kernel.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	tvrtko.ursulin@igalia.com,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	koike@igalia.com
Subject: [PATCH v2] drm/xe/lrc: Restore CTX_CS_INDIRECT_CTX_OFFSET programming for ADL
Date: Wed, 30 Sep 2026 14:04:30 -0300
Message-ID: <20260930170434.317671-1-koike@igalia.com>
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
CTX_CS_INDIRECT_CTX_OFFSET for Alder Lake.

Fixes: c9dfd66cb91e ("drm/xe/lrc: Allow INDIRECT_CTX for more engine classes")
Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Helen Koike <koike@igalia.com>

---
v2:
  - according to intel CI results, it seems that this default is not valid for
    LNL and BMG platforms, so limit the change only to ADL.
  - program the default only on ADL.
  - restore the comment, but add note with exception for ADL.
  - update the commit title/message with "for ADL".
---
 drivers/gpu/drm/xe/regs/xe_lrc_layout.h | 3 +++
 drivers/gpu/drm/xe/xe_lrc.c             | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

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
index 35b4e8289b5f..923bc1ddc851 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1451,13 +1451,18 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
 
 	/*
 	 * Enable INDIRECT_CTX leaving INDIRECT_CTX_OFFSET at its default: it
-	 * varies per engine class, but the default is good enough
+	 * varies per engine class, but the default is good enough, except on
+	 * Alder Lake.
 	 */
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

