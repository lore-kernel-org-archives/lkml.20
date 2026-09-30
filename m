Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3D0456DF5
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790756064; cv=none; b=m6khGieTlloirxv3dJ94pYaUBn2iWm3zeXINBvGYWeT4rMs1qRJT3w6lj4ZhHxOnxIW/AECr4VffpK6VnZU5UwukYZJFm0iPLTQF0LsGlu7T6AyKvZ0T/5g7lZGsi6Rr7x1I4t7PousoU8zC1BrD0eOhZgGoG5k4svcoOnMs8wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790756064; c=relaxed/simple;
	bh=4sVvF5N0X04y82EiZvsck+TNhVspB5fM8AD0Kq/G1ec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEznoT7AIekJUHGQsR4kltd7VPIxajGewDUltib3FGMb+Qkltw3w+q7OrcGQbbAkZcJTW2dcqpSweVnumPfGSmIz5+BdVm5TQKsAm49lUIDuzRV9BQ/8Iq/CFeQh54AyALF5jjsHGyTnFGIYF8LRanlC7fqUnNXGGKqBqnQ4jUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhzkozVC; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhzkozVC"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a494638445so1319800a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790756062; x=1791360862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9SBW8K2oQrTXOHOneJy45UcoEEuUnutRwJ1mYqQQoWY=;
        b=PhzkozVCDwxfWuTOpMm3oWQC8+4Bh/vOzlwIFuZtWCGFLzpNl8T/XM+6QYwAY/QHdo
         jfSjHXq3KIiIYt7iRnDIO82Cr7C87cQKUoxdXn5EnmalxOh7feh7PCB1qHwxY8TfTunN
         4PjIIbuy0/h2joOnfprZt/l86gDC+Yu8L/2Elrd0Ern/opBQltgF9aaM8+YF14Sf6Bel
         0KszDZpZUvagD+NCy99RStOP2Oop79wmKvhq51vM+2yf1vEBeKcnD1DfB5OOHZyo2Drv
         7J1tAgwS38hSrSIpFUumwGzLADew7Y+Ba89CtPfOmgdp4xfQt2E1k1uHM8JTqQvPefWZ
         mm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790756062; x=1791360862;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9SBW8K2oQrTXOHOneJy45UcoEEuUnutRwJ1mYqQQoWY=;
        b=DMMLGcQb4VDzJoA+Y+kiLGE0FtLa0Iv4V6wwvNM0Df7KxZSN7lrWxrrOpv48wz3sT7
         jeyTvsKC68+7Ps4/o1EdLKTCPFd7FPutpt/kypLBIKzY1AQCbvCJVVIsDcb0OrzzV9hI
         hQbJUWHb4eNvzWMxY1vKu2dcpEbllCcR2v3RLmZAvJlBHMpSU6hbtnA8NJZIVuXnk4/m
         u7Bh2pnvquA8Kxhlf/x3TIBoSule0ciAsUaBAbbEQOUDIjS8nsIELZoA4l45oUFnkTCN
         VpHusI/b0TkFqt44sioPHHWDMnRYy9szbeoKiRKF3hsw/ZVvlxbIGPMfLH58OwE2B0/V
         4uXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrk71ERJ6jsH1rqhtewB1tQe3+6H+2oCi9q1slyfoPp2HdxdrEtycWuekjP6pvioDSsHYlw7OFMiyY2E4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4+u082lItwlURU7ukEIsAsKcUbvSe/aRm5LBoasJkxVwp+PGs
	ogrNjNXVu+9OU61oEvXTxJSb7WP3Gi/o5YSjVwrUDOR5Rqn8RUg/AFue5/8vNLkH
X-Gm-Gg: AYBFou14b0FGgjY3RN2ECrjLIsvopCal3G72UMzAZZAFp+WrxupumXAPRadIe90mD5u
	OkDeAMr7QfTTYYJK6twpcuQKhjfA0arBJdosivsdKFP3FQ94HjhcCzy/RZ3B0Fn0pU0rRj8Gg+7
	u3uZtbJU+L9O3SikkZsWM5kIS8RyFAN7E9t6hN3ptltStVam/WC8QfRNfpWTMlIHV8a6F6u2OPw
	l0PiyYTnm9mVNr7gSJr1h231lHm3Ua57m9cz8A+wy1oRJKy9dAg1awozVg9blh4CDQcVIYkawV8
	pL6gZqSEhLzfnso9hUJ4I5shiQIOCd6r0oCq95mUyEjyUKhTWTh4aowlFSbOZ9y4GEO/aIlUX8A
	8EQa8h8nPLKnFLg+txsQ1E6rKnuac/uPeEN2MKcAOrYe3yLLoww8FKTNQmX/WySp6vsEGx68ZAw
	IuB4SUAAEJNe13z4PsbUqj6N1VLYBO7yaVUwUR4qC1CKWzt/IlFnN+jmzm+Ln91188Jn8vM1s=
X-Received: by 2002:a17:90a:ec8f:b0:3a0:22bd:6ef6 with SMTP id 98e67ed59e1d1-3a4d0f03a1amr417944a91.2.1790756062115;
        Wed, 30 Sep 2026 01:14:22 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ce40a6d5sm1974462a91.15.2026.09.30.01.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 01:14:21 -0700 (PDT)
Date: Wed, 30 Sep 2026 17:14:19 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ntfs: balance the $MFT runlist lock in data
 extension error paths
Message-ID: <arzE28Mcte2g2-KW@hyunchul-PC02>
References: <20260930033556.169300-1-matthias.goergens@gmail.com>
 <20260930033556.169300-2-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260930033556.169300-2-matthias.goergens@gmail.com>

Hi Matthias,

On Wed, Sep 30, 2026 at 11:35:55AM +0800, Matthias Goergens wrote:
> ntfs_mft_data_extend_allocation_nolock() drops the $MFT runlist lock
> before allocating clusters, and every path into undo_alloc arrives
> without it, except a map_mft_record() failure, which takes it first.
> undo_alloc never releases it, so the lock leaks and the next $MFT
> extension and $MFT writeback hang.  The restore_undo_alloc failure
> path, on the other hand, releases the lock without holding it.  And
> undo_alloc frees the clusters with ntfs_cluster_free() and truncates
> the runlist without the lock, although both require it.
> 
> Enter undo_alloc without the lock on every path.  Under the lock, copy
> the new runs and truncate the runlist; after dropping it, free the
> clusters from the copy with ntfs_cluster_free_from_rl().  That keeps
> lcnbmp_lock outside the runlist lock, as the function documents.  Like
> the runlist merge failure above, this does not discard the clusters,
> which were never written.  If the truncation fails, the runlist may
> still reference the clusters, so they are not freed.  In that case, and
> if the copy cannot be allocated, the clusters stay allocated and the
> volume is marked for chkdsk.
> 
> A shorter fix would keep calling ntfs_cluster_free() on the live
> runlist without the lock, relying on $MFT's runlist being fully mapped
> and changed only by this function under mrec_lock.  That breaks
> ntfs_cluster_free()'s documented locking rule on an argument about the
> rest of the driver, so this patch does not do that.
> 
> Fixes: 115380f9a2f9 ("ntfs: update mft operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
> ---
> v2: do not free the clusters if ntfs_rl_truncate_nolock() fails
> (Hyunchul Lee).
> 
> Without this patch, a forced map_mft_record() failure gives "WARNING:
> lock held when returning to user space" for the $MFT runlist lock, and
> the next file create and $MFT writeback block on it.  A forced lookup
> failure in restore_undo_alloc gives "bad unlock balance".  With it, the
> create fails with EIO, lockdep stays quiet and the volume keeps working,
> also when the copy allocation is forced to fail.  With the truncation
> forced to fail, nothing is freed that $MFT's runlist still maps.  $MFT
> growth on a fragmented volume behaves as before.
> 
>  fs/ntfs/mft.c | 59 ++++++++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 51 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
> index e01e367a588d..8edc65911aa2 100644
> --- a/fs/ntfs/mft.c
> +++ b/fs/ntfs/mft.c
> @@ -1764,6 +1764,36 @@ static int ntfs_mft_bitmap_extend_initialized_nolock(struct ntfs_volume *vol)
>  	return ret;
>  }
>  
> +/*
> + * ntfs_mft_copy_tail - copy the runs of a runlist from a vcn onwards
> + * @rl:		runlist to copy from
> + * @vcn:	first vcn to copy
> + *
> + * Return a terminated copy of the runs of @rl covering @vcn and everything
> + * after it, NULL if there are none, or ERR_PTR(-ENOMEM).  The caller must
> + * hold the runlist lock and free the copy with kfree().
> + */
> +static struct runlist_element *ntfs_mft_copy_tail(struct runlist_element *rl, s64 vcn)
> +{
> +	struct runlist_element *end, *copy;
> +	s64 delta;
> +
> +	rl = ntfs_rl_find_vcn_nolock(rl, vcn);
> +	if (!rl || !rl->length)
> +		return NULL;
> +	for (end = rl; end->length; end++)
> +		;
> +	copy = kmemdup(rl, (end - rl + 1) * sizeof(*rl), GFP_NOFS);
> +	if (!copy)
> +		return ERR_PTR(-ENOMEM);
> +	delta = vcn - copy->vcn;
> +	copy->vcn = vcn;
> +	copy->length -= delta;
> +	if (copy->lcn >= 0)
> +		copy->lcn += delta;
> +	return copy;
> +}

Would it be worth considering preserving the rl2 returned by 
ntfs_cluster_alloc(), instead of re-allocating the tail with
ntfs_mft_copy_tail() during rollback.

It can avoid the runlist scanning and kmemdup(). I think that we could 
introduce a variant of ntfs_runlists_merge() to preserve the source
runlist.

> +
>  /*
>   * ntfs_mft_data_extend_allocation_nolock - extend mft data attribute
>   * @vol:	volume on which to extend the mft data attribute
> @@ -1791,7 +1821,7 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
>  	s64 min_nr, nr, ll;
>  	unsigned long flags;
>  	struct ntfs_inode *mft_ni;
> -	struct runlist_element *rl, *rl2;
> +	struct runlist_element *rl, *rl2, *tail_rl;
>  	struct ntfs_attr_search_ctx *ctx = NULL;
>  	struct mft_record *mrec;
>  	struct attr_record *a = NULL;
> @@ -1904,7 +1934,6 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
>  	if (IS_ERR(mrec)) {
>  		ntfs_error(vol->sb, "Failed to map mft record.");
>  		ret = PTR_ERR(mrec);
> -		down_write(&mft_ni->runlist.lock);
>  		goto undo_alloc;
>  	}
>  	ctx = ntfs_attr_get_search_ctx(mft_ni, mrec);
> @@ -2015,7 +2044,6 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
>  		write_unlock_irqrestore(&mft_ni->size_lock, flags);
>  		ntfs_attr_put_search_ctx(ctx);
>  		unmap_mft_record(mft_ni);
> -		up_write(&mft_ni->runlist.lock);
>  		/*
>  		 * The only thing that is now wrong is ->allocated_size of the
>  		 * base attribute extent which chkdsk should be able to fix.
> @@ -2026,15 +2054,30 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
>  	ctx->attr->data.non_resident.highest_vcn =
>  			cpu_to_le64(old_last_vcn - 1);
>  undo_alloc:
> -	if (ntfs_cluster_free(mft_ni, old_last_vcn, -1, ctx) < 0) {
> -		ntfs_error(vol->sb, "Failed to free clusters from mft data attribute.%s", es);
> -		NVolSetErrors(vol);
> -	}
> -
> +	/*
> +	 * Entered without the runlist lock.  Take the new runs off the
> +	 * runlist under it, and free their clusters from a copy once it is
> +	 * dropped, as lcnbmp_lock nests outside it (see above).  If the
> +	 * runlist cannot be truncated or the copy cannot be allocated, the
> +	 * clusters stay allocated until chkdsk.
> +	 */
> +	down_write(&mft_ni->runlist.lock);
> +	tail_rl = ntfs_mft_copy_tail(mft_ni->runlist.rl, old_last_vcn);
>  	if (ntfs_rl_truncate_nolock(vol, &mft_ni->runlist, old_last_vcn)) {
>  		ntfs_error(vol->sb, "Failed to truncate mft data attribute runlist.%s", es);
>  		NVolSetErrors(vol);
> +		/* The runlist may still reference the clusters, so keep them. */
> +		if (!IS_ERR(tail_rl))
> +			kfree(tail_rl);
> +		tail_rl = NULL;
> +	}
> +	up_write(&mft_ni->runlist.lock);
> +	if (IS_ERR(tail_rl) || ntfs_cluster_free_from_rl(vol, tail_rl)) {
> +		ntfs_error(vol->sb, "Failed to free clusters from mft data attribute.%s", es);
> +		NVolSetErrors(vol);
>  	}
> +	if (!IS_ERR(tail_rl))
> +		kfree(tail_rl);
>  	if (mp_extended && ntfs_attr_update_mapping_pairs(mft_ni, 0)) {
>  		ntfs_error(vol->sb, "Failed to restore mapping pairs.%s",
>  			   es);
> -- 
> 2.55.0
> 

-- 
Thanks,
Hyunchul
