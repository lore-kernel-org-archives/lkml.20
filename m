Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793985023;
	b=l8b2E5zx+6wJwz5JEdNkV//yT9NCO1PeYIZRmYnZou1DD6rHQxQ10KXxEBMkZu1FVV/P
	 3YyVwss8QvTmHlefeZyv4Sz0QSdbBVFoKcxniYNuz+QQ8iPeNfTLpSxC3WL/dREGhooJw
	 /SWpLn/ACIKQmBNoGt1z22QMM68s0Yhb8vkOq9oQc36toi8bD1mA8ZO0+HlUVtne6KzBI
	 OZc51zhfcpDdUItRpya/0YUueTUoghf6Ehc7ndyUSE5UWlakrqeRRYWntnhEVhjfoI0LX
	 tlYINW9IfJRGixa9zBN1rorICxRdW+6006ctcSwzsYoC+36Q+4hnhV7VY5f/9d+6EeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-Mailer;
	bh=V9n1CV17mWoyinWHCGFvDxtvvBlrLNzZtRYoJJeVLOM=;
	b=MCLJigVmiKnOV95e+O7GDBGFUc1rb0/cj4u3sZKZfRjLhO3x0ncfJ/6Msv/Xm2hi43wF
	 ytfbRT1UAPAM+uIxXsYxy6Y4/U3dGSOKEFjvV9QPkiEDCKFc7gxCyGJnjvmrYhczQvk7B
	 Mf7ew9fvs3Y9s09TLPd9C0ETCj/UwPW+nj345sXea+iYcOPsBiU9/rywk7efpCFXfOOXD
	 7aVrcawOMPUr5ubwhSb67zJ0hWZz+iXrBXmUi8aLzOAyXuYLwDk2QPrIsabItlP7Jkpk8
	 EyXfrHEQ/EPhn27+ZE+o6J9DSpE74djoyQLX1pqeUv2YdINQM7X4tpMM0qHgwhm8iqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JmCY9+dU;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF730606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF730606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JmCY9+dU
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a214af2076so6265745e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793985021; x=1794589821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V9n1CV17mWoyinWHCGFvDxtvvBlrLNzZtRYoJJeVLOM=;
        b=JmCY9+dUgxS5al2xR2i/XttbJnL8MfzEPMrncmnFAJnVL+gRl4itq+wpGv6Jzso3Yj
         lsk9opNlfH1q6cogTLxcMOr/jZwaFd4QymTJydkFSRwHxhBqO5bObfC5so48hHssFmrq
         sICMazWWuMHYi0vG8N6PXOEBpXAVQT9rLSS+ierixgnKOc2BfrhI3KS/yQhTLPPENp65
         t4QE/4ntdP5IOo0BlYwugM8vilNwIsuvetXiqAeqJsnjdvK1Nk6hiXO3yzYG3Iy/6PeL
         r1vVQNWfuH1vpSk1OE7ahsO4yut0wnGR1Np/teY+XPdds3Esv96rCGDLziZNRgq+sfZ3
         SXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985021; x=1794589821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V9n1CV17mWoyinWHCGFvDxtvvBlrLNzZtRYoJJeVLOM=;
        b=uhtm0HYZHDYHudAZtTafElF0NsAYUmzkfV09V+SD3XZirL+lvwNfB/dRPKPFqQrqaF
         CS7IZ9pn/+/UpulIXXxR3Ct1Zm0rw9dpaeH4OMiJKLXlg5aaXjhZLzutzDUVKyiSmRzi
         k7IGgItoEWrSVxeK9BsSXiGrvPJf+vK6MzkJQBLKKrpoCSt7nOjJqY6xuZr9KKtGx6b+
         S1YHk+AxOfXyqycRA4UAnUbeDgYhxqZA2TpKU3yLu8RCpihWXLChlLYdcRGlqP5PZaTN
         jgYfWoQotoN+pKGtqYNCstN4crUVirfRj59nJWMOGPF+fORQJL21FfjU4jWEwx2RSZTL
         F6VQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/H86ddgk+bzXN3lIVQ9XklCwcp9RTPvovpOMVZhKfOSBkFKgyueg2mdz//1db8WVROGFy21Kc8hi3I98=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LM+t3UsIrXtElxzj34smsXBKOUt+FB2sNYptrooc9cJpm5pgB
	vgmhNNlyzulvfh+1k59epEkBTI+2+rpZRNWtmMFfwI9z4L6/yqVhK+Lj
X-Gm-Gg: AYBFou2XuRFnKhd1aBcds705J+QUviTfL5RVyjYUtSJe13UvRD0GR/mEVfmiILMldGq
	RJWcoG81nelYzFnr2p16qIW2NuPsAS7+PgEabjxZrGMILfs+Rj88NUqnj+4BuMkLaTp9KPBFSlD
	RVU1z1Xg6so61Vck1awuiYU8wfzWiu7/2Xvzt1canQ4mx+6lar3hY11OadGNIINKN+sP513oWAB
	1+e+N23xkjS3LnaPgJuNw3f3qRQqwGK22gwvHJl0HSrVuKNhfMNQjruCFVsKaTmSeoqN9bednex
	C9dBzMAaQk2fyTust7vhs9nHGe06qWmmdx/bfG8xk3uGpeZiostmYE8+qTmsrOhca7ZAiytB3tD
	i5PPz+r4W9dnhu9DFvRBkPrp+zmQl/d2tJZyvLsi726Yf7d6GGQh/fyIkT7ckVJHUMq1fvhrSLL
	4inX5FKMO6macpTa64CYtUhk0va+SPHg29LceGdQ7w0ByESjXmvlZ91UiMVEF0lstJHQYbbXRHy
	0Zm9QCMjIjTcj/3oBcLa8x/k7EOmWymShrfitbDUwYIWIOeeOaSNGaKqbkW174k1uV4sCleKbtx
	Ox3ARBxwZSO789s5rPo87QiJYwJN08rm
X-Received: by 2002:a05:600c:64c5:b0:4b0:a7aa:843 with SMTP id 5b1f17b1804b1-4b6df4f1dfdmr55413875e9.25.1793985021160;
        Fri, 06 Nov 2026 09:10:21 -0800 (PST)
Received: from localhost ([82.77.126.113])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57317cae5sm238886225e9.12.2026.11.06.09.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:10:20 -0800 (PST)
Date: Fri, 6 Nov 2026 19:10:19 +0200
From: Daniel Matyas <matyasdaniel006@gmail.com>
To: Nam Cao <namcao@linutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Lanzano <lanzano.alex@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [RFC] staging: fbtft: Moving fb_ili9341 (and others) to DRM
Message-ID: <au4J-0GOUuueHLZe@rabbit>
References: <20261105201154.37294-2-matyasdaniel006@gmail.com>
 <874idv2bol.fsf@yellow.woof>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874idv2bol.fsf@yellow.woof>
X-Mailer: mutt

On Thu, Nov 05, 2026 at 10:47:06PM +0100, Nam Cao wrote:
> Daniel Matyas <matyasdaniel006@gmail.com> writes:
> > Questions:
> >  a) Is removing fb_ili9341 acceptable, pointing users of other ILI9341
> >     modules to panel-mipi-dbi? The KD233 node would then have no driver.
> >  b) Or should KD233 panel support go into a DRM driver first? I don't have
> >     its init sequence or physical size, or the board...
> >  c) Is removal of all of fbtft already planned?
> >  d) Several other fbtft drivers have drm counterparts. Should I inspect those
> >  to see if removal is needed?
> 
> IIRC the main reason fbtft needs to stay is because it supports parallel
> interface which is missing in the DRM drivers.
> 
> Nam

Thank you for clarifying. However, the fb_ili9341 driver uses only the
SPI interface. Is it alright then to move (or remove) those drivers that only use
SPI interface and have DRM counterparts?

Furthermore, would there be a need to enable parallel interface support
in the DRM subsystem?

Daniel M
