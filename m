Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483152;
	b=LxhdCSadm2IO5KebRzNNppowcSQB9DVwBSwWHG5CNxbGwQhDcToZjnyNkY+sepMOYwkk
	 +4tHuzdiBUSB2D6crG8ULdWK0Pd7Aeld9CbZZjGaYCoiSOGOOfYsocvYTdpPMEi4IJ2zQ
	 z2n5JAsvQ1naaH/xCGlzBfPbKsS/JfmOqbtIr5+1/kWxwaFZSrjTjUmAgb5wb4pHOFVYd
	 K3AqEuxB5CXy/PhNMROEm6LEYg4PrRLJKO8B4hdghopzo+Un4WOMXGjOyAVCAB0txvKXZ
	 93vz/4aTcb/CEVr14d1F1S4ASukOT7CImEy830MEE4K8ZXVkaO7iUTXtj3g4UYYMOWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483152;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=ReBTcrDImQvhoa5yHIWdOL2JpqjCmSuJOVv23tlb0UA=;
	b=ThDOCfcJYG/AoTyFRvbbYXdFSb5wm9XevvHL7K1LDgFiBNOP9Nnz90nhrfgRU5bj/6Qw
	 sXb9LCLeH4rCKuvGWIfiMDdS1Rp/oFi/4qsUHLx1tU1KpFQZoURwpu3Xb3TpTsXahNbP6
	 5rGprIScZ7fdzq+J0j92j41wi2qrn1GSYTLeGjjhAFpdmql6wyEpw51CCl6SxY2wdiYXA
	 trgNLxiHm+zuA441YP3BR/r/kGS7RDhdRjMjLYOmeLD1JxSnYVxCmIiyCTJ+GBrLJ3gpk
	 0vCY1/A3SYVudHeBb15VIoRO6eoA5UaKCM/6GIff5VOHTmPf64mmNx7gK3oN6Q4r5qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K3Zn69FG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC88606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K3Zn69FG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8E51F000C4;
	Tue, 20 Oct 2026 07:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792483151;
	bh=ReBTcrDImQvhoa5yHIWdOL2JpqjCmSuJOVv23tlb0UA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=K3Zn69FGWwSiJtnA3FBjGGoXJSaQ410NJ80DjvSu6xdbeDuevOL9AACByNV9xTbWq
	 o1J5l6e6+tCNtsnjE89KTNAGa4Lxg5PjNQ3TcF3VXEG21gwhgfJEATg3/IIt9tEc66
	 GJXmr+tN0rbXuqI4CE+7oAr1gZVH7BPL2W4HoyDbhMTuyHOZfNgC2AF5XZCMRCrQYA
	 WKrgr+M8EgQ19bpl4A8CTpaNg4Qazlsnj8fxenfx9YSQdnaAph96gxTN7GzGa/3r9W
	 IfKRxOxomD4OQCsbAf+EXogLaKsngv2775eNZwjfOvRUu0BspyMnzUWe72nWkaoNYR
	 0CXX9OuWyKmTA==
Message-ID: <b66b3450-ec8a-4c85-bb19-3731e21c0dff@kernel.org>
Date: Tue, 20 Oct 2026 09:59:07 +0200
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
Subject: Re: [patch v5] mm: vmstat_kunit: add synthetic benchmark for mm stats
To: David Rientjes <rientjes@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Lameter <cl@gentwo.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Sarthak Sharma <sarthak.sharma@arm.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <920ba123-077e-c42d-ebdf-a5effccf2073@google.com>
 <8b077a83-3f79-cbfa-0273-e086b0e51ae4@google.com>
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
In-Reply-To: <8b077a83-3f79-cbfa-0273-e086b0e51ae4@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/17/26 00:35, David Rientjes wrote:
> On Fri, 9 Oct 2026, David Rientjes wrote:
> 
>> From: Christoph Lameter <cl@gentwo.org>
>>
>> Add a synthetic benchmark that can be used to measure performance of MM
>> statistics.  This is used to analyze any improvements or regressions in
>> functions that are frequently used in hot code paths.
>>
>> This is the first of three tests that measure the execution times of
>> critical MM functions anticipated to be used by developers to measure the
>> impact of any core changes that would end up causing workload performance
>> issues.  Vmstats are embedded into MM hotpaths, so any regression can
>> cause performance and scalability impact for users.  Google has carried
>> these tests internally and kept them updated since Christoph posted them
>> back in 2009 for this purpose.
>>
>> This can also be used to detect regressions over time, from kernel
>> version to kernel version, independent of development use cases.
>>
>> The test is run by KUnit or doing modprobe vmstat_kunit directly.
>>
>> Sample output:
>>  KTAP version 1
>>  1..1
>>  KTAP version 1
>>  # Subtest: vmstat
>>  # module: vmstat_kunit
>>       1..3
>>       # vmstat_test_inc_dec_zone_page_state: 10000 ops: inc_zone_page_state -> 8 cycles (4 ns/op), dec_zone_page_state -> 9 cycles (4 ns/op)
>>       ok 1 vmstat_test_inc_dec_zone_page_state
>>       # vmstat_test_interleaved_zone_page_state: 10000 ops: inc/dec pair -> 17 cycles (8 ns/op)
>>       ok 2 vmstat_test_interleaved_zone_page_state
>>       # vmstat_test_count_vm_event: 10000 ops: count_vm_event -> 4 cycles (2 ns/op)
>>       ok 3 vmstat_test_count_vm_event
>>  # vmstat: pass:3 fail:0 skip:0 total:3
>>  # Totals: pass:3 fail:0 skip:0 total:3
>>  ok 1 vmstat
>>
>> Assisted-by: Gemini:gemini-3.8-flash
>> Signed-off-by: Christoph Lameter <cl@gentwo.org>
>> Signed-off-by: David Rientjes <rientjes@google.com>
>> ---
>> v5:
>>  - added dependency on CONFIG_VM_EVENT_COUNTERS
>>  - expanded commit description
>>
>> Once we're happy with this change, I'll apply the same treatment to the
>> proposed pgalloc and slab tests.
>>
> 
> I've added the rationale for the change to the commit description as 
> primairly being used by developers to benchmark and monitor any 
> regressions in functions that are known to be super hot and impact 
> workload performance.
> 
> This is the simplest of the three tests that Christoph provided back in 
> 2009, the others are pgalloc and slab tests, see 
> https://marc.info/?l=linux-mm&m=178547194364290 and 
> https://marc.info/?l=linux-mm&m=178547193264283 for those.  Based on the 
> feedback to move to kunit, I forked this one off independently because it 
> was the simplest to address all the feedback and pave the way for the 
> other two to be upstreamed afterwards.
> 
> Is this acceptable for merge?  If we're happy with this, I'll move onto 
> the pgalloc and slab variants.

Works for me. The tests are rather small and I see value in them.


-- 
Cheers,

David
