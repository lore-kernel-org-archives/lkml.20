Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF6C10F1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788847600; cv=none; b=T+u8uY9VUi208dkVe3cHc0V+d7ceFDn75LxWnPU6gN1Wg2ZO/2LXnTU8AGIFY4LPdOydYrY02DqY+bCu9zSfVDyB0lzHJCcx6U/b5L05DkpqXUeb1YzhIypNE5EBX/nxer6TliozqCEyMQT39MhhhOfCRUhZ1sfKKu49uqGLU08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788847600; c=relaxed/simple;
	bh=XpL8HqdoOUxXEc2wAkk0UlM0Z9JAkdPJuRyKTFzEFzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VtXpCJiOAS02/nsgE/r1h+lBOaz348bzL5yoBvHlDS39dWcrTIFtE+3HNwUok2PjLV+E3YeAL+QGWR4KlEyo87i1+vTqUZFqi7LaMxq7+lRYB5upw4s3OvhrCHD201C35iWtjKIhGH0mRl6JyYsdRU6UBDl1w3Q9KFUlkBeSFSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=BdcnA0oW; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="BdcnA0oW"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788847590; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=kezm3pPzdV4fcSPT4bPXK4sC51VDlMynJvYJEKLruRo=;
	b=BdcnA0oWd6qOV7/QQc912uv/Tm9gj7ocw1aO01KcjtjZ/2qRSQ25v5Q9cE2Mz9a+vx8Wx4aPawzY7w1I7rQcSwP2Th2BHXt4jZ9LBbYfZbu2V0S9wQ/Q979epFeMtLaDmdnXrWYSVtkVmOIz1/XpEHDI3tJ8stKVe7IWgQIyDmk=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R711e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0XAaTebm_1788847586;
Received: from 30.74.144.127(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAaTebm_1788847586 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 08 Sep 2026 14:06:28 +0800
Message-ID: <4f39b888-5dc8-4cf9-b1c6-b02292abd710@linux.alibaba.com>
Date: Tue, 8 Sep 2026 14:06:26 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/huge_memory: add folio_reset_partially_mapped()
To: Kiryl Shutsemau <kirill@shutemov.name>, akpm@linux-foundation.org,
 david@kernel.org, ziy@nvidia.com, hannes@cmpxchg.org
Cc: ljs@kernel.org, usama.arif@linux.dev, lance.yang@linux.dev,
 liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com,
 dev.jain@arm.com, baohua@kernel.org, kasong@tencent.com, hughd@google.com,
 balbirs@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 kernel-team@meta.com, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
References: <20260907183340.1446132-1-kirill@shutemov.name>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260907183340.1446132-1-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/8/26 2:33 AM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> __folio_unqueue_deferred_split() and __folio_freeze_and_split_unmapped()
> both clear PG_partially_mapped and take the folio out of
> MTHP_STAT_NR_ANON_PARTIALLY_MAPPED with the same five lines.
> 
> Move the block into folio_reset_partially_mapped() and call it from both
> places.
> 
> The helper asserts what both callers rely on: the folio is frozen, so
> deferred_split_folio() cannot set the flag again under it, and the folio
> is already off the deferred split queue. The list check sits behind the
> flag test because order-1 folios have no _deferred_list.
> 
> folio_order() is safe to use at this point in the split process: it
> still shows the pre-split order.
> 
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Assisted-by: Claude-Code:claude-fable-5-1
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
