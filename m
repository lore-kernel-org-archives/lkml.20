Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64856367F21
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085704; cv=none; b=VZsaC8O8iNEfWQ9XD2rz5x/a2YbTiTOgRdc0H4ZolLeP6EmQEhv1bjCiOQiHVVsm/ok7Zn5OLlU23e+GRbGCH5rxLsh1ccJpOViq+64QOmWjYnTYhIukog/1n8dpUsPDbGjof5kt1s5sObg9azgceV+6VqtnWfTMwIqpJ36s0Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085704; c=relaxed/simple;
	bh=kQrht+5sI9bASKFlgpONBOF4Z/HtyTurJ4XjvrOEmpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGGAq3+lv+YoM+ZrKAmQTy1InkkO++SlMVlvmVDxCA61rE4TCpdIvTyr0CPcmYL868JuUMfAgd/wPZwS5OlynLqHZ13CYgHSFOaoqldubm0BBgaAvlsNb5PEaZu3+L+fwLR/chGuvmBNOOW3bsm9yC3AXszVs6uulMXlr/buzro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rs8NKWS1; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rs8NKWS1"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 127A91570;
	Tue, 22 Sep 2026 07:01:38 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 864723F86F;
	Tue, 22 Sep 2026 07:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790085701; bh=kQrht+5sI9bASKFlgpONBOF4Z/HtyTurJ4XjvrOEmpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rs8NKWS15R7YDJBqLdcql2VJ8gnH2hZtsm3BC9gVnm5NqpVaHL049U42TsDGlCToN
	 Xk1jKhjiibZToljgHzBtgaw6dhPmL4WtsEyWV4J3xygPezkGvHi7j8sQj6Zp+8uqoX
	 LMEhl4/fm57xGK74ixP6dYwvETofqqR+oHzt11Tg=
Date: Tue, 22 Sep 2026 15:01:37 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 21/21] arm64: Rename 'overflow_stack' and
 OVERFLOW_STACK_SIZE
Message-ID: <arKKQe9bVo7_HC0d@arm.com>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-22-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918161407.2300-22-will@kernel.org>

On Fri, Sep 18, 2026 at 05:14:05PM +0100, Will Deacon wrote:
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 9d734cd09f62..7e9b26cf1bdc 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> @@ -327,43 +327,43 @@ static void debug_exception_exit(struct pt_regs *regs)
>  }
>  NOKPROBE_SYMBOL(debug_exception_exit);
>  
> -static void noinstr el1h_64_check_overflow_stack(struct pt_regs *regs)
> +static void noinstr el1h_64_check_exception_stack(struct pt_regs *regs)
>  {
>  	unsigned long sp = kernel_stack_pointer(regs) - sizeof(*regs);
> -	unsigned long ovf_stack = (unsigned long)this_cpu_ptr(overflow_stack);
> +	unsigned long exc_stack = (unsigned long)this_cpu_ptr(kernel_exception_stack);
>  
>  	/*
> -	 * We're in big trouble if we've overflowed the overflow stack
> +	 * We're in big trouble if we've overflowed the exception stack
>  	 * so perform a best-effort check before we proceed. If our SP
> -	 * is outside of the overflow stack for this CPU then presumably
> +	 * is outside of the exceptoin stack for this CPU then presumably
			     ^^^^^^^^^
Nit: "exception"

-- 
Catalin
