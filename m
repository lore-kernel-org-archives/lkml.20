Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBDE3CB2D4
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901023; cv=pass; b=kTKtNZzcz8W3ZgzBHj1yMvEqzcGCPXjPk9M6LuxKQ0iJyou2I0l6UC9hDGmPj4LfHFIrQ8gS4P6Dx+DBd3FdT+mvQD7GaBDaO5kPKvul4JIeqx4T4AoTD+0bsepTBNczbeQkdrpY2C2foiicTJ8fLoFmN2hkG2IHi+HK77hXjno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901023; c=relaxed/simple;
	bh=wNycpsWBlfQXgs2ZLPtEBzEs04amMNcoEiI5MVrXE/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u4ETecobAR3Ei0Rp8jQ2VA/tmcBdN8bv4FZXMPEYy2qoXE5hPY2uD3502s6oYaxnN55TxUdgFZ7+iTXNXEczoxLEp1khXGdH/s25vg/ucQDX2nI/urd40Bq8P96RO+OftzD4UR9C3UOdy0/wgC2WzhJaHjFiykr7N2FkMP1qVaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I/EAakkx; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I/EAakkx"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6740e7ae219so2287922d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:17:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791901021; cv=none;
        d=google.com; s=arc-20260327;
        b=VmucUyzUOw3M0apFZH4WNYPiIe1FVICNYCfccSmPSkxAOGMmenJJzoFIuiWXht77jU
         mM0UWVBZxog/sCFED/dIHki57n1RHgahvuxAAcmy2+HZgTmhF8rp2DaN8koVqROL88eS
         Tjddy+Y48lyA3Sch6uX1EEdWJBuG1JiyRDnbIDtgUy0iesNPKmgQDCTAVVSJ5ncuCUVY
         VuYtGUTptHgY9s/5N+Z4ZIEexOL9QuyfZVobR8yU0FPSSqQKnwG8ih/sOQKzaRMYW4vV
         P42BPh60Sq1+3tppvit8sqrqUmbh3x+7vJ0u15cB49rT94J70A+DTvGUbPK0qWNy7U66
         woyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wNycpsWBlfQXgs2ZLPtEBzEs04amMNcoEiI5MVrXE/Y=;
        fh=LQU9D3j8prFMIBzZ4WBQKGVnE/oNiRyY1qkzlXfN3mY=;
        b=ZQfjwEjPvVUrrrLRKznt8Jv1C/nzl7D9iK2WiFB0nCd1V4l7sg8RoYWvsTzspMc9bg
         q8QzOAks9n3/IEWa4n+I3pNNCfpnAyf8AjuuZ3edznoQGWowYHDuBsOc6WsAruAg+vSx
         kSuGq0rA9qo0JuQ6zYnWStSXYDLonNnN8Zxbs5YUQMeiv9GnVwjtFk+vvUlIgjN0AVBj
         TfkhSuH4KOhcNNANcOYyxAYZyj/OgVSDtyek6sERDtsjFJbBEZyegEV3/6hARG447jBt
         dnnu/2UasLm1Q7bvFnlLWRh4q/dV4O5TyMiZDFwhpSqWPbDuAWAdYD6bBcwv7GgolfwG
         ufbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791901021; x=1792505821; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNycpsWBlfQXgs2ZLPtEBzEs04amMNcoEiI5MVrXE/Y=;
        b=I/EAakkxWChA/RLfs+fjleE/aJuUxYeK0LarM5S/CsbkJmjn72B3Y1hCJIyP+MtjWB
         pJtX5FRylCg48b6gAQZvQnM0uKCWoGV3zeje7Ytj0xi7P8H2JW35vyGD0PFV1gGfu3B7
         2DWhgfQaTwMhLiqE8gQjcFo1g/7QR4pe3JPueH0rxdZUhwCXv7fqAYYxUpGVjzs33sxS
         EpEGI8DTVciTlZPL1k1LhcnRw2k1mnTLtwLU3pjO8IHhcC50QyUodKlB2LHq25fy8OYb
         8gJTqHz43Ki8mws3ahx0L1sS2zZhaWFlG0NVALMD/AMp/48LMIx4OpufWjCAntw9AAzV
         j2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791901021; x=1792505821;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wNycpsWBlfQXgs2ZLPtEBzEs04amMNcoEiI5MVrXE/Y=;
        b=wnVBYoe7YgdpZgUxSY/KBTQILfGArOtgIYuokF7NMz/4hAKmaezAH0LnkDjd7wILoa
         TDpVkN/2r0Z9HH1eazATGudLgvLx8ye5Ml6fs6ehX4XYhQiW8VlOrpMEnf2GLWacMcET
         FEhaqDfpGsxWePZl22uuhvh7n+2vu+Gtdrmc8n9veKI3TP6PP6dmhBeUbkuzxn7bpKZ2
         tc42RD/VkJ+/OTBJOncehk1AHB/siDjO0z9MPRGXTjjeT/BI2aMdG3F8ObnnbEhEupED
         EbWGuoxxJRiAS7y+bHuzNuEWx7+2IyOvEb2/xiNpj1Yi2Hn7QXLAQ5HR9P7rBylSvMzI
         YpTA==
X-Forwarded-Encrypted: i=1; AKwUvBzJG7QsGVGeJMUL/vJ8KOmOmBWVR1si1zHjNYGNdddSUNy/2YpxGBdIvhRyq0Jt9YjC9R19RXo+wXHYFK8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMy1ijVwr2kGBrUj+QJGK90TYOkBOErA+GsEPU3J7N9fpRDeSI
	Zlwkzovvh5AiUIexK1hHFwBoK0E0RAzGJY+h44dXXU2GHcGtbzxQB5kfyadHwjvevcBnoiRHuEF
	z9TsT47qLASf54bUllQt7/4pseEpuanKitPrWe8cwsw==
X-Gm-Gg: AYBFou2kU+eXHc7IRzp+8Tv1qr5yTSy9gsaahPc+TvKcXGiELm0D16cIxyZLQN20Fjv
	XgKFhL8+q7JUZabGiW7OZW9CJNR8dWv5Va6FXCInC1MECnZTKI1SR+hQI5c4NnDF6Qrn3d60Yz9
	KLV4noap4GC8sumN8hXH1l307dzQGzLFF3JyUCx7M6coxbd4h8ccUsoryF+sX6k1tSsUMBqAxyq
	sxKD7mz/3ISKwQzjSDASE2+PVHXMDEozkjEs21/PzIQMhKklHvTzVE7TP1fgK2wwVbMbffuyoHX
	W/MF62++buPnVD5m9whtMAEjHdFiri5sy8YgZJn7Xc+V8joJslRMPlTKw7yERxXzsmqUZCZjGYb
	2cIpxQh1YGiLNMCoOghD2CIw=
X-Received: by 2002:a53:e313:0:b0:677:b7cc:210c with SMTP id
 956f58d0204a3-679362ede62mr2859896d50.163.1791901021395; Tue, 13 Oct 2026
 07:17:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005064133.7305-1-kmehltretter@gmail.com> <d1ef135e-1b5d-4656-9229-348c7029efbb@leemhuis.info>
 <as0r7Q4dHt9gQm_8@gmail.com>
In-Reply-To: <as0r7Q4dHt9gQm_8@gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Tue, 13 Oct 2026 19:46:43 +0530
X-Gm-Features: AclHuK9yOH0W7FJ5IkLpKJOcXHUnKCWcM6_hFWllx6ZiiWF7Douv1aRrjUDfUxs
Message-ID: <CAO_48GGTHcs5M0WyY6dcJLxy1kUJq6uNLh_s+221t3HcGoMxSw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] dma-buf: warn-only mode for DMABUF_DEBUG
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Rob Clark <rob.clark@oss.qualcomm.com>, Jianfeng Liu <liujianfeng1994@gmail.com>, 
	Diederik de Haas <diederik@cknow-tech.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vinod Koul <vkoul@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Karl,

On Tue, 13 Oct 2026 at 00:21, Karl Mehltretter <kmehltretter@gmail.com> wrote:
>
> On Mon, Oct 12, 2026 at 10:12:02AM +0100, Thorsten Leemhuis wrote:
> >
> > What's the status here given that 7.3 will likely be released in a few
> > days? Note, I can see from the discussion that this is a complex problem
> > that can't be quickly solved. That's how it is sometimes. But I wonder
> > if the current state of things is the best compromise for now or if
> > Rob's revert or some other option would be better.
> >
>
> I think reverting my commit 143755bdabaa ("dma-buf: Make DMABUF_DEBUG
> default to y on DEBUG_KERNEL kernels") is the best interim solution for
> v7.3.
>
> Christian, Sumit, could one of you apply Jianfeng's revert before the
> final release?
>
> https://lore.kernel.org/r/20260926022026.10539-1-liujianfeng1994@gmail.com/
>
> Thanks,
> Karl

I have pushed the revert to drm-misc-fixes; I'll request Dave to push
it out to Linus along with drm-fixes.

We should revisit this for the next cycle in a couple of weeks for sure.

Best,
Sumit.
