Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CB64B923E
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 22:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792363263; cv=pass; b=OxOn+JNyW2crcbqPQDCh2C7DK0jr4vZ/XQ/tl3TVT7x1dni3ehXjw0NfcdRNvO5uEHfH4ubioRYGDJbHv5zHvNSd/av5y9fmTPrL6h7TY3Gakl3Boawe7cE/ztaJRMJt+f3X6fQDTLUIJdP3XDzOw0BKyN1+OTvEMkK5TIDMLFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792363263; c=relaxed/simple;
	bh=p++ZSyJFCuxLqjeASFcIbsbXuay+O3EngKkGXMu53oA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dUH+XMhwQkItbkOToQFG1qHX8TaCSXwDzGcuLdRsXwSh14Nd9QhgbMKpsGZ9porndDXzHamToU47rPGwYFQNU2u7S96wVbKhfPSD5ump0+T/BtZqkM9Ts7a/LJQHVl2pCvED9hFixQHaalA/2ZQ2PGm1nyZSw+TeZBHNkewgmyg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jPsCo8XW; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jPsCo8XW"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c169ae1cb26so430638566b.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 15:41:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792363260; cv=none;
        d=google.com; s=arc-20260327;
        b=XeYxroChyDvbMuDR7qAPnQdbcwFnhUOSaGYGCbLmHVVQUQgA+iAy6N9Pk15/r7md3t
         pdrgs79R8dNGv5AqboJw+q9Va0kh7gLTJ88h6EZAtMWgjEBMgvfLrqes2YtkAuXZQhj0
         Ep1X2kzW/wHEd+MgqJTXMwgtVXUfZAuStRQI1Ydy1ZZopla+guAE8l2GJl/af6Jy98Ps
         NtRm19CfsN0VeoHrQ0skNsXvjgfYWs/oyxoUf1aRYgiQ+4EO2TdzsorYSal+dGXUC7Cy
         K2Gacc+wXH/HiLxlJ5iwQkqcQVVrBA+lKsup96P+ke+SHb2kVos9DA6HxOjZp/TNLT2f
         TStg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UXdVaZ0BdL2p1RhzEOoM8EGu2ZUXiAFHTy0xisS2uiQ=;
        fh=rOde3Z7kgqjAByb5sgcpKLILdJKLw7LHI+xe/0zxA3s=;
        b=DIwCWrT9rxROb+1b5R27VpyieuRJOj3mMTDXCllt/NlI48H05BjV8op6WP3unvWr+W
         1MdVcxbjWpw5ZZ3YsvFbdxnqGZ0jg9acMBXzGbOyo0ENDffLivmcVbMfOJubP3vjGAp0
         UDwhkhYCgCI5Z0z0b/CE/fAHjFSYCY85yIyOTx7YikXS8k/VL1v6octXMZUpXHyYRNv9
         xtRtFAbIt+ubPK9xuH9FYL/pcnyupTZjr352z0+Mrju09SxaGwMu3ZUA1v/DYKTbKv2j
         8nKoF796EVXu++mLr9V+uCmGT0tAWaiu73cQ2RWtFBfHRYrIgqr4Po6VNj/dnJ43tRmU
         OoNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792363260; x=1792968060; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UXdVaZ0BdL2p1RhzEOoM8EGu2ZUXiAFHTy0xisS2uiQ=;
        b=jPsCo8XW+wvKpLS9nBsIw6+rkUGeQluqYEw8DePGqY0Y5jAcuT/TdulMB/U45i3BXI
         1CRsJQmpTDJxS0tQlito624pT3dzG+Gfpy8KK4N7M02DWmDTzRw7bCCNzrQu7ZCjZ8AP
         pU+BgIBh8zFB59HmjienrYMLWsjcgbCzi/X+qNI/NKKrYwm3sJW9eLsEjVgkXZYIAr9T
         fsoUNcfeTXEN3sq6a10kqfkANfs9y6OTDn8Tcc7NizYDSZVbyeoP5tPb7j3tNp0yLqXr
         tRSI5PUIQlEsG3TwrfnlyyADNNlJ4DypVoLR1gwQH/B81asgKrDGNDKavVxF09y0G5Iq
         SN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792363260; x=1792968060;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UXdVaZ0BdL2p1RhzEOoM8EGu2ZUXiAFHTy0xisS2uiQ=;
        b=MfvJu5T4pwNACvBk0iIIzn/TGZWnemooK73V0/U2maRA+EO6CPr5I/WsxCmXFRgq6k
         ce7YKJgcN+uBrDnadB4UNvPO1olcyVW//VtFafT/k1a05s68sXITQQyNv2J3U56mflY4
         gL4tPpYdWYTvIlKPiODT29vP+NJwlOwnTOv/fVtl+mPkX3ubNOQgn0JXwt9XihjwQ2ol
         uL3ipmGRLq23M6gYMGOpCYp+T3OpSxXAxm59cSSqmgKwqKAHwk0jjCaEjST6pjshx4mg
         oJvihZfa3wDD3ehQJUWn63RZDBLFkl6w7O7WA68LDZDlyJLkQgcqr7iNGZ0StNG/3mQY
         3WRg==
X-Forwarded-Encrypted: i=1; AKwUvByTt38+dRsgmXXPf8hQdqoF14rM/iJenWjE4t88sAzIF5Yl0Cv7eForgEyRGJl15RhSjY9wB6qbDDCv0fc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7ZQCtOQ+RrB5I7epY5zSOjuButOCet4+uRmMU9IW9+gl3xzod
	rlJXJ/434AzeWJAKAtZShqS936qr/zTldBCNKoACVcP6v6ePAysZf+kg8e6HU4umqhjJIepfbvp
	uwrEhNe1z1Y2tCYs93kRVZU1U+1WNWUs=
X-Gm-Gg: AYBFou3lli384VgvBcuWuRABoIDmjhmZlnTIBzqTJuqRGEVbx01MIeYQ/4lk/qPDVcy
	VAo/9lUEoSMJNN9SWwQNQKiK2RC2/XH5S3cLoUzLEOy5A0txzPxiwc1mLE19zNbSLq37JiZriLH
	zWrEKkmnG/+pr+FHgaOMos6WJ4I6INjsncSPm4H0s20Wx2XZ4ERg+HckluYMlf2T9zEE1Rck/RJ
	g6C1Xv24+BxrIDMYOwneH4Cq/KX3ke4uVSzCeUC6xOdEztzQNAjP2BCSYDdPUdY30TSb+ycjC7o
	a/XGLu6/xoSZZf3WMXC/1iVFUUoXTLxmjd1y1k6F1zlW9aFA6Y4IxfFzbiKgKvBOWp2F/t7XqtO
	K1YWEC/H4vqs=
X-Received: by 2002:a17:906:9f8e:b0:c31:7a83:bd78 with SMTP id
 a640c23a62f3a-c40226d038bmr717199866b.27.1792363259952; Sun, 18 Oct 2026
 15:40:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5a4715dd-89e0-4868-9ffb-c8fb73b18d04@yahoo.com> <75829f0c-69d4-4c16-8300-142023f840d7@yahoo.com>
In-Reply-To: <75829f0c-69d4-4c16-8300-142023f840d7@yahoo.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Sun, 18 Oct 2026 19:40:47 -0300
X-Gm-Features: AclHuK8japrQSasiuuB5p9BbdGCAzRqaG209BBF3f-flurqGY0prkkCGGbMOCzE
Message-ID: <CAJq09z5ZAxca0rRT0mSiU_3xp2wxEU4qahbDM3SBGpwe1vbMRw@mail.gmail.com>
Subject: Re: [PATCH net-next v6 3/9] net: dsa: realtek: rtl8365mb: set speed
 for family D
To: Mieczyslaw Nalewaj <namiltd@yahoo.com>
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	linux@armlinux.org.uk, maxime.chevallier@bootlin.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
> index 840db5a..2dabc4d 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_main.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
> @@ -344,6 +344,7 @@
>  #define RTL8365MB_PORT_SPEED_10M       0
>  #define RTL8365MB_PORT_SPEED_100M      1
>  #define RTL8365MB_PORT_SPEED_1000M     2
> +#define RTL8365MB_D_PORT_SPEED_2500M   5

I also used the same _<FAMILY>_ tag trick previously, but it gets
confusing quickly. Does RTL8365MB_D_xxx mean something exclusive to
family D, or family D and later? I hope a more seasoned reviewer can
weigh in on this.

When I implemented support for the RTL8367R (pre-family B), I ran into
this exact problem of macro definitions (and code conditions) turning
into unmaintainable spaghetti.

In this particular case, as 5 does not exist in Family C and the
semantics of the existing values still hold, you can omit the _D_. A
simple comment will be enough if the semantics change for a future
family.

>  /* External interface force configuration registers 0~2 */
>  #define RTL8365MB_DIGITAL_INTERFACE_FORCE_REG0         0x1310 /* EXT0 */
> @@ -361,6 +362,28 @@
>  #define   RTL8365MB_DIGITAL_INTERFACE_FORCE_LINK_MASK          BIT(4)
>  #define   RTL8365MB_DIGITAL_INTERFACE_FORCE_DUPLEX_MASK                BIT(2)
>  #define   RTL8365MB_DIGITAL_INTERFACE_FORCE_SPEED_MASK         GENMASK(1, 0)
> +/* Width of the FORCE_SPEED field, bits[1:0] */
> +#define   RTL8365MB_DIGITAL_INTERFACE_FORCE_SPEED_WIDTH                2

This is what bitfield masks/macros are for; there is no need for an
explicit WIDTH define. More comments below on the code using it.

> +/* bits[13:12]; bit 13 reserved, no defined speed value uses it yet */
> +#define   RTL8365MB_D_DIGITAL_INTERFACE_FORCE_SPEED2_MASK      GENMASK(13, 12)
> +
> +#define RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG_BASE           0x12c0
> +#define RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG(_port) \
> +               (RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG_BASE + (_port))
> +
> +#define RTL8365MB_D_DIGITAL_INTERFACE_FORCE_EN_BASE            0x12c8
> +#define RTL8365MB_D_DIGITAL_INTERFACE_FORCE_REG_EN(_port) \
> +               (RTL8365MB_D_DIGITAL_INTERFACE_FORCE_EN_BASE + (_port))
> +
> +/* Per-port force-mode enable. The vendor RTL8367D API
> + * (dal_rtl8367d_port_macForceLink_set()) treats it as an on/off switch for
> + * the whole forced configuration: all bits set when the MAC is forced, zero
> + * when it is not. The meaning of the individual bits is not documented.
> + * This driver always forces the MAC, as on family C, so all bits are set
> + * on every call, including link down.
> + */
> +#define RTL8365MB_D_DIGITAL_INTERFACE_FORCE_EN_ALL_MASK        GENMASK(15, 0)
>
>  /* CPU port mask register - controls which ports are treated as CPU ports */
>  #define RTL8365MB_CPU_PORT_MASK_REG    0x1219
> @@ -1646,23 +1669,32 @@ static int rtl8365mb_ext_config_forcemode(struct realtek_priv *priv, int port,
>         u32 r_duplex;
>         u32 r_speed;
>         u32 r_link;
> +       bool is_d;

Thinking about future families like E, F, G..., a boolean flag like
is_d might not scale well.
You can still keep the family id in a variable to keep lines short and clean:

        enum rtl8365mb_family family;

>         int val;
>         int ret;

[...]

>               FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_LINK_MASK, r_link) |
>               FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_DUPLEX_MASK,
>                          r_duplex) |
> -             FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_SPEED_MASK, r_speed);
> -       ret = regmap_write(priv->map,
> -                          RTL8365MB_DIGITAL_INTERFACE_FORCE_REG(extint->id),
> -                          val);
> -       if (ret)
> -               return ret;
> +             FIELD_PREP(RTL8365MB_DIGITAL_INTERFACE_FORCE_SPEED_MASK,
> +                        r_speed &
> +                        RTL8365MB_DIGITAL_INTERFACE_FORCE_SPEED_MASK);

Isn't the point of FIELD_GET/FIELD_PREP to avoid bitwise operations
like this? For fields split between bit ranges, you can use the same
trick as in RTL8365MB_CVLAN_MBR_LO_MASK, RTL8365MB_CVLAN_MBR_HI_MASK.

> +
> +       if (is_d) {

For multiple/bigger differences, we will need to have different
functions for each family. In this case, for small differences, I
think is_d, is_e, is_f... are better handled by a switch statement
with the same indentation cost as an if:

            switch (family) {
            case RTL8365MB_FAMILY_D:
                 ...
                break;
            case RTL8365MB_FAMILY_C:
                 ...
            }

And, by omitting the default clause, when we add a future FAMILY_E and
forget to add a case for it, the compiler will warn us of the missing
check. You can even use a (commented) fallthrough when a family
incrementally expands a feature.

> +               /* Speed is 3 bits on family D: bits[1:0] go into FORCE_SPEED,
> +                * bit[2] goes into FORCE_SPEED2 (bit 12); only 2500M sets it,
> +                * bit 13 of the field is unused.
> +                */
> +               val |= FIELD_PREP(RTL8365MB_D_DIGITAL_INTERFACE_FORCE_SPEED2_MASK,
> +                                 r_speed >>
> +                                 RTL8365MB_DIGITAL_INTERFACE_FORCE_SPEED_WIDTH);

Here is where FIELD_GET() with a HI/LO mask avoids the manual shift
and makes the WIDTH definition unnecessary.

Best regards,

Luiz
