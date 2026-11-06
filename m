Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957529;
	b=FQ1FgfplxR31/i2dyxyUYboP5qhvJbq4HqNrrt70BLenPC9A5CvIoJjChJeF0P4sEr5r
	 xRy5K9vhRZTQoWl3lLBcnW0Omylc/Q+LxsbIWNRsHCCvuJ2SX4Yi9i06RSjQY3iDBB/8N
	 8FzRa8nmvqJJUeQjrsW+a7li/Dz125z+YeSgfxOIc5k+BokDbWk+2OPCYHvXaJXSqC/81
	 hnpzqk0ogV0cja6XVRitIPpAzv5ulcmptt1p8VrWNAZFvddcR8x2yO+lhjijiKycFpYvr
	 wa6crXxwpuYLuCF7cVymbBvhS1ZdykQLPMI+X0/I1FaC3087vaF+q8xVf7qnWz+tcxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957529;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WaIe5Wr+Y328ng3DOApERKuc976xe46hLddSwck69AU=;
	b=cXNSVMQf8ioS1OwD2eTcd8OP+JB5Bu6c4v/TDuhJpa8y50bdePJ929P2JL2pTI3aWZFh
	 U7nGHmUBrUGDGH27YAxMVa10wgpv/CihnKArZMxEnV1eFXdglL+Eq5zGR5qJJUkGfaRoN
	 vA/xZLLu9iCdfTcfzVZ8LqQgUuTDmQxDcMYxzpt7i0Ly+1tLBwcEUnaDnSPsghWIYtK2Q
	 zrgGIQyT/uhbkQWPJueuN/OUmaq5H8RRu+xWeb2lquV18Ruwnw2K4QuA63wGpwdy/qSVj
	 g/lDQpeY8Q1lAEiOVfKb4dkD+TsEOoTJ8AmYQVYKy7r0HBF3jsWdfSxGNFZFvnSlSLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	arc=none smtp.remote-ip=115.124.30.101
Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56618606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56618606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793957520; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=WaIe5Wr+Y328ng3DOApERKuc976xe46hLddSwck69AU=;
	b=Xxk+Rn3Zpl3YHFyYQm9Aba3Tq3WEo3rYPE6FBPpNgxdXI1Wh4b328+R8WgkOwqmQySxWAVsjTA12mCKnLC4mYPVwJEmBVhe0fLlLADsF2nlehGiX7dPVyinZxqXp1B2/pA80zH8gX8gDKU7ZjUPAP+fWuMrjAGUcjtCnP5HtD2M=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=14;SR=0;TI=SMTPD_---0XEBFSv4_1793957518;
Received: from 30.74.144.130(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XEBFSv4_1793957518 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 17:31:59 +0800
Message-ID: <daef8492-d3e7-4a73-ac52-2b4400825b6c@linux.alibaba.com>
Date: Fri, 6 Nov 2026 17:31:58 +0800
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
Subject: Re: [PATCH v2 2/3] mm/khugepaged: scan mm's more efficiently under
 mmap_lock contention
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261105-khugepaged-latency-fix-v2-0-4384bbfe4606@kernel.org>
 <20261105-khugepaged-latency-fix-v2-2-4384bbfe4606@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20261105-khugepaged-latency-fix-v2-2-4384bbfe4606@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/6/26 4:57 AM, Lorenzo Stoakes (ARM) wrote:
> khugepaged scans VMAs in collapse_scan_mm_slot() in the same mm until it is
> about to be torn down, prctl(PR_SET_THP_DISABLE) disables THP for it,
> mm->mmap_lock contention occurs, or all its VMAs have been scanned.
> 
> When lock contention causes the function to bail out, khugepaged doesn't
> keep track of where it left off, so when the mm is next scanned, it starts
> from address 0 again.
> 
> If there's a lot of mmap_lock contention this can significantly slow down
> collapse later in the mm, since the /sys/.../pages_to_scan budget can run
> out before the end of the mm is reached.
> 
> The budget is incremented (as tracked in cc->progress) at a rate of 1 page
> per ineligible VMA, but the budget is only checked once eligible VMAs are
> encountered.
> 
> Then, it only takes the combined total of ineligible VMAs and eligible but
> non-collapsible pages to exceed the /sys/.../pages_to_scan budget for the
> rest of the mm to be skipped.
> 
> For a system with 4 KiB page size and default sysctl settings this only
> requires 4096 ineligible VMAs/uncollapsible pages to be skipped before this
> happens.
> 
> Resolve the issue by simply tracking the last examined address in the
> khugepaged_mm_slot object, so when the mm is resumed, the scan starts from
> where it left off.
> 
> Additionally, skip to the next candidate if a VMA cannot be collapsed.
> 
> This issue was noticed during some work in which an mm was instantiated
> with a large number of small VMAs under significant mmap_lock contention,
> during which collapse was observed to take 10.8s. With this patch applied
> it took 3.6s to collapse the same mm.

Nice results!

> 
> Also, while here, update a couple VM_BUG_ON()'s to VM_WARN_ON_ONCE()'s.
> 
> This patch is also a prerequisite for the next patch in the series.
> 
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---

Make sense to me.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
