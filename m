Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AF1330301
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954344; cv=none; b=Sa1NW2XcO7sXjos1Ky+BSnZgNwP2xNZTZVk0KdV3Uwgg01bqKX7X+6Mp9VdWEYOKkwgHKP9tKQfnqfDbC34NHIkb1miAH61Uho4HmvUoVf/uMviPpkOEFI84q54lij0oESOoBPqTMv7GxHXhF40JItNXjIwJS+2tDplGqyiyRD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954344; c=relaxed/simple;
	bh=jVrQyB0YjQv1an9nW6xTu/MYyqwJBX9rY/Xnvuxji7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPntToT+6brjdYsfqalaJzEKXJsanVKxnAUyBUn8evFm5JnTgymm+fB85tSllGkTMHtFrzZcEkDBpjdLAnvuGzmSOwhMDOMKveS2BRtfmETCcyGsY9jc1Hpv4lqpYqGxyhgamYwX5uJ9RFG85ZTnDZ651AtXJujsqsgGyjQc/Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=o06LiE7r; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=xcrKeVdO; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="o06LiE7r";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xcrKeVdO"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7240E140011C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:19:01 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 02 Oct 2026 11:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790954341;
	 x=1791040741; bh=exok25SpyXZd3gX6ipQfFWEl4jZLSb7Ia+fq53cNGAo=; b=
	o06LiE7r6D+wrrAKCWo/y2HJdYZsXu+qCuFplXeDEDKyFOzhRpmgNRKaHH64NKwk
	PQvsRxIJlhdkxyiglDsN1c5Mv7ok4vEZj94tcv4eLW4NNlN0GoMytwa4qHmBiZWZ
	XrpH2c9sSJw2oFMwB3Gd6OycGVyCqHrg3VYFx9P2XrvEY9fODGuiY2v54OMZqggB
	OZ6CzY8/a8X0naFaZKo+qolMjo5I0dpbKwmNYufq0IzIWoGw8dSMk4xSAIzm0DK9
	nVIQEY1YE0TdnOuLpEa0MysvsTPR0x/uqqz5AJlcl6jDTdvCLWQ91KQFilcgBgby
	JiBuCmS5yFfYLLyd07hqIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790954341; x=
	1791040741; bh=exok25SpyXZd3gX6ipQfFWEl4jZLSb7Ia+fq53cNGAo=; b=x
	crKeVdO43ZsMGtr9IscPCBiacx8BkJovIFCgCchbY2AfK9K+JsiGPMlvdJD1dRCJ
	Qt3cxDobgI7LsNbG715Z+kapUA78VxIuYzJFmU7VdAvxWDpiXxqzWxCYDx3jJ2RD
	+O354e5kF3Ymgp4y/9KBkc16bG2G1bvUHIz111Zrm1ffBwbEPX7GubWbgsAQVHWs
	xuqScH/NNu0dSRX+nEvAO/YUwB2iAi17FSlG8TwOUSOHmPqX4uXp2+HRtn/rjlMK
	7KJFPXHwJ3WmPYWoMhTEUarBLo6/uic5ZYd9W/JUFrHr/QQUH6I7S0r0LyMRFy8y
	SGnHirmJnkDg0XYk4NiiQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790954341; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:e9VobTHObflRe57tXZCvVu0yOpUK+pEclMmCOEmGZ1cBpJr
	kRpq1A1n17j3sIsdPulpEe4zyOTc1az4qHaG0Gz7+C4niHset1g8CA7a94oKerS5
	zbpOPWAfTnVK2ygQQKLr22v6Qbeqg/MGjZHSe9IW+U9Ie2+4OMvwVV7IAk98VIoL
	mjEvqQjXi/LWUBznQln4oefW6qkYnFS/U3jflTafZ0Kkcxz8NsIFxk9++hceh7tA
	9jsnhAqxaH7fNUDNx6LazrLDHbkSY2QNTVf9kDY88FJBYqzNtFBxdU2YrNZC5IrU
	6WzvCgEr9AuFixJ/tuIhUMeehoeEzWOPE8VUX0w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:rcR4AlhBfS4SU4B4J2hScMCM/pCHKXGGgA/jTcxFVEY=:jVrQyB0YjQv1an9nW6xTu/MYyqwJBX9rY/Xnvuxji7Q=;
X-ME-Sender: <xms:ZMu_arHtFvLRstWzC2xRsXrhL-Je4Bz2Nbd9fEyqpdwrNsf4wnIb6Q>
    <xme:ZMu_aiaayZxvdwECaiGamf9Y19OR4bnn9RHr0RlXb2lXTpeJ-eM033sgpGad1Flzh
    8zRmpGQ9FQkneeQupC03a0U3R1-zaeCYls79dRbXHL4u0n9fYA8JSg>
X-ME-Received: <xmr:ZMu_atAhN2Xpzx4rvWCzMr2vEECM8DQUJqMj9xUS-cRRsCSOnv9HEvPkMWgwIx_tAFFHbJv17oOxXkwNUmtdaeNL2DGu3r4>
X-ME-Proxy-Cause: dmFkZTGS2o/olsGiM+YCtTmRfiJhSyqP77cFNhetbZ//FshmazzBe+d2kPz/UCLsGeUHGd
    pbOqLX8ttxmc3QBmmYjPPSw3CNlHhsO1Bx654+T6zUVpcwgQSpzUkWVcTr3cjPa1Jm6wzx
    4I8rAeth6chNt2TlOFfDX9wmx/WKlc5/A8Cog0hmP7bTulpB7XkKGMaJpzo5BeuixJBAOP
    oCUwcbSlQeYFgCwXlW8xV7pfWodo5xhOGp4ZlP5VJP2NOZQzNtW1SJxv30LXiqRc+aiJdg
    kPB/6dLG/dI1VcMXC2Ak4w3aPwJZyNJAZRkPcgQrh76d0qT3dLl8t3fNaJ2v3VyRjCQtRs
    NCIrFcrhjMjgG2a8ZpFNeZ4n4MqRVKj3grz87ZZOzCT0DlznpRghJglehIZvGu68N3+mv/
    C6dtvB4Yrn89J786J0JoKGBJHpZg0A+XoqgyzNKahC7Eq1RzJWCjga7JY2cKMNIBJVIjmB
    F7cy9jeHtBkML76n7O9izqsqjqRd1M18ryohG9C1z9ndUu1bDRAm9fEn0zX/4L4WKIVP8a
    IY8jvBv6NBsiG5D4Ssad0mwNMN+oy089MupTuae8k9a5tYYRSxFHc4rZgMZBBipqCIvZ1c
    HbLsta50zJLhs437vXCL1Hd/PMOqI01Ymfp6zG+17VnLswwUUF2KEH7elmQg
X-ME-Proxy: <xmx:ZMu_aqlAA7tCkAayZhvsAW1ynM-tnBCfMqGj-jLojJxJySv1YivlrA>
    <xmx:ZMu_auwb00nmKHVpaJkFV-aOe2Kc2XV5hI-c8bLqgTCAKUR_Cq6Zdg>
    <xmx:ZMu_akQJcvSL7LYNv04KYWHiq3ltC1TGm4ibcsVzFBUMpKCpGCdBCQ>
    <xmx:ZMu_am-YzzPlESZ21iDV0rBBbyWmA2UxPNEnBB-ClXV1z0mMIeYfrQ>
    <xmx:Zcu_agH85nh0SjL7yBr3w-9G-IxelQ0EV9kwLUoWb8xplrCOPAtEGZol>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Oct 2026 11:19:00 -0400 (EDT)
Date: Fri, 2 Oct 2026 17:18:58 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] media: rppx1: lsc: Fix and use LSC_SIZE_VALUE()
Message-ID: <20261002151858.GA1933679@ragnatech.se>
References: <20261002121643.418200-1-barnabas.pocze+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261002121643.418200-1-barnabas.pocze+renesas@ideasonboard.com>

Hi Barnabás,

Nice catch!

On 2026-10-02 14:16:43 +0200, Barnabás Pőcze wrote:
> Firstly, the size values are 10-bit unsigned integers, and there doesn't
> appear to be an upper limit in the hardware documentation, and testing also
> seems to confirm that 1023 works as expected, so the correct mask to use is
> 0x3ff (1023), not 0x1ff (511).

I have the fields (x_sect_size_{0,1}) in RPP_MAIN_PRE1_LSC_XSIZE_01 
defined as 10-bits so it is documented right? The thing here is that the 
incorrect define LSC_GRAD_VALUE was used where LSC_SIZE_VALUE should 
have, and this masked the error, no?

> 
> Secondly, actually use `LSC_SIZE_VALUE()` when populating the size registers
> instead of using the `LSC_GRAD_VALUE()` macro.
> 
> Fixes: b39656efb71a ("media: rppx1: lsc: Add support for lens shade correction")
> Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>

This fixes it correctly.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../platform/dreamchip/rppx1/rppx1_lsc.c      | 34 +++++++++----------
>  1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
> index 8badeca23e249..ffc52ca23dd99 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
> @@ -57,7 +57,7 @@
>  
>  #define LSC_R_TABLE_DATA_VALUE(v1, v2) (((v1) & 0xfff) | (((v2) & 0xfff) << 12))
>  #define LSC_GRAD_VALUE(v1, v2) (((v1) & 0xfff) | (((v2) & 0xfff) << 16))
> -#define LSC_SIZE_VALUE(v1, v2) (((v1) & 0x1ff) | (((v2) & 0x1ff) << 16))
> +#define LSC_SIZE_VALUE(v1, v2) (((v1) & 0x3ff) | (((v2) & 0x3ff) << 16))
>  
>  static int rppx1_lsc_probe(struct rpp_module *mod)
>  {
> @@ -157,24 +157,24 @@ rppx1_lsc_fill_params(struct rpp_module *mod,
>  	write(priv, mod->base + LSC_YGRAD_1415_REG, LSC_GRAD_VALUE(v[14], v[15]));
>  
>  	v = cfg->x_sect_size;
> -	write(priv, mod->base + LSC_XSIZE_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
> -	write(priv, mod->base + LSC_XSIZE_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
> -	write(priv, mod->base + LSC_XSIZE_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
> -	write(priv, mod->base + LSC_XSIZE_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
> -	write(priv, mod->base + LSC_XSIZE_89_REG, LSC_GRAD_VALUE(v[8], v[9]));
> -	write(priv, mod->base + LSC_XSIZE_1011_REG, LSC_GRAD_VALUE(v[10], v[11]));
> -	write(priv, mod->base + LSC_XSIZE_1213_REG, LSC_GRAD_VALUE(v[12], v[13]));
> -	write(priv, mod->base + LSC_XSIZE_1415_REG, LSC_GRAD_VALUE(v[14], v[15]));
> +	write(priv, mod->base + LSC_XSIZE_01_REG, LSC_SIZE_VALUE(v[0], v[1]));
> +	write(priv, mod->base + LSC_XSIZE_23_REG, LSC_SIZE_VALUE(v[2], v[3]));
> +	write(priv, mod->base + LSC_XSIZE_45_REG, LSC_SIZE_VALUE(v[4], v[5]));
> +	write(priv, mod->base + LSC_XSIZE_67_REG, LSC_SIZE_VALUE(v[6], v[7]));
> +	write(priv, mod->base + LSC_XSIZE_89_REG, LSC_SIZE_VALUE(v[8], v[9]));
> +	write(priv, mod->base + LSC_XSIZE_1011_REG, LSC_SIZE_VALUE(v[10], v[11]));
> +	write(priv, mod->base + LSC_XSIZE_1213_REG, LSC_SIZE_VALUE(v[12], v[13]));
> +	write(priv, mod->base + LSC_XSIZE_1415_REG, LSC_SIZE_VALUE(v[14], v[15]));
>  
>  	v = cfg->y_sect_size;
> -	write(priv, mod->base + LSC_YSIZE_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
> -	write(priv, mod->base + LSC_YSIZE_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
> -	write(priv, mod->base + LSC_YSIZE_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
> -	write(priv, mod->base + LSC_YSIZE_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
> -	write(priv, mod->base + LSC_YSIZE_89_REG, LSC_GRAD_VALUE(v[8], v[9]));
> -	write(priv, mod->base + LSC_YSIZE_1011_REG, LSC_GRAD_VALUE(v[10], v[11]));
> -	write(priv, mod->base + LSC_YSIZE_1213_REG, LSC_GRAD_VALUE(v[12], v[13]));
> -	write(priv, mod->base + LSC_YSIZE_1415_REG, LSC_GRAD_VALUE(v[14], v[15]));
> +	write(priv, mod->base + LSC_YSIZE_01_REG, LSC_SIZE_VALUE(v[0], v[1]));
> +	write(priv, mod->base + LSC_YSIZE_23_REG, LSC_SIZE_VALUE(v[2], v[3]));
> +	write(priv, mod->base + LSC_YSIZE_45_REG, LSC_SIZE_VALUE(v[4], v[5]));
> +	write(priv, mod->base + LSC_YSIZE_67_REG, LSC_SIZE_VALUE(v[6], v[7]));
> +	write(priv, mod->base + LSC_YSIZE_89_REG, LSC_SIZE_VALUE(v[8], v[9]));
> +	write(priv, mod->base + LSC_YSIZE_1011_REG, LSC_SIZE_VALUE(v[10], v[11]));
> +	write(priv, mod->base + LSC_YSIZE_1213_REG, LSC_SIZE_VALUE(v[12], v[13]));
> +	write(priv, mod->base + LSC_YSIZE_1415_REG, LSC_SIZE_VALUE(v[14], v[15]));
>  
>  	/* Enable module. */
>  	write(priv, mod->base + LSC_CTRL_REG, LSC_CTRL_LSC_EN);
> -- 
> 2.56.0
> 

-- 
Kind Regards,
Niklas Söderlund
