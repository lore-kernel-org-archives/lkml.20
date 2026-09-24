Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9BB4A4824
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790264830; cv=none; b=cvnJsWtWM1WviTDes8B7Utf/MVknbJfQfJQ287XrCuaf6YcFKlbEWe2+3AeNzvp1mZDEndOwLWOC8nb+hyqJmfY0JkQUCz5UxdqWF6wIVHgnCqhClTZUOBqOEmyS7j+AZt6WqGVKNQwyADbidp2A+QyyFwvGe/9cIRT7GcAAglY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790264830; c=relaxed/simple;
	bh=PCM2N4S3oQTUtgFjoCKz+EupBhLuu0YfKWJeQeBrgk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R8S+O+pQttaipbdcQh+RsbHKu3dZ0aaCO7hXS0viK710EVLEaVzhPcNGglT7a+W0qL/rMy7Q94jh8iz6Epuqra+aOwBqGAPFpZEhla/1aDtmkz3QcnXpJ/C7Mc9a1ZWhYiVGuf7oLshxfm5jtdkLOVefrU08b/O/4/3dDI8APiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=3ZaDXo3v; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=/UVhutpd; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=HpE+I7lo; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=awndB4k6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="3ZaDXo3v";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="/UVhutpd";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="HpE+I7lo";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="awndB4k6"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1FC8E21ECC;
	Thu, 24 Sep 2026 15:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1790264820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J5kzrsgK/WKIrLeBeS6Z1YPH4UWApjj+XWi5jDIiiiI=;
	b=3ZaDXo3v/9x3NspF8VDd929ArQug3FK9zYMYPKEwHaEnhH/xCSipVFMsFWSOitcooJeG8U
	FzNyQsLMqvC60rFnOeXJDbNyduWW4nOd98cOISC9hl3hGAIlP78XTVs0YN3K9mpPTtfupt
	BLCkpDaVM7f9pUccScMy4yC81YuqtUU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1790264820;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J5kzrsgK/WKIrLeBeS6Z1YPH4UWApjj+XWi5jDIiiiI=;
	b=/UVhutpdeWR/a4JkOAA5w/uj5WwqC/QcS3EwwIHa18keXzB2rwFBgrzaRlzUSJFQLVIjcv
	MfvQDcKmdNXf+ICg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1790264816; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J5kzrsgK/WKIrLeBeS6Z1YPH4UWApjj+XWi5jDIiiiI=;
	b=HpE+I7lokCen3Hhg4uQ0Jq4H73lOiLS9blH7xCvf/qZfwpwTjZWKq5pYwXkRg+fEqjoMtp
	QlYign7+0rWdOHqixJ9ptEGmG3BhyXlP52C5S211wa/VKa/E7O6RcbfK6lPw7u7mcDKbqo
	xHtENiRxpNOXG1JVtzXEsA9LrIYHh6I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1790264816;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J5kzrsgK/WKIrLeBeS6Z1YPH4UWApjj+XWi5jDIiiiI=;
	b=awndB4k6q0cVR8rOknmVTr9/tUce5jpCdsdXQdloESb5uqjI63qD4jf4JRQNFkixl1hC/n
	rg0/mr2whCBQ0NCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ECFDC1365D;
	Thu, 24 Sep 2026 15:46:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +Vs/Me9FtWpuRwAAD6G6ig
	(envelope-from <jack@suse.cz>); Thu, 24 Sep 2026 15:46:55 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 7A517A132E; Thu, 24 Sep 2026 17:46:47 +0200 (CEST)
Date: Thu, 24 Sep 2026 17:46:47 +0200
From: Jan Kara <jack@suse.cz>
To: golasch18@web.de
Cc: Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org, 
	syzbot+de2fef01040748da6822@syzkaller.appspotmail.com
Subject: Re: [PATCH] udf: fix WARN_ON_ONCE in udf_map_block on concurrent
 expand failure
Message-ID: <6dyztzeud4yr64hmz3a3srkfl5yvsep5gvkie4yjcr7peiz6vd@dvsdvizgcdbi>
References: <20260919134431.83785-1-golasch18@web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919134431.83785-1-golasch18@web.de>
X-Spam-Score: -2.30
X-Spam-Level: 
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[de2fef01040748da6822];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[web.de];
	FREEMAIL_ENVRCPT(0.00)[web.de];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,appspotmail.com:email,suse.com:email,syzkaller.appspot.com:url]
X-Spam-Flag: NO

On Sat 19-09-26 15:44:31, golasch18@web.de wrote:
> From: Lukas Blesser <golasch18@web.de>
> 
> udf_direct_IO() falls back to buffered I/O for in-ICB files, but it
> checks i_alloc_type without holding i_data_sem. If a concurrent write
> fails to expand the file, udf_expand_file_adinicb() restores inline
> allocation, so udf_map_block() can observe ICBTAG_FLAG_AD_IN_ICB after
> the caller checked and hit the WARN_ON_ONCE() for a transient state.
> 
> Move the allocation-type check under the down_read() udf_map_block()
> already takes on the lookup path and return -EFSCORRUPTED gracefully
> instead of warning.
> 
> Reported-by: syzbot+de2fef01040748da6822@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=de2fef01040748da6822
> Signed-off-by: Lukas Blesser <golasch18@web.de>

There are two problems with this:

1) This removes the assert from the path allocating blocks.

2) This doesn't completely close the race window - the ICBTAG_FLAG_AD_IN_ICB
check in udf_direct_IO() should have failed and falled back to buffered IO.
Fixing that for reads is doable but I don't think it's worth it.

For now, I'd be inclined to just remove direct IO support from UDF and
always fallback to buffered IO. UDF isn't really used for any
performance-sensitive applications where direct IO matters. Once UDF is
converted to iomap, we can add the direct IO support back.

								Honza

> ---
>  fs/udf/inode.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/udf/inode.c b/fs/udf/inode.c
> index e45e546a7..cea8d5c4d 100644
> --- a/fs/udf/inode.c
> +++ b/fs/udf/inode.c
> @@ -352,9 +352,6 @@ static int udf_map_block(struct inode *inode, struct udf_map_rq *map)
>  	int ret;
>  	struct udf_inode_info *iinfo = UDF_I(inode);
>  
> -	if (WARN_ON_ONCE(iinfo->i_alloc_type == ICBTAG_FLAG_AD_IN_ICB))
> -		return -EFSCORRUPTED;
> -
>  	map->oflags = 0;
>  	if (!(map->iflags & UDF_MAP_CREATE)) {
>  		struct kernel_lb_addr eloc;
> @@ -364,6 +361,18 @@ static int udf_map_block(struct inode *inode, struct udf_map_rq *map)
>  		int8_t etype;
>  
>  		down_read(&iinfo->i_data_sem);
> +		/*
> +		 * The allocation type may have changed back to in-ICB
> +		 * after a caller checked it without holding i_data_sem:
> +		 * e.g. a concurrent expand failure restores inline
> +		 * allocation in udf_expand_file_adinicb(). Recheck here
> +		 * under i_data_sem and fail gracefully instead of
> +		 * warning about a transient state.
> +		 */
> +		if (iinfo->i_alloc_type == ICBTAG_FLAG_AD_IN_ICB) {
> +			ret = -EFSCORRUPTED;
> +			goto out_read;
> +		}
>  		ret = inode_bmap(inode, map->lblk, &epos, &eloc, &elen, &offset,
>  				 &etype);
>  		if (ret < 0)
> -- 
> 2.55.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
