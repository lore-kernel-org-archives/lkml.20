Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC773F106C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861555; cv=none; b=XrxNvJVgoIM6OCBOBlpIKef73gMtfWwtF69lhhXZbw7QtDFWrCe4b/OiXQkBonp/UxGy3cBgMkmcmMWYfjLhgnnY+E0k6MxeW5Mv66kZ3d8aCAdCcWuCsmQFo0f46iqnul4pSMHJR3EEbOwzpnO9YV4vguSgGXeG/qOG4NtAxac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861555; c=relaxed/simple;
	bh=3MWgRPJt6D+zjmI3Wl8QcK/1SWMhE1qLRXA8MiA954Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IfWP6MxhHfRZSO9WrR16sl1rdjmQ3BMa4iG1rzjueypZ+dy41rkm9+l50tUGqaJWwzkFlqCctSm6hEyLd3cXY8W4yJcP1vGrjkvdJxiimWgOGOFN+WMLnn2Z1AxDgAMPhxiID20VHlnz4kN+ga5lr8FKAe4SEDA4HBnK5HA1uSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-782af6c753cso3961227137.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788861552; x=1789466352;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NqiqRUClUQHn3RWD34Rj7ya4TrrYBw1oXhZrdghcnm0=;
        b=YXil22Nm0W4TXcVEOe5sQUlg7OLVJ0F+6YFSmFOTrxwUPuf/MkjpWb3vS3oIcd0iXN
         Pglc84eUIFTJa2v0vAzy4bRN9plnToEEf2RLOTQdYhO1MUByiznH+9TyZKtW8xSD0S2L
         FORXnoG5lfn7bIg3cymHJB+MwUaRsqbFlTpQ6BsCZAQdLjD/QYPIlbZIHxSuN5ZDOHwT
         /VskIdOzAwgPv7uPomfM3bgDvab1D6AGDT2wj/UvzLQbQiHp5PKBaHPrnlvcAgVZJ48/
         sba37YrJ3rPpCGEZQz3DgL2QFHkj1/jefD1lwc5YLIEStCBXcj8+7o5D+mCOR2xGDIo2
         4pww==
X-Forwarded-Encrypted: i=1; AKwUvBxS/Uvbsca0tQsf4F+z+eQ+H11zVQwFNNnCx01htoC4RbKWKFoa5ci37RWt2inK2CzdZ1uVUgxq1UuOsmA=@vger.kernel.org
X-Gm-Message-State: AFuF++mnrrCfUExAadnbfKOJd0coVo72qwRBdUsJ9z1N7WnNHK/l0TVQ
	7vYLUymiyrH0iTVnAI+bAacW880fgu/zUff1hjaAL2S2xATtbI2aHEpSO/MozJ8J
X-Gm-Gg: AYBFou1HpPo74w2NZmoYeZx6ihfMgRvtvFslnc68k3oOOTuTeZj140hGwYKNSFF19wk
	B7HJg2FnsaB79975SkjyAb+C2WFFYSyV1AcvDqzTnTRHcBErkpg3DDwkLKjWXexioqDtprkLCQZ
	dK4qD4tmjPx0eWtkIbf0/BpsGoIVwoqUq1k1ZmF2wWbdioYMdntkILCczDzYSbKEQovBm4CZ7XF
	mDA9IXUUaUOzzMYeeGmPMFOR6xjHMW+oljXCyz3SxN1R2/+Wq7/UuWKX6KQdT7cNepHsWkGFcA4
	+Ka6zQ+qVkZVc1s0V+4UCxub6hjyT3Pt1waGKxw3dDpqQJyTKJepuP0CasjuMx/eDFxIlUlDC/4
	oaudzMg2abSq/v8gHPdaQEL780Xo/8j+JmkYvEzIrYUhhBP4bmu7Z7jznMhQH5IF7Puyw3j8Pim
	YTshQud20jubnFriYRCWctCHWYnpa240o1SC+kOBPBWBVgUjRw5KYxmrnvL6jP9nyMg62AvzW55
	rVjgzjTT04XBt8pQ7ThZzbcJw==
X-Received: by 2002:a05:6102:80a3:b0:77d:9fe9:1716 with SMTP id ada2fe7eead31-78a4a6e83e9mr14657437137.2.1788861552629;
        Tue, 08 Sep 2026 02:59:12 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98097de57d4sm7907919241.10.2026.09.08.02.59.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:59:12 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-783fffcfb96so3369107137.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:59:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzQDd86HD472I3Xefqtt3iLF2zPYBCx/lTZHL2kvJwi41ifsOJkfMco3lp5VIHZ0PeP9oSh3IRafaSn6zo=@vger.kernel.org
X-Received: by 2002:a05:6102:b02:b0:786:c86c:4f5e with SMTP id
 ada2fe7eead31-78a4a6e7023mr12785609137.3.1788861552199; Tue, 08 Sep 2026
 02:59:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260817185700.322370-6-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260817185700.322370-6-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 11:59:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJ_4jBADsQLMCnhspGG8EWO0yUujFqh=31gpUoNydJhg@mail.gmail.com>
X-Gm-Features: AcwNN1Wx2sYjbS3xvItm138PxHE5cGsknrhce5nrxreUz1pch3URAaKQ6yGSL50
Message-ID: <CAMuHMdWJ_4jBADsQLMCnhspGG8EWO0yUujFqh=31gpUoNydJhg@mail.gmail.com>
Subject: Re: [PATCH 5/7] pinctrl: renesas: rzt2h: wire up struct gpio_chip::set_config
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Wire up struct gpio_chip::set_config to allow GPIO settings via pinctrl.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> @@ -1192,6 +1192,7 @@ static int rzt2h_gpio_register(struct rzt2h_pinctrl *pctrl)
>         chip->direction_output = rzt2h_gpio_direction_output;
>         chip->get = rzt2h_gpio_get;
>         chip->set = rzt2h_gpio_set;
> +       chip->set_config = gpiochip_generic_config;
>         chip->label = dev_name(dev);
>
>         if (of_property_present(np, "interrupt-controller")) {

I believe this does not depend on any of the previous patches in this
series, so I can just queue this in renesas-pinctrl for v7.4?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
