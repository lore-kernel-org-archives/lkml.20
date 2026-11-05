Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862955;
	b=qBIRUIurMxm1+qA9gHdrsjELclxhffpjivlqbRdjGxyry4wdfauarn8pR0JvLQkMkAet
	 MtezO+nN4SYJrfBGHJHlFHR61qe9UalWLMPmh39KDr2Irk/jHdOFU7mDOL8EsX39qUhXk
	 fZFjAo/9K9cDT20jzqFwRM4FO+MFk7pinjbnwZ14MqHAmZAHDOgvPZy0zxQtHCrEFWXOT
	 ye8JTWhaRkprQvcdmYFeJva5zFBGjRgyMO8D3Y1E6V1w0hYcOdIgIpsx4JDQbHNSetZ5V
	 IgRZg31ZucahjjAMNiDgUeVh4KqUkrawICOS4r5luWl37HgSxUYwMAZeP6XypkbguHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862955;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=OhNvDsZJpE4KS30+qaZ5e8X21eLLhO3Q56fZ1Ek8d2I=;
	b=YUnFNv9JJDr/6AyiIcQQYsOgR2e88l8NPz0YYpG5Pv9Ks9Bhk+gENS7ABz5qElFr189t
	 /1/4jRU3EN+CIoilIzpEiNKraRg8XnFPlyGnJLvSOznWeTTykxUQY0vMQP0X98X9yhmAx
	 7QVlUI3jK5FpddC3w4J8taQQ7rlgg8G1vIek0GDsJH/KQH8z4B//PImboKIZs3WPI4hiO
	 MBZanmJqTCJHwqb9+KonXnKLZsQmIJwJdyi4VbAYdGeF5N44wfXAi8EbrcKtMwULXkJ4a
	 PXRAnpvTFc4kk2weGtf73xseyBf6BjxoidkfllWYBvhkgvz6gSaRCs/qGCmpm/DEcbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DyE64Cep;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UC6dPSWO;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0908D606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0908D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DyE64Cep;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UC6dPSWO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793862954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OhNvDsZJpE4KS30+qaZ5e8X21eLLhO3Q56fZ1Ek8d2I=;
	b=DyE64CepA+WkHBw620xDqa78UQMllzWe4dil9Adj7wSj0i5NZfe+zc4JGXkes3L0/zrbap
	687iDF0/6ARJSh6HCzKvuymlLmI/+bMm4J/Z4xenmT/p/ExuV49prS2zQYAuCiZ2XjjMvI
	hflQfSObd/ugxWL5u63BX2T/krEHjFw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-8uvhm00OPkSvbncUVvluig-1; Thu, 05 Nov 2026 02:15:50 -0500
X-MC-Unique: 8uvhm00OPkSvbncUVvluig-1
X-Mimecast-MFC-AGG-ID: 8uvhm00OPkSvbncUVvluig_1793862950
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1fa972b4fso8602005e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793862950; x=1794467750; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OhNvDsZJpE4KS30+qaZ5e8X21eLLhO3Q56fZ1Ek8d2I=;
        b=UC6dPSWOvEiKo+YH17r3sJM+YGz+JwKvul+7LxPXUtwj6RL+6qFbI6JugCqMlwcyIS
         Ysz20AhBz904sHWlq8h5BrXnZnsCEuii2vQxyBozXHqHJpe8yAzyuW8QMBmoHYn8KEw5
         5oqJiAMb1qYcWEo3xoktCD08dgQ90usype0flBeLFooyXgUSFzg/ECgJfMgnHl+4+Sc8
         JSDfmVai8SdggbryHet7nQRwU4RWgeDgYkAdZhAZWz7EMKofHNM1nLReci5DfLuzZgyD
         33E297uS6YQXtwVqkF3dE9u6mfSfxJU87cOwZSdf4n2+3p4+cjXj+1z208w+HtRXz2HY
         hKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862950; x=1794467750;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OhNvDsZJpE4KS30+qaZ5e8X21eLLhO3Q56fZ1Ek8d2I=;
        b=dMlHmNfB9qtA1RS7MLw8R1mK0AhRpQm8QOzg91t/8ISV0GwCLNaSO7gO3HZKY5Uywo
         3FYzOKzNcTmcRv8AEI5DJEjJLcVxgMpTduoXhpOPiI8Ko3eLaTsJiS/sTIL7vqLlbunS
         SeBB2DZDw3PCuKakrEPPHmCeqo98iJWZnomjGIQnICqoJCp/bNc0lkrNoPPIF9kuL9YV
         5VKF1OA77DT+7r+fa3O9CVIv2Gx+/erh1broP+yMiKlQEQFyqOQ1gVsxw/jDnZtL4NS3
         wKerkO4T/HnttUCFqjeWxzZeFI8C4LBVz5QM967nJESDqzYeb4cfb1qbNEf24vrDbwzw
         JprQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjwKscDmuFAL+xemQcm4x1aBLHR1bBU6tmQIlyCJ8/sR7PVMDLtX9inUZ4fw5mVkgJPDn0Jl9VAQzJAKQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Y0jrX1k+FFc2pQwqwlqevEQSYtnvJzBokaK7baCgvUY2F+eE2
	qCW/mzIBrhIzE4l9SrPdfGeBr4gjurDCyf5qMmgTnJtQmU8QNSWbIcR6cj0SOeNyUUDZnEiq3aK
	wXkYJXv5NPn3Up4s18OqHS0V9vv+nZLDpMCo7uhqicUKiDk5/QDLMWuiKtfODHwpXcw==
X-Gm-Gg: AYBFou2lykau3pTYZnxiP/cfmRfNIPYJV4uXykZibYYjafAwyA/bsH5okMvHRgb/AeP
	OxNzpV1cuCNPeoU0rgJ1mFwMeYFJBZogvKv0TUR8XA9n+B+Bmq3vkm9bpo39f9miHsMTS1uYXhX
	P51VyhSCnwYNe7RQ6vfn5HfpPdd9g27ZVGfDKSmkEqKrlg+8f92UfqiIz4if7X6CFN7FR6GHmUE
	O/SdMIEIV0yrYo9lTJqzUwmw7UQn3Dhofki2y4jZg0jImuOqcKxiJUwBCtJPWUb7VS18l4tLXir
	p5cZEOaldqRBHyIA6oJ8AsyR+RLg3VwmlU8Rrj+Px3dWQYQQUx9XV9rB9J4whxTqOyOW0FPRwsd
	TyKdLx4Tv3EOx+//CgpfvD/kZBMhQ6ZwmJXPp6cy4NuamC4k2X+KtLmEfbK1xSHYFZdFfSSI3ar
	LnUQ==
X-Received: by 2002:a05:600c:1f8d:b0:4a2:c9b:9b98 with SMTP id 5b1f17b1804b1-4ac177539f6mr393038785e9.17.1793862949730;
        Wed, 04 Nov 2026 23:15:49 -0800 (PST)
X-Received: by 2002:a05:600c:1f8d:b0:4a2:c9b:9b98 with SMTP id 5b1f17b1804b1-4ac177539f6mr393038455e9.17.1793862949360;
        Wed, 04 Nov 2026 23:15:49 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e65c8sm42015295e9.12.2026.11.04.23.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 23:15:48 -0800 (PST)
Date: Thu, 5 Nov 2026 08:15:46 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Waiman Long <longman@redhat.com>,
	Ridong Chen <ridong.chen@linux.dev>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 02/21] sched: Refuse SCHED_FLAG_KEEP_PARAMS that would
 change the policy
Message-ID: <auwtIqa4H4Fqjq6V@jlelli-thinkpadt14gen4.remote.csb>
References: <20261104211207.1392343-1-mathieu.desnoyers@efficios.com>
 <20261104211207.1392343-3-mathieu.desnoyers@efficios.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104211207.1392343-3-mathieu.desnoyers@efficios.com>

Hello,

On 04/11/26 16:11, Mathieu Desnoyers wrote:
> SCHED_FLAG_KEEP_PARAMS keeps the parameters of a task: it skips
> __setscheduler_params(), which is what sets p->policy. A request that
> asks for another policy is then carried out by half, and succeeds:
> SCHED_OTHER to SCHED_BATCH with SCHED_FLAG_KEEP_PARAMS returns 0 and
> leaves the task where it was.
> 
> For SCHED_DEADLINE it costs bandwidth. A task that priority inheritance
> boosted into the deadline class is of that class already, so
> prev_class == next_class and the class check of
> commit 8a70415351ba ("sched: Reject SCHED_FLAG_KEEP_PARAMS when it would
> change scheduling class") lets the request through: sched_dl_overflow()
> admits it and adds
> its bandwidth, which the skipped __setscheduler_params() never gives to
> the task. It keeps SCHED_NORMAL and a dl_bw of 0, so nothing releases
> that bandwidth, and total_bw of the root domain holds it for good.
> 
> Refuse a policy change as well, where the class change was refused
> alone.
> 
> A SCHED_OTHER owner of a PTHREAD_PRIO_INHERIT mutex with a slice of
> 40ms, boosted by a deadline waiter blocked on it, leaves 0.4 of a CPU
> behind at every such call: total_bw 419424 -> 838854 and there to stay,
> in 8-CPU VMs of v7.4-rc1 with the four deadline fixes of sched/urgent,
> and of this series up to here. With this change the call is refused and
> total_bw is as it was. The selftest added later in this series has the
> case, params_keep_boosted.
> 
> Found by the Sashiko AI review of the first posting of this series.
> 
> Fixes: a509a7cd7974 ("sched/uclamp: Extend sched_setattr() to support utilization clamping")
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---

Makes sense to me.

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Thanks,
Juri

