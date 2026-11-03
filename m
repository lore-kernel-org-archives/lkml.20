Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718072;
	b=s6NJJAChjJh4AUqAX4UKK5vjnGFSEIvg86Q88ouwgimCiSbqhIOyvkSWk0ah/EaWEl3z
	 gzMQZZb6EsXepoYuZlmi/W+aknzl3yzBNFy6Ss5ICCNZugUyBiBXJ7CKT6kGWBPYFrX9p
	 E4h/vKz42/2Eq6wCzArpcCzmYRUnHxKJlBeL62+zr0Y3S/PxIRfKimI8t4wlFuXWFbhQA
	 G/g6II/UWw46t7cE5CsJBwuhB/y7cawkmhVqzU/Q/RkdNryO+Y1hxN6O4y6JcgeRaD7/b
	 oKIak6bdo0Tqzn5GECXVfF8SVHz6j2EqAepXs8mlK/b/TTMBq2i3f5Dv8oRQ3s3cxag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718072;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=YIDXQ4LW50kfGoDD/n5YI6WPW7QshVZmOorzzd9ZaKM=;
	b=PznIMPBWUQ9bSOp1Jo6ZeD3eOx9C29ZaJ8xrFxOYckpDQWwLamzRUQdCOHUi17nDC+WV
	 ywpqgDHmy0yghpBpKueXS32a0m+jABRNCrWg+VXUFSVf4g+gk72O302ox826Qw4zSm4vb
	 T2zv6knIeDAFkE6T7NU2G7t3kxRF4WeoRshXig8OG2M8SvvxtE6+VtAcObZ/f7HjpkY0Q
	 WNDNEkvnH4qEARCsO4hDXLNjsNbpMJu/eFql4dn2uRvh85USkuKDEH8qtouOLoMDb2smj
	 DUxBT2MzmHWgAyNbzFDYud/P7vCvWAGRhbYH1DWgYBXmxE2gLZUxREBBWVetOJO4VeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ODbmtctK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCA7606F61E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ODbmtctK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCF481F000C1;
	Tue,  3 Nov 2026 15:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718072;
	bh=YIDXQ4LW50kfGoDD/n5YI6WPW7QshVZmOorzzd9ZaKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ODbmtctK6ey4ItCUCWFbeMZSE56D99tTlV1QUMaYA/i1RQej0tUEqcOvef5XhpwWR
	 XB+mVN2GfQAyp1bpS9F8X79nwmsmMFqY/MuTJ/cdLXmMpmGpwhMJ4tctDHfXAPENUE
	 rE9TEgnW1tH/70PGGHLE6AXo57XJ9TRuGP+EddEfB/y3IK9OCyYpCUc8L0v1+yuFbR
	 vxD7+Jdw01ELtZutGhJAGOrCjvkgbTRDHQeGaTcCt7egjp6KhHDFZFN7V2LJgDqVnO
	 br5kEsp4Covrn8gKtTdn1lwK8UC8sj087mjLzzIfJoU8dmvN3Rol2OKWl0zR8EkxVD
	 K4PVjHJ6PXAow==
Date: Tue, 3 Nov 2026 16:01:08 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Marcelo Tosatti <mtosatti@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hrtimer: Retrigger local timers after clock changes
Message-ID: <aun3NCjn7dcdghCy@localhost.localdomain>
References: <20261101141552.644764-2-thnkslprpt@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261101141552.644764-2-thnkslprpt@gmail.com>

Le Sun, Nov 01, 2026 at 04:15:53PM +0200, Avi Weiss a écrit :
> clock_was_set() selects CPUs whose hrtimer deadlines move earlier
> after a clock change. smp_call_function_many() excludes the calling
> CPU even when it is in the mask, leaving its clock event programmed
> for the old deadline. An overdue realtime timer can then expire
> only when a later event triggers timer handling.
> 
> Use on_each_cpu_mask() to retrigger the local CPU when selected,
> without interrupting CPUs with unaffected deadlines.
> 
> Fixes: 81d741d3460c ("hrtimer: Avoid unnecessary SMP function calls in clock_was_set()")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---
>  kernel/time/hrtimer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
> index 17dd38a6cee7..3133d7403a74 100644
> --- a/kernel/time/hrtimer.c
> +++ b/kernel/time/hrtimer.c
> @@ -1000,7 +1000,7 @@ void clock_was_set(unsigned int bases)
>  				cpumask_set_cpu(cpu, mask);
>  		}
>  		scoped_guard(preempt)
> -			smp_call_function_many(mask, retrigger_next_event, NULL,
> 1);

Heh, this API is so error prone... If it really doesn't want to call on the
local CPU (for some undescribed reason), it should at least be renamed to
smp_call_function_many_butself().

> +			on_each_cpu_mask(mask, retrigger_next_event, NULL, 1);

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

-- 
Frederic Weisbecker
SUSE Labs
