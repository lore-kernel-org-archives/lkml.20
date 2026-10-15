Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAF74D9577
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064422; cv=none; b=KcQ1nSyz+Pepq/wxhLzH4klHfMxp1JSMYE+Ac8203TX6Il34TiXO2MhI1Ywuftr+9OP8AYzd8APQcw3Xn6wPaULmll9q1OJrf8USwswh4dcDeuITW3OyLqark9/ik9te5XxluotaogP95G11fAoe2RiUQMhCPUUKZlORyLHZWi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064422; c=relaxed/simple;
	bh=WrIl2V6/+vHdh9lsYXKRb2wtLrMBBxx5uhfmnB2HaOI=;
	h=In-Reply-To:Date:Message-Id:Content-Type:Cc:From:Mime-Version:
	 References:To:Subject; b=chNzKvTY+HA/U47V6DUzi7wLUZQdysI67R6Hiho2i/BJwesBeuuoQyC/G6ci9vFpyKrf06MLy8/PArKcg5UEOpIcYqZALNCH+bZw5rM5a3Y4BnyApoH3ln8JaTKngxOCpH9SkI0kVj9OHhropdAuBfr/hWlaCzpUZ3aNvfm9A/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=MT4ZgA42; arc=none smtp.client-ip=209.127.230.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="MT4ZgA42"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792064408; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=WrIl2V6/+vHdh9lsYXKRb2wtLrMBBxx5uhfmnB2HaOI=;
 b=MT4ZgA42QAyDq5vhpV/lL7wMqD0J2lTf2QLOKbBqYUzvAMJwQRd6ImzVFj5cPUP0TSQPHW
 DE61ZgsilhQOBgWKqQChD8hJbSvk7IvDqNF1fxECL8/A3fEKKIekFTbFp3qmDAA7Hkd0tg
 WgqlLdYSLobHbW//TfGjxg9wzywLWHy3iqOItdAa76drlyfqOFwrwVdmKHt4956UWyzIAm
 QnIKaYPk4Pm2KStpjk1vuuQaqcn2RZptxr5WZPgWRRRN80kJDxeWKdxxuocVo47QcPZ133
 UN8e7p7JEk0vUEcY2xaT9r0QEkt9O91b9uTfp7Zoxv06yMLu9DD0Q6TmNwWZ8Q==
In-Reply-To: <as9_SwmLxAcTovnl@gourry-fedora-PF4VCD3F>
X-Lms-Return-Path: <lba+26ad0bb96+80f1c1+vger.kernel.org+lizhe.67@bytedance.com>
User-Agent: Mozilla Thunderbird
Date: Thu, 15 Oct 2026 19:39:42 +0800
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Message-Id: <9b9e6c92-a291-48b4-a128-c31bc718db7a@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Cc: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>, 
	<joshua.hahnjy@gmail.com>, <ziy@nvidia.com>, <mingo@redhat.com>, 
	<peterz@infradead.org>, <mgorman@suse.de>, <riel@redhat.com>, 
	<juri.lelli@redhat.com>, <vincent.guittot@linaro.org>, 
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>, 
	<vschneid@redhat.com>, <kprateek.nayak@amd.com>, 
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>
From: "Li Zhe" <lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <20261014094347.99157-1-lizhe.67@bytedance.com> <20261014094347.99157-4-lizhe.67@bytedance.com> <as9_SwmLxAcTovnl@gourry-fedora-PF4VCD3F>
To: "Gregory Price" <gourry@gourry.net>
Subject: Re: [PATCH 3/6] sched/numa: fix scan-period adjustment for shared faults

On 10/14/26 9:12 PM, Gregory Price wrote:
> On Wed, Oct 14, 2026 at 05:43:44PM +0800, Li Zhe wrote:
>> Commit 37ec97deb3a8 ("sched/numa: Slow down scan rate if shared faults
>> dominate") intended to slow scanning when either shared or local faults
>> dominate, and to speed scanning up only when many private faults are on
>> remote memory pages.
>>
>> The implementation uses the private-fault ratio as the slow-scan signal.
>> That makes private-dominated samples slow scanning, while
>> shared-dominated samples can still fall through to the speed-up path.
>> That does not match the stated intent.
>>
>> Replacing the private ratio with a shared ratio fixes the
>> shared-dominated case, but the scan-period code still only has separate
>> locality and sharing ratios. Those ratios cannot distinguish a window
>> with many remote shared faults and only a few remote private faults from
>> one with substantial remote private faults.
>>
>> Track faults that are both remote and private, and only speed up scanning
>> when that signal is large enough. This keeps local or shared samples
>> slowing scanning and avoids extra hinting overhead when the remote
>> activity is mostly shared.
>>
> This changes NUMA balancing behavior that's been around since 2017.
>
> While it's not the stated intent, it's been consistent since then,
> and i'm concerned that this could cause unexpected regressions.
>
> Do you have performance numbers on this change to show it's actually
> beneficial compared to the existing behavior?


Thanks for the review.

I do not have convincing performance numbers to show that this is broadly
beneficial across workloads. NUMA balancing heuristics are
workload-dependent, and my motivation here was mainly the consistency of
the scan-period decision logic rather than a broad performance claim.

The same concern also applies to patches 5 and 6. They were written from
the code/semantic correctness side, but I do not have convincing workload
numbers to show that they are broadly beneficial.

For `update_task_scan_period()`, there is a more concrete issue in the
memory-tiering-only case. The function currently depends on normal NUMA
placement fault statistics. In memory-tiering-only mode, when there is no
useful normal-placement feedback, it can keep taking the slow-down path
and grow the scan period towards the maximum. I am testing a separate
patch locally to handle the memory-tiering-only scan feedback explicitly.

So I think I should separate the severe fixes from the heuristic changes.
For the latter, I will narrow the next version to NUMA balancing behavior
that is specific to memory tiering, instead of trying to justify the
changes as general improvements for normal NUMA balancing workloads.

Thanks,
Zhe

>
> ~Gregory
