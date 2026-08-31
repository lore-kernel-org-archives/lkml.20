Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DA5358373;
	Mon, 31 Aug 2026 05:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788154962; cv=none; b=eiUIyumt24/lv3by2AznyvWp8HenTl/phDkunMcoMtIGKq6ut7rHCJLaNGJ5Fol/6rjbh7RjF4flTeTFlIOrRCcMxOrjqHux8kWDHhzHTBUIkJDmx+nFQXLjX8TLz8Z4KaVeKLcCsbtvilYBo3vDuOoki3KqGLc60sR4BbIP2Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788154962; c=relaxed/simple;
	bh=QyC4aln2oLmLMJyl0y55BgXRWNy18iCgmjlPpUUKYUM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=HEjqMaQim2wLcm3hsz5LwLGJJRzamTDkniWzmFblOv6c1hNGLCdC2wt9Cj0akSwh/WaApkg/81vU5fiqrYokiF1qVIwL+b1jTr/N+46yUZ4LUbRdunvqhOWiawgdxdTXB9crt1YCzr/gxYX0I/Zd5t/10gNuxOGXqe3dj3JqKPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n3aMrSLv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n3aMrSLv"
Received: from neptunite.rasen.tech (unknown [IPv6:2400:2411:160:2f00:a9ae:3688:6dfb:71b0])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9EFE26DC;
	Mon, 31 Aug 2026 07:41:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788154867;
	bh=QyC4aln2oLmLMJyl0y55BgXRWNy18iCgmjlPpUUKYUM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=n3aMrSLv9NLzbSttYLVDUI52ipXWR/ZGuJg8gQwe+A//UxmN1OC45bhXFmVDpUbv4
	 szjeYdl3ozr/TW/yhDiu++ivE2kllPoSjDIbGVkgFfdSMDYx6R7iJeL4nxOoYXdFUi
	 lNtsp2vi6gh1q1TyO8vrFVEehTaxssOkHXozXoQ8=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com>
References: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com>
Subject: Re: [PATCH v3 0/9] media: Add support for Broadcom/RPi BCM2835 ISP
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.org>, Umang Jain <uajain@igalia.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, Jai Luthra <jai.luthra@ideasonboard.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Tomasz Figa <tfiga@chromium.org>
Date: Mon, 31 Aug 2026 14:42:30 +0900
Message-ID: <178815495015.1005982.5785137659086474897@neptunite.rasen.tech>
User-Agent: alot/0.0.0

Hi Jai,

Thanks for the series.

Quoting Jai Luthra (2026-07-17 20:04:15)
> Hi,
>=20
> This series adds initial support for Broadcom/Raspberry Pi BCM2835 ISP
> present on older Raspberry Pi boards.
>=20
> The underlying hardware for the ISP is accessed through the VideoCore
> VPU, via the VCHIQ/MMAL interface that was recently destaged under
> platform/raspberrypi. The ISP driver, and thus this series, depends on
> VCSM CMA driver for shared memory support (for lens shading buffers):
>=20
> https://lore.kernel.org/all/20260105-b4-vc-sm-cma-v2-0-4daea749ced9@ideas=
onboard.com/
>=20
> The baseline driver was taken from the one present in the downstream
> raspberrypi 6.12 tree (which was posted as v1 with minor cleanups).
>=20
> Since then the driver has been significantly modified, switching away
> from custom V4L2 controls to parameter buffers for ISP configuration,
> and many other fixes.
>=20
> You can test this series with libcamera, using the following branch:
> https://github.com/jailuthra/libcamera/tree/pi4-upstream

It works! \o/

Tested on Raspberry Pi 4B with imx219.

# cam -c1 --capture=3D10
[42:53:29.157032279] [4146]  INFO Camera camera_manager.cpp:340 libcamera v=
0.7.2+10-0de3e405
[42:53:29.182984113] [4149]  INFO IPAProxy ipa_proxy.cpp:184 Using tuning f=
ile /usr/share/libcamera/ipa/rpi/vc4/imx219.json
[42:53:29.191749464] [4149]  WARN RPI vc4.cpp:377 Mismatch between Unicam a=
nd CamHelper for embedded data usage!
[42:53:29.192265409] [4149]  INFO Camera camera_manager.cpp:223 Adding came=
ra '/base/i2c-mux0/i2c@1/camera@10' for pipeline handler rpi/vc4
[42:53:29.192290964] [4149]  INFO RPI vc4.cpp:434 Registered camera /base/i=
2c-mux0/i2c@1/camera@10 to Unicam device /dev/media0 and ISP device /dev/me=
dia1
Using camera /base/i2c-mux0/i2c@1/camera@10 as cam0
[42:53:29.192825798] [4146]  INFO Camera camera.cpp:1216 configuring stream=
s: (0) 800x600-XRGB8888/sRGB
[42:53:29.192997261] [4149]  INFO RPI vc4.cpp:644 Sensor: /base/i2c-mux0/i2=
c@1/camera@10 - Selected sensor format: 1640x1232-SBGGR10_1X10/RAW - Select=
ed unicam format: 1640x1232-pBAA/RAW
cam0: Capture 10 frames
154409.246635 (0.00 fps) cam0-stream0 seq: 000000 bytesused: 1920000
154409.279952 (30.01 fps) cam0-stream0 seq: 000001 bytesused: 1920000
154409.313269 (30.01 fps) cam0-stream0 seq: 000002 bytesused: 1920000
154409.380002 (14.99 fps) cam0-stream0 seq: 000003 bytesused: 1920000
154409.446734 (14.99 fps) cam0-stream0 seq: 000004 bytesused: 1920000
154409.513466 (14.99 fps) cam0-stream0 seq: 000005 bytesused: 1920000
154409.580197 (14.99 fps) cam0-stream0 seq: 000006 bytesused: 1920000
154409.646930 (14.99 fps) cam0-stream0 seq: 000007 bytesused: 1920000
154409.713658 (14.99 fps) cam0-stream0 seq: 000008 bytesused: 1920000
154409.780390 (14.99 fps) cam0-stream0 seq: 000009 bytesused: 1920000

Tested-by: Paul Elder <paul.elder@ideasonboard.com>

>=20
> Thanks,
> Jai
>=20
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
> Changes in v3:
> - Rebase on v7.2-rc1
> - Split PATCH 1 to add missing incles before moving the headers
> - Update commit messages with Laurent's suggestions
> - Drop redundant buffer list and locks for params as we send them
>   immediately to the firmware in .buf_queue
> - Drop the now empty .stop_streaming() for params node
> - Minor cleanups
> - Link to v2: https://lore.kernel.org/r/20260210-b4-vchiq-isp-v2-0-440394=
4152fe@ideasonboard.com
>=20
> Changes in v2:
> - Replace custom V4L2 controls (V4L2_CID_USER_BCM2835_ISP_*) with the
>   V4L2 extensible parameters framework via a dedicated metadata output
>   node (bcm2835-isp-params). Split params handling into new file
>   bcm2835-isp-params.c.
> - Add AWB gains and digital gain as extensible parameter block types
>   instead of standard V4L2 integer controls.
> - Use MEDIA_ENT_F_PROC_VIDEO_ISP instead of MEDIA_ENT_F_PROC_VIDEO_SCALER
>   for the media entity function.
> - Rework media controller registration: let video device nodes handle
>   their own entity registration, removing the manual entity/interface
>   creation in media_controller_register_node().
> - Propagate colorspace, ycbcr_enc, xfer_func, and quantization properly
>   through g_fmt/s_fmt.
> - Fold the stats/params FourCC additions (previously a separate commit)
>   into this patch.
> - Drop the custom CID base commit (no longer needed).
> - Update documentation.
> - Link to v1: https://lore.kernel.org/r/20260113-b4-vchiq-isp-v1-0-ea0b30=
0bffc8@ideasonboard.com
>=20
> ---
> Dave Stevenson (1):
>       media: videobuf2: Allow exporting of a struct dmabuf
>=20
> Jai Luthra (6):
>       platform/raspberrypi: vchiq-mmal: Include missing headers
>       platform/raspberrypi: vchiq-mmal: Move headers to include/linux
>       platform/raspberrypi: vchiq-mmal: Support ISP parameters and stats
>       platform/raspberrypi: vchiq-mmal: Support bayer and gray formats
>       platform/raspberrypi: vchiq: Add helpers for vchiq driver data
>       media: platform: broadcom: Move unicam driver to subdir
>=20
> Naushir Patuck (2):
>       media: platform: broadcom: Add bcm2835-isp driver
>       platform/raspberrypi: vchiq: Load bcm2835_isp driver from vchiq
>=20
>  Documentation/admin-guide/media/bcm2835-isp.dot    |   14 +
>  Documentation/admin-guide/media/bcm2835-isp.rst    |   78 +
>  Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
>  .../userspace-api/media/v4l/meta-formats.rst       |    1 +
>  .../media/v4l/metafmt-bcm2835-isp.rst              |  101 ++
>  MAINTAINERS                                        |   12 +-
>  drivers/media/common/videobuf2/videobuf2-core.c    |   21 +-
>  drivers/media/platform/broadcom/Kconfig            |   18 +-
>  drivers/media/platform/broadcom/Makefile           |    3 +-
>  .../media/platform/broadcom/bcm2835-isp/Kconfig    |   15 +
>  .../media/platform/broadcom/bcm2835-isp/Makefile   |    4 +
>  .../broadcom/bcm2835-isp/bcm2835-isp-common.h      |   51 +
>  .../broadcom/bcm2835-isp/bcm2835-isp-fmts.h        |  558 ++++++++
>  .../broadcom/bcm2835-isp/bcm2835-isp-params.c      |  470 ++++++
>  .../broadcom/bcm2835-isp/bcm2835-v4l2-isp.c        | 1502 ++++++++++++++=
++++++
>  .../media/platform/broadcom/bcm2835-unicam/Kconfig |   23 +
>  .../platform/broadcom/bcm2835-unicam/Makefile      |    3 +
>  .../{ =3D> bcm2835-unicam}/bcm2835-unicam-regs.h     |    0
>  .../broadcom/{ =3D> bcm2835-unicam}/bcm2835-unicam.c |    0
>  drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
>  .../raspberrypi/vchiq-interface/vchiq_arm.c        |    2 +
>  .../platform/raspberrypi/vchiq-mmal/mmal-vchiq.c   |    9 +-
>  .../linux/raspberrypi}/mmal-common.h               |    4 +
>  .../linux/raspberrypi}/mmal-encodings.h            |   68 +
>  .../linux/raspberrypi}/mmal-msg-common.h           |    0
>  .../linux/raspberrypi}/mmal-msg-format.h           |    0
>  .../linux/raspberrypi}/mmal-msg-port.h             |    0
>  .../linux/raspberrypi}/mmal-msg.h                  |    0
>  .../linux/raspberrypi}/mmal-parameters.h           |   86 ++
>  .../linux/raspberrypi}/mmal-vchiq.h                |    0
>  include/linux/raspberrypi/vchiq_arm.h              |    1 +
>  include/linux/raspberrypi/vchiq_bus.h              |   10 +
>  include/media/videobuf2-core.h                     |   15 +
>  include/uapi/linux/bcm2835-isp.h                   |  530 +++++++
>  include/uapi/linux/videodev2.h                     |    2 +
>  35 files changed, 3579 insertions(+), 25 deletions(-)
> ---
> base-commit: 728e68a889bcf257b1e67298b12c360e5c3a13e0
> change-id: 20250923-b4-vchiq-isp-7e8c22c2860c
> prerequisite-message-id: 20260717-b4-vc-sm-cma-v3-0-6c4e77804e5d@ideasonb=
oard.com
> prerequisite-patch-id: 07e50207cc947f44e1d626b31d0ace7e12a8f3a1
> prerequisite-patch-id: 3d82a2605799686668729fdc2677c3f6b7c2aa0d
> prerequisite-patch-id: 3022f05545dcfdaf05522f8ce1ebd8b9e3bc412f
> prerequisite-patch-id: ad833b78f90ce3081e470caf70e601fc573bb52d
> prerequisite-patch-id: 1898d91213e9bd75be3109180527fb0caf6d7174
> prerequisite-patch-id: d0cfc49c673c8c4a4c13d44a547104c24f57cb49
>=20
> Best regards,
> --=20
> Jai Luthra <jai.luthra@ideasonboard.com>
>=20
>
