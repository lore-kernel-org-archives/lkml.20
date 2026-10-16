Received: from smtp-42ac.mail.infomaniak.ch (smtp-42ac.mail.infomaniak.ch [84.16.66.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169D1346FA8
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792158045; cv=none; b=TsEJ0++0/p8kEYKmYR3kdG6KmuaFxPimo0U8WLTe6uRXuOSFTgs3d2DC4jVep+MqNXU4wKSI2PyN8Ehu8xnsL/2uorCSXRiSdJAjRS/FalFeWBqUdjvpH0ITb8nO1XNx5KranIBQbPIfBup+Rg+eW5o80Z8882mmfYwCLLQbL30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792158045; c=relaxed/simple;
	bh=Dj+AGlhG2tZkpB4Gm6J5v76lO8Vy26LhLj2/zlF7cyc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PUtXVdM510TIf9cywyBXOP1XGkdsJ4ScMISN9q+dk4drJl8+MOIAhiX9Yms/UH5ebAkk4v5uqXsJoxoKs6vfgSPMToCmHGdVze6Whmv/Sk9uqVojCklmCI7/SldxgHknjJMjvNjPUNDINOIcJmZb1hO0J3luQdMShksZQRK8SIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net; spf=pass smtp.mailfrom=0leil.net; dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b=Yj6Ih9Gf; arc=none smtp.client-ip=84.16.66.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=0leil.net header.i=@0leil.net header.b="Yj6Ih9Gf"
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4j5mKY2PFmzbrv;
	Fri, 16 Oct 2026 15:40:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1792158033;
	bh=T69VpODlJXAU3bSVams7rzUUt2KCsw+G6blftptzXF0=;
	h=From:Subject:Date:To:Cc:From;
	b=Yj6Ih9GfnHv90Pj4bMMklTM/TgmFrp0m4jXeotVV6RsVbQV1H99GQFZO9ljmw/uVB
	 jk4CWxS0UAoAaJ1qWKGerli41/xRmh1GPQG5LeOtQI5JgkLcoFU8gz1U3d+JE84ld4
	 MeHlT+e9LL2yxhoHiIJbdNamcrBZtVMCgjxMBX8VeOkit7EVfHrH9NYO8Q4BfPXB0V
	 zWwH7WRDEEadNZ8U3ig6TSc4XaG/z5TQZE1E+EKBtOP4JVxSc7ICAAhPZE1ZxF8Rb1
	 QYUVzigxNRquIZaTI+92maR3iWtrdV53mfxTqUypa8ezv/j1LP+liOePQmUvNe4rPA
	 qz3PKlVm9704A==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4j5mKW0yKczBnm;
	Fri, 16 Oct 2026 15:40:31 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH 0/3] media: support Y8/GREY and Y10 bus/pixel formats for
 Rockchip VICAP and Synopsys CSI2RX
Date: Fri, 16 Oct 2026 15:39:56 +0200
Message-Id: <20261016-v4l-y8-y10-csi-vicap-v1-0-27bb87aa745d@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDuQiK3RqxQXcRztFFHJaKiId
 29sl2/x/wHKQVihzg4IHEVlnhLsLQN6+WlglC4ZcpM/rLF3jMWIu8PdGiQVjEJ+wbY3RdWRLyv
 nIKVL4F4+v+2z+Vu39s20Xi84zy8rnwOIeAAAAA==
X-Change-ID: 20261015-v4l-y8-y10-csi-vicap-bf049dca7988
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha

RK3588 Jaguar can support up to 4 2-lane cameras (two on the main PCBA,
two exposed on the proprietary mezzanine connector). The only camera
module available for this device is based on the OV9281 greyscale camera
sensor.

The OV9282 driver (which also supports the OV9281) allows two formats:
- MEDIA_BUS_FMT_Y8_1X8
- MEDIA_BUS_FMT_Y10_1X10

but they both aren't listed as supported by the RK3588 CSI2RX controller
and RK3588 VICAP drivers.

Add support for those two bus formats to both drivers.

Capturing a frame with yavta[1] for Y10 only works once
struct v4l2_format_info formats also exposes V4L2_PIX_FMT_Y10, so do
that. I couldn't make gstreamer work with Y10, I'm assuming for the same
reasons explained in this issue[2].

All those patches, suggested by Michael Riesch on IRC. Thanks to his
support I now can capture shitty 720p greyscale pictures \o/

I am not entirely sure whether V4L2_PIX_FMT_Y10 is the appropriate
format as we pick MIPI_CSI2_DT_RAW10 as the CSI2 Data Type, which
according to Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
(very end):
"""
The 'P' variations of the Y10, Y12 and Y14 formats are packed according
to the RAW10, RAW12 and RAW14 packing scheme as defined by the MIPI
CSI-2 specification.
"""

so I would rather expect Y10P. After changing Y10 for Y10P in
drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c and
drivers/media/v4l2-core/v4l2-common.c, and patching yavta to support it,
I also get an image. Other drivers seem to also be associating Y10 (and
not Y10P) with the RAW10 format, so I guess that's fine?

[1] https://git.ideasonboard.com/camera/yavta
[2] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/work_items/3738

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Quentin Schulz (3):
      media: v4l2-common: add V4L2_PIX_FMT_Y10 to v4l2_format_info
      media: rockchip: rkcif: add support for GREY and Y10 formats
      media: synopsys: csi2rx: add support for Y8 and Y10 bus formats

 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 26 ++++++++++++++++++++++
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c   | 10 +++++++++
 drivers/media/v4l2-core/v4l2-common.c              |  1 +
 3 files changed, 37 insertions(+)
---
base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
change-id: 20261015-v4l-y8-y10-csi-vicap-bf049dca7988

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>

