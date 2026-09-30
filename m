Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA188403E8D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751957; cv=none; b=GVaVykHUZP47REHi2YYMHBBP8BkfO7KoWBlGFDKqAfckRI6nAIWpNcCguGQp38IiEW9gEt2R5mLRsM4siS/opkDw6aXBTUUyQQcikCNxUDNbEbZ2FUucFjrA+7RZJ86Mn/+05GxuPFUDzAcbwahxX74j7qDTA1R/hncZyc9NHUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751957; c=relaxed/simple;
	bh=6x6zUfX3HAgCXeFMP5IQJ8hlZ04cJus+Y81jg3rYM3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iIkD8WAV8FdERd96JS2d4m0mEy8YOjgThkP/oBtq3w4baOeDatQu05xh2K4Hdkn7cXVrV9m4AW/qgfFC7BZLP9PS+OC0gt9r9x55+UuHkCqgmH/eb4vs4VluT/JUDE45a5ZSW4BvMyU3xcUDRYTfhVVHliUzJDxBXsUzT2Hhtfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c83fbd23a5so1322309e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751949; x=1791356749;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KRLyqaFR+2tvKEVGCS6TXPlesufaQZLklH2Mpn/Gp60=;
        b=u9zW17e0RDk0wfwcF2vQtI5mzpr14ckOHktIf8QGifduonRTc6nMCrhAwyanC4ARjq
         C67EK0wKMPN8kUkGMKAWuHnCbFKzpwvX9+IDrtHkaVDfAjvOOIOZu+wCUlAsqkssXJI7
         UyZd9Ns5ucxm4gD4lbok8ftPGadIjNcqEl9tUiN9DFW7O04S9JJOLx1mY6KwXs72RgEr
         L99K8ar6daHf3ERijoIWxcpJO5wpZqfafsLefwn4dNr9OLSyjqh5vnYiyXF0lLlVusQH
         kmMEimrWO4lznMY9ONpv/yjAOR0YBYh3z7Xku+ibCplgaGsXvrXipfbY1gAlYImwEH15
         LQUw==
X-Forwarded-Encrypted: i=1; AKwUvBxJEhVXEAhnSHIp3gBnSb8IpgBDsYn01v2zfzENSfudYIPEdrwcJxoNql4SKKH/6Lc/Rdg0R8sT6RX7PKM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVrr3/YXcstdGqCMF9vSNDv0PykHsLoexkAcjwcVf3mviQCE7Z
	DbvlsSqHVCZH+Mj4tz6TQX3K9+OYZq0/bkuUXWP/qZTf0avDLlsR9nogwry4nyPv
X-Gm-Gg: AYBFou2XB81qqeFAdsI1F4e6+s/vsSsgxzdfUza6/vN2mOPzdkqmnXGOpnz66BIX2pT
	aJiQ+yC2wQF0VfbNx3T0MN61+HBeX9EzxL0u+Zmy8khxv8tVLFTtpczTgDy8YttQb159SUsTPr1
	rkrkDqdK7VvO4ibHLmH8uGXy5vErPSwh0jAOzObYxjUOu27xKkfE0Cm7o93Eiod2Gzl+gQMM4jK
	PiqhxnIWPi4N85AgrBXVp0cJ0cdXTu/c+Bl6hMMGv1pnL6IMfSfdmw6HSy8kjd5OBjR49cHSI9X
	ioQXDmJnePTLrL8ybWQVGtha6fftSlCnLB0N33qkM1+FImOkfuV/uO8X6qSRmJIbquw/Mb98rf3
	+ooRU5j/Ob/nrtU2vOZuvGQ55X7BBmQIt7+IahdGpdMqdRmdhIR9tQ7gvNEoMgeQ4+scl4CWfXz
	iZY4gtC9ccpv/HUUXy5RP5SoDTzLYOwrh3L4+14JjW8NX+L4T4WQvY3qrO3T9tgCmmcQAR+z1sD
	kQ9UlTEHs+q//qTFpEFuhakXBOFNZ9zVi9WzQDl9BlKdlk=
X-Received: by 2002:a05:6102:8391:20b0:7bc:ce17:aa76 with SMTP id ada2fe7eead31-7be73a8ed3dmr35311137.36.1790751949212;
        Wed, 30 Sep 2026 00:05:49 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-988d95a9531sm687582241.13.2026.09.30.00.05.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 00:05:48 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-78fb1fb9508so1182855137.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:05:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByDXed22Qu6BSN7HTmRFCqNhkZzLW3AwPpGpFLObrGc0EhfvC/vccQzcosR+sdyZ36XSXfB9bRy8/b/dNo=@vger.kernel.org
X-Received: by 2002:a05:6102:6112:10b0:7ab:9152:1c6e with SMTP id
 ada2fe7eead31-7be733a556emr39198137.27.1790751948220; Wed, 30 Sep 2026
 00:05:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-rsk7203-properties-v3-0-02f84aeb8e47@gmail.com> <20260929-rsk7203-properties-v3-1-02f84aeb8e47@gmail.com>
In-Reply-To: <20260929-rsk7203-properties-v3-1-02f84aeb8e47@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Sep 2026 09:05:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpevoQLHepf06K1=YLRr+BUF9s3W_zaQkO24qiY2_DOg@mail.gmail.com>
X-Gm-Features: AclHuK9T_GF3rRYO4h8sYrJYvPsih0XtUnox4vMWY5UxSoWqqC_FxwtdTdbQ_M0
Message-ID: <CAMuHMdVpevoQLHepf06K1=YLRr+BUF9s3W_zaQkO24qiY2_DOg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] pinctrl: renesas: gpio: isolate function gpiochip
 from parent fwnode
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@kernel.org>, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Sept 2026 at 06:58, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> The sh-pfc driver registers two separate gpiochip instances: one for
> real GPIOs and another for function GPIOs. Since both share the same
> parent platform device, gpiolib's fallback logic causes both chips to
> share the same firmware node (fwnode).
>
> This causes ambiguity when using software nodes to describe GPIOs, as
> gpiolib may apply hogs meant for one chip to the other if they share the
> same node.
>
> Explicitly set gc->fwnode to ERR_PTR(-ENODEV) for the function GPIO
> chip. This satisfies gpiolib's check for an existing fwnode and prevents
> it from falling back to the parent device's node, while ensuring that no
> actual properties or hogs are found on the function chip unless
> explicitly assigned later.
>
> Assisted-by: LLM
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> --- a/drivers/pinctrl/renesas/gpio.c
> +++ b/drivers/pinctrl/renesas/gpio.c
> @@ -278,6 +278,12 @@ static int gpio_function_setup(struct sh_pfc_chip *chip)

As this function is only used on SH:
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
