Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956274;
	b=U/hV5AxHWchuYKjoAqe9Qxjgrtzpo+i3a1OuoFbPlOuLChGADXaYz3VYCrAIj3ClWnWE
	 oFPOhtEuqo3mU/yfbBynrF2ka2K1UoLDq5AwzYqkc20Lxuk5zRcJs/wlWHC7RzjdKavOg
	 NIHWGmosnftVKM7OGHUsfD01Tw2MXtnxre30lN5bdRjgV7bOB0EVgf8AAHsMDoEGhBHRR
	 O5coFAaGiMv9he1UMPHyOyuT2Eh21JCE1PcRl6gyG9MLkneJ/Orld6Wp8Syff3/M3tXOe
	 aTUAvB19TEmhMG30zHGRB6jPFzo6baJTgj6Uuv9OrbYOLLFxpAspIgKgLAzo12Js6nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DmRVXXUsKTCET9way0Yyh49KlPqz6BX60Iow0coDuro=;
	b=RII7y2aPW7GLk7D0JwjJR/LIMfflox+pt+7RAZFQlhkJOXKs+lM8mhBFWldkER6wDoTM
	 ZPrRwgrfYQjqmOMcHLdFJfrqVeTXKTdlCFcmVH3yfbnmcUJRNft3jF1/U7dYCbpDnP3Fv
	 UlLs1rE/xhKBhk9IGGH7wLgqgK+io6fNOGskEv+ZpVxOpBjD6od6Fgx1s5IEnJByI8NmK
	 HAcrk1wmVFIwYGPkETfsmGLIL/+CZntrofJcoyKv1PzgM7vKXyDy5iqtyR2QO9KKJrGOL
	 0HrBBG4Qa62Vv8zC9L6k+jJav/R3x/dWRUIiFDVhrnRbgG7p8VKVBxh7v/Aj7QMeGaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mRu0Q6qT;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EC0606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86EC0606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mRu0Q6qT
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49061a82da0so22252f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793956273; x=1794561073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DmRVXXUsKTCET9way0Yyh49KlPqz6BX60Iow0coDuro=;
        b=mRu0Q6qT8mR4QOqcCutNNrSj6LtEbSOfGjSJrHDqO0fo8HZPJYkPfkWQVIqjCJF7tA
         mf4e5llAPV3YsaYL2Yj41djUQS/S+EFwfwg0fo4gd85qihzgbiZpMzskOkD1v8nZZAtG
         kzr5Konj5ZDMrcyB3dzAFrBQ2SG827nytF4YIrLuJJLLwzoXvVlJDd7nOIT0hrGaTxcU
         +f581gVzGlACkzWxYX1eHyp4f1gFzJ1BzKGFtHGhXu8iRsPkRhEjK7nHy8z/KkSeNzJx
         m6LVhe2p95f2YgcfFA3mXJqxHItKRdQz2h/b5YRnwNHGlJJuz+okyxyblr/A5aEWRsIw
         6WVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956273; x=1794561073;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DmRVXXUsKTCET9way0Yyh49KlPqz6BX60Iow0coDuro=;
        b=GruivD7AcG27qR1KcmPyWMg7fivI36mH9mdQfQtjSDtZeNJq9yBzOR7jSkX1x1j3kg
         0kwmlLZ+uCMzXIxa/Fm+Sgu06iV82lMmiOcMBe5bJJNVXJVA1p4rBUw+Pnk7Pg84tztc
         5GlPrSad37oXVM42Ww1CKc/xZj/I+0gwTruzILSFzFmKR4bPICbnve8y50xykZ2tlvl1
         tW3AjP1kGBMDmu7246WZj2yH0agi1u8/89KqNJXeA2sZ0tFbFv5UTf+WZlK+IEP3jK+T
         QQakszsaJrupbMuDBSceGc1dryCYV3c4BdRMgR3l2PSVvcI7q9WYpnuoimktPHIC/lGT
         oAng==
X-Forwarded-Encrypted: i=1; AL+hErG3/bBex0sWwoB0Xmc/yQfccSJD8k48PobUOl6MVk5zf3pMj39GEKtFiY+f8KgYqde7kdEc8/BDmpMQmWs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ON5Vhotg1GCuKyKOzNz14X0Eh6UjN2jAvJwFFSpNZw2w237cn
	v5A2KBs15OKMqskvaz7HuI1kJV+bgLSAAA6JZflXpw3KnJvciHZeCnUj
X-Gm-Gg: AYBFou2r7XmmiPWr4BlOQr4mgg92HkqKsQfNJR7etVp0s/0VUfExU2llmQq1DnlDuSw
	HpteqoawlqKyAiFLx+vqgWTmLOpKelg50t3HQrhkH5hqUZHOoOztBQ4hXUjAN8PUl4/psKe7bKP
	l3PP2lx4CSf7WzueXwhLtwwh9V3s0WgL4RSxTveJylnepCNrr99j6IacnlNuJmA9XSlBxfljI56
	CqQzGqDXqb61Wtip7OdwYbiY3WBTGKpPCXJKn94aul5aZQVeQCiQuMSaE75lg1Tm4PmhaO47Tz2
	rKJ1FrsHBfy2H7fDYgj7xstEEsgKtdla9f4Xw6ZD+2p0frlcjTt7juz1neNhHRtVUv4rKZV8jeb
	KERMYr30vbNPh6ChPuGsaAHhatnm65k0xHTe3kq0WGAmA0j2vEhos19yI2gLcpMKknwCBKy3BIS
	2H8Ljikvj1AMo8zoiaf/JrYA1JlGx+XBAS4TYh5SEjS9QdvLRJ0XxFP1OF41Tuxxg+6WqtbaavD
	aAcib9DbdOMc2gNTbFhDxMiC0IEtkNj11+cs34Hai7aAWinpbC+GLWHT4uNE9vGP5IxyaV7sqIn
	Jdnbv7ZqcEkT5ZOgBQh0vGzT237VT03gp4KNt37JcIZscFvb6AkvklSA
X-Received: by 2002:a05:6000:288e:b0:48e:5d5e:c27b with SMTP id ffacd0b85a97d-492791c9108mr5062886f8f.6.1793956272726;
        Fri, 06 Nov 2026 01:11:12 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723320csm2332431f8f.26.2026.11.06.01.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:11:12 -0800 (PST)
Date: Fri, 6 Nov 2026 12:11:09 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, linux-kernel@vger.kernel.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	joshdon@google.com, tj@kernel.org, jakub@okonski.org
Subject: Re: [PATCH 2/3] sched/fair: Make cfs_rq::idle the sum of ancestor
 tg::idle
Message-ID: <au2YGyFA7W5H9kFU@scheduler.schedules>
References: <20261105165525.011876858@infradead.org>
 <20261105170157.616859418@infradead.org>
 <auzB7x4lVcFmTVMs@scheduler.schedules>
 <20261106083106.GC1779021@noisy.programming.kicks-ass.net>
 <au2VkE9005PlW8VN@scheduler.schedules>
 <20261106090153.GD1779021@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261106090153.GD1779021@noisy.programming.kicks-ass.net>

On Fri, Nov 06, 2026 at 10:01:53AM +0100, Peter Zijlstra wrote:
> On Fri, Nov 06, 2026 at 11:57:03AM +0300, Kayra Cizmeci wrote:
> > On Fri, Nov 06, 2026 at 09:31:06AM +0100, Peter Zijlstra wrote:
> > > On Thu, Nov 05, 2026 at 10:20:00PM +0300, Kayra Cizmeci wrote:
> > > > On Thu, Nov 05, 2026 at 05:55:27PM +0100, Peter Zijlstra wrote:
> > > > > Rather than keeping cfs_rq::idle as a copy of tg::idle, make it the sum of
> > > > > all ancestor tg::idle. This makes it trivial to tell if the current cgroup
> > > > > is marked idle somewhere along its ancestral path.
> > > > > 
> > > > > This makes se_id_idle() behave differently. Notably is will now be true
> > > > > when there is a idle cgroup anywhere in the ancestor path. This
> > > > > addresses an issue where preemption of cgroup::idle was overlooked when
> > > > > flattening the runqueue.
> > > > 
> > > > How? The diff doesn't touches se_is_idle(). se_is_idle() just looks to
> > > > the policy for tasks:
> > > > 
> > > > static int se_is_idle(struct sched_entity *se)
> > > > {
> > > > 	if (entity_is_task(se))
> > > > 		return task_has_idle_policy(task_of(se));
> > > > 	return cfs_rq_is_idle(group_cfs_rq(se));
> > > > }
> > > 
> > > > Or am I getting something wrong?
> > > 
> > > cfs_rq_is_idle() := cfs_rq->idle > 0
> > > 
> > > and cfs_rq->idle is now getting incremented for the whole subtree. So if
> > > any ancestor is idle, this is now true.
> > 
> > 
> > Yeah, it is for group path. But we call se_is_idle for tasks in
> > wakeup_preempt_fair(). Not groups, no?
> 
> Ah, that's what you meant. So we should do something like:
> 
> 	if (entity_is_task(se))
> 		return task_has_idle_policy(task_of(se)) || cfs_rq_is_idle(cfs_rq_of(se));
> 	return cfs_rq_is_idle(group_cfs_rq(se));
> 
> 
> no?
> 

Yeah. AFAICT this should do the magic.

BTW there was an issue about set_next_buddy() because of this I *think*.
A task in a idle group could still be picked for buddy, but this change fixes
that too.


Cheers,

Kayra
