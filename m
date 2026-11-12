Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495685;
	b=eRfZX9tDTe11ePGYJ4JaZsDI8IWemx2CGejw2boYy8dP30SdqAzESu4EKBRpcDcRcEfR
	 pClb61Vu+1r8IQLngiYumbBdotXY0cfzBp0DKGX1AlAuule/waFyM9oAbkqZ2PHTRJNHM
	 B1HG01cQEUNgzBFvoPuJouuwKi7vITBkLWYdpIgzrbWV7IhjjkVz8igEBr2EXvqQzV5If
	 +AKjV3zqVWJYLAuyMfYDDx0ecP/2NVOkdfeNpjM8sx1Rd3Gj5xUsbMeup6PnHCfS7da2g
	 9fKw/yehxrZcaVcNYCuiOShZFLKUABi0IHl9z3PASlok6OAV9oEjIdJoz1d8ES2gS4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495685;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=M/6u10agl+rdRWY13WawdsYLlQi9SJfLtYTamWTVA+8=;
	b=otiv9dVtzfb0g8ERoIG5Q2MRj4jRhwcoF6mFKdUbZHj6IDGaDzLZGe9bFxdKFNdI1uJM
	 jXYf/Akv3T2YK/M4KWtiz7b2tpC6S3FM+mI72/Ws6n3j0uFkvj8zoAYG8NX9llhWqJwFX
	 Tdehtqz7WiXeQSLLqoLkVLnrMmxDPfvtyiDKVfDQh8VyZIzr/nC+PUarUqyc+bTsCDylv
	 DLIJY33WJ9Dcj9Oyz57orSFc/0q6ImNzQ5wSHr7EB4FkHd4Ywq7co2y1C/zlK+kr4guBl
	 lDs+2VbyM5QfIM4qUpjGt8t50ivm9x8+nlUhI0ByChkCE32TFnOwGRdMGQEiDnfvECg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hmiaU1wW;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RTr+R4Yb;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D03D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D03D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hmiaU1wW;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=RTr+R4Yb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794495683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M/6u10agl+rdRWY13WawdsYLlQi9SJfLtYTamWTVA+8=;
	b=hmiaU1wWD0+MVl93b/8w/eTEXYUwaBkXZ0c2PPNL9h9Wi+4my9c1JhbbnQgbW7vr6Ea0B/
	NXAAsTvyY/FnVA5vhAGRaovEWkpQkeAhqwkMoqpI5Wip2qdCarBIhos803w+KpwSnLzIn2
	jLYj7tStDcTERHCyO5iqPGjDeBJePNM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-a-l1Hj1aPWqnIjQhHDEabw-1; Thu, 12 Nov 2026 10:01:14 -0500
X-MC-Unique: a-l1Hj1aPWqnIjQhHDEabw-1
X-Mimecast-MFC-AGG-ID: a-l1Hj1aPWqnIjQhHDEabw_1794495671
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1fdde384cso30033045e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794495671; x=1795100471; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M/6u10agl+rdRWY13WawdsYLlQi9SJfLtYTamWTVA+8=;
        b=RTr+R4YbUtPb0bJdv9nKHbt5s927vcuRHj8Qc+OgK1pDd+OkXz/XRTdRh+Lp+nae6T
         l8lJ53T4GUVn9XOVe0bCKpyjw3CnwmmmXHp08IWNvpnkN1WmIOQnOrXGswdpYoBnfqCQ
         y9gE7rnEsVVfnKIv64XUWDMmG6izvPpfn4bFNPpiC+7qjOELvlLNSzLS3gpb9Lq/um6S
         O9f8JkDe7Wxx0Wh+ahSYpy3z8bupNQZI4JCTSBKci4+I5ulr0MP7RAQiXvnYM2O3UolY
         85zasF1WCLyu6xoC8IR+3v+DI32L7sVan4s8dZ2r1WSI33icXbBNVYFWTfbbmw6GYvmh
         pkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495671; x=1795100471;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/6u10agl+rdRWY13WawdsYLlQi9SJfLtYTamWTVA+8=;
        b=uyQo7Cu3C2GdSIdUtjRHkk/tjiEhzGIwdY/VfG8C+0lMIyHGQyymy0H/6Y2ntDozKe
         3RukEDO3Tzc7MZgIcHcQE+RfBXkluwurahYX5dN17XpM5QPnc1rwJO5M3e7eYD2dw96T
         BRMO2mK5fIFBOS64NFqGalHH9okeSeoyndhXJ9OBwb0izLCpJYlnJRZ4j/qvgI/0QWOI
         QR1czh54byU7N+uONiJlfb4Zio70cpkEgfW/vJYh0bmdNzEU6XyfmV6rslEx3HWxP1vo
         2XlE6GT+uOHZAgP6+Y1x7JR75fdQXxSTo4blXhXchvRdik+I8+qoz6tI1O0oaL9Er14s
         Oy2Q==
X-Forwarded-Encrypted: i=1; AL+hErGsJkNNen6rw9i6h4WGVr7LCwdj0xNRDTd6BSbgm7qpr7HSxp0bL6M06snj6cg9XC1bTgDio9PAUNWor5A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9M7jZpOzEwe++++InbASefEL8V+fzHnsLM3vKgojb5mU3dPS+2
	p4lWj//2SzU0peIgJ2pBtaZZUJlxAO0XQVkXeM5T9yfqosjZwmWnV9TjcrA3gDHnGQJecljYgzk
	Tbk1rpjBge6zoNRr1+57SnFsp5gWhRrdLhJ1lR96xTutMf4vVcYRU5qcqovSIollXOQ==
X-Gm-Gg: AYBFou0i1TxVcATP3+u1pypZ8m6iidbQTmF1FmYtCWmPoNuWvl3o7s5TbTOkLwwMxaE
	+bJwMujRrmeCC78kuFTW4Olbpxi6rMH9hUBHoNLteupiiJzys2hKQ9aFDk0kn2U4GhyFpNhKW/K
	CvJT3U7BhQjRkPPPUSIt3GTUigOpYakFBNksjJ9f9Nk1r89SBXTG/V71wA+pFlMzEF1XDo5GFzL
	pSp0GFKTbPuYfKC1xpBfv5/Zyss6U+AmhjI7NO2gn7iYHRtpUdAXB7yI3sclVT5oKzL7QEz/hGg
	mBaLMpxbHAAk9zKPiEyQzohqwWs3wbMuI+XmegKM3toboS8ihCvbV0vl7LxCrJj2aRyfvV/23gi
	0149i23lFWIaxd5TM2SgWVNxFNP7MOPVLndclJMmdkhemO43KbN5L8ONAJmJtW6G1TZmQi7Jh9m
	w/qKo=
X-Received: by 2002:a05:600c:6819:b0:4a2:167a:c946 with SMTP id 5b1f17b1804b1-4ba0935f880mr100717865e9.13.1794495670975;
        Thu, 12 Nov 2026 07:01:10 -0800 (PST)
X-Received: by 2002:a05:600c:6819:b0:4a2:167a:c946 with SMTP id 5b1f17b1804b1-4ba0935f880mr100717275e9.13.1794495670509;
        Thu, 12 Nov 2026 07:01:10 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08ddd467sm110908625e9.0.2026.11.12.07.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:01:09 -0800 (PST)
Date: Thu, 12 Nov 2026 16:01:06 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	rcu@vger.kernel.org, linux-doc@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	luca abeni <luca.abeni@santannapisa.it>,
	Yuri Andriaccio <yurand2000@gmail.com>,
	Yuri Andriaccio <yuri.andriaccio@santannapisa.it>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>, Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>, Davidlohr Bueso <dave@stgolabs.net>,
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Qais Yousef <qyousef@layalina.io>
Subject: Re: [PATCH v2 0/7] sched: RT throttling cleanup and a bit of
 documentation
Message-ID: <avXUstjABxdTZaxM@jlelli-thinkpadt14gen4.remote.csb>
References: <20261110-sched_dl-v2-0-cc9399f7aeb1@linutronix.de>
 <c2bf89ce-b9de-43cf-839b-395d28b2275c@paulmck-laptop>
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
In-Reply-To: <c2bf89ce-b9de-43cf-839b-395d28b2275c@paulmck-laptop>

Hello,

On 10/11/26 11:56, Paul E. McKenney wrote:
> On Tue, Nov 10, 2026 at 06:34:42PM +0100, Sebastian Andrzej Siewior wrote:
> > People used to disable the RT throttling mechanism by writing -1 to
> > /proc/sys/kernel/sched_rt_runtime_us. Since v6.12 they can still do this
> > but they don't disable RT throttling anymore. Instead this throttling
> > mechanism has been taken over by the fair_server which can be configured
> > via debugfs.
> > This is not really documented by a hint appeared a few cycles later in
> > Documentation/scheduler/sched-rt-group.rst. This can be found once you
> > know what you are looking for because this document describes the RT
> > group scheduling (CONFIG_RT_GROUP_SCHED). The fair_server is used even
> > without it.
> > The then there is global DL resource control which also shares this
> > file proc file (which is stuck if CONFIG_RT_GROUP_SCHED is enabled).
> 
> Nice, thank you!
> 
> Unfortunately but unsurprisingly, this gets the same divide-by-zero
> issue reported (belatedly) on the earlier series:
> 
> https://lore.kernel.org/all/e58e48c3-ac62-40cd-b5d3-2de87db12496@paulmck-laptop/
> 

I wonder if this fixes is

https://lore.kernel.org/lkml/20261108185406.1549770-6-mathieu.desnoyers@efficios.com/

Thanks,
Juri

