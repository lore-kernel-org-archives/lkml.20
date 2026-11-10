Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794325060;
	b=BUVEsBiJKJtx2VA8J2uUkIbmJxiqAPNTQnjAboRl7uEzE694RbE4U5GlXD3PVGJWGPhG
	 STSCpsYigc8+oVIgiD1vNiF1MezSXFmjuFB0uhoZ0eFnSMaAbMCiPoJhVXtiJQFctT0Qr
	 Neiez3xW5hhZui7KRea4LVwAc9tWwltz4f1U5SntXz5wDymgPShfuCS1TW2RLLrUyG56I
	 ihUpg6JBn/cRLL56GGTX7LL/g3FxsM1qi8VdqB1tcHi+auIktjVTrK/x4Lm5Os1nKINDx
	 ghkqx/UZ9E3rGyuCVDUDbndCXGGXUdOi6YwHOnZ4RRDFOqgMUkJe5ergmgEEDG6rnFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325060;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=G+VenII0jwmOnGUQKiSusNuz5Q/gzWL632bcNCLluCo=;
	b=ZCe0zWrMnUtYT6TMhA80pBTNDYIjXUYx4/DkmpTy2lK6x/Qf25kWxdg7N7V7MtUawuY/
	 gvTDdl0RDYpF2W1t/SdgA8jcvJPjPBfC5nox6Wo7TfSRZj3tlS4vg818ZmgYE0IGuxFiM
	 rW1FNR21hrsnQO8d9BxuA3CpTojJdht4U0oqnogggsBIzp6mQGFvr/4RRKMAyGYubSENu
	 RkVRp2CcfSfiuFt2qFYYhsf0VHHdShhYeUZTIo1CMvBuD2fEFTblV5N2NR/ipEvVLl+0L
	 d3t5W9uoX+iFNWZDrxzcHx4TFKdjd4MhKddbwLtpOjniiTeze9+jtHSAceGhgCs/ZGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=MmbldRwm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=0OmouxRS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="E/9UpYUc";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="K/lgFPbV";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE97606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:37:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FE97606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=MmbldRwm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=0OmouxRS;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=E/9UpYUc;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=K/lgFPbV
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EC47D1F7F7;
	Tue, 10 Nov 2026 15:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794325058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G+VenII0jwmOnGUQKiSusNuz5Q/gzWL632bcNCLluCo=;
	b=MmbldRwm618/CVcGLyudixNM57fs9Hy5KWALkJOwvBDLpXlYCeUbMUVYw+8yP8pamNrQcq
	u7WQbIKlicPKYZl30TAsdt4DbWA8qMHRHjbDLCVtfyPE8slBiW3xkVehpBMfFHjVS2SG33
	xAZV4w75MAMkS5HkZd746kCuLZ97844=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794325058;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G+VenII0jwmOnGUQKiSusNuz5Q/gzWL632bcNCLluCo=;
	b=0OmouxRSA2P/5DnrLBl79+irDVO1cTVam9A7eCmzSVUnAAAneE1YH/kPS1S3fXecrZ8z6E
	S5RuvbhWOzWzm7CA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794325057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G+VenII0jwmOnGUQKiSusNuz5Q/gzWL632bcNCLluCo=;
	b=E/9UpYUcUPN2KYwhM9o1Q2S+Tp2V1PDYc6WPgkpPC3LrDdVgtqzJa88akvAjxGyLhHDKbk
	3+7dqotNMsdQw/4aHBJ/8a6En57FMrVnxpEWgZ1CJ3JGlazdKG2V0SG7ftXYFxA4fsNKDM
	j0Phgn3rff7RSfE8OgDxAxJYkql4fp4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794325057;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G+VenII0jwmOnGUQKiSusNuz5Q/gzWL632bcNCLluCo=;
	b=K/lgFPbVHQ3kryfHqIrpNfp/GfOPUOvpW92Ge7CQRRAXWavqjUdEKXl2MKrRgTFZJiF7bk
	YeCfbu94FkwKMaCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EAC6913479;
	Tue, 10 Nov 2026 15:37:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eyAkLEA682qaawAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Tue, 10 Nov 2026 15:37:36 +0000
Date: Tue, 10 Nov 2026 15:37:35 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Jann Horn <jannh@google.com>, Lance Yang <lance.yang@linux.dev>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, "Kiryl Shutsemau (Meta)" <kas@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Seunghyun An <san55@wisc.edu>
Subject: Re: [PATCH] mm/vma: predicate vma_assert_stabilised() on
 CONFIG_DEBUG_VM
Message-ID: <avM6Iyu3_0Mb2w27@pedro-suse.tail5790ac.ts.net>
References: <20261110-vma-fixup-debug-asserts-v1-1-0b2e0680cd7e@kernel.org>
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
In-Reply-To: <20261110-vma-fixup-debug-asserts-v1-1-0b2e0680cd7e@kernel.org>
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
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,wisc.edu:email]
X-Spam-Score: -13.30

On Tue, Nov 10, 2026 at 03:10:40PM +0000, Lorenzo Stoakes (ARM) wrote:
> I introduced commit 17fd82c3abe0 ("mm/vma: add and use
> vma_assert_stabilised()") with the intent of picking up programmatic bugs
> when debugging mm code, but kept the general practice of asserting even
> when CONFIG_DEBUG_VM is not set in line with existing code.
> 
> However, it turns out doing so can cause performance regressions,
> especially when asserted in vma_has_anon_rmap() which is referenced in a
> number of hotpaths.
> 
> Since the intent was always a debug-only assertion, explicitly check for
> CONFIG_DEBUG_VM and do not assert if it isn't set.
> 
> Really all of the assert paths need to be predicated on this, but start
> with this one only, out of caution.
> 
> Additionally, since a detached VMA is trivially stabilised (nothing to
> stabilise against), check for this case at the outset, and update
> vma_has_anon_rmap() to not explicitly need to check for this.
> 
> This also, importantly, avoids reading any VMA fields if CONFIG_DEBUG_VM is
> not set.
> 
> Target the commit which introduced vma_has_anon_rmap() for the fix, as this
> is where the issue started manifesting in practice.
> 
> Fixes: 38564710f443 ("mm: implement and use vma_has_anon_rmap(), silence KCSAN")
> Reported-by: Seunghyun An <san55@wisc.edu>
> Closes: https://lore.kernel.org/linux-mm/20261110000002.1834454-1-san55@wisc.edu/
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

-- 
Pedro
