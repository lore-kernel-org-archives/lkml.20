Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.16.66.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581575;
	b=CWeZrOn6uqJy8qHH5NgFfqrGVrEACQcwoG1GK9zxbvz8e2fHBpimsdYe3KMCCLs9N3eQ
	 ERi6NUa6yEz1SKMclrAGmuHSKrgA25Mi8MpUawiQEiA/NJydCKPndobBHqJO+sH6g2fbd
	 Q58gDFk4x9GWabYcdlaewK05r6KD8exdjWOPjeATHdQbxR+38YwA9g9dnKCJAdsMdpedG
	 HDgDxivyqS8k6ZrNtW9NA7IDGss8cKT8FARBaQNEvCrS2DjkrQkYKuaEnjQjZwqtzy9/o
	 3MnG4JnfgFD4BOcIj3bBpy0KvWCczsLODtNoeCu8YNhKV2mRk3gTELVuNe/sGIzizLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581575;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Infomaniak-Routing;
	bh=JISMoemaPJ+A8ZJRuo/Qvax8ybNMOj4BygXaLMB8GcQ=;
	b=VQycr0/2jHb/62HZ2o0TEwN1PhNgEZGXhZ5Go9XHzrVFnZpwDf7DhytKk/JkXkJ05SC/
	 Q+AQUW6OlQKjCqDmzaLpDaecvVYS2d+DDhqjAsSjEh+c0qhQa8D4kHw+ss/uQ0G6JnjfI
	 bfLdEsjP6shLBOHwJO6IhmhA2LpxXbj2HYhp4y8nqTz42TmwiMlJCWirTdEZ2RQdXYdI2
	 3FjwJUgrm1nVYuhxozphfICPnQ3XMATJ89Bz9FK+pY3GXFxjxXJFUgo+LnWBmTySLdH25
	 9E/vt9guHuZd7dNN/1fhiJzGV3rxWp7DDrxq3qFovHM1aymS3Rexvqe1FuECF1+kLXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=0leil.net;
	spf=pass smtp.mailfrom=0leil.net;
	dkim=pass header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=jL9lWTlT;
	arc=none smtp.remote-ip=84.16.66.169
Received: from smtp-42a9.mail.infomaniak.ch (smtp-42a9.mail.infomaniak.ch [84.16.66.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D40606A886
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2D40606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=jL9lWTlT
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jR0bz1GJ5zFyD;
	Fri, 13 Nov 2026 15:52:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1794581566;
	bh=JISMoemaPJ+A8ZJRuo/Qvax8ybNMOj4BygXaLMB8GcQ=;
	h=From:Subject:Date:To:Cc:From;
	b=jL9lWTlTj2LSNGIVzqoVi/FnsPoEY6VNERsK9g9UpjRXFaHggeFLGPGMV9rPxRLke
	 5/XDU8CCIl493IrexBsWghRLvTF+26K6qNs41+wmxfuSj0ZHGttC4iG7SQ9qR4N9iC
	 QxHaodYvvdIKh/sKcBw7Qy8W9VyknZwJlLAJ5FqVu1QIzpPsKsQW7yTsqb/HCTFKyL
	 1Wo9df24ELl5U4HGpIx8k8VrA0rTgc/LreGK25FR9rFuNOq/T4upnY72QYaAL5ot6v
	 glzrFykSYzOBmGGlrCscOSJc3ulLewASefHUj8vVvopHjOf4zKrPtx2kZRg7iSZiPu
	 xlJXRjWCTdceg==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jR0bx2SqwznH1;
	Fri, 13 Nov 2026 15:52:45 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH v2 0/2] arm64: dts: rockchip: enable OV9281 CAM0 and CAM1
 on RK3588 Jaguar
Date: Fri, 13 Nov 2026 15:52:22 +0100
Message-Id: <20261113-jaguar-cam0-cam1-v2-0-3e9377e3c882@cherry.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/2WOwQqDMBBEfyXsuSlJiil46n8UD+tm1QjVdqNSE
 f+9qIUeehmY4TEzCySWyAlytYDwFFPsO8iVOymgBruadQyQK3DGeWtsplusRxRN+DCbWB2IjKs
 yf/Ue4aTgKVzF9155Lw6fxrJlGraeLyH8GmOKww9rYhp6mfcjk93SY9Ma9785WW00XRArClhmI
 dyoYZH5HBiKdV0/8SiSsNcAAAA=
X-Change-ID: 20261015-jaguar-cam0-cam1-dcc02f56766a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha

RK3588 Jaguar has two proprietary camera connectors, P14 and P15. This
adds support for the only camera module we currently have for this
connector.

The camera module has a 2-lane OV9281 camera sensor, an IMU, a
magnetometer and an EEPROM.

We have new camera modules based on an OV13850 that should be coming up
soon, hence why I made the support into their own separate DTSO instead
of directly integrating them in the main DTS.

Known issues:
- lis2mdl driver currently doesn't support being instantiated twice, so
  only one magnetometer will show up, if the two cameras modules are
  connected,
- OV9281 test patterns (no upstream support) returns broken patterns,
  see discussion on IRC
  https://libera.catirclogs.org/linux-rockchip/2026-11-02, the image I
  get without the test pattern *looks* okay to my non-expert eyes. In
  any case, it's unlikely to be an issue in the Device Tree,

Image capture test:
  #!/usr/bin/env bash

  set -o pipefail
  set -eux

  CAM=$1
  COLORFMT=$2
  SIZE=$3

  if [ "$COLORFMT" = "GREY" ] || [ "$COLORFMT" = "Y8" ]; then
  	MEDIACTLFMT="fmt:Y8_1X8/$SIZE field:none colorspace:raw xfer:none"
  	BITDEPTH=8
  else
  	MEDIACTLFMT="fmt:Y10_1X10/$SIZE field:none colorspace:raw xfer:none"
  	BITDEPTH=10
  fi

  if [ "$CAM" = "P14" ]; then
  	MEDIACTL_SENSOR="ov9281 2-0060"
  	MEDIACTL_RKCIF="rkcif-mipi2"
  	MEDIACTL_CSIRX="dw-mipi-csi2rx fdd30000.csi"
  else
  	MEDIACTL_SENSOR="ov9281 7-0060"
  	MEDIACTL_RKCIF="rkcif-mipi4"
  	MEDIACTL_CSIRX="dw-mipi-csi2rx fdd50000.csi"
  fi

  for dev in /sys/class/video4linux/video*/; do
  	if [ "$(cat "$dev/name")" != "$MEDIACTL_RKCIF-id0" ]; then
  		continue
  	fi
  
  	VIDEODEV=$(basename "$dev")
  	break
  done

  media-ctl -d 0 --set-v4l2 "'$MEDIACTL_SENSOR':0 [$MEDIACTLFMT]"
  media-ctl -d 0 --set-v4l2 "'$MEDIACTL_RKCIF':0 [$MEDIACTLFMT]"
  media-ctl -d 0 --set-v4l2 "'$MEDIACTL_CSIRX':0 [$MEDIACTLFMT]"
  # Name the file a format YUView can recognize automatically
  /root/yavta/build/yavta -f"$COLORFMT" -s$SIZE -c1 -n1 /dev/$VIDEODEV -Fframe-#_${SIZE}_${BITDEPTH}b_yuv400.yuv

With yavta[1] and checked with YUView[2] as gstreamer doesn't seem[3] to
have support for Y10.

Ran:
 - ./test-cam.sh P14 Y8 1280x800
 - ./test-cam.sh P15 Y8 1280x800
 - ./test-cam.sh P14 Y10 1280x800
 - ./test-cam.sh P15 Y10 1280x800

Pictures look decent to me.

Wrote random data to the EEPROMs and read it back identical.

Moved the cameras, accel and gyro raw sysfs values changed.

Magnetometers tested individually, with small magnet, raw values
changed.

I've not tested IIO buffers and/or the various interrupts.

[1] https://git.ideasonboard.com/camera/yavta
[2] https://github.com/IENT/YUView
[3] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/work_items/3738

Light dependency on
https://lore.kernel.org/linux-media/20261102-v4l-y8-y10-csi-vicap-v2-0-0a4149d96dae@cherry.de/
for it to actually work (no impact on binding or device tree).

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Changes in v2:
- removed unneeded bus-type property in the camera's endpoint node,
- rename cam0_p14/cam1_p15 node names to cam0-p14/cam1-p15 to follow the
  DT spec recommendations,
- added pinctrl for LSM6DSR's CS and SA0 pins to guarantee the state of
  the bootstrapping pins which control the I2C device address and
  I2C/SPI operating mode,
- Link to v1: https://patch.msgid.link/20261102-jaguar-cam0-cam1-v1-0-c3aafcdab5dd@cherry.de

---
Quentin Schulz (2):
      arm64: dts: rockchip: enable OV9281 CAM0 P14 on RK3588 Jaguar
      arm64: dts: rockchip: enable OV9281 CAM1 P15 on RK3588 Jaguar

 arch/arm64/boot/dts/rockchip/Makefile              |   7 ++
 .../dts/rockchip/rk3588-jaguar-p14-ov9281.dtso     | 120 +++++++++++++++++++++
 .../dts/rockchip/rk3588-jaguar-p15-ov9281.dtso     | 119 ++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |  36 ++++++-
 4 files changed, 281 insertions(+), 1 deletion(-)
---
base-commit: 233ebf31c98e1d7185d12d1ff332f3354f4950f5
change-id: 20261015-jaguar-cam0-cam1-dcc02f56766a

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>

