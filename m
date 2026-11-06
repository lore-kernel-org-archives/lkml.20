Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952494;
	b=yenhzycE404MDrqlzd/ceOJ2BhciqT5D/nRBd+JFLWHhPfIQKmWAlV4chfokKrrI9Foo
	 gXgJgZQjKQedD0fSa5doMritWvimMaYBrCwOM+fKL+9+LhHD9nI9xYETcvGNM87TFCxG4
	 TVNkcD3LI1o1mdGcdCzWOGMs0Dh53ycQrUlQo40xMPPWzJiaFiW+XGl/aj4awN14W0KvW
	 /PMw083mN2gCZaCNgPyJnFF6yv33wapiXMeOBWAPFWmcnRQetLG8fTaq8TyFix4E7IqN6
	 nhHyqDiaKC4p4X4US8W3zltfdcr1gWfdR7hQ1tBI+Ha0Y+1eJhPsfYzanM0DNaF91GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952494;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=9n3N1yIikpCYIu+X6VsuHby7yUa6y7Py3MWjLaVcKX8=;
	b=H2VlEzi6UdYdYZwGoP7cTZrJoMxVa+AVhn3zPEvua3k3Jtd9qSWiuO1bHvFupdTpopYx
	 mIblvfdAy4IfJmLZn9kJxJSGgRZtr1HEEPHDiI1CpJ/RbjlUgsE2DPq5TcJZIWVRMXfRz
	 1j9ZSxPztcwTfsemWTQtgPJtVyRTtfpsfJbCDIgT0Kt4uwIt3gJ/7AOBNh9q08ma5w+bx
	 zrnElhFxEn3TIKzVlkKxubjfyYrApsLWJhoFJDwBCre99Tyx1UaZsKlHOC7fcT3LGEcuF
	 6fj0p/k8Ulzd/j128w29luprRregvUnaDrgvTHpk6NHM2AN+9oORarANeDhLZosea/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.45
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1587606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:08:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1587606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9906a5410f5so1169922241.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:08:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952492; x=1794557292;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9n3N1yIikpCYIu+X6VsuHby7yUa6y7Py3MWjLaVcKX8=;
        b=p30f8fqA2ejdJQEJ59Z4xg+kz6kNjrHcsg4rkQ6/r/rznZ2k4808e5Ki7H2Hu7eaBg
         VW7Lt0ezd602rYQIWpr7osYzeeRjSoW4dfdxaw16zQg1FJpN3XD5jkITGZ8BmnqsebQ8
         LVcxRHfPvWd7e5+EIgq+ZbJRjKGSu2bmj00qnipa9Lp1vhZVw94+BOlu1joVPfI7GDGD
         2Cw4lM0Dy35yUaJz2XcuQ5pK/nQQNq1benggIMXJnOpbYKtj4uu0SbxZLL/WyY5Pwsy2
         5WBH6OrOmh8eNLROV9grdTea69n7yrzlg4yFHSQ5fj9uMtP6JS9xilsfFKewlhonXRc6
         sFmw==
X-Forwarded-Encrypted: i=1; AKwUvBwW8nea4BmNt8Hhs55ndQuXWYIIhE+qY6Irt+ruPAgbvpZIZxrwz81SfusggLu4aXtg1i83UaqoD0UY5ZY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IzMlau85ezyz0ndjvnSdUybNWltCPbefBWwF4E1T7v6o3TEMJ
	zYz/Rn8Mq5PDzvUBA98sN50OrfIZwR5p8ozaSOSaXXq03nD9IWHrj6UKY5cqJ1rc5hk=
X-Gm-Gg: AYBFou37yc0mrKGi9RHDKH/AjaeDZwRjDmkxAsDaJftnlYW1N4+OQi8NVoByUNWvoWf
	MMVAhFqng+vaSkPvQBW1VTGhSJ0fGeOV1nX9KJqSQJFyP3Uc9+pPHPAPrj/OMIQKHXHlIKB0L5U
	hLHFRbipYMx+FZjsLHbDEpwkh2HD7Rxepjtp2o+vSmv62n+X6L+pLq5+Yx4VxT7uNyfD8towRi4
	mqdeCTChwByK8F7KsyIqw5cTGYJUrJ+q2U0TBqDtTDAL07sb3M+dHhSGLCqiSZjvxvDrT7OgtNe
	LuIOxo5vCXYxkxyYI72E8EURlj9x6JF1XK6JngdtN4+fVqBABhLGEfgvv00XgEEg6G/2n8sFHdY
	orY4+qucdAJQWUksNY8V99twbqrkjrUB9we6rvC5s0qG4o4lDICiWpijQ6z4orvHMRnpkrlFnaY
	0E17+bb2F4PaLUxG+ldwqB3NDdedpN3YJA1fd0P0oMn5nixquA+OJK0bbUYgv+CV/SGsakJCj7d
	R7ka7LjQltzzMXyCpYWegF6+YXIUzsoMDWUtI0y3YQsVPZK8Z12fBnN0TpDKExheoZMM0tVubma
	GhEmwugjpaqTFcTir0+P/WnuuiLS/UHHuliDjZwbCPbyQ2xqh0+oJ1lwF9mgD/UjPQ==
X-Received: by 2002:a05:6102:4456:b0:7af:efe6:2bbe with SMTP id ada2fe7eead31-7d286a26167mr2062608137.16.1793952492334;
        Fri, 06 Nov 2026 00:08:12 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d2a85beb50sm781949137.1.2026.11.06.00.08.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 00:08:11 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9909e82513fso260243241.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:08:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxR2ueSkXXyTbPEF4bEu0y+9ikZiMHAzEGrSIZVeCjEcOHY0lzT8nuKA9+OhA2hu+VkSTHD9gcoec+r3VA=@vger.kernel.org
X-Received: by 2002:a05:6102:a181:10b0:7d2:8735:49f6 with SMTP id
 ada2fe7eead31-7d287354e7cmr1863139137.42.1793952490879; Fri, 06 Nov 2026
 00:08:10 -0800 (PST)
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
 <CAMuHMdX5XuDpdmcUhPHU_uNggpXq_L=6DRSN3ftWEApubu+VMw@mail.gmail.com> <TY3PR01MB11346986F12DEE0E3370264C386762@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346986F12DEE0E3370264C386762@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Nov 2026 09:07:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWiCM3JXmqTzKCAPoZgNa2ouUgF0a739Vm2UDmjC23zow@mail.gmail.com>
X-Gm-Features: AclHuK_SUotAyJZdKz7d5Cmpgoj7rV-v-BlqVYe7acZYOqsrJWZuNWbULoxF0Eg
Message-ID: <CAMuHMdWiCM3JXmqTzKCAPoZgNa2ouUgF0a739Vm2UDmjC23zow@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: rzv2h: Report the DSI duty cycle from
 the LVDS divider
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tommaso Merciai <tomm.merciai@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Fri, 6 Nov 2026 at 08:41, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Thu, 29 Oct 2026 at 15:26, Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > The 4/7 duty cycle of the LVDS path comes from the division by 7, not
> > > from the PLLDSI mux, as an odd divider cannot produce a 50% duty cycle.
> >
> > Note that the latter is not true in general: if an odd divider looks at both edges of the parent clock
> > signal, the output will have a 50% duty cycle (assumed the parent has a 50% duty cycle).
> > If an odd divider looks only at rising or falling edges, the output will indeed have a non-50% duty
> > cycle.
> >
> > > Report it from a dedicated LVDS divider clock type and let the core
> > > walk up to the selected parent through CLK_DUTY_CYCLE_PARENT. The
> > > reported values do not change, the mux keeps selecting the path, and
> > > its duty cycle constants go away.
> > >
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> i.e. will queue in renesas-clk for v7.5.
> >
> > > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> >
> > > @@ -890,6 +863,94 @@ rzv2h_cpg_fixed_mod_status_clk_register(const struct cpg_core_clk *core,
> > >         return &clk_hw_data->fix.hw;
> > >  }
> > >
> > > +static int rzv2h_cpg_plldsi_div_lvds_get_duty_cycle(struct clk_hw *hw,
> > > +                                                   struct clk_duty
> > > +*duty) {
> > > +       struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
> > > +
> > > +       /*
> > > +        * An odd divider cannot generate a 50% duty cycle: the output stays
> > > +        * high for (div + 1) / 2 input clock cycles out of div, e.g. a divider
> > > +        * of 7 gives a duty cycle of 4/7.
> > > +        */
> > > +       duty->num = DIV_ROUND_UP(fix->div, 2);
> > > +       duty->den = fix->div;
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int rzv2h_cpg_plldsi_div_lvds_determine_rate(struct clk_hw *hw,
> > > +                                                   struct
> > > +clk_rate_request *req) {
> > > +       return clk_fixed_factor_ops.determine_rate(hw, req); }
> > > +
> > > +static int rzv2h_cpg_plldsi_div_lvds_set_rate(struct clk_hw *hw,
> > > +                                             unsigned long rate,
> > > +                                             unsigned long
> > > +parent_rate) {
> > > +       return clk_fixed_factor_ops.set_rate(hw, rate, parent_rate); }
> > > +
> > > +static unsigned long rzv2h_cpg_plldsi_div_lvds_recalc_rate(struct clk_hw *hw,
> > > +                                                          unsigned
> > > +long parent_rate) {
> > > +       return clk_fixed_factor_ops.recalc_rate(hw, parent_rate); }
> > > +
> > > +static unsigned long
> > > +rzv2h_cpg_plldsi_div_lvds_recalc_accuracy(struct clk_hw *hw,
> > > +                                         unsigned long
> > > +parent_accuracy) {
> > > +       return clk_fixed_factor_ops.recalc_accuracy(hw,
> > > +parent_accuracy); }
> > > +
> > > +static const struct clk_ops rzv2h_cpg_plldsi_div_lvds_ops = {
> > > +       .determine_rate = rzv2h_cpg_plldsi_div_lvds_determine_rate,
> > > +       .set_rate = rzv2h_cpg_plldsi_div_lvds_set_rate,
> > > +       .recalc_rate = rzv2h_cpg_plldsi_div_lvds_recalc_rate,
> > > +       .recalc_accuracy = rzv2h_cpg_plldsi_div_lvds_recalc_accuracy,
> > > +       .get_duty_cycle = rzv2h_cpg_plldsi_div_lvds_get_duty_cycle,
> > > +};
> > > +
> > > +static struct clk_hw * __init
> > > +rzv2h_cpg_plldsi_div_lvds_clk_register(const struct cpg_core_clk *core,
> > > +                                      struct rzv2h_cpg_priv *priv) {
> > > +       struct clk_init_data init = { };
> > > +       struct clk_fixed_factor *fix;
> > > +       const struct clk_hw *parent;
> > > +       const char *parent_name;
> > > +       int ret;
> > > +
> > > +       WARN_DEBUG(core->parent >= priv->num_core_clks);
> > > +       parent = priv->clks[core->parent];
> > > +       if (IS_ERR(parent))
> > > +               return ERR_CAST(parent);
> > > +
> > > +       parent_name = clk_hw_get_name(parent);
> > > +
> > > +       fix = devm_kzalloc(priv->dev, sizeof(*fix), GFP_KERNEL);
> > > +       if (!fix)
> > > +               return ERR_PTR(-ENOMEM);
> > > +
> > > +       init.name = core->name;
> > > +       init.ops = &rzv2h_cpg_plldsi_div_lvds_ops;
> > > +       init.flags = CLK_SET_RATE_PARENT;
> > > +       init.parent_names = &parent_name;
> > > +       init.num_parents = 1;
> > > +
> > > +       fix->hw.init = &init;
> > > +       fix->mult = core->mult;
> > > +       fix->div = core->div;
> > > +
> > > +       ret = devm_clk_hw_register(priv->dev, &fix->hw);
> > > +       if (ret)
> > > +               return ERR_PTR(ret);
> > > +
> > > +       return &fix->hw;
> > > +}
> > > +
> > >  static struct clk_hw
> > >  *rzv2h_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
> > >                                void *data)
> >
> > Since there are now two copies of this code (see rzg3l_cpg_lvds_div_*), perhaps the time is ripe to
> > add odd duty cycle support to clk_fixed_factor?  As duty->num can be rounded up or down, I am
> > envisioning two new mutually-exclusive fixflags parameters, e.g.:
> >
> >     CLK_FIXED_FACTOR_ODD_DUTY_DOWN
> >     CLK_FIXED_FACTOR_ODD_DUTY_UP
>
> For Renesas it is 4/7 odd divider
>
> For other vendor SoCs it can be 1/7 .. 6/7
> So not sure CLK_FIXED_FACTOR_ODD_DUTY_{UP,DOWN}
> applies? I believe if it is generic we need to pass
> both Nr/Dr for the duty cycle.
>
> I may be wrong. Please correct me if it is the case.

Right, some dividers may use other duty cycle values.
Looking at users of clk_duty, there don't seem to be many
that could make use of this...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
