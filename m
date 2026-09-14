Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E33047253C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789397764; cv=none; b=ZUNhEVIDjKEhwFfTZLjdo5LLvzihiik9GZW5gFGL2TkIBKKEvXyMjcyCnmkIjVvgObS4WTbcFkbDQze8bWvdTTEJkXPalsEoLsvMojq+RtDQ1UtE2zk14CCfQB/4/0mSDpH85jBLBahbPaWAY+UFQKJaDi+aPWxExVmnTYIsnv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789397764; c=relaxed/simple;
	bh=3ovd325btL5vmESfv/dro48ZvUDYxcKcBGU5gE6h0fA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aBvFUXYvUeo9I6mm6jljKX+KK6RLgOTMqoGxGIKcD9lmx57LK1bFY120OheflQwWzIRW/MuvsBqmRS1JrIaVHRzjzGlxPF3jFzaPrBgahHJwj0QqDtdyBQxHO77jJBUNDbqvjhvULO3Nf7n+VFhK1ag51StrwTWeL+9QfhewqM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kj93xPMC; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kj93xPMC"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2db858d60e0so29869675ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789397762; x=1790002562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f9UGDeYUwW5o89QNBV92EL1KQUC5ezZOIPmykoNE46U=;
        b=kj93xPMCeT9QbPCk3yfrtJWeERRKI62c5ImUtk9+TjSNQQBryUEiZelpEnxUTqQU02
         Mra6FiJvbkca66+GuQa6LV09MIVySLaraiJH6hpOHk/ow2II8/ccT1RE8L3X5zAjLS1I
         zCYzGPqHlBiajh7I79+iB25bS5lq1kq652NLCVy4Ml3kxg7SovEsdNzG4i7O6QwvaEvO
         mzwO+6hjNOZuIct+U4j9H/2h/QuaK1NAhOO8eUjU4fMn8MBty5Ig3mC+txhrPRMFAp3q
         lkNSDNZ6SJerdtMybfCq6sVFTzZPqBG/OIEJ/58z6kKSHVg1amC9izHomB9JbPj9Oz9Z
         DosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789397762; x=1790002562;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9UGDeYUwW5o89QNBV92EL1KQUC5ezZOIPmykoNE46U=;
        b=St891VfHa/77cp0iLEQVTzKPFwSktm0NIZQw4TlT+kJNHKxVekf27dlYmnQjl0r709
         +ySF667cS1lUB5kSOx1sLmvXCv55bBJhHNYw60m6DpMl+I9A3wwyYMSp8OIQEGKazN0Z
         Vp7x212cy8iVM5e/7sxIkxizOWnrWPJE71W7M12SsuXo/ZDcMs6hHLpEZ9ZCXUU1I+CL
         dLdF9nP+FoisUvs8t4KT3lvTPMjzIGQ1H2q13Fk4MIzsCj+8QU8zJmKJtT5gk8T5S/1q
         ctd/hOszRIopJmBHPyXGkxbL7MSh9Qon7X2MwiKjl7Q0deZrjh7tVQmwhjS0Jxut4YIe
         kM8A==
X-Forwarded-Encrypted: i=1; AKwUvBxtOUgdfUYOwSIOtz2rlx/9bdCCvG918gj+vKUustUCsjaT6vJp+71WsWG41zc7tLSvAJpuiFc109dEM7g=@vger.kernel.org
X-Gm-Message-State: AFuF++ncILWd6WMNBr8OE4T2D8pu/66NpnFNvhfEjdLYdQBu8hp3rdPX
	pJ1Duz0VwI0WM08wvyihKDtiwRqROqYLE4G9G9hl+yhZnKAglhmP6KmE
X-Gm-Gg: AYBFou2bD06H2gvNKpmlMcqhXLYtiR+GxQnN5p//VoHfSyWJbJvhYqIuSNcsLlC4MDs
	PvT996If7hfmLK6D44mCg0mTyVvo5HQje4t8GcOPjwBN+1jL7/0SAHyQ7yLds+721CMcwW2Ss+n
	6Uy6cZf1VqSuhxV6vOx5VWMAXDL4pPXvYdgXsUKCjNRoGhK1101yTg0Bs/SwBjZACDeJFfs7pFJ
	ewaL8gjZweTvDyMwU2Y3lYkeMknVmAYwPrBmLHSO1Dja0ctldrv0oNvqI+OBFNN0Cq0OFKedKWT
	8SPYS9b30raELaW7T8rpNYnKuq3n9cESP0HFH1HKqntJVzwqb2Mt5EYRBsLSMBQczb9kkG3qnLG
	P5QTq1z2u/lcIwqt6WXax8RPeljTfuf6Z/kNWvynuA9qmaMnQj0h8E75EI0ZnnMJzWuEUczW3CF
	8mBCj01m4IB8aVBET4uIvh2ZqC9nZ0Q82Kai9ZMAOLKha+zT/CujiL9LMQ96i6x551JEM6t6QIH
	teasl+4PSKgdMOtKGHWS4i7oAHYPxyIWj/3Q58rpQkt9U9kSrQ/gSNKpOuHW2CmfqfrE9qkctNn
	oC8QzKAFXrzJcdYOTVM=
X-Received: by 2002:a17:903:46c3:b0:2dd:753a:4d4a with SMTP id d9443c01a7336-2dd753a52d8mr10481015ad.16.1789397762008;
        Mon, 14 Sep 2026 07:56:02 -0700 (PDT)
Received: from cchengyang.duckdns.org (36-226-250-24.dynamic-ip.hinet.net. [36.226.250.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfce707sm51421485ad.55.2026.09.14.07.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:56:01 -0700 (PDT)
Date: Mon, 14 Sep 2026 22:55:56 +0800
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: Andrea Righi <arighi@nvidia.com>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, 
	Changwoo Min <changwoo@igalia.com>, Emil Tsalapatis <etsal@meta.com>, sched-ext@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ching-Chun Huang <jserv@ccns.ncku.edu.tw>, 
	Chia-Ping Tsai <chia7712@gmail.com>, chengyang.chou@mediatek.com
Subject: Re: [PATCH 2/2] selftests/sched_ext: Add lazy preemption tests
Message-ID: <20260914225115.Gb03c@cchengyang.duckdns.org>
References: <20260914084955.1798562-1-arighi@nvidia.com>
 <20260914084955.1798562-3-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914084955.1798562-3-arighi@nvidia.com>

Hi Andrea,

On Mon, Sep 14, 2026 at 10:47:46AM +0200, Andrea Righi wrote:
> Add trace-based coverage for immediate and lazy preemption. An fexit
> probe on __resched_curr() records the requested TIF and the current task
> slice, while the stopping callback verifies that the task reaches a
> scheduling boundary.
> 
> Exercise kick requests individually, in both orders and combined in one
> call. Verify that immediate preemption and WAIT take precedence over
> lazy preemption, and that combining immediate and lazy enqueue
> preemption follows the same rule. Also test overriding the expiry
> default in both directions through scx_bpf_task_set_slice_expiry().
> 
> Extend the NO_HZ_FULL test with infinite-slice victims. Verify that lazy
> enqueue and kick requests restart a stopped tick and make forward
> progress. Keep invalid kick flag coverage and skip modes not exposed by
> the running kernel.
> 
> Signed-off-by: Andrea Righi <arighi@nvidia.com>

[...]

Didn't have time to go through the whole series, but I applied it on
for-next and built with PREEMPT_LAZY=y and PREEMPT_DYNAMIC=n:

	INFO: preemption mode unavailable; lazy TIF was 5, immediate TIF was 4
	ok 2 kick_lazy #
	INFO: preemption mode unavailable; lazy TIF was 5, immediate TIF was 4
	ok 4 kick_tick #
	PASSED:  6

> +static int active_lazy_mode(void)
> +{
> +	char buf[128];
> +	FILE *file;
> +
> +	file = fopen("/sys/kernel/debug/sched/preempt", "r");
> +	if (!file)
> +		return -1;

sched_init_debug() only creates that file under CONFIG_PREEMPT_DYNAMIC,
and PREEMPT_LAZY can be built without it ("select PREEMPT_BUILD if
!PREEMPT_DYNAMIC"), so the two tests pass without comparing the TIFs.

Would something like this work?

	if (!file) {
#if defined(CONFIG_PREEMPT_LAZY) && !defined(CONFIG_PREEMPT_DYNAMIC)
		return 1;
#else
		return -1;
#endif
	}

Thanks.

> +	if (!fgets(buf, sizeof(buf), file)) {
> +		fclose(file);
> +		return -1;
> +	}
> +	fclose(file);
> +
> +	if (strstr(buf, "(lazy)"))
> +		return 1;
> +	if (strstr(buf, "(full)"))
> +		return 0;
> +	return -1;
> +}
> +

-- 
Cheers,
Cheng-Yang
