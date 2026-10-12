Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFFC453A57
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793557; cv=none; b=gH0MOgwpgiv91Yrp6LAfKOSlSxSR/ufmiJW3M7yrqnm+vqHB0tYL7FtpDImPBORJdExETEvks6Nox5LxLDPSNo40csmAmOCQ5VNOEAj3b7tNCf1lMXApNmBQ6BGcD45HGO2zbW8A/d7NRes+hmgLIrml3EEqcaKiiaQWDOf4ZEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793557; c=relaxed/simple;
	bh=tNK4iWkkGzj0LWE2ZwxVKTqf/hlNiYXyXoD1JBj27Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8gV3hFw+SHI64wVSGYTSbywtX/PSB7z77Vaej9a6kZ7l6zVyBGfQJSU2S23I7xnPPLYp+rCcgyMpTSgwaVLnPP4uLTK1KpLGBchmmFfLMWJyb9kWbfSn1kSIsiwzCpfBK1VEBjM0nD0XXuuZjW023cHkxg6RBpTOl9RaGMij9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rt2tBD+X; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wO18hACz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rt2tBD+X; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wO18hACz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rt2tBD+X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wO18hACz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rt2tBD+X";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wO18hACz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 115ED21E43;
	Mon, 12 Oct 2026 08:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791793554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K6vB1DNqF6otGL/B8stHx9KLEIOKxJvHsQqgauK/9Yw=;
	b=rt2tBD+Xsa4cegseukdkCql4FfWK4dibSELmlF8rG4mf5Q7RQlEIqmgarCitkRbhuk/NIB
	xcBfs8A0WzGm1dQXokBzHeH/Xn34FqT+Va/VqJ0GSzx1ggdYOu06wYLWBYVHhiGUb2NBx4
	6SH1TVz3MKVcZ0qE+iskXKFGeQgWnvQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791793554;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K6vB1DNqF6otGL/B8stHx9KLEIOKxJvHsQqgauK/9Yw=;
	b=wO18hACzvjyI7bzQsXnrnRX/SIi8r8ZZrNbcv1uajklorQkjcD+JtbLYCigMfyhju2koEU
	5p1mGdTHJXttKtAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791793554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K6vB1DNqF6otGL/B8stHx9KLEIOKxJvHsQqgauK/9Yw=;
	b=rt2tBD+Xsa4cegseukdkCql4FfWK4dibSELmlF8rG4mf5Q7RQlEIqmgarCitkRbhuk/NIB
	xcBfs8A0WzGm1dQXokBzHeH/Xn34FqT+Va/VqJ0GSzx1ggdYOu06wYLWBYVHhiGUb2NBx4
	6SH1TVz3MKVcZ0qE+iskXKFGeQgWnvQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791793554;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K6vB1DNqF6otGL/B8stHx9KLEIOKxJvHsQqgauK/9Yw=;
	b=wO18hACzvjyI7bzQsXnrnRX/SIi8r8ZZrNbcv1uajklorQkjcD+JtbLYCigMfyhju2koEU
	5p1mGdTHJXttKtAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AF56F13408;
	Mon, 12 Oct 2026 08:25:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WHyhH5CZzGpNIQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 12 Oct 2026 08:25:52 +0000
Date: Mon, 12 Oct 2026 09:25:50 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Dev Jain <dev.jain@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, ryan.roberts@arm.com, 
	riel@surriel.com, akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, kasong@tencent.com, qi.zheng@linux.dev, shakeel.butt@linux.dev, 
	hannes@cmpxchg.org, brendan.jackman@linux.dev, ziy@nvidia.com
Subject: Re: [RFC NO CODE] [DISCUSSION] Anti-fragmenting ordered buddy
 allocator
Message-ID: <asyUgZVSauks3Vwd@pedro-suse.tail5790ac.ts.net>
References: <20261011215412.1181172-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011215412.1181172-1-dev.jain@arm.com>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Flag: NO

Hi,

On Sun, Oct 11, 2026 at 09:54:11PM +0000, Dev Jain wrote:
> (I am not posting code yet since it is in experimental stage.)
> 
> TL;DR
> -------
> 
> I am proposing "ordered/bucketed buddy allocator": we divide the buddy
> freelists into buckets, and prefer lower buckets for allocation.
> This reduces external fragmentation (and, further reduces it when we
> reverse the ordering for unmovable and reclaimable allocations) at the
> cost of regressing the alloc and free paths, which depends on how many
> buckets you partition into. I think we can partition into 4 buckets and
> do some tricks to remove any regression.
> 
> Design 1 is the simplest and the most upstream-friendly method in terms of
> allocator speed. Design 2 tries to scale better with the number of buckets.
> 
> INTRODUCTION
> -------------
> 
> Apart from dividing the freelists between migratetypes, little attempt
> has been made to change the algorithm of the buddy itself to reduce
> external fragmentation proactively (termed as "anti-fragmentation" in
> academia). Linux has defragmentation (compaction). The analysis below
> is *not* to claim that compaction does a bad job; I just took up the
> challenge of anti-fragmentation (because I like to torture myself) and
> kept digging the rabbit hole.
> 
> There have been academic papers about replacing the buddy with bitmaps -
> I did not want a hard NAK from upstream at any attempt to do that, so
> I preserved the buddy freelists.

So, I've been looking at LLFree (one of those novel page allocators with
no buddy and just a bitmap) lately. A few thoughts:

LLFree basically divides memory into 2MB pageblocks (with a free pages
counter), and then later organizes these pageblocks into 64MB "tree roots".
These tree roots are then borrowed by each CPU and made local (pretty much
like old SLUB used to do). This localizes most of your allocations and
pretty much avoids conflicts/cross-talk across CPUs.

Yes, there is a bitmap. I don't think it's required, and it might actually
be misguided. The paper itself has other side-goals. One of them is easy
persistence in persistent DRAM; we don't need that. Another one is minimizing
the cache footprint of the page allocator; this is misguided (IMO) because
allocating pages has the side effect of you actually needing to initialize
the struct pages after the fact; whether the allocator core hangs state off
the struct page or not is not important, and in fact using struct page there
might provide cache benefits.

The bitmap does not work well for random order allocations.
The paper itself was written on Linux 6.0, which (probably) relied quite a
lot less on things like mTHP (and random-order file pages) than we do now.

In any case, this paper doesn't necessarily address your fragmentation
problems, but it does attempt to address fragmentation (and SMP performance)
through borrowing these pageblocks. I would not be surprised if it had
a sizeable (positive) impact in fragmentation. I firmly believe that a
direction similar to the buddy allocator, but with more buddy work pushed
to the pcpu side (like Johannes's pcp buddy allocator series) is there right
approach and could have a meaningful effect.

Of course, it doesn't solve other problems like lifetime mixing in allocations,
and things like slab migration are insanely complicated to pull off.
 

-- 
Pedro
