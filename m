Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878337;
	b=hzDzpvetD1on03C/EUM50jE5TB0e8YGxl0ySvdGBEvMfIsq9FT5lhD1pLdv/9rcv7vFm
	 1lm07RoHKRodkv9qaR7ZlyRNyi/AjOUYwC67CEqJA9nCkEKLFpOp0e/wBoZgtDlnkrBv9
	 yGRX5aKwmQzNN40gxp6CsQ+aKYDD5KGjFLxMFlOn42r+oIECJPtdlcULl5I0Xb7kOHJXv
	 jUqiwwEoW4Y16mxNN8y96UPvJfZhQxDhjFnMKMGt/MH8Vfjtx1gUXCf4MRl+OpHjdzxA1
	 IzZ9Gk9xKBvjk9npUttic3xXrvi4lsz38MW8j8U/MiIK1nEpezYp1OCZ5fPABMmQu6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878337;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=tNhVEyr0Y8JjrBOBITAdvT9PFSa0wDqidicidUjfssc=;
	b=3Xp29+cRsPfr2eD+NvdFQzWCZZzpT8cZ8UDkUHearrBmUr5RhoAEGa/tGgbXZGT7BmSJ
	 t+1arzi67oTeCWmaWivAKj8N0XEtv884ptKalYfbtA9kFUyrFyQjmvRs2olRe3aodImIP
	 Wh1u6J00QPhyXAfMR2sjpk53fdRc3ESOxfWt76Xc8XQMRw0pBVKMNwYVymN1VQX5k/kmB
	 DTDdnwSmbuhfnviaMDK3KWYkouaRT5/GgCm8+L8M8Jb5ShP6pyC0xygNrZkPNThnZ3Ylo
	 8Fk5QRJvIrjgz0itW1wbZVb7xMS/ixq8wtMGTD4DJOiBER9YdBfVmoOYXtuNbiigQmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WzB32JQs;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=V85+4Ku3;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B945A606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B945A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WzB32JQs;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=V85+4Ku3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793878335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tNhVEyr0Y8JjrBOBITAdvT9PFSa0wDqidicidUjfssc=;
	b=WzB32JQsj5twj5lBPTCffUxiaitf0ZLxM55hJhzBz7By9atlVx/xJ3xV1QOLSGNKsxUGwY
	gqt4nQb9Nvsrme8QKOCWF8IgDgtfqKJzdg8Hn2JWmmvCp/OYaNUPUzm10E+cc6G8PivCcG
	crDTRJdRncSGzRQvg2BS5OcQKHnAfZ4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-M-NorOyPNPOoWdh-vFocyw-1; Thu, 05 Nov 2026 06:32:14 -0500
X-MC-Unique: M-NorOyPNPOoWdh-vFocyw-1
X-Mimecast-MFC-AGG-ID: M-NorOyPNPOoWdh-vFocyw_1793878333
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so11980245e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793878333; x=1794483133; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tNhVEyr0Y8JjrBOBITAdvT9PFSa0wDqidicidUjfssc=;
        b=V85+4Ku3I4PSQzGXmrCvP53gBTpXOsHKIsNAwrjUln/NWHiLULOhpPLQ06NtDNWvah
         iCj7JEelX0ZOa8tY52XUUTkYvnF+kw/Vb3vsFTFwjSbEOyQxWUIg74pRiVGmCL8/cg28
         DlQXfv7EyIJIoh0aFlsxv+VeZ4LAf7M/rCIDzBGr8cleF1gg2IdU1KW+wRMIHmZ2AGrh
         KgkUA1tEfzWdPRT/P2pw9EGVJT31FWozYaTR0KqbHKW52ie8CHi3PcQKorNcff5YR07B
         j6If37NBzi8GWIYUPo0uyDRGZtXBd5RAc0e0BAZfRtjk0bCJ+yWToSBNaCr79+cH7MhV
         4Ldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793878333; x=1794483133;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tNhVEyr0Y8JjrBOBITAdvT9PFSa0wDqidicidUjfssc=;
        b=1UBEw074heBOSNHuZY4HIp455T9dbmmK7kQXKrH7XJF9CKPSr4QqxH1vTEzIrijYnD
         jU5Ygn2EU+bKgoUy+KiflwZjbqUisOI0I80OfjVbil4ndaHokc6JSHJzLc7BCsZF7wBv
         G+PQGBTktOz89Ft9BzrYyuJzqoHrBgs6TiA1XUq4UN1G/WP0GJnfGe7PjqtFzSZOmZRA
         6MVQQ6DNo1Kb9ixRBIfJpZR14W8ws/GQ4xzm/M2i7IQ7lAy4UIou0wtNvYVp88R+Kvpf
         foSRwTL+mN8e3l5kIySfrgzCEmazaXeZv4AZpNWkKTFJksZrojBlDaQEjM43vFAxJajr
         nhhw==
X-Forwarded-Encrypted: i=1; AKwUvBwPED2GkWMvmYdq0P1o7getMJjiAKvBUOsIudaLRpkxNQMqq6Z7Lm7KwdDChKXCcijusHXqu4au2cMxpck=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HHnfyuDbhAH9ltSsrRSG81QZP0HKGtVRgLPjKP1+NEvsm0SeM
	H0qTCX/FaSwIu0J6sVVf+qCQsF6UOBmp/A0LlyweXCMlqe4KRbOAF0r7sOHHpPoPwHqtfQHMrzt
	AreWz+BMcyEyU1U/NIusu7wDz2GglQwBK+PDEezlc118KVM1Oo2+zyl4zN5RUzycz7Q==
X-Gm-Gg: AYBFou1JI9fF5guPIyDzefM4iEsWbCUEVm63L1K6o6etre94Rv3vAMxKP8l87i3+hEk
	4VvGHO+HYu8P2+vh2uICVUH40XkPI08tB242FKd19l1Mi+otupEooJXdDtX4hkvqL47sMnyYbEi
	C27xS9NVXVn5HfYfjG1G+3jsdNEGXxw3cXOBdglKf9U2/CbfAGH0UlaN2daNkrvkNLVdGUYNBfi
	t0gq3kLpTZLyCySAPdWf/njNTYZ+RPiHXMlepl3vDa2OsuNwbDz+5tuvZ9/EvlM9PeQxQcucCSu
	kN3XYF1e+beC561ok6W789jKOClejMKCwYWdK0+zvxvrTND7nP2Vf4dcra7a8J3t9osEebBV2hh
	369753+Sp2Ju69FvvLyl8v8iASUalVkoLvCE8A2VG2FyCjl5kywEDMH7fI4jLpjeO3eYVxC2j5W
	wSqg==
X-Received: by 2002:a05:600c:8b0a:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4ac185bc4a1mr417473265e9.27.1793878333155;
        Thu, 05 Nov 2026 03:32:13 -0800 (PST)
X-Received: by 2002:a05:600c:8b0a:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4ac185bc4a1mr417472905e9.27.1793878332770;
        Thu, 05 Nov 2026 03:32:12 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.51.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b64809c39csm8172645e9.4.2026.11.05.03.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:32:12 -0800 (PST)
Date: Thu, 5 Nov 2026 12:32:09 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	Weiheng Qiu <weihengqiuu@gmail.com>
Subject: Re: [PATCH 1/4] sched/deadline: Fix stale root domain in cpuset
 bandwidth transfer
Message-ID: <auxpOYTZ8BRiB1IH@jlelli-thinkpadt14gen4.remote.csb>
References: <20261103-b4-sched-dl-bw-fixes-v1-0-dd761fe005b4@redhat.com>
 <20261103-b4-sched-dl-bw-fixes-v1-1-dd761fe005b4@redhat.com>
 <CGME20261105102052eucas1p2fa2d23d1c49cdadef3b1099e18ffb958@eucas1p2.samsung.com>
 <eb0e386b-da07-4a2b-bff3-79441fd6be1f@samsung.com>
 <auxcsYGC7Fqa44LM@jlelli-thinkpadt14gen4.remote.csb>
 <auxm5whgKM-uiSGe@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auxm5whgKM-uiSGe@gmail.com>

Hi Ingo,

On 05/11/26 12:22, Ingo Molnar wrote:
> 
> * Juri Lelli <juri.lelli@redhat.com> wrote:
> 
> > Hello,
> > 
> > On 05/11/26 11:20, Marek Szyprowski wrote:
> > > On 03.11.2026 12:26, Juri Lelli wrote:
> > > > dl_task_needs_bw_move() and set_cpus_allowed_dl() use task_rq(p)->rd
> > > > to determine a task's current root domain. For a sleeping task, this
> > > > is stale: it points to the rq of the CPU the task last ran on, which
> > > > may belong to a different root domain after a cpuset move.
> > > >
> > > > This causes incorrect bandwidth accounting when a sleeping DL task is
> > > > moved between exclusive cpuset partitions and back:
> > > >
> > > >   1. Move root->partition: task_rq(p)->rd = root, destination in
> > > >      partition -> different -> bandwidth transferred correctly.
> > > >   2. Move partition->root: task_rq(p)->rd is still root (task never
> > > >      ran) -> looks like same domain -> no transfer. Partition keeps
> > > >      stale bandwidth, root domain is short.
> > > >
> > > > The root domain then over-admits, and when the task exits total_bw
> > > > underflows.
> > > >
> > > > Introduce dl_task_root_domain_cpu() helper that uses the task's
> > > > cpus_mask (which still reflects the old/source cpuset at call time)
> > > > to find the root domain where the bandwidth is actually accounted,
> > > > instead of relying on the potentially stale task_rq(p)->rd.
> > > >
> > > > Use cpus_mask rather than cpus_ptr, as the latter may be temporarily
> > > > narrowed to a single CPU by migrate_disable().
> > > >
> > > > Reported-by: Weiheng Qiu <weihengqiuu@gmail.com>
> > > > Closes: https://lore.kernel.org/all/14508cb2-805f-41ac-9f6b-bfd7c3d7cb1c@gmail.com/
> > > > Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
> > > This patch landed recently in linux-next as commit b4a61fdc19c5
> > > ("sched/deadline: Fix stale root domain in cpuset bandwidth transfer").
> > > I found that it triggers kernel BUG during CPU hot-plug tests on some
> > > of my tests boards. Reverting it on top of next-20261104 (together with
> > > dependent 41a7968022ca3) fixes the issue.
> > 
> > Others have found issues with the set and we have been working on fixes.
> > 
> > Can you please check if the following addresses it
> > 
> > https://lore.kernel.org/lkml/20261104211207.1392343-1-mathieu.desnoyers@efficios.com/
> 
> So given that the first patch triggers a crash, I've removed
> these fixes from sched/urgent for the time being, waiting
> for an updated series.

Thanks for doing that and apologies for the noise my broken series has
caused.

> Mind sending a series that is strictly -stable suitable fixes only?

Reviewing the above and will work on what the series doesn't cover from
my original set of (attempted) fixes.

Best,
Juri

