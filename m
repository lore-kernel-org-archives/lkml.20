Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4B43A254C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792037391; cv=none; b=uu1h7R5SVSBWRrqm8v3dl6E1Du+3+9G33/WawimT348ImOSJvCFrJ1COwLHFGHOjc5GKf3CBfe4gS6osDLwqgfgasj3TSslKGw9FSrcq79AOzlhkYRzn5CMbPuW6ZOQrZZnzrZRZnyk91WSniiqLVwpkK4yVS2VDPzkskFpG7+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792037391; c=relaxed/simple;
	bh=8+Y3lqx7DoXLn6uMpykiqLK9WKGpfJOp/EpoHwnmKak=;
	h=Content-Type:To:Date:References:Cc:Message-Id:Mime-Version:
	 In-Reply-To:From:Subject; b=u4E0u6/U8WkY34awM3zQHoxnEf8Eq06MO2nj0IW+42AAPPsxWx1VwKfrsQ7TbNrTpoQwCBkhr8XseyNFFnSNcZokJf8lUM353v92tT93CZi/Rdd+FPvus3opZTls1BO4nW3tNaXH1AjLvGxZUu9DuMq5GGosv8FWfnrfX1uwalY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Oei178cR; arc=none smtp.client-ip=209.127.230.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Oei178cR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792037381; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=ZRj2GAZqXT54HVtNDIUND68T2cWL0CDUpFdwNDt9C/c=;
 b=Oei178cRmt4vFYunYV+nz2zYtcJOdySv/VpwVa+HnCmkfWrMeUVWCQ1+Q64g/UIo9oSNxl
 wfXlLAOeCpZfRCRxh2bJHLSkV4PtOiz0UvVqUlUxbSage3FEQG9M2mLZxhB8Qx5ujj1CY8
 IeRVuMcxf5YRPImNqkrtgNYqCa8e6mBVIh2/SgkVcN2rl0NBjJaktlOed1H8bTnFs49ost
 Ux+6tWmGIZk90EOvrIgpD3UvK1BUWevxq8Gf6k227grE1YvrDwhBG9Jy0bG9cOvfYNMYRo
 /nleHmd11clal0/S/mmfYgO8aH8LJppW/S4G7YFZ1v7BbGf+kUDlNtuq7QFxKw==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Gregory Price" <gourry@gourry.net>
Date: Thu, 15 Oct 2026 12:09:17 +0800
References: <20261014094347.99157-1-lizhe.67@bytedance.com> <20261014094347.99157-5-lizhe.67@bytedance.com> <as-AV04p-AZ45-mw@gourry-fedora-PF4VCD3F>
User-Agent: Mozilla Thunderbird
Cc: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>, 
	<joshua.hahnjy@gmail.com>, <ziy@nvidia.com>, <mingo@redhat.com>, 
	<peterz@infradead.org>, <mgorman@suse.de>, <riel@redhat.com>, 
	<juri.lelli@redhat.com>, <vincent.guittot@linaro.org>, 
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>, 
	<vschneid@redhat.com>, <kprateek.nayak@amd.com>, 
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>
Message-Id: <a01ccd5a-f443-49bb-a615-5712881ee7cd@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ad05203+82078e+vger.kernel.org+lizhe.67@bytedance.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
In-Reply-To: <as-AV04p-AZ45-mw@gourry-fedora-PF4VCD3F>
From: "Li Zhe" <lizhe.67@bytedance.com>
Subject: Re: [PATCH 4/6] sched/numa: make free-space tiering promotion bypass configurable

On 10/14/26 9:16 PM, Gregory Price wrote:
> On Wed, Oct 14, 2026 at 05:43:45PM +0800, Li Zhe wrote:
>> Memory tiering normally promotes any recently accessed slow-tier page if
>> the target fast-tier node has enough free space. This preserves the
>> existing policy of filling available fast memory before relying on
>> hotness and rate-limit control.
>>
>> That is not always the desired policy. Some workloads may intentionally
>> place memory across CXL-attached memory and DRAM to use aggregate memory
>> bandwidth. With the free-space bypass, cold one-shot accesses and bursts
>> of hot accesses can refill the fast tier and pull the workload away from
>> that distribution whenever DRAM has free space.
>>
>> Add kernel.numa_balancing_promote_free_space_bypass. It defaults to 1,
>> preserving the existing behavior. When cleared, enough free space in the
>> target fast-tier node no longer bypasses the normal hotness and
>> rate-limit controls.
>>
> A global switch for this is a poor solution for this problem.
>
> Also, if the memory was spread out intentionally, it presumably was done
> so with a memory policy.  In that case, if the user did not set
> MPOL_F_NUMA_BALANCING - that spread is already protected because the
> mempolicy overrides the numa balancing fault and no migration occurs.
>
> I don't think this is the right direction.

I agree that a workload which wants to fully preserve its initial spread
can avoid MPOL_F_NUMA_BALANCING.

The case I had in mind is different: the workload wants to opt in to
tiering, so hot and cold pages can still be adjusted, while keeping the
DRAM/CXL distribution meaningful. This is the same kind of use case I
was trying to describe for weighted interleave plus NUMA balancing:

https://lore.kernel.org/all/20260930072617.64665-1-lizhe.67@bytedance.com/

With the current free-space bypass, opting in to tiering can promote
recently accessed slow-tier pages without the normal hotness and
rate-limit checks whenever the top tier has enough free space. That makes
it hard to combine weighted or interleaved placement with tiering
feedback.

That said, I see your point that a global switch is coarse. Maybe this
should be controlled by a per-workload policy instead. For example,
Yafang's RFC for BPF-based per-cgroup NUMA balancing mode selection seems
related:

https://lore.kernel.org/lkml/3eda489898ebf7c848ce61760af745d9@kernel.org/

Would a per-cgroup control for this promotion behavior be a more
reasonable direction than a global sysctl?

Thanks,
Zhe

>
> ~Gregory
