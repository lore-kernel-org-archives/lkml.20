Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2762D3AAF44
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762445; cv=none; b=jFvfjvGk6fxMgEk3IeNKr4JZFtowwy2VbiwJkw3rw0pCs3KSXOfC2DQNVxDt+4tKMwuDu1YfTVBvwY3f3f4RcxuOok1mayUvP4BJXdWJa2dH4BiZZ6augEwVBJfSjcpoy4EO0zHJYdYg3tXty6vrvi5KJkmb8lJwbMtgNh4kMjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762445; c=relaxed/simple;
	bh=nkgyAUJ7pHClAvsZ5qJwmiwRizcq1QZyOlHnQIOYXNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ezzwfrTrFw/FVttrUjxEwPjRPYig1kyVG19X4SPJNnJyrRu8DJwOFNbjrx3+oRaKQvP1DSasoyWISjFHtvJTdPJYVNwsqlClzXsRxpRGk6ek9eNER2hf9lJ14kQCHFujRf3oN5mx069WJapo8tYzDr3EK2Xeyi1uHsvWJzhYCGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Wi5xplCg; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Wi5xplCg"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788762431; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=hENVjyqztRMLk2vL/FfYPkshdB/mPunTh4py6EM4dwA=;
	b=Wi5xplCgmJdBzTENybB84fUBRCmNmGS72v5W5rkcKeNer4EOE9QqbRinW01u2R1jJ0d0c9JYySkmBtBCZYkTzeZceV1ZRDGnFfuA5obZYegRYwyP4R4C2H3XXRBoqVwzSeZWjbSLmplR3a5Pgp7m16OI+YeQZG7dWLnEk700Em0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=16;SR=0;TI=SMTPD_---0XAQ7YRv_1788762429;
Received: from 30.74.144.134(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAQ7YRv_1788762429 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Sep 2026 14:27:10 +0800
Message-ID: <ecef66b1-f0a9-4a7f-bf52-227dcd69d88f@linux.alibaba.com>
Date: Mon, 7 Sep 2026 14:27:09 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: mglru: clear the reference counter for rejected
 folios
To: Kairui Song <ryncsn@gmail.com>
Cc: akpm@linux-foundation.org, qi.zheng@linux.dev, shakeel.butt@linux.dev,
 baohua@kernel.org, axelrasmussen@google.com, yuanchu@google.com,
 weixugc@google.com, hannes@cmpxchg.org, david@kernel.org, mhocko@kernel.org,
 ljs@kernel.org, ridong.chen@linux.dev, hebaoquan@kylinos.cn,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <8e4db9a298c5ea6ccb192e274caed5b96f0cf022.1788751143.git.baolin.wang@linux.alibaba.com>
 <CAMgjq7Cf2ZjkW0JxtHnm06NECHA0+wCXAxd4tkbtCLhC+qA0ZA@mail.gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <CAMgjq7Cf2ZjkW0JxtHnm06NECHA0+wCXAxd4tkbtCLhC+qA0ZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/7/26 12:57 PM, Kairui Song wrote:
> On Mon, Sep 7, 2026 at 11:29 AM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
>>
>> As per the comment on LRU_REFS_FLAGS, when accessed folios are promoted to
>> a new generation, LRU_REFS_FLAGS should be cleared so that the reference
>> counter can start over.
>>
>> For folios rejected by shrink_folio_list(), we clear LRU_REFS_FLAGS and
>> set the PG_active flag if the rejected folio is planned to be put back to
>> the oldest generation. That's fine.
>>
>> But for those that are not put back to the oldest generation (which can
>> be treated as a promotion), we do not clear LRU_REFS_FLAGS, which can
>> violate the promotion mechanism. This means the rejected folio enters the
>> new generation with stale, inflated tier bits, which can inflate reference
>> counts and distort eviction statistics for these rejected folios.
>>
>> Fix this by clearing LRU_REFS_FLAGS for rejected folios, and also do some
>> measurement. On my 32-core Arm machine, with the memcg limit set to 3G,
>> running 'make -j32' to build the kernel showed a small improvement in sys
>> time when using either a zram or NVMe swap device (averaged over 2 runs with
>> no significant variance).
>>
>> zram swap:
>>                  w/o patch       w/ patch
>> sys time:       1666.5s         1589.5s
>>
>> NVMe swap:
>>                  w/o patch       w/patch
>> sys time:       760s            741.5s
> 
> Hi Baolin,
> 
> Thanks for the patch, it makes sense and I like the idea!

Thanks for taking a look.

> However, I find it interesting that your test setup shows such a
> significant benefit with several recent changes when I can't observe a
> performance gain on any of my setups. I'm a bit worried this (not only
> this patch) might be overfitting into to the kernel build test on
> specific setups.
> 
> I did try this optimization before and found no gain, maybe it is
> somehow tangled with some other recent upstream changes?

Probably.

> 
> For example a few recently landed MGLRU optimizations sped up the ZRAM
> kernel build test on your setup, but slowed down many other cases.

I'm not sure if there are other hardware environment differences. I 
agree that for complex changes or optimizations, we need to cover more 
test cases than just the kernel build workload, such as the test 
coverage in your MGLRU-FG work.

However, for the current patch, I think it's more about correcting the 
correctness of the promotion mechanism, and the goal is not merely 
performance optimization. If we stack more changes on top of the current 
broken mechanism, I'm afraid future optimizations will become more 
fragile. So let's first reach agreement on the underlying promotion 
mechanism.

Also, as I replied to Barry, the promotion in lru_gen_set_refs() needs 
to be reconsidered as well. It similarly requires clearing reference 
counters before promotion.

So for this simple mechanism correction, I only evaluated the kernel 
build (which is still somewhat representative as a comprehensive 
workload) and it did not introduce a regression (which is fortunate). I 
wouldn't want any workload to rely on this incorrect logic for 
performance gains.

> I still think this is mergable, but before that, do you have the
> LRU_REFS_WIDTH data from your kernel build? Or lru_gen_full output? In
> some cases it shrinks to only 1 or 0 bits, leading to very different
> performance readings.

The LRU_REFS_WIDTH is always 2 on my setup.
