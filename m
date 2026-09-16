Received: from mta0.migadu.com (out-134.mta0.migadu.com [91.218.175.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D243EC812
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567243; cv=none; b=CV/U6nWEow+jHx5nP0wKeu28h5Q9Ora6vFjTUoLVLpcqR7ljXIKjKNxOCndnJdApCT+BmOZfMF6k3HibzME1QHh4iO+89oXwUgW6Kg2fBcoKB/IHw7/0FcmmYYleKy5XyEU9+CXXPy81mook2zaR36CtW2DZFlyMP9MpGHzVx+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567243; c=relaxed/simple;
	bh=VnaTq5M5se49V/9M3c8zvRQnGAJq4+i+kTu1qxqaOlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nYLGrkFORgO4/ukULE6Lmn3wkLEXbnLsgaY/TjVtjT+JIkjEQwY0fbtcdabmwn8G72+8VSpgFp2kDtA3BruThsXD/kyL4/L601j1qC0igAC6p11kcc2JlHG2mNjuzV3hb21bsAj55aCmAjFld1RH1WSh78awuJOke9izbMdEfY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dZ/K0710; arc=none smtp.client-ip=91.218.175.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dZ/K0710"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VnaTq5M5se49V/9M3c8zvRQnGAJq4+i+kTu1qxqaOlY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789567238; v=1; x=1790172038;
 b=dZ/K0710yObmAG+nqd1rTazeVb+9Xjw1Y4sc2mahRs8b4ON1KXMv2wHgoVNCFsjfXAFcL6RK
 OUSfvlltt8yaWpY8Aie2xGPcrhAvnLlAuMFiCVg3ENYMyRfleAKepEdGigcIrgPHVuzfizpbCn1
 f05ucNYvb1Untg5iScLXE9Z4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id da512f38a1cd2b39;
	Wed, 16 Sep 2026 14:00:37 +0000
X-Mizu-Trace-ID: da512f38a1cd2b39
X-Migadu-Flow: FLOW_OUT
Date: Wed, 16 Sep 2026 22:00:24 +0800
From: Hao Li <hao.li@linux.dev>
To: Harry Yoo <harry@kernel.org>
Cc: vbabka@kernel.org, akpm@linux-foundation.org, cl@gentwo.org, 
	rientjes@google.com, roman.gushchin@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] mm/slub: make the case handling in __slab_free()
 easier to follow
Message-ID: <aqqfP-bj2jh0pN56@fedora>
References: <20260824122004.3652-1-hao.li@linux.dev>
 <20260824122513.3829-1-hao.li@linux.dev>
 <aqf4IsztnhrXBocx@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqf4IsztnhrXBocx@thinkstation>

On Mon, Sep 14, 2026 at 02:39:16PM +0100, Harry Yoo wrote:
> On Mon, Aug 24, 2026 at 08:25:09PM +0800, Hao Li wrote:
> > There are 7 possible transitions in __slab_free():
> > 
> >   a. partial->partial
> >   b. partial->empty, offlist
> >   c. partial->empty, onlist, exceeding min_partial
> >   d. partial->empty, onlist, not exceeding min_partial
> >   e. full->empty, exceeding min_partial
> >   f. full->empty, not exceeding min_partial
> >   g. full->partial
> > 
> > (There is no offlist variant of e, f and g as a full slab is on no
> > list.)
> > 
> > Clarify which case each branch handles, and replace the goto with a
> > return at the end of the skipped block so that every branch explicitly
> > states its coverage.
> > 
> > Case 'a' is the only path that needs neither list_lock nor list
> > handling. Give it an early continue: handling it upfront is much clearer
> > than forcing every other case into a nested block.
> > 
> > Also, read SL_partial once after the loop right where it is used, rather
> > than re-reading it on every iteration.
> > 
> > No functional change.
> > 
> > Signed-off-by: Hao Li <hao.li@linux.dev>
> > ---
> 
> Looks good to me (with Vlastimil's suggestions adjusted),
> Reviewed-by: Harry Yoo (Meta) <harry@kernel.org>

Thanks!

> 
> >  mm/slub.c | 95 ++++++++++++++++++++++++++++---------------------------
> >  1 file changed, 49 insertions(+), 46 deletions(-)
> > 
> > diff --git a/mm/slub.c b/mm/slub.c
> > index b0cd0572e2f2..e20375307770 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -5748,76 +5748,79 @@ static void __slab_free(struct kmem_cache *s, struct slab *slab,
> 
> [...]
> 
> > +		/*
> > +		 * The slab might need to be taken off (due to becoming empty)
> > +		 * or added to (due to not being full anymore) the partial
> > +		 * list.
> > +		 *
> > +		 * Speculatively acquire list_lock before calling cmpxchg(), as
> > +		 * performing cmpxchg() prior to lock acquisition races with
> > +		 * concurrent paths, such as the shrinker.
> 
> nit: it's bit weird to mention shrinkers specifically?

Yeah, better to remove it to be more generic.

-- 
Thanks,
Hao
