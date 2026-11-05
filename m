Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.247
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869529;
	b=SLv2vmM7K8fCmh30kRWdtNzOSgQZCakAdWPFE9ypfg4cRbIJBrk+bunOH9iL/9bm8AOn
	 dsoCMmrAHknPdlcdljDzNxJLZDmt1VsGakebR8jaoI0T5SwVDht12anDCfkP0u95LehwF
	 fXasFEa9CGQnZZ34PoIYyQZOnJ/lYMSvx+4xr5gDWritKDjt1f8rLSCqFJfA442khkltT
	 2oIQvRRvBj2n3kHHAyX17jrt+3XLYc/pQGSOVL8uRmtCh0YIgT/8qTOw9X4J8W05jBXVh
	 CdGtZxgRzIcOEylv+JFFJzr92lOrx7P/FmHFw9QmFqfK4VkOlcSuFnLXDuMT6R34kEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869529;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tyXT3V1giPULzTli43gvYizMlTh6ps7zNGmY3FWZQOM=;
	b=bizPiv/DPK1POF2BwIlPuSA0nGQeAxbrfjbpu61gWiMyC0bvWuTF+YUV9+vV1Al44JS8
	 UGywd8qGsq5HC8FWrOBHvLpUF8smz9RrEuLZ/SpeKHvOB7Tw8YfN5pIejMACg0Ht6If7j
	 1zV5bjPw/NhkcSihwRhLnZ9da3IZIW/J4McD0pMRVWYt/qmUYIhFX7o8/Rq7GOj/nbjV5
	 8W7H4eRppZgBpa1/ScBi5Geky5mR5tNwC5wfvLw91+WZnimgvJKhuFZxnSJrrCNrTamzT
	 xqM0Gv64YHJTHverR8w/BsEQ485qq+dma5rsGkP5ThyGhbQDx7dBanuhWPB11X2KREw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YTdT0AXc;
	arc=none smtp.remote-ip=91.218.175.247
Received: from mta0.migadu.com (out-247.mta0.migadu.com [91.218.175.247])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74852606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74852606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YTdT0AXc
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UGrLw7tJ8SzIUnajBIKmwWZs/FFny8I1ZQMJWZrsm+Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793869526; v=1; x=1794474326;
 b=YTdT0AXcvE+lmGs6+D0HzVfQT/tfYwtZU6XDTHndrSVrQ9LPhioVdjKxrjgFtr0k2HP/1dog
 lQ0xTgtk5GJE9CYyWjX5M9kek6Bxw/S5Hxq+XUK0H3FfJOHeW3x7rF1CmVLe7NcBkvljNFUDS+V
 mrVg0TwOnKwBp6y+cU9gJYYc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 8f2b4df41c8b103c;
	Thu, 05 Nov 2026 09:05:17 +0000
X-Mizu-Trace-ID: 8f2b4df41c8b103c
X-Migadu-Flow: FLOW_OUT
From: Fushuai Wang <fushuai.wang@linux.dev>
To: ynorov@nvidia.com
Cc: agordeev@linux.ibm.com,
	arighi@nvidia.com,
	borntraeger@linux.ibm.com,
	bsegall@google.com,
	corbet@lwn.net,
	dakr@kernel.org,
	dietmar.eggemann@arm.com,
	driver-core@lists.linux.dev,
	gor@linux.ibm.com,
	gregkh@linuxfoundation.org,
	hca@linux.ibm.com,
	johan@kernel.org,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux@rasmusvillemoes.dk,
	meted@linux.ibm.com,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rafael@kernel.org,
	rdunlap@infradead.org,
	rostedt@goodmis.org,
	skhan@linuxfoundation.org,
	sshegde@linux.ibm.com,
	svens@linux.ibm.com,
	tglx@kernel.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	yury.norov@gmail.com
Subject: Re: [PATCH 3/6] sched: Restore preferred CPUs when hotplug removes the last one
Date: Thu,  5 Nov 2026 17:05:05 +0800
Message-Id: <20261105090505.93940-1-fushuai.wang@linux.dev>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20261101192203.6979-4-ynorov@nvidia.com>
References: <20261101192203.6979-4-ynorov@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 04b62c16fa8c..98f4f9434965 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -8712,6 +8712,14 @@ int sched_cpu_deactivate(unsigned int cpu)
>  
>  	set_cpu_active(cpu, false);
>  
> +#ifdef CONFIG_PREFERRED_CPU
> +	if (cpumask_empty(cpu_preferred_mask)) {
> +		pr_notice("sched: last preferred CPU%u offlined; make all active CPUs preferred\n",
> +			  cpu);
> +		reset_preferred_cpumask();

Hi, Yury

If the CPU being offlined is the only preferred CPU, after
reset_preferred_cpumask(), the steal governor may still need
some time to tighten the mask again, and eventually only one
preferred CPU may remain. Would this introduce additional
task migration overhead?

Regards,
Fushuai.
> +	}
> +#endif
> +
>  	/*
>  	 * From this point forward, this CPU will refuse to run any task that
>  	 * is not: migrate_disable() or KTHREAD_IS_PER_CPU, and will actively
