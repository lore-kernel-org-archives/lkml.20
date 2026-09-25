Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9DF381B1A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351036; cv=none; b=WRErB+ksYozCTaMo/HdF0BrXh3Sz6RWsgFYwOwWv0mULz7gMmW9n7tcaFXJA2UgVT4LrwB8HWBVajVVMIsVHGNWimhJ2W2Ace7wNt5ustgNgPKuCj+7gbH+q5pGBlkTaq0WxSEeS7ywvaIZo029+V1tswabZdJfnvGghcb+Fy+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351036; c=relaxed/simple;
	bh=H2iITbwWRbTLpKTvGDc+MIwhRaw7cQEDthahspq/mAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oVnSlQjsd3MEhRG4NDBUSlxSTNHwsOjopM9HLQEfQzDLvLq3SgFPOh6LdhoB994ElkDAwRKx8vy/WsQnNcYrctWX0fLdVY2cHcqdhY3yj7xoDOTSbO9OC+eOGeQr7Ojy+UtW2mxed99dFZMAFQ6Ut6YruomFG8DH34B7PDJiX3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UrTBj5DO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XJ2ng/tm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Eu6JG8yN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FIV7hAVN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UrTBj5DO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XJ2ng/tm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Eu6JG8yN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FIV7hAVN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8A3331F7D3;
	Fri, 25 Sep 2026 15:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790351028; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IxoD1TfpMnlHhB4OJ4JkkWL7Kpm3ztSu4F+OAJdGJJQ=;
	b=UrTBj5DOaKy8ZYe3EDblH3vg+C+j6dbaamPZjXrvv7zSBNriO+URS81wolaSKxr2jBFiRE
	Xevrszki8ag3T6W8ZtAcvx4XrGbblo3RaaBu+Jq6KHPi7DEm+j6EmF5nWQuwhv95dgYjYt
	UoMkiHRQr/mSmDCZtZz/6EHBwt1GzAs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790351028;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IxoD1TfpMnlHhB4OJ4JkkWL7Kpm3ztSu4F+OAJdGJJQ=;
	b=XJ2ng/tmOeARv54gnA9sJCwwXh3G2isJ8zW/6O/Tw1/BQdw7/H8caS5bR5dRApuElNwgXC
	IA0JipJvgLx3StDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790351024; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IxoD1TfpMnlHhB4OJ4JkkWL7Kpm3ztSu4F+OAJdGJJQ=;
	b=Eu6JG8yNIU0VVstgCa5gl74tXGp8A6ZXjvuBUo7OKEBPKPS4/A5IsA9PDysWuKIVi6hr6R
	q/GwscQnab/osjlQxT9ZiELHA78pCLQ0T1rCIOoXjVXixvGgTWogiR3rCrcYs/cMWIJ9I+
	Cm0IpEtImDZ+X/ZBkOx2vmKPihH5IV0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790351024;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IxoD1TfpMnlHhB4OJ4JkkWL7Kpm3ztSu4F+OAJdGJJQ=;
	b=FIV7hAVNvn72bus5pVlQGvbAWf/OYQVEN83+kSYzU/y19plCj+QKR4Kj7QZgZkzdpXMqs1
	Dz+R+0gJ4WDaiAAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7156813274;
	Fri, 25 Sep 2026 15:43:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Aq7GD6+WtmrAPwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Fri, 25 Sep 2026 15:43:43 +0000
Date: Fri, 25 Sep 2026 16:43:37 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Pan Deng <pan.deng@intel.com>, akpm@linux-foundation.org, 
	liam@infradead.org, vbabka@kernel.org, jannh@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Tianyou Li <tianyou.li@intel.com>, 
	Wangyang Guo <wangyang.guo@intel.com>, Zhiguo Zhou <zhiguo.zhou@intel.com>, 
	Tim Chen <tim.c.chen@linux.intel.com>
Subject: Re: [PATCH] mm/vma: avoid redundant file rmap tree re-insert on
 new_below=0 split
Message-ID: <araVBBBVY-jafePL@pedro-suse.tail5790ac.ts.net>
References: <20260924054301.2330822-1-pan.deng@intel.com>
 <araI4WsI0XMXOR10@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <araI4WsI0XMXOR10@gremlin>
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,intel.com:email]
X-Spam-Flag: NO

On Fri, Sep 25, 2026 at 04:27:44PM +0100, Lorenzo Stoakes (ARM) wrote:
> > This change skips the re-insert for that case.  vma_prepare() no longer
> > removes vp->vma from the tree; instead vma_complete() detects that case and
> > only recomputes shared.rb_subtree_last up the ancestor chain.  Everything
> > else keeps the remove + re-insert path.
> 
> This could really do with a diagram and a simple explanation.
> 
> In general you should rewrite the entire commit message yourself and not
> use the LLM output at all.

+1 on this. Even with the Assisted-by, this needs to be understandable by
hoomans.

> 
> >
> > The case is detected by comparing vma_start_pgoff(vp->insert) against
> > vma_start_pgoff(vp->vma): only a new_below=0 split leaves the former
> > greater.  __split_vma() adjusts pgoff via vma_add_pgoff(new,
> > linear_page_delta(vma, addr)), and linear_page_delta() is
> > (addr - vm_start) >> PAGE_SHIFT with addr strictly inside the VMA, so the
> > delta is at least one page and the new VMA's pgoff is strictly greater.
> > For new_below=1 the two are initially equal and vp->vma's pgoff then
> > increases, so the comparison is false both before and after the caller's
> > endpoint updates, and the original path is taken.
> 
> This is useless description of the code in English, it's not telling me
> anything useful at all. Human beings don't have a large 'stack' with which
> to hold things in our minds.
> 
> Write with humans in mind please :)
> 
> >
> > Inferring the case this way keeps the change small: struct vma_prepare
> > gains no field and no caller changes.
> 
> I don't understand what inferring the case means? I think this can be
> dropped.
> 
> >
> > Moving the remove() out of vma_prepare() leaves vp->vma in the tree with a
> > possibly stale sort key across the caller's endpoint updates, so
> 
> I mean what?
> 
> What does a 'possibly stale sort key' mean? And what does 'across the
> caller's endpoint updates' mean? Which caller? What's an endpoint? What
> updates?
> 
> > vma_complete() re-keys it *before* inserting vp->adj_next: otherwise that
> > key-driven descent could place adj_next in the wrong subtree.
> 
> Re-keys what? WHat does re-key mean?
> 
> What you're saying here really makes me nervous. You're changing a very
> sensitive part of the kernel and talking about intentionally leaving stale
> state around.
> 
> This patch cannot possibly be considered for upstream until I fully
> understand exactly what this means and that you understand what you're
> doing.
> 
> >
> > Measured on v7.3-rc4, on a 2-socket 192C/384T system running UnixBench
> > execl (384 concurrent execve of the same binary), dropping the redundant
> > remove + re-insert yields ~14% higher throughput by shortening the
> > i_mmap_rwsem write-side critical section during the file VMA splits that
> > execve performs on the shared libraries.

For what it's worth, I'm vaguely accepting of a similar change, but this needs
to be _really_ well commented out, and ideally in file rmap code, _not_
spaghetti'd in VMAs. The interval tree is complicated and some bits are not
very intuitive. This needs to be robust. Not LLM'd into existence.

This also reminds me that I should reboot the sharded file rmap effort...

> 
> This is really unconvincing I'm sorry. Real numbers please with statistical
> evidence to back them.
> 
> Additionally I notice you have not made one comment referring to locking
> anywhere.
> 
> This part of the kernel has VERY subtle and sensitive locking
> requirements. I am not convinced you understand this, either.
> 
> >
> > Signed-off-by: Pan Deng <pan.deng@intel.com>
> 
> This patch feels like a hack. You are creating a whole new set of very
> fragile assumptions that have to be maintained throughout.
> 
> Again as above, a member of the core team should take this over.
> 
> > Reviewed-by: Tianyou Li <tianyou.li@intel.com>
> > Reviewed-by: Wangyang Guo <wangyang.guo@intel.com>
> > Reviewed-by: Zhiguo Zhou <zhiguo.zhou@intel.com>
> > Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>
> 
> Please don't do this.
> 
> Upstream is not interested in private reviews. Review tags upstream are
> based on review done in _public_.

Yeah, this too. It's just noise.

-- 
Pedro
