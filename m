Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743294;
	b=PWYjeiNc7TwQgB3JknaGlhgcSdLoxafMgn9ZQkTlc2u3/4Sg0SzICgkb9xlaBxj0noBp
	 dr8sjTwmQOeMY1Op8Kk3PnmMJntNRfg54s7+HWaH8mzz7S4qivnQkcNIPBX1QjiS3Jf8C
	 J0lMHkHCwtXuyyhzB4FFIz2aV6FVJic0dBRGUFm4P98hfJR/EOqqmcGvuQS6J1tEudhOH
	 w+LrsmWHmpJkEb1G3PwJY6gp2KF8XVlnXg8h9zB3kUSdNoEV7JvP2dXKu3GqDSlmdew5D
	 nDlH/Z/aVOpskt/8727lmR7wvzUT8Iu/Cjj71s9yvlrkBRSq/CeKMjb5RK7jfxckxFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743294;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=peBrLxQYphAWA0aed033QDkUYmfTpLADSsSaf6bnm8w=;
	b=XcTcSs00E3EhK54waS3bF87oR5uVvqJjeiXch5ADpTLRNaPY3rHRp7dW9VGFZBKlJZNk
	 67mAcwFleUEF1sZUUGvA0Asb8H5BanefTCMO7qnyOVMLNfYA9VtN0MP1UIW+Y75RRkIFh
	 WcyrrivbntaW2GzFjZiWDTxBTdYvWQKXidOedDZunS5bjZhlO5aMZ3p1SKyp8t0fHf3vX
	 gFtohZhiEjUsj2h7kK2ZPfSeFMqEcEHwRvNtYXra+y5u0MdYp0FDF6+HEPQNlNwcg9FW3
	 rKdv1V0DAy91nHgZXZgbaGETflIckUgm1MIdx59ZseBGeUY1K0U2YKCZNZixyCNk06Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ShGrRr2i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87329606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ShGrRr2i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A641F01825;
	Fri, 23 Oct 2026 08:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792743294;
	bh=peBrLxQYphAWA0aed033QDkUYmfTpLADSsSaf6bnm8w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ShGrRr2i/YYSDBKxdszIqiZelQsGU96ViTWorMdYU/QKsn2y4mEKhwKDfr2twOUOi
	 bluvyJYe7vW0W3unEL8OuMYGiHq5wnA8C2JEDAtOqIMJK85HVrPSmILvI6S630h0qV
	 TwzdHa5YAeaaPPlLoOCozSN57KX7njo3/P7azUXZx7PhcMAz09pCucdBcMHcsJRz+1
	 gMRC3V0Wa3cnF+g2cJ18lFmiZ7t11lRR7EtWOw/d9gecFPVghY4TWrsHsnJkoLJzzv
	 52wSis0Xli+77fsW4MzBqrFxTPuGdZPpr15eZk/eHTL4adAmnhYQ1u2/hzL97MjQXu
	 nuP9WnLNkcBEQ==
Message-ID: <8f09767b-004c-480f-a578-f2722ea4301d@kernel.org>
Date: Fri, 23 Oct 2026 10:14:50 +0200
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
Subject: Re: [PATCH RFC 0/8] replace CONFIG_SLUB_TINY with a slab_tiny boot
 parameter
Content-Language: en-US
To: Harry Yoo <harry@kernel.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
 David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260923-slub_tiny_rework-v1-0-a0e66d536eb5@kernel.org>
 <arU956kfc1QpA7N-@thinkstation>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <arU956kfc1QpA7N-@thinkstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/26 17:18, Harry Yoo wrote:
> On Wed, Sep 23, 2026 at 05:45:05PM +0200, Vlastimil Babka (SUSE) wrote:
>> To sum up, after this series:
>> 
>> - CONFIG_SLUB_TINY is a deprecated option that has no interaction with
>>   other options and only controls the default behavior.
>> 
>> - New slab_tiny boot parameter controls the functionality (and can
>>   override CONFIG_SLUB_TINY in both directions).
>>
>> - slab_debug=N can effectively achieve most of slab_tiny and on a
>>   per-cache basic
> 
> Allowing "slab_tiny=0" doesn't make much sense given that
> CONFIG_SLUB_TINY is deprecated anyway. I was assuming specifying
> "slab_tiny" would enable it and not specifying it would disable it
> unless CONFIG_SLUB_TINY is set.

I was anticipating a possible autodetection in the future - i.e. "is this
system so tiny we should do it?" and a way to override to =0 may be useful.

> Also it's bit confusing to have multiple ways to achieve the same thing.
> Is there a reason why we can't interpret "slab_debug=N" as
> "slab_tiny_enabled = 1" internally and drop "slab_tiny" boot parameter?

"slab_debug=N" is a weird parameter to control the whole slab_tiny (which
does more than the slab_debug part). In my view it exists as a side-effect
to how slab_tiny is implemented. But because slab_tiny is implemented using
that, I thought it might make sense to expose slab_debug=N separately too.
It might be even useful in some debug scenario.

Whoever wants to use slab_tiny doesn't even need to know about slab_debug.

>> - the implementation is simpler with many ifdefs removed
>> 
>> [1] https://lore.kernel.org/all/CAHk-=wh-k04MsoEC0SGKff2Snm6bBF_e+0pHOKwaWv4umZ_SnQ@mail.gmail.com/
>> 
>> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
>> ---
>> Vlastimil Babka (SUSE) (8):
>>       mm, slab: refactor slab_min/max_order handling
>>       mm, slab: introduce slab_debug=N
>>       mm, slab: rework KMALLOC_RECLAIM handling of SLUB_TINY
>>       mm, slab: make SLUB_TINY handling dynamic for sizing decisions
>>       mm, slab: convert CONFIG_SLUB_TINY checks to kmem_cache_debug()
>>       mm, slab: remove remaining compile-time checks for CONFIG_SLUB_TINY
>>       mm, slab: add slab_tiny boot param
>>       mm, slab: deprecate CONFIG_SLUB_TINY and reduce its Kconfig effects
>> 
>>  Documentation/admin-guide/kernel-parameters.txt |   4 +
>>  Documentation/admin-guide/mm/slab.rst           |  18 ++-
>>  include/linux/slab.h                            |  17 +--
>>  lib/Kconfig.kasan                               |   2 +-
>>  mm/Kconfig                                      |  16 ++-
>>  mm/Kconfig.debug                                |   2 +-
>>  mm/slab.h                                       |  32 +++--
>>  mm/slab_common.c                                |  12 +-
>>  mm/slub.c                                       | 149 +++++++++++-------------
>>  9 files changed, 120 insertions(+), 132 deletions(-)
>> ---
>> base-commit: b4218126d498275444f315b0ed4cef6add6beabc
>> change-id: 20260911-slub_tiny_rework-8f2634dd17a7
>> 
> 

