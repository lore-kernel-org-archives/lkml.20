Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=83.166.143.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793650981;
	b=40jP8zIQY61qrVRhwOdS4xi+S1/kkiZLaMeSQmY2lSnMpXisIi2cWK6SpkYGiFn2Bbfp
	 nfDwrxvtcHRVkC6QbwFwgwI8R04qboBnW7kdgg079sEjCByMfqnyQMcqIZ0T3GqAWXEM/
	 2QxkLmZ4ceNBQ5eyGEVMORiLgO/QB4z0t1lD0M6VGOeGZAXZDQ9uxpx0LKiD1sI0LiTv/
	 6a77p4TPPDkVkXaFzyMEZ8akg8l2Sf9/PF8T0hmJp5ZOcEgasiq1MFSVoBX7FL1BZRQeV
	 6uoxX1p2/wVP2NXx/ZKuijYOT65WM2uK8Tr1pOX7vPLKg0DbB7oC9eHDyh+utdoi76g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650981;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Infomaniak-Routing;
	bh=m9MTAoKRAQz3GJf2WRZ9ZD9bHKOwbRExdEqd+I+AA5w=;
	b=rheFkqGC2ANa3s8W/WYj8W1OvqQrf1MpPFQ18wgaQ7KDIkCcmqYv0a56wQ6+w4FuwgEg
	 /t2gO0EHT1ufhRcuLZfVwoFGFTSHcO+UnHcpbapoNgoBUp7mlIGbuXUNEVQjHNORRmfv4
	 xDqoMFJ1zTFB30ZQhPZK0/BJt9Djj0GNEnMtkTIncADqD/L5ZlL5/SP2mRYl/M56VVJFV
	 gs85ksfBVPiF2LQLXFcyniKKqPYpwmkDB/DX4SJPUkTAO4u4InDexIkR8LYXBhqDmph9H
	 KotIo+sGpOO1B7j28LZoszjECKYJevTdvDusl3V9VDJVyu44UqoNCcIdq0QFxKCTNUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=0leil.net;
	spf=pass smtp.mailfrom=0leil.net;
	dkim=pass header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=gy4fXoxS;
	arc=none smtp.remote-ip=83.166.143.170
Received: from smtp-8faa.mail.infomaniak.ch (smtp-8faa.mail.infomaniak.ch [83.166.143.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAA2606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBAA2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=gy4fXoxS
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jJNRv3XN9zw8s;
	Mon,  2 Nov 2026 21:22:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1793650971;
	bh=m9MTAoKRAQz3GJf2WRZ9ZD9bHKOwbRExdEqd+I+AA5w=;
	h=From:Subject:Date:To:Cc:From;
	b=gy4fXoxS7tWOGk1NJhl/stjM92AkcbvQxBivv6TLZwbtQ9+wKsVexZ5Xsf8K6Rexs
	 sHwghnKxilkKONIgDVyxr6vunoEBYvBSzisNDBstd2FvKtn3UIdUqDnJP+CgjaVE3j
	 rmFr9vHWjnrWXtc9hxrntNQM+gSN4gnKMsCVeBVRGYPKhp4XuF//MWXhMSh5ASLopB
	 1k2yq5E2Hx4xgb5+w2I/+IOz0PpfdnGjCcjL0+xEFkF64VtvWmo7uV5xpcj4y2sYrM
	 3FAX7bUGVky7i0y9pj/RxfD4LsDblJXSyb+jE1tPJSkfzljiatIt7NqCaCCAclQCK/
	 VmNxwj4y1z+jg==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jJNRt1KW7znwS;
	Mon,  2 Nov 2026 21:22:50 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Subject: [PATCH v2 0/3] media: support Y8/GREY and Y10 bus/pixel formats
 for Rockchip VICAP and Synopsys CSI2RX
Date: Mon, 02 Nov 2026 21:22:41 +0100
Message-Id: <20261102-v4l-y8-y10-csi-vicap-v2-0-0a4149d96dae@cherry.de>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBBFf4V07Zi2AVpc+R+GRR+DjDFAWmxsC
 P8uYNy5PMm95ywsYiCM7FIsLGCiSOOwgTwVzPVmuCOQ35hJLmvBRQWpfELWkAUHFwkSOTOB7Xj
 ZeGdUozXbrlPAjt6H9tZ+Ob7sA928u/ZFT3EeQz66Sey7X6L+n0gCOEhlrVbGqLLyV9djCPnsk
 bXrun4AzlTx58oAAAA=
X-Change-ID: 20261015-v4l-y8-y10-csi-vicap-bf049dca7988
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha

The Media CI robot will complain because the line is too long in patch 1
but it matches all other lines in the same array, so that shouldn't be
an issue. I'll answer the same as on v1, I'm fine doing it if a human
requests it (because I believe the bot request is incorrect).

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
Changes in v2:
- rebased on current master to fix trivial conflict,
- Link to v1: https://patch.msgid.link/20261016-v4l-y8-y10-csi-vicap-v1-0-27bb87aa745d@cherry.de

To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Michael Riesch <michael.riesch@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org

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
base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
change-id: 20261015-v4l-y8-y10-csi-vicap-bf049dca7988

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>

