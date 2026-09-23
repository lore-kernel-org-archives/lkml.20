Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9C657ED83
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197142; cv=none; b=GQQ0BJQNe0YzHKeyIqDSvFIeqe3zfqawCEbq1eiluuwHOSpy/uYq5LKR9Qj+lV/vJOQWvlnTA+H7BjTglBvXMOF6ucvhoei74J69hfDdAZS1POY+x1XwE8k1b/gGSwyeZ7KhDsHVjOh1TQPCYYL2hhyCAu8mVESXEPIqwUmF4vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197142; c=relaxed/simple;
	bh=gjNgjwY8I5O0y8agYmSnDrcD/S4hWPeAuTwuDDRiAnE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PEQ0N90c4ve8vi/bubSr49gGdkryq7Esh1MRN5pNLkaUOJ1W46Lcu20185qqTsRsMo7h3nSUf1gQsVuNoYyJpg64xNT/8etGA1j8bdV6dCFaEChSN93pD2ftnqaXeUXOMA1C1KTVuLn5z42Fzs17bwv/w4kZJ8X3wUTNTmZimXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZPlmDOI; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZPlmDOI"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d43ac608dso19242337b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790197139; x=1790801939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LFuywSZ0HejhAW2U3ki+Jb3nu+U7WqN5bFOUzp+xE1s=;
        b=kZPlmDOIJyu+F89a+bWHiPAvWadIDX7ZcZIF767+iIijArk4RrsvSKpMKH/hlbxlok
         8MMXclIfVuYjI+HxBB1GFBaflQHkG7q4/BpsoeKotAnRjuaiLb3SW5eDsRaSjfUcacUM
         ao66QSKfPRKv+by8OwpQKA8LkDoiPLxFd7bvqPqcX+zDPhOlJA/3hy091xEF5U3wUMWI
         a7JRcsrXcN976LGg2SQvnMtweVuATIIxm2R+ija/AzuPIH99cE5rBX+yLtmwaHW7qJxE
         jSmig+CfY0B2gaGk5Oy1jTJP0uB2nmqg6FxXPi0ORY9m/Wvtn3uVGtOL2vVfr5A6k9Yk
         HrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790197139; x=1790801939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFuywSZ0HejhAW2U3ki+Jb3nu+U7WqN5bFOUzp+xE1s=;
        b=1jIJda4T21ofoOzfrbNKWP4+Bc+Jp9bSWiUeHUjrlcuBLlXi5bHGFKJjqiHcq5rq74
         PDR+zqbUmtD4DscgvaEH1HJaQocRZvoUM9CleAejLF41HrPdBCBPU+GXaHChwmIY5N18
         T5ggGEQXW9m6LCF8y7DCsKQ60zqpZlv/XDBVzFOI0gHfZ8Oyko395VbAlx69WJzdmAR5
         Ox15l+vBfjt3ZstSqNYJ0h0fXNU9BszWED5qBf8DrVvIHd6hASx53tPpRLwuClZOv+e0
         gPzdd+SoiO+SqWijhkpYDwksSn9PDebB3hhXA9D8cAGzZikGZBlzHnRIglv9XZKfmJ8X
         ixOA==
X-Forwarded-Encrypted: i=1; AKwUvBzcutDRgxEYViHiv079azNQT4q5OT4h6kvkpJFp+74I22+KFRGg/EfXbSuZ24nTlSmO0FVdLZqVUw39A+I=@vger.kernel.org
X-Gm-Message-State: AFuF++luul9PLsdWqkoMJzMYNOrWKHcKNsxgHH349tPiMWWy+wzmkewf
	3Q4dSz0QSsDv3wVVcC79rCwKZwV7Pz+60Jn9Vi370GGYxwZDOdSosLVT
X-Gm-Gg: AYBFou1m4DhM+r/w1GXB1eTtelKm9iqs73PAUKY4XqRLFSjFGzV9JjX0HG6jDZs4czm
	bG18boJO6fu4WPXQaSKE94WiUQDqs0/M++NYfzALr184E0e9kuCyYNrLlMO8m9TL+MHU13t9ldU
	XujdTpRhmSHYxa+QiEu2HuCiBF6CrjajBAeb+wdRCkuUbndBMCze1e6U9OVzs72mu4g7W1cb+Ah
	9ayVz4lcteW9ETo2djDu4LI9F6jt/cmStNykksoZA+XXITyRSVd+Cdx7a5PpwKVO2bmyDbo8RPl
	hSb5vL6YKwGr8PaqT8OAwjGf9SnlNMDs9TMy9drrZ8jZ1/hYBgMOkltzs3yYGI1a1P8HK4cS9b4
	s1BUMHYg2AdEa0tI/0IsZtVYL7+IQ2aqbqE2OxwUaFmCMKGn3vzbF/2XkIr5vCHE1v50+fyAfof
	CrhI3ZAwNLOpomOXq4mzM0FK7WZaFu+nylicvIt1i4RVMQTmFlWBtRyZpTVa6C+3RRoJqbmO7PB
	G//0y5CNQ==
X-Received: by 2002:a05:690c:ec5:b0:884:b55c:312 with SMTP id 00721157ae682-8a648ec512fmr3446857b3.16.1790197139130;
        Wed, 23 Sep 2026 13:58:59 -0700 (PDT)
Received: from DESKTOP-TLFH1MG ([76.255.203.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a65270b1e2sm1073467b3.41.2026.09.23.13.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:58:58 -0700 (PDT)
From: Jonathan Frazin <frazinjonathan@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	kamlesh.gurudasani@gmail.com,
	lanzano.alex@gmail.com,
	phil@raspberrypi.com,
	linux-kernel@vger.kernel.org,
	Jonathan Frazin <frazinjonathan@gmail.com>
Subject: [PATCH v3 0/2] drm/mipi-dbi: display a cropped region of an oversized framebuffer
Date: Wed, 23 Sep 2026 15:58:32 -0500
Message-ID: <20260923205835.3505-1-frazinjonathan@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A drm/tiny MIPI DBI panel can currently only scan out a framebuffer that is exactly panel-sized, always from the origin. This series lets a client allocate a larger framebuffer and choose the displayed region via the plane source rectangle - a crop / pan with no scaling.

Motivation: feeding hardware-decoded video to a small SPI panel. The video decoder emits a fixed frame size; being able to point the panel at a panel-sized window of that buffer avoids a full-frame CPU copy on every flush and lets userspace pan/centre the image.

Patch 1 is the actual fix - mipi_dbi_fb_dirty() addressed the controller in framebuffer coordinates, which is only correct while src_x/src_y are zero. It now subtracts the plane source origin.

Patch 2 raises mode_config.max_width/height (pinned to the panel size) on the six drm/tiny drivers that flush through the shared drm_mipi_dbi_plane_helper_atomic_update(). ili9225 is excluded - it has its own flush path that does not carry the source offset.

Open question for patch 2: the six drivers each set the limits identically in their probe. This could instead be a shared helper (or folded into drm_mipi_dbi_dev_init / the DRM_MIPI_DBI_MODE_CONFIG_* macros) so future drivers get it for free. Happy to respin that way if preferred - the per-driver form is what is shown here because it is the smaller diff and easier to review a first pass.

The min_width/min_height, the fixed mode, the connector and the mode-sized transfer buffer are all unchanged, and drm_mipi_dbi_plane_helper_atomic_check() still enforces DRM_PLANE_NO_SCALING and no repositioning, so the flushed rectangle stays bounded by the panel regardless of the framebuffer dimensions.

Tested on hardware: ILI9341 and ST7789V (through panel-mipi-dbi), both 240x320 - an oversized framebuffer is accepted and a non-zero-offset panel-sized window scans out correctly; a panel-sized framebuffer is unchanged. HX8357D was tested during the downstream review by Dave Stevenson (Cc'd). ili9486, mi0283qt, ili9163 and st7735r are build-tested only.

Both patches have been carried in the Raspberry Pi kernel (rpi-7.2.y) and in use there: https://github.com/raspberrypi/linux/pull/7589. The v1/v2 heap-overflow fix (see below) has also been folded back into that downstream kernel: https://github.com/raspberrypi/linux/pull/7643.

Applies to current mainline / drm-misc-next; the touched files are identical there.

Changes since v2:
- Patch 1: a damage clip that lies entirely within the one-pixel sliver
  the v2 clamp cuts off collapses the clamped rectangle to zero width or
  height. That was still being passed to mipi_dbi_set_window_address(),
  producing an inverted (start past end) address window ahead of a
  zero-length write - undefined behaviour per the MIPI DCS spec. Skip
  the flush when the clamped rectangle is empty.
- Patch 2: st7735r also flushes through the shared
  drm_mipi_dbi_plane_helper_atomic_update() but was missed from the
  original list - it lives under drivers/gpu/drm/sitronix/ rather than
  drivers/gpu/drm/tiny/. Added it, and confirmed by grepping the whole
  tree for DRM_MIPI_DBI_PLANE_HELPER_FUNCS that no other driver shares
  this path. Thanks again to the automated review for catching both of
  these on v2.

Changes since v1:
- Patch 1: clamp the damage rectangle to the panel's fixed mode before
  using it, instead of trusting it to already be panel-sized. src_x/src_y
  are the plane source origin truncated to whole pixels, but the
  rectangle from drm_atomic_helper_damage_merged() is clipped against
  that origin's exact 16.16 fixed-point value - when the origin has a
  fractional part, the rectangle's far edge could land up to a pixel past
  where the truncated origin would place the panel's own width/height,
  overflowing the panel-sized tx_buf. Thanks to the automated review for
  catching this.
- Patch 2: unchanged.

Jonathan Frazin (2):
  drm/mipi-dbi: honour the plane source offset when flushing
  drm/tiny: allow a framebuffer larger than the panel on MIPI DBI
    drivers

 drivers/gpu/drm/drm_mipi_dbi.c        | 43 +++++++++++++++++++++++----
 drivers/gpu/drm/sitronix/st7735r.c    |  8 +++--
 drivers/gpu/drm/tiny/hx8357d.c        |  8 +++--
 drivers/gpu/drm/tiny/ili9163.c        |  8 +++--
 drivers/gpu/drm/tiny/ili9341.c        |  8 +++--
 drivers/gpu/drm/tiny/ili9486.c        |  8 +++--
 drivers/gpu/drm/tiny/mi0283qt.c       |  8 +++--
 drivers/gpu/drm/tiny/panel-mipi-dbi.c |  8 +++--
 8 files changed, 80 insertions(+), 19 deletions(-)

--
2.53.0
