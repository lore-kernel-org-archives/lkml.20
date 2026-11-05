Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866700;
	b=vAc9pDPnFRRtodBytpo29TUQbqdMPlRstrl9cCPTN2BoSOsNRpLNFbNtPuvlgvPJiZLF
	 R6YJjmNpc3h4TU3/WU8ZgdV0jC4x/cRF3wUQ6vX3+AEZLHSmcjWdGFgl6eSri9JjLDz29
	 hqhsc1usAQ+4mTqxG1RMvYNYJzZYpLJTRkfHCO0RrJzp1iH9Xn1kEZHEH287Ocz9HAq+I
	 BemOnUjSWOW7mzq6zApCS7Mn+PPfZ5IqUGUMfFBRUtHo4jNG8Q6Ee5P8EjoR4J46CNFI7
	 cpCntcsBCF65SinFn+gWbA4/Am4v9H+gN95u97c6Dls/KOYYl+9ko0oE+2vSeY5wQxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866700;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GpvzrD7F7jCcCoPYNwHv5Dd4S0jtahNQZKslWEbQ0P8=;
	b=bd2o33CVrCee+HQpsM29YdNnsoDVbwLA5QYYm1xUupkujlDHDIzWbfrnr+ig0I5MJ4+Q
	 kw4C9zARcLP8wU2fMS6s9p6Mbvw4KRd455OkRQScnBcMPLg/3WyQd3wXSvM/DjLiGxqG6
	 H6Xa4aYvy1Yb6IUKqTWEvvaVX6VPTLq34jI+UxmjBhDewzb1NqxCZWSmygSbjbcej3vBg
	 3Ru6Y/8PehXbWaD3KPotZrEaxszkxeLiH7KOfoT02npo11xud7HlXrmLedq7yRaIS89Bt
	 Pmb0mo/WLCDRxFnZXxc/NJS4jENODp9LpQqg+T08ThLGffjq9R9wee5CrIqPYruwiWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ccwPl9nR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD56F606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ccwPl9nR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBDF11F00A18
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793866699;
	bh=GpvzrD7F7jCcCoPYNwHv5Dd4S0jtahNQZKslWEbQ0P8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ccwPl9nRkf2ZOFBjnTxVK9cOOfKgAS0ppaY9JPoljHKTeCyNa9xXaim+rywFlFRCv
	 G1napga9Rx4UzdL4Mn1Sq9z+JsNwcl9oW9zUqAXhva1vSdaNMeCCAAfxJmSJKAUaZZ
	 Mcn9FCcz+TohZC4yZX/l6pC3C/hqfNiTc3bXH6JGk/q+OalieFL1x35auKhG7XM1rC
	 OH5vu/nlTcDJK3ge53Zgd4guj+0q2ER5BubCx0Z0myIfLLinvggLVQeFgphzgrK/SX
	 gKHp+NvCf1wNGVnMNCYNuZf4i1hlEXUvOvO0t48DPi/qG26tR5szmrOylkGikaJGyM
	 pAHNDJS3mjmDw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bcb1f1358aso1285154e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:18:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBya/T+BHCn719J0+VScYlQNoOe5+Cvyb7CD9VDDhOF+guwVgKtU+KBKNjwj9WaRBjx5pg9I1ZxAAxQnfhM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xi91bq3RcBSJq/dL40ScUurbHIreZEiTSVeg32j/gBWKdefSf
	AiKOQy4JJt0ZYL1K1i+p8nnaF+83GpY/y+bP6g+Px9JDx5iPVTRcYYc3FATDIR9ClIdh5I+DvFl
	YQ/G4nGB5nmSsdagr6nZN7KekIGxPpFI=
X-Received: by 2002:a05:6512:33d2:b0:5bf:d072:fa3f with SMTP id
 2adb3069b0e04-5bfd957dd98mr6086669e87.54.1793866698495; Thu, 05 Nov 2026
 00:18:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030195025.5153-1-muniquefeitoz4@gmail.com>
In-Reply-To: <20261030195025.5153-1-muniquefeitoz4@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:18:06 +0100
X-Gmail-Original-Message-ID: <CAD++jLkRYb1Pn2G=cP2yGkSFbuHhzRQ-fDbTygmpxbCsm-02gw@mail.gmail.com>
X-Gm-Features: AclHuK9XBSPBxmFe5Hgt9gaUyZoB-LuyN9Cx81zQH1wuYsj1bWqxtM_WPhjaH9k
Message-ID: <CAD++jLkRYb1Pn2G=cP2yGkSFbuHhzRQ-fDbTygmpxbCsm-02gw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Clear interrupt enable on spurious IRQ and
 skip unhandled EOI
To: Munique Feitoza <muniquefeitoz4@gmail.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 8:50=E2=80=AFPM Munique Feitoza
<muniquefeitoz4@gmail.com> wrote:

> When do_amd_gpio_irq_handler() detects a spurious interrupt on a pin
> that is not configured as an IRQ line (!gpiochip_line_is_irq()), it
> currently only clears BIT(INTERRUPT_MASK_OFF) while leaving
> BIT(INTERRUPT_ENABLE_OFF) set. Unlike amd_gpio_irq_disable(), leaving
> INTERRUPT_ENABLE_OFF enabled allows the pin status bit to keep
> re-asserting in WAKE_INT_STATUS_REG0/1. Clear both INTERRUPT_MASK_OFF
> and INTERRUPT_ENABLE_OFF when disabling a spurious GPIO IRQ on both
> main and RGPIO banks.
>
> Additionally, if no GPIO interrupt was handled (ret =3D=3D false), return
> early before acquiring gpio_dev->lock and writing EOI_MASK to
> WAKE_INT_MASTER_REG. This avoids unnecessary MMIO accesses and spinlock
> contention when the IRQ line is shared or asserted by an unhandled
> spurious interrupt storm.
>
> Signed-off-by: Munique Feitoza <muniquefeitoz4@gmail.com>

Sashiko comments aside, we really need to put Mario on CC for
AMD patches, Mario what about adding yourself to this MAINTAINERS
entry:

PIN CONTROLLER - AMD
M:      Basavaraj Natikar <Basavaraj.Natikar@amd.com>
M:      Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
S:      Maintained
F:      drivers/pinctrl/pinctrl-amd.c


Yours,
Linus Walleij
