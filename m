Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316743;
	b=bvIZILc70fw4x7pDiZdtSOIplWak8WNsliKpFrXo4tCPUbCJ3LszA+kyRqiF3Shlo0bH
	 rRN/VBcXVKHv4vBDH0jwjyIxPuFj9ggfPeIUDFigw/m1pjNP7HkSveE3JLqBU3LEUjqOP
	 kt8EjCO+rYK9dLQieigujbWrblr0b2fF0tYSw0UClinTxCRGVrcI7itZ7T9goEYIoGOe5
	 hvaP0BGiv8gCH5dGi2XPvBAtWaFNLarJJYsEnhcpEPmL5ziNzeHutWrCu8pfYGG73e0iv
	 uRT/FXKButeWRS1rUDCt7pB482tQ0CLXRq5BbZVH38e9H3jzW4N+u3NjVP/tVjeE85Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316743;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uCK3DWsW5brHcg2UrNGkrWpwotXCDgVLqXuyjt+/CDE=;
	b=qapS0A6jiz704IxcWxzHMoO+Mk+IomOkNuEO4LHzZ4ueHcF7LCWLgYGzOwq3rBf1dp+0
	 CrUIUarR+HEFRn/vkk51RtqQbN/p1vd1Ut7/+Rs1yfZZdZauCQpdb4qk54sfQ5R384DKa
	 ohCggI6AGarOtoAw2/p8Ui9BpfgAf8qxFMHPoLdw9T3kZABKsph3dkWdit3LjO7jhQVGs
	 8TZy8955vtVGPlqqe/G+svHFkEUfP1Z+OeJDBkDHwaLL1ZmTb92B/dCO6mQTJL6Mg5EoF
	 X6pZ1f39QtUm/v/Loaqk6l3ubNLZ25TcqAFQroDCGvIHu2CoY9ApmIHadp5w7uZ9+ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=irgaFATm;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NJBumCqO;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9525606BFD5
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9525606BFD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=irgaFATm;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=NJBumCqO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794316741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uCK3DWsW5brHcg2UrNGkrWpwotXCDgVLqXuyjt+/CDE=;
	b=irgaFATmW7i1hwv7tnQawh/3pf72iYXWNzzBFUG4GwABRgi4cWvnnVUWHqGxmVB1+Zxf/C
	JFmvivtNpbaYBp31o00Ocumigrzrv9NFgLBiA7rR5cRpPQsRwEULeoylbAW3T0lXCWmdhN
	7fkptwwoTKXEVJE267g4+/IZufv7a68=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-PdhV6RmXPKSiktP-XKBQzw-1; Tue, 10 Nov 2026 08:18:59 -0500
X-MC-Unique: PdhV6RmXPKSiktP-XKBQzw-1
X-Mimecast-MFC-AGG-ID: PdhV6RmXPKSiktP-XKBQzw_1794316738
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49febef74e3so13869235e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794316738; x=1794921538; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uCK3DWsW5brHcg2UrNGkrWpwotXCDgVLqXuyjt+/CDE=;
        b=NJBumCqObc+eY0/qBEhU38pm05rcyolsQTZaUxXYVbxPwYBwCJwgF439lA4PENvlqD
         pjbGMLTs7j7UAK/YKXJpwEVRutWKUeoT41AmWGs/Vyyrr4Nrluqjp/ABJoym1rR0KvAx
         C3FilF0Um11cWyOieP6xJ9SY9Ug1aIar8o+GABHy8F+edd6bL1FD8JXwhDpRmGEyj4/a
         X+/WaYCoX6G6Xbz/AuZj7bFeeX83EMfzxsRuY+fFPaJFTmlzEiWr8rqHKD/g63FOSSlm
         lxQQhnEfA9k1dKR8I6Ye9ii0obYsM/PC12Mh7oS7KagG8H21tbvnBMNt2PbFaDNcqt2t
         zs1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316738; x=1794921538;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uCK3DWsW5brHcg2UrNGkrWpwotXCDgVLqXuyjt+/CDE=;
        b=RAwFZsWTwWAw2OJAiOjTohXhsJ3OTdFakyewexwLrTFoqfl1Ivt7b2I/AezZRQXi+/
         SnYrlUomQ7GNL33UqR6tcKZvE7RmW1osUM3jw17tDfs3LjMZbzVuAshp4ZZZJmW5CJ+j
         89+ME9Cynyc4yRvd2pOsVVPSNBc3N4vl1EtSSpxDQLqyIj6V13Mxi7XM+xXSyACCoEv9
         bR/22rc5uMtzWJNfSn150GID0sljttRliVDcKRai1pwDZ6kr6pW5/o33hM9dHvrSrlLa
         u4PqWzgEJs5ygPXPnlZGEbv6cmI5vxkierQ0da6Xg80c5a0kPip/JMgHjWTqqFIdMaRo
         gm1Q==
X-Forwarded-Encrypted: i=1; AL+hErGj4mQ7MeCNfrbbxErNdT5bkQKgP9IHGbu06PpLbP9ZI+9EpJ/Z50wTgYT7w7XUwOykijjrU4jZO/T2Q0U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+CaxUiFygLM1XV/cOLB5F5V+QFuQUriSZBKCzUNjeFWB69sq9
	JgvZ6HABMdrsVhXnrQJeGPvBEjQIBBTTyC/mfptIH74XwQKFf5U3L8KSRDNINx3nXfJfQyG3r9V
	Ve7uOz/TP9mJfVMGd4527tRYay/KUbaHu8onh0rFLWxpTF5UscMrepzKCQCWEIoxrTg==
X-Gm-Gg: AYBFou39ShOGIBdlyl2IRDihQGSKflzEDWuZudTlT4vULzU5b9mH3P+qAFZNz1taaPr
	PkRCRg0B7Wm22Vtt7uuAnHZ3d4cX2R5vgzybeWx6Ac79scK8XQyvVtXmjrvAFWQ6d73nmdGm+pD
	KigCdEIXu0DrJlZdbk4TcVG3a8j5HOer/uWY+0VEceRzv6aOXEjYKn57raSC3GzenttM1sqXtiv
	iPy0b5Es8+7DhfSdVdUEdGRzZMuuFP/tiUq4RC5W6ofHMxVD7QI8KYggvU1gQWeznDTm1URkDee
	aPvm+qvvU1gf+Io2hbtyaWcSr0aYzAdFbZJjYnsoovYwKW8Bus6gjNgBsJwR66rbgE+TRoNqOmb
	o7HyxNB8GTaaQEdm3kfPTlNnfqlig94qXyhc6/h37HatRjSlVvQY0/oXErwu83Z2nKR+/nlZpXt
	Z48nw=
X-Received: by 2002:a05:600c:870e:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4ba0234267amr43353225e9.8.1794316738339;
        Tue, 10 Nov 2026 05:18:58 -0800 (PST)
X-Received: by 2002:a05:600c:870e:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4ba0234267amr43352395e9.8.1794316737684;
        Tue, 10 Nov 2026 05:18:57 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0236f03esm49827465e9.3.2026.11.10.05.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:18:57 -0800 (PST)
Date: Tue, 10 Nov 2026 14:18:54 +0100
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
Subject: Re: [PATCH v5 09/29] sched/deadline: Reset the deadline and the
 runtime with the parameters
Message-ID: <avMZvuEdV8ua36jy@jlelli-thinkpadt14gen4.remote.csb>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-10-mathieu.desnoyers@efficios.com>
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
In-Reply-To: <20261108185406.1549770-10-mathieu.desnoyers@efficios.com>

Hello,

On 08/11/26 13:53, Mathieu Desnoyers wrote:
> A task that leaves SCHED_DEADLINE keeps its parameters until its 0-lag
> time, so that leaving and coming back gains nothing. Commit 209a0cbda7a0
> ("sched/deadline: Improve the tracking of active utilization") moved
> their reset to that time. Before it, the replenishment timer did the
> reset at the deadline. So a task back after the reset found its
> deadline passed, and started a new period. But __dl_clear_params()
> resets neither the deadline nor the runtime.
> 
> Now a task back after its 0-lag time can be enqueued on its old
> deadline and runtime. With runtime left, its 0-lag time comes before
> its deadline. Back before that deadline, it would first spend the runtime
> of the reservation it gave back. Back after it, a constrained task
> would be throttled until its old period ends. "sched/deadline: Do not
> lose a throttled task switched out and back" moves the deadline of a
> throttled task on. This widens the window before the deadline to about
> a period.
> 
> A task with no parameters of its own, boosted by a deadline waiter,
> keeps the donor's deadline and runtime after its deboost. If it then
> enters SCHED_DEADLINE before that deadline, it runs on the donor's
> runtime. On v7.4-rc1, a task of 10ms per 100ms ran 40ms of its first
> period.
> 
> Fix this by resetting the deadline and the runtime in
> __dl_clear_params(), and in switched_from_dl() at the deboost of a task
> with no parameters. The next enqueue then starts a new period.
> 
> The Sashiko AI review found the first case in the second posting of
> this series, and the deboost in the third. The deboost_resets_period
> case of deadline_bw_test, added later in this series, tests the
> deboost.
> 
> Fixes: 209a0cbda7a0 ("sched/deadline: Improve the tracking of active utilization")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---

Nit below, other than that

Acked-by: Juri Lelli <juri.lelli@redhat.com>

>  kernel/sched/deadline.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index cf24d2df6bfc..cc43c5eeae51 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -3573,6 +3573,16 @@ static void switched_from_dl(struct rq *rq, struct task_struct *p)
>  	if (task_on_rq_queued(p) && p->dl.dl_runtime)
>  		task_non_contending(&p->dl, false);
>  
> +	/*
> +	 * A task with no parameters of its own was boosted into the class.
> +	 * Its deadline and runtime are the donor's. Reset them, so that its
> +	 * next entry into the class starts a new period.
> +	 */
> +	if (!p->dl.dl_runtime) {
> +		p->dl.deadline = 0;
> +		p->dl.runtime = 0;
> +	}
> +
>  	/*
>  	 * In case a task is setscheduled out from SCHED_DEADLINE we need to
>  	 * keep track of that on its cpuset (for correct bandwidth tracking).
> @@ -3999,6 +4009,9 @@ static void __dl_clear_params(struct sched_dl_entity *dl_se)

Think we want to update the comment that comes with this function (as it
now clears also dynamic parameters).

>  	dl_se->dl_bw			= 0;
>  	dl_se->dl_density		= 0;
>  
> +	dl_se->deadline			= 0;
> +	dl_se->runtime			= 0;
> +

Thanks,
Juri

