Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E17735C6A0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974399; cv=none; b=i1upbfPb18lHsX78Q3vLhb8+1mFIvotwDXZKshd4viQG12FSmrjkEKt4acSFCmbjGlvnzvw3pgD6ZadiWRSWH5A3FbHcN4T2jRPIFtylHZt/kmyIoPShyc1zIACBN3CYSLHR2IUSeYuGvvHPjhhFYffdKFbIvvfKKBorEifs6aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974399; c=relaxed/simple;
	bh=Z0gb6PYt93u0VY6izJ56KhmshtzSyI7O+7Ihrl0lCmU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5nj5TgIhz6Kd/CllpNHhm++mFDPcyiTVdP0oG/xMAW+GfFqLCP2Wf05n6LsutxJ+lntX6E1K3P3uSC+5tJsPL8mVAMQqUBXRhs3vLGA60viJsc+fNL64SuHZgXNeVSEidn5Qg/r32K+OkAeU4O2cACufhtr6XSAVuWu7pZQPps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STgRybsR; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STgRybsR"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8565d77c277so83999997b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788974397; x=1789579197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3PRZsX/KYek6emU5v5tZYtdcbcg2qPIIdPrtfdDH6As=;
        b=STgRybsRtARGtsuhO+1QN9o3hXIkfNhWO6PIp70FROV2pAL7A+a6j+nBax0a2aZbIv
         tEEvWFlghRPEaTtTcIJQy3yoUjLobKH8iwmyOLQmBhfF17/ydjgg+rRSC0DynLnhKisS
         tvKY/jBEAX2tzHe3/N1P6wELMSCFbr8K8vwJrnSYLyhtck8yEvVXzgmzRp/lrxqDbMTb
         kv5ZRwQ+YYcmqnDK8gGHplIxn16eoQYMaKfNtCbO+lhiOTPLcsio/ZDnfziv736zEvkQ
         29Tiuorelh4DuO4jJGvZveTryZ2x4C11Vl5yjnoi/6v64nzOKo08VTup5tZZaoY9QKH2
         /umg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788974397; x=1789579197;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3PRZsX/KYek6emU5v5tZYtdcbcg2qPIIdPrtfdDH6As=;
        b=YnsRCHFAmJyyZ0xluPM6C/b61So0FjXQDynbqpaOMfQ2+Z7O72yAIcc1z+SdLlqz0M
         BD9xAthamgvjrl7UPwAYtmErzFGe30qLKmq8eXmvgf9p8JnS2pgaTXoF6FZ0c5xy1tKm
         Fqj/9ACodnBiqsj22cl6l8HJOiqOUQsTDVuFR86iwXNJtODr/e2VTQ6SBfRcbB2K0BkI
         lxJrnM1Lz4+By9Cy2yMDjq87YY2m1QGJ0HBpPhEX0Dq/Bx8rUC0sAGroJVI43A+SfD2b
         MsndaoOHuqKTL130cQhjye7xfZmwCaAkx++ld/nnx3wt7TS2jGDnMc+aDonGNJZrFwVd
         001Q==
X-Gm-Message-State: AFuF++mDpQl3J90R2RjlLD6TQG8lGe7hgMPPGxfguTLPfqsea4EF19+3
	h1CRLMArCqtxshW4jabwhHOeMzDDmBAP7S1nEHFEXBEDsHue9GtRE4B6
X-Gm-Gg: AYBFou22npDjKzKeHNHFzghhrBr+LBmN3RjYl5lFJRA6+BgU5mlcIXmn0Q5s4PE5sRc
	Q4mpEkkNAZaK4NhO6dAzYECS7bIOCGXn+t2aRCyhuQjcUqUbtD4musE2oldVulwXTrjD6FpBnqS
	C6kmt60TBlFTvuV+6GvPlIRL62nNUnYPenQrvN9Uz54PzTU5xfLkZfdWqX6qp0kg6yIkz9Qo1BS
	M/6hQZZS2HpN9fH+GYou9dBZGD7fF9fwtSTkl7gBZYI6WEN5rbnecGWiKo0x5nKirzJqxsADOfb
	h7oXbJU8OFTVZyLIvHyeugWdFedpKUDffEex70+buuz3McpLkwDcVtl5jIl/JGeJ6v2E8qbfHYm
	03VmuUfWfmlt8ug07Vc98tF0jgLdl8EGeqylsYxAwGJhMWOcjedZ1EtNF9NGmUKc2vjhmxIx988
	ld7uktUx6RDwzjV8IJ1Ek18rhhcCsNPAPw9F/ZE6i294iP0V8rCE5GIUDsIne0eCI5UxnhFxfGR
	qfBmFaZbW5IXW87e8sWoYQuwp0owaNfofccUEw=
X-Received: by 2002:a05:690c:620f:b0:841:773e:8d86 with SMTP id 00721157ae682-871232363dfmr149350847b3.15.1788974396825;
        Wed, 09 Sep 2026 10:19:56 -0700 (PDT)
Received: from localhost (c-73-105-0-191.hsd1.fl.comcast.net. [73.105.0.191])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714b62bc77sm114405657b3.39.2026.09.09.10.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:19:56 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
Date: Wed, 9 Sep 2026 13:19:55 -0400
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	yury.norov@gmail.com, kprateek.nayak@amd.com, iii@linux.ibm.com,
	corbet@lwn.net, meted@linux.ibm.com, tglx@kernel.org,
	gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
	vschneid@redhat.com, huschle@linux.ibm.com, rostedt@goodmis.org,
	dietmar.eggemann@arm.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
	hdanton@sina.com, chleroy@kernel.org, vineeth@bitbyteword.org,
	frederic@kernel.org, arighi@nvidia.com, pauld@redhat.com,
	christian.loehle@arm.com, tj@kernel.org,
	tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org,
	rdunlap@infradead.org, kernellwp@gmail.com,
	linux-doc@vger.kernel.org, jgross@suse.com,
	virtualization@lists.linux.dev, sunlightlinux@gmail.com
Subject: Re: [PATCH v13 07/13] sched/fair: Load balance only among preferred
 CPUs
Message-ID: <aqGVMR2m_NF76tv3@yury>
References: <20260909135617.871006-1-sshegde@linux.ibm.com>
 <20260909135617.871006-8-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909135617.871006-8-sshegde@linux.ibm.com>

On Wed, Sep 09, 2026 at 07:26:11PM +0530, Shrikanth Hegde wrote:
> When a CPU is marked as non-preferred, any load pulled towards it is
> pointless since the task will be pushed out again in the next tick.
> So, consider only preferred CPUs for load balancing.
> 
> This ensures load balancing does not fight against the push task mechanism
> which happens at the tick. Also, this stops active balancing from happening
> on a non-preferred CPU pulling the load.
> 
> This also means there is no load balancing if a task is pinned only to
> non-preferred CPUs. They will continue to run where they were previously
> running before the CPUs were marked as non-preferred.
> 
> Bail out early for NEWIDLE balancing, as load balancing is done only on
> preferred CPUs. Note that idle balancing is allowed to go through, since
> that naturally updates nohz.next_balance when all the idle CPUs are
> non-preferred.
> 
> Also, optimization in find_new_ilb() is skipped. The steal governor driver,
> which is introduced in later patches, updates the preferred CPUs state in
> descending order. find_new_ilb() checks for idle CPUs in ascending order.
> Hence, in most common scenarios, the idle CPU found by find_new_ilb() will
> already be a preferred CPU. When all idle CPUs are non-preferred, the first
> idle CPU has to be chosen anyway. All of this is naturally handled in
> find_new_ilb() currently. Adding additional complexity to it for rare
> edge cases is not necessary.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>

Reviewed-by: Yury Norov <ynorov@nvidia.com>

> ---
>  kernel/sched/fair.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index b8bd308c2d5b..4ef1167b8c73 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -13473,7 +13473,7 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
>  	};
>  	bool need_unlock = false;
>  
> -	cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
> +	cpumask_and(cpus, sched_domain_span(sd), cpu_preferred_mask);
>  
>  	schedstat_inc(sd->lb_count[idle]);
>  
> @@ -14588,10 +14588,8 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
>  	 */
>  	this_rq->idle_stamp = rq_clock(this_rq);
>  
> -	/*
> -	 * Do not pull tasks towards !active CPUs...
> -	 */
> -	if (!cpu_active(this_cpu))
> +	/* Do not pull tasks towards !preferred CPUs */
> +	if (!cpu_preferred(this_cpu))
>  		return 0;
>  
>  	/*
> -- 
> 2.52.0
