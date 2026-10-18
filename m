Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E8D27603F
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792306684; cv=none; b=WdawumtInF6pg/lzsLHm921HEgJjsYx1V6H7Bh7rcDNanaOyTqUJmPZjxBGYs+aV1O6zcDxBW5KxsUNhXLrCUddWV3DZq675fczNNrBgVnsZyIEXpLGe21bpuCQ4zk/gg84DNSUwaH5t5DadROOy4PxGOyVCAntbnvUOUrZHvxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792306684; c=relaxed/simple;
	bh=n8drFyWUqlZVAL8+M5tEtJElOJELGas4rwhBBwINCmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Myu6wTBjC0NpOsscV6z3OJpXrtJAYWEpSMHG45u2SEBkUGW/MMa0TGh5M87os7gMR4E95xzk0mbaXzx1ZQ+59/VbgJ/VCGNQYag48grTftv/8FYF2SQKAHc/gOob/YJqCGmARq72PkBUHsviExxtgUpQldY1m9Wc52Cbsi+CiiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSms8ek1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSms8ek1"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48df4f7ccf4so143342f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 23:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792306681; x=1792911481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HwdW3HA63E3gYfbgiIewlrhU22u3aiecjGG8syRP8fE=;
        b=eSms8ek10e1ts2UMABu16BnWjGJQ8utmiRRW93n/jY25Vx03qJ8EHqvMfsJEDy7urr
         KN/Gja38Idv5A4NzoyXPBRwvcmV85egLD2eVpC1RcZXIL6NIGRStMD5a6jBn6yemTuCk
         ZF6HTwNQcjGnLCjeiTSOeo8BO11gBnehZgTeM7vdi1Vbv7Iqb5cnL81iN11vw4GMSGci
         Zlxdm+x/SMk8Ks3wPp6FYoD72L+ixXWFnGWvAPiCXLUN9HZoZMeVIuuaRkKD0/T42bCP
         75nypM7wffTg7wU3gttJNZaw93/oCVyZncvycqYQ//MM5pK3oU+EkQS1KcfSMxe2v4cU
         m4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792306681; x=1792911481;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HwdW3HA63E3gYfbgiIewlrhU22u3aiecjGG8syRP8fE=;
        b=TWOem5PtEBQ8jt8e4cjRoMdJgnWd72mwJQptvX5PsjH/3+TmONV9IOgpq9bDXRru5A
         lFSSpc9LAUeLnMRWnQoOuu98V5B+EraG1lV1wwQLXOT/JgU67OxCFZCtwOPGohJyDMuZ
         YCIMzOVQBofb95wrcS9bhGQt3CuEauaahg6him9lfE32gF5gILKq2tX3O1YLoUpcCJ+0
         FG5sIIvjtjxKErkhQOn4f+0Xhnj42aboGevXIHfdwue+nMyiGhmJuno0AtIJSotwMyVC
         lW7x1ZF9toZsB7+hZ7W+jfQd9X0vbM35L+9tFoBRH57eu3pae1uC5c5bZbpRFduWj4qf
         ClNw==
X-Forwarded-Encrypted: i=1; AKwUvBxPr3v0VapIPjA0ePCoYhJPN1j6SniY43x3mp34zXzia1wKbEJtN7h1DIJVZxuyeUPVFT6GXorLu1TXgOQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkgnVTs6H8fyGkdPiHnNj6NMXRgFQ5lWR/qgve+2bVsiEFbWJL
	Hq3WvHuElYn92ecGrcewDe9z3BGK0ThjAiOL545flMSbXMmmZ2dRu9rc
X-Gm-Gg: AYBFou0mJNv9FwThDL1Ilke0J+d9Q9RcjivmpN9CCmyd2sUhNfO9c5iYm7sAmaBwkbF
	8kAVXSRBKkt9lGN6UNQtCovf/8aFnq9vR649u59kpgiH+421n9y+QoFaHdIyVl/xUHD4XYqcCxk
	pgp6wIpi1wRQCZi8zgFvSEPmlIcc4uRVTMSlVC7Nccv8p4oEq64Hx1DoYKe8yJo0qXQpI3/oKbE
	YBGtNwZSRZGKuMjMpYYA3oeR+g4QUNfJxDQ0jb8/BTY9cZMko2we4w4nmpKwi7ngJt+Qd/VHQDU
	cAAjJC1nbZt932UPflgWmB2VabUA9Xo9szQIKxTCTfsZxNG1IYFzefkyHRtq/3Kj8PkoobmuA8Y
	Gx2e9P0JKrgX3CjNwuBYtR+12i0qXZKysLX++sD1C7ifzV4mp6hjKWFG0+Dfga8/c4ygCWi4j7j
	vBp25scjNseMJKP6PskHelqbN8jlgz6ZT9AJB5MTkhS23tfaEPcLgE8T9CPaVAgxnnyZEA0eD4O
	cWA8P7Z+5/jnil/wo+3SnXG/g==
X-Received: by 2002:a05:6000:2882:b0:48a:f5c5:d077 with SMTP id ffacd0b85a97d-48e07b9ca18mr8627716f8f.2.1792306681279;
        Sat, 17 Oct 2026 23:58:01 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5942sm22345732f8f.16.2026.10.17.23.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:58:00 -0700 (PDT)
Date: Sun, 18 Oct 2026 09:57:57 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, 
	lukasz.luba@arm.com, rafael@kernel.org, linux-pm@vger.kernel.org, tj@kernel.org, 
	void@manifault.com, arighi@nvidia.com, changwoo@igalia.com, 
	sched-ext@lists.linux.dev, qyousef@layalina.io, christian.loehle@arm.com, 
	pierre.gondois@arm.com, sshegde@linux.ibm.com
Subject: Re: [PATCH 07/18] sched/fair: Add push task mechanism for fair
Message-ID: <atRseHwvpRJGtjIy@scheduler.schedules>
References: <20261002154415.2270586-1-vincent.guittot@linaro.org>
 <20261002154415.2270586-8-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261002154415.2270586-8-vincent.guittot@linaro.org>

On Fri, Oct 02, 2026 at 05:44:04PM +0200, Vincent Guittot wrote:
> +static void __fair_add_pushable_task(struct rq *rq, struct task_struct *p)
> +{
> +	plist_del(&p->pushable_tasks, &rq->cfs.pushable_tasks);
> +	plist_node_init(&p->pushable_tasks, p->prio);
> +	plist_add(&p->pushable_tasks, &rq->cfs.pushable_tasks);
> +}
> +
> +static void fair_add_pushable_prev(struct rq *rq, struct task_struct *prev, struct task_struct *next)
> +{
> +	if (sched_push_task_enabled() && fair_check_pushable_task(rq, prev, next))
> +		__fair_add_pushable_task(rq, prev);
> +}
> +
>  /*
>   * select_task_rq_fair: Select a target runqueue for the task.
>   * There are 2 ways to select the target runqueue:
> @@ -10272,6 +10426,12 @@ static void put_prev_task_fair(struct rq *rq, struct task_struct *prev, struct t
>  	cfs_rq->curr = NULL;
>  	if (se->on_rq)
>  		__enqueue_entity(cfs_rq, se);
> +
> +	/*
> +	 * The previous task might be eligible for being pushed on another cpu
> +	 * if it is still active.
> +	 */
> +	fair_add_pushable_prev(rq, prev, next);
>  }
>  
>  /*



Re-reviewed this :-)

On our rq, we have a fair task TA that holds M mutex. we have a RT task TB blocked on M. 
we enter __schedule() and from there pick_next_task(). it chooses TB as next, but it adds 
TA to the pushable task list. then we enter the proxy exec path. 
donor is set to TB. but when we enter find_proxy_task(), next is changed to
TA. so right now, TA is on the push list even if its still curr.

(With the whole series applied.)

Am I missing something? Should curr not be pushed?

Thanks,


Kayra
