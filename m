Received: from mta0.migadu.com (out-211.mta0.migadu.com [91.218.175.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6FE3F7AAB
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789449773; cv=none; b=aCGWCplBPNRFCxIUums23SeeA7aMZt62l57G34AfcUA6nKonMZWQeoDW8rDoDPio5G52QGVfNlD8NTytSfJ7RzOPtuVRUNozDauzsv2kURxyx7jGwHNgsXRGJHjX+qNu+07Ugphq5e/1MHzzgF7nA33Bp3p0bkX40Op+IZSSoUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789449773; c=relaxed/simple;
	bh=njbyAGe9sVIfrxx3rQdN/BfT/8E/nBGlOZNoa510jIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JtTMS5PuK7444ZuHWdcuty6vbzOxP4dsZtKxLzL85MwCctt2qwQbkOlaPR8d6dESTuhVbhexlTflEVCdG1bhS9688MeoIpJlSGW0FKR3ydyg1OdJ7UwPXOD6RQh+oCt54t/Kw/UwB/PhfkqCmz6lmfsYLwE/tL+8TfJhmdZ9FHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=J1byXJmy; arc=none smtp.client-ip=91.218.175.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="J1byXJmy"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=njbyAGe9sVIfrxx3rQdN/BfT/8E/nBGlOZNoa510jIU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789449766; v=1; x=1790054566;
 b=J1byXJmyxc3m0w76zlTnWiX7Vh6LO64eYWnSoEznnBuKJpvuQvH4eRjMuZC8C91CUVfD4WLJ
 JW+HE3H1PcdldgTW3tyCkEaueTKK4SKMAy4fvjFW0+v9UPWuICqawBefw3WZWuAOkUYANnaZiyf
 xlEwrWN+Y5BOpngi2sXEDnAM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 5c2feea308c47c3f;
	Tue, 15 Sep 2026 05:22:36 +0000
X-Mizu-Trace-ID: 5c2feea308c47c3f
X-Migadu-Flow: FLOW_OUT
Date: Tue, 15 Sep 2026 13:22:26 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan He <hebaoquan@kylinos.cn>, hannes@cmpxchg.org, yosry@kernel.org,
	nphamcs@gmail.com, chengming.zhou@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kasong@tencent.com, chrisl@kernel.org
Subject: Re: [PATCH] mm: zswap: return -ENOENT when the swap device is gone
Message-ID: <aqjWElGYfZWUZmV3@fedora>
References: <20260913063031.1689420-1-hebaoquan@kylinos.cn>
 <20260913005149.a28c21aaca165fa0255f8475@linux-foundation.org>
 <aqeUyxJmzC397G7j@fedora>
 <20260914211658.644e5b9b61405f4a9460b8df@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914211658.644e5b9b61405f4a9460b8df@linux-foundation.org>

On 09/14/26 at 09:16pm, Andrew Morton wrote:
> On Mon, 14 Sep 2026 14:31:39 +0800 Baoquan He <baoquan.he@linux.dev> wrote:
> 
> > > 
> > > >  	si = get_swap_device(swpentry);
> > > >  	if (!si)
> > > > -		return -EEXIST;
> > > > +		return -ENOENT;
> > > 
> > > mm-new has changed.  I made this
> > 
> > Thanks. Does it need a v2? or just use ther version you tuned.
> 
> I fixed it up while fixing the rejects, I hope.  Below.

Thanks. The last paragraph of patch log need be adjusted as shown at bottom.

> 
> > By the way, which mm branch is suggested to take as a base for mm
> > patches posting? I usually take mm-unstable branch, seems it's changed
> > to mm-new now?
> 
> mm-new is a front-end to mm-unstable.  The only difference is that
> mm-new isn't included in linux-next.  New material goes into mm-new and
> if it hasn't caused any disasters for a few days I'll move it into
> mm-unstable and hence linux-next.
> 
> Ordinarily there isn't much material in mm-new.  At this moment
> mm-unstable has 405 patches and mm-new has another 96.  That 96 is
> unusually large because people have been sending huge patchsets today.
> 
> So mm-new is the best target for my merging pleasure but it is surely a
> pain for ongoing development - it's changing at a great rate.  Those
> 500 patches landed in 15 days.
> 
> I suggest a reasonable process is, approximately, to develop against
> mainline (or mm-stable if there's anything in it) until you think the
> code is ready for mm.git.  Then rebase/retest against mm-new and send
> it out.  But keep an eye on what's happening in mm.git so that the
> rebasing doesn't cause nasty surprises.

It's very clear to me now, thanks a lot for the detailed explanation.

> 
> 
> 
> From: Baoquan He <hebaoquan@kylinos.cn>
> Subject: mm: zswap: return -ENOENT when the swap device is gone
> Date: Sun, 13 Sep 2026 14:30:31 +0800
> 
> zswap_writeback_entry() returns -EEXIST when get_swap_device() finds no
> device.  -EEXIST is the shrinker's "page already in swap cache" signal,
> which makes zswap_shrinker_scan() stop shrinking entirely.  A NULL
> get_swap_device() instead means the device is being swapped off, so the
> entry is simply stale.
> 
> Return -ENOENT so the shrinker skips the stale entry and keeps scanning.
> Independent of xswap; affects all swap devices.
                ~~~~~
The term xswap sneaks into log while it's an ongoing feature. The last
paragraph should be:

===
Return -ENOENT so the shrinker skips the stale entry and keeps scanning.
It affects all swap devices.
===

> 
> Link: https://lore.kernel.org/20260913063031.1689420-1-hebaoquan@kylinos.cn
> Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Acked-by: Nhat Pham <nphamcs@gmail.com>
> Cc: Chengming Zhou <chengming.zhou@linux.dev>
> Cc: Chris Li <chrisl@kernel.org>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Kairui Song <kasong@tencent.com>
> ---
> 
>  mm/zswap.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/mm/zswap.c~mm-zswap-return-enoent-when-the-swap-device-is-gone
> +++ a/mm/zswap.c
> @@ -1016,7 +1016,7 @@ static int zswap_writeback_entry(struct
>  	/* try to allocate swap cache folio */
>  	si = get_swap_device(swpentry);
>  	if (IS_ERR_OR_NULL(si))
> -		return -EEXIST;
> +		return -ENOENT;
>  
>  	mpol = get_task_policy(current);
>  	folio = swap_cache_alloc_folio(swpentry, GFP_KERNEL, BIT(0), NULL, mpol,
> _
> 
