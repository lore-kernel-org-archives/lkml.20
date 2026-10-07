Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2AF3BCD29;
	Wed,  7 Oct 2026 22:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791410660; cv=pass; b=EduY9NAcmC1Yu2ub5LTdY5Tr66yBE+xtw1QbgrdtVk6dBNGEYdjJDGq/H0OQPe7K0JbHGCMubDzNqT7L675HW0H4JkMo0wICA2QNSzxtZOLLHJlQSrJ6Kiu8I4hiRe6z9ah2kuruycXdqPaWxwz2udIEANKzU6rC2Uducm+3xg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791410660; c=relaxed/simple;
	bh=R1EYKHXzQIWWU4LJ0kSGSQIho58HOWSeBtf1ih4kwQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JERXoti2lSSdGIHEBsXYFZt9ETyysBzW6UOr5oJw31MX0iDnfffUlqH7A1IwFBqkuo9T9fXWxmAdH9PkYPMUtxT5FuYibihb1kfywhgYC3T8fXeYyyissFhi8w0RTVIT8jqohDnhj0lPbe22DDJA9fpuKID1fk64gx+iNH7varo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=Uj1rnfss; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="Uj1rnfss"
ARC-Seal: i=1; a=rsa-sha256; t=1791410635; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gDvwZzsry72YvvN8k+UDURQWfAN1j2sErCYLGw/20kwhLuUsvkJ8D59LOj8udZ0iQZYt5dcSy8Zpm5DtposiDaQGt6Z5hw3Eyr8BA9wjAJ65Uf11pXCgsWh65b0whqZfJ7/WgJyFlzUKixJ6s9h6+KycnVrtfZ96iiZtGPvMk80=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791410635; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IS49IWXxuLYQK+6DYPPK3VQETMaAy08l2kK8RJEIHuU=; 
	b=FR1uHSy8yV4hDCqVqupIIeEmc2WOTHspCTdxcUisBusAj7O6FJiUBIKsMv6PJNlFrrsNq/RcBhRRTfFEqIwr/QW1zSsIEKtoL7L3FB30yuxRC3dwqmgzsX35ZZm0AmQfSGFyBYCZyWveUcGjbTktPGqq45dzbZzKkVQ0nML9v70=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791410635;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=IS49IWXxuLYQK+6DYPPK3VQETMaAy08l2kK8RJEIHuU=;
	b=Uj1rnfssxE581ioJvpYgmyzc9otF82Wcn1d14Wp7oOjnO6UumbDwYxxq2Y3kdchX
	D6Cb8tSjsr8d1yGpQ8r9BGYVYAzq2fp98SwCtbYp+nPVLH5beuTEEFtn3Ta97JUCK9o
	5HqvqvuCag1VTB0/a/R+h0lyaQ0SRJsb8aco6fCw=
Received: by smtp.zohomail.com with SMTPS id 1791410633828889.4891558379051;
	Wed, 7 Oct 2026 15:03:53 -0700 (PDT)
Date: Wed, 7 Oct 2026 22:03:34 +0000
From: Yao Zi <me@ziyao.cc>
To: Han Gao <gaohan@iscas.ac.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH v2 2/4] riscv: dts: thead: add Milk-V Meles
Message-ID: <asbBtj3fL0PUNGJ-@pie>
References: <20261001-rv-meles-v2-0-c61052262f84@iscas.ac.cn>
 <20261001-rv-meles-v2-2-c61052262f84@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-rv-meles-v2-2-c61052262f84@iscas.ac.cn>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/291.389.60
X-ZohoMailClient: External

On Thu, Oct 01, 2026 at 03:44:11PM +0800, Han Gao wrote:
> Add the Milk-V Meles board with UART0, eMMC, SD, Ethernet and the PWM2
> fan. Describe the board pin assignments and the PHY on the GMAC0 MDIO
> bus. Give GPIO banks aliases and name the exposed 40-pin header lines.
> 
> The eMMC I/O supply is fixed at 1.8 V. Enable DDR52 at that voltage and
> retain the 52 MHz board limit. Describe 8 GiB as the default memory
> size; firmware updates it to match the detected RAM capacity.
> 
> Reviewed-by: Drew Fustini <fustini@kernel.org>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/thead/Makefile               |   1 +
>  arch/riscv/boot/dts/thead/th1520-milkv-meles.dts | 227 +++++++++++++++++++++++
>  2 files changed, 228 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/Makefile b/arch/riscv/boot/dts/thead/Makefile
> index b55a17127c2bc06cbfb06d5f7c92dc7296e98437..25f7fe068368c97df2490bedc3eae70276a2e442 100644
> --- a/arch/riscv/boot/dts/thead/Makefile
> +++ b/arch/riscv/boot/dts/thead/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_THEAD) += th1520-lichee-pi-4a.dtb th1520-beaglev-ahead.dtb
> +dtb-$(CONFIG_ARCH_THEAD) += th1520-milkv-meles.dtb
> diff --git a/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts b/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..3714047190789bfccd8ff6810342d7ff865e74e4
> --- /dev/null
> +++ b/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
> @@ -0,0 +1,227 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2021-2022 Alibaba Group Holding Limited.
> + * Copyright (C) 2026 Han Gao <gaohan@iscas.ac.cn>
> + */

...

> +&emmc {
> +	bus-width = <8>;
> +	max-frequency = <52000000>;
> +	cap-mmc-highspeed;
> +	mmc-ddr-1_8v;
> +	non-removable;
> +	no-sdio;
> +	no-sd;
> +
> +	status = "okay";
> +};

Could you please explain the 52MHz limitation? This doesn't match what
I saw at RevyOS' downstream kernel, which seems the only distribution
supported by Milk-V officially.

Regards,
Yao Zi

[1]: https://github.com/revyos/th1520-linux-kernel/blob/a092d55649279e1c9bcda2769b8f6b4370fa2c94/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts#L1012-L1023
