Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06292FDC20
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535513; cv=none; b=DRhc1QwnyKccrXoxb2qFgDyLtho6URAQdKROdyHtnHi7Fh9sWFq9onu4ODyjXwxxz2orjQj6OPu2Ny8RkNkrGx9aoqa2IOuXjMfUyAwIGwSsg63Gt8hed4OzRxAJbiwDvhVKapwjafdvQeksD4x8BjYId4X9P9A65aLlip46Hzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535513; c=relaxed/simple;
	bh=aCHfr4rUCXn9OiWSlvf8VDczI2DSL3J0+AZUi6Ocyjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WzZA4HbT4hW+2asZPpImsjkKtdWBrfkj/jM95Dc3LqSp0pQuRdPmJpcrJVxeM2NA/a92LDtmIW2nxspvcRbMDvJvX6fILGBHxnVg4d5iayH4ip6mF2bsm1+sIwGAqU5f6N4754hoK44Cll/AgRC6IVyIt9xVSNpfXOx9I6iLv1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PQnp9ZT3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oUdI6azy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OSAW7qDb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/0JDl6m8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PQnp9ZT3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oUdI6azy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OSAW7qDb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/0JDl6m8"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B67401F8C0;
	Fri,  4 Sep 2026 15:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788535505; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4uegA/dEm0BMFL81peUN2ZxZ/uAgFp0QibfS0jKjF30=;
	b=PQnp9ZT3hHw+piKXvGyV4Lwj4X/GkvOuYhqt8qPFzJDLekXnkVVi1Yy15nmTvLl4Pc/gYE
	3lgnZGjdpBd1CQ48Mgu33rGT8vxbYWy6XiO9QKcr5iFFlEfrHNRXe6IqcwSrxTe9UyXHp9
	jiMeF9GzBs1nhnwN7Aasz0XjwVk8RdA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788535505;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4uegA/dEm0BMFL81peUN2ZxZ/uAgFp0QibfS0jKjF30=;
	b=oUdI6azy3DEZZMOxggEoj+qxOzOfU/3si4iKli3LjdvBgfe90ZWpeLLeMnkjxJ1yCVohM6
	qII66s/hDabjttBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OSAW7qDb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/0JDl6m8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788535501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4uegA/dEm0BMFL81peUN2ZxZ/uAgFp0QibfS0jKjF30=;
	b=OSAW7qDb9UllVJbDZJH9jLc59GfVrtVtYbccNcTCFH5sN05qgv6qjDTBfEnZKLIwieE/u+
	aYH96yC4sLu67ljvJOjqMjN6PjxmZhCoN6tHwMjtPeiuvSe2FlMY4Xdt/Zaeyb00RqsfJR
	+jdTY7p3q23jzkOiFtHcD9V++vu/4Kc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788535501;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4uegA/dEm0BMFL81peUN2ZxZ/uAgFp0QibfS0jKjF30=;
	b=/0JDl6m8kBmKKAoeUdRgqGF1pkgFIWiKi9yX3LQjW7zB7Dt6SdbLMFZV1EXZwOUGKENRUp
	bfyV8+WP4zCiRaCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E4BA413726;
	Fri,  4 Sep 2026 15:25:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WjKNNMzimmpRAwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Fri, 04 Sep 2026 15:25:00 +0000
Date: Fri, 4 Sep 2026 16:24:59 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, David Hildenbrand <david@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Mike Kaplinskiy <mike@recall.ai>, 
	zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
Subject: Re: [PATCH] mm/madvise: swap in CoW'd MAP_PRIVATE-file mappings on
 MADV_WILLNEED
Message-ID: <apriM1q4GzAgP7JQ@pedro-suse.tail5790ac.ts.net>
References: <20260904-madv-will-need-map-private-v1-1-6b83cc99fcff@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-madv-will-need-map-private-v1-1-6b83cc99fcff@kernel.org>
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B67401F8C0
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[recall.ai:email,suse.de:dkim,suse.de:email,pedro-suse.tail5790ac.ts.net:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -4.51

On Fri, Sep 04, 2026 at 04:12:53PM +0100, Lorenzo Stoakes (ARM) wrote:
> Currently MADV_WILLNEED treats file-backed and pure anonymous mappings
> entirely separately - using POSIX_FADV_WILLNEED (equivalent of a readahead)
> for the former and a tree walk and swap in to swap cache for the latter.
> 
> MAP_PRIVATE-file backed mappings straddle the two and currently get treated
> as if they were purely file-backed, meaning any swapped out private pages
> remain swapped out.
> 
> Resolve the issue by explicitly checking for CoW'd MAP_PRIVATE-file backed
> mappings and performing both walks in this case.
> 
> Since the logic checks for vma->anon_vma this means un-CoW'd
> MAP_PRIVATE-file backed mappings retain only the single file walk.
> 
> Reported-by: Mike Kaplinskiy <mike@recall.ai>
> Closes: https://lore.kernel.org/all/CABeknB_S2XJSHFgnHdgnN0rjzHhH4oQJs_APq9fvxHztQ_pgiA@mail.gmail.com/
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  mm/madvise.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 73c2901b9adb..d0510dd49dde 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -297,10 +297,12 @@ static long madvise_willneed(struct madvise_behavior *madv_behavior)
>  	loff_t offset;
>  
>  #ifdef CONFIG_SWAP
> -	if (!file) {
> +	if (!file || (vma_is_cow_mapping(vma) && vma->anon_vma)) {

Couldn't this all be simplified to

	if (vma->anon_vma) {

? swapin needs anon pages to have been faulted-in. Non-cow mappings won't
have an anon_vma, nor will fully empty anonymous VMAs (and that's fine).
Right?

Regardless, looks cromulent

Reviewed-by: Pedro Falcato <pfalcato@suse.de>

-- 
Pedro
