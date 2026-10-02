Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738A247206F;
	Fri,  2 Oct 2026 10:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790937247; cv=none; b=DJX94krmx787xwRtgjQDpRzOqNmHNwnwS69BPwj5uPonYui4UrnbRyZ+R3Z2rx5PKba/M2Zod4R/Ehzy0VYD2M0zayev2JxASiKI3LfVmB56pqm9TuD4/WTQRjb2XQ7mwO9HcCzFmpFtO2PZZBsznYv6Ybjf239E4z/8uH7+ldw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790937247; c=relaxed/simple;
	bh=BDUDcsWafuKgArLN+mhzCG92d7iXxtCnpnblrL8p3ik=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=eQPmUXIakWfiPNkHtAVAO9Y9h8U/v1K+ej2p4Wg4xBunODdFqzYgx+C6ZUj2u13eEVt3eCfJbLC2mnFuOcnoHJQk8wds0T0yiaWiGU9nvBE8PeOuwk0v0LKI8bcyELsBMYwpdOsQ4BAEsz6vMxRAMbqsUmp8+n5RgC7gcFeC3/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vhTKI3xX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vhTKI3xX"
Received: from neptunite.rasen.tech (unknown [IPv6:2400:2411:160:2f00:337:442a:994d:7d4])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 36A265E;
	Fri,  2 Oct 2026 12:32:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790937126;
	bh=BDUDcsWafuKgArLN+mhzCG92d7iXxtCnpnblrL8p3ik=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=vhTKI3xX5MMRrF+YBxnB5SpKIRAR+2CzMzjptdxV8tTmce7xi6nj71O2xe9oSOirY
	 BnDXOwbEuKiRj662hPNvZ1rO9pd2Uu8XCS15SPvlInH5flOV2qYf79zrzU8c0SB5MV
	 NpYrvXyOZejN6MvkQPbRwLRvI9JRQNMscq4XvTic=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260917-b4-vchiq-isp-v5-5-2d8870add2c0@ideasonboard.com>
References: <20260917-b4-vchiq-isp-v5-0-2d8870add2c0@ideasonboard.com> <20260917-b4-vchiq-isp-v5-5-2d8870add2c0@ideasonboard.com>
Subject: Re: [PATCH v5 05/10] platform/raspberrypi: vchiq-mmal: Support bayer and gray formats
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, Hans Verkuil <hans@jjverkuil.nl>, Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, Jai Luthra <jai.luthra@ideasonboard.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Tomasz Figa <tfiga@chromium.org>
Date: Fri, 02 Oct 2026 19:33:53 +0900
Message-ID: <179093723372.2882041.17250388661101595740@neptunite.rasen.tech>
User-Agent: alot/0.0.0

Quoting Jai Luthra (2026-09-17 17:23:11)
> Raw camera sensors often send data as packed or unpacked bayer and gray
> formats, which needs to be processed by the ISP.
>=20
> Add macros to support bayer and gray format FOURCCs in the MMAL layer.
>=20
> Tested-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
> Changes in v4:
> - Drop comment about FourCC values being copied from V4L2

Ok, I've seen the comments from Dave. Sounds good to me.

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  include/linux/raspberrypi/mmal-encodings.h | 63 ++++++++++++++++++++++++=
++++++
>  1 file changed, 63 insertions(+)
>=20
> diff --git a/include/linux/raspberrypi/mmal-encodings.h b/include/linux/r=
aspberrypi/mmal-encodings.h
> index eadf2e981408..fd9cd840cb7b 100644
> --- a/include/linux/raspberrypi/mmal-encodings.h
> +++ b/include/linux/raspberrypi/mmal-encodings.h
> @@ -69,6 +69,69 @@
>   */
>  #define MMAL_ENCODING_OPAQUE           MMAL_FOURCC('O', 'P', 'Q', 'V')
> =20
> +/**
> + * Bayer formats
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
> 2.55.0
>
