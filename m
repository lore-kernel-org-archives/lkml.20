Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA1043B3F5
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862113; cv=none; b=LNA8VJ2ycMtKX8U9dYksHmOqQ5p3+ArdvLfep+ODaWO4tbh5X5HEEZNJADySkoWTX5E3WkEcdqAudoNJVpmjGlcdduRTdiphnwVpQ3ZT+jPA+mCTyJlzu+7G74T5p+3V0hYZQZ6YhevfYn8Vbh84dLSfCIJ5MNQwx2PUCI/2LzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862113; c=relaxed/simple;
	bh=OpkNEosHIOs8WqLCXNhMppYqMXPT3Ef4+D+jHFu3JMo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qLnyPy+J7HLB+cGTFq3F4lJ/Ahbkxg7y2QLgBGJW+CDz0NOGbVDyhD8YJD4BUl82z48n9k8z5elwefUcBfz3aMzih35TcMX5ebxsSs+mK5G1U6shMCdlt3PqQOFq/zGVyazQmfPZbQhX+xucaJ25hw9vnNyM0vKp93DAUHfwsk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRrPDSPv; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRrPDSPv"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35c76e9614aso214325eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791862111; x=1792466911; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gPDLvflVsdaOtvpAPaHITYN9gwgzEsbuu3isrtlsRc8=;
        b=XRrPDSPvXwWK3RrsbHR6zgD317Am+Wwr4pkJbavT4Mf2bYURvELPcLp2J97xWiNzpy
         C/NMeccI4JKydjssxYDRv8+6ZO+Q6w+PDYCCyfgUzhVZwUI2VDJfhWcQNJhlf8/5eMyy
         Gbavxs1IQ9fDHKSKnRjfrVW/aeXHhtQyZ7cMoQagk7jIcdMckiyF5/w9KYGPyvlho/Vs
         bFv12+lPWny4W/qqTq4nFKvVu/joo64q15Mr6d0fHZA2hfgdM8u7hI5nWM3f5G5axXPY
         dkSkDQvSV+Z3NRtVSoDAtylnqxBTtAM+EmvZu2zozvsq/13LPcP8QT/ylBH8cGft5372
         r2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791862111; x=1792466911;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gPDLvflVsdaOtvpAPaHITYN9gwgzEsbuu3isrtlsRc8=;
        b=q097pfcsEhfngNsgMYEgucWBWkGnj1BER8eMJiRLdqot5lMc6Rt6x07biw9HnKja89
         jikw4AThbYra9wehgSLoFBNkIIABLZIVJd0LTSUBtkvqPeReBHD1H4cdqPnfoIMvTHs1
         YwvPqDF5s64OTo30Rv6c7QjII5I7toPYVGI+19ZsSX58lobzZlj9Z73gu2YJ3fXgUQPh
         PurMUdt2PVdfzmKrEcCQ1BI3LHYKGwTuFLT0wMQ5sUzjkM6TH6M9IfpFxI7YMik75XfY
         u89tiULvJXAdCg7J25WAnE/esQg+LZu0dpFNlhPomMVeU7av/J4YE49oMh619u43MLwG
         01Ow==
X-Forwarded-Encrypted: i=1; AKwUvBz8bQtpiGRi4lyBdMNnW8c3Q5PZQW9Vanb6yzsqJ+/wEwFN14C6xD9CX4oXfPuxJCxv/dgpwwKlno/zB7Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLts7Bafv68TAqu+hQClUMyFL/5HfeLWGJPkkoFnqvqkDaDaEb1
	+b0HZSqT8FhnjBNTSKpt2DSl1H/NmdgVPkHvsrbZ532FoefH/WY/+VHa
X-Gm-Gg: AYBFou3aDcRJPuO7prtJahVwmv9PkMwDeORgBpM9cCgth3TqquyX8MiE5Kkw6n2d11W
	ytDtlMw5tysVwV8CKxfWQx3u4vnuKD1k+0ZUDx06L2/A6VbhmtJ2rPTWAlx+E5Z+5rrJcc80ufb
	GK+S7BbxsK5j5VQ5ImKqkwf8bM/u+jpGOl2c3kQKbOocbHck5RkBAC7ZbyBo6up/9Zp1mkuWcIc
	PJHT3twHH0IqaOeTLB6o2aDq75rC+Sw59IN+nR196argYUgteJUrMX6EeVUaSB3EW6QUkgdWUHK
	E6t/POw21KZFwOdouMD1S22ezXMWc9KPdf8HEYle8nqxAz8xNvCZUowKnIiJw70OLKffFuas8vq
	K/g3FreHdbCDsMKIS3ezfav7tW+cK2kt3ic8o/jb/m/cW9OkcjsKMcJ0WYX3WoW/pD/zZ3M8yTD
	wrEgJAPOSyhupZDP3pUPLRr2jgFo85dJLf/l2fOegj/fW1ZJV8pgD9x1Mtgtq9scmpTIYdts1rH
	FHTT3LNyFbzOmnMWFE5yV9VW3z2BTXxJOWqb7pmjX37rg==
X-Received: by 2002:a05:693c:4097:b0:358:8bd2:fda1 with SMTP id 5a478bee46e88-3588bd2ffb0mr14776025eec.30.1791862110546;
        Mon, 12 Oct 2026 20:28:30 -0700 (PDT)
Received: from [127.0.0.2] ([2401:4900:8900:441a:ba51:e5f4:3ca4:4b87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353814b556esm43617106eec.18.2026.10.12.20.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:28:29 -0700 (PDT)
From: Ramshouriesh R <rshouriesh@gmail.com>
Subject: [PATCH v7 0/3] media: Add Himax HM1092 mono NIR sensor driver
Date: Tue, 13 Oct 2026 08:58:22 +0530
Message-Id: <20261013-hm1092-driver-v7-0-d81a9b152ffd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33QTU7DMBAF4KtUXmNkj/+74h6IxSQeN0akQU6JQ
 FXujtMuiFyJ5ZPmezOaK5upZJrZ8XBlhZY85+lcg3s6sH7A84l4jjUzEGCFlZ4PoxQBeCx5ocL
 RJkCMMYGQrJrPQil/3/pe3+55/ureqb9sJdvEkOfLVH5uCxe5zd27nZBN9yK54FF20UsCpTrzc
 hoxfzz308i27gX2GloNVesUkrIhWtS+1epfrar2JiG6lHSivtV6r02rddUCpaIenI4+tNrsdWi
 1qRplMh3W95J4uNz+af/4NVu1CS4kAOW0x71e1/UX4JY2UPIBAAA=
X-Change-ID: 20260618-hm1092-driver-a6f2aaddf201
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jake Steinman <j@metarealtyinc.ca>, 
 Eduard Kulyk <kulikeduard89@gmail.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ramshouriesh R <rshouriesh@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

This adds a V4L2 subdev driver and DT binding for the Himax HM1092, a
1 megapixel monochrome near-infrared image sensor. On laptops it sits
behind the IR camera used for face unlock. It speaks a single MIPI CSI-2
data lane and outputs 10-bit RAW.

The driver exposes one fixed mode, test patterns, exposure, analogue
gain and digital gain controls, pixel-array selection targets and the
standard fwnode properties. The mode is selected by the external clock
rate, since each known platform pairs its clock with its own PLL setup
and init sequence:

  24 MHz EXTCLK (Qualcomm, devicetree): 560x360, 180 MHz link frequency
  19.2 MHz EXTCLK (Intel IPU, ACPI HIMX1092): 648x368, 180.48 MHz

Both run the single lane at about 360 Mbit/s and deliver about 30 frames per
second.

Patch 2 adds the driver with the 24 MHz configuration. It has been
tested on an ASUS Zenbook A14: the sensor probes, streams, changes
brightness across the full exposure and analogue gain ranges, accepts
digital gain updates while streaming, and returns to runtime suspend
after capture. Its register programming was extracted from
com.qti.sensormodule.hm1092.bin in the Qualcomm camera stack shipped for
that system. Jake Steinman independently identified the exposure,
analogue gain, digital gain and group-hold registers from Dell's
hm1092.sys. The available documentation does not identify the
test-pattern modes, so their menu names are based on output observed
during hardware testing.

Patch 3, from Jake Steinman, adds ACPI enumeration and the 19.2 MHz
configuration used on Intel IPU6/IPU7 laptops. It was posted on top of
v6 and is carried here at his suggestion. It has been tested on a Dell
XPS 16 (IPU7) and a Dell Latitude 7350 (IPU6).

One open point on patch 3: the 19.2 MHz configuration reads out
(0,0)/1294x734, which is what the vendor sequence programs and includes
the dummy border. That crop lies outside the (8,8)/1280x720 crop bounds,
which describe the active array. Reviewers' preference is welcome on
whether to widen the bounds to the native array or keep them as is.

The ipu-bridge entry for HM1092 was applied separately to media/next as
commit 4fdb0342f05e ("media: ipu-bridge: Add Himax HM1092 IR sensor").
Capturing Y10 on IPU7 also needs a staging/ipu7 format addition that
Jake posted alongside patch 3; it is independent of this series and not
included here. The board-level device tree and PHY work that wires this
camera up on the ASUS Zenbook A14 will be sent as its own series.

Signed-off-by: Ramshouriesh R <rshouriesh@gmail.com>
---
Changes in v7:
- Rebase onto next-20261012.
- hm1092: follow the sub-device pad op API change that added a
  struct v4l2_subdev_client_info argument: take it in get_selection,
  and drop .set_fmt, which only mirrored v4l2_subdev_get_fmt(), as done
  for the other fixed-format drivers.
- hm1092: limit the digital gain control to 0x3ff. The register is a
  10-bit 2.8 fixed-point value and the sensor ignores higher bits, so
  1024 and above wrapped back to black frames (reported by Eduard Kulyk).
- hm1092: handle negative pm_runtime_get_if_in_use() returns without
  touching unpowered hardware or dropping an unacquired runtime PM
  reference.
- hm1092: credit Jake Steinman as a co-developer of the control support
  and carry the requested coding-assistant disclosure.
- New patch 3 from Jake Steinman: ACPI enumeration and the 19.2 MHz
  configuration, with Eduard Kulyk's Tested-by. Drop its
  <linux/mod_devicetable.h> include as requested by Uwe Kleine-König.
- Cover: describe both configurations, document the separately applied
  ipu-bridge entry and correct the v5 data-lanes history.
- Link to v6: https://patch.msgid.link/20260801-hm1092-driver-v6-0-5979f223748a@gmail.com

Changes in v6:
- dt-bindings: update the example to the PLL-derived 180 MHz link
  frequency.
- hm1092: replace the inconsistent 400 MHz link frequency and derived
  80 MHz pixel rate with 180 MHz and 36 MHz. The new values are derived
  from the ASUS Windows configuration's 24 MHz external clock and the
  sensor PLL dividers.
- hm1092: report the 1296x736 native array, 1280x720 active array and
  1150x718 mode crop as distinct selection targets.
- hm1092: add exposure, analogue gain and digital gain controls using the
  register map supplied by Jake Steinman. Keep multi-byte controls as
  separate writes, use group hold, derive the exposure maximum from VTS,
  and program the hardware-tested 500-line exposure default in both the
  init table and control. Hardware-test the controls on the 560x360 mode.
- hm1092: do not power the sensor on in probe(). There is no I2C access
  during probe, so leave it suspended and let runtime PM power it for
  streaming.
- Link to v5: https://patch.msgid.link/20260709-hm1092-driver-v5-0-a1f5baa6fe08@gmail.com

Changes in v5:
- dt-bindings: drop the local data-lanes constraint and omit it from
  the example. Keep the inherited video-interfaces.yaml property allowed,
  even though it does not describe configurable hardware.
- hm1092: implement the get_selection pad op (CROP, CROP_DEFAULT,
  CROP_BOUNDS and NATIVE_SIZE) reporting the sensor's pixel-array
  geometry, as required by libcamera.
- Link to v4: https://patch.msgid.link/20260705-hm1092-driver-v4-0-0a13ec274d89@gmail.com

Changes in v4:
- dt-bindings: make data-lanes optional for the fixed single-lane sensor,
  constrain explicit values to <1>, and omit it from the example.
- hm1092: add the copyright notice.
- hm1092: replace the private register representation and write helper
  with CCI register sequences and direct CCI writes.
- hm1092: use descriptive test-pattern names based on hardware captures;
  the available documentation does not identify these modes.
- hm1092: parse fwnode properties before creating controls and set
  read-only flags after validating control creation.
- hm1092: use the generic get_fmt callback for the fixed sensor mode.
- hm1092: initialize endpoint parsing with the fixed one-lane default,
  reject other lane configurations, and remove the redundant endpoint
  presence check.
- hm1092: use fsleep() and null-safe GPIO calls, and apply the requested
  declaration, brace, return-value and error-path formatting cleanups.
- Link to v3: https://patch.msgid.link/20260702-hm1092-driver-v3-0-85faa7ff4fec@gmail.com

Changes in v3:
- dt-bindings: add the Reviewed-by tag from Conor Dooley.
- hm1092: initialize RAW colorimetry fields in the pad format helper so
  userspace values cannot leak into subdevice state.
- hm1092: return -ENXIO when the required firmware graph endpoint is
  absent instead of deferring probe indefinitely.
- Link to v2: https://patch.msgid.link/20260702-hm1092-driver-v2-0-4f9f369d6a48@gmail.com

Changes in v2:
- hm1092: use pm_ptr() instead of pm_sleep_ptr() for the dev_pm_ops
  pointer. The ops come from DEFINE_RUNTIME_DEV_PM_OPS(), so gating them
  on CONFIG_PM_SLEEP dropped runtime PM on a CONFIG_PM=y, PM_SLEEP=n
  build.
- hm1092: free the control handler on the error paths in
  hm1092_init_controls(); the fwnode-parse and ctrl_hdlr->error returns
  leaked the handler.
- Link to v1: https://patch.msgid.link/20260701-hm1092-driver-v1-0-d1bd81e233b5@gmail.com

---
Jake Steinman (1):
      media: i2c: hm1092: Add ACPI enumeration and the 19.2 MHz configuration

Ramshouriesh R (2):
      media: dt-bindings: Add Himax HM1092 NIR sensor
      media: i2c: hm1092: add Himax HM1092 mono NIR sensor driver

 .../bindings/media/i2c/himax,hm1092.yaml           |  101 ++
 MAINTAINERS                                        |    7 +
 drivers/media/i2c/Kconfig                          |   11 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/hm1092.c                         | 1138 ++++++++++++++++++++
 5 files changed, 1258 insertions(+)
---
base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
change-id: 20260618-hm1092-driver-a6f2aaddf201

Best regards,
--  
Ramshouriesh R <rshouriesh@gmail.com>

