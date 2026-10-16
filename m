Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF41331A43
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792124286; cv=none; b=Tb3UaSRdi55Cesp/ASBpt/9fhcCapxHFCGlqgV7CE0pFjxz3WmhXTwHlUII5HorJi+1lu6z3ik8oE+bmyVUec2GepXO9XIozo258B/U74Wv+uFIlLYpaZXe0y2WgkgHCGVPtykjD6lViDmaaIdInT6ilT4kDGzUQc3DR3wa2AIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792124286; c=relaxed/simple;
	bh=bszKIuYos4/4nZ7PF45CtUCaMdKhDYhnKMxRNu1coKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ub1gfVywhtGE+bGTe7ZcXaGjMaVB5PuILqQj6sVPKMLjF91B2tgLs1ks97lwSptBBL6wXZuuS97y8rMdgh9AiRc+WQM3or2WUhAOL9QvJRIWVuDQVkewTHc+MpMpf+N7uesjPHZV0Ob913XAdpJuuqjEgvfVWPtg4Lbsk5AW1Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hE1pyWNZ; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hE1pyWNZ"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4f512029e45so1323140b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792124284; x=1792729084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gqgNfUlX3mCkm0/h/3yH5iAcgC/iBbjyQr+ygOjQ+Ok=;
        b=hE1pyWNZ4KQBhDLFo3yvBKSwwEacqrgNrEydNfl4DuDH/efNZgO8NDZ1JNG415wNZ+
         j9/k3lS3tCMFsifmIx2UE/IY7f//5jCBhE6VSWvvD+HWYo69GL1Vfiol3FgHFf/kJZj6
         daTMa5OShAORdxj6wYdL/q4HkJneDqKha0+KXk9f8XPflFOAQiKS1H6YXJ9MVTDvz71Z
         QxhMQnME/6raXr8behqeHfRmR9Ezsi/bti8PHlgjcyv3+3pxJ5MNVF5t66EYWLnbTVN+
         UYbmySp5uAab4C3vX6VO5OzloHZIcCa4ZqpFDsVTlN/lpl7KTnbtMjIXCeJQTxr+gjkb
         WEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792124284; x=1792729084;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gqgNfUlX3mCkm0/h/3yH5iAcgC/iBbjyQr+ygOjQ+Ok=;
        b=x/M3cPSoy2ROywG+22q+26EJAqmZCAUSwMF7bpMbTi2GgdBCY4r6URgsf6LJ9DH2Xo
         ML1/P9mzq2AIZ/94NkK23Na97H/7X9+yBPq4DVCvrTLGvyJlAwUhRywJ6lT8FfeB+UQB
         JrHPqagpdwW7ll+7TNTy+86Y2fXTgq+D9LMxb7Ma8tXZUU2eWw5xolBak+zLoFhFNrR+
         CMxwRU3hQoI7+kRgtTQRaX0lsYbGqymRnirDj33PoncXGJreo8C+HNVZ5r5T49y6d0mW
         WZDv0aA7TJ1wKK7t2jzUmye9Ub+cxmv5rxrqWxpnFCcUNdJ/sNXIlqW1GPPGM7IR+vqj
         nWxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzY1QZ28to9xP0OogCGWcHg/OKpmGuvVyvDJy2MMF94U9+W1udSzB31JSi+WrS8u0+szGykSfoHXjO8WfA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJorDM90GvrVsL33pGo7eCX9qm5tzWZ/EdXlRssPkH+kndOwnmb
	0E6+V/haZNC62mEYX3WUzeMmr/BRPKWXO40xkTo6YbHIP5r+MABJQvX6
X-Gm-Gg: AYBFou0DoxLK7ExWJeVCzN9xBj65AXDxjrB+bXzPbrss2XnAQREp4NxM13/Mnz0WgAL
	eP3Y1iFGHoq5ojdm4XNBW+hPmKTP/cp9Jxqu8E55RI5UFvqJ87VlFnQqHKSzuglhAOJHgSdt4i7
	txKDJVhxrKx9Ljddl5n5DZezyrAv4hd331Jmtpo1nnWr/KTDxdr1694/hru2iyBqB49i/Y2/CRY
	l3rMWmsxsAhTYp73cP9KbeX/yyUNWxtJGhIHkle9Rwq4oeIge6hTYDFXzlfU8qOtT3erRsAEpiD
	9ZDKOe6rOfHoHBqB7WvZL4TZO6jZQYFEcqfB6NKo/YjczgS0YPDSVoCtkrDrN/LLDi77pPLRKZY
	DVSQab2DjrvWALV8+1SaxoqRVArvQXdaIeqRhF59c84ynwPcanAmF7iETh5m1GUW077d2/0jMR+
	SI6JxUSCJxzWpDqYGAmc0xZEJCE8Nnv07dWJPA52aMfr+4C590gwRQsS/InN74soPEFO4vtNUQa
	fgxxkdoYgh9lp5Bdo5NM9em+KE28hlLg9AH2SJMulv50yIK6mGX8QdO88Lmz46HYwV7DoQYlVil
	vPufXm+n4uc9aQ==
X-Received: by 2002:a05:6808:19a9:b0:4b9:e65b:8c33 with SMTP id 5614622812f47-50c54177b94mr21799531b6e.33.1792124283942;
        Thu, 15 Oct 2026 21:18:03 -0700 (PDT)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388c163591sm643029b6e.7.2026.10.15.21.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:18:03 -0700 (PDT)
Date: Thu, 15 Oct 2026 23:17:55 -0500
From: Ming Lei <tom.leiming@gmail.com>
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Yu Kuai <yukuai@fygo.io>,
	Hannes Reinecke <hare@suse.de>,
	"Martin K. Petersen" <mkp@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] blk-mq: share one tags_srcu instance across all tag
 sets
Message-ID: <atGlc3-aaLfIHJH4@fedora-laptop>
References: <20261001-bug-blk-mq-global-tags-srcu-v1-0-e8415da10d1b@gmail.com>
 <20261001-bug-blk-mq-global-tags-srcu-v1-1-e8415da10d1b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-bug-blk-mq-global-tags-srcu-v1-1-e8415da10d1b@gmail.com>

On Thu, Oct 01, 2026 at 05:17:50PM +0800, Qiliang Yuan wrote:
> Freed request pages and flush queues are handed to call_srcu() so that
> concurrent tag iterators never see them disappear. Each tag set embeds
> its own srcu_struct for this, which blk_mq_free_tag_set() has to drain
> with srcu_barrier() before cleanup_srcu_struct(). The barrier waits for
> a full SRCU grace period even when the callbacks are long done, adding
> 1-3 ms to every tag set teardown. Drivers that free tag sets under a
> lock make it worse: ublk does it under the global ublk_ctl_mutex, so
> deleting devices from many threads serializes on that grace period.
> 
> The callbacks free memory that only blk-mq owns. They touch neither
> the tag set nor driver code, so they don't need a per-set domain.
> Replace the per-set srcu_struct with a single global one. Freeing a tag
> set no longer waits for a grace period, and each tag set no longer
> allocates per-CPU SRCU state. The read side is unchanged. The only cost
> is that a long-running iterator can now delay these frees for other tag
> sets too, which only postpones freeing memory.
> 
> On 7.3-rc5 in a 16-vCPU VM, with 1 queue and depth 16 per ublk device,
> median of 3 runs (5 for the 16-thread null_blk case):
> 
>                                        before     after
>   ublk DEL_DEV p50, serial             3.45 ms    0.17 ms
>   ublk delete 1000 devices, serial     19.5 s     14.9 s
>   ublk delete 4000 devices, 16 thr     19.0 s     2.9 s
>   null_blk destroy 500 devs, serial    9.97 s     9.25 s
>   null_blk destroy 256 devs, 16 thr    5.15 s     4.30 s
> 
> Fixes: ad0d05dbddc1 ("blk-mq: Defer freeing of tags page_list to SRCU callback")
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>

Reviewed-by: Ming Lei <tom.leiming@gmail.com>


Thanks,
Ming
