Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2229B330328
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789128816; cv=none; b=SaQXrTlT+IWNifbgGvJR3Id0At4uvtCKngtUzBo3fRd9gv4FxhIOsJq8JxDv20AWXu73XLDTcTch9kvWXW3TxBXvzc+GsFulqVYq3LR7nKgokOA/rdTv8qxaGvj5+vO96py9usD3YQZibEF3M/LXICD+0dK4vavNC8x02VnRUJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789128816; c=relaxed/simple;
	bh=3ARyWm61iw1BqfDxGo8STCXa6M+CkI37zSWsMf0o0i0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K8VFqt2UMoskyxdTyAyB6YMSlLiTqxZgbUxhjAqYx5SuV4aRvhnei/LP5U5gKtrT7UVWdqlHlLe45y05q8sQspce9rA6jwNhow2NLmOhiXTnlbyqFMStzz74mchRpWZ24xiWQTXZQvuFYyj+g3Hgi1HcImM46I3FNEmeESp+pXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=PsNgFiPQ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PsNgFiPQ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACA321655;
	Fri, 11 Sep 2026 05:13:29 -0700 (PDT)
Received: from [10.164.19.84] (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 284523F7B4;
	Fri, 11 Sep 2026 05:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789128813; bh=3ARyWm61iw1BqfDxGo8STCXa6M+CkI37zSWsMf0o0i0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PsNgFiPQBGgwRXK02n6NJ7SYnaSACCEAqJMUZOaMjEQ7NxxWh0vUkhNe11nt308zK
	 t/paB3YZ670AbJesUOL+EQBECepSVJa2m9yJmVLwDWkYkEMsmGTE4/1YZxY63iMwb9
	 Ovif+YtbpyPjpWWlHmjibaD8TlupaRYNvK2IaWxk=
Message-ID: <366c39ee-d452-4a1c-af0d-2badd4d8210f@arm.com>
Date: Fri, 11 Sep 2026 17:43:28 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] mm/gup_test: safely calculate GUP batch size
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Kiryl Shutsemau <kas@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260903115033.162218-1-sarthak.sharma@arm.com>
 <cc0fdb0e-ab6a-4095-b559-10e1d8a616d9@kernel.org_quarantine>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <cc0fdb0e-ab6a-4095-b559-10e1d8a616d9@kernel.org_quarantine>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi David!

On 9/7/26 8:20 PM, David Hildenbrand (Arm) wrote:
> On 9/3/26 13:50, Sarthak Sharma wrote:
>> __gup_test_ioctl() calculates the end of a GUP batch using:
>>
>> next = addr + nr * PAGE_SIZE;
>>
>> If nr is too large, it can cause next to overflow and wrap around.
>> If it wraps, the next > end check is bypassed and a large value
>> of nr is passed to the GUP call, even though the pages array was
>> allocated according to gup->size. This can lead to out of bounds writes.
>>
>> Also, when fewer than PAGE_SIZE bytes remain, the calculated batch
>> contains zero pages. The code still calls GUP functions with pages + i,
>> which can point past the allocated array.
>>
>> Calculate nr by taking the minimum of the number of pages per call and
>> the pages remaining in the address range. Stop processing when no
>> pages remain and calculate the end of the batch using this bounded
>> value of nr.
>>
>> Fixes: 64c349f4ae78 ("mm: add infrastructure for get_user_pages_fast() benchmarking")
>> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
>> ---
>> Sashiko reported the issue fixed by this patch while reviewing the patch
>> "mm/gup_test: report actual pinned bytes". That patch has been applied to
>> mm-new. Since the two fixes are independent, this revision contains
>> only the GUP batch size fix.
>>
>> Changes in v4:
>> - Simplify batch clamping logic as suggested by Kiryl
>> - Don't call GUP functions for an empty batch
>> - Drop the pinned byte reporting patch since it has been applied to mm-new
>>
>> v3: https://lore.kernel.org/all/20260901083452.115365-1-sarthak.sharma@arm.com/
>>
>>  mm/gup_test.c | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/mm/gup_test.c b/mm/gup_test.c
>> index 185ba3bb8ed1..1b64e932c4c5 100644
>> --- a/mm/gup_test.c
>> +++ b/mm/gup_test.c
>> @@ -139,11 +139,12 @@ static int __gup_test_ioctl(unsigned int cmd,
>>  		if (nr != gup->nr_pages_per_call)
>>  			break;
>>  
>> +		nr = min_t(unsigned long, gup->nr_pages_per_call,
>> +			   (end - addr) / PAGE_SIZE);
>> +		if (!nr)
>> +			break;
> 
> Can !nr actually happen?

Yes, it is possible in 2 cases:

1. We calculate end as gup->addr + gup->size. So, if gup->size is not
page aligned, then at some point, we can have (end - addr) < PAGE_SIZE
and (end != addr). Then (end - addr) / PAGESIZE will be 0. Right now all
callers seem to provide a page aligned gup->size, but any userspace
program which can open /sys/kernel/debug/gup_test can provide a non page
aligned gup->size.

2. If the userspace supplies nr_pages_per_call = 0 (we never validate
nr_pages_per_call so it is possible).

Sorry for the delay, your email didn't reach my inbox due to some reason :)
