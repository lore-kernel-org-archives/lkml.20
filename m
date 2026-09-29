Received: from mail-yx2-f38.google.com (mail-yx2-f38.google.com [74.125.224.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AB53264C3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 21:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790715762; cv=none; b=jQ591VorhfCi6LWCgEeqU3Qekxjb4DPGacvtpztICgBldDu5ObzCrGjSHPuh9gHRGeb3CIcKfoimLBdDX6Lbkkc3Auk8T5HwCEfxZgkaW4rvsHEOkfbFoulbupDQovHLrBj/anbxxZIE//CXAozwJpMEw3faneLz8fXRSuHAr+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790715762; c=relaxed/simple;
	bh=bA1AmuGBma/wa/KaBHZxNg5s017qFucc3YuLIpK39SM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Iav4qV6NGLtwal0PArn5v0/7+1cbFN5uC2Gh8h+VpLl/KsEvgaSLv5GHfXmDMSI0HUhDpxf/q50xmc7Q7tRfiEYiEhR8HPUxLLhurLrh467/34cOtLDhWf1lsfoeelLiClgNLzihh69RntbwwcwsFBkq9kbz3hS6N8lT6K13+28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OFtG7nFs; arc=none smtp.client-ip=74.125.224.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OFtG7nFs"
Received: by mail-yx2-f38.google.com with SMTP id 956f58d0204a3-675617094f5so1267296d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790715760; x=1791320560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QduLVvo/6LGEURIIdyO8Zm2sFyH0SPaSfM/HS570OMU=;
        b=OFtG7nFsniaM5QG7eE+dFCgYb7/tuIO+oLpGf7sbOy3XHhwTO9Ox/5D1qAUPWYqTOh
         YdUTHeIJwE06egmCs1Q+w0zSsLsBSHW+AdA3ybTAPIEAoKavoOH7mHgFio2pQiUVcj8p
         4/WkYFaKFV8W3+EmqepruKcirqos6tiIHDK9ttvmnmNwoeEacBAzSiQY5KfvGc0MvgWd
         3EGLqUdM0tkOrtIw1OPdw82cMW8GlvJUG8oMjnMJnXl02wCIWcJlskaTWsZr2XMbgBVB
         te1iehyWH0A6d9D2/1YEuOSTY0VEggwqp7OBJRVtf5UNrX7/VbTsulSwgTYUnE+yg2fn
         KkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790715760; x=1791320560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QduLVvo/6LGEURIIdyO8Zm2sFyH0SPaSfM/HS570OMU=;
        b=pIBuHqYs4QsqQ4C+sivb3z+y/QM1xQzTv/x0NCMV9+NeEWwny4JUntFZS5aDsLrrwA
         yplGtBrnng2xMV8Zpd5zFj1IZbLvlUdQeuuUNGeFY9EYvQhnx1b5ueHF2iTmYWhD6w6y
         vjs6f2yHQHB2wcwOpA550GQ5GHHbpwI4nEUf2gnYfVqLgk7FKQZCh1Eq7bBZWj8q08fq
         8tNm3y9pjqBCnf1RYX2phlXlwLSVLz98FcX9P5ZYE656M/Xnvbl/YoFPIxO0/JzwzgCF
         Nrkko8/AzKX+Vu+iP/OcU7BPMuEMfMy7+yrIQBE9/w63llFsJqWOnUqhVsuGNe6jsKk3
         nkYg==
X-Forwarded-Encrypted: i=1; AKwUvBxzHErAXHM/6ZaMdQvaZmTa48pUQprWjUJnr8aSvYbQhvXjYy9dFnLf5erPwr1Rm98HINpU+6PXciPIFzc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbyNMt4RdCdX7ua2Mbo3p6K7LbuXDudJb3ZD4p0vhR0Bl9ZZhm
	9sfEfM2CVTO8iwvIDSjLDdXMhB58p8CKgOiNWoSXD3Xno9VFNjRrpWM+
X-Gm-Gg: AYBFou37F2R8r0O8h7KAqPUmriHJyM3WYYs9tcj6HILyf5sUYP3L5L1fiJiGBF/MUcg
	ncnKpgacTizX8WSifx8GP7KNDgL/lGyjcIBf1JReZDhkDeG+2n6HlX4/+dAsmAYy53nO4pMpb4G
	jW3tk/avT7y3ER6ZraS3PVZeMngfxVQCgBooqa/wFeVG6BJb4R/IvO/stQy0z8aXl/m2hjVvc0x
	Hr2GdZH9IavGTfs2xhJ9d0QUdxWSitR8+mHE2003ZJZjDBsHvGXy8suNwz109eIP5p3MtbU8Z6C
	W+8vDTlTaZ9GgY5vOib6oPKUxR0yTfZXP/T+3Jo3jlUQqIl15Odg2hGXaz7WF8CGdmgZYejpbi5
	fIerc2SZ3QcF3NCV1L+89pJNaOjFn/MtJPOi0xH06mop+4uSaDJqHypk3KYIBpB82pluyGGmt66
	w+SN4XkcEPBPEpphm0F0CGaZtqgtOB2Ls7FuXWzRLjwyuwDzQVx9O/LpuadX7TAczAlx3SgcA0Z
	E4gPM7zSVabEfXW1OoD+HWFqh+Yvhjc3f2zIT0bjg4hCgiWIetliOSthrU5j6CSDUZhOrNSe5Le
	ODm4kPdpam4JLsDUjBr7NouBlleMdEq/xtYZzw1b3XGM3IoMrSUzzu6AFh/kIefycda1lw9T1bQ
	=
X-Received: by 2002:a05:690e:484a:b0:668:172a:47a7 with SMTP id 956f58d0204a3-67644049386mr127939d50.25.1790715759914;
        Tue, 29 Sep 2026 14:02:39 -0700 (PDT)
Received: from fos (107-215-62-97.lightspeed.tukrga.sbcglobal.net. [107.215.62.97])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-675b773e342sm490345d50.20.2026.09.29.14.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:02:39 -0700 (PDT)
From: Adam Lewis <adam.j.lewis@gmail.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ian Forbes <ian.forbes@broadcom.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Adam Lewis <adam.j.lewis@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/vmwgfx: release imported dma-buf when the BO is freed
Date: Tue, 29 Sep 2026 16:59:28 -0400
Message-ID: <20260929205928.230301-1-adam.j.lewis@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vmw_prime_import_sg_table() creates a BO for a foreign dma-buf through
drm_gem_prime_import_dev(), which attaches to the dma-buf, maps the
attachment and takes a reference on it.  vmw_bo_free() never undoes
this, so each foreign import leaks the attachment, its sg table and the
dma-buf reference, and the exporter's pages stay pinned after the GEM
handle, the DRM file and the importing process are gone.

Any client that can open a render node and obtain a dma-buf from
another exporter (udmabuf, V4L2, another DRM device) can pin memory
without bound.  KWin does so on its own in VMware guests: it wraps
wl_shm client buffers in udmabufs and imports them, leaking gigabytes
within days.

Call drm_prime_gem_destroy() for imported objects before releasing the
GEM object, as amdgpu, radeon and nouveau do.  vmw_bo_free() is TTM's
destroy callback, so TTM is done with the reservation object shared
with the dma-buf by then.

Tested on 7.1.13 and 7.2.7 with a udmabuf import reproducer and on a
Plasma desktop, where KWin's imported client buffers are now released.
The leak was found and the fix written with the help of an LLM coding
assistant.

Fixes: b32233accefff ("drm/vmwgfx: Fix prime import/export")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-fable-5.1
Signed-off-by: Adam Lewis <adam.j.lewis@gmail.com>
---
Notes (dropped on apply):

Security note: per Documentation/process/threat-model.rst an unprivileged
user must not be able to make the system unresponsive through unbounded
resource exhaustion.  On a default systemd desktop every logged-in user
has a render node (0666) and /dev/udmabuf (uaccess ACL), which is all
this needs, and the pinned memory survives the triggering process.  The
bug was found with AI assistance, so per security-bugs.rst it is treated
as public and the reproducer is not attached (available privately).
A CVE request will follow once the fix is in a released kernel.

Environment: VMware Fusion on an Apple M3 Max host, Fedora 44 aarch64
guest, vmwgfx 2.21.0, no swap.  Found on 7.1.12/7.1.13 (Mesa 26.1.8,
KWin 6.7.4), confirmed on 7.2.7 (Mesa 26.2.3, KWin 6.7.5).  The import
and destructor code is unchanged from v7.1 through v7.3-rc5 and current
drm-misc-fixes; b32233accefff went to stable # v6.6+.  Not the same
issue as f739416dc555 ("drm/vmwgfx: drop dma_buf reference on
foreign-fd prime import"), which covers ttm_prime_fd_to_handle()'s
error path and was already in the kernels tested.

How it shows up: KWin wraps every wl_shm client buffer in a udmabuf and
imports it into vmwgfx, for scanout and, when it renders with llvmpipe
because svga reports "No 3D enabled", as a texture.  Every import
leaked, so every client buffer stayed pinned: ~6 GB after a few days on
7.1.  debugfs bufinfo then listed 961 live udmabufs, 954 of them still
attached to vmwgfx, while kwin_wayland held 35 dma-buf fds.  On an
unpatched 7.2.7 boot, nr_foll_pin_released did not move at all in four
hours of desktop use, while MemAvailable fell to 2.8 of 24.5 GB.

Testing:
  - reproducer (udmabuf -> PRIME_FD_TO_HANDLE -> GEM_CLOSE -> close the
    dma-buf -> close the DRM fd): unpatched, the dma-buf outlives the
    process with refcount 1 and vmwgfx still attached; patched (7.1.13
    and 7.2.7), the pins are released as soon as the dma-buf fd is
    closed;
  - imported framebuffer: ADDFB2 + SETPLANE on/off + CLOSEFB through the
    screen-target path on 7.1.13, and ADDFB2 + CLOSEFB on 7.2.7, both
    release cleanly;
  - Plasma desktop on 7.2.7 with the patch, 30 terminal windows opened
    and closed: KWin created 298 udmabufs and 296 were freed (the other
    two were still in use), drm_prime_gem_destroy() ran for 85 imported
    objects, and the pin counters, slab usage and dma-buf census went
    back to their baseline;
  - builds without warnings with W=1 on drm-misc-fixes (e78a9fb).

Two related leaks on the same desktop, to be reported separately:
  - Mesa's kms-dri-sw winsys releases GEM handles with MODE_DESTROY_DUMB,
    which is EACCES on render nodes, so a compositor rendering with
    llvmpipe on a render node leaks the handle of every imported buffer
    (KWin up to 6.7.4; 6.7.5 falls back to the KMS node);
  - vmw_buffer_prime_to_surface_base() creates a GEM handle the caller
    never sees and WARNs for every foreign dma-buf.
With this fix those leaks last until the owning process exits; without
it they pin memory permanently too.

 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 9c7a73c..f226b32 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -31,6 +31,7 @@
 #include "vmwgfx_resource_priv.h"
 
 #include <drm/ttm/ttm_placement.h>
+#include <drm/drm_prime.h>
 
 /**
  * vmw_bo_free - vmw_bo destructor
@@ -69,6 +70,8 @@ static void vmw_bo_free(struct ttm_buffer_object *bo)
 		vmw_surface_unreference(&vbo->dumb_surface);
 	}
 	WARN_ON(!RB_EMPTY_ROOT(&vbo->res_tree));
+	if (drm_gem_is_imported(&vbo->tbo.base))
+		drm_prime_gem_destroy(&vbo->tbo.base, vbo->tbo.sg);
 	drm_gem_object_release(&vbo->tbo.base);
 	WARN_ON(vbo->dirty);
 	kfree(vbo);

base-commit: e78a9fb7a40c55ec2a70ae39903dde4f898af2ef
-- 
2.55.0

