Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1750D37FF41
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 18:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787940306; cv=none; b=SC5ys67d76FysmQ7eq/RQuuIwSEFZOVjxr0jHemNC+zlpx1QouNoeJT3N30d/hXVko21179uWy202qWVz6FACJEr+kzLoOlXtEUDR/Xtdg7DA0Ho/6E3MRyOsBIoYhBWJIJ5Pn1fgm73TqtIeYsvijqQVDjau43ZLsoDxX5APgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787940306; c=relaxed/simple;
	bh=pulrhA1z/24BBj5Cl8E/GQwLRRtPhUygsHkKurvQViw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=gIYnCINyLFzQ1KMQusp00IdAF+6G7Wj1/A/4hMCExGcsQevHeZKdRIKtzq/WJ8mn+vvXcNLEb/2j7gLB4IpSexGGO9QaG2wYTiuxxzXWL8U9Rnd/fA4OJ2Gma1Akpio/F/JrxsdTDkGTwUpqHexHiULuoZBBhEo2P18W72CQRns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ODlLoY+x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ODlLoY+x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593B91F000E9;
	Fri, 28 Aug 2026 18:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1787940304;
	bh=BtbaLM+XrnDfc1+8xbhyudXGdgL+W0cYRo+RKPtdj3U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ODlLoY+x3oN86nAY7aDfhVrNWgl35SC9NPJouDYUBjPpWN5ymfXrZiul9QOj9WvpY
	 LjxasdXV1/CCPen8FXWYQWKVdl4lvoe4j9owW1RedQLSjTst7x88eh2D3UAK4p1xMl
	 R5SSBJ4PNRFGzhBP5auTzqXCDP3k4diZCsc/Rsbg=
Date: Fri, 28 Aug 2026 11:05:03 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ye Liu <ye.liu@linux.dev>
Cc: Uladzislau Rezki <urezki@gmail.com>, Ye Liu <liuye@kylinos.cn>, Dev Jain
 <dev.jain@arm.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: vmalloc: fix vmap_purge_lock livelock under
 memory pressure
Message-Id: <20260828110503.e1eff32a9b7df9a8b2ddd4d6@linux-foundation.org>
In-Reply-To: <20260828091753.299295-1-ye.liu@linux.dev>
References: <20260828091753.299295-1-ye.liu@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 28 Aug 2026 17:17:53 +0800 Ye Liu <ye.liu@linux.dev> wrote:

> From: Ye Liu <liuye@kylinos.cn>
> 
> The vmap_purge_lock mutex can be held for an extended period by
> __purge_vmap_area_lazy() which calls flush_work() to wait for
> purge_vmap_node workers while holding the lock.  Under memory
> pressure, those workers may themselves be blocked in direct
> reclaim trying to acquire the same lock via the
> vmap_node_shrink_scan() shrinker callback, creating a circular
> dependency that deadlocks the entire system.
> 
> Two places acquire vmap_purge_lock from paths that can be reached
> during direct reclaim:
> 
> 1. vmap_node_shrink_scan(): replace blocking guard(mutex) with
>    mutex_trylock().  This is a shrinker that only decays the vmap
>    pool and returns SHRINK_STOP without freeing memory; skipping a
>    decay cycle when the lock is contended is harmless and prevents
>    tasks from piling up on the mutex in the direct reclaim path.
> 
> 2. reclaim_and_purge_vmap_areas(): replace mutex_lock() with
>    mutex_trylock().  This is called from the vmalloc allocation
>    overflow path; if trylock fails, another thread is already
>    purging and the allocator's retry will find freed space.  The
>    notifier chain provides a fallback if the retry still fails.
> 
> Both trylock failures break the circular dependency: the lock
> holder's flush_work() can complete because workers are no longer
> blocked on vmap_purge_lock in the direct reclaim path.

Thanks.  AI review expressed a couple of concerns:
	https://sashiko.dev/#/patchset/20260828091753.299295-1-ye.liu@linux.dev

