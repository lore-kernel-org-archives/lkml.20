Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835633;
	b=FgOAkKtwf2WMuy39t0X2hpEoLfbEmeDFVyR1eWBzYyxcEFFC4KR/lIHvVctQoURjb7U2
	 yuht06oAtsiz+KOhXdOkE0SzudtIeF4pwlbu1bnpsLdVh0klWRfhlj6dhbyPGYgc2hwg3
	 AQkxWQNYUUN2yMEKYlEJrDmoD8OcxYcSqpxhKF/k1dsjZQjERUgv8chApF3OK1ZUc9ceb
	 Z1cZp1a9Sxm4IWj8az+JgWHNCUuon743TftKosTrMjamqKJN+xcaZeM53UCQHEZIlAcOi
	 wh930LI7CPqG5HkZN4tXfz4y2qJealvGl7SpRx6GvcnkrKInGngulffG0VWHa40clFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=94xtLomK+CyqBLZNf/PCrMcMfF2GAQ3+kaMZqvfy240=;
	b=ew14FaY2VgjyWbXUHkiGEeG0J5bGYnM/IBS/DxSVm5jF0XRmTbC5NDV8Y3xqniOI+6gA
	 /c4gs2/Cj8zIB6E5XoU6SHOgzzkbdVLN8UU8G846d08ujb5C2dwL0YnMT8L21tYaW8e+M
	 Xcz4ZhZaRHygOElyu/aq/pzls4zWoj0hBYpqeEUIlFJuE/SdSlwEtMfNZnwhT76SbNyjQ
	 DpPdI5TB7pKQF+HBNm3lS498OSjS4jMR2+C0BnQhaLyEYC1kJPTOgnAfVNtYHcZfGd5/W
	 WPXcBOM+jemYVvcYOo85zURjJlD+f23XiUxCZR4jntCizuczM2IpE2af0rBUmRi8jqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ew2T4qt5;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27319606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27319606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ew2T4qt5
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492f0a1b685so2462008f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794835631; x=1795440431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=94xtLomK+CyqBLZNf/PCrMcMfF2GAQ3+kaMZqvfy240=;
        b=ew2T4qt5I+aewOOOCVZ5zPre6GIOxjpNdITV1zYAKvkZnUDUKajoJCgFB8hbMEzYVI
         pJqqPaPJulcNSAfLZM1LAqMt5NrEwgGsMYWc9IstbDvzut71TtiDXcwKWsED15hNE8P5
         6Krbc0fdgYIr9bv6Wxo2/x9r6DP4GOgJ/JWYH9QTK23CP/R1DnTkQex/ELbnmYY9CoLt
         T6CtgASVHDUAtXzk8V6p3cBexfV1qFPkLrP73I8LgGEJPzAjcu0Y2OpAKJugTtSdSEVZ
         zO+8PVRCzR7Q0Sf1fC8fVmY+CTSArtzkIDBrKk/MgLCoklRh0zibd9rnt16UEiY2v+GD
         zLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835631; x=1795440431;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=94xtLomK+CyqBLZNf/PCrMcMfF2GAQ3+kaMZqvfy240=;
        b=pjylSje0pGXwSLur/bkqlERlUr0etEj1mWgScT+lLP8kZAqHK6cqG8JpYeQ6gle1r6
         qfF5kLJtWqwW28QyGwvkFiH4CYm/3bi9FjXEBgnYWomzL4olN6e4xBKjf7yVpJ/0WeIR
         fh2EO6h9zHnPUctgrEWFEM9dMaRthDISIbWusoIuufWpdnenKfc19K8b3DxreLQBQOEN
         9sJBjCFgXU/7Pi1lolEIWXUFGBraqa3UttCnTvLuDcOJc7EEni23UldHP85a0rBTEiva
         crr2OkDx3IJIxl1LcEK0ZugLbHqCYecC8dCm3IasiUOBnHF+6ewsETNu+hp84fPGFVW1
         2Udg==
X-Forwarded-Encrypted: i=1; AL+hErGhJrHnsXr7+QS+jvlFH4sJzyrbtrZn9b2a6whWv5ocIVhIndVrl4+vChkDXHlK+pkCDq0Zsj+Nq5/CHdk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iAhxIw9PwbH5jlsnzc7N2Z4qkJjQBG9WHFWqYeRK74nuOPfL/
	H9hXoNgzvs4gHy20TAfOybMNVZo3fUQpjAIMQ+3mxTBncAGX/3FT0pCi
X-Gm-Gg: AZFdTZf94f64qAlwq2AufWCL2IRhmRGnXD2+SrrcR11gj0Ert93RwaqfNPOTquFDIFc
	MuL2yW5lMWzwafwd7LsNa9yNOl123tuItBNBopG0wQzJlzOaxWBec6b1tW2ESZdd6Xe/Vqzg6tn
	JSMWKMJYioehD3DjWi47CCYGMJ2ffE6SeLHwELVbpZ2kHcKgZM4l6+ORvogdpeVIimzWmG4Pggg
	HJJmK9DK4O0WeX3XvBuQCn2ofAV/xhgWF5B0AiHb67KVC2eCXtOYPVPfxavjXlJL6Y+IR3eOZEG
	eUvjEkLd3Sw7jZStHG4FjInG0fehGy9Ngg9rkf7Ma2pilvPpfBxWlL4HYy0S45eVTHGqDrvyc5P
	IdM3egc86dFBOMJH1u9eudvP1XTmKyds7AFL79dMh52NgwiO/QwZNaSRneL29c+LL61mDL/BBrk
	9pQ5wL3SoT4buQcTAEBF/7oY0uEsRCFVkhpMTdjQ8dxFW01S1jGYEsFnFvYHVA36O7qccV3RsIM
	xPbY459TOoC/4uJaxk1H5vnf8ELoaKJzPhx96N1BHB8Wn60kukMlrD2oqRfLAHV2X8XB8Qd4KGq
	Jn9oZRD5JcHIeDXxiEhPIfiDCTgqIW6cTgQtlCGejRTjkiEC0C/vJqc=
X-Received: by 2002:a05:6000:178d:b0:493:f3f2:2241 with SMTP id ffacd0b85a97d-49c713adf02mr24690275f8f.23.1794835631363;
        Mon, 16 Nov 2026 05:27:11 -0800 (PST)
Received: from ingenieria31.oficinasStQ.local ([79.117.0.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c8d286480sm40370240f8f.7.2026.11.16.05.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:27:11 -0800 (PST)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/4] drm/tilcdc: Implement state readout
Date: Mon, 16 Nov 2026 15:27:03 +0100
Message-Id: <20261116142707.1299360-1-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Maxime,

Following your suggestion in the boot logo thread ("just implement readout
then"), this implements hardware state readout for tilcdc on top of your
v7:

https://lore.kernel.org/r/20261029-drm-state-readout-v7-0-25e5163d75c3@kernel.org

The goal is that the kernel takes over the display as U-Boot left it, so
the boot logo stays on screen with no blanking or flicker until userspace
replaces it.

Patch 1 adds an atomic_sro_install_state hook to bridges, and patch 2 uses
it in the panel bridge, which also reads out the connector and bridge
state: without that, the core discards the readout of any driver behind a
panel. Patch 3 is the tilcdc readout itself: CRTC mode from the raster
timings, primary plane with a non-GEM framebuffer (as tidss does), encoder
and hw_reset. Patch 4 keeps panel-simple from turning the panel off at
probe by driving its enable GPIO low.

For the backlight, pwm-tiecap needs a .get_state(), otherwise pwm_bl sees
the PWM disabled and sets duty 0 until the panel is enabled. I sent that
one separately to Uwe and linux-pwm:

https://lore.kernel.org/r/20261116142251.1296742-1-maximpedraza@gmail.com

Tested on an AM335x board (Fides T075, out-of-tree DT) with U-Boot
leaving an 800x480 RGB565 logo:
- The logo stays on screen, untouched, from U-Boot to userspace, with the
  backlight on all along.
- The U-Boot mode doesn't match the one in the DT (16.94 MHz pixel clock
  and slightly different timings), so the first commit with the panel
  mode does a full modeset, as expected.
- First commits from userspace: a framebuffer flip without modeset, a full
  modeset to the panel mode, and ACTIVE=0 then 1. No WARN or oops.
- With drm.atomic_readout=0 the old behaviour comes back: the raster stops
  and the first commit does a full modeset.
- Without video set up by U-Boot nothing is adopted and the normal path is
  taken.
- The SGX530 driver and a Qt EGLFS application take over from the adopted
  logo without visible glitches.

The DT needs a reserved-memory node for the U-Boot framebuffer, and
ti,no-reset-on-init on the GPIO banks (and on the PWMSS) so that ti-sysc
doesn't reset the panel enable and backlight lines.

The backlight needs some care. With the PWM configured by the bootloader
and the pin muxed to it, the handover is seamless. If the bootloader drives
the backlight some other way, for instance with the pin as a plain GPIO and
the PWM stopped, the light goes off when the kernel muxes the pin to the
PWM, until the panel is enabled. The bootloader has to leave the backlight
in the state the kernel will read back.

After each commit, the comparison still reports some mismatches. As far as
I can tell they come from the core rather than from tilcdc, but I'd
appreciate your view:
- connector_mask and encoder_mask, on a commit that only changes the
  framebuffer: the connector is not part of the commit, so it's not read
  back.
- mode_blob, after a modeset: the memcmp() includes the mode type, and
  DRM_MODE_TYPE_PREFERRED can't be read from the hardware.
- With ACTIVE=0: crtc, fb, enable, best_encoder and the bridge bus_cfg.
  The readout sees the raster stopped and can't tell enable=1/active=0
  from disabled.

Thanks,
Màxim

Màxim Pedraza Padilla (4):
  drm/bridge: Add atomic_sro_install_state hook
  drm/panel: Implement state readout in the panel bridge
  drm/tilcdc: Implement state readout support
  drm/panel: simple: Keep the enable GPIO as left by the bootloader

 drivers/gpu/drm/drm_bridge.c            |  12 ++
 drivers/gpu/drm/drm_panel.c             |  92 ++++++++++++-
 drivers/gpu/drm/panel/panel-simple.c    |   4 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c    | 173 ++++++++++++++++++++++++
 drivers/gpu/drm/tilcdc/tilcdc_drv.c     |  22 ++-
 drivers/gpu/drm/tilcdc/tilcdc_encoder.c |  29 +++-
 drivers/gpu/drm/tilcdc/tilcdc_plane.c   | 106 +++++++++++++++
 include/drm/drm_bridge.h                |  12 ++
 8 files changed, 442 insertions(+), 8 deletions(-)


base-commit: cf5d8e390e2ac2cfa24a50645efdbb9f0eebe65f
prerequisite-patch-id: dd600a02afa073bedc54e8b973d6bfdad7594dcf
prerequisite-patch-id: cb32051331d83506b8e6fd512f93595724905a9f
prerequisite-patch-id: 72acc5f5b50b767484ff995256e7fb155c05f6eb
prerequisite-patch-id: 20859bdf469e990a0d7dae3498bc90452afac2b6
prerequisite-patch-id: ca629fbb440fc4bddbf5594161eb44aadacbffdc
prerequisite-patch-id: 1a6e113d6f412d798052a924269a7dc876d91ded
prerequisite-patch-id: 8eacf9b84574fe303134a78ce9c3fcc4ec1c8dbf
prerequisite-patch-id: be45e01b10b8b0050199e379d51d80866c9bd60f
prerequisite-patch-id: 0ab25f681f68659f8a0e4f0da80fdf70952dcf8d
prerequisite-patch-id: cd456ec3d0c297910f46bbc02fdf105dc1881528
prerequisite-patch-id: 8f0adc84c688489feb0cba21f1f2292be4229095
prerequisite-patch-id: 86ba5aa9cdc784c0b7f1a63beb76925ef26a51f4
prerequisite-patch-id: 797d3d2c63a2772528c850d5058e11d064e13b81
prerequisite-patch-id: a1f2f5aa788a1615c521496408c8380bb076a906
prerequisite-patch-id: c9f90931b72f402916621991a8a8abf6f4b5ffb5
prerequisite-patch-id: e0e184d52d20bd622b3752ea73516698bedf554f
prerequisite-patch-id: 9779c50d8b08c7d2ac14017fe2825d148350e434
prerequisite-patch-id: 2dfe6357a636b3662dbd8db80bc29bd36a0329ad
prerequisite-patch-id: 704fb943477b1a761312b0ec16e9291cad7c9769
prerequisite-patch-id: 0409704173cb408067b9e69071c0af7efe299492
prerequisite-patch-id: 455ce6bd7b211ef9c772ba06efefdffd27058a87
prerequisite-patch-id: 5ed7b0ed4e054ecbd8c84e622dbac0f42d60e4a6
prerequisite-patch-id: 563c77055b805b0d640cd8517627a8c491bce385
prerequisite-patch-id: ad8a0534dbcf96480f5020f50fd68d5b78c5fac5
prerequisite-patch-id: 8fe899b77403121b41514f93b859b5e4528a79d9
prerequisite-patch-id: 4fafee08b92675ea8a6f7fb5e27ff5a769325208
prerequisite-patch-id: d7abc61edebf4b3a87d94806301a99db4e28c036
prerequisite-patch-id: 615c6d4def91d820c55f9f05afb0086734c770fa
prerequisite-patch-id: 67a600dbc806b7426a5f48b11413d3716d4729e5
prerequisite-patch-id: 86db1a90ea3b2e47a0e082b33d4f9ee5c79782e4
prerequisite-patch-id: dffc8a4bbcf134bf21a86cd197deefe5143b7210
prerequisite-patch-id: d1dea459f43a2541077a882c3282b806a7dd5ecc
prerequisite-patch-id: 0c8a54b1f9bf053b817e949eb82538e7a0630d01
prerequisite-patch-id: 4582389780efd509f9713da8c161f497f2d89bc8
-- 
2.39.5

