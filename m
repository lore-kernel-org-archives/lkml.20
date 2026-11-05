Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866755;
	b=gjJj0RK1dk9joe9gD8CqORIlX1wo77IOKYTYsiBzI9fbF71k/S40Yc0ohHEOwXyXmK8b
	 Z6KR+u9/X3nNYKXzETONv/4sC076w7QpV51IFbX38Z9InTFuZfAgReIvLwgS+W8yHT+lJ
	 2TXVZXMoihem9LIgLUIhoNKVFySCfE8pQuX4iSkoCwaA7WQYKeupjSlF9xreKL5Ct41vs
	 IILUqfe4JZg3yaOEl7f2YxDwGiw/rV6XpIUZH6ZU8oBSDmXBEygmFPJWdgCmNpckHyeNF
	 GQkepwAVl20MZXYia7lyBuLL4khdHTRA/GKY7WPcJ1gxpVxSAcsdwfRzqp+UM7JzjVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866755;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ib4GITzjYi7Kk431BobfzMOoYY06Hiby9a689p2pAyw=;
	b=WInW5far/Kea3kn9rwLrOTmrefNNknVVwf1Net4JVNzTwTvZVIHEhZ1ZtbCQn6Jwo1b9
	 wi3ECoYHyhguXWpIrRQizVqGYUExFe8B5R8H4TbBsrgphokQqiLGhh7BG7zIyopqpmHpa
	 HB1kNgli/XKo5Uok2WOegqT6w1GSaAkw1UFFjZrIr+AqM9MFIla8QWkSfW2NlO4c5hQ6f
	 9NN4PKGwX484gdwwJPOJwozVFEaTahnrGaxk4+TNgBULOQzpDurrcfnRpoakl5jUIh/NW
	 rpZo+eV3aS7DVgZMdoMYdZb7u8/DAVKLr2FSRqbPjttEvn534g4s8s2Gigq44u4JCmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X92nUbgA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDE1606A331
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X92nUbgA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA6B81F00A16
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793866754;
	bh=ib4GITzjYi7Kk431BobfzMOoYY06Hiby9a689p2pAyw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=X92nUbgAyE6EP3txRRGVfK5+KP0HXjJeJSylgu24H9x8r1P0iVkXPSvvTehI8JimP
	 rgIy+ci7KRBOKMkeFdW5Zgs0/cJHbOtk2GMVDA9R/+vWFpgw+748hc7iEkq+gkttVK
	 3uuHbO+bH879PRREvI2H/tEMoZuA1SkKfrv9X9at0Hye/FeQJ7Rgy/dNu9GE45wiyp
	 vuwGYvArItK/m5WCtI/j4AdYWxpth+2Hoj6q+tUiYxlMJYLHficvSCNZywXBVhAkYz
	 3lvFU6xo0oJCLcyYWd60V4HljZfnInY9tHnjwv69VdC2IwsPRNt8DR0kxxRDXFFWEu
	 lDqvUiJeXPk/A==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab27b4924aso13321781fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:19:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy8ATmCqQfr0D3madfUF2nAh+JrXePMmMfb9WYg9Kvu56l4ddlA/jyBOCHwOEvhIHF1Bea5mQh1aM0dEVY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+r8F/fqvr/angLaYrw1+Jzd7aCGMS8JXsQEkIfK6j0Ig9bHNOq
	Oe9OiCF2HXOGUIBwJrvk0rMTI2evSAOTHN9DkI9ngs9qTKAsxVOmuNBuy5FhJ/p8hTyaDPlHyM1
	TiQQ7sK28Q2T1y7VxryY69znMEU0ztac=
X-Received: by 2002:ac2:4e0f:0:b0:5bf:ce85:4d55 with SMTP id
 2adb3069b0e04-5bfd956bbc7mr5837021e87.33.1793866753657; Thu, 05 Nov 2026
 00:19:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030195025.5153-1-muniquefeitoz4@gmail.com> <20261030200827.24648-1-muniquefeitoz4@gmail.com>
In-Reply-To: <20261030200827.24648-1-muniquefeitoz4@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:19:01 +0100
X-Gmail-Original-Message-ID: <CAD++jLkYC2Fjwy_LFEP1=uUioGX0QGJz3pXrZrqzuq=oT_5EDQ@mail.gmail.com>
X-Gm-Features: AclHuK_Ml_OL847AN20qFhPaU3w6DGrMl3QakVm76l9q0Nj3vlc94VmLs_pDZp0
Message-ID: <CAD++jLkYC2Fjwy_LFEP1=uUioGX0QGJz3pXrZrqzuq=oT_5EDQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: amd: Clear interrupt enable bit on spurious
 GPIO IRQ
To: Munique Feitoza <muniquefeitoz4@gmail.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 9:08=E2=80=AFPM Munique Feitoza
<muniquefeitoz4@gmail.com> wrote:

> When do_amd_gpio_irq_handler() detects a spurious interrupt on a pin
> that is not configured as an IRQ line (!gpiochip_line_is_irq()), it
> currently only clears BIT(INTERRUPT_MASK_OFF) while leaving
> BIT(INTERRUPT_ENABLE_OFF) set. Unlike amd_gpio_irq_disable(), leaving
> INTERRUPT_ENABLE_OFF enabled allows the pin interrupt status bit to
> keep asserting in WAKE_INT_STATUS_REG0/1.
>
> Clear both INTERRUPT_MASK_OFF and INTERRUPT_ENABLE_OFF when disabling
> a spurious GPIO IRQ on both the main and RGPIO banks.
>
> Signed-off-by: Munique Feitoza <muniquefeitoz4@gmail.com>
> ---
> Changes in v2:
> - Drop the early return on !ret before writing EOI_MASK to
>   WAKE_INT_MASTER_REG so that spurious GPIO interrupts disabled in the
>   !gpiochip_line_is_irq() path still receive an EOI signal on the
>   controller.

Loop in Mario on v2

Yours,
Linus Walleij
