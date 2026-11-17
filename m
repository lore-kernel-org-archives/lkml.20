Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924398;
	b=0JJL7ob6DqVNSubhhEZcyOkfxTQs7+lYMXpgO82EgZw6E6P3c69tae4zKhoFdHI3NPNS
	 xUmdSLS6SdX5A3tpoSKT1xkX9eg/4zRJWxzWwxzkCunCJs6IglIRfsyFlCo0tri+ya74H
	 p4SH3S1wn8PlNEkIPnYmtHXV5547EKZsZSwp/Gn75CIVEQMv7aEgPiIQS+gshktp7GpBv
	 IQE1agwkboPrERsCXctMxwFTDgnrLmxz2W/fAaD3iPf8ttKU6cp2Iz62yq1T814ZPtfS/
	 58F5mCyW5H0J9fBvYi3YIusMpvp7SJib7SnmuV83PVgHJyG/Z/0gEEWNqnSXZCdYWLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924398;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=u4DWjIfT8KRVg4FASuV86OIAjU2csjxn1K0PicbuhrM=;
	b=VnZ7hr65QvumTF+NMK234QStQW1G7TH91Oi+KaIawtVDhxnA4lx9xBaPzrr/zlPwW5zB
	 T1YOfD3hhgLAZOLYAV/4/QOQyTD1Z63CSq9+i09UvVwzDEOO14qphOPld1+gQVyUuvY8Z
	 29lgvVrd63rU1qSX3jTJmm7VOGz4BAg7oLUWepDcqQwYnbL5vPEQpmKeLaq4v7kQv8Wed
	 K9lGMmzqQP4q4fcmziv340Mt5XmyxAdzCua/oQKwfN2n25lnZc/Ky2NRk3N7hj5i6TAfL
	 yYJ0zpH/aoQuWBQ5FVGT7hCMIKkU5zHJ3iEigfBJ+fcVQjje6tWfx0L4GRmXUAeyLAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZNhG4l0P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E874606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZNhG4l0P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7871F000CF
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794924398;
	bh=u4DWjIfT8KRVg4FASuV86OIAjU2csjxn1K0PicbuhrM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZNhG4l0PhuvP8NHjII7K1OWgC7H4A0B/sgzCOiGt+BDXwLI/kJ8bbYUNQMD3TtaD4
	 KXAThsILUyBoFqmEDBtAPD1fiC8mr/9TOdfdOOzLIqJH3zMX24ermtwuE385kWqhm7
	 BD/bY0cgXnE1JbiJhwgVeevXQm8zzhsMJ9N5LQ7jLTkht26eH2gLOe10t9t9IXpakS
	 TxJ18PSLMVFfMloeF9YYRT6OhJC/rmQKBTVDc0NProVicUx/IFLavkefPZAepfz59t
	 7kx+Qk8w+HbcGwRtYV3c+Vs6u+Mz/OMhq6mJE352DF7vC2vXoEOkkpupAL/ko/yKMG
	 q4fk8CbQ7CwQg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be47aa555cso5089034e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:06:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEYycI4wAEjNNos/7wt0wHVdDirsHRr7qi25IH3bCTtbUmHvab3fNNMxzH4VmA+4pKgnZfjhsWg7NnEjMQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Du+5KRXoXUuZYdaR7ZkdaijwzHY+Ii4TOwdqcFudomD3CIXxc
	m2Ojwepm+sefUXTSYct6nMW9YRTEzZzMVA50TWkGeCdFDlhDRvtXU4cQeiDPissuVLAuzCTgZ/b
	rpe1Mq6kiIGl9GEZouqoaglITzrQVwU0=
X-Received: by 2002:a05:6512:668d:20b0:5c1:56f2:fdb0 with SMTP id
 2adb3069b0e04-5c1709ca3e4mr3590915e87.34.1794924397227; Tue, 17 Nov 2026
 06:06:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-ocelot-pinctrl-irqchip-fixes-v1-0-9d2d8fcd58f5@microchip.com>
In-Reply-To: <20261109-ocelot-pinctrl-irqchip-fixes-v1-0-9d2d8fcd58f5@microchip.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 15:06:24 +0100
X-Gmail-Original-Message-ID: <CAD++jL=i2_wrKNZ9tRJL+mRsXcAR3dJXVdGCNKe_AbT1McnP1A@mail.gmail.com>
X-Gm-Features: Aa3M54r_ZsB77NFXbqKooLbzXYFq-eAsg2wrDFxQdC2OMAqKX36xkKlww51lUws
Message-ID: <CAD++jL=i2_wrKNZ9tRJL+mRsXcAR3dJXVdGCNKe_AbT1McnP1A@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: ocelot: fix the GPIO irqchip context handling
To: =?UTF-8?Q?Jens_Emil_Schulz_=C3=98stergaard?= <jensemil.schulzostergaard@microchip.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Colin Foster <colin.foster@in-advantage.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Lee Jones <lee@kernel.org>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 2:50=E2=80=AFPM Jens Emil Schulz =C3=98stergaard
<jensemil.schulzostergaard@microchip.com> wrote:

> Two fixes for the GPIO irqchip of pinctrl-ocelot, where the irq_chip
> callbacks take locks that are not allowed in the calling context.

Patches applied for fixes, excellent work, thanks!

Yours,
Linus Walleij
