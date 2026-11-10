Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=3.64.226.208
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352883;
	b=i+TWITPc+dDSbqXWIQwZrFHAZsxc/CcmCS4u4ZoeOdfajiLutoq3cy8sBOme0kJIiH/d
	 P6z3WYND3YYIL1pDw655o87maGc8UzThU3Vy6rNH3Hj1dV2rDCRGa4P7cGYWjrvrxGFmp
	 6dlLew7PL9bZZqxakJsohnRefAAJhnn2DLrBA1moXaw6md/2uLoNvDYLn+aDqiwOw0co8
	 gILgEuDnMOYGfuJPD2E8yw6x/DvSWeNglCCzgbsBxVWEuueVnBrVXMnxP6XSA0MLjkCye
	 xeKZ4pAmeLbCaK3p6/wx9kuOOuS2eMUerTepR+4XvHIrybRnd85wGWU3n1nWithfa2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352883;
	h=DMARC-Filter:Received:X-Titan-User-Uid:DKIM-Signature:X-AuthUser:
	 Received:Feedback-ID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-F-Verdict:X-Titan-Src-Out:
	 X-CMAE-Score:X-CMAE-Analysis;
	bh=+kj5zpNTbe11kXKt4oxEw2s7Ih43RiwnUSYiFDwZ6Gs=;
	b=f0w1jq6pmEXMjOwbrAi5XhSoFn87536D9VKClceW6S+Ohy3IeeEUl1FzqZOhr08urN18
	 XWN96BJT3beXtmlgsV9MEsapr/SfisbZNKkaRd+4wpnphRNQ1mozU0H1ST6MwF73EkUxT
	 Cm8fHdaPkjnVk8yMqPhdBpGvDvtlUGqfp5ZpnplRdud+9u+3M5YI07zf7W9+nV3fa9z5g
	 rLouHI4Cth1X57DBvnUS/79KN4NQoEKgOgzKPvcHTfCBgCHMTLxdBxOO6BoXzPbVno4h3
	 8+F90W2jV/i0V16RKNLmkl7Ph/xz6lB+o+ymNgLzvILzOQhKjzLlPe1CAXyyTR2fPdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=techsingularity.net;
	spf=pass smtp.mailfrom=techsingularity.net;
	dkim=pass header.d=techsingularity.net header.i=@techsingularity.net header.a=rsa-sha256 header.s=titan1 header.b=KkOo8RgR;
	arc=none smtp.remote-ip=3.64.226.208
Received: from mail14.out.titan.email (mail14.out.titan.email [3.64.226.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AE5606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72AE5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=techsingularity.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=techsingularity.net header.i=@techsingularity.net header.a=rsa-sha256 header.s=titan1 header.b=KkOo8RgR
Received: from localhost (localhost [127.0.0.1])
	by smtp-out0101.titan.email (Postfix) with ESMTP id 4jPN222xCBzBrJc;
	Tue, 10 Nov 2026 23:21:14 +0000 (UTC)
X-Titan-User-Uid: eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..iwExD89fMI_qboJc.6VO15MSC4vMh8ruk4zJ8u1W53bFzyvnKMo0yttrrQmyrk5AssWzKhVN_qLQKd3lr-WBK9t0uqs85CzQ9ZtjGpPoRC_8rvyGTQfZfln86XBR4uQKb9GahubHTkA.MhkglZx9Nw4JEibOENS6tA
DKIM-Signature: a=rsa-sha256; bh=+kj5zpNTbe11kXKt4oxEw2s7Ih43RiwnUSYiFDwZ6Gs=;
	c=relaxed/relaxed; d=techsingularity.net;
	h=message-id:cc:to:date:from:subject:mime-version:from:to:cc:subject:date:message-id:in-reply-to:reply-to:references;
	q=dns/txt; s=titan1; t=1794352874; v=1;
	b=KkOo8RgR9fe8ud+0j9AnNLvaWTjymI1vXCIpmSr8rlHAMpB/mIOyqlXrcsJvxs7LYfeetV44
	JiCBL+BeLEjBagzDdx11wZN+9LV0Za2UpBzcQWt0Bqy0YwVLAbpXNNNz4XML6d11Jpek6uGPJgs
	Rsp3YtZmB3o9w1LQM2pPl/qo=
X-AuthUser: mgorman@techsingularity.net
Received: from morpheus.112glenside.lan (unknown [84.203.172.48])
	by smtp-out0101.titan.email (Postfix) with ESMTPA id 4jPN214H5gzBrJT;
	Tue, 10 Nov 2026 23:21:13 +0000 (UTC)
Feedback-ID: :mgorman@techsingularity.net:techsingularity.net:flockmailId
From: Mel Gorman <mgorman@techsingularity.net>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Seiji Nishikawa <snishika@redhat.com>,
	Mian Yousaf Kaukab <ykaukab@suse.de>,
	LKML <linux-kernel@vger.kernel.org>,
	Mel Gorman <mgorman@techsingularity.net>
Subject: [PATCH 0/3] Reduce spurious RT_PUSH_IPI storms
Date: Tue, 10 Nov 2026 23:20:54 +0000
Message-ID: <20261110232057.4144723-1-mgorman@techsingularity.net>
X-Mailer: git-send-email 2.55.0
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
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1794352874149242361.1930444.8004382358347751818@prod-euc1-smtp-out1003.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=KNjj5FFo c=1 sm=1 tr=0 ts=6af3a6ea
 a=yHdhZq8wnfzzRmla7jO6EQ==:117 a=yHdhZq8wnfzzRmla7jO6EQ==:17
 a=CEWIc4RMnpUA:10 a=cmRMmVine0C4S0eMV3YA:9 a=3ZKOabzyN94A:10

RT_PUSH_IPI is intended to minimise latency and rq lock contention when
migrating tasks to balance RT task distribution.  For example, if a high
priority task changes to a lower priority then CPUs with off-CPU RT tasks
may be sent an IPI to "push" tasks away to an available CPU. The problem
is that if a CPU is rt_overloaded but has no tasks that can be pushed then
it continues to receive IPIs -- specifically tasks that are migrate_disabled.

An issue was identified where a CPU received a large number of IPIs in a
short space of time but no tasks could move, it was still marked rt
overloaded and continued to receive IPIs.

This problem was examined in commit dae5c0292080 ("sched/rt,dl: Skip
migrate-disabled tasks when picking a push candidate") but the fix is
incomplete as noted in the changelog.

The original bug against an old kernel was due to pgrep running with RT
priority on an isolated CPU with an active RT task. It was acknowledged
that the "proper" fix was to move pgrep, drop its priority or both but
the underlying reason for the storm was pgrep being spinlock-intensive
and excessive IPIs being sent which is still sub-optimal behaviour. A test
case creates a "victim" task with short work/sleep cycles allowed to run
on CPU1 and CPU2 that optionally disables migration (md=1) while running.
A second task mostly does work pinned on CPU1 with short sleeps, a third
task mostly sleeps on CPU2 so CPU2 pulls frequently.  The results are

| Kernel (7.4-rc2)       |     CPU1-md=1 |   CPU2-md=1 |    CPU1-md=0 |    CPU2-md=0 |
|------------------------|---------------|-------------|--------------|--------------|
| vanilla-rt-push-ipi    | 41474.7 ±0.1% |           0 | 4784.4 ±0.2% |   85.0 ±9.9% |
| series-rt-push-ipi     |             0 | 0.3 ±380.6% | 4792.1 ±0.3% |  87.1 ±10.8% |
| series-no-rt-push-ipi  |             0 |           0 |            0 |            0 |
(RT push IPIs per CPU per 5 s interval, mean ±CoV over 30 intervals,
 md=1 means the "victim" with cpumask for CPUs 1-2 disables migration)

The vanilla 7.4-rc2 kernel fired 40k+ IPIs every 5 seconds with low variance
over 30 samples with a migrate-disabled task sitting on CPU1. Separate
testing showed that the IPIs were not resulting in tasks moving and therefore
spurious. The series eliminates the spurious IPIs (second row). Disabling
IPIs also showed no IPIs but it was confirmed that tasks were still moved.

Yousaf (cc'd) is the original author of the first patch, I only decorated it
and provided transport, hence why his Signed-off-by is first on that patch.

Mel Gorman (3):
  sched/rt: Do not account migrate-disabled tasks as pushable
  sched/rt: Check eligibility of pushable task in one place
  sched/rt: Treat migrate-disabled tasks as pushable if RT_PUSH_IPI is
    disabled

 kernel/sched/rt.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

-- 
2.55.0

