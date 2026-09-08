Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B840357D11
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 05:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845906; cv=none; b=pga3QqV21RzR2o/AE/TofKT37S/x6QHxB0VpKYfM/uByXgJzjFuk6EoPQU6RbWxeL2sty/UgkCoPZOYREZAONmJ8RYRT4TE8/hPnuGdevO7CYVqx1KcgpcwD8ji4HNl2ZqPKG2u0jAvo+shmvmuDzuGw1+9Oi5Q9CIR2tNEv/EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845906; c=relaxed/simple;
	bh=9xo2d/f1FvcfQH5bT3nqJ1JKECxz53ZfQJY8y160y1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sxmWtpno2tvo9cUmbPYM3rg6Rw9iA39cd3PO/9F2858OgreCz8vy0FdT8qg+KpaVwWV1JKUwf6wZnUp1bk1yau8kzkxsyQGoqV0JBhdlCUxroVXhgOC0OEpszgVvOA2k+x5ZEeHrWykGmNtsFTDsIn0gJEyvCu3CdWnOFKejgGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ui0+1jMz; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ui0+1jMz"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F1481476;
	Mon,  7 Sep 2026 22:38:17 -0700 (PDT)
Received: from [10.164.19.55] (unknown [10.164.19.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49A183F86C;
	Mon,  7 Sep 2026 22:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788845900; bh=9xo2d/f1FvcfQH5bT3nqJ1JKECxz53ZfQJY8y160y1k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ui0+1jMzj/HFyPwLgMd+uu8A17z2Fo19bUnzQ5WOHpHIC0Jrw9bc5Tc/l2+1wFYSM
	 NyY8mzr1NED4iwaPd1f2p1sF/Y9r+rk9+M3NOG6S23iLNBA2sL7TdnAtF4wS4uLCV2
	 ydynjooP7qcvFNkL+EivMXciyB0dfeGzBeCgkWzA=
Message-ID: <8cc0b340-9526-47ac-abd4-3f5724963409@arm.com>
Date: Tue, 8 Sep 2026 11:08:13 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] mm/internal: rename swap offset helpers to
 softleaf offset
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 hughd@google.com, chrisl@kernel.org, kasong@tencent.com, riel@surriel.com,
 liam@infradead.org, vbabka@kernel.org, harry@kernel.org, jannh@google.com,
 lance.yang@linux.dev, baolin.wang@linux.alibaba.com,
 shikemeng@huaweicloud.com, nphamcs@gmail.com, baoquan.he@linux.dev,
 youngjun.park@lge.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, pfalcato@suse.de,
 ryan.roberts@arm.com, anshuman.khandual@arm.com
References: <20260901054358.4049095-1-dev.jain@arm.com>
 <20260901054358.4049095-6-dev.jain@arm.com>
 <CAGsJ_4yigbhqkrnufJKC2+rW7StraQvD0gr=4HQkTjKGQ9siGQ@mail.gmail.com>
 <12efdc7f-ff82-412b-b79d-bff211d34218@arm.com>
 <CAGsJ_4y7V40CnTTh=84=Ek6T3tPTyLXsUtgO81O1zyZpmQcbug@mail.gmail.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <CAGsJ_4y7V40CnTTh=84=Ek6T3tPTyLXsUtgO81O1zyZpmQcbug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 08/09/26 3:03 am, Barry Song wrote:
> On Mon, Sep 7, 2026 at 1:38 PM Dev Jain <dev.jain@arm.com> wrote:
>>
>>
>>
>> On 05/09/26 4:12 pm, Barry Song wrote:
>>> On Tue, Sep 1, 2026 at 1:44 PM Dev Jain <dev.jain@arm.com> wrote:
>>>>
>>>> In preparation for adding a helper to set softleaf ptes in one go,
>>>> generalize the swap entry helpers shifting the swap offset by delta,
>>>> for softleaves.
>>>>
>>>> Note that the soft-dirty bit, exclusive bit and uffd bit preservation
>>>> will still work for non-swap softleaves, since a softleaf entry is
>>>> constructed out of a type and offset, and those bits are ahead of
>>>> the soft-dirty, exclusive and uffd bits.
>>>>
>>>> For example, for a migration entry, pte_swp_exclusive() will return
>>>> false, as the exclusivity is encoded in the type itself
>>>> (SOFTLEAF_MIGRATION_READ_EXCLUSIVE).
>>>
>>> I don't quite understand why you mention this. Is anyone calling
>>> `pte_swp_exclusive()` on a migration entry? Shouldn't it only be called
>>> when `softleaf_is_swap()` is true?
>>
>> You are right. I just wanted to emphasize the second paragraph - that the
>> pte_move_swp_offset will also work for softleaf entries. But I think
>> the third para confuses more, I'll drop it.
> 
> I would rather interpret this as meaning that
> `pte_move_softleaf_offset` will also work for swap softleafs,
> since `pte_move_softleaf_offset` will call some pure-swap
> functions？

Yes, so if you see remove_migration_pte, there pte_swp_uffd and
pte_swp_soft_dirty are being used. Same with restore_exclusive_pte
(for device-exclusive stuff).

Which means that pte_swp_exclusive is the only one being used
*only* for swap entries.


> 
> Would it be possible to use `if (softleaf_is_swap())` for
> these cases to make the intent clearer? or we can
> keep both pte_move_softleaf_offset and pte_move_swap_offset?

So in my patch I can do

if (softleaf_is_swap(entry) && pte_swp_exclusive(pte))

That would make the intent clear.


> 
> As `pte_move_softleaf_offset()` is getting a bit weird now,
> a generic softleaf function has a lot of swap-specific code in it:
> 
> static inline pte_t pte_move_softleaf_offset(pte_t pte, long delta)
> {
>         const softleaf_t entry = softleaf_from_pte(pte);
>         pte_t new = __swp_entry_to_pte(__swp_entry(swp_type(entry),
>                                                    (swp_offset(entry)
> + delta)));
> 
>         if (pte_swp_soft_dirty(pte))
>                 new = pte_swp_mksoft_dirty(new);
>         if (pte_swp_exclusive(pte))
>                 new = pte_swp_mkexclusive(new);
>         if (pte_swp_uffd(pte))
>                 new = pte_swp_mkuffd(new);
> 
>         return new;
> }
> 
> Am I missing something here?
> 
>>
>>>
>>>>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>
>>> Reviewed-by: Barry Song <baohua@kernel.org>
>>
>> Thanks.
>>
>>
>>>
>>>> ---
>>>>  mm/internal.h | 29 +++++++++++++++--------------
>>>>  mm/memory.c   |  4 ++--
>>>>  2 files changed, 17 insertions(+), 16 deletions(-)
>>>>
>>> [...]
>>>>
>>>>  /**
>>>> @@ -523,7 +524,7 @@ static inline pte_t pte_next_swp_offset(pte_t pte)
>>>>   */
>>>>  static inline int swap_pte_batch(pte_t *start_ptep, int max_nr, pte_t pte)
>>>>  {
>>>
>>> We might find a user for this in the future, in which case we might
>>> want to rename `swap_pte_batch()` to `swap_softleaf_batch()`?
>>
>> That is what is being done here:
>> https://lore.kernel.org/all/20260813-migrate-rmap-batch-v2-1-3c5424c555c7@amd.com/
>>
>> I don't have a strong opinion, I can also generalize this right now.
> 
> I don't know how you and Shivank are collaborating,
> since you're both changing the same thing at the same time :-)

We are not collaborating really : ) he should have ideally waited
for my patchset to go in first since I was doing big changes in
rmap.c.


> 
> Hopefully, we can get one of yours into mm-new first,
> and the other one can find a way to resolve the conflicts.

Yes.


> 
>>
>>
>>>
>>>> -       pte_t expected_pte = pte_next_swp_offset(pte);
>>>> +       pte_t expected_pte = pte_next_softleaf_offset(pte);
>>>
> 
> Best Regards
> Barry

