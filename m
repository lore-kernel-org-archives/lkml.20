Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636182;
	b=OSzBPOFAAjQb3huMhGDCeJI1a5eWYaeF9DPwpplvvyOnKQPW9pnt3XmnIndgFq7Pp4nL
	 2eHigGnyPhbmYU7nOwz51Pt9Zw1dBlZX/XctWw+L0Chy6FsW5DanDoZvM99xHK8yceA0a
	 nnTHEBZuxeuXugr8eKrISPgVvFjXE+fVVgs82iPAhHanCrZR96Gher2ex8ROGCQJRP5Vw
	 tU+YQriEwl5tcFbQAq0zoJIIBT8RWk35hyKXSUZisvxp0VXXeem0ljpG3gqIghvu/yF3h
	 DHb80i46CgsqkCjvckGvG/Oo4rVsZQVVHGFjsFrPfMzlz1BCl/mzFHr9pwhOStDdP7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636182;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Ch9JtC98wUdbnFiYgfve5cQZzyl0tJi9sgGxiR7zz1o=;
	b=jeOJBraP/2PHGT5a5LuVrIkSx7gyKIY8h5/kq4uuuJcoEPVagWbvIEphKenCxvBcyBrK
	 9xW8Ha8Kri1D7aU11Eo+I7J5iXe5Tg2nC2wtePkWxAK8jy+AawaRSOraJ9DToz5O5vthg
	 2jYvSEqdjZBR7fb8bSmM2tyc9injfcf8Kmhrs3ArB6ETXiZ9gdawpOGIkOusa0x6+LoD+
	 B9JJOGg9ZYDNmSl7ESR9SDEv2+xCsYoO2LToh+/nB1DME9b01exIpNe972f4wjiBEf2Ej
	 cldAGOd1bgUeR7HQFdnKTEGtMit5t4IYbVQy+wjljqziajMEtEYASIlCvSL906DBeIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938446082C48
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 938446082C48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5eaefe5b523so2517342e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:16:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636181; x=1794240981;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ch9JtC98wUdbnFiYgfve5cQZzyl0tJi9sgGxiR7zz1o=;
        b=UXyfmoZBadr6bbWPQrEAE7HKzXuFC5zcdeBhldEISrzmfBTM8PJ9XiunTmvTd3jHlT
         CBqDV6/Cs/HjkMeqpNxL9BScbrOrC14oD0lvRliLONlxkXriWCv3vGker2pWPUbknHpS
         g1061D0fKbsBkYMNthAqdY14MSUs40e0xfWgRCZ3AZsSsyF7qQUd6vasNKOREMqMFWRn
         Kftm+vjIeTlsC8ogJP+PfWadgDrXqt1oBmdwYYnI8niINUYqKs673Z0Fd1/YYpP0Dug7
         8ic8eP+eqD/cLqqlJutC3ET7x0eTjwrKmGBf8qm6l/8DY7kB13pMShsr9HdLlCronVQk
         g8lQ==
X-Forwarded-Encrypted: i=1; AKwUvBztG5BBeEVaOIMGmzIhXwmhv1mehTWLtC0/rUqe/ecIKtycHEVVWt7jmRA5tUB6LPdTTj+Dd9SpHNdbV9E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9w2Js9ByWJpFklYLq4CF9Lz3oiwbndkCyqfUEfUHObuer48wbV
	lwb6xYU6gIpHV502GkG/UMIWx5puLiJNDdrS59Y985eXoV2A+M7EfUKXR3RIhyJ/q1U=
X-Gm-Gg: AYBFou2tpcmA0/cct2XfrpaDJlbtYZCv0RPvnuZjv5m3uQ/g7AphQD0el+6ypIAONks
	C0d8+VkNwsSinoJbAFy5To9tdNcz7176sk/GIdVOhc9BnU/I8FAROzh2Ilx/Mr9zhlzTsKsBHj9
	/lKamxl0oMdwCUbTLPwsBLjswwTFe3XltFyGO571ol7XULrGIL5G5XLRHuWhENuGIr9rh4Fonqh
	gaDMki3HjhcLG7KWTJ5aoZwrF3rDpmj8WBuNxt1xCeSdBrdYhTBkQmdU36pnOoOr9ZdXezZ9fKx
	l0GInAzyPpPIkLZZos89dk0HX94uTMRhOGkQ6v/pZ3v1FoP6dbYkPZ/Vlbml51aCe/nHj4VmMDJ
	E8YNuL/+v2TK+UNObzJjSD7XJnIHfvOxE98HxoiVZgPLWJgpCtxT3/M8LP0JTis4Ru8TprKU1AR
	aK8kNPF04RTpSZNxEP5GwYPDLrMQlABkKo3kmZARbcBVhItPvxz161FlGSVSW17u6KztpT5iA5T
	dcYFOdYj6KAre9JVzQ9NKxHn8lXZ/+rtu/TJxHO0stzNZhmjUY4MwyuDs7Ym1gQ2havcRCC1ghy
	x9V2IVzzdzCqrLY+Sz6JMQ5nveJC2e3h4I9lkw1i9Ttr5+IMr4g6UUcxfBXPjTsKqpg/HuCwLFc
	PTxhvSX/ySrQ=
X-Received: by 2002:a05:6122:4698:b0:5ea:e223:5437 with SMTP id 71dfb90a1353d-5ec6883d123mr4688652e0c.12.1793636181298;
        Mon, 02 Nov 2026 08:16:21 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-992ee4e7453sm11780504241.11.2026.11.02.08.16.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 08:16:20 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-990703f817fso1720703241.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:16:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzq6j43Gqu5Nqauq0TRDQkOPxdWf8QKKDCfvpTRXPIGQjbiGFTCk346HCjn5pDIacrS0Iucwl35DduOqcE=@vger.kernel.org
X-Received: by 2002:a05:6123:2eb:b0:5e8:c908:d60a with SMTP id
 71dfb90a1353d-5ec6883a419mr4465957e0c.9.1793636180228; Mon, 02 Nov 2026
 08:16:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-0-47f23de6bdb1@bp.renesas.com>
 <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-2-47f23de6bdb1@bp.renesas.com>
In-Reply-To: <20261029-tm-ssgrlpcsrc-2083-v5-clk-duty-fixes-v1-2-47f23de6bdb1@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Nov 2026 17:16:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX5XuDpdmcUhPHU_uNggpXq_L=6DRSN3ftWEApubu+VMw@mail.gmail.com>
X-Gm-Features: AclHuK8jrseFCU3Itfq84vW-XdE0TqbVlqwmURK0nQgZ-nx23dm7hkxRm8PcLJM
Message-ID: <CAMuHMdX5XuDpdmcUhPHU_uNggpXq_L=6DRSN3ftWEApubu+VMw@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: rzv2h: Report the DSI duty cycle from
 the LVDS divider
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, tomm.merciai@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

Thanks for your patch!

On Thu, 29 Oct 2026 at 15:26, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The 4/7 duty cycle of the LVDS path comes from the division by 7, not from
> the PLLDSI mux, as an odd divider cannot produce a 50% duty cycle.

Note that the latter is not true in general: if an odd divider looks
at both edges of the parent clock signal, the output will have a 50%
duty cycle (assumed the parent has a 50% duty cycle).
If an odd divider looks only at rising or falling edges, the output
will indeed have a non-50% duty cycle.

> Report it from a dedicated LVDS divider clock type and let the core walk up
> to the selected parent through CLK_DUTY_CYCLE_PARENT. The reported values
> do not change, the mux keeps selecting the path, and its duty cycle
> constants go away.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.5.

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

> @@ -890,6 +863,94 @@ rzv2h_cpg_fixed_mod_status_clk_register(const struct cpg_core_clk *core,
>         return &clk_hw_data->fix.hw;
>  }
>
> +static int rzv2h_cpg_plldsi_div_lvds_get_duty_cycle(struct clk_hw *hw,
> +                                                   struct clk_duty *duty)
> +{
> +       struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
> +
> +       /*
> +        * An odd divider cannot generate a 50% duty cycle: the output stays
> +        * high for (div + 1) / 2 input clock cycles out of div, e.g. a divider
> +        * of 7 gives a duty cycle of 4/7.
> +        */
> +       duty->num = DIV_ROUND_UP(fix->div, 2);
> +       duty->den = fix->div;
> +
> +       return 0;
> +}
> +
> +static int rzv2h_cpg_plldsi_div_lvds_determine_rate(struct clk_hw *hw,
> +                                                   struct clk_rate_request *req)
> +{
> +       return clk_fixed_factor_ops.determine_rate(hw, req);
> +}
> +
> +static int rzv2h_cpg_plldsi_div_lvds_set_rate(struct clk_hw *hw,
> +                                             unsigned long rate,
> +                                             unsigned long parent_rate)
> +{
> +       return clk_fixed_factor_ops.set_rate(hw, rate, parent_rate);
> +}
> +
> +static unsigned long rzv2h_cpg_plldsi_div_lvds_recalc_rate(struct clk_hw *hw,
> +                                                          unsigned long parent_rate)
> +{
> +       return clk_fixed_factor_ops.recalc_rate(hw, parent_rate);
> +}
> +
> +static unsigned long
> +rzv2h_cpg_plldsi_div_lvds_recalc_accuracy(struct clk_hw *hw,
> +                                         unsigned long parent_accuracy)
> +{
> +       return clk_fixed_factor_ops.recalc_accuracy(hw, parent_accuracy);
> +}
> +
> +static const struct clk_ops rzv2h_cpg_plldsi_div_lvds_ops = {
> +       .determine_rate = rzv2h_cpg_plldsi_div_lvds_determine_rate,
> +       .set_rate = rzv2h_cpg_plldsi_div_lvds_set_rate,
> +       .recalc_rate = rzv2h_cpg_plldsi_div_lvds_recalc_rate,
> +       .recalc_accuracy = rzv2h_cpg_plldsi_div_lvds_recalc_accuracy,
> +       .get_duty_cycle = rzv2h_cpg_plldsi_div_lvds_get_duty_cycle,
> +};
> +
> +static struct clk_hw * __init
> +rzv2h_cpg_plldsi_div_lvds_clk_register(const struct cpg_core_clk *core,
> +                                      struct rzv2h_cpg_priv *priv)
> +{
> +       struct clk_init_data init = { };
> +       struct clk_fixed_factor *fix;
> +       const struct clk_hw *parent;
> +       const char *parent_name;
> +       int ret;
> +
> +       WARN_DEBUG(core->parent >= priv->num_core_clks);
> +       parent = priv->clks[core->parent];
> +       if (IS_ERR(parent))
> +               return ERR_CAST(parent);
> +
> +       parent_name = clk_hw_get_name(parent);
> +
> +       fix = devm_kzalloc(priv->dev, sizeof(*fix), GFP_KERNEL);
> +       if (!fix)
> +               return ERR_PTR(-ENOMEM);
> +
> +       init.name = core->name;
> +       init.ops = &rzv2h_cpg_plldsi_div_lvds_ops;
> +       init.flags = CLK_SET_RATE_PARENT;
> +       init.parent_names = &parent_name;
> +       init.num_parents = 1;
> +
> +       fix->hw.init = &init;
> +       fix->mult = core->mult;
> +       fix->div = core->div;
> +
> +       ret = devm_clk_hw_register(priv->dev, &fix->hw);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       return &fix->hw;
> +}
> +
>  static struct clk_hw
>  *rzv2h_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
>                                void *data)

Since there are now two copies of this code (see rzg3l_cpg_lvds_div_*),
perhaps the time is ripe to add odd duty cycle support to
clk_fixed_factor?  As duty->num can be rounded up or down, I am
envisioning two new mutually-exclusive fixflags parameters, e.g.:

    CLK_FIXED_FACTOR_ODD_DUTY_DOWN
    CLK_FIXED_FACTOR_ODD_DUTY_UP

What do you think?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
