Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794479885;
	b=AmolCigjykApgIPLbobRrcxIPJDKVeJV23BAV2v06BODI77L+78JKl+SzR+WePowX1dY
	 zJOZWSGAYfaotfBwLl+SmQljWc+lK8P170442pjK/t5gxjtwdPFWk0rqkQSaTNj1ubtKR
	 hvISNnWn7OsqMqF/Zgcw33IZKff2vUyTC9RobqD1ZNvNDIO4JzcaYuAhgSs5aSwReEdki
	 IOpRf3CSyCuloksYgXBs2KSgMhe4/QCu7/2B/z4DxI25TexruMjU/89FGeZS9x/hD9USN
	 bfjwDaiRkha28fxcJjvKO60fMLeujIVLzoHma7R8+yjdLCYvW6eCW6q7BmVdOVm1t8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479885;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=e06tbvs21rVw27ehHokZ6i9Zda3pcWwEavvs9Rfyg4c=;
	b=zaxRjKFlr+zbcY07OuwYRGVocKVDtLJBnzyw5ddDAmZjmJECHynLSS/vNSAlkeK3Xmbv
	 INIbN6kjoUP3p1PB83t2w5SFgU8fehECV+mwH306TBr3iwycYLDiFRcw558c8nYrAtS7/
	 MtxwnnScl3XbLcl1tZmh5dG/0AXQ8bi9maO7EdXyFYkBpf9fBl9DhwlCyXHF2NNRNhA31
	 g64svb4EGPOiN/EWmTZ5GovN3mR5+3p2DxgO3GfZ65+L3ImLySwPBBOzojkFRYxrAFVE8
	 imibQkbAHKBGlz7TRICfPSNuiA0weStj6XJn05tMOIdnLxG3gZSvu2igXKejs3Z/nJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=dbEZiFH6;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD8A606A31C;
	Thu, 12 Nov 2026 10:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CD8A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=dbEZiFH6
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC891802;
	Thu, 12 Nov 2026 11:35:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794479738;
	bh=7nQjJuFr0ochBeM1kaQF42ppaetfTxuGaeUnypUe75s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dbEZiFH6K/1x6Yv7CZ4MVM/E8003jhzL74x9U68HGoxvB/rkckqT0xxdQv4oEEq7K
	 8J8rg21/TlTqboiXDYAgBga5v4b51wgz89eKw+ODAnAWW72w8eOg3fFiUHFlzN+60D
	 hIWxotXA+btaPiNeNVKElsxcmAwc1zjnarMvOwqI=
Date: Thu, 12 Nov 2026 11:37:58 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] media: uapi: videodev2: Add 20-bit Bayer formats
Message-ID: <avWWbro0mM0kW3vu@zed>
References: <20260910-v4l2-add-raw-pix-v1-0-80a8e855b41b@ragnatech.se>
 <20260910-v4l2-add-raw-pix-v1-1-80a8e855b41b@ragnatech.se>
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
In-Reply-To: <20260910-v4l2-add-raw-pix-v1-1-80a8e855b41b@ragnatech.se>

Hi Niklas

On Thu, Sep 10, 2026 at 07:22:31PM +0200, Niklas Söderlund wrote:
> Add 20-bit Bayer formats and documentation.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  .../userspace-api/media/v4l/pixfmt-bayer.rst       |   1 +
>  .../userspace-api/media/v4l/pixfmt-srggb20.rst     | 102 +++++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c               |   4 +
>  include/uapi/linux/videodev2.h                     |   4 +
>  4 files changed, 111 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> index 8b4e413177f5..b93e66d6a27e 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-bayer.rst
> @@ -33,3 +33,4 @@ orders. See also `the Wikipedia article on Bayer filter
>      pixfmt-srggb14
>      pixfmt-srggb14p
>      pixfmt-srggb16
> +    pixfmt-srggb20
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-srggb20.rst b/Documentation/userspace-api/media/v4l/pixfmt-srggb20.rst
> new file mode 100644
> index 000000000000..cf911e93aa8d
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-srggb20.rst
> @@ -0,0 +1,102 @@
> +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> +.. c:namespace:: V4L
> +
> +.. _V4L2-PIX-FMT-SRGGB20:
> +.. _v4l2-pix-fmt-sbggr20:
> +.. _v4l2-pix-fmt-sgbrg20:
> +.. _v4l2-pix-fmt-sgrbg20:
> +
> +***************************************************************************************************************************
> +V4L2_PIX_FMT_SBGGR20 ('BG20'), V4L2_PIX_FMT_SGBRG20 ('GB20'), V4L2_PIX_FMT_SGRBG20 ('GR20'), V4L2_PIX_FMT_SRGGB20 ('RG20'),
> +***************************************************************************************************************************
> +
> +
> +====================
> +20-bit Bayer formats
> +====================
> +
> +
> +Description
> +===========
> +
> +These four pixel formats are raw sRGB / Bayer formats with 20 bits per
> +sample. Each sample is stored in a 32-bit word. Each n-pixel row contains
> +n/2 green samples and n/2 blue or red samples, with alternating red and blue
> +rows. Bytes are stored in memory in little endian order. They are
> +conventionally described as GRGR... BGBG..., RGRG... GBGB..., etc. Below is
> +an example of one sample.
> +
> +.. cssclass: longtable
> +
> +.. flat-table:: 20-bit Bayer Formats
> +    :header-rows:  2
> +    :stub-columns: 0
> +
> +    * -
> +      - :cspan:`31` Sample organization
> +    * - Bit

One more question, the other RAW formats show a byte-organized table,
where the R G and B components are shown as line-interleaved
components (hope this is clear, have a look at the tables at
Documentation/output/userspace-api/media/v4l/pixfmt-srggb16.html
and compare it with
Documentation/output/userspace-api/media/v4l/pixfmt-srggb20.html)

Was this intentional ?

> +      - 31
> +      - 30
> +      - 29
> +      - 28
> +      - 27
> +      - 26
> +      - 25
> +      - 24
> +      - 23
> +      - 22
> +      - 21
> +      - 20
> +      - 19
> +      - 18
> +      - 17
> +      - 16
> +      - 15
> +      - 14
> +      - 13
> +      - 12
> +      - 11
> +      - 10
> +      - 9
> +      - 8
> +      - 7
> +      - 6
> +      - 5
> +      - 4
> +      - 3
> +      - 2
> +      - 1
> +      - 0
> +    * -
> +      - *
> +      - *
> +      - *
> +      - *
> +      - *
> +      - *
> +      - *
> +      - *
> +      - *
> +      - *
> +      - *
> +      - *
> +      - P\ :sub:`19`
> +      - P\ :sub:`18`
> +      - P\ :sub:`17`
> +      - P\ :sub:`16`
> +      - P\ :sub:`15`
> +      - P\ :sub:`14`
> +      - P\ :sub:`13`
> +      - P\ :sub:`12`
> +      - P\ :sub:`11`
> +      - P\ :sub:`10`
> +      - P\ :sub:`9`
> +      - P\ :sub:`8`
> +      - P\ :sub:`7`
> +      - P\ :sub:`6`
> +      - P\ :sub:`5`
> +      - P\ :sub:`4`
> +      - P\ :sub:`3`
> +      - P\ :sub:`2`
> +      - P\ :sub:`1`
> +      - P\ :sub:`0`
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 17ba1ae70735..14cb94591ea8 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1434,6 +1434,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_SGBRG16:	descr = "16-bit Bayer GBGB/RGRG"; break;
>  	case V4L2_PIX_FMT_SGRBG16:	descr = "16-bit Bayer GRGR/BGBG"; break;
>  	case V4L2_PIX_FMT_SRGGB16:	descr = "16-bit Bayer RGRG/GBGB"; break;
> +	case V4L2_PIX_FMT_SBGGR20:	descr = "20-bit Bayer BGBG/GRGR"; break;
> +	case V4L2_PIX_FMT_SGBRG20:	descr = "20-bit Bayer GBGB/RGRG"; break;
> +	case V4L2_PIX_FMT_SGRBG20:	descr = "20-bit Bayer GRGR/BGBG"; break;
> +	case V4L2_PIX_FMT_SRGGB20:	descr = "20-bit Bayer RGRG/GBGB"; break;
>  	case V4L2_PIX_FMT_RAW_CRU20:	descr = "14-bit Raw CRU Packed"; break;
>  	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
>  	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 5373dba640fa..85a32dee4e21 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -744,6 +744,10 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_SGBRG16 v4l2_fourcc('G', 'B', '1', '6') /* 16  GBGB.. RGRG.. */
>  #define V4L2_PIX_FMT_SGRBG16 v4l2_fourcc('G', 'R', '1', '6') /* 16  GRGR.. BGBG.. */
>  #define V4L2_PIX_FMT_SRGGB16 v4l2_fourcc('R', 'G', '1', '6') /* 16  RGRG.. GBGB.. */
> +#define V4L2_PIX_FMT_SBGGR20 v4l2_fourcc('B', 'G', '2', '0') /* 20  BGBG.. GRGR.. */
> +#define V4L2_PIX_FMT_SGBRG20 v4l2_fourcc('G', 'B', '2', '0') /* 20  GBGB.. RGRG.. */
> +#define V4L2_PIX_FMT_SGRBG20 v4l2_fourcc('G', 'R', '2', '0') /* 20  GRGR.. BGBG.. */
> +#define V4L2_PIX_FMT_SRGGB20 v4l2_fourcc('R', 'G', '2', '0') /* 20  RGRG.. GBGB.. */
>
>  /* HSV formats */
>  #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')
>
> --
> 2.55.0
>
>
