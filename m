Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267233;
	b=LeWjCaBkSY3TPeQ8DFg2pxig8Fp3Xit3fHXcdpsZYRZzo++YHXv73EfFCk277OXcSnOi
	 V48N+CrEiPniJVIWp3b/0KihCM7VXzVbFlJCf2aIktMZXlLBTZQKRbF6VJ1dfXehcx+1Z
	 hWBn5egWq8Xzli3o7aAdMYZMM9AQJrlH0jqPExkLTci9dQiRWLV2Gy6Bng+k1RT/nxjch
	 9GPi3mbW/3K7Wm1EbQHRh/rIHIGW2jsSKKZKQBvw/qj0Y2AtGLW1PbjFUszU3Abdm7d0R
	 vkmZ7iCVnsRQg7nfo4MZf9HIC007fTQAMjdGjTVGc3V/p8NcJPbA8ElWMlMmFcSKvog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267233;
	h=DMARC-Filter:DKIM-Signature:From:Mime-Version:X-Lms-Return-Path:
	 User-Agent:In-Reply-To:Content-Type:References:To:Subject:Date:
	 Message-Id:Cc:Content-Transfer-Encoding:X-Original-From;
	bh=F4gvnh7LFe+Aif3PBPP0ropSW63VFqrhI2+JK0JsQWE=;
	b=A3oJYj867wTZlfCKMqCq2yU4xgPCnuyWVqkQxo+58T8UlVGE3R0unAln9cPZRN2v+Tpe
	 +v9LD42HRtMJvyCgpMId8GM0azX+9Wt1/d8JhZZqGcpCYTe6+n5pRK3nLp/0ixnJNBilb
	 /zFi/MYJNoV8DUGAY+6ctXQ2l0ctoGvOjjdFr8buKsA86R2sKU/+PFuKP43tiI3sNx8BO
	 mRYHk3kmAI19vvFb1Wv22p63jo6l3eucczd/oirZzHXHtj2zAz+a2EMm6F/Xmfu08mI3r
	 f7AJYB9SrsFQMHaUwTA/okZjvxbys7Bf/x4dAT9dL5fcllcfCEXfBQjKJyp4PmTcgnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=SKkaSY8C;
	arc=none smtp.remote-ip=209.127.230.113
Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24908606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24908606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=SKkaSY8C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793267226; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=F4gvnh7LFe+Aif3PBPP0ropSW63VFqrhI2+JK0JsQWE=;
 b=SKkaSY8Cr57dDZjYFbF5aGDtSPstlNfCSFJedb9DWTWJx/fSKdPW9k+OwI11XLfztD2olT
 arW7Ec64JknSolPL2Kp7kHZSMJ/Lzoz5Pd+Xrj3jUNJmey+MG9INMbMdoKDJ7wWLmkyKWr
 WBC+eGghbzKf6K92PnJjh5LUeYq+4L0D8CbQCwz2T8LTi3FZ4Kc7KfYj6ovYShTrZGfDLT
 caVNuUwcj1pgcN0gcKqm1cmNfTkxww8sHbNAeeJGmVu5krU9afy4gUPXOHxNoojo14ipAF
 DCBsRhXCj68LjFXMk4IijV0ROBYGXaKpcLYTjJoHvRpZGaw7lheGG6ZY0sHhpw==
From: "Li Zhe" <lizhe.67@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ae31618+2eb6f0+vger.kernel.org+lizhe.67@bytedance.com>
User-Agent: Mozilla Thunderbird
In-Reply-To: <0676993f-c04c-4e4e-9f8d-1650c8fd6d6e@amd.com>
Content-Type: text/plain; charset=UTF-8
References: <20261028041253.74839-1-lizhe.67@bytedance.com> <20261028041253.74839-2-lizhe.67@bytedance.com> <0676993f-c04c-4e4e-9f8d-1650c8fd6d6e@amd.com>
To: "Bharata B Rao" <bharata@amd.com>, <akpm@linux-foundation.org>, 
	<bsegall@google.com>, <david@kernel.org>, <dietmar.eggemann@arm.com>, 
	<gourry@gourry.net>, <joshua.hahnjy@gmail.com>, <juri.lelli@redhat.com>, 
	<kprateek.nayak@amd.com>, <ljs@kernel.org>, <mgorman@suse.de>, 
	<mingo@redhat.com>, <peterz@infradead.org>, <riel@redhat.com>, 
	<rostedt@goodmis.org>, <vincent.guittot@linaro.org>, 
	<vschneid@redhat.com>, <ziy@nvidia.com>
Subject: Re: [PATCH v2 1/3] sched/numa: make free-space tiering promotion bypass configurable
Date: Thu, 29 Oct 2026 17:46:40 +0800
Message-Id: <010b2b6c-8f1b-4c3b-913f-cc2e8b957759@bytedance.com>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>
Content-Transfer-Encoding: quoted-printable
X-Original-From: Li Zhe <lizhe.67@bytedance.com>

On 10/29/26 5:34 PM, Bharata B Rao wrote:
> On 28-Oct-26 9:42 AM, Li Zhe wrote:
>> Memory tiering normally promotes any recently accessed slow-tier page if
>> the target fast-tier node has enough free space. This preserves the
>> existing policy of filling available fast memory before relying on
>> hotness and rate-limit control.
>>
>> That is not always the desired policy. Some deployments may intentionall=
y
>> keep part of a workload's memory on CXL-attached memory, for example to
>> preserve a desired DRAM/CXL capacity split or bandwidth distribution. Wi=
th
>> the free-space bypass, short cold accesses and bursts of hot accesses ca=
n
>> refill the fast tier and pull the workload away from that distribution
>> whenever DRAM has free space.
>>
>> Redis testing exercises this policy issue. On a CXL system with node0 as
>> DRAM and node3 as slow-tier memory, a Redis test was run with
>> memory-tiering-only mode enabled. The test used a Redis dataset with 12
>> million 4KB values. It reclaimed memory until about 85% of Redis
>> anonymous memory was on node3, used a Redis benchmark configuration with
>> a 10% hot-key working set, and then issued a short 256MB access burst to
>> cold keys outside that working set. The cold-key burst mainly touches
>> memory outside the hot working set, which is expected to remain mostly o=
n
>> the slow tier.
> Can you please clarify if 85% of redis memory ended up on lower tier natu=
rally
> due to overflow from toptier? I ask this question because, if it is a nat=
ural
> overflow/demotion, then it will be hard to find head room in the toptier =
to
> allow promotions that bypass hotness or rate limit checks."


It was not a natural overflow from a full top tier.

The test intentionally reclaimed/demoted Redis memory to the lower tier
to model a deployment that keeps only a limited fraction of the workload
in DRAM and leaves the rest on CXL memory.=C2=A0 In that setup the top tier=
 can
still have enough free space, so the current free-space bypass can promote
short cold accesses back to DRAM.

Those pages are not hot enough to be promoted by the normal
hotness/rate-limit path, but the free-space bypass can still promote them
when the top tier has enough free space.

Thanks for pointing this out.=C2=A0 I will clarify this setup in the commit
message.

Thanks,
Zhe

>
> Regards,
> Bharata.
