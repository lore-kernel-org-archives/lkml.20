Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0032D4F7CAF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686537; cv=none; b=dGctg14K7dOqGFBPzs+z5iNYvv36QMN/Q6Vpfk4nLEZivmKjVkM1M36PwevZIerwSjDEvpE7kbIOiIKcZO2oCgfCeNNn2ZXDNCb4L97hjGG0nDlyGqxlNHKUj3QrQrl+KymsISqLRbldana8x+svH/ZORPPaeOwB162sbVLZLuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686537; c=relaxed/simple;
	bh=tCMTsPHjO2fXbww9+BHIYYPXZ2hJhXv8equJFXTA+DE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LwfUtQwxAFReToNounElbEK51Tde+4Aht8P/GqF0MpFHlPC5hBqApoDhTpJSODICGCEbe+Q5izKz9qa4Bs/tNvdCQDblDTEkrGYN9snIP8mCAxHuIwAHOvuh5KD3DFM/peKWBHx9fk29JTTsE0rDAkU8B/4HUayZjRnOCIPOGfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O0IrFkyE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O0IrFkyE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE951F000FF;
	Tue, 29 Sep 2026 12:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790686535;
	bh=gCkJjBBff/AJibyur95WsljmL9G7qJJd4uMEIUoBaII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O0IrFkyEUym09hmYERwCoeXE5FV+rViVAoFgvgV/1Z7djCEdl0r14IYM7huhcz/mc
	 UXeYWz/TWgjulH1qt2vR8LzeT+VYQxWvIRiazSBnnnCkMnzMkQU72ji4xB/bFZ2nwe
	 pB2bidGM0WdrtRQT15AhEkgJLz/H+7w2S/EojnaAInelokEKJct7M77W2Pq33/FVLq
	 8LsxVemswmK2xRwo8hYCF2kvXqmRFg5qPySS3OOOcNbQv4hRZSnRcsZHfeRsmXDHwC
	 /XGQKdl3JkNLiUzk8XKrAXQ92MqOS6F5A5ABGgFP492Y0QoLkpVVZr+r/fE/NFDpE+
	 RSAvWP5DxQPwQ==
Date: Tue, 29 Sep 2026 13:55:30 +0100
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v3 7/8] clocksource/drivers/arm_arch_timer: Expose a
 direct accessor for the virtual counter
Message-ID: <aru1QvpaQ8A-OnQq@willie-the-truck>
References: <20260802165327.385217-1-maz@kernel.org>
 <20260802165327.385217-8-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802165327.385217-8-maz@kernel.org>

On Sun, Aug 02, 2026 at 05:53:26PM +0100, Marc Zyngier wrote:
> We allow access to the architected counter via arch_timer_read_counter().
> However, this accessor can either be the virtual or the physical
> view of the counter, depending on how the kernel has been booted.
> 
> At the same time, we have some architectural features (such as WFIT,
> WFET) that rely on the virtual counter, and nothing else.
> 
> If implementations were perfect, we'd rely on reading CNTVCT_EL0,
> and be done with it. However, we have a bunch of broken implementations
> in the wild, which rely on preemption being disabled and other
> costly workarounds.
> 
> In order to provide decent performance on non-broken HW while still
> supporting the legacy horrors, expose arch_timer_read_vcounter() as
> a new helper that hides this complexity. Obviously, this is simply
> a global alias of arch_counter_get_cntvct().
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/clocksource/arm_arch_timer.c | 2 ++
>  include/clocksource/arm_arch_timer.h | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
> index b3b31d4f4815f..9c7501ce57073 100644
> --- a/drivers/clocksource/arm_arch_timer.c
> +++ b/drivers/clocksource/arm_arch_timer.c
> @@ -128,6 +128,8 @@ static notrace u64 arch_counter_get_cntvct(void)
>  	return __arch_counter_get_cntvct();
>  }
>  
> +u64 arch_timer_read_vcounter(void) __attribute__((alias("arch_counter_get_cntvct")));

nit: compiler-attributes.h provides __alias to make this a tiny bit cleaner.

That said, why did you decide on the alias rather than just having this
as a wrapper function?

Will
