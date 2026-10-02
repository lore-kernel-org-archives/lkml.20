Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAB32D9797
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951062; cv=none; b=iEFeVFn1qLC8xO4NcdgmHqp8G1CJluFzikOvqSt19kvjqzbTzQv6D5cFQJX6dubQCFrdXk8gLL2FmzdiFne8VEDJ0ZLrrQsvVxE4X+lpJ71+bkpat0fxzACG39YiT++avF488wej5Av0HFtijE2JvBlsNVfAG5hEH+itaNMfQFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951062; c=relaxed/simple;
	bh=0bk7kqOQ3ufcT+Mc6z2yj6bXAr9WWnYHEVALJJx1CS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P40sQILWo2hm6TxQ3HO1+P1JeZ2PDUOAWzKtHSXvK5R+iDybtqaYf/JJEwDkjiUSS98SCourhVDskjO3qI2dWciW0zDd5DBnaPm0fVFych8AFsKCB06RAVSUPtqAyrMY+mQtoB3mR1IermNT4wDXq2Eh0YkbmWG/5rOE4FI5KHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0+VEU8jS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=t9txnZW9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZncI0ZHD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+fQGFDT3; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0+VEU8jS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t9txnZW9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZncI0ZHD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+fQGFDT3"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A391721E30;
	Fri,  2 Oct 2026 14:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790951054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q9nWLyt2r9hby9CPMFpc04BYUPpRYn+tUbcNwqB8KBw=;
	b=0+VEU8jSmyjNeYNEiuQzuUWs+Xor+pWJ7/9lIa11Y/3iA3Yeb68ijV3BrbJqJwBIVHXL/e
	5fATdWHS3VLJh6Z82EVwuaqerNpXQtCHq9Zt6lytxulPY2F/PMzZZBfnNlnr5i5ox3vWWD
	usy1Egflh4+3QKzSu1z8e6sqRBM0a6A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790951054;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q9nWLyt2r9hby9CPMFpc04BYUPpRYn+tUbcNwqB8KBw=;
	b=t9txnZW97H1P+0WE3mw++Fn5Md9J3eG8aDo9pMF1UbgGD6vU9fDmPe1Wuf4tQugYXI9h3A
	wFwmVJo4I3vsi0CQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790951050; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q9nWLyt2r9hby9CPMFpc04BYUPpRYn+tUbcNwqB8KBw=;
	b=ZncI0ZHDiUMhRI+MvCpHAZutzKEYk4L4tWV1IrBnq2tzvGYTtxgYQ9JnKWq8no8WwSavCZ
	+HWc5kIsj6MTY0/SxuYIP/cl9crT9hqf9fbL3HbAmS7US/F2LPx7T8f7XLK0YUrgDhcwKx
	v1eza+sO1TN8IL3QmZ5AVDyHv6JRhWM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790951050;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q9nWLyt2r9hby9CPMFpc04BYUPpRYn+tUbcNwqB8KBw=;
	b=+fQGFDT3l6yI58R8SW1Uh0jqxyqqrk/+0fThT58vWcwrmquhurU8wX/hRBTmYrHvPukCjK
	FWGt/RJ6JVNu4zCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 80A52139A3;
	Fri,  2 Oct 2026 14:24:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GKeuE4m+v2oeOwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Fri, 02 Oct 2026 14:24:09 +0000
Date: Fri, 2 Oct 2026 15:24:07 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>, 
	Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>, Lance Yang <lance.yang@linux.dev>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, Pan Deng <pan.deng@intel.com>
Subject: Re: [PATCH v2] mm/vma: don't remove VMA from rmap if pgoff unchanged
Message-ID: <ar-9z-Ls26elb5JI@pedro-suse.tail5790ac.ts.net>
References: <20260930-speed-up-inplace-rmap-v2-1-ac1aa19708aa@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-speed-up-inplace-rmap-v2-1-ac1aa19708aa@kernel.org>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,intel.com:email,imap1.dmz-prg2.suse.org:helo,surriel.com:email]
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Flag: NO

On Wed, Sep 30, 2026 at 06:53:36PM +0100, Lorenzo Stoakes (ARM) wrote:
> When updating a VMA, vma_prepare() unconditionally removes it from its rmap
> interval trees under the rmap lock, and vma_complete() reinserts it before
> releasing the lock.
> 
> This is wholly unnecessary if its page offset (file rmap) or anonymous page
> offset (anon rmap) is unchanged.
> 
> So, track whether they will change in the newly introduced
> vp->file_pgoff_unchanged and vp->anon_pgoff_unchanged fields, and use them
> to determine whether to remove the VMA or not.
> 
> The rmap lock keeps things safe as no rmap walks can concurrently occur
> during the operation.
> 
> Additionally, some architectures (arm, parisc, nios2, csky) have dcache
> flush rmap walkers which take only flush_dcache_mmap_lock(), which is
> likewise held across the operation.
> 
> If the VMA remains in the tree, it's necessary to keep the augmented
> rb_subtree_last field updated to reflect its changed range.
> 
> Provide mapping_rmap_tree_[pre, post]_update() and
> anon_rmap_tree_[pre, post]_update_vma() (replacing the existing logic in
> the anonymous case) to handle both the changed and unchanged cases.
> 
> For the anon rmap case, with CONFIG_DEBUG_VM_RB set, avc->cached_vma_last
> is also updated when propagating in place.
> 
> When performing a VMA shrink or a split where the VMA is the lower one, the
> page offset cannot change, so set the flags unconditionally in these cases.
> 
> When merging VMAs the page offset is unchanged only in some cases, so
> update init_multi_vma_prep() to set the flags only if the page offsets
> remain the same.
> 
> Finally, while we're here, also update expand_upwards() similarly.
> 
> These changes ultimately result in less rmap lock contention.
> 
> Pan Deng reported results using the UnixBench/excel benchmark on a 2-socket
> 192 core, 384 thread x86-64 system for v7.3-rc4 with/without the patch
> applied:
> 
> Execl Throughput, index score:
> 
>                     avg    %stdev      min        max
>   v7.3-rc4        3511.5     0.44%    3494.5    3543.4
>   + patch         4069.0     0.48%    4047.4    4109.5 (+15.9%)
> 
> Average wait on file rmap lock in ms, 5 runs per kernel:
> 
>                avg      %stdev     min       max
>   v7.3-rc4    9.470     2.91%     9.070     9.820
>   + patch     8.420     3.34%     8.100     8.770 (-11.1%)
> 
> Profiling data obtained during the operation highlighted the file rmap lock
> as the primary source of contention.
> 
> Suggested-by: Pan Deng <pan.deng@intel.com>
> Reviewed-by: Rik van Riel <riel@surriel.com>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Looks great, thanks!

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

<snip>

> index 077e23694143..ad6be42cc65a 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -201,8 +201,15 @@ static void init_multi_vma_prep(struct vma_prepare *vp,
>  	if (vp->file)
>  		vp->mapping = vma->vm_file->f_mapping;
>  
> -	if (vmg && vmg->skip_vma_uprobe)
> +	if (!vmg)
> +		return;
> +
> +	if (vmg->skip_vma_uprobe)
>  		vp->skip_vma_uprobe = true;
> +	if (vma_start_pgoff(vma) == vmg_start_pgoff(vmg))
> +		vp->file_pgoff_unchanged = true;
> +	if (vma_start_anon_pgoff(vma) == vmg_start_anon_pgoff(vmg))
> +		vp->anon_pgoff_unchanged = true;

FWIW I kinda would've liked to abstract this out to rmap code, but a quick look
shows that it is likely to become a header dependency hell if put in rmap.h. Could
perhaps have been separated out to a function call.

Anyway, your call :) This version already hides most of the ugly to
interval tree code.
 

-- 
Pedro
