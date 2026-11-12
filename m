Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458537;
	b=GMPxRmlBO+9+xplvUiXa6wRC95w4Y34Wcxxmp0/Kby/POg8QCuYcivX5zbfIXmtVoMtR
	 l9YH/Ut2qUaYz1aODM+ktVbZYtlkKKzao+JWcLZYzv9HWS4WS9wJvEk/tmOwi06931jtO
	 9lylYwqA8ts0EnLBMBElthYYfRcWHSObR4q0br/hwV5HeT4llINFlZwEEG1wiQHBaK6LP
	 zKjuePUE2cpvjmPtMo9qfhJ7zuSMBbxxul6mxadlgaCaKpBp8FJEx4nNLXHxMqVCfM6Ja
	 8WM3rERGUnosia3JK6RZJStASq+AiMFwyKxiNEtDINqF1D1D/IH/aOpvpD9ikypRkhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458537;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=o/qgiXuzgvovjEKL8rovshVCvJVWXh8SFxbVTEJ1seg=;
	b=Rmq+fKt3viXpfDA7y9SGqyY5SJF8o+a3WtlaBJlx6NomezdoOpvDURkuFvHHnRj63qmw
	 dW7qk8T1tkzio9Z2d17/6nQx3RBUP0TxDI+muBOWgDFOMxzx8R1tXoitxsoJuYDqF09GC
	 AXu0NWGXvlXBGTB1ne+CDjgoWbgwEphRJT54dE0bWAIqxRBEbOdDkO1R/0KyxHblWBfCW
	 A2oMbcAPseCyjR4nT6GhBuzI9oL6GMn+eskDo//JvpwCQy0UjzdGM1XYhfVLhLYb09WDH
	 RyOig4BQU/oQJkHK9OvzNxYjtlBCmRsqHRSSiwm7+V8gZWCHjom6SWU8PIjTrk+QQsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oKLFmGC3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15429606A324
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oKLFmGC3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA731F00A05;
	Thu, 12 Nov 2026 04:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794458536;
	bh=o/qgiXuzgvovjEKL8rovshVCvJVWXh8SFxbVTEJ1seg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oKLFmGC3CBj77IN8R53zS/qL4a9ihAyCGK4U17EoaCbrRh/OFRePeoLEaQ9UIRXFV
	 W+MhiXrz9hcC1OgXhmJ8pcH1BiEjHXRV2vI4Sj33UP/CLyE0ZUafwI2F8yOz1rl9pO
	 R+QEB/6cWdVzm7EvYpsVHHKvTNCGa6BDyUG0bEvu67xeJj0FXb5YFLtKEUXM2EW0tA
	 Tc72WNyZFLo/p5rdV29LJmowivAqevjWwW3UhAGgXOEjYoF0UGJyYfls/77o5KyvrP
	 qenHsmKsSNvi9E6UjCdftqprbzkCEN9k6yix/ab0BzaycSjd6zYYtbXc1yEKZOGJGN
	 fAklX1TBxLtBQ==
Date: Thu, 12 Nov 2026 12:22:03 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: unaligned: fix __setup handlers
Message-ID: <avU-62EVrL341rL5@xhacker>
References: <20261111-fix-riscv-unaligned-v1-1-0722514fc1e4@mobileye.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111-fix-riscv-unaligned-v1-1-0722514fc1e4@mobileye.com>

On Wed, Nov 11, 2026 at 12:41:21PM +0200, Vladimir Kondratiev wrote:
> Returning -EINVAL from a __setup() callback cause invalid
> unaligned_scalar_speed= and unaligned_vector_speed=
> values to be treated as handled. obsolete_checksetup() treats any
> non-zero return value from setup_func() as success, so an unrecognized
> argument is silently accepted instead of being reported as an unknown
> boot option.
> 
> __setup() handlers return 0 on failure.
> 
> Fixes: aecb09e091dc ("riscv: Add parameter for skipping access speed tests")
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

> ---
>  arch/riscv/kernel/unaligned_access_speed.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> index 67f1a0371659..323ccfcfbbb7 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -322,7 +322,7 @@ static int __init set_unaligned_scalar_speed_param(char *str)
>  	else if (!strcmp(str, speed_str[RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED]))
>  		unaligned_scalar_speed_param = RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED;
>  	else
> -		return -EINVAL;
> +		return 0;
>  
>  	return 1;
>  }
> @@ -337,7 +337,7 @@ static int __init set_unaligned_vector_speed_param(char *str)
>  	else if (!strcmp(str, speed_str[RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED]))
>  		unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
>  	else
> -		return -EINVAL;
> +		return 0;
>  
>  	return 1;
>  }
> 
> ---
> base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
> change-id: 20261111-fix-riscv-unaligned-e2df80509e0f
> 
> Best regards,
> --  
> Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
