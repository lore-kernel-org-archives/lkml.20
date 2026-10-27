Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793118134;
	b=c4f7UENyOIgV3BWobaS2K9SEcr7xmsy2kCrqaMU9wCmrxaFdmbXy2DbFh+BvQJ51lZOe
	 Vhs3IbPyUVnqrwPk6nOx19BtVbllC67oET6VLuSWF90O8A3UuWIuNIgAwVPfT2I3OYPjK
	 mofgexIGGleZuQ8O7rQ/9OsRuM2LnX9de2kdach/XhCBqIIgb3kgpNG9FKW2hlJ+6BQYk
	 gHis3OeKTNKJU4n6G2v7s2Xstje+8BchuKsa5UypDwYsJbvW2ZW+bugCGLCS7jBmG2/tv
	 xQQ+7xvUtItyrMGQ/WtAqv0zrtq0P71j4rvC8vXGlF8j85DBLSCuj6zcepVYqHNFNlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1rdLpGOdPiVaYichAmiV+HhfkwVpdUkenG+R9qH/YbU=;
	b=EcYPnUJOydIzI2A6PsFsaZNBdzinl44zJAoggPWc2gAlfkDor4qkLD7/mWs7LcoqI4kf
	 RgmVWci6lntsfUXfw+Mz+Prc9SwqDENjxiKvzxWH7Yy/fgHfWslFraD69X8tr09eVma/d
	 Fe+xGrd7l62kT5xgyibbb4F8cjOe1JN8i7Pjg0RUMaSIzz93GakgtnkJF0RF9tomGAW1y
	 5NLCwDBm4of2ea0ibeKK85rc4N4r2pmTogziVQHpHxJrs+GDp+cKEZ5f4WiawGw78nSLT
	 /7cKAIUCU3PSqN5Jjpv1p8pResUOlUrJZKgc0DxdhrVDzDOmOFK6oOIMWyve5CN2V5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ojT8056X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F4D606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:22:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1F4D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ojT8056X
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8726acc5eadso34913197b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:22:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793118133; cv=none;
        d=google.com; s=arc-20260327;
        b=EaqozHbh5XK2H/lw9MulmIWxyw/jitIOO6urjsJO8vhgwb1xPjY3forp6p92e7gXC6
         f0swFe4lCBtv1zkCBHppihKSVMf8eJ9/gDdhJGlGJIWivwnPBGehDpszh0KpwH9SBpo7
         awcdhDWhIEPSE6dll5+UrCjeu0yCkmmPLzyAhfFJk1jnZKZ7kP+BOYqArA9Gei+5Mh7z
         BVEvy2fOMJEAY+MFVrgvVzBT8q8EdLW/unnk091oxfzI7yN0doK5ev1vtaq/bde3qlz5
         QAcfRKez7cp/Yz3fYvDeiANuXj8pzvnxhRNAV6FjqrX6lM0Rm1driKlPfjpxRtNjgKz6
         qW6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1rdLpGOdPiVaYichAmiV+HhfkwVpdUkenG+R9qH/YbU=;
        fh=UCUudsjNy6bf4Ql/UDiCQ+DDOIOhg2W55EOt80fACg0=;
        b=Giz9tiANRd3iqyGRA4auGgXsSyCVBOt2jZfC0tCqxNbKcLIypLCkiW8Va/eLC8FXFO
         du98GQcaIEfS2BOsjLJj+IH2B0Z2n5vdoxwbNsuDe2AV/ayOOMpvKpgqLBfuLz4fmHON
         91QcG7e0hBlDx/+ppfunbC26TUROrVlKl89+rhZA5hZmx7noUbJMRq7lrJ5cUTq5Btv7
         NGKZDvmaPO2qCKR7F3SgVDlq4QcBlTNMfPicqUQB3/ERZRulrOaGsD0Y75ZADKSp0oCz
         ztHWFEitr5FXfKHd5IgP/yfDDxsdvLdYbx9UIN99OrEV+kJfNln5jmNjMJxA5iTXFBNz
         aROw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793118133; x=1793722933; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1rdLpGOdPiVaYichAmiV+HhfkwVpdUkenG+R9qH/YbU=;
        b=ojT8056XaWIE5tAJULqg8MFCtqI2PkKXedZdnmIwjDNx/gjdgoJFOYgr60aavlYget
         NAph7/TMSvyiX2/+G3WXKQEkd3e1zFb33LVIAvGMHQMyXXL0izVm1ASM7Y+M8XXTvzSY
         BUzGvYSB4BDmOhIdESLK59JnOefu+zKnOjL1FGkj60Qb6spc5fcaAA7pWcaRG3MOx60u
         tP9sUY1jo8Ud5wu6gKiyPGHwpfDLUiyKAyvPk2XguE6nN/deiikto7XBHpiM+q65pEHu
         RHN+oxpmvgdzMgReZhMbCFXcEt9tUwhH3hoUrasBe6SBx8sVaKes6Ik2x6Dib5DJ7YDC
         Njjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118133; x=1793722933;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1rdLpGOdPiVaYichAmiV+HhfkwVpdUkenG+R9qH/YbU=;
        b=obCl0GGbOYkYLCh7CxbwLxG9/BvNXIL+DVbio4h6w2/P8kmkZH/94R/o6Vwqup7Urx
         sI03dXbeSvH9TcNDOwecljdkO3dhl0uZkpTOwb1d5S4ll/SNJOQUpxHEjAFYuz+3uZfP
         abHVrtw2z5KdKw3+CwBh1DP156W6SkVndXcP+IZTey6Dy6sH6BZ5rPoT58fq923sDZf3
         6r9ooGqV6rrpa28LPJqze5q75vA4TmKqKq8YCBTgI1oPaxctpuZXRuKgQOmxZoqwfKcK
         LR7qSFRO1NbjMcBtTgYgxVlxb9REHe4jm9h6tzM09tmYv+SKVCWfUTLrwP12c68P4P0T
         rWnA==
X-Forwarded-Encrypted: i=1; AKwUvBzbUUvFjQb8rZiVdk0g0GTttR17c6ScXLZyNynyzu80+X8jFsdMUEJ2/Md9qnhtMygf63qrsun+zszaGmA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRToCR3C9+nGwl2NM6we5aJ+8b7ZldNDizep4GSnAxzUtn+oD9
	G0yN1qYGGYCYtNP2azlXzKpRoM4b2WTI7OUs6VfjYMAFgkzfwfu2Um7yggxcExE0TB46WBBzYjj
	bRRyoaN5nssgBIj7dL9nBx0HWO6+rOfI=
X-Gm-Gg: AYBFou1h7i4yOKeT8aHiyzgFGooofKtzVzSplP0sfDN5kWfcfUEnG//lU5uvh5Pfwu9
	V9KI19+3ewBkxWq6eUo4sd4jNXketaNBQ3lbnT1BI5JfLpk4ujK99ZuRi1TEcF8MLXfzXbjdC18
	P9ELaHbjvzF3Wa/sA92Y6Kpf6mEuTj55OIrNpr847UpcCSfO7GIAwHyocoOGW7Wj0tyuLIgiU7D
	KdSB1QnFem18eCawDLYLFoFnwK88RWaIOsEHlC+HC//Ta2AA4UJcdKoiy87Ittdg3ATK9MehG+b
	HWCr4e0MV3NLIt+OF7IpjhyTLck+iMTgzSejrz8mri9XBo7rt6lDuBKpArejRGL3euFmIYOOf3H
	wbaFhtyq8TCifquXDoDQAMV6rEJYCVyTbUxsC8N07EZkrf0dJrYGlF2bQ1A==
X-Received: by 2002:a05:690c:7108:b0:8a0:76e8:c738 with SMTP id
 00721157ae682-8b1667b96bfmr81615047b3.0.1793118132815; Tue, 27 Oct 2026
 09:22:12 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027024609.117371-1-lgs201920130244@gmail.com> <c04f2ba8-fc83-4118-a26a-76ea8cbee518@kernel.org>
In-Reply-To: <c04f2ba8-fc83-4118-a26a-76ea8cbee518@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 28 Oct 2026 00:22:02 +0800
X-Gm-Features: AclHuK_iX4SH8qBhnH28MTM8xZlzfsclFjVNEOpTxXSJI2-mCXDyAbwNghV1urs
Message-ID: <CANUHTR_VjDZiG=igkaiy=Pj-gLKchTwA-OvJ4KjVoC-nDX3YTg@mail.gmail.com>
Subject: Re: [PATCH] mfd: hi655x-pmic: fix IRQ action memory leak on removal
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, John Stultz <john.stultz@linaro.org>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 27 Oct 2026 at 23:27, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 27/10/2026 03:46, Guangshuo Li wrote:
> > hi655x_pmic_remove() currently removes the regmap IRQ chip before
> > removing the MFD child devices. regmap_del_irq_chip() disposes the
> > child IRQ mappings and removes their IRQ descriptors.
> >
> > The hi65xx-powerkey child registers interrupt handlers using
> > devm_request_any_context_irq(). During child device removal, the
> > device-managed cleanup calls free_irq(), but the corresponding IRQ
> > descriptors are no longer available. As a result, the allocated
> > struct irqaction objects referenced by irq_desc->action are not
> > freed, causing a memory leak.
> >
> > Remove the MFD child devices first, allowing their device-managed
> > IRQ handlers to be released while the IRQ mappings are still valid.
> > Then remove the regmap IRQ chip and its IRQ domain.
> >
> > This issue was found by our static analysis tool under development.
>
> More of postings by bot ignoring any feedback.
>
> Best regards,
> Krzysztof

Thank you for your feedback, and I apologize if our recent submissions
gave the impression that we were ignoring your previous comments.

We did take your earlier suggestions into account and subsequently
submitted a patch series accordingly.

For the more recent patches, however, since they address issues in
different drivers, we thought it would be more appropriate to submit
them separately rather than group them into a single series.

We certainly did not intend to disregard your feedback. We appreciate
your time and guidance, and we will be more careful with our future
submissions.

Thank you for your understanding.

Best regards,
Guangshuo Li
