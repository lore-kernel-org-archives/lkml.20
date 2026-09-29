Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BF73655EE;
	Tue, 29 Sep 2026 22:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790721541; cv=none; b=ZUXtldN7xbVZMnfHIB+VZ7XliVECR2eDY84/VIhvtH72g9AOC0rZN4s09mu3Fe2ChDmyy0rHI7rrxWbU83WtdzFz0/08wdky18QCZ3moKNK+99L/lRb5X0PY3FjJeSJo+8VDHFWMTWUD1VeYjVGBscVvvJJdU8KmgJ1p3F3sxJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790721541; c=relaxed/simple;
	bh=YamFZ9pJaCzXmfRBhkW6hydcPWkrGe6lN5ITB8E1ANY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GSuehkOMG5w5qZ/XWI1HgKhdE+AAvLSDi8sHuFKvw+Kv5jSeMQcVYma2m6tdkBmXk/QTawA7y/JZwDN5yRqlC3zGnMelmnuNh1IuWm8AkAqI5RNU9deylhHa/d7STrwmGglzPToCAL7PoHasZ+ZFWZJtWQS94Ssddbif8q7ywBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZiih5CJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZiih5CJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE3A1F000FF;
	Tue, 29 Sep 2026 22:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790721540;
	bh=Tui9/2fNizQMJViOJ/jcDTiMpXk/WgbdMbC6Oe3y1U4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KZiih5CJsFaqq/I60AsDf6L72WDBP7Rj8aqyGWyCHw4svoG9p8VOocWBSCbpsQEpW
	 JV0teRJCN+RqsWsMvzwl74GWrppIVqLJBl7KAqbWoWAmMxVI/WZYlW4awmjgKfuby3
	 VGKw0oNg+2LD/mwh2jVMIfq9yCHxfbXAZQwtc3cvu9d+AeO8BhGai3r2qf+zgMa4YX
	 YPy5Uun65k1g+XuzyNrWRh4m3mntUNx455zvaTUE4Q6sWBd2KL1NJiv4g/xNUZBEU6
	 P9QI6iobASrVULKLwnQqAz0R7N0EMTivfnv5qh3cYCDvmAhjLrIGVBOj6ifNjcRGqA
	 DIcILCbEpfU/g==
Date: Tue, 29 Sep 2026 15:38:58 -0700
From: Drew Fustini <fustini@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] riscv: dts: thead: enable AP6256 Wi-Fi on Milk-V
 Meles
Message-ID: <arw-AtrtmdkicuBs@thelio>
References: <20260929-rv-meles-v1-0-effdd14a76e8@iscas.ac.cn>
 <20260929-rv-meles-v1-3-effdd14a76e8@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-rv-meles-v1-3-effdd14a76e8@iscas.ac.cn>

On Tue, Sep 29, 2026 at 06:22:47PM +0800, Han Gao wrote:
> Connect AP6256 to SDIO1 with its fixed supplies and PMIC LPO clock.
> Use GPIO0_20 for WL_REG_ON and GPIO0_21 for the host-wake interrupt.
> Keep GPIO1_24 low to select the external antenna by default.
> 
> Use the existing BCM43456 binding and the 198 MHz board limit.
> Keep module power during suspend and assign mmc2 to SDIO1.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  arch/riscv/boot/dts/thead/th1520-milkv-meles.dts | 93 ++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts b/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
> index 3714047190789bfccd8ff6810342d7ff865e74e4..92b44cb90f57f4830efd29145744c005afa73119 100644
> --- a/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-milkv-meles.dts
[..]
> @@ -206,6 +249,26 @@ rx-pins {
>  	};
>  };
>  
> +&padctrl1_apsys {
> +	wifi_enable_pins: wifi-enable-0 {
> +		gpio-pins {
> +			pins = "GPIO0_20";
> +			bias-disable;
> +			drive-strength = <7>;
> +			input-disable;
> +		};
> +	};
> +
> +	wifi_host_wake_pins: wifi-host-wake-0 {
> +		gpio-pins {
> +			pins = "GPIO0_21";

This node needs function = "gpio". It is interrupt-only so nothing
selects the GPIO mux. I can fix this up when applying to save a v2.

Reviewed-by: Drew Fustini <fustini@kernel.org>
