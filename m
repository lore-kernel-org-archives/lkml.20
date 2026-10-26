Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030663;
	b=b+UaUu2XBLvg/ztZR0YBxpEvTtrB85VgyHMD3oy6iIwUd4yWOAsLfjPM32V7rJrZCHtc
	 TFkuMWqvHD+eyXrgz1BjfFns/9DmLkzc/MtQoUlVRCHe/yuyKOTgXUU9IzhAxWTlZfZmm
	 6eFPjk65zypDFXA977mBFl7HeocAAJnX/x5vGaMMWJbtrZsXtE1prBtoa790j8l5eWCD4
	 m9nnhsze8uj16zpU/EqnbrKnl150R5574Ly1cdCR9VNbTm+W7grgAbMeAInhEXyZZQAQR
	 dZAUa6U2yo3hTmpT726rc0AuNo2WMqf98Nmr8jRb0xiFeeNXxP8Mt/Kj9UeYXi4xmzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030663;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZOLHKlto0pXJF6loPpjpa0OycjxvrBLzXBWdK09FWNI=;
	b=27eDIM2lTjLgoaOSfii3dOj/sM49xpcMAESjHpydwb/778LCFvEe0VEiau9Pni6hM/kt
	 cwf3ZdnAin2KyEeGq49mcxtFi7iQeRjJ4hZDhop5a5Pv2O0bZINfKc7l+OFbKGyhQmsH8
	 S/eNSd9Wd8kuNQxe56NE7YHl0Zak0yyc8RNQOtBU/Lz4T2QzfiR898n9AaDpOorCv1F2U
	 9X5dWnATRuC594ihUW4SLLYW9mnGWh/9g7jkxtEUrOsU9k/6hfxfnIYi64Qr27nK2PRQW
	 /yIUjN4GbvZakqErd+o1OVMbM+50ME9cF2tlhw7AQXIPcM4G4thsgGamFk6WCqvOeOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=XMmkvF29;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EF3606A330
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=XMmkvF29
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E541F01828;
	Mon, 26 Oct 2026 16:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793030662;
	bh=ZOLHKlto0pXJF6loPpjpa0OycjxvrBLzXBWdK09FWNI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=XMmkvF293u0Pe0kiXpCN0KSKP9el8rfDin08+YvXxK9dubjg35ZPnvU5agpBBaYTE
	 /ncryhCA7ppNhpCL8zjTuawEGahS+R6IVuTFWuua/vS3zNAjzPvhwyr7P5Y5Al9iQZ
	 4zTfx7NlZyvVeCNpgvhpcLInRQFtHN2zQZuC4Jgw=
Date: Mon, 26 Oct 2026 09:04:21 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Cc: linux-mm@kvack.org, Baoquan He <baoquan.he@linux.dev>, LKML
 <linux-kernel@vger.kernel.org>, "David Hildenbrand (Arm)"
 <david@kernel.org>
Subject: Re: [PATCH] mm/vmalloc: Bail out if in softirq context
Message-Id: <20261026090421.e4bd83f3e20fb82852abec4e@linux-foundation.org>
In-Reply-To: <20261026102503.30860-1-urezki@gmail.com>
References: <20261026102503.30860-1-urezki@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 11:25:03 +0100 "Uladzislau Rezki (Sony)" <urezki@gmail.com> wrote:

> vmalloc() is not allowed to be invoked from the NMI,
> hard-irq and softirq contexts because doing so may
> deadlock on internal locks.
> 
> Commit 04aa71da5f35 ("mm/vmalloc: do not trigger BUG()
> on BH disabled context") replaced the deprecated in_interrupt()
> macro with explicit in_nmi() and in_hardirq() checks, but
> unintentionally dropped the softirq context check.
> 
> Example:
> 
> <snip>
> vzalloc() in a task
>  spin_lock(&vn->busy.lock)
>   <------ Hard irq
>    irq_exit()
>     process softirq on the same CPU
>      vmalloc()
>       spin_lock(&vn->busy.lock)
>        spins forever
> <snip>
> 
> Restore the check by checking the caller's context with
> the in_serving_softirq() helper. Note that, it is still
> allowed to invoke vmalloc() with disabled bottom halves.
> 
> Replace BUG_ON() with WARN_ON_ONCE() for in_nmi() and
> in_hardirq() case.
> 
> Cc: David Hildenbrand (Arm) <david@kernel.org>
> Fixes: 04aa71da5f35 ("mm/vmalloc: do not trigger BUG() on BH disabled context")

Sounds like a cc:stable is needed?

> Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
> ---
>  mm/vmalloc.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 7521b9b3bfd2..36e6e3be6ba4 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3252,7 +3252,13 @@ struct vm_struct *__get_vm_area_node(unsigned long size,
>  	struct vm_struct *area;
>  	unsigned long requested_size = size;
>  
> -	BUG_ON(in_nmi() || in_hardirq());
> +	/* IRQ re-entrancy -> irq_exit() -> process softirq. */
> +	if (in_serving_softirq())
> +		return NULL;
> +
> +	if (WARN_ON_ONCE(in_nmi() || in_hardirq()))
> +		return NULL;

WARN does a lot of stuff and I rather doubt that it's all nmi-safe.  I
don't think this matters much - it'll probably work out and as long as
*something* gets printed, it did its job.

>  	size = ALIGN(size, 1ul << shift);
>  	if (unlikely(!size))
>  		return NULL;
> -- 
> 2.47.3
