Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241C54B0E32
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789576434; cv=none; b=t6iRG+CbsOIIIjmY8EtflHzlPd8+a1OHp4b+yXUURFKipZ4CxKR6JzA4fDQzItBHmhcSh2SmNTw/QHMaX8+SjsqrGN7VmDgB/9G0KdBrksHnmYaXa02EqRNDJXkUdCh5w02pxcTv/KwI2MGXfhObnTulyZgdHE0ibBITWlAqog0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789576434; c=relaxed/simple;
	bh=f8N8J/QeuskXk440ymUEmj2Y7405//1kx3L7u8wZWLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yp5pfV19ObaWdOyQu727NyOH07vuHrtnS06T3/p3rL9Ccf+hdnvS2daUTM+8EPIyz1QhNdg/biFxuAYrBBSg9V+nL7IIYmpHlo3neUxLbgas+OdIO5mVEWZ0TYolnvjUYKbkDhADQ8Mpz6ob0znH5/Iyk0ArNrnIIIhwJmRg87I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eG7zOwrA; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eG7zOwrA"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so953623a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789576431; x=1790181231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LHB0XwQ4+CIcg+wjl8r2PjYlCOQaNGhUptKJ0BrRtuo=;
        b=eG7zOwrAyds6dNx3mC75PuwU+ZBItDoSslekyiIBHyey/r7wMxauIADJoBx7U+7W06
         yeY+9pl5RxczeMSoAoklgkuX7hHZKszk0PKEU3iFAQHUgVq/nw2LXHP8annaULZyQbCY
         4iKDJUih9EjdTHiQsv/BRXpzy8/YXD0mM2S+RcU3Hof3gJ/Y8+z08V65goBm9LT44Du1
         UpY0R5GjzWa6yBT81WmBE+CtqFUpHQQq5UutNLhAiF8N0WbIWrZSfT62gMmawMs6u0WD
         3BFOJZ3sLSIku52212LuHkx6tjeHIjCMNQMkZg2c7lq+s9DPoOP4tAJNuhfzqqbzjrQA
         mB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789576431; x=1790181231;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LHB0XwQ4+CIcg+wjl8r2PjYlCOQaNGhUptKJ0BrRtuo=;
        b=jlVXSaqsAVagDFhU0gRsXaKYgHu/1WIE0AK5xzcTAmaMwm5BQlbN00VFK6JyqLqjPH
         2QAc17vl7yDQW+ZRczkZXKLTtWi/PrYm+gSXXgrg/qALs93bFJFY15em9Ct9TSUaCLOg
         YVS8qAVCJwAR9yV4WXQ+BL2mhUl1cFGuYrmK6XbzXJX1yLOhVPtEQjdoPoi0Ne3m+gFn
         +A9u0QjC13XEsPCWFR1YMmiKv1H5vqKbmeUDylBv71MJITJ6oH2I0ZcXRp0CHNEqEUGd
         4pAJuLu8GRoS6J4tYC1ngr8Eh1xNFqAsNf0cBuH8xFHVrojf9ViKNLeAwHnlxXtPTAGw
         h+Vg==
X-Forwarded-Encrypted: i=1; AKwUvBy+nLG0bYMLdrMEUzOv3cVFLrwQOvYYARFyl3RD/eAh3WTtp7Ab+rkbWNH5dX4Bj6grODVukA9BHJQQxmY=@vger.kernel.org
X-Gm-Message-State: AFuF++kCXVqS6dvdZpgCH8vJHwXmydYFXU787giFT3MVeZH5S9ZGzg6/
	p4BWs/GgTcrCn2T08ylQGKDc+AYScCi9rpbm+yTQZfByFhCSLzxVRvBLewavXQ==
X-Gm-Gg: AYBFou08kCwRpg2Bm9lGeQhqiok/ZWpeOPPwWLYaec5JwuTB0NAIf/HdwEOxV17IUL3
	jX0otfxVGOYokFXPDBnH6pr6zNrvJhMF5Em1uKg6mIDJztxmBKkCyBzJHPTPSK2Ea1/eE6GGOJx
	7zxf97eFQI2a4jxlaPhRAk7cNF6YikV0KEGq1DAm+0NE+6dziZfCfAOdpDPvCHrMRVLhYwAZfFR
	dvJjiXj23/PZLV1/sVWM2QrD+DXJWS+1x32NzXOff1PpKHlecQWfuLISprj3zBQQVYFhuf3o3hx
	LvIT6KW9WgWNxADNt4uCGvzA67hKHZAhxivrl/6RXIhzIdaC1BCosoKCtdXa1O6KFQCo0dhMWFV
	kIWYFn2CftvAJ/mt7lb491hxyvzUyKt0wm7Ue0KfTr/gSm/mj75akYAywJJCqloX97WoOmTfTSl
	Xn8KWywqLKFEwgSg/A9LNAAVc72sAYhYwZtUzzXtY4HgwEvW2tDQkAWv3yrN0cxotYV6xjv6wt6
	R4AAe3r8rtmC3eysB+DAQd/FM/0eLJi7E8jESmxhi2f5Cebq4H0i194Atsa1Bx0G6axcywgjHo9
	/QmrdrSu
X-Received: by 2002:a17:90b:5388:b0:39b:92bb:9eef with SMTP id 98e67ed59e1d1-39e1e509fc1mr7522790a91.22.1789576430914;
        Wed, 16 Sep 2026 09:33:50 -0700 (PDT)
Received: from cchengyang.duckdns.org (36-226-250-24.dynamic-ip.hinet.net. [36.226.250.24])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e362ea35asm192984a91.16.2026.09.16.09.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:33:50 -0700 (PDT)
Date: Thu, 17 Sep 2026 00:33:47 +0800
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: Andrea Righi <arighi@nvidia.com>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, 
	Changwoo Min <changwoo@igalia.com>, sched-ext@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ching-Chun Huang <jserv@ccns.ncku.edu.tw>, Chia-Ping Tsai <chia7712@gmail.com>, chengyang.chou@mediatek.com
Subject: Re: [PATCH sched_ext/for-7.3-fixes] sched_ext: Unlink pending local
 reenqueues before freeing scheduler
Message-ID: <20260917002903.Gf17f@cchengyang.duckdns.org>
References: <20260916145807.3250167-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916145807.3250167-1-arighi@nvidia.com>

Hi Andrea,

On Wed, Sep 16, 2026 at 04:58:07PM +0200, Andrea Righi wrote:
[...]

> @@ -5380,13 +5380,20 @@ static void scx_sched_free_rcu_work(struct work_struct *work)
>  
>  	for_each_possible_cpu(cpu) {
>  		struct scx_sched_pcpu *pcpu = per_cpu_ptr(sch->pcpu, cpu);
> +		struct rq *rq = cpu_rq(cpu);
>  
>  		/*
> -		 * $sch would have entered bypass mode before the RCU grace
> -		 * period. As that blocks new deferrals, all
> -		 * deferred_reenq_local_node's must be off-list by now.
> +		 * Bypass blocks new deferrals, but a request queued before bypass
> +		 * may still be pending. As run_deferred() runs under the rq lock,
> +		 * take it to wait for any in-flight processing before unlinking the
> +		 * now-obsolete request.
>  		 */
> -		WARN_ON_ONCE(!list_empty(&pcpu->deferred_reenq_local.node));
> +		scoped_guard (rq_lock_irqsave, rq) {
> +			guard(raw_spinlock)(&rq->scx.deferred_reenq_lock);
> +
> +			if (!list_empty(&pcpu->deferred_reenq_local.node))
> +				list_del_init(&pcpu->deferred_reenq_local.node);
> +		}
>  
>  		/* remove the queued ecaps sync so the pcpu can be freed */
>  		scx_discard_ecaps_to_sync(cpu, pcpu);
> @@ -5395,7 +5402,7 @@ static void scx_sched_free_rcu_work(struct work_struct *work)
>  		 * Bypass blocks new kicks. Flush the kick irq_work so this
>  		 * pcpu's to_kick_node is off the list before it is freed.
>  		 */
> -		irq_work_sync(&cpu_rq(cpu)->scx.kick_cpus_irq_work);
> +		irq_work_sync(&rq->scx.kick_cpus_irq_work);
>  		WARN_ON_ONCE(!list_empty(&pcpu->to_kick_node));
>  		free_cpumask_var(pcpu->cpus_to_kick);
>  		free_cpumask_var(pcpu->cpus_to_kick_if_idle);
> -- 
> 2.55.0
> 

Though I couldn't reproduce the issue on my end, the fix lgtm. Thanks!

Acked-by: Cheng-Yang Chou <yphbchou0911@gmail.com>

-- 
Cheers,
Cheng-Yang
