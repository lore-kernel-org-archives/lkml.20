Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482809;
	b=Db+RWl+3UISw7t8ntC5f0kZw79jmE9J2OzgepRoeANbNilH/aL5nW1C+RMHaXoqK/zPT
	 l9z/xX4TOzb5QcKHf80jIw/e8wHMakDAeNOyuA0In0vXQlWgCMpw5Ddru+e/GqXZa9DMI
	 tS08hbjHuxiBIUy+VQtzhvNynTmgsnToQVZTgoLd2hL4jNKN0KYcQCs54YKFTt6UFrzjN
	 qfy6UGwyUTZl069g85nZW6n8ZmQhw3UuvSr6t6fsElnOkJuosHOmsmgpm58lc5fufupZv
	 zTWsBxeJwn+IvnhJu/gRm8XrDlushXhADWxwsLkvbiTFWPjXUls7FqHI71Rz4ss8m2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482809;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=sN+6KHhV/MILbyHxl9Mh2kVL0y2hAcpXmSQ7bK1LGt4=;
	b=nrj6D766/ZCuJHC2DEuMcwgEdtI4d/6HYjq36pJmoPAFtAbQ1ZEYHqNJaF0oVZGrE3gi
	 XW8KhooTzNpdojAWWkWhIEgxIlky5DpYAdS99jnIZamrWUkh0vJhBlR2hr80/9pijly+9
	 HxlcgnzN4RMwme6a+q2it6E6phvHTqQcOdqu6KFW6Fd6H8jU1tpUM6iPQ0GECZPmzIy0Z
	 ZrpowWXPia87BCBgFtK5ClIuRf2sMqpdcQjq1vcnoLjtllNBGlkJMXRV4NmjiwsweKQlJ
	 LeTYyGfwffOYOhGUGk13oO4nZxJeOoXfVl1mypjmg40RRUG6c0SAk+H0h0cArSPKPFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=CYgHyu4B;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B215606A331;
	Thu, 12 Nov 2026 11:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B215606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=CYgHyu4B
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00C9133D;
	Thu, 12 Nov 2026 12:24:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794482662;
	bh=BE6QGxQK+dHutKNcPyHFlnmqRtO4qCIScMcJPsCaJjA=;
	h=From:Subject:Date:To:Cc:From;
	b=CYgHyu4BwaQE5jw/6cv6dJsWMVRvPPY6pPgqrm3/twSG3AEgfTOo/iLL+nGCS7omD
	 HA8o13hsmryucWTnNVcoDWk7jN2CAFWuM3Vc6dR1MNePKEG8SbHwbhooH/uvwhLkZn
	 x85/qSKFbcwa2ndRM8d1vGrCLGtQLxbWgVExaGzQ=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v6 0/5] media: Add support for Broadcom/RPi BCM2835 ISP
Date: Thu, 12 Nov 2026 16:56:28 +0530
Message-Id: <20261112-b4-vchiq-isp-v6-0-711b48378367@ideasonboard.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XQy26DMBAF0F9BXtfRePwCVvmPqgu/aLwgJHZqt
 Yry7zWwoEJleUeaM1fzJDmkGDLpmydJocQcp2sN6q0h7mKun4FGXzNBQAkdcmoFLe4S7zTmG9W
 hdYgOWwWO1JVbCkP8Xrj3jzWncP+q6mMdbmjfzCQDDitJ80jdaOigNGrHO+dR9kXOqjU5UDeNY
 3z0TdEnQZNjZPYvMT+m9LO0L2w5UFUFjO2KFkaBBgOWA9hhcO05+mDydLWTSf5U8cUruBnIYGd
 gNYQA3gnBJA7hwOCboZneGbwag22Ry8CkU0c9xGZ0TO0MMRtK1dcD01aLA0P+NfY9ZDXQt60G4
 z06+Md4vV6/OFCr8x8CAAA=
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
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8286;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=BE6QGxQK+dHutKNcPyHFlnmqRtO4qCIScMcJPsCaJjA=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq9aJov/EVqJwwekv5YymoxVmLqFZ3tMQj/mI7v
 LYGqY5wXECJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCavWiaAAKCRBD3pH5JJpx
 Ra1VEACx3uLVOQAjpwObpDc9qD4T+HBAHeGDM0jmIPmf7ooq+skLAO1ZWMDQ+0DdM3DRZ1kDWqT
 0nVEiltkJwxzlNQx3IeREKzR7nEqJQQozOE6EuKgRs1Wo6kO6P0bdS6ABQvcgwT+6JyT7MyaoHo
 RaOqxTrVuynUAiOL3+lATHRY7fJAcH+3cuu++/+VmqpPH7+8wZZI7TF5sFs+cK3K+bRPW4c0U2M
 sBUZWXE869Ia6Ic3IfhJ2kWF9qwAQzVeRvzezAjcuLNUxgFUZTmgMiMgzHglEZCVCYkv7tF0ACy
 a4Hny9SCJP1Dq3umsfTjb7wr+EnsSXzKHWxPPTvPSb0lvuO431gDNjsVmDerJ3L21OdPwaYxEqg
 +IVY2hKWPferVXdRSOfjY+e7CDqqPZqI3m147TKqJSTCwb2KX9v+G5oRALNic2aguXIW4tQJXwY
 iZMxL/5FEGqpv015CAO++/KKoEKKVMI3wPuPofBwBcvpQch7uv2gBCGHl2/CD0nb79l8dOl3yw4
 ty9Yqhc8xfsXTXWhkFLk3/kTwd8iR40+otVbK5inzXpPX7q239gDaOHxxSin3LPsfdSI5VW6/DK
 Jo/P45HWN666VI4WXv7+B6HxwOek2Wb3Doto/Yn82h1I7vscu/cvyCEft4Rf2p2DBQOfsQbTGlS
 WgpqS8mxXm5BGoA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Hi,

This series adds initial support for Broadcom/Raspberry Pi BCM2835 ISP
present on older Raspberry Pi boards.

The underlying hardware for the ISP is accessed through the VideoCore
VPU, via the VCHIQ/MMAL interface that was recently destaged under
platform/raspberrypi.

This series depends on the VCSM CMA driver for shared memory support
(for lens shading buffers) This is posted as a separate series here:

https://lore.kernel.org/all/20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com/T/#t

I have also moved the patches from this series that update various VCHIQ
and MMAL related files under drivers/platform/raspberrypi in preparation
of the ISP driver, to the above series.

This series along with dependencies is available for ease of testing in
this linux branch:
https://github.com/jailuthra/linux/tree/b4/rpi-isp

You can test this series with libcamera, using the following libcamera
branch:
https://github.com/jailuthra/libcamera/tree/pi4-upstream

This series (v4 onwards) depends on the latest raspberry pi firmware
present at: https://github.com/raspberrypi/rpi-firmware

Thanks,
Jai

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v6:
- Rebase on v7.4-rc1
- Move vchiq/mmal patches to the vc-sm-cma series, as it goes through a
  separate tree
- Update usage of vc_sm_cma_int_handle() which is now renamed to
  vc_sm_cma_get_vc_handle()
- Link to v5: https://lore.kernel.org/r/20260917-b4-vchiq-isp-v5-0-2d8870add2c0@ideasonboard.com

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

Jai Luthra (2):
      media: videobuf2-core: Move type check out of vb2_core_expbuf()
      media: platform: broadcom: Move unicam driver to subdir

Naushir Patuck (2):
      media: platform: broadcom: Add bcm2835-isp driver
      platform/raspberrypi: vchiq: Load bcm2835_isp driver from vchiq

 Documentation/admin-guide/media/bcm2835-isp.dot    |   14 +
 Documentation/admin-guide/media/bcm2835-isp.rst    |   78 +
 Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
 .../userspace-api/media/v4l/meta-formats.rst       |    1 +
 .../media/v4l/metafmt-bcm2835-isp.rst              |  101 ++
 MAINTAINERS                                        |   11 +-
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
 include/linux/raspberrypi/mmal-parameters.h        |  155 +-
 include/linux/raspberrypi/vchiq_arm.h              |    1 +
 include/media/videobuf2-core.h                     |   21 +-
 include/uapi/linux/bcm2835-isp.h                   |  530 +++++++
 include/uapi/linux/videodev2.h                     |    2 +
 28 files changed, 3618 insertions(+), 57 deletions(-)
---
base-commit: bc71431221f5ba8bb33918399552636e059c2c45
change-id: 20250923-b4-vchiq-isp-7e8c22c2860c
prerequisite-change-id: 20251030-b4-vc-sm-cma-f6727c39cd25:v5
prerequisite-patch-id: 4fc8cb49edcbe9c8e699b4ab9f6863ac040a070b
prerequisite-patch-id: 0a5fdf8fe23298fac2c6d188e1686dd292901efc
prerequisite-patch-id: d6d9ee5b60f97112dcf1aea01212c724d9151505
prerequisite-patch-id: 3855700b608f20e2a6857a9702838d1e54fc31cb
prerequisite-patch-id: e2b1e84a1e94e7095b964da693129d36dda78bb0
prerequisite-patch-id: 08c61bad2960da29ae7178034560ebab46dc3497
prerequisite-patch-id: 07e50207cc947f44e1d626b31d0ace7e12a8f3a1
prerequisite-patch-id: 3d82a2605799686668729fdc2677c3f6b7c2aa0d
prerequisite-patch-id: b2a6012a5d54ed1ebad4034daa7bc9ca10ab67d4
prerequisite-patch-id: 7038462996eaf42f0bf47e5eda1cf264abfd8953
prerequisite-patch-id: 1898d91213e9bd75be3109180527fb0caf6d7174
prerequisite-patch-id: d0cfc49c673c8c4a4c13d44a547104c24f57cb49
prerequisite-patch-id: 99e2132187c5db1d65d48200255170835a2a302c
prerequisite-patch-id: d1edc04e1689cb05f13e61f1370305d4f959cb5b
prerequisite-patch-id: 1f6521b641f29e85385cd442f347a7745e830a83
prerequisite-patch-id: f366e5894549a0e9142e8eb202e829834f617679
prerequisite-patch-id: a7586b3cffb7e1300ff1bd9ce93f636a2d9b48b2

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>

