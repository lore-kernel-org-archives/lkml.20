Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806471;
	b=SYN5YbxnD5ABKL/0UW8QweaQabwcaSMxPeMvFZkjcFo3izajsT/sA2tkRRZdopeBMWHp
	 kE5KILGWkihqNO0zTE2gppD821VdjLhoWeNYNLGH8olM/egCZXVrmIVUZ64NjiqeMTgEI
	 iu/umUYsgKEMzKPOtseIK7mgTjvool5ZROYgx5EdFSgWgcSDSuc3VHbCUkwesJFcRpPYC
	 JpBOh6DbC/Kn+1MjQyJWXFYH5FkOFLEoawbtN6TNnvTkmRHTJghrZONtJAmsiGMud/oLO
	 QsEyc6SmvJFghWCcsuSBME/Jj8+gS9HBJUcBNpBj3pAQoxSrvK3eVRZKWF9PcRcgvIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806471;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=FWbOn/GLiU8cstkICArjyWkg092KJPYjCBHWz0oY2CA=;
	b=jMiaS2QGZ1mMpL6C2nXqVB0P9RplFvqlVkPXVUivMms0Y4VqAbTTknirHJ3SrMoHgTVm
	 GE7OcOO5MFAZdPa7qC8fwBI5FEYsbDqVEZl1pvluBEifM5oAmW4FAzQpOF9tTMCKEq9Ct
	 f8cdzldQgPlKpLUuhUu5Sv1S3EhFBNhgXeMhywc1t4FaAubg732ZkAyibI+k8SMqfKYUX
	 ivs9IzSkmeqw//AsUfkqUUpUhSBpPIGhvulOGXYKAstg3Ff0By97WPRlHMYewTj08LwC2
	 8GLuiuxaOB+bNw0+ay0yqL+S52x9burOyJIxFREKRtDR8VWhoQbxCt1D4FEk2jT8Z1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oNIVVmYU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E93606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oNIVVmYU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AEBF1F0093A;
	Wed,  4 Nov 2026 15:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793806470;
	bh=FWbOn/GLiU8cstkICArjyWkg092KJPYjCBHWz0oY2CA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=oNIVVmYUmEJVQ+0SWLcs+EglgDv2R1Dyr+PqlCQVYWVq7yddaHUUYhH3HOG15TwrS
	 NVcAH0H/XmqLesd/OiwB8iH2t0bUYVtjSSVqtQIops9cYoI2E0v8JtRdZZ3DhvrNjJ
	 lIxqA4JxFhDwEj/ROvbaRPDK9WdW0FVXcJDqByJtL5IHa8Pn+hi4pHSE9+QLkJ6X2I
	 QTVjHnB3mbF+iXwjFyM0W2jUPNC5xU2qWCfEf6fx0FNEJTg9eEBy+Ikkx0EYjZytzt
	 uSKmShHpPIsn6k9NPtkKdR0KadatOifPTyHXXuuP417khPiw5jr3+USwD4BoXPrAFb
	 VAgedmVBO21wQ==
Message-ID: <c37d96d6-49af-4319-8ac5-2afd3ae8492a@kernel.org>
Date: Wed, 4 Nov 2026 16:34:21 +0100
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
Subject: Re: [PATCH v3] tools/mm: add hwpoison-panic tool
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Miaohe Lin <linmiaohe@huawei.com>, Naoya Horiguchi
 <nao.horiguchi@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, SJ Park <sj@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, kernel-team@meta.com
References: <20260813-memory_failure_rewrite_test-v3-1-f9fb6542cbff@debian.org>
 <12f80449-9d6c-4fb7-bcc4-e7d38e868da2@kernel.org>
 <autEaeyHvhi8vvSK@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <autEaeyHvhi8vvSK@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 15:43, Breno Leitao wrote:
> On Wed, Nov 04, 2026 at 03:35:16PM +0100, David Hildenbrand (Arm) wrote:
>> On 8/13/26 13:45, Breno Leitao wrote:
>>> Add a tool that enables the vm.panic_on_unrecoverable_memory_failure
>>> sysctl, picks a kernel-owned PFN and writes its physical address to
>>> hard_offline_page.  Three page kinds are selectable with -k: rodata
>>> (default), slab or pgtable. In all cases the host should panic.
>>>
>>> Example:
>>>
>>>         # ./hwpoison-panic -k slab --yes-panic-my-kernel
>>>         injecting hwpoison at phys 0x100032000 (pfn 0x100032, kind=slab)
>>>         expecting kernel panic: 'Memory failure: <pfn>: unrecoverable page'
>>>
>>> In dmesg, you will see:
>>>
>>>         Memory failure: 0x100032: unhandlable page.
>>>         Memory failure: 0x100032: recovery action for reserved kernel page: Ignored
>>>         Kernel panic - not syncing: Memory failure: 0x100032: unrecoverable page
>>>
>>> This lives in tools/mm rather than selftests/mm because every successful
>>> run crashes the machine, which is not something to run from CI.
>>>
>>> The --yes-panic-my-kernel argument is required so an accidental
>>> invocation does not take the box down.
>>
>> This is not upstream yet, right?
> 
> Right. :-(
> 
>> Anything missing or is this good to go in?
> 
> I would say this is good to go, David.

Agreed, nothing jumped at me and this is useful.

Acked-by: David Hildenbrand (Arm) <david@kernel.org>

@Andrew will you pick this up?

-- 
Cheers,

David
