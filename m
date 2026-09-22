Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FCD5448A1
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080894; cv=none; b=l426NDJPs5I22EBDjvvlo3TJTULs0KaWhGplofUZLDeUu53B6LTnkPlSIFUnpEKex2/4wphWkJMmyGvN5xfTQICn9HtrTdFuWLVCqpRMCVDqvJ8wOQ/OgR8oXAlTMonz1fP0v2zIkNbYbDeXzIP/MzjTqNWBuSftfugEdaPKuHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080894; c=relaxed/simple;
	bh=9SmXsSjZiPri4Axbm4PcUtm0x0cFibJKkbOm3Gz7yzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=prRit5sODkPfUR8WkY6i6Eeyel5tcuuX0abMYq3VptkKgzD2CvVeZ8atRyHHgiCXmRNmxPjVe9JU6IVYJsPQ9x8gDY+3WQxeYf4WprmGPBwxAJHTSHee75HASN6eFss/W2FHvFfudCxXaG3r60XAxS42bwuGWbO4pdP1K+W/yNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XKLIdciK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=L4zSt9Vu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XKLIdciK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="L4zSt9Vu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790080884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gDxpT2mxBlmloSbVHd4QOZ7TWkyeXqX+vQ2OwT8Te3c=;
	b=XKLIdciKnJ7yvW8L0JnkS8LFJyEC3TNdbZOyvTGxrGo3kUl7QLTvtDIW19AgE+KfzmR1KG
	jfW9q1fULFPKYKemJd700wOEjMzv++V4kuJE8BGQ0pwMM+pp3YIP9pbuDbPMn9swu1LNo6
	XLaL7Vp4FJwCUPoLsNhdsAKpfuZUXTQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-NlMoJJeEMsaaqfrWO6bqHw-1; Tue, 22 Sep 2026 08:41:22 -0400
X-MC-Unique: NlMoJJeEMsaaqfrWO6bqHw-1
X-Mimecast-MFC-AGG-ID: NlMoJJeEMsaaqfrWO6bqHw_1790080881
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49cd83ca361so45897235e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790080881; x=1790685681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gDxpT2mxBlmloSbVHd4QOZ7TWkyeXqX+vQ2OwT8Te3c=;
        b=L4zSt9Vu2xGYOhvcihIlsaWvXJXXVb0IbW8xtkABZ9KnS+XswkaQpgZReuFyWYrMRG
         CIExyzWnVZDNPje/WHntQxWnQGSFjdl1W5ANZtmI0kqAfP9/tqdwmxb+1/b8Wgdd2VcL
         4u0cPV7Fm3r8aeXrWiuccX2QDYW8LHaj/ZnrwDNn5e47LQ5TnY98OVYlBQ5R4hNWm+50
         c/mcEMuy1qjIt0xItb18WC2wcJkndfDJ1MKiKfpyVnunA+p1G6O7ZVAPvfLUpcKmOBkK
         J9g2WOrcaWdzGpkefdbzmh/ApE9x2YvZDqEbLko+NleMg0NWOdzKoY8o1kjOCJosrKt/
         Tflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080881; x=1790685681;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gDxpT2mxBlmloSbVHd4QOZ7TWkyeXqX+vQ2OwT8Te3c=;
        b=HXcgyEIJxSbqLPkz89qqJLaTaI1u/9Dn/eziB/Jv9MnZNVWn2I40fYFBW2ncbgDpC8
         urc13Z0Q5nyDABSBeNd9yANfD41/+IumEcTrfEJSj246U9/UIzq+DMK+g5BJzz+9QifO
         qLI0J683jH0PRQaaASRupCNKwSfdcgm6WfYTajleIaJiUTLSbanFvI7vU0hwNdpZpAcN
         Q+KjA/BCyhwXPOhxRuC/ErqQkoChj2lX+BlWGtdFJHGXzaFb1u67UbAzQ/O0gLWDaBRW
         /ZyYhYrxKb9N/5SsCz4qxCRZqgaBqcDYgV8OSEMdnb/X4tbX5Y4CHbpohHcNOICYY67x
         JycQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzujEOSOWFtl7H0sfg6YdkuM3yuBQVMWmKrWxtlsnaY9Dz06rxS63jpdzSDkoLYKTevEBE8pfVMCXs7HY=@vger.kernel.org
X-Gm-Message-State: AFuF++lwqfLXgl4a/qg2W+5tPftx8hxNtDKMGgP8CxbFn6NgGrvXRwSC
	VtFz2K/13Sp3i+8+eQThCx9iK0I843oJm+lpk61CW0K0dg05k/tSoq968AelQEcpmiIHpedBNBC
	qdU+ZyeGasFrDjbf2b4HqP/4mCe2p2Z4I1VO0zkm+xPWs0WfhHaeIUt4CITWKmALpJw==
X-Gm-Gg: AYBFou0+pXc0X1t+qV9TBTsB/u/q5SCvtxsK4JlVZXS71ypMQXAqQK682YNNAi2o070
	t6Z4FWuWt5NDI23XQxqr5HduNEV06ZWehQt4vZ9zFlsgKJDgtxWnstXS64kyd/DtQfwFyjnWf+L
	d0iGZGrzLv2zWJPmEBTbJfSRUdOGTKtr5NPTa0ZFWFA9rU98j6RaKMCCk5b5TCg8tAH/dU5ea6O
	IXVwUyTvXff4p5RsolTCG7UdvPt4D3hUPJ8jw+ZJPhxcqSvNO0whx+IVP6TSlQ08EdWpjSJZyID
	3XNQTNfwemI+OIkaLlEOprNzz33ycRe9qFF3VDzd0yJW/SF/ZGrPfmmgYgOAuvKiRKyQo5QcyzR
	u7AebOMS1yZKUg6uaCuwcZj7S2hda
X-Received: by 2002:a05:600c:c493:b0:49e:74b6:740f with SMTP id 5b1f17b1804b1-49fc573603amr188627645e9.17.1790080881311;
        Tue, 22 Sep 2026 05:41:21 -0700 (PDT)
X-Received: by 2002:a05:600c:c493:b0:49e:74b6:740f with SMTP id 5b1f17b1804b1-49fc573603amr188627215e9.17.1790080880864;
        Tue, 22 Sep 2026 05:41:20 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.14.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaa99b8bsm36594555e9.1.2026.09.22.05.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:41:19 -0700 (PDT)
Date: Tue, 22 Sep 2026 14:41:17 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Cc: mingo@redhat.com, peterz@infradead.org, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	longman@redhat.com, tj@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched: Restore the normalize_rt_tasks() cpuset_mutex
 exemption
Message-ID: <arJ3bZ4lePH5pfRp@jlelli-thinkpadt14gen4.remote.csb>
References: <20260922030738.1613919-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922030738.1613919-1-donggeunyoo.kernel@gmail.com>

Hello,

On 22/09/26 12:07, Donggeun Yoo wrote:
> sysrq-n runs normalize_rt_tasks(), which walks the task list under
> read_lock(&tasklist_lock) and hands every user RT or deadline task to
> __sched_setscheduler() with pi == false.  __sched_setscheduler() takes
> cpuset_mutex whenever the old or the new policy is deadline, and
> cpuset_lock() is a plain mutex_lock(), so a single SCHED_DEADLINE user
> task makes the sysrq handler sleep in atomic context:
> 
>   sysrq: Nice All RT Tasks
>   BUG: sleeping function called from invalid context at kernel/locking/mutex.c:623
>   in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1, name: init
>   preempt_count: 1, expected: 0
>   RCU nest depth: 1, expected: 0
>   locks held by init/1: 3, last CPU#1:
>    #0: ffff9fa2c34e1470 (sb_writers#3){.+.+}-{0:0}, at: ksys_write+0x74/0xf0
>    #1: ffffffffb8f66540 (rcu_read_lock){....}-{1:3}, at: __handle_sysrq+0x3a/0x110
>    #2: ffffffffb8e060d8 (tasklist_lock){.+.+}-{3:3}, at: normalize_rt_tasks+0x34/0x150
>   Call Trace:
>    __might_resched.cold+0xe3/0xf5
>    __mutex_lock+0x8a/0x11c0
>    __sched_setscheduler+0x35f/0x9c0
>    normalize_rt_tasks+0xe6/0x150
>    __handle_sysrq.cold+0x9b/0xde
>    write_sysrq_trigger+0x65/0x90
> 
> Test pi along with the policy. The only pi == false caller is
> normalize_rt_tasks(), where the lock is given up since the sysrq
> emergency already voids deadline guarantees.
> 
> Fixes: 111cd11bbc54 ("sched/cpuset: Bring back cpuset_mutex")
> Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
> Cc: stable@vger.kernel.org
> ---

Ah, yes indeed.

Acked-by: Juri Lelli <juri.lelli@redhat.com>

Thanks!
Juri

