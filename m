Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938C6486BB2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847890; cv=none; b=B1ac6+pJh8HdLcIOEAfP0JIJc9888/yyC1m315Iyo0Fy8EIPsJVgmaTOHuoWCuIzfJnaN1mdVtqv/URwqzHRhHg5ZZ5TNgCZaNAOyuHjrB17F3yJQSAN3ZPxrxg/22SCn/yLLLg4geTZHZebuftYb6E8/WoCGuToWVkqtrhPADM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847890; c=relaxed/simple;
	bh=9O+eclGtucKsrlv156J8BHH6qyZ4uNkuKq1q0Pt8sV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hUF+As+yGJjAyreoJuvNanPyMA86FP5anboY6pHuqERYuufu54hXBu5C+Cj5ANdC5LFocs1ueH+Y2H2RdoyKjtptobFfy2FX4bXk1+rLd8e3HyqMViMoGDRB3dvPavCd3alMxREOpZo+6J0TvixyOQB/Vg6LREJmw0cAFAurpvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Jjs2JmgE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JJTDJBOO; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yFaQVxBL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=S2VO7JQZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Jjs2JmgE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JJTDJBOO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yFaQVxBL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S2VO7JQZ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A95FA21AE5;
	Thu, 27 Aug 2026 16:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787847880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rh27INqa2xwHCVt1R3WeNRy936qHTTbLRu7Tqal0mbE=;
	b=Jjs2JmgELdBqtRjnwhRR6RMvjwxOm/Vt65Pn5YAbv99l2Nj82l8/HeArhnN/26Z4LfGyFM
	mVsmGhIXyPGSthGj8x0rX2ZdQFvHz/04j4iEZh8/UmwVGFDorRygh3rokc2bmqLvcvmm/m
	ge+r8ucvjnnNRxPp3ymjwITQu3EMBV0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787847880;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rh27INqa2xwHCVt1R3WeNRy936qHTTbLRu7Tqal0mbE=;
	b=JJTDJBOODznNlzy6S0DqMKn785KlM+XSkWVXNOTIYz0+jcHbx9u3THcjyR8ugbDS53/sij
	0c3FMlkEEynGMmCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yFaQVxBL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=S2VO7JQZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787847875; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rh27INqa2xwHCVt1R3WeNRy936qHTTbLRu7Tqal0mbE=;
	b=yFaQVxBLr71zP7TNiWSMcxQOFvM25RmWNY1xHAVBOrhU0H2myTWD7SUU2KubbXHluD+rW5
	hHLNxvm+gxgRHgmQeilzJHSo9vNWczzOghJ2MziqaIZNNPcTpM+PXJI7YM5RsITllwqlWz
	vJosx5qnoDwubwgYbFp28Wjygpzb/uQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787847875;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Rh27INqa2xwHCVt1R3WeNRy936qHTTbLRu7Tqal0mbE=;
	b=S2VO7JQZ18yiOQ84l+2K2r51yFliJwBv48LleFHEqlTJqyVGP98XPto50X2s6Nq3B0W2PC
	A+QHZyDDmHhaU5Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0A72A13354;
	Thu, 27 Aug 2026 16:24:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pqjgOsFkkGoEHwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Thu, 27 Aug 2026 16:24:33 +0000
Date: Thu, 27 Aug 2026 17:24:32 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Hao Li <hao.li@linux.dev>
Cc: vbabka@kernel.org, harry@kernel.org, akpm@linux-foundation.org, 
	cl@gentwo.org, rientjes@google.com, roman.gushchin@linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] mm/slub: reduce list_lock contention with slab
 parking
Message-ID: <apBioBxd4VkmaGhA@pedro-suse>
References: <20260824122004.3652-1-hao.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824122004.3652-1-hao.li@linux.dev>
X-Spam-Score: -4.01
X-Rspamd-Queue-Id: A95FA21AE5
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Mon, Aug 24, 2026 at 08:19:50PM +0800, Hao Li wrote:
> This patch series might sound a bit wild, but the initial numbers don't
> look too bad so far. I would really appreciate any feedback and
> discussion :)

The numbers look great, I have to say ;)

> 
> On a will-it-scale mmap1 run with 192 processes, list_lock is the top
> contention point: __slab_free() and __refill_objects_node() together
> spend 44% of cycles in native_queued_spin_lock_slowpath. The free
> slowpath takes the lock mainly to add slabs that became non-full to the
> partial list.

Doesn't this mean you're hitting the slow path way too many times? I think
that's the actual issue, no?

> 
> By adding extra instrumentation to __slab_free(), I collect the following
> data for the maple_node cache (in counts):
> 
>   partial->partial    843017414
>   full->partial       550719384
>   partial->empty      17459564
>   full->empty         2
> 
> We can see that full -> partial transitions account for a significant
> proportion, and optimizing them can help reduce lock contention to some
> extent.
> 
> This series introduces the parking mechanism to address this issue.
> When the trylock fails during a full -> partial/empty transition,
> __slab_free() parks the slab on a per-node llist instead of waiting. The
> paths that consume the partial list (sheaf refill, alloc slowpath,
> shrink, cache destruction) unpark the slabs after taking the lock, and a
> delayed work covers the case where none of them runs.
> 
> Patch 1 cleans up the case handling in __slab_free(), no functional
> change. Patch 2 introduces the parking mechanism.

This looks like fundamentally the wrong fix, when we want to find out why
1) you're hitting the alloc slowpath so hard
2) you're hitting the free slowpath so hard

and ideally find some way to tune it properly. Maybe if sheaf size is scaled
up/down in some way (by default at least), according to amount of RAM or amount of
CPUs.

-- 
Pedro
