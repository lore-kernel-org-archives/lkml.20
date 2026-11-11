Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389745;
	b=ZGVIMExjN7NP+uRO8FtL3cF07sEML2sF2IRUOBfM+Oy1VS8vtjfLnyScb5mTbqgWMKiN
	 dgktRHW0YJjc9TjGDXkrc43IvX/XpvQcPrtbZ2KSNfNFYjjSrx6hyokVTFcu6voncd+2v
	 u4OWLj4APYr0lZ9gjp6We/qZMXWnNoDFue5GS7xu37ct8zYCqw8nndqesD7ep+mFTqpDh
	 8Q6qZ33HppldIxeFkArFJFiUG8tWG8xxvSud4ScC8FFdm0cMsVZvMExDlL3Lu108p9o6s
	 D7Vb+hbtrJMp7I0hjgkcjG3IPU9F6FLwwVZ7P5TpovE9OifufC3cNYcB25J/XjQIC1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389745;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=9X8CCswIaiCe2k/d80ea7S7jWAHEKF+u255fg2VFMFw=;
	b=s4Z6ETJmw4UX80EHJFJpnPUsDyn9HJAXcJjsTukdOdd6NIQHzjvQpUvNwDeayG4D588e
	 XNI4HESmNelZXoAACkywpSn456MU52NxpBVFjrzQiu+aOWbjCx0ihJKdT427+wAHOLmXH
	 +lelFhEryPAWpV+cUJgX13rI2m4bhe/fePPs4VzWIqMRqA4FfQrdqtbzXArShwcgJtgfa
	 LWc5IU0YZtWwl2qluJDitHW/XXXOfeG8gpA+r1ePihQqzK8esF7JX1SpCdzROe5nYKu41
	 9lLSmcB4QUYx0As/yZifGcfSJo2L2P7wr53fO7zohfWqFEkEfaaivC/7ak6+M0UPm5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T2qNYQkE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FB2606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T2qNYQkE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19881F00A05;
	Wed, 11 Nov 2026 09:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794389745;
	bh=9X8CCswIaiCe2k/d80ea7S7jWAHEKF+u255fg2VFMFw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=T2qNYQkE61kCIR/UriUiEp2Xe+xDAU4E1joo4LXujXTT1NiLFqQTbEsOAsAo2g5bK
	 hG0PCYjhQ2JRcdXyUEN7VcGwBsupQZ6hAxvCLVilPlRb4MlylhqRGPyxI+BFNutXCt
	 D0PHRPnp4Nz7HgQeYs1joXy4FBbJUpsLYykHZoqr4I+1MwtIetWyqpKOam8RZAV5u2
	 4ELqRRMIndDcRR4uw8FynIaqqaRRRb04+OVZl2kxVj186R/6T/2+swrwHPsSk235q0
	 LK/ktYI3fqYgg3oGJ8cVWMbvVzIdCQRYtvjdprwTT78fEBSuTVxMJBHQSIBUMepRuk
	 7nL0CN6YmKO8Q==
Message-ID: <f796b3fc-90e4-4fa7-997f-8df8cd5d2b47@kernel.org>
Date: Wed, 11 Nov 2026 10:35:42 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] mm: only assert mmap locks if CONFIG_DEBUG_VM or
 lockdep is set
Content-Language: en-US
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett"
 <liam@infradead.org>, Shakeel Butt <shakeel.butt@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261110-tame-vma-asserts-v1-0-be293ff499a7@kernel.org>
 <20261110-tame-vma-asserts-v1-1-be293ff499a7@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <20261110-tame-vma-asserts-v1-1-be293ff499a7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/26 17:57, Lorenzo Stoakes (ARM) wrote:
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

Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

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

