Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83E3391E59
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054688; cv=none; b=Lj5mNOwD+sXkmS0FxAkqhS2VP5cnt5gnJ077zDAErIm4gb6wjc3EmAvRS80C5/8UXtWzc+7CWmwIaX+amwySOb8iQKYhWfq3lUBrX3vTj7yUgkX68PgEG5akaSua8mt+8wKuR+VSF0iBndlUCF9M7ZmK6De7/T7aDkQPEm8VH7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054688; c=relaxed/simple;
	bh=sNaUGOPuwKSprBuDavzdl5xu7P8v1TvNRFYVBmUWsjc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gN/lowvrq5tV7ezaroh708A7uPZGH2j9c9JdABk5rs4b/9cWIWRQxXS5xF3I8uLXEibiNdf20jwNoGrDpODfsAR3Fh7R1driUG2FYzviluPtPgR3ZQUwEmDkEXscs2rQULDPsUsqit12j76mUfuHSjUAGDcJxHSxyhTIoxN//9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0DLSNgx; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0DLSNgx"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso5228529f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789054684; x=1789659484; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a6TUluCt1yzi2qBs3y3iyPDqTRTHUpFGWhITcM2KmZc=;
        b=g0DLSNgxdSIKc04VJhe/Zc75cG/h/AM4MutZfPwVOgwNJqyZ4FRA5M3nZm07Gr3Rd9
         5t3DspRKbSkao0pq4a4E4I1yD9rm+jyrNRn/cCOyN/08m3aWqpwakwbML+7w5BpCtJ5C
         CkQEW81PxfhEWhglhvBMboCyu0VGwBfhozabvPR/0440SaxE0IeEuwQJs4G+1jo0zk+Y
         0bUbfB5nmcMniGdzJ8vY5HUcBwEvMofpt00LpLEilQzn35qy9OMV7zAXEiWO9qDmuczJ
         v6Z0yQxIkF6qZen0JE7/T9U+MG0UaP9N6vp7E0+97B1OuIQVigwTb1gcs6RMhPkIs3/W
         qEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054684; x=1789659484;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a6TUluCt1yzi2qBs3y3iyPDqTRTHUpFGWhITcM2KmZc=;
        b=rDrFa0Y1uqmBj1y5JMDRA5MSbTNtlW/rEbpSHfDD6MssR1ZDh0AFZ6xsHjqB/tdJti
         XlbiuzPX+fRjPFhSelTlatkBRNUPL5eq+R3j70BR6Dt04wzVWVhxBNuU934/YaGwdwbq
         RE7C1BAmAQ//YOH6fk+tsaXv1u43Na7oo1OMlvUvkefI6QJGXbCTLT8l2HcPff3nMMiB
         N/aCVRtWSaZnZcHVWHSKU1PnTJE4WuxALK211H3VruZmZ9y+3/7F1jft+4c2l3zwuq6P
         m7AyBcN0pzMzdgmPhKwnwUTjBPY39Jg8tBzhOwHNatHZJDBgOexulI9IAH1ocqjJYeuJ
         d2Bw==
X-Forwarded-Encrypted: i=1; AKwUvBzDLTWkSW8xZPAm0TRwpI2WtIPBMFQRSLLccPTN5xdw1nAJVYqJlXywwTMEo3vBR5S8KeTHDmGFvMlWzb8=@vger.kernel.org
X-Gm-Message-State: AFuF++mOzbarzV6c+NDv+GC3zPuE7zrRuMTjnxdmobxNVlJMZD9fl4zG
	+1pXcOpJQlOyrZxrM1lf8F733uCm5p2JZNmf+cnEawx8zPtRv21kpFum
X-Gm-Gg: AYBFou3ta2UbUAD8ZJQVRbxGbqIozsHw7hAFxsp6j7IgW3rz1ANfo+nP4QI2WZOS3ug
	SeH/ClD9WZcXu0IuD7gAg9YxG0p971IPZBEUe+hy9zVypEqsx0eSrQngrU8dZ7Ysd1Flk9twUM6
	LNhcRtGFiSR+gzv2KPRy76U9NpJVK0M0zWYZxE9uSFnBZD2uZUWmsSdfmVcBd2ihtrJpbQFlZqn
	2WpL+lnV4ENuknvFmkx9m9bJAVxYDoLk6e+aZQkzxGWvFltArlAORdFl4efRF4ROyAxYuzOD9a+
	l7BXpMDa5+86/6Y1DRK3Wu7JcIiQjH5splpHCW610L3QfLNxN/xSOVm37bkJFbXXTZSNyFdPSUA
	FsWp5xZlBMqJsIeoudnFg33GMUscQwTDuINPr38Xtq8OJfuX3qW4mo4WMIQlRDIM+VXfda1mB5r
	b1zUXXAy1or2F2/ZPID0Zab+s7yKaOarV4uaY5hPH5Hf+Ze7bm76ERfBHlaXfzHXmRfqZTBtoRo
	NZ98EGmcgmB981enx9w2+Em8jgnCAEt8TPCVBHbwwokdmIGdEcep77MsQbZ1+iPoMcQHaV/1ZTs
	wP7zJX0+
X-Received: by 2002:a05:600c:4f43:b0:49c:fc6e:a3d9 with SMTP id 5b1f17b1804b1-49cfc6ea7b4mr421096065e9.24.1789054683558;
        Thu, 10 Sep 2026 08:38:03 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm3390545e9.14.2026.09.10.08.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:38:02 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH 0/6] arm64: dts: freescale: Add Verdin iMX8M OV5640 and
 Verdin iMX8MP M7 support
Date: Thu, 10 Sep 2026 17:37:56 +0200
Message-Id: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANTOomoC/x2NMQrDMAwAvxI0V6CKYJx+pXQQttJosBNkCCkhf
 4/pcMMtdyc0ddMGr+EE192arbXL8zFAWqR+FS13ByYONFHEXT1bRStHLBsunSRFXdBV8g8D5RC
 FZ+KRoUc219mO/+D9ua4b/aa3anAAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

Describe the Cortex-M7 remote processor and its RPMsg memory regions for
Verdin iMX8M Plus, add shared OV5640 camera overlays for Verdin iMX8M
Mini and Verdin iMX8M Plus, and support a second camera through the
Verdin iMX8M Plus Mezzanine.

It applies on top of the recently submitted Verdin iMX8M Plus overlay
series:
https://lore.kernel.org/all/20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com/

Add the Verdin board description and RPMsg reserved-memory regions,
following the Verdin iMX8M Mini description. A small overlay optionally
reserves Verdin UART_4 for Cortex-M7 firmware.

The camera patches are the follow-up promised when the OV5640 patches
were removed from v2 of the Verdin iMX8M Mini overlay series:
https://lore.kernel.org/r/20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com

Verdin iMX8M Mini and Verdin iMX8M Plus can use the same 24-pin camera
connector on the Verdin Development Board, Dahlia and Mallow carrier
boards. The connector's sideband signals are routed to different GPIO
controllers, however, and the two SoCs use different capture pipelines.
Describing these details directly in an accessory overlay would require
a separate camera overlay for each SoM and carrier combination.

Following feedback on the Verdin iMX8M Mini series, introduce a binding
for the connector's sideband GPIO nexus. Add connector mappings to the
carrier descriptions and stable labels for the SoM-specific CSI media
nodes. This allows one pair of OV5640 overlays to be shared by both SoMs
and all three carrier boards.

The binding intentionally covers only the connector's GPIO signals.
MIPI CSI-2 endpoints, I2C, clocks and supplies continue to use their
existing bindings and are connected through stable labels in the Verdin
device trees.

The unsuffixed camera overlay describes the current camera module with
its 27 MHz oscillator. A separate overlay supports the legacy module
with its 24 MHz oscillator.

The Verdin iMX8M Plus Mezzanine exposes the SoC's second MIPI CSI-2
interface through another 24-pin camera connector. Its camera control
signals can be routed through either the default or alternate GPIO
jumper positions. Reuse the connector nexus for both configurations so
that they share one camera and media-pipeline description. Provide 27
MHz and 24 MHz variants for each jumper configuration.

The default GPIO routing is intended for a single camera because it
shares control signals with the native CSI_1 connector. The alternate
routing permits native and mezzanine cameras to be used together, but
conflicts with the Atmel MXT touchscreen GPIO.

The shared 27 MHz overlay was run-tested on Verdin iMX8M Mini and Verdin
iMX8M Plus. Both shared camera overlays were compiled, applied and
schema-validated with the WiFi and non-WiFi variants of all three
supported carrier boards on both SoCs. All mezzanine overlays were also
tested both standalone and in the dual camera use case on the iMX8MP.

When fw_devlink is enforcing probe ordering, camera probing depends on
the GPIO nexus support from [1]. Without it, fw_devlink can treat the
connector nexus itself as the supplier of the camera regulator instead
of following gpio-map to the underlying GPIO controller. This can leave
the regulator and camera waiting, for example:

  i2c 2-003c: deferred probe pending: i2c: supplier regulator-camera not ready

[1] https://lore.kernel.org/all/20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com/

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Ernest Van Hoecke (6):
      arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7 remoteproc
      arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7 UART_4 overlay
      dt-bindings: connector: Add Toradex camera connector
      arm64: dts: freescale: imx8m{m,p}-verdin: Add camera connector nexus
      arm64: dts: freescale: imx8m{m,p}-verdin: Add shared OV5640 overlays
      arm64: dts: freescale: imx8mp-verdin: Add mezzanine OV5640 overlays

 .../connector/toradex,camera-connector.yaml        | 86 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/Makefile             | 32 ++++++++
 .../dts/freescale/imx8m-verdin-ov5640-24mhz.dtso   | 17 +++++
 .../boot/dts/freescale/imx8m-verdin-ov5640.dtsi    | 78 ++++++++++++++++++++
 .../boot/dts/freescale/imx8m-verdin-ov5640.dtso    | 18 +++++
 .../boot/dts/freescale/imx8mm-verdin-dahlia.dtsi   | 17 +++++
 .../boot/dts/freescale/imx8mm-verdin-dev.dtsi      | 17 +++++
 .../boot/dts/freescale/imx8mm-verdin-mallow.dtsi   | 17 +++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |  8 +-
 .../boot/dts/freescale/imx8mp-verdin-dahlia.dtsi   | 17 +++++
 .../boot/dts/freescale/imx8mp-verdin-dev.dtsi      | 17 +++++
 .../boot/dts/freescale/imx8mp-verdin-mallow.dtsi   | 17 +++++
 ...-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso | 19 +++++
 ...din-mezzanine-ov5640-24mhz-default-jumpers.dtso | 18 +++++
 ...imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso | 38 ++++++++++
 ...mp-verdin-mezzanine-ov5640-default-jumpers.dtso | 42 +++++++++++
 .../freescale/imx8mp-verdin-mezzanine-ov5640.dtsi  | 78 ++++++++++++++++++++
 .../dts/freescale/imx8mp-verdin-uart4-mcu.dtso     | 14 ++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   | 40 +++++++++-
 19 files changed, 588 insertions(+), 2 deletions(-)
---
base-commit: b0d182093ef1e0693db6e40f576c6b6f5a52aead
change-id: 20260908-verdin-imx8mp-hmp-camera-ready-60d68a2f0242

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

