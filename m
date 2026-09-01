Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6858646D0AF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249324; cv=pass; b=nEx+78JTF+FhHPxR/cZdI13WovFamFioaQp1A0GsCzwQbvQmWn/UKG4KWfBrwo7705XX/RquhNOD3pxYdR84caZlpE9qccm/UQ8DVIZ9v29bNN0l6A3v70pe1tKEHpBt2uB474bqa+Z8RKgPXEjOmrcz/Zbp49QjZPM2nyNYhPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249324; c=relaxed/simple;
	bh=eiCDUNOLP2PcC71+PodqMcYpwQ1zh+hYyVvpJK4a6Mw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N+zrFmULgs7tupJPlFQOMRFVhTf1qaV28jvPYj95peD9EGM09exKwiaxzCM3IkefAJ+a+AXIcuqAT78draC692upTw42kRdkgetzBQ7cVfFjfZ4gJe0W25CeWcBRihc5wI/SouTl7C8vl+2jl8RXotnzncixnmEgaXi5qNLnrIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZibetIGs; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZibetIGs"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48441fa5c37so465003f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:55:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788249322; cv=none;
        d=google.com; s=arc-20260327;
        b=I8BUbTZZdaTFBRi96Iwf8X2zXihMP7Vk5t7ZS8yUeHviIzOJtq0N6AmKE95bWHIJo3
         PcMuahUTT1SsNGyiYDObTMiOyWG9DgAgOQmfA5w+/9bg52Q6FoHfbKU+nd+CQqUf+/sU
         dRWYnVaa69WFZBioVXEMGQlg8sFNUOKI2XyA4RqIP3GZpS66fWy9NqLVGy8vfxIOEQDW
         eQZuQLFEfifym4GXBIQebWXM0E0TEUyiE20THM9900l/oqm7oyGyQ2OyTln9PLLx07Tj
         jqF0aoQ4+OHdaMUmRtKrgVpvO0pNZ8cysBgLj7VCc2Yntb4fTzccI/31qgqCP9+PLbc3
         XWLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=P/ouvMaa3eZm+FiWEavsB/WOAoUnVISK70nX0nRCcCg=;
        fh=EFMkuHliftFqPcHGQZq2XhFWNGfRtT7jKRgIMkkH6Tg=;
        b=py6rxvuxr96vjAvQ144C8nZXriSiaKquy4SPRZca/5rSko3OgT15nVWzTamX0i4LSC
         y1Hp7dLfDZmCtfcVDYtlX+WoGL2N62lw25ehcxfOhuaO+vkhkApn9puU/BmvD/QxpBPB
         +oLSnuXyTVCMUldxavCEjdOxAtcCo+bMLvMEQbhRA5saBG+S0PNFEBTvxzckzxPM0sl2
         QfdanmYQ1pr9q9u+Db1pi9qWyQBcdTMuGxUKcUpZuRzjOhj7NE7XSIu6fbftU0reYK3U
         QzYWfRfw3AvD3ce3+GM7X7hrRvK/vqD/x19SSxDXP3DfGGInPMA7Dcq+05lZ2FoTv1iz
         3Zow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788249322; x=1788854122; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P/ouvMaa3eZm+FiWEavsB/WOAoUnVISK70nX0nRCcCg=;
        b=ZibetIGs7hAVSEPvXHGkAGrYwyNbnKZEM7HPomGkvaWE+z7cGw62u6JN+hPU21Dcgm
         OLjSSJjTNGEx1KdguvQI6/BaU6JCDiK54dN6R1+2eC2BrPJ+FBrm/zNCPy+0opAxvVG1
         vB1zzQcKbsaWUAC5C/JXBSl/HK4TMmHpAyVC5hOTjr3DNPEAPSF2uBll82FpHUrUapkJ
         rTInBS/p2wcljbcOkMQzteBnZwIOUZxko8esFV1Xz+RYpChmXljiAFlC1JMVgOJx6UxW
         dMgIJz5i0ikbcYknxoAacvf7w1T+sz1hhy2GNeKRI79NwgCB3LeQ8iWUiy9dYGc79cL0
         BShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249322; x=1788854122;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P/ouvMaa3eZm+FiWEavsB/WOAoUnVISK70nX0nRCcCg=;
        b=g4/Fy/OtCqe35h0bUsDYU2KWwQtljfG6xPtd9Dm4DrKq4ArdwC3gJMmi77JG4S1v27
         /g69TGN1BrnYv/qEe8+JjIaB10M2Qufz3NEjV2SAGMzdhnbRPvRXPn20pPj5srA+qa7r
         PCKSnVEjXMrs7hv8p5wg4NlVnSNmUJWbKUXzkxAgc5ZGPUFNIqui45Od4UAhandXViA+
         1N5PmisPCauF3EGfJUhe+58WxNbrkJtc0AWRyzrAO+GGNG5brMvSndHPUI4kxmxQ6dqv
         YOrdspWqF3K0iY/7hc0nkffqjCw0BJnQNt7KtXdu+GIdtbIn/ZdfXv4Bpi1LhkDICvM6
         i8Lg==
X-Forwarded-Encrypted: i=1; AKwUvBxs926fVbU1GlnzqksFRGYG0PRhoo2Oz8pC6S29aHWkv1rP/S/SMYMmmVGrXOzskOn/tbXUi9d53hm8ZMQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l9rMorDmdoSD6hROPqrOVAZKfJkQtqBpmXatkUs0ymbp7SPcW2
	fk39458WN2op4MVKXGB02XfDipkltcXSJYqd1859Uv2eYJdd1Wengcn9eiASGCe1alv9ZzMslIM
	mBJ9rRW1+S88AF7Lq+f2YVFYkof/sSxE=
X-Gm-Gg: AYBFou0q/bNqhHzTEBOLTJHpfDKvqa9BzRDMhIXLX2Mmdpr4gaSsfdue3+vsvbT5urc
	+IzgRbXGKJibE1x4pm6gRY2dFfY26uIRV28t+MohM8OMcC2hh6rkR4g8ugiXAQ1Laf1MJqUrN8p
	InITC7e7k0p9VKAVEfauGM38E0BypPJnlKGt9nqBS6Z6ls1T4ig4tVLxyNFQYqdsAIh2GTXqp/h
	RgLMOPp3XUFzP3TJFZEVm5ghbQ86tRzqLfXfe2Qh2vhE6NiYzqzpZwx10Tb+PawPc3jVO2pCO67
	P8Mx/JXyZlWIRUbAYSHFxqx/FLl0l6TUCbA7SCpU5JvNkxG1kEjjixQVwTVE/ZRUtOVb++Ai3tk
	LXFdrBa9s1uZQDZPsYX+CkdgDHc9RC2kUrs3q6obf0ruHGkCpNB0IlMjflppq+TdWYgKe8QPKHO
	mTD1UQWn5RD6cxibfm32coNBTy9JWxrnqdSUfKoNP04DBgyFYmGmsSoYQysoV/np7Uik10P/aJR
	XcGrPsvNRcjPgI=
X-Received: by 2002:adf:e191:0:b0:482:e6b5:61c with SMTP id
 ffacd0b85a97d-482f7983567mr52568449f8f.8.1788249321552; Tue, 01 Sep 2026
 00:55:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-kernel-header-removal-v2-0-b92b580ef5eb@gmail.com> <CALoEA-wDkFkKVLCkQOvntnw-cD76Gz=MVW6qNJL21Obn+s-wEQ@mail.gmail.com>
In-Reply-To: <CALoEA-wDkFkKVLCkQOvntnw-cD76Gz=MVW6qNJL21Obn+s-wEQ@mail.gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Tue, 1 Sep 2026 09:55:09 +0200
X-Gm-Features: AcwNN1Xim3XzXhdKDFVY5okNIhEsjRoz6FlvhoOPuqBSbFbmb7lfh0gC590-9Kg
Message-ID: <CALoEA-yK8kP6DbPuzh_BnNUnxOU_meAcWWFURMvO6svGBZo2-g@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] iio: temperature: make headers conform to IWYU
To: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Crt Mori <cmo@melexis.com>, Puranjay Mohan <puranjay@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Sept 2026 at 07:09, Joshua Crofts <joshua.crofts1@gmail.com> wrote:
> > Changes in v2:
> > - Add missing headers pointed out by Sashiko.
> > - Swap <asm/div64.h> for <linux/math64.h> (Jonathan, Andy).
> > - Squash small reordering patches with iwyu changes.
> > - Link to v1: https://lore.kernel.org/r/20260822-kernel-header-removal-v1-0-ee31b124be11@gmail.com
> >
> > ---
> > Joshua Crofts (11):
> >       iio: temperature: iqs620at-temp: make headers conform to IWYU
> >       iio: temperature: ltc2983: reorder headers
> >       iio: temperature: ltc2983: make headers conform to IWYU
> >       iio: temperature: mlx90632: make headers conform to IWYU
> >       iio: temperature: mlx90635: make headers conform to IWYU
> >       iio: temperature: tmp117: sort headers alphabetically
> >       iio: temperature: tmp117: make headers conform to IWYU
> >       iio: temperature: tsys01: reorder headers
> >       iio: temperature: tsys01: make headers conform to IWYU
> >       iio: temperature: tsys02d: reorder headers
> >       iio: temperature: tsys02d: make headers conform to IWYU
> >
> >  drivers/iio/temperature/iqs620at-temp.c |  9 +++++++--
> >  drivers/iio/temperature/ltc2983.c       | 19 +++++++++++++++----
> >  drivers/iio/temperature/mlx90632.c      | 10 +++++++---
> >  drivers/iio/temperature/mlx90635.c      | 11 +++++++----
> >  drivers/iio/temperature/tmp117.c        |  9 +++++----
> >  drivers/iio/temperature/tsys01.c        | 17 +++++++++++------
> >  drivers/iio/temperature/tsys02d.c       | 12 +++++++++---
> >  7 files changed, 61 insertions(+), 26 deletions(-)
> > ---
>
> I seem to be having b4 issues as this sent v2 again with the same
> mistakes?

Okay, never mind. b4 did send the right series but forgot to bump the version
number up.

Anyway, some Sashiko remarks - just commit message issues (forgot to update
some headers under the ---) + one remark about me including slab.h for
GFP_KERNEL, but I suppose I could change this to gfp_types.h instead.

-- 
Kind regards,
Joshua Crofts
