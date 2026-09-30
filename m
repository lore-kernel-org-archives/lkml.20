Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03AB3A6B6A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757940; cv=none; b=tM6KKTDY/0NJY813zSD9AOyhQh1XhrpsX19HDyHtTCKYnq2FqmYhWP0c5uoaHLa1ja9CoxHbuabhiIt6ioJZ/bHEHo+VKO8qNiuCNtFqRsua2CmvrxDrS8eR7iI+PPSfCQbkALPfw6ae+kign1fCib+3QUoPkfeSnLDlwQwMabY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757940; c=relaxed/simple;
	bh=yv4HCjSUg/O16kAp2OK2iS2Lve1mQhuVO+7DJrL+fKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEMtraqP7t6cnW6yfvlS31acO2Tm7S7ywgLeqcHm7ho1UTjqYAmWkoUPEr1iaAvs/iktbstXWY5NJ2o2iDCiP0pbypMRuo5Z1Hz7QowaHz+zpzgMRY1gv1c67vU0l8TSYERSsZ4dhAb6N+npdIWvtJRxrxHa65cFS2VjkD00R/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ENoEz38a; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ENoEz38a"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tubTiU+jY4cSOt0g4rgFyvBuPobmMH8J/qLIusJ7V1s=; b=ENoEz38a/ncYbqGnGt3k7+Kqq5
	3pXTPqlJ7XrmwNEE5tEKugNB2HVDRh8qShAQOcR+iXQVOKC9xz8XG1xNKAIetudxd9fK5FuvKLk7S
	we4szbMUUPO1JTq3yBReQ3urFO4dErc9XXL3ONU1Bd/iIGvLVkjzIstz7RNvb1W+z/hdp5Vq216W0
	P6H1xvtT7HU2l6IU3Idjvwe0tsVw9tmgmupN2KiLcx185+JvebaITW4zD6Ja0iSRJeV/y6zYlqu2a
	4+aMucbaSuftgToBSKPcbepwJ0TXKdncp4VpzQQhgsEd5WDGmr/1HkYH71aUkYtYs4qZ3Typc3DU2
	DHVkBRzA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpwH-0000000Avtk-3QnB;
	Wed, 30 Sep 2026 08:45:21 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A41663006DD; Wed, 30 Sep 2026 10:45:20 +0200 (CEST)
Date: Wed, 30 Sep 2026 10:45:20 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Kayra Cizmeci <kayracizmeci@gmail.com>, bsegall@google.com,
	dietmar.eggemann@arm.com, juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org, mgorman@suse.de, mingo@kernel.org,
	rostedt@goodmis.org, tj@kernel.org, vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH v2 4/4] sched/fair: Rework/fix task_h_load()
Message-ID: <20260930084520.GG88198@noisy.programming.kicks-ass.net>
References: <20260929085320.337703476@infradead.org>
 <20260929174648.196105-1-kayracizmeci@gmail.com>
 <5a5015bd-ed61-4ef7-a4c9-e759603c4cea@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a5015bd-ed61-4ef7-a4c9-e759603c4cea@amd.com>

On Wed, Sep 30, 2026 at 06:46:38AM +0530, K Prateek Nayak wrote:
> Hello Kayra,
> 
> On 9/29/2026 11:16 PM, Kayra Cizmeci wrote:
> > Hi Peter,
> > 
> > (Fun Stuff):
> > 
> >> @@ -15731,6 +15766,8 @@ static int __sched_group_set_shares(stru
> >>  			update_load_avg(cfs_rq, se, UPDATE_TG);
> >>  			update_cfs_group(se);
> >>  		}
> >> +		for_each_sched_entity_bl(se, cfs_rq)
> >> +			update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
> >>  		rq_unlock_irqrestore(rq, &rf);
> >>  	}
> >>
> > 
> > So, the code is this:
> > 	#define for_each_sched_entity(se, cfs_rq)					\
> > 		for (struct sched_entity *_BL = NULL;					\
> > 		     (se) && ((cfs_rq) = cfs_rq_of(se), (cfs_rq)->backlink = _BL, true);\
> > 		     (se) = (se)->parent, _BL = (se))
> > 	
> > 	#define for_each_sched_entity_bl(se, cfs_rq) \
> > 		for (; ((se) = (cfs_rq)->backlink); (cfs_rq) = group_cfs_rq(se))
> > 
> > 
> > (While writing this, a suitcase tried to assassinate me by falling from top of the closet,
> > what follows after this part may be the symptoms of my brain-damage.)

'Expect the unexpected!' :-)

Just to share the pictures I always noodle while doing this...

Given a cgroup hierarchy like:

      Root
      /  \
     A    B
     |    |
     AA   BA
     |    |
     t1   t2

We have:

			 rq->cfs
			 /     \
	    cfs_rq-A - se-A   se-B - cfs_rq-B
	       |                        |
  cfs_rq-AA - se-AA		       se-BA - cfs_rq-BA
     |                                            |
    se-1 - task_1                                se-2 - task_2


Where:

 - cfs_rq_of(se)    - gives the cfs_rq se is enqueued on, iow. up one level
                      example: cfs_rq_of(se-AA) := cfs_rq-A

 - group_cfs_rq(se) - gives the cfs_rq associated with the se, iow. sideways
                      example: group_cfs_rq(se-AA) := cfs_rq-AA

(I normally denote these as little arrows in the graph, but ASCII is a
little more rigid than pencil and paper.)


> > When we start as task_b, everything goes well. Both groups are updated.
> > On task_a too, only se_a is updated. 
> 
> I'm assuming the hierarchy is like the latter then if traversal from
> B updates A.
> 
> > 
> > But when we start as se_a root's backlink is NULL so we don't update anything.
> > While on se_b rq_a's backlink is NULL and update se_a but not ourselfes.
> 
> So for that specific section you've highlighted from Peter's patch,
> in __sched_group_set_shares(), we first do a:
> 
>     for_each_sched_entity(se) {
>         update_load_avg(cfs_rq_of(se), se, UPDATE_TG);
>         update_cfs_group(se);
>     }
> 
> That sets up backlink going until se->parent whose group_cfs_rq() is
> the cfs_rq of tg_se(B) aka the cfs_rq just above the group whose shares
> were altered.
> 
> Then we do:
> 
>     for_each_sched_entity_bl(se, cfs_rq)
>         update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
> 
> Which updates the h_load all the way from the root until the cfs_rq of
> the cgroup we altered.
> 
> In case of:
> 
>   root
>    |
>    A
>    |
>    B*
> 
>   *shares of cgroup is updated
> 
> If we update shares of B (aka tg_se(B)), we update the h_load
> until the cfs_rq_of(tg_se(B)) which is till tg_cfs_rq(A).
> 
> Now if you have:
> 
>    root
>     |
>     A
>    / \
>  *B   C
>       | \
>       D  E
> 
> Yes,d you'll still update h_load for only A and you can have stale
> h_load for C, D, and E, and for all the tasks queued below them.
> 
> Since full propagation is expensive, we do those propagation lazily
> when the task is picked, enqueued, or dequeued
> 
> Note: We cannot propagate this up further because we have not yet done an
> update_load_avg() for the cfa_rq(s) in rest of the hierarchy. Next reweight
> will see the correct h_load starting from A and propagate it further when
> needed.
> 
> Was that the problem you were talking about or did I totally confuse this
> with something else?

Right, so we only update the groups up from where we start. Ideally we'd
also update the whole affected subtree, but as Prateek says, that might
be expensive, and it will be updated on-demand later.

