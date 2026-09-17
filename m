Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E7B422E2E;
	Thu, 17 Sep 2026 08:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633518; cv=none; b=dvtos56nggHIp+pjNCSkJNJ+Y0GnJJ4UXK1GgCaV34QpHlF0S1aIR4WVE5JU14Je0k/lGFef74sxXCPB6KDZWPF6ZlHIwv2famft0QGbA1DZ3pGCQ9BJcXbSoUbLbVhedV1Vxf5icwPV+2Vc9s8EXR8Djck3BkdypvltDL58eTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633518; c=relaxed/simple;
	bh=KVb+ZyMayDXh02Z2RfakKWR5d9vfuHKadgr6bDsJcgs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KgzLI2y64xb/faixipJ2nvf5AM1ehzw+9w5ZXnPxz9sMSVXMmoiZA0wkNqOP/MxElCk5LRW5rr6yJvPUcsjRQDyrYAHPz8eoSp6pk/4S/PctEEncGp4zIoYXjAjgi/n2dVUbAJaH9T+SJ+sXN0yVOBm9ZbZr05+iGGYCUma8w9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EnttR4dR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EnttR4dR"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15E7F512;
	Thu, 17 Sep 2026 10:23:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789633399;
	bh=KVb+ZyMayDXh02Z2RfakKWR5d9vfuHKadgr6bDsJcgs=;
	h=From:Subject:Date:To:Cc:From;
	b=EnttR4dROa2Z+ortbx0ek3Pne7H+hATcQm9L9tUsC9F2DdnTYACp5pft/Ipch6Ojl
	 9CakZM88ioHNI+DadCZwhJ0qHHAw4Niw/WZ3pNuSZQ1EDnz0VFtACGDdgTdWBjdDzu
	 lKvflpw/hV6o74Z+cuqIQ8kC2qLKowI4Qyce8OYY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v5 00/10] media: Add support for Broadcom/RPi BCM2835 ISP
Date: Thu, 17 Sep 2026 13:53:06 +0530
Message-Id: <20260917-b4-vchiq-isp-v5-0-2d8870add2c0@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XQTW6EMAwF4KugrJuR4/wBq96j6iIJoWQBzCQ0a
 jXi7g2wQEKd5bPkz09+kuRj8Im01ZNEn0MK81SCfKuIG8z05WnoSiYIKKFBTq2g2Q3hQUO6U+1
 rh+iwVuBIWblH34efnfv4PHL0j++iLsfwRNtqIxlwOEiaRupGQ3ulUTveuA5lm8WmWpM8dfM4h
 qWtsr5xGh0jmz+EtMzxd2+f2X6gqAoYuxTNjAL1BiwHsH3v6vfQeZPmyc4mdreC717G00AGFwO
 LIQTwRggmsfcvDH4amumLwYvR2xq59Ew69aqHOI2GqYshNkOp8npg2mrxj7Gu6x8+EWFf2wEAA
 A==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8614;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=KVb+ZyMayDXh02Z2RfakKWR5d9vfuHKadgr6bDsJcgs=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqq6PNX26L9x9W3OYZFJ4K1meLSt68Jv2eMzP2v
 uXIz8T7IVyJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaqujzQAKCRBD3pH5JJpx
 RVTyD/9fFxDVTzDenIZsnEvhm+IErGbR4aUEKIknyT/JhfKsOFrITQ4QjabnXU6TkcFFBXaLoPa
 Td896lHph8GE/RKhdo/WCOjgRlUCwZ1ZXc+YKkSFBuO/I5+t6HFOE7ydXDSijESEJ2u1eZ2SNFJ
 SMdyjE+1/141q4Jqz3n607rjVdCxy9Y4OebwwgMYHvpq4IjdzQMtXn+w+vgoahgni7ve23y6n0j
 uvJx/0QbGr8735EkBrU5fJe5tsHOrz+jJUtNHwPNzpZTlxPAOolx96gE8TmNXnpK4d8TtGow8mS
 hGvuviHPbH62jAhE6NN355jnD+I9hFzBD9PqUrGRYksYm4UGs48R3M9Y3/KrEFZ6QeGM5T0/MBj
 Jqwiu8WP1WaHLo8C6cz++Ha15Fz+DLj6dM0eYxD123ziC+JKQ51HQmP6RywD4d9Rq2IpKeTNKkx
 aKuU/VlATMIzayGPR0hNKl4wspkNXjxLF476N0XWwID71Jzd2FKDOzKkJhDMplrzxl5+M78c+J8
 k30lkNQQDLNlECemeGoqdYGsqNTmfWDpIeZVqmzrZoVR9y2x17ol7djF+6UkLoxtRMmCOx3iBCf
 B9nl3ldNZfjmxBp8avICw8o6mvTMk2LuLzLaRlhP6eztCHbrz66mq3/T6l1x7G9UcEelybO41GE
 ru//BOQ3r0rXMog==
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

This series along with dependencies is available for ease of testing in
this linux branch:
https://github.com/jailuthra/linux/tree/b4/rpi-isp

You can test this series with libcamera, using the following libcamera
branch:
https://github.com/jailuthra/libcamera/tree/pi4-upstream

This series (v4 onwards) depends on the latest raspberry pi firmware
that is in process of being published. I'll reply with a link to this
cover letter when it's available.

Thanks,
Jai

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v5:
- Add missing note in cover letter about dependency on latest firmware
- Update documentation of return type of vb2_core_expbuf_dmabuf() to only
  ERR_PTR and not NULL
- Fix warnings reported by media-ci (coccinelle, smatch etc.)
  - Use struct_group() around the fields we want to memcpy from UAPI param
    struct to the anonymous structs inside mmal_parameter_isp_parameters
  - Don't use complicated pointer arithmetic and instead write
    mmal_param->_mmal_substruct.update = 1 explicitly
  - Only check for IS_ERR and not IS_ERR_OR_NULL for output of
    vb2_core_expbuf_dmabuf()
  - Check node->id against array bounds
- Link to v4: https://lore.kernel.org/r/20260916-b4-vchiq-isp-v4-0-f668c2017b74@ideasonboard.com

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
 .../broadcom/bcm2835-isp/bcm2835-isp-fmts.h        |  558 +++++++
 .../broadcom/bcm2835-isp/bcm2835-isp-params.c      |  510 +++++++
 .../broadcom/bcm2835-isp/bcm2835-v4l2-isp.c        | 1516 ++++++++++++++++++++
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
 .../linux/raspberrypi}/mmal-parameters.h           |  217 +++
 .../linux/raspberrypi}/mmal-vchiq.h                |    0
 include/linux/raspberrypi/vchiq_arm.h              |    1 +
 include/linux/raspberrypi/vchiq_bus.h              |   10 +
 include/media/videobuf2-core.h                     |   21 +-
 include/uapi/linux/bcm2835-isp.h                   |  530 +++++++
 include/uapi/linux/videodev2.h                     |    2 +
 37 files changed, 3778 insertions(+), 50 deletions(-)
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

