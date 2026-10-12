Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4286377567
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812658; cv=none; b=VUFz04SAlr8ZuijjE1tTWpB77QJD7yEXECeKS6ZLi27HhBvPlJF6FQM5NUblkfaluWVhO3eHiKxPT3IFv8bA0BBXh/8XV1KTFn8yMiGshZQZnwyqflM2gpk5pM8FjSOUn4eXDM+ZMjMR4aS0GfCx8MCLV647GqjoN5ag9QAM94g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812658; c=relaxed/simple;
	bh=5XC6rLcfXBPcBbyJb/s9Cx6g4vkpd3Wyc93Q8iDoxaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ObfIHtWVQczd2kqtRhKrgjCSnXmUAjPt75qo7ntvBgzU/NdZuCUvd5pcD/p39D0tekX2J1XrfYAU2GZXBEUG9Nd3c3gbhXyK3PX582lN44z4QZQJyX3IZj17v5XyJxrcn+mxb1LgKzGAngGaEw4d7tPQIXPGfkR76lgNVwIHny8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Olie2k2G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Olie2k2G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC36D1F0089C;
	Mon, 12 Oct 2026 13:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791812657;
	bh=RWcIgR2jJSUozXLjW4tSxmUd7vzBoCwnjWliIRpBQ80=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Olie2k2Gvdlw+J2xxwUv8X69NMN3Jvn9HJ1WqeT4mgG1UEET7ZjgT5otXTC+vpZ/W
	 QssKGG4HsVQPlzGgHT3tYYdkJj42lgnWFN0AmsDmcz36z91O6Y5GQcWJBKMFD2evCe
	 iaxe7IURrf3XJ1zkVmy8/7CFU9Oy82OhBERlVIfmNNXIbPDjcmmlE20trWjAjmsXDr
	 WvoXzN2szL+q3S6ozbrBXkSS4J7pgVAtZSxcIsOFpme0U+bbwlccs82RkIwfeQBaYI
	 vz0B1zhT+/FH9rTeFWjK2O/EssBkUvOpTp56Ene/6sci5U0jkmSvisUk1NNY1K0GOl
	 9yjdxiwgyujkw==
Message-ID: <565e1744-54ff-4daf-ac14-7b6c49fd3fa2@kernel.org>
Date: Mon, 12 Oct 2026 15:44:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/14] mm, swap: extendable swap devices (xswap phase
 I)
To: Baoquan He <baoquan.he@linux.dev>, Klara Modin <klarasmodin@gmail.com>
Cc: Baoquan He <hebaoquan@kylinos.cn>, linux-mm@kvack.org,
 akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com,
 hannes@cmpxchg.org, nphamcs@gmail.com, baohua@kernel.org,
 youngjun.park@lge.com, yosry@kernel.org, shikemeng@huaweicloud.com,
 chengming.zhou@linux.dev, linux-kernel@vger.kernel.org, kunwu.chan@gmail.com
References: <20261003003136.750633-1-hebaoquan@kylinos.cn>
 <asZt7-8mcxqc1a02@soda.int.kasm.eu> <asylV5YyyaHs8rP3@fedora>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzS5EYXZpZCBIaWxk
 ZW5icmFuZCAoQ3VycmVudCkgPGRhdmlkQGtlcm5lbC5vcmc+wsGQBBMBCAA6AhsDBQkmWAik
 AgsJBBUKCQgCFgICHgUCF4AWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaYJt/AIZAQAKCRBN
 3hD3AP+DWriiD/9BLGEKG+N8L2AXhikJg6YmXom9ytRwPqDgpHpVg2xdhopoWdMRXjzOrIKD
 g4LSnFaKneQD0hZhoArEeamG5tyo32xoRsPwkbpIzL0OKSZ8G6mVbFGpjmyDLQCAxteXCLXz
 ZI0VbsuJKelYnKcXWOIndOrNRvE5eoOfTt2XfBnAapxMYY2IsV+qaUXlO63GgfIOg8RBaj7x
 3NxkI3rV0SHhI4GU9K6jCvGghxeS1QX6L/XI9mfAYaIwGy5B68kF26piAVYv/QZDEVIpo3t7
 /fjSpxKT8plJH6rhhR0epy8dWRHk3qT5tk2P85twasdloWtkMZ7FsCJRKWscm1BLpsDn6EQ4
 jeMHECiY9kGKKi8dQpv3FRyo2QApZ49NNDbwcR0ZndK0XFo15iH708H5Qja/8TuXCwnPWAcJ
 DQoNIDFyaxe26Rx3ZwUkRALa3iPcVjE0//TrQ4KnFf+lMBSrS33xDDBfevW9+Dk6IISmDH1R
 HFq2jpkN+FX/PE8eVhV68B2DsAPZ5rUwyCKUXPTJ/irrCCmAAb5Jpv11S7hUSpqtM/6oVESC
 3z/7CzrVtRODzLtNgV4r5EI+wAv/3PgJLlMwgJM90Fb3CB2IgbxhjvmB1WNdvXACVydx55V7
 LPPKodSTF29rlnQAf9HLgCphuuSrrPn5VQDaYZl4N/7zc2wcWM7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <asylV5YyyaHs8rP3@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/12/26 11:16, Baoquan He wrote:
> Hi Klara,
> 
> On 10/07/26 at 06:28pm, Klara Modin wrote:
>> On 2026-10-03 08:31:22 +0800, Baoquan He wrote:
> ...snip...
>>> The only argument create takes is a priority. The size comes from
>>> xswap.max= at boot, so there is one place to ask for a size and one to
>>> ask for a priority, and a priority can be given per device while a size
>>> cannot:
>>>
>>>   # echo > /sys/kernel/mm/xswap/create          default priority
>>>   # echo 100 > /sys/kernel/mm/xswap/create      priority 100
>>>
>>
>>> The default is the highest priority, SWAP_FLAG_PRIO_MASK. An xswap
>>> device is then the first one tried, ahead of any ordinary swap device.
>>> Setting a lower priority is allowed.
>>
>> Nice, this is now a good default which the user should not have to
>> change.
> 
> Thanks a lot for careful reviewing, and sorry for late reply.
> 
>>
>>>
>>> The device does not move once it exists, so the address space cannot be
>>> changed from this interface either. xswap.max= at boot and this together
>>> are the whole configuration.
> ...snip...
>>> Open items
>>> ----------
>>>
>>> - xswap_create() sets si->pages to the whole address space (twice RAM by
>>>   default) and _enable_swap_info() adds it to nr_swap_pages and
>>>   total_swap_pages, which is what __vm_enough_memory() uses for
>>>   overcommit. That raises the commit limit by 2xRAM for a device whose
>>>   real capacity is bounded by the zswap pool and by how well the workload
>>>   compresses. The question is which semantics overcommit should follow:
>>>   worst-case backing, or the address space.
>>>
>>> - destroy takes a bare swap type. The type is an internal index that
>>>   alloc_swap_info() recycles as soon as SWP_USED clears, so a value read
>>>   earlier can name a different device by the time it is written. The
>>>   swapoff ABI uses a path for this reason. It wants a generation or
>>>   another stable handle.
>>>
>>> - The new interfaces (/sys/kernel/mm/xswap/create and destroy, xswap.max=,
>>>   the new type string in /proc/swaps) are not documented yet.
>>
>> To me it feels a bit weird to have the interface split between a kernel
>> parameter and sysfs, meaning I have to configure this in two places now.
>> As far as I gather, there's also nothing that needs the limit to be
>> fixed at boot since it is applied at creation. If we want to expose this
>> limit to users (as xswap does) it would be nice to have a 'max'
>> shorthand for tha largest possible value, i.e. SWAPFILE_CLUSTER *
>> UNIT_MAX (or whatever it might be in the future). That would I guess in
>> practice give the same behaviour as vm.overcommit_memory=1 which might
>> or might not be desirable.
> 
> Thanks for the comment.
> 
> Here xswap.max= is a global boot parameter, while not a per-device or
> runtie knob. It sets the space space (si->max) of the xswap device
> at boot and can't change at runtime. So on the two places: the size is
> a global setting, fixed at boot; the priority is per device, it is in
> the create interface. They are different things.
> 
> The default is 2xRAM. From our earlier discussion, this is the largest
> size we think is sensible, and in practice I don't think it is not
> reachable in reality. If a system has swapped out 70% of its memory, and
> even more at 100%, it is already doubtful that it can still function
> normally. So 2xRAM is an upper bound, not a target.

I remember some overcommitted hypervisor setups where people swapped out
significantly more -- without any issues.

For example, Windows VMs initialize all VM memory when booting up. Afterwards,
you might just have plenty of memory that was touched once but will not really
be used in any near future.

So I would consider some crazy hypervisor scenarios as well where people
commonly have significant cold memory that is currently not hot (not in the
working set) but might possibly used in some distant future.

-- 
Cheers,

David
