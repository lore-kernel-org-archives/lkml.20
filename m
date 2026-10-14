Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7947B54146F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791986910; cv=none; b=ifFnoWo88of7/pdi0+3JSaIOuqXrkyp8pcC0ZIJsqhPpCvp4mJaBAZPNoJgOxaHi2gvt4I2Uo23UEK8iHsiP8t5NwzyWkXmUdEOgJO9UcXVRHQWCcvPoDUORxgEpm4xXdrIHB45BHDKkTJXSvWYY41+cfagZh2n6oKjXxIdelhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791986910; c=relaxed/simple;
	bh=xewTN7HgbrljAGNzRNu86NKYuJIFpqC4+b+s4UD0BDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRsdENSNrcdy2n+jwzYh5nvc/dGIx5J1ggEZCFXccocmbYkj0I0eacDNK1Qs2tlcN9Zbmr8SK2XIcsUx3WEC38+p3FawWM4RF0e65AhC/tN4cw39N+yZ7R4iNZ8fB1zRXqkLO0CI/90p2P98ztL9MevA1zI0DTW6HowA7KJNft0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L9WkPNia; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=H41ak4iP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L9WkPNia; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=H41ak4iP; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L9WkPNia";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H41ak4iP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L9WkPNia";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H41ak4iP"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6E04A21E96;
	Wed, 14 Oct 2026 14:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791986907; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dSdF7ttMR37qeMo3vVxB7qidb08wbMcip4f6Hc1/wJY=;
	b=L9WkPNia6Q3TcmwnQfHGhdvsDvTaKjOetO6Bql1fL7L0TTtb1f7IUiisKubGi0hX/59evJ
	2RFvdt9SDTsHiG+0lSVDw38cTucjUeI3tt061SHRjmhDgXH0YxDVfEjx/7Sxtf4plhNhN+
	EN9Tm7Th/bEf5BHL+VH2wum/w+jIZ5I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791986907;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dSdF7ttMR37qeMo3vVxB7qidb08wbMcip4f6Hc1/wJY=;
	b=H41ak4iPkHuZjrFne99XIiCE1UeQY/aWRL2UXJsQ/QlpknmVLzqYsEuNxymC+ULMGD8f3V
	18B3UZ1h2vVPhmAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=L9WkPNia;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=H41ak4iP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791986907; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dSdF7ttMR37qeMo3vVxB7qidb08wbMcip4f6Hc1/wJY=;
	b=L9WkPNia6Q3TcmwnQfHGhdvsDvTaKjOetO6Bql1fL7L0TTtb1f7IUiisKubGi0hX/59evJ
	2RFvdt9SDTsHiG+0lSVDw38cTucjUeI3tt061SHRjmhDgXH0YxDVfEjx/7Sxtf4plhNhN+
	EN9Tm7Th/bEf5BHL+VH2wum/w+jIZ5I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791986907;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dSdF7ttMR37qeMo3vVxB7qidb08wbMcip4f6Hc1/wJY=;
	b=H41ak4iPkHuZjrFne99XIiCE1UeQY/aWRL2UXJsQ/QlpknmVLzqYsEuNxymC+ULMGD8f3V
	18B3UZ1h2vVPhmAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B3E38133F1;
	Wed, 14 Oct 2026 14:08:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BXI7INqMz2oUaAAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 14 Oct 2026 14:08:26 +0000
Date: Wed, 14 Oct 2026 15:08:25 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mm/mlock: use a long for the page count in
 mlock_fixup()
Message-ID: <as-MrR-l80xoMnWE@pedro-suse.tail5790ac.ts.net>
References: <20261014131358.780240-1-nickolai@csail.mit.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014131358.780240-1-nickolai@csail.mit.edu>
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 6E04A21E96
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Score: -4.51

On Wed, Oct 14, 2026 at 09:13:58AM -0400, Nickolai Zeldovich wrote:
> mlock_fixup() adjusts mm->locked_vm, an unsigned long, by the number of
> pages whose VM_LOCKED state it changes, but computes that number in an
> int:
> 
> 	int nr_pages;
> 	...
> 	nr_pages = (end - start) >> PAGE_SHIFT;
> 	...
> 	mm->locked_vm += nr_pages;
> 
> When a single VMA range of 2^31 pages (8 TiB with 4 KiB pages) or more
> is locked or unlocked, the count is truncated to 32 bits and then
> sign-extended, so locked_vm is changed by the wrong amount, while
> munmap(), mremap() and the other paths that maintain locked_vm use the
> full unsigned long page count.
> 
> Such a range is reachable on 64-bit architectures with a 47-bit or
> larger user address space (x86_64, arm64 with 48-bit VA, riscv64 Sv48)
> by a task with CAP_IPC_LOCK or a raised RLIMIT_MEMLOCK, which do_mlock()
> checks against the full untruncated length.  It costs nothing with
> MAP_NORESERVE and MLOCK_ONFAULT/MCL_ONFAULT, since then no page is
> populated.  On x86_64, after
> 
> 	p = mmap(NULL, 8UL << 40, PROT_READ | PROT_WRITE,
> 		 MAP_PRIVATE | MAP_ANONYMOUS | MAP_NORESERVE, -1, 0);
> 	mlock2(p, 8UL << 40, MLOCK_ONFAULT);
> 
> VmLck in /proc/self/status reads 18446744065119617024 kB instead of
> 8589934592 kB; munmap() of the region then subtracts the true size and
> leaves VmLck at 18446744056529682432 kB instead of 0.  With 16 TiB,
> locked_vm is not changed at all, VmLck stays 0 kB, and after the task
> drops CAP_IPC_LOCK or lowers RLIMIT_MEMLOCK, mlock(), mmap(MAP_LOCKED)
> and the other mlock_future_ok() and account_locked_vm() users enforce
> RLIMIT_MEMLOCK against that count, so they let the task lock memory
> beyond its limit (or, in the 8 TiB case, refuse every further lock).
> The error persists for the life of the mm; unlocking the range in pieces
> skews it further.  The wrong count is per-mm accounting only: it does
> not change which pages are locked.
> 
> The int has been there since before git history (the variable was named
> "pages" until it was renamed in 2.6.28); every other updater of
> locked_vm uses an unsigned long or long count.  Make nr_pages a long,
> which holds the page count of any user range and its negation, so the
> existing sign handling is unchanged.
> 
> Found by formal verification of mm/mlock.c against the kernel binary.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Assisted-by: LLM
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

LGTM, thanks!

-- 
Pedro
