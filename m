Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848BF3A5445
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 04:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791518976; cv=none; b=FdXa+F56M5eJtDky1nDNKZgACA+kHAYOAAcGOu0ndWSXvdYfpE73oXf+quMSdHf5GWQndCmJ34C6yACN6rsNYKHwDlvlejCMuLUMuCGdjm9u1nGiRHN9WtKyidrVBapXYG7Y5wh/nEboh0VCNLiVFmRugrLllyCxmVrdztyym2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791518976; c=relaxed/simple;
	bh=KmIIyE7EGRXxBsHkrV8hu/pYMT9Lqzpcue7Nh3FQ3Jc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pujFOeIrukyE8AOmf3kXLGL0QX62tEESDJ0IdfRYeCNwoHIKQtGUdwAw8yKJRBG+MNZ62gtXviAQ5emfJuUtyilxn3Pjgl6l9MZUeqyMc56YHNzFuClI904O0cm73g1QpkuNWOnAS6Mbh7FjlvxGBCfvN/X0nWs+snTHspmUcWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SM6gz6GP; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SM6gz6GP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:Message-ID:From:To:Subject:MIME-Version:
	Content-Type; bh=KmIIyE7EGRXxBsHkrV8hu/pYMT9Lqzpcue7Nh3FQ3Jc=;
	b=SM6gz6GPghGTsFOnVbBnqxzcBhqw2ZOVdkuxKYtDvBeenC0D7rkvSQmOSmgOcC
	2MLLqNNO6qIzOkjyuNI35WmlAEJS+KNPDgt6RzPOqKY1k8NCJ2nMoAfcCoNg84Nk
	yEvBQbVJrSUHoRVu/W+hGNWc+x++NCMvmqULm0kuruzBU=
Received: from localhost (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgA3HqunaMhq36N3Dg--.46730S2;
	Fri, 09 Oct 2026 12:08:08 +0800 (CST)
Date: Fri, 09 Oct 2026 13:07:51 +0900
Message-ID: <179151887161.2196447.9527206946798924448@163.com>
From: Hui Su <sh_def@163.com>
To: Jemmy Wong <jemmywong512@gmail.com>,
	Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: sh_def@163.com,
	jstultz@google.com,
	bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	tim.c.chen@linux.intel.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH 0/3] sched: Fix proxy-exec use of curr and donor
In-Reply-To: <309FAB10-ACB0-4EFF-81B2-5E7906A00ECE@gmail.com>
References: <20261008132604.98242-1-jemmywong512@gmail.com>
	<20261008153348.92684-1-kayracizmeci@gmail.com>
	<309FAB10-ACB0-4EFF-81B2-5E7906A00ECE@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgA3HqunaMhq36N3Dg--.46730S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr15Kr4rZrWDAFy8urW7Arb_yoW8Gw1rpF
	sYvr4aqwnrKa4xJasFg3yqga1Sgwn5Ga48Jr95G398uw15t34FkF92kw1SvF1Yk3yakF17
	tr1vvFZ3GayYvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUDCzZUUUUU=
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbCwQgRcGrIaKikDAAA3i

> Yes. My first patch and Hui's v5 2/4 and 3/4 move the NUMA and cache
> ticks onto rq->curr when that task is fair. Hui's 1/4 is the right
> shape: task_tick() runs the donor class and, when a proxy crosses
> classes, the execution class as well. A fair lock holder whose donor
> is RT or deadline still gets those hooks. My patch only changes
> task_tick_fair(), so that case stays missing. I'll drop it.

Thanks Jemmy,

Yes, agreed on 1/3.

For 2/3, I think this also overlaps with an earlier standalone patch I
posted on Sep 2:

[PATCH] sched/core: fix task_sched_runtime() for proxy execution
Message-ID: <20260902112539.879979-1-sh_def@163.com>
https://lore.kernel.org/r/20260902112539.879979-1-sh_def@163.com/

It makes the same two changes in task_sched_runtime(): test whether @p is
the execution context with task_current(), while still invoking
update_curr() through rq->donor->sched_class.

For 3/3, Andrea has an earlier patch, first posted on Jul 16, addressing
the same NOHZ CFS bandwidth issue:

sched: Make NOHZ CFS bandwidth checks follow proxy donor
https://lore.kernel.org/r/20260716132229.61603-2-arighi@nvidia.com/

In particular, that patch also removes the nr_running == 1 restriction.
As Andrea points out, a retained proxy donor keeps both the donor and
mutex owner queued, so keeping that restriction would skip the bandwidth
check in the active proxy case.

Thanks,
Hui

