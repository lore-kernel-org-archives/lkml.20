Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F078129D288
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723911; cv=none; b=PRka+Tff/8LoUlVGJXC0Or46d6sUOvPJrSWnwlxi1m9U2pBSKcAJSJcYnaC/98BK8BnbrFIIqL8kLNeeT/Y3pUKAnP+k3kAGGePZHnPyX7JNQjjOrqJZBVT7nxV0Kd/Gq4scpp5TZD0NQaFGphjuIJVR6eyM9AXarNSVrSHC6Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723911; c=relaxed/simple;
	bh=7KkFC+pvw0s1k9KDVYnc7bLxAb9S4MPwQrKPXJcPkz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ONIBHRhhLa02WqK74xQ6Btbm2Q0C0wOyoAbBGKPPnfWV71dFI160htefXZVRy/1Lkh+Kcp0LLTXndskcJ3E0GEItHCJNWvXNA02uwTOm2Z/DqdbEB0jjbtHnQvU8D6BG4V6OTJGl49rBISiKcp5VnJw8c4JLR75wC5RpBp59858=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=nvyNkoPW; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="nvyNkoPW"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789723900; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=nebxqloBPR+qahIcZagugq7FoabEe/MUo9EvuHQcjxY=;
	b=nvyNkoPW3xzHLVN4j6MDpgjAld6qeMkFLnmHnR2stm+woaM/hr9LN765I6WOeGcS86iFyUtd8ksvHtwIrbwCeTxYoKut/AFouy3QvTFcWfcVfvBmKj7WTSqqxeXxTXSGteXbDE3wRThQaYfWvI2G4QzyB/POwxfzKUHUCFwWuvs=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0XBAoOVz_1789723897;
Received: from 30.74.144.124(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XBAoOVz_1789723897 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 17:31:39 +0800
Message-ID: <31658d2e-6e97-4771-aca3-ddc60484f326@linux.alibaba.com>
Date: Fri, 18 Sep 2026 17:31:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/12] mm/collapse: open-code collapse_single_pmd() in
 its two callers
To: Kiryl Shutsemau <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Jann Horn <jannh@google.com>
References: <20260916093145.4022188-1-kirill@shutemov.name>
 <20260916093145.4022188-10-kirill@shutemov.name>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260916093145.4022188-10-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/16/26 5:31 PM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> collapse_scan_pmd() and collapse_run_pmd() each have a clear locking
> contract.  The scan is called with mmap_lock held for reading and returns
> with it still held.  The collapse is called without it.
> 
> collapse_single_pmd() kept that boundary inside itself.  It dropped the
> lock on some paths and not others, and reported which by way of a bool its
> callers had to carry along and then act on.
> 
> Open-code it in the two callers.  Each scans under the lock it already
> holds and, when the scan found work, gives the lock up before running the
> collapse.
> khugepaged's lock_dropped and madvise_collapse()'s mmap_unlocked both go:
> the code dropping the lock is now the code that wanted to know.
> 
> khugepaged's walk carries on to the next table while the scan keeps
> refusing, and ends once a collapse has taken the lock from under it.
> madvise_collapse() re-finds its VMA after a collapse, which it did before,
> and now uses a NULL vma to say that it has to.  It still reports the drop
> to its own caller, from the line that does it.
> 
> The lock is given up and taken again at the same points as before.  No
> functional change.
> 
> Assisted-by: LLM
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---

Thanks for removing the ugly 'lock_dropped', and I also did some testing 
with my shmem mTHP collapse, and no issues found. So,

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
