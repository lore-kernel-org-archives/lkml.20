Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF46C33AD8B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792382492; cv=pass; b=OQbaCL91GTLLGRHcW/F0VxeQxtIQ0X/e7Pmxc6KQKdyR+HaHG8K4MWya580NPkjmVBqVeCBC1ZjB6C1aFrjamUK6xuny23u4sTCSLaOant3wevztOkTRzocuxEjq5+URjwcga4P1nPl+0yZG5rsk087TTM2igfvHXujbRQRw9Ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792382492; c=relaxed/simple;
	bh=gfinRtSAdT3wrhPLLUmiukWg/jEO2PyDXc8MtGfY4oE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cw+u9t0OV3pIxbHFI/Z16Apn46p3e1MEEONyOBDOy8cWMxZ2nYZ3IdPBRCftZQXqhvSnc+tvgGKgBV3eqzM5tNwDRJ4A2JJcctfNRgf+4xyEf9wmu7HDJ/n9ylk+BMgIfONTVhuzYzfVvV2d4vq3a/Zl6UsVrlfFXtFIL8qJOLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NlfMp+TQ; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NlfMp+TQ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso219303266b.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:01:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792382489; cv=none;
        d=google.com; s=arc-20260327;
        b=rObq76p9Z1yO0ey7KbxlLhW/49k+AuUnOioCba6j79eml7nl95EJfYP2Il4YQYxWje
         UXwxXFg98JLB2svUuWuzb/jRV2YPt7mURqY6LeqTvgdTG+A9qzKeNBVMbSx0uUU7aj/T
         +VLGjALnFPHvTf6b4QIVh0/ldEaZ2GEppPlELE6Hd8VlLEaT1yJ7RzPP5s1mGsNCMfYE
         YpCEs3JenGti710pP96XRdHBSw+OWJGLwipU/9NKK+JSw4Ye1QcmZ6G14C527gdCY5Fn
         tDZCIK7qy1lhYywUr+t+gUsXioztTvL4NmOxr67NFSMnrDZN7M3pLZVUty8UQMAGt7Wa
         xM7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OuiOX7aI/ELKNcYQNn5nmLyVIrEn26C/OEcSBXIHtes=;
        fh=yYk+KH/MeYvGFs3cpVokVNkCrPZ03axeHCc6LH5OMuo=;
        b=aYl0wrOmMsgPC/6ylvXBNjSya73N6AXr+VRDVMbqJdh2PWQ1oU2YwKzKmiUxE+mTN4
         uCQO+2MW5jZOsDafK7NHYiKNupw9UFoov3qQL+xjJeyFXBTG8/4Z9Xaqzfq5srqv2+dm
         f+4M9vkk3Q6vyLuP/QLoYDw7zDLHVRYuvS3MMuJhD7Sut4J6hPBtjzQ3esvfEP1jK0FX
         ZQLgLqOhoLEDibMRKosz5vKidcS2sYkq9dn/zclN0FE7qBtU85R9RgGVhumjJEycL6tt
         CfPUa7iI6FZL+xrBmgK1wIF/ML/NIopI3qoJyXkDDKvW1Fl1iYDgobMl6oucPjCYfEvO
         zbsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792382489; x=1792987289; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OuiOX7aI/ELKNcYQNn5nmLyVIrEn26C/OEcSBXIHtes=;
        b=NlfMp+TQWH290Dd1dK243REh1J1JXLd3R/Zt3GTFAPLuUOzhwMhRDJPkCqC0bINTtP
         IhZnX8B5z4bAXr4hpRhxnfe/LMwiEWgLz8o/j+Pl+jfNtdVrNGY00Tg2klmLbR2O4a6q
         soHOVDLYbz1aW4dJPnQC3yyOuwRZLwg2/FjWr7uXjYxhblqRQj2JMnXG6GTcpgd6Rqqh
         IOPAoc8NvqqEdoJsUt2/h3HSmae2fEFUxDzT2MOpRxFSRCtrYw2tMpaWNqZOQczQXSl4
         ClPcxJyH5SovActJn1YGAIhEGlaV7PJVHS1vVMHXPkouRc2anOzlrS7o61g9ZXmfAzPQ
         NF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792382489; x=1792987289;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OuiOX7aI/ELKNcYQNn5nmLyVIrEn26C/OEcSBXIHtes=;
        b=xlvVUzdBJONCoY/hy9rwiWsChEWNuIwe0Oii3QVo29DYpfGIi1lY+Jz/xKVLpoEriw
         mdSzkMlk/UtYpXJW7+ROja3tsHqoOfEqG/MzVdRifnDx2CoxcooUaDwEn4rGi+ahNuyl
         YTA+61ble1cA3ei7XDgPbwyBm1/8WDiSISCLTKdajN/VpDX1Uk8OJFHxO12MYebiOOvc
         qp9C5Z6whj0AjFZwhWUC3RGNYdhDL0eaczgppi/fYkSaGq3P4rNLDqILtx6i6hcJ2i9Z
         7TjZDJp/TSXrSm76hE/XUuIvqFyvs1doH56C0AAUjolQ++qtenS7YO1IpwQ8ATieZiC/
         Isnw==
X-Forwarded-Encrypted: i=1; AKwUvBx0MIB/48O9AaSarhQw7SG1CFV17c5wO/MDkWVsTdkDAq17QTRVEVUieiwaXS2WkVE2Pw9pMZxNLPJT5h4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHP8BqPGMqq73agigNQwJ2G5VOfHoATGRFwVVizq1KAObmWoVb
	TS5r2LzwJ7p2lKEYvyyTLwIdxSsEg3tbyD8DkuVUzpqeyo/eelixjGs9/69+6ZD2zDJOqnra7YD
	FoAN5dMUS3ZmoB21jGINFRYMh5Gc/sKE=
X-Gm-Gg: AYBFou0whXq6QEKv1fX8CNo6e7FQ7vcjTao9Q6J2LpSGVp9jFsrjnsHtsQV7ABvXju/
	Ld7Pt2oh/Ik3FefvGxqV1RtkwckeV7mPqon3tSkLNU/J6jdWoLifUD5OCa9BovuJ8vcEm9ArhJP
	ZboGnHUOOTopOAMYbO/oCo72XhiEZHopgiM3eQlSP5Y0JDKp2jm/au8c1ZfVA3m4tP1+Zx1HJf8
	slAD/2nfu7cs8GW4xw0LxEPaMvOW6MVJ9Lct54zMMBr1Mi9xZOJzBABNMvWfkHD9g/tcHrgkVrv
	wPAcrcV350anKmUyzdReSJETPSgFg66Dku4d1hjZee736FAUymOSGmDHCEyQV0c5xHmJHccrfp5
	gk2uzMSol7WqB90P8az+dqw==
X-Received: by 2002:a17:907:9693:b0:c2b:898e:24fd with SMTP id
 a640c23a62f3a-c419f90824amr455318166b.33.1792382488812; Sun, 18 Oct 2026
 21:01:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002115850.962676-1-o.rempel@pengutronix.de> <20261002115850.962676-7-o.rempel@pengutronix.de>
In-Reply-To: <20261002115850.962676-7-o.rempel@pengutronix.de>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 19 Oct 2026 01:01:16 -0300
X-Gm-Features: AclHuK9OuIMt0tWUgyrhU17JSGsiDBFjDAOaYeNOXdaBWLPPXEoAD38vWqsHzik
Message-ID: <CAJq09z7rAtikR+AZ93zjruhrhTEC6GbFJEXbQsbN_OVDgk29pQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 6/8] net: dsa: realtek: rtl8365mb: add QoS
 baseline and DCB default priority
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	netdev@vger.kernel.org, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Oleksij,

> @@ -33,6 +33,8 @@ config NET_DSA_REALTEK_RTL8365MB
>         tristate "Realtek RTL8365MB switch driver"
>         depends on NET_DSA_REALTEK_SMI || NET_DSA_REALTEK_MDIO
>         select NET_DSA_TAG_RTL8_4
> +       select NET_IEEE8021Q_HELPERS
> +       select DCB

Is 'select DCB' really desired here? Drivers generally avoid
unconditionally selecting DCB because it pulls in a non-negligible
amount of netlink and QoS machinery into the kernel, which is often
undesirable on memory/flash-constrained embedded targets (like MIPS
routers running OpenWrt). Since the DSA core already gates the dcb_ops
and only invokes .port_set_default_prio when CONFIG_DCB is enabled,
could DCB remain optional here (e.g. guarding the callbacks or
building rtl8365mb_dcb.c conditionally)?

>         help
>           Select to enable support for Realtek RTL8365MB-VC and RTL8367S.
>

[...]

> +
> +/* The QoS priority and queue selectors are 3-bit register fields; derive a
> + * field's mask from its bit offset.
> + */
> +static inline u32 rtl8365mb_qos_sel_field_mask(unsigned int off)
> +{
> +       return GENMASK(off + 2, off);
> +}
> +
> +/* The priority-decision weight is an 8-bit register field; derive its mask
> + * from the field's bit offset, mirroring rtl8365mb_qos_sel_field_mask().
> + */
> +static inline u32 rtl8365mb_qos_weight_field_mask(unsigned int off)
> +{
> +       return GENMASK(off + 7, off);
> +}
> +
> +static int rtl8365mb_set_field(struct realtek_priv *priv, u32 reg, u32 mask,
> +                              u32 val)
> +{
> +       return regmap_update_bits(priv->map, reg, mask,
> +                                 (val << __ffs(mask)) & mask);
> +}
> +
> +static int rtl8365mb_get_field(struct realtek_priv *priv, u32 reg, u32 mask,
> +                              u32 *val)
> +{
> +       int ret;
> +
> +       ret = regmap_read(priv->map, reg, val);
> +       if (ret)
> +               return ret;
> +
> +       *val = (*val & mask) >> __ffs(mask);
> +       return 0;
> +}

The helper names ('set_field' / 'get_field') are a bit generic and
obscure that hardware regmap access is taking place. More importantly,
there is no need to hand-roll the shifting and masking with __ffs()
here. <linux/bitfield.h> provides the runtime-mask variants
field_prep() and field_get(), so you can simply do:

 return regmap_update_bits(priv->map, reg, mask, field_prep(mask, val));

and:

*val = field_get(mask, *val);

Or even drop these static wrappers entirely and use
field_prep()/field_get() directly at the call sites, matching common
driver practice.

> +
> +static u32 rtl8365mb_qos_pridec_reg(int table, int src)
> +{
> +       return table ? RTL8365MB_QOS_PRIDEC_TBL1_REG(src) :
> +                      RTL8365MB_QOS_PRIDEC_TBL0_REG(src);
> +}

There are other similar cases where the register is variable, as in
RTL8365MB_DIGITAL_INTERFACE_SELECT_REG. And even if the table will be
0 or 1, table == 1 is clearer than using it as a boolean.

> +
> +static int rtl8365mb_qos_set_pridec(struct realtek_priv *priv, int table,
> +                                   int src, u8 weight)
> +{
> +       int off = RTL8365MB_QOS_PRIDEC_OFFSET(src);
> +
> +       return rtl8365mb_set_field(priv, rtl8365mb_qos_pridec_reg(table, src),
> +                                  rtl8365mb_qos_weight_field_mask(off), weight);
> +}
> +

[...]

>
> @@ -3187,6 +3188,11 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
>                 if (ret)
>                         goto out_teardown_irq;
>
> +               /* Default the port QoS (default priority = Best Effort) */
> +               ret = rtl8365mb_dcb_init_port(ds, dp->index);
> +               if (ret)
> +                       goto out_teardown_irq;
> +
>                 /* Set up per-port private data */
>                 p->priv = priv;
>                 p->index = dp->index;
> @@ -3274,6 +3280,13 @@ static int rtl8365mb_setup(struct dsa_switch *ds)
>          */
>         ds->num_tx_queues = mb->chip_info->num_tx_queues;
>
> +       /* Establish a defined QoS baseline: program the priority-to-queue map
> +        * for the chip's queue count and trust only the port default priority.
> +        */
> +       ret = rtl8365mb_dcb_init(ds);
> +       if (ret)
> +               goto out_teardown_irq;

Shouldn't the global QoS baseline (rtl8365mb_dcb_init) be established
before iterating over ports to set per-port defaults?

> +
>         /* Start statistics counter polling */
>         ret = rtl8365mb_stats_setup(priv);
>         if (ret) {
> @@ -3435,6 +3448,8 @@ static const struct dsa_switch_ops rtl8365mb_switch_ops = {
>         .port_bridge_leave = rtl83xx_port_bridge_leave,
>         .port_pre_bridge_flags = rtl8365mb_port_pre_bridge_flags,
>         .port_bridge_flags = rtl83xx_port_bridge_flags,
> +       .port_get_default_prio = rtl8365mb_port_get_default_prio,
> +       .port_set_default_prio = rtl8365mb_port_set_default_prio,
>         .port_stp_state_set = rtl8365mb_port_stp_state_set,
>         .port_fast_age = rtl83xx_port_fast_age,
>         .port_fdb_add = rtl83xx_port_fdb_add,
> --
> 2.47.3
>

Best regards,

Luiz
