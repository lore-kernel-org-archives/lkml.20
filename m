Received: from mail-vs2-f36.google.com (mail-vs2-f36.google.com [74.125.227.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063EF45D5C9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751994; cv=none; b=XXpH2kDMui/2QvaYnUvNVBHMI72fta3LNoreTFG+FMErnPlJNZpfD6xHqnam1GjndOIs4y95Fe6hDc36P+Uq8pcizPZxVFPlfo1AQRikds0xSHB2LY1Y/KPy/fDxSjf1DiVZYcH3Gbgs4fEhX5NWfmoaAQ1kHujN/sBGoQzqA6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751994; c=relaxed/simple;
	bh=wch8nfNOZ3yz6W478LNk2PKlIPZ2op/sL1/5uWaDjYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hephagfqj5EhAWzhWeL42hQPqfmjHFxUDq426rPFPEVlCfx58X1yfkHkX8w0WOG8TmTgRDDnaBoBjKSiBAwPiLimCrqkUiVAEPvz/d0HFqCiJlNlQH9JicoVWTBsEDddPcdw2sbmjCWN9NTOPV0R1dhlrePUaeN0NrRMbpZep2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f36.google.com with SMTP id ada2fe7eead31-7ba698eb7cfso494312137.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751987; x=1791356787;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XVZnJOotlaaUATBE8LN5Zb2VdzLY7iJmIqLqFopSb08=;
        b=g521PPsD/Hpd/4GN4E5DuuGegrGwh3+qjpLwwVJcX92d3LKG7HMNM3lMe3Vj9qA3yd
         7pc37Ya8Tu8XQsE5hjqJprYXgbd8kRO/edl7eWQsm1fpxPAM6ugtjwnadWRltownoje8
         herQ1/QCt9BVQQhoKTqTnJvmVvM7HuXIqB32wXYjuGCGVUEPDif2DPrVv2PfMRx31vMT
         c/VqZg4yykpabD/7tMJ1vRWiI65FahfGBhs4Aqwl0mAZGclFwZ699FltvscdMbpHKQkZ
         GXp61KZ0mJctA1cL9eBEf49HMSd7d0q9RgmTXAtN3ic7mTXSNv5OMpBO8nxHY8CVfEDp
         +YSw==
X-Forwarded-Encrypted: i=1; AKwUvByOTD13s6d2czG++nKpJZZnwl5VqLfCnyyBO2REuaPmjxQhiZSydWBCZRmyRCS406OiE6RXPJXkS9Nm4Pg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJIPAFnvy9LxdFScDqqOJpPpK4k4ACvKxigDWeMCFDPfTNyXaV
	MXbW6aJGQ4jiU6Muw5bmM26MUWtYxkctOnFqVm1j2bIZh/I4qihnzERFQ9BuXk1w
X-Gm-Gg: AYBFou15m5cWT53584bX+RumHo0NSs5jp3mP7WtRYoezW6S75PnVZgy3T5+uHN90HQj
	ri88tGBPDLFxBnbfZMPYUciMWZMAVTr/agbdSwrIBXNI8eOj93BRANI5ySsh43EFeWuO/qcR4vU
	Dcw88kJVYMXyAVfEuToR7VMrcwfg+H0vTOrhQrm5hwa5EAe9xzr0qJ8xpLFOjFjLk9Qye9+gVSy
	9Mb4uPb+xSP6a8y2rCJxv5zapqtW/FUN+sNt4TsdziQq0JEw+KhaecB7veqihXrdI+WyGzbITdi
	3BoqGSw2y0IHEKR7FGvky/wofdyepKG4ZnZdCrpt78sW/6br169Ke7zZARznRGtqBbHRabTtieX
	5IiWH6TkIc5qymKM9PdUbFApe3FdcihcGafccXlcON9l3FMZVHExoJRkeDxtezJv5V4CBOiG42W
	mZEYxom1RkC4mwRU/BtkdHq33iYS85ImOMrjqnCpsNKqNwSXIA8qIDlNosWEY4IZEdZh55FFSE7
	4zCurn/6WzIr3NZdpZe268+oDhIA1jLum/r
X-Received: by 2002:a05:6102:3f0f:b0:7a6:b8fe:e834 with SMTP id ada2fe7eead31-7be7339c863mr38207137.27.1790751986826;
        Wed, 30 Sep 2026 00:06:26 -0700 (PDT)
Received: from mail-vs2-f36.google.com (mail-vs2-f36.google.com. [74.125.227.36])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-988d93d1f83sm679179241.5.2026.09.30.00.06.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 00:06:25 -0700 (PDT)
Received: by mail-vs2-f36.google.com with SMTP id ada2fe7eead31-7bccaba9c5eso157582137.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:06:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzX8HYoJ4M6B29HdHq0wj11l/xaAqoeQOCiJkHq+8zjA6p3I4WHk38B/osq4kWMJ3KvzmvmrzmZad7q05Q=@vger.kernel.org
X-Received: by 2002:a05:6102:3e8d:b0:7a7:3485:33ea with SMTP id
 ada2fe7eead31-7be72ca2a93mr42702137.19.1790751984641; Wed, 30 Sep 2026
 00:06:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-rsk7203-properties-v3-0-02f84aeb8e47@gmail.com> <20260929-rsk7203-properties-v3-4-02f84aeb8e47@gmail.com>
In-Reply-To: <20260929-rsk7203-properties-v3-4-02f84aeb8e47@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Sep 2026 09:06:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXwVWhPhn=vH-FbDX41Hnshg7V6S+pg8kreOHpTgRWeHA@mail.gmail.com>
X-Gm-Features: AclHuK9VR6aoLpU0Amx9qCakt-f_1gjDC5BvwgyzYKux3uxlHlNiLggGev2T8tA
Message-ID: <CAMuHMdXwVWhPhn=vH-FbDX41Hnshg7V6S+pg8kreOHpTgRWeHA@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] pinctrl: renesas: gpio: support software nodes for
 function GPIOs
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Arnd Bergmann <arnd@kernel.org>, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Sept 2026 at 06:58, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> This patch extends the sh-pfc GPIO driver to support software-node-based
> configuration for the secondary 'function' GPIO chip.
>
> While the primary GPIO chip typically uses the firmware node attached to
> the parent platform device, the secondary chip should target a specific
> child node to avoid ambiguity when defining GPIO hogs or properties.
>
> Update gpio_function_setup() to look for a child node named 'functions',
> but only when the parent is a software node. This ensures the behavior
> is restricted to legacy platforms being migrated to software nodes.
>
> Assisted-by: LLM
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/pinctrl/renesas/gpio.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pinctrl/renesas/gpio.c b/drivers/pinctrl/renesas/gpio.c
> index 4e59dadb7364..b49a3e14da91 100644
> --- a/drivers/pinctrl/renesas/gpio.c
> +++ b/drivers/pinctrl/renesas/gpio.c
> @@ -271,18 +271,40 @@ static int gpio_function_request(struct gpio_chip *gc, unsigned offset)
>         return ret;
>  }
>
> +static void sh_pfc_fwnode_put(void *data)
> +{
> +       fwnode_handle_put(data);
> +}
> +
>  static int gpio_function_setup(struct sh_pfc_chip *chip)
>  {

As these function are only used on SH:
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
