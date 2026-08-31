Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786AD361DB1;
	Mon, 31 Aug 2026 06:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788157789; cv=none; b=Ao2k/ZUpMlFWMRzFQc4X9W+9dHdDPvvDxWL1s0S+oYV562bD5qabSzoI1f3uW38B6m9jzfQMwxBxbgS2DNocXg2kQ5e3Vmzzl3LxqwVKnCbeBlX0fBB2mfQGxxnD6jUxjQo3d4gvZc2bbMBZNjHqXfqcRvTZvLrQW22c+Gg88jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788157789; c=relaxed/simple;
	bh=q4tzMqFFrTG68gV9jVQIicTtwLhwgUsDDCkj6wEKsm4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=bdlW3quSZCwc+BzQ79wWe5qbNBReTXpojQh7tV/xGhM7dcUNtc1TS2Q2uBS3f866u2ymKsJ7dP+oF8Zr6F1xKcC1oNm5jVTyUcgAaMaB0c3AwIXz4RqCJo21SEv6HI6mszzMsI8E7cZMm+6vt152sEMNTCNTmNFzkhi3YnUZdOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QKWu75+X; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QKWu75+X"
Received: from neptunite.rasen.tech (unknown [IPv6:2400:2411:160:2f00:a9ae:3688:6dfb:71b0])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 37A234BB;
	Mon, 31 Aug 2026 08:28:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788157695;
	bh=q4tzMqFFrTG68gV9jVQIicTtwLhwgUsDDCkj6wEKsm4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=QKWu75+Xf62HRGfExG8awnnFNg+v2LRI3iO22nSRNv+3EtcfOXAixkCX9H2n4cOi0
	 sRvGWaqWihmX8lBfiCwhDFWNGuYsUQJaNdLnkE/CXYa1OjX+MuQSeFPAwzKs741PvF
	 BSuPFWpoyuNqWYzEeskMkyptwBR47bTA9wAFuvLo=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260717-b4-vchiq-isp-v3-3-fb8235e15c68@ideasonboard.com>
References: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com> <20260717-b4-vchiq-isp-v3-3-fb8235e15c68@ideasonboard.com>
Subject: Re: [PATCH v3 3/9] platform/raspberrypi: vchiq-mmal: Support ISP parameters and stats
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, Jai Luthra <jai.luthra@ideasonboard.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Tomasz Figa <tfiga@chromium.org>
Date: Mon, 31 Aug 2026 15:29:38 +0900
Message-ID: <178815777880.1005982.16708040460479696081@neptunite.rasen.tech>
User-Agent: alot/0.0.0

Quoting Jai Luthra (2026-07-17 20:04:18)
> The ISP used on BCM2835 and derivative platforms is behind the VCHIQ
> bus, where some parameters and statistics are accessed through the MMAL
> layer.
>=20
> So add the relevant structures, macros and enum values.
>=20
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  include/linux/raspberrypi/mmal-encodings.h  |  4 ++
>  include/linux/raspberrypi/mmal-parameters.h | 86 +++++++++++++++++++++++=
++++++
>  2 files changed, 90 insertions(+)
>=20
> diff --git a/include/linux/raspberrypi/mmal-encodings.h b/include/linux/r=
aspberrypi/mmal-encodings.h
> index e15ae7b24f73..eadf2e981408 100644
> --- a/include/linux/raspberrypi/mmal-encodings.h
> +++ b/include/linux/raspberrypi/mmal-encodings.h
> @@ -73,6 +73,10 @@
>   */
>  #define MMAL_ENCODING_EGL_IMAGE        MMAL_FOURCC('E', 'G', 'L', 'I')
> =20
> +/** ISP image statistics format
> + */
> +#define MMAL_ENCODING_BRCM_STATS       MMAL_FOURCC('S', 'T', 'A', 'T')
> +
>  /* }@ */
> =20
>  /** \name Pre-defined audio encodings */
> diff --git a/include/linux/raspberrypi/mmal-parameters.h b/include/linux/=
raspberrypi/mmal-parameters.h
> index a0cdd28101f2..6ae5a7a1932c 100644
> --- a/include/linux/raspberrypi/mmal-parameters.h
> +++ b/include/linux/raspberrypi/mmal-parameters.h
> @@ -223,6 +223,64 @@ enum mmal_parameter_camera_type {
>         MMAL_PARAMETER_SHUTTER_SPEED,
>                 /**< Takes a @ref MMAL_PARAMETER_AWB_GAINS_T */
>         MMAL_PARAMETER_CUSTOM_AWB_GAINS,
> +               /**< Takes a @ref MMAL_PARAMETER_CAMERA_SETTINGS_T */
> +       MMAL_PARAMETER_CAMERA_SETTINGS,
> +               /**< Takes a @ref MMAL_PARAMETER_PRIVACY_INDICATOR_T */
> +       MMAL_PARAMETER_PRIVACY_INDICATOR,
> +               /**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
> +       MMAL_PARAMETER_VIDEO_DENOISE,
> +               /**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
> +       MMAL_PARAMETER_STILLS_DENOISE,
> +               /**< Takes a @ref MMAL_PARAMETER_CAMERA_ANNOTATE_T */
> +       MMAL_PARAMETER_ANNOTATE,
> +               /**< Takes a @ref MMAL_PARAMETER_STEREOSCOPIC_MODE_T */
> +       MMAL_PARAMETER_STEREOSCOPIC_MODE,
> +               /**< Takes a @ref MMAL_PARAMETER_CAMERA_INTERFACE_T */
> +       MMAL_PARAMETER_CAMERA_INTERFACE,
> +               /**< Takes a @ref MMAL_PARAMETER_CAMERA_CLOCKING_MODE_T */
> +       MMAL_PARAMETER_CAMERA_CLOCKING_MODE,
> +               /**< Takes a @ref MMAL_PARAMETER_CAMERA_RX_CONFIG_T */
> +       MMAL_PARAMETER_CAMERA_RX_CONFIG,
> +               /**< Takes a @ref MMAL_PARAMETER_CAMERA_RX_TIMING_T */
> +       MMAL_PARAMETER_CAMERA_RX_TIMING,
> +               /**< Takes a @ref MMAL_PARAMETER_UINT32_T */
> +       MMAL_PARAMETER_DPF_CONFIG,
> +
> +       /* 0x50 */
> +               /**< Takes a @ref MMAL_PARAMETER_UINT32_T */
> +       MMAL_PARAMETER_JPEG_RESTART_INTERVAL,
> +               /**< Takes a @ref MMAL_PARAMETER_UINT32_T */
> +       MMAL_PARAMETER_CAMERA_ISP_BLOCK_OVERRIDE,
> +               /**< Takes a @ref MMAL_PARAMETER_LENS_SHADING_T */
> +       MMAL_PARAMETER_LENS_SHADING_OVERRIDE,
> +               /**< Takes a @ref MMAL_PARAMETER_UINT32_T */
> +       MMAL_PARAMETER_BLACK_LEVEL,
> +               /**< Takes a @ref MMAL_PARAMETER_RESIZE_T */
> +       MMAL_PARAMETER_RESIZE_PARAMS,
> +               /**< Takes a @ref MMAL_PARAMETER_CROP_T */
> +       MMAL_PARAMETER_CROP,
> +               /**< Takes a @ref MMAL_PARAMETER_INT32_T */
> +       MMAL_PARAMETER_OUTPUT_SHIFT,
> +               /**< Takes a @ref MMAL_PARAMETER_INT32_T */
> +       MMAL_PARAMETER_CCM_SHIFT,
> +               /**< Takes a @ref MMAL_PARAMETER_CUSTOM_CCM_T */
> +       MMAL_PARAMETER_CUSTOM_CCM,
> +               /**< Takes a @ref MMAL_PARAMETER_RATIONAL_T */
> +       MMAL_PARAMETER_ANALOG_GAIN,
> +               /**< Takes a @ref MMAL_PARAMETER_RATIONAL_T */
> +       MMAL_PARAMETER_DIGITAL_GAIN,
> +               /**< Takes a @ref MMAL_PARAMETER_DENOISE_T */
> +       MMAL_PARAMETER_DENOISE,
> +               /**< Takes a @ref MMAL_PARAMETER_SHARPEN_T */
> +       MMAL_PARAMETER_SHARPEN,
> +               /**< Takes a @ref MMAL_PARAMETER_GEQ_T */
> +       MMAL_PARAMETER_GEQ,
> +               /**< Tales a @ref MMAP_PARAMETER_DPC_T */
> +       MMAL_PARAMETER_DPC,
> +               /**< Tales a @ref MMAP_PARAMETER_GAMMA_T */
> +       MMAL_PARAMETER_GAMMA,
> +               /**< Takes a @ref MMAL_PARAMETER_CDN_T */
> +       MMAL_PARAMETER_CDN,
>  };
> =20
>  enum mmal_parameter_camera_config_timestamp_mode {
> @@ -749,4 +807,32 @@ struct mmal_parameter_camera_info {
>                                 flashes[MMAL_PARAMETER_CAMERA_INFO_MAX_FL=
ASHES];
>  };
> =20
> +enum mmal_parameter_ls_gain_format_type {
> +       MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U0P8_1 =3D 0,
> +       MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U1P7_0 =3D 1,
> +       MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U1P7_1 =3D 2,
> +       MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U2P6_0 =3D 3,
> +       MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U2P6_1 =3D 4,
> +       MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U3P5_0 =3D 5,
> +       MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U3P5_1 =3D 6,
> +       MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U4P10  =3D 7,
> +       MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_DUMMY  =3D 0x7FFFFFFF
> +};
> +
> +struct mmal_parameter_lens_shading_v2 {
> +       u32 enabled;
> +       u32 grid_cell_size;
> +       u32 grid_width;
> +       u32 grid_stride;
> +       u32 grid_height;
> +       u32 mem_handle_table;
> +       u32 ref_transform;
> +       u32 corner_sampled;
> +       enum mmal_parameter_ls_gain_format_type gain_format;
> +};
> +
> +struct mmal_parameter_crop {
> +       struct vchiq_mmal_rect rect;
> +};
> +
>  #endif
>=20
> --=20
> 2.54.0
>=20
>
