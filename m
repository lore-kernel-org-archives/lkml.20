Received: from mta0.migadu.com (out-248.mta0.migadu.com [91.218.175.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6FE4BEE44
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789367510; cv=none; b=M2r7LNIyspvbMmC42qK7IkZx1PGFAL49wygGMs/Jio/bvAlCwEC2goUS14Tf92Bf+j57HzvZhmA6O6p+rzeMzX8cvgoAlZDx5xtRmfIUDbeGYmSwn21jSzDalTjS9UvI0LMZUU4qaC9TyAPsFoYVBs3iBuuavBs+R0MzwoI5sqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789367510; c=relaxed/simple;
	bh=fg55GBUUkV5XCXftDf2mzn4Rh5jpTy9Wzy8AZmn9baM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fR8wbjohIK0QTX+ofwBlDcoNr7nStbib+HM4oU+yKPoByd5YPzIP53oHijtviAOqx45Ru6xGK3060R1XmRwH8fewFUlowvzeCQT/y6Emh/fPBLp6x3hllH+JnvhzqpOFx+FmHhrJ6v/++JTbeR/Ex/spCdr+iZpLml46hw6UNs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rPA0SIFn; arc=none smtp.client-ip=91.218.175.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rPA0SIFn"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fg55GBUUkV5XCXftDf2mzn4Rh5jpTy9Wzy8AZmn9baM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789367506; v=1; x=1789972306;
 b=rPA0SIFnK8LxlZHDkTpkItv3g1/wmeAar9MridGrm/fYoC0OdigVsBuEM4iASjN3wY8Vqc2t
 YIvWiA0jt1jqUydikfF48omMG/52WrCGzDR0Zgld6bQOZQaZDcpeG6VKI2IUWhZWW2uF+HbuEG6
 7y+noqSw93W755tRJ+thjRT8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id d8fd9943a3e500eb;
	Mon, 14 Sep 2026 06:31:46 +0000
X-Mizu-Trace-ID: d8fd9943a3e500eb
X-Migadu-Flow: FLOW_OUT
Date: Mon, 14 Sep 2026 14:31:39 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan He <hebaoquan@kylinos.cn>, hannes@cmpxchg.org, yosry@kernel.org,
	nphamcs@gmail.com, chengming.zhou@linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kasong@tencent.com, chrisl@kernel.org
Subject: Re: [PATCH] mm: zswap: return -ENOENT when the swap device is gone
Message-ID: <aqeUyxJmzC397G7j@fedora>
References: <20260913063031.1689420-1-hebaoquan@kylinos.cn>
 <20260913005149.a28c21aaca165fa0255f8475@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913005149.a28c21aaca165fa0255f8475@linux-foundation.org>

On 09/13/26 at 12:51am, Andrew Morton wrote:
> On Sun, 13 Sep 2026 14:30:31 +0800 Baoquan He <hebaoquan@kylinos.cn> wrote:
> 
> > zswap_writeback_entry() returns -EEXIST when get_swap_device() finds no
> > device.  -EEXIST is the shrinker's "page already in swap cache" signal,
> > which makes zswap_shrinker_scan() stop shrinking entirely.  A NULL
> > get_swap_device() instead means the device is being swapped off, so the
> > entry is simply stale.
> > 
> > Return -ENOENT so the shrinker skips the stale entry and keeps scanning.
> > Independent of xswap; affects all swap devices.
> > 
> > ...
> >
> > --- a/mm/zswap.c
> > +++ b/mm/zswap.c
> > @@ -998,7 +998,7 @@ static int zswap_writeback_entry(struct zswap_entry *entry,
> >  	/* try to allocate swap cache folio */
> 
> Comment was always lame ("say why, not what").  It now seems flat out wrong?

Agree, the comment should be moved down to be cloe to
"mpol = get_task_policy(current);" line.

> 
> >  	si = get_swap_device(swpentry);
> >  	if (!si)
> > -		return -EEXIST;
> > +		return -ENOENT;
> 
> mm-new has changed.  I made this

Thanks. Does it need a v2? or just use ther version you tuned.

By the way, which mm branch is suggested to take as a base for mm
patches posting? I usually take mm-unstable branch, seems it's changed
to mm-new now?

> 
> 
> 	/* try to allocate swap cache folio */
> 	si = get_swap_device(swpentry);
> 	if (IS_ERR_OR_NULL(si))
> 		return -ENOENT;
> 
> 
