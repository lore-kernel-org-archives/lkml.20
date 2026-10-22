Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661947;
	b=oxd3LbkG7ktqnQeHll9TxIm3IFbrmtzK96ujf1gMLZm0C2+usGTZa8NkNLru01A84N+j
	 5TRZYr6MMAogVFu9H0Zi+tlCYs7aHJtpwULGi41jZsT8eajd++ZsORy7PqvjJyuTNmrqo
	 DQDnPI3+UCsqjwaSlkxAdsFXRqayH+36wjX4uQfmI9IQQID29VO/eodJ5iaElBevkELtI
	 5BLnEmfLAjbDpcVSWWoOfFWRPjQDluGoc1t+Y4cQtWmBff4Yb9tTeZpSmbnvSaDmGkqz5
	 jO6Cn0GmkYP76zynj5pZrTfBtoKUIh3L5orpfneqKAsfKUl86M4fnnHV6kH6ACJ1FMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661947;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0GmCpy+eJfLwayZinpylaJMbGEt0lWCkqtD1BhfUORw=;
	b=rgXElSOQxAOZClXYXza7UYh7b60hxMcqe8aXt32nIttvW9qRvWpATeFYeo6IGIUUn9H7
	 /ifMu1kddp7hwPftkuO9sUZsZKwbUypJXwo97aln/R+LgNuDuHtllxNK71WHVXoBJL+eP
	 2Z2g5m4gdQmieEiHO5711IpK3dP0vd+eiKBFUmoKg6JFHgglwtd7lOmP+lfqA9HRGwUE6
	 MVIWs27l/yBFUTlJzDd8EVRHM4UjVR9LD6uPs82hj3cvKipnTM1dh1Wtc1qS768ZYqRW3
	 IiGauwCwZU5lqAVJ9e/k46Wn0xa6GU83mg9Ya2b2+YdQyogOAxITbY/zNvhoqkgnBig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mcnFsnNb;
	arc=none smtp.remote-ip=95.215.58.223
Received: from mta1.migadu.com (out-223.mta1.migadu.com [95.215.58.223])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B840D606A328
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B840D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mcnFsnNb
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1lWGkdTuq/siu1UcRxH5A8Ju9QQIXhG5ZWtb704zGCo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792661943; v=1; x=1793266743;
 b=mcnFsnNb7uPMMD0lO5jNilDyFka04DB29P67/eX1grXXQa2SSeRKxQfguX1aZAL0wPR1z3hQ
 fXGsZWNyJ/Wc3jDeDRVaXndGFiYx6NXaZbw9kjocXYDW7YU+BiD3Lu9Sa2DHhOM2vJN63uC77v8
 t/nuTHXzHdLZS3EKbubQWr3U=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ec019d45daa1a9be;
	Thu, 22 Oct 2026 09:39:03 +0000
X-Mizu-Trace-ID: ec019d45daa1a9be
X-Migadu-Flow: FLOW_OUT
Message-ID: <cd1cfdff-5e57-4eca-b190-5b17f53e4c30@linux.dev>
Date: Thu, 22 Oct 2026 17:38:50 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] mm: hugetlb: enable CMA allocation for PMD-sized
 pages
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, muchun.song@linux.dev,
 david@kernel.org, osalvador@suse.de, akpm@linux-foundation.org,
 Qi Zheng <zhengqi.arch@bytedance.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, lance.yang@linux.dev
References: <cover.1792651104.git.zhengqi.arch@bytedance.com>
 <5edd1dc82bd3b0b09005c0b36cafa2f7baea6d3d.1792651104.git.zhengqi.arch@bytedance.com>
 <f5db959b-3744-4f7d-9837-e8a4aed70ab9@gmail.com>
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <f5db959b-3744-4f7d-9837-e8a4aed70ab9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/22/26 5:05 PM, Jose A. Perez de Azpillaga wrote:
> On 10/22/26 9:31 AM, Qi Zheng wrote:
>> From: Qi Zheng <zhengqi.arch@bytedance.com>
>>
>> Allow hugetlb_cma=<capacity>@<page-size> to select the architecture's PMD
>> size in addition to its existing CMA size. PMD pages are 2M on x86-64 and
>> 2M, 32M or 512M on arm64 with 4K, 16K or 64K base pages.
>>
>> Give PMD pages their own pool while preserving the existing sharing among
>> gigantic sizes. Unsuffixed arguments and an explicit default size continue
>> to configure the default pool. Gigantic PMD sizes retain access to that
>> pool when no PMD pool is reserved. Apply this mapping consistently to
>> allocation, CMA-only policy and boot-time accounting.
>>
>> Try buddy allocation first for non-gigantic PMD pages, with CMA as a
>> fallback, to reduce CMA migration and leave CMA capacity for later
>> allocations. Preserve CMA-only policy and CMA-first allocation for
>> gigantic pages.
> 
> on v1 you told Lance [1]:
> 
>> The same missing PF_MEMALLOC_PIN check also affects 1 GiB CMA
>> allocations, so I had planned to fix it separately.
> 
> why did v2 go out before the fix then? 1G CMA pins fail with -ENOMEM
> today, so it's this patch that makes it hang.

This is a pre-existing issue, so I didn't intend for this patchset to
depend on that fix.

However, with PMD size enabled, the problem could indeed become more
severe. I'll send out a fix patch as soon as possible.

Thanks,
Qi

> 
> [1]
> https://lore.kernel.org/all/04c89538-28c8-4d03-92c1-08d854a46ac4@linux.dev/
> 

