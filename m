Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD27D348445
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991140; cv=none; b=SPlqxfmRbUj6cSYcYvFLJV9oaH4gxmpauPe4x64jf5ntFznqXlwCz9GVktXbwhCdk9HtXNZWl6KLPpofRnHO2MjVXnGK1HS6N1HeFXHWCGjpid4EEHg+Put2VKSBRDKQwdig4bnCvwlddN23Qc0ly4KIKMpt6dEblMubUrfCOAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991140; c=relaxed/simple;
	bh=Iqv7An2ELPabpUT7OVtm+I8Wass6AmEfu1El7+uJI7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgTdXKYtKszdzMYukfte93lt1NsdFr+7P0NLpBGR3xRlYNHw/f3hmol21XN+eTqz+/1wrckkrx4bQslRCHSPVdUsjWAU1cDKCqUx8lBEmEMx1a9yQZzzYSyNuQMtM+OU6TiRR1zoi3P78cDyhj2d/VTTC7lu0vukvUU0nkaeUvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PCp7kT0R; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PCp7kT0R"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c2af2ae1258so64398166b.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791991135; x=1792595935; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eap6P8yfIrxQOWUklCvJ8ok9fbtwgYdF5plY1PGn76k=;
        b=PCp7kT0R1nLGb+eUdl2agmNJALmTimkW3YK40i1Hk/IXqNdJ9L0FCzivflBZCz3Yu1
         dmJkK0C366SQSM5dZJ0QF8QkHOVezU9cbAUUC9ldLVdGfq3VizJBS26hkeJ3zudHH9hk
         98lP2Wilbd29ZHkoPyXva5qPJudH5oyt7Jr+bWkZll6AOlDu1CbFYLRpHHZLC1FE1Iuz
         f6Env5KVr+QFkR8CA3BGO0nGe+6SYKniHsMQFKXqJ5adARaKZPVZDw1iZ9hIErGBdLnd
         m6bDRqp/SICVcGfobWj2SHY1ApmZwEN0YtgB1G/EecywkmpB1wDUkGFTryTRbbZ/CHkj
         VR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991135; x=1792595935;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eap6P8yfIrxQOWUklCvJ8ok9fbtwgYdF5plY1PGn76k=;
        b=Pfi54mTvKKF9SHxaNUfxx1G+y5dsMTRz4mjZ9p+USdu8NvV7DfSh5v350gGyiqfS/v
         DyQtYwNKv9Y1ztmss3t13WTWdw2fZ3nCW4CM507dg8Ptk/wUkrLRZnF0cb08Wac+tAy/
         HuWk7Pv/8/9w6HEIp1Pdnd7Bz7sK5/CgNuhbwBFZer/ft6acXwONxduG4oMv574xztLs
         u4rylR24nzYNwbaJKh5RG4/cCCeWNeoFGD2NVoUduUtV6cVq7Y82VNJo+yeag5Jnp2qH
         uU5sV5V35UWjZfO+RFatE9xyruWCAYXS21AdIm5tKlMiGc2TXjSx9b6phPALv4VXDbtt
         gi7g==
X-Forwarded-Encrypted: i=1; AKwUvBwekewObBf0T4KVO3LCZcELVE/OZYERV/urJrSUP4oS0AhOAJ/x/yhX0SrlhY4g6A6ZnyQjLtW30xWt/t0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlU/iL7fV+Cv4mdJI7IL05pfwYrxL2l58O/vaCt3sJiajJhsI0
	TTUnLxMBgeR+Bc4BHyjnx4ycOTZZJMhygqZ4mM9CzBH30d8xNOTKxJofrY2SXPhD8Dc=
X-Gm-Gg: AYBFou1Pe2BH6BrYTfE0McHNWu75Tkez0BJh0sE7roaVZegWLuA7mDzrFD/9Da4mgRt
	kw3LJJ40qe2Bf5xw6AKU2fs5agjGdGsTPDbp0LvRaEP7MmY999r+Z1E+P61MofZXi+LEm20ehwy
	hsfWxJ1D7RctUhm9zyitXFWhLyhn5HST9MOzmTbkTS3wGaaFuIs1J0mryQ9Guk6HVy4MKrd/Z4a
	qbsN5yWhvKGUPQNYlYMDvr4gZ7s2WfQhlj9ezoxRczirFdwRNrSNSed8FRZvXZGdtTUQH4HHZ+3
	ChXsUkfcZuLWULfmU9+sN2J4bvjziGhGAtr5X78IrUY3xfZ/YLJBSBSq7qHcrdxCGK6nad8aLtV
	ZdjawZg58G+/uWCmSD5C3jzpADMMIs3eHaUJKPJ6DUOnFvaPegvj8idyi9OuiZjJKZMC2XL3pr5
	uvpu9JGymsx381ut4TkXqTn5SBLOlWgVvqxih6swdfgMsUiw79qDQYGRbBqLlKhwdTYP0Kg2PzS
	JXGEQ4=
X-Received: by 2002:a17:907:7fab:b0:c29:5637:ed76 with SMTP id a640c23a62f3a-c31a9d117ebmr1775364166b.2.1791991134891;
        Wed, 14 Oct 2026 08:18:54 -0700 (PDT)
Received: from localhost ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd61fc465c3sm1990361a12.27.2026.10.14.08.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:18:53 -0700 (PDT)
Date: Wed, 14 Oct 2026 23:18:50 +0800
From: Heming Zhao <heming.zhao@suse.com>
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, ocfs2-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ocfs2/dlm: hold the lookup reference across convert AST
 enqueue
Message-ID: <as-cs6Pxot8LavVG@p15>
References: <20261014112321.2955584-1-joseph.qi@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014112321.2955584-1-joseph.qi@linux.alibaba.com>

On Wed, Oct 14, 2026 at 07:23:21PM +0800, Joseph Qi wrote:
> dlm_convert_lock_handler() drops the reference it took when it found the
> lock on res->granted at its leave label, one statement before it calls
> dlm_queue_ast().  dlm_free_dead_locks() takes res->spinlock and drops the
> list and base references, so a peer death landing in that gap leaves the
> handler's own put as the one that frees the lock, and __dlm_queue_ast()
> then reads lock->lockres from freed memory.
> 
> The handler is registered next to dlm_create_lock_handler(), so a convert
> message buffered on a dying peer's socket arrives on the same o2net
> receive work that o2net_disconnect_node() does not wait for.  The two can
> interleave as follows, with the reference counts as they are before this
> fix:
> 
>   Socket data-ready       Node-down thread      Receive worker
>   -----------------       ----------------      --------------
>   o2net_data_ready()
>     select sc under
>     callback read lock
>                           o2net_disconnect_node()
>                             queue shutdown
>                             begin flush; new color
>     queue sc_rx_work
>     in the new color
>     release callback lock
>                             shutdown socket
>                             flush returns
>                                                 read buffered convert_lock
>                                                 dlm_convert_lock_handler()
>                                                   find lock on res->granted
>                                                   dlm_lock_get()  refs = 3
>                                                   lock res->spinlock
>                                                   __dlmconvert_master()
>                                                     call_ast = 1
>                                                   unlock res->spinlock
>                           DLM node-down cleanup
>                             lock res->spinlock
>                             dlm_free_dead_locks()
>                               unlink lock
>                               put list ref  refs = 2
>                               put base ref  refs = 1
>                             unlock res->spinlock
>                                                 dlm_lock_put()  refs = 0
>                                                   free lock
>                                                 dlm_queue_ast()
>                                                   __dlm_queue_ast()
>                                                   read lock->lockres
>                                                   (use-after-free)
> 
> __dlmconvert_master() only moves the lock between lists, so the count
> entering the gap is base, list and lookup.  Drop the lookup reference
> after the AST is queued instead of before it and the race ends with the
> one __dlm_queue_ast() took, which dlm_flush_asts() releases later with
> ast_pending cleared and ast_list unlinked.  No extra get is needed, and
> the normal case ends with the same count as before.
> 
> dlmconvert_master() has the same shape but is only reached from dlmlock()
> for a lock this node owns, which dlm_free_dead_locks() never matches.
> 
> Fixes: 2c5c54aca9d0 ("ocfs2/dlm: Add missing dlm_lock_put()s")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>

The code looks good to me.
Reviewed-by: Heming Zhao <heming.zhao@suse.com>

btw, how do you find the issue?

> ---
>  fs/ocfs2/dlm/dlmconvert.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/ocfs2/dlm/dlmconvert.c b/fs/ocfs2/dlm/dlmconvert.c
> index 450d46eefab32..8a828448ba958 100644
> --- a/fs/ocfs2/dlm/dlmconvert.c
> +++ b/fs/ocfs2/dlm/dlmconvert.c
> @@ -534,15 +534,19 @@ int dlm_convert_lock_handler(struct o2net_msg *msg, u32 len, void *data,
>  	}
>  
>  leave:
> -	if (lock)
> -		dlm_lock_put(lock);
> -
>  	/* either queue the ast or release it, if reserved */
>  	if (call_ast)
>  		dlm_queue_ast(dlm, lock);
>  	else if (ast_reserved)
>  		dlm_lockres_release_ast(dlm, res);
>  
> +	/*
> +	 * Keep the lock alive through AST enqueue: a concurrent
> +	 * dlm_free_dead_locks() drops the list and base references.
> +	 */
> +	if (lock)
> +		dlm_lock_put(lock);
> +
>  	if (kick_thread)
>  		dlm_kick_thread(dlm, res);
>  
> -- 
> 2.39.3
> 
