Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2FD3AD531;
	Wed, 16 Sep 2026 14:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569307; cv=none; b=GfpCecSE8uoMFzGNZniBVVYJ1xU2k3HexIdAPwAt1cKiBr6L7cpZTM8Zku+tl4kz9TuGvXjaaNjDiWuqanjwaqH6D9+3T0T+MtpPwGW3MSjXpXB1L2x4O/yhdV+NAhVQEgzhW7aJsnxR24Zi5bzMPeVfArxQ5JMszH1Jkftsxko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569307; c=relaxed/simple;
	bh=baGFsRC4G/C+1tK95uUAmJ/RXzubU1GR52xw38X4NDc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E6yMHx/de7niapmZ7oqMoFgBxzk+hsjCxoErmt+2lw+Ti9eEBuHnhExRnpp5cdDh+bzp34ozI4SIlyQ6iVmP9OnoAnoQq1sz3wVO0F4kJq0xiGgjrarsLmJixVR68hao7dko9oCZe5RnkZFxAkmf6Q5JECD/vr5cxsv1ETOv9sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YsqDkuIf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YsqDkuIf"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91E01558;
	Wed, 16 Sep 2026 16:33:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789569200;
	bh=baGFsRC4G/C+1tK95uUAmJ/RXzubU1GR52xw38X4NDc=;
	h=From:Subject:Date:To:Cc:From;
	b=YsqDkuIfexA+s2HdrrDhl2WfOyHeWRFGVPkMhSHIdWfz7rjyYeD/hHhZn2wqkTSoK
	 JCUZSdQwWyw/CekuE9j+0+mU7Bm8UjeW/EJ+rAKzeOZy0B7Cax8hL5kTYcWGzZ3O+I
	 mrq6qEb/fSc2l2L59wwcOHAT6dnjaCQqoaDdPpiI=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v4 00/10] media: Add support for Broadcom/RPi BCM2835 ISP
Date: Wed, 16 Sep 2026 20:02:57 +0530
Message-Id: <20260916-b4-vchiq-isp-v4-0-f668c2017b74@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOwW6EIBAG4FcxnMtmGFDU075H04PgUDmou2BJm
 43vXtSDiWmP/yTz/f+LRQqeImuLFwuUfPTzlIN6K5gduumTuO9zZghYQoOSG8WTHfyT+/jgmmq
 LaLGuwLL88gjk/PfOvX8cOdDzK6vLcTzRtthIARIOkseR27HjrtKorWxsj2Wb1KaaLhK38zj6p
 S2SvkkerGCbP/i4zOFnX5/EXpDVCoS4DE2CA6cOjAQwztn67nvq4jyZuQv9LeO7l/A0UMDFwGw
 oBbJRSpTo6B9DnoYW+mLIbDhToyxJlLb6a8e6rr+KRinVlwEAAA==
X-Change-ID: 20250923-b4-vchiq-isp-7e8c22c2860c
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Paul Elder <paul.elder@ideasonboard.com>, Hans Verkuil <hans@jjverkuil.nl>, 
 Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Umang Jain <uajain@igalia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=7525;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=baGFsRC4G/C+1tK95uUAmJ/RXzubU1GR52xw38X4NDc=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqqqkFG1+OndG7uVSvdLeVcu2ZjEUuEYKrxlDBE
 kwbr+HqQOOJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaqqpBQAKCRBD3pH5JJpx
 Rd13D/92id2aC6B5P7fB2wulmuTpkJxHtNoNL/sF3KpG+KZHrRPRal6asSXjTdFhQBDxGkkmZx6
 3PsoYu605zrs2PwFHnzPk/NiBy+Hg3jl+Ck5HMOiv+HmFKppFOEE62k6UL8PItdCVqTbaaFno8N
 MCDBc7Uqgm/EjMjFP5oXrcie5jGfWNZh3296StEX46HsVF6bCfFzujdgdpL8lNMfeCz3PUYu8e0
 foLqPd1XsE1RgK4Qa7+gUR5iyzhjKdn0gv5ShbbkdRwJfqy60mGBJMMyrt/D0Lz8IahnnJqZbfM
 4ibI0OMmBO+X5oI+fCdeRz7yClTvcUhRk4PVdOdVs5vyCPGsSgDvGQY1czuJiLmVPhL3TdOs/S7
 dpmUkfqJEZchWnaPsqmkqx5ZBMjUp9Su/6nHcPMFIx5W6lfvtZbQ+vb3oRbACHaX5rfEsm+ABeC
 7REktBFh4Wk+AwVdu1Eoa5cS/XtC53wmNuYxNI1oMJW8vkQeBS0xSpjitc97Z66I/4E1wEziVPC
 Q8OlbY29qwF1FW5sg9Gwy2tyZ/ZLjD1PtgNZ4bUUOC6BLuDPh+XnlDfCrg+dpNvYpn1TycceVJE
 JNLgZ25Pek2g5vg0ryDYC143SP+3syKGcE0XL0wpW7PGykmRTKLUKYOKqTl98wfmXkAAIudSXMd
 cv+jp7asIAvDl1A==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Hi,

This series adds initial support for Broadcom/Raspberry Pi BCM2835 ISP
present on older Raspberry Pi boards.

The underlying hardware for the ISP is accessed through the VideoCore
VPU, via the VCHIQ/MMAL interface that was recently destaged under
platform/raspberrypi. The ISP driver, and thus this series, depends on
VCSM CMA driver for shared memory support (for lens shading buffers):

https://lore.kernel.org/all/20260916-b4-vc-sm-cma-v4-0-476d1142b5df@ideasonboard.com

The baseline driver was taken from the one present in the downstream
raspberrypi 6.12 tree (which was posted as v1 with minor cleanups).

Since then the driver has been significantly modified, switching away
from custom V4L2 controls to parameter buffers for ISP configuration,
and many other fixes.

You can test this series with libcamera, using the following branch:
https://github.com/jailuthra/libcamera/tree/pi4-upstream

Thanks,
Jai

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v4:
- Rebase on v7.3-rc1
- Set ISP_NUM_INSTANCES to 1 until we have proper support for
  multiplexing ISP instances (Laurent)
- Add a new struct mmal_parameter_isp_parameters {} in mmal-parameters.h
  to send combined updates the firmware (Dave)
- Rework bcm2835-isp-params.c to use the above and save expensive
  messages over IPC boundary (Dave)
- Test if the firmware supports the single struct, and fail with an
  error message asking the user to update their firmware if not (Dave)
- Check for retval of isp_set_param() and print error messages if it
  fails
- Various cleanups and suggestions (Paul)
- Add "media: videobuf2-core: Move type check out of vb2_core_expbuf()"
  on Laurent's suggestion
- Drop comment about FourCC values being copied from V4L2
- Drop old paragraph in Kconfig that got copied from previous revision
- Link to v3: https://lore.kernel.org/r/20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com

Changes in v3:
- Rebase on v7.2-rc1
- Split PATCH 1 to add missing incles before moving the headers
- Update commit messages with Laurent's suggestions
- Drop redundant buffer list and locks for params as we send them
  immediately to the firmware in .buf_queue
- Drop the now empty .stop_streaming() for params node
- Minor cleanups
- Link to v2: https://lore.kernel.org/r/20260210-b4-vchiq-isp-v2-0-4403944152fe@ideasonboard.com

Changes in v2:
- Replace custom V4L2 controls (V4L2_CID_USER_BCM2835_ISP_*) with the
  V4L2 extensible parameters framework via a dedicated metadata output
  node (bcm2835-isp-params). Split params handling into new file
  bcm2835-isp-params.c.
- Add AWB gains and digital gain as extensible parameter block types
  instead of standard V4L2 integer controls.
- Use MEDIA_ENT_F_PROC_VIDEO_ISP instead of MEDIA_ENT_F_PROC_VIDEO_SCALER
  for the media entity function.
- Rework media controller registration: let video device nodes handle
  their own entity registration, removing the manual entity/interface
  creation in media_controller_register_node().
- Propagate colorspace, ycbcr_enc, xfer_func, and quantization properly
  through g_fmt/s_fmt.
- Fold the stats/params FourCC additions (previously a separate commit)
  into this patch.
- Drop the custom CID base commit (no longer needed).
- Update documentation.
- Link to v1: https://lore.kernel.org/r/20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com

---
Dave Stevenson (1):
      media: videobuf2: Allow exporting of a struct dmabuf

Jai Luthra (7):
      media: videobuf2-core: Move type check out of vb2_core_expbuf()
      platform/raspberrypi: vchiq-mmal: Include missing headers
      platform/raspberrypi: vchiq-mmal: Move headers to include/linux
      platform/raspberrypi: vchiq-mmal: Support ISP parameters and stats
      platform/raspberrypi: vchiq-mmal: Support bayer and gray formats
      platform/raspberrypi: vchiq: Add helpers for vchiq driver data
      media: platform: broadcom: Move unicam driver to subdir

Naushir Patuck (2):
      media: platform: broadcom: Add bcm2835-isp driver
      platform/raspberrypi: vchiq: Load bcm2835_isp driver from vchiq

 Documentation/admin-guide/media/bcm2835-isp.dot    |   14 +
 Documentation/admin-guide/media/bcm2835-isp.rst    |   78 +
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../media/v4l/metafmt-bcm2835-isp.rst              |  101 ++
 MAINTAINERS                                        |   12 +-
 drivers/media/common/videobuf2/videobuf2-core.c    |   50 +-
 drivers/media/common/videobuf2/videobuf2-v4l2.c    |    8 +-
 drivers/media/dvb-core/dvb_vb2.c                   |    3 +-
 drivers/media/platform/broadcom/Kconfig            |   18 +-
 drivers/media/platform/broadcom/Makefile           |    3 +-
 .../media/platform/broadcom/bcm2835-isp/Kconfig    |   15 +
 .../media/platform/broadcom/bcm2835-isp/Makefile   |    4 +
 .../broadcom/bcm2835-isp/bcm2835-isp-common.h      |   50 +
 .../broadcom/bcm2835-isp/bcm2835-isp-fmts.h        |  558 ++++++++
 .../broadcom/bcm2835-isp/bcm2835-isp-params.c      |  512 +++++++
 .../broadcom/bcm2835-isp/bcm2835-v4l2-isp.c        | 1509 ++++++++++++++++++++
 .../media/platform/broadcom/bcm2835-unicam/Kconfig |   18 +
 .../platform/broadcom/bcm2835-unicam/Makefile      |    3 +
 .../{ => bcm2835-unicam}/bcm2835-unicam-regs.h     |    0
 .../broadcom/{ => bcm2835-unicam}/bcm2835-unicam.c |    0
 drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
 .../raspberrypi/vchiq-interface/vchiq_arm.c        |    2 +
 .../platform/raspberrypi/vchiq-mmal/mmal-vchiq.c   |    9 +-
 .../linux/raspberrypi}/mmal-common.h               |    4 +
 .../linux/raspberrypi}/mmal-encodings.h            |   67 +
 .../linux/raspberrypi}/mmal-msg-common.h           |    0
 .../linux/raspberrypi}/mmal-msg-format.h           |    0
 .../linux/raspberrypi}/mmal-msg-port.h             |    0
 .../linux/raspberrypi}/mmal-msg.h                  |    0
 .../linux/raspberrypi}/mmal-parameters.h           |  183 +++
 .../linux/raspberrypi}/mmal-vchiq.h                |    0
 include/linux/raspberrypi/vchiq_arm.h              |    1 +
 include/linux/raspberrypi/vchiq_bus.h              |   10 +
 include/media/videobuf2-core.h                     |   22 +-
 include/uapi/linux/bcm2835-isp.h                   |  530 +++++++
 include/uapi/linux/videodev2.h                     |    2 +
 37 files changed, 3740 insertions(+), 50 deletions(-)
---
base-commit: e5e04726cdd043e309677071ab1b65a4b18f422b
change-id: 20250923-b4-vchiq-isp-7e8c22c2860c
prerequisite-change-id: 20251030-b4-vc-sm-cma-f6727c39cd25:v4
prerequisite-patch-id: 4fc8cb49edcbe9c8e699b4ab9f6863ac040a070b
prerequisite-patch-id: 0a5fdf8fe23298fac2c6d188e1686dd292901efc
prerequisite-patch-id: d6d9ee5b60f97112dcf1aea01212c724d9151505
prerequisite-patch-id: 3855700b608f20e2a6857a9702838d1e54fc31cb
prerequisite-patch-id: e2b1e84a1e94e7095b964da693129d36dda78bb0
prerequisite-patch-id: 07e50207cc947f44e1d626b31d0ace7e12a8f3a1
prerequisite-patch-id: 3d82a2605799686668729fdc2677c3f6b7c2aa0d
prerequisite-patch-id: 7795536d875736f74fb4b2e77ca106b127bedbc0
prerequisite-patch-id: ad833b78f90ce3081e470caf70e601fc573bb52d
prerequisite-patch-id: 1898d91213e9bd75be3109180527fb0caf6d7174
prerequisite-patch-id: d0cfc49c673c8c4a4c13d44a547104c24f57cb49

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>

