Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964079;
	b=qhyT7wMqg4PIseauXagsTdB9IYjCKz9UdWD+xND384AyV2eN9sHkQj4XoZqmFaEGXgyB
	 6iPpyNbl31HWOI+Mfmx8ESnuQzyS/1+II4zFjdNbpx46EDyKufHKlhejXxCPPMYnhXmzA
	 A5fRDsilhgS/hz3kmhZzWC8pnHTabwkWlw/OYA9uAR3s1mU7LWjfUybGuPFcbWnMEHK6f
	 QzsiSEkAyJnQ0uepMsMyRO1LX4+5YcZTpbYnvGpNgUnHn/K90giIuw5NbF6EHzmK0jqcY
	 dqmT5c2Vn5Di658+ZBtaKVoRcz1VXGh8DMBvS3jBAhGZ1QOEkicXCEJn9TWIBNn5O0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YbS7SiekKOpCPQzFzLejVy7uNAuDQrZb4aNVnuN+e7A=;
	b=BRgtlOz6fy+ILVwKbIrSaJcThuFpuXzPxBx2pIaqPxoVuKZtXBgq9O/rs9x9T4ZSYwUZ
	 AVTcRooo2l2raLVw4A4xTdYTEwszShE+IdrTT+U0YT+0txsoxTr0zlF2IpW/FBAjLSQlZ
	 I0KNe8vrbg6vylllEO16VTfZIYW50xhmxsz4KM/YQYiX+2Cv31BUrXh10JvCBNfTG42hD
	 xtz0pGgt8L74qhwO7MPLtPorJIi6+Bd/cTmd9o+7EKDtOgo+ZT3esOOVxu4p5txWuQ/Qq
	 v1MTysWgJL7CFkkieN/EULXaL7/jIMkzAHv1ZMWmwpTUBjp5IcQte6S+gUn3HOdcwGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WCtHerU8;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B06606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3B06606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WCtHerU8
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so4655945e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793964077; x=1794568877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YbS7SiekKOpCPQzFzLejVy7uNAuDQrZb4aNVnuN+e7A=;
        b=WCtHerU8FixV2pyNL7qSvB96nCGn0xqWKjMGu+wuMUTbAjYSnEXBA96VxrqVwKlYof
         33DUlPY5C1wy0JyB1ACrL7ljF2VqRJdMqcs93Bg4fhUZ1IH/zZ2o5xRqArF97nEvRB7h
         r7cp0uoXx8UmkRFqPWuC6XAH2z2aRkiqarsCF/MHwSkZTxjq6z6ou9jPxGaCUeLzTuRd
         1eD1NMJzf3dqnzn7WyTd3yTSMSzTHcjrDMCzMfCyZNtZbDUgscX6JR26FDbVLlYN0+o7
         qg8su5XCNfjJBmv/MIMe3+M6wa6TNBijQl64NyEUJuL0oz8WdNMQw9cy2a4jgwPL42k3
         kVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964077; x=1794568877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YbS7SiekKOpCPQzFzLejVy7uNAuDQrZb4aNVnuN+e7A=;
        b=KelzPa3y1oad9ruaKdmQQ7a1jlfow3jBh0mUEkvVsBq7q3RSXVtFmG5JP/qkJr/Yy4
         hLxUX5EQKrXugFdTVUA8aTj9tShwspYoX4hIHtrH6xO7VRkKWef/34pt5y8WopD/4tvd
         gS6i/7WswHfLGzqOEvHGAF6C0oC3HuauHJTGyX8m1t40mmkIh7MiznEr6h31E8s/lT4L
         xxjowte4XbqKy8QSDVACihAsLmpUe5oj0RdRODb+Nx5Qjr9QoWf60CmiOg55mI7S3M4n
         Z019C868ELTfjco/PpGIbiaSXVvPCZSoeYqNnIsrD/Sa6bIMhQEke9Clrkz4yuwhj2ZC
         fiQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMbynxUUhZbnpRwgANz+3TcMQiu83P01+/rVgMnKu8po2lzS1le1GKe+iPfqSbUNNtK6AOO0OfpwPrfIs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/XeIc3JVfVm5+Z+Ofz0XqzHN9MS6tqboeJsj6+WUMM6YYzsCu
	xRKFTuV75i29c2M8IVenuPOc9kxfNP9iQvouuPYFamtfBuRZ8+muYgZQOd4I09QcJ2U=
X-Gm-Gg: AYBFou33pJWfXOI9sAgkvdisXiUVo1AwYuv+YSPVlxUpodf5cilGM6I2DeiF47mu0jm
	sy8oG+ys1ULzwOwdQyJqd05gL5D8FuegpycjaovKwq/73KMO03wgSFJvNX8J3Qwk2FlMaGXng3i
	5Avhjs/g9DghiLXcBoTh0WG/K+tbn2QkfVMiL3KpzlteKnVk+/IduqYf0W1uv58ksddvFWUbn5Y
	k7EB0lkhysxxEq3/o1XohOgTdtE8D72REbZGDbWVWEm7qEH+T6zoVsz+VD1wI2KZBjjSAizowk2
	Ubxy4lhmr/DdGaXqyPqv7n27CKDA7Rzhk+LHYD8Kyv95noFFCeTvfFTmw6tNRfp/3KGuootp1eI
	T0HnySIOgkJH3QO1deCiZ2kJ8VYsViw2ajR1o0d+tUcLPpdTrTBill1dgCI5FySwfwxl2fExclt
	SRTyCaQwSnTKfV8/u3AYEbuR6N4tLuh2wpiS83oewA7xj+VBba8vlX9K2NWQuvBUz5PshYJxX3d
	SxOrpnRnB8wQYnMMUI/GahVwS45cWB9geVjMxDwuWwLYmTjAzsr2AiQGWjtLps9QeQGGtajiwCd
	xyjlBK3DYnOV+jgDMm7KD4XXnewacgj8aKVA2NuZEbr18ucf6q5wDhzy2bxNSII=
X-Received: by 2002:a05:600c:a013:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4b6e091ed5amr31326985e9.16.1793964077287;
        Fri, 06 Nov 2026 03:21:17 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5c25:f8d1:d9d7:54c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e2028d9bsm102404695e9.9.2026.11.06.03.21.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 03:21:16 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v3 0/5] drm/ingenic: Add the X1600 display controller and the HiBy R1 panel
Date: Fri,  6 Nov 2026 12:19:55 +0100
Message-ID: <20261106112000.1612-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The display controller of the Ingenic X1600 is not the one ingenic-drm
drives: it fetches frames through descriptors and keeps its interface and
timings in register blocks of their own. It is the X2000's DPU without
the composer. This series adds a binding and a driver for it, then the
panel of the HiBy R1, an X1600 audio player: 480x800 parallel RGB, set up
over a 3-wire SPI bus.

The driver covers what the R1 uses and what could be tested: parallel RGB
panels on a 24-bit bus and one full-screen RGB565 plane. The composer,
smart panels and other pixel formats are left out.

Two things come from the vendor kernel rather than the manual. A flip
also writes SRD_CHAIN_START, which the manual doesn't describe for a
running controller; flips without it were not tried. The panel's set-up
sequence is the vendor's too: HiBy calls the panel LG35583, its maker and
controller are unknown, hence the hiby prefix.

Changes in v3:
- The compatible is ingenic,x1600-dpu, and the binding and the driver say
  "display controller" rather than "LCD controller" (Nikolaus). The X2000
  and X2600 manuals call this block the DPU, and the X1600 manual does too
  in its register and clock names. There is no generic ingenic,dpu
  fallback, as writing-bindings.rst asks for SoC compatibles: an X2000
  binding can fall back to the X1600's. The driver keeps its file name;
  splitting it for the X2000's composer and interfaces belongs with
  X2000 support.
- 2/5: no $nodename and no clock-names; the driver takes its one clock
  unnamed (Krzysztof). The example's node is display-controller@.
- 2/5: there is no IPU in front of this controller (Krzysztof asked on v2,
  Paul answered): it fetches its own frames, so the output port is its
  only link.
- 4/5: reset-gpios, backlight and port dropped, panel-common has them
  (Krzysztof). The example's endpoint points at the controller's new
  label.
- Krzysztof's Acked-by on 1/5 and Reviewed-by on 4/5.
- Rebased on drm-misc-next after -rc1.

Changes in v2, all in 3/5 and all found by the Sashiko review of v1:
- Commits wait for flip_done instead of a vblank before the planes are
  cleaned up. A flip's event waits until the controller reports reading
  the new descriptor, which can be a frame after the vblank that v1's
  default commit_tail waited for, so the old framebuffer could be freed
  while still scanned out.
- A CRTC being enabled sends its event from atomic_enable(), once the
  controller runs; v1 sent it from atomic_flush(), which runs first.
- A plane that is not visible is rejected: the controller always scans
  out a whole frame, so v1 would have read past the end of a small
  framebuffer placed off-screen.
- atomic_disable() returns early when atomic_enable() failed to start
  the pixel clock, instead of touching an unclocked controller.

Tested on a HiBy R1: the fbdev console and a player drawing through
fbdev, blanking and unblanking, 60 page flips in 0.97 s at about 61 Hz,
and the colour order (RGB order swaps red and blue on this panel). For
v2 also: 120 fbdev pans in 1.95 s (one flip per frame, none timing out),
three blank/unblank cycles, and a 64x64 framebuffer set on the primary
plane just past the right edge through SETPLANE, which v1 accepted and
v2 refuses with -EINVAL, while a full-screen one is still accepted. v3
was run on the R1 with its node changed to match: the driver binds to
ingenic,x1600-dpu with its clock unnamed, and the player draws.

The X1600 has no device tree upstream yet; its support is being posted
one subsystem at a time. The R1's backlight uses the X1600 PWM driver
posted separately, now at v3:
https://lore.kernel.org/r/20261102201325.29507-1-olivier@mgcrea.io

v2: https://lore.kernel.org/r/20261025191640.13592-1-olivier@mgcrea.io
v1: https://lore.kernel.org/r/20261025085816.60405-1-olivier@mgcrea.io

Olivier Louvignes (5):
  dt-bindings: vendor-prefixes: Add HiBy
  dt-bindings: display: Add the Ingenic X1600 display controller
  drm/ingenic: Add a driver for the X1600 display controller
  dt-bindings: display: panel: Add the HiBy LG35583
  drm/panel: Add the HiBy LG35583

 .../bindings/display/ingenic,x1600-dpu.yaml   |  61 ++
 .../bindings/display/panel/hiby,lg35583.yaml  |  67 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  12 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/ingenic/Kconfig               |  22 +
 drivers/gpu/drm/ingenic/Makefile              |   1 +
 drivers/gpu/drm/ingenic/ingenic-x1600-drm.c   | 744 ++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-hiby-lg35583.c    | 342 ++++++++
 11 files changed, 1263 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic,x1600-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml
 create mode 100644 drivers/gpu/drm/ingenic/ingenic-x1600-drm.c
 create mode 100644 drivers/gpu/drm/panel/panel-hiby-lg35583.c


base-commit: 41ecf852c07391687beb129e12a231760b5d783f
-- 
2.39.5

