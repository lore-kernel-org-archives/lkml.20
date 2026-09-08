Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B8658B6C4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905100; cv=none; b=tL3DLCc9kCscLPawm9hGA6j0CpjeL2yP1ffxJWOk06Ziw9am97AR8TgUThchDjt+VgkLO9LyhNZ2QAiFTEP8EyxSMn1QgavDNnJtxZwKu4j3f57dHKFPPQKl280M9ggu1QYEI8Njez5pTLsBZNPKBkS3Zn1PPYZHkOyQKy8OHFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905100; c=relaxed/simple;
	bh=KXjID5zwEnS/6i0i4yKo05v9d2iAqpm2hWmsH3xdD6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A/A926Fwpy5a4PRTO9KAGwnSMxcgKDL14Yq8H/mdANuUdZwX9b8n+akPdkNkG0H+DZrIT5GXXZn742LLPiaoj+7+DnG3o5TzKRU7T6Jk+SOmn0L2J7drqJsyepTWMnZjNcYi7YMNB+nxeTRCNzvhxyfPn3rAqeCsBUMn4MauC2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V47tf8M2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V47tf8M2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA431F00A3A;
	Tue,  8 Sep 2026 22:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788905099;
	bh=MWrrQYUhx+9Xsk9gELQ0A3vmgKNDW3R1AUupsQHIcE4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=V47tf8M21es2gsJFShqGh0OT7Wu7y7TV3PL+6zVD+h6IihAVfftXqBkz8LZ5tS8Ak
	 K80ayyzR3G1k5KjDLgtd8F5sfTIjqYYKFLNRLt8EIrOFZIkGX8zxzkI4uIRlzXcKM5
	 wn0M3QKDBg/yFEm7e76LkFeIijKJEA66wNQP5lg52ZjfoE6XJ7TAiEAJ/mYT2Bmenv
	 aARMAT5oCw4PtALaub0eimraeZIhmTwgkb2YdklkMD2uOjanUMkJFLFDNND9wrfFyl
	 8vHoooi6XEFzwLjsr3zJQT7lLyol1DCy8JHbdtcXyoRcyc/vqzOzvLcslUuiyXpUaR
	 i2A8nK1MCn95g==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 08 Sep 2026 17:04:43 -0500
Subject: [PATCH v3 06/22] accel: ethosu: Prevent command stream export
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-ethosu-fixes-v3-6-490fe215286f@kernel.org>
References: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
In-Reply-To: <20260908-ethosu-fixes-v3-0-490fe215286f@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev

Command stream BOs are validated at creation time, but the generic PRIME
export path can expose their backing memory to a DMA-BUF importer. The
importer can then modify the command stream before the NPU executes it.

Reject PRIME export for validated command stream BOs while retaining generic
export for data BOs.

Fixes: 5a5e9c0228e6 ("accel: Add Arm Ethos-U NPU driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
v3:
 - new patch
---
 drivers/accel/ethosu/ethosu_gem.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/accel/ethosu/ethosu_gem.c b/drivers/accel/ethosu/ethosu_gem.c
index 9afe2549ec84..c046aee42687 100644
--- a/drivers/accel/ethosu/ethosu_gem.c
+++ b/drivers/accel/ethosu/ethosu_gem.c
@@ -6,6 +6,7 @@
 #include <linux/slab.h>
 
 #include <drm/ethosu_accel.h>
+#include <drm/drm_prime.h>
 
 #include "ethosu_device.h"
 #include "ethosu_gem.h"
@@ -30,9 +31,18 @@ static int ethosu_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vm
 	return drm_gem_dma_object_mmap(obj, vma);
 }
 
+static struct dma_buf *ethosu_gem_export(struct drm_gem_object *obj, int flags)
+{
+	if (to_ethosu_bo(obj)->info)
+		return ERR_PTR(-EPERM);
+
+	return drm_gem_prime_export(obj, flags);
+}
+
 static const struct drm_gem_object_funcs ethosu_gem_funcs = {
 	.free = ethosu_gem_free_object,
 	.print_info = drm_gem_dma_object_print_info,
+	.export = ethosu_gem_export,
 	.get_sg_table = drm_gem_dma_object_get_sg_table,
 	.vmap = drm_gem_dma_object_vmap,
 	.mmap = ethosu_gem_mmap,

-- 
2.53.0

