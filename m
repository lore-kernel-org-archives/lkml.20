Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794771532;
	b=vbd1vn0udoyUm1lFP6IQn/nkideMYsMggdz7n1zR0nW9gGyK0YmMVrRDZaD0iNX+mgBo
	 +NquPUXQMyRD1APyTE/bIAM0E4lcABU3BHRXQgpPV0Qb8bhFG5ssVevqBi61ZbWGMvsiP
	 NmlgwJ7SHFxCMtH+4WVxsif+kC2jgEyxPwl2vUlp2ASZdi9VJIbRO9ehzYN9kgMMRfaBc
	 +ChTMC4udyeOUIU+4FVkVtDjADBgcVkqHfKTSiu5fP7BRoN7jN4gQLoCZaAmfFMMTs4qE
	 zhrHDJUo0SW1HOMvNIMMpSKWnCX7WaXRqkh9fgMdgJkzOQQ6GkleYZtJgRtAlABQAkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794771532;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=W36Zk6V6pAaUlJITDCE9REdXESHzooXLlN9B7+Qdiw4=;
	b=xGC5pD5+zzcHtTtTX9c00Z3nwcLONk1pRcf6Vns1EJYOiBhAffgGPPeZVjrugJ8Cw0nR
	 Jcx6lk+e6MeThGktGEkkUcfRQGFTvz0fvPy6jsiiukkqj00u9ua1OfZbPVu8KgrCp7fdU
	 ojDhwzJYOUocZo462x+U2HA0ZUmZgYKToAN3Z00KrnpvpLi3bkudBqGTr54ewyg+0lebj
	 lojAmwjzWZgzdH1S+rZ/kdRkd+dBvK6ENE+hZCCSrrIRvlr2dzTCy2VMlkKj8ch1k8XqP
	 J23hNdY/zyxcEeVbo4/Si6ezPAobNzNaz9AJ2kS9aqDIMrC5Pu31gCAurMV0pQKHQhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=nKtVxroy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F1E606A339
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=nKtVxroy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E43C1F000C4;
	Sun, 15 Nov 2026 19:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794771531;
	bh=W36Zk6V6pAaUlJITDCE9REdXESHzooXLlN9B7+Qdiw4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=nKtVxroyvw83RNvEeLmQesgxPMXIfX/mzS63tWQ6G9DaHyV51t4WHnqpbLARg835O
	 0ttalNP2e3QS1NMnBR3cvW+SSOaSUyXV8hbMclRlMZMP3g0R5am5n/UGlbzUFOOZA+
	 +B0JDcOCXtGjJTp3iwO5QUe3nYSgXWAkyX2IgIsg=
Date: Sun, 15 Nov 2026 11:38:51 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: mt4022@columbia.edu
Cc: Mani Tofigh via B4 Relay <devnull+mt4022.columbia.edu@kernel.org>, Mike
 Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, tz2294@columbia.edu
Subject: Re: [PATCH] mm: annotate lockless accesses to vm_committed_as_batch
Message-Id: <20261115113851.f809d47b8356755c229278c2@linux-foundation.org>
In-Reply-To: <20261027-kcsan-mm-v1-1-66757485b917@columbia.edu>
References: <20261027-kcsan-mm-v1-1-66757485b917@columbia.edu>
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

On Tue, 27 Oct 2026 16:09:01 -0400 Mani Tofigh via B4 Relay <devnull+mt4022.columbia.edu@kernel.org> wrote:

> From: Mani Tofigh <mt4022@columbia.edu>
> 
> vm_committed_as_batch is read without a lock, and it's only a hint for
> how often the per-CPU counts get folded, so racing with an update is
> harmless.  Annotate the accesses.
> 
>   [    0.953509] BUG: KCSAN: data-race in __vm_enough_memory / mm_compute_batch
> 
>   [    0.953645] write to 0xffffffff825165d8 of 4 bytes by task 1 on cpu 0:
>   [    0.953692]  mm_compute_batch+0xc2/0x120
>   [    0.953781]  mm_compute_batch_init+0x1c/0x20
>   ...
> 
>   [    0.954325] read to 0xffffffff825165d8 of 4 bytes by task 41 on cpu 1:
>   [    0.954373]  __vm_enough_memory+0x24/0x2b0
>   [    0.954444]  shmem_inode_acct_blocks+0x1b3/0x230
>   ...
> 
>   [    0.955288] value changed: 0x00000020 -> 0x00005003
> 
> Found with KCSAN while fuzzing under a deterministic hypervisor that's
> currently under development.
>
> ...
>
> --- a/include/linux/mman.h
> +++ b/include/linux/mman.h
> @@ -75,7 +75,8 @@ unsigned long vm_memory_committed(void);
>  
>  static inline void vm_acct_memory(long pages)
>  {
> -	percpu_counter_add_batch(&vm_committed_as, pages, vm_committed_as_batch);
> +	percpu_counter_add_batch(&vm_committed_as, pages,
> +				 data_race(vm_committed_as_batch));
>  }

ok, that'll squish the KCSAN report.  A reasonable change as long as
we're sure this is not-a-bug.

> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -211,7 +211,7 @@ void mm_compute_batch(int overcommit_policy)
>  	else
>  		memsized_batch = min_t(u64, ram_pages/nr/4, INT_MAX);
>  
> -	vm_committed_as_batch = max_t(s32, memsized_batch, batch);
> +	WRITE_ONCE(vm_committed_as_batch, max_t(s32, memsized_batch, batch));
>  }

But why this change?
