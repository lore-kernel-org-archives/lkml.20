Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836834;
	b=3S/ovggI8XWgn27FNf9H8pDlBa7MIrLmpx+dWy39jCFCtSMYeVN7CpGsjdN61juAhZAt
	 MHKx78OGiXuoGmMHFVjzJscJkhhLi4CPP0dnj1Erk62t1vm7f1eCun8DFmV9UP0nm+BDb
	 Zaszrd0bXIAP/feuOtHhSj8AYStxCiYDOEWdfFgo1mgSchIapY/Vk2NIb7f9IYU7KfTQK
	 MEhCaKxMF9fkzZ+51In9lZWvRe8RQwwWFnI+qSe+OL2a5RSKmDOTK5wShcVsxyqOqau+D
	 8053krr4pIVEY717CJSyLKkXI/Ks5JodSIyQVrbYqsB+FEVE4DCx7X50KQ0SECS38yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836834;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=4M9X7ZMKc+crR7RXVoL0kUS1iucDAznmyXwytIMwEXM=;
	b=njChNQ3/nyevvSXuabFHHl2k4hgh2fyerquHInYZcoPqYMwcUQF//DUnXXqqCKqlT9Eq
	 o5jDwP3bY5YPwaLSWyp8chfNVnClFyWcZw/NGOhJshaAbylsz4KgonWYkemYmSROyQZqC
	 Guzo/wxd6xDRmWleX9yYhUPRk4zW8YagFvKW0J9mIqNo05Xl1y2fzFxJm6+d+vBMOezmD
	 q1NylDMyVy8hEaikKzk67Qo50W1trGA71L2PXsQ9ZdB2GJ5nEqZ3RzHF3BMk19UjxLbgg
	 dkv+ZZY1GconYGDVmVGutaTjmEFopiRONROO180OR50L9W5iPAFaDd9pQPw+qNuiqTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=ETEbqsui;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7FF606A323;
	Mon, 16 Nov 2026 13:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F7FF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=ETEbqsui
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5EE7802;
	Mon, 16 Nov 2026 14:44:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794836685;
	bh=pqvBjMuc8VwyoehexkRCJbI1K/hILuzDifjyM7ADBF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ETEbqsuiRfQJCgkGUykt1TcqIPR/en+0x+KXgXgGovBzWMuYz6T4/n6K1zkNMErDt
	 hdKd0dEJ5T9HCosHh56N4VfvyIrFF3G5rq6mP23qXNNCazAZ86PYdNBOOekz8Yw0N9
	 xclDsajqpI3G8Sjh40E0Aw1pDDfJIvR8FomgG/Z8=
Date: Mon, 16 Nov 2026 14:47:09 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] media: uapi: Add 28-bit bayer media bus formats
Message-ID: <avsIll-czY7dqVuh@zed>
References: <20260908-v4l2-add-raw-mbus-v1-0-6973bffa5b80@ragnatech.se>
 <20260908-v4l2-add-raw-mbus-v1-3-6973bffa5b80@ragnatech.se>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908-v4l2-add-raw-mbus-v1-3-6973bffa5b80@ragnatech.se>

Hi Niklas

On Tue, Sep 08, 2026 at 10:02:58PM +0200, Niklas Söderlund wrote:
> Prepare for adding Renesas R-Car Gen5 video capture drivers which will
> support 28-bit bayer formats.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  .../userspace-api/media/v4l/subdev-formats.rst     | 132 +++++++++++++++++++++
>  include/uapi/linux/media-bus-format.h              |   6 +-
>  2 files changed, 137 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index 39396931e726..d4f35f6236db 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -4310,6 +4310,138 @@ organization is given as an example for the first pixel only.
>        - r\ :sub:`2`
>        - r\ :sub:`1`
>        - r\ :sub:`0`
> +    * .. _MEDIA-BUS-FMT-SBGGR28-1X28:
> +

I wonder what the usefulness of these tables is. Not for this patch,
in general for all Bayer formats listed in subdev-formats.rst.

Data will be sent on the bus with a different organization, listing
here that a 28 bits format uses 28 bits of data doesn't tell anything
useful.

But yes, we would have to copy in the CSI-2 specs if the actuall data
organization on the bus had to be reported.

This general complaint apart, the patch itself is in line with the
existing formats documentation

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> +      - MEDIA_BUS_FMT_SBGGR28_1X28
> +      - 0x3029
> +      -
> +      - b\ :sub:`27`
> +      - b\ :sub:`26`
> +      - b\ :sub:`25`
> +      - b\ :sub:`24`
> +      - b\ :sub:`23`
> +      - b\ :sub:`22`
> +      - b\ :sub:`21`
> +      - b\ :sub:`20`
> +      - b\ :sub:`19`
> +      - b\ :sub:`18`
> +      - b\ :sub:`17`
> +      - b\ :sub:`16`
> +      - b\ :sub:`15`
> +      - b\ :sub:`14`
> +      - b\ :sub:`13`
> +      - b\ :sub:`12`
> +      - b\ :sub:`11`
> +      - b\ :sub:`10`
> +      - b\ :sub:`9`
> +      - b\ :sub:`8`
> +      - b\ :sub:`7`
> +      - b\ :sub:`6`
> +      - b\ :sub:`5`
> +      - b\ :sub:`4`
> +      - b\ :sub:`3`
> +      - b\ :sub:`2`
> +      - b\ :sub:`1`
> +      - b\ :sub:`0`
> +    * .. _MEDIA-BUS-FMT-SGBRG28-1X28:
> +
> +      - MEDIA_BUS_FMT_SGBRG28_1X28
> +      - 0x302a
> +      -
> +      - g\ :sub:`27`
> +      - g\ :sub:`26`
> +      - g\ :sub:`25`
> +      - g\ :sub:`24`
> +      - g\ :sub:`23`
> +      - g\ :sub:`22`
> +      - g\ :sub:`21`
> +      - g\ :sub:`20`
> +      - g\ :sub:`19`
> +      - g\ :sub:`18`
> +      - g\ :sub:`17`
> +      - g\ :sub:`16`
> +      - g\ :sub:`15`
> +      - g\ :sub:`14`
> +      - g\ :sub:`13`
> +      - g\ :sub:`12`
> +      - g\ :sub:`11`
> +      - g\ :sub:`10`
> +      - g\ :sub:`9`
> +      - g\ :sub:`8`
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +    * .. _MEDIA-BUS-FMT-SGRBG28-1X28:
> +
> +      - MEDIA_BUS_FMT_SGRBG28_1X28
> +      - 0x302b
> +      -
> +      - g\ :sub:`27`
> +      - g\ :sub:`26`
> +      - g\ :sub:`25`
> +      - g\ :sub:`24`
> +      - g\ :sub:`23`
> +      - g\ :sub:`22`
> +      - g\ :sub:`21`
> +      - g\ :sub:`20`
> +      - g\ :sub:`19`
> +      - g\ :sub:`18`
> +      - g\ :sub:`17`
> +      - g\ :sub:`16`
> +      - g\ :sub:`15`
> +      - g\ :sub:`14`
> +      - g\ :sub:`13`
> +      - g\ :sub:`12`
> +      - g\ :sub:`11`
> +      - g\ :sub:`10`
> +      - g\ :sub:`9`
> +      - g\ :sub:`8`
> +      - g\ :sub:`7`
> +      - g\ :sub:`6`
> +      - g\ :sub:`5`
> +      - g\ :sub:`4`
> +      - g\ :sub:`3`
> +      - g\ :sub:`2`
> +      - g\ :sub:`1`
> +      - g\ :sub:`0`
> +    * .. _MEDIA-BUS-FMT-SRGGB28-1X28:
> +
> +      - MEDIA_BUS_FMT_SRGGB28_1X28
> +      - 0x302c
> +      -
> +      - r\ :sub:`27`
> +      - r\ :sub:`26`
> +      - r\ :sub:`25`
> +      - r\ :sub:`24`
> +      - r\ :sub:`23`
> +      - r\ :sub:`22`
> +      - r\ :sub:`21`
> +      - r\ :sub:`20`
> +      - r\ :sub:`19`
> +      - r\ :sub:`18`
> +      - r\ :sub:`17`
> +      - r\ :sub:`16`
> +      - r\ :sub:`15`
> +      - r\ :sub:`14`
> +      - r\ :sub:`13`
> +      - r\ :sub:`12`
> +      - r\ :sub:`11`
> +      - r\ :sub:`10`
> +      - r\ :sub:`9`
> +      - r\ :sub:`8`
> +      - r\ :sub:`7`
> +      - r\ :sub:`6`
> +      - r\ :sub:`5`
> +      - r\ :sub:`4`
> +      - r\ :sub:`3`
> +      - r\ :sub:`2`
> +      - r\ :sub:`1`
> +      - r\ :sub:`0`
>
>  .. raw:: latex
>
> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
> index 892b8c0a945e..2b8438d936ad 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -124,7 +124,7 @@
>  #define MEDIA_BUS_FMT_YUV16_1X48		0x202a
>  #define MEDIA_BUS_FMT_UYYVYY16_0_5X48		0x202b
>
> -/* Bayer - next is	0x3029 */
> +/* Bayer - next is	0x302d */
>  #define MEDIA_BUS_FMT_SBGGR8_1X8		0x3001
>  #define MEDIA_BUS_FMT_SGBRG8_1X8		0x3013
>  #define MEDIA_BUS_FMT_SGRBG8_1X8		0x3002
> @@ -165,6 +165,10 @@
>  #define MEDIA_BUS_FMT_SGBRG24_1X24		0x3026
>  #define MEDIA_BUS_FMT_SGRBG24_1X24		0x3027
>  #define MEDIA_BUS_FMT_SRGGB24_1X24		0x3028
> +#define MEDIA_BUS_FMT_SBGGR28_1X28		0x3029
> +#define MEDIA_BUS_FMT_SGBRG28_1X28		0x302a
> +#define MEDIA_BUS_FMT_SGRBG28_1X28		0x302b
> +#define MEDIA_BUS_FMT_SRGGB28_1X28		0x302c
>
>  /* JPEG compressed formats - next is	0x4002 */
>  #define MEDIA_BUS_FMT_JPEG_1X8			0x4001
>
> --
> 2.55.0
>
>
