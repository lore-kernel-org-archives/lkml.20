Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0154A3F13
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788862687; cv=pass; b=cw3kPzUZGgHXyuZNTYIuDmh5hFGOfNkmMsGBV0N+mYyQ90wq//RnjhPXrFLR+QhECyEXevydfkXyNLBLk3KLPmbzGMNZyJoC8WFpk6TZgxjOBYUWaPRCpbyeD7Qubn3CNarGJRBKjYx7lS/S6E/PjUfSyP3l1uNBr/XHhXDLoWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788862687; c=relaxed/simple;
	bh=JWKHM4xhjVVj9o1CYYnXhN5iVw47R++Dsndo96mshq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LJ000I/IwqKN9LGwy3SFdTmpHbZYhkJeX6H2dpTnr0EDoJtvBbkJEWtWioDikhXDt22/Mgl1i1Ms7d8ibvLfS/6miqwpszJfuYTcy41T/59yPBXgYOGspD3YS0/M7bi7AnnigrDXtPH14bfYDDIINZsOjdnAoqJt8l3yzGHanR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eM+S9Xbv; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eM+S9Xbv"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-81ecf499af9so56636627b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 03:18:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788862685; cv=none;
        d=google.com; s=arc-20260327;
        b=Pkr+uz6tzb35lIZzWTZSo4r6TYtWHKCQSwX+kzEZMnRW7odAChZWeSvOCApYvlO9rJ
         xOSM6fljqaZ/ucEBPg0X2eiwQcqMUTHh0LvIhA6qs5XCOS5bMHYTzdFXSc3E4X6SVqYG
         pG7LH3GhiwdraIdzFEqHEzgsK9zG14d0242awjD+izqhnfQ5GHXd/wED3WvexGT8iuhI
         MPRhVEcBFfAj+SoO7C1Oip+U8YxUmdy2pEpXFYsouxlAIA/MwtA6EKIdVGI4aHWNs2Zb
         +uE41sNv0KiOUHXhsx9y8yRWjyYi0t80z0/kePC7txBstjI+C2zsgG2DQk2dFNDn8jwk
         13ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cLIVHgmWP92ScbvFBUNRbCINvKyYqSKCdwo7uYzpFHM=;
        fh=vF0l+97mE79Lc0V46UyYT5o1zFumctGDdcxCaFudOdg=;
        b=r8b2198yTT4vLGz9DU+3SRWAkLVvwycPFKSUVCDVqoRHTVfyF456l3qTjFCIP4x2BW
         N8uEpa3hn6xj1+xVxjpb7aPRuoX3khp7Mb81HhnrjrfJ9+/4w0Ta1zoyq3gRFPTgfOc2
         mLW8/7JyUZzzpmpf/mLVYIAix5xZ4fUEe6KnTdRGhfi6BWTqA2c3g4k6Pz5GemXawVsN
         BdaWyJ3ZlVdK9CKXWXsCRcM3xUhcm2tBgTelzqZ/VhOKhftrBq0w9xdtwTVcaQVEkpAU
         K3Ga3KsfiHY2pFaZFXbxm6XaZq9ByVij1Mzoz488wTJa6rQHVD8soiUUUoAY7qrjnZYJ
         837g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788862685; x=1789467485; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cLIVHgmWP92ScbvFBUNRbCINvKyYqSKCdwo7uYzpFHM=;
        b=eM+S9XbvtDNL80ueItEh+MbBwkv7Ct9ZQRnv77MU0MH+674HeDpBd86h3juhgMaihg
         jSDeVc6EEkjNZSpiEmprkSnT7pxW+fr+TMfxBNvrV0e4SM5iU79SNlcR2aOQln13eUIh
         phsKcgtOagx+HosLtNqDZTZ6dD8CpGUVK5YSFNm4q7sXRd+hh1dcBEyVOuilJ6oBSTTp
         Voes9rfvKVexEjaug4KpLzo9xOQ360xvIpE9fYBmV5/NcwjCN/hdmpLkjAE8xLWY1Ecr
         MFO0KtaJhyOd81shINN7JFpSdB4ygyvMCkLJUK3XRh3gOwIX/u/OXCVqyxXitGWkobmQ
         OkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788862685; x=1789467485;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cLIVHgmWP92ScbvFBUNRbCINvKyYqSKCdwo7uYzpFHM=;
        b=Nhrldu+Kn2GDVzNfL3GQklbCeJS5gWM3q64Qrn8aY5GId954p2ZGuAiO2gxywRyznq
         KX/tjEDSaFTOu/Ijl42cYj8tl6JSL80K6SqPfYLyDpda2ygmkuHkFQIAU7G8byJDaWYF
         sHkEHOvGyCTkbQvefo4SzrBnsMXtBtBH0aBvXzecnIZpH79xtt1bOQqYh3ZflgrcZ6oL
         gyAIh1kS6k5nc9XvZQOcK9vAUbWtPCyMOjxStiSdckQcXM5Kum8OKJ+TBg6NHPoDG/QE
         Ptj3ybRZKniGv5epAe5PPUEUYDEVvnQ5W6+lhwWu3YAeuD//LnkPvgf7t8wAWH3EHp6/
         PKdw==
X-Forwarded-Encrypted: i=1; AKwUvByBl+d5w9BfAgZdt03MM6QKEPyt+KD7pyHo9S5du+b3YJTt3gsNvLOQy/wTBpam1WcMhlYa4NwXvzjH/7w=@vger.kernel.org
X-Gm-Message-State: AFuF++nd1h4FPxY6h+nPdZoNcMTuwz07ZEtgGlPDwQwHrBv4DDeJSQ01
	b7T4GLYuLvLAkkUptyjJ/NAmUTiTXDdLWIGwkoPwEg4D5utn1b/kvFkTTN2oKyO9gBKeNxmmQ87
	+teLHpyA9HDSb9YcplDnOeJUz5PBjAkvNr7XSgcpWxw==
X-Gm-Gg: AYBFou3jbyDsRLZIqJAuGflaPQC1kYpRDUfe29r6QwDbl1HxxnCUssi4JugstqIDzgQ
	8G69NxR7bUMQ+dWT1dxHdNBX3TXe9ljReEC7n1oiGZY6vN4BUuPRPtDdqYzJHQ4MZf76QxbRQho
	ykhYwB9KvLfVR4XQhHS64ebKKoRP5Ser/VqCCkJKXSZcebUdENL3qGJBeH8cwvVrJZXUKZ+esxT
	umXxZmDiqLOqQ0lnKb+nYzIihxct5RO/S1q5UrUuy6l/m1U+imKa+USVuafsAgOBcm/vVdWBmwg
	KcxTpvGleuj3AbgcSMLJVlBf7vnm6+HtjEFgom2RMjCn/2nCoIYE40L15d8JHZOY18owR9GoGAi
	Esu9XSPmxFAl8i9jo1kwQVJAVEeecM/F0CteRamv7MkPa3DJHDHhaufE4rzC6XIQ5nLiVl1RDFL
	ZAVl6x9YUKRKrEF1p7KSRYIZuWVUXOTM3/Hgnn3+9cp3Y4zVvNrLvbOrssnr9aFVzPEzINYfpX8
	by4SMUT7G8wXNvuB/TAqBNI0HlUWP9qqBvxfmsGYo7Lr26oQ4ZNGSFJMBO9FQgW87sT3lMNVSL4
	zchSBiKJOrmZ2IV1xJ2LCFaAzjxndPOknxiraPOOteOLxdJ0PXqeyDAUWGuxFuPyMPDZ/8uNGdZ
	vGQT1dRGN4cvmNXP/zqEZkjA00YL3kpGo6p+IaFrPx4ha
X-Received: by 2002:a05:690c:6602:b0:858:d6fb:2b9f with SMTP id
 00721157ae682-871221ad847mr97459367b3.5.1788862685448; Tue, 08 Sep 2026
 03:18:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704003341.3923900-1-junxiao.chang@intel.com>
 <20260815095057.2461943-1-junxiao.chang@intel.com> <be731d49-398b-4b5b-9de5-b94d53177f94@app.fastmail.com>
In-Reply-To: <be731d49-398b-4b5b-9de5-b94d53177f94@app.fastmail.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Tue, 8 Sep 2026 13:17:29 +0300
X-Gm-Features: AcwNN1VCPP6_XNPrA1Kh1llyOtPA4jWMwQQl3eSQ2tuDlYnGbLuTpGFYmwCQdBw
Message-ID: <CAC_iWjLP1rXqw8dAUzPcZUK=pr+aOXY4w0zEW+WjTC2Kmfya1A@mail.gmail.com>
Subject: Re: [PATCH] efi: add dynamic control interface for EFI runtime services
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Junxiao Chang <junxiao.chang@intel.com>, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 13:08, Ard Biesheuvel <ardb@kernel.org> wrote:
>
>
> On Sat, 15 Aug 2026, at 11:50, Junxiao Chang wrote:
> > Add an interface for PREEMPT_RT kernels to dynamically enable or
> > disable EFI runtime services.
> >
> > EFI runtime services are typically disabled on RT systems using
> > kernel parameters such as "noefi" or "efi=disable" to avoid
> > long latency caused by firmware calls. However, this permanently
> > disables EFI runtime services, preventing operations such as UEFI
> > firmware updates.
> >
> > With this change, EFI runtime services can be disabled while
> > real-time workloads are running and re-enabled afterwards,
> > providing low-latency operation without permanently sacrificing
> > firmware functionality.
> >
> > Signed-off-by: Junxiao Chang <junxiao.chang@intel.com>
> > ---
> >  drivers/firmware/efi/efi.c              | 31 +++++++++++++++++++++++++
> >  drivers/firmware/efi/runtime-wrappers.c | 28 ++++++++++++++++++++++
> >  include/linux/efi.h                     |  1 +
> >  3 files changed, 60 insertions(+)
> >
>
> I've queued this up now - thanks.

Apologies for the noise, resending as the previous one was dropped.
One of the things that changes with runtime services is mounting the
efivarfs as RO/RW.
I am pretty sure nothing bad will happen, but is it worth the pain of
remounting it on enable/disable?

Thanks
/Ilias
