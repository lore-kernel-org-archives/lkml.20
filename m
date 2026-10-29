Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267645;
	b=dhIsX/bDVmHDp7yNlOLyOgnTEj3PBgl3lQIb8AXyLySKqgJ8x4iRFB9dNIjH/nq2PX5i
	 Jp2hvuhSsVleNlR69llPOYbwoXZgKmDmEmlOyR90JF1W4FqVVo+VSel0nYOkWq6nL3abY
	 6NJZpndTBsRsvDbgllPjGRSuxe8x3BivyeFKXfFqiC6Sq3kWFoQZ2Qhr2K75ZXj2xLnFN
	 lHNZOpenCyyzcpRkIcdRGdTnC5sDON+X4IdA1rjamd0LzK/zej/kA5WU2wfxbPu7Q5N0I
	 zEyscZ3celxoFNLR46OMkJvcO3qgqmjVmsiKIZ3HnJRIDaaOoe16S1dTksR88h1qgEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267645;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OkdQNpqFK74AqsoSuQLpJuuXQ3xGNg7YSqinWqkNxfE=;
	b=UZEueqFAHlUTBEl88B/0oI7jjKtZVKxueZhA2pkDDvlcGs6VtwRS7acaDbHNzAn2qb5q
	 oUn3Z85a6bXinmQmJRp9zKZMV8aHcuqQJj4WiXTLT2I18gGTl+CtEByHfYU2A+p1TcHST
	 KbtvovLswmfITalfHWpkvx0VbibAg1vZaqzjVojsZT5vg9lOoHQHRUf+luJ3f/malYMtH
	 DpYZWZXPCdX04DhR2KojCYJ4OPcQ918iDPoY6t38fxnihzr+6a6bhwKOaUppcuiiOJnJy
	 G9FeyWoWdKyDbkxACKGxnaBcMdeRxr1CT81DRNUf0UKtQREJ0plQ+q6zZFrJx5FV/IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SBddRtnk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC91606A339
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SBddRtnk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3191F01829
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793267645;
	bh=OkdQNpqFK74AqsoSuQLpJuuXQ3xGNg7YSqinWqkNxfE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SBddRtnkFF64pOIP7rZgy9Inr1H0kIuku/ekbD5uZsuAlAW0J/dsb/V+/jpfDvVEg
	 hehBW+KXRtLRkS4VZKLAEhT9gSpmK3ePGL+hvU4fQor0ZDQOCCewu5DOxTRvW59Ooi
	 RL2PIlSWoip+sKKHd14zMoU17fozEFSzyapm/NjuLsCW4J1qWBYftUOTMNGaTnDe3W
	 d+5TtT87kKWSFaJ9+yjstxFSyM5PidrqAt5D0L4C5o9DfTsftxDZzOzN5NtZqt1A0C
	 EAfPWouXsH0k4cjTQprYUtsfQz58uwalR5e9J8d65dBOanCx2U3/RWDyJ3XL/NZrXa
	 0oS/BCmkyNKsQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso2232697e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:54:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzAG3blXaiKL20IZpXSsSK2s3Eo2WU/TeqGyLIkmfjtKD1IbhB0FaFM3i84eNvUFH4uUs8oBHccxtrC2Fk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEIIJLydbvzavuorcYgUVoDd+M4QDG1LtaW6iHKgO3m9Ukl8aT
	gHzd2B9bPHhqf3eyYIdo9aUGOWwiimk3Ncp3QinrZorStNjpGxonvnHB5NgJiv8KHdVjARaCnh+
	kpaYr8uuPDvZRtB8Z48V4qun0D/aehKk=
X-Received: by 2002:a05:6512:39c5:b0:5bf:cabe:23b6 with SMTP id
 2adb3069b0e04-5bfcad8adb2mr1930089e87.33.1793267642415; Thu, 29 Oct 2026
 02:54:02 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn> <20261027-a210-scmi-v1-7-74d58ce85bd8@iscas.ac.cn>
In-Reply-To: <20261027-a210-scmi-v1-7-74d58ce85bd8@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 29 Oct 2026 10:53:50 +0100
X-Gmail-Original-Message-ID: <CAD++jLkwe+Vby4swUC85buxPMjm0=ZVZXY2+UfeMStemfh3fGA@mail.gmail.com>
X-Gm-Features: AclHuK-EdA1h9oU-ad6g7JzfaGvAyb9JuROsLdwvHKxOHcdM6tjvaL_X7Nax-1E
Message-ID: <CAD++jLkwe+Vby4swUC85buxPMjm0=ZVZXY2+UfeMStemfh3fGA@mail.gmail.com>
Subject: Re: [PATCH RFC 07/18] pinctrl: zhihe: add A210 support
To: gaohan@iscas.ac.cn
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, Inochi Amaoto <inochiama@gmail.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-clk@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Han,

thanks for your patch!

On Tue, Oct 27, 2026 at 4:38=E2=80=AFPM Han Gao via B4 Relay
<devnull+gaohan.iscas.ac.cn@kernel.org> wrote:

>  drivers/pinctrl/pinctrl-a210.c | 1212 ++++++++++++++++++++++++++++++++++=
++++++

Can you please name this pinctrl-zhihe-a210.c

> +config PINCTRL_A210

And this symbol PINCTRL_ZHIHE_A210

> +       tristate "Pinctrl driver for the ZhiHe A210 SoC"
> +       depends on 64BIT

Why?

> +       depends on OF && (ARCH_ZHIHE || COMPILE_TEST)

Isn't this enough of constraints?

> +       select GENERIC_PINMUX_FUNCTIONS
> +       select GENERIC_PINCONF
> +       select PINMUX

Nice use of generic helpers!

> +struct a210_pinctrl;

Why this forward declaration? since...

> +enum a210_pinctrl_type {
> +       A210_PADCTRL_AON,
> +       A210_PADCTRL_0,
> +       A210_PADCTRL_1,
> +       A210_PADCTRL_2,
> +};
> +
> +struct a210_pad_group {
> +       const char *name;
> +       const struct pinctrl_pin_desc *pins;
> +       unsigned int npins;
> +       unsigned int offset_mux;
> +       unsigned int mask_mux;
> +       unsigned int offset_cfg;
> +       unsigned int mask_cfg;
> +       enum a210_pinctrl_type type;
> +};

... it anyway isn't used before we get here.

> +struct a210_pinctrl {
> +       struct pinctrl_desc desc;
> +       raw_spinlock_t lock; /* serialize register access */
> +       void __iomem *base;
> +       struct clk *clk;
> +       bool clk_enabled;
> +       unsigned int offset_mux;
> +       unsigned int mask_mux;
> +       unsigned int offset_cfg;
> +       unsigned int mask_cfg;
> +       enum a210_pinctrl_type type;
> +       struct pinctrl_dev *pctl;
> +#ifdef CONFIG_PM_SLEEP
> +       struct a210_register_state cfg_state[A210_MAX_CFG_REGS];
> +       struct a210_register_state mux_state[A210_MAX_MUX_REGS];
> +#endif
> +};
> +
> +static void __iomem *a210_padcfg(struct a210_pinctrl *pp, unsigned int p=
in)
> +{
> +       int width =3D hweight32(pp->mask_cfg);
> +
> +       return pp->base + pp->offset_cfg + 4 * (pin * width / 32);

Explain in a comment in the code exactly what is going on here, why 4*
why /32 why hweight32 etc. People can't parse this.

> +static unsigned int a210_padcfg_shift(struct a210_pinctrl *pp, unsigned =
int pin)
> +{
> +       int width =3D hweight32(pp->mask_cfg);
> +
> +       return width * (pin & (32 / width - 1));

Dito.

> +static void __iomem *a210_muxcfg(struct a210_pinctrl *pp, unsigned int p=
in)
> +{
> +       int width =3D hweight32(pp->mask_mux);
> +
> +       return pp->base + pp->offset_mux + 4 * (pin * width / 32);

Here is is fine to reference earlier explanation.


> +static unsigned int a210_muxcfg_shift(struct a210_pinctrl *pp, unsigned =
int pin)
> +{
> +       int width =3D hweight32(pp->mask_mux);
> +
> +       if (pp->type =3D=3D A210_PADCTRL_2)
> +               return 0;
> +
> +       return width * (pin & (32 / width - 1));

Here is is fine to reference earlier explanation.

> +enum a210_muxtype {
> +       A210_MUX_____,

I've seen this *______ stuff in other drivers, I guess it's something
with making things readable, just explain it to me please.

> +static const struct pinctrl_pin_desc a210_group0_pins[] =3D {
> +       A210_PAD(0, OSC_CLK_IN, ____, ____, ____, ____, ____, ____, ____,=
 ____, A210_PAD_NO_PADCFG),

I guess for this to mean "no pad here for this setting" or something.

> +static const u8 a210_drive_strength_in_ma[16] =3D {
> +       1, 2, 3, 5, 7, 8, 10, 12, 13, 15, 16, 18, 20, 21, 23, 25,
> +};
> +
> +static int a210_drive_strength_from_ma(u32 arg)
> +{
> +       unsigned int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(a210_drive_strength_in_ma); i++)
> +               if (arg =3D=3D a210_drive_strength_in_ma[i])
> +                       return i;

Don't you want some fuzzing here?

arg <=3D a210_drive_strength_in_ma[i]? So you get 5 if you list 4.

Default to 25 if > 25? Or no maybe that should indeed fail...

> +static int a210_padcfg_rmw(struct a210_pinctrl *pp, unsigned int pin, u3=
2 mask, u32 value)
> +{
> +       void __iomem *padcfg =3D a210_padcfg(pp, pin);
> +       unsigned int shift =3D a210_padcfg_shift(pp, pin);
> +       u32 tmp;
> +
> +       mask <<=3D shift;
> +       value <<=3D shift;

That's pretty straight forward and easy to read, thanks!

> +
> +       scoped_guard(raw_spinlock_irqsave, &pp->lock) {
> +               tmp =3D readl_relaxed(padcfg);
> +               tmp =3D (tmp & ~mask) | value;
> +               writel_relaxed(tmp, padcfg);
> +#ifdef CONFIG_PM_SLEEP
> +               pp->cfg_state[pin * hweight32(pp->mask_cfg) / 32].mask |=
=3D mask;

What's going on here and why? Add a comment explaining it.

> +static int a210_sdio_pinconf_get(struct a210_pinctrl *pp, unsigned int p=
in,
> +                                unsigned long *config)
> +{
> +       enum pin_config_param param =3D pinconf_to_config_param(*config);
> +       u32 value =3D readl_relaxed(a210_padcfg(pp, pin)) & A210_SDIO_BIA=
S;
> +
> +       switch (param) {
> +       case PIN_CONFIG_BIAS_DISABLE:
> +               if (value)
> +                       return -EINVAL;
> +               break;
> +       case PIN_CONFIG_BIAS_PULL_UP:
> +               if (value !=3D A210_SDIO_PULL_UP)
> +                       return -EINVAL;
> +               break;
> +       case PIN_CONFIG_BIAS_PULL_DOWN:
> +               if (value !=3D A210_SDIO_PULL_DOWN)
> +                       return -EINVAL;
> +               break;
> +       default:
> +               return -ENOTSUPP;
> +       }
> +
> +       *config =3D pinconf_to_config_packed(param, param !=3D PIN_CONFIG=
_BIAS_DISABLE);

Explain why *config is set like this in a comment.

> +static int a210_sdio_pinconf_set(struct a210_pinctrl *pp, unsigned int p=
in,
> +                                unsigned long *configs, unsigned int num=
_configs)

This is pretty straight forward to read though.

> +static int a210_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pi=
n, unsigned long *config)

So is this.

Review cut short due to time problems, will review next version!

Yours,
Linus Walleij
