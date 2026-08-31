Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D164A485B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188350; cv=none; b=eoaupGbI41EeISroznQLQcKOFuefnhCio+k3SOwVBW1HfgVLr7npcQ4o5MBmPTgPpB1luyD9uTQaXzfc9/0S3tD8GPpZcT+AG2I/k72OGE1bOpLRJQgw/wWfOeIbRX0FjSu/EYRVXqvJysZMtkGCXbWzSKE6wv8c7KVGRmow9Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188350; c=relaxed/simple;
	bh=5KhiJbcieDZfeu7OhpVzLzEkFsyZdr9FNUMf/xPQitk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVKvQPpwF1gZk62CoRf3BJDd5udJeqYwENqF9gvYvYd5Uz1ZXRcrnnsQgE9vur9JwIevfAa3dHXdFOb5Fbb0Qa8oxX3KwrhUqAql5XQf7vM8MD9IQkqcez57VRsUbpRs4GK5rtA47ovxm4TIbOnZDRmh+o8F1QC/HaYqlZu9IU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kba1Um1I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6QBCg2q7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Cp7WNb0k; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WVbWiOO7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kba1Um1I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6QBCg2q7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Cp7WNb0k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WVbWiOO7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C14351FD91;
	Mon, 31 Aug 2026 14:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788188342; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UvT21SLbv8rzIVCfuPJMnTzw0oJMybcWGfiy1xZkB+E=;
	b=kba1Um1IJqQOmOWWC02FQ7wljvpMVdLO8KeaMH4vf5Cn8EDZP55CGvLwBgMa6St8AbfvWC
	9W14+XoGWltDkZCveefQqbd8mJ/F6Ob+P7Ddl3COw7ZV6o/7djMKtoRY0D/uO6D32vrkC+
	E3wIdI0kyo/wLIudqePMc+YeV1U5XWM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788188342;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UvT21SLbv8rzIVCfuPJMnTzw0oJMybcWGfiy1xZkB+E=;
	b=6QBCg2q7ckf4CU7BXXxPylVr2LQ4f4CB7KMFT9wFe7KDfXmTDVSpRiNb6eCboh21D5QiOP
	lAycuAu3y+JA48Cg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788188338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UvT21SLbv8rzIVCfuPJMnTzw0oJMybcWGfiy1xZkB+E=;
	b=Cp7WNb0kLL3rrGZj09jUIdXtLyNI9QB7TeK3l6lNVpsg6Ufa7iIcFcduq3ccurCZPsgoPa
	KtbvdebtIOxh5u+ENZoVUyOqDatZFRxakCEr1i/OjGZHz//M/FvarJrRrWM5CLiJH6d7gA
	/O/ixOt7bWq6fE6mxH4eZrwEmg9Fgz4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788188338;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UvT21SLbv8rzIVCfuPJMnTzw0oJMybcWGfiy1xZkB+E=;
	b=WVbWiOO7rQEg1ngq9yJq0d1joO+t5F6Hv6hy1OIHxdDlaGLaGJkwHQ3NNtZlRKeaXa47VS
	qymBittGYZibkHDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 282B813685;
	Mon, 31 Aug 2026 14:58:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id edFzBrKWlWpdHAAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 31 Aug 2026 14:58:58 +0000
Date: Mon, 31 Aug 2026 15:58:56 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Andi Kleen <ak@kernel.org>
Cc: akpm@linux-foundation.org, liam@infradead.org, ljs@kernel.org, 
	jannh@google.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RCU safety for vma maple tree walks
Message-ID: <apWUsc-a6k1YkuMv@pedro-suse>
References: <20260831143511.1133029-1-ak@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831143511.1133029-1-ak@kernel.org>
X-Spam-Level: 
X-Spam-Score: -3.80
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,imap1.dmz-prg2.suse.org:helo]

On Mon, Aug 31, 2026 at 07:35:11AM -0700, Andi Kleen wrote:
> I ran into the following scenario in a slightly modified kernel:
> 
>  1. vms_gather_munmap_vmas walks the unmap range and caches a maple node N
>     in the maple iterator.
>  2. It triggers a __split_vma to fix up a range and during that node N
>     is queued for freeing with kfree_rcu
>  3. There is another __split_vma that allocates memory and sleeps due to
>     memory pressure.
>  4. During the sleep the grace period expires and node N gets freed for
>     real.
>  5. The iterator still has node N cached
>  6. When the iteration continues it accesses the freed node and KASAN
>     trips:
> 
> BUG: KASAN: slab-use-after-free in mas_next_slot+0x1e95/0x2860
> Read of size 8 at addr ffff8881160bdc00 by task pool-e/5770
> CPU: 1 UID: 0 PID: 5770 Comm: pool-e Not tainted 7.2.0-rc7-1-debug+ #106
> Allocated by task 5770:
>   mas_alloc_nodes <- mas_preallocate <- __split_vma <- vms_gather_munmap_vmas
>     <- do_vmi_align_munmap <- do_vmi_munmap <- __vm_munmap <- elf_load
>     <- load_elf_binary <- bprm_execve          (pool-e's exec)
> Freed by task 25 (ksoftirqd):
>   __rcu_free_sheaf_prepare <- rcu_free_sheaf_nobarn <- rcu_do_batch <- rcu_core
> The buggy address ... cache maple_node of size 256
> freed 256-byte region [ffff8881160bdc00, ffff8881160bdd00)
> 
> There was also a more complex scenario when the node was immediately
> recycled for the next split VMA insert, modified, but the access by
> the iterator for the previous walk saw corrupted state and triggered
> KASAN too.
> 
> Basically the problem is that any sleeping during VMA walks breaks the
> RCU reader guarantees for the RCU Maple tree iterators. But sleeping
> is unavoidable for various reasons.
> 
> I hit it with a kernel modification that makes this more likely
> (It can do VMA splits on exec mm teardown)
> and also in a very memory constrained environment (4GB guest running a
> stress test), but based on code review I believe it's a generic problem that
> could happen in a unmodified kernel.
> 
> That said I wasn't actually able to trigger it in a unmodified kernel
> so far with stress testing.
> 
> The following old unsolved syzkaller report has a similar signature,
> so maybe it was already seen:
> https://syzkaller.appspot.com/bug?id=4c5268fbb1d6d508a4c34dc425e2693d1ff9911a
> 
> I guess in many cases where it happens for real you don't notice it
> if you don't have KASAN active.
> 
> The patch fixes up all callers to maintain the RCU reader lock
> regions correctly during the VMA walk. If they cannot be maintained the
> iterator is refreshed by a new VMA address lookup in a new region, unless
> it is proven safe not to.
> 

But none of this code uses RCU? I'm confused. The maple tree state should not
be keeping bad state. That is a bug.

All of these functions take the mmap write lock. That should exclude
against other concurrent changes. Using RCU here makes no logical sense.

Does the kernel say anything interesting when CONFIG_DEBUG_VM_MAPLE_TREE=y?
 

-- 
Pedro
