Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236462;
	b=ykyiKMddrIQC8OcOZLTzzXXaQTeakZy80+0oqioaXKtn+EbgJ/iRHJ4PQs0MavpX0hk4
	 jQCDJSNM5C32cE8fmDxe6+sgTeFN08qSmy3I6WdjZxVITfBniXeItKB0za0WvGkrWOdph
	 WMqP2l2Y8++eqNJJ932ZS77TrSoFyN9HBLYryx0CkZibBhg47hjyrv/lHld4zX4KXsKqD
	 9N0KKLSbdu2e6Jx5CsuQUE8NZdgzIWf9RsOThcN+Zwa5KooZkwi7umov8lYfE4FaTNJkd
	 0LZkT5olVGf7q2Vgk8gpQwzBVXV1zZy7+m0WHKNWDS4uhuwHmk41N2LV5t+a17QScjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236462;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=uh98auUTZPUD0WL8RdCfHHJjBpICoJEBbXmih9wp9i0=;
	b=qBk0mRbkN/uMZxlxIeCsgRk+y0TxKvtjOoUspReVB6gmoGTpXXW4xKtXV8qeCsGlYjZn
	 9Anb4c2nafJJQJNjz/1heJzRzMHGKblruqzBi/JJa75EQTb/KpdTNDVsz+C7Hdgbdy0Lj
	 CgcAyEnJeZ/yDHLNqfYoiRncmMUholdzWgAxtXPmwgjfi/lEv4IzE2+hH+HMpQwPFJEKz
	 Aq7PWOPE9G9WTY0XAPibS/mk4nzLN+LGb+Z6G/sWgyPNBLEGdDzVkm1MmLh0SlGBoll/v
	 uxvCk1+JTqd1v+BAlwSeZiJ4W8KtlLNt3RAcf6T+D8Aoh2sK/fV8n3+ojN5+hcGWBsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="d/M47nMI";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A9B606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d/M47nMI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E3FA1F008A1;
	Mon,  9 Nov 2026 15:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794236461;
	bh=uh98auUTZPUD0WL8RdCfHHJjBpICoJEBbXmih9wp9i0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=d/M47nMIJR7aihTAaLZTBAlDzN54La0m6muqe34XXaAoUlvwToPrvviy1SqgkXLMc
	 YPTGC8eDZspkkjxHE4mcuSsymqau53tKpMWsFYubYX1NKW3zQechkdk1CALfIaVZn0
	 tHQEU3tcG89EfTeTfjio/VUFU3JPBIjNOGvuGJoxMIS6dTAI5c71rtjg3NblXoUdyE
	 mbRVq454n0Tzo/+QEQg174qR/Lu+6SKfv3Fs72d+0wS56avAdt2JobeNrCvKfbXAp9
	 pL69rUuWvwSjF4IN8k4YE2Apd1o3FAapcf+MukXRCqaKvadvemojGqRmqopClB7Ulh
	 hWrqWiGrkS8dQ==
Message-ID: <0fb93821-3449-44f5-936b-986b485b5f9f@kernel.org>
Date: Mon, 9 Nov 2026 16:00:55 +0100
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
Subject: Re: [PATCH v2 3/3] mm/khugepaged: release contended mmap read lock
 after scanning enough VMAs
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Kiryl Shutsemau <kas@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Andrew Morton
 <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261105-khugepaged-latency-fix-v2-0-4384bbfe4606@kernel.org>
 <20261105-khugepaged-latency-fix-v2-3-4384bbfe4606@kernel.org>
 <au3CUJO9zBMHLx-B@gremlin> <8ffe5804-a8a1-4486-b5eb-7ce5f451b77c@kernel.org>
 <avHUKAT7-H5Ov5RC@gremlin>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <avHUKAT7-H5Ov5RC@gremlin>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/9/26 15:12, Lorenzo Stoakes (ARM) wrote:
> On Mon, Nov 09, 2026 at 03:01:29PM +0100, David Hildenbrand (Arm) wrote:
>> On 11/6/26 13:07, Lorenzo Stoakes (ARM) wrote:
>>> On reflection, I think this would be better implemented as something like:
>>>
>>> static void collapse_scan_mm_slot(unsigned int progress_max, ...)
>>> {
>>> 	unsigned int long lock_start = jiffies;
>>> 	...
>>>   	for_each_vma(vmi, vma) {
>>> 		...
>>>                 if (time_after(jiffies, lock_start) && mmap_lock_is_contended(mm)) {
>>>                         mmap_read_unlock(mm);
>>>                         cond_resched();
>>>                         mmap_read_lock(mm);
>>>                         lock_start = jiffies;
>>>                         vma_iter_set(&vmi, mm_slot->address);
>>>                         continue;
>>>                 }
>>> 	}
>>> }
>>>
>>> Which avoids magic numbers, and means if we hold the lock for 1-10ms (depending
>>> on HZ), which is a long time in the kernel to hold a lock, AND the lock is
>>> contended, we drop/reacquire.
>>
>> That approach indeed sounds better to me regarding lock contention.
> 
> Unfortunately it makes things measurably worse (it's not fine-grained
> enough). Trying to get a fine-grained timer will involve preemption
> disable/enable pairs, so a no go.

Ah. :(

> 
> This is the alternative I have locally which explains the number, puts VMA in
> the name and it applies to _all_ VMAs as requested.
> 
> Let me know what you think!
> 
> The jiffies version would obviously just be this but with the above, but that
> one results in max ~2 ms-level stalls rather than ~200us.
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 7d1414a9b2a5..59bbef61f104 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -66,6 +66,13 @@ static DEFINE_READ_MOSTLY_HASHTABLE(mm_slots_hash, MM_SLOTS_HASH_BITS);
> 
>  static struct kmem_cache *mm_slot_cache __ro_after_init;
> 
> +/*
> + * The number of VMAs to walk before checking for, and relieving, mmap lock
> + * contention. This bounds the maximum mmap read lock to an estimated ~100 -
> + * 300us depending on hardware.
> + */
> +#define KHUGEPAGED_MAX_VMA_SCAN_BATCH 1024
> +
>  /**
>   * struct khugepaged_mm_slot - khugepaged information per mm that is being scanned
>   * @slot: hash lookup from mm to mm_slot
> @@ -2910,6 +2917,7 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
>  	struct mm_struct *mm;
>  	struct vm_area_struct *vma;
>  	unsigned int progress_prev = cc->progress;
> +	unsigned int nr_vmas_batch = 0;
> 
>  	lockdep_assert_held(&khugepaged_mm_lock);
>  	*result = SCAN_FAIL;
> @@ -2942,6 +2950,18 @@ static void collapse_scan_mm_slot(unsigned int progress_max,
>  	for_each_vma(vmi, vma) {
>  		unsigned long hstart, hend;
> 
> +		/* Relieve mmap lock contention after walking a batch of VMAs. */
> +		if (nr_vmas_batch++ >= KHUGEPAGED_MAX_VMA_SCAN_BATCH) {
> +			nr_vmas_batch = 0;
> +			if (mmap_lock_is_contended(mm)) {
> +				mmap_read_unlock(mm);
> +				cond_resched();
> +				mmap_read_lock(mm);
> +				vma_iter_set(&vmi, mm_slot->address);
> +				continue;
> +			}
> +		}
> +
>  		cond_resched();
>  		if (unlikely(collapse_test_exit_or_disable(mm))) {
>  			cc->progress++;

Looks better to me than the original.

@Kiryl, we talked about dropping the mmap lock recently, would this create a
regression for your scanning use-cases?

-- 
Cheers,

David
