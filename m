Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE543BFAD9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774639; cv=none; b=M8HHiQJ1NJiqrCeWn0uJbWBGd8sHTZNoAh6ByY9nsudpvAxoChdUZdNJ75RsjT7yxhm7NRkOObQXuR05VQMpv3gAcoPs9r9C0Sj3x9jjExbRnQjzj/qeg/2vhiavxL9C7FreEKbJk8Wt+rlKyilbBHRTA3pi2gqwQA05Af9Z18Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774639; c=relaxed/simple;
	bh=EJi4g5va8T1f1BIn66h2FvU8Mw088XXg+dMLppSZj+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E61VfUfaT/vy3zax6ic3BQjApVZdSkq2dCMi6vsO/94pBoovRuGRpXIoYm8Co/c0oQju+RUW4Hbixjn7Rl8wG+11HwCKpHgwA1WaNIA3BT3Msgiq96+WdZj500Lwzi2YVDOA5LydMs0VwBpdrzmtNEXwBSWUCukQS8b0mB8N4gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5bf9506704fso1502977e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774632; x=1789379432;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jpyiT01uqi3z67FMkXpZRYNDQ41NByhvT2i+cHhX0n0=;
        b=ekyqHhvPFhQK5rzCQmzXNK4NM0leSlmBIHk0JS8wHYgfBw6oviJCA9MQDdYy8VIR3F
         tQNMK8AMou8Su40z6iKfSFRxnUhkUQSxF0d3HEPKN4m5KKWT/3YBprrHvC69TxhQEhC5
         bp5j5/4zt/6UZ/gpH7V6JG5RAn64Bt36c4n9EHmYDNXR7KCVPl2WCDrms+EcWAwMk2LN
         fYm3vGvOiNRfPd90nljexsr170q2y9+8+z8Mg4o8AZ5VWE9awUfa9uLNsain+1uj/kk/
         FXNKQTudDpirpRpsEiC1FF09psMwaW99hN6gWBHv/BXs7an+lXdn/wmo6jeS+HkmL3SF
         I8+A==
X-Forwarded-Encrypted: i=1; AKwUvBz5oS6/4GclDrD4rvL3i1La8JqJT+avZTwLbBBmA7a4teGHNN6V/f/XBvOJuBpPLcmziB5pKDDvEyv7IFM=@vger.kernel.org
X-Gm-Message-State: AFuF++nYYSUKhjl1PdhI+LO1A+PZnm027Dem1Aqrz9Mc9ohSHoNuC6WO
	LUZ9smkVhzuW5tUWzMNJKwIbLGWN32M8uKExYUVSO0bptxCjbEaXNp31o1uUZHnu
X-Gm-Gg: AYBFou1ew7mhT1ZciepkbYVqQv5kLCWhHV0+mjkBewxa531Euml0Hr8xP0o8jIbXgJo
	dePRtI0qxTu1bLyY/CN0OPFmB2TlPLdR5IflqOlDEm53E3Jhc+U/zwCUsWrivyYXhFhq95hbGUp
	y306PJKbu0/L30jATjoxyMMBI2Txv1azXWuLlify1zLJnI6ukA8ncgpUHGnvP1BtvovBq+sB/Nc
	CvJGLZZ6gfsjeN1snWAgLEUfi+Fi1I4n0vLsMs2i6Hi3plCmWRLiI/soVoxIXF7ErWky1gkRoMM
	3IzLxU49S6FN3HGlp9HGXbOzj3G7uZG3iRKTfpG4zW2BLqyMxW692tDqeMk0Mv6NsptpE44fz07
	pgihIXOaXkFUBWDahyfrqdNQTKcmr/AR+FfMQQBZSMmlLph4tmqEqsi2msp8dpDmMD4vD3cuvCr
	2XMYVFmcP2h1KmIsZYWkdrygAUmLU5itYuPirv41bzodC9xABRAYFwE272Uu6FTHON4xivRr10X
	fbt15zrPb1l+2IBNywnWxoLxg==
X-Received: by 2002:a05:6102:644c:b0:786:d33d:af15 with SMTP id ada2fe7eead31-78a4a94a067mr7464939137.6.1788774632576;
        Mon, 07 Sep 2026 02:50:32 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808eec7c37sm6931500241.13.2026.09.07.02.50.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 02:50:31 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-784980b88acso1051577137.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:50:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxkytJFxLafhrLtWuNDWGLIuMAFkyL/HU+LM6js+V2drc5VacE+gG3Yf3isnued850vxZcHVdhtUJlLpQw=@vger.kernel.org
X-Received: by 2002:a05:6102:2ac4:b0:778:30ee:f44b with SMTP id
 ada2fe7eead31-78a4ab31a99mr6505412137.13.1788774630709; Mon, 07 Sep 2026
 02:50:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907090956.2825703-1-arnd@kernel.org> <20260907090956.2825703-3-arnd@kernel.org>
In-Reply-To: <20260907090956.2825703-3-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 11:50:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdULSA1XeuyNR2oM0m3bGt6HzKMZkYYKEchy49nztpgNww@mail.gmail.com>
X-Gm-Features: AcwNN1VEYucUOC047DGmcAJRGb8pjtBq2r0j3GGqGyncqZYd9LFOaI3FEXXAmV4
Message-ID: <CAMuHMdULSA1XeuyNR2oM0m3bGt6HzKMZkYYKEchy49nztpgNww@mail.gmail.com>
Subject: Re: [PATCH 2/2 v7] gpiolib: remove linux/gpio.h
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kent Gibson <warthog618@gmail.com>, 
	Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-wireless@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Sept 2026 at 11:10, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> After all other drivers have converted to linux/gpio/consumer.h
> or linux/gpio/legacy.h, remove the final leftover bits here.
>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
