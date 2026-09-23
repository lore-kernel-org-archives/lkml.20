Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C46B57C736
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194046; cv=none; b=lP9TaVd/qSSK4LROcguIEyG+1NN/7hL6GWz5VCXnOeJNksG+WirR7EbaulxtPOAEPOqq6idwEOGFAKpxjKEq9j2rYWXwb9tRJPKgAvOjCFISF7rQ2iGDA8SQnuvHhmyuIVaf2+aA0KUsmvxM25ov34ttcTjaiSxyUxB3Lsgares=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194046; c=relaxed/simple;
	bh=VcbyOqt6Sge8WI94gsu2VDu7+1RDaQRpMTyR95ubKTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kTBZN6UFY3b4UpGOHHlmm05rCWAnySmpsg3302aagabLqPogH+Al9JnNYyMI9ML/xhOfSCPMF508br3tB0JGmkmhunzQra31fbSp5Upf6YwDe1NR5xhxqBMbw4w0VSgk9ZUalotFceLpYoWCpcY1gH9lm/PkWD8Rhc/de08Ep7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdck5BUY; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdck5BUY"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab1ef11so1251656d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194039; x=1790798839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SiHJ4k1HZVmizz1HUvNw+RWE7k7KrIF+LVqXP7p65LI=;
        b=hdck5BUYoe++YP6TLlwNwrNMAwelFg8IVXT6k256Jq8YyTDN93529OjuXus4a7tD/x
         7gym8EQXqaKW2XZQVEyoz8fSGkVyhc0B4+hK5VfiLelLjOb33m1bPisM+QsbVSWP8gQf
         giYFCNjNB0ouNS8mw2bgvhgfHtAbz9ZVcnC97+89SPcHj5gIOWHwTG6ltCRJOrthujKR
         oI8JtFH73WVACnfQbpGSqY0VN7Z0uTFHL1lDHzsgdikRwtok60OCaf1E2mihw6kpbL9O
         9SvzTpw7OuvoOLtzmZlS0IGKVTivGLnmZyQacxf1XdMPmrt8Xh1m4ErPDkdj0GpCzeSY
         96dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194039; x=1790798839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SiHJ4k1HZVmizz1HUvNw+RWE7k7KrIF+LVqXP7p65LI=;
        b=N9I5KrBni38NX/UCgBfzkhLPLKMqf8V1RGNlk0cB64HgQezQh3q29LjaO9iC3HAiw4
         WH9B7P6bmgaYZCys7JAxHWPJw3qH3rtI5d8Eh89j4why7oPim4JlAcOPMHbCzI6JZ5qa
         5PJkuphyn4E8wTrX4MO13FBsVrXQ0I/pog2br+at+US+hpqxCzAi8ABRCNZJePcpk1X1
         yw4Tv2QmstnA74JnLnapAY9eqUZqf2tWhOmBWQICoj+f5z7MTt1N/N7tyAYl97BZUIBx
         hdsdyRlvgREuo/B1/jfeXot4b3DZvmh1cUcknQ/HNvzb1dRnMaklii/MjXofRjI+yzAq
         q5iw==
X-Forwarded-Encrypted: i=1; AKwUvBwV1JdfAaZa8pQjlTDm/DL2YCPXwikHXX7VFpTe4b63AGRp4JyLt36nOYmIbTcnyiaMIwio21QI2IEczmg=@vger.kernel.org
X-Gm-Message-State: AFuF++m+0NQ4YBLKgalcJDPRrBH3RMl0Ale/7jGLJeJxwFs2rXla0fL1
	shn1f8y1lpBb3Fgk/ThnF1o9qJhsQoiCCG1Kf82ATwoyhRYD1KiYk9p3
X-Gm-Gg: AYBFou2l2BXHV+5eD30qwjPgCOYQvT5ZxlsXtyMmf/QBUpRvTjyYogehx6pyb9WvWb7
	tXpwUdTbkau4FWy4IN35RXPSQSih69dJ0JvTRwHP1SYkYB3E6XgHEuKSD6se5Uh7YMkUBXMVpy+
	AA4qrmEg2bm5cK6QyISTtN4RWxwC4c91UAh9t8BbRCcOD5e81yJiGks1yceud8MdPlHigBMdqWM
	kZa7sdN4vVa3XZ1iBKKz/iHEXqcfITbea/+qTCTdhHfREcz6vzzJ6LOBhjGb1pOgN9N/NALlv6+
	PZBrFEphUZ3Ci+L7FwOUVgBpJ6S2P0DLL4cfwXWfoK8VQrCoNJqXMNhSrubB8nitcrTn5yEfqWZ
	vuXnIjLseTYuvE5vSfMDo1jsMgLJF1caB7lslcM1DzwAyztjtC+lVwXqxjlyA5eYuSNZctaomyB
	+aamcsvKj+HyEwM4mNoW9hxb1g47oKtfK53BQDy+PwFQpn6mAEKOKOLsB+1stoo0GL+l8Dq+l3R
	69sdbEVLg==
X-Received: by 2002:a05:690e:814:20b0:672:b676:c1ce with SMTP id 956f58d0204a3-672ed228e6bmr187635d50.9.1790194038864;
        Wed, 23 Sep 2026 13:07:18 -0700 (PDT)
Received: from DESKTOP-TLFH1MG ([76.255.203.42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-672d80bea23sm1221915d50.10.2026.09.23.13.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:07:18 -0700 (PDT)
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
Subject: [PATCH v2 0/2] drm/mipi-dbi: display a cropped region of an oversized framebuffer
Date: Wed, 23 Sep 2026 14:57:10 -0500
Message-ID: <20260923195713.88-1-frazinjonathan@gmail.com>
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

Tested on hardware: ILI9341 and ST7789V (through panel-mipi-dbi), both 240x320 - an oversized framebuffer is accepted and a non-zero-offset panel-sized window scans out correctly; a panel-sized framebuffer is unchanged. HX8357D was tested during the downstream review by Dave Stevenson (Cc'd). ili9486, mi0283qt and ili9163 are build-tested only.

Both patches have been carried in the Raspberry Pi kernel (rpi-7.2.y) and in use there: https://github.com/raspberrypi/linux/pull/7589

Applies to current mainline / drm-misc-next; the touched files are identical there.

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

 drivers/gpu/drm/drm_mipi_dbi.c        | 33 +++++++++++++++++++++++----
 drivers/gpu/drm/tiny/hx8357d.c        |  8 +++++--
 drivers/gpu/drm/tiny/ili9163.c        |  8 +++++--
 drivers/gpu/drm/tiny/ili9341.c        |  8 +++++--
 drivers/gpu/drm/tiny/ili9486.c        |  8 +++++--
 drivers/gpu/drm/tiny/mi0283qt.c       |  8 +++++--
 drivers/gpu/drm/tiny/panel-mipi-dbi.c |  8 +++++--
 7 files changed, 64 insertions(+), 17 deletions(-)

--
2.53.0
