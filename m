Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485422;
	b=txqeL7ElNmebb43UR9zEsAVVdNG1rGCYn3p5rMwcmLX+H77B5c3RjpJL/12p0mIIs/Af
	 V7T7Kdt7HAJ4GoEai7/yfnLiFz9hJusyxSI0VQDDcjefB5SF75DkXC93Ov4zZdzJkekwR
	 x79MCPtbKy5GXLgW8OGS328YqtMfyd6AFQllhyJK6IHNXoKkWPJco5tP4X73cG5aPidrI
	 RiVqwutBKwayjAgdofIdmX9oUIkPC01MmNp46lfvdhNH+7Cc30VT1PTtrIwiKctcT5YB8
	 8PIuV7+fFG4ikp/l87O9E7mY/26hNOlcKisBC7tcmRIhHwb9zncRYkQbQqD/db9BI9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485422;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=WcS40+UCUrjVpcC++oCr3nHQbVKlVGoZMIffrsu1aX4=;
	b=ly8WtZunzolgwvU46BTk++3jawr2AVm39msiDN56OoO6DKIcAZmeiK258LBZJWg4yX5c
	 Z+976Ou9OJgH7ue1nurHtK/m3PpAJCBBbsKr93XE+iqpMwNZ0mA6hmw+dPs/9k3rGiSlj
	 c8TT88EiW/zNDgcg+yxzKqoMYT4Qoqb4bEbkG8uiakB5NYRoHScHlu7sK4ADNiXPKMNFF
	 J+IEkqa6FEVviVaTaZKSpnYIxKpRlWrHvcpg1Yk54Wp/fHqlgQfwA+H3MA9XjblLX5+al
	 tLvJXRZkgSLNw6n0fc+Jd0F6KpvQ5n2Gv8DBBaLtvgTDC9lT2GxMvI+a9d85n47STdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XEHHg9Ol;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099DA606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XEHHg9Ol
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E8A1F000C5;
	Tue, 20 Oct 2026 08:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792485421;
	bh=WcS40+UCUrjVpcC++oCr3nHQbVKlVGoZMIffrsu1aX4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XEHHg9Olk8StMgpraNq127BzFNi/fUtG6knLn7JfC/DIIYj418LHGLGaldG/k5Cox
	 Udr65vKEX5iR/OlUG+u6a+t/7JdsbjIpal8l1bfauGXlIkkzMTRvj4iX7B6VmupVX+
	 vH55Bc8apWD8dw7+S4ufMPNujjoBbNYjAV1THtlb+eqsLoQ0/hQFam4webHHUvT0TV
	 WgdPEJvMaFedzZtA/35anUHrSww7oJ//dvAwF1CtpHi4OgshSHp7O7jXhlXTTGP+2F
	 WrViVsQuS1IWxdbJq234SGfdSPvuW2Y1KbJQrWnLFpz8DLrawVjzlkXsELS0Ta4kxK
	 mLgMf5TVBTFaw==
Message-ID: <938e215b-a2fd-4f1a-b4c5-e46b8af0f00b@kernel.org>
Date: Tue, 20 Oct 2026 10:36:56 +0200
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
Subject: Re: [PATCH v2] mm: memory: fix truncation removing mapped folios
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org
Cc: ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, qi.zheng@linux.dev, jack@suse.cz,
 pfalcato@suse.de, ayushr@modal.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <542c97482eae84f86704bcee56482633d1b32321.1791616645.git.baolin.wang@linux.alibaba.com>
 <8245424a-f068-4be5-9e58-713cbff1f8ae@kernel.org>
 <405811f5-ee36-4b3c-80d0-7dc6827ab5d4@linux.alibaba.com>
 <6660d3bb-3485-4c34-8734-3ea99df920f1@kernel.org>
 <02c9a968-92e2-49e2-bffc-74d264a5c911@linux.alibaba.com>
 <f7735584-e020-4ee1-8afb-2b5d580cfa49@kernel.org>
 <b1a9b500-0ddc-4791-9e1f-00087e367426@linux.alibaba.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <b1a9b500-0ddc-4791-9e1f-00087e367426@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/16/26 03:47, Baolin Wang wrote:
> 
> 
> On 10/16/26 3:00 AM, David Hildenbrand (Arm) wrote:
>> On 10/15/26 08:41, Baolin Wang wrote:
>>>
>>>
>>>
>>> Yes, I've considered that. However, implicit memory barriers give me a headache,
>>> so I ended up going with explicit memory barriers (suggested by Pedro).
>>>
>>> If you don't like memory barriers, let me re-check whether the implicit memory
>>> barriers here can ensure race safety with sync_with_folio_pmd_zap(). A
>>> simplified logic is as follows:
>>>
>>> CPU 0 (truncation)                        CPU 1 (zapping)
>>> down_read() ->Acquire A1.                pte spin_lock() ->Acquire A4
>>>                                           clear mapcount
>>>
>>>                                           pmd spin_lock() ->Acquire A5
>>>                                           clear pmd
>>>                                           pmd spin_unlock() ->Release R5
>>>
>>> if (pmd_none()) { //read pmd
>>>                                           pte spin_unlock() ->Release R4
>>>      pmd spin_lock() ->Acquire A2
>>>      pmd spin_unlock() ->Release R2
>>> }
>>> up_read() -> Release R1
>>>
>>> spin_lock(y) ->Acquire A3
>>> folio_mapped() // read mapcount
>>> spin_unlock(y) ->Release R3
>>>
>>> CPU 0 constraints:
>>> 1. R2 is a release, so "read pmd" completes before R2.
>>> 2. A2 completes before A3 (ACQUIRE vs ACQUIRE).
>>> 3. "read mapcount" completes after A3, hence after A2.
>>>
>>> CPU 1 constraints:
>>> 1. R5 is a release. Both "clear mapcount" and "clear pmd" complete before R5.
>>>
>>> According to above constraints, if CPU0 sees pmd_none() caused by CPU1's clear
>>> pmd, and CPU0 then acquires the same pmd lock released by CPU1 at R5, then
>>> CPU1's clear mapcount happens before CPU0's later folio_mapped().
>>>
>>> Therefore folio_mapped() is guaranteed not to read the old mapcount in this
>>> case. So I think sync_with_folio_pmd_zap() can work, but needs a small change to
>>> avoid the double pmd_none() check.
>>
>>
>> I'd be okay with some (follow-up?) memory barrier handling inside
>> sync_with_folio_pmd_zap(), for example, based on the folio size and with proper
>> documentation why we need the PT lock in one case and why the memory barrier is
>> ok in the other case.
> 
> I'm afraid that we can't fit all the memory barriers into
> sync_with_folio_pmd_zap(). As the current patch does, we need memory barriers on
> both the writer and reader sides.

Obviously only the reader-side one would go in there.

[...]

>>>                  if (pmd_none(*pmd)) {
>>> +                       if (details && details->single_folio)
>>> +                               sync_with_folio_pmd_zap(tlb->mm, pmd);
>>>                          addr = next;
>>>                          continue;
>>>                  }
>>
>> We do have another sync_with_folio_pmd_zap() user in page_vma_mapped_walk(),
>> does that one need care as well?
> 
> Good point. But I don't want to add page_vma_mapped_walk() changes into this fix
> patch. I need to analyze all callers of page_vma_mapped_walk() and the potential
> races. I'll look into whether it should be changed in a follow-up patch.

Yes, please have a look. I am 99.9% sure that we face the exact same issue there
as well.

-- 
Cheers,

David
