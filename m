Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD014657F5
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930419; cv=pass; b=ByNhM6YIYPYkYCGm9tbOdceM+KGpVkqf+WnoijZcJAC3pD4IvAO1CAlwO8o4q9zKEEZUdW4kBEZuKvItClrRQYlOe45IBXpTrYoxdhWCBxDWANI4j1jXxPU3bxbodi7w22bKlpEph3J1SmuJ3vHkXWNN4VfvASKqFwUatgEr5os=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930419; c=relaxed/simple;
	bh=4WkAcgYLado3xLlFZo333K/JOqm39OaQQnKUMy1OPAU=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MR0Vg5LwgYfBCo6nloOQ/OHT4iXaxnqdg0WKNSYkCgHH+tI2rYKuTusa6ZVJWByOwh1tL9SdNqd5rz/EgTGQkSvhN6KVOKsYVVCMCDjkWShbfAo7hQ7BzY4Jkq2JOCb1dhlzexZPom5Lgm2phAHnWwEVZn13e0oBKy2Fx70SiAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKm4vTVP; arc=pass smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKm4vTVP"
Received: by mail-oo2-f40.google.com with SMTP id 46e09a7af769-82290755a1eso500854a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:40:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790930415; cv=none;
        d=google.com; s=arc-20260327;
        b=JoAnBEv0mpAAKidjLjCYmr6s2nbYOyL3frlyLHPpYY9dEjvziZ5WKxf0Bd21OePLSb
         hddJrN1fiWV/q2tXutZd22pm84cq51ZVrsaIxhEgb3q619R/7UY/6lRLbDWRo9P2sgyM
         OLNMZy0L7aHbH+nGMfdlKQyi6A7cQ8Bt+H2aIVi/JOXmAo/SzjQg1TaOQzv91cRNdVWF
         cm0enZKmy0ZQEd+Wl5Ux6bEqGvk3wbckifIJf5Cc5f8bxvdR0AVVVCqFlQd09Tx23sY7
         TDI7Eu5FfEWs/q09VkNUFG40TWX/hO5GR0SfiBGNBxVsHKQT326XOvdTM4bWEuAo1nxB
         jnXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=4WkAcgYLado3xLlFZo333K/JOqm39OaQQnKUMy1OPAU=;
        fh=kLPzj2sXzem3/6739ioSwJg31Fb8nmyy6UIWhnL4f54=;
        b=hrO1TGE4hEi7zIDuUUexx1BVzr9ipFsgI5AvzLA3SSu4fquF+A78Pntm69KMAaI3nY
         W8YeUJhJN22xxDYSJ+7j+T1tsMhwq+eduYHx5UM6TCyZDUckN/eCqidNEUagXCuMly/x
         8yIGqOOuKl6FjO+8V+rPxbDEWsWW1EjyLOPswjCDGZPFLEioDKRrbjKn0hJrC1LFl7wE
         JDgBZ7u6hRhLIULEMNRM/DpY7uBAN6u/MvNYUAiVoZtl2GgCdPrKp5RKIJQVqwFECZzf
         waSSRvxNjW5s7YFGvg+Z1HMuRl6UDVorL0oR+efZUz0b7HtXyxjIyAhjk0GVzbboAvlJ
         q1qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790930415; x=1791535215; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4WkAcgYLado3xLlFZo333K/JOqm39OaQQnKUMy1OPAU=;
        b=PKm4vTVPKnAuGzBx/+vHBPEpI9VUtVBh7M1EpIHVVFK5aJw0IoOfi7CCNoQ0Yzl/Iz
         RB1gvgbMjHyvULQNWpk5S0yxp2SQkyCO51+UCISwJZbGVg+R3qoCEfvMODwqXyI7NY1g
         bxqJVckDwSrf0D0kYRhlAOVXpXu8LEexJ0I8gGXoH0/zgncHDqbotBBjPuB+e4u8z5ti
         6LwdV/q1AAoUpUnlAcDTpQopTS5eoXZVbx5qYqO8JYJJbMYwNoDKOAw6mTX+bPSbuTYg
         AdwLCKQ6/lfDKnD3kL/PKrMAvEeawK1Y5eOaIex8JYVJHf4yc6RqslfNJ1dw3BDYA+SH
         tdig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790930415; x=1791535215;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4WkAcgYLado3xLlFZo333K/JOqm39OaQQnKUMy1OPAU=;
        b=bL+vfhPckKbOHBhW/8F6gbyrC8WUx0marIwD9bxLIK2cUQmeeY4P6xK8QmxxcCEQpu
         Y+PoTxMQbDxGcbxCrl7LrZ+neVgmggmekzTHslz/q0ou/9Prw56QeBaXZT23mdt8Y1u9
         ULAcGrfxOPPjfgzGLbOyBpgYsSniYk+GimrVNNMZUlew04i73G/bFu0cV5aYLKzsyo3Z
         MqVB6qqQn1zMsWNuI/Covek7+Jun5xmXpxGiAaltZ8nNq1KtCH8hUAqh80vUy3+smBxS
         bV9SV3HhreWjEj0b1+oQxvwTTVc9wPAFQa28hrZOXQuS6/cqZcRXxwfr/3+6qbMDKH/g
         Dsdw==
X-Forwarded-Encrypted: i=1; AKwUvBxTlnaWPDJzwCU97DpL/DTJsipTLzxJG0YnAXXg+hCI0TsisLMhTng8C91SZ8mWZaU7dfzJKEx4zQfBwFY=@vger.kernel.org
X-Gm-Message-State: AFuF++kmG3P2Tr5RxkLUa5AajxtM5ndpf13+jDL2KCKceDf09c9/7HeP
	+g8XKyjELcoGDJ+vYn4BoNlVFfsd1lvTS/N96XB+sNGustFf64RUYUlhKWtfK6u/8x8VQ2RAls4
	URzERg74OfyfwEF0GUjunQ7mtiPKoyf8=
X-Gm-Gg: AYBFou3Qm+soNkBngmY0nA+yzeS63Y+7iW7seeedyRiTilUs5J7VB5ci/ynDJLOHeZl
	mdYs6RFbdSgfiax9D+plQ4VjlKSMNn2+2z+FRry4FIbpbLVTA6etPCSiIIYfYKGoVEI0NQdw5ep
	ekz49jFfV8L+aEVmqidvNyxIaHIQPgS0uXjGdQvkZKTc1oL1Ez4dwAydcVtoY8K2QMfbarg/tDh
	ca4Xr7ciL7K/DgjPaDaT7PRC4XFgNv3FoGUdaXy3iQt8Aav6E/Vgd+K228q2AWki6I2K0nrGnxz
	p7cNMcsL4QvXHxFN6tdLKZZmhADhzzuz94PXEalexQRQ9SXeFPFYLRoZJpBBBPLAO3WpP4EWE1C
	G+znnmrE6B0JC7CsLED4Q4/WVj2E2c3UAqFk=
X-Received: by 2002:a05:6820:c3c5:10b0:6dd:4a4b:1843 with SMTP id
 006d021491bc7-6df32aa7697mr1233994eaf.14.1790930415068; Fri, 02 Oct 2026
 01:40:15 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:40:13 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:40:03 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Fri, 2 Oct 2026 01:39:53 -0700
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
In-Reply-To: <CAHp75VdRtMuSeS=39SXmLre=XKF11USi7w2HOGGwxP0+qBmPvg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
 <CAHp75VdRtMuSeS=39SXmLre=XKF11USi7w2HOGGwxP0+qBmPvg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:40:13 -0700
X-Gm-Features: AclHuK_f_8PDilm3AcjpkkUSo4CYULlSQZBGWXCxVQAmtvjbpYa5nVZnpOcKW7M
Message-ID: <CAO7O_xiT9L4M2NXz0gRtX-6toT7q6Ec_ZnyEj3i0RGc0q8jdxg@mail.gmail.com>
Subject: Re: [PATCH v8 00/15] media: Add Lenovo Yoga Book camera support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

> Your series is mangled (has a garbage), please, *always* read and test
> what you are sending before actually click the "send" button!

You are right. I checked the public-inbox copy and the Media CI result.
Gmail reflowed the patch bodies; Media CI reports patch 1 as corrupt at
line 10.

I stopped the attempted v9 after its cover and patch 1 when the public
archive showed the same corruption. I will not send the remaining
patches through Gmail. I am switching to a byte-safe submission path and
will verify the public archive with b4 before resending the complete
series.

With Best Regards,
Maurizio Casciano
