Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09ED54FC329
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792064717; cv=none; b=Y1GZCzWRUhjN9Yyb6ZOirKBVoF5X2pecOgtD+f/eP37XR3bnOVO8ZmcIXtaUxzAhVX5lFzwtBh4YC3MTbvJtw/n6DHkO+aitkZcTJAklve/V3SsJLpagXbHTahevXI6Kbw/aA7vnKUgli/ILsfNUP7d0hkKlaYI9/V1Hz0mFcMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792064717; c=relaxed/simple;
	bh=td+2C/ZqZ0tJOzbidUjih2kVEMjBQk+gP/LTrHYJ9ZA=;
	h=Message-Id:In-Reply-To:Cc:From:Subject:To:Date:Content-Type:
	 Mime-Version:References; b=NeBxoO0JtmXe2lqAkiKL4D771WVfawB+4l55vZKvbl5wr3WBPcg97RlBHRvXcjmnh8Xc22MzTT9OK79quG9bGBb8f5d1LPNop16bIBQUmvjibiR+L71CjTj2UbSnCxRLVCYO6ZeG8fCm1BXiWknDljPcotEI5q575wvtGEDhM84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=iwKMRuyB; arc=none smtp.client-ip=209.127.230.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="iwKMRuyB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792064705; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=td+2C/ZqZ0tJOzbidUjih2kVEMjBQk+gP/LTrHYJ9ZA=;
 b=iwKMRuyBVJxC9RCYYCPJvqQYmOqnh7J9TH5Hro6Fcc6VG3T6Ui3iROJoDGYCyPsXwJmaFP
 pS2Ho7t5nOOc/UzZp5WgM4qBSspv21RDXwcJvSX+WRI0BuE/OrW/qoc2tPWiaKyUYaAAsB
 14f+DuWCr/FRfdIZXDE7nZGRbrbWE4CiYFkqGBb2wg1SykCVslXIisVichKLGrft/HRmSh
 z3FMLZtnQCXllguzJTpogzAooHQxVJ+0seJ65QmRCqSdAphoQXxifUsKXXjiETViUcV3En
 vVgd1yX93k8m9zqWFzqFHLGhx5l2mIlkGSTCP+9phw6Rd2eVDgWIoZFdcRTY5w==
Message-Id: <5c26465f-3100-4f89-bacf-b395e413ed35@bytedance.com>
In-Reply-To: <as-D8ff7oXKX_CwF@gourry-fedora-PF4VCD3F>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Cc: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>, 
	<joshua.hahnjy@gmail.com>, <ziy@nvidia.com>, <mingo@redhat.com>, 
	<peterz@infradead.org>, <mgorman@suse.de>, <riel@redhat.com>, 
	<juri.lelli@redhat.com>, <vincent.guittot@linaro.org>, 
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>, 
	<vschneid@redhat.com>, <kprateek.nayak@amd.com>, 
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>
From: "Li Zhe" <lizhe.67@bytedance.com>
Subject: Re: [PATCH 6/6] sched/numa: ignore preferred nodes without normal balancing
To: "Gregory Price" <gourry@gourry.net>
Date: Thu, 15 Oct 2026 19:44:40 +0800
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+26ad0bcbf+8976d8+vger.kernel.org+lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
References: <20261014094347.99157-1-lizhe.67@bytedance.com> <20261014094347.99157-7-lizhe.67@bytedance.com> <as-D8ff7oXKX_CwF@gourry-fedora-PF4VCD3F>

On 10/14/26 9:30 PM, Gregory Price wrote:
> On Wed, Oct 14, 2026 at 05:43:47PM +0800, Li Zhe wrote:
>> numa_preferred_nid is normal AutoNUMA task-placement state.
>> Memory-tiering-only mode uses NUMA hint faults to drive page promotion,
>> not CPU placement.
>>
>> Even after tiering-only faults stop updating normal placement statistics,
>> a task can still have a preferred NUMA node from earlier normal balancing
>> or from previously polluted state. Several scheduler paths consume that
>> stale state when the NUMA balancing static key is enabled, including
>> explicit NUMA task migration, sched-cache preferred LLC and scan CPU mask
>> selection, load-balance locality checks, fbq classification, and wakeup
>> group selection.
>>
>> Add a small helper for normal NUMA placement being enabled and use it to
>> ignore numa_preferred_nid when NUMA_BALANCING_NORMAL is disabled. Keep
>> the preferred-node migration retry timestamp update before the normal-mode
>> check so accepted non-normal sysctl states do not leave stale retry state
>> behind.
>>
>> Keep the rq nr_numa_running and nr_preferred_running accounting unchanged
>> so runtime mode changes do not make enqueue/dequeue accounting asymmetric;
>> the load balancer simply stops consuming those counters while normal
>> balancing is off.
>>
>> This does not clear numa_preferred_nid and does not change memory-tiering
>> promotion decisions.
>>
> Same feedback - need to present user-facing performance changes to show
> the impact of this change.
>
> Sashiko also has some correctness feedback.
Thanks for the review.

For the performance side, I do not have convincing user-facing
performance numbers for this patch. Similar to patches 3 and 5, this was
written from the code/semantic correctness side for memory-tiering-only
mode, rather than as a general improvement for normal NUMA balancing
workloads.

I did not see Sashiko's correctness feedback on the public thread. Could
you share it here, or ask Sashiko to reply on-list? That would help me
understand the exact issue and make sure the next version addresses it.

Thanks,
Zhe

>
> ~Gregory
