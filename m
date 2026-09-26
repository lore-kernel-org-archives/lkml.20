Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D722C227EA7
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790415059; cv=none; b=KoaeU9vkSwtMuF7Lr30l3Uvf/kb8UwBUdjs42b2NYOKpNZCcW++p+ep0+ZaWCm5Fzc+PHlvE9YU1HMlFRr90UFWX9fJ8fy77E+2vUtnYEpcnTUcz3dAk57DZmS6w6A0+7own+6SU9sbvRObaaIKUXcsFI9Lij5bawssHxtZmSoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790415059; c=relaxed/simple;
	bh=WJW3baE+I377sZth6wQMrQqc7f7CCCwK3uLQycfmMv4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OZhaA3W4eFtj//RSx/5VmIlIRuH+p/y2uYR+auo58mqHHv77+KNhA45OTY6E/lo+T3O2Dkn0qjpRz+M+6PVc4B01h5cqdru582kREdarKKnd3hUDwX/7FrVmmhWld2AQ9iIxfzHqEC6PyMniSOxIJWvJgOv/IQmg0+CdapuOTXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rIsAUDh1; arc=none smtp.client-ip=209.85.218.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rIsAUDh1"
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c2945f5e851so123951066b.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 02:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790415056; x=1791019856; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qPPM7SXCBhuzMJBn4w/Iue6D6iAI4Dgq9juqp97Dizc=;
        b=rIsAUDh1+mC0pW+nhplj8B3/y7WwyqSYjT4LT0vhbMzUb2uNP4NXVzW5dwE1tjih4k
         4BO7J4pPP4wi0BLXraC+eVYuwevIZSFVSw6AdsOZ2re9xeRMOCyTy4zMWBVYfigcUNYi
         tGd/n2ebeMo/yiCEIZpvOFeWWig3UyWvf06v7bK1bjuc+SG0MaydbsL95k3Wxbs8bzxM
         2k/YoQl+qYVreah6RcUgDnUcyDgsbuAsEELdcUc+HkPA/IqOmwVtGu4eq2bf21vTveXu
         Emdy02s5Dy7EBp3Y7Hs9uLoGrJ96nzBB7xnRJSIBBHEx2S+hllmf/yAiYDge8iTjRyRh
         0Ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790415056; x=1791019856;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPPM7SXCBhuzMJBn4w/Iue6D6iAI4Dgq9juqp97Dizc=;
        b=gfC37/MtPEjuTpjmkCL2h5yOIyFm74AzXa75WyfZndVyPdLBu96edGlNHS4OBtcNid
         L6xaFdGT7SYoSu1ZEigEr/HXKlgioXz06SUT6QXob/thzVx4MQxbI6YkZL7mL5V68weg
         eT85oHPA8woiwR2wIJglF7KnMm1IklxYi9gSfvu25Xk6fpngVRM2JCf5MfZM6moF8zaF
         SqFRBfy2bl1opN8t7SSUS7kfN792ARkLZdainpKWIKTF2ZpXk5Ku+qFQktKVvzi/wQnw
         lL8F3HDjVTo3WPtczbfc8cowNo2pT2Z9oRwx/CwCdZVBXd8fFFjLYKdhjaScOb3BPzVP
         5MAA==
X-Forwarded-Encrypted: i=1; AKwUvBzUlbKFbs+331tGidCcHU3dPCDVAGV7xpHLL2sShJw5xiuz6Mqx36BAQd76iu/3W9CiFEJULAVWzcMkEEQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nC75TLJyZSeskrcDxW0xAZZnTEwat+eTrPJz12WSC4H/pt9U9j
	hnOf4n7CAdvSBznnGOhBoPBt/5HLK6IwDd/zDycUpDtLdHYF7EGZS292RJv7xcntnhTzHTrEk5s
	VzwtbsU81PxNxj72+PQ==
X-Received: from ejiv7.prod.google.com ([2002:a17:906:2f07:b0:c2a:bb40:5656])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3f19:b0:c29:3c21:ee69 with SMTP id a640c23a62f3a-c2ae9f3157dmr395838166b.23.1790415055784;
 Sat, 26 Sep 2026 02:30:55 -0700 (PDT)
Date: Sat, 26 Sep 2026 09:30:55 +0000
In-Reply-To: <2vxzwlsj5r83.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260918002239.4024231-1-tarunsahu@google.com> <2vxzwlsj5r83.fsf@kernel.org>
Message-ID: <9huzh5jcnyuo.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v2 1/2] memblock: drop for_each_memblock_type() and open
 code its users
From: tarunsahu@google.com
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	dmatlack@google.com, Mike Rapoport <rppt@kernel.org>, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dev.jain@arm.com, 
	Pratyush Yadav <pratyush@kernel.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Pratyush Yadav <pratyush@kernel.org> writes:

> On Fri, Sep 18 2026, Tarun Sahu wrote:
>
>> for_each_memblock_type() always starts the iteration at index 0 and its
>> body is a trivial 'for' loop, so it hides very little. It also gets in
>> the way of iterating from an arbitrary index, which the next patch
>> needs.
>>
>> Remove the macro and open code its three users: memblock_add_range(),
>> memblock_isolate_range() and memblock_dump(). While at it, move the
>> region pointer into the loop body scope.
>>
>> No functional change.
>>
>> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
>> ---
>>  mm/memblock.c | 14 ++++++--------
>>  1 file changed, 6 insertions(+), 8 deletions(-)
>>
>> diff --git a/mm/memblock.c b/mm/memblock.c
>> index 9ce86349a29f..5aae75d34dec 100644
>> --- a/mm/memblock.c
>> +++ b/mm/memblock.c
>> @@ -155,11 +155,6 @@ struct memblock_type physmem = {
>>   */
>>  static __refdata struct memblock_type *memblock_memory = &memblock.memory;
>>  
>> -#define for_each_memblock_type(i, memblock_type, rgn)			\
>> -	for (i = 0, rgn = &memblock_type->regions[0];			\
>> -	     i < memblock_type->cnt;					\
>> -	     i++, rgn = &memblock_type->regions[i])
>> -
>>  #define memblock_dbg(fmt, ...)						\
>>  	do {								\
>>  		if (memblock_debug)					\
>> @@ -651,7 +646,8 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
>>  	base = obase;
>>  	nr_new = 0;
>>  
>> -	for_each_memblock_type(idx, type, rgn) {
>> +	for (idx = 0; idx < type->cnt; idx++) {
>> +		rgn = &type->regions[idx];
>
> Nit: this is really odd to read. You assign rgn and then declare rbase
> and rend. Doesn't checkpatch complain?

I kept it there to minimize the changes in the patch as the variable was
already defined there. and unfortunately, checkpatch did not throw any error.

Regrardless, Good idea. I updated in v3 here:
https://lore.kernel.org/all/20260926092448.4090401-1-tarunsahu@google.com/

>
> Regardless, I reckon it would be a lot nicer to read of you move the
> declaration of rgn into the loop. Same for the others below.
>
> LGTM otherwise, so after fixing this up, feel free to add:
>
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

Done! Thanks for reviewing it.

>
>>  		phys_addr_t rbase = rgn->base;
>>  		phys_addr_t rend = rbase + rgn->size;
>>  
>> @@ -827,7 +823,8 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
>>  		if (memblock_double_array(type, base, size) < 0)
>>  			return -ENOMEM;
>>  
>> -	for_each_memblock_type(idx, type, rgn) {
>> +	for (idx = 0; idx < type->cnt; idx++) {
>> +		rgn = &type->regions[idx];
>>  		phys_addr_t rbase = rgn->base;
>>  		phys_addr_t rend = rbase + rgn->size;
>>  
>> @@ -2198,7 +2195,8 @@ static void __init_memblock memblock_dump(struct memblock_type *type)
>>  
>>  	pr_info(" %s.cnt  = 0x%lx\n", type->name, type->cnt);
>>  
>> -	for_each_memblock_type(idx, type, rgn) {
>> +	for (idx = 0; idx < type->cnt; idx++) {
>> +		rgn = &type->regions[idx];
>>  		char nid_buf[32] = "";
>>  
>>  		base = rgn->base;
>
> -- 
> Regards,
> Pratyush Yadav
