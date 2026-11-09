Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228140;
	b=kc4EQBUjOuQy2zTzvLKEApjKMMBKM0krZ3NVMuGcxZ+plnHihQgnvZBCb+jTHszU34Mj
	 Vj9kxM21OKDUOg2swrf6LDBpqWTzZt+7EXfrMujpYqkdSFzwvMq441jHZ5DTh/UIYVNBa
	 jH37VkouTNmxNSdKahqQW75fAHUCkSD/PQn+FIgJwYkbOE1MSBgbdi3WY+05YujvA8qNn
	 oXWi3EYo4tVNGM1EsNtO3BgyLvP6kgNJRewMwhkg9zpPVL/DzXO2WBW6k/tudW+nWXf58
	 l3AfqKobc2EvXRMzljjEt318zRBkFzG3jztJ3RwLGr1uN3kVWfylTWeq013w/VUUiwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228140;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=iydcdsyCbn/1HMCuIAo5cr9JeqRLn8CAd0o0w+T8bOU=;
	b=gbZxV+qFONz7NfiIedOlipRohVeNFhHNwG69vSHCfviQkCb7ItQ5kleNdhlOhz73vB/k
	 PUShf2xMenloyHJbJx7bkEeXz7wYyGeH8U+L8BaYMT00w0sHo0Tv4JmCLghBqoUDB3bLZ
	 RYevsYFAaE0P2+YRZIQfYv/Y52Jn/UYRXNg6vJZoaCxSUcILD+qJq0yVAEz4jjetNbIsC
	 Tr1FDDEkhg+I6YqnDCika6WDCqukq7toqksgZfmZ/k6Gj0HDcB6jzAbE1BCo4MkehaCYL
	 0CDaWQCRrEOk5q0p0Q0TssMtmxBNuzeRihA+xbCMRiwrOelGqqORt/M3mxyD2pORxmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CApGwua0;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pluYaXYO;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E717A606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E717A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CApGwua0;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pluYaXYO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794228139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iydcdsyCbn/1HMCuIAo5cr9JeqRLn8CAd0o0w+T8bOU=;
	b=CApGwua0AdngnI9aQO07XVnDBnLBQcRQH+093EzexAdDs4FB8ZgAPupWfql3XxhwrthWKA
	JdK+czj/TGwaE1HmIYOpd/hzizpZMiNE1JQ4HO3bLeYCSWCElgcVOIPyFvxi/6DmYoEv9v
	xCMpqNxhbLDZ1bq+y/pCZKnmDiFSHA8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-GYrzfze-OCKRGxpIvwER7A-1; Mon, 09 Nov 2026 07:42:17 -0500
X-MC-Unique: GYrzfze-OCKRGxpIvwER7A-1
X-Mimecast-MFC-AGG-ID: GYrzfze-OCKRGxpIvwER7A_1794228136
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a70b42bab0so8320415e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794228136; x=1794832936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iydcdsyCbn/1HMCuIAo5cr9JeqRLn8CAd0o0w+T8bOU=;
        b=pluYaXYO9Z9mXrCtps+gEWLNOMtSEIvVsckq8L6y6OF0oItWFAJi09sk5bpViNP0hJ
         DPBx71ZOSSQ9us5U1YqnNGdn7FtDYxG/FW9j0+rng1m8YxNMvD9DfdfoPhvCtb7A5L15
         Fn3nMMR+k3dJunGbtTqqFzHkg1MLG8DwOJbYUw49Qk8+tdVRvRrSTJpvP0PItBX5d/GW
         hPq3BIlO1XCWUijlavaO9KSClYoyqy0tQHDnKXhQ0UNGlq5ehxbS1M/srm5x9PYofhgv
         jQ7oNlvu9a2HPdJdaBflXSgz0tjEkAQFuDYMxnMrfmdcv3lNlzRXzDpkTR+pN9iySGUa
         3S/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228136; x=1794832936;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iydcdsyCbn/1HMCuIAo5cr9JeqRLn8CAd0o0w+T8bOU=;
        b=w7FW3N+0TJ07OAZf4vcs71f+3BpJhMRdLApPgi2jjutpUO67O5XmDso7qz1t2GYe9G
         cMRQgN5X3eJBtK1lwuQRYm9uqlqm1eEYl9Mn4fIGGtEkzzf9sbpqPT+r1VOabAFRkjwt
         UJgULd2kyeh4KzxFBGM/QvN73txamSdBGz+XR+Fjz6IJKXCmUOezWv9unIQ1pi4SiM8Q
         YeGjecwCh/bXQ9lneRsSINYhaiSgTOlC3d4RixccyRq2PVfti3o2PmsB8Lg8obypng8d
         +DUK1B8kMsjOo30ltTIeYJCDdHWfMyhABLoY0CKBFHEH0zbrDBsognzlQmPXlw/TNbzC
         Z/0Q==
X-Forwarded-Encrypted: i=1; AL+hErHgcS/UZBcE9kr3KxngAFm8YJAIBCrIgngwK7nmgYMkNmN4oq1H8vkckzHmdkkustISklp2fCMfWlbxrbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z88PMdMeK05hCqbQ8mkt3bcUDWhmzqDok2eVwkBl1dP959pv506
	Ni3dgqmTxX454EJ3mmwG0ueGwiWNMwDVLT2oE4LsVIzn6HkJdJ98rPH61WjFO9jB84u6LuOWi2/
	C+j9lLHNX8OjjnV2rLYStlkZoQVdWUPd4BsNhJ5hjJm+ifHKQIncBz7w2ME7W8Xevfw==
X-Gm-Gg: AYBFou34jbTurUGRQVoW6gITcgYyRcHdPSEWNOrs8sTVUyjB2/i5RFZkT5arsucUxuc
	bP7FbsSWiMT+reKlv6bA96Ji5PuCulvMKF7fAYRcFyHzDJsFzQpkW+o7PZcH+rrLq9jjomiVFi5
	rGFiy7n74ZgcVaBvxECJEiCL0QILKWu90ym8QP/hR8c9fBWBT5Snz3WWOYn4uTZMqnUOmyRowRa
	nkaxmKigyh8rpsnCCu0XCAhRzzvDxmswrn5Dvo1OrOrbWUObZViKTV9G4rw8C9+nQHEjFSpVpmz
	2cNHKG1NHlsAhw4bLnphENmZtdS5frJRYh6yhBRnxieFGrTXxr1gWfTe65X/Py1UWeyFfxxD8xz
	LYkO0wdjlaHWZc7WA0UdjSzxekNkxxcho9onEh+amkFz3Gn3FIMMeaEJ3fVCaCmp9qyx64AFXJb
	eU1w==
X-Received: by 2002:a05:600c:8506:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4b963c664fdmr75986185e9.7.1794228136197;
        Mon, 09 Nov 2026 04:42:16 -0800 (PST)
X-Received: by 2002:a05:600c:8506:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4b963c664fdmr75985755e9.7.1794228135838;
        Mon, 09 Nov 2026 04:42:15 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1f3acsm247331855e9.14.2026.11.09.04.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:42:14 -0800 (PST)
Date: Mon, 9 Nov 2026 13:42:12 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, will@kernel.org,
	boqun@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
	kprateek.nayak@amd.com, luca.abeni@santannapisa.it,
	mathieu.poirier@linaro.org, longman@redhat.com,
	ridong.chen@linux.dev, tj@kernel.org, hannes@cmpxchg.org,
	mkoutny@suse.com, shuah@kernel.org, bigeasy@linutronix.de,
	clrkwllms@kernel.org, parri.andrea@gmail.com,
	m.szyprowski@samsung.com, kayracizmeci@gmail.com,
	weihengqiuu@gmail.com, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v5 03/29] sched/deadline: Do not admit bandwidth for
 parameters that are kept
Message-ID: <avG_pJmgQr3V-PXZ@jlelli-thinkpadt14gen4.remote.csb>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-4-mathieu.desnoyers@efficios.com>
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
In-Reply-To: <20261108185406.1549770-4-mathieu.desnoyers@efficios.com>

Hello,

On 08/11/26 13:53, Mathieu Desnoyers wrote:
> __sched_setscheduler() runs the deadline admission test on a request
> with SCHED_FLAG_KEEP_PARAMS. But the task keeps its parameters: the
> call skips __setscheduler_params().
> 
> Commit f4dddf90d58d ("sched: Skip priority checks with
> SCHED_FLAG_KEEP_PARAMS") made sys_sched_setattr() copy the task's own
> parameters into such a request. Then the priority checks pass.
> get_params() copies them without a lock.
> 
> Another call can change the task's parameters before
> __sched_setscheduler() takes the runqueue lock. The request is then
> stale, and dl_param_changed() takes it for a change. sched_dl_overflow()
> would put the stale bandwidth in place of the task's own in total_bw,
> and in this_bw for a sleeping task. But the task keeps its own dl_bw.
> Its release at the 0-lag time takes that dl_bw, and the difference
> stays behind.
> 
> Fix this by skipping sched_dl_overflow() for SCHED_FLAG_KEEP_PARAMS.
> There is nothing to admit for parameters that are kept.
> 
> Found by reading, after the Sashiko AI review of the first posting of
> this series raised the boosted case of the previous patch. Not
> reproduced: the parameter change must land inside that window.
> 
> Fixes: a509a7cd7974 ("sched/uclamp: Extend sched_setattr() to support utilization clamping")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---

The change looks good to me.

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

>  kernel/sched/syscalls.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
> index 0e8b5c7324f6..894f93a80d5d 100644
> --- a/kernel/sched/syscalls.c
> +++ b/kernel/sched/syscalls.c
> @@ -690,8 +690,13 @@ int __sched_setscheduler(struct task_struct *p,
>  	 * of a SCHED_DEADLINE task) we need to check if enough bandwidth
>  	 * is available. Keep this check last. If a later check failed,
>  	 * nothing would give back the bandwidth it reserves.
> +	 *
> +	 * With SCHED_FLAG_KEEP_PARAMS, the task keeps its parameters, so
> +	 * there is nothing to admit. The parameters in attr may also be
> +	 * stale: sys_sched_setattr() read them from the task without a lock.

However I had to wonder what usecase would still make sense for a
KEEP_PARAMS call on a SCHED_DEADLINE task, I would say a !DL params
change (UCLAMP for example) for a (at the moment) DEADLINE task that
might become !DEADLINE in the future? Maybe we could add this to the
comment.

Thanks,
Juri

