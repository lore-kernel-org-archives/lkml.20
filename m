Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AECF3624A8
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790571675; cv=none; b=AWJ2RdBXRbPbCzoGIqRXNj1dZUfRMG1MlzFqpUgfdoCWWHXNejYdKmi+A6gatv8ZZqieTq8AjgynWr5Fr/7ZasSn7FOQVQppS/HcrWlG3w37B0WYGSqO0XMAr5WsjWmULQHxQu/KUa9CcXbvhLMq0YRFxV9whlLt3Z0nFY37Tlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790571675; c=relaxed/simple;
	bh=0yV1JZGhIadJQ1R+MCpQcm51zAutz9fB71g8gd4WYAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEtysdufFFzj5wNf8h01rh34kFgaNQUqFqAgGqbSZJoN6Qzx0n9Iz9xhS76AgSMFXu1hWPhE4IpMNtvaaEgZ9v3clkehTsV/UtgZFG5+bbavQX9XTgIhPomiKy7AOha9VqB6yAHf5/kN6uXjz6TC5EIjbqErnKTTS2hLzbCvzGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVYF7w90; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVYF7w90"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccc02279so1433988a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790571673; x=1791176473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NgGjrZbQCm/J8GjAoOxEZlUVMDLBVAyGN67PqiCaZgA=;
        b=jVYF7w90+AJgNUM+u1Dq7uegRey/6LYKKGfbyz2LvGQ1ZqutQV9KTmKKb3TsmvYzf1
         EVqU2AntLFWGdFDDskMKhm/cifDXHT3W3WG3+IHWtfbfRmKIHZuM1rRFlS4fUybywquT
         XA8AtcVwMpbgoqWeSoSMWnfhd7pGs3OrL5uvpgoAOUVG0v33iM0cWPzqupriscKL8WI8
         nG2LDLpc88jGbx9fGrxGQpanQ8hLdh8viCrM0/3iWQXg50CgSEYuri8dZnmvzZIhqTTO
         zzhFld+EYIE+upHWGqbcu6CcUVeAdgmA2j68vqcrsJ/13GBU9k9kKZFSNRX3SQXa1AYE
         LtiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790571673; x=1791176473;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NgGjrZbQCm/J8GjAoOxEZlUVMDLBVAyGN67PqiCaZgA=;
        b=kJB5c5y4l7XCCtk3NBOGwRoQixT0mua9H6SVXArY+EO4sqrg0/VhRI/jrn2Wnt10dK
         JMBPOVrh07rH6VFj9WL+LKr3nGAzz69a85Jynl8oAQTus8Jkh7tgTQY2gRk2ErS6w1bM
         NKeBlx1rb7mVldkBsxbhxL9vcUchA5ag5clU0/HbooNe9WUTjVzsQqwrq1qmHe5/Rzm9
         WJev/JMzhjB7Yj3OfPrTxZODJ7bfuBl0lTyj94ger2XQaWOYf10ARxLn4b48vuZPKg6H
         m5LYTZxMPAB4e5ybafUKekJ4owp3LNWqfQpMchJcCy4115sO1vEUuO6MOQk32q8ypohJ
         u+2w==
X-Forwarded-Encrypted: i=1; AKwUvBz6jeYcqfWCrF1RZq1Etm97H0waBkV1g6D6bnX2Vnh1C/zZ4Upsl9ZzYoeDZ7FCGs0du9pWNYNq8VpxTU8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsi5QnBKoxoEBCIFR5ZlJk/OTMix7PPzGv8fDkDgOG/kRWnjEj
	1xhA0J+SfSLFo+QkzbPeMHFWvnY3lcV3q1lP9++FKgWl1JtEFGL9OlFI
X-Gm-Gg: AYBFou1GqjMVvgu70Ij4nUuuvSz7V09jZJcd+X/1r+Ins3jpBsHtL5wGlt6MX94f18G
	we2vphtRAqs9jlFOBB81JJWLRCo7ZdfFXC4qkjoa8rKO55Kv5kb3YNku6JvKQiv3QZzlwMt5TtB
	EWmzGZtIxtmSfAIk+JKLujdz+9zAufcXTk0p/MiVeXm6g/Gps/4C4+jJ/wiKIwUwKOKKJkBP1Nh
	CsBi3aGs1GD8f7waBD4Q0uazJpUsx/XVBV2XHHf5e5PW9HN7CPA+01QEct/wjoG6BK4KrObqCyL
	EnFODDrOVqjN2x+BEJAWaLvIgYuyeoYH8oIyV0INUp9Ic3xZ9q+xklCa7e3FXMsYNRDUxx4/p0k
	KV7ZMB25+qJTZIRhR/OlSdm4U2PQ4F0XOPQffc7vBRxQmdJXw4/bwdjwZGZLKKlMpHDhE2DZWFq
	S3rLsNLZe9A9b6drjkJ3QhviGShXGx4ZhCr89IaQRy5M7+rNPxUKHt3xPLQWfRXw==
X-Received: by 2002:a17:90b:55d0:b0:3a0:4066:d3b0 with SMTP id 98e67ed59e1d1-3a098e560e0mr10125380a91.59.1790571673074;
        Sun, 27 Sep 2026 22:01:13 -0700 (PDT)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972f111csm24600945a91.2.2026.09.27.22.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 22:01:11 -0700 (PDT)
Date: Mon, 28 Sep 2026 14:01:09 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ntfs: balance the $MFT runlist lock in data
 extension error paths
Message-ID: <arn0lRtG96tfxPOE@hyunchul-PC02>
References: <20260927105706.3111333-2-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260927105706.3111333-2-matthias.goergens@gmail.com>

On Sun, Sep 27, 2026 at 06:57:05PM +0800, Matthias Goergens wrote:
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
> which were never written.  If the copy cannot be allocated, the
> clusters stay allocated and the volume is marked for chkdsk.
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
> Without this patch, a forced map_mft_record() failure gives "WARNING:
> lock held when returning to user space" for the $MFT runlist lock, and
> the next file create and $MFT writeback block on it.  A forced lookup
> failure in restore_undo_alloc gives "bad unlock balance".  With it, the
> create fails with EIO, lockdep stays quiet and the volume keeps working,
> also when the copy allocation is forced to fail.  $MFT growth on a
> fragmented volume behaves as before.
> 
>  fs/ntfs/mft.c | 54 +++++++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 46 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
> index e01e367a588d9..58676042444b6 100644
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
> @@ -2026,15 +2054,25 @@ static int ntfs_mft_data_extend_allocation_nolock(struct ntfs_volume *vol)
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
> +	 * dropped, as lcnbmp_lock nests outside it (see above).  If the copy
> +	 * cannot be allocated, the clusters stay allocated until chkdsk.
> +	 */
> +	down_write(&mft_ni->runlist.lock);
> +	tail_rl = ntfs_mft_copy_tail(mft_ni->runlist.rl, old_last_vcn);
>  	if (ntfs_rl_truncate_nolock(vol, &mft_ni->runlist, old_last_vcn)) {
>  		ntfs_error(vol->sb, "Failed to truncate mft data attribute runlist.%s", es);
>  		NVolSetErrors(vol);
>  	}
> +	up_write(&mft_ni->runlist.lock);
> +	if (IS_ERR(tail_rl) || ntfs_cluster_free_from_rl(vol, tail_rl)) {

If ntfs_rl_truncate_nolock() fails, we must not call
ntfs_cluster_free_from_rl(), because mft_ni->runlist may still reference
those clusters.

> +		ntfs_error(vol->sb, "Failed to free clusters from mft data attribute.%s", es);
> +		NVolSetErrors(vol);
> +	}
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
