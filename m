Received: from mta0.migadu.com (out-249.mta0.migadu.com [91.218.175.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942091FB1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789443856; cv=none; b=gO1oN3YBTuqXVqmhC6JetUrjOOUDRgVvLzHt0GFkqXfrCFn1YOblMF6eIapMgU+fztm/0MB0gA/6WRcT10VmYJNsnauJCPe5CMnmjRuiF0LGjhl3E30+ph7sGUZQDKB5k7TZa1DQ+zEfPFYCcAmcD8BGYuRR1Q8Kuh7PmcFQvKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789443856; c=relaxed/simple;
	bh=2jbiWJDhwAbn+oByjgdLcODIoTIBG0rf4hLnt0gIZpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wc5Vq42Fab1folS7Ucx14kfUl6rm2bZjkjSyE0YX0F+3+cag1cT7I3vu6zAM9+VPENjafNJs53gC0qPZdEu/nBmkgIgclTPTwnQRvCKdnFQ19JP/ola50SgsxdOyvyjDy23U/n0KrHVuODNgKmtKp6NpQ4tc4tiIR2QAinFRwyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VDGPRjWV; arc=none smtp.client-ip=91.218.175.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VDGPRjWV"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2jbiWJDhwAbn+oByjgdLcODIoTIBG0rf4hLnt0gIZpg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789443848; v=1; x=1790048648;
 b=VDGPRjWVRw5huhHU3D6rBe5Sbi6KjQupuEJp8oKy8akPkGU+PNEdzDSkmeq3XrJv199PHLyY
 l0uxxWK16+YzvU1RBYzybSDTJoaA+tZ5oL9PNAN9/YTKelwHlncFPb+Li6AvhLDXm0uAbf2nzQX
 +YM6Ko5qoWZrEVrvQwnK68Hw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 83cc88a87bac19b3;
	Tue, 15 Sep 2026 03:44:08 +0000
X-Mizu-Trace-ID: 83cc88a87bac19b3
X-Migadu-Flow: FLOW_OUT
Message-ID: <02a03893-b092-433b-8b28-586dcb5a54bc@linux.dev>
Date: Tue, 15 Sep 2026 11:43:58 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] riscv: lib: Fix ZBB strnlen wrap-around regression on
 huge counts
To: shao.mingyin@zte.com.cn, pjw@kernel.org, mikey@neuling.org
Cc: jiangfeng@kylinos.cn, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, zhang.yue5@zte.com.cn,
 david.laight.linux@gmail.com
References: <20260914162123230u1y1M4UHrO8E-cU-opJ_7@zte.com.cn>
From: Qingfang Deng <qingfang.deng@linux.dev>
In-Reply-To: <20260914162123230u1y1M4UHrO8E-cU-opJ_7@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 2026/9/14 16:21, shao.mingyin@zte.com.cn wrote:
> diff --git a/arch/riscv/lib/strnlen.S b/arch/riscv/lib/strnlen.S
> index a8911605c248..528ee7995969 100644
> --- a/arch/riscv/lib/strnlen.S
> +++ b/arch/riscv/lib/strnlen.S
> @@ -67,7 +67,7 @@ strnlen_zbb:
>   	 *   a1 - Max length of string
>   	 *
>   	 * Clobbers
> -	 *   t0, t1, t2, t3, t4
> +	 *   t0, t1, t2, t3, t4, t5
>   	 */
>
>   	/* If maxlen is 0, return 0. */
> @@ -87,9 +87,22 @@ strnlen_zbb:
>   	 * Aligned boundary.  Use the address of the last valid byte
>   	 * (s + count - 1) to avoid loading a word past the count
>   	 * boundary in the loop below.  count == 0 is handled above.
> +	 *
> +	 * Saturate the boundary when s + count wraps around (very large
> +	 * counts, e.g. SIZE_MAX passed by FORTIFY strcat/strlcat with a
> +	 * destination whose size is unknown at compile time).  Without
> +	 * this, the wrapped boundary lands before s and the pre-loop
> +	 * guard below always exits, returning a truncated length.
> +	 * Saturating makes the scan equivalent to strlen().
> +	 *
> +	 * Keep the saturation branchless so that the normal path does
> +	 * not carry a taken branch that could be mispredicted.
>   	 */
>   	add	t4, a0, a1
>   	addi	t4, t4, -1
> +	sltu	t5, t4, a0	/* Did s + count wrap around? */
> +	sub	t5, zero, t5	/* -1 if wrapped, 0 otherwise */
> +	or	t4, t4, t5	/* Saturate to the top of the address space */
You can save one instruction by using Zbb minu instruction.

Equation: saturating_add(s, count - 1) == s + min(count - 1, ~s), given 
that count >= 1.

     addi    t4, a1, -1
     not    t1, a0
     minu    t4, t4, t1
     add    t4, a0, t4
>   	andi	t4, t4, -SZREG
>
>   	/* Get the first word.  */
Kind regards,
Qingfang
