Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643923EFFA6
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060820; cv=none; b=c2MgbuHaARhDsPBH4BRKDcvLnHtQiMt82LbdNTmlxeP3GKoJxrdWcsmVLDXrCv8IvWryVIGba1oWBUDYUvhJQZr8GHdjAahKzTkkjISyJBha5ZQVwzPTTb3yh8xEoUU+asKSdMUt2g3iezaNafDH0ZWCxuDMUh//gjoY8JWb4Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060820; c=relaxed/simple;
	bh=o5q6ik0wNUXEhQs0HGFJCPjhVW7REFOYzvisPG10uUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nXR1IZGReDU47fDqStXKVKRUsDOv3lB1rg3NHYPwUi4j6jrbBdGzp+zjOjIG4wQrA7hyaI4N93xXNKqNIYyuO3lXlbcbu5+V1sip2S2waRU6cuevu0XD7YnyixMtJRU5kNtYnAPN+mtpn6bN+hOX4CsCWMQ8LqzB402In5ZZ/oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ixeGvqt+; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ixeGvqt+"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 463121477;
	Thu, 15 Oct 2026 03:40:14 -0700 (PDT)
Received: from [10.57.88.29] (unknown [10.57.88.29])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D41A3F871;
	Thu, 15 Oct 2026 03:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792060817; bh=o5q6ik0wNUXEhQs0HGFJCPjhVW7REFOYzvisPG10uUs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ixeGvqt+abRME/Ac3GRVMe/1uC/qPiOKZYneV7IyCip9XZWWKtsS4SD3gzkZ6pXqQ
	 cy/KB8QVuhlTx6uDL1bFEFt9jdoHQO1StOoq0q7pZmMTcJMfG5ab37+8tI7mChw1hx
	 id/VonOyvZ+1Rkj71EGUACURn0jiylUrozDECB28=
Message-ID: <a71b6375-f460-49fc-aee6-9f01d58163c2@arm.com>
Date: Thu, 15 Oct 2026 11:40:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched: Account blkio delay independently of delayed
 dequeue
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Balbir Singh <bsingharora@gmail.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Valentin Schneider <vschneid@redhat.com>, Josh Snyder <joshs@netflix.com>,
 Kayra Cizmeci <kayracizmeci@gmail.com>, linux-kernel@vger.kernel.org
References: <20261014081731.1068794-1-zhanxusheng@xiaomi.com>
 <fab66e31-7c7e-4a81-be59-1a4c1458ff43@arm.com>
 <4ce12bff-9532-4b27-98f2-a807bbccfaf7@arm.com>
 <20261015025912.1541134-1-zhanxusheng@xiaomi.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20261015025912.1541134-1-zhanxusheng@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/15/26 03:59, Zhan Xusheng wrote:
> On 10/14/26 17:12, Christian Loehle wrote:
>> Start accounting in try_to_block_task(), when the current task commits
>> to blocking, before delayed dequeue or proxy execution can retain it on
>> the runqueue. End accounting when clearing is_blocked, including queued
>> wakeups and the proxy execution paths that let the current task continue.
> 
> This is the right place, and it subsumes my patch. Please drop mine
> rather than queue both.
> 
> try_to_block_task() has only one caller, __schedule(), which passes prev,
> and prev is rq->curr there. So @p is current, the argument-less
> delayacct_blkio_start() is correct once the call lives there, and the
> signature change I proposed is unnecessary.
> 
> The two also conflict: my patch rewrites the sched.h line yours deletes,
> so applying mine first makes your sched.h hunk fail, and the new call in
> try_to_block_task() would not compile against the changed prototype.
> 
> Reviewed-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> One question. rq->nr_iowait stays in __block_task(), so the two now
> measure different intervals: blkio delay from the commit to block,
> nr_iowait from the actual dequeue. A task woken while still delayed is
> accounted a blkio delay but was never counted in nr_iowait, so
> procs_blocked in /proc/stat and the iowait time derived from
> nr_iowait_cpu() still lose that window. The counter stays balanced,
> because such a wakeup returns through ttwu_runnable() and never reaches
> the atomic_dec() in ttwu_do_activate(), so this is not a leak. Is leaving
> nr_iowait behind deliberate, or a follow-up?

Your observation is correct.
First of all we're hoping that /proc/stat isn't observed at such granularity
to matter, but that's not really a good enough reason to leave it behind.
AFAICS we would need to start tracking iowait_cpu in task_struct then?
I'm fine with that and can send a follow-up, I guess Peter feel free to take
whatever you prefer.

(Given the update interval of /proc/stat and the expected delayed-dequeue time
 not 'fixing' it is also an option IMO. I don't see why we need to guarantee
that the blkio delay and nr_iowait need to track the exact same transitions.)
