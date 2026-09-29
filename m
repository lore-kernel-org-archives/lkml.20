Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCBB3AAF73
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790715378; cv=none; b=CVKQ2HA72ly278hbjz7i5ec13GL/VcZ1H4bHsf+TY+BFtiyX3jgNNM9kf/EkV/Edup+Q86zIboiVyvw+oDs2jrNdtPDXMbXiY+Za6IS3fEGuRZcwDkpJBrtE4bW4Dy9a41U8A9+aRVk989q8jDNJVikffHuwlU0kyobigYNWSF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790715378; c=relaxed/simple;
	bh=QScy1wMKA15ZLyur8tVN/4Ox/n6+YgNwNDurfdACk04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FXLvF0Kd94kZkanJjypcCRSbOL6QLNPmKsHKLxvvsY5iy+M0kuIVhwxF6tvWkcKDvcTx3yId/zvDzfoz1yFwjzxNUH93q6F1opQoijAJbd7xAvX7d5/gqQoG5o0mrVb2oziGMZqQ0oCHR8zLiBaHs1+ot0bTlgY0CtQDFf3AOpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=BP3Vm6oB; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=keiui9M0; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=d6BGZLOC; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=CZsmPwU+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="BP3Vm6oB";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="keiui9M0";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="d6BGZLOC";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="CZsmPwU+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3F4AB1F750;
	Tue, 29 Sep 2026 20:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1790715370; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E9V0TlxcOxSRjP0wh0jiLzTU8ACS4SGk/nUZsiX67u0=;
	b=BP3Vm6oBEdnHFn2D8fWhCq0VKt5i1IsR58yAHONFLxo93mmteJAaK6YVYXM8z/xvlrHE7c
	YBYESVaudcECECGykgXn+H769RAZc1sg5RXWnSghCLbVp2vMDh893nLmVuEpU1d+GvG3PO
	VYlMGWwfFHWgMRmvfsgb7Nr6Y0TeTlg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1790715370;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E9V0TlxcOxSRjP0wh0jiLzTU8ACS4SGk/nUZsiX67u0=;
	b=keiui9M0mN0WwFWOxEBuXZIQ+y80vL6mu3QXpnhwRBJAa6f31C4O2fcx5m8b5T15b7pLsM
	q3SefP9MyTxV0nCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1790715366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E9V0TlxcOxSRjP0wh0jiLzTU8ACS4SGk/nUZsiX67u0=;
	b=d6BGZLOCIaLfns8okPRS149pspQZjCxfJKxfUxJJjXe0cGGNnPgf+S4RKj3dEOr7mzkQvs
	mwQcGFAoZHstW/z7EAOZmbqcjbwibRhNYGm7deOzNgIw/Ff80hs43qw1OY1rmJBkj0NvOe
	Krsj39Xyuujou0/zTVXIK0bTEye56Bk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1790715366;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E9V0TlxcOxSRjP0wh0jiLzTU8ACS4SGk/nUZsiX67u0=;
	b=CZsmPwU+B7zdC6de7LOQLJnAAWPDhVE84l6zrEmQQFdYPjorSlhHMVVbCpfmiav6Opxjuv
	w8GwFPGmmhLbBkCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 134C1136E4;
	Tue, 29 Sep 2026 20:56:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7O6JNuUlvGq/ewAAD6G6ig
	(envelope-from <jack@suse.cz>); Tue, 29 Sep 2026 20:56:06 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 8555AA133D; Tue, 29 Sep 2026 22:56:05 +0200 (CEST)
Date: Tue, 29 Sep 2026 22:56:05 +0200
From: Jan Kara <jack@suse.cz>
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] quota: fix shrinker scan budget accounting in
 dqcache_shrink_scan()
Message-ID: <eb2mbko52tynkk6fjo3guvhr7bmpjgywezrp352loxnlr3noui@azwaqesw4yt3>
References: <20260928-fix-dquot-shrink-scan-nr-scanned-v1-1-789c661c9dd6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-fix-dquot-shrink-scan-nr-scanned-v1-1-789c661c9dd6@gmail.com>
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email]
X-Spam-Score: -3.80
X-Spam-Level: 
X-Spam-Flag: NO

On Mon 28-09-26 20:54:40, Qiliang Yuan wrote:
> The dquot cache shrinker's count_objects() callback,
> dqcache_shrink_count(), reports the number of unused dquot objects
> via the DQST_FREE_DQUOTS percpu counter (through vfs_pressure_ratio()).
> do_shrink_slab() reads this count exactly once per invocation and
> derives a one-shot scan budget (total_scan) from it, then repeatedly
> calls scan_objects() in fixed-size batches until that budget is
> exhausted.
> 
> dqcache_shrink_scan() never updates sc->nr_scanned, even though
> include/linux/shrinker.h documents that "the callee should track its
> actual progress" in that field. The function already decrements
> sc->nr_to_scan in place as it walks free_dquots, one per dquot
> destroyed, and its while loop exits immediately without touching
> sc->nr_to_scan at all when free_dquots is already empty. Because
> sc->nr_scanned defaults to sc->nr_to_scan before every call,
> do_shrink_slab() always believes a full batch was examined regardless
> of what actually happened, so it has no way to tell "there was
> nothing to do this pass" from "a full batch was scanned and none of
> it was freeable", and keeps calling scan_objects() until the
> original, one-shot total_scan budget computed from the percpu count
> is drained, even though free_dquots emptied out long before that
> budget was used up.
> 
> Compute sc->nr_scanned from the difference between the nr_to_scan
> value on entry and the value left behind by the reclaim loop, and
> return SHRINK_STOP once that difference comes back as zero, since
> that only happens when free_dquots was already empty and no further
> calls in this reclaim pass can make progress.
> 
> Tested on a loop-mounted ext4 image with the quota feature enabled:
> chown()ing several hundred files to distinct uid:gid pairs to
> populate allocated dquots, then triggering
> "echo 2 > /proc/sys/vm/drop_caches" to let them drop to zero
> references and become reclaimable, while using an ad hoc kprobe pair
> on dqcache_shrink_scan() (this shrinker has no dedicated tracepoints)
> to record sc->nr_to_scan on entry and the return value on exit:
> 
>                       total scan_objects()   calls with
>                       calls                  freed == 0
>   before this patch     12                    5 (42%)
>   after this patch        5                    0
> 
> The last call in the "after" run returns SHRINK_STOP
> (0xffffffffffffffff) instead of a fifth zero-progress attempt.
> 
> This is the same missing sc->nr_scanned accounting already fixed in
> the analogous ext4 extents_status shrinker and the jbd2 checkpoint
> shrinker; dqcache_shrink_scan() was found by auditing every shrinker
> in the tree whose count_objects() reads a percpu_counter (the
> precondition for count_objects() to report a stale, still-positive
> value after the reclaimable list has actually drained), while ruling
> out the much larger set of shrinkers built on the exact list_lru
> atomic counters, which cannot observe this kind of staleness.
> 
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>

Thanks. I've added the patch to my tree.

								Honza

> ---
>  fs/quota/dquot.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/fs/quota/dquot.c b/fs/quota/dquot.c
> index 9850de3955d31..b55fa7d63f56d 100644
> --- a/fs/quota/dquot.c
> +++ b/fs/quota/dquot.c
> @@ -809,6 +809,7 @@ static unsigned long
>  dqcache_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
>  {
>  	struct dquot *dquot;
> +	unsigned long orig_nr_to_scan = sc->nr_to_scan;
>  	unsigned long freed = 0;
>  
>  	spin_lock(&dq_list_lock);
> @@ -822,6 +823,21 @@ dqcache_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
>  		freed++;
>  	}
>  	spin_unlock(&dq_list_lock);
> +
> +	sc->nr_scanned = orig_nr_to_scan - sc->nr_to_scan;
> +
> +	/*
> +	 * DQST_FREE_DQUOTS is a percpu counter, so count_objects() can
> +	 * report a stale/approximate value that is still positive even
> +	 * though free_dquots is actually empty by the time we get here.
> +	 * When that happens sc->nr_scanned comes back 0 and we have
> +	 * nothing further to offer this reclaim pass, so tell
> +	 * do_shrink_slab() to stop calling us instead of letting it burn
> +	 * through its one-shot scan budget against an empty list.
> +	 */
> +	if (sc->nr_scanned == 0)
> +		return SHRINK_STOP;
> +
>  	return freed;
>  }
>  
> 
> ---
> base-commit: 502d801f0ab03e4f32f9a33d203154ce84887921
> change-id: 20260928-fix-dquot-shrink-scan-nr-scanned-b11e8550287d
> 
> Best regards,
> -- 
> Qiliang Yuan <odys.yuan@gmail.com>
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
