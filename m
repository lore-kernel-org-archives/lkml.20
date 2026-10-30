Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379786;
	b=10W3HzFvKJ8HTtAjN8Z28vCNVPHPxILtdN6hH2C216gS/BICbWA3Ew4ir0ZgdKM8kYIq
	 xt6IBKGexqMCS42dV/FLw+CGE3AjZdoIo5OCIET6gNyvpO2OQd1bGMxCoZuHURU4P9UsG
	 SSHTa0QyvGcVUZ99GwqjMV9sTPD+mIsmSh9Fhvfftt7CQjckdMAXAJ/eVrkyu1W28JCfC
	 uhEzytRFIfzgyqDYzakFFa9bRW8hGIQtoyjwe+Ny1LvOgATfDtrg4F085EVraIqbVF3nl
	 PpWlHNxKxBe5JcegLIzrd7Bof4+bDxL0Oz0SpgOcYzhSOW2T6SrlRtHnoNXVXmLUQiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379786;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xsarIZJL4PEc9Bxn42jOu8TJETM+T2V8nUbleqFixHE=;
	b=as5SPJXIzuV6N/VcfT9E/GzTlxoC5S7tFOGYb8MnitV69R0/emDPgFBC8YG0MK7PfEuC
	 q8txE6kWKF9ltw84/99Dc5YwE1MTb1+wmmESOb/If3R+1fSDewg2F5LUVHXl4FcZ9J4iP
	 xlyOq0FukDzAPmN9d5K+WIuk/rpPQY7Tt5gu3+dmsFbQvurwUUGx+mgGPWJ3f1uzGZZ28
	 FR2XWhO6WSoDTPlwehUbIGxPo3sleNLo9bk4cjgPqm0iB/4YafjMz2dWvee4adFXWuFbP
	 ArUGF2UXz3XgATRYx+9J5TWPMJD8zd0eS1vyJzlPPYltgHVHaBHB/YTbb3w3AxTmETA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BaCdGxpI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2632D606A31A;
	Fri, 30 Oct 2026 17:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BaCdGxpI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DD51F0093A;
	Fri, 30 Oct 2026 17:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793379786;
	bh=xsarIZJL4PEc9Bxn42jOu8TJETM+T2V8nUbleqFixHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BaCdGxpId/gMQjXhzIEWh4taJZzC1v4DRG0gg8E43qkw07Rv3yW3BvtakGav2a2dI
	 +tsT6KlAuQPRfrlQUmEDQ++wiSjh3oL/1G7V2AGQSLpfmXbknma4B6SA5f6SajBy/H
	 PMNf4PxgUFXkMhQZQ1RDxH1YtTyWnXBHa6UWepe4qm25dU4Qj56p95ALEj7/VzpZRr
	 OkFtso6ZHZbCibRn8fHfQenEeDBBY7W5GCoUZnVBhqzEL7FF8l9QXLSKFo9D1ebxTf
	 tuQh6e87oDfEhBucVEdX83CE49zlxJwG3sOJTEUm8J92VGXJIr7/aHbe8UdHc51GUT
	 czucnDKw3Ajbg==
Date: Fri, 30 Oct 2026 10:03:04 -0700
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <me@ziyao.cc>
Cc: Han Gao <gaohan@iscas.ac.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] riscv: dts: thead: add Milk-V Meles
Message-ID: <auTNyLqjBVgt2enA@thelio>
References: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
 <20261001-rv-meles-v2-2-c61052262f84@iscas.ac.cn>
 <asbBtj3fL0PUNGJ-@pie>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asbBtj3fL0PUNGJ-@pie>

On Wed, Oct 07, 2026 at 10:03:34PM +0000, Yao Zi wrote:
> On Thu, Oct 01, 2026 at 03:44:11PM +0800, Han Gao wrote:
> > Add the Milk-V Meles board with UART0, eMMC, SD, Ethernet and the PWM2
> > fan. Describe the board pin assignments and the PHY on the GMAC0 MDIO
> > bus. Give GPIO banks aliases and name the exposed 40-pin header lines.
> > 
> > The eMMC I/O supply is fixed at 1.8 V. Enable DDR52 at that voltage and
> > retain the 52 MHz board limit. Describe 8 GiB as the default memory
> > size; firmware updates it to match the detected RAM capacity.
> > 
> > Reviewed-by: Drew Fustini <fustini@kernel.org>
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >  arch/riscv/boot/dts/thead/Makefile               |   1 +
> >  arch/riscv/boot/dts/thead/th1520-milkv-meles.dts | 227 +++++++++++++++++++++++
> >  2 files changed, 228 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/thead/Makefile b/arch/riscv/boot/dts/thead/Makefile
> > index b55a17127c2bc06cbfb06d5f7c92dc7296e98437..25f7fe068368c97df2490bedc3eae70276a2e442 100644
> > --- a/arch/riscv/boot/dts/thead/Makefile
> > +++ b/arch/riscv/boot/dts/thead/Makefile
> > @@ -1,2 +1,3 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  dtb-$(CONFIG_ARCH_THEAD) += th1520-lichee-pi-4a.dtb th1520-beaglev-ahead.dtb
> > +dtb-$(CONFIG_ARCH_THEAD) += th1520-milkv-meles.dtb
> > diff --git a/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts b/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..3714047190789bfccd8ff6810342d7ff865e74e4
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
> > @@ -0,0 +1,227 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2021-2022 Alibaba Group Holding Limited.
> > + * Copyright (C) 2026 Han Gao <gaohan@iscas.ac.cn>
> > + */
> 
> ...
> 
> > +&emmc {
> > +	bus-width = <8>;
> > +	max-frequency = <52000000>;
> > +	cap-mmc-highspeed;
> > +	mmc-ddr-1_8v;
> > +	non-removable;
> > +	no-sdio;
> > +	no-sd;
> > +
> > +	status = "okay";
> > +};
> 
> Could you please explain the 52MHz limitation? This doesn't match what
> I saw at RevyOS' downstream kernel, which seems the only distribution
> supported by Milk-V officially.
> 
> Regards,
> Yao Zi
> 
> [1]: https://github.com/revyos/th1520-linux-kernel/blob/a092d55649279e1c9bcda2769b8f6b4370fa2c94/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts#L1012-L1023

Sorry about not following up on this sooner.

Han Gao - could you explain what the motivation was for 52MHz?

Thanks,
Drew
