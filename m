Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663104;
	b=O671Iuh1/0U1R+T9fx1MFmBcpoDi3I/Nr2blaFxOFM7Amuxm8DjlpsMAx5aF9ursamuI
	 oHfUHBNgbiWsWyKd404F9bxQD6DpWjyn7JQpBDJ0haKrDsvc2eCBaVoyy+S4T3c/Kvurm
	 uj17xh9IDLDip80O1bxO7+y4F1ECTijzVsXunC5DQWw3PCAZtkz/X8XyMmZwE3SCt42aR
	 i6XywEByLXy4C4L3ugwA5lZTJKci7Ibv/Ft85C9/fwWYYZ7G5tWNELVtJEBSaQBn+Kn+N
	 lKnZUzbeSWMgS8v+7IoNlfwECVpFSPHgVuCeEAakXtid9vFRxExhuYW0o/sF6yM90yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663104;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=mkeR2xN5aVTEbqa1hAMyTZXFJ5arxpgOVE21xANikHk=;
	b=343vLD+XdAPjgWSi940gBFqqeNfAQsdBAJVv2CTYQpmPs9Ph12AGbIdPrm3L/SmfKm0p
	 WzmFRDR7HXB1wsKcfEke9OczpQbrGqP1Dlh/om5+9lB8Aa3yNqn+VG58+HhYLSu/EHEJK
	 Qo7p6+J6KmfnF2MsgUBDexduES4tqaxGNKk/nDG9UhYaPixkQBEUMROt4ko0Q1Z1QrAav
	 wWysIdE5eOfJGd0zj2CLzxkw6beCM9mN7IWGI9EDm8V9iwNAA2c35wUtI5AejVmTmJoMD
	 uV+LwydhPmPQKcRqVtzoFIqOEiPa1Pk3gP4FibuIlgW8+DGUIPO6EN1mGkuYezdx6WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wbSI6Tl0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=v9AH22Wk;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="HiClQ7/t";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mzH+91u8;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE8B606A339
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FE8B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wbSI6Tl0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=v9AH22Wk;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=HiClQ7/t;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mzH+91u8
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E2B8322147;
	Thu, 22 Oct 2026 09:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792663101; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mkeR2xN5aVTEbqa1hAMyTZXFJ5arxpgOVE21xANikHk=;
	b=wbSI6Tl0AyurldiYwrJmxhw/KQ+BB2YZ4Zt/QfcpU6aSnCtwVs+J3qwt7plCl0zeNbuIe0
	D+IwOcthmkVubsDm/Q0Xfb62h+4NMlApFqXZ0wQfpe8wauFxFPPnUu5YiNZfkAkpJ0Gnyn
	hTdodRnOsJHo1NxCK6+yY70p53ZfLuM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792663101;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mkeR2xN5aVTEbqa1hAMyTZXFJ5arxpgOVE21xANikHk=;
	b=v9AH22WkVZqe2ykX+rkXnkr9JnXZjmG6XYJbfYzdnzwnGIbrOnS0z4l+bV6HlHdiC8tDSG
	RcgitqdNhI6fHUBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792663100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mkeR2xN5aVTEbqa1hAMyTZXFJ5arxpgOVE21xANikHk=;
	b=HiClQ7/tkj+ZJ+Qsx10KHvkjAoPh3hM8x6gk6/+k4qj8YCckcLj55oUrg9GHs02aN/ooLS
	UhPKfd1fPwEr2JhLsVEwKjIYNdGs3rhjsoF1OjEPmeQhNauiCbYfSedYWtWkFY7UjLbmFF
	w1Pcy4hVhup88Uou/nOQ3YDnBk5fckI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792663100;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mkeR2xN5aVTEbqa1hAMyTZXFJ5arxpgOVE21xANikHk=;
	b=mzH+91u8khRcUsfzzJYOkCc0iol88VLfRkvBzx9cqOQs3jnvc5F+hWAobqOphk3oEQhhcS
	TfqaGDqz4o7tfOBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F011134E6;
	Thu, 22 Oct 2026 09:58:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id raenGjve2WrlCQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Thu, 22 Oct 2026 09:58:19 +0000
Date: Thu, 22 Oct 2026 10:58:17 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Shivank Garg <shivankg@amd.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Ankur Arora <ankur.a.arora@oracle.com>, 
	Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>, Bharata B Rao <bharata@amd.com>, 
	Hrushikesh Salunke <hsalunke@amd.com>, K Prateek Nayak <kprateek.nayak@amd.com>, x86@kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] mm/memory: drop PROCESS_PAGES_NON_PREEMPT_BATCH
Message-ID: <atndhWpGDvs4vHoN@pedro-suse.tail5790ac.ts.net>
References: <20261022-clear-pages-batch-v1-1-13d3bd0b876e@amd.com>
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
In-Reply-To: <20261022-clear-pages-batch-v1-1-13d3bd0b876e@amd.com>
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-13.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -13.30

On Thu, Oct 22, 2026 at 08:14:30AM +0000, Shivank Garg wrote:
> clear_contig_highpages() clears the whole range at once under
> preemptible models. Otherwise it clears PROCESS_PAGES_NON_PREEMPT_BATCH
> pages at a time, with a cond_resched() in between. The batch is 32MB if
> the architecture defines clear_pages(), and one page otherwise.
> 
> Since commit 7dadeaa6e851 ("sched: Further restrict the preemption
> modes"), architectures that support lazy preemption only offer the
> full, lazy and RT preemption models, also with PREEMPT_DYNAMIC. x86 is
> one of them, and it is the only architecture that defines
> clear_pages(). So the 32MB batch is never used: whenever
> clear_contig_highpages() runs under a cooperative model, the batch is
> one page.
> 
> Make that explicit. Clear the whole range when CONFIG_PREEMPTION is
> set, and one page at a time with cond_resched() in between otherwise.
> Drop PROCESS_PAGES_NON_PREEMPT_BATCH, which has no other users.
> 
> PREEMPT_DYNAMIC kernels also have CONFIG_PREEMPTION set, and
> cond_resched() does nothing on any of these kernels. So a build-time
> CONFIG_PREEMPTION check is enough, and preempt_model_preemptible() is
> not needed.
> 
> No functional change intended.
> 
> Suggested-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> ---
> This came up in review of the copy_mc_highpages() series [1]. Pedro
> pointed out that most architecture are full or lazy preempt, so mm does
> not need to check the preemption model at runtime or batch the copy for
> cond_resched(), and simple per-page fallback is enough for non-preemptible
> models. David suggested doing the same for the zeroing path, and
> this patch does that.
> 
> [1] https://lore.kernel.org/all/20261019-batpagecopy-v2-1-d75e7d0dfaae@amd.com 
> ---
>  include/linux/mm.h | 28 +---------------------------
>  mm/memory.c        | 29 ++++++++++++++++-------------
>  2 files changed, 17 insertions(+), 40 deletions(-)

Awesome!

> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 35f5fc43861a..1083d0645d63 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -5269,7 +5269,7 @@ static inline void clear_page_guard(struct zone *zone, struct page *page,
>   *
>   * When running under preemptible models this is not a problem. Under
>   * cooperatively scheduled models, however, the caller is expected to
> - * limit @npages to no more than PROCESS_PAGES_NON_PREEMPT_BATCH.
> + * clear one page at a time and call cond_resched() in between.

Why can't clear_pages() itself do cond_resched()? Same question for
clear_user_pages() and/or clear_user_highpages().

-- 
Pedro
