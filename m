Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B9F1F91F6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789445821; cv=none; b=IJLQ5llm3UmI7Kdmu6DWFcxLzsxKUDH0D6oxm1Cjz0KTNwpUK1jLC8TM5cGoDR5O4XPP68BtecyHj8qlMzscoascxGmgVd+8pu3QDWCMJ+V+SoBqDqdFCXAntbgTrmlFbllR62WIZQn5CWSBGoRwjQjzREh1ThW6li50P4nqFmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789445821; c=relaxed/simple;
	bh=a0FFF5GSHyZTvvDPjR45s2uLSSXD2c2MBWwYDS302wU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=DS3g1yzQQqj2K1Lwc/Dp36N1/bdbfX8UtcnE7MNonwoS9Swaqf8ZyWjMTf2f2TJ7+7BInOuXyeZx9ps+OhkQ8BXTYPlGWh7xc9b+uShmBFR5HLuI4UMHo7WnX1BmsM3txUTMNdp5s8cX8jtrXzvDzhUt26EtjeETw+CbCf0bJRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KWrjAVLC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KWrjAVLC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7ADD1F000FF;
	Tue, 15 Sep 2026 04:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789445819;
	bh=5DcEPacjJf0+F0se6JCTkxzrdHbL2Pp64Tt6ymciBRg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=KWrjAVLCns6TP+OVJPC7RcegKRYvNZral/TIjux1pI++moz3BjkEU55c0F4wy33jK
	 a0CqotZJu7tC9ebvbDUFFr2DL1Ys8t2w5L171nNShd2C9e+3vV+yLk/aybIzcEpvlz
	 fByoWHMKqdL9EaALLWG9zbkWtKbjrQe9pmkrxbak=
Date: Mon, 14 Sep 2026 21:16:58 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Baoquan He <baoquan.he@linux.dev>
Cc: Baoquan He <hebaoquan@kylinos.cn>, hannes@cmpxchg.org, yosry@kernel.org,
 nphamcs@gmail.com, chengming.zhou@linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kasong@tencent.com, chrisl@kernel.org
Subject: Re: [PATCH] mm: zswap: return -ENOENT when the swap device is gone
Message-Id: <20260914211658.644e5b9b61405f4a9460b8df@linux-foundation.org>
In-Reply-To: <aqeUyxJmzC397G7j@fedora>
References: <20260913063031.1689420-1-hebaoquan@kylinos.cn>
	<20260913005149.a28c21aaca165fa0255f8475@linux-foundation.org>
	<aqeUyxJmzC397G7j@fedora>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Sep 2026 14:31:39 +0800 Baoquan He <baoquan.he@linux.dev> wrote:

> > 
> > >  	si = get_swap_device(swpentry);
> > >  	if (!si)
> > > -		return -EEXIST;
> > > +		return -ENOENT;
> > 
> > mm-new has changed.  I made this
> 
> Thanks. Does it need a v2? or just use ther version you tuned.

I fixed it up while fixing the rejects, I hope.  Below.

> By the way, which mm branch is suggested to take as a base for mm
> patches posting? I usually take mm-unstable branch, seems it's changed
> to mm-new now?

mm-new is a front-end to mm-unstable.  The only difference is that
mm-new isn't included in linux-next.  New material goes into mm-new and
if it hasn't caused any disasters for a few days I'll move it into
mm-unstable and hence linux-next.

Ordinarily there isn't much material in mm-new.  At this moment
mm-unstable has 405 patches and mm-new has another 96.  That 96 is
unusually large because people have been sending huge patchsets today.

So mm-new is the best target for my merging pleasure but it is surely a
pain for ongoing development - it's changing at a great rate.  Those
500 patches landed in 15 days.

I suggest a reasonable process is, approximately, to develop against
mainline (or mm-stable if there's anything in it) until you think the
code is ready for mm.git.  Then rebase/retest against mm-new and send
it out.  But keep an eye on what's happening in mm.git so that the
rebasing doesn't cause nasty surprises.



From: Baoquan He <hebaoquan@kylinos.cn>
Subject: mm: zswap: return -ENOENT when the swap device is gone
Date: Sun, 13 Sep 2026 14:30:31 +0800

zswap_writeback_entry() returns -EEXIST when get_swap_device() finds no
device.  -EEXIST is the shrinker's "page already in swap cache" signal,
which makes zswap_shrinker_scan() stop shrinking entirely.  A NULL
get_swap_device() instead means the device is being swapped off, so the
entry is simply stale.

Return -ENOENT so the shrinker skips the stale entry and keeps scanning.
Independent of xswap; affects all swap devices.

Link: https://lore.kernel.org/20260913063031.1689420-1-hebaoquan@kylinos.cn
Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Acked-by: Nhat Pham <nphamcs@gmail.com>
Cc: Chengming Zhou <chengming.zhou@linux.dev>
Cc: Chris Li <chrisl@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Kairui Song <kasong@tencent.com>
---

 mm/zswap.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/mm/zswap.c~mm-zswap-return-enoent-when-the-swap-device-is-gone
+++ a/mm/zswap.c
@@ -1016,7 +1016,7 @@ static int zswap_writeback_entry(struct
 	/* try to allocate swap cache folio */
 	si = get_swap_device(swpentry);
 	if (IS_ERR_OR_NULL(si))
-		return -EEXIST;
+		return -ENOENT;
 
 	mpol = get_task_policy(current);
 	folio = swap_cache_alloc_folio(swpentry, GFP_KERNEL, BIT(0), NULL, mpol,
_

