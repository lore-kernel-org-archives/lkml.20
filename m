Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851525;
	b=aZBdWInGLcHJIodLcqIPR2rZe9XkVJ7ZU0Bc7WFt5YHLGEmTj/P802PQdfL+biMyKCSn
	 jl8xxdZl6b2Dhl0mz0NM/q/qJT8UWaCDS1qEON1+OBtGH4/MSj8dq1uegHKkviu3EVYgk
	 mYCxm2s0PrC2vRlmfR+VfQmkmAJ7LvchIc9bqRoT+sl71aEH2J1Sa966Krw2sXWWvgXm6
	 bl/Vp6gi1YV1qTMfuALtikbbLb2QtPWsxELToj4DtzIciRfdvV/5ig46BLhCfB+Bwx3NF
	 RNp5cTNxi4PHaN8flAErRotoDRxd3pbemQZWZ3D6V7Sp8+BfG/4VbtIYsr/sPdC1SKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gyuCA352CKmEx6btp0JZpNwIO4QYJ/q79Bii/WWiLxc=;
	b=vbMOPcD4UW4HKBquWV6VICI1mKMz4+wMhFAtGNUpVi6lTOv27GzPvFtj5lUU6pA04S3q
	 jN2Y7IJrWWkWblnQ/UbdJYk7Ic7p8LBkQsPjuJxAmAw/0mnTFaIFMbipdQgmZy4aAPgM2
	 xdpZKw8ttDxS5REV/9P9K+skwfp2QwTnwfbsT9RfGq9x5cjkUjG3ivNJNNFfjmYqg5rwK
	 3bMwl+K4zZNQQ8/wXwvcxkWUnpFaTSM/VfINoE+10E5yOdcGG6xS7szAapys0m7Nnn6Sv
	 uJu0q7RnylXhztYXNt5RtSfg75HAZSq/JhlGDG6O+Sdkic36hdDiw3GbwYaloH+OQ6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="SvXohw/2";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F266606A895
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F266606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SvXohw/2
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so18996155e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851522; x=1795456322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gyuCA352CKmEx6btp0JZpNwIO4QYJ/q79Bii/WWiLxc=;
        b=SvXohw/2CW5oHL6eyf1QuCkPdTEqkgf/s/Tt0OZGyMBsqLktE+Fzmk02xmV27fy4cj
         Egy4bvVoISk8jdgt622SjxCykoWaAQ2jdIePpkp5n2HcD7t8N94pldaQXZ7X4NHQ5+D+
         IFpzkgl6l+3ROzx2eeb9SfFlZHRm8GW9W6TnLIcyEaGKU9ooIErEoqhgwNTDrRz6Eb5T
         GII9mg/VJjWqh3b771n7YYYvN03evDxjQO6rmvzLAlFH7+vqsUTZGrC4K2LSsmOExDaz
         cctBjOyjzZtyYfrFKUW+yeA/vSjxgV0WpQE3K2+s21kZ2s1Ktwo6Q7IpE0tXnR0klyrX
         N6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851522; x=1795456322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyuCA352CKmEx6btp0JZpNwIO4QYJ/q79Bii/WWiLxc=;
        b=O/8KVPtkViaOBt8L20M64c+HBLAc4qLUsPEpryPhSgvAk5saOXzAm/eSBDEVfd8FbK
         DdIIbd0DmRcqJ0RNvnGVki4BIJfPNHfgZE1q+1BLo7/u9m+5sgqjBX2Orh/AOtFR0JSP
         jIC5DIW6Y91AWzpt3KtOkAJzF4/a3qIgk2EPXbbjYooi09sJfsLIaEyPSwQIBFpcYgLd
         wGmJQmgnJZIzJrcRXBTaZU5bEtPngK39CXuxUAmtZt+dK0IK6JkWyncpksdMAyOSH34y
         9cO1k79KlFl4b8bOgnjbbmsz5dBNHZars5JAPZ09W4vWs4uvUkUVk9cOfQVkyO8YZwhq
         xd6w==
X-Forwarded-Encrypted: i=1; AL+hErH6rlnMyHNpIFZigWVypMCiXDn/w0Mqf6xW3XGtA9qL0R+OBui0lKq6II4aQoKdQnSp0zJUZ/sk8oWyn0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z85G0erXlEoFFgxW/tUqKX+P4wHaU6h3RgG9qEEMFbUDIpeLQVB
	fJKWCRFvrOn4eGtyht466DtxrcfgwLZyGoYSt/6NZnHaM00gN6h0WI9h
X-Gm-Gg: AYBFou0zEJ9LcauP/qa02r8lD4BkIpCqfUHMZjxA3O0K+HpIkrQALCqnoauZahLxiv8
	sV+2Wzut+itESQy2YBvS02tPPkItc0bUGaaeZffRq3Vbn46jxZukZMH9pJ8Wj+Udr+VKfm7d6Gf
	jCX9Lr/vjwYmRvLB0mA+hXNDD33uFElFi5342nfPqBXsRPvl2Jod7NuGqG7S0sWtoII89czavni
	D62tp5k95Yvq7F5jN1HwlKrdWBGwN+euAkUn7JunCq9TE5S+9cT15Nn7KEna1p8tpOdgnoVeQC9
	j9OMmwNp9eMfe5JM8LD3uq6jSm8sGPQWMwgeSG/I31outZ8kp14U8ybS4Wh3kGBW6uzNZFcfoPR
	hdfpYkIr953B+aC32cZKpEEXwxY04hk+k1p3l4YAYqFrtZscBvAF2I3BaTUr+eYuaj2WsKAPIEB
	18JZQ8UEDZsk1vCmlhHzCuUg/vUQ+huMwBE+kpBbICJ43TqIs4Ch7FDulSIE6wDr71cb2okSOoS
	KbmA47PcEzybs8Q8cZaU925xySAim2WVY7ZK9Pfg7zG6AtNu8AcplxPWWSZWIxgpCoLEcSAhKY9
	GjuxC2362tuhGYXqTkVfDFVAF628OENslLIDH4cfuqGYHwomM2MC8mVBvhQes55PaLk=
X-Received: by 2002:a05:600c:3d91:b0:4bb:6861:657d with SMTP id 5b1f17b1804b1-4bb686166e8mr143043725e9.21.1794851522066;
        Mon, 16 Nov 2026 09:52:02 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:498f:88ac:2ca1:60d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm4546075e9.12.2026.11.16.09.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:52:01 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Volodymyr Chapman <volodymyrchapman@gmail.com>
Subject: [PATCH 0/3] media: Add Sony IMX175 sensor driver (Lenovo ThinkPad 10 rear camera)
Date: Mon, 16 Nov 2026 17:51:48 +0000
Message-ID: <20261116175151.20150-1-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series adds support for the Sony IMX175 8 Mpixel raw sensor, the
rear camera of the Lenovo ThinkPad 10 (20C1/20C3, Bay Trail), using the
atomisp driver through its v4l2-async csi2-bridge path:

1. a new standard sensor driver, drivers/media/i2c/imx175.c;
2. the INTCF1A ACPI HID in ipu-bridge;
3. a 4-lane sensor config entry for INTCF1A in the atomisp csi2-bridge.

Notes for testing on this machine:

- The firmware exposes the ISP in "ACPI mode" by default (subdevice of
  the IGD), which atomisp does not support. The hidden BIOS setup option
  "ISP PCI Device Selection" (Setup variable offset 0x235, value 2 =
  "ISP PCI Device as B0D3F0") must be set for the ISP to appear as PCI
  device 00:03.0.
- The IMX175 probe fails intermittently at boot (-EREMOTEIO) without
  "media: atomisp: csi2-bridge: Don't cycle the PMC clock if its rate is
  correct", sent separately [1]. With it, the probe succeeded on 10 out
  of 10 boots in my testing; without it on 8 out of 10.
- The OV2722 front camera of the same machine needs "media: atomisp:
  ov2722: Report SGRBG10 consistently as media bus code", also sent
  separately [2], but is not otherwise related to this series.

[1] https://lore.kernel.org/linux-media/20261116173307.14169-1-volodymyrchapman@gmail.com/
[2] https://lore.kernel.org/linux-media/20261116173143.13584-1-volodymyrchapman@gmail.com/

Testing, on a media.git next kernel (3fc9303dba01) with this series and
the two patches above, on a ThinkPad 10 20C3 (Atom Z3795):
- the binned 1640x1232 mode streams through atomisp, alternating with
  the front camera; the full 3280x2464 mode was tested as a still
  capture, as atomisp limits continuous capture to 1920 pixels wide;
- the sensor's colour bar test pattern and real scenes have the correct
  colours, also with horizontal and vertical flip;
- v4l2-compliance 1.32.0 on the IMX175 sub-device: 46 tests, 0 failures,
  0 warnings.

Not supported: the voice coil motor (the firmware does not name its
type) and the LM3554 flash.

No DT binding is added, as the sensor is only known to be used on ACPI
systems; one can be added when a DT user appears.

This series was developed with the help of an AI coding assistant
(Claude), which wrote most of the driver code and commit messages based
on Intel's register tables, existing sensor drivers and my testing on
the hardware. I have reviewed the series and tested it as described
above.

Volodymyr Chapman (3):
  media: i2c: Add Sony IMX175 sensor driver
  media: ipu-bridge: Add Sony IMX175 (INTCF1A)
  media: atomisp: csi2-bridge: Add IMX175 sensor config

 MAINTAINERS                                   |   7 +
 drivers/media/i2c/Kconfig                     |  10 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/imx175.c                    | 797 ++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |   2 +
 .../media/atomisp/pci/atomisp_csi2_bridge.c   |   1 +
 6 files changed, 818 insertions(+)
 create mode 100644 drivers/media/i2c/imx175.c


base-commit: 3fc9303dba01676c2090768126e5327e341b7761
-- 
2.43.0

