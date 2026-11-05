Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869763;
	b=YWTLf8IF/wtybDpN7BiENl8InrqlbX11Y2E+BZR9PPtyw2JKGSSuxuMjpXace0CCPbjH
	 Me11M40RL1+joWPlkcQfe50dr0v8bEyrRsvu9w/7n/zYtO7Zk8FMOc2jRKHtxCNzysDB2
	 ihJgj/5m5eBZn7dqbi3s0w1yFq/QaE1eEZ1whJI4IWbKs3sUG+2I+2E65NgWgGS7nAraS
	 FF3ytBrEDtObWS4IZfobTjho37x7OCLUjYoKmLpxqWkB9LAtQM/FwCNaY4y0SDsso6wMI
	 JeXkfmAJRvzCXV3hgm/ekNVTZPaDlpCCgL5l1NtLUXGnXhLm+IvbzkIr1wYz9aXSIYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869763;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XPRzF8D20vLGlolnD97rznjy/PyLkjp3WUP5Ugc731I=;
	b=vednklmpNMarEgIxzeQ2M+RJQ67fulxtAAHGNv8oXtQ3IpcfJD2Xsca+tlMBHtdQMzzq
	 BcuvsiXzdIOyAoFcDcp+2YLdVaoxgToWSl3wxlXkyS2IxWnJQBHEQ0cH1YlIJ/LATEF4N
	 mJbfXkY2AGfsuoWaG03r41C2NLSebPqUeWinVGwes6vGoLMGl/eO+4iaNWXsrDRW7rI8i
	 KJxum74g8bkcrVTg0AqlMscFlKrhJ5t90XuaFlKMjcsxkwmhyH++zk1Wf7ODziAErEqjd
	 dVYJ7QaCtw2b1V7mSPL354IY+zS1j2M59vRsA3xIo/PtPTkLy3WEUlutwVIU2K4nM7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j0YBO9Tg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3D8606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j0YBO9Tg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C80B61F00A15
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793869762;
	bh=XPRzF8D20vLGlolnD97rznjy/PyLkjp3WUP5Ugc731I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=j0YBO9TgqzMAtvAuSX2lrPFPyFd3f4S5azEeXlG0JX/KfBjdZbp/ITajY4PVdkKaQ
	 bDXhtthgDlDLbQpxRUazncbOeJnay3/hs4HDv8HsEj0VpKSfGKd2uf3LkVxiyI7vN+
	 +hyI4ZLXG6a88naS6Wc7g2EPDDoSGU+Yy/bYpPYU3ILhrXiDmPNLf13spSi2BhQcCo
	 sUNw25Vsci/ODn8tA3mgkTanWMSmEfEwWjIHjNK5Gjt4PwKVU7TDXC4xWJ0Y2slK+W
	 vk2m202zueGQiShMxhHYerAVjgTIFXvrfilAugoxVofi3gmnqtFfXO5m4O9p1Kdadm
	 ANysnK53Iky8A==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so939266e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:09:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw+jiD1oJ5VZ4fKGelMopV1PVTpPnkHzTIbBRLEgDbxpjgye4lC1jlrVoxyJh8CHfd7U0hqZWAj5Lo3/+k=@vger.kernel.org
X-Gm-Message-State: APuU4Z90CuJesgki68RahlHwKV/14F1MVbr4HUybH+/o0m/iDkbDJWD8
	I8ZW/J44KQ4P6ztOlw8ICkOZEgh9u0IzYxPbk3UTfIRezFl+qSpxFrFuQmadTk8pxbrQRWRYTW3
	SwmrZd0XPgHPOFPem+k0Zl3OyNM87Nqk=
X-Received: by 2002:a05:6512:1188:b0:5bf:d238:6af6 with SMTP id
 2adb3069b0e04-5bfd95803fbmr6074827e87.45.1793869761546; Thu, 05 Nov 2026
 01:09:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028084531.6237-1-Chloe_Chen@asmedia.com.tw>
In-Reply-To: <20261028084531.6237-1-Chloe_Chen@asmedia.com.tw>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:09:08 +0100
X-Gmail-Original-Message-ID: <CAD++jL=AX542N3nvuGO2g-_935i21oLKn5zgWPicZHONAQojbg@mail.gmail.com>
X-Gm-Features: AclHuK8WT5jEsKVLzn0_U4Qj8gkHXwp5ZvLQA1T9S3Oj-ES5esPBMeo2lsB5KPY
Message-ID: <CAD++jL=AX542N3nvuGO2g-_935i21oLKn5zgWPicZHONAQojbg@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: amdptpci: add support for AMD PT PCI controller
To: Szuying Chen <Chloe_Chen@asmedia.com.tw>
Cc: Markus.Elfring@web.de, brgl@kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Yd_Tseng@asmedia.com.tw, 
	Jesse1_Chang@asmedia.com.tw, Richard_Hsu@asmedia.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Szuying,

thanks for your patch!

On Wed, Oct 28, 2026 at 9:46=E2=80=AFAM Szuying Chen <Chloe_Chen@asmedia.co=
m.tw> wrote:

> The GPIO controller on AMD PT PCI platforms currently has no in-tree
> driver, so its pins cannot be used from Linux.
>
> The existing gpio-amdpt driver cannot be reused. Setting aside ACPI
> vs. PCI probing, the hardware differs significantly:
>
>  - Register semantics conflict: offset 0x0C controls the clock rate
>    in gpio-amdpt but enables interrupts in this controller.
>  - Interrupt controller: gpio-amdpt has no interrupt support, while
>    this controller has its own INT_LVL, INT_STAT and INT_MASK
>    registers that require a full irq_chip implementation.
>  - Wakeup: this controller can wake the system from GPIO interrupts,
>    which gpio-amdpt does not support.
>
> Only the basic data registers are common, and they are handled
> through gpio-generic, so little code is left to share.
>
> Add the gpio-amdptpci driver to support the GPIO functionality on
> AMD PT PCI platforms.
>
> Co-developed-by: YD Tseng <Yd_Tseng@asmedia.com.tw>
> Signed-off-by: YD Tseng <Yd_Tseng@asmedia.com.tw>
> Signed-off-by: Szuying Chen <Chloe_Chen@asmedia.com.tw>

(...)

> +#include <linux/bits.h>
> +#include <linux/compiler.h>

Why this include?? Add a comment next to it why it is included
if this is really necessary.

> +#include <linux/kernel.h>

I think this generic include should not be used in new code, use
specific includes.

> +static int pt27_irq_reqres(struct irq_data *d)
> +{
> +       struct gpio_chip *gc   =3D irq_data_get_irq_chip_data(d);
> +       irq_hw_number_t   hwirq =3D irqd_to_hwirq(d);
> +       int ret;
> +
> +       ret =3D gpiochip_reqres_irq(gc, hwirq);
> +       return ret;
> +}
> +
> +static void pt27_irq_relres(struct irq_data *d)
> +{
> +       struct gpio_chip *gc   =3D irq_data_get_irq_chip_data(d);
> +       irq_hw_number_t   hwirq =3D irqd_to_hwirq(d);
> +
> +       gpiochip_relres_irq(gc, hwirq);
> +}

These are reimplementations of gpiochip_irq_reqres()
and gpiochip_irq_relres() so use these instead?

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> This email and any attachments to it contain confidential information and=
 are intended solely for the use of the individual to whom it
> is addressed.If you are not the intended recipient or receive it accident=
ally, please immediately notify the sender by e-mail and delete
> the message and any attachments from your computer system, and destroy al=
l hard copies. If any, please be advised that any unauthorized
> disclosure, copying, distribution or any action taken or omitted in relia=
nce on this, is illegal and prohibited. Furthermore, any views
> or opinions expressed are solely those of the author and do not represent=
 those of ASMedia Technology Inc. Thank you for your cooperation.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Eh? Get rid of this horrid footer.

Yours,
Linus Walleij
