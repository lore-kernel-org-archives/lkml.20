Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5753B14B8;
	Mon, 31 Aug 2026 06:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788157819; cv=none; b=dJh00HDxe73JQgiEFP9JDjGL+ZDgwG+mvP2m9I2sbS8b7ymVYqkqdBvTz61w3qr6XXMNxNS0As7a0VN3+aUadWqRjWBNg8xNXSiPz4B83cOEC4wV8z/dZSbagSCBdeoBgVM0XcFR04ie0074dscjY04LBfeRHZgRnHWsBc5O2s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788157819; c=relaxed/simple;
	bh=mt1oKy0k0nwqQt1tKrXW8HlHWuVipRDzbr2Yn/QtZls=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=b6kJzN65biDipOYMlbvBZV7teOcpFUeCi63vojy9FRAj6+7paINIAmKC//EE3+WrzMWyn6jRYW2FQ0pLXilQRVOaohpMNL5AqM4ptyz2PEt9krwUFkFaWKVELmTCf1E/29xOC6jSAX70CviF7dv1cCog/qTei4CsGnYt0WbEAQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GNpgdjxw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GNpgdjxw"
Received: from neptunite.rasen.tech (unknown [IPv6:2400:2411:160:2f00:a9ae:3688:6dfb:71b0])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B9F3F4BB;
	Mon, 31 Aug 2026 08:28:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788157726;
	bh=mt1oKy0k0nwqQt1tKrXW8HlHWuVipRDzbr2Yn/QtZls=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GNpgdjxw152uMgw2IXlBnw0KUy5yYl7v7qsKsFXs4yABbKoyeg8j6U8Vev805Zloo
	 MRhCJkly7fHSQUNF4RGV++4SW0UM2XA/qYUGLjQ5Wk13YoW7Lj22i4q4ihTvOyY6e1
	 EutaTLDnH1A+8BmnggZMpc0QhWBK0J8RIyb0bxI0=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260717-b4-vchiq-isp-v3-4-fb8235e15c68@ideasonboard.com>
References: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com> <20260717-b4-vchiq-isp-v3-4-fb8235e15c68@ideasonboard.com>
Subject: Re: [PATCH v3 4/9] platform/raspberrypi: vchiq-mmal: Support bayer and gray formats
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, Jai Luthra <jai.luthra@ideasonboard.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Tomasz Figa <tfiga@chromium.org>
Date: Mon, 31 Aug 2026 15:30:09 +0900
Message-ID: <178815780973.1005982.10544870677125118283@neptunite.rasen.tech>
User-Agent: alot/0.0.0

Quoting Jai Luthra (2026-07-17 20:04:19)
> Raw camera sensors often send data as packed or unpacked bayer and gray
> formats, which needs to be processed by the ISP.
>=20
> Add macros to support bayer and gray format FOURCCs in the MMAL layer.
>=20
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
>  include/linux/raspberrypi/mmal-encodings.h | 64 ++++++++++++++++++++++++=
++++++
>  1 file changed, 64 insertions(+)
>=20
> diff --git a/include/linux/raspberrypi/mmal-encodings.h b/include/linux/r=
aspberrypi/mmal-encodings.h
> index eadf2e981408..1e13ebbaebf6 100644
> --- a/include/linux/raspberrypi/mmal-encodings.h
> +++ b/include/linux/raspberrypi/mmal-encodings.h
> @@ -69,6 +69,70 @@
>   */
>  #define MMAL_ENCODING_OPAQUE           MMAL_FOURCC('O', 'P', 'Q', 'V')
> =20
> +/**
> + * Bayer formats
> + * FourCC values copied from V4L2 where defined.

Is this matching a requirement? I've noticed that 12-bit packed and SBGGR16
don't match the v4l2 fourcc, but the ones that you defined are nicer.


Paul

> + */
> +/* 8 bit per pixel Bayer formats. */
> +#define MMAL_ENCODING_BAYER_SBGGR8     MMAL_FOURCC('B', 'A', '8', '1')
> +#define MMAL_ENCODING_BAYER_SGBRG8     MMAL_FOURCC('G', 'B', 'R', 'G')
> +#define MMAL_ENCODING_BAYER_SGRBG8     MMAL_FOURCC('G', 'R', 'B', 'G')
> +#define MMAL_ENCODING_BAYER_SRGGB8     MMAL_FOURCC('R', 'G', 'G', 'B')
> +
> +/* 10 bit per pixel packed Bayer formats. */
> +#define MMAL_ENCODING_BAYER_SBGGR10P   MMAL_FOURCC('p', 'B', 'A', 'A')
> +#define MMAL_ENCODING_BAYER_SGRBG10P   MMAL_FOURCC('p', 'g', 'A', 'A')
> +#define MMAL_ENCODING_BAYER_SGBRG10P   MMAL_FOURCC('p', 'G', 'A', 'A')
> +#define MMAL_ENCODING_BAYER_SRGGB10P   MMAL_FOURCC('p', 'R', 'A', 'A')
> +
> +/* 12 bit per pixel packed Bayer formats. */
> +#define MMAL_ENCODING_BAYER_SBGGR12P   MMAL_FOURCC('p', 'B', '1', '2')
> +#define MMAL_ENCODING_BAYER_SGRBG12P   MMAL_FOURCC('p', 'g', '1', '2')
> +#define MMAL_ENCODING_BAYER_SGBRG12P   MMAL_FOURCC('p', 'G', '1', '2')
> +#define MMAL_ENCODING_BAYER_SRGGB12P   MMAL_FOURCC('p', 'R', '1', '2')
> +
> +/* 14 bit per pixel packed Bayer formats. */
> +#define MMAL_ENCODING_BAYER_SBGGR14P   MMAL_FOURCC('p', 'B', 'E', 'E')
> +#define MMAL_ENCODING_BAYER_SGBRG14P   MMAL_FOURCC('p', 'G', 'E', 'E')
> +#define MMAL_ENCODING_BAYER_SGRBG14P   MMAL_FOURCC('p', 'g', 'E', 'E')
> +#define MMAL_ENCODING_BAYER_SRGGB14P   MMAL_FOURCC('p', 'R', 'E', 'E')
> +
> +/* 16 bit per pixel Bayer formats. */
> +#define MMAL_ENCODING_BAYER_SBGGR16    MMAL_FOURCC('B', 'G', '1', '6')
> +#define MMAL_ENCODING_BAYER_SGBRG16    MMAL_FOURCC('G', 'B', '1', '6')
> +#define MMAL_ENCODING_BAYER_SGRBG16    MMAL_FOURCC('G', 'R', '1', '6')
> +#define MMAL_ENCODING_BAYER_SRGGB16    MMAL_FOURCC('R', 'G', '1', '6')
> +
> +/* 10 bit per pixel unpacked (16bit) Bayer formats. */
> +#define MMAL_ENCODING_BAYER_SBGGR10    MMAL_FOURCC('B', 'G', '1', '0')
> +#define MMAL_ENCODING_BAYER_SGRBG10    MMAL_FOURCC('B', 'A', '1', '0')
> +#define MMAL_ENCODING_BAYER_SGBRG10    MMAL_FOURCC('G', 'B', '1', '0')
> +#define MMAL_ENCODING_BAYER_SRGGB10    MMAL_FOURCC('R', 'G', '1', '0')
> +
> +/* 12 bit per pixel unpacked (16bit) Bayer formats */
> +#define MMAL_ENCODING_BAYER_SBGGR12    MMAL_FOURCC('B', 'G', '1', '2')
> +#define MMAL_ENCODING_BAYER_SGRBG12    MMAL_FOURCC('B', 'A', '1', '2')
> +#define MMAL_ENCODING_BAYER_SGBRG12    MMAL_FOURCC('G', 'B', '1', '2')
> +#define MMAL_ENCODING_BAYER_SRGGB12    MMAL_FOURCC('R', 'G', '1', '2')
> +
> +/* 14 bit per pixel unpacked (16bit) Bayer formats */
> +#define MMAL_ENCODING_BAYER_SBGGR14    MMAL_FOURCC('B', 'G', '1', '4')
> +#define MMAL_ENCODING_BAYER_SGBRG14    MMAL_FOURCC('G', 'B', '1', '4')
> +#define MMAL_ENCODING_BAYER_SGRBG14    MMAL_FOURCC('G', 'R', '1', '4')
> +#define MMAL_ENCODING_BAYER_SRGGB14    MMAL_FOURCC('R', 'G', '1', '4')
> +
> +/* MIPI packed monochrome images */
> +#define MMAL_ENCODING_GREY    MMAL_FOURCC('G', 'R', 'E', 'Y')
> +#define MMAL_ENCODING_Y10P    MMAL_FOURCC('Y', '1', '0', 'P')
> +#define MMAL_ENCODING_Y12P    MMAL_FOURCC('Y', '1', '2', 'P')
> +#define MMAL_ENCODING_Y14P    MMAL_FOURCC('Y', '1', '4', 'P')
> +#define MMAL_ENCODING_Y16     MMAL_FOURCC('Y', '1', '6', ' ')
> +
> +/* Unpacked monochrome formats (16bit per sample, but only N LSBs used) =
*/
> +#define MMAL_ENCODING_Y10     MMAL_FOURCC('Y', '1', '0', ' ')
> +#define MMAL_ENCODING_Y12     MMAL_FOURCC('Y', '1', '2', ' ')
> +#define MMAL_ENCODING_Y14     MMAL_FOURCC('Y', '1', '4', ' ')
> +
>  /** An EGL image handle
>   */
>  #define MMAL_ENCODING_EGL_IMAGE        MMAL_FOURCC('E', 'G', 'L', 'I')
>=20
> --=20
> 2.54.0
>=20
>
