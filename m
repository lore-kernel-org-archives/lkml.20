Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF612E06D2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788765070; cv=none; b=f9b1Kgqmr990HB/GqYFN31UPBknTAIrlMqu8jAxuxn3C2oCi8S1f76pdWVPZwgGXWG0sDcShB9F42bMqm5yDBtYrQhTFecmG6K3y+jIszTKDQ7Wz7N4OzMyyOiIzz8VBAsb1b+/QYUtgkiBLgfX06eV3FnbtRN8x5Hk4OhD9aIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788765070; c=relaxed/simple;
	bh=cPH2X/EKDGvwSaOx3L3DzosLcgItYPjx2exYJdR17VM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=llIz059jf4jwZRLn5RfZgxZ41nM51LVeiqvMFrUQ4KyEsDVLXgJybMnz2rFf0cMyaxiaW7T15fmMbnqsOQWXVaJ1Z5dfCHkpt5yU28L/zJzDLH6S0d5kf1qeiOQ0rLvvRRmrKMpYJkdw+TeqGEhmwVOQl0X4gU0nJwYecGEr5wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=myjIoRI1; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="myjIoRI1"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788765057; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=8NYiIdoA0clTQtdI5G5CycyM+YaApfB4aFiNuht58Cs=;
	b=myjIoRI1mh/KNXuOlUnOF1hTMQA4Ey1eosSFYCrX/fnXjR+la1ZKOwkItyUXyf81VP34m+j3yTlVcOIi4ciIXCqZ/Qn1VXN8fYtfJgbY0p+TJFMrGdRwW+rXdkMsYnX9WEupr9yC1GAQciMyV83UaKgr1wS741hR7948/NtdIBI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R421e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0XAQvWM0_1788765054;
Received: from 30.74.144.134(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAQvWM0_1788765054 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Sep 2026 15:10:55 +0800
Message-ID: <78b338da-d700-4457-aab4-8b051343c981@linux.alibaba.com>
Date: Mon, 7 Sep 2026 15:10:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm: thp: restore SHRINKER_NONSLAB on the deferred
 split shrinker
To: Qinyun Tan <qinyuntan@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, "Liam R . Howlett" <liam@infradead.org>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>,
 Nhat Pham <nphamcs@gmail.com>, Chengming Zhou <chengming.zhou@linux.dev>,
 Kairui Song <kasong@tencent.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 Xunlei Pang <xlpang@linux.alibaba.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20260904033503.4067283-1-qinyuntan@linux.alibaba.com>
 <20260904033503.4067283-2-qinyuntan@linux.alibaba.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260904033503.4067283-2-qinyuntan@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/4/26 11:35 AM, Qinyun Tan wrote:
> On a system booted with cgroup.memory=nokmem, the deferred split
> shrinker is quietly demoted to a non-memcg-aware one.  As a result,
> partially unmapped THPs are only split under global reclaim; memcg
> (limit-induced) reclaim never splits them, so a cgroup under memory
> pressure keeps its underused THPs intact.
> 
> This is a regression from commit fafaeceb89a5 ("mm: switch deferred
> split shrinker to list_lru"), which re-registered the shrinker without
> SHRINKER_NONSLAB.  The shrinker had carried this flag since commit
> 0a432dcbeb32 ("mm: shrinker: make shrinker not depend on memcg kmem")
> precisely so it would keep working with kmem accounting disabled.
> Without the flag, shrinker_memcg_alloc() fails with -ENOSYS under
> nokmem and the shrinker loses its memcg awareness.
> 
> This was noticed by Michal during review of the patch "mm/list_lru:
> don't copy stale shrinker id from non-memcg-aware shrinkers" [1].
> 
> Restore the flag.
> 
> [1] https://lore.kernel.org/lkml/697713c4-0857-485b-aba7-c74f37a3c8b4@linux.alibaba.com/
> 
> Fixes: fafaeceb89a5 ("mm: switch deferred split shrinker to list_lru")
> Suggested-by: Michal Koutný <mkoutny@suse.com>
> Signed-off-by: Qinyun Tan <qinyuntan@linux.alibaba.com>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
