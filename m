Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E3158E2AF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066266; cv=none; b=k/8UTXP6kQyQgKzGmLjNVCHkP/S+dUilJ0uNBzfzkJOcGAelO82XFBszyRaI31r0D5MwPKNKEzm/47lI9+FtYcJGfcbxLVkKCXLbuVGf6BycQP5FxhjUWFzvTQkark9hUzHRTcgfAmpP4E8R1Bt/owkGdsBphuxYbs0pRJcK6oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066266; c=relaxed/simple;
	bh=zg4ZXoQW1lBVXevyB7FHyoLPVQea+sda59vxlY0CKlk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SCR3i9p8QsF9ELkw/pi3YCdZCOGMH+0d0ADzqquIRonotSG6K3jVIWZMPuj6wQTNG8fNp4A1OChytXltJ0cqWZzW3WV/YLRKw2kKIdf8aXuokmDDyAvajHg7We/gCKnqYc2fuxJwym6gFjRV7ZWx3XWzCw5PFcXK+PyFAQW7TXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUwe7e/M; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUwe7e/M"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8565d77c277so235877b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789066256; x=1789671056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Rfwhxk1A76QniOAI6EKL6UVagwZS9SNuRHfI/gzEVs=;
        b=HUwe7e/McKQ7dENfXcgIXRNFIXioAkqcNYeI1MDWoKUXxKfc1HcuRZfr6tTvUVrwl4
         qXGCfs7KqVkoA48XFTA5W9lXugag4/rDvAltHDlOB3qVxf0R4Uipy8FBP2RXUAKYb/18
         quM/8IGQsu0KTgavhRhJu0MhfHxMZ5F2WitYdMqAqJ800N3nzRQKiCVdARvcOKxJe/Gs
         siqfsVxLgZEzEiVE3MYoko2j5QZBzQhq5CxcBkRc8JKa6Z36VLq5sbrxY9+sDeoztyKR
         nfgAexEzW7QmFLCd+IbHq2NM5e5wxdQNuR3daKk/4HZLcAYHa0xQoLvSfB/dlvvvlV87
         yjDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066256; x=1789671056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Rfwhxk1A76QniOAI6EKL6UVagwZS9SNuRHfI/gzEVs=;
        b=hahnf8XzEmUJTzc2lBxS/3uVl1tLSehyZefXZzyCi21LbDX8p/B2kAWrY7o2mMdZiw
         7kaFPy0I4ugOBB94rrSlouuM5u7fv69BhmUpDarC8Lobr6smrgaxCtVQE1Z7cFAgG505
         sTMHt+zO1ox0N/8ExHAr3EBRfh1R8REp9SwcYWfnOQzdCXx+ehSoWdHt7GQT55frh4Y5
         Ua8sf1+oE1NiJ4GmO4MRD73/f84d3iEo5wwdDhnJqy+I4re5h0U/oSEpNl0uyJMGma4w
         UKpcNNGCs7QSYJJWGBEAfURR7WZUAF60Z8+E/a/aKYgCq9ZbR8bRWxUcjJWcL+q2Pssj
         P3eA==
X-Forwarded-Encrypted: i=1; AKwUvBzoU46HKvGeJA5Y4Xw+G6Zm9fwJTWNKyhveJRAlxY5CjJqQrGZ8X+eGngJ8OR7jYLajUrUMQe2GIdqsCRQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mpu+zzwUYwhdkEeOOZqc65E5/vSDn8IyGa1WLTNfEYypeQrBUa
	BFnz5pQZHobrk/r9iprTnn+rB5G1LAv6TlrMUhN/KRoA12cZXLWUKoSQ
X-Gm-Gg: AYBFou2Xj3ZCTp96zOcN318DgcECKwz7nzupRoAWPkJEDW4ALdCqHdX2uDbrsaAvghI
	OPGiTm6RLOqzEAQ/P9DE/t6LEYrQxBb5XUmHZmFMqYotWUJ1EXEYcznajRsaN8TBAotfTBrKbO2
	JCjSQOPvIkit3llhIJa4f5LOiiobQdlElkiKGAnrzcNdPysOX8vWWa/F2WHF7zkw0yqaq5rEn3N
	Le2f3t+0enmMUCwMdElufzbrJc4uoMQw/6/9d820OpoBPKCgxnUa7K/b3CIb2+A3CXg6+M5bZZ4
	sNK4kf/tuyjatF4mRzsVdS0MYMI8zbVV2R6PDpcabQTaU8UOHblhXxbZVadHy3K+lVcR4fWWLxd
	fXHdpIgi7VDrbc8kse8Aq0f/aMD7clUoU8vv/IYCoVgfL73VqAR200kCT4ZRawj9O9UwPhLatKc
	7RTNWFjk93aJsosX6Krt3EseeWFY+Rtodi9cqyFtWFl21UWITWMp5KDOgfAfneyN+MC8ToFauPo
	G5EIaOPOymPqn4RyyaT
X-Received: by 2002:a05:690c:e3c8:b0:883:2240:7df1 with SMTP id 00721157ae682-884b2eb25c0mr4391407b3.48.1789066255746;
        Thu, 10 Sep 2026 11:50:55 -0700 (PDT)
Received: from DESKTOP-TLFH1MG ([76.255.203.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-88486086a50sm3291707b3.17.2026.09.10.11.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:50:55 -0700 (PDT)
From: Jonathan Frazin <frazinjonathan@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
	Alex Lanzano <lanzano.alex@gmail.com>,
	linux-kernel@vger.kernel.org,
	Jonathan Frazin <frazinjonathan@gmail.com>
Subject: [PATCH v1 0/2] drm/mipi-dbi: display a cropped region of an oversized framebuffer
Date: Thu, 10 Sep 2026 13:48:55 -0500
Message-ID: <20260910185030.870-1-frazinjonathan@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A drm/tiny MIPI DBI panel can currently only scan out a framebuffer that
is exactly panel-sized, always from the origin. This series lets a client
allocate a larger framebuffer and choose the displayed region via the
plane source rectangle - a crop / pan with no scaling.

Motivation: feeding hardware-decoded video to a small SPI panel. The
video decoder emits a fixed frame size; being able to point the panel at
a panel-sized window of that buffer avoids a full-frame CPU copy on every
flush and lets userspace pan/centre the image.

Patch 1 is the actual fix - mipi_dbi_fb_dirty() addressed the controller
in framebuffer coordinates, which is only correct while src_x/src_y are
zero. It now subtracts the plane source origin.

Patch 2 raises mode_config.max_width/height (pinned to the panel size) on
the six drm/tiny drivers that flush through the shared
drm_mipi_dbi_plane_helper_atomic_update(). ili9225 is excluded - it has
its own flush path that does not carry the source offset.

Open question for patch 2: the six drivers each set the limits identically
in their probe. This could instead be a shared helper (or folded into
drm_mipi_dbi_dev_init / the DRM_MIPI_DBI_MODE_CONFIG_* macros) so future
drivers get it for free. Happy to respin that way if preferred - the
per-driver form is what is shown here because it is the smaller diff and
easier to review a first pass.

The min_width/min_height, the fixed mode, the connector and the
mode-sized transfer buffer are all unchanged, and
drm_mipi_dbi_plane_helper_atomic_check() still enforces DRM_PLANE_NO_SCALING
and no repositioning, so the flushed rectangle stays bounded by the panel
regardless of the framebuffer dimensions.

Tested on hardware: ILI9341 and ST7789V (through panel-mipi-dbi), both
240x320 - an oversized framebuffer is accepted and a non-zero-offset
panel-sized window scans out correctly; a panel-sized framebuffer is
unchanged. HX8357D was tested during the downstream review by Dave
Stevenson (Cc'd). ili9486, mi0283qt and ili9163 are build-tested only.

Both patches have been carried in the Raspberry Pi kernel (rpi-7.2.y) and
in use there:
https://github.com/raspberrypi/linux/pull/7589

Applies to current mainline / drm-misc-next; the touched files are
identical there.

Jonathan Frazin (2):
  drm/mipi-dbi: honour the plane source offset when flushing
  drm/tiny: allow a framebuffer larger than the panel on MIPI DBI
    drivers

 drivers/gpu/drm/drm_mipi_dbi.c        | 14 +++++++++++---
 drivers/gpu/drm/tiny/hx8357d.c        |  8 ++++++--
 drivers/gpu/drm/tiny/ili9163.c        |  8 ++++++--
 drivers/gpu/drm/tiny/ili9341.c        |  8 ++++++--
 drivers/gpu/drm/tiny/ili9486.c        |  8 ++++++--
 drivers/gpu/drm/tiny/mi0283qt.c       |  8 ++++++--
 drivers/gpu/drm/tiny/panel-mipi-dbi.c |  8 ++++++--
 7 files changed, 47 insertions(+), 15 deletions(-)

-- 
2.53.0

