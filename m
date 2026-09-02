Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3932D3B2FC7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359013; cv=none; b=EinK6H4o62Y18LsDjEbMYnVvRpL/8RSHg9qWRR3oVm20CoN5bXvj/7Up8dylBVikLdUXyVV4c/Nv4eUmyLsbQSbeMkXJjcs2vPj/VwqnlGLA825+Jrvo8QdYAlsDOaE6VkWhoGhxO8vR/4iRzSF28w0pO8AqCgCotgFdgIpYgGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359013; c=relaxed/simple;
	bh=yYbrh0LkYCzZQbIB+z+hE7XmjjsIj0CsvdF5/X7SNNs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=bEvPOAlfblugIyk3NAHhkHebFFT5ZcHjhTQPfKqoxKCi0UelLEi5SOMmAZFEs4hUQy3JWXQtpLHwARqozxHx55y6Hjl7sEvRR5y1QeMEL2Q35pULFmLN54OY2s/nlYkTW7/ZtSB/z0+08rb88od/XxqSDN+aSn7HqAiVM6Xakv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MrZojRaJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MrZojRaJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD2D1F00A3A;
	Wed,  2 Sep 2026 14:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788359011;
	bh=DRVgEittoC4ylMrMgS4zaFItUazj+vF/Wu+G04N2r1o=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=MrZojRaJFdXG6BnwP7b9wdHWlWIxtfC1zs9Q3jEocEpy6Y0rwJL7dXRtoKXP8t1ju
	 WOpXDJUecAbgCu2KcmOt+wux65xz1vHllusBVwoXN1H7wwLIRRYNlIwtvGaQfSFBVL
	 j/xDgzjPidaLZodgjCh2R/Xb6hnHqEXZ5rPxDrpi8BxVK2eQcD7dxoswCl40A+yT+m
	 sObykwcIN/EIHuuYDlEuOxf/WWL557wXBpjPUAmLqXz6QC44ne0qUiH0NON472YoKn
	 Bs1XEykgQA+Lnrph0v+v0Cx1hoYEm7rgymfW7KmQMeR8g7ojyqea6C6SmxZYz8Iahu
	 9y6Fgs8UDiJ0A==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id CBBD2F40066;
	Wed,  2 Sep 2026 10:23:30 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Wed, 02 Sep 2026 10:23:30 -0400
X-ME-Sender: <xms:YjGYasv_CGu0hhzYb8mbaiHvn8TWvuwnCgA7E1g9lsuC8H9116J5uw>
    <xme:YjGYakQfWF34Aa9ARhTBt9Cs4NN09Yui1Aw9z_7Z0MQAm-gk5u0_vsjJ7X9uV1w6G
    MGfn17hGGMvwCO3RA2ymyMgYuPJJ1kaCG0ZQYYD5HnN-9Ka1BRoyQ4>
X-ME-Proxy-Cause: dmFkZTF0GOeHTz3LwEeZntTR3YfbvlV8WslcX8A47MJFRbvGdtal1J2IFzKMp4S9ibLowU
    P7WfBxvHMgVKZbM5QM6XoqGoUQ/zHO0mp6mV4N6SW/5WRJnjALoOeiMf/0wOHRaE5kMCHl
    Zq9YRk0Vji3b7EpedbhfCzRvUwu2dx8oLTxdrrM77bhdKRqH2f5i8hvRxpWKLIGnjKkPWN
    tENlImCsE5kX+aCEXemOpS5LV9wsAAjIMxuQ1lObS+e5AnmbTomNhooqZS6i2y8ORAtZDm
    z/IBMNNwR1c67ZDs0vO1f8KwJcsi8kcpSMSZQOtkNf4ELu97PExunebwlJtJ+ji+f957Ak
    2UEbXiubpCXKc0AR7D//T74FBq5vGG/p5m2KdDx9u36J8i3gQR7oGt0Pa47Ug3n4Qlxsh+
    Cpi0DSkK0DziX1Md++nGkFHdDVqotb4NMyVSPmoykU0yM7i+IYRLPTQPqEirkhcGQAIH2N
    GHuAnpPoHRYvR6PQgNc/aCivN8KjVcf7FVYrUjdx3H8elZh4EFDSnmttbuPGRd1IK1eRcG
    B30oIKWKTU0b/wnN5OF606MSq1UHBVA1SAZCyer/VNTs/JvR71tKMmPBaJp9/FAnd1wukf
    uw5ZbAqSJRKBdAAFlXfyYzRD5fS8ZfUQl5aoXLhd5CUDfMdNjjzYoLK3TsHg
X-ME-Proxy: <xmx:YjGYasPoF9kFzhA3rAtO6__-2nR5zaDqG528KxbjaZcX2EUAfMVFqA>
    <xmx:YjGYajm99PjTRh5ltVBykDht_iEkwt_Kc6TlyEfohQck2E66us_XXw>
    <xmx:YjGYauaWUxcg8N2Z4YUrj7FyUhtz3ven7fn6kqP_sFlYcwVNLOZ6Iw>
    <xmx:YjGYapTu3LL41emCh0p-F1Kki7Oj9Cz2zP_ykT_tqaa_4AsjTd6wOA>
    <xmx:YjGYaoXsjaIHIxxNnvmheMxpcfIYwZztU5JDlAHMn916UwDzjZNhjnu2>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A3A3E7811F3; Wed,  2 Sep 2026 10:23:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AOE3O8CiGXDo
Date: Wed, 02 Sep 2026 10:23:14 -0400
From: "Chuck Lever" <cel@kernel.org>
To: "Christoph Hellwig" <hch@lst.de>, "Dave Chinner" <dgc@kernel.org>
Cc: "Ran Hongyun" <ranhongyun1@huawei.com>, catherine.hoang@oracle.com,
 chandan.babu@oracle.com, "Darrick J. Wong" <djwong@kernel.org>,
 linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Zhihao Cheng" <chengzhihao1@huawei.com>, yangerkun <yangerkun@huawei.com>,
 yi.zhang@huawei.com, "Wangyang Guo" <wangyang.guo@intel.com>,
 "Tim Chen" <tim.c.chen@linux.intel.com>,
 "Lai Jiangshan" <jiangshanlai@gmail.com>, "Tejun Heo" <tj@kernel.org>
Message-Id: <21557715-124e-40dc-a470-82904374fc44@app.fastmail.com>
In-Reply-To: <20260902073556.GA27223@lst.de>
References: <20260827033654.1172495-1-ranhongyun1@huawei.com>
 <apSnC9p0X04cKxDj@dread> <20260902073556.GA27223@lst.de>
Subject: Re: [QUESTION] xfs: Can we remove flush_workqueue from xlog_cil_push_now?
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Wed, Sep 02, 2026 at 09:35:56AM +0200, Christoph Hellwig wrote:
> On Mon, Aug 31, 2026 at 07:56:27AM +1000, Dave Chinner wrote:
> > However, behavioural changes like this seem like an infrastructure
> > regression, and trying to modify callers to hide that regression is
> > a bandaid. This affects all UNBOUND workqueues, not just this one,
> > and we do not need per-cpu scheduling for workqueues with such low
> > work and concurrency counts - there can only be 4 pushs scheduled
> > and running concurrently at any time on this work queue. Hence we
> > don't even need NUMA queuing - a single global queue would work just
> > fine...
>
> Yeah, a lot of the recent workqueue changes had a lot of adverse effects.
> We really need to come up with a way to queue work to task context (or a
> different task context) that doesn't require reverse engineering "smart"
> behavior in the backend.  This has become a never ending whack-a-mole
> unfortunately.

Agreed.

So, I've been chasing the other end of this trade-off. On the NFS client,
rpciod, nfsiod, and xprtiod see sustained completion traffic from many
CPUs, and with the default WQ_AFFN_CACHE_SHARD scope they lose a large
fraction of their cycles to the pool lock on enqueue and dequeue. The
fix there is a finer affinity scope (WQ_AFFN_SMT), so more pools and
fewer CPUs per lock:

  https://lore.kernel.org/linux-nfs/20260831-performance-v1-0-8d9fd9b67f96@kernel.org/

That is the converse of Ran's problem. flush_workqueue_prep_pwqs()
walks every pwq and takes the pool lock once per pool change along the
way, so a finer scope makes each flush take more locks, and a coarser
scope makes the producers contend more. The pwq walk itself is
per-CPU at every scope, which is the part no scope setting removes.

For Ran's immediate purpose, patch 5/8 of that series may be useful:

  https://lore.kernel.org/linux-nfs/20260831-performance-v1-5-8d9fd9b67f96@kernel.org/

It exports alloc_workqueue_attrs(), apply_workqueue_attrs(), and
free_workqueue_attrs(), so a module can set affn_scope on its own
workqueue after alloc_workqueue().

With that, xfs_cil could set WQ_AFFN_SYSTEM on xc_push_wq and get the
single global pool Dave describes, without touching the boot-time
default or relying on WQ_SYSFS, which XFS_WQFLAGS() adds only in
DEBUG builds. That would let Ran measure the flush cost against a
one-pool walk directly rather than through the per-NUMA proxy in the
table.


-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
