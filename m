Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1F249F13C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050573; cv=none; b=h2nH8OWop6+4Q8KuzBROa7EBn3qheTwlq8rOEYJBliAl3UkVhbdu51WKFTcISvYj2ZUiuPCNn/ZJ5Xyscqf0SMcm2labH6E4DCngLi0WhbdFo8LxFvVzjERshxU9qCweoZkw8uZnMJspZ/QjeQDLWlv82bz2oKRNB1pa5Kse484=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050573; c=relaxed/simple;
	bh=ABty7EnBJDbGPeJsUVUx0HkD1rVaSq47svJZkf8G3/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sT/1u+mMW0L0kJJE/gDutUTXs+GqyQ1qiXoKsvlnrxUCjXFTCYhmTmfMz5YPCzrXSrK4hFXJW1gah++6Ih/sfSGSNuoLR963mvs7koPM8Wch0fVTMd5VHJrfCdxPWkGz4VyLsmUGwMAkruXdDMe6yNQ4yfvvprwV7DG0RLGPW1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jIxCM8QC; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jIxCM8QC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SCRUlAE+9gAOWfrzbhu6LWVWeq3iBpwZ4D9QWNQ6RKA=; b=jIxCM8QCpvBkNFjQqZ8K2/qFVT
	sEktAJPNKqfVNebgRl5tkcchJlWN9701JRz248FEooOaeenJ2VGpcSzydZ+hwkwhwOXM0F0iXLPZV
	R5lVPuXkYtY8QP5XAgGTpC8F5I8TsgM5NqTIrLxlhHfNu0N002OKBGGObeEbXOqqqbYvJcdoNpKIU
	mB6Sl2dw2JmIYjdKHQ/FzMuOITuBUzXxbzNg1sqhdT9Ha1FIs3ldfqwD/vpyNd/KyuE8ebLr5duYI
	JkMvYcDd0CkhPpbrdsJgwlCa0SWktLUDnkGhPvoSZV7P48MsoMrafCvP3aokNcB+QNGq9uTOUMBQO
	yNLLRlJg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHGDL-000000003QI-0MBA;
	Thu, 15 Oct 2026 07:49:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 349D53006DD; Thu, 15 Oct 2026 09:49:22 +0200 (CEST)
Date: Thu, 15 Oct 2026 09:49:22 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: christian.loehle@arm.com, bsegall@google.com, dietmar.eggemann@arm.com,
	juri.lelli@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, mgorman@suse.de, mingo@redhat.com,
	rostedt@goodmis.org, vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH v3] sched/fair: remove dead code on enqueue_task_fair()
Message-ID: <20261015074922.GM2009045@noisy.programming.kicks-ass.net>
References: <6f7ec108-603a-45c3-a5c2-6f9aebb50f54@arm.com>
 <20261015074238.2363-1-kayracizmeci@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015074238.2363-1-kayracizmeci@gmail.com>

On Thu, Oct 15, 2026 at 10:42:38AM +0300, Kayra Cizmeci wrote:
> > > I'm not entirely sure I follow. With the above fix there is still only
> > > one place_entity(), which is after enqueue_hierarchy() and has
> > > ENQUEUE_QUEUED on.
> 
> > Exactly.
> 
> > > 
> > > Here enqueue_hierarchy() adds the entity to h_nr_queued, and
> > > ENQUEUE_QUEUED tells place_entity() exactly this, so it can adjust.
> 
> > ... but place_entity(ENQUEUE_QUEUED) still does:
> > 
> >     load = cfs_rq->sum_weight;
> >     if (curr && curr->on_rq) // <-- this is true after enqueue_hierarchy()
> >        load += avg_vruntime_weight(cfs_rq, curr->h_load.weight);
> >          
> >     weight = avg_vruntime_weight(cfs_rq, se->h_load.weight); // <- this assumes se isn't already part of cfs_rq weight, but it is (still)
> >     lag *= load + weight; 
> >     ...
> 
> > (in this concrete enqueue()->dequeue() due to unthrottling case)
> 
> Fixing this requiers bit of a revert I think. Or something really close to a revert.
> 
> Peter/Christian, would you be OK if I send a fix about this with a revert
> (that I caused :<) and a comment or one of you guys want to fix it your way?
> And is there any cleaner way to fix these without a revert?

I'm not seeing one at the moment; that is, I end up making it a bigger
mess. Feel free to send a revert that includes a comment about this.

