Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794469833;
	b=0FvSI0frakKAtytJDFu5iBubBfJRKFPTQ0P8Wi/iVGdKJsM9M+N9tRQgnpqgTuMJZdGW
	 3xdL0BmTdn5vNXUPWZPEvtFWZpcg28UCCA6mERUWvmt9dJgBLXapN8bp2sxvH8QLIBate
	 RnefEIPrCBfTwyczmYO1tAaXwaMsM1gFYSqYOoIbAnyqLarTgXlIHK0AiHGIff+m8CIsY
	 s1mEJlGpWG77b8pm8Icy6j9qB5xE3x2tkUKss4cooqjjTclE/rk/g4pKeyjvs/r6ZmCYY
	 lSH0t31z+QziBNlftgYQjFfqTCJnDrjezUrtNi62Agk1rCNLESlG6UxnMBT1x1F7jHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794469833;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=eAEaXknwutXsE98av80d8xzVhjo04EdbVXbDbQO9bFo=;
	b=2OzyZ+uv8ct2oX/WJ9tDQIFWpKMarg6dTJ27aH1I/NTxbf7hWJWGoqNpdlbvDKI8apVR
	 5Liun1AOy01KBVWn3zIpeF4QkWXiGqSIrtd/BYIPSBZIOth4MSkTbRjJxE+BAiNlDCP7+
	 Ki/hddF53E5xVQ5krr1Sl5BedCJPs2pHV9g8JVqfy8nL5s9FtZ01Mu9T0/5C4tqsr9rqc
	 PArHhUYxf/KuyFqetX1VnuiS7w0Rnt2rE7co9LaFp/bW5qJXC/wUCuMeCbo/sGRtQOUfb
	 Nr9S9NFCmadUH/CHVl/u+74WZ6xExqFa7lYLadewReilgT+EKCVG6WB3houz0yH+O4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=duvlBj51;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="p/Gu0hoo";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFB5606A330
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:50:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BFB5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=duvlBj51;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=p/Gu0hoo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794469832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eAEaXknwutXsE98av80d8xzVhjo04EdbVXbDbQO9bFo=;
	b=duvlBj51DJwoJrwPqvVkEDqOIkdNZPo52vtG88+8HfSMcHKqU8FX7JQgirOdFREpwk5Xmj
	Np67sr+SK9VMDW0j90p6VaOBMvwOZMjHvUE/LtuIGkPHXFOXTubyBjviNHDLUpIqZ1OlR5
	RLuuuM+uNQ2uEAEq3i5VbogksDekDj0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-1kvJwsDrMLmgC0Kya-4IAg-1; Thu, 12 Nov 2026 02:50:23 -0500
X-MC-Unique: 1kvJwsDrMLmgC0Kya-4IAg-1
X-Mimecast-MFC-AGG-ID: 1kvJwsDrMLmgC0Kya-4IAg_1794469820
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a1f03f2e8aso33172415e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794469820; x=1795074620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eAEaXknwutXsE98av80d8xzVhjo04EdbVXbDbQO9bFo=;
        b=p/Gu0hoomjBc8yZPua8YNJ37DnT27J6VngIODKkO4Yi8W0gyttHL+FD6Gu811s0G7l
         /XFn5dsla40iCdjVO5K0fQO4qt9sjbpoKaZcBfYmrUt119EsVgR1ix4O7qi3PJrHTSJw
         dsdO5TKNTnCvRxXTU2VCXnkzbjG1extd4aQkBdCfYTEMGZdAXprUsD7GAibCkxRIxzgi
         mH4D252zxCNC8SycFZFDI3k1HmC2NQtZkmwCWrf7QWTwaAWoVK+p0zwBWMHVOYYPu2h5
         LougqPqIkN/psgo6/VvwKafSABsP+nUD4Y3Il8OUrIRLrloTCF/l1H+BCzFUziwSwWna
         i8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794469820; x=1795074620;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eAEaXknwutXsE98av80d8xzVhjo04EdbVXbDbQO9bFo=;
        b=OroT/totvAQxyHjMzCcqU5oJIiS2Ei349KMrHqI/yC1iY62p4TXyTv7JB0RAqcqQ8O
         1gX6JawbeJPzc1lU2jaIOtfVH6e2eDU/1YNZkQPdP0b91L3vyjvBohFwn5F/McAT1IX6
         ifs3h5l/foip03C/WRG65YtB535v5G29MgJVBdxmXAr2mpPTFIBsWdzhSKNQd/G10O9w
         hJsdP1w3Y/TKc96DyGOUkqIgH2Cp6VHo3yK08fVC4+Ig1dkJbNWUiQqwLmK/Nl2Oht4J
         EVmblcTdB0CHSbI6GzIdy1+QZonFdg+CwkrZuzW7NaeQWI/VZ9aOgRvPElTVv2J/vZhS
         qEaw==
X-Forwarded-Encrypted: i=1; AL+hErEXsZcEZ6E+OEooMQ5c5gV9RnzjqOUAtw4lE1CdKt4dPIQDvXlwsbkCfPVorCeQB6llA3ZgVOB9dN6d8YI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GufrzvenVe825h4ZGP4WfXIIVl+eDVZoDBkhbabIjaXggqnAU
	xJ9fd3JXZ7e7OyVTfcIKiljZbKl+tmIuc/stIEdzLYPuIg+EhvXoMYrN5ppPXij0FWaFBndxMKo
	VMLKc3t+UPnGbTCjGYR82n833oLPaPMC9BpjbgWm1tUw3XJPKowiNbTVasdTaElH0QA==
X-Gm-Gg: AYBFou08ihZbKLMj4MtKVpA/UE+e1E+uWWClgTUsf7du/QXDMvdelKNMtIBTKXahCmT
	VjK6ooITPBmTTRchHdSi8yyq/kWsG3rcJIeZc6et9OOi1k+V43YjBaIPX6joqVg9yptXNlAETbU
	dpzEbJS5gfrfSGOpBipqvZs1tCF041doxvMfcw5v/COoGTXyYBLcLMYlpzrPAbhHhSxUgvrKqn9
	4X5y9OVjL4eVvelwYrrsZBSHJTPpMyWgDuo9tK/Pofs1FyAxtN+8DpepbUYUiQeUinZWYQmczHY
	Wjop6PYQENKavvHJUTRQ4zgWrcJuZ5ewmY1rFfZ7R7pj/LVrvRuLfG8qZ85BBpNg742/cqSYoBg
	2tLnuX/lznbich18zLTbZn2NnVb4PY6p8PJE67Ml54YZhLBvdzY7+apwwm0XlM2g6yN2N0pe4Mr
	nCcNc=
X-Received: by 2002:a05:600c:1986:b0:4a1:f7f4:7cf1 with SMTP id 5b1f17b1804b1-4ba09376d2dmr82685555e9.11.1794469819088;
        Wed, 11 Nov 2026 23:50:19 -0800 (PST)
X-Received: by 2002:a05:600c:1986:b0:4a1:f7f4:7cf1 with SMTP id 5b1f17b1804b1-4ba09376d2dmr82684805e9.11.1794469818478;
        Wed, 11 Nov 2026 23:50:18 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e28c882sm52359655e9.6.2026.11.11.23.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:50:17 -0800 (PST)
Date: Thu, 12 Nov 2026 08:50:15 +0100
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
Subject: Re: [PATCH v5 19/29] cgroup/cpuset: Wait for an attach before
 rebuilding the sched domains
Message-ID: <avVvt8wlKqW4LqTa@jlelli-thinkpadt14gen4.remote.csb>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-20-mathieu.desnoyers@efficios.com>
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
In-Reply-To: <20261108185406.1549770-20-mathieu.desnoyers@efficios.com>

Hello,

On 08/11/26 13:53, Mathieu Desnoyers wrote:
> cpuset_can_attach() reserves the bandwidth of the deadline tasks it
> moves in the destination root domain. cpuset_attach() moves their
> bandwidth later, on the strength of that reservation.
> 
> Commit 75f7a25ec6bb ("cgroup/cpuset: Prevent race between task attach
> and cpuset state change") lets cpuset_attach() rely on what
> cpuset_can_attach() set up. The writes of cpus, mems and cpus.partition
> wait for an attach in progress, in wait_attach_done_lock(). CPU hotplug
> cannot run in between either: it takes cpus_write_lock, and the attach
> holds cpus_read_lock throughout.
> 
> But a rebuild of the sched domains does not wait. A write of
> sched_rt_runtime_us and the energy model rebuild them through
> rebuild_sched_domains(). The cgroup v1 writes of sched_load_balance and
> sched_relax_domain_level, and hk_sd_workfn(), use cpuset_full_lock().
> 
> In this example, a rebuild drops the reservation. T is a deadline task
> asleep in root domain R. Thread A moves T to a partition root P, which
> has a root domain of its own. Thread B writes sched_rt_runtime_us:
> 
>   A                                      B
> 
>   cpuset_can_attach()
>     takes cpuset_mutex
>     cpuset_reserve_dl_bw()
>       P's total_bw += T's bandwidth
>     drops cpuset_mutex
>                                          rebuild_sched_domains()
>                                            takes cpuset_mutex
>                                            dl_rebuild_rd_accounting()
>                                              clears R's and P's total_bw
>                                              counts T in R (not moved yet)
>                                            drops cpuset_mutex
>   cpuset_attach()
>     takes cpuset_mutex
>     cpuset_attach_task(T)
>       set_cpus_allowed_dl(T)
>         R's total_bw -= T's bandwidth
>         records a CPU of P
> 
> P now lacks the bandwidth of T, and admits deadline tasks beyond its
> capacity. When T leaves P, P's total_bw underflows. In testing, the
> race left a destination admitting 3 tasks of 10% too many, or P
> admitting no task at all.
> 
> Fix this by waiting for an attach in progress in
> rebuild_sched_domains_cpuslocked() and in cpuset_full_lock(). The
> latter then takes its locks in the order of the writes of cpus and
> cpus.partition. A rebuild from CPU hotplug finds no attach in progress.
> The online, offline and kill of a cpuset never wait: they hold
> cgroup_mutex, which the attach holds throughout.
> 
> The move_vs_rebuild case of deadline_bw_test, added later in this
> series, tests this race. Without this patch, it fails in 5 of 8 VMs with
> 8 CPUs. With it, the case passes in 8 of 8. The next patch needs this
> wait too: without it, it would give back a reservation that a rebuild
> dropped already.
> 
> Found by the Sashiko AI reviews of v2 (the race) and v3 (the cgroup v1
> writes) of this series.
> 
> Fixes: 2ef269ef1ac0 ("cgroup/cpuset: Free DL BW in case can_attach() fails")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---

This looks good to me.

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

BTW, this and other patches are actually cgroup/cpuset domain, so we
will need to ping Tejun, Waiman and others at some point (if they are
not looking at this already :).

Thanks,
Juri

