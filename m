Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478898;
	b=lVUWvYecFOIrGs9IGnB+StdVRkDUAv1cH0FT0mEZEG3IoO+vV3LWJGLhIsCKp58zk/zm
	 clTwhCZziVdTzYt7nd01sAkpTjR2yEtSkIIYB8Vb6MgkV1W7uBJoj4BKxWsj2RQoJW2Q8
	 Br3CiOYqGyOLUsBlCbwdmqOkkLT+QInIxpE1gUrlSL+unPAafZs3NSFDvOCEGHwR4XGjs
	 jYhFxJcFkIDT4LxL37BwFIPPviUXnjxz1f1h0qrjEDWP/L1vF+y9LvM83pfuAPKOsl6kI
	 CfcCxVf9sgsWYDrGOJ566FYOD+B7k/sKRKGFomItp+V97UdMNcYCOOC9x8yVIrf5MXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478898;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=r3Gw4C6d+cgZHvQCxnDAyJZCCrWKpRWiNstAmvZcl4I=;
	b=05grKXZpge8JJk0dN0AXARLKPMqd4YdpvCl+Ocde0PpSnKoogNNXhtlzGg+robkowJBj
	 3VKIpgAz4EEp1vaREow8i+8i4QZ/HslYD07xPsu7e0hNQrc0VI8lMIL3gixR7G3t+XuRM
	 zMTwjSJBDIdUf2knL/71DUCUvHlOD/p6dQdcN2U1xH2G6BaKJd7KVVbA95h6mt1nSHzL5
	 xlqd3+M4lRBrQ3E8TZGFxXFAbz7IO+l+6eJx9YEBLjpYvMNAveZO60Jog002IEc0UjIxE
	 tR4hfESFRM8dNkkeGZ2kv2wek6XiGwqJHb0wxg7Ws30mQidFQLtRo0bbe3aOicbJiRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=EgkdXkAR;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C9A2606A328
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C9A2606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=EgkdXkAR
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23D261595;
	Mon, 19 Oct 2026 23:48:12 -0700 (PDT)
Received: from [10.164.19.55] (unknown [10.164.19.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91B2D3F7D8;
	Mon, 19 Oct 2026 23:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792478895; bh=aYYGnkNV3bcqHzLEEf22D04oPGihf8ZUUTG5EXgXVKY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EgkdXkARiPYv2Q1yTzLgHYb6CbRVmx9K8avmQlFKvUvokkbsFc+/5/4FCpnGY0vA7
	 H6em7VkIAk6kFq0ir70z8Na1VW55BCsAD/DuSNjvrPT0HtlIFr1lL5N2G7NIcH4jVr
	 v+cHL5eJ+a5qTryJXovQTH0dZrf6pgY23+nqtzn8=
Message-ID: <0aae72c3-7f46-4236-8cbb-d3e6f3c66e62@arm.com>
Date: Tue, 20 Oct 2026 12:18:06 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 2/4] mm: compaction: target mTHP order for
 proactive compaction
To: Bo Zhang <zhangbo0325@gmail.com>
Cc: akpm@linux-foundation.org, vbabka@kernel.org, david@kernel.org,
 surenb@google.com, mhocko@suse.com, brendan.jackman@linux.dev,
 hannes@cmpxchg.org, ziy@nvidia.com, ljs@kernel.org, liam@infradead.org,
 rppt@kernel.org, qi.zheng@linux.dev, shakeel.butt@linux.dev,
 kasong@tencent.com, baohua@kernel.org, axelrasmussen@google.com,
 yuanchu@google.com, weixugc@google.com, zhaonanzhe@xiaomi.com,
 lipengfei28@xiaomi.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Bo Zhang <zhangbo56@xiaomi.com>
References: <8e54025a-03da-4cba-bae8-1604463c7622@arm.com>
 <20261019150315.2018934-1-zhangbo56@xiaomi.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20261019150315.2018934-1-zhangbo56@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 19/10/26 8:33 pm, Bo Zhang wrote:
> On 19/10/26 1:42 pm, Dev Jain wrote:
>> I wonder if this function should be left alone?
>>
>> compaction_proactiveness, as I understand is given as a sysfs knob to
>> ensure that the user can control how much power they want to invest into
>> compacting. So suppose the value is 20, and the highest mTHP order is
>> only 2. This gives wmark = 90 * 2 / 9 = 20. So, even if 80% of the memory
>> can serve order-2 allocations, we will still perform compaction for
>> order-2. This seems "extremely proactive" :)
> 
> Thanks a lot for looking at this closely, and you are right that the
> scaling factor is the weakest part of this patch. I called it out as an
> open question in the cover letter and I don't have a solid theoretical
> basis for the linear order/COMPACTION_HPAGE_ORDER form.
> 
> What pushed me towards scaling the watermark at all was the opposite
> problem on the measurement side: without any scaling, the order-9
> threshold is essentially never reached for a small order, so proactive
> compaction effectively never runs for order-2.
> 
> I instrumented fragmentation_score_node() for order-2 on an 8G,
> data=journal kernel-build workload and sampled it at ~100ms. On the
> unpatched kernel the order-2 score looks like this:
> 
>   order-2 score (unpatched, same workload):
>     mean      17.3
>     p90       47
>     p99       91
>     max       100
> 
>   fraction of time the score exceeds a given threshold:
>     > 90 (unscaled, the current order-9 wmark):  1.0%
>     > 20 (scaled down to order-2):              27.2%
> 
> So with the current (unscaled) watermark, the order-2 score crosses the
> trigger only 1% of the time, which in practice proactive compaction almost
> never fires for order-2.

I get it, so the workload is rapidly allocating mTHP, and kcompactd does not
kick in time, leading to direct compaction (compact_stall) or fallback.

But I think this is a tradeoff with the current design in Linux and has nothing
to do with our mTHP usecase right? Even with PMD sized THP we may have the same
problem.

I think the uncontroversial bit of your patchset is the fact that currently we
migrate large folios just to free up a 2M region. To make forward progress it
will be great if you can find a workload which gets us an improvement without
the threshold changes and we could get those patches merged first.

I am saying that because the reason you keep crossing the 90% threshold is
due to the nature of the workload and that you set 32k mTHP to always. I doubt
on a real system you will cross the threshold this rapidly since mTHP would be
mostly "madvise" and that mTHP-requiring workload wouldn't be the only workload
running.

Given that, one thing that comes to mind is this algorithm - kcompactd wakes up, sees
that the threshold got crossed again, which means it woke up too late. So
it should manipulate the threshold or its wake up time. We need a signal to
say that the mTHP allocation is too abundant and we need background compaction
more frequently.

This algorithm may be in contradiction with the sysctl ... so instead of changing
the threshold, we could lower the wakeup time.

This is similar to how the pcp list changes its threshold if too much allocation
is happening.
> 
> That said, your example shows the linear scaling clearly overshoots in
> the other direction: a scaled wmark of ~20 can keep compacting while a
> large fraction of memory is already usable, which is not what the
> proactiveness knob is supposed to express. So I agree the current formula
> is not the right answer.
> 
> I'd appreciate your thoughts on the direction here. A couple of options
> I can see:
> 
>   1. Leave fragmentation_score_wmark() alone and instead make the score
>      itself order-aware / normalized, so that a given proactiveness value
>      maps to a comparable amount of work regardless of the target order.
>      This keeps the knob's meaning intact.

The challenge is the normalization algorithm, the problem is that there is
nothing we can deduce apart from the fact that
frag_score (order x) <= frag_score (order y) where x <= y.

> 
>   2. Keep scaling the watermark but with a floor / non-linear mapping so
>      it cannot collapse to a value that triggers when memory is clearly
>      sufficient.
> 
> I haven't settled on either yet and would rather hear which direction you
> think makes more sense before reworking it.
> 
> Also, thanks for the review on patch 4 -- good to know the
> costly/non-costly split seems like a reasonable compromise.
> 
> Thanks,
> Bo

