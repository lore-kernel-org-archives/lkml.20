Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4B545FFC3
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037649; cv=none; b=re0I64Bv4Szv+a29hMV2DgaH1qdicEeIint0BjFiwHVyouK4O9iO2NBcz7w8y+VIHTuw0mrk5JouladdXbYD2AOKFLhtL1194hyTMb9IYEDGJNTmQJ+6rgqQ8jPdkYbMMaZHStHqFNtEsyA2ATpO4MfXINVEheBhSVN0cS7f0x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037649; c=relaxed/simple;
	bh=03aumKCBVmkCYS6FKh4lw9BzTJVJCb8iE4Pu4y2zKJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tik6p/rzT1Hh7QZJz31uNf8lDbThFzquTzyY1ZjMqP/Q/bCGZJBOvw+NPZj+09azi3WJlHXxY+cVxRPshFqIMj+Fx2wefYStpX78V+VVUxQ1533tyG1j0DMBYB2kFO78ehCptEbpdAXefHnldvd+OgPqj3CfhEETisx8X+Qa5LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=HG7wWlZy; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="HG7wWlZy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=exriCEPKpORG5XesYYVjTH38jJkgEZ6FOwFmdYoWl5w=; b=HG7wWlZyGNp/i3ltdU95fi9Enh
	rkT4KECUxK9KihTw0WpgTK0Lq4iZheXgiTffCJdbHR16NodtUsprKTAWrwspVIzQWchSReYpPoDzp
	F81MkSRAPaRADNFhCu+Wzu5hiB6jYBCWrDUSjCKypmmTbSimVTMGzqC3IKr3OZ9Ue+fPzlmXo5RcD
	WYQIODFV3myRyhwv1FizOjwCMHDhla6XZ4Haxtl3ap9XeIA2RScfD/Y4L6BiyqDR+/RcHVEcVYNnX
	vu7qbKngAtrh7wVY2QY0BxWY3J6ZsQ0KosHeeOYVhJ6kARfk4XCRl26x3aDuAVNoCKy4r9JmKv3TL
	S+6YbuxA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x4cPm-000SfQ-2E;
	Thu, 10 Sep 2026 10:53:59 +0000
Date: Thu, 10 Sep 2026 03:53:53 -0700
From: Breno Leitao <leitao@debian.org>
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Yao Kai <yaokai34@huawei.com>, liuyongqiang <liuyongqiang13@huawei.com>
Subject: Re: [PATCH 3/3] workqueue: Make flush_workqueue() visit only pwqs
 active since the last flush
Message-ID: <aqKMNEyn_iG6iC21@gmail.com>
References: <20260901210929.3092513-1-tj@kernel.org>
 <20260901210929.3092513-4-tj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901210929.3092513-4-tj@kernel.org>
X-Debian-User: leitao

On Tue, Sep 01, 2026 at 11:09:29AM -1000, Tejun Heo wrote:
> 636b927eba5b ("workqueue: Make unbound workqueues to use per-cpu
> pool_workqueues") fixed unbound workqueue scalability on large machines but
> made flush_workqueue() walk one pwq per possible CPU, cycling each pool
> lock, up to three times per flush. 85f0d8e39aff ("workqueue: Reduce
> expensive locks for unbound workqueue") coalesced same-pool locks for
> unbound workqueues but the walk remains. Yao Kai reported the XFS CIL
> workqueue, flushed on every log force, spending up to 64us per flush in the
> walk on a 128-CPU machine.
> 
> Idle pwqs can't just be skipped: the lock-and-advance of every pwq's work
> color is what keeps a concurrently queued work item from being stamped with
> a retired color unseen by the flusher, which would let a later flush return
> before it finishes.
> 
> Track active pwqs instead. Each workqueue gets a wq_flush_pnode per node
> with a lock, a mirror of wq->work_color and a list of pwqs. Queueing to an
> off-list pwq syncs pwq->work_color from the mirror and adds it under
> fpn->lock, and flush_workqueue_prep_pwqs() advances the mirror and splices
> the list in one fpn->lock section per node before visiting the pwqs under
> pool->lock as before. That replaces the fence: a racing queueing either gets
> its pwq on the list before the splice or stamps the advanced color. A pwq
> stays on the list until a visit finds nothing in flight, so a cascade arming
> an older color still finds it, barriers need no separate add as the work
> item they follow keeps the pwq on the list, and pwq_release_workfn() removes
> a released pwq under wq->mutex.
> 
> On a 192-CPU 2-node machine, flushing an idle per-cpu workqueue goes from
> 40k to 4.2M per second and an idle unbound one from 450k to 4.3M. 16 threads
> each queueing a work item and flushing, go from 30k to 110k flushes per
> second on a per-cpu workqueue and 60k to 180k on an unbound one. Dense
> flushes with every pwq active are unchanged on per-cpu workqueues and 15-20%
> slower on unbound ones. The queue path is unchanged.
> 
> Reported-by: Yao Kai <yaokai34@huawei.com>
> Link: https://lore.kernel.org/all/0a030145-c108-4365-ba2d-ac1973a1e352@huawei.com/
> Signed-off-by: Tejun Heo <tj@kernel.org>

Tested-by: Breno Leitao <leitao@debian.org>
