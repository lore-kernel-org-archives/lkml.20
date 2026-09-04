Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897DC477984
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523477; cv=none; b=d2YAmL03K6DcF/GxRTpIdtxtI1/iRUgg/I2SL7zIG+z84BeEt2UGNazltUodJhF/+2TBG0Vv5paWUgP7p74vt9bmknzGISxkWXjVVpGEznLe2Td7bQAN5EKZ/SbG/R4JsqWNQLX6SLyxKbd9QPcs0xlGf1dwWZr2ZdGTNRUZq+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523477; c=relaxed/simple;
	bh=sT39qbeBdcKVZPKp8dHBTJYvcY8iTBXm47Uar5LqFdI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X2QamjVhKnkwJ4qGtTetUtY6Ics97bpqZGmyAn3ORhaUS5IRQE+Ju1bAr9BuozhmV+U9H02QJjEGt3UJF1HCelujl9vlAF9FViHyWhJWkeVIjIqfT3nNDBfMftzAu/EecGumXyMRkFEWjbiNX1f32aIMllytpjGB5KL0pxbcI7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bEjYriLG; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bEjYriLG"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6b1afdf5196so371779eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523474; x=1789128274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=45a89UjRbWNWb7/GnsM0msepV7nJy8o7xzN6rsFFgTI=;
        b=bEjYriLGG+Od733d+V26W0wGlUkxVLC+05UU77y5p9gbMDSeR5WIrumOjBqa5JeK+9
         SKyig2gnA+h5kxpuJbkBuAqgkZ3dhJOVaKW3CCLsmtXbW7y9TMCPcrEr12R+58/FkCdi
         Nu51uWgTfwtJls9ViA8cJDNhBmaQ6LtCbhV83U8xEeaK/dZ2FTsXMQOe0GcPuSI9xnml
         Q5llIeYnkiaa7IsZnEKsvXm3a0hH30ufBI59174BgKVPzsLn+RfNZAwo9J3mzNoWM0AU
         cHzOIs4STqxfWZL1S/eYi4GXHwqP0xURW4kebNeBDoWJyiM4hGdUffft9t4wGRZb2muf
         OlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523474; x=1789128274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=45a89UjRbWNWb7/GnsM0msepV7nJy8o7xzN6rsFFgTI=;
        b=TeTGOGh1AUlLjCckWCB80gotpi0ei5eMB89vaGXZRQNsRtVKWAPQ/lvD66O4pzSO3I
         j6xUOEd/KCGJf0qwGxVG3jsJ0fU5ikBepnojRo/XUI24DwxM5E6q07uyB65sskFwox6p
         Cmbg+Zumdill97nC46VGR1Tad1GJ9PYsgD3+uPbm0lNnCiKByj3dCVV1mMLK4zkMd24C
         mEO5ffnMWhGPEzadPgiHGLtNhzffE02liog6icT63Jg0n8RbEKQK1AWO5HaSNFEd/Fch
         uFDufgz5L0QtFXdPbcmU1t7xsizkhdTS7xqjnd3vFleNN9wWzf8Kmhl5ir2/AV0stsqV
         32eg==
X-Gm-Message-State: AFuF++k8zbgEgZewdz1zkJXIfYGzWmil7JkpQxo1c03+ERBZewBDd43o
	Fh219hpOaJIUmCihQYKy1ZbIYwcRtfbdBmbAkjHA2FbU3dYijXTIWJvLiTg7kGZwSFk=
X-Gm-Gg: AYBFou0Rc0j2yI06VV6p6ctizYssrZ7JHWkiOTZBcGakxlqUWVGSsaRQ+WY2nLwWUfW
	AgQIo55U1yiA+dCbbd9W2Bw9CrHEFPWcarkrPUSQMyDqTmz0UT1IMqJB3pMYvFN+a6s5rtvoH0g
	9XGabHYn3YM+D0UU3JRJvJUsPgX7SlM+FspbsFEvSOH3GQa/9yKkhHqP7V8UUSyMpVOqKLKMrpS
	EO1P9Co1tyepgkKed49QZgsrcA7/s0cgj1pT0bnwUfOWdieB9Kjaunq6TVHdfx44DWYlFWP2WkZ
	t6NmvlcWUS2mlFjOpahXALG79E/G/Unu6m5L0HjYo0yFg38S9vjnf5WOhwqpd9uAvQNbnvY5TlC
	0DZoJQDzgfdhVW9aycU0D61boZXJu9qops1/Whc+Udn2AIPjqA7LzPyHBIyU4dRJVoAztx2mXIq
	frjkZrhF2vj5yVn9Eyfi1vQeXwYziNfTMpJRVsFPmkiuFTnLWSAlYZB7aw8064qVC8DfnX2NXkm
	hQ400n0Uk4QjoY=
X-Received: by 2002:a05:6820:a06:b0:6b7:46e9:9708 with SMTP id 006d021491bc7-6b746e9a219mr2090272eaf.56.1788523474232;
        Fri, 04 Sep 2026 05:04:34 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f787esm5770422eec.23.2026.09.04.05.04.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:04:33 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] drm: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 17:34:15 +0530
Message-ID: <20260904120430.17224-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 3 misspellings and repeated words in comments.  Each is a
separate patch so that any one of them can be dropped without touching
the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (3):
  drm: fix typos in comments
  drm: fix repeated words in comments
  drm/vmwgfx: fix repeated word in log message

 drivers/dma-buf/sync_debug.h                           | 2 +-
 drivers/gpu/drm/bridge/parade-ps8622.c                 | 2 +-
 drivers/gpu/drm/bridge/samsung-dsim.c                  | 2 +-
 drivers/gpu/drm/bridge/tc358767.c                      | 6 +++---
 drivers/gpu/drm/display/drm_dp_mst_topology.c          | 2 +-
 drivers/gpu/drm/drm_drv.c                              | 2 +-
 drivers/gpu/drm/drm_syncobj.c                          | 2 +-
 drivers/gpu/drm/gma500/oaktrail_lvds.c                 | 2 +-
 drivers/gpu/drm/gma500/power.c                         | 2 +-
 drivers/gpu/drm/gma500/psb_drv.h                       | 4 ++--
 drivers/gpu/drm/imx/dcss/dcss-ctxld.c                  | 2 +-
 drivers/gpu/drm/loongson/lsdc_drv.c                    | 2 +-
 drivers/gpu/drm/mgag200/mgag200_g200se.c               | 2 +-
 drivers/gpu/drm/nouveau/dispnv50/tile.h                | 2 +-
 drivers/gpu/drm/nouveau/nouveau_bios.c                 | 2 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c                 | 2 +-
 drivers/gpu/drm/nouveau/nouveau_led.c                  | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxnv50.c       | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c         | 4 ++--
 drivers/gpu/drm/omapdrm/dss/dispc.c                    | 4 ++--
 drivers/gpu/drm/omapdrm/omap_gem.c                     | 2 +-
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c         | 2 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c       | 2 +-
 drivers/gpu/drm/qxl/qxl_gem.c                          | 2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c            | 2 +-
 drivers/gpu/drm/scheduler/sched_main.c                 | 4 ++--
 drivers/gpu/drm/sun4i/sun4i_tcon.c                     | 2 +-
 drivers/gpu/drm/tiny/panel-mipi-dbi.c                  | 2 +-
 drivers/gpu/drm/ttm/ttm_pool.c                         | 2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                         | 2 +-
 drivers/gpu/drm/vc4/vc4_regs.h                         | 2 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c                 | 2 +-
 drivers/gpu/drm/vmwgfx/device_include/vm_basic_types.h | 2 +-
 drivers/gpu/drm/vmwgfx/ttm_object.c                    | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                    | 6 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c                | 6 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                    | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c               | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_so.h                     | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c                | 2 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c                       | 2 +-
 drivers/gpu/ipu-v3/ipu-prg.c                           | 2 +-
 include/drm/drm_framebuffer.h                          | 4 ++--
 include/drm/drm_plane.h                                | 2 +-
 include/uapi/drm/nouveau_drm.h                         | 2 +-
 include/uapi/drm/vmwgfx_drm.h                          | 2 +-
 kernel/cgroup/dmem.c                                   | 2 +-
 47 files changed, 58 insertions(+), 58 deletions(-)

-- 
2.48.1

