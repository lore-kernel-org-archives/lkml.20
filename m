Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46913A4F2F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787818160; cv=none; b=CqaDuLjkvTmO9E+8xop1vTZsgxwqg0UyKCWD/WTkKlEpqiXni/bv2Maqhv+Sv1FWQ2wnz4AehGmNBvmc7d39shno+/Iv7zjtjEYhwU7YiBT/YAH+JTxMi3ITiG25bJC9ptfA8oWS7OMzqXLQMsjTRKoRKwVb9jOPkW0QAR6aOaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787818160; c=relaxed/simple;
	bh=6N5LVLB8pq7gWLj75mkQnS0nglqmTh9dzOXW63qBmlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CUxWE+elR2FixY0TUy0lD/DI+ZkZsBe+52HudN5ZgYzuHsssIWsOx5vlSu1UuME0Y3TOneyrQwMQzatIUKBhUtbCbe1hobWH3dtDUp3NLRIquxpSZHif70nR3Y9vRHf/RgB7tvebyisQKAy2IzgzLjt5LMZykG4MRJNGUFkaFBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dCNPHNlJ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCNPHNlJ"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2544ff970dso38845466b.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787818154; x=1788422954; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sL2OyFqHiwHA+nDxyBcNBcYoIZso16H9hpW7CuWjgtQ=;
        b=dCNPHNlJrJuD4Ybo6eIGyO6SgR7bWnt9JXfAantJW7M1XxBIbskQyXpLqeQaHywrKc
         5yZwc0Ihn7poffpSPpsJlxaRqIH/Z2/JPkB/cLQruq9SO92nNF0bIkgy8guXEl4Gz1SR
         NQhHTR4SZC4BbqX8sp37Y61P/SMNMqc5GfiA09GFc+a4kW0JjJgnRfs/N9wsV+BJYAGh
         EPgX4uBZoxJBRB4HvHC3M00LC5rq0+pCJ0FJA5Ygc4b/Q6/gGjupTlXXLyCDU+KfrL7U
         8FVA25m1SBZQJB5TZJ9EC2Qs0AA8LtzGFlcmcEaY7Q0E7PdGLcXg97VNIj8dudY2XSm6
         7xpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787818154; x=1788422954;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sL2OyFqHiwHA+nDxyBcNBcYoIZso16H9hpW7CuWjgtQ=;
        b=NwjMHsgh2m7fvMcocnTaFszM8kpi5Yhe8KcSIGI175aIdlXHMvHzM+37vfsfH/XRlq
         5rw+G26UpjOarIw98DQHzot36AaMw+iqwerx/H4lpTrgWvIaq72qkeR7PE7xwEJ9sx2l
         2z4+4xodSgOJky5ikxpIn3l2PZvLgg3iMWhmiCZRSfPvmftKucws4b/ZsSpTjNCQsO32
         3chYl0HRmqy2e03iBq/TvBE8fNb7YO7pG7CEF821KK0rLhSbx2cRA+vypHakrgN+WqhC
         PaDZzKrf4vy1A87xYCmR9OGeBoiGa/p41PgYp9xncd4IyuPrsQW7yw5tNcEIGuX8PLxa
         9H7A==
X-Forwarded-Encrypted: i=1; AHgh+Rol20ML8Ai7EloL7ZCh5rUk2kE8lXc4B4LNXhBPpzDlSXgAyhg8drWINchGqK88QjPezW+W+lceNkEE9r8=@vger.kernel.org
X-Gm-Message-State: AFuF++noRvCXdSi437VSaFBeETL0VDHrDrnTe7F7boPgblrUoWuHXk9Q
	VM45BL8NNejeqozeEJ8MSrAZzHjZ15I8eBTuMHnJjRyRUlo9dyfg1QfR
X-Gm-Gg: AR+sD11fqYs5hvetFj5x7vGzOofwrxg1tLElrXYSmoLeVsonsmJdb+1cJmIw/BrDfbo
	IPv4y5aUELZ2o12FX/tVmw8y6ul+58lpM9pCxrwMLPweUDr/PhleO6y2XXq7NtGF2pa2IG++cTp
	B9im+fBcBqV6fhjzWn+5fvF0n3VgyAlxnPThcm8f1GLzIbcE1/kq+TM0p+asjYz0uzqzuSlQpep
	E8vdUICwUXvZss6LcK8UbGAtp1Z+J9DyEqIkjKlujoF/v9f4hlvpGmiq5ybA3pZi8WUh/PHlNdC
	8f78534kOhJCb8i7Y+e4+xUumoK02NRLmeLGRSwbLob1ARlRDVyEsMnDWO0xqMvnsy6eRDKtz/g
	JTOBziLvJhiCycA7xYOdbXJjbdXyH6FlJxvEx/WwCOMsCVaePVOjgV407KjV1EhoSOd2ISz10nc
	jNRSzOi7eKJKTCVkE+57Eg9ehZyZYQ5bPpZUfL/YareBD/IkhomAjNRL5ats0=
X-Received: by 2002:a17:907:1b0a:b0:c20:f529:2d6a with SMTP id a640c23a62f3a-c250c37f351mr1488301066b.22.1787818153321;
        Thu, 27 Aug 2026 01:09:13 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d68desm1033042766b.10.2026.08.27.01.09.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Aug 2026 01:09:12 -0700 (PDT)
Date: Thu, 27 Aug 2026 08:09:12 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org,
	david@kernel.org, ljs@kernel.org, liam@infradead.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	brendan.jackman@linux.dev, hannes@cmpxchg.org, ziy@nvidia.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: remove out-dated document of __GFP_NOFAIL
Message-ID: <20260827080912.3qh75gqhzkoe6ghb@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20260827030548.16631-1-richard.weiyang@gmail.com>
 <cbc344a4-77b7-4282-9bdd-004822642ab5@kernel.org>
 <20260827074921.mracnqv2m2cugasb@master>
 <78561ffa-d075-4570-aaed-60744f11160f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78561ffa-d075-4570-aaed-60744f11160f@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)

On Thu, Aug 27, 2026 at 10:03:41AM +0200, Vlastimil Babka (SUSE) wrote:
>On 8/27/26 9:49 AM, Wei Yang wrote:
>> On Thu, Aug 27, 2026 at 09:35:26AM +0200, Vlastimil Babka (SUSE) wrote:
>>> On 8/27/26 5:05 AM, Wei Yang wrote:
>>>> Commit ee040cbd6e48 ("mm/page_alloc: don't warn about large allocations
>>>> with __GFP_NOFAIL") remove a warning on allocating large folio with
>>>> __GFP_NOFAIL, which is adjusted by commit 903edea6c53f ("mm: warn about
>>>> illegal __GFP_NOFAIL usage in a more appropriate location and manner").
>>>
>>> "which is adjusted by commit" sounds as 903edea6c53f came later than
>>> ee040cbd6e48, but it's the opposite. Maybe say "which was placed there"?
>>>
>> 
>> Got it.
>> 
>>>> While in that commit, it also documented this behavior which is
>>>> out-dated now.
>>>>
>>>> Adjust the document to align to current code, and adjust the comment
>>>> while at it.
>>>>
>>>> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
>>>> Cc: Baokun Li <libaokun1@huawei.com>
>>>> ---
>>>>  include/linux/gfp_types.h | 2 --
>>>>  mm/page_alloc.c           | 2 +-
>>>>  2 files changed, 1 insertion(+), 3 deletions(-)
>>>>
>>>> diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
>>>> index 190191411009..24fde8eb73df 100644
>>>> --- a/include/linux/gfp_types.h
>>>> +++ b/include/linux/gfp_types.h
>>>> @@ -243,8 +243,6 @@ enum {
>>>>   * used only when there is no reasonable failure policy) but it is
>>>>   * definitely preferable to use the flag rather than opencode endless
>>>>   * loop around allocator.
>>>> - * Allocating pages from the buddy with __GFP_NOFAIL and order > 1 is
>>>> - * not supported. Please consider using kvmalloc() instead.
>>>
>>> I'm not sure if we want to simply remove the lines, or rather say it's
>>> discouraged (instead of not supported) and still suggest kvmalloc() if
>>> possible.
>>>
>> 
>> Reasonable.
>> 
>> As mentioned in [1], kvmalloc() maybe not suitable for some cases, I would
>> suggest below change.
>> 
>>  * Allocating pages from the buddy with __GFP_NOFAIL and order > 1 is
>>  * discouraged. Please consider using kvmalloc() instead if possible.
>
>Yeah that's great! Thanks.
>

Thanks, I will wait a while for other comment before sending v2.

>> Or, you prefer only s/supported/discouraged/ ?
>> 
>> [1]: https://lore.kernel.org/all/aQTHMI3t5mNXp0M1@casper.infradead.org
>> 
>>>>   */
>>>>  #define __GFP_IO	((__force gfp_t)___GFP_IO)
>>>>  #define __GFP_FS	((__force gfp_t)___GFP_FS)
>>>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>>>> index ab385bc252cc..146f7e0a9462 100644
>>>> --- a/mm/page_alloc.c
>>>> +++ b/mm/page_alloc.c
>>>> @@ -4804,7 +4804,7 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int order,
>>>>  
>>>>  	if (unlikely(nofail)) {
>>>>  		/*
>>>> -		 * Also we don't support __GFP_NOFAIL without __GFP_DIRECT_RECLAIM,
>>>> +		 * We don't support __GFP_NOFAIL without __GFP_DIRECT_RECLAIM,
>>>>  		 * otherwise, we may result in lockup.
>>>>  		 */
>>>>  		WARN_ON_ONCE(!can_direct_reclaim);
>> 

-- 
Wei Yang
Help you, Help me
