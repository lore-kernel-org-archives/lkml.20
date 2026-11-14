Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794687430;
	b=aVT7OOJXNnyzO2yH9z6uCqvITejzzY9RHMtjbN8jV1pHjHev7ZX+lwqkCulWw6BKvNJo
	 vUfPd5Vzk14mDZLRP+cnIMhazxM09w+31v+rJ2fjTGRQeZOaTe91cv3rTWB6FNw8lBGz6
	 2f5qNFTwOlEefKY1e6p2i0plLsi9d+wMWiahlFaEDL3C1Yff9UssA7CaNfwY2KBCfTD+f
	 P4UEi9C+rrEwtHSol26VyXeADRF2dQg2SJ9bBFA3g8jkozcFHb8a1L7QLItPH5n/tirg3
	 yjvbJ8RC+4OS4+axuG2W55j9DCvROcXKC8L+TfjiJ2/mO6TEsznJ0x1BMA+1Vd7xlHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794687430;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=OZxdnEWnSrxJbR1e8/SaG5gFDq6H5EE2W5CAZ6cJ4ww=;
	b=QxVpFi7PGv5HCPMjG4O1v8IbKGj97P9emmkSUQnja1gX2FGNKUJNnDxlInrmWkov1HnZ
	 XXotFGWpJ0QsawSRhbNhqPpdveX3P7LTIr88hqQ1rERwdDgKobsqfNEpHzakl2egUdKVE
	 h2ROMehM1ltWr2/DPaBxjfIT8kGmYdEEZsacQvD4ms3Z6UKksR0S+JHXzylrQR2iYD5qz
	 UQ8lFh8Zmig10/Rtxf42nqqY/0/Egtf3D0yDsNPu6trfamb2eOVu5h8++O2/Fb7euMZQd
	 nS5xRaSgsbFbOZ0gEpnZV+QQETdW16LS34uDb99U8kHmOB+pFAck45z4iq5yCf4DaJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cWWbsaIx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FA3606A327;
	Sat, 14 Nov 2026 20:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cWWbsaIx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378E91F000C4;
	Sat, 14 Nov 2026 20:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794687430;
	bh=OZxdnEWnSrxJbR1e8/SaG5gFDq6H5EE2W5CAZ6cJ4ww=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=cWWbsaIxnBdWa/4AtdpygHFk0lD1RcnYrPAcN4DBz5Q5NkxBnHyFRqSAUZbMVVxCs
	 cqqYmpw2kN7ZeQMC17g2X/lCT5KrKit12s2zkXOFzqTKueVoYFLqtTD9gnPuG10TZm
	 4shc6Swp2kDscdFX4FDnBWHsRrahP/DBs+OKcmwany3vPUTj1Y7IoH6FPJznXYu9by
	 D6CVZZc3q9Dq7+I0VU48mgU46PVXp45lJE+g572jZ+lxZy6zFY8CekPh1nWD/Vff5H
	 xSV/SNu534+cyGIjo7P+OS8s7wbGDR/iKOGNBK7BmS1jlFvbkcSYxM7UUjuWIr2JAP
	 4yMKFNQu4whAA==
Message-ID: <70740a32-92f5-4425-8676-68863f3e44c3@kernel.org>
Date: Sat, 14 Nov 2026 21:16:59 +0100
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
Subject: Re: [PATCH 2/2] mm/mempolicy: limit shared policy ranges per inode
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20261113-mempolicy_limit-v1-0-16688b2644dc@kernel.org>
 <20261113-mempolicy_limit-v1-2-16688b2644dc@kernel.org>
 <179467808112.482102.13365594235443107281.b4-reply@b4>
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
In-Reply-To: <179467808112.482102.13365594235443107281.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/14/26 18:41, Gregory Price (Meta) wrote:
> On 2026-11-13 22:36 +0100, David Hildenbrand (Arm) wrote:
>> Shared NUMA policy ranges can accumulate on an inode after its mappings
>> are removed. Currently, these nodes are effectively unbounded (even though
>> the allcoations are charged).
>>
>> An unbounded tree can cause long rwlock hold times when replacing or
>> freeing policies. Instead of trying to fix that, it sounds more like
>> having many nodes is actually only a scenario for processes trying to
>> cause trouble. Most use cases will probably only use a handful of them,
>> not millions.
>>
>> Add vm.max_shared_policy_count (inspired by vm.max_map_count), defaulting
>> to 1024 ranges per inode. Reject updates with -ENOMEM if they would
>> increase the count beyond the limit, taking merging, splitting etc.
>> into account.
>>
>> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> 
> 
> This arguably breaks userspace.

Which is fine if there is no valid userspace that does something stupid.

> 
> A single mapper that tries to set >1024 ranges would start getting
> -ENOMEMs unexpectedly with this change.

Sure, that's expected. The admin can raise the default for these odd cases.

I did some digging and was not able to come up with any valid use case.

The only is that you have many VMAs for the same file mapping (mprotect etc) and
then do a mind().

But that's precisely what patch #1 does.

> 
> Multi-task mappers were previously unlimited, but that seems like more
> of a nasty unintended corner case - not a real feature.
> 
> A single process is already limited on the number of vmas/policies based
> on `max_map_count`, so it seems natural to just use max_map_count
> directly, but I took a brief look at some distros and most seem to
> ship a raised `max_map_count` (>1 million) by default).
> 
> I tested that and even 1 million can cause a soft lockup.
> 
> Not sure there's an easy solution here, we might have to rework the shm
> policy locks.

Do you know a single valid use case that's not solved by patch #1 and would
trigger that many policies?

Ai was not able to come up with anything for me.

-- 
Cheers,

David
