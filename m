Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C96847209C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252374; cv=none; b=dNOhra+OKiIO78PoIGdu6Qqcp6t4L3zkQDDjUZTq1vmD1Mncokv3XVks0i8eOMdyC2XPEr7h8yfqLPa7XnTsqyyAl8TKIXDksP1r5Bo7N8MuMkY71IzjIkBGitxnUrc0yIiOSMRnck2u6nYKp0rKi7vEoiiLczmVjFqqgzyZ4Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252374; c=relaxed/simple;
	bh=XnAQkuaPwOizx+x7IS0QIu3FG6OT66ETBgEqnY6DtEc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:Content-Type; b=YQ1CxnjJp9dqATXSb2fPzGyPzy7H0cawtuBGMGyGZ9g2kZk7fwdS6lTHVd1FT1vWbahDN4zdeQBC7qMttiZRDq8IUcsWsjlQzTE6AEUacK4HMKhfNaoARLrtYSZO3NqEIe3iKI3A3YU/RyKlwZccThBdboKrm6dnw71uIXlexPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=CKtmeLbK; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="CKtmeLbK"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=aWckaBcnXrcKlSsW7ZdmZwrHBBZPCGYxpell27tHJYA=;
	b=CKtmeLbK1sUqwwgYkX1dstD74GI5KrRlgnEZ0Zpp9/LtccI1gICHQwF7SisIIZQU1CA4J4W00
	Z5RI6mNYQUDXSV+VtS9zPkkcS1vddfWKiIvBvNTcCgn/KW3adYKr0mezmbqq7EE7rJxX0YagA94
	bGmFSWIDYSBX/K5p+3roPLM=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4hYzgZ2Tzlz12LGl;
	Tue,  1 Sep 2026 16:34:50 +0800 (CST)
Received: from dggpemr500006.china.huawei.com (unknown [7.185.36.185])
	by mail.maildlp.com (Postfix) with ESMTPS id 426694057D;
	Tue,  1 Sep 2026 16:46:07 +0800 (CST)
Received: from [100.103.109.15] (100.103.109.15) by
 dggpemr500006.china.huawei.com (7.185.36.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 1 Sep 2026 16:46:06 +0800
Message-ID: <0a030145-c108-4365-ba2d-ac1973a1e352@huawei.com>
Date: Tue, 1 Sep 2026 16:46:06 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Yao Kai <yaokai34@huawei.com>
Subject: [QUESTION] workqueue: Reducing flush_workqueue() overhead for unbound
 workqueues
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
CC: <linux-kernel@vger.kernel.org>, liuyongqiang <liuyongqiang13@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemr500006.china.huawei.com (7.185.36.185)

Hi,

I am seeing significant flush_workqueue() overhead for an unbound
workqueue with a very small concurrency requirement.

The original XFS discussion is here:

https://lore.kernel.org/all/20260827033654.1172495-1-ranhongyun1@huawei.com/T/#u

XFS creates its CIL push workqueue as:

         alloc_workqueue("xfs-cil/%s",
                 WQ_FREEZABLE | WQ_MEM_RECLAIM | WQ_UNBOUND, 4, ...);

The CIL pipeline has at most four push works scheduled or running
concurrently. During a synchronous log force, XFS calls
flush_workqueue() before queueing the new push work. This completes
previously queued pushes and reduces the latency of waiting for the
target checkpoint.

Since commit 636b927eba5b ("workqueue: Make unbound workqueues to use
per-cpu pool_workqueues"), flush_workqueue_prep_pwqs() walks the
per-CPU pwqs of the workqueue. Commit 85f0d8e39aff ("workqueue: Reduce
expensive locks for unbound workqueue") substantially reduced the
number of pool lock operations, but the O(nr_cpu_ids) pwq traversal
remains.

On a 128-CPU, 4-NUMA-node system, with 16 threads performing sequential
writes followed by fsync, I observed:

Function                      per-CPU pwqs     per-NUMA pwqs
-------------------------    ---------------  --------------
xfs_fsync_flush_log            256-1000 us      32-256 us
flush_workqueue_prep_pwqs        2-64 us          2-8 us

Dave pointed out that removing it may increase scheduling variance and
long-tail latency, and may move ordering latency to journal I/O
completion. He also suggested that changing the XFS caller would be a
workaround for an infrastructure regression, as other low-concurrency
unbound workqueues could have the same problem.

Is there a recommended way to avoid this overhead for such case,
I would appreciate guidance on how this problem should be solved.
I'm happy to prototype and benchmark the suggested approach.

Thanks,
Yao Kai
