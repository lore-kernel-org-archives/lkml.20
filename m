Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE2C4F93A8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904730; cv=none; b=IkZRplpQdrSeG+dz9o05sZweKy8Y8kI6iB97Av6USK03QF35pHr1YW336f1psbf4utxakPma0stSgRzKBvRIAUduQUxsKVtZXz+afwqGs6WbxvUUkOiOxmriWOHkkEqcWi+MyxnLrDU+GHACpq7tzH0qDqwzOe9WU+dcajjYggo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904730; c=relaxed/simple;
	bh=bNEDE1SpAh2ejlUxlHk/QA/uYKxO1QleWjFdbi61d8A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RY/bygUCRXE4NPsaZ/CEBXxytnt515Im4Lx+hggqF08p29C0C++ikI26kXDFXfoz3bal9b4ywyLRGhqp3EnoOFYupTB1uc9jwg2g4GlS1HkSrNFN3Hni4KDHJvcCV8mu3wFUcqR8GbVZuKy909bE6CLlo+6tqAVGQ4xBwW4UUE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=apewYZUu; arc=none smtp.client-ip=209.85.208.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="apewYZUu"
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6a9b7e63963so3361798a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791904727; x=1792509527; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFCGbaDlX/AVQV6RAFUOj0q1sLZPldXZf8616wSFK2M=;
        b=apewYZUuklkSIvjK5JyX6ENHgr3aVyGkwD5MJpDyMADdnFU6RdvrjC+YAQao4ZH6Q6
         oz1zvYXdkMis2QCzV4P1/glbAKeuAdsqrNR+efAFg8Wuy+nrZezjVasicFEP8dkr8G/1
         v3/Gntd2zsZXrFTkdaqhyzorP7wJsC8sIUIi4MMcyMlQCd6VpsD71cMb417ikZamg2BR
         evyFW/rNHUYD63k8Fr/9Utir1sci2SdQD9Zp9Lcrum7IQgUFnWB2VD/VM74+cB0je74Q
         +s3IuzSUudbUwSufKfWeTOZuNqozewnCRhyK/lN1nkCxxp1HukYQWhEeqJN66Wwx1FtN
         Kafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904727; x=1792509527;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFCGbaDlX/AVQV6RAFUOj0q1sLZPldXZf8616wSFK2M=;
        b=Z3lDCng0i8myZ5IZh1gKGr/1DjuD9gffTlq+5GZia59jg7x2NtCdZUMN8wTeGeq7BA
         Dt+osLxCYqxpmxxbTkS3L+GjMsaNCpeiqU/eRnPXKj7xfJ954htcKA4wjTB2LcccHlmI
         7Vn2rF1R1jJDPuouYlmP49uPJXk3zD45zRK9U7Rtx+d5lzxE/DCHp9LvmCQJE6UXWQAF
         iZeuT1zNL24CLGvVLnLpFMwKaWKVsJMgMK0JLsUx6OO4yeR5XVjHv0daV3HB/ZAqxPjD
         f6Vj5BLBMEErrfhqvK9BrT6FrlPxO1apjYoqacQe912p6/rOWQMwVom5VY65waDN4pce
         V/0w==
X-Forwarded-Encrypted: i=1; AKwUvBx1SmZt4WuLHUF3ZjurIebkmqSIPwrgdYpe5SONVFvl1tUT5sdwLel83qahkFP1qVx+VSzd3sEOUaeJd44=@vger.kernel.org
X-Gm-Message-State: AFq9FYKP2GA79D/wb9VjftsarARVZWc/6WQ4VObU6jg+f/84nW3YkOvm
	e3poYvPPyWd5XYK66k9bF6DCFqmiWzXt+RUOJxBDkKa8LSRPaGnEPrwRkZTu+ZFtvAi2I1WZF13
	FLrNzRMMxJNslldQEEg==
X-Received: from edwl2.prod.google.com ([2002:a05:6402:1242:b0:6b1:a8d5:117d])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1ed4:b0:6b1:ba86:5f55 with SMTP id 4fb4d7f45d1cf-6b1ba86636dmr5678473a12.35.1791904726451;
 Tue, 13 Oct 2026 08:18:46 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:18:45 +0000
In-Reply-To: <as4EcgiBH5jjww42@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261008190828.3221718-1-tarunsahu@google.com> <as4EcgiBH5jjww42@kernel.org>
Message-ID: <9huzecdt633e.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v4 1/2] memblock: drop for_each_memblock_type() and open
 code its users
From: tarunsahu@google.com
To: Mike Rapoport <rppt@kernel.org>
Cc: dmatlack@google.com, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Pratyush Yadav <pratyush@kernel.org>, 
	kexec@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Mike Rapoport <rppt@kernel.org> writes:

> Hi Tarun,
>
> Please for the next time add the cover-letter when sending more than one
> patch.

Thanks Mike for piking up the patches.

Sure, I will take care of adding the cover-letter.

You had some nit change suggestion, Let me know if you want
me send v5 or it is alright.

~Tarun


>
> On Thu, Oct 08, 2026 at 07:08:27PM +0000, Tarun Sahu wrote:
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
>> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
>> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
>> ---
>>  mm/memblock.c | 17 ++++++-----------
>>  1 file changed, 6 insertions(+), 11 deletions(-)
>> 
>> diff --git a/mm/memblock.c b/mm/memblock.c
>> index f5aaa38cfa31..59dda7d085f3 100644
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
>> @@ -615,7 +610,6 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
>>  	phys_addr_t obase = base;
>>  	phys_addr_t end = base + memblock_cap_size(base, &size);
>>  	int idx, nr_new, start_rgn = -1, end_rgn;
>> -	struct memblock_region *rgn;
>>  
>>  	if (!size)
>>  		return 0;
>> @@ -651,7 +645,8 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
>>  	base = obase;
>>  	nr_new = 0;
>>  
>> -	for_each_memblock_type(idx, type, rgn) {
>> +	for (idx = 0; idx < type->cnt; idx++) {
>> +		struct memblock_region *rgn = &type->regions[idx];
>>  		phys_addr_t rbase = rgn->base;
>>  		phys_addr_t rend = rbase + rgn->size;
>>  
>> @@ -815,7 +810,6 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
>>  {
>>  	phys_addr_t end = base + memblock_cap_size(base, &size);
>>  	int idx;
>> -	struct memblock_region *rgn;
>>  
>>  	*start_rgn = *end_rgn = 0;
>>  
>> @@ -827,7 +821,8 @@ static int __init_memblock memblock_isolate_range(struct memblock_type *type,
>>  		if (memblock_double_array(type, base, size) < 0)
>>  			return -ENOMEM;
>>  
>> -	for_each_memblock_type(idx, type, rgn) {
>> +	for (idx = 0; idx < type->cnt; idx++) {
>> +		struct memblock_region *rgn = &type->regions[idx];
>>  		phys_addr_t rbase = rgn->base;
>>  		phys_addr_t rend = rbase + rgn->size;
>>  
>> @@ -2194,11 +2189,11 @@ static void __init_memblock memblock_dump(struct memblock_type *type)
>>  	phys_addr_t base, end, size;
>>  	enum memblock_flags flags;
>>  	int idx;
>> -	struct memblock_region *rgn;
>>  
>>  	pr_info(" %s.cnt  = 0x%lx\n", type->name, type->cnt);
>>  
>> -	for_each_memblock_type(idx, type, rgn) {
>> +	for (idx = 0; idx < type->cnt; idx++) {
>> +		struct memblock_region *rgn = &type->regions[idx];
>>  		char nid_buf[32] = "";
>>  
>>  		base = rgn->base;
>> -- 
>> 2.56.0.385.gd3acb90ef8-goog
>> 
>
> -- 
> Sincerely yours,
> Mike.
