Received: from mta1.migadu.com (out-154.mta1.migadu.com [95.215.58.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4751A680C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 01:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788831335; cv=none; b=hIh/DujsGVsSUtd/pI8g+dmMSYsIKljrGzMvb4QpOY+2aqEVsNiyB44+xIVmU5pqjCQ+Fof8wcsssmagaz9NEL+7ebgMKecY+fSs55P8Sv4klLrPvEaI4NHDTjwkdnkRQirxzRVCl06s6StqUKlSQWJKIof7x4z862TCtp833BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788831335; c=relaxed/simple;
	bh=F9SH5ipnYTI51BGXzM095gDhy9qr7a/X3C1NF92IdqQ=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PSFoqXpmoH8TxxY+2vpKDjGPMh8fs8gFwLVoHtQ5ygckZ2k1oiuhhRfawWDPB78t8NWT5JbAGfXys9eC9WPvTS9EHH7xTWQIi9wS5UF3LTfowtov23SpneEMqEKCDl5/U3h8pVj13ZkrIBnkpdNKPnDydQU8vf3vi2AxlTvUd+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sJ51xsMs; arc=none smtp.client-ip=95.215.58.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sJ51xsMs"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=F9SH5ipnYTI51BGXzM095gDhy9qr7a/X3C1NF92IdqQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788831331; v=1; x=1789436131;
 b=sJ51xsMsilL44Yx+gnUS5ODMupVpSAZS5eQqFb16wOQxklSJZAFJ5ySw5AwsfxNIt4TVWrr4
 tx93rk+KJNsCKQJnuoQlI1QoduOIjlW5UlGWJo7ykq5z4nrMLDLjPamJmHFUDiMdW6Q8ycD2KmQ
 XAxTnSAaHzXkRVC9CnVYDTTw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 20dc9c580b2702db;
	Tue, 08 Sep 2026 01:35:30 +0000
X-Mizu-Trace-ID: 20dc9c580b2702db
X-Migadu-Flow: FLOW_OUT
Message-ID: <638ae9ae-2cbc-47a4-85fd-52b67b74e351@linux.dev>
Date: Tue, 8 Sep 2026 09:35:23 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: hongfu.li@linux.dev, hughd@google.com, baolin.wang@linux.alibaba.com,
 vivek.kasireddy@intel.com, muchun.song@linux.dev, osalvador@suse.de,
 david@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Hongfu Li <lihongfu@kylinos.cn>
Subject: Re: [PATCH v2] mm/memfd: fix hugetlb reservation accounting in error
 paths
To: Andrew Morton <akpm@linux-foundation.org>
References: <20260903030134.7407-1-hongfu.li@linux.dev>
 <20260903132158.a2d6f965477220838d884bae@linux-foundation.org>
From: Hongfu Li <hongfu.li@linux.dev>
In-Reply-To: <20260903132158.a2d6f965477220838d884bae@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/4/26 4:21 AM, Andrew Morton wrote:
> On Thu,  3 Sep 2026 11:01:34 +0800 Hongfu Li <hongfu.li@linux.dev> wrote:
>
>> From: Hongfu Li <lihongfu@kylinos.cn>
>>
>> If hugetlb_add_to_page_cache() in memfd_alloc_folio() fails with
>> -EEXIST, a concurrent fault has already instantiated the folio in the
>> page cache, and the reservation now belongs to that folio. Calling
>> hugetlb_unreserve_pages() in that case incorrectly removes the region
>> backing the cached folio. A later truncate or inode eviction then passes
>> a negative (chg - freed) into hugepage_subpool_put_pages(), corrupting
>> subpool and resv_huge_pages accounting.
> Ho hum.
>
> I've asked so many times "what are the userspace-visible runtime
> effects of this bug".  Nowadays I often just ask Gemini instead.  It
> told me:
>
>
>    Over time, these corrupted counters would leak huge page reservations.
>    Applications using hugetlb memfds would eventually find themselves
>    unable to allocate huge pages, receiving unexpected ENOMEM errors even
>    though system memory and pool capacities appeared free and healthy.
>
> and
>
>    The corrupted accounting caused hugepage_subpool_put_pages() to
>    receive a negative value during a later file truncation or inode
>    eviction.
>
>    While this typically manifests as kernel logs (WARN traces or
>    badness flags regarding subpool page counts), it could cause
>    misbehaved resource tracking that impacts subsequent system
>    operations, unmounts, or process teardowns interacting with that
>    hugetlb file descriptor.
>
> All of which sounds rather unpleasant, so I suggest a cc:stable here.
>
>
> To help people understand why we propose a backport and to help others
> understand the impact the fix will have upon their system, I'll paste
> the above into the changelog.  Please send any necessary corrections.
>
>
> Please also update your prompts (if using them) to ensure that the
> changelogging includes this info in the future.
>
>
> I'll queue it for testing and shall await maintainer review.


Thanks for the detailed explanation.

I've updated the changelog to include the userspace-visible effects
and long-term impact as suggested.

Would you prefer that I send a v2 now, or should I wait for maintainer
feedback first?

-- 
Best regards,
Hongfu

