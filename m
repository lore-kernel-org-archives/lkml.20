Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836994;
	b=le9x4ZCO8dhNV3rA69lzQtyUVj7w2q1BxtN8DnSIp8lLD/jMK43vh4h8ubkhwwW+wrVA
	 4KheDLGZMr9u9NZpuEBMzgVubQTd10E88GTYe2x0KgfSLbUJ0r/4oG3wf/32o3qW7r+vu
	 wbjcS8I2bp/P052hSpwY+sfej0A5fIERrenNOscy+32DJ0OxeC36mdN8jqZ6pA8YyaRDA
	 otxhmZg7CmfDgVCX48CiGJ7dl12zyiGgMXP+THZjmrX9T7B46lwEnICVop5c26wulkpDz
	 Fg6yII5YWc53M0oIciY7LGkPbMvtjzBSMMAvlyTlSq5wb4HaRk2hnk+7gbX+vQeXjQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836994;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=lmSjI7DNlYMIW1WzzlFBK5MKVeidUFxBwHDgIMghb88=;
	b=5Ub96lvigUr7lwyvCMV+WKGV7KMVKR78VMr6E0n2LvHgfG2yjxQTaSs8fzgC9q3Jecdx
	 OKNfG2lb1b8dQ+2Iw3HgND19hTyLxYC6BOIOz89ZbsujNOHrKLC1TuZRew2OjOBOeeIZi
	 6lr09dcdEeO4E0mePwkjRiQKN4vqwactot178qMmTKETo8fU77z3Jp66wm0LKsUGuAlfx
	 ihXNRjpqUACZTGv9yVxQzeI4sYEfTbsKauj+EzLvbmVB4FdDYAhiyKG5ksEC3AC2sRXNW
	 SL9Q3swRLNVSSSGFT/D6ugDUaEDiJpjy3G5hLBxIkbS87//yQhezPI06odk2fPbcQfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=KaAvPbKm;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64725606A32F;
	Mon, 16 Nov 2026 13:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64725606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=KaAvPbKm
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C4494BB;
	Mon, 16 Nov 2026 14:47:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794836845;
	bh=E3G21JXOa+vYOi3mOw8U/JLkLzHhbS+RYtGbpQk2Ae8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KaAvPbKm7AlZW16120upRSrDmMK6L72VZwDXQypqAcT33MaHrHTGf+0F4JpW9A+dG
	 FHESiggeHSAgw9T/HdZHljoa3gyp78LX1TY1PoLg7NQgaoxD1Ns4KLDAeyD9jOnvFD
	 Y7XUyz+jqU2XkNJ7XqEjU3XqFp9X8GyLlrka1iOY=
Date: Mon, 16 Nov 2026 14:49:49 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] media: uapi: Extend bayer media bus formats table to
 28 bits
Message-ID: <avsJ8RRTkfcxwQt2@zed>
References: <20260908-v4l2-add-raw-mbus-v1-0-6973bffa5b80@ragnatech.se>
 <20260908-v4l2-add-raw-mbus-v1-1-6973bffa5b80@ragnatech.se>
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
In-Reply-To: <20260908-v4l2-add-raw-mbus-v1-1-6973bffa5b80@ragnatech.se>

Hi Niklas

On Tue, Sep 08, 2026 at 10:02:56PM +0200, Niklas Söderlund wrote:
> Prepare to describe 24- and 28-bit media bus formats by first extending
> the table and existing formats to cover 28-bits.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  .../userspace-api/media/v4l/subdev-formats.rst     | 332 ++++++++++++++++++++-
>  1 file changed, 330 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> index c9999b929773..892562ab48de 100644
> --- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
> +++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
> @@ -2821,7 +2821,7 @@ organization is given as an example for the first pixel only.
>      \tiny
>      \setlength{\tabcolsep}{2pt}
>
> -.. tabularcolumns:: |p{6.0cm}|p{0.7cm}|p{0.3cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
> +.. tabularcolumns:: |p{6.0cm}|p{0.7cm}|p{0.3cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
>
>  .. _v4l2-mbus-pixelcode-bayer:
>
> @@ -2834,10 +2834,18 @@ organization is given as an example for the first pixel only.
>      * - Identifier
>        - Code
>        -
> -      - :cspan:`19` Data organization
> +      - :cspan:`27` Data organization
>      * -
>        -
>        - Bit
> +      - 27
> +      - 26
> +      - 25
> +      - 24
> +      - 23
> +      - 22
> +      - 21
> +      - 20
>        - 19
>        - 18
>        - 17
> @@ -2875,6 +2883,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`7`
>        - b\ :sub:`6`
>        - b\ :sub:`5`
> @@ -2900,6 +2916,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`7`
>        - g\ :sub:`6`
>        - g\ :sub:`5`
> @@ -2925,6 +2949,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`7`
>        - g\ :sub:`6`
>        - g\ :sub:`5`
> @@ -2950,6 +2982,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - r\ :sub:`7`
>        - r\ :sub:`6`
>        - r\ :sub:`5`
> @@ -2975,6 +3015,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`7`
>        - b\ :sub:`6`
>        - b\ :sub:`5`
> @@ -3000,6 +3048,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`7`
>        - g\ :sub:`6`
>        - g\ :sub:`5`
> @@ -3025,6 +3081,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`7`
>        - g\ :sub:`6`
>        - g\ :sub:`5`
> @@ -3050,6 +3114,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - r\ :sub:`7`
>        - r\ :sub:`6`
>        - r\ :sub:`5`
> @@ -3075,6 +3147,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`7`
>        - b\ :sub:`6`
>        - b\ :sub:`5`
> @@ -3100,6 +3180,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`7`
>        - g\ :sub:`6`
>        - g\ :sub:`5`
> @@ -3125,6 +3213,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`7`
>        - g\ :sub:`6`
>        - g\ :sub:`5`
> @@ -3150,6 +3246,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - r\ :sub:`7`
>        - r\ :sub:`6`
>        - r\ :sub:`5`
> @@ -3175,6 +3279,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - 0
>        - 0
>        - 0
> @@ -3198,6 +3310,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`7`
>        - b\ :sub:`6`
>        - b\ :sub:`5`
> @@ -3223,6 +3343,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`7`
>        - b\ :sub:`6`
>        - b\ :sub:`5`
> @@ -3246,6 +3374,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - 0
>        - 0
>        - 0
> @@ -3271,6 +3407,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`9`
>        - b\ :sub:`8`
>        - b\ :sub:`7`
> @@ -3294,6 +3438,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`1`
>        - b\ :sub:`0`
>        - 0
> @@ -3319,6 +3471,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`1`
>        - b\ :sub:`0`
>        - 0
> @@ -3342,6 +3502,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`9`
>        - b\ :sub:`8`
>        - b\ :sub:`7`
> @@ -3365,6 +3533,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`9`
>        - b\ :sub:`8`
>        - b\ :sub:`7`
> @@ -3390,6 +3566,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`9`
>        - g\ :sub:`8`
>        - g\ :sub:`7`
> @@ -3415,6 +3599,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`9`
>        - g\ :sub:`8`
>        - g\ :sub:`7`
> @@ -3440,6 +3632,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - r\ :sub:`9`
>        - r\ :sub:`8`
>        - r\ :sub:`7`
> @@ -3463,6 +3663,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`11`
>        - b\ :sub:`10`
>        - b\ :sub:`9`
> @@ -3488,6 +3696,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`11`
>        - g\ :sub:`10`
>        - g\ :sub:`9`
> @@ -3513,6 +3729,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`11`
>        - g\ :sub:`10`
>        - g\ :sub:`9`
> @@ -3538,6 +3762,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - r\ :sub:`11`
>        - r\ :sub:`10`
>        - r\ :sub:`9`
> @@ -3561,6 +3793,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`13`
>        - b\ :sub:`12`
>        - b\ :sub:`11`
> @@ -3586,6 +3826,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`13`
>        - g\ :sub:`12`
>        - g\ :sub:`11`
> @@ -3611,6 +3859,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`13`
>        - g\ :sub:`12`
>        - g\ :sub:`11`
> @@ -3636,6 +3892,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - r\ :sub:`13`
>        - r\ :sub:`12`
>        - r\ :sub:`11`
> @@ -3659,6 +3923,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`15`
>        - b\ :sub:`14`
>        - b\ :sub:`13`
> @@ -3684,6 +3956,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`15`
>        - g\ :sub:`14`
>        - g\ :sub:`13`
> @@ -3709,6 +3989,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`15`
>        - g\ :sub:`14`
>        - g\ :sub:`13`
> @@ -3734,6 +4022,14 @@ organization is given as an example for the first pixel only.
>        -
>        -
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - r\ :sub:`15`
>        - r\ :sub:`14`
>        - r\ :sub:`13`
> @@ -3755,6 +4051,14 @@ organization is given as an example for the first pixel only.
>        - MEDIA_BUS_FMT_SBGGR20_1X20
>        - 0x3021
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - b\ :sub:`19`
>        - b\ :sub:`18`
>        - b\ :sub:`17`
> @@ -3780,6 +4084,14 @@ organization is given as an example for the first pixel only.
>        - MEDIA_BUS_FMT_SGBRG20_1X20
>        - 0x3022
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`19`
>        - g\ :sub:`18`
>        - g\ :sub:`17`
> @@ -3805,6 +4117,14 @@ organization is given as an example for the first pixel only.
>        - MEDIA_BUS_FMT_SGRBG20_1X20
>        - 0x3023
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - g\ :sub:`19`
>        - g\ :sub:`18`
>        - g\ :sub:`17`
> @@ -3830,6 +4150,14 @@ organization is given as an example for the first pixel only.
>        - MEDIA_BUS_FMT_SRGGB20_1X20
>        - 0x3024
>        -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
> +      -
>        - r\ :sub:`19`
>        - r\ :sub:`18`
>        - r\ :sub:`17`
>
> --
> 2.55.0
>
>
