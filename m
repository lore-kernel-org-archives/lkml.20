Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365FD4949FA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788903384; cv=pass; b=mhECLchL3MxyxQ5argTs+EobfPRc4wAk+EnrcpU/oZbKFLXgQI0WT9sOOc5I4ttIDfAP659m1xbLoswOtDRg8GbERZOqc0XIII26Cwdeth+zp5scp5LSHuNnqCKZOSPEWe1/yOfKeuLqoR+mBKHckeuKFmIzUOs4BxAD4j7pRxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788903384; c=relaxed/simple;
	bh=qjKcOPAlp+8eJmChwXBbe8T1KsBa8X+4IN5bxjb+zFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/bN58BYGIuvfqy1+ty1+Fg8EGe1Q/pOQgsSX+hVOSgGtgsGGYISY3zGdHsOLHb3sK80sciKBVgEjTHhPXFQBOG4YNV2kpKcn6r5Epi7RU9xEYb4zcyp6SVm4QivDpy3tW0Fc4h15FbOKEBhbzLahMk5j0pr2BakouIOtjNX4XI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+KOgglI; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+KOgglI"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c2637dd37c1so432343166b.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:36:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788903377; cv=none;
        d=google.com; s=arc-20260327;
        b=d5p6LWK9jH65cJOq8RWZZePDMBM80VBvgeNisHnisHgJPgcfqYBty95TpbJQ1Pghvd
         ozfh5EMjPe7hwc1c8798nXNDkfq6aViGLKDCnjvWSGKSG5pgsnrlm5rXExQ3164ksX5C
         eevJ4XE0Q8hqanXR/+FbwG3PN6z2X3/+nLAtayFYBT858CU+6yQDcZUBpltudQGRvjcf
         Jaof1knDoc+YqqnbjSnHXRzzvK6SprrshYeqYfEYnsqj8pMmrJgEur24hYcDb1xlBjIC
         RWiKjsyeeI8chJAtXNx/hDnLsECg8Ia4WP5l+rZ9yoMgfrlNa83tsZVpBMrWfyq2ONCV
         ZUyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WG1VPckZ7Ce+e/KvSNnfhiB/dB7b4M7rtu6QCvD8h8c=;
        fh=HNvCzr+49EdQhLxEkpr0czIoHQlNhfG1IMnwI5Ogcvc=;
        b=ac/ny5ETidsctkf2x+jw3lL8WFWlBB4yluVqAUZz1EmltaB21JbEOaq6/8lLlBM7l+
         EDS5Xztj68pPzrpw25SoMwgjAoqfqEQrPH1jXADGUiXD/DcyV2ocHb+LnCZDZtoGBwe+
         9azX/O7WPU/OpGGoWlODXD0LT/euDxNfpE0J5a3krNhTGv1rNC9+GaPSW93EqhDS0qkN
         GFpAUJz0hzPxLG9ONp/DyiLxQBHX76e4/K69NMNIPneuzNrRXXRPTYGckNWCwsEkWRWS
         8SpjTVXRZaO8by6Km3FSIG+WdyiVzgKXkBzACjG62qEKMUFu9gVMjb5YKGLeOXpbxI6A
         55sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788903377; x=1789508177; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WG1VPckZ7Ce+e/KvSNnfhiB/dB7b4M7rtu6QCvD8h8c=;
        b=N+KOgglIsp4dXSVBji40pIGhK7nTvXbC/sdg9tES56NPBA1vl/bT/lDlUViAHxAHPx
         EI8uBSEdNPR+a7Y2j7VDn9xw/4bim396ATOi/j8YujZ7OD63Cd2QkrinshLreebOPfTy
         HC/jjRwooAPKADrO78lyZzrig9UKVUc2hyuaKRKUrj+17zutFbh7WrF8rK94LSP4gfUL
         8C518x8rVFkZJLgGqgSU0X6ToV8j1S24UB1lhce1lOBxc4W53Z0CQyI3ceXSHX9qv21Q
         p2GOBJKOxcNGmbzEM1sdjyhq9dTqGt/ABJnMzopTdmFBEblgvApQJ2Lw1TH/oj0ccSj7
         wZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788903377; x=1789508177;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WG1VPckZ7Ce+e/KvSNnfhiB/dB7b4M7rtu6QCvD8h8c=;
        b=Q0llUL2V8aDEvgExBh3U/i6oiWxifOY5F8QrrUJBf4oy+BmntUItRj/lklHipt/Hjs
         dEcKwQQ7LGV+HSuccZgXmVUVWE29Jwqq7YUzhb41S414du0XF57yzSR3JGewtF0QrqJM
         NJyZsBp9mFu+wEFHvcsoPg08KRSQb7PjHjbycImK5f4s8FGpzCdJUz16K4y5AgNieVmX
         uvsysnevmCWW9OyfyTDa3MCA+87o4ffiDCK0jscz7gJCcedua+nOkRQy30akUc0ncJc3
         TFHbdMkr+78a2CMOh2lgw6mq0kWQHo829Z/wXIHDM6i0NPMQdVdnwIkAGBaDM0V7qF+E
         tnKg==
X-Forwarded-Encrypted: i=1; AKwUvBx+QggOyHe/2N7J2a/QYz9w9w7sNLrOzB6SLmgy9HKYlutQhdJjv6uaRBfdx7KaYJTgsQcKShhFJHgzQbw=@vger.kernel.org
X-Gm-Message-State: AFuF++n2TPLehJvo0k0dFPah5d/W07x9Bg3jvTFD4Vt1voUmX62fG2ks
	5wIHf3sHHN6ddSPoJo62Nq9J/YOlfLpPNsU5h77+11DM1cjvE0Ps/g4dW+ekkgruyHo/4pg6iMQ
	Fl+OsLxE/AlK7UWGZJBu4QLm4Xd4gDbo=
X-Gm-Gg: AYBFou2oo7Ipp5DPkDobYtUNVXcA+kne0+usC8fOfL2X7l1exmuHH/LwzePHOTHp7mt
	AOCK9OwEAx4b2/qVWAgoLr1ajmkxcRytPqHTA+l5BtVigPhpixk0FR9epGiVBZsLcLYbweqHBAh
	eY9wLjeKiXXgevgWKpaXc23elGyvs+6mbkYUdgXlpj0ZHxpH9xZ5GUEOZ+XyTl8/BuP1SRkdtO2
	X5QSfvdRGwh9sB630G318ete+mzhXP7qnkxZs10vUNitIgQTNt0+s0mheBNsSzfnVR9Wdo5TpqK
	yFvu9A6aoT9BsbwfIQ8K4oNdz+q4YvVaG3JHL1t/EFlMlw==
X-Received: by 2002:a17:907:e1c9:20b0:c26:2b63:a746 with SMTP id
 a640c23a62f3a-c262b63cb83mr575305766b.49.1788903376801; Tue, 08 Sep 2026
 14:36:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908174403.420507-1-kuncy7@gmail.com>
In-Reply-To: <20260908174403.420507-1-kuncy7@gmail.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Tue, 8 Sep 2026 18:36:04 -0300
X-Gm-Features: AcwNN1UWf30J8IomIqOvbTRO5fh6YZcxqzHw5584rMEkSkibF6iw45t74e_SvV4
Message-ID: <CAJq09z4qBz+poVQR3tEQzB-_4se5ka76Xq1mwEM0RvEnTuGLNw@mail.gmail.com>
Subject: Re: [PATCH net v2] net: dsa: realtek: rtl8365mb: wait out the full
 chip reset time
To: Stanislaw Pal <kuncy7@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
Content-Type: text/plain; charset="UTF-8"

Hi Stanislaw,

Thanks for your patch.

> The reset bit clears well before the RTL8365MB/RTL8367S has finished its
> internal bring-up, so configuring it right away makes register writes to
> blocks that are not up yet get lost. The switch is then left half
> configured: the CPU port link comes up and the switch still transmits
> towards the CPU, but nothing the CPU sends is ever forwarded - no MIB TX
> counter moves on any user port, while the MAC reports every frame as
> transmitted without errors.
>
> The driver already documents the 1 s reset time the chip needs and polls
> with a 1 s timeout, but stops waiting as soon as the bit clears. Sleep
> out the remainder of that second instead, measured from the reset write,
> so the total wait stays at 1 s regardless of how long the poll took.
>
> Seen on a TP-Link Archer AX55 v1 (IPQ5018 + RTL8367S, 2.5G HSGMII trunk)
> on roughly three out of four boots.

We discussed a similar issue previously:
https://lore.kernel.org/all/20260721115306.15144-1-kuncy7@gmail.com/

In that thread, you mentioned it might have been caused by a bad power
supply. Are there any updates or new findings regarding that?

>  Unbinding and rebinding the driver
> always fixed it at runtime. With this patch: 6 out of 6 clean boots.

This part is still puzzling. Why does an unbind/rebind cycle work
every time if a cold boot fails without the extra delay? After the
reset write, both execution paths should behave identically. Perhaps
the interface state during an unbind/rebind cycle slows down the
probe/setup path enough to give the chip the time it needs?

> Fixes: 4af2950c50c8 ("net: dsa: realtek-smi: add rtl8365mb subdriver for RTL8365MB-VC")
> Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
> ---
> Changes in v2:
> - Declare "remaining" as long instead of unsigned long and drop the cast
>   from the comparison, so the sign is carried by the type (Andrew Lunn).
> - Name the affected parts in the opening sentence instead of "the chip".
> - Link to v1: https://lore.kernel.org/all/20260907191940.806734-1-kuncy7@gmail.com/
> ---
> --- a/drivers/net/dsa/realtek/rtl8365mb_main.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
> @@ -136,6 +136,9 @@
>  #define RTL8365MB_CHIP_RESET_SW_MASK   0x0002
>  #define RTL8365MB_CHIP_RESET_HW_MASK   0x0001
>
> +/* Time the chip needs to complete a reset, per Realtek documentation */
> +#define RTL8365MB_CHIP_RESET_TIME_MS   1000
> +
>  /* Interrupt polarity register */
>  #define RTL8365MB_INTR_POLARITY_REG    0x1100
>  #define   RTL8365MB_INTR_POLARITY_MASK 0x0001
> @@ -2980,18 +2983,38 @@
>
>  static int rtl8365mb_reset_chip(struct realtek_priv *priv)
>  {
> +       unsigned long deadline;
> +       long remaining;
>         u32 val;
> +       int ret;
>
>         priv->write_reg_noack(priv, RTL8365MB_CHIP_RESET_REG,
>                               FIELD_PREP(RTL8365MB_CHIP_RESET_HW_MASK, 1));
>
> +       deadline = jiffies + msecs_to_jiffies(RTL8365MB_CHIP_RESET_TIME_MS);
> +
>         /* Realtek documentation says the chip needs 1 second to reset. Sleep
>          * for 100 ms before accessing any registers to prevent ACK timeouts.
>          */
>         msleep(100);
> -       return regmap_read_poll_timeout(priv->map, RTL8365MB_CHIP_RESET_REG, val,
> -                                       !(val & RTL8365MB_CHIP_RESET_HW_MASK),
> -                                       20000, 1e6);
> +       ret = regmap_read_poll_timeout(priv->map, RTL8365MB_CHIP_RESET_REG, val,
> +                                      !(val & RTL8365MB_CHIP_RESET_HW_MASK),
> +                                      20000, 1e6);
> +       if (ret)
> +               return ret;
> +
> +       /* The bit clearing only means the reset was accepted, not that the
> +        * chip is ready: register writes issued before the documented reset
> +        * time has elapsed are silently dropped by blocks that are still
> +        * coming up, which leaves the switch half configured. Wait out
> +        * whatever is left of that second, measured from the reset write, so
> +        * the poll above does not add to the total.
> +        */
> +       remaining = (long)(deadline - jiffies);
> +       if (remaining > 0)
> +               msleep(jiffies_to_msecs(remaining));

Tracking deadline math across regmap_read_poll_timeout() adds
unnecessary complexity. If the chip reliably requires a full 1-second
delay, why not simply msleep(RTL8365MB_CHIP_RESET_TIME_MS) upfront? We
could perform a single regmap_read() check afterward to verify
RTL8365MB_CHIP_RESET_HW_MASK cleared, though even that might be overly
cautious.

FWIW, I noticed that older chips (like the RTL8367R) do require extra
time after the reset bit clears, whereas I haven't seen that on
RTL8367C devices. Checking if RTL8365MB_CHIP_RESET_HW_MASK was cleared
simply might not indicate that the chip has finished booting
internally.

> +
> +       return 0;
>  }
>
>  static int rtl8365mb_setup(struct dsa_switch *ds)
>

Best regards,

Luiz
