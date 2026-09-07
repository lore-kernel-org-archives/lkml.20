Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D03382374
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 05:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788759524; cv=none; b=TUrV0kXjXcetL4SOrnHf+7YS/QGNJ34dFWaXPqVzm86wERj2z7V3pOMLzhKtJo9oV7dD+QtXbnYSDvr9t9uF3LjZ91JP9DawzctGLT6Bo0Cu2alGw6qcxHPaHaukXTirkHglJWzdkaKCr+87zTkKaDkin3Js8KIFM+bEserbewY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788759524; c=relaxed/simple;
	bh=MkB23r4IshMaLslpYaUeiocUPY8Zusw8p75PzrXbS64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BTMYbg7Jr3y74r+BzuCRtY4/FXBByHB1u8bFjgFTUh6ZVZrUYAIZzA6tdt3/LoD1eofQGqjjLSqsmRRwo+RhISv9RBDr2sKTUmfF1wB0jIivbOv/iTtYEgtK8snOwDxpbvBLbk8qVULK7pgQc6oah70lCW7aE8UJxM228qIs10Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Xe1VRFld; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Xe1VRFld"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79AE81477;
	Sun,  6 Sep 2026 22:38:36 -0700 (PDT)
Received: from [10.164.19.55] (unknown [10.164.19.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A0B73F7B4;
	Sun,  6 Sep 2026 22:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788759520; bh=MkB23r4IshMaLslpYaUeiocUPY8Zusw8p75PzrXbS64=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xe1VRFldIAz//b+Qnx8IF7QSBg1x6cwQvY0Uf0DmMQJs5x0znk3lcV/ibVWVlT+ZS
	 lKBdaP3DKAY+W+Wji3qSZQLUsdxuEb6gWeOd0RBML5tOuNhr8VhKw/xBfPkepnTt9N
	 fHJd92x/O/d4hd/3te19hExLk6a19mtAr/4/pleo=
Message-ID: <12efdc7f-ff82-412b-b79d-bff211d34218@arm.com>
Date: Mon, 7 Sep 2026 11:08:30 +0530
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
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <CAGsJ_4yigbhqkrnufJKC2+rW7StraQvD0gr=4HQkTjKGQ9siGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 05/09/26 4:12 pm, Barry Song wrote:
> On Tue, Sep 1, 2026 at 1:44 PM Dev Jain <dev.jain@arm.com> wrote:
>>
>> In preparation for adding a helper to set softleaf ptes in one go,
>> generalize the swap entry helpers shifting the swap offset by delta,
>> for softleaves.
>>
>> Note that the soft-dirty bit, exclusive bit and uffd bit preservation
>> will still work for non-swap softleaves, since a softleaf entry is
>> constructed out of a type and offset, and those bits are ahead of
>> the soft-dirty, exclusive and uffd bits.
>>
>> For example, for a migration entry, pte_swp_exclusive() will return
>> false, as the exclusivity is encoded in the type itself
>> (SOFTLEAF_MIGRATION_READ_EXCLUSIVE).
> 
> I don't quite understand why you mention this. Is anyone calling
> `pte_swp_exclusive()` on a migration entry? Shouldn't it only be called
> when `softleaf_is_swap()` is true?

You are right. I just wanted to emphasize the second paragraph - that the
pte_move_swp_offset will also work for softleaf entries. But I think
the third para confuses more, I'll drop it.

> 
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
> 
> Reviewed-by: Barry Song <baohua@kernel.org>

Thanks.


> 
>> ---
>>  mm/internal.h | 29 +++++++++++++++--------------
>>  mm/memory.c   |  4 ++--
>>  2 files changed, 17 insertions(+), 16 deletions(-)
>>
> [...]
>>
>>  /**
>> @@ -523,7 +524,7 @@ static inline pte_t pte_next_swp_offset(pte_t pte)
>>   */
>>  static inline int swap_pte_batch(pte_t *start_ptep, int max_nr, pte_t pte)
>>  {
> 
> We might find a user for this in the future, in which case we might
> want to rename `swap_pte_batch()` to `swap_softleaf_batch()`?

That is what is being done here:
https://lore.kernel.org/all/20260813-migrate-rmap-batch-v2-1-3c5424c555c7@amd.com/

I don't have a strong opinion, I can also generalize this right now.


> 
>> -       pte_t expected_pte = pte_next_swp_offset(pte);
>> +       pte_t expected_pte = pte_next_softleaf_offset(pte);
> 
> Best Regards
> Barry

