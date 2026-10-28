Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199993;
	b=NwcnLd8TNdum8J1i0p2cIQygGJbpv5TvpR2fS4CQaoKqa5LAZDeos9uFrfb23VhYHnIL
	 Mns1XtEnQVpHvQ7J0XD8kOpC9FMOIDpi+HFGOHIW4GELY/TUovP5rEa4/EbyBdfmW3Dz1
	 oZqnutBDBFkZ4l7+FkJq9oCmWtC8lWCwLpQeaVHSbUGeHQRBnchRVHeddDZbCCdd7Ti3o
	 PY618XeO1GKdqRLhL/onvFKvvt8oSDS6LcSpCGhDTEMtFo0Wa4dLLvleVn+z0SegbLnyL
	 4YQ6MIOQR8bDIn1xewIzRqdO5pJgJqMR6ifwT3W7/Je3tK/vKsA8gi0j3aVmlLpRaCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199993;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=vwnluHM6ETxEARZScVwfOpepqeIhMTU8NTSVHG7kDLc=;
	b=oQ7zgnr+nD0SDd5Raig5ASEM7+Y+BHuNtMmljGB9RXQcVM+mICCWFQhjFV2FwfIT9/eD
	 XEc8XlDPecohmz8u4NBNm5ynvcjk6Kgsx5jRo0gQeDiXS0Hkyk8NfL0VQXYDhBPhZl56s
	 SH4qbnRmbteGsjRPOwKijin28G9lgeaux4PBrGVHL3SA6EuRjIn+MYQkaXM+cU+4WmkQd
	 HSAHHwjxJ/OIzkhX8Vh2Zx1uSf6SHzEgmkqjMkOvRjslu8Y7z8rA+kdF7EgkYsSt6lviA
	 tIcpCAF90eH9O9/MoOoSZP6NQd/C9c5GGSsTPpkEqb5kNCZfsNvZsCyzAJVTKeMfXeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CpjugCLs;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Q5ma1ImV;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CpjugCLs;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Q5ma1ImV;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4697F606A338;
	Wed, 28 Oct 2026 15:06:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4697F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CpjugCLs;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Q5ma1ImV;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=CpjugCLs;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Q5ma1ImV
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 835601F7A9;
	Wed, 28 Oct 2026 15:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793199990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vwnluHM6ETxEARZScVwfOpepqeIhMTU8NTSVHG7kDLc=;
	b=CpjugCLsTZ68lwVx6Htr7fnQJKI1Fmaxt1YGRhANsciGCxPegHOqfa8oTrBEauaJ6fxlhy
	5Syd9KVtxzdviPmQuAcE3uNDTxlofnV+g5PPua7B+h8RGmXvIKguH2NubEN2X7OEkJ91OK
	4t3gli11pNVMstzroT9F5x8cIOwd2JU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793199990;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vwnluHM6ETxEARZScVwfOpepqeIhMTU8NTSVHG7kDLc=;
	b=Q5ma1ImVEJZWkViJKSoGQDIWGkhhNK+7kWoFxmyLlSgO0Elgnaxg5H/PEI7wEv55K5QlQK
	qC8i99MKndUqqtAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793199990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vwnluHM6ETxEARZScVwfOpepqeIhMTU8NTSVHG7kDLc=;
	b=CpjugCLsTZ68lwVx6Htr7fnQJKI1Fmaxt1YGRhANsciGCxPegHOqfa8oTrBEauaJ6fxlhy
	5Syd9KVtxzdviPmQuAcE3uNDTxlofnV+g5PPua7B+h8RGmXvIKguH2NubEN2X7OEkJ91OK
	4t3gli11pNVMstzroT9F5x8cIOwd2JU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793199990;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vwnluHM6ETxEARZScVwfOpepqeIhMTU8NTSVHG7kDLc=;
	b=Q5ma1ImVEJZWkViJKSoGQDIWGkhhNK+7kWoFxmyLlSgO0Elgnaxg5H/PEI7wEv55K5QlQK
	qC8i99MKndUqqtAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 356BC13419;
	Wed, 28 Oct 2026 15:06:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XW0wAXUP4moXIQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 28 Oct 2026 15:06:29 +0000
Date: Wed, 28 Oct 2026 15:06:27 +0000
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
Message-ID: <auIPRjj2t0BcYlOa@pedro-suse.tail5790ac.ts.net>
References: <20261016-fix-vma-lock-overflow-v2-1-9eb778b79b58@kernel.org>
 <atXjbsDn7DJybsHU@pedro-suse.tail5790ac.ts.net>
 <atYJA7nIu_RwpoCC@gremlin>
 <auIIxSorX0bhZNZc@gremlin>
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
In-Reply-To: <auIIxSorX0bhZNZc@gremlin>
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-13.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[linux-foundation.org,google.com,infradead.org,kernel.org,linux.dev,suse.com,lwn.net,kvack.org,vger.kernel.org,gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -13.30

On Wed, Oct 28, 2026 at 03:04:07PM +0000, Lorenzo Stoakes (ARM) wrote:
> On Mon, Oct 19, 2026 at 01:19:45PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Mon, Oct 19, 2026 at 10:53:27AM +0100, Pedro Falcato wrote:
> > > On Fri, Oct 16, 2026 at 12:34:33PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > I'm concerned by the possible latency when doing this to many VMAs. Do you
> > > have any numbers?
> >
> > No, somebody schloppened a patch for a real issue and I haven't the time to do
> > even the things I need to do let alone 'here's a new task' stuff :)
> >
> > However, this is a simple write to every VMA, done at the point the mmap write
> > lock is held with all VMA write locks dropped.
> >
> > It was implemented such that:
> >
> > * No VMA write lock is taken on the VMAs.
> > * VMA read locks can proceed.
> >
> > I.e. it amounts to a loop over VMAs and a write to a field.
> >
> > I don't think you could possibly do more to reduce latency here, and you
> > absolutely have to update this field across the board.
> >
> > Under any realistic workloads this will occur at worst ~days intervals, often
> > far longer, and likely you will see quite some gaps between separate processes
> > experiencing it.
> >
> > There's also an upper bound of vm.max_map_count per-process, so it can't explode
> > into something truly insane.
> >
> > Most processes don't have that many VMAs, other than certain steam games :) so
> > it's hard to imagine there really would be that much latency here.
> >
> > And the latency is occurring on one thread, which is performing an mmap unlock,
> > so nobody sane will put that on a hot path.
> 
> Sorry, I forgot about this and didn't get numbers to back this.
> 
> I had an LLM go get numbers on this, all in ms on my threadripper (but numbers
> should scale similarly) with fork() + munmap() all VMAs for comparison:
> 
> (all ms)
> 
>       VMAs      reset    reset     fork()     munmap()
>                 (warm)   (cold)    (cold)     all VMAs
>   --------    -------  -------    -------    ---------
>      1,000      0.006    0.041       0.33         0.43
>     10,000      0.072    0.36        2.1          4.2
>     65,500      0.61     2.4        14.1         33.5	(default)
>    262,144      5.3      9.6        60          168
>  1,048,000     34.7     39.2       237          691
>  4,194,304    162      163         954         2810
> 
> It happens on a random VMA write lock release, so there could be tail
> latency, but it'd be tail latency on the scale of ~weeks for normal
> workloads, and (assuming max map count reached at default limit) a ~2ms
> latency for an operation such as mprotect(), madvise(), mmap() or munmap()
> which shouldn't be placed in any situation where the latency of that call
> matters.
> 
> One call in 2^31 is the
> 99.99999995th percentile, far beyond any latency target anyone measures.
> 
> The amortised time per write-lock cycle is ~18 picoseconds (0.018 ns).

Thanks, this addresses my concerns :)

> 
> Interestingly, the runner observed khugepaged-induced mmap lock stalls of
> ~100ms, far far more regularly, which seriously exceeds any of these
> numbers, about which I assume we haven't had too much complaint.

Wow, that's horrible.

-- 
Pedro
