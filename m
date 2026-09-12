Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC35B1A268
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 04:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789186168; cv=none; b=fIRvTDvco1RqpkUwriFckYl8/NmgbKdcIB7vaeIdeys1+HP9RIXsaqqYuQ383cMQcRkziv1Zi8mwZL5p0mjG5GE4HBUyvlazc+SH7XPFZlkKHtzrItV6i5HP4wIhcSC1ayP3vIrlyu2BILw75FlYMHGCLGXjmhAS1QiU/xuHrug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789186168; c=relaxed/simple;
	bh=q6r+fmpBGe53FQ1SVZuun/Bd5TdqHC7Or9LgvToG+pw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CdGNBtCX9iwXHjrspKnVBhh4uf6bn7AmWW6QxrpC3CHs2Hs3zfMHa17VPZ0w0T+Vjji3D8fTlx3kfUkuOZDP4DPQ4jRD3CZqNCCaEdrGjoMFujkgnNyeMv5Q2Xzh0ojOzvDExtMB1Zz+cP6L5siwdmfTWVqPY5irO0eHzLJRHos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=OgJnXNqa; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="OgJnXNqa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Jb
	w9HG2tqBAmGwytIc19pMq5hBGY8qQKlQCdyyqxoDQ=; b=OgJnXNqawBWXIY0fvR
	XatcDhmkjbu5iaSsc7VTgCp88I0Ad8Zv8uBdpiNHrpnEs/yvn6MIDuL48AaUTdxx
	4a+CsfXtFQTiEG8ybNFbl352N+aqcNJpUXo93BqlDQA1J9eOI3Ugqtf0H5xl8hES
	/eN6EZpq1pXtPigCZvxD8I5AE=
Received: from zhaoxin-MS-7E12.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3H64k0KRq3nyqAA--.144S2;
	Sat, 12 Sep 2026 12:08:06 +0800 (CST)
From: Xin Zhao <jackzxcui1989@163.com>
To: vincent.guittot@linaro.org
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	jackzxcui1989@163.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vschneid@redhat.com
Subject: Re: [RFC PATCH RESEND 05/10] sched/fair: Introduce select_task_rq_fair_thin() to select rq when LB_PROMOTE
Date: Sat, 12 Sep 2026 12:08:04 +0800
Message-Id: <20260912040804.3391229-1-jackzxcui1989@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAKfTPtCQUndM7NfMYpz8S6vXhwbwrOYALr9dNb+971XgZ9GqnA@mail.gmail.com>
References: <CAKfTPtCQUndM7NfMYpz8S6vXhwbwrOYALr9dNb+971XgZ9GqnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H64k0KRq3nyqAA--.144S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXFWUAFyxCFW3KrWkGFy8Zrb_yoW5GFyxpa
	yfWr43Kw47J340y3W29r1fur4UGrW8J3W7Kr45Gry0kwn8ua4qyr1ftw4S9a4UArW8u3WU
	tF4jqa4kCas5Aa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRTKZAUUUUU=
X-CM-SenderInfo: pmdfy650fxxiqzyzqiywtou0bp/xtbCwAYBC2qk0CZ-KgAA3h

On Fri, 11 Sep 2026 14:27:04 +0200 Vincent Guittot <vincent.guittot@linaro.org> wrote:

> > I did overlook the detail regarding the SD_BALANCE_WAKE flag; our project did
> > not change the default state of the SD_BALANCE_WAKE flag, which is set to 0
> > Moreover, as far as I know, most embedded Linux projects have real-time
> > requirements and generally do not modify this SD_BALANCE_WAKE flag
> 
> But if you have real-time requirements, why don't you use the
> real-time scheduler ?

Due to fair scheduling, especially in a 250Hz system, we often experience significant
scheduling delays. Therefore, we have already converted many critical tasks to real-time
in our projecct. Currently, there are already a considerable number of real-time tasks
running on our system. The following is the data on our system:

CPU ID | Total Tasks | Real-time Tasks
------------------------------------------
0 | 369          | 197
1 | 293          | 132
2 | 166          | 53
3 | 103          | 27
4 | 89          | 26
5 | 63          | 29
6 | 173          | 61
7 | 215          | 39
8 | 181          | 53
9 | 77          | 21
10 | 90          | 47
11 | 119          | 63
12 | 55          | 23
13 | 50          | 27
14 | 85          | 33
15 | 143          | 50
16 | 156          | 40
17 | 159          | 44


The RT tasks/total tasks percent is already very high. It is no longer feasible to expand
the scope of real-time tasks, including tasks like kworker, ksoftirqd, and kswap, which
are not suitable for real-time scheduling, right? In particular, within kworker and
ksoftirqd, there are still many scenarios where insufficient scheduling timeliness leads
to increased processing delays in the entire pipeline.

The LB_PROM feature and its associated series of patches are specifically designed to
address this issue. One of the most significant core changes is patch 10; you may want to
take a look at it first. The remaining patches (patch 5, this patch, patch7, patch 8, and
patch 9) all contribute to improving fair scheduling delays.


> > Given this situation, is it necessary to create a new branch for such a "_thin"
> > select_task_rq_fair() variant when enabling LB_PROMOTE?
> 
> At now, I don't see a need for a new branch nor a LB_PROMOTE. You
> failed to describe your problem and came up with thos
> platform-specific solution instead of fixing current code. Putting it
> behind LB_PROMOTE, doesn't make it better.

I took a closer look at the implementation of sched_balance_find_dst_cpu and believe that
this function already meets the requirements. I'm wondering if it would be possible to add
the SD_BALANCE_WAKE flag to the scheduling domains (sd) of each CPU when the LB_PROMOTE
feature is enabled, and then revert it back to 0 after the LB_PROMOTE feature is disabled.
Would that be feasible?


--
Xin Zhao

