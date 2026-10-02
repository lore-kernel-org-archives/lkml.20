Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466353E4C72;
	Fri,  2 Oct 2026 10:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790938387; cv=none; b=IiFQmFtVOliga8rMOcUFqbPQ5KLf8Cws/KGyRLJW2EdUvsj7OCmEl7UVznzKv+1DBONlhmsMLLWMRL7OibM6w80oh5ITrUlvLtT8tbmVkEwhz4GJ7FvGUYy/EJzhgDXV62jOuFLZ1CdYNagaIHjloGkjcAiREk/gb8aShhiftlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790938387; c=relaxed/simple;
	bh=CW1a0MN6vCsuPu80S5HJo2MVU6XL6M3Kxl68amGHOJY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=oh0wXUcY3zOvW3c+VdzCLXApPfjozAiYymgfxxNTOn1+SBNIbQiSGYyCUKYDYgVWlk9uGLlfj/bJx4qx5Vleu0XfLQtkwwdQoVAMuPiw0gHB1JrIEUfrtr3DSVvwTiyjHaYjXfG+tyd2vO1Wec3ca44sNHyq/29eGPBROkQHntI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QLYfc1J/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QLYfc1J/"
Received: from neptunite.rasen.tech (unknown [IPv6:2400:2411:160:2f00:337:442a:994d:7d4])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B9A85177;
	Fri,  2 Oct 2026 12:51:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790938262;
	bh=CW1a0MN6vCsuPu80S5HJo2MVU6XL6M3Kxl68amGHOJY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=QLYfc1J/2H2eyWUimA9AWR7TmtC8dirhjIH6MYw/bGMX8bvnJy1rO9K6SUadB3to2
	 Ao64GAsZBOKwd31S/FllhDOmNbFhuAeqK6zAKL2JNmWSmMkBB/qyQkV22f2PjQFLOM
	 dX3s4CXvJdpat7+FNLdBB1Of0umtx/S27SzILi88=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260917-b4-vchiq-isp-v5-9-2d8870add2c0@ideasonboard.com>
References: <20260917-b4-vchiq-isp-v5-0-2d8870add2c0@ideasonboard.com> <20260917-b4-vchiq-isp-v5-9-2d8870add2c0@ideasonboard.com>
Subject: Re: [PATCH v5 09/10] media: platform: broadcom: Add bcm2835-isp driver
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, Hans Verkuil <hans@jjverkuil.nl>, Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, Jai Luthra <jai.luthra@ideasonboard.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Tomasz Figa <tfiga@chromium.org>
Date: Fri, 02 Oct 2026 19:52:49 +0900
Message-ID: <179093836928.2882041.13544485203240014962@neptunite.rasen.tech>
User-Agent: alot/0.0.0

Quoting Jai Luthra (2026-09-17 17:23:15)
> From: Naushir Patuck <naush@raspberrypi.com>
>=20
> The BCM2835 ISP is a fixed-function hardware block that performs image
> processing on Bayer, RGB, and YUV frames. It produces two processed
> video outputs at different resolutions and can generate statistics for
> Bayer inputs. The hardware is not accessible directly, so this driver
> programs it through the VCHIQ MMAL interface.
>=20
> As the topology cannot be represented as a simple V4L2 M2M device, we
> register a media device with 5 video nodes: one output (sink), two
> capture (processed frames), one metadata capture (statistics), and one
> metadata output (config parameters). The VCHIQ firmware supports two
> concurrent users, so instantiate two identical media graphs.
>=20
> ISP configuration uses the V4L2 extensible parameters framework through
> the dedicated params node, allowing userspace to batch multiple
> parameter blocks (black level, gamma, CCM, lens shading, etc.) in a
> single buffer that is applied on the next frame boundary.
>=20
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> Co-developed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Co-developed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> Tested-by: Paul Elder <paul.elder@ideasonboard.com>

Looks good to me.

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
> Changes in v5:
> - Fix warnings reported by media-ci (coccinelle, smatch etc.)
>   - Use struct_group() around the fields we want to memcpy from UAPI param
>     struct to the anonymous structs inside mmal_parameter_isp_parameters
>   - Don't use complicated pointer arithmetic and instead write
>     mmal_param->_mmal_substruct.update =3D 1 explicitly
>   - Only check for IS_ERR and not IS_ERR_OR_NULL for output of
>     vb2_core_expbuf_dmabuf()
>   - Check node->id against array bounds
> Changes in v4:
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
> ---
>  Documentation/admin-guide/media/bcm2835-isp.dot    |   14 +
>  Documentation/admin-guide/media/bcm2835-isp.rst    |   78 +
>  Documentation/admin-guide/media/v4l-drivers.rst    |    1 +
>  .../userspace-api/media/v4l/meta-formats.rst       |    1 +
>  .../media/v4l/metafmt-bcm2835-isp.rst              |  101 ++
>  MAINTAINERS                                        |    9 +
>  drivers/media/platform/broadcom/Kconfig            |    1 +
>  drivers/media/platform/broadcom/Makefile           |    1 +
>  .../media/platform/broadcom/bcm2835-isp/Kconfig    |   15 +
>  .../media/platform/broadcom/bcm2835-isp/Makefile   |    4 +
>  .../broadcom/bcm2835-isp/bcm2835-isp-common.h      |   50 +
>  .../broadcom/bcm2835-isp/bcm2835-isp-fmts.h        |  558 +++++++
>  .../broadcom/bcm2835-isp/bcm2835-isp-params.c      |  510 +++++++
>  .../broadcom/bcm2835-isp/bcm2835-v4l2-isp.c        | 1516 ++++++++++++++=
++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c               |    2 +
>  include/linux/raspberrypi/mmal-parameters.h        |  155 +-
>  include/uapi/linux/bcm2835-isp.h                   |  530 +++++++
>  include/uapi/linux/videodev2.h                     |    2 +
>  18 files changed, 3536 insertions(+), 12 deletions(-)
>=20
> diff --git a/Documentation/admin-guide/media/bcm2835-isp.dot b/Documentat=
ion/admin-guide/media/bcm2835-isp.dot
> new file mode 100644
> index 000000000000..cda3defe2d99
> --- /dev/null
> +++ b/Documentation/admin-guide/media/bcm2835-isp.dot
> @@ -0,0 +1,14 @@
> +digraph board {
> +       rankdir=3DTB
> +       n00000001 [label=3D"bcm2835-isp-output0\n/dev/video13", shape=3Db=
ox, style=3Dfilled, fillcolor=3Dyellow]
> +       n00000001 -> n00000015 [style=3Dbold]
> +       n00000005 [label=3D"bcm2835-isp-capture0\n/dev/video14", shape=3D=
box, style=3Dfilled, fillcolor=3Dyellow]
> +       n00000009 [label=3D"bcm2835-isp-capture1\n/dev/video15", shape=3D=
box, style=3Dfilled, fillcolor=3Dyellow]
> +       n0000000d [label=3D"bcm2835-isp-stats2\n/dev/video16", shape=3Dbo=
x, style=3Dfilled, fillcolor=3Dyellow]
> +       n00000011 [label=3D"bcm2835-isp-params\n/dev/video17", shape=3Dbo=
x, style=3Dfilled, fillcolor=3Dyellow]
> +       n00000011 -> n00000015 [style=3Dbold]
> +       n00000015 [label=3D"bcm2835-isp\n", shape=3Dbox, style=3Dfilled, =
fillcolor=3Dyellow]
> +       n00000015 -> n00000005 [style=3Dbold]
> +       n00000015 -> n00000009 [style=3Dbold]
> +       n00000015 -> n0000000d [style=3Dbold]
> +}
> diff --git a/Documentation/admin-guide/media/bcm2835-isp.rst b/Documentat=
ion/admin-guide/media/bcm2835-isp.rst
> new file mode 100644
> index 000000000000..6384cc7b3eb0
> --- /dev/null
> +++ b/Documentation/admin-guide/media/bcm2835-isp.rst
> @@ -0,0 +1,78 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Broadcom BCM2835 Image Signal Processor (ISP)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The BCM2835 ISP
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The BCM2835 Image Signal Processor (ISP) is a fixed function hardware pi=
peline
> +that performs image processing on frames stored in memory. Frames can be=
 Bayer,
> +RGB, or YUV and are submitted to the ISP through a V4L2 output node. The=
 ISP
> +produces two processed image outputs at different resolutions and can ge=
nerate
> +statistics for Bayer inputs.
> +
> +The bcm2835-isp driver
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The bcm2835-isp driver lives under
> +`drivers/media/platform/broadcom/bcm2835-isp` and registers a set of V4L=
2 video
> +nodes connected through a media graph. The pipeline is configured throug=
h the
> +V4L2 extensible parameters framework using a dedicated params node.
> +
> +The media topology registered by the driver is represented below:
> +
> +.. _bcm2835-isp-topology:
> +
> +.. kernel-figure:: bcm2835-isp.dot
> +    :alt:   Diagram of the default media pipeline topology
> +    :align: center
> +
> +The media graph registers the following video device nodes:
> +
> +- bcm2835-isp-output0: output device that queues frames to the ISP input.
> +- bcm2835-isp-capture0: capture device for the main processed output.
> +- bcm2835-isp-capture1: capture device for the secondary processed outpu=
t.
> +- bcm2835-isp-stats2: metadata capture device for ISP statistics.
> +- bcm2835-isp-params: metadata output device for ISP configuration param=
eters.
> +
> +bcm2835-isp-output0
> +-------------------
> +
> +Frames to be processed by the ISP are queued to `bcm2835-isp-output0`. S=
upported
> +input formats include Bayer, RGB, and YUV.
> +
> +bcm2835-isp-capture0, bcm2835-isp-capture1
> +------------------------------------------
> +
> +The two capture devices return processed images in YUV or RGB formats. T=
he
> +secondary output is typically used for a lower-resolution stream.
> +
> +bcm2835-isp-stats2
> +------------------
> +
> +The `bcm2835-isp-stats2` node provides per-frame statistics for Bayer in=
puts as
> +metadata buffers. The metadata format is described at
> +:ref:`v4l2-meta-fmt-bcm2835-isp-stats`.
> +
> +bcm2835-isp-params
> +------------------
> +
> +The `bcm2835-isp-params` node accepts configuration buffers that define =
the ISP
> +processing parameters to apply on the next frame boundary. The metadata =
format
> +is described at :ref:`v4l2-meta-fmt-bcm2835-isp-params`.
> +
> +ISP configuration
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The ISP configuration is described solely by the contents of the paramet=
ers
> +buffer queued to `bcm2835-isp-params`. Each buffer uses the V4L2 extensi=
ble
> +parameters format described in :ref:`v4l2-isp`, with block types defined=
 in
> +``include/uapi/linux/bcm2835-isp.h``.
> +
> +Userspace must populate a :c:type:`v4l2_isp_params_buffer` and append on=
e or
> +more block structs, each of which embeds a
> +:c:type:`v4l2_isp_params_block_header` as its first member. The driver a=
pplies
> +those parameters on a frame boundary once the buffer is queued. Parameter
> +structure is defined at :ref:`v4l2-meta-fmt-bcm2835-isp-params`.
> diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentat=
ion/admin-guide/media/v4l-drivers.rst
> index 4621eae9fa1e..cfbd9a64557d 100644
> --- a/Documentation/admin-guide/media/v4l-drivers.rst
> +++ b/Documentation/admin-guide/media/v4l-drivers.rst
> @@ -10,6 +10,7 @@ Video4Linux (V4L) driver-specific documentation
>         :maxdepth: 2
> =20
>         amdisp4-1
> +       bcm2835-isp
>         bttv
>         c3-isp
>         cafe_ccic
> diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Doc=
umentation/userspace-api/media/v4l/meta-formats.rst
> index b5455229837e..02f0b6524472 100644
> --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> @@ -14,6 +14,7 @@ These formats are used for the :ref:`metadata` interfac=
e only.
>      :maxdepth: 1
> =20
>      metafmt-arm-mali-c55
> +    metafmt-bcm2835-isp
>      metafmt-c3-isp
>      metafmt-d4xx
>      metafmt-generic
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-bcm2835-isp.rs=
t b/Documentation/userspace-api/media/v4l/metafmt-bcm2835-isp.rst
> new file mode 100644
> index 000000000000..6ed1d1e7890f
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/metafmt-bcm2835-isp.rst
> @@ -0,0 +1,101 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. c:namespace:: V4L
> +
> +************************************************************************=
***********
> +V4L2_META_FMT_BCM2835_ISP_STATS ('BSTA'), V4L2_META_FMT_BCM2835_ISP_PARA=
MS ('BCMP')
> +************************************************************************=
***********
> +
> +.. _v4l2-meta-fmt-bcm2835-isp-stats:
> +
> +BCM2835 ISP Statistics
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The BCM2835 ISP hardware calculate image statistics for an input Bayer f=
rame.
> +These statistics are obtained from the "bcm2835-isp0-capture3" device no=
de
> +using the :c:type:`v4l2_meta_format` interface. They are formatted as de=
scribed
> +by the :c:type:`bcm2835_isp_stats` structure below.
> +
> +.. code-block:: c
> +
> +       #define DEFAULT_AWB_REGIONS_X 16
> +       #define DEFAULT_AWB_REGIONS_Y 12
> +
> +       #define NUM_HISTOGRAMS 2
> +       #define NUM_HISTOGRAM_BINS 128
> +       #define AWB_REGIONS (DEFAULT_AWB_REGIONS_X * DEFAULT_AWB_REGIONS_=
Y)
> +       #define FLOATING_REGIONS 16
> +       #define AGC_REGIONS 16
> +       #define FOCUS_REGIONS 12
> +
> +.. kernel-doc:: include/uapi/linux/bcm2835-isp.h
> +   :functions: bcm2835_isp_stats_hist bcm2835_isp_stats_region
> +                    bcm2835_isp_stats_focus bcm2835_isp_stats
> +
> +.. _v4l2-meta-fmt-bcm2835-isp-params:
> +
> +BCM2835 ISP parameters
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The ISP parameters are configured by queuing buffers to the "bcm2835-isp=
-params"
> +metadata output node. Parameter buffers use the V4L2 extensible paramete=
rs
> +format described in :ref:`v4l2-isp`. Userspace assembles one or more par=
ameter
> +blocks in the data area of :c:type:`v4l2_isp_params_buffer` and submits =
the
> +buffer to the driver.
> +
> +Each block begins with a :c:type:`v4l2_isp_params_block_header` and embe=
ds the
> +block-specific payload. The header ``type`` must be set to a value from
> +:c:type:`bcm2835_isp_param_block_type`, ``size`` must match the block si=
ze, and
> +``flags`` can be used to enable or disable the block.
> +
> +Example: enqueue two parameter blocks (black level and gamma)
> +-------------------------------------------------------------
> +
> +.. code-block:: c
> +
> +       struct v4l2_isp_params_buffer *params =3D
> +               (struct v4l2_isp_params_buffer *)buffer;
> +
> +       params->version =3D BCM2835_ISP_PARAM_BUFFER_V1;
> +       params->data_size =3D 0;
> +
> +       void *data =3D (void *)params->data;
> +
> +       struct bcm2835_isp_params_black_level *black =3D
> +               (struct bcm2835_isp_params_black_level *)data;
> +
> +       black->header.type =3D BCM2835_ISP_PARAM_BLOCK_BLACK_LEVEL;
> +       black->header.flags |=3D V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
> +       black->header.size =3D sizeof(*black);
> +
> +       black->black_level.enabled =3D 1;
> +       black->black_level.black_level_r =3D 64;
> +       black->black_level.black_level_g =3D 64;
> +       black->black_level.black_level_b =3D 64;
> +
> +       data +=3D sizeof(*black);
> +       params->data_size +=3D sizeof(*black);
> +
> +       struct bcm2835_isp_params_gamma *gamma =3D
> +               (struct bcm2835_isp_params_gamma *)data;
> +
> +       gamma->header.type =3D BCM2835_ISP_PARAM_BLOCK_GAMMA;
> +       gamma->header.flags |=3D V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
> +       gamma->header.size =3D sizeof(*gamma);
> +
> +       gamma->gamma.enabled =3D 1;
> +       /* Fill gamma->gamma.x[] and gamma->gamma.y[] here */
> +
> +       params->data_size +=3D sizeof(*gamma);
> +
> +The total payload size must not exceed :c:macro:`BCM2835_ISP_PARAMS_MAX_=
SIZE`.
> +The driver applies parameter buffers on the next frame boundary.
> +
> +BCM2835 ISP uAPI data types
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +.. kernel-doc:: include/uapi/linux/bcm2835-isp.h
> +   :functions: bcm2835_isp_awb_gains bcm2835_isp_ccm bcm2835_isp_gain_fo=
rmat
> +                bcm2835_isp_digital_gain bcm2835_isp_lens_shading
> +                bcm2835_isp_black_level bcm2835_isp_geq bcm2835_isp_gamma
> +                bcm2835_isp_denoise bcm2835_isp_sharpen bcm2835_isp_dpc_=
mode
> +                bcm2835_isp_dpc bcm2835_isp_rational bcm2835_isp_cdn
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 68ef4b2f9db6..7417cb31244b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5187,6 +5187,15 @@ S:       Maintained
>  F:     Documentation/devicetree/bindings/media/brcm,bcm2835-unicam.yaml
>  F:     drivers/media/platform/broadcom/bcm2835-unicam/*
> =20
> +BROADCOM BCM2835 ISP DRIVER
> +M:     Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> +L:     linux-media@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/admin-guide/media/bcm2835-isp.rst
> +F:     Documentation/userspace-api/media/v4l/metafmt-bcm2835-isp.rst
> +F:     drivers/media/platform/broadcom/bcm2835-isp/*
> +F:     include/uapi/linux/bcm2835-isp.h
> +
>  BROADCOM BCM47XX MIPS ARCHITECTURE
>  M:     Hauke Mehrtens <hauke@hauke-m.de>
>  M:     Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> diff --git a/drivers/media/platform/broadcom/Kconfig b/drivers/media/plat=
form/broadcom/Kconfig
> index cab44885182c..0da6c83e97ed 100644
> --- a/drivers/media/platform/broadcom/Kconfig
> +++ b/drivers/media/platform/broadcom/Kconfig
> @@ -3,3 +3,4 @@
>  comment "Broadcom BCM283x/BCM271x media platform drivers"
> =20
>  source "drivers/media/platform/broadcom/bcm2835-unicam/Kconfig"
> +source "drivers/media/platform/broadcom/bcm2835-isp/Kconfig"
> diff --git a/drivers/media/platform/broadcom/Makefile b/drivers/media/pla=
tform/broadcom/Makefile
> index 33a89bdb0029..1d49e586f492 100644
> --- a/drivers/media/platform/broadcom/Makefile
> +++ b/drivers/media/platform/broadcom/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
> =20
>  obj-y +=3D bcm2835-unicam/
> +obj-y +=3D bcm2835-isp/
> diff --git a/drivers/media/platform/broadcom/bcm2835-isp/Kconfig b/driver=
s/media/platform/broadcom/bcm2835-isp/Kconfig
> new file mode 100644
> index 000000000000..3a4db5bf61a1
> --- /dev/null
> +++ b/drivers/media/platform/broadcom/bcm2835-isp/Kconfig
> @@ -0,0 +1,15 @@
> +config VIDEO_ISP_BCM2835
> +       tristate "BCM2835 ISP support"
> +       depends on MEDIA_SUPPORT
> +       depends on VIDEO_DEV && (ARCH_BCM2835 || COMPILE_TEST)
> +       depends on MEDIA_CONTROLLER
> +       select BCM2835_VCHIQ_MMAL
> +       select V4L2_ISP
> +       select VIDEOBUF2_DMA_CONTIG
> +       help
> +         This is the V4L2 driver for the Broadcom BCM2835 ISP hardware.
> +         This operates over the VCHIQ interface to a service running on
> +         VideoCore.
> +
> +         To compile this driver as a module, choose M here: the module
> +         will be called bcm2835-isp.
> diff --git a/drivers/media/platform/broadcom/bcm2835-isp/Makefile b/drive=
rs/media/platform/broadcom/bcm2835-isp/Makefile
> new file mode 100644
> index 000000000000..21224cb85d5f
> --- /dev/null
> +++ b/drivers/media/platform/broadcom/bcm2835-isp/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0
> +bcm2835-isp-objs :=3D bcm2835-v4l2-isp.o bcm2835-isp-params.o
> +
> +obj-$(CONFIG_VIDEO_ISP_BCM2835) +=3D bcm2835-isp.o
> diff --git a/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-comm=
on.h b/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-common.h
> new file mode 100644
> index 000000000000..60be0607b1ab
> --- /dev/null
> +++ b/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-common.h
> @@ -0,0 +1,50 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Broadcom BCM2835 ISP driver - common header
> + *
> + * Copyright (c) 2026 Raspberry Pi (Trading) Ltd.
> + * Copyright (c) 2026 Ideas On Board Oy
> + */
> +
> +#ifndef BCM2835_ISP_COMMON_H
> +#define BCM2835_ISP_COMMON_H
> +
> +#include <linux/mutex.h>
> +#include <linux/spinlock.h>
> +#include <linux/raspberrypi/mmal-parameters.h>
> +#include <linux/raspberrypi/mmal-vchiq.h>
> +
> +#include <media/media-entity.h>
> +#include <media/v4l2-device.h>
> +#include <media/videobuf2-core.h>
> +
> +struct dma_buf;
> +
> +struct bcm2835_isp_params {
> +       struct device *dev;
> +       struct v4l2_device *v4l2_dev;
> +       struct vchiq_mmal_instance *mmal_instance;
> +       struct vchiq_mmal_port *port;
> +
> +       struct video_device vdev;
> +       struct media_pad pad;
> +       struct vb2_queue queue;
> +       struct mutex lock; /* params node vdev lock */
> +
> +       /* Lens shading state */
> +       struct dma_buf *last_ls_dmabuf;
> +};
> +
> +struct bcm2835_isp_params *
> +bcm2835_isp_params_register(struct v4l2_device *v4l2_dev, struct device =
*dev,
> +                           struct vchiq_mmal_instance *mmal_instance,
> +                           struct vchiq_mmal_port *port, int video_nr);
> +
> +void bcm2835_isp_params_unregister(struct bcm2835_isp_params *params);
> +
> +int bcm2835_isp_params_drop_ls_ref(struct bcm2835_isp_params *params);
> +
> +int bcm2835_isp_node_querycap(struct file *file, void *priv,
> +                             struct v4l2_capability *cap);
> +
> +#endif /* BCM2835_ISP_COMMON_H */
> diff --git a/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-fmts=
.h b/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-fmts.h
> new file mode 100644
> index 000000000000..6f3333d33c4f
> --- /dev/null
> +++ b/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-fmts.h
> @@ -0,0 +1,558 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Broadcom BCM2835 ISP driver
> + *
> + * Copyright =C2=A9 2019-2026 Raspberry Pi (Trading) Ltd.
> + *
> + * Author: Naushir Patuck (naush@raspberrypi.com)
> + *
> + */
> +
> +#ifndef BCM2835_ISP_FMTS
> +#define BCM2835_ISP_FMTS
> +
> +#include <linux/videodev2.h>
> +#include <linux/raspberrypi/mmal-encodings.h>
> +
> +struct bcm2835_isp_fmt {
> +       u32 fourcc;
> +       int depth;
> +       int bytesperline_align;
> +       u32 mmal_fmt;
> +       int size_multiplier_x2;
> +       u32 colorspace_mask;
> +       enum v4l2_colorspace colorspace_default;
> +       unsigned int step_size;
> +};
> +
> +#define V4L2_COLORSPACE_MASK(colorspace) BIT(colorspace)
> +
> +#define V4L2_COLORSPACE_MASK_JPEG V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_J=
PEG)
> +#define V4L2_COLORSPACE_MASK_SMPTE170M V4L2_COLORSPACE_MASK(V4L2_COLORSP=
ACE_SMPTE170M)
> +#define V4L2_COLORSPACE_MASK_REC709 V4L2_COLORSPACE_MASK(V4L2_COLORSPACE=
_REC709)
> +#define V4L2_COLORSPACE_MASK_SRGB V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_S=
RGB)
> +#define V4L2_COLORSPACE_MASK_RAW V4L2_COLORSPACE_MASK(V4L2_COLORSPACE_RA=
W)
> +
> +/*
> + * All three colour spaces JPEG, SMPTE170M and REC709 are fundamentally =
sRGB
> + * underneath (as near as makes no difference to us), just with differen=
t YCbCr
> + * encodings. Therefore the ISP can generate sRGB on its main output and=
 any of
> + * the others on its low resolution output. Applications should, when us=
ing both
> + * outputs, program the colour spaces on them to be the same, matching w=
hatever
> + * is requested for the low resolution output, even if the main output is
> + * producing an RGB format. In turn this requires us to allow all these =
colour
> + * spaces for every YUV/RGB output format.
> + */
> +#define V4L2_COLORSPACE_MASK_ALL_SRGB (V4L2_COLORSPACE_MASK_JPEG |     \
> +                                      V4L2_COLORSPACE_MASK_SRGB |      \
> +                                      V4L2_COLORSPACE_MASK_SMPTE170M | \
> +                                      V4L2_COLORSPACE_MASK_REC709)
> +
> +static const struct bcm2835_isp_fmt supported_formats[] =3D {
> +       {
> +               /* YUV formats */
> +               .fourcc             =3D V4L2_PIX_FMT_YUV420,
> +               .depth              =3D 8,
> +               .bytesperline_align =3D 64,
> +               .mmal_fmt           =3D MMAL_ENCODING_I420,
> +               .size_multiplier_x2 =3D 3,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_ALL_SRGB,
> +               .colorspace_default =3D V4L2_COLORSPACE_JPEG,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_YVU420,
> +               .depth              =3D 8,
> +               .bytesperline_align =3D 64,
> +               .mmal_fmt           =3D MMAL_ENCODING_YV12,
> +               .size_multiplier_x2 =3D 3,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_ALL_SRGB,
> +               .colorspace_default =3D V4L2_COLORSPACE_SMPTE170M,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_NV12,
> +               .depth              =3D 8,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_NV12,
> +               .size_multiplier_x2 =3D 3,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_ALL_SRGB,
> +               .colorspace_default =3D V4L2_COLORSPACE_SMPTE170M,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_NV21,
> +               .depth              =3D 8,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_NV21,
> +               .size_multiplier_x2 =3D 3,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_ALL_SRGB,
> +               .colorspace_default =3D V4L2_COLORSPACE_SMPTE170M,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_YUYV,
> +               .depth              =3D 16,
> +               .bytesperline_align =3D 64,
> +               .mmal_fmt           =3D MMAL_ENCODING_YUYV,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_ALL_SRGB,
> +               .colorspace_default =3D V4L2_COLORSPACE_SMPTE170M,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_UYVY,
> +               .depth              =3D 16,
> +               .bytesperline_align =3D 64,
> +               .mmal_fmt           =3D MMAL_ENCODING_UYVY,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_ALL_SRGB,
> +               .colorspace_default =3D V4L2_COLORSPACE_SMPTE170M,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_YVYU,
> +               .depth              =3D 16,
> +               .bytesperline_align =3D 64,
> +               .mmal_fmt           =3D MMAL_ENCODING_YVYU,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_ALL_SRGB,
> +               .colorspace_default =3D V4L2_COLORSPACE_SMPTE170M,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_VYUY,
> +               .depth              =3D 16,
> +               .bytesperline_align =3D 64,
> +               .mmal_fmt           =3D MMAL_ENCODING_VYUY,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_ALL_SRGB,
> +               .colorspace_default =3D V4L2_COLORSPACE_SMPTE170M,
> +               .step_size          =3D 2,
> +       }, {
> +               /* RGB formats */
> +               .fourcc             =3D V4L2_PIX_FMT_RGB24,
> +               .depth              =3D 24,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_RGB24,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_ALL_SRGB,
> +               .colorspace_default =3D V4L2_COLORSPACE_SRGB,
> +               .step_size          =3D 1,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_RGB565,
> +               .depth              =3D 16,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_RGB16,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_ALL_SRGB,
> +               .colorspace_default =3D V4L2_COLORSPACE_SRGB,
> +               .step_size          =3D 1,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_BGR24,
> +               .depth              =3D 24,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BGR24,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_ALL_SRGB,
> +               .colorspace_default =3D V4L2_COLORSPACE_SRGB,
> +               .step_size          =3D 1,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_XBGR32,
> +               .depth              =3D 32,
> +               .bytesperline_align =3D 64,
> +               .mmal_fmt           =3D MMAL_ENCODING_BGRA,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_ALL_SRGB,
> +               .colorspace_default =3D V4L2_COLORSPACE_SRGB,
> +               .step_size          =3D 1,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_RGBX32,
> +               .depth              =3D 32,
> +               .bytesperline_align =3D 64,
> +               .mmal_fmt           =3D MMAL_ENCODING_RGBA,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_ALL_SRGB,
> +               .colorspace_default =3D V4L2_COLORSPACE_SRGB,
> +               .step_size          =3D 1,
> +       }, {
> +               /* Bayer formats */
> +               /* 8 bit */
> +               .fourcc             =3D V4L2_PIX_FMT_SRGGB8,
> +               .depth              =3D 8,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SRGGB8,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_SBGGR8,
> +               .depth              =3D 8,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SBGGR8,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_SGRBG8,
> +               .depth              =3D 8,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SGRBG8,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_SGBRG8,
> +               .depth              =3D 8,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SGBRG8,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               /* 10 bit */
> +               .fourcc             =3D V4L2_PIX_FMT_SRGGB10P,
> +               .depth              =3D 10,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SRGGB10P,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_SBGGR10P,
> +               .depth              =3D 10,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SBGGR10P,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_SGRBG10P,
> +               .depth              =3D 10,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SGRBG10P,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_SGBRG10P,
> +               .depth              =3D 10,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SGBRG10P,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               /* 12 bit */
> +               .fourcc             =3D V4L2_PIX_FMT_SRGGB12P,
> +               .depth              =3D 12,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SRGGB12P,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_SBGGR12P,
> +               .depth              =3D 12,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SBGGR12P,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_SGRBG12P,
> +               .depth              =3D 12,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SGRBG12P,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_SGBRG12P,
> +               .depth              =3D 12,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SGBRG12P,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               /* 14 bit */
> +               .fourcc             =3D V4L2_PIX_FMT_SRGGB14P,
> +               .depth              =3D 14,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SRGGB14P,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_SBGGR14P,
> +               .depth              =3D 14,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SBGGR14P,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_SGRBG14P,
> +               .depth              =3D 14,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SGRBG14P,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_SGBRG14P,
> +               .depth              =3D 14,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SGBRG14P,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               /* 16 bit */
> +               .fourcc             =3D V4L2_PIX_FMT_SRGGB16,
> +               .depth              =3D 16,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SRGGB16,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_SBGGR16,
> +               .depth              =3D 16,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SBGGR16,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_SGRBG16,
> +               .depth              =3D 16,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SGRBG16,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_SGBRG16,
> +               .depth              =3D 16,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SGBRG16,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               /* Bayer formats unpacked to 16bpp */
> +               /* 10 bit */
> +               .fourcc             =3D V4L2_PIX_FMT_SRGGB10,
> +               .depth              =3D 16,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SRGGB10,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_SBGGR10,
> +               .depth              =3D 16,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SBGGR10,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_SGRBG10,
> +               .depth              =3D 16,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SGRBG10,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_SGBRG10,
> +               .depth              =3D 16,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SGBRG10,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               /* 12 bit */
> +               .fourcc             =3D V4L2_PIX_FMT_SRGGB12,
> +               .depth              =3D 16,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SRGGB12,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_SBGGR12,
> +               .depth              =3D 16,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SBGGR12,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_SGRBG12,
> +               .depth              =3D 16,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SGRBG12,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_SGBRG12,
> +               .depth              =3D 16,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SGBRG12,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               /* 14 bit */
> +               .fourcc             =3D V4L2_PIX_FMT_SRGGB14,
> +               .depth              =3D 16,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SRGGB14,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_SBGGR14,
> +               .depth              =3D 16,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SBGGR14,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_SGRBG14,
> +               .depth              =3D 16,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SGRBG14,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_PIX_FMT_SGBRG14,
> +               .depth              =3D 16,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_BAYER_SGBRG14,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               /* Monochrome MIPI formats */
> +               /* 8 bit */
> +               .fourcc             =3D V4L2_PIX_FMT_GREY,
> +               .depth              =3D 8,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_GREY,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               /* 10 bit */
> +               .fourcc             =3D V4L2_PIX_FMT_Y10P,
> +               .depth              =3D 10,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_Y10P,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               /* 12 bit */
> +               .fourcc             =3D V4L2_PIX_FMT_Y12P,
> +               .depth              =3D 12,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_Y12P,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               /* 14 bit */
> +               .fourcc             =3D V4L2_PIX_FMT_Y14P,
> +               .depth              =3D 14,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_Y14P,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               /* 16 bit */
> +               .fourcc             =3D V4L2_PIX_FMT_Y16,
> +               .depth              =3D 16,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_Y16,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               /* 10 bit as 16bpp */
> +               .fourcc             =3D V4L2_PIX_FMT_Y10,
> +               .depth              =3D 16,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_Y10,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               /* 12 bit as 16bpp */
> +               .fourcc             =3D V4L2_PIX_FMT_Y12,
> +               .depth              =3D 16,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_Y12,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               /* 14 bit as 16bpp */
> +               .fourcc             =3D V4L2_PIX_FMT_Y14,
> +               .depth              =3D 16,
> +               .bytesperline_align =3D 32,
> +               .mmal_fmt           =3D MMAL_ENCODING_Y14,
> +               .size_multiplier_x2 =3D 2,
> +               .colorspace_mask    =3D V4L2_COLORSPACE_MASK_RAW,
> +               .colorspace_default =3D V4L2_COLORSPACE_RAW,
> +               .step_size          =3D 2,
> +       }, {
> +               .fourcc             =3D V4L2_META_FMT_BCM2835_ISP_STATS,
> +               .depth              =3D 8,
> +               .mmal_fmt           =3D MMAL_ENCODING_BRCM_STATS,
> +               /* The rest are not valid fields for stats. */
> +       }
> +};
> +
> +#endif
> diff --git a/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-para=
ms.c b/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-params.c
> new file mode 100644
> index 000000000000..b133ad5c586f
> --- /dev/null
> +++ b/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-isp-params.c
> @@ -0,0 +1,510 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Broadcom BCM2835 ISP driver - extensible parameters node
> + *
> + * Copyright (c) 2026 Raspberry Pi Ltd.
> + * Copyright (c) 2026 Ideas On Board Oy
> + *
> + * Author: Jai Luthra <jai.luthra@ideasonboard.com>
> + */
> +
> +#include <linux/dma-buf.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/raspberrypi/mmal-parameters.h>
> +#include <linux/raspberrypi/vc_sm_knl.h>
> +
> +#include <media/v4l2-ioctl.h>
> +#include <media/v4l2-isp.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include <uapi/linux/bcm2835-isp.h>
> +
> +#include "bcm2835-isp-common.h"
> +
> +MODULE_IMPORT_NS("DMA_BUF");
> +
> +#define BCM2835_ISP_PARAMS_NAME "bcm2835-isp-params"
> +
> +#define BCM2835_ISP_PARAMS_BUF_SIZE \
> +       v4l2_isp_buffer_size(BCM2835_ISP_PARAMS_MAX_SIZE)
> +
> +/**
> + * union bcm2835_isp_params_block - Generalisation of a parameter block
> + *
> + * @header:    Block header pointer for type checking
> + * @black_level: Black level configuration block
> + * @geq:       Green equalisation configuration block
> + * @gamma:     Gamma curve configuration block
> + * @denoise:   Denoise configuration block
> + * @sharpen:   Sharpen configuration block
> + * @dpc:       Defective pixel correction configuration block
> + * @cdn:       Colour denoise configuration block
> + * @ccm:       Colour correction matrix configuration block
> + * @ls:                Lens shading configuration block
> + * @awb_gains: AWB gains configuration block
> + * @digital_gain: Digital gain configuration block
> + * @data:      Raw pointer for block iteration
> + */
> +union bcm2835_isp_params_block {
> +       const struct v4l2_isp_params_block_header *header;
> +       const struct bcm2835_isp_params_black_level *black_level;
> +       const struct bcm2835_isp_params_geq *geq;
> +       const struct bcm2835_isp_params_gamma *gamma;
> +       const struct bcm2835_isp_params_denoise *denoise;
> +       const struct bcm2835_isp_params_sharpen *sharpen;
> +       const struct bcm2835_isp_params_dpc *dpc;
> +       const struct bcm2835_isp_params_cdn *cdn;
> +       const struct bcm2835_isp_params_cc_matrix *ccm;
> +       const struct bcm2835_isp_params_lens_shading *ls;
> +       const struct bcm2835_isp_params_awb_gains *awb_gains;
> +       const struct bcm2835_isp_params_digital_gain *digital_gain;
> +       const __u8 *data;
> +};
> +
> +typedef void (*bcm2835_isp_params_handler)(struct mmal_parameter_isp_par=
ameters *mmal_param,
> +                                          struct bcm2835_isp_params *par=
ams,
> +                                          union bcm2835_isp_params_block=
 block);
> +
> +struct bcm2835_isp_params_buffer {
> +       struct vb2_v4l2_buffer vb;
> +       struct list_head list;
> +       void *config;
> +};
> +
> +#define to_bcm2835_isp_params_buf(vbuf) \
> +       container_of(vbuf, struct bcm2835_isp_params_buffer, vb)
> +
> +static int isp_set_param(struct bcm2835_isp_params *params, u32 paramete=
r,
> +                        void *value, u32 value_size)
> +{
> +       return vchiq_mmal_port_parameter_set(params->mmal_instance, param=
s->port,
> +                                            parameter, value, value_size=
);
> +}
> +
> +static int map_ls_table(struct bcm2835_isp_params *params,
> +                       struct dma_buf *dmabuf, u32 *mem_handle_table)
> +{
> +       void *vcsm_handle;
> +       int ret;
> +
> +       if (IS_ERR_OR_NULL(dmabuf))
> +               return -EINVAL;
> +
> +       ret =3D vc_sm_cma_import_dmabuf(dmabuf, &vcsm_handle);
> +       if (ret)
> +               return ret;
> +
> +       *mem_handle_table =3D vc_sm_cma_int_handle(vcsm_handle);
> +
> +       vc_sm_cma_free(vcsm_handle);
> +
> +       params->last_ls_dmabuf =3D dmabuf;
> +
> +       return 0;
> +}
> +
> +/* Block handlers */
> +
> +#define BCM2835_ISP_PARAMS_HANDLER(_name, _param_field, _mmal_substruct)=
       \
> +static void bcm2835_isp_params_##_name(struct mmal_parameter_isp_paramet=
ers *mmal_param, \
> +                                      struct bcm2835_isp_params *params,=
       \
> +                                      union bcm2835_isp_params_block blo=
ck)    \
> +{                                                                       =
       \
> +       memcpy(&mmal_param->_mmal_substruct.payload,                     =
       \
> +                     (void *)&block._param_field->_param_field,         =
       \
> +                     sizeof(block._param_field->_param_field));         =
       \
> +       mmal_param->_mmal_substruct.update =3D 1;                        =
         \
> +}
> +
> +BCM2835_ISP_PARAMS_HANDLER(black_level, black_level, black_level)
> +BCM2835_ISP_PARAMS_HANDLER(geq, geq, green_eq)
> +BCM2835_ISP_PARAMS_HANDLER(gamma, gamma, gamma)
> +BCM2835_ISP_PARAMS_HANDLER(denoise, denoise, denoise)
> +BCM2835_ISP_PARAMS_HANDLER(sharpen, sharpen, sharpen)
> +BCM2835_ISP_PARAMS_HANDLER(dpc, dpc, dpc)
> +BCM2835_ISP_PARAMS_HANDLER(cdn, cdn, colour_denoise)
> +BCM2835_ISP_PARAMS_HANDLER(cc_matrix, ccm, ccm)
> +BCM2835_ISP_PARAMS_HANDLER(awb_gains, awb_gains, awb_gains)
> +BCM2835_ISP_PARAMS_HANDLER(digital_gain, digital_gain, digital_gain)
> +
> +static void bcm2835_isp_params_lens_shading(struct mmal_parameter_isp_pa=
rameters *mmal_param,
> +                                           struct bcm2835_isp_params *pa=
rams,
> +                                           union bcm2835_isp_params_bloc=
k block)
> +{
> +       struct dma_buf *dmabuf =3D dma_buf_get(block.ls->ls.dmabuf);
> +       u32 prev_handle;
> +       int ret =3D 0;
> +
> +       /*
> +        * struct bcm2835_isp_lens_shading layout matches with what MMAL
> +        * expects, so we can do a simple memcpy here. The descriptor for
> +        * the table needs special handling though.
> +        */
> +       prev_handle =3D mmal_param->lens_shading.mem_handle_table;
> +       memcpy(&mmal_param->lens_shading.enabled, &block.ls->ls,
> +              sizeof(block.ls->ls));
> +
> +       /*
> +        * Map the DMABUF from userspace to a VCSM CMA handle that the fi=
rmware
> +        * can import, reusing the old handle if DMABUF was unchanged.
> +        */
> +       if (dmabuf !=3D params->last_ls_dmabuf)
> +               ret =3D map_ls_table(params, dmabuf,
> +                                  &mmal_param->lens_shading.mem_handle_t=
able);
> +       else
> +               mmal_param->lens_shading.mem_handle_table =3D prev_handle;
> +
> +       if (!ret && mmal_param->lens_shading.mem_handle_table)
> +               mmal_param->lens_shading.update =3D 1;
> +
> +       dma_buf_put(dmabuf);
> +}
> +
> +static const bcm2835_isp_params_handler bcm2835_isp_params_handlers[] =
=3D {
> +       [BCM2835_ISP_PARAM_BLOCK_BLACK_LEVEL] =3D bcm2835_isp_params_blac=
k_level,
> +       [BCM2835_ISP_PARAM_BLOCK_GEQ] =3D bcm2835_isp_params_geq,
> +       [BCM2835_ISP_PARAM_BLOCK_GAMMA] =3D bcm2835_isp_params_gamma,
> +       [BCM2835_ISP_PARAM_BLOCK_DENOISE] =3D bcm2835_isp_params_denoise,
> +       [BCM2835_ISP_PARAM_BLOCK_SHARPEN] =3D bcm2835_isp_params_sharpen,
> +       [BCM2835_ISP_PARAM_BLOCK_DPC] =3D bcm2835_isp_params_dpc,
> +       [BCM2835_ISP_PARAM_BLOCK_CDN] =3D bcm2835_isp_params_cdn,
> +       [BCM2835_ISP_PARAM_BLOCK_CC_MATRIX] =3D bcm2835_isp_params_cc_mat=
rix,
> +       [BCM2835_ISP_PARAM_BLOCK_LENS_SHADING] =3D bcm2835_isp_params_len=
s_shading,
> +       [BCM2835_ISP_PARAM_BLOCK_AWB_GAINS] =3D bcm2835_isp_params_awb_ga=
ins,
> +       [BCM2835_ISP_PARAM_BLOCK_DIGITAL_GAIN] =3D bcm2835_isp_params_dig=
ital_gain,
> +};
> +
> +static const struct v4l2_isp_params_block_type_info
> +bcm2835_isp_params_block_types_info[] =3D {
> +       [BCM2835_ISP_PARAM_BLOCK_BLACK_LEVEL] =3D {
> +               .size =3D sizeof(struct bcm2835_isp_params_black_level),
> +       },
> +       [BCM2835_ISP_PARAM_BLOCK_GEQ] =3D {
> +               .size =3D sizeof(struct bcm2835_isp_params_geq),
> +       },
> +       [BCM2835_ISP_PARAM_BLOCK_GAMMA] =3D {
> +               .size =3D sizeof(struct bcm2835_isp_params_gamma),
> +       },
> +       [BCM2835_ISP_PARAM_BLOCK_DENOISE] =3D {
> +               .size =3D sizeof(struct bcm2835_isp_params_denoise),
> +       },
> +       [BCM2835_ISP_PARAM_BLOCK_SHARPEN] =3D {
> +               .size =3D sizeof(struct bcm2835_isp_params_sharpen),
> +       },
> +       [BCM2835_ISP_PARAM_BLOCK_DPC] =3D {
> +               .size =3D sizeof(struct bcm2835_isp_params_dpc),
> +       },
> +       [BCM2835_ISP_PARAM_BLOCK_CDN] =3D {
> +               .size =3D sizeof(struct bcm2835_isp_params_cdn),
> +       },
> +       [BCM2835_ISP_PARAM_BLOCK_CC_MATRIX] =3D {
> +               .size =3D sizeof(struct bcm2835_isp_params_cc_matrix),
> +       },
> +       [BCM2835_ISP_PARAM_BLOCK_LENS_SHADING] =3D {
> +               .size =3D sizeof(struct bcm2835_isp_params_lens_shading),
> +       },
> +       [BCM2835_ISP_PARAM_BLOCK_AWB_GAINS] =3D {
> +               .size =3D sizeof(struct bcm2835_isp_params_awb_gains),
> +       },
> +       [BCM2835_ISP_PARAM_BLOCK_DIGITAL_GAIN] =3D {
> +               .size =3D sizeof(struct bcm2835_isp_params_digital_gain),
> +       },
> +};
> +
> +static_assert(ARRAY_SIZE(bcm2835_isp_params_handlers) =3D=3D
> +             ARRAY_SIZE(bcm2835_isp_params_block_types_info));
> +
> +static void bcm2835_isp_params_apply(struct bcm2835_isp_params *params,
> +                                    struct bcm2835_isp_params_buffer *bu=
f)
> +{
> +       const struct v4l2_isp_params_buffer *config =3D buf->config;
> +       size_t block_offset =3D 0;
> +       size_t max_offset =3D config->data_size;
> +       struct mmal_parameter_isp_parameters mmal_param =3D { 0 };
> +       int ret;
> +
> +       while (block_offset < max_offset) {
> +               union bcm2835_isp_params_block block;
> +               bcm2835_isp_params_handler handler;
> +
> +               block.data =3D &config->data[block_offset];
> +               handler =3D bcm2835_isp_params_handlers[block.header->typ=
e];
> +               handler(&mmal_param, params, block);
> +
> +               block_offset +=3D block.header->size;
> +       }
> +
> +       ret =3D isp_set_param(params, MMAL_PARAMETER_ISP_SETTINGS, &mmal_=
param,
> +                           sizeof(mmal_param));
> +
> +       if (ret) {
> +               dev_err(params->dev,
> +                       "%s: MMAL_PARAMETER_ISP_SETTINGS failed with err =
%d\n",
> +                       __func__, ret);
> +               vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> +               return;
> +       }
> +
> +       vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> +}
> +
> +/* vb2 operations */
> +
> +static int bcm2835_isp_params_queue_setup(struct vb2_queue *q,
> +                                         unsigned int *num_buffers,
> +                                         unsigned int *num_planes,
> +                                         unsigned int sizes[],
> +                                         struct device *alloc_devs[])
> +{
> +       if (*num_planes && *num_planes > 1)
> +               return -EINVAL;
> +
> +       if (sizes[0] && sizes[0] < BCM2835_ISP_PARAMS_BUF_SIZE)
> +               return -EINVAL;
> +
> +       *num_planes =3D 1;
> +
> +       if (!sizes[0])
> +               sizes[0] =3D BCM2835_ISP_PARAMS_BUF_SIZE;
> +
> +       return 0;
> +}
> +
> +static int bcm2835_isp_params_buf_init(struct vb2_buffer *vb)
> +{
> +       struct bcm2835_isp_params_buffer *buf =3D
> +               to_bcm2835_isp_params_buf(to_vb2_v4l2_buffer(vb));
> +
> +       buf->config =3D kvmalloc(BCM2835_ISP_PARAMS_BUF_SIZE, GFP_KERNEL);
> +       if (!buf->config)
> +               return -ENOMEM;
> +
> +       return 0;
> +}
> +
> +static void bcm2835_isp_params_buf_cleanup(struct vb2_buffer *vb)
> +{
> +       struct bcm2835_isp_params_buffer *buf =3D
> +               to_bcm2835_isp_params_buf(to_vb2_v4l2_buffer(vb));
> +
> +       kvfree(buf->config);
> +       buf->config =3D NULL;
> +}
> +
> +static int bcm2835_isp_params_buf_prepare(struct vb2_buffer *vb)
> +{
> +       struct bcm2835_isp_params *params =3D vb2_get_drv_priv(vb->vb2_qu=
eue);
> +       struct bcm2835_isp_params_buffer *buf =3D
> +               to_bcm2835_isp_params_buf(to_vb2_v4l2_buffer(vb));
> +       const struct v4l2_isp_params_buffer *config;
> +       int ret;
> +
> +       ret =3D v4l2_isp_params_validate_buffer_size(params->dev, vb,
> +                                                  BCM2835_ISP_PARAMS_BUF=
_SIZE);
> +       if (ret)
> +               return ret;
> +
> +       config =3D vb2_plane_vaddr(vb, 0);
> +       if (config->version !=3D BCM2835_ISP_PARAM_BUFFER_V1)
> +               return -EINVAL;
> +
> +       /* Copy into scratch buffer */
> +       memcpy(buf->config, config, BCM2835_ISP_PARAMS_BUF_SIZE);
> +
> +       return v4l2_isp_params_validate_buffer(params->dev, vb, buf->conf=
ig,
> +                                              bcm2835_isp_params_block_t=
ypes_info,
> +                                              ARRAY_SIZE(bcm2835_isp_par=
ams_block_types_info));
> +}
> +
> +static void bcm2835_isp_params_buf_queue(struct vb2_buffer *vb)
> +{
> +       struct bcm2835_isp_params *params =3D vb2_get_drv_priv(vb->vb2_qu=
eue);
> +       struct bcm2835_isp_params_buffer *buf =3D
> +               to_bcm2835_isp_params_buf(to_vb2_v4l2_buffer(vb));
> +
> +       /*
> +        * Apply params immediately - the firmware will apply them on the
> +        * next frame boundary.
> +        */
> +       bcm2835_isp_params_apply(params, buf);
> +}
> +
> +static const struct vb2_ops bcm2835_isp_params_vb2_ops =3D {
> +       .queue_setup =3D bcm2835_isp_params_queue_setup,
> +       .buf_init =3D bcm2835_isp_params_buf_init,
> +       .buf_cleanup =3D bcm2835_isp_params_buf_cleanup,
> +       .buf_prepare =3D bcm2835_isp_params_buf_prepare,
> +       .buf_queue =3D bcm2835_isp_params_buf_queue,
> +};
> +
> +/* V4L2 ioctls */
> +
> +static int bcm2835_isp_params_enum_fmt(struct file *file, void *fh,
> +                                      struct v4l2_fmtdesc *f)
> +{
> +       if (f->index)
> +               return -EINVAL;
> +
> +       f->pixelformat =3D V4L2_META_FMT_BCM2835_ISP_PARAMS;
> +
> +       return 0;
> +}
> +
> +static int bcm2835_isp_params_g_fmt(struct file *file, void *fh,
> +                                   struct v4l2_format *f)
> +{
> +       f->fmt.meta.dataformat =3D V4L2_META_FMT_BCM2835_ISP_PARAMS;
> +       f->fmt.meta.buffersize =3D BCM2835_ISP_PARAMS_BUF_SIZE;
> +
> +       return 0;
> +}
> +
> +static const struct v4l2_ioctl_ops bcm2835_isp_params_ioctl_ops =3D {
> +       .vidioc_querycap =3D bcm2835_isp_node_querycap,
> +       .vidioc_enum_fmt_meta_out =3D bcm2835_isp_params_enum_fmt,
> +       .vidioc_g_fmt_meta_out =3D bcm2835_isp_params_g_fmt,
> +       .vidioc_s_fmt_meta_out =3D bcm2835_isp_params_g_fmt,
> +       .vidioc_try_fmt_meta_out =3D bcm2835_isp_params_g_fmt,
> +
> +       .vidioc_reqbufs =3D vb2_ioctl_reqbufs,
> +       .vidioc_querybuf =3D vb2_ioctl_querybuf,
> +       .vidioc_qbuf =3D vb2_ioctl_qbuf,
> +       .vidioc_dqbuf =3D vb2_ioctl_dqbuf,
> +       .vidioc_expbuf =3D vb2_ioctl_expbuf,
> +       .vidioc_create_bufs =3D vb2_ioctl_create_bufs,
> +       .vidioc_prepare_buf =3D vb2_ioctl_prepare_buf,
> +
> +       .vidioc_streamon =3D vb2_ioctl_streamon,
> +       .vidioc_streamoff =3D vb2_ioctl_streamoff,
> +};
> +
> +static const struct v4l2_file_operations bcm2835_isp_params_fops =3D {
> +       .owner =3D THIS_MODULE,
> +       .open =3D v4l2_fh_open,
> +       .release =3D vb2_fop_release,
> +       .poll =3D vb2_fop_poll,
> +       .unlocked_ioctl =3D video_ioctl2,
> +       .mmap =3D vb2_fop_mmap,
> +};
> +
> +struct bcm2835_isp_params *
> +bcm2835_isp_params_register(struct v4l2_device *v4l2_dev, struct device =
*dev,
> +                           struct vchiq_mmal_instance *mmal_instance,
> +                           struct vchiq_mmal_port *port, int video_nr)
> +{
> +       struct mmal_parameter_isp_parameters mmal_param =3D { 0 };
> +       struct bcm2835_isp_params *params;
> +       struct video_device *vdev;
> +       struct vb2_queue *q;
> +       int ret;
> +
> +       params =3D devm_kzalloc(dev, sizeof(*params), GFP_KERNEL);
> +       if (!params)
> +               return ERR_PTR(-ENOMEM);
> +
> +       params->dev =3D dev;
> +       params->v4l2_dev =3D v4l2_dev;
> +       params->mmal_instance =3D mmal_instance;
> +       params->port =3D port;
> +
> +       /* Test if the firmware supports a combined parameter buffer */
> +       ret =3D vchiq_mmal_port_parameter_set(params->mmal_instance,
> +                                           params->port,
> +                                           MMAL_PARAMETER_ISP_SETTINGS,
> +                                           &mmal_param, sizeof(mmal_para=
m));
> +       if (ret) {
> +               dev_err(dev, "Please update to the latest firmware\n"
> +                       "\tMMAL_PARAMETER_ISP_SETTINGS failed with err %d=
\n",
> +                       ret);
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       mutex_init(&params->lock);
> +
> +       /* Initialize vb2 queue */
> +       q =3D &params->queue;
> +       q->type =3D V4L2_BUF_TYPE_META_OUTPUT;
> +       q->io_modes =3D VB2_MMAP | VB2_DMABUF;
> +       q->drv_priv =3D params;
> +       q->ops =3D &bcm2835_isp_params_vb2_ops;
> +       q->mem_ops =3D &vb2_dma_contig_memops;
> +       q->buf_struct_size =3D sizeof(struct bcm2835_isp_params_buffer);
> +       q->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +       q->dev =3D dev;
> +       q->lock =3D &params->lock;
> +
> +       ret =3D vb2_queue_init(q);
> +       if (ret) {
> +               dev_err(dev, "Failed to init params vb2 queue\n");
> +               mutex_destroy(&params->lock);
> +               return ERR_PTR(ret);
> +       }
> +
> +       /* Initialize video device */
> +       vdev =3D &params->vdev;
> +       vdev->device_caps =3D V4L2_CAP_META_OUTPUT | V4L2_CAP_STREAMING;
> +       vdev->fops =3D &bcm2835_isp_params_fops;
> +       vdev->ioctl_ops =3D &bcm2835_isp_params_ioctl_ops;
> +       vdev->minor =3D -1;
> +       vdev->release =3D video_device_release_empty;
> +       vdev->queue =3D q;
> +       vdev->lock =3D &params->lock;
> +       vdev->v4l2_dev =3D v4l2_dev;
> +       vdev->vfl_dir =3D VFL_DIR_TX;
> +       snprintf(vdev->name, sizeof(vdev->name), "%s", BCM2835_ISP_PARAMS=
_NAME);
> +
> +       params->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> +       ret =3D media_entity_pads_init(&vdev->entity, 1, &params->pad);
> +       if (ret) {
> +               vb2_queue_release(q);
> +               mutex_destroy(&params->lock);
> +               return ERR_PTR(ret);
> +       }
> +
> +       video_set_drvdata(vdev, params);
> +
> +       ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, video_nr);
> +       if (ret) {
> +               dev_err(dev, "Failed to register params device node\n");
> +               media_entity_cleanup(&vdev->entity);
> +               vb2_queue_release(q);
> +               mutex_destroy(&params->lock);
> +               return ERR_PTR(ret);
> +       }
> +
> +       v4l2_info(v4l2_dev, "Params device node registered as /dev/video%=
d\n",
> +                 vdev->num);
> +
> +       return params;
> +}
> +
> +void bcm2835_isp_params_unregister(struct bcm2835_isp_params *params)
> +{
> +       if (!video_is_registered(&params->vdev))
> +               return;
> +
> +       v4l2_info(params->v4l2_dev, "Unregistering params device node\n");
> +
> +       vb2_video_unregister_device(&params->vdev);
> +       media_entity_cleanup(&params->vdev.entity);
> +       mutex_destroy(&params->lock);
> +}
> +
> +/*
> + * The ISP component on the firmware has a reference to the dmabuf handl=
e for
> + * the lens shading table.
> + * Pass a null handle to remove that reference.
> + */
> +int bcm2835_isp_params_drop_ls_ref(struct bcm2835_isp_params *params)
> +{
> +       struct bcm2835_isp_lens_shading ls =3D {
> +               /* Must set a valid grid size for the FW */
> +               .grid_cell_size =3D 16,
> +       };
> +
> +       params->last_ls_dmabuf =3D NULL;
> +
> +       return isp_set_param(params, MMAL_PARAMETER_LENS_SHADING_OVERRIDE=
, &ls,
> +                            sizeof(ls));
> +}
> diff --git a/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-v4l2-isp=
.c b/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-v4l2-isp.c
> new file mode 100644
> index 000000000000..729ab05d8154
> --- /dev/null
> +++ b/drivers/media/platform/broadcom/bcm2835-isp/bcm2835-v4l2-isp.c
> @@ -0,0 +1,1516 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Broadcom BCM2835 ISP driver
> + *
> + * Copyright (c) 2019-2026 Raspberry Pi (Trading) Ltd.
> + * Copyright (c) 2026 Ideas On Board Oy
> + *
> + * Author: Naushir Patuck (naush@raspberrypi.com)
> + *
> + */
> +
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/raspberrypi/mmal-msg.h>
> +#include <linux/raspberrypi/mmal-parameters.h>
> +#include <linux/raspberrypi/mmal-vchiq.h>
> +#include <linux/raspberrypi/vchiq_bus.h>
> +
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-ioctl.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "bcm2835-isp-fmts.h"
> +#include "bcm2835-isp-common.h"
> +
> +/*
> + * There is no standard API today for multiplexing ISP instances, so we =
hardcode
> + * the number of instances to 1 here. The firmware backend can work with=
 more.
> + */
> +#define BCM2835_ISP_NUM_INSTANCES 1
> +
> +MODULE_IMPORT_NS("DMA_BUF");
> +
> +static unsigned int debug;
> +module_param(debug, uint, 0644);
> +MODULE_PARM_DESC(debug, "activates debug info");
> +
> +static unsigned int video_nr[BCM2835_ISP_NUM_INSTANCES] =3D { 13 };
> +module_param_array(video_nr, uint, NULL, 0644);
> +MODULE_PARM_DESC(video_nr, "base video device numbers");
> +
> +#define BCM2835_ISP_NAME "bcm2835-isp"
> +#define BCM2835_ISP_ENTITY_NAME_LEN 32
> +
> +#define BCM2835_ISP_NUM_OUTPUTS 1
> +#define BCM2835_ISP_NUM_CAPTURES 2
> +#define BCM2835_ISP_NUM_METADATA 1
> +#define BCM2835_ISP_NUM_PARAMS 1
> +
> +#define BCM2835_ISP_NUM_NODES                                          \
> +               (BCM2835_ISP_NUM_OUTPUTS + BCM2835_ISP_NUM_CAPTURES +   \
> +                BCM2835_ISP_NUM_METADATA)
> +#define BCM2835_ISP_PARAMS_PAD BCM2835_ISP_NUM_NODES
> +#define BCM2835_ISP_NUM_ENTITY_PADS                                    \
> +               (BCM2835_ISP_NUM_NODES + BCM2835_ISP_NUM_PARAMS)
> +
> +/* Default frame dimension of 1280 pixels. */
> +#define DEFAULT_DIM 1280U
> +/*
> + * Maximum frame dimension of 16384 pixels.  Even though the ISP runs in=
 tiles,
> + * have a sensible limit so that we do not create an excessive number of=
 tiles
> + * to process.
> + */
> +#define MAX_DIM 16384U
> +/*
> + * Minimum frame dimension of 64 pixels.  Anything lower, and the tiling
> + * algorithm may not be able to cope when applying filter context.
> + */
> +#define MIN_DIM 64U
> +
> +/* Timeout for stop_streaming to allow all buffers to return */
> +#define COMPLETE_TIMEOUT (2 * HZ)
> +
> +/* Per-queue, driver-specific private data */
> +struct bcm2835_isp_q_data {
> +       /*
> +        * These parameters should be treated as gospel, with everything =
else
> +        * being determined from them.
> +        */
> +       unsigned int bytesperline;
> +       unsigned int width;
> +       unsigned int height;
> +       unsigned int sizeimage;
> +       enum v4l2_colorspace colorspace;
> +       enum v4l2_ycbcr_encoding ycbcr_enc;
> +       enum v4l2_xfer_func xfer_func;
> +       enum v4l2_quantization quantization;
> +       const struct bcm2835_isp_fmt *fmt;
> +};
> +
> +/*
> + * Structure to describe a single node /dev/video<N> which represents a =
single
> + * input or output queue to the ISP device.
> + */
> +struct bcm2835_isp_node {
> +       int vfl_dir;
> +       unsigned int id;
> +       const char *name;
> +       struct vchiq_mmal_port *port;
> +       struct video_device vfd;
> +       struct media_pad pad;
> +       struct mutex lock; /* top level device node lock */
> +       struct mutex queue_lock;
> +
> +       struct vb2_queue queue;
> +       unsigned int sequence;
> +
> +       /* The list of formats supported on the node. */
> +       struct bcm2835_isp_fmt const **supported_fmts;
> +       unsigned int num_supported_fmts;
> +
> +       struct bcm2835_isp_q_data q_data;
> +
> +       /* Parent device structure */
> +       struct bcm2835_isp_dev *dev;
> +
> +       bool registered;
> +};
> +
> +/*
> + * Structure representing the entire ISP device, comprising several inpu=
t and
> + * output nodes /dev/video<N>.
> + */
> +struct bcm2835_isp_dev {
> +       struct v4l2_device v4l2_dev;
> +       struct device *dev;
> +       struct media_device mdev;
> +       struct media_entity entity;
> +       bool media_device_registered;
> +       bool media_entity_registered;
> +       struct vchiq_mmal_instance *mmal_instance;
> +       struct vchiq_mmal_component *component;
> +       struct completion frame_cmplt;
> +
> +       struct bcm2835_isp_node node[BCM2835_ISP_NUM_NODES];
> +       struct media_pad pad[BCM2835_ISP_NUM_ENTITY_PADS];
> +       atomic_t num_streaming;
> +
> +       /* Extensible params node */
> +       struct bcm2835_isp_params *params;
> +};
> +
> +struct bcm2835_isp_buffer {
> +       struct vb2_v4l2_buffer vb;
> +       struct mmal_buffer mmal;
> +};
> +
> +#define to_bcm2835_isp_buffer(vbuf) \
> +       container_of(vbuf, struct bcm2835_isp_buffer, vb)
> +
> +static
> +inline struct bcm2835_isp_dev *node_get_dev(struct bcm2835_isp_node *nod=
e)
> +{
> +       return node->dev;
> +}
> +
> +static inline bool node_is_output(struct bcm2835_isp_node *node)
> +{
> +       return node->queue.type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT;
> +}
> +
> +static inline bool node_is_capture(struct bcm2835_isp_node *node)
> +{
> +       return node->queue.type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +}
> +
> +static inline bool node_is_stats(struct bcm2835_isp_node *node)
> +{
> +       return node->queue.type =3D=3D V4L2_BUF_TYPE_META_CAPTURE;
> +}
> +
> +static inline enum v4l2_buf_type index_to_queue_type(int index)
> +{
> +       if (index < BCM2835_ISP_NUM_OUTPUTS)
> +               return V4L2_BUF_TYPE_VIDEO_OUTPUT;
> +       else if (index < BCM2835_ISP_NUM_OUTPUTS + BCM2835_ISP_NUM_CAPTUR=
ES)
> +               return V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +       else
> +               return V4L2_BUF_TYPE_META_CAPTURE;
> +}
> +
> +static const struct bcm2835_isp_fmt *get_fmt(u32 mmal_fmt)
> +{
> +       unsigned int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(supported_formats); i++) {
> +               if (supported_formats[i].mmal_fmt =3D=3D mmal_fmt)
> +                       return &supported_formats[i];
> +       }
> +       return NULL;
> +}
> +
> +static const
> +struct bcm2835_isp_fmt *find_format_by_fourcc(unsigned int fourcc,
> +                                             struct bcm2835_isp_node *no=
de)
> +{
> +       const struct bcm2835_isp_fmt *fmt;
> +       unsigned int i;
> +
> +       for (i =3D 0; i < node->num_supported_fmts; i++) {
> +               fmt =3D node->supported_fmts[i];
> +               if (fmt->fourcc =3D=3D fourcc)
> +                       return fmt;
> +       }
> +
> +       return NULL;
> +}
> +
> +static const
> +struct bcm2835_isp_fmt *find_format(struct v4l2_format *f,
> +                                   struct bcm2835_isp_node *node)
> +{
> +       return find_format_by_fourcc(node_is_stats(node) ?
> +                                    f->fmt.meta.dataformat :
> +                                    f->fmt.pix.pixelformat,
> +                                    node);
> +}
> +
> +/* vb2_to_mmal_buffer() - converts vb2 buffer header to MMAL
> + *
> + * Copies all the required fields from a VB2 buffer to the MMAL buffer h=
eader,
> + * ready for sending to the VPU.
> + */
> +static void vb2_to_mmal_buffer(struct mmal_buffer *buf,
> +                              struct vb2_v4l2_buffer *vb2)
> +{
> +       u64 pts;
> +
> +       buf->mmal_flags =3D 0;
> +       if (vb2->flags & V4L2_BUF_FLAG_KEYFRAME)
> +               buf->mmal_flags |=3D MMAL_BUFFER_HEADER_FLAG_KEYFRAME;
> +
> +       /* Data must be framed correctly as one frame per buffer. */
> +       buf->mmal_flags |=3D MMAL_BUFFER_HEADER_FLAG_FRAME_END;
> +
> +       buf->length =3D vb2->vb2_buf.planes[0].bytesused;
> +       /*
> +        * Minor ambiguity in the V4L2 spec as to whether passing in a 0 =
length
> +        * buffer, or one with V4L2_BUF_FLAG_LAST set denotes end of stre=
am.
> +        * Handle either.
> +        */
> +       if (!buf->length || (vb2->flags & V4L2_BUF_FLAG_LAST))
> +               buf->mmal_flags |=3D MMAL_BUFFER_HEADER_FLAG_EOS;
> +
> +       /* vb2 timestamps in nsecs, mmal in usecs */
> +       pts =3D vb2->vb2_buf.timestamp;
> +       do_div(pts, 1000);
> +       buf->pts =3D pts;
> +       buf->dts =3D MMAL_TIME_UNKNOWN;
> +}
> +
> +static void mmal_buffer_cb(struct vchiq_mmal_instance *instance,
> +                          struct vchiq_mmal_port *port, int status,
> +                          struct mmal_buffer *mmal_buf)
> +{
> +       struct bcm2835_isp_buffer *q_buf;
> +       struct bcm2835_isp_node *node =3D port->cb_ctx;
> +       struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> +       struct vb2_v4l2_buffer *vb2;
> +
> +       q_buf =3D container_of(mmal_buf, struct bcm2835_isp_buffer, mmal);
> +       vb2 =3D &q_buf->vb;
> +       v4l2_dbg(2, debug, &dev->v4l2_dev,
> +                "%s: port:%s[%d], status:%d, buf:%p, dmabuf:%p, length:%=
lu, flags %u, pts %lld\n",
> +                __func__, node_is_output(node) ? "input" : "output", nod=
e->id,
> +                status, mmal_buf, mmal_buf->dma_buf, mmal_buf->length,
> +                mmal_buf->mmal_flags, mmal_buf->pts);
> +
> +       if (status) {
> +               /* error in transfer */
> +               if (vb2) {
> +                       /* there was a buffer with the error so return it=
 */
> +                       vb2_buffer_done(&vb2->vb2_buf, VB2_BUF_STATE_ERRO=
R);
> +               }
> +               return;
> +       }
> +
> +       /* vb2 timestamps in nsecs, mmal in usecs */
> +       vb2->vb2_buf.timestamp =3D mmal_buf->pts * 1000;
> +       vb2->sequence =3D node->sequence++;
> +       vb2_set_plane_payload(&vb2->vb2_buf, 0, mmal_buf->length);
> +       vb2_buffer_done(&vb2->vb2_buf, VB2_BUF_STATE_DONE);
> +
> +       if (!port->enabled)
> +               complete(&dev->frame_cmplt);
> +}
> +
> +struct colorspace_translation {
> +       enum v4l2_colorspace v4l2_value;
> +       u32 mmal_value;
> +};
> +
> +static u32 translate_color_space(enum v4l2_colorspace color_space)
> +{
> +       static const struct colorspace_translation translations[] =3D {
> +               { V4L2_COLORSPACE_DEFAULT, MMAL_COLOR_SPACE_UNKNOWN },
> +               { V4L2_COLORSPACE_SMPTE170M, MMAL_COLOR_SPACE_ITUR_BT601 =
},
> +               { V4L2_COLORSPACE_SMPTE240M, MMAL_COLOR_SPACE_SMPTE240M },
> +               { V4L2_COLORSPACE_REC709, MMAL_COLOR_SPACE_ITUR_BT709 },
> +               /* V4L2_COLORSPACE_BT878 unavailable */
> +               { V4L2_COLORSPACE_470_SYSTEM_M, MMAL_COLOR_SPACE_BT470_2_=
M },
> +               { V4L2_COLORSPACE_470_SYSTEM_BG, MMAL_COLOR_SPACE_BT470_2=
_BG },
> +               { V4L2_COLORSPACE_JPEG, MMAL_COLOR_SPACE_JPEG_JFIF },
> +               /*
> +                * We don't have an encoding for SRGB as such, but VideoC=
ore
> +                * will do the right thing if it gets "unknown".
> +                */
> +               { V4L2_COLORSPACE_SRGB, MMAL_COLOR_SPACE_UNKNOWN },
> +               /* V4L2_COLORSPACE_OPRGB unavailable */
> +               /* V4L2_COLORSPACE_BT2020 unavailable */
> +               /* V4L2_COLORSPACE_RAW unavailable */
> +               /* V4L2_COLORSPACE_DCI_P3 unavailable */
> +       };
> +
> +       unsigned int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(translations); i++) {
> +               if (color_space =3D=3D translations[i].v4l2_value)
> +                       return translations[i].mmal_value;
> +       }
> +
> +       return MMAL_COLOR_SPACE_UNKNOWN;
> +}
> +
> +static void setup_mmal_port_format(struct bcm2835_isp_node *node,
> +                                  struct vchiq_mmal_port *port)
> +{
> +       struct bcm2835_isp_q_data *q_data =3D &node->q_data;
> +
> +       port->format.encoding =3D q_data->fmt->mmal_fmt;
> +       /* Raw image format - set width/height */
> +       port->es.video.width =3D (q_data->bytesperline << 3) / q_data->fm=
t->depth;
> +       port->es.video.height =3D q_data->height;
> +       port->es.video.crop.width =3D q_data->width;
> +       port->es.video.crop.height =3D q_data->height;
> +       port->es.video.crop.x =3D 0;
> +       port->es.video.crop.y =3D 0;
> +       port->es.video.color_space =3D translate_color_space(q_data->colo=
rspace);
> +};
> +
> +static int setup_mmal_port(struct bcm2835_isp_node *node)
> +{
> +       struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> +       unsigned int enable =3D 1;
> +       int ret;
> +
> +       v4l2_dbg(2, debug, &dev->v4l2_dev, "%s: setup %s[%d]\n", __func__,
> +                node->name, node->id);
> +
> +       vchiq_mmal_port_parameter_set(dev->mmal_instance, node->port,
> +                                     MMAL_PARAMETER_ZERO_COPY, &enable,
> +                                     sizeof(enable));
> +       setup_mmal_port_format(node, node->port);
> +       ret =3D vchiq_mmal_port_set_format(dev->mmal_instance, node->port=
);
> +       if (ret < 0) {
> +               v4l2_dbg(1, debug, &dev->v4l2_dev,
> +                        "%s: vchiq_mmal_port_set_format failed\n",
> +                        __func__);
> +               return ret;
> +       }
> +
> +       if (node->q_data.sizeimage < node->port->minimum_buffer.size) {
> +               v4l2_err(&dev->v4l2_dev,
> +                        "buffer size mismatch sizeimage %u < min size %u=
\n",
> +                        node->q_data.sizeimage,
> +                        node->port->minimum_buffer.size);
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int bcm2835_isp_mmal_buf_cleanup(struct mmal_buffer *mmal_buf)
> +{
> +       mmal_vchi_buffer_cleanup(mmal_buf);
> +
> +       if (mmal_buf->dma_buf) {
> +               dma_buf_put(mmal_buf->dma_buf);
> +               mmal_buf->dma_buf =3D NULL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int bcm2835_isp_node_queue_setup(struct vb2_queue *q,
> +                                       unsigned int *nbuffers,
> +                                       unsigned int *nplanes,
> +                                       unsigned int sizes[],
> +                                       struct device *alloc_devs[])
> +{
> +       struct bcm2835_isp_node *node =3D vb2_get_drv_priv(q);
> +       unsigned int size;
> +
> +       if (setup_mmal_port(node))
> +               return -EINVAL;
> +
> +       size =3D node->q_data.sizeimage;
> +       if (size =3D=3D 0) {
> +               v4l2_info(&node_get_dev(node)->v4l2_dev,
> +                         "%s: Image size unset in queue_setup for node %=
s[%d]\n",
> +                         __func__, node->name, node->id);
> +               return -EINVAL;
> +       }
> +
> +       if (*nplanes)
> +               return sizes[0] < size ? -EINVAL : 0;
> +
> +       *nplanes =3D 1;
> +       sizes[0] =3D size;
> +
> +       node->port->current_buffer.size =3D size;
> +
> +       if (*nbuffers < node->port->minimum_buffer.num)
> +               *nbuffers =3D node->port->minimum_buffer.num;
> +
> +       node->port->current_buffer.num =3D *nbuffers;
> +
> +       v4l2_dbg(2, debug, &node_get_dev(node)->v4l2_dev,
> +                "%s: Image size %u, nbuffers %u for node %s[%d]\n",
> +                __func__, sizes[0], *nbuffers, node->name, node->id);
> +       return 0;
> +}
> +
> +static int bcm2835_isp_buf_init(struct vb2_buffer *vb)
> +{
> +       struct bcm2835_isp_node *node =3D vb2_get_drv_priv(vb->vb2_queue);
> +       struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> +       struct bcm2835_isp_buffer *buf =3D
> +               to_bcm2835_isp_buffer(to_vb2_v4l2_buffer(vb));
> +
> +       v4l2_dbg(3, debug, &dev->v4l2_dev, "%s: vb %p\n", __func__, vb);
> +
> +       buf->mmal.buffer =3D vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
> +       buf->mmal.buffer_size =3D vb2_plane_size(&buf->vb.vb2_buf, 0);
> +       mmal_vchi_buffer_init(dev->mmal_instance, &buf->mmal);
> +       return 0;
> +}
> +
> +static int bcm2835_isp_buf_prepare(struct vb2_buffer *vb)
> +{
> +       struct bcm2835_isp_node *node =3D vb2_get_drv_priv(vb->vb2_queue);
> +       struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> +       struct vb2_v4l2_buffer *vb2 =3D to_vb2_v4l2_buffer(vb);
> +       struct bcm2835_isp_buffer *buf =3D to_bcm2835_isp_buffer(vb2);
> +       struct dma_buf *dma_buf;
> +       int ret =3D 0;
> +
> +       v4l2_dbg(3, debug, &dev->v4l2_dev, "%s: type: %d ptr %p\n",
> +                __func__, vb->vb2_queue->type, vb);
> +
> +       if (V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
> +               if (vb2->field =3D=3D V4L2_FIELD_ANY)
> +                       vb2->field =3D V4L2_FIELD_NONE;
> +               if (vb2->field !=3D V4L2_FIELD_NONE) {
> +                       v4l2_err(&dev->v4l2_dev,
> +                                "%s field isn't supported\n", __func__);
> +                       return -EINVAL;
> +               }
> +       }
> +
> +       if (vb2_plane_size(vb, 0) < node->q_data.sizeimage) {
> +               v4l2_err(&dev->v4l2_dev,
> +                        "%s data will not fit into plane (%lu < %u)\n",
> +                        __func__, vb2_plane_size(vb, 0),
> +                        node->q_data.sizeimage);
> +               return -EINVAL;
> +       }
> +
> +       if (!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type))
> +               vb2_set_plane_payload(vb, 0, node->q_data.sizeimage);
> +
> +       switch (vb->memory) {
> +       case VB2_MEMORY_DMABUF:
> +               dma_buf =3D dma_buf_get(vb->planes[0].m.fd);
> +
> +               if (dma_buf !=3D buf->mmal.dma_buf) {
> +                       /*
> +                        * dmabuf either hasn't already been mapped, or i=
t has
> +                        * changed.
> +                        */
> +                       if (buf->mmal.dma_buf) {
> +                               v4l2_err(&dev->v4l2_dev,
> +                                        "%s Buffer changed - why did the=
 core not call cleanup?\n",
> +                                        __func__);
> +                               bcm2835_isp_mmal_buf_cleanup(&buf->mmal);
> +                       }
> +
> +                       buf->mmal.dma_buf =3D dma_buf;
> +               } else {
> +                       /*
> +                        * Already have a reference to the buffer, so rel=
ease it
> +                        * here.
> +                        */
> +                       dma_buf_put(dma_buf);
> +               }
> +               break;
> +       case VB2_MEMORY_MMAP:
> +               /*
> +                * We want to do this at init, but vb2_core_expbuf checks=
 that
> +                * the index < q->num_buffers, and q->num_buffers only ge=
ts
> +                * updated once all the buffers are allocated.
> +                */
> +               if (!buf->mmal.dma_buf) {
> +                       buf->mmal.dma_buf =3D
> +                               vb2_core_expbuf_dmabuf(vb->vb2_queue, vb,=
 0,
> +                                                      O_CLOEXEC);
> +                       v4l2_dbg(3, debug, &dev->v4l2_dev,
> +                                "%s: exporting ptr %p to dmabuf %p\n",
> +                                __func__, vb, buf->mmal.dma_buf);
> +
> +                       if (IS_ERR(buf->mmal.dma_buf)) {
> +                               ret =3D PTR_ERR(buf->mmal.dma_buf);
> +                               v4l2_err(&dev->v4l2_dev,
> +                                        "%s: Failed to expbuf idx %d, re=
t %d\n",
> +                                        __func__, vb->index, ret);
> +                               buf->mmal.dma_buf =3D NULL;
> +                       }
> +               }
> +               break;
> +       default:
> +               ret =3D -EINVAL;
> +               break;
> +       }
> +
> +       return ret;
> +}
> +
> +static void bcm2835_isp_node_buffer_queue(struct vb2_buffer *buf)
> +{
> +       struct bcm2835_isp_node *node =3D vb2_get_drv_priv(buf->vb2_queue=
);
> +       struct bcm2835_isp_buffer *buffer =3D
> +               to_bcm2835_isp_buffer(to_vb2_v4l2_buffer(buf));
> +       struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> +
> +       v4l2_dbg(3, debug, &dev->v4l2_dev, "%s: node %s[%d], buffer %p\n",
> +                __func__, node->name, node->id, buffer);
> +
> +       vb2_to_mmal_buffer(&buffer->mmal, &buffer->vb);
> +       v4l2_dbg(3, debug, &dev->v4l2_dev,
> +                "%s: node %s[%d] - submitting  mmal dmabuf %p\n", __func=
__,
> +                node->name, node->id, buffer->mmal.dma_buf);
> +       vchiq_mmal_submit_buffer(dev->mmal_instance, node->port, &buffer-=
>mmal);
> +}
> +
> +static void bcm2835_isp_buffer_cleanup(struct vb2_buffer *vb)
> +{
> +       struct bcm2835_isp_buffer *buffer =3D
> +               to_bcm2835_isp_buffer(to_vb2_v4l2_buffer(vb));
> +
> +       bcm2835_isp_mmal_buf_cleanup(&buffer->mmal);
> +}
> +
> +static int bcm2835_isp_node_start_streaming(struct vb2_queue *q,
> +                                           unsigned int count)
> +{
> +       struct bcm2835_isp_node *node =3D vb2_get_drv_priv(q);
> +       struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> +       int ret;
> +
> +       v4l2_dbg(1, debug, &dev->v4l2_dev, "%s: node %s[%d] (count %u)\n",
> +                __func__, node->name, node->id, count);
> +
> +       ret =3D vchiq_mmal_component_enable(dev->mmal_instance, dev->comp=
onent);
> +       if (ret) {
> +               v4l2_err(&dev->v4l2_dev, "%s: Failed enabling component, =
ret %d\n",
> +                        __func__, ret);
> +               return -EIO;
> +       }
> +
> +       node->sequence =3D 0;
> +       node->port->cb_ctx =3D node;
> +       ret =3D vchiq_mmal_port_enable(dev->mmal_instance, node->port,
> +                                    mmal_buffer_cb);
> +       if (!ret)
> +               atomic_inc(&dev->num_streaming);
> +       else
> +               v4l2_err(&dev->v4l2_dev,
> +                        "%s: Failed enabling port, ret %d\n", __func__, =
ret);
> +
> +       return ret;
> +}
> +
> +static void bcm2835_isp_node_stop_streaming(struct vb2_queue *q)
> +{
> +       struct bcm2835_isp_node *node =3D vb2_get_drv_priv(q);
> +       struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> +       int ret;
> +
> +       v4l2_dbg(1, debug, &dev->v4l2_dev, "%s: node %s[%d], mmal port %p=
\n",
> +                __func__, node->name, node->id, node->port);
> +
> +       init_completion(&dev->frame_cmplt);
> +
> +       /* Disable MMAL port - this will flush buffers back */
> +       ret =3D vchiq_mmal_port_disable(dev->mmal_instance, node->port);
> +       if (ret)
> +               v4l2_err(&dev->v4l2_dev,
> +                        "%s: Failed disabling %s port, ret %d\n", __func=
__,
> +                        node_is_output(node) ? "i/p" : "o/p",
> +                        ret);
> +
> +       while (atomic_read(&node->port->buffers_with_vpu)) {
> +               v4l2_dbg(1, debug, &dev->v4l2_dev,
> +                        "%s: Waiting for buffers to be returned - %d out=
standing\n",
> +                        __func__, atomic_read(&node->port->buffers_with_=
vpu));
> +               ret =3D wait_for_completion_timeout(&dev->frame_cmplt,
> +                                                 COMPLETE_TIMEOUT);
> +               if (ret <=3D 0) {
> +                       v4l2_err(&dev->v4l2_dev,
> +                                "%s: Timeout waiting for buffers to be r=
eturned - %d outstanding\n",
> +                                __func__,
> +                                atomic_read(&node->port->buffers_with_vp=
u));
> +                       break;
> +               }
> +       }
> +
> +       atomic_dec(&dev->num_streaming);
> +       /* If all ports disabled, then disable the component */
> +       if (atomic_read(&dev->num_streaming) =3D=3D 0) {
> +               ret =3D bcm2835_isp_params_drop_ls_ref(dev->params);
> +               if (ret) {
> +                       v4l2_err(&dev->v4l2_dev,
> +                                "%s: Failed dropping LS buffer, ret %d\n=
",
> +                                __func__, ret);
> +               }
> +
> +               ret =3D vchiq_mmal_component_disable(dev->mmal_instance,
> +                                                  dev->component);
> +               if (ret) {
> +                       v4l2_err(&dev->v4l2_dev,
> +                                "%s: Failed disabling component, ret %d\=
n",
> +                                __func__, ret);
> +               }
> +       }
> +
> +       /*
> +        * Simply wait for any vb2 buffers to finish. We could take steps=
 to
> +        * make them complete more quickly if we care, or even return them
> +        * ourselves.
> +        */
> +       vb2_wait_for_all_buffers(&node->queue);
> +}
> +
> +static const struct vb2_ops bcm2835_isp_node_queue_ops =3D {
> +       .queue_setup            =3D bcm2835_isp_node_queue_setup,
> +       .buf_init               =3D bcm2835_isp_buf_init,
> +       .buf_prepare            =3D bcm2835_isp_buf_prepare,
> +       .buf_queue              =3D bcm2835_isp_node_buffer_queue,
> +       .buf_cleanup            =3D bcm2835_isp_buffer_cleanup,
> +       .start_streaming        =3D bcm2835_isp_node_start_streaming,
> +       .stop_streaming         =3D bcm2835_isp_node_stop_streaming,
> +};
> +
> +static const
> +struct bcm2835_isp_fmt *get_default_format(struct bcm2835_isp_node *node)
> +{
> +       return node->supported_fmts[0];
> +}
> +
> +static inline unsigned int get_bytesperline(int width,
> +                                           const struct bcm2835_isp_fmt =
*fmt)
> +{
> +       /* GPU aligns 24bpp images to a multiple of 32 pixels (not bytes)=
. */
> +       if (fmt->depth =3D=3D 24)
> +               return ALIGN(width, 32) * 3;
> +       else
> +               return ALIGN((width * fmt->depth) >> 3, fmt->bytesperline=
_align);
> +}
> +
> +static inline unsigned int get_sizeimage(int bpl, int width, int height,
> +                                        const struct bcm2835_isp_fmt *fm=
t)
> +{
> +       return (bpl * height * fmt->size_multiplier_x2) >> 1;
> +}
> +
> +static const struct v4l2_file_operations bcm2835_isp_fops =3D {
> +       .owner          =3D THIS_MODULE,
> +       .open           =3D v4l2_fh_open,
> +       .release        =3D vb2_fop_release,
> +       .poll           =3D vb2_fop_poll,
> +       .unlocked_ioctl =3D video_ioctl2,
> +       .mmap           =3D vb2_fop_mmap
> +};
> +
> +static int populate_qdata_fmt(struct v4l2_format *f,
> +                             struct bcm2835_isp_node *node)
> +{
> +       struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> +       struct bcm2835_isp_q_data *q_data =3D &node->q_data;
> +       int ret;
> +
> +       if (!node_is_stats(node)) {
> +               v4l2_dbg(1, debug, &dev->v4l2_dev,
> +                        "%s: Setting pix format for type %d, wxh: %ux%u,=
 fmt: %08x, size %u\n",
> +                        __func__, f->type, f->fmt.pix.width, f->fmt.pix.=
height,
> +                        f->fmt.pix.pixelformat, f->fmt.pix.sizeimage);
> +
> +               q_data->fmt =3D find_format(f, node);
> +               q_data->width =3D f->fmt.pix.width;
> +               q_data->height =3D f->fmt.pix.height;
> +
> +               /* All parameters should have been set correctly by try_f=
mt */
> +               q_data->bytesperline =3D f->fmt.pix.bytesperline;
> +               q_data->sizeimage =3D f->fmt.pix.sizeimage;
> +               q_data->ycbcr_enc =3D f->fmt.pix.ycbcr_enc;
> +               q_data->xfer_func =3D f->fmt.pix.xfer_func;
> +               q_data->quantization =3D f->fmt.pix.quantization;
> +
> +               /* We must indicate which of the allowed colour spaces we=
 have. */
> +               q_data->colorspace =3D f->fmt.pix.colorspace;
> +       } else {
> +               v4l2_dbg(1, debug, &dev->v4l2_dev,
> +                        "%s: Setting meta format for fmt: %08x, size %u\=
n",
> +                        __func__, f->fmt.meta.dataformat,
> +                        f->fmt.meta.buffersize);
> +
> +               q_data->fmt =3D find_format(f, node);
> +               q_data->width =3D 0;
> +               q_data->height =3D 0;
> +               q_data->bytesperline =3D 0;
> +               q_data->sizeimage =3D f->fmt.meta.buffersize;
> +
> +               /* This won't mean anything for metadata, but may as well=
 fill it in. */
> +               q_data->colorspace =3D V4L2_COLORSPACE_DEFAULT;
> +       }
> +
> +       v4l2_dbg(1, debug, &dev->v4l2_dev,
> +                "%s: Calculated bpl as %u, size %u\n", __func__,
> +                q_data->bytesperline, q_data->sizeimage);
> +
> +       setup_mmal_port_format(node, node->port);
> +       ret =3D vchiq_mmal_port_set_format(dev->mmal_instance, node->port=
);
> +       if (ret) {
> +               v4l2_err(&dev->v4l2_dev,
> +                        "%s: Failed vchiq_mmal_port_set_format on port, =
ret %d\n",
> +                        __func__, ret);
> +               ret =3D -EINVAL;
> +       }
> +
> +       if (q_data->sizeimage < node->port->minimum_buffer.size) {
> +               v4l2_err(&dev->v4l2_dev,
> +                        "%s: Current buffer size of %u < min buf size %u=
 - driver mismatch to MMAL\n",
> +                        __func__,
> +                        q_data->sizeimage,
> +                        node->port->minimum_buffer.size);
> +               ret =3D -EINVAL;
> +       }
> +
> +       v4l2_dbg(1, debug, &dev->v4l2_dev,
> +                "%s: Set format for type %d, wxh: %dx%d, fmt: %08x, size=
 %u\n",
> +                __func__, f->type, q_data->width, q_data->height,
> +                q_data->fmt->fourcc, q_data->sizeimage);
> +
> +       return ret;
> +}
> +
> +int bcm2835_isp_node_querycap(struct file *file, void *priv,
> +                             struct v4l2_capability *cap)
> +{
> +       strscpy(cap->driver, BCM2835_ISP_NAME, sizeof(cap->driver));
> +       strscpy(cap->card, BCM2835_ISP_NAME, sizeof(cap->card));
> +       snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
> +                BCM2835_ISP_NAME);
> +
> +       return 0;
> +}
> +
> +static int bcm2835_isp_node_g_fmt(struct file *file, void *priv,
> +                                 struct v4l2_format *f)
> +{
> +       struct bcm2835_isp_node *node =3D video_drvdata(file);
> +
> +       if (f->type !=3D node->queue.type)
> +               return -EINVAL;
> +
> +       if (node_is_stats(node)) {
> +               f->fmt.meta.dataformat =3D V4L2_META_FMT_BCM2835_ISP_STAT=
S;
> +               f->fmt.meta.buffersize =3D
> +                       node->port->minimum_buffer.size;
> +       } else {
> +               struct bcm2835_isp_q_data *q_data =3D &node->q_data;
> +
> +               f->fmt.pix.width =3D q_data->width;
> +               f->fmt.pix.height =3D q_data->height;
> +               f->fmt.pix.field =3D V4L2_FIELD_NONE;
> +               f->fmt.pix.pixelformat =3D q_data->fmt->fourcc;
> +               f->fmt.pix.bytesperline =3D q_data->bytesperline;
> +               f->fmt.pix.sizeimage =3D q_data->sizeimage;
> +               f->fmt.pix.colorspace =3D q_data->colorspace;
> +               f->fmt.pix.ycbcr_enc =3D q_data->ycbcr_enc;
> +               f->fmt.pix.xfer_func =3D q_data->xfer_func;
> +               f->fmt.pix.quantization =3D q_data->quantization;
> +       }
> +
> +       return 0;
> +}
> +
> +static int bcm2835_isp_node_enum_fmt(struct file *file, void *priv,
> +                                    struct v4l2_fmtdesc *f)
> +{
> +       struct bcm2835_isp_node *node =3D video_drvdata(file);
> +
> +       if (f->type !=3D node->queue.type)
> +               return -EINVAL;
> +
> +       if (f->index < node->num_supported_fmts) {
> +               /* Format found */
> +               f->pixelformat =3D node->supported_fmts[f->index]->fourcc;
> +               f->flags =3D 0;
> +               return 0;
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +static int bcm2835_isp_enum_framesizes(struct file *file, void *priv,
> +                                      struct v4l2_frmsizeenum *fsize)
> +{
> +       struct bcm2835_isp_node *node =3D video_drvdata(file);
> +       struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> +       const struct bcm2835_isp_fmt *fmt;
> +
> +       if (node_is_stats(node) || fsize->index)
> +               return -EINVAL;
> +
> +       fmt =3D find_format_by_fourcc(fsize->pixel_format, node);
> +       if (!fmt) {
> +               v4l2_err(&dev->v4l2_dev, "Invalid pixel code: %x\n",
> +                        fsize->pixel_format);
> +               return -EINVAL;
> +       }
> +
> +       fsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> +       fsize->stepwise.min_width =3D MIN_DIM;
> +       fsize->stepwise.max_width =3D MAX_DIM;
> +       fsize->stepwise.step_width =3D fmt->step_size;
> +
> +       fsize->stepwise.min_height =3D MIN_DIM;
> +       fsize->stepwise.max_height =3D MAX_DIM;
> +       fsize->stepwise.step_height =3D fmt->step_size;
> +
> +       return 0;
> +}
> +
> +static int bcm2835_isp_node_try_fmt(struct file *file, void *priv,
> +                                   struct v4l2_format *f)
> +{
> +       struct bcm2835_isp_node *node =3D video_drvdata(file);
> +       const struct bcm2835_isp_fmt *fmt;
> +
> +       if (f->type !=3D node->queue.type)
> +               return -EINVAL;
> +
> +       fmt =3D find_format(f, node);
> +       if (!fmt)
> +               fmt =3D get_default_format(node);
> +
> +       if (!node_is_stats(node)) {
> +               bool is_rgb;
> +
> +               f->fmt.pix.width =3D clamp_t(u32, f->fmt.pix.width, MIN_D=
IM,
> +                                          MAX_DIM);
> +               f->fmt.pix.height =3D clamp_t(u32, f->fmt.pix.height, MIN=
_DIM,
> +                                           MAX_DIM);
> +               f->fmt.pix.pixelformat =3D fmt->fourcc;
> +
> +               /*
> +                * Fill in the actual colour space when the requested one=
 was
> +                * not supported. This also catches the case when the "de=
fault"
> +                * colour space was requested (as that's never in the mas=
k).
> +                */
> +               if (!(V4L2_COLORSPACE_MASK(f->fmt.pix.colorspace) & fmt->=
colorspace_mask))
> +                       f->fmt.pix.colorspace =3D fmt->colorspace_default;
> +               /* In all cases, we only support the defaults for these: =
*/
> +               f->fmt.pix.ycbcr_enc =3D V4L2_MAP_YCBCR_ENC_DEFAULT(f->fm=
t.pix.colorspace);
> +               f->fmt.pix.xfer_func =3D V4L2_MAP_XFER_FUNC_DEFAULT(f->fm=
t.pix.colorspace);
> +               /* RAW counts as sRGB here so that we get full range. */
> +               is_rgb =3D f->fmt.pix.colorspace =3D=3D V4L2_COLORSPACE_S=
RGB ||
> +                       f->fmt.pix.colorspace =3D=3D V4L2_COLORSPACE_RAW;
> +               f->fmt.pix.quantization =3D V4L2_MAP_QUANTIZATION_DEFAULT=
(is_rgb,
> +                                                                       f=
->fmt.pix.colorspace,
> +                                                                       f=
->fmt.pix.ycbcr_enc);
> +
> +               /* Respect any stride value (suitably aligned) that was r=
equested. */
> +               f->fmt.pix.bytesperline =3D max(get_bytesperline(f->fmt.p=
ix.width, fmt),
> +                                             ALIGN(f->fmt.pix.bytesperli=
ne,
> +                                                   fmt->bytesperline_ali=
gn));
> +               f->fmt.pix.field =3D V4L2_FIELD_NONE;
> +               f->fmt.pix.sizeimage =3D
> +                       get_sizeimage(f->fmt.pix.bytesperline, f->fmt.pix=
.width,
> +                                     f->fmt.pix.height, fmt);
> +       } else {
> +               f->fmt.meta.dataformat =3D fmt->fourcc;
> +               f->fmt.meta.buffersize =3D node->port->minimum_buffer.siz=
e;
> +       }
> +
> +       return 0;
> +}
> +
> +static int bcm2835_isp_node_s_fmt(struct file *file, void *priv,
> +                                 struct v4l2_format *f)
> +{
> +       struct bcm2835_isp_node *node =3D video_drvdata(file);
> +       int ret;
> +
> +       if (f->type !=3D node->queue.type)
> +               return -EINVAL;
> +
> +       ret =3D bcm2835_isp_node_try_fmt(file, priv, f);
> +       if (ret)
> +               return ret;
> +
> +       v4l2_dbg(1, debug, &node_get_dev(node)->v4l2_dev,
> +                "%s: Set format for node %s[%d]\n",
> +                __func__, node->name, node->id);
> +
> +       return populate_qdata_fmt(f, node);
> +}
> +
> +static int bcm2835_isp_node_s_selection(struct file *file, void *fh,
> +                                       struct v4l2_selection *s)
> +{
> +       struct mmal_parameter_crop crop;
> +       struct bcm2835_isp_node *node =3D video_drvdata(file);
> +       struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> +
> +       if (!node_is_output(node))
> +               return -EINVAL;
> +
> +       if (!s->r.width || !s->r.height)
> +               return -EINVAL;
> +
> +       /* We can only set crop on the input. */
> +       switch (s->target) {
> +       case V4L2_SEL_TGT_CROP:
> +               /*
> +                * Adjust the crop window if it goes outside of the frame
> +                * dimensions.
> +                */
> +               s->r.left =3D clamp_t(unsigned int, s->r.left, 0,
> +                                   node->q_data.width - MIN_DIM);
> +               s->r.top =3D clamp_t(unsigned int, s->r.top, 0,
> +                                  node->q_data.height - MIN_DIM);
> +               s->r.width =3D clamp_t(unsigned int, s->r.width, MIN_DIM,
> +                                    node->q_data.width - s->r.left);
> +               s->r.height =3D clamp_t(unsigned int, s->r.height, MIN_DI=
M,
> +                                     node->q_data.height - s->r.top);
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       crop.rect.x =3D s->r.left;
> +       crop.rect.y =3D s->r.top;
> +       crop.rect.width =3D s->r.width;
> +       crop.rect.height =3D s->r.height;
> +
> +       return vchiq_mmal_port_parameter_set(dev->mmal_instance, node->po=
rt,
> +                                            MMAL_PARAMETER_CROP,
> +                                            &crop, sizeof(crop));
> +}
> +
> +static int bcm2835_isp_node_g_selection(struct file *file, void *fh,
> +                                       struct v4l2_selection *s)
> +{
> +       struct mmal_parameter_crop crop;
> +       struct bcm2835_isp_node *node =3D video_drvdata(file);
> +       struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> +       u32 crop_size =3D sizeof(crop);
> +       int ret;
> +
> +       if (!node_is_output(node))
> +               return -EINVAL;
> +
> +       /* We can only return out an input crop. */
> +       switch (s->target) {
> +       case V4L2_SEL_TGT_CROP:
> +               ret =3D vchiq_mmal_port_parameter_get(dev->mmal_instance,
> +                                                   node->port,
> +                                                   MMAL_PARAMETER_CROP,
> +                                                   &crop, &crop_size);
> +               if (!ret) {
> +                       s->r.left =3D crop.rect.x;
> +                       s->r.top =3D crop.rect.y;
> +                       s->r.width =3D crop.rect.width;
> +                       s->r.height =3D crop.rect.height;
> +               }
> +               break;
> +       case V4L2_SEL_TGT_CROP_DEFAULT:
> +       case V4L2_SEL_TGT_CROP_BOUNDS:
> +               /* Default (i.e. no) crop window. */
> +               s->r.left =3D 0;
> +               s->r.top =3D 0;
> +               s->r.width =3D node->q_data.width;
> +               s->r.height =3D node->q_data.height;
> +               ret =3D 0;
> +               break;
> +       default:
> +               ret =3D  -EINVAL;
> +       }
> +
> +       return ret;
> +}
> +
> +static const struct v4l2_ioctl_ops bcm2835_isp_node_ioctl_ops =3D {
> +       .vidioc_querycap                =3D bcm2835_isp_node_querycap,
> +       .vidioc_g_fmt_vid_cap           =3D bcm2835_isp_node_g_fmt,
> +       .vidioc_g_fmt_vid_out           =3D bcm2835_isp_node_g_fmt,
> +       .vidioc_g_fmt_meta_cap          =3D bcm2835_isp_node_g_fmt,
> +       .vidioc_s_fmt_vid_cap           =3D bcm2835_isp_node_s_fmt,
> +       .vidioc_s_fmt_vid_out           =3D bcm2835_isp_node_s_fmt,
> +       .vidioc_s_fmt_meta_cap          =3D bcm2835_isp_node_s_fmt,
> +       .vidioc_try_fmt_vid_cap         =3D bcm2835_isp_node_try_fmt,
> +       .vidioc_try_fmt_vid_out         =3D bcm2835_isp_node_try_fmt,
> +       .vidioc_try_fmt_meta_cap        =3D bcm2835_isp_node_try_fmt,
> +       .vidioc_s_selection             =3D bcm2835_isp_node_s_selection,
> +       .vidioc_g_selection             =3D bcm2835_isp_node_g_selection,
> +
> +       .vidioc_enum_fmt_vid_cap        =3D bcm2835_isp_node_enum_fmt,
> +       .vidioc_enum_fmt_vid_out        =3D bcm2835_isp_node_enum_fmt,
> +       .vidioc_enum_fmt_meta_cap       =3D bcm2835_isp_node_enum_fmt,
> +       .vidioc_enum_framesizes         =3D bcm2835_isp_enum_framesizes,
> +
> +       .vidioc_reqbufs                 =3D vb2_ioctl_reqbufs,
> +       .vidioc_querybuf                =3D vb2_ioctl_querybuf,
> +       .vidioc_qbuf                    =3D vb2_ioctl_qbuf,
> +       .vidioc_dqbuf                   =3D vb2_ioctl_dqbuf,
> +       .vidioc_expbuf                  =3D vb2_ioctl_expbuf,
> +       .vidioc_create_bufs             =3D vb2_ioctl_create_bufs,
> +       .vidioc_prepare_buf             =3D vb2_ioctl_prepare_buf,
> +
> +       .vidioc_streamon                =3D vb2_ioctl_streamon,
> +       .vidioc_streamoff               =3D vb2_ioctl_streamoff,
> +};
> +
> +/*
> + * Size of the array to provide to the VPU when asking for the list of s=
upported
> + * formats.
> + *
> + * The ISP component currently advertises 62 input formats, so add a sma=
ll
> + * overhead on that. Should the component advertise more formats then th=
e excess
> + * will be dropped and a warning logged.
> + */
> +#define MAX_SUPPORTED_ENCODINGS 70
> +
> +/* Populate node->supported_fmts with the formats supported by those por=
ts. */
> +static int bcm2835_isp_get_supported_fmts(struct bcm2835_isp_node *node)
> +{
> +       struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> +       struct bcm2835_isp_fmt const **list;
> +       unsigned int i, j, num_encodings;
> +       u32 fourccs[MAX_SUPPORTED_ENCODINGS];
> +       u32 param_size =3D sizeof(fourccs);
> +       int ret;
> +
> +       ret =3D vchiq_mmal_port_parameter_get(dev->mmal_instance, node->p=
ort,
> +                                           MMAL_PARAMETER_SUPPORTED_ENCO=
DINGS,
> +                                           &fourccs, &param_size);
> +
> +       if (ret) {
> +               if (ret =3D=3D MMAL_MSG_STATUS_ENOSPC) {
> +                       v4l2_err(&dev->v4l2_dev,
> +                                "%s: port has more encodings than we pro=
vided space for. Some are dropped (%zu vs %u).\n",
> +                                __func__, param_size / sizeof(u32),
> +                                MAX_SUPPORTED_ENCODINGS);
> +                       num_encodings =3D MAX_SUPPORTED_ENCODINGS;
> +               } else {
> +                       v4l2_err(&dev->v4l2_dev, "%s: get_param ret %u.\n=
",
> +                                __func__, ret);
> +                       return -EINVAL;
> +               }
> +       } else {
> +               num_encodings =3D param_size / sizeof(u32);
> +       }
> +
> +       /*
> +        * Assume at this stage that all encodings will be supported in V=
4L2.
> +        * Any that aren't supported will waste a very small amount of me=
mory.
> +        */
> +       list =3D devm_kzalloc(dev->dev,
> +                           sizeof(struct bcm2835_isp_fmt *) * num_encodi=
ngs,
> +                           GFP_KERNEL);
> +       if (!list)
> +               return -ENOMEM;
> +       node->supported_fmts =3D list;
> +
> +       for (i =3D 0, j =3D 0; i < num_encodings; i++) {
> +               const struct bcm2835_isp_fmt *fmt =3D get_fmt(fourccs[i]);
> +
> +               if (fmt) {
> +                       list[j] =3D fmt;
> +                       j++;
> +               }
> +       }
> +       node->num_supported_fmts =3D j;
> +
> +       return 0;
> +}
> +
> +/*
> + * Register a device node /dev/video<N> to go along with one of the ISP'=
s input
> + * or output nodes.
> + */
> +static int bcm2835_isp_register_node(struct bcm2835_isp_dev *dev,
> +                                    unsigned int instance,
> +                                    struct bcm2835_isp_node *node, int i=
ndex)
> +{
> +       struct video_device *vfd;
> +       struct vb2_queue *queue;
> +       bool is_rgb;
> +       int ret;
> +
> +       mutex_init(&node->lock);
> +       mutex_init(&node->queue_lock);
> +
> +       node->dev =3D dev;
> +       vfd =3D &node->vfd;
> +       queue =3D &node->queue;
> +       queue->type =3D index_to_queue_type(index);
> +       /*
> +        * Setup the node type-specific params.
> +        */
> +       switch (queue->type) {
> +       case V4L2_BUF_TYPE_VIDEO_OUTPUT:
> +               vfd->device_caps =3D V4L2_CAP_VIDEO_OUTPUT | V4L2_CAP_STR=
EAMING;
> +               node->id =3D index;
> +               node->vfl_dir =3D VFL_DIR_TX;
> +               node->name =3D "output";
> +               if (node->id >=3D ARRAY_SIZE(dev->component->input))
> +                       return -EINVAL;
> +               node->port =3D &dev->component->input[node->id];
> +               break;
> +       case V4L2_BUF_TYPE_VIDEO_CAPTURE:
> +               vfd->device_caps =3D V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_ST=
REAMING;
> +               /* First Capture node starts at id 0, etc. */
> +               node->id =3D index - BCM2835_ISP_NUM_OUTPUTS;
> +               node->vfl_dir =3D VFL_DIR_RX;
> +               node->name =3D "capture";
> +               if (node->id >=3D ARRAY_SIZE(dev->component->output))
> +                       return -EINVAL;
> +               node->port =3D &dev->component->output[node->id];
> +               break;
> +       case V4L2_BUF_TYPE_META_CAPTURE:
> +               vfd->device_caps =3D V4L2_CAP_META_CAPTURE | V4L2_CAP_STR=
EAMING;
> +               node->id =3D index - BCM2835_ISP_NUM_OUTPUTS;
> +               node->vfl_dir =3D VFL_DIR_RX;
> +               node->name =3D "stats";
> +               if (node->id >=3D ARRAY_SIZE(dev->component->output))
> +                       return -EINVAL;
> +               node->port =3D &dev->component->output[node->id];
> +               break;
> +       }
> +
> +       ret =3D bcm2835_isp_get_supported_fmts(node);
> +       if (ret)
> +               return ret;
> +
> +       /* Initialise the video node. */
> +       vfd->vfl_type   =3D VFL_TYPE_VIDEO;
> +       vfd->fops       =3D &bcm2835_isp_fops;
> +       vfd->ioctl_ops  =3D &bcm2835_isp_node_ioctl_ops;
> +       vfd->minor      =3D -1;
> +       vfd->release    =3D video_device_release_empty;
> +       vfd->queue      =3D &node->queue;
> +       vfd->lock       =3D &node->lock;
> +       vfd->v4l2_dev   =3D &dev->v4l2_dev;
> +       vfd->vfl_dir    =3D node->vfl_dir;
> +
> +       node->q_data.fmt =3D get_default_format(node);
> +       node->q_data.width =3D DEFAULT_DIM;
> +       node->q_data.height =3D DEFAULT_DIM;
> +       node->q_data.bytesperline =3D
> +               get_bytesperline(DEFAULT_DIM, node->q_data.fmt);
> +       node->q_data.sizeimage =3D node_is_stats(node) ?
> +                                node->port->recommended_buffer.size :
> +                                get_sizeimage(node->q_data.bytesperline,
> +                                              node->q_data.width,
> +                                              node->q_data.height,
> +                                              node->q_data.fmt);
> +       node->q_data.colorspace =3D node->q_data.fmt->colorspace_default;
> +       node->q_data.ycbcr_enc =3D
> +               V4L2_MAP_YCBCR_ENC_DEFAULT(node->q_data.colorspace);
> +       node->q_data.xfer_func =3D
> +               V4L2_MAP_XFER_FUNC_DEFAULT(node->q_data.colorspace);
> +       is_rgb =3D node->q_data.colorspace =3D=3D V4L2_COLORSPACE_SRGB ||
> +               node->q_data.colorspace =3D=3D V4L2_COLORSPACE_RAW;
> +       node->q_data.quantization =3D V4L2_MAP_QUANTIZATION_DEFAULT(is_rg=
b,
> +                                                                 node->q=
_data.colorspace,
> +                                                                 node->q=
_data.ycbcr_enc);
> +
> +       queue->io_modes =3D VB2_MMAP | VB2_DMABUF;
> +       queue->drv_priv =3D node;
> +       queue->ops =3D &bcm2835_isp_node_queue_ops;
> +       queue->mem_ops =3D &vb2_dma_contig_memops;
> +       queue->buf_struct_size =3D sizeof(struct bcm2835_isp_buffer);
> +       queue->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +       queue->dev =3D dev->dev;
> +       queue->lock =3D &node->queue_lock;
> +
> +       ret =3D vb2_queue_init(queue);
> +       if (ret < 0) {
> +               v4l2_info(&dev->v4l2_dev, "vb2_queue_init failed\n");
> +               return ret;
> +       }
> +
> +       /* Define the device names */
> +       snprintf(vfd->name, sizeof(node->vfd.name), "%s-%s%d", BCM2835_IS=
P_NAME,
> +                node->name, node->id);
> +
> +       node->pad.flags =3D node_is_output(node) ? MEDIA_PAD_FL_SOURCE : =
MEDIA_PAD_FL_SINK;
> +       ret =3D media_entity_pads_init(&node->vfd.entity, 1, &node->pad);
> +       if (ret)
> +               goto queue_cleanup;
> +
> +       ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, video_nr[insta=
nce]);
> +       if (ret) {
> +               v4l2_err(&dev->v4l2_dev,
> +                        "Failed to register video %s[%d] device node\n",
> +                        node->name, node->id);
> +               goto queue_cleanup;
> +       }
> +
> +       node->registered =3D true;
> +       video_set_drvdata(vfd, node);
> +
> +       v4l2_info(&dev->v4l2_dev,
> +                 "Device node %s[%d] registered as /dev/video%d\n",
> +                 node->name, node->id, vfd->num);
> +
> +       return 0;
> +
> +queue_cleanup:
> +       vb2_queue_release(&node->queue);
> +       return ret;
> +}
> +
> +/* Unregister one of the /dev/video<N> nodes associated with the ISP. */
> +static void bcm2835_unregister_node(struct bcm2835_isp_node *node)
> +{
> +       struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> +
> +       v4l2_info(&dev->v4l2_dev,
> +                 "Unregistering node %s[%d] device node /dev/video%d\n",
> +                 node->name, node->id, node->vfd.num);
> +
> +       if (node->registered) {
> +               video_unregister_device(&node->vfd);
> +               vb2_queue_release(&node->queue);
> +       }
> +
> +       /*
> +        * node->supported_fmts.list is free'd automatically
> +        * as a managed resource.
> +        */
> +       node->supported_fmts =3D NULL;
> +       node->num_supported_fmts =3D 0;
> +       node->registered =3D false;
> +}
> +
> +static void media_controller_unregister(struct bcm2835_isp_dev *dev)
> +{
> +       v4l2_info(&dev->v4l2_dev, "Unregister from media controller\n");
> +
> +       if (dev->media_device_registered) {
> +               media_device_unregister(&dev->mdev);
> +               media_device_cleanup(&dev->mdev);
> +               dev->media_device_registered =3D false;
> +       }
> +
> +       kfree(dev->entity.name);
> +       dev->entity.name =3D NULL;
> +
> +       if (dev->media_entity_registered) {
> +               media_device_unregister_entity(&dev->entity);
> +               dev->media_entity_registered =3D false;
> +       }
> +
> +       dev->v4l2_dev.mdev =3D NULL;
> +}
> +
> +static int media_controller_register(struct bcm2835_isp_dev *dev)
> +{
> +       struct media_entity *entity;
> +       char *name;
> +       unsigned int i;
> +       int ret;
> +
> +       v4l2_dbg(2, debug, &dev->v4l2_dev, "Registering with media contro=
ller\n");
> +
> +       name =3D kmalloc(BCM2835_ISP_ENTITY_NAME_LEN, GFP_KERNEL);
> +       if (!name) {
> +               ret =3D -ENOMEM;
> +               goto done;
> +       }
> +       snprintf(name, BCM2835_ISP_ENTITY_NAME_LEN, "bcm2835-isp");
> +       dev->entity.name =3D name;
> +       dev->entity.obj_type =3D MEDIA_ENTITY_TYPE_BASE;
> +       dev->entity.function =3D MEDIA_ENT_F_PROC_VIDEO_ISP;
> +
> +       for (i =3D 0; i < BCM2835_ISP_NUM_NODES; i++) {
> +               dev->pad[i].flags =3D node_is_output(&dev->node[i]) ?
> +                                       MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_=
SOURCE;
> +       }
> +       dev->pad[BCM2835_ISP_PARAMS_PAD].flags =3D MEDIA_PAD_FL_SINK;
> +
> +       ret =3D media_entity_pads_init(&dev->entity, BCM2835_ISP_NUM_ENTI=
TY_PADS,
> +                                    dev->pad);
> +       if (ret)
> +               goto done;
> +
> +       ret =3D media_device_register_entity(&dev->mdev, &dev->entity);
> +       if (ret)
> +               goto done;
> +
> +       dev->media_entity_registered =3D true;
> +
> +       for (i =3D 0; i < BCM2835_ISP_NUM_NODES; i++) {
> +               entity =3D &dev->node[i].vfd.entity;
> +               int output =3D node_is_output(&dev->node[i]);
> +
> +               if (output)
> +                       ret =3D media_create_pad_link(entity, 0,
> +                                                   &dev->entity, i,
> +                                                   MEDIA_LNK_FL_IMMUTABL=
E |
> +                                                   MEDIA_LNK_FL_ENABLED);
> +               else
> +                       ret =3D media_create_pad_link(&dev->entity, i,
> +                                                   entity, 0,
> +                                                   MEDIA_LNK_FL_IMMUTABL=
E |
> +                                                   MEDIA_LNK_FL_ENABLED);
> +               if (ret)
> +                       goto done;
> +       }
> +
> +       entity =3D &dev->params->vdev.entity;
> +       ret =3D media_create_pad_link(entity, 0, &dev->entity, BCM2835_IS=
P_PARAMS_PAD,
> +                                   MEDIA_LNK_FL_IMMUTABLE |
> +                                   MEDIA_LNK_FL_ENABLED);
> +       if (ret)
> +               goto done;
> +
> +       ret =3D media_device_register(&dev->mdev);
> +       if (!ret)
> +               dev->media_device_registered =3D true;
> +done:
> +       return ret;
> +}
> +
> +static void bcm2835_isp_remove_instance(struct bcm2835_isp_dev *dev)
> +{
> +       unsigned int i;
> +
> +       if (!IS_ERR_OR_NULL(dev->params))
> +               bcm2835_isp_params_unregister(dev->params);
> +
> +       for (i =3D 0; i < BCM2835_ISP_NUM_NODES; i++)
> +               bcm2835_unregister_node(&dev->node[i]);
> +
> +       v4l2_device_unregister(&dev->v4l2_dev);
> +       media_controller_unregister(dev);
> +
> +       if (dev->component)
> +               vchiq_mmal_component_finalise(dev->mmal_instance,
> +                                             dev->component);
> +
> +       vchiq_mmal_finalise(dev->mmal_instance);
> +}
> +
> +static int bcm2835_isp_probe_instance(struct vchiq_device *device,
> +                                     struct bcm2835_isp_dev **dev_int,
> +                                     unsigned int instance)
> +{
> +       struct bcm2835_isp_dev *dev;
> +       unsigned int i;
> +       int ret;
> +
> +       dev =3D devm_kzalloc(&device->dev, sizeof(*dev), GFP_KERNEL);
> +       if (!dev)
> +               return -ENOMEM;
> +
> +       *dev_int =3D dev;
> +       dev->dev =3D &device->dev;
> +       dev->mdev.dev =3D &device->dev;
> +
> +       strscpy(dev->mdev.model, BCM2835_ISP_NAME, sizeof(dev->mdev.model=
));
> +       snprintf(dev->mdev.bus_info, sizeof(dev->mdev.bus_info), "platfor=
m:%s",
> +                BCM2835_ISP_NAME);
> +       media_device_init(&dev->mdev);
> +
> +       dev->v4l2_dev.mdev =3D &dev->mdev;
> +
> +       ret =3D v4l2_device_register(&device->dev, &dev->v4l2_dev);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D vchiq_mmal_init(&device->dev, &dev->mmal_instance);
> +       if (ret) {
> +               v4l2_device_unregister(&dev->v4l2_dev);
> +               return ret;
> +       }
> +
> +       ret =3D vchiq_mmal_component_init(dev->mmal_instance, "ril.isp",
> +                                       &dev->component);
> +       if (ret) {
> +               v4l2_err(&dev->v4l2_dev,
> +                        "%s: failed to create ril.isp component\n", __fu=
nc__);
> +               return ret;
> +       }
> +
> +       if (dev->component->inputs < BCM2835_ISP_NUM_OUTPUTS ||
> +           dev->component->outputs < BCM2835_ISP_NUM_CAPTURES +
> +                                       BCM2835_ISP_NUM_METADATA) {
> +               v4l2_err(&dev->v4l2_dev,
> +                        "%s: ril.isp returned %d i/p (%d expected), %d o=
/p (%d expected) ports\n",
> +                         __func__, dev->component->inputs,
> +                         BCM2835_ISP_NUM_OUTPUTS,
> +                         dev->component->outputs,
> +                         BCM2835_ISP_NUM_CAPTURES + BCM2835_ISP_NUM_META=
DATA);
> +               return -EINVAL;
> +       }
> +
> +       atomic_set(&dev->num_streaming, 0);
> +
> +       for (i =3D 0; i < BCM2835_ISP_NUM_NODES; i++) {
> +               struct bcm2835_isp_node *node =3D &dev->node[i];
> +
> +               ret =3D bcm2835_isp_register_node(dev, instance, node, i);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       /* Register extensible params node */
> +       dev->params =3D bcm2835_isp_params_register(&dev->v4l2_dev, dev->=
dev,
> +                                                 dev->mmal_instance,
> +                                                 &dev->component->input[=
0],
> +                                                 video_nr[instance] + BC=
M2835_ISP_NUM_NODES);
> +       if (IS_ERR(dev->params))
> +               return PTR_ERR(dev->params);
> +
> +       ret =3D media_controller_register(dev);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static void bcm2835_isp_remove(struct vchiq_device *device)
> +{
> +       struct bcm2835_isp_dev **bcm2835_isp_instances;
> +       unsigned int i;
> +
> +       bcm2835_isp_instances =3D vchiq_get_drvdata(device);
> +       for (i =3D 0; i < BCM2835_ISP_NUM_INSTANCES; i++) {
> +               if (bcm2835_isp_instances[i])
> +                       bcm2835_isp_remove_instance(bcm2835_isp_instances=
[i]);
> +       }
> +}
> +
> +static int bcm2835_isp_probe(struct vchiq_device *device)
> +{
> +       struct bcm2835_isp_dev **bcm2835_isp_instances;
> +       unsigned int i;
> +       int ret;
> +
> +       ret =3D dma_set_mask_and_coherent(&device->dev, DMA_BIT_MASK(32));
> +       if (ret) {
> +               dev_err(&device->dev, "dma_set_mask_and_coherent failed: =
%d\n",
> +                       ret);
> +               return ret;
> +       }
> +
> +       bcm2835_isp_instances =3D devm_kzalloc(&device->dev,
> +                                            sizeof(*bcm2835_isp_instance=
s) *
> +                                                     BCM2835_ISP_NUM_INS=
TANCES,
> +                                            GFP_KERNEL);
> +       if (!bcm2835_isp_instances)
> +               return -ENOMEM;
> +
> +       vchiq_set_drvdata(device, bcm2835_isp_instances);
> +
> +       for (i =3D 0; i < BCM2835_ISP_NUM_INSTANCES; i++) {
> +               ret =3D bcm2835_isp_probe_instance(device,
> +                                                &bcm2835_isp_instances[i=
], i);
> +               if (ret)
> +                       goto error;
> +       }
> +
> +       dev_info(&device->dev, "Loaded V4L2 %s\n", BCM2835_ISP_NAME);
> +       return 0;
> +
> +error:
> +       bcm2835_isp_remove(device);
> +
> +       return ret;
> +}
> +
> +static struct vchiq_device_id device_id_table[] =3D {
> +       { .name =3D "bcm2835-isp" },
> +       {}
> +};
> +MODULE_DEVICE_TABLE(vchiq, device_id_table);
> +
> +static struct vchiq_driver bcm2835_isp_drv =3D {
> +       .probe =3D bcm2835_isp_probe,
> +       .remove =3D bcm2835_isp_remove,
> +       .id_table =3D device_id_table,
> +       .driver =3D {
> +               .name =3D BCM2835_ISP_NAME,
> +       },
> +};
> +
> +module_vchiq_driver(bcm2835_isp_drv);
> +
> +MODULE_DESCRIPTION("BCM2835 ISP driver");
> +MODULE_AUTHOR("Naushir Patuck <naush@raspberrypi.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index 17ba1ae70735..1449de2b64b5 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1490,6 +1490,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
>         case V4L2_META_FMT_GENERIC_CSI2_16:     descr =3D "8-bit Generic =
Meta, 16b CSI-2"; break;
>         case V4L2_META_FMT_GENERIC_CSI2_20:     descr =3D "8-bit Generic =
Meta, 20b CSI-2"; break;
>         case V4L2_META_FMT_GENERIC_CSI2_24:     descr =3D "8-bit Generic =
Meta, 24b CSI-2"; break;
> +       case V4L2_META_FMT_BCM2835_ISP_STATS: descr =3D "BCM2835 ISP Imag=
e Statistics"; break;
> +       case V4L2_META_FMT_BCM2835_ISP_PARAMS: descr =3D "BCM2835 ISP Con=
fig Parameters"; break;
> =20
>         default:
>                 /* Compressed formats */
> diff --git a/include/linux/raspberrypi/mmal-parameters.h b/include/linux/=
raspberrypi/mmal-parameters.h
> index 6ae5a7a1932c..f0e2ec025b70 100644
> --- a/include/linux/raspberrypi/mmal-parameters.h
> +++ b/include/linux/raspberrypi/mmal-parameters.h
> @@ -23,6 +23,8 @@
>  #define MMAL_PARAMETERS_H
> =20
>  #include <linux/math.h>
> +#include <linux/stddef.h>
> +#include <uapi/linux/bcm2835-isp.h>
> =20
>  /** Common parameter ID group, used with many types of component. */
>  #define MMAL_PARAMETER_GROUP_COMMON            (0 << 16)
> @@ -279,8 +281,14 @@ enum mmal_parameter_camera_type {
>         MMAL_PARAMETER_DPC,
>                 /**< Tales a @ref MMAP_PARAMETER_GAMMA_T */
>         MMAL_PARAMETER_GAMMA,
> +
> +       /* 0x60 */
>                 /**< Takes a @ref MMAL_PARAMETER_CDN_T */
>         MMAL_PARAMETER_CDN,
> +               /**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
> +       MMAL_PARAMETER_JPEG_IJG_SCALING,
> +               /**< Takes a @ref MMAL_PARAMETER_ISP_SETTINGS_T */
> +       MMAL_PARAMETER_ISP_SETTINGS,
>  };
> =20
>  enum mmal_parameter_camera_config_timestamp_mode {
> @@ -819,20 +827,143 @@ enum mmal_parameter_ls_gain_format_type {
>         MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_DUMMY  =3D 0x7FFFFFFF
>  };
> =20
> -struct mmal_parameter_lens_shading_v2 {
> -       u32 enabled;
> -       u32 grid_cell_size;
> -       u32 grid_width;
> -       u32 grid_stride;
> -       u32 grid_height;
> -       u32 mem_handle_table;
> -       u32 ref_transform;
> -       u32 corner_sampled;
> -       enum mmal_parameter_ls_gain_format_type gain_format;
> -};
> -
>  struct mmal_parameter_crop {
>         struct vchiq_mmal_rect rect;
>  };
> =20
> +struct mmal_parameter_isp_parameters {
> +       struct {
> +               /* Black level */
> +               u32 update;
> +
> +               struct_group(payload,
> +                       u32 enable;
> +                       u16 black_level_r;
> +                       u16 black_level_g;
> +                       u16 black_level_b;
> +                       u8 padding[2];
> +               );
> +       } black_level;
> +
> +       struct {
> +               /* GEQ */
> +               u32 update;
> +
> +               struct_group(payload,
> +                       u32 enable;
> +                       u32 offset;
> +                       struct bcm2835_isp_rational slope;
> +                       u8 padding[4];
> +               );
> +       } green_eq;
> +
> +       struct {
> +               /* Gamma */
> +               u32 update;
> +
> +               struct_group(payload,
> +                       u32 enable;
> +                       u16 X[BCM2835_NUM_GAMMA_PTS];
> +                       u16 Y[BCM2835_NUM_GAMMA_PTS];
> +               );
> +       } gamma;
> +
> +       struct {
> +               /* Denoise */
> +               u32 update;
> +
> +               struct_group(payload,
> +                       u32 enable;
> +                       u32 constant;
> +                       struct bcm2835_isp_rational slope;
> +                       struct bcm2835_isp_rational strength;
> +                       u8 padding[4];
> +               );
> +       } denoise;
> +
> +       struct {
> +               /* Sharpen */
> +               u32 update;
> +
> +               struct_group(payload,
> +                       u32 enable;
> +                       struct bcm2835_isp_rational threshold;
> +                       struct bcm2835_isp_rational strength;
> +                       struct bcm2835_isp_rational limit;
> +               );
> +       } sharpen;
> +
> +       struct {
> +               /* Defective Pixel Correction */
> +               u32 update;
> +
> +               struct_group(payload,
> +                       u32 enable;
> +                       u32 strength;
> +                       u8 padding[4];
> +               );
> +       } dpc;
> +
> +       struct {
> +               /* Colour denoise */
> +               u32 update;
> +
> +               struct_group(payload,
> +                       u32 enable;
> +                       u32 mode;
> +                       u8 padding[4];
> +               );
> +       } colour_denoise;
> +
> +       struct {
> +               /* CCM */
> +               u32 update;
> +
> +               struct_group(payload,
> +                       u32 enable;
> +                       struct bcm2835_isp_ccm ccm;
> +                       u8 padding[4];
> +               );
> +       } ccm;
> +
> +       struct {
> +               /* Lens shading */
> +               u32 update;
> +
> +               struct_group(payload,
> +                       u32 enabled;
> +                       u32 grid_cell_size;
> +                       u32 grid_width;
> +                       u32 grid_stride;
> +                       u32 grid_height;
> +                       u32 mem_handle_table;
> +                       u32 ref_transform;
> +                       u32 corner_sampled;
> +                       enum mmal_parameter_ls_gain_format_type gain_form=
at;
> +                       u8 padding[4];
> +               );
> +       } lens_shading;
> +
> +       struct {
> +               /* AWB Gains */
> +               u32 update;
> +
> +               struct_group(payload,
> +                       struct bcm2835_isp_rational r_gain;
> +                       struct bcm2835_isp_rational b_gain;
> +                       u8 padding[4];
> +               );
> +       } awb_gains;
> +
> +       struct {
> +               /* Digital Gain */
> +               u32 update;
> +
> +               struct_group(payload,
> +                       struct bcm2835_isp_rational value;
> +                       u8 padding[4];
> +               );
> +       } digital_gain;
> +};
> +
>  #endif
> diff --git a/include/uapi/linux/bcm2835-isp.h b/include/uapi/linux/bcm283=
5-isp.h
> new file mode 100644
> index 000000000000..d15a4ed18404
> --- /dev/null
> +++ b/include/uapi/linux/bcm2835-isp.h
> @@ -0,0 +1,530 @@
> +/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR BSD-3=
-Clause) */
> +/*
> + * bcm2835-isp.h
> + *
> + * BCM2835 ISP driver - user space header file.
> + *
> + * Copyright =C2=A9 2019-2026 Raspberry Pi (Trading) Ltd.
> + *
> + * Author: Naushir Patuck (naush@raspberrypi.com)
> + *
> + */
> +
> +#ifndef __BCM2835_ISP_H_
> +#define __BCM2835_ISP_H_
> +
> +#include <linux/media/v4l2-isp.h>
> +
> +/*
> + * All structs below are directly mapped from struct
> + * mmal_parameter_isp_parameters in include/linux/raspberrypi/mmal-param=
eters.h
> + * for convenience.
> + */
> +
> +/**
> + * struct bcm2835_isp_rational - Rational value type.
> + *
> + * @num:       Numerator.
> + * @den:       Denominator.
> + */
> +struct bcm2835_isp_rational {
> +       __s32 num;
> +       __u32 den;
> +};
> +
> +/**
> + * struct bcm2835_isp_ccm - Colour correction matrix.
> + *
> + * @ccm:       3x3 correction matrix coefficients.
> + * @offsets:   1x3 correction offsets.
> + */
> +struct bcm2835_isp_ccm {
> +       struct bcm2835_isp_rational ccm[3][3];
> +       __s32 offsets[3];
> +};
> +
> +/**
> + * struct bcm2835_isp_custom_ccm - Custom CCM configuration.
> + *
> + * @enabled:   Enable custom CCM.
> + * @ccm:       Custom CCM coefficients and offsets.
> + */
> +struct bcm2835_isp_custom_ccm {
> +       __u32 enabled;
> +       struct bcm2835_isp_ccm ccm;
> +};
> +
> +/**
> + * enum bcm2835_isp_gain_format - format of the gains in the lens shading
> + *                               tables.
> + *
> + * @GAIN_FORMAT_U0P8_1:                Gains are u0.8 format, starting a=
t 1.0
> + * @GAIN_FORMAT_U1P7_0:                Gains are u1.7 format, starting a=
t 0.0
> + * @GAIN_FORMAT_U1P7_1:                Gains are u1.7 format, starting a=
t 1.0
> + * @GAIN_FORMAT_U2P6_0:                Gains are u2.6 format, starting a=
t 0.0
> + * @GAIN_FORMAT_U2P6_1:                Gains are u2.6 format, starting a=
t 1.0
> + * @GAIN_FORMAT_U3P5_0:                Gains are u3.5 format, starting a=
t 0.0
> + * @GAIN_FORMAT_U3P5_1:                Gains are u3.5 format, starting a=
t 1.0
> + * @GAIN_FORMAT_U4P10:         Gains are u4.10 format, starting at 0.0
> + */
> +enum bcm2835_isp_gain_format {
> +       GAIN_FORMAT_U0P8_1 =3D 0,
> +       GAIN_FORMAT_U1P7_0 =3D 1,
> +       GAIN_FORMAT_U1P7_1 =3D 2,
> +       GAIN_FORMAT_U2P6_0 =3D 3,
> +       GAIN_FORMAT_U2P6_1 =3D 4,
> +       GAIN_FORMAT_U3P5_0 =3D 5,
> +       GAIN_FORMAT_U3P5_1 =3D 6,
> +       GAIN_FORMAT_U4P10  =3D 7,
> +};
> +
> +/**
> + * struct bcm2835_isp_lens_shading - Lens shading tables.
> + *
> + * @enabled:           Enable lens shading.
> + * @grid_cell_size:    Size of grid cells in samples (16, 32, 64, 128 or=
 256).
> + * @grid_width:                Width of lens shading tables in grid cell=
s.
> + * @grid_stride:       Row to row distance (in grid cells) between grid =
cells
> + *                     in the same horizontal location.
> + * @grid_height:       Height of lens shading tables in grid cells.
> + * @dmabuf:            dmabuf file handle containing the table.
> + * @ref_transform:     Reference transform - unsupported, please pass ze=
ro.
> + * @corner_sampled:    Whether the gains are sampled at the corner points
> + *                     of the grid cells or in the cell centres.
> + * @gain_format:       Format of the gains (see enum &bcm2835_isp_gain_f=
ormat).
> + */
> +struct bcm2835_isp_lens_shading {
> +       __u32 enabled;
> +       __u32 grid_cell_size;
> +       __u32 grid_width;
> +       __u32 grid_stride;
> +       __u32 grid_height;
> +       __s32 dmabuf;
> +       __u32 ref_transform;
> +       __u32 corner_sampled;
> +       __u32 gain_format;
> +};
> +
> +/**
> + * struct bcm2835_isp_black_level - Sensor black level configuration.
> + *
> + * @enabled:           Enable black level.
> + * @black_level_r:     Black level for red channel.
> + * @black_level_g:     Black level for green channels.
> + * @black_level_b:     Black level for blue channel.
> + * @padding:           Unused padding.
> + */
> +struct bcm2835_isp_black_level {
> +       __u32 enabled;
> +       __u16 black_level_r;
> +       __u16 black_level_g;
> +       __u16 black_level_b;
> +       __u8 padding[2]; /* Unused */
> +};
> +
> +/**
> + * struct bcm2835_isp_geq - Green equalisation parameters.
> + *
> + * @enabled:   Enable green equalisation.
> + * @offset:    Fixed offset of the green equalisation threshold.
> + * @slope:     Slope of the green equalisation threshold.
> + */
> +struct bcm2835_isp_geq {
> +       __u32 enabled;
> +       __u32 offset;
> +       struct bcm2835_isp_rational slope;
> +};
> +
> +#define BCM2835_NUM_GAMMA_PTS 33
> +
> +/**
> + * struct bcm2835_isp_gamma - Gamma parameters.
> + *
> + * @enabled:   Enable gamma adjustment.
> + * @x:         X values of the points defining the gamma curve.
> + *             Values should be scaled to 16 bits.
> + * @y:         Y values of the points defining the gamma curve.
> + *             Values should be scaled to 16 bits.
> + */
> +struct bcm2835_isp_gamma {
> +       __u32 enabled;
> +       __u16 x[BCM2835_NUM_GAMMA_PTS];
> +       __u16 y[BCM2835_NUM_GAMMA_PTS];
> +};
> +
> +/**
> + * enum bcm2835_isp_cdn_mode - Mode of operation for colour denoise.
> + *
> + * @CDN_MODE_FAST:             Fast (but lower quality) colour denoise
> + *                             algorithm, typically used for video recor=
ding.
> + * @CDN_MODE_HIGH_QUALITY:     High quality (but slower) colour denoise
> + *                             algorithm, typically used for stills capt=
ure.
> + */
> +enum bcm2835_isp_cdn_mode {
> +       CDN_MODE_FAST =3D 0,
> +       CDN_MODE_HIGH_QUALITY =3D 1,
> +};
> +
> +/**
> + * struct bcm2835_isp_cdn - Colour denoise parameters.
> + *
> + * @enabled:   Enable colour denoise.
> + * @mode:      Colour denoise operating mode (see enum &bcm2835_isp_cdn_=
mode)
> + */
> +struct bcm2835_isp_cdn {
> +       __u32 enabled;
> +       __u32 mode;
> +};
> +
> +/**
> + * struct bcm2835_isp_denoise - Denoise parameters.
> + *
> + * @enabled:   Enable denoise.
> + * @constant:  Fixed offset of the noise threshold.
> + * @slope:     Slope of the noise threshold.
> + * @strength:  Denoise strength between 0.0 (off) and 1.0 (maximum).
> + */
> +struct bcm2835_isp_denoise {
> +       __u32 enabled;
> +       __u32 constant;
> +       struct bcm2835_isp_rational slope;
> +       struct bcm2835_isp_rational strength;
> +};
> +
> +/**
> + * struct bcm2835_isp_sharpen - Sharpen parameters.
> + *
> + * @enabled:   Enable sharpening.
> + * @threshold: Threshold at which to start sharpening pixels.
> + * @strength:  Strength with which pixel sharpening increases.
> + * @limit:     Limit to the amount of sharpening applied.
> + */
> +struct bcm2835_isp_sharpen {
> +       __u32 enabled;
> +       struct bcm2835_isp_rational threshold;
> +       struct bcm2835_isp_rational strength;
> +       struct bcm2835_isp_rational limit;
> +};
> +
> +/**
> + * enum bcm2835_isp_dpc_mode - defective pixel correction (DPC) strength.
> + *
> + * @DPC_MODE_OFF:              No DPC.
> + * @DPC_MODE_NORMAL:           Normal DPC.
> + * @DPC_MODE_STRONG:           Strong DPC.
> + */
> +enum bcm2835_isp_dpc_mode {
> +       DPC_MODE_OFF =3D 0,
> +       DPC_MODE_NORMAL =3D 1,
> +       DPC_MODE_STRONG =3D 2,
> +};
> +
> +/**
> + * struct bcm2835_isp_dpc - Defective pixel correction (DPC) parameters.
> + *
> + * @enabled:   Enable DPC.
> + * @strength:  DPC strength (see enum &bcm2835_isp_dpc_mode).
> + */
> +struct bcm2835_isp_dpc {
> +       __u32 enabled;
> +       __u32 strength;
> +};
> +
> +/**
> + * struct bcm2835_isp_awb_gains - AWB gains configuration.
> + *
> + * @r_gain:    Red channel AWB gain.
> + * @b_gain:    Blue channel AWB gain.
> + */
> +struct bcm2835_isp_awb_gains {
> +       struct bcm2835_isp_rational r_gain;
> +       struct bcm2835_isp_rational b_gain;
> +};
> +
> +/**
> + * struct bcm2835_isp_digital_gain - Digital gain configuration.
> + *
> + * @gain:      Digital gain value.
> + */
> +struct bcm2835_isp_digital_gain {
> +       struct bcm2835_isp_rational gain;
> +};
> +
> +/*
> + * BCM2835 ISP extensible parameters buffer definitions.
> + *
> + * The extensible parameters mechanism allows userspace to submit ISP
> + * configuration parameters as a buffer containing a series of tagged
> + * blocks rather than individual V4L2 controls. This enables atomic
> + * application of multiple parameters in a single operation.
> + */
> +
> +/**
> + * enum bcm2835_isp_param_buffer_version - BCM2835 ISP parameters buffer=
 version
> + *
> + * @BCM2835_ISP_PARAM_BUFFER_V1: First version of parameters buffer form=
at
> + */
> +enum bcm2835_isp_param_buffer_version {
> +       BCM2835_ISP_PARAM_BUFFER_V1 =3D V4L2_ISP_PARAMS_VERSION_V1,
> +};
> +
> +/**
> + * enum bcm2835_isp_param_block_type - BCM2835 ISP parameter block types
> + *
> + * This enumeration defines the types of parameters blocks that can be
> + * included in the extensible parameters buffer. Each block type corresp=
onds
> + * to a specific ISP processing block configuration.
> + *
> + * @BCM2835_ISP_PARAM_BLOCK_BLACK_LEVEL: Black level configuration
> + * @BCM2835_ISP_PARAM_BLOCK_GEQ: Green equalisation configuration
> + * @BCM2835_ISP_PARAM_BLOCK_GAMMA: Gamma curve configuration
> + * @BCM2835_ISP_PARAM_BLOCK_DENOISE: Denoise configuration
> + * @BCM2835_ISP_PARAM_BLOCK_SHARPEN: Sharpening configuration
> + * @BCM2835_ISP_PARAM_BLOCK_DPC: Defective pixel correction configuration
> + * @BCM2835_ISP_PARAM_BLOCK_CDN: Colour denoise configuration
> + * @BCM2835_ISP_PARAM_BLOCK_CC_MATRIX: Colour correction matrix configur=
ation
> + * @BCM2835_ISP_PARAM_BLOCK_LENS_SHADING: Lens shading table configurati=
on
> + * @BCM2835_ISP_PARAM_BLOCK_AWB_GAINS: AWB gains configuration
> + * @BCM2835_ISP_PARAM_BLOCK_DIGITAL_GAIN: Digital gain configuration
> + */
> +enum bcm2835_isp_param_block_type {
> +       BCM2835_ISP_PARAM_BLOCK_BLACK_LEVEL,
> +       BCM2835_ISP_PARAM_BLOCK_GEQ,
> +       BCM2835_ISP_PARAM_BLOCK_GAMMA,
> +       BCM2835_ISP_PARAM_BLOCK_DENOISE,
> +       BCM2835_ISP_PARAM_BLOCK_SHARPEN,
> +       BCM2835_ISP_PARAM_BLOCK_DPC,
> +       BCM2835_ISP_PARAM_BLOCK_CDN,
> +       BCM2835_ISP_PARAM_BLOCK_CC_MATRIX,
> +       BCM2835_ISP_PARAM_BLOCK_LENS_SHADING,
> +       BCM2835_ISP_PARAM_BLOCK_AWB_GAINS,
> +       BCM2835_ISP_PARAM_BLOCK_DIGITAL_GAIN,
> +};
> +
> +/**
> + * struct bcm2835_isp_params_black_level - Black level parameters block
> + *
> + * @header: Block header (type =3D BCM2835_ISP_PARAM_BLOCK_BLACK_LEVEL)
> + * @black_level: Black level configuration
> + */
> +struct bcm2835_isp_params_black_level {
> +       struct v4l2_isp_params_block_header header;
> +       struct bcm2835_isp_black_level black_level;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct bcm2835_isp_params_geq - Green equalisation parameters block
> + *
> + * @header: Block header (type =3D BCM2835_ISP_PARAM_BLOCK_GEQ)
> + * @geq: Green equalisation configuration
> + */
> +struct bcm2835_isp_params_geq {
> +       struct v4l2_isp_params_block_header header;
> +       struct bcm2835_isp_geq geq;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct bcm2835_isp_params_gamma - Gamma parameters block
> + *
> + * @header: Block header (type =3D BCM2835_ISP_PARAM_BLOCK_GAMMA)
> + * @gamma: Gamma curve configuration
> + */
> +struct bcm2835_isp_params_gamma {
> +       struct v4l2_isp_params_block_header header;
> +       struct bcm2835_isp_gamma gamma;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct bcm2835_isp_params_denoise - Denoise parameters block
> + *
> + * @header: Block header (type =3D BCM2835_ISP_PARAM_BLOCK_DENOISE)
> + * @denoise: Denoise configuration
> + */
> +struct bcm2835_isp_params_denoise {
> +       struct v4l2_isp_params_block_header header;
> +       struct bcm2835_isp_denoise denoise;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct bcm2835_isp_params_sharpen - Sharpen parameters block
> + *
> + * @header: Block header (type =3D BCM2835_ISP_PARAM_BLOCK_SHARPEN)
> + * @sharpen: Sharpening configuration
> + */
> +struct bcm2835_isp_params_sharpen {
> +       struct v4l2_isp_params_block_header header;
> +       struct bcm2835_isp_sharpen sharpen;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct bcm2835_isp_params_dpc - Defective pixel correction parameters=
 block
> + *
> + * @header: Block header (type =3D BCM2835_ISP_PARAM_BLOCK_DPC)
> + * @dpc: DPC configuration
> + */
> +struct bcm2835_isp_params_dpc {
> +       struct v4l2_isp_params_block_header header;
> +       struct bcm2835_isp_dpc dpc;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct bcm2835_isp_params_cdn - Colour denoise parameters block
> + *
> + * @header: Block header (type =3D BCM2835_ISP_PARAM_BLOCK_CDN)
> + * @cdn: Colour denoise configuration
> + */
> +struct bcm2835_isp_params_cdn {
> +       struct v4l2_isp_params_block_header header;
> +       struct bcm2835_isp_cdn cdn;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct bcm2835_isp_params_cc_matrix - Colour correction matrix parame=
ters block
> + *
> + * @header: Block header (type =3D BCM2835_ISP_PARAM_BLOCK_CC_MATRIX)
> + * @ccm: Colour correction matrix configuration
> + */
> +struct bcm2835_isp_params_cc_matrix {
> +       struct v4l2_isp_params_block_header header;
> +       struct bcm2835_isp_custom_ccm ccm;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct bcm2835_isp_params_lens_shading - Lens shading parameters block
> + *
> + * @header: Block header (type =3D BCM2835_ISP_PARAM_BLOCK_LENS_SHADING)
> + * @ls: Lens shading configuration (includes dmabuf fd for table data)
> + */
> +struct bcm2835_isp_params_lens_shading {
> +       struct v4l2_isp_params_block_header header;
> +       struct bcm2835_isp_lens_shading ls;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct bcm2835_isp_params_awb_gains - AWB gains parameters block
> + *
> + * @header: Block header (type =3D BCM2835_ISP_PARAM_BLOCK_AWB_GAINS)
> + * @awb_gains: AWB gains configuration
> + */
> +struct bcm2835_isp_params_awb_gains {
> +       struct v4l2_isp_params_block_header header;
> +       struct bcm2835_isp_awb_gains awb_gains;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct bcm2835_isp_params_digital_gain - Digital gain parameters block
> + *
> + * @header: Block header (type =3D BCM2835_ISP_PARAM_BLOCK_DIGITAL_GAIN)
> + * @digital_gain: Digital gain configuration
> + */
> +struct bcm2835_isp_params_digital_gain {
> +       struct v4l2_isp_params_block_header header;
> +       struct bcm2835_isp_digital_gain digital_gain;
> +} __attribute__((aligned(8)));
> +
> +/**
> + * define BCM2835_ISP_PARAMS_MAX_SIZE - Maximum size of all ISP paramete=
rs
> + *
> + * This defines the maximum size needed to accommodate all possible para=
meter
> + * blocks in a single buffer. Drivers use this to allocate appropriately
> + * sized buffers.
> + */
> +#define BCM2835_ISP_PARAMS_MAX_SIZE                                    \
> +       (sizeof(struct bcm2835_isp_params_black_level) +                \
> +        sizeof(struct bcm2835_isp_params_geq) +                        \
> +        sizeof(struct bcm2835_isp_params_gamma) +                      \
> +        sizeof(struct bcm2835_isp_params_denoise) +                    \
> +        sizeof(struct bcm2835_isp_params_sharpen) +                    \
> +        sizeof(struct bcm2835_isp_params_dpc) +                        \
> +        sizeof(struct bcm2835_isp_params_cdn) +                        \
> +        sizeof(struct bcm2835_isp_params_cc_matrix) +                  \
> +        sizeof(struct bcm2835_isp_params_lens_shading) +               \
> +        sizeof(struct bcm2835_isp_params_awb_gains) +                  \
> +        sizeof(struct bcm2835_isp_params_digital_gain))
> +
> +/*
> + * ISP statistics structures.
> + *
> + * The bcm2835_isp_stats structure is generated at the output of the
> + * statistics node.  Note that this does not directly map onto the stati=
stics
> + * output of the ISP HW.  Instead, the MMAL firmware code maps the HW st=
atistics
> + * to the bcm2835_isp_stats structure.
> + */
> +#define DEFAULT_AWB_REGIONS_X 16
> +#define DEFAULT_AWB_REGIONS_Y 12
> +
> +#define NUM_HISTOGRAMS 2
> +#define NUM_HISTOGRAM_BINS 128
> +#define AWB_REGIONS (DEFAULT_AWB_REGIONS_X * DEFAULT_AWB_REGIONS_Y)
> +#define FLOATING_REGIONS 16
> +#define AGC_REGIONS 16
> +#define FOCUS_REGIONS 12
> +
> +/**
> + * struct bcm2835_isp_stats_hist - Histogram statistics
> + *
> + * @r_hist:    Red channel histogram.
> + * @g_hist:    Combined green channel histogram.
> + * @b_hist:    Blue channel histogram.
> + */
> +struct bcm2835_isp_stats_hist {
> +       __u32 r_hist[NUM_HISTOGRAM_BINS];
> +       __u32 g_hist[NUM_HISTOGRAM_BINS];
> +       __u32 b_hist[NUM_HISTOGRAM_BINS];
> +};
> +
> +/**
> + * struct bcm2835_isp_stats_region - Region sums.
> + *
> + * @counted:   The number of 2x2 bayer tiles accumulated.
> + * @notcounted:        The number of 2x2 bayer tiles not accumulated.
> + * @r_sum:     Total sum of counted pixels in the red channel for a regi=
on.
> + * @g_sum:     Total sum of counted pixels in the green channel for a re=
gion.
> + * @b_sum:     Total sum of counted pixels in the blue channel for a reg=
ion.
> + */
> +struct bcm2835_isp_stats_region {
> +       __u32 counted;
> +       __u32 notcounted;
> +       __u64 r_sum;
> +       __u64 g_sum;
> +       __u64 b_sum;
> +};
> +
> +/**
> + * struct bcm2835_isp_stats_focus - Focus statistics.
> + *
> + * @contrast_val:      Focus measure - accumulated output of the focus f=
ilter.
> + *                     In the first dimension, index [0] counts pixels b=
elow a
> + *                     preset threshold, and index [1] counts pixels abo=
ve the
> + *                     threshold.  In the second dimension, index [0] us=
es the
> + *                     first predefined filter, and index [1] uses the s=
econd
> + *                     predefined filter.
> + * @contrast_val_num:  The number of counted pixels in the above accumul=
ation.
> + */
> +struct bcm2835_isp_stats_focus {
> +       __u64 contrast_val[2][2];
> +       __u32 contrast_val_num[2][2];
> +};
> +
> +/**
> + * struct bcm2835_isp_stats - ISP statistics.
> + *
> + * @version:           Version of the bcm2835_isp_stats structure.
> + * @size:              Size of the bcm2835_isp_stats structure.
> + * @hist:              Histogram statistics for the entire image.
> + * @awb_stats:         Statistics for the regions defined for AWB calcul=
ations.
> + * @floating_stats:    Statistics for arbitrarily placed (floating) regi=
ons.
> + * @agc_stats:         Statistics for the regions defined for AGC calcul=
ations.
> + * @focus_stats:       Focus filter statistics for the focus regions.
> + */
> +struct bcm2835_isp_stats {
> +       __u32 version;
> +       __u32 size;
> +       struct bcm2835_isp_stats_hist hist[NUM_HISTOGRAMS];
> +       struct bcm2835_isp_stats_region awb_stats[AWB_REGIONS];
> +       struct bcm2835_isp_stats_region floating_stats[FLOATING_REGIONS];
> +       struct bcm2835_isp_stats_region agc_stats[AGC_REGIONS];
> +       struct bcm2835_isp_stats_focus focus_stats[FOCUS_REGIONS];
> +};
> +
> +#endif /* __BCM2835_ISP_H_ */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 5373dba640fa..f98977138d9c 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -870,6 +870,8 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4X=
X Payload Header metadata */
>  #define V4L2_META_FMT_UVC_MSXU_1_5  v4l2_fourcc('U', 'V', 'C', 'M') /* U=
VC MSXU metadata */
>  #define V4L2_META_FMT_VIVID      v4l2_fourcc('V', 'I', 'V', 'D') /* Vivi=
d Metadata */
> +#define V4L2_META_FMT_BCM2835_ISP_STATS v4l2_fourcc('B', 'S', 'T', 'A') =
/* BCM2835 ISP stats */
> +#define V4L2_META_FMT_BCM2835_ISP_PARAMS v4l2_fourcc('B', 'C', 'M', 'P')=
 /* BCM2835 ISP params */
> =20
>  /* Vendor specific - used for RK_ISP1 camera sub-system */
>  #define V4L2_META_FMT_RK_ISP1_PARAMS   v4l2_fourcc('R', 'K', '1', 'P') /=
* Rockchip ISP1 3A Parameters */
>=20
> --=20
> 2.55.0
>
