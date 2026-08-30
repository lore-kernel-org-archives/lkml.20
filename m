Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E5425B0AC
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788098889; cv=none; b=VTXPEJxUj6H6zcfvY0lcGAN2XudtAARR8UxEJWFVfIE9j5JWVZni/GqvMwTRfZLlhP2jWXkGce+LqyAdXViEbSIBi5VaMvK+EtRausE8cKrhseXDJ6doObjsC7FL0fTLMumuh54H+gLO4DjLkBsQuWl1TJs+fxfOV0Vy1gyxUqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788098889; c=relaxed/simple;
	bh=cjiqlJ6M/yddNcvZuEBRj8YRLs939+H8WHYM3LKYK6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDKojOhhvSxVD9rhxSXYuQt2tI0qpB/H2mGeacwllWlbOA3DzP+7H0VOqMf0AcLPLGNuAQYpDvWUEIiJtdgRHOXKhvlbki6emBHnRBelfNZA9VCJLMugkx38YuRsmBBcytrDpcLNeKsJCitWYE9cMp7AHZwwxZ9paZv+RBQmefs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QNCjsBND; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LmsE03i1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oyGbZRTR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KlwfuqSP; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QNCjsBND";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LmsE03i1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oyGbZRTR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KlwfuqSP"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 64E7F1F88E;
	Sun, 30 Aug 2026 14:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788098852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xMCDf2Xyi4fVpMEfyEi3kgnx7CCnpFFBCFTolLbUPMA=;
	b=QNCjsBNDSKe9eRP/8Bbj6rzx5/zb1kiuyAwyt9Du1aeaO3vdPqKiRXHY9qRLhG4kXDtgBK
	5vj+/JHoO81+nVrW1ZWY+IMLU4uDwo8y5faKshFgR0maTzd1+6tJRH6wZyi7CDKVgbri26
	QK2uqnhg+RFbYxuPWBZJe3ZFf8rsunA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788098852;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xMCDf2Xyi4fVpMEfyEi3kgnx7CCnpFFBCFTolLbUPMA=;
	b=LmsE03i1d0q7kmWSCbLjLn7puHvnETDt7mN6xz9+8xjKGBs81n/0jDZ4xzakEo70zvn11w
	NQJ92+Wr9FotEhBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oyGbZRTR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KlwfuqSP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788098848; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xMCDf2Xyi4fVpMEfyEi3kgnx7CCnpFFBCFTolLbUPMA=;
	b=oyGbZRTR63YczWI0geY/Ylz82j/Cm7WFNSZ9QS+og3RkEYsCqR4tvQuKuZxp5VzhM8IxZs
	U+uJmg0gkGaDrRKRGX7eptE/NPQRGldLJ8tevFIvzT0lZ0pJdql+l4x5us1RYKggCkpJKP
	A58We58wxVcHrMzG2OAQV/bLAeScRQ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788098848;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xMCDf2Xyi4fVpMEfyEi3kgnx7CCnpFFBCFTolLbUPMA=;
	b=KlwfuqSPnLEf2dgEG3WoNGCYHVuClNOsZiH8okKHLLcFB9CtCV2vgM31Rml+pw+4KEheFL
	GNt3oaObIrfl5gAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DDE9413682;
	Sun, 30 Aug 2026 14:07:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IWG/Mh45lGoHFAAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Sun, 30 Aug 2026 14:07:26 +0000
Date: Sun, 30 Aug 2026 15:07:25 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>, 
	willy@infradead.org
Cc: akpm@linux-foundation.org, david@kernel.org, harry@kernel.org, 
	jannh@google.com, lance.yang@linux.dev, liam@infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org, mhocko@suse.com, 
	riel@surriel.com, rppt@kernel.org, surenb@google.com, 
	syzbot+395b7abe9696862fc188@syzkaller.appspotmail.com, vbabka@kernel.org
Subject: Re: [PATCH] mm: fix the race on huge alloc failed
Message-ID: <apQxGMgLWWlfn3cd@pedro-suse.lan>
References: <apOkscUtVMpFqFjM@casper.infradead.org>
 <20260830124756.457887-1-trintaeoitogc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830124756.457887-1-trintaeoitogc@gmail.com>
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: 64E7F1F88E
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_RCPT(0.00)[395b7abe9696862fc188];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,infradead.org];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Sun, Aug 30, 2026 at 09:47:56AM -0300, Guilherme Giacomo Simoes wrote:
> Matthew Wilcox <willy@infradead.org> wrotes:
> > > >> Fixes: 164b06f238b9 ("mm: call wp_page_copy() under the VMA lock")
> > > >
> > > > what makes you think this is the right commit for fixes?
> > > Maybe I would should analyzed this better. I only seed the commit that introduce
> > > this function (and consequently this reader)
> > 
> > That was what I thought, but it's not enough to determine if that's the
> > start of the problem.  Look, that commit does:
> > 
> > -       if (unlikely(anon_vma_prepare(vma)))
> > -               goto oom;
> > +       ret = vmf_anon_prepare(vmf);
> > +       if (unlikely(ret))
> > +               goto out;
> > 
> > ... and anon_vma_prepare() does:
> > 
> >         if (likely(vma->anon_vma))
> >                 return 0;
> > 
> > so either this race was already present in 164b06f238b9 (and you need to
> > go back further) or it was actually introduced later (maybe the write
> > side was introduced later?)
> 
> This commit introduce the vmf_anon_prepare():
> +static vm_fault_t vmf_anon_prepare(struct vm_fault *vmf)
> +{
> +       struct vm_area_struct *vma = vmf->vma;
> +
> +       if (likely(vma->anon_vma))
> +               return 0;
> +       if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
> +               vma_end_read(vma);
> +               return VM_FAULT_RETRY;
> +       }
> +       if (__anon_vma_prepare(vma))
> +               return VM_FAULT_OOM;
> +       return 0;
> +}
> 
> in commit 2a058ab3286d (mm: change vmf_anon_prepare() to __vmf_anon_prepare())
> the vmf_anon_prepare became __vmf_anon_prepare.
> Where the race problem occours `if (likely(vma->anon_vma))`...
> This commit 164b06f238b9 is introduced in 2023.
> 
> The write side is introduce in commit d5a187daf585 (mm, rmap: handle
> anon_vma_prepare() common case inline) in 2016.
> 
> > The important thing to know is that the mmap_lock is a read-write lock.
> > That means that two readers can be present at the same time.  So this race
> > can happen when both threads hold the mmap_lock.  I don't know whether
> > they do in the syzbot reproducer; probably not, but it doesn't matter.
> > 
> > The other important thing is that _we don't care_ what the value of
> > vma->anon_vma is.  We only care whether it's NULL or not (this is a
> > sufficiently common case that I wonder whether KCSAN shouldn't special-case
> > it and decline to monitor it ...)  VMAs are created with a NULL anon_vma,
> > and then if needed, anon_vma is set.  Once set, it is never changed (uhh

I believe it can be changed (IIRC on a mremap dontunmap edge case??), but
that needs the write lock anyway.

> > ... at least I don't think it is.  Lorenzo, could you check me on this?
> > I think all the places where we set vma->anon_vma to NULL are in
> > situations where the VMA is not yet exposed to the page fault handler,
> > like in the child side of fork()).
> But if I have a write in the same time, this can be a problem, even though if
> you only want to know if vma->anon_vma is NULL or not.
> 
> > 
> > So it's inappropriate to use READ_ONCE() / WRITE_ONCE() to "solve"
> > this problem, because we don't need those semantics.  It's sufficient
> > to wrap the read side in data_race() to indicate to KCSAN that we know
> > what we're doing.
> you sure? 
> 
> the __anon_vma_prepare(..) is write on vma->anon_vma and the
> __vmf_anon_prepare(..) is reade from the same vma->anon_vma at the same time,
> you sure that is not a problem? (I'm asking as a curious layperson.) 

99.9% sure. Here's the basic logic laid out:

1) Fault needs to fault in anonymous pages
2) Fault needs to possibly create an anon_vma
 2a) Thus it does the lockless check, where indeed we only
     care if it's non-null or not.
 2b) if the lockless check fails, we get into __anon_vma_prepare()
     logic, which crucially takes the page_table_lock to write the
     anon_vma to the vma. If it takes the lock and something is already
     there, it backs out.
3) Now, into the weeds of anon page faulting, we end up in __folio_set_anon(),
   which reads the anon_vma from vma. This function always (AFAIK?) runs with
   the PTE lock held. Thus we can be sure the anon_vma value is correct. In
   any case, we only need to have held the page table lock once in the fault
   for it to be valid; any change to its value from non-null to null needs
   the vma/mmap write lock. Because we take a bunch of locks and do a bunch of
   stuff between that initial check in __vmf_anon_prepare and this, the compiler
   cannot validly cache the load (which can, in theory, tear).

Now, for memory ordering and its wonderful transitive properties:
1) writing anon_vma takes the page_table_lock. therefore if you acquire
   page_table_lock, you obsreve the anon_vma store and all preceding stores
   (due to spin_unlock providing RELEASE semantics, and spin_lock providing
   ACQUIRE semantics)
2) say you install e.g a PUD entry, you take the page_table_lock. So you fully
   observe the anon_vma that was installed (by doing an ACQUIRE on the lock).
   you also issue a smp_wmb() which makes sure the ptdesc setup is visible.
3) others using that PUD entry will (should?) transitively observe everything
   you have observed, data-dependent loads will help you there. If we _ever_
   observe a page table without seeing an associated anon_vma, it's broken.

[Yes, I spent quite a bit of time thinking through this; it isn't trivial to prove
that 2->3 transition is correct, but it looks vaguely _handwavely_ correct]

> 
> > 
> > Also, as Lance said, I don't see how this is related to huge_page_alloc
> > failing.  All I see is two threads calling  __vmf_anon_prepare() at the
> > same time, which I presume is an attempt to COW a hugetlb page.
> > 
> > I don't think it's enough to just add a data_race() to this one read of
> > vma->anon_vma.  I think it's quite prevalent.  There's probably other
> > syzbot reports that mention it.

It sounds to me like the most cromulent solution is simply adding a

/* maybe vma_has_anon? */
static inline bool vma_has_anon_vma(const struct vm_area_struct *vma)
{
	return data_race(vma->anon_vma);
}

and churn everything to use it.

-- 
Pedro
