Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793118201;
	b=r9n4PkmVNqle8MZ1zLVW+UcWqeU64udqxbsc9f166yRrMei4q+frjV4my1W9lUjwzuzV
	 LsbhsSGBRgZbAg1kj/w5UyZtaIUSNkx97BmcA4AqbCwUAQ0+BckD29tR/YExST6L0nobg
	 znmV2hXWspJI1tkuhdo3+2+iyjWFHFCYHsvWYWiNQtbuZYjspaP2Ls8rzRuyyPSfxWE5s
	 HPrYIhOAtwgXPdaE+5jTfD8575/Y1rDSyBV8vfdZr4KfzWxcP+M2ml4fc+bNzlVbX0ehm
	 rLFNr6JWY5SFyC2uJeVqvE9xGIwvBeFW9pS7rjoSzdDc+GcjtnXFBMr5vq4yq4MTB1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=QqIpGBAK2KuXj5Mm6dgtYCSC1cgHN+QuSvgapi/y7rc=;
	b=2dLjbfIGAH7JxSBtYxEx6odtO6vFpZd7n81yWfJs1H7vwnh+hYOBd0k1N7Vv8bh9oD+I
	 Btt3eryUEUnCMI7k9Y3uA7RpQ31ZONwxwPQMYSEw01itGQjKDFHR0TQ9ODndrKO/Z5NSQ
	 RAHLvKK6KNvM69tnW+0fSrkPUqN03DxUFB74JP5r1pbZBKXB4/zHjMgkyOnUI8/sDCU6S
	 RB3JDnStXY3rVooy99reuj1vq/RWoqjszwDu5GLvmvxRggT29Fb/MAI9xkT5YgT8GVuel
	 7OKbqw6RIM8KaV/Tn6MeCCI3rGgLi+KPrhfdMyL5YhrND6ZjGpw9vyjl2zUr2C6n/3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XMLfp17Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AB4606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52AB4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XMLfp17Q
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b0cf2c0785so40986807b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:23:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793118195; cv=none;
        d=google.com; s=arc-20260327;
        b=HYPQ0xomjIBBxdH+qr3U3XJPtBh7sNPV8gGnzMZEVGtiICmfEasNjThYd9utJWlbKr
         w81NMhr4JyJ93CQBx2Vjv7Yd8Zxt58TKj3453cQhAf/blbCvYj2krdFV472hCuZ4Pj6e
         jXFrRQxQ7VIevJT7/ALOO2RDUr8LkZYTsM80ERCOvcJ1LXdRVvvH9R9QN7PSxPoaB6n2
         ch1Pk4Q902Q7KLlSSTLLVKkCPoEY14X2mv3cf4stsxh/1zHPfTmVa8GRpzYkNo5ahCr2
         A9tRirlG6L7Vv7uyGrtiry9M912TykUMD0MOHAApUgK2t049G9xfye4yeQ5Px8JVpVza
         Kt1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QqIpGBAK2KuXj5Mm6dgtYCSC1cgHN+QuSvgapi/y7rc=;
        fh=XvP8hvUz+Cqkutv76Lrh/V0l/SCE5QXVZhbWT8maeCc=;
        b=jxLYLst1dO1YuCuT0nCArz6utXiG9hsxKBQdhgdussnapehJ9YJxImaIIFurn2dLT9
         hLbP10HbtYyqofgRa0pJhoqrKf8b7ehWJyIGDt+r1o6UJjBro5qrATjOo8S87EnmR9tF
         Mq4emAX/I5vbk8Z9ONjyjspdPO27yutREUzzax4S0Jky0J6lb3OXDXnfzk7RghF+2jSa
         3GqHp07pd4fhsnQPYSdhzVZq+Rwbt/hwAUyONeh+DS129Uc0fe9XpQw7cmyxN9begYcs
         RwhFYBAFk7Is60LqUH+yV5PecF7h/Eq+ilDeZFMEr4MrkM0grcBjuXRJmP5Wvs//MqPS
         ymTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793118195; x=1793722995; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QqIpGBAK2KuXj5Mm6dgtYCSC1cgHN+QuSvgapi/y7rc=;
        b=XMLfp17QWzpGE0tU5jJjiCFTB4/tY1R1uZXh/9tzKH+JZ1EpWJ2QbLXtbTP5cwypu+
         tjIq070JZMhQ919gl5zS3WzV7nfdO1KPWvuJshIa/S+dz2u21UtLNvpH1XhMuz+LdWb2
         ciFjQL4BVuyLd4nuJUjwOOSi0oDx+zOAqBAQaG1KQEYjkJVEtK6Hfc8abC/KkMp948cS
         i9hjseDoOIgABmGaDlV6goSmNfAAg8F+ZnolgHqGCyV3+Lzk8LVH2X3H+YCe2m+MwOD+
         JTgWPwbRaO3AtEm0hz0NtgmNtn6WOJvCLcztaHXonJiERv1QwlhudS2pPCeDvSQY3rIO
         vJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118195; x=1793722995;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QqIpGBAK2KuXj5Mm6dgtYCSC1cgHN+QuSvgapi/y7rc=;
        b=onrBfNQPSihzUaPu7DEewr8EsXskY+GU/rf8zwtyoFO1o9j6aILUoDM6MONcE0AnPF
         6C0qrd0QaH3NhWPX/AebOqtc1K9nnqvzsLkwu8J00xdkumIpZCGXNaxpXVztFfBGFe4S
         1WCLFd1KwqvGJ8E9CWw2ytiZPyz9XItNa2q99Rof35cLcHRWYKRVag5NoPk57hV6X4Kp
         WDr9ze5PSlFQcnRnck2FHXhyAxZh2gyQ5VTksQ6isjhtE6QjGD884RuG6ghtme6ZPmLq
         cZpwg2bwDI4p6hf0qdflhnLjJdxxAP9D1k+ZbwM1pX/WcUV225c4Q3KtS43e/Kju2p/q
         DOvg==
X-Forwarded-Encrypted: i=1; AKwUvBxv5Dr5nYYe2f4De8Dg/tpP8mpOmyKRD6Ncqug0Y9TDScts6SXBF11ysBNGweJvIz2E0tfjP4ngrOB8b4U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIj4NN6Zm5am5g8I0azNHjwZpFtrpwJQC3b2tL6/m0D6jf6vq92
	G1gMJ5pLys8ZjBa0OJZKkIEWWoO3ieDmuSaN5pFJIRZJhZDHRoxWoGIDf8LAbyEF+YB7J9h02qw
	uKBqkkRyS2DaSfMBvALaUctc5+vZO+hk=
X-Gm-Gg: AYBFou3VV7i0Wzxm303Q5VKGzSM7SWqN2RbMINc6b86uUFBjturDBMzz+RXYmmFb57r
	pXhUdvadCuDkqdiZgsG0so0PNNksairzz2cxxID/5ZCcPOMYl54jXBT1LW68CXkPMTfA08ePue1
	3JFlrIHExu1KHt1trByCz2QavEho5GjdfqSVo+rWV7Cueu7KuUx6Z5susfLXlCVWZREuoWnLQL/
	RQgGcmcHoC9F9p9cNGOkS9gnLG+IeGMm461smoxRUWmCyKhELXJon7z0j21imrHu4BskMr4/dsv
	xdSubjgJiDFncJi3kYu4lOt7C6sCMEZBqf9IBjGs/ZOIhmCbYPAUdF3x/dR7iK8/BrhJfxDPG6/
	gN8bjTYWmxWt9RmUdF8x/j1kRiJzAgniVou67
X-Received: by 2002:a05:690c:ec8:b0:8a9:977a:4149 with SMTP id
 00721157ae682-8b166c208dfmr65074317b3.72.1793118195377; Tue, 27 Oct 2026
 09:23:15 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026111103.4158855-1-lgs201920130244@gmail.com> <908cb70d-bfe8-4d01-b64e-44ffcfe259bd@kernel.org>
In-Reply-To: <908cb70d-bfe8-4d01-b64e-44ffcfe259bd@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 28 Oct 2026 00:23:05 +0800
X-Gm-Features: AclHuK-tuXfD3-wCV2DoM9fPtRqDwLKmCfP8tZLuO8Qr1rY1uRTJcYQ15eNQu_Q
Message-ID: <CANUHTR9XrH5gKF=bN0s7Z2xP=5OzPEU8D8_Xwv4F+3rp2cUS-A@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: acer-wmi: fix UAF after accelerometer
 registration failure
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Lee, Chun-Yi" <jlee@suse.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Matthew Garrett <mjg@redhat.com>, Marek Vasut <marex@denx.de>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 27 Oct 2026 at 23:33, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 26/10/2026 12:11, Guangshuo Li wrote:
> > When input_register_device() fails in acer_wmi_accel_setup(), the error
> > path frees acer_wmi_accel_dev but leaves the global pointer non-NULL.
> >
> > Since acer_wmi_init() ignores the accelerometer setup failure and
> > continues initialization, a later driver removal or initialization
> > failure can call input_unregister_device() on the dangling pointer,
> > resulting in a use-after-free.
> >
> > Set acer_wmi_accel_dev to NULL after freeing it so that the cleanup
> > paths do not attempt to unregister the already-freed input device.
> >
> > This issue was found by our static analysis tool under development.
> >
> > Fixes: 1eb3fe1d3b6b ("ACER: Add support for accelerometer sensor")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
>
> So you just keep ignoring and ignoring our feedback. It's just bot, so
> little point to discuss with bot.
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
