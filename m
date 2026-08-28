Received: from mta1.migadu.com (out-118.mta1.migadu.com [95.215.58.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE9121C173
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787881114; cv=none; b=pt9bjiT4pqMnSe7cWNWPI9XdwuKU1VZFKzmTAgdvvVz6qhQh5rJfYYf4AvZxtKckVDwGDc1iZ3KvS0VNbK/gZdVZnkmMmq9HkLqMC5E+aZcZ/tp+FkeFE/ztSMWwoGzBVjEPK3o/knH2Yf34CybhmjWayZJAlOeJiYWDNJOtwhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787881114; c=relaxed/simple;
	bh=9B9bzIQfMl/vcQvlvHw+4YRKHMkOiXpCte8Fe955u2M=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fOWtMf87crTqD8jpMptFZgx1Mj08PJ4FnYn/TNexrJRvQiT19jb7izXPJA2QFAZom2fH1O7s8bSU0NSE/zt8Mom1VAgif/S8UtMM7XWRVQrrlQekk09oYuR5wosHXLP+pPTHSZMr9EQVuUCQt06+KwV3JaJhGmaXlIqpaWKL78k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Cl05IFeJ; arc=none smtp.client-ip=95.215.58.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Cl05IFeJ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9B9bzIQfMl/vcQvlvHw+4YRKHMkOiXpCte8Fe955u2M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787881110; v=1; x=1788485910;
 b=Cl05IFeJmDJfllfn92IfQfCz20g+3kjSIPYD+bZCDsfW9DZXly5vrqDHFgHFj5l9EyTQxUwh
 pmciQrPN6H5iE8QApCciABx2UAZU43rGr9DC0PirjcrwsWu6gtotR5nYqshXM94Vxgri/kwuLlH
 CDSkzo5rXqOPhh+3PLmQdUeo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7972bdfdbca739a7;
	Fri, 28 Aug 2026 01:38:30 +0000
X-Mizu-Trace-ID: 7972bdfdbca739a7
X-Migadu-Flow: FLOW_OUT
Message-ID: <ee79e463-b1fe-4b5e-9bac-bcbaae334829@linux.dev>
Date: Fri, 28 Aug 2026 09:38:23 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: hongfu.li@linux.dev, muchun.song@linux.dev, osalvador@suse.de,
 david@kernel.org, steven.sistare@oracle.com, vivek.kasireddy@intel.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Hongfu Li <lihongfu@kylinos.cn>
Subject: Re: [PATCH] mm/hugetlb: fix resv_huge_pages double decrement in memfd
 error path
To: Andrew Morton <akpm@linux-foundation.org>
References: <20260825021013.25672-1-hongfu.li@linux.dev>
 <20260826194759.88487180eebf728c1df08f14@linux-foundation.org>
From: Hongfu Li <hongfu.li@linux.dev>
In-Reply-To: <20260826194759.88487180eebf728c1df08f14@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/27/26 10:47 AM, Andrew Morton wrote:
> On Tue, 25 Aug 2026 10:10:13 +0800 Hongfu Li <hongfu.li@linux.dev> wrote:
>
>> From: Hongfu Li <lihongfu@kylinos.cn>
>>
>> alloc_hugetlb_folio_reserve() decrements h->resv_huge_pages when
>> dequeuing a folio, but unlike the use_global_reservation handling in
>> hugetlb_alloc_folio(), it does not set HPageRestoreReserve on the folio.
>>
>> Its sole caller memfd_alloc_folio() pre-allocates a reservation via
>> hugetlb_reserve_pages() before allocating. When hugetlb_add_to_page_cache()
>> fails, folio_put() drops the folio without HPageRestoreReserve set, so
>> free_huge_folio() does not restore the reservation. The subsequent
>> hugetlb_unreserve_pages() on the err_unresv path decrements the counter
>> a second time, leaving resv_huge_pages off by one for every failed
>> allocation.
>>
>> Set HPageRestoreReserve when consuming the reservation in
>> alloc_hugetlb_folio_reserve(). On the error path, free_huge_folio() then
>> restores the reservation before hugetlb_unreserve_pages() releases it.
>> The success path is unaffected, as hugetlb_add_to_page_cache() clears
>> the flag once the folio is added to the page cache.
>>
>> ...
>>
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -2178,8 +2178,10 @@ struct folio *alloc_hugetlb_folio_reserve(struct hstate *h, int preferred_nid,
>>   
>>   	folio = dequeue_hugetlb_folio_nodemask(h, gfp_mask, preferred_nid,
>>   					       nmask);
>> -	if (folio)
>> +	if (folio) {
>> +		folio_set_hugetlb_restore_reserve(folio);
>>   		h->resv_huge_pages--;
>> +	}
>>   
>>   	spin_unlock_irq(&hugetlb_lock);
>>   	return folio;
> Thanks.  I pasted an AI-generated test case which might demonstrate
> this bug.  Requires fault-injection so I won't add cc:stable.

Thanks for sharing the test case.

I have run your provided test program and successfully triggered
the double‑decrement bug of resv_hugepages with fault‑injection.
Testing confirms that my patch fixes this bug.

> Also, Sashiko might have found an accounting issue in the nearby code
> (Sashiko doesn't like hugetlb.c):
>
> 	https://sashiko.dev/#/patchset/20260825021013.25672-1-hongfu.li@linux.dev

I have taken a close look at the nearby accounting issue reported
by Sashiko in hugetlb.c. It appears to be a real issue, and I intend
to submit a separate patch for review to fix this.

> #define _GNU_SOURCE
> #include <stdio.h>
> #include <stdlib.h>
> #include <unistd.h>
> #include <fcntl.h>
> #include <sys/mman.h>
> #include <linux/memfd.h>
>
> /* Read resv_hugepages from sysfs */
> static long get_resv_hugepages(void) {
>      FILE *f = fopen("/sys/kernel/mm/hugepages/hugepages-2048kB/resv_hugepages", "r");
>      if (!f) return -1;
>      long val = -1;
>      fscanf(f, "%ld", &val);
>      fclose(f);
>      return val;
> }
>
> int main(void) {
>      long orig_resv = get_resv_hugepages();
>      printf("[1] Initial resv_hugepages: %ld\n", orig_resv);
>
>      /* Enable fail_function for hugetlb_add_to_page_cache via debugfs */
>      system("echo hugetlb_add_to_page_cache > /sys/kernel/debug/fail_function/inject");
>      system("echo 100 > /sys/kernel/debug/fail_function/probability");
>
>      /* Create memfd and attempt write to allocate hugetlb folio */
>      int fd = memfd_create("test_memfd", MFD_HUGETLB);
>      if (fd >= 0) {
>          /* Force allocation path which triggers memfd_alloc_folio() */
>          ftruncate(fd, 2 * 1024 * 1024);
>          write(fd, "a", 1);
>          close(fd);
>      }
>
>      /* Disable error injection */
>      system("echo > /sys/kernel/debug/fail_function/inject");
>
>      long post_resv = get_resv_hugepages();
>      printf("[2] Post-failure resv_hugepages: %ld\n", post_resv);
>
>      if (post_resv < orig_resv) {
>          printf("[!] BUG DEMONSTRATED: resv_hugepages double-decremented by %ld!\n",
>                 orig_resv - post_resv);
>      }
>
>      return 0;
> }

-- 
Best regards,
Hongfu

