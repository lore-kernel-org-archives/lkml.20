Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794360229;
	b=Txdvs8lMDEIbByCRFKE4nUz8ALPvjsJEjjglY+VYHaN4EDm65dJT+Xgp5X6RkijGn0JC
	 P7fXw6iXWqVn4UmD0ZhDlE0l7T30Hp4g7f8aboIRMYBnb/TPFGv/8iON90g/tqz3JIFv+
	 KWmq7fl9RtZZM++Nwm/beeo73QfMlaodxogIIhq/W0BC9MJE+u1idRRzdwck8J6VCtscI
	 sZDmQZUXBKiNdhEy688Wi9xwiwQjo5sZceUAfFdcKRXUQTJavfqOSREY0jaMSv/mTR0nF
	 rH9l4YGmu0LhTlg428XbOyg5yAYAEIiRzQG+MFMIK3nFndnuuF7hy/H8gcFkSkJP2LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794360229;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=B1lig7Anod9lgx4qxcaJK02qF6KZYVAP1p0ZWZvSXvA=;
	b=eINVryU5RxINcT3QbJGzrnswI1NxkYfelObAC9LQ1k87hPwmjzbPCkL0ljogTD0CE0jn
	 eBdU7vIX5T38nxii8YmgwUax96j+csCxyw3oAP91PpXprHyiaznxVf575mCZm9FjWeQwt
	 EfCR3x7mWX7WHzZie366e68eXSxKhxWPIZuDWB3MsX4jNNPHbZogVI5mDda3o7K1TzWi2
	 e2PaBCCPf71CTFIh79QlkDa74Wu7767F2ZFTCtz6F9mugtSx87CQxpNENvdfYINNk7MTU
	 SoWY9ofUKnRJt/0/fp4oo9gBZ5yG1Ho/HEnQGlzykmct8ovA3+p43BQ1vmzb0ytQslg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rMW2z906;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53FF606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B53FF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rMW2z906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=B1lig7Anod9lgx4qxcaJK02qF6KZYVAP1p0ZWZvSXvA=; b=rMW2z906/5ueth+PvqcM41FDxI
	rcVYiCU+KRHZllIijHjk+mirLP+V7kTCFKS/FUah33Uc/R6PNXhuYIvw5XkV0DpC6PcNVZR2CAWrU
	vqoBPa+61LPRg9bFMccEXxSWzVN0pagYSkEuRjHlFYQqy8g3exYlA6nsJDBG/MgAAjPobRgbg0doz
	zIPn1i9rYpn3eB77VgeMnxa14jiW2cAHPE02E61UfhYl1EZQ09pYKyqdzTAcSyiEy9KMAiSxgwLbF
	b26h0A9nCFL/j5Q9ubC/XyHiUe6KSCjxFl5CABbKmR0V+TtUsuI+iI9to8roP0+7SKJ7c5BWfsxPQ
	08siLNqg==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQx3z-00000005N3K-2qQI;
	Wed, 11 Nov 2026 01:23:47 +0000
Date: Tue, 10 Nov 2026 20:23:45 -0500
From: "Liam R. Howlett" <liam@infradead.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mm: only assert mmap locks if CONFIG_DEBUG_VM or
 lockdep is set
Message-ID: <g2qikknwv37iierelgrbodhvvchef3z6nunhcti4dqvxwbob7y@easqjwlcj2ly>
References: <20261110-tame-vma-asserts-v1-0-be293ff499a7@kernel.org>
 <20261110-tame-vma-asserts-v1-1-be293ff499a7@kernel.org>
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
In-Reply-To: <20261110-tame-vma-asserts-v1-1-be293ff499a7@kernel.org>

On 26/11/10 04:57PM, Lorenzo Stoakes (ARM) wrote:
> For a long while we have asserted the mmap lock being held regardless of
> whether or not the kernel is a debug build or not.
> 
> In general, given that these have been added as programmatic asserts that
> nobody did something stupid, production kernels are simply wasting their
> time checking for this.
> 
> It also means there is a two tier system - where some programmatic
> asserts (e.g. VM_WARN_ON_ONCE()-checked conditions) are only checked for if
> CONFIG_DEBUG_VM is enabled, whereas others are checked unconditionally.
> 
> If we genuinely want to unconditionally check for the mmap lock being held
> at runtime, then that should be made clear in the code doing it.
> 
> Regardless, if CONFIG_LOCKDEP is enabled, ensure that the lockdep
> assertions are performed.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Liam R. Howlett (Google) <liam@infradead.org>

> ---
>  include/linux/mmap_lock.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
> index 9c3a9c6525c1..9367430ee53c 100644
> --- a/include/linux/mmap_lock.h
> +++ b/include/linux/mmap_lock.h
> @@ -75,12 +75,14 @@ static inline void __mmap_lock_trace_released(struct mm_struct *mm, bool write)
>  
>  static inline void mmap_assert_locked(const struct mm_struct *mm)
>  {
> -	rwsem_assert_held(&mm->mmap_lock);
> +	if (IS_ENABLED(CONFIG_DEBUG_VM) || IS_ENABLED(CONFIG_LOCKDEP))
> +		rwsem_assert_held(&mm->mmap_lock);
>  }
>  
>  static inline void mmap_assert_write_locked(const struct mm_struct *mm)
>  {
> -	rwsem_assert_held_write(&mm->mmap_lock);
> +	if (IS_ENABLED(CONFIG_DEBUG_VM) || IS_ENABLED(CONFIG_LOCKDEP))
> +		rwsem_assert_held_write(&mm->mmap_lock);
>  }
>  
>  #ifdef CONFIG_LOCKDEP
> 
> -- 
> 2.56.0
> 

