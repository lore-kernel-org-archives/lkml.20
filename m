Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE424734DE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395903; cv=none; b=t2kZ4a12fIQGJvE2HsM9NGo+MClZq4PkZq/6W/zR6G52u4sw8qmrxZtj4Dw0BfIY/RBQCiSCYfHabn+USbZHnzA4msIonKSRrYk2hK5FXOp77kPcQy8dqBuyusBP4dx9Xoyf2uwKkvmc75Tat2Y0ztV6UKIGWaNqovIdTismwxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395903; c=relaxed/simple;
	bh=8WSUYxGCMQh31PT183rpSxye6+UnBcoRnSN3O4P+674=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CmeDANZOMJJyzeqllnrsrUPnBpB2ThNo0oRMMm39xVvqT7U14Otq/J2/twc68r96zcvsCrFPHeLS3gOMmnt1TtA25kLRvr9GMsUDjcjNri7ilPdhCxc7ZwUQiBOBplRotAudaJqu3LzjCgy/FWgYy+Mr9KOhEWPlDiUeen0Do/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=B7TumlXZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=x9CZQ0Pj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vaaBcSqQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Uwq1rmkf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B7TumlXZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="x9CZQ0Pj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vaaBcSqQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Uwq1rmkf"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 961E11F7CC;
	Mon, 14 Sep 2026 14:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789395895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8uOj8JF+OXNiF3/lX/wOUKSXh6iShm8a7pD7w4hGuZU=;
	b=B7TumlXZuUgGz8VjLurNKO7izc1TfFv8NJEctpHJOPJRHufMNEv+HX8LtLk2B5BmqwbNlZ
	pyzkJgH9qhorq/wGPsDhexgsy55RMMXLnXXN0xjbIoCv7+QBM+6owxs+cbM/iMp83jYHV0
	XTwMzblBD335lpftNi9itDFC+KyykCc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789395895;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8uOj8JF+OXNiF3/lX/wOUKSXh6iShm8a7pD7w4hGuZU=;
	b=x9CZQ0PjijFGqKV1O9k+iefqFpgaoZ2l7WtaiYGwo7DysyBEL3RmV//+q4sr2Qr8nO2BWO
	S/3Do4AyKibBDoAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789395891; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8uOj8JF+OXNiF3/lX/wOUKSXh6iShm8a7pD7w4hGuZU=;
	b=vaaBcSqQj8snDhc8qRaxmqEJZKhXIBMTOp+PgxtOIVcSkarXJTFuTa4y3nu0Sf1b5Uxau2
	lVxae7lr2QKHS5nusb5UGz7BhMmTdV58KvmNE1Y49OqiIGzjAzkXVWlc3rBxKz3cjWNivw
	JMtn+BrUxNlPSFPRrGH22rd2EI14nso=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789395891;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8uOj8JF+OXNiF3/lX/wOUKSXh6iShm8a7pD7w4hGuZU=;
	b=Uwq1rmkfn+6a1S2IjEA6QTh2AIoOJNYhyciTeu5akf3wNltNhSX6cY0DjRksGKyTK/It9M
	dpjQbr9nRMHC71BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6081513515;
	Mon, 14 Sep 2026 14:24:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bylAFLEDqGodHwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 14 Sep 2026 14:24:49 +0000
Date: Mon, 14 Sep 2026 15:24:47 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Jann Horn <jannh@google.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Youngjun Park <youngjun.park@lge.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Subject: Re: [PATCH v2] mm: implement and use vma_anon_tracked(), silence
 KCSAN
Message-ID: <aqgC9iVHtB1fMWS2@pedro-suse.tail5790ac.ts.net>
References: <20260910-vma-is-faulted-v2-1-e81ebc7d146b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-vma-is-faulted-v2-1-e81ebc7d146b@kernel.org>
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[33];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,google.com,infradead.org,kernel.org,linux.dev,nvidia.com,linux.alibaba.com,arm.com,suse.com,zte.com.cn,surriel.com,tencent.com,huaweicloud.com,gmail.com,lge.com,redhat.com,kvack.org,vger.kernel.org];
	R_RATELIMIT(0.00)[to_ip_from(RL8d8xedm6iu8o66torxsk6bwd)];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Flag: NO

On Thu, Sep 10, 2026 at 02:18:35PM +0100, Lorenzo Stoakes (ARM) wrote:
> Provide a function to abstract the common task of checking whether
> a VMA is faulted in or not.
> 
> A VMA or mmap lock must be held when calling this function. For an attached
> VMA the transitions between unfaulted/faulted state are:
> 
>        Transition        |              VMA/mmap Lock state
>  ------------------------|-----------------------------------------------
>    unfaulted to faulted  | write lock OR read lock + mm->page_table_lock
>    faulted to unfaulted  | write lock
> 
> So vma_anon_tracked() never provides a false positive (the lock precludes
> it), but if only a read lock is held, a negative result must be re-checked
> with mm->page_table_lock held.
> 
> Detached VMAs cannot be concurrently manipulated as they are removed from
> the maple tree so require no guarantees.
> 
> Use data_race() to silence KCSAN about non-existent data races between
> concurrent vma->anon_vma read/write on optimistic fault tests.
> 
> Also while here, const-ify vma_is_attached(), vma_assert_stabilised() and
> dependants.
> 
> Finally, update the core VMA merge/split, rmap, mremap, KSM and fault
> preparation callers which test vma->anon_vma directly to use
> vma_anon_tracked() instead.
> 
> Note that the lockless read in reusable_anon_vma() is doing more than
> checking whether the VMA is faulted - it is returning the anon_vma to be
> used on fault, so this check is not altered.
> 
> There is one odd one out - file_backed_vma_is_retractable() - which holds
> neither a VMA nor mmap lock and is stabilised by the file rmap lock only.
> 
> Therefore just add a comment to explain why the direct vma->anon_vma check
> is required.
> 
> Reported-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
> Closes: https://lore.kernel.org/all/20260829100034.423064-1-trintaeoitogc@gmail.com/
> Closes: https://lore.kernel.org/all/20260909115723.528501-1-trintaeoitogc@gmail.com/
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
> v2:
> - Renamed vma_is_faulted() to vma_anon_tracked() as per David.
> 
> v1:
> https://lore.kernel.org/r/20260909-vma-is-faulted-v1-1-3a701f48984a@kernel.org
> ---
>  include/linux/mmap_lock.h         | 12 ++++++------
>  mm/huge_memory.c                  |  4 ++--
>  mm/internal.h                     |  2 +-
>  mm/khugepaged.c                   |  3 +++
>  mm/ksm.c                          | 10 +++++-----
>  mm/madvise.c                      |  4 ++--
>  mm/memory.c                       |  2 +-
>  mm/mprotect.c                     |  2 +-
>  mm/mremap.c                       |  4 ++--
>  mm/rmap.c                         | 22 +++++++++++-----------
>  mm/swapfile.c                     |  2 +-
>  mm/userfaultfd.c                  |  2 +-
>  mm/vma.c                          | 29 +++++++++++++++--------------
>  mm/vma.h                          | 22 +++++++++++++++++++++-
>  tools/testing/vma/include/dup.h   |  2 +-
>  tools/testing/vma/include/stubs.h |  4 ++++
>  16 files changed, 77 insertions(+), 49 deletions(-)
> 
> diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
> index 00eae65b74bd..03e1eb136111 100644
> --- a/include/linux/mmap_lock.h
> +++ b/include/linux/mmap_lock.h
> @@ -273,7 +273,7 @@ static inline void vma_end_read(struct vm_area_struct *vma)
>  	vma_refcount_put(vma);
>  }
>  
> -static inline unsigned int __vma_raw_mm_seqnum(struct vm_area_struct *vma)
> +static inline unsigned int __vma_raw_mm_seqnum(const struct vm_area_struct *vma)
>  {
>  	const struct mm_struct *mm = vma->vm_mm;
>  
> @@ -288,7 +288,7 @@ static inline unsigned int __vma_raw_mm_seqnum(struct vm_area_struct *vma)
>   *
>   * Returns true if write-locked, otherwise false.
>   */
> -static inline bool __is_vma_write_locked(struct vm_area_struct *vma)
> +static inline bool __is_vma_write_locked(const struct vm_area_struct *vma)
>  {
>  	/*
>  	 * current task is holding mmap_write_lock, both vma->vm_lock_seq and
> @@ -344,7 +344,7 @@ int vma_start_write_killable(struct vm_area_struct *vma)
>   * vma_assert_write_locked() - assert that @vma holds a VMA write lock.
>   * @vma: The VMA to assert.
>   */
> -static inline void vma_assert_write_locked(struct vm_area_struct *vma)
> +static inline void vma_assert_write_locked(const struct vm_area_struct *vma)
>  {
>  	if (!IS_ENABLED(CONFIG_MMU)) {
>  		mmap_assert_write_locked(vma->vm_mm);
> @@ -359,7 +359,7 @@ static inline void vma_assert_write_locked(struct vm_area_struct *vma)
>   * lock and is not detached.
>   * @vma: The VMA to assert.
>   */
> -static inline void vma_assert_locked(struct vm_area_struct *vma)
> +static inline void vma_assert_locked(const struct vm_area_struct *vma)
>  {
>  	unsigned int refcnt;
>  
> @@ -410,7 +410,7 @@ static inline void vma_assert_locked(struct vm_area_struct *vma)
>   * With lockdep disabled we may sometimes race with other threads acquiring the
>   * mmap read lock simultaneous with our VMA read lock.
>   */
> -static inline void vma_assert_stabilised(struct vm_area_struct *vma)
> +static inline void vma_assert_stabilised(const struct vm_area_struct *vma)
>  {
>  	/*
>  	 * If another thread owns an mmap lock, it may go away at any time, and
> @@ -445,7 +445,7 @@ static inline void vma_assert_stabilised(struct vm_area_struct *vma)
>  	vma_assert_locked(vma);
>  }
>  
> -static inline bool vma_is_attached(struct vm_area_struct *vma)
> +static inline bool vma_is_attached(const struct vm_area_struct *vma)
>  {
>  	return refcount_read(&vma->vm_refcnt);
>  }

nit: I would suggest you do all of this constification in a separate patch,
otherwise it can become tricky for backports. Things can naturally start depending
on const correctness, and you either need to manually adjust those future patches,
or try to backport this one.

The rest looks vaguely good to me. I admit I'm not a gigantic fan of the name,
but I suspect it fits better with your future anon rmap ideas :)

Reviewed-by: Pedro Falcato <pfalcato@suse.de>


-- 
Pedro
