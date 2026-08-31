Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD9B48F82F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788185073; cv=none; b=jE5BQOV9HiF/f6aCmET6nszSsgNd+iMMFUmetucceKKFvQDDh0zyCowdoLgNDK3AJhX4DhAjEvHtSLLqgPoyHTcXv4mbWrKZrCqYxUU1W+szGQFoL7seQOUPSnNifCjCs+jutGe2WHwxfp/I2Q8OWfor61EQn1fygF6VH0tFG9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788185073; c=relaxed/simple;
	bh=bsO0Lz6NalUUi/xtQJR4DcUiPJ+Y3NID7uVGeE2DMH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fXvrX7DPUmSLmmPcnJZL31ZyGNfiEnX52c0BWXVrYebApg9oq0P8yRCjn+01ZzANqs+2pROJKmtZErwUHthrmKhQtI6haxmEYQaFn4CiJ91Xh3S73kses4rSQ2kwvRw54d4SRIaMdvitjOV0PU5xdmczkxs8tqKd8pupWJoDgOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=brSljbJ2; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="brSljbJ2"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4996c452e95so1986575e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788185069; x=1788789869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n01oHYb01qW4w3RHhJYkHOqlZfqUwQaVGvitMYTsJNc=;
        b=brSljbJ2V7Pvo/2kamXhmmfG8U1C9MRB1tzog2hG3drBl5lnlaCH4JaIlbDGoZavrk
         S4LhQp7XUfeJFET0fUftAgau8ZLieEpDLFEOlMpxE0KSqr6akJRxdKEAds2++W4qzWyc
         iw2OgQKejHMVyVzQZ7PRnGgRvv2THi+nGyJ0XOI3ZJDb2HLUeR4C88hbMShp3K6GYUWS
         HETx18FOkaRqJ7qSsW7ggYWAmmHFZ71ponbN8XJs8hZiaVWGADL+Y6jqkCk7ItEkPhlm
         IeH2HId/XxCW9nCJ+Wwc9nz+b1JALTmidFCvfbBQs176yXcxRuocEnOknWveiHnS3cd7
         Q2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788185069; x=1788789869;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n01oHYb01qW4w3RHhJYkHOqlZfqUwQaVGvitMYTsJNc=;
        b=exuzzwkTsC6617UZDRvsgDZLWKbwRvpa8Wo33HDzTuFRKE7Ht+RQMyelDY8XTYhJC2
         dAT4jL2AuHbwhp49kWD5vGRmSqX5+WiCKfQ5l8ymooOsrwCdjPBtfhQSgpvq2A+SLt1l
         KdSV+XlDjsvoxBKtfM3WMJkyFle2PCjCwkhWHqm7sDoCuoNCmeRWpAWPws0Psc6/4NvY
         jQYHtT87TtgKTaX6JNUp8BkEXYivr5mnVSANRnzMB5M/MOlkWeDnO0llehjBYCcC1/Ry
         5v4+4iHpdVBvr9sdDF9TIfoT0C9F6muaKgSmrMvvPHgqMyQCkCixjMNgygn1DGeGRYF2
         VnbQ==
X-Forwarded-Encrypted: i=1; AHgh+Roay3s9ULTvHSxZb2kv5mkjhbOC0jdyGmk3PTupqYBX4Rr8xQ9YVq6rcVOBkuBzyTN0AdINYvlXHSqeTe4=@vger.kernel.org
X-Gm-Message-State: AFuF++l6dVRTn9npkirUnPLfEsZfjaavIeqvBpzPj+MhKib161AtjtlJ
	GEDKtdgQwAV/F933k0inHQtGvmodTjbuv4L6bI6mOfDQH2ODaAzup0ORJ7SsqUaVx2k=
X-Gm-Gg: AR+sD11zTjlNDhFxyiWlSHzqfaQpwPgkz9nbAU5FqkqOpMplkK7lBStwgk5toHYAYEm
	IkVjpb3/0u8C2Hj6RHjjdp+iS4COXHUXvumF4qsuIawvgBEVH4GXiCnNLadyZyPk0qDXkIwymAI
	p86P/tm5JJACUaRRKI/MFiyW/LfHHWPNWREjCuqYM+LIWUTFu4R6Imv8XQGmI1vpt2UAc1Uw1T7
	ToCQoYM3NGe4oof9HfNgaBZw/1WT1nJz45MdcmEk79yRxij7ZUdEeh5kmCJCkQHlVep9XeJsPmZ
	gIUyxAKgRYYrpW6v/ywwq114rBtSMFern+rZRaeAdskyVauPViAILicl0lV175isluKdcaU/Qbb
	iGCdQ+rNuwgx0+Qq9nyjLMvj4TFZVlkceJhJ0PbmD++qbOPje7mptPYEtYHhpML0ulE4efSJW5S
	C0s6UblajVCjKrLNQwMqTEA4Sd5AcQipH2fznncvnNtEdNu8Id1BZMB80tCNo=
X-Received: by 2002:a05:600c:c0c2:b0:49c:cbf4:572b with SMTP id 5b1f17b1804b1-49ccbf4575cmr112530775e9.2.1788185068963;
        Mon, 31 Aug 2026 07:04:28 -0700 (PDT)
Received: from localhost ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda36a53sm17432747a91.3.2026.08.31.07.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:04:27 -0700 (PDT)
Date: Mon, 31 Aug 2026 22:04:25 +0800
From: Heming Zhao <heming.zhao@suse.com>
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, ocfs2-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] ocfs2: validate suballoc slot of xattr and dir index
 blocks
Message-ID: <apWJxbUk2gk5Kq9o@p15>
References: <20260831062848.2743436-1-joseph.qi@linux.alibaba.com>
 <20260831062848.2743436-4-joseph.qi@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831062848.2743436-4-joseph.qi@linux.alibaba.com>

On Mon, Aug 31, 2026 at 02:28:47PM +0800, Joseph Qi wrote:
> ocfs2_validate_xattr_block() and ocfs2_validate_dx_root() do not
> validate xb_suballoc_slot and dr_suballoc_slot against the mounted
> filesystem's slot range.  Since xattr blocks and dir index root blocks
> are allocated from a per-slot suballocator at runtime, their suballoc
> slots must be within range.
> 
> Otherwise a corrupted image can carry an out-of-range slot.  When the
> xattr block or dir index is removed, ocfs2_xattr_block_remove() or
> ocfs2_dx_dir_remove_index() passes the unvalidated slot to
> ocfs2_get_system_file_inode() and get_local_system_inode() will either
> hit BUG_ON(slot == OCFS2_INVALID_SLOT) or compute an out-of-bounds
> index into the local_system_inodes array.
> 
> Reject out-of-range suballoc slots during validation.
> 
> Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>

LGTM, thanks for the contribution.
Reviewed-by: Heming Zhao <heming.zhao@suse.com>
> ---
>  fs/ocfs2/dir.c   | 14 ++++++++++++++
>  fs/ocfs2/xattr.c | 13 +++++++++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/fs/ocfs2/dir.c b/fs/ocfs2/dir.c
> index 0075e1624310..eb9850610ba3 100644
> --- a/fs/ocfs2/dir.c
> +++ b/fs/ocfs2/dir.c
> @@ -605,6 +605,20 @@ static int ocfs2_validate_dx_root(struct super_block *sb,
>  		goto bail;
>  	}
>  
> +	/*
> +	 * Dir index root blocks are allocated from a per-slot suballocator,
> +	 * so the slot must be in range.  Otherwise removing the index passes
> +	 * it to get_local_system_inode(), which hits BUG_ON() for
> +	 * OCFS2_INVALID_SLOT or computes an out-of-bounds index otherwise.
> +	 */
> +	if ((u32)le16_to_cpu(dx_root->dr_suballoc_slot) >= OCFS2_SB(sb)->max_slots) {
> +		ret = ocfs2_error(sb,
> +				  "Dir Index Root # %llu has invalid dr_suballoc_slot %u\n",
> +				  (unsigned long long)le64_to_cpu(dx_root->dr_blkno),
> +				  le16_to_cpu(dx_root->dr_suballoc_slot));
> +		goto bail;
> +	}
> +
>  	if (!(dx_root->dr_flags & OCFS2_DX_FLAG_INLINE)) {
>  		struct ocfs2_extent_list *el = &dx_root->dr_list;
>  
> diff --git a/fs/ocfs2/xattr.c b/fs/ocfs2/xattr.c
> index 0062cbeb1e8b..5acc8091d06f 100644
> --- a/fs/ocfs2/xattr.c
> +++ b/fs/ocfs2/xattr.c
> @@ -517,6 +517,19 @@ static int ocfs2_validate_xattr_block(struct super_block *sb,
>  				   le32_to_cpu(xb->xb_fs_generation));
>  	}
>  
> +	/*
> +	 * Xattr blocks are allocated from a per-slot suballocator, so the
> +	 * slot must be in range.  Otherwise freeing the block passes it to
> +	 * get_local_system_inode(), which hits BUG_ON() for
> +	 * OCFS2_INVALID_SLOT or computes an out-of-bounds index otherwise.
> +	 */
> +	if ((u32)le16_to_cpu(xb->xb_suballoc_slot) >= OCFS2_SB(sb)->max_slots) {
> +		return ocfs2_error(sb,
> +				   "Extended attribute block #%llu has an invalid xb_suballoc_slot of %u\n",
> +				   (unsigned long long)bh->b_blocknr,
> +				   le16_to_cpu(xb->xb_suballoc_slot));
> +	}
> +
>  	if (!(le16_to_cpu(xb->xb_flags) & OCFS2_XATTR_INDEXED)) {
>  		size_t region_offset =
>  			offsetof(struct ocfs2_xattr_block, xb_attrs.xb_header);
> -- 
> 2.39.3
> 
