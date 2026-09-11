Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496BB351C1C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117472; cv=none; b=bGomHWuQHg0equDtPErzQWKqP1BncJXkpb/GL9kDSTvkEb7Cdb3GByqeDAouQvHe4y94VJehEC1mGFSGJEtESAU/xFdny04/xb0dONgFUzlg16sikuVg33RFmoaLOqCrUq+EQ6FTEfcYr6HfN9G8Vo6UCoMe1SC7QTy8eiq/rIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117472; c=relaxed/simple;
	bh=KvvuvPvWehkYeZlj7qYcCRLz/S2Fb6h0VkqoZJx0o7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJos9p2OfymL6lLNFNflzs52ScN48q6ZkPnDD1zvcLtgyYhq78+Kk60CgZb3v2OQ9T5/fw2z+VGNDjU+URW3tIz9CcG9ADB8jCCvILExXSLf78sKGXq5NfxS1Ts9B2RsUul2kOkvOhsAhc7yifLlHuLe5JvReLOBpkxhrbhjDpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X6UT1K3T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X6UT1K3T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C50151F000FF;
	Fri, 11 Sep 2026 09:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789117471;
	bh=zOh6HJdMwOyTwZPThgM3pF9JLFydCnhX2MD4wVhVW0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X6UT1K3T5SbYG/rLj0gMA02IPCU01iBO1JHmb8RCBy7pJLmK61AytsictaaG3n1LB
	 VjvNx+RpILLQJ9mKHcX2XRgQaJLizY1IjRgDA4Aty3ZnmGzvyg7RHCFHKcz+3Hd6Vb
	 u44I15tPMRaNThU0IKhW8Ue+fsELZd0tfvDBV/ER5eEdk9k83kOf5apVGz+d4fTANe
	 Xqj6KHCW/wSd0D4D/JSdkBX4ZQOYr8QJX/elKMvIqQ1i02p9xmXaJCfqntN8MgQhi0
	 0lTau+Ue99Jz4BUOPSaPAaXX17VHKl4mTnIJTHVllSNuj6aoQrJiqRNdMsiYwKm3H9
	 tNNDrXkSYP0jw==
Date: Fri, 11 Sep 2026 10:04:26 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: xu.xin16@zte.com.cn
Cc: akpm@linux-foundation.org, david@kernel.org, surenb@google.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, chengming.zhou@linux.dev
Subject: Re: [PATCH 3/4] mm/ksm: make break_ksm() more scalable
Message-ID: <aqPCapAzJPqDUh-f@gremlin>
References: <20260911160421076_KNXun8Mpp9Xj7fxHG0i7@zte.com.cn>
 <20260911161210082WKOqK1dumByDY7jeEOdPF@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911161210082WKOqK1dumByDY7jeEOdPF@zte.com.cn>

On Fri, Sep 11, 2026 at 04:12:10PM +0800, xu.xin16@zte.com.cn wrote:
> From: Xu Xin (ZTE) <xu.xin@linux.dev>
>
> Currently the last argument 'walk_lock' of break_ksm() is used to
> indicate whether the page_walk is protected by mmap_read_lock or
> mmap_write_lock. If 'walk_lock' is true, we suppose its context to
> be under mmap_write_lock() protection, then mark it PGWALK_WRLOCK and
> make its vma be write-locked during the walk; If 'walk_lock' is
> false, we suppose its context to be mmap_read_lock(), then mark it
> PGWALK_RDLOCK.

I thnk this whole block is unnecessary. You're basically writing what the code
does in English

>
> This change is prepared for the latter patch to enable VMA

Latter -> later.

And it's the patch I'm not cc'd on so I don't see unless I go do a bunch of
stuff to try to download it... great :)

> read-locking where break_ksm() might be under the third new proctecion
> way: VMA read-locking, so we have to replace the boolean variable to
> the enum 'page_walk_lock', but without any function changed.

You don't, this is just horrible.

>
> No functional change intended.
>
> Signed-off-by: Xu Xin (ZTE) <xu.xin@linux.dev>
> ---
>  mm/ksm.c | 21 ++++++++-------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
>
> diff --git a/mm/ksm.c b/mm/ksm.c
> index 8df66b4e5de0..dda105681d7f 100644
> --- a/mm/ksm.c
> +++ b/mm/ksm.c
> @@ -660,16 +660,11 @@ static int break_ksm_pmd_entry(pmd_t *pmdp, unsigned long addr, unsigned long en
>  	return found;
>  }
>
> -static const struct mm_walk_ops break_ksm_ops = {
> +static struct mm_walk_ops break_ksm_ops = {
>  	.pmd_entry = break_ksm_pmd_entry,
>  	.walk_lock = PGWALK_RDLOCK,
>  };
>
> -static const struct mm_walk_ops break_ksm_lock_vma_ops = {
> -	.pmd_entry = break_ksm_pmd_entry,
> -	.walk_lock = PGWALK_WRLOCK,
> -};
> -
>  /*
>   * Though it's very tempting to unmerge rmap_items from stable tree rather
>   * than check every pte of a given vma, the locking doesn't quite work for
> @@ -696,11 +691,11 @@ static const struct mm_walk_ops break_ksm_lock_vma_ops = {
>   * protection keys here anyway.
>   */
>  static int break_ksm(struct vm_area_struct *vma, unsigned long addr,
> -		unsigned long end, bool lock_vma)
> +		unsigned long end, enum page_walk_lock walk_lock)

Ugh yuck this is horrible, you're exposing internal page walker state here as a
parameter...?

And then this commit makes it possible for any walk_lock to be passed but then
you change none of the code to handle it?

>  {
>  	vm_fault_t ret = 0;
> -	const struct mm_walk_ops *ops = lock_vma ?
> -				&break_ksm_lock_vma_ops : &break_ksm_ops;
> +	struct mm_walk_ops *ops = &break_ksm_ops;
> +	ops->walk_lock = walk_lock;

Are you sure this can't be run concurrently by two walkers?

I didn't see any arguments about that in the commit message. Having a single,
static, struct where you change the walk_lock is gross.

What would be better is to have your own enum that lists ksm lock state or
express it some other way, then if possible have it on the stack otherwise
ensure that state can't be corrupted.

Again, if you'd sent me 4/4 too I could see the overall structure and give
advice but...

>
>  	do {
>  		int ksm_page;
> @@ -807,7 +802,7 @@ static void break_cow(struct ksm_rmap_item *rmap_item)
>  	mmap_read_lock(mm);
>  	vma = find_mergeable_vma(mm, addr);
>  	if (vma)
> -		break_ksm(vma, addr, addr + PAGE_SIZE, false);
> +		break_ksm(vma, addr, addr + PAGE_SIZE, PGWALK_RDLOCK);
>  	mmap_read_unlock(mm);
>  }
>
> @@ -1245,7 +1240,7 @@ static int unmerge_and_remove_all_rmap_items(void)
>  		for_each_vma(vmi, vma) {
>  			if (!(vma->vm_flags & VM_MERGEABLE) || !vma->anon_vma)
>  				continue;
> -			err = break_ksm(vma, vma->vm_start, vma->vm_end, false);
> +			err = break_ksm(vma, vma->vm_start, vma->vm_end, PGWALK_RDLOCK);
>  			if (err)
>  				goto error;
>  		}
> @@ -2885,7 +2880,7 @@ static int __ksm_del_vma(struct vm_area_struct *vma)
>  		return 0;
>
>  	if (vma->anon_vma) {
> -		err = break_ksm(vma, vma->vm_start, vma->vm_end, true);
> +		err = break_ksm(vma, vma->vm_start, vma->vm_end, PGWALK_WRLOCK);
>  		if (err)
>  			return err;
>  	}
> @@ -3037,7 +3032,7 @@ int ksm_madvise(struct vm_area_struct *vma, unsigned long start,
>  			return 0;		/* just ignore the advice */
>
>  		if (vma->anon_vma) {
> -			err = break_ksm(vma, start, end, true);
> +			err = break_ksm(vma, start, end, PGWALK_WRLOCK);
>  			if (err)
>  				return err;
>  		}
> --
> 2.25.1

--
Cheers, Lorenzo
