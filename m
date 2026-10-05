Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCF14BA1E4
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 16:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791216858; cv=pass; b=dfpYsf60PrLd8UFMcUkOovW8yjzWQA37NBG7yXz7W+yVnso9WWl6AVIEQo441JiuO+jNw61CcYq7SIyIXiVvGHzqPwK/9K5kOpygViCZqzQ3bT7ahz4qxIJtYrEKWsSGyOeET1ZgyiLh6Foe08248lsxhj+QC1NmfLuBvKH2NS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791216858; c=relaxed/simple;
	bh=1Lg4V2FncwDXcLAwv89gPQBJl7/fzGVgpfHfFJFLWuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rNUH+TQMOR2c+Z472RA3ZfpuHo5+PVe59fyOuQKU/E8p4e5cB+VHodN+fSJpQDaGTBqhtawnakoVh4Rnv95kVG5zfGTCuJQ8VE/F29I2XzWYNDSUwu7Ia0uDLSVqEQQrFrZaokoIOhmNl/5DHsw0i32EhuWpxmMmdMJP/78owcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Wxji9CTQ; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Wxji9CTQ"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccde2a99so1024689fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 09:14:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791216854; cv=none;
        d=google.com; s=arc-20260327;
        b=b/KE1piUUIcuZAfctLiYAW3X/aXkmaqTUQl0MZ5PrEcEy7nnPuEy3b254HMctv4Whp
         WZLQttSrXKxrBuYwaSxqcm+Afw5GZhLK7wj01Zh3BcuiLYy98p1P9/rPlNwxxqlPaZN7
         38G3Dg3BxG0cMJh9Mvc7Wvy7FFBSwJ8KtEuBFyjEMo42ZP5uSf1pP69qwTFgwkkELwLv
         Lx0JYNRuRXt5YR/2Q9lNtJxKYlOct1IteIHuDW2Uzm+3CKI/B7l1NusftnM/AfR9YBQH
         6PQnIioxYsf7kawi9stzcF5BEbj8CJFp6sltGVkMwzImt2rXLDqKyRHygUJHq34ssZCN
         DwMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=InHjDN1N00u2ZenU8o4ZFmd6Elju25okz+ME8yq6Rxo=;
        fh=fWAXzKqGjJV/zZL6MtIBemXji/6gymlX/TnTklqhWB0=;
        b=AzCe5YD9FXf0ORnG3Nuxp3+K7XZ8oOG2BqhivGyj0mrUW6YZBAuRdYhZPTm3eOaMhV
         9CnQLqzyQFVG1FUioUxiKtB/sYpSLd3MJfU1a8bOg9z/D4XmnCNaRFvbl8/8bQy/b+oU
         nEpVBri+FnvSy49G+1gjtIZRDp8vVMLL/JicUpq2yq4/UX6NyVcX9NpxYYr7j8TA8Z3D
         KYjbehENcOlUYGmU7Nv1Py+UvdYrnnmQxKuXePUW0opzE2N31XmMyuzeIIhugRlJ5fOX
         v7tS8KO5/BXG7a04VM/NeFXJ/sHHH4MOKSYurmUkbeV0h/MpTKHfjrTNTn1BImkcDS3I
         GeiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791216854; x=1791821654; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=InHjDN1N00u2ZenU8o4ZFmd6Elju25okz+ME8yq6Rxo=;
        b=Wxji9CTQYoixdFWGSBU53pG57ip6jxY4exWPNK5860G4OTOK8Jq2QSTRD6xKf0RiAj
         84Jp9eeCDm6PppZ5R73qqw6LkDaatYAdAk9wvQZdPyUv480OHTHa7d8hqxWUVtbdmJb/
         gx/xAUlUdz7Zp6sbTnsJxhupTovmeft6R3/m3EVpKPBWQvM8khSqs74GvcTAja1AFdfm
         Z2O/p0orKimFldORECip6fp67IGE7oAMf/N3bIHlL+Ke8RDFgEu0s/N1ovXbao9YmLeN
         5mruU1rIpko1Fv8m/lz9Sqk8BThdccoQ0Xj2TrQgM+ZQz2eFwTSuewP6s0IVAy0b7rpt
         NiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791216854; x=1791821654;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=InHjDN1N00u2ZenU8o4ZFmd6Elju25okz+ME8yq6Rxo=;
        b=Earrh3q36gR1/t6zu+u+tbUFKrw+Wi9/HXk7AYqhXBouRM9T6VLVB/vV8KLhBHrKoH
         n83dt/V0kHBWNLaINFHhxd4GVbEuSdWPhUBsi/UEMEZ7VzLC3DOvvrggIp+I6SWLBop/
         WTbZrQ6/XpAzmAlF34tu+FMfdaaOp9qZgRx+tlYROHhGwF96Vga5eHP2IUb58OKNMRnB
         s9ZjOhj83ezAK+zREU047sJUrMHUN+Ud81400PNWjlYG2Fk7bi65Pk7QbYDk4izjujlA
         8EWhFQwm9ZEpEZQBfNLyudXcbu0qs1zdhrwNqNHI1M6lLhRpMfhMrQ0hKsDT9oFf9WJc
         mB5A==
X-Forwarded-Encrypted: i=1; AKwUvByBnlirmSErEeY7vLPASLusvPysuwDjhqNLe/+GFNN/plAbB7SyHp9DCBU41jwTT0eOr1QlF+UQoI7VZIU=@vger.kernel.org
X-Gm-Message-State: AFuF++mbl7Zz4DyLyK/DeEnAqeWCiRMZFxg3jyBYkcsd1UZHlhWmPyhe
	t3MVB9HS0tudAxLAdIjswST5AHRfK8azDASQFF7AuorXQcbLeezbH8t9UASG0k8posLdRXGXnRQ
	T8LEi4maM9CDUURqDEkpvP7RQN+5NcRxGKCnuQ5wAgg==
X-Gm-Gg: AYBFou3OepwhV0m2DfzIOoMm1hnGPsW2pFcWf+YQ/uU52XYWKh5G1NO2dMHRhjXT1TM
	67b4L9++3dDTyhKOHsdcrXUZcT0o7xdV6VM0IKrvFb4OQL47Z6dEYemr4lY9CDtNn0ld7OrG9xc
	drwD5NEfq8BTb+yYySIpfOX1r9DAD/5HOIQQaqS+QDhtEM5GIYqWGGijCN7TylAF0XKcEouXaIP
	vTCWiE0GS2YqBy3JNi+grb9+/vZPwxW0dmRwsmdzJNhQ6h5P7h51o9bcZDKtr+5xsB5IYC/ElfW
	v9gxEnLxrNin9NGQgXvBrqk2QafiIZHDINuISCGG7XtdKBzgLzAOdLVcvcCyAYzO9NT04yD8v39
	P+1nNJd8zqH2gTtU/nNDcbczOmKk+xkiYFXYIyjU+u4J9UAQ2PNAgY1+p1sDwn94x+79vdS3bjq
	RYkBrE/cU=
X-Received: by 2002:a05:6870:e85:b0:485:d31b:775b with SMTP id
 586e51a60fabf-49e15d08507mr9429280fac.25.1791216847367; Mon, 05 Oct 2026
 09:14:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-b4-vchiq-isp-v5-0-2d8870add2c0@ideasonboard.com>
In-Reply-To: <20260917-b4-vchiq-isp-v5-0-2d8870add2c0@ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 5 Oct 2026 17:13:51 +0100
X-Gm-Features: AclHuK8ohq1xfHhkCIyfrnDiVHaV8j_AdP1HJRGDL58HGTFb6cYLKX8bwCA2Psg
Message-ID: <CAPY8ntAmUoBOb46ufA0hXhE6tODxLZ=7SfxvVRjpsbzqWoZTfg@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] media: Add support for Broadcom/RPi BCM2835 ISP
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Tomasz Figa <tfiga@chromium.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Naushir Patuck <naush@raspberrypi.com>, 
	Stefan Wahren <wahrenst@gmx.net>, Paul Elder <paul.elder@ideasonboard.com>, 
	Hans Verkuil <hans@jjverkuil.nl>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Umang Jain <uajain@igalia.com>
Content-Type: text/plain; charset="UTF-8"

Hi Jai and All.

On Thu, 17 Sept 2026 at 09:25, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
>
> Hi,
>
> This series adds initial support for Broadcom/Raspberry Pi BCM2835 ISP
> present on older Raspberry Pi boards.
>
> The underlying hardware for the ISP is accessed through the VideoCore
> VPU, via the VCHIQ/MMAL interface that was recently destaged under
> platform/raspberrypi. The ISP driver, and thus this series, depends on
> VCSM CMA driver for shared memory support (for lens shading buffers):
>
> https://lore.kernel.org/all/20260916-b4-vc-sm-cma-v4-0-476d1142b5df@ideasonboard.com
>
> The baseline driver was taken from the one present in the downstream
> raspberrypi 6.12 tree (which was posted as v1 with minor cleanups).
>
> Since then the driver has been significantly modified, switching away
> from custom V4L2 controls to parameter buffers for ISP configuration,
> and many other fixes.
>
> This series along with dependencies is available for ease of testing in
> this linux branch:
> https://github.com/jailuthra/linux/tree/b4/rpi-isp
>
> You can test this series with libcamera, using the following libcamera
> branch:
> https://github.com/jailuthra/libcamera/tree/pi4-upstream
>
> This series (v4 onwards) depends on the latest raspberry pi firmware
> that is in process of being published. I'll reply with a link to this
> cover letter when it's available.

Apologies, I hadn't nudged the relevant person for it to be released.
It is now in https://github.com/raspberrypi/rpi-firmware

  Dave

> Thanks,
> Jai
>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
> Changes in v5:
> - Add missing note in cover letter about dependency on latest firmware
> - Update documentation of return type of vb2_core_expbuf_dmabuf() to only
>   ERR_PTR and not NULL
> - Fix warnings reported by media-ci (coccinelle, smatch etc.)
>   - Use struct_group() around the fields we want to memcpy from UAPI param
>     struct to the anonymous structs inside mmal_parameter_isp_parameters
>   - Don't use complicated pointer arithmetic and instead write
>     mmal_param->_mmal_substruct.update = 1 explicitly
>   - Only check for IS_ERR and not IS_ERR_OR_NULL for output of
>     vb2_core_expbuf_dmabuf()
>   - Check node->id against array bounds
> - Link to v4: https://lore.kernel.org/r/20260916-b4-vchiq-isp-v4-0-f668c2017b74@ideasonboard.com
>
> Changes in v4:
> - Rebase on v7.3-rc1
> - Set ISP_NUM_INSTANCES to 1 until we have proper support for
>   multiplexing ISP instances (Laurent)
> - Add a new struct mmal_parameter_isp_parameters {} in mmal-parameters.h
>   to send combined updates the firmware (Dave)
> - Rework bcm2835-isp-params.c to use the above and save expensive
>   messages over IPC boundary (Dave)
> - Test if the firmware supports the single struct, and fail with an
>   error message asking the user to update their firmware if not (Dave)
> - Check for retval of isp_set_param() and print error messages if it
>   fails
> - Various cleanups and suggestions (Paul)
> - Add "media: videobuf2-core: Move type check out of vb2_core_expbuf()"
>   on Laurent's suggestion
> - Drop comment about FourCC values being copied from V4L2
> - Drop old paragraph in Kconfig that got copied from previous revision
> - Link to v3: https://lore.kernel.org/r/20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com
>
> Changes in v3:
> - Rebase on v7.2-rc1
> - Split PATCH 1 to add missing incles before moving the headers
> - Update commit messages with Laurent's suggestions
> - Drop redundant buffer list and locks for params as we send them
>   immediately to the firmware in .buf_queue
> - Drop the now empty .stop_streaming() for params node
> - Minor cleanups
> - Link to v2: https://lore.kernel.org/r/20260210-b4-vchiq-isp-v2-0-4403944152fe@ideasonboard.com
>
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
> - Link to v1: https://lore.kernel.org/r/20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com
>
> ---
> Dave Stevenson (1):
>       media: videobuf2: Allow exporting of a struct dmabuf
>
> Jai Luthra (7):
>       media: videobuf2-core: Move type check out of vb2_core_expbuf()
>       platform/raspberrypi: vchiq-mmal: Include missing headers
>       platform/raspberrypi: vchiq-mmal: Move headers to include/linux
>       platform/raspberrypi: vchiq-mmal: Support ISP parameters and stats
>       platform/raspberrypi: vchiq-mmal: Support bayer and gray formats
>       platform/raspberrypi: vchiq: Add helpers for vchiq driver data
>       media: platform: broadcom: Move unicam driver to subdir
>
> Naushir Patuck (2):
>       media: platform: broadcom: Add bcm2835-isp driver
>       platform/raspberrypi: vchiq: Load bcm2835_isp driver from vchiq
>
>  Documentation/admin-guide/media/bcm2835-isp.dot    |   14 +
>  Documentation/admin-guide/media/bcm2835-isp.rst    |   78 +
>  Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
>  .../userspace-api/media/v4l/meta-formats.rst       |    1 +
>  .../media/v4l/metafmt-bcm2835-isp.rst              |  101 ++
>  MAINTAINERS                                        |   12 +-
>  drivers/media/common/videobuf2/videobuf2-core.c    |   50 +-
>  drivers/media/common/videobuf2/videobuf2-v4l2.c    |    8 +-
>  drivers/media/dvb-core/dvb_vb2.c                   |    3 +-
>  drivers/media/platform/broadcom/Kconfig            |   18 +-
>  drivers/media/platform/broadcom/Makefile           |    3 +-
>  .../media/platform/broadcom/bcm2835-isp/Kconfig    |   15 +
>  .../media/platform/broadcom/bcm2835-isp/Makefile   |    4 +
>  .../broadcom/bcm2835-isp/bcm2835-isp-common.h      |   50 +
>  .../broadcom/bcm2835-isp/bcm2835-isp-fmts.h        |  558 +++++++
>  .../broadcom/bcm2835-isp/bcm2835-isp-params.c      |  510 +++++++
>  .../broadcom/bcm2835-isp/bcm2835-v4l2-isp.c        | 1516 ++++++++++++++++++++
>  .../media/platform/broadcom/bcm2835-unicam/Kconfig |   18 +
>  .../platform/broadcom/bcm2835-unicam/Makefile      |    3 +
>  .../{ => bcm2835-unicam}/bcm2835-unicam-regs.h     |    0
>  .../broadcom/{ => bcm2835-unicam}/bcm2835-unicam.c |    0
>  drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
>  .../raspberrypi/vchiq-interface/vchiq_arm.c        |    2 +
>  .../platform/raspberrypi/vchiq-mmal/mmal-vchiq.c   |    9 +-
>  .../linux/raspberrypi}/mmal-common.h               |    4 +
>  .../linux/raspberrypi}/mmal-encodings.h            |   67 +
>  .../linux/raspberrypi}/mmal-msg-common.h           |    0
>  .../linux/raspberrypi}/mmal-msg-format.h           |    0
>  .../linux/raspberrypi}/mmal-msg-port.h             |    0
>  .../linux/raspberrypi}/mmal-msg.h                  |    0
>  .../linux/raspberrypi}/mmal-parameters.h           |  217 +++
>  .../linux/raspberrypi}/mmal-vchiq.h                |    0
>  include/linux/raspberrypi/vchiq_arm.h              |    1 +
>  include/linux/raspberrypi/vchiq_bus.h              |   10 +
>  include/media/videobuf2-core.h                     |   21 +-
>  include/uapi/linux/bcm2835-isp.h                   |  530 +++++++
>  include/uapi/linux/videodev2.h                     |    2 +
>  37 files changed, 3778 insertions(+), 50 deletions(-)
> ---
> base-commit: e5e04726cdd043e309677071ab1b65a4b18f422b
> change-id: 20250923-b4-vchiq-isp-7e8c22c2860c
> prerequisite-change-id: 20251030-b4-vc-sm-cma-f6727c39cd25:v4
> prerequisite-patch-id: 4fc8cb49edcbe9c8e699b4ab9f6863ac040a070b
> prerequisite-patch-id: 0a5fdf8fe23298fac2c6d188e1686dd292901efc
> prerequisite-patch-id: d6d9ee5b60f97112dcf1aea01212c724d9151505
> prerequisite-patch-id: 3855700b608f20e2a6857a9702838d1e54fc31cb
> prerequisite-patch-id: e2b1e84a1e94e7095b964da693129d36dda78bb0
> prerequisite-patch-id: 07e50207cc947f44e1d626b31d0ace7e12a8f3a1
> prerequisite-patch-id: 3d82a2605799686668729fdc2677c3f6b7c2aa0d
> prerequisite-patch-id: 7795536d875736f74fb4b2e77ca106b127bedbc0
> prerequisite-patch-id: ad833b78f90ce3081e470caf70e601fc573bb52d
> prerequisite-patch-id: 1898d91213e9bd75be3109180527fb0caf6d7174
> prerequisite-patch-id: d0cfc49c673c8c4a4c13d44a547104c24f57cb49
>
> Best regards,
> --
> Jai Luthra <jai.luthra@ideasonboard.com>
>
