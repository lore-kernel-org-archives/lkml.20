Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793242391;
	b=HIeeF135kDvq29ltjYJg9VQKP82uqP9VMVYrvn7jc8XlYRnZhw5y89Vg9HqkFOnsRVTO
	 16/uRwF5FUXqWShLZQdFhnN+dEt6P4hF0qlWldXt3sVEmKpqCBXz320WqJ8w90v5KTUek
	 U8pcyusBnElIMUYrzBIQ0MzZ7fg+IvB3rt920k8kNPJQ4DpjZ9X/CSYwoKz25fytIggCc
	 5qEuPwlXG0PHyCs3GhTY7/LgpfrdavrY+xq4ECAm3/+SgZRgKCJHKGjdXUZy5WNBF38YX
	 J6zp6gtVbAJ5AYMdaJCVlcqRQU5m+qn+BOPtkUtzaHAo2/OlSo+ML4cgRU32PTdcXQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793242391;
	h=DMARC-Filter:DKIM-Signature:To:From:Message-Id:X-Original-From:
	 In-Reply-To:User-Agent:Subject:Date:Mime-Version:X-Lms-Return-Path:Cc:
	 References:Content-Transfer-Encoding:Content-Type;
	bh=0CbHfJZd9Ouin6+NJRHxk52K7pGc80VMx8HJ0a2GrKE=;
	b=bLG3Yu7WsdXAAfAib+x8Se24Uz8KgzaNP/4rwWopKSnTstwCehul5mWvHXasL3/cAxJX
	 wlXb62gDPXJHSV68cchof/iLw0Q8vmw4jI+7Aljs6rC91npuHMMczHS5gy7A+iLRrO8JM
	 x5G+H27m7+mCznZShk3kKHXlgACb6Hdz7geMPiTcRSsQ5ySQtTHCSXK8RCFiRAhe2pigV
	 m1i6QW2fWhsN/RcmPkKbCzNywDL2Pkro4bzOmVGSLibKoWyAK/sg508fRBgk97cZqTkHz
	 NXG1pjNeiJ5rGgKmRQoL43aKX2hGs6Z7DntAb3N05gxlhrn5Fw5ZbLE1ktNssU4oDpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=KCIZEWwE;
	arc=none smtp.remote-ip=209.127.230.113
Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA5E606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAA5E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=KCIZEWwE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793242379; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=0CbHfJZd9Ouin6+NJRHxk52K7pGc80VMx8HJ0a2GrKE=;
 b=KCIZEWwE0Rakwepat3tvgULGutY33z9z8xTks6Z4jojsdN1oalw9VE/v213oiffiEjK+Oi
 Ey/ycif6bDMwscOSk57X8/N7sTJKP8UqS9HaS2rFFEXMvkfEuIQdrb01LMJ++nSLTChxnH
 i6XyUVP9NTtJM7DV7AklU+sTXu4DZ/Xd0yrJsy4l9VwT/EGm1l8v6JapsY4Ck6wZ62HbT2
 0kxPBqmJDm4Rxgzalc1hravktWQYiwvxVjp6uONgnwfV8F22hQ+IvwN9W4oqpM0Q213D6E
 AzYFMyD8aLvYPEYoTfluP31EWFCk1V9FgRVjo41oKLHME8KS0TJMt7mWPhjHVQ==
To: "Joshua Hahn" <joshua.hahnjy@gmail.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
Message-Id: <4c94b526-cacb-4b52-9c28-7344f8ab582f@bytedance.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
In-Reply-To: <CAN+CAwPM=-sRDypP0+ZxX8_CziBRjXbxKEE3UZGLzkmOWrajNg@mail.gmail.com>
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] sched/numa: do not feed tiering promotions into task placement stats
Date: Thu, 29 Oct 2026 10:52:35 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26ae2b509+7de3eb+vger.kernel.org+lizhe.67@bytedance.com>
Cc: <akpm@linux-foundation.org>, <bsegall@google.com>, <david@kernel.org>, 
	<dietmar.eggemann@arm.com>, <gourry@gourry.net>, <juri.lelli@redhat.com>, 
	<kprateek.nayak@amd.com>, <ljs@kernel.org>, <mgorman@suse.de>, 
	<mingo@redhat.com>, <peterz@infradead.org>, <riel@redhat.com>, 
	<rostedt@goodmis.org>, <vincent.guittot@linaro.org>, 
	<vschneid@redhat.com>, <ziy@nvidia.com>, <linux-doc@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
References: <20261028041253.74839-1-lizhe.67@bytedance.com> <20261028041253.74839-3-lizhe.67@bytedance.com> <CAN+CAwPM=-sRDypP0+ZxX8_CziBRjXbxKEE3UZGLzkmOWrajNg@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On 10/28/26 11:03 PM, Joshua Hahn wrote:
> On Wed, Oct 28, 2026 at 12:14=E2=80=AFAM Li Zhe <lizhe.67@bytedance.com> =
wrote:
>> NUMA balancing has separate mode bits for normal task placement and
>> memory tiering. In memory-tiering-only mode, NUMA hinting faults on
>> slow-tier pages are used to detect hot pages and promote them to a top
>> tier. They are not normal task-placement faults.
>>
>> For slow-tier folios, memory tiering reuses the folio last-cpupid field
>> to store access-time metadata. numa_migrate_check() therefore cannot
>> return a real cpupid for those faults. Before this change, it returned t=
he
>> same all-ones last_cpupid value that normal AutoNUMA uses for a first or
>> unknown access.
>>
>> That can make a memory-tiering-only promotion look like an ordinary firs=
t
>> private AutoNUMA fault. After a successful promotion, do_numa_page()
>> reports the target top-tier node to task_numa_fault(), so the existing
>> slow-node skip no longer applies. task_numa_fault() then accounts the
>> fault in p->numa_faults and p->numa_faults_locality, and
>> task_numa_placement() can consume that sample to update normal task
>> placement state even though normal NUMA balancing is disabled. In other
>> words, hot-page promotion feedback can leak into the CPU placement
>> heuristic.
> Hi Zhe,
>
> Thanks for the revision. To me, this looks more like a fix than an
> optimization, since there really is incorrect NUMA balancing behavior
> happening that could be visible in userspace (unintended
> task-placement and related accounting). On the other hand patch 3/3
> doesn't seem like a fix to me despite the name, since this one would
> mitigate the incorrect behavior.
>
> How about we pull this one out of the series and submit it
> independently with an appropriate Fixes: tag and cc:stable, and
> discuss 1 and 3 later on? Unfortunately this is also not a great time
> to submit new features or behaviors as we are in the middle of a large
> merge window, and there are a bunch of fixes that maintainers might be
> busy looking into : -(
>
> Regardless, thank you for the fix, Zhe! I don't have a strong
> preference on the ordering of this against pghot, but if other folks
> are concerned that this could create more churn, I think it would be
> reasonable to wait for patches 1 and 3 after we discuss with Bharata.
Thanks for the review.

Agreed, patch 2 is better framed as a fix.=C2=A0 I will check the exact
commit that introduced this path and can resend it separately with a
proper Fixes tag and Cc stable after rc1 is released.

For patches 1 and 3, I agree they are more about the tiering heuristic
and policy behavior.=C2=A0 I will keep them separate from the fix discussio=
n
and continue that part together with the pghot-related discussion.

Thanks,
Zhe
>
> I hope you have a great day : -)
> Joshua
