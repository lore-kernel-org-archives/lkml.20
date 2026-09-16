Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEC33A48F6
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574432; cv=none; b=oYbxcAR644NDHo2QKrtDSdJN31QE9A5OQH5G1IGJOdgoruU/2bhQl3ahkeApdbbU+u1nLp470ZDtADvt7ImFVyhVYAVzbHTZVDAFgYYl/VjUScSAFuYB40Nz+dT4vMevF1bNIKEAEdBDPKUylDA3t9fs+zyfLFegXylsg2pg1/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574432; c=relaxed/simple;
	bh=to2EUf71dq1OX8Z8rr+eYcIAovrkenSxGU0JaVVdRKA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHmkFD+MU2Em8nMTwAeOG1H2VCbb7qHc/x68ltLQQ62Tq/7Ykqoqudrln+OKMdqH54aKJHRxG9VGpSAhZKDu7Zz9AxuQQVVo4t136eaABPG6l8nNf/Vvj9QKGbH+RlnxMvF38+abGFF+MpfDxGNW08LphqMwGc6HHWfiVzbsMcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EzpnFf8v; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EzpnFf8v"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c293c683202so172984466b.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789574424; x=1790179224; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TsvLmFYjKq8EwshF1xfkN1TxmP1IiwbM+LSRU/xQAr8=;
        b=EzpnFf8v+QGrCk/J8MMA+1OiEWEoR7A8sicFeJbGtnigwe/YXEYPvoZuY/ig+o1jqk
         unqHI5odSrkw9Gp02dDjQjYDMoHOogqQPIcZzl0ygsD3PabpW8MCVtYLRUwUaU7Ejy8C
         LPOz10qHDp6nvEZ9+sHxocYJPkAi5QZJdIQrhWOZEK7XN+Jq0WcdhTLUcq72iUQLxAZQ
         M4tyndkVELfyihDnxRQeZ31svWZAoFexinJ+AOguEfQvvmbzRIJKr0KIJbFaQO6JLdHX
         dob7J1AizdFJIaWrriQGV0Bo4VhRYITFEu58A/WMhVS5oLvHNHaCIV5Q0aNvn4K7Sum9
         ZsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789574424; x=1790179224;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TsvLmFYjKq8EwshF1xfkN1TxmP1IiwbM+LSRU/xQAr8=;
        b=yyPFuj8UVSlHa/OQZBHSdctJjS8fFYadq5oUCo7Yj2Ppw7Ha6zi6EhYKymThNIRPUJ
         IW48f2XsEgmbAT4XL02xYdSyC+Wdqm3lgE8DS0SQhPDZ8jNEkyVsfPVcbqN9vMXyBp/2
         ma9/uDr5OBz3Nr+vm9cMXxwXS72iV9SgRCD7cHE/1+qrDpDoqTW014uXSq5mOM/QaNG7
         XvKEPEL4E5RIK3HDglIiRYF8lVTl1+5KypQ7Of0avS06rA6BJT0KbRq6jw7xy3MEY51x
         S7/MOV3V+NwEZpHVbToQ515q9KDd5Vz0p7dNXgto50uXmT1WBypEHPteZrpgJlK3sRdU
         UILg==
X-Forwarded-Encrypted: i=1; AKwUvBz8Lq7QYp7MnIIWejtdZlXGdH5QYt81xNXMFT8DiRFTMY9JtLWFGv0Xt1rWqX0oHKEUR8YISruscRx5+4Y=@vger.kernel.org
X-Gm-Message-State: AFuF++l7KrP+h8p32dKKUVN/h+oHrdnVDiNBmJV3Grk3tWlvGUuFzsHu
	xlJNhKxEg+w0Y69bc2dOmluzMH62/hqQZqZODtHF6S7QuVhwUTOFKRLJ
X-Gm-Gg: AYBFou3r2NyFaaaschZjGKlYrs3YA+KdbKP3zfCv2zrSZDBOmCTe7Vvav6yTp0yGxnx
	iDd9S52vHTDtVJ4ALOX1Gz4dGHv1CbNrsF/b1UYaJG8+UzPs4tdJtwbB1QBFSJ3P9bhJco29Ud4
	pTcdBGvg3txHiZYKR30NE6uhtxIiBdcbpM4E3Xf/wCxBNN6bxd89lOfu83vXxFfwdhraM5L8JOx
	DbrTgpO9zWu0XfMryAxrkkF0B/1bIx9V/5bSIdJVAdcZshtcVAWBxV9Ug07q8UXGzzHCiWSJv56
	SI3QWCo3bkWwyhCdU4BVmyJoQFFBUQCU2cpklxxS7ujrWaQ6NhQz8941uQYJ/j6VPSx3KFiBhSy
	oLe9Nv42MnIj/AHV44QAdwhrlVcw2FU8YolNXKBaNaa5+DcEXElJscy+56l/K+mFVRi8vkGXq16
	67AjANcJGet0bc4woifBlhPNcTQKKisV4V01qQ
X-Received: by 2002:a17:906:6296:b0:c21:450d:cd88 with SMTP id a640c23a62f3a-c29e51e1395mr226379866b.6.1789574423786;
        Wed, 16 Sep 2026 09:00:23 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de454b4csm165476666b.17.2026.09.16.09.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:00:23 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Wed, 16 Sep 2026 18:00:20 +0200
To: Hillf Danton <hdanton@sina.com>
Cc: Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org,
	Baoquan He <bhe@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
	Dev Jain <dev.jain@arm.com>, lirongqing <lirongqing@baidu.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH RESEND] mm/vmalloc: Use dedicated unbound workqueues for
 vmap drain
Message-ID: <aqq9FM3ti6NIHxQ0@milan>
References: <aqgnOoOjWxRtaqxZ@milan>
 <20260916001228.644-1-hdanton@sina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916001228.644-1-hdanton@sina.com>

On Wed, Sep 16, 2026 at 08:12:27AM +0800, Hillf Danton wrote:
> On Mon, 14 Sep 2026 18:56:26 +0200 "Uladzislau Rezki (Sony)" wrote:
> > This patch does not use queue_work_on() semantic thus i do not want to
> > queue all helpers on current CPU. Instead scheduler does balancing and
> > that is it.
> > 
> [Fair queue in the Eric Dumazet accent]
> 
> +static bool
> +schedule_drain_vmap_work(struct workqueue_struct *wq,
> +		struct work_struct *work)
> +{
> +	if (wq)
> +		return queue_work(wq, work);
> +
> +	return false;
> +}
> +
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/workqueue.h#n697
> 
> static inline bool queue_work(struct workqueue_struct *wq,
> 			      struct work_struct *work)
> {
> 	return queue_work_on(WORK_CPU_UNBOUND, wq, work);
> }
> 
> queue_work_on
>   __queue_work
> 	if (req_cpu == WORK_CPU_UNBOUND) {
> 		if (wq->flags & WQ_UNBOUND)
> 			cpu = wq_select_unbound_cpu(raw_smp_processor_id());
> 		else
> 			cpu = raw_smp_processor_id();
> 	}
> /*
>  * When queueing an unbound work item to a wq, prefer local CPU if allowed
>  * by wq_unbound_cpumask.  Otherwise, round robin among the allowed ones to
>  * avoid perturbing sensitive tasks.
>  */
> static int wq_select_unbound_cpu(int cpu)
> {
>  	pr_warn_once("workqueue: round-robin CPU selection forced, expect performance impact\n");
> }
> 
/**
 * worker_attach_to_pool() - attach a worker to a pool
 * @worker: worker to be attached
 * @pool: the target pool
 *
 * Attach @worker to @pool.  Once attached, the %WORKER_UNBOUND flag and
 * cpu-binding of @worker are kept coordinated with the pool across
 * cpu-[un]hotplugs.
 */
static void worker_attach_to_pool(struct worker *worker,
				  struct worker_pool *pool)
{
	mutex_lock(&wq_pool_attach_mutex);

	/*
	 * The wq_pool_attach_mutex ensures %POOL_DISASSOCIATED remains stable
	 * across this function. See the comments above the flag definition for
	 * details. BH workers are, while per-CPU, always DISASSOCIATED.
	 */
	if (pool->flags & POOL_DISASSOCIATED) {
		worker->flags |= WORKER_UNBOUND;
	} else {
		WARN_ON_ONCE(pool->flags & POOL_BH);
		kthread_set_per_cpu(worker->task, pool->cpu);
	}
...
}

A local CPU preference for WQ_UNBOUND is not the same as executing on
the __bound__ per-CPU system kworker.

--
Uladzislau Rezki
