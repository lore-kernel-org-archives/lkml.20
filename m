Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498DE4BB5A4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184959; cv=none; b=UFKwKcdZL5ICdsqrnI62go15icFM1m6PHwulleBQRb0pPEa2tJeCT9OxQwKQF46YQe+2Gy6a5nazniImpPE68NlzO+vxZBlLxQYCbCgiGT7vB9BuicRn7+cdBuVZN6JAA+NEm7sqJiF26CSvMKREopFdXy5nGDyw4jA8zEmD95k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184959; c=relaxed/simple;
	bh=j0rR9MGESIIEuqcISsQKYNt5XVOHewIyabitt0SxDbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lzrew8YC1WeeG1dclvBlJg9bqS5jgzzMaWtPqFG0zNRLQehreQXA62tLscOGx9V4+NTF2RgY03wB44sJsbVCeEtxdgRcwiAlT9e/i5GEBpb27h3u7ZHaqwab73bdfqd+o4d7OLsVSPEJlaj90lgJqFWWlA1pjn49WPYz7b7LGsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eEhWzK95; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eEhWzK95"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a20bf98748so2052691fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788184954; x=1788789754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+6NgNBrKED1HZLTTfXtmSzKHM84oxFz3evM2YzN+h9A=;
        b=eEhWzK95HTVNoBTxreBIhtX/5MlJo2NiX4TgxkUNd17yKqY5z/3KiquFlU6nqaEN9r
         zfSPbYNHnHaRLE4wPFERjMmva4HM52KnKroaPYmYdYBW6E7o7HC/Cq5n9iZjB4h/Jzv9
         tkNI6MwnsJqCT1eQX5EJCmHg3rSBZAjQmgjVtZ7+RJyaPYbnQtlCRnzJ6BKYTqfxOznK
         ARHYkxRK6i9bEEZ9GP89e/Ay2rVxozQcqBAgMPjamfUkS4LfgDNC4J5h1p48TFPr9z+8
         BJrY16j0P6waHKEL7DZnFOqBHFa0itDsIZjFjaLF/FT8IA8j2XGY/l8MeGLuFaDHtVU8
         pzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788184954; x=1788789754;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+6NgNBrKED1HZLTTfXtmSzKHM84oxFz3evM2YzN+h9A=;
        b=d8PPiTJvxPFXDlRzU6d3X9wQq+z4LqDzxkSPAFXlo9/HjwlJEAucFlSNsNbJwd74CL
         oq91G6q5rqPEGYAqbCmoAcuA/Iektg0a5oAQunPlzDayZOtE7R/ahdgS3wBLWWjGWVAV
         N18pb+2GS3dND8TuV30qRo34fOTqClTeN8ouzPfgj0fUMH6xetDGAtzY7v0vxBQORrfj
         91wXt6x1IV1p8X3EPOAck2CjqezcO9Yi8cU2ePoVabqxfi69QLgUPahFEp83x63Z1AuZ
         +GMP8mMmzB+1iHyDOyeUglKOQBH4TFS9fGSYRSiV8BydkciIJy4zTWvwrltUcSIPj+YH
         LaZg==
X-Forwarded-Encrypted: i=1; AKwUvBzx5+yLHAFv9lkP1XLwYCT3GwN15aqtJFjEluEPcHjkOftcTgLSkzt5ONaiMRJIpYceso3Q9gFy7ZVamr8=@vger.kernel.org
X-Gm-Message-State: AFuF++nuqephlCk6MbvAJvqCbQ+90it4RQ7AVdk9nNpomxHP05V61WA/
	gqrq9fRZLt+7eemP9NaDaQEkdoBR5tIzlSpnNBThKYqHhN/FfZdCfs/oM3FTt3tjwrzg+YNa7VD
	cA+AI9d0=
X-Gm-Gg: AYBFou0Ah4HbXlCTUy2SjtMf1UFKGKf4qScXKr8CIpQFTdBE3gjs8AammDc3KkIFh0p
	rGEF7e+y30jdniqQAR9krdEPq5F7ppoTq+9yjHV2xTI53ygv2TVJmZpVp1NjaIDz+PeIHfuzEok
	6Ip6DUZ0BvM98vlo/IoDricNHN3FgWt1XyKMXyxob5cYV7Rn7D1hGOHzqyuveEmS5h37ZCgVyLy
	npeI4mMUNnZrSEKILVZO42w7X/EiYDFj1pdDdY2g/ilGCm5flZNeUL+enIuQVZrrjYe3k51m4sK
	5QmW4LfI9zJW76z9Nq75pg2TnUXarYaqeGhfGgvyc2MQRc0UB7PJKJuNbtfJU0xqw9GMQWJfLEZ
	P+Ollto36AlvafUkAK7nvz/qN/+OfFmbLFsZq1JqqHseSUpwyIvmj9HOJdbvdHpVv+r9KMGlPum
	+FX/uWemCDFkzlusBQfipnLUqEONBgHZvlbHo0S0C1N+/+8BhxkEnGulPBfZo=
X-Received: by 2002:a05:651c:a107:10b0:3a3:38e2:aea1 with SMTP id 38308e7fff4ca-3a338e2b1eamr1597451fa.2.1788184954189;
        Mon, 31 Aug 2026 07:02:34 -0700 (PDT)
Received: from localhost ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d77f7643sm5961747a91.3.2026.08.31.07.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:02:32 -0700 (PDT)
Date: Mon, 31 Aug 2026 22:02:30 +0800
From: Heming Zhao <heming.zhao@suse.com>
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, ocfs2-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ocfs2: restrict OCFS2_INVALID_SLOT suballoc slot to
 system inodes
Message-ID: <apWJLyCNwqfdiRQb@p15>
References: <20260831062848.2743436-1-joseph.qi@linux.alibaba.com>
 <20260831062848.2743436-2-joseph.qi@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831062848.2743436-2-joseph.qi@linux.alibaba.com>

On Mon, Aug 31, 2026 at 02:28:45PM +0800, Joseph Qi wrote:
> ocfs2_validate_inode_block() currently permits i_suballoc_slot to be
> OCFS2_INVALID_SLOT for any dinode.  Only system inodes created by
> mkfs.ocfs2 are allocated from the global allocator and thus
> legitimately carry this value; regular inodes are always allocated
> from a per-slot suballocator and hence must have a valid slot.
> 
> If a corrupted regular inode with OCFS2_INVALID_SLOT is accepted,
> ocfs2_remove_inode() will pass the slot to ocfs2_get_system_file_inode()
> and get_local_system_inode() will hit BUG_ON(slot == OCFS2_INVALID_SLOT)
> when the inode is deleted.  This can be triggered by an unprivileged
> user unlinking such a corrupted file.
> 
> Reject OCFS2_INVALID_SLOT for non-system dinodes during validation,
> while still accepting it for system inodes.
> 
> Fixes: fe7a283b3916 ("ocfs2: add suballoc slot check in ocfs2_validate_inode_block()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>

LGTM.
Reviewed-by: Heming Zhao <heming.zhao@suse.com>
> ---
>  fs/ocfs2/inode.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
> index 180107a11046..eda50f13ffb5 100644
> --- a/fs/ocfs2/inode.c
> +++ b/fs/ocfs2/inode.c
> @@ -1520,8 +1520,23 @@ int ocfs2_validate_inode_block(struct super_block *sb,
>  		goto bail;
>  	}
>  
> -	if (le16_to_cpu(di->i_suballoc_slot) != (u16)OCFS2_INVALID_SLOT &&
> -	    (u32)le16_to_cpu(di->i_suballoc_slot) > OCFS2_SB(sb)->max_slots - 1) {
> +	/*
> +	 * Only system inodes created by mkfs.ocfs2 are allocated from the
> +	 * global allocator and thus legitimately carry OCFS2_INVALID_SLOT.
> +	 * Regular inodes are always allocated from a per-slot suballocator.
> +	 * If a regular inode with OCFS2_INVALID_SLOT was accepted here,
> +	 * deleting it would pass the slot to get_local_system_inode() via
> +	 * ocfs2_remove_inode() and trigger BUG_ON(slot == OCFS2_INVALID_SLOT).
> +	 */
> +	if (le16_to_cpu(di->i_suballoc_slot) == (u16)OCFS2_INVALID_SLOT) {
> +		if (!(le32_to_cpu(di->i_flags) & OCFS2_SYSTEM_FL)) {
> +			rc = ocfs2_error(sb,
> +					 "Invalid dinode %llu: suballoc slot %u for non-system inode\n",
> +					 (unsigned long long)bh->b_blocknr,
> +					 le16_to_cpu(di->i_suballoc_slot));
> +			goto bail;
> +		}
> +	} else if ((u32)le16_to_cpu(di->i_suballoc_slot) > OCFS2_SB(sb)->max_slots - 1) {
>  		rc = ocfs2_error(sb, "Invalid dinode %llu: suballoc slot %u\n",
>  				 (unsigned long long)bh->b_blocknr,
>  				 le16_to_cpu(di->i_suballoc_slot));
> -- 
> 2.39.3
> 
