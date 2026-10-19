Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBFD4B8270;
	Mon, 19 Oct 2026 09:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403613; cv=none; b=AiD6Vd7F35rGq6DpzUITgT5069gwo4VCNgIirTBB8F6iRyV7T5aesjzZZ1Fpt7COxNxFp+Xrpuyjf2s7+1sfSx68S0bAOvbZlXtDWiqYRvc8iL2Wv7cipBTC8ORwIykqYTL0k1i2mGFqTZLYSG9j8ULI/2NIjpXVE0tyhmpRFbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403613; c=relaxed/simple;
	bh=LL45I+R6h545NOISuRIggUtq27/B1IK8pCC6oyxCegU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MyCdj3cfrtKpJOBPt00rUGgvXW5O+5f44HrDlogP+PptR5aAhf/0RsIOxOr52t4b2tMnm3u1bXKsnPWVKMICx8HbR1e2a1iE6yXDDliyJz9TdrNbWC06iuLnQ1y8a2cTPFHwCyLM2i3FHsNcoPV4jWM4T6Z/U9Drjm5DtpMWYDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TNiH6jAG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IMKWDODb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TNiH6jAG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IMKWDODb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TNiH6jAG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IMKWDODb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TNiH6jAG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IMKWDODb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3BB3121AC0;
	Mon, 19 Oct 2026 09:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792403610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DKiqBw8kgNDEliDnoLY6tY5aR14ZoTfXZiHIpRU4Bno=;
	b=TNiH6jAGWzJ+CcphCjW4j7aj5U0zeU2N7JUCu5ljMtqB9zQxmzOq8YRau0SpCDN/Tnb02Q
	ahicBwHrHCw5SO2pH6kRe68ZDqSaS7aHEX9UPBg8P5zUXJ7Puj/y+xTRwvkrsHE4jTNiAB
	kRcd3Vn7S05FSmK01RYD+x5vtTkQBUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792403610;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DKiqBw8kgNDEliDnoLY6tY5aR14ZoTfXZiHIpRU4Bno=;
	b=IMKWDODbku31f9X+imJzQOexZonmmj16TZ2NhoXcsP1S/iPoyWMdMHJAmLh+ZIE4EYWEan
	6BsoR6hGM5kS4FCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792403610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DKiqBw8kgNDEliDnoLY6tY5aR14ZoTfXZiHIpRU4Bno=;
	b=TNiH6jAGWzJ+CcphCjW4j7aj5U0zeU2N7JUCu5ljMtqB9zQxmzOq8YRau0SpCDN/Tnb02Q
	ahicBwHrHCw5SO2pH6kRe68ZDqSaS7aHEX9UPBg8P5zUXJ7Puj/y+xTRwvkrsHE4jTNiAB
	kRcd3Vn7S05FSmK01RYD+x5vtTkQBUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792403610;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DKiqBw8kgNDEliDnoLY6tY5aR14ZoTfXZiHIpRU4Bno=;
	b=IMKWDODbku31f9X+imJzQOexZonmmj16TZ2NhoXcsP1S/iPoyWMdMHJAmLh+ZIE4EYWEan
	6BsoR6hGM5kS4FCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0BBCD134B3;
	Mon, 19 Oct 2026 09:53:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Hk4/NZjo1Wo2OwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 19 Oct 2026 09:53:28 +0000
Date: Mon, 19 Oct 2026 10:53:27 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, 
	Jann Horn <jannh@google.com>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, 
	Daehyeon Ko <4ncienth@gmail.com>
Subject: Re: [PATCH v2] mm/vma: avoid spurious write locks when
 mm->mm_lock_seq overflows
Message-ID: <atXjbsDn7DJybsHU@pedro-suse.tail5790ac.ts.net>
References: <20261016-fix-vma-lock-overflow-v2-1-9eb778b79b58@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-fix-vma-lock-overflow-v2-1-9eb778b79b58@kernel.org>
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[linux-foundation.org,google.com,infradead.org,kernel.org,linux.dev,suse.com,lwn.net,kvack.org,vger.kernel.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Fri, Oct 16, 2026 at 12:34:33PM +0100, Lorenzo Stoakes (ARM) wrote:
> So far the assumption has been that mm->mm_lock_seq overflow is benign,
> resulting only in readers spuriously falling back to the mmap lock, however
> it turns out that this was an unsafe assumption.
> 
> If a VMA can be spuriously considered write locked that means read lock
> exclusion does not take place, and thus a VMA can end up write-locked with
> concurrent readers.
> 
> Since overflow only occurs every 2^31 write lock/unlock cycles, resolve the
> issue by resetting every VMA's vma->vm_lock_seq each time such an overflow
> occurs.
> 
> This is done in vma_end_write_all(), which is called when the mmap write
> lock is released, i.e. in mmap_write_unlock() and mmap_write_downgrade().
> 
> Care must be taken, as resetting the sequence count at overflow means
> changing the seqcount of VMAs which are already attached and observable.
> 
> The mm's seqcount is guaranteed to be odd when a write lock is held, and
> thus any write locked VMA will have an odd seqcount assigned.
> 
> Therefore resetting to an even value prevents spurious write locks, since
> these can only occur with the mmap write lock held, at which point the mmap
> seqcount will be odd.
> 
> However, vma_start_read() also checks vma->vm_lock_seq == mm->mm_lock_seq,
> bailing if so (indicating a write lock).
> 
> This would cause any even reset value chosen to prevent VMA read locks from
> being taken - avoid this by also checking whether the VMA seqcount is odd
> before bailing on the read lock.
> 
> So far, vma->vm_lock_seq has defaulted to UINT_MAX, but this has been
> unnecessary since commit e5e7fb278e59 ("mm: convert mm_lock_seq to a proper
> seqcount"), since this is assigned when the VMA is still detached, and
> cannot be observed.
> 
> Therefore perform both reset and initialisation of vma->vm_lock_seq by
> simply setting vma->vm_lock_seq to zero.
> 
> The reset, performed in __mm_reset_vma_seqcounts(), only needs to
> WRITE_ONCE() the value.
> 
> However the read of vma->vm_lock_seq in vma_start_read() needs to have
> acquire semantics to pair with the smp_wmb() in do_raw_write_seqcount_end()
> so a reader reading a reset value also observes VMA modifications made
> under the write lock.
> 
> Since all VMA write locks were just released and the mmap write lock is
> still held, there are no concurrent VMA writers.
> 
> Concurrent VMA readers are unaffected. New VMA readers observe either zero,
> never a write lock, or the prior seqcount, behaving as before the reset.
> 
> Since this only occurs every 2^31 write lock/unlock cycles, the time taken
> to update all VMAs is considered to be acceptable.
> 
> Also update comments, documentation and VMA userland tests to reflect the
> change.
> 
> User facing effects are - dangerous races that could cause memory
> corruption or NULL pointer derefences (especially on page table traversal)
> are avoided.
> 
> Reported-by: Daehyeon Ko <4ncienth@gmail.com>
> Closes: https://lore.kernel.org/all/20261015143735.1630957-1-4ncienth@gmail.com/
> Fixes: 5e31275cc997 ("mm: add per-VMA lock and helper functions to control it")
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
> Andrew - no stable tag please.
> 
> I will do the stable backports manually, they can be solved with a different
> approach.
> 
> Also, since, we're so close to the merge window I'm applying this against
> mm-unstable.
> 
> So I think it's fine to just send it (early :) in the merge window.
> ---
> v2:
> * Updated comment in vma_seqcount_is_write_locked() to mention the VMA
>   being attached.
> * Renamed reset_vma_seqcounts() to __mm_reset_vma_seqcounts().
> * Used acquire semantics in vma_start_reads() to avoid race with reset -
>   there is another acquire immediately after this one so it should just be
>   noise perf-wise.
> * Removed stable tag, will do the backports manually (just make the value
>   64 bits...)

I guess you're fitting this where __vm_anon_pgoff_lo now sits? If so, then
this patch probably wants backporting to 7.3.

> * Updated comments to reflect changes.
> * Added user-facing effects as per Vlasta ;)
> 
> v1:
> https://lore.kernel.org/r/20261015-fix-vma-lock-overflow-v1-1-01beb245d9da@kernel.org
> ---
>  
> +/*
> + * Called with mmap write lock held after mm->mm_lock_seq just overflowed (and
> + * therefore zero), with all VMA write locks now released.
> + *
> + * The stores below follow the smp_wmb() in do_raw_write_seqcount_end(), so
> + * a reader that observes a reset value also observes this cycle's VMA
> + * modifications (ordered by the ACQUIRE on vma->vm_lock_seq in
> + * vma_start_read()).
> + */
> +void __mm_reset_vma_seqcounts(struct mm_struct *mm)
> +{
> +	struct vm_area_struct *vma;
> +	VMA_ITERATOR(vmi, mm, 0);
> +
> +	mmap_assert_write_locked(mm);
> +	VM_WARN_ON_ONCE(mm->mm_lock_seq.sequence);
> +
> +	/*
> +	 * Failing to reset means stale vma->vm_lock_seq values could result in
> +	 * those VMAs becoming spuriously write locked when mm->mm_lock_seq
> +	 * happens to match their values.
> +	 *
> +	 * This is problematic, as it causes the VMA write lock to not exclude
> +	 * readers, which can result in concurrent readers while a VMA write
> +	 * lock is held.
> +	 *
> +	 * Avoid this by resetting to an even value (indicates no write lock
> +	 * held).
> +	 *
> +	 * Readers will either observe zero (not write locked) or the previous
> +	 * value, so this is safe.
> +	 */
> +	for_each_vma(vmi, vma)
> +		WRITE_ONCE(vma->vm_lock_seq, 0);

I'm concerned by the possible latency when doing this to many VMAs. Do you
have any numbers?

-- 
Pedro
