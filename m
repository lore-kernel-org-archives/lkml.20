Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9046F4772BB
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787840933; cv=pass; b=EURd/9azr33VKA+LfNBaeETHRy4zCbQCyfAnx/xKUGMrzAHnIUIOrGatf54AG2+cVEKMgoBszVds3ZNsCf9BBhmQwGJ6z7zmHy0KGVS86O7wzcffYpsNdPA/MaOUZUBXg3EPkaqTLz/CY/4YUKTXOxLw1dvw9mA4cRKkIGblepE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787840933; c=relaxed/simple;
	bh=vhi9ep+bQeVrexD8hO9D7KsCbKUp25LBBrjX+Y5IaQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V6tNqRAp3x6RrteiJYlr4KsR2QamkeMHtcB9QpMJavWgIm5A3f1V19l04Xb+flaj6BjMhedH298Y0yO+HtwV33rw5z7B8Z1ggtNwGD7HZ9exLpP9Z81M838bTBKStZOtLkzrxKb2syDdORNEYcJHdbLeFadufs7VncauparY0Og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ad0ZxIPI; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ad0ZxIPI"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c252c7270faso277889566b.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:28:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787840929; cv=none;
        d=google.com; s=arc-20260327;
        b=J+IcqB7+5ehfnTOK3KhaFH+QV8ruZO4wVCFioJebfqfa3mww6dy+M0n0Omj4Utgo1X
         ISNWcNQHg4BnkHEZbWd7+9v75d6MIsTP8ocNPUaDqHTySkKRVeRBr7ImL3tQ7XPph3FQ
         pxegpQ8cETaJvX8slSY0MNmBcYODmcajVG0SrNF76pOXTKa2xLB59rCkdfuqKpi7SEEB
         Te734DL/dv/0dkYZWkEBsvqMsm4yuWASIBq+czlf2rTPxeC6+kVguTr3Gm8z+t43raES
         kbeRQQ24yKw5MKLUZTyTuQiu//+VuQ0ACFOna4cXT6XTlgzuQA9yGOplHIT/JiEQJ6Ar
         /9CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=H7NWHYQKU4joAJPyYxanKoDvZTJs0XozDUX3Hghfkuo=;
        fh=xr7qqSiWmKTBXi/76fsZCOd+oVhISt00z9RxiIB3su0=;
        b=KXs+untyd4crQ1Rgm11p6bhIIxmpoWKAmzNj+oA+t9IwHHjenAvw+pfKcIoXpzTblo
         STx/RqcFddHfg5Fb98s/65f5ZS2ShtJLdiw+4oZCHd+t3rXB50sVEUx0aamuY2gdJ3K/
         hkhROn6lUoudkXlBb5jCKUH4oFTYImqAKjRH0ikslWj00U+z/V/hogmrX7i76Gmhf4xT
         Xch19HxpzUXD56Idf6rzdhT/of3Ls+mY4yTmFgKdYCrzeZZRA0hUMbLL3k4kuxm6H9cP
         CJVYlyoF8ExfeP3hptCFmb59GN6cNqExsvXqgbAExe6jtVWMdbssv7fCWQKJUUBzDVye
         K1lA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787840929; x=1788445729; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H7NWHYQKU4joAJPyYxanKoDvZTJs0XozDUX3Hghfkuo=;
        b=Ad0ZxIPID+Ol7soMh/NZC59Kn55HP3nXZEokv94wlOkP6L5LvdQhbkb33O8C7/JApy
         XXq2xVzCsHHU2SEAytiAI21UaDWrnmQKWBr//sIfnS1H/8JurLfVKSsLw96MlsSw5SRs
         RWloO7hBuQmJrGKZLrbye7xRUA9XBmvoel/3VDQUfrAVCQ+lYLGZHIxTPphZ4vX7E+zq
         gKSU46alGeuhZEnCdRTqZj2qES3QJuPpwurO/gMVIAtWftPet53eUK94XDA9rvqWSWFB
         URRLOtGhjJ6MYjbkW/YMoNMP9bKx5u91OItlqQPn1Zqay1V0JU+aDao+LpvdhPaQ9vDb
         xSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787840929; x=1788445729;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H7NWHYQKU4joAJPyYxanKoDvZTJs0XozDUX3Hghfkuo=;
        b=kEWjucqiJsWhiMsZVtmgv1nfyH2qfhOOqLkOuWCNCip0f38yoqNCXXARz7uCPBLS/k
         Nf0HFSuUBiDg06tUlUkT1+LoSNQBp+ovfwohpZW31PDjDTTslz8Zim/JM7ph902UXjX7
         m9VRysV6m9C6BwzQmxS5vtyol4oTLxSs//StvnewdzVBG1oWVPSJ9kSQEHV7o38MG1I9
         97lp2G8ZGGsEWvGINU5ZPjTGVP/+g7YTjJ5ftgHM3auT07g0myCA3YwUBQxYnLkmCaey
         rL/7rFXqCnzlRkHy/muIzuQHuLr0ymG4OoDxJNQ01yfZRGMXUde38tx4KmFWP8bMb3X6
         +hqg==
X-Forwarded-Encrypted: i=1; AHgh+RpXb6DiyvE7N7ljI8P9ihOZgYBAM6LJkuxQqycDz8rJHIRs6I1iUtOe3DJRGR7o5+3/jDhswBk5xz2yXiE=@vger.kernel.org
X-Gm-Message-State: AFuF++nVIdTdkhCZKE/CbhzhQs8n8eXmY1DVSFH1jjUCGyjEd0SutVoM
	Lj9VvwerI8WFqLm9/FmqmAB0Ps75dPnKLd+dZg8dBgEvuG9hql5tEscUgHmLZu8/3ZFPuHJu4eW
	Nk6G4uTG19FAURiSMolEuvJ3zNsG/lOA=
X-Gm-Gg: AR+sD109c7XNxQHaKHZWRz4svrJaqo0NZPQcPw3aCIjA/LF2cLeICF33YNXDqXyC7eK
	SjKKOAM7oKaP2qEcg8uEKealwioUlrg40CKT6wpNIds5b0Kke0PgSYSp/VATh/pYzm3/E9G03BE
	xiVlxPTGb/nSCEBVwdakfnW9Q4UHa4rJYO+a5LRLmPl29RtlEVrWf4yrS4hKA/FLvvt0zlTsROJ
	fvZFMs6RCVMux3UU66InSRZsl9+zXxby/MknKRrPRuVMDWy2p/pIFaJFPB797pBHNC7k2dScGDe
	P8e0AVII4363nqZvZIOoa4a7M+DBTTbpZ4gk2XROmr0=
X-Received: by 2002:a17:907:e98b:b0:c15:ee0d:9a32 with SMTP id
 a640c23a62f3a-c250c2e545amr1440724266b.21.1787840928409; Thu, 27 Aug 2026
 07:28:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819101853.44681-1-l.scorcia@gmail.com> <20260819101853.44681-3-l.scorcia@gmail.com>
 <20260827-clever-cherry-zebu-6a98f1@quoll>
In-Reply-To: <20260827-clever-cherry-zebu-6a98f1@quoll>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 27 Aug 2026 16:28:36 +0200
X-Gm-Features: AcwNN1WwMj244ofyHxGC6S8z0K_T3xrDTw62tkx0k_I8FGnpAKJxs0-SepEND74
Message-ID: <CAORyz2KCAzEEsCifDF4+_wKmi=M6t4EKVVqys-H5wOQqzBeVzw@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] watchdog: mediatek: Add wdt/toprgu resets for mt6589
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> >  drivers/watchdog/mtk_wdt.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> > index 91d110646e16..f8208fb0f723 100644
> > --- a/drivers/watchdog/mtk_wdt.c
> > +++ b/drivers/watchdog/mtk_wdt.c
> > @@ -10,6 +10,7 @@
> >   */
> >
> >  #include <dt-bindings/reset/mt2712-resets.h>
> > +#include <dt-bindings/reset/mediatek,mt6589-wdt.h>
>
> I do not see how you use the bindings here, so my previous comments
> stay. You just ignored it and never replied. In such case:
>
> NAK

The mtk_wdt driver requires the total number of available resets to
register the reset controller. This was defined as
MT6589_TOPRGU_SW_RST_NUM in the binding header, therefore the need for
including it.
In your review for patch v4 1/7 [1] you mentioned that that define
should be dropped as it's not really a binding, so for the next
revision I'll drop that define from the binding header and move it
directly inside the driver. The include won't then be necessary.

Thank you for your help!

[1] https://lists.infradead.org/pipermail/linux-mediatek/2026-August/112272.html
--
Luca Leonardo Scorcia
l.scorcia@gmail.com
