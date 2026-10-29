Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793273635;
	b=Fp5Hn1NbdDriua18CNOIYEN6aNKp9MMDwG9Z9uXtsKCQ4sL3hWAAGv68shygs7RlwE8x
	 fh4avK0bjg1Tk0mN15Zla6LCkFFm+5G0E/uAepm/j7qMhuFl9iDPX6UbXuOIra/XYzfsg
	 PQ6lTh3/2E1g71wKvIFr+kwu3xYqPrbLumLrNNtLLvKPPTRLVMNOIvRNr0lUu8zHndb6S
	 37zwu/bDBuOVXPhepnVIIt24aWfi5NyTKimr3ABvwWHcZLdwM284TGiyYA/Aoj+xWI5EI
	 Au1UxWyUsh8LPIMRO0hYeR+qP6a22jusvaaTRQvzW/MBR8f0EqLx+FDRt5JieBqNRkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793273635;
	h=DMARC-Filter:DKIM-Signature:Date:In-Reply-To:To:From:Message-Id:Cc:
	 Mime-Version:Content-Transfer-Encoding:References:X-Original-From:
	 Subject:Content-Type:User-Agent:X-Lms-Return-Path;
	bh=wFBCu+YdzwIUEcYKGRG11Fp0ZZOhUTu2QED4Ky6DRFk=;
	b=yiWRjReZj1FvtRPiQYYn8kHzS9PzEiDjHXsC122vknifrbAGY+37AzApJf7QtibbMgPm
	 iYigZxgtCFKrSMtplVB3u7qKoEr1Ydd74IOatV4NGYQZEbdLQqPRJ2QI6hwTe5muT5P8/
	 iEb9cKKauIk0I1YtHNvmuEsB4CwwK/rPyDLeJMQeNDoHEmowHD2jTBMqZV4LiCB8slgCI
	 KeRmSF1EPwYrRY7YFSeNFrOv4yF+585xejDhnyNTiNyNjg48Q5wsPqvtx2RrGS1I6/td7
	 srl1Ypo+CSTI9wNMSUZ6iBc0stqj0B1vVBjujjqeOWFCXoLPrR1dIbz3A1OBECcLOhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=SNU828+O;
	arc=none smtp.remote-ip=209.127.231.112
Received: from va-2-112.ptr.blmpb.com (va-2-112.ptr.blmpb.com [209.127.231.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686EF606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 686EF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=SNU828+O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793273626; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=wFBCu+YdzwIUEcYKGRG11Fp0ZZOhUTu2QED4Ky6DRFk=;
 b=SNU828+ONqWhAEgsW3dWYHT8vSOIYdYk0B/sxMZtRG/I66U5pIznJieA51RKbVa0OfKXOi
 6EmWB4lSolufwNm8Y/ZCoQA2/+z7jOilK7tRsZdPHLuS5av+7kVuwYWFbWFeUWsyitdgFR
 EGpRVC4IDwrxB+TOuRZLA/niaur9H0UD7wm1zM6sQV0LFNUUyAj5+mbTli2Q1TMC6fRTBV
 JAMFbRgDozNu4ZEnZsWAskHAIIfgWaREmIXB4Aph6VIZHEhxC/Toc1Y7mxdxL9bd4vuqwF
 l5B5h1W57DfRKram+RGdtP4UXAxjeDCkd34KgjbxHKNAHq2UqbIsh4D/CDR53g==
Date: Thu, 29 Oct 2026 19:33:22 +0800
In-Reply-To: <a6bcd771-fcf7-4fe4-8c21-5e65bd579de7@amd.com>
To: "Bharata B Rao" <bharata@amd.com>, <akpm@linux-foundation.org>, 
	<bsegall@google.com>, <david@kernel.org>, <dietmar.eggemann@arm.com>, 
	<gourry@gourry.net>, <joshua.hahnjy@gmail.com>, <juri.lelli@redhat.com>, 
	<kprateek.nayak@amd.com>, <ljs@kernel.org>, <mgorman@suse.de>, 
	<mingo@redhat.com>, <peterz@infradead.org>, <rostedt@goodmis.org>, 
	<vincent.guittot@linaro.org>, <vschneid@redhat.com>, <ziy@nvidia.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Message-Id: <1bab234e-8914-4694-b0aa-f265fa49c6d3@bytedance.com>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20261028041253.74839-1-lizhe.67@bytedance.com> <20261028041253.74839-2-lizhe.67@bytedance.com> <0676993f-c04c-4e4e-9f8d-1650c8fd6d6e@amd.com> <010b2b6c-8f1b-4c3b-913f-cc2e8b957759@bytedance.com> <a6bcd771-fcf7-4fe4-8c21-5e65bd579de7@amd.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Subject: Re: [PATCH v2 1/3] sched/numa: make free-space tiering promotion bypass configurable
Content-Type: text/plain; charset=UTF-8
User-Agent: Mozilla Thunderbird
X-Lms-Return-Path: <lba+26ae32f19+1fccaa+vger.kernel.org+lizhe.67@bytedance.com>

On 10/29/26 6:22 PM, Bharata B Rao wrote:
> On 29-Oct-26 3:16 PM, Li Zhe wrote:
>> [You don't often get email from lizhe.67@bytedance.com. Learn why this i=
s important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> On 10/29/26 5:34 PM, Bharata B Rao wrote:
>>> On 28-Oct-26 9:42 AM, Li Zhe wrote:
>>>> Memory tiering normally promotes any recently accessed slow-tier page =
if
>>>> the target fast-tier node has enough free space. This preserves the
>>>> existing policy of filling available fast memory before relying on
>>>> hotness and rate-limit control.
>>>>
>>>> That is not always the desired policy. Some deployments may intentiona=
lly
>>>> keep part of a workload's memory on CXL-attached memory, for example t=
o
>>>> preserve a desired DRAM/CXL capacity split or bandwidth distribution. =
With
>>>> the free-space bypass, short cold accesses and bursts of hot accesses =
can
>>>> refill the fast tier and pull the workload away from that distribution
>>>> whenever DRAM has free space.
>>>>
>>>> Redis testing exercises this policy issue. On a CXL system with node0 =
as
>>>> DRAM and node3 as slow-tier memory, a Redis test was run with
>>>> memory-tiering-only mode enabled. The test used a Redis dataset with 1=
2
>>>> million 4KB values. It reclaimed memory until about 85% of Redis
>>>> anonymous memory was on node3, used a Redis benchmark configuration wi=
th
>>>> a 10% hot-key working set, and then issued a short 256MB access burst =
to
>>>> cold keys outside that working set. The cold-key burst mainly touches
>>>> memory outside the hot working set, which is expected to remain mostly=
 on
>>>> the slow tier.
>>> Can you please clarify if 85% of redis memory ended up on lower tier na=
turally
>>> due to overflow from toptier? I ask this question because, if it is a n=
atural
>>> overflow/demotion, then it will be hard to find head room in the toptie=
r to
>>> allow promotions that bypass hotness or rate limit checks."
>>
>> It was not a natural overflow from a full top tier.
> Thanks for confirming this.
>
>> The test intentionally reclaimed/demoted Redis memory to the lower tier
>> to model a deployment that keeps only a limited fraction of the workload
>> in DRAM and leaves the rest on CXL memory.  In that setup the top tier c=
an
>> still have enough free space, so the current free-space bypass can promo=
te
>> short cold accesses back to DRAM.
> With pghot, I have been providing benchmark numbers from two scenarios:
>
> 1. Non-overcommitted case: The workload memory is pushed to lower tier be=
fore
> the measurement phase begins, the toptier has enough memory to accept the
> the incoming promotions.
>
> 2. Overcommitted case: The workload memory naturally overflows/demotes in=
to
> the lower tier and every promotion undergoes the hotness + ratelimiting c=
heck.
>
> I gather that your measurement technique is similar to case 1 above.
>
> The feedback I have received for pghot is this: Non-overcommitted case is=
 not
> the right methodology to use but the natural spillover is. Hence I am not=
 sure
> if optimizing the free-space bypass case would benefit any naturally run
> cases.


Thanks for sharing this feedback.

Yes, the case I am trying to cover is closer to the non-overcommitted
case.=C2=A0 We do have deployments where memory is intentionally placed acr=
oss
DRAM and CXL memory, instead of relying only on natural spillover from a
full top tier.

For example, the orchestration layer may want a cgroup to use a planned
DRAM/CXL ratio, so that DRAM capacity remains available for later
placement decisions or other workloads.

In such setups, the top tier can still have free space, but we may not
want short cold accesses to refill it simply because the free-space
bypass is available.=C2=A0 The intent of this patch is to let those
deployments keep using the existing hotness and rate-limit checks even
when there is top-tier headroom.

Thanks,
Zhe

>
> Regards,
> Bharata.
