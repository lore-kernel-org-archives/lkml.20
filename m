Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF825111A5
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910319; cv=none; b=qeLbb4e45Mfh8ZpRWe22ZY3275zb76gUlWkqGGJ6cRKAErLOmN3aZRKtZ1+ttqTzDjsflxhnh0MjE1tLaiMUSfz3Z0U+Irg9EJGnQOS/Lz05+xCQ1+D4bUyddX/mC23Rgic8+uStRLbvAKibD9nFXt3Tjir/E7slmYgWg6/8Ud4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910319; c=relaxed/simple;
	bh=0ViHQJP6tSLk1UV3pfKJO29C714UPZR37o6g6K/Byng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=difRksKTdMC5pFxSMx9Wh9UJVCq56qp5qHfq5YlIxGH/jNycN9CroMgvGHG0aTMKNtcjS5jbwKmPkGD7YfB5bjiYpKv9gna/09bqeXxqaJ0P12MIv6tIwAJheGwhJPX0Kj4R0b6NbhUEuedALNmiAAKppiE0/jnHVyB7hz2f928=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HvWia53Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvWia53Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D256A1F00893
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791910316;
	bh=l3/WP5D92dJn63pBVARZJXVp+tuxI1GnuqurUpTZ5jA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HvWia53ZYyhgcZ+OXH68fzSeCTvCqsiRulCTPfoxOQFfsZUMZ7HrmAVwxHq0TSIhj
	 0p0utXPvGUyGvZfDQB4Zcxctz5BdVh9RNiCElplGq3DFOQ58ymsICvXX2ZTjDpPP4B
	 X0wiA+SPk4Lsr7Lf84b/BHLe6yTWho8RUweV+v0/4IPNRf3MO6T4p9lFHjOlHvuMRv
	 KDbjyXUs12NH2QVqjoNNpwHh39PeyGCKmtbRFz3nSwX8yaEs0h5ugUoL2dsycH0fjl
	 yTrrtTaV2/funlxY0mmHwruBFnUq4eeaX+TzpQ6hDC5aiF2tziZWKHelXDMRPTCo4h
	 Tmxw75p8hc4Og==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bcb3726952so1453621e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:51:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx8G3mtVrKhta28vASYARIjNxJMVZhZrkXBGjIsVZKVUTsdMXZLM0N79sEiGqiEEtt+C/eLcqghKJn9Sfw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKe1RflyRPAfQmcdSrGako6dhRMo/MifWOViI6LNFB+HwWaya/o
	JotPIeicLJvZ90hzw9AEj83jS7JBqpYx0jg/91MgnPDcSxbBkkjclzh66cnn1CU735am2JKXgh+
	keyO/m16DSh4iQRHKd87WMjb+ftj8Hp0=
X-Received: by 2002:a05:6512:2245:b0:5ae:b7bc:27a7 with SMTP id
 2adb3069b0e04-5bcde35cab3mr4460647e87.6.1791910315615; Tue, 13 Oct 2026
 09:51:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com> <20261013-gpio-mxc-cleanup-v7-1-c4d769587d3e@nxp.com>
In-Reply-To: <20261013-gpio-mxc-cleanup-v7-1-c4d769587d3e@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 13 Oct 2026 18:51:42 +0200
X-Gmail-Original-Message-ID: <CAD++jLm3vuQr7WeYGMVVaNN5MuzuQvGrZFA4jboYBrTfCUfy8Q@mail.gmail.com>
X-Gm-Features: AclHuK_fxfc0XIQk4rQosnKB8so3c6I-uEvWCQIJ_fa7_pXjDsATNC4VePcqcl4
Message-ID: <CAD++jLm3vuQr7WeYGMVVaNN5MuzuQvGrZFA4jboYBrTfCUfy8Q@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] gpio: mxc: fix race between chained IRQ handler
 install and probe completion
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 8:03=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> mxc_update_irq_chained_handler() is called before the IRQ domain, the
> generic IRQ chip, and the port list entry are set up. If an interrupt
> arrives in that window:
>
>  - mx3_gpio_irq_handler() calls generic_handle_domain_irq() with
>    port->domain still NULL.
>  - mx2_gpio_irq_handler() walks mxc_gpio_ports, but the port has not
>    been added to the list yet.
>
> Additionally, if any of the subsequent probe steps
> (gpio_generic_chip_init(), devm_gpiochip_add_data(),
> irq_domain_create_legacy(), or mxc_gpio_init_gc()) fail, the error
> paths never unregister the chained handler, leaving a dangling handler
> that points at freed memory.
>
> Move the handler installation after all its dependencies are ready and
> after list_add_tail(), so the handler is never live while the data
> structures it touches are incomplete, and is never installed if probe
> fails.
>
> Fixes: 5f6d1998adeb ("gpio: mxc: release the parent IRQ in runtime suspen=
d")
> Assisted-by: LLM
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
