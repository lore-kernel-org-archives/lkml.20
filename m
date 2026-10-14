Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F03A38239A
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974779; cv=none; b=MpFuto3DBWqXp5yLnAI4P9aerJl73ZPLthx+HTD4ZNjx5yiThUHVWVZE8lYsqDS4J8Deo6oWPrqMfveH+VYYXLRZeRz4r4ERCVltLz2GL8UjRSnJVMX9nFTCM4np/eOk8nlrPXaRggpoxlOKHLpns1Wnt6XdAt+hMnnH3UWMdR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974779; c=relaxed/simple;
	bh=4V5/2GT6naWzBgqPGKkRtd/pm1PRjr7hwUrFhFPb9r4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VLfy8dQZCDD4cq61T40L23ba6lc31eB9Uu5KVM8MKdc0yIooq0lUuB9sl+L1GqPpLgvKF2V5yTzD+oJExaH9Ozi812Mr/PGhjbZ7FXuTgu20jXhBBD9KFkbnJV6sNV3dQF721scU5lcXB0MDPK0v4rA1YfCj6j40/vpu8za1npk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JOqgqTRF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JOqgqTRF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F40691F000FF;
	Wed, 14 Oct 2026 10:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791974778;
	bh=TYK1qhYcVcdQcDNNIM9nzsgVfyv8Ia9LwUnyZa4iqeY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=JOqgqTRF8PjFk8EfMu0Qmi7BzkEvqxHG3gNNdLN3WURkSXE8+gKlZqK2Ou/J280fQ
	 H5yD+9OerHaEisTJR4B1e1m7ydqax/pxH6RQYNZmYbp0ptM+MzzLkbFwao21CXom1J
	 VAJOoelpGWotlIuM8x81Di0/x5ZCGCF1Jas8CA8/Gj3FmSchsMlHA0gxw44Ryb2yQ0
	 RAEH8pa5Nyi5TZOKfP2qWvbQz7WXMoqALEA3hCybP76pqKzet+ahGtdpHIWx+iBJXf
	 /o5d4wY0AIbLCctdVl/iq8hgMEbjvppgFkACtJC5lo1QXOU7J7wN/ccjvVemkh/9gy
	 piZ5nPhIKRmBQ==
Message-ID: <4c8f620c-3b98-46b8-bcd8-d73210214deb@kernel.org>
Date: Wed, 14 Oct 2026 12:46:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Improve page refcount scalability
To: Kiryl Shutsemau <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Ilya Gladyshev <ilya.gladyshev@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, "Paul E. McKenney" <paulmck@kernel.org>
References: <CAHk-=wjLjgfwgSZ1RDk4YdNFcV0ntosMO5AmBoHD76Zb3HFY7Q@mail.gmail.com>
 <as6ckC9NJVB8JBuV@casper.infradead.org> <as9af-Jd_rVZvMlC@thinkstation>
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
In-Reply-To: <as9af-Jd_rVZvMlC@thinkstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/14/26 12:36, Kiryl Shutsemau wrote:
> On Tue, Oct 13, 2026 at 10:03:12PM +0100, Matthew Wilcox wrote:
>> On Tue, Oct 13, 2026 at 11:43:14AM -0700, Linus Torvalds wrote:
>>> The fairly short series of ten patches basically enhances folio lookup
>>> by noticing when folios are hot, and setting a "delay relasing this
>>> folio until after a RCU period", and then using that RCU delay it does
>>> not just the folio lookup itself under RCU (which we've done forever),
>>> but also the actual folio data accesses themselves under RCU. No
>>> refcount taking needed for the fastpath where we can just read the
>>> data from the folio entirely in an RCU-protected region when the user
>>> copy doesn't cause page faults.
>>>
>>> Unlike my original approach - because it now actually delays the
>>> freeing of the underlying folio data - there's no need for any double
>>> buffering, and a lot of the original limitations of my original patch
>>> go away too. That improves performance quite a lot. And by "quite a
>>> lot"  I mean "I see a 23x performance increase on my Ryzen
>>> threadripper". Admittedly that is a very artificial case of reading
>>> the same small part of a page over and over in a threaded loop on all
>>> CPUs, so any real life impact will be much much less.
>>>
>>> Anyway, I wasn't planning on posting the individual patches, I think
>>> we all use git by now and probably find it easier than fetching
>>> patches from the list. So it's all at
>>>
>>>     git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux rcu-free-v3
>>>
>>> and the commit messages are a bit more verbose than I would have done
>>> it myself without tool use, but maybe it's better that way.
>>
>> Obviously the numbers are compelling.  And thanks to Kiryl for figuring
>> out a workload that confirmed my fears, then remedying the problem.
>>
>> I don't like the PG_rcu_free flag.
> 
> I wonder if you would be okay with a 64-bit-only flag? Those are less
> scarce. That's the direction I was looking at:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git/commit/?id=59b23fdc4bb0d008e2a30d24156177eeede8a577
> 
> I don't think we care about the scalability of 32-bit machines here.

I think limiting this functionality to 64bit makes a lot of sense.

-- 
Cheers,

David
