Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A0E3C3BE0
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443158; cv=none; b=r7PMb7NYCkLj51JX2BccAWHWydDwlovLIlAi/0oQnG1F09qd8j7yy5taZkjg5drOSfT3jcnCVQfctWMNl12AOwLKjLOj/jwP9YWr7uCxjYCoQFKV132HmrkFm0U2+J2z6Ienop0lyFu5oTHvTaFJhi8VOu3OWw0MLbRhYmilxWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443158; c=relaxed/simple;
	bh=h1m6eKLGpoVOLZrB44iCZT4+3d1Kk9rEKnHWWROzdGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SKuc7V5xM532M3EUibvL9BrrXF0NaJytz2oiNw6gkCIhfZcPlbL9MhrFUWmtP2piXUAXBA7ASsMFLyVTeKptdQmrA1sLyc5OFwvEbmefo7clmUFKl0km7eeH0WCEzVfJJI2apoWFPf0Jiz+JrzRyHT48lwSEL3w0pT+4Qe41BI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O1Lkijrt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O1Lkijrt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A02251F0089A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791443157;
	bh=7RVIAn66HRCraiUM72IrINA9AXT9I9GJcBky7xKAoTc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O1LkijrtSQ7kpPs5XJShC1SUzOda49DYOcDVEgSui5xTwacgtT4QnWa3rR5Gfuo2g
	 TW/bPG++0ILtWVFkViQFj17O07cT+wLBfxSWh8Gqco+CigLxDUrunPOxIX0k0X3Q93
	 wdrNOvFtpCZjYQ3K2fmWum1P0pF5dSiwnEfG9DoTLxx/hAlrNBVafFcV4KN6dfBhOr
	 yqUnIfvsQwdfJae5RuEeuYYGJtDPJvR3rN/UdYpCZzzg6ygnGttDvPJ1eSmxVU43x9
	 MmVdO3EGbxlJRnLZ7snLtA2Ntypsay6HF6rO6iIM6fi06aPXdKF68yaGhUXomiKp3p
	 ahrbsVIOQoukA==
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso2019455e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 00:05:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxvEwCOV1mL1MBdSmw+pcqkhIGkT7lj/0ytrRa+9rE2W1RXlqDBXOkcjakIl3+EoJCRUBrpNW4A3lRPFbU=@vger.kernel.org
X-Gm-Message-State: AFuF++lnPgBPDF32o8LHRpKqzP4NIHFQxenol9VSebuItm2bXk+eEDaE
	OoobNlnIzYSrtnItmDjZajOBcM78+mcvswLiTnJVdhQVEkckGxbVd1SEKLynLba4nLKoDVb4CoL
	sy+LoCU25+r0Gs/j8e1ciGoVwCtSrKj0=
X-Received: by 2002:a05:600c:3d8f:b0:49e:6581:7baf with SMTP id
 5b1f17b1804b1-4a1851a3ebcmr26672575e9.2.1791443156091; Thu, 08 Oct 2026
 00:05:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
In-Reply-To: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 8 Oct 2026 15:05:44 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTQd0mEH_w1e3qTaf6ZeXABfeNo5FT+u8tbtszU8h_ADA@mail.gmail.com>
X-Gm-Features: AclHuK-LtllWkZaK2JqJZIIbCTc7f4mQYjC688eVVYvorAtkBlIlHduDa8O5vKI
Message-ID: <CAJF2gTTQd0mEH_w1e3qTaf6ZeXABfeNo5FT+u8tbtszU8h_ADA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] riscv: dts: thead: Add Milk-V Meles support
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>, Drew Fustini <fustini@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 3:44=E2=80=AFPM Han Gao <gaohan@iscas.ac.cn> wrote:
>
> Milk-V Meles is a single-board computer powered by T-HEAD's TH1520
> SoC with four C910 RISC-V cores. Add the board compatible and device
> tree for the Milk-V Meles.
>
> Enable UART0, eMMC, microSD, Gigabit Ethernet and the PWM fan, and
> name the GPIO lines exposed on the 40-pin header. Add AP6256 Wi-Fi
> support over SDIO and enable HDMI output through the DC8200 display
> controller and DW-HDMI transmitter.
>
> Board details:
> https://milkv.io/docs/meles/overview
>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
> Changes in v2:
> - Group BeagleV Ahead and Milk-V Meles compatibles in a common TH1520
>   enum, as requested by Krzysztof Kozlowski.
> - Explicitly select the GPIO function for the Wi-Fi host-wake pin,
>   as reported by Sashiko and confirmed by Drew Fustini.
> - Add Drew Fustini's Reviewed-by tags to patches 2-4.
> - Link to v1: https://lore.kernel.org/r/20260929-rv-meles-v1-0-effdd14a76=
e8@iscas.ac.cn
>
> ---
> Han Gao (4):
>       dt-bindings: riscv: thead: add Milk-V Meles
>       riscv: dts: thead: add Milk-V Meles
>       riscv: dts: thead: enable AP6256 Wi-Fi on Milk-V Meles
>       riscv: dts: thead: enable HDMI on Milk-V Meles
>
>  Documentation/devicetree/bindings/riscv/thead.yaml |   6 +-
>  arch/riscv/boot/dts/thead/Makefile                 |   1 +
>  arch/riscv/boot/dts/thead/th1520-milkv-meles.dts   | 346 +++++++++++++++=
++++++
>  3 files changed, 351 insertions(+), 2 deletions(-)
> ---
> base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
> change-id: 20260929-rv-meles-25d10148dc0c
>
> Best regards,
> --
> Han Gao <gaohan@iscas.ac.cn>
>
This series looks good to me.

Reviewed-by: GUO Ren (XuanTie) <guoren@kernel.org>

--=20
Best Regards
 Guo Ren
