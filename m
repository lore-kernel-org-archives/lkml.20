Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793120195;
	b=uenrlHuvkGS3OHIy2HbmW5eS7fEEn+21wBZtITyvXaRja0NQ0gcSKedx716Eu54JnG1s
	 /JbFqlh5XD9uhXUxdTRTkpA2Ip1nEkUjWYnSqot5+U1E7CDJNHGeXd/cotm1Xvyk4SKJr
	 t+wVdjN0A1o6YXNeB8EPRvFnMeRidrdJ2Tp0p7sIQhuttJeVlkHMFL99TSzoUdj99fu+6
	 aQeRXLd+R13UgNhIEhifp5WpXl+Q2J3V5hxJ4DWs4JDX4sy1qrtzbE9otRAlo9KH0nrQo
	 ULQQzf8Th0IVq+2pX6OwYUs7Nif/aZCx1Po7589cZC3UJPevn5hc53qaJ48RF6DvkKQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793120195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=uB/WSwKdSMSQP83dSeSWNnrK5HqaR1ZK69IbSUsYxlo=;
	b=0vehrDSSxAm8bmo0RdhjPnO+xENrLAIIoG6qXsHO0V0SN++H4RZqK19I3lsrPzHhuE5z
	 OGgUD7vpE5vxGM+gc96xQPfOB2FgmIvlcvGgzEroW3QbYTWmeid+Eyad2l1dRyCGd+05v
	 vq8Jm/2bsLSrHwzTCo77cUfPtxnRJv6CDICex/KLmhtTOgfyITLWIDq8CbavRDOwLeSC1
	 KARWjHkZXgGPfTWY2FGm2Zcv8nyP7cW4Dn82OrXgQDT01ijvHGEYfxGkoExyu7WvG53yE
	 EvWKIcK7F+R+d+GMP2VoUa4TUdVz6gITvCVFcJvzsP0CQraTO3PpLvBSRhTNvC79O+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lDYw6Die;
	arc=fail smtp.remote-ip=74.125.224.53
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DBD606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0DBD606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lDYw6Die
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6798eb0d13fso114213d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793120194; cv=none;
        d=google.com; s=arc-20260327;
        b=fMQGAQl/mG0XElN6D8dmyJTSPbVtoNpubmxCGpuYhcqnisaq+IkcHgs5xEcS9k7Jdi
         Hdhqo0zVGSWTqqJ5kPyBwwOPeRSlKF/kdQ+4V8P0vUdSZobEHk5aymDLX+hmrH6rxjqv
         Yqb6/pxv4I8TqOGfxE5H22UwwxXtFuk92zEhyVG7Pcp+Dgif3ezFtiqpiBgarq/CmK0Y
         Pekl3bCELeBNUMkrdIvx//40tbDbv7TLlAJeYOcZh7bEx6IKqQK6QQw2JegLn1HJUHbC
         0nNJyLQABmB2IXEvSFKsggt0gOVjIDVs+0/PKgprM+fjILQNysv0hquHwRocCOq4Z/CL
         v13A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uB/WSwKdSMSQP83dSeSWNnrK5HqaR1ZK69IbSUsYxlo=;
        fh=G/LQU8qfEDVKZwoZuOU9IhJ064/1xcLfTWBZGFLDMj4=;
        b=EfkVUKrqkurcrYUQ/j4UAvJCIKLMx9C+yN7dP0/9GOhRmGKQk1OJNAuIT9R+0u4KQE
         6c+mlt+3TgnHLXgz6FzgAJGYNzu7Yd90hKYs+DwVtc8qqFgCuCuWuR27a0N33VwV7hmu
         hE34LPKe5BqZ0x2ciCH5PlbKyK5+7JeKiBUehw7oE0dDvBtIT9qS7QXFoKJoso90WfoW
         42c7RPCrTcwWQ3j5IAPQIr+7SoY234GSpt0JdUHx631OaWDXH48qwVjejO1DJ8N1ktW3
         pOvosKrEiiEAmwT1jy77kmaOAEaCaPWaWsBM4zzFluW0DDiQu/KUO0gzpqz33LGg3OhE
         35nA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793120194; x=1793724994; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uB/WSwKdSMSQP83dSeSWNnrK5HqaR1ZK69IbSUsYxlo=;
        b=lDYw6Die2KdQMWd22enGnH9RlSiNSaboywe6ax/oHn4JWnEhFXiXrIqditAtmJIz4I
         ANqYdr5TYj/tBJQHNYsA3aOq5YM15k96itt/c90Myyon7yfyT0bzGguqHz1VlUG2n6oR
         XT33uTMw7r7IxXA98eA3MP69MFkoW/otenWvUEPHAH26nzbYQXFNOtWSOmWo7owoRg9G
         vdaf2sNz2nAnCUaFRYL6r5zLtAIJ+0gEauj9gVt6wzQpXb0Q35Y2BE7A30wkQuXzNG7K
         mlsHLYwqaxo/loPbgNy5h3B9vZPW24h+8UWJfrwr4yeqf7/u2Ts+6s0WKX98fipmIy89
         ldLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793120194; x=1793724994;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uB/WSwKdSMSQP83dSeSWNnrK5HqaR1ZK69IbSUsYxlo=;
        b=T8B9WNjrj8JSUV47Ya2buXkwgPIn78g8eI2zi/eSnLY61td4aqT8fIEQ4UL3lILqaD
         fmYUKHVrDNPwolLA7nlE3we5ItWOZOBAtfWTlLsefEJPrbmpDvEXDjkexfcaVEidxWsE
         ePKPWQCtiAC1WmiSouq0d4hV9wYOu1IR5SQKT6tK2c8vYy/hzCZ+fOh5dqtqsxy1iupf
         cxW4tNQ7GCXFxFSpT18k9Xrulb2RJiET+PVRk1c/HGuFGP31estpHjg4PGv3NT6W78NK
         pJqS6R1xvqhT5r8I8fCSfUp48ocUbgREAVWnc+lssRlcwvWdlEoYs3Ix2K3H/8Yh7JhH
         JGqQ==
X-Forwarded-Encrypted: i=1; AKwUvByf4IE8ItMjPddR6mmCihF5zbz/95eq1pP0PdncCSh6LL6YCQR92BAiPsBOUUEG+VYd1f6jvPsTA3xCc3c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNWssT8LczrnzHgX15aWVOqsFWfkDXOK6HVMa/HWOn8u9h59M+
	J7SXoq0Rh/+mke4s9T5vDBwnqy3+EOO0ECRL0caq6ANjGq2OhUKzWGgzY+NPXUeIShA0FlCdf6R
	d4HgEnOWkBaUjcX121tSv71bhYCZchlM=
X-Gm-Gg: AYBFou1ds+a6bVsJWQu4feN8lzW4NVtkPyNRNhWkrOFZ5E2nJSWG2VsbC/kHTFK8FEw
	1ooKF+Jc4qau1clzzkOewW00e3DMORDeHDLKs5ldQPajDNj3ogUX/B+mgiDZUdiFKQzl4LVJTqF
	5J+E5jO6/Rd0vw47bS4CC3JYqFl5S7neYRS6wpNudf0one1mmtS9MJWjcfQ4EG1j6vEQfv/+YPu
	Lv4grffYXAhQU1G+clEZsZ78zHgNZeE42YhAqWbOyseifEREJ5bzlSDJsy8H5mVHMnIcvVeYAAU
	ewyOqpt41cl3PqWLbTstpZwtdqdnSBV9gU6ubh1UTGzm50M9jtndwbbcfFtl54jUX9PGgPWeSn0
	cm50sv6cmzFd3bxdL39SxuqWDY5BS0i915k9LBw==
X-Received: by 2002:a53:c092:0:b0:676:9578:672f with SMTP id
 956f58d0204a3-67a7bd3d839mr38638d50.135.1793120193486; Tue, 27 Oct 2026
 09:56:33 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027032609.119226-1-lgs201920130244@gmail.com>
 <f342a5e4-82b3-4044-85a3-10cad08595e4@kernel.org> <CANUHTR-SJTiQvo__wbqosSQV958fkHGY33YTRFor2=EwDTdXPg@mail.gmail.com>
 <585b45bb-a9b8-424b-abd4-66d53076b501@kernel.org>
In-Reply-To: <585b45bb-a9b8-424b-abd4-66d53076b501@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 28 Oct 2026 00:56:23 +0800
X-Gm-Features: AclHuK-GfmT7NjkDsFJqpYDLgkQ0C0xdaJPsVN0W4Sw0aag8wcbtxfBX0j2KDkk
Message-ID: <CANUHTR9u0CMsRWj12EN-b47BazJ8Gjk0yvRHfe_G-BEbrJgGNA@mail.gmail.com>
Subject: Re: [PATCH] mfd: twl6040: fix IRQ action memory leaks during teardown
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>, 
	Mark Brown <broonie@opensource.wolfsonmicro.com>, Samuel Ortiz <sameo@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@ti.com>, linux-omap@vger.kernel.org, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thank you for your feedback.

On Wed, 28 Oct 2026 at 00:44, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 27/10/2026 17:22, Guangshuo Li wrote:
> > Hi Krzysztof,
> >
> > On Tue, 27 Oct 2026 at 23:33, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On 27/10/2026 04:26, Guangshuo Li wrote:
> >>> twl6040_remove() currently removes the regmap IRQ chip before
> >>> removing the MFD child devices. This destroys the IRQ mappings
> >>> before the child drivers can release their interrupt handlers.
> >>>
> >>> The parent driver also registers READY and thermal interrupt
> >>> handlers using devm_request_threaded_irq(). These handlers are
> >>> normally released by device-managed cleanup after remove returns,
> >>> when the corresponding IRQ descriptors have already been removed.
> >>>
> >>> Consequently, free_irq() cannot find the IRQ descriptors and the
> >>> allocated struct irqaction objects are not freed. The associated
> >>> IRQ threads also cannot be stopped through the normal cleanup path.
> >>>
> >>> The probe error paths have a similar issue, as they destroy the IRQ
> >>> chip before the device-managed IRQ handlers are released.
> >>>
> >>> Remove the MFD child devices first, then explicitly free the
> >>> parent's READY and thermal IRQ handlers using devm_free_irq()
> >>> before removing the regmap IRQ chip.
> >>>
> >>> Also update the probe error paths to release successfully requested
> >>> IRQs before destroying their mappings.
> >>>
> >>
> >> More of postings by bot ignoring any feedback.
> >>
> >> Best regards,
> >> Krzysztof
> >
> > Thank you for your feedback, and I apologize if our recent submissions
> > gave the impression that we were ignoring your previous comments.
> >
> > We did take your earlier suggestions into account and subsequently
> > submitted a patch series accordingly.
> >
> > For the more recent patches, however, since they address issues in
> > different drivers, we thought it would be more appropriate to submit
> > them separately rather than group them into a single series.
>
> How this that differ from last time, explain me please.
>
> Last time you sent x separate patches for subsystem foo. I asked to send
> them as patchset.
>
> Now you sent y separate patches for subsystem bar. You keep repeating
> the same.
>
> Best regards,
> Krzysztof

We did follow your earlier advice and submitted a patch series, which
also received feedback from the maintainer:

Series:
https://lkml.iu.edu/2607.2/05103.html

Maintainer replies:
https://lists.openwall.net/linux-kernel/2026/09/28/2917
https://lists.openwall.net/linux-kernel/2026/09/28/2932

However, you're right about this batch. When manually sorting the
patches, we failed to group the related fixes into a series. This was
our oversight, and I sincerely apologize.

We'll be more careful and submit the related MFD fixes as a series in v2.

Best regards,
Guangshuo Li
