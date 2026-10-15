Received: from mta1.migadu.com (out-10.mta1.migadu.com [95.215.58.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D221FE451
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792045451; cv=none; b=QnuGd4Ia0Fa/1MeMv5bk5YWt9jEzzLCLFQg8TJwMazXI5HXc19QVWdNgAGI2r7lbUEVNi+dRsD0oWMV+SfWlq99FRJTaUH/yOzxUKpjfv8AXWpMszKsZpetKNMHZAv1pS5+MkX2NPYcvh/BsCT9JTCG+nBrvlV4dqAbgtFrLDiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792045451; c=relaxed/simple;
	bh=xzxTDP1kJen/uCrhE9uPE6+rH/MP3btycDaiyOCiueA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ftgyN3U1u8JR46r1DJm1Fys8YsbF/mexVU4YJvgpioEgW217R5s85sYWhtnPlCe5DAGodAW+LcUiNnO6g6hz9LiV53tFFc+Ufnf6e8ekTcFi0uqlVDZs7+qponESFnKrUHSKNJUFxc7U3bURtwdun2F1cpjvaUTow8pAoD3OwOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RnzgwFeU; arc=none smtp.client-ip=95.215.58.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RnzgwFeU"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xzxTDP1kJen/uCrhE9uPE6+rH/MP3btycDaiyOCiueA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792045446; v=1; x=1792650246;
 b=RnzgwFeU88f6BI4zgBBNdIygjAMJ3BZjmdDlRyFOlyHV+KyIxpf3GKSgFibzH+rU3O52dIke
 mMUSfah2Ekqy7w4PY4YWQn3pWpcsKIR2ss2DS+VPZIX5z+TbGwn/COKfvRR+kTQ4wRHdBgZGIZY
 E/LCa8Drk0DofYzdd62E+RG0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 539d3ab3f892d32c;
	Thu, 15 Oct 2026 06:24:06 +0000
X-Mizu-Trace-ID: 539d3ab3f892d32c
X-Migadu-Flow: FLOW_OUT
Message-ID: <fd35d9dd-8fc9-4cec-97d8-86917bb3c216@linux.dev>
Date: Thu, 15 Oct 2026 14:24:01 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (macOS/Intel)
Subject: Re: [PATCH v6 0/2] mm/vmscan: fix NR_ISOLATED accounting and throttle
 MGLRU eviction
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
References: <cover.1791968227.git.zhuhui@kylinos.cn>
 <20261014160910.eeaa24697b614d1b94806d0d@linux-foundation.org>
Content-Language: en-US
From: Hui Zhu <hui.zhu@linux.dev>
In-Reply-To: <20261014160910.eeaa24697b614d1b94806d0d@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2026/10/15 07:09, Andrew Morton:
> On Wed, 14 Oct 2026 17:00:22 +0800 Hui Zhu <hui.zhu@linux.dev> wrote:
>
>> The legacy reclaim path has two mechanisms around isolated folios that
>> MGLRU lacks:
>>
>> 1. NR_ISOLATED_ANON/FILE counters are updated when folios are isolated
>>     from the inactive lists. Compaction's too_many_isolated() relies on
>>     them to decide when to back off. The MGLRU reclaim path never
>>     updates them, so compaction cannot see MGLRU's in-flight isolation.
>>
>> 2. shrink_inactive_list() throttles direct reclaim via
>>     too_many_isolated() when isolated folios pile up. MGLRU's
>>     evict_folios() isolates folios without any such check, so many
>>     concurrent reclaimers can over-isolate the same (oldest) generation,
>>     leading to unnecessary swapping, thrashing and premature memcg OOM.
>>
>> Patch 1 fixes the counter accounting in the MGLRU isolation path.
>> Patch 2 adds a per-lruvec throttle, mirroring the legacy behavior but
>> adapted to MGLRU's per-lruvec contention and its dynamic type
>> selection/fallback.
> Thanks.  Questions for yourself and maintainers:
>
> [1/2] is nice and simple and reviewed.  How about I queue this for
> second week of the upcoming merge window?
>
> [2/2] is much more code, isn't reviewed and has a Sashiko whine[*].  So
> I'm thinking this is 7.4-rcX material.
>
>
> [*] https://sashiko.dev/#/patchset/cover.1791968227.git.zhuhui@kylinos.cn
>
Hi Andrew,

Sounds good to me. Thanks.

Best,
Hui


