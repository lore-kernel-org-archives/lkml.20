Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836926;
	b=o4FVtK5QEoE7etJ6ZAAELZ8hjfujId6k89897o5V6gFww+UwZ26MfXAaSsRXzvwXi3JX
	 /Bv8lTHVLi94kX9OFAb6hxR2r4ynq7dxEsRFeshCDBUR1nTZWYKUSvj83OktztloVgegJ
	 j1QwMUAFxRWbfikbl9mizMdY93jjJ2/SvifgSuijnlw/NITHAv/4uhHsnnYols7U8ZlLS
	 xcpWBW8IHMNqeD+UuGMHbboYkUdjFJk17brVuQ38BadteGocE+ZKQu208eT1mWUewyoK4
	 ECtFU/fGz32a+mAjBzBd7nD8Tb5sq2nMS6khS4qbcoHBe8GhEYxSTgZscqFshfTXIag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836926;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=nxVt4YyYRxxKVNc+KMYqDb9BIPbjIdUmTlL/o4vo9eY=;
	b=tSsx4DcnE9TjzEN2zDUGx2TmccLaJIgmKuNiHvfc9q4e/Hwsbu2hh9tbMnNXRKMgAG41
	 1Yl3BxbXDiOJm+r9ZcNsyhbOTyXfHMx8PffHiHwVraMV/W46lGO951efAm6DBQxSolDPx
	 jWLnwc5yIMks7eeo21qZX4GFM1rCxW+2lg+qkw4dClg9bDJw226OC1fH7SER6C1B55OMl
	 RsqR8OTRdI4RemsqilO+Hx1Ih/XS9hCcOl9a769SjViEsSb61hT+ChesCoyGmNj2bbFuW
	 e6regToAm5ROmkid+2UOQAw5R9J/lCKGJ1qBv9ewSwWLvJWW00tLQGC0EgJXdugERwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b="Rav/UBnw";
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3A0606A336;
	Mon, 16 Nov 2026 13:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D3A0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=Rav/UBnw
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B59ABD0;
	Mon, 16 Nov 2026 14:46:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794836777;
	bh=7bYXZzTBQNuR8BqpISs+lRfsacB2VyLzCJFILaXKlUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rav/UBnwMDNeBWcZW5tIhhZC1Rl/wLFnI3plMwfZRhaExE6iEiP228eRIKp/0zxoi
	 A17inCbba7oFntLkXSwOvFlA14gUeqm7rHR8QTPxFXxiN0NAUCTgKkV9nt9soavCFK
	 OwAWcNJ/24+bDnomxqGvoqwV2yGKQsNZVF95GFkw=
Date: Mon, 16 Nov 2026 14:48:42 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] media: uapi: Add 24-bit bayer media bus formats
Message-ID: <avsJizTNF2Z-R1fr@zed>
References: <20260908-v4l2-add-raw-mbus-v1-0-6973bffa5b80@ragnatech.se>
 <20260908-v4l2-add-raw-mbus-v1-2-6973bffa5b80@ragnatech.se>
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
In-Reply-To: <20260908-v4l2-add-raw-mbus-v1-2-6973bffa5b80@ragnatech.se>

On Tue, Sep 08, 2026 at 10:02:57PM +0200, Niklas Söderlund wrote:
> Prepare for adding Renesas R-Car Gen5 video capture drivers which will
> support 24-bit bayer formats.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  .../userspace-api/media/v4l/subdev-formats.rst     | 132 +++++++++++++++++++++
>  include/uapi/linux/media-bus-format.h              |   6 +-
>  2 files changed, 137 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index 892562ab48de..39396931e726 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -4178,6 +4178,138 @@ organization is given as an example for the first pixel only.
>        - r\ :sub:`2`
>        - r\ :sub:`1`
>        - r\ :sub:`0`
> +    * .. _MEDIA-BUS-FMT-SBGGR24-1X24:
> +
> +      - MEDIA_BUS_FMT_SBGGR24_1X24
> +      - 0x3025
> +      -
> +      -
> +      -
> +      -
> +      -
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
> +    * .. _MEDIA-BUS-FMT-SGBRG24-1X24:
> +
> +      - MEDIA_BUS_FMT_SGBRG24_1X24
> +      - 0x3026
> +      -
> +      -
> +      -
> +      -
> +      -
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
> +    * .. _MEDIA-BUS-FMT-SGRBG24-1X24:
> +
> +      - MEDIA_BUS_FMT_SGRBG24_1X24
> +      - 0x3027
> +      -
> +      -
> +      -
> +      -
> +      -
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
> +    * .. _MEDIA-BUS-FMT-SRGGB24-1X24:
> +
> +      - MEDIA_BUS_FMT_SRGGB24_1X24
> +      - 0x3028
> +      -
> +      -
> +      -
> +      -
> +      -
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
> index 6005f033e62c..892b8c0a945e 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
> @@ -124,7 +124,7 @@
>  #define MEDIA_BUS_FMT_YUV16_1X48		0x202a
>  #define MEDIA_BUS_FMT_UYYVYY16_0_5X48		0x202b
>
> -/* Bayer - next is	0x3025 */
> +/* Bayer - next is	0x3029 */
>  #define MEDIA_BUS_FMT_SBGGR8_1X8		0x3001
>  #define MEDIA_BUS_FMT_SGBRG8_1X8		0x3013
>  #define MEDIA_BUS_FMT_SGRBG8_1X8		0x3002
> @@ -161,6 +161,10 @@
>  #define MEDIA_BUS_FMT_SGBRG20_1X20		0x3022
>  #define MEDIA_BUS_FMT_SGRBG20_1X20		0x3023
>  #define MEDIA_BUS_FMT_SRGGB20_1X20		0x3024
> +#define MEDIA_BUS_FMT_SBGGR24_1X24		0x3025
> +#define MEDIA_BUS_FMT_SGBRG24_1X24		0x3026
> +#define MEDIA_BUS_FMT_SGRBG24_1X24		0x3027
> +#define MEDIA_BUS_FMT_SRGGB24_1X24		0x3028

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

>
>  /* JPEG compressed formats - next is	0x4002 */
>  #define MEDIA_BUS_FMT_JPEG_1X8			0x4001
>
> --
> 2.55.0
>
>
