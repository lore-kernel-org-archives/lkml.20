Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651291;
	b=SJbegkdLdZCX+/U0IvmZrBfa3t92cQxAjNwCVAIwZ1TF2FL3GxZh0eVcnXlApv9taNXW
	 Jn7lvESlvhnXOJs+vM8P9YxT9SFEtEjFB049vurm5oSYjGX1AgwFMcOWARBDhoiUbgzuj
	 Qrt072zdMFKb7fGumEInwib6M/ey4hKc9ZDISfF3RAQb6f3jNUTXpq6dsCzPpnF96NDNs
	 8UG52PqJ8QFaL5u1ihAKhS48HXBEltVcuWAaeD90QQf8sNHbAz7SN9WePCUdCFgGhQNgp
	 b/1tQmRtJV7t/HZxD9ekDcrHg9lo/lJejtJRR2AswT6P22FeYNSDEz98gPuaV8l0yYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651291;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Oomb1UC4+J7/JXIq7MZuRh69ueKVTwJKjBpxLuJuCOU=;
	b=2TureHVCrJxAVqMHg8N9wpycmS+fsOkw/5EnUdcqVsPV6xKvckxmsKp29mDTc/qBpGDt
	 g06g0VR7E+rnSoLR/bOx5b66Np/V83A9e8rSybUsrso0QvbThx54bzTHh0iOd/3LL/ktb
	 b9HhMIq8t/yWKPHc7HCZ3btTHQCXYz9D6YovvDjnem28dQF982+5WVn0Rmq10PNSEEaGB
	 LCxK6DyInZO/O6SQZ3NpdjmwTVDMmdScFB/S8gYouuVpiz5IhS/4m5GiE4uu6vkN30q3w
	 QEYzKvvfmyFm07EuYAVykIbyc2Ci1nc3F1F1FO3dttscKsByODNUAYcfSdmSbnGi/Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qdguq5E8;
	arc=none smtp.remote-ip=95.215.58.72
Received: from mta1.migadu.com (out-72.mta1.migadu.com [95.215.58.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC846606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC846606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qdguq5E8
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=z0k70oB6eYWMzSZVpd6lStsINTKiyAgBeVketd5m+rM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792651288; v=1; x=1793256088;
 b=qdguq5E8NQqyfAYGJ3rmQDBG02pfEhEeNptF4R6J7JqCC8ipibwWeQAlDeJyFc5Q5P2oagmc
 UPFJeNNyDlwnBirAaUsHnLVX4X709D3np1GkMXNp8VO7wZb9YV03s2U2ftyI7yDBIjMRPV+ycNQ
 iP1YVelePly5Ra9JH9W6Q9f0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 38152b391e1a13e3;
	Thu, 22 Oct 2026 06:41:28 +0000
X-Mizu-Trace-ID: 38152b391e1a13e3
X-Migadu-Flow: FLOW_OUT
Message-ID: <813b3f19-1cfc-4d07-a9b8-ea20f8fb0bee@linux.dev>
Date: Thu, 22 Oct 2026 14:41:13 +0800
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
Subject: Re: [PATCH mm-new] mm/mglru: clarify the generation placement in
 lru_gen_folio_seq()
To: wangzicheng@honor.com
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Kairui Song <kasong@tencent.com>,
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
 Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
References: <20261020023548.3242028-1-ridong.chen@linux.dev>
 <179257189711.741142.157439930403322311.b4-reply@b4>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <179257189711.741142.157439930403322311.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/21/2026 4:38 PM, wangzicheng@honor.com wrote:
> On 2026-10-20 10:35 +0800, Ridong Chen wrote:
>> From: Ridong Chen <chenridong@xiaomi.com>
>>
>> lru_gen_folio_seq() computes how many generations below max_seq a
>> folio should be added to, but stores it in a variable named "gen".
>> Elsewhere in MGLRU "gen" means an index into lrugen->folios[], i.e.
>> seq % MAX_NR_GENS, so reusing the name for a relative offset is
>> confusing.
>>
>> The comment table above the code also no longer matches it. It only
>> covers the PG_active and the final branch, leaving out the reclaiming
>> and "can't evict yet" cases, and it lists LRU_REFS_FLAGS as an input
>> although lru_gen_folio_seq() never looks at it.
>>
>> Rename the local variable to "age", redraw the table so that each
>> branch maps to the age and seq it produces, and note that the result
>> is clamped to min_seq[type].
>>
>> No functional change.
>>
>> Assisted-by: LLM
>> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
>> ---
>>   include/linux/mm_inline.h | 48 ++++++++++++++++++++++++++-------------
>>   1 file changed, 32 insertions(+), 16 deletions(-)
>>
>> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
>> index ab69b9930893..a933d8c14558 100644
>> --- a/include/linux/mm_inline.h
>> +++ b/include/linux/mm_inline.h
>> @@ -302,34 +302,50 @@ static inline unsigned long lru_gen_folio_seq(const struct lruvec *lruvec,
>>   					      const struct folio *folio,
>>   					      bool reclaiming)
>>   {
>> -	int gen;
>> +	int age;
>>   	int type = folio_is_file_lru(folio);
>>   	const struct lru_gen_folio *lrugen = &lruvec->lrugen;
>>   
>>   	/*
>> -	 * +-----------------------------------+-----------------------------------+
>> -	 * | Accessed through page tables and  | Accessed through file descriptors |
>> -	 * | promoted by folio_update_gen()    | and protected by folio_inc_gen()  |
>> -	 * +-----------------------------------+-----------------------------------+
>> -	 * | PG_active (set while isolated)    |                                   |
>> -	 * +-----------------+-----------------+-----------------+-----------------+
>> -	 * |  PG_workingset  |  PG_referenced  |  PG_workingset  |  LRU_REFS_FLAGS |
>> -	 * +-----------------------------------+-----------------------------------+
>> -	 * |<---------- MIN_NR_GENS ---------->|                                   |
>> -	 * |<---------------------------- MAX_NR_GENS ---------------------------->|
>> +	 *            +-----------------+-----------------+-----------------+-----------------+
>> +	 * age        |        1        |        2        |        3        |        4        |
> Hi Ridong,
>    
> Agreed, I also found this part confusing.
> 
> One problem with the new name: in MGLRU a larger seq/gen means a
> younger generation, but a larger age means an older one, so every
> read needs a flip (max_seq - age + 1). Assigning the seq directly in
> each branch might read more naturally.
> 

Hi Zicheng,

Thank you for your reply. We both agree that this part of the code is confusing. 
'age' is not perfect, but it is much better. The bigger the age, the elder it 
is, just like human age. And it is a local variable, not used elsewhere, so it 
is fine for me.

> Also, both tables run past 80 columns (~95 for the art in mglru-fg
> 4/17, ~96 for the redrawn one here, tab as 8). Would you consider
> something vertical and shorter? I had prepared a comment for
> mglru-fg, and since this is being discussed here too, here it is
> (conditions are per mglru-fg, where the flags became the refs
> count):
> 
>      /*
>          * The seq is clamped to min_seq[type]:
>          *
>          *   destination     | folio state
>          *   ----------------+--------------------------------------------
>          *   youngest        | PG_active, refs >= LRU_REFS_WORKINGSET
>          *   (max_seq)       |
>          *
>          *   2nd youngest    | PG_active, refs < LRU_REFS_WORKINGSET
>          *   (max_seq - 1)   | anon folio not yet in swapcache
>          *                   | PG_reclaim folio, dirty or under writeback
>          *
>          *   2nd oldest      | refs >= LRU_REFS_WORKINGSET
>          *   (max_seq - 2)   |
>          *
>          *   oldest          | reclaiming
>          *   (min_seq[type]) | otherwise: refs < LRU_REFS_WORKINGSET
>          */
> 
> With a comment like this, developers can see the generation
> placement directly, instead of working it out from the code.
> 

Thanks for the table,

As Kairui replied, he did not want more code details in the comment, which may 
change a lot. And Kairui will pick this patch with his FG series. Although I 
wanted to add the table, Kairui felt there shouldn't be too much detail.

What is more, I think the following is needed—it is what this function initially 
implemented.

+-----------------------------------+-----------------------------------+
| Accessed through page tables and  | Accessed through file descriptors |
| promoted by folio_update_gen()    | and protected by folio_inc_gen()  |
+-----------------+-----------------+-----------------+-----------------+

> Best,
> Zicheng
> 
> 
>> +	 *            +-----------------+-----------------+-----------------+-----------------+
>> +	 * seq        |     max_seq     |    max_seq-1    |    max_seq-2    |    max_seq-3    |
>> +	 *            +-----------------------------------+-----------------------------------+
>> +	 *            |<---------- MIN_NR_GENS ---------->|                                   |
>> +	 *            |<---------------------------- MAX_NR_GENS ---------------------------->|
>> +	 *            +-----------------------------------+-----------------------------------+
>> +	 *            | Accessed through page tables and  | Accessed through file descriptors |
>> +	 *            | promoted by folio_update_gen()    | and protected by folio_inc_gen()  |
>> +	 *            +-----------------+-----------------+-----------------+-----------------+
>> +	 * PG_active  |  PG_workingset  | !PG_workingset  |                 |                 |
>> +	 *            +-----------------+-----------------+-----------------+-----------------+
>> +	 * reclaiming |                 |                 |                 |     always      |
>> +	 *            +-----------------+-----------------+-----------------+-----------------+
>> +	 * can't      |                 |  anon && not in |                 |                 |
>> +	 * evict yet  |                 |  swapcache, or  |                 |                 |
>> +	 *            |                 |  PG_reclaim &&  |                 |                 |
>> +	 *            |                 | dirty/writeback |                 |                 |
>> +	 *            +-----------------+-----------------+-----------------+-----------------+
>> +	 * else       |                 |                 |  PG_workingset  | !PG_workingset  |
>> +	 *            |                 |                 |       or        |       &&        |
>> +	 *            |                 |                 |  PG_referenced  | !PG_referenced  |
>> +	 *            +-----------------+-----------------+-----------------+-----------------+
>> +	 *
>> +	 * The resulting seq is clamped to min_seq[type].
>>   	 */
>>   	if (folio_test_active(folio))
>> -		gen = MIN_NR_GENS - folio_test_workingset(folio);
>> +		age = MIN_NR_GENS - folio_test_workingset(folio);
>>   	else if (reclaiming)
>> -		gen = MAX_NR_GENS;
>> +		age = MAX_NR_GENS;
>>   	else if ((!folio_is_file_lru(folio) && !folio_test_swapcache(folio)) ||
>>   		 (folio_test_reclaim(folio) &&
>>   		  (folio_test_dirty(folio) || folio_test_writeback(folio))))
>> -		gen = MIN_NR_GENS;
>> +		age = MIN_NR_GENS;
>>   	else
>> -		gen = MAX_NR_GENS - (folio_test_workingset(folio) || folio_test_referenced(folio));
>> +		age = MAX_NR_GENS - (folio_test_workingset(folio) || folio_test_referenced(folio));
>>   
>> -	return max(READ_ONCE(lrugen->max_seq) - gen + 1, READ_ONCE(lrugen->min_seq[type]));
>> +	return max(READ_ONCE(lrugen->max_seq) - age + 1, READ_ONCE(lrugen->min_seq[type]));
>>   }
>>   
>>   static inline bool lru_gen_add_folio(struct lruvec *lruvec, struct folio *folio, bool reclaiming)
>> -- 
>> 2.34.1
>>
>>
> 

-- 
Best regards
Ridong

