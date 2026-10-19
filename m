Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805DC26ED37
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792370240; cv=none; b=lnvAOqO/aVLAgrE1Rs+ZaKJrGUwHn/4DrGt+DBczt5pa/FDs5NtUqKuoyz3cLS5PdowqbfK4NEAWtD3JnHc1oXxw4cXXbSqBq5RETe/Qze8cSnn6Q5DvTMFuYmnXOE8FAs2HHeg5qHgRmw8C/NwPWgi1WQuQeG2DulpTTNmR+Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792370240; c=relaxed/simple;
	bh=JPsUfgwilWZjAoWYOXjnFyaqXY4tVr5Uv8fRSYJOtF0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=hSB0IWAlTHLzY1DG25axf0THH4zKWg8LQfp+M3Kf29tN4PHxV68poXch5CFi773/ifuKs8Ykxk6tTdyqHdHWf83FeQyhjnCnhHD6XawwMqfKq7Ytb2lckuHfzvbJK6p0sjytOujoNbB2YRVfG73jcpZ66evK2gXE0CF9sqJ5PtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2SKbBnj; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2SKbBnj"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ccc6b11a19aso511199a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792370238; x=1792975038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R+HO7bfwyq5DKB190MVNgjm86bSqBOngp328av6N0SU=;
        b=c2SKbBnj8adRvxF/85Y6AEZojSUmgKrErw+Oj6b3fMRkIUNjSr+vlFwO/XXasA366h
         3oy8hr2ACU/ichFn/PSNE6KRV+87fgjRwhmmVJ61Z9axTcFewFBxD3DSCgf3CJeGdufh
         SEvZpH1y9a10tswFuwQbG2jFkXuhcKTR28orH3VSbWLVZb4AzMRozYRwONcbVzcfYknO
         K24VxRP4p26xxEJi0l090o09v9BKeDncdoTdOnmVNcaN2k7SfD+kX9OsClOqLmv6CuMj
         YfNzzUv5Cu5DaIY9tiDVTvaHCwNs0kA9OV+AVKRdTEBBcTq8ixL5Zw0966p246LTj6XE
         uBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792370238; x=1792975038;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R+HO7bfwyq5DKB190MVNgjm86bSqBOngp328av6N0SU=;
        b=S5UzDOCLlOw8ZZ0n2Ct04Kl19zQk6K+kQt0PZdKmmcsvdk92HsGflep6OUI0QLMFi8
         et7ioD3BYi5McSVmRJTae/OPkm3uwtH4SyObT9ja2U2YtbdHvseM9oHS7pIU9NYMsL6x
         H8i/u7BB44MIAvn6NNqxhUecglkhl49T2jxAwa4ZslLOcynIUjw8sSyynPlM7ZpPpCez
         B3smpg03YXLgaq+09brpRy7dnvtUrp23CKqpx8XrEplJuk7dzCLu0St5qHH63dhFxYSU
         bJFEOAwz8+l0TvFZs6EkU4bRWna9NwpvAmIwlzIVDNcrqqKxlWNPdLr+cMxQa0gye+E+
         P+BQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkjs01CZzjnOjX0LKTReXH2rNewzikmV5qSGBMd60fR+Obg4Sc19hJFXJct16C4HPsWlsmNcTi9EajvMU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUUKCx6xRdHXjWpPDT1OF/icSLSmy2S2PDzX2yyQX6On5HtCNI
	qA6nUQywL8+cBOhF25ludlI0dRu2IiRnfZzxwXf8njdGaWbytmDKDeewNAexQO9f
X-Gm-Gg: AYBFou2hJu8xcnXDqvWtynFWE6EIFxFYUce4RFm1vPZQeMX03yJKs/XgSSt7nvE277z
	RZsD+6jmg9XtgQ8AYT83NP9LsTcBsUBVDGE1q4+lMiQAQA9k7NkjBM6RaJibNmD48xNhcVC4CwY
	4hglUGPvri3tC9iAJrVUo2BNNLO+8CB5AbQAfhn1WrLQ66lyZagYPkhCLTx5L7Ij2wKnTVQlYgA
	E9ip99WW2lj2ZDnFMM1I7RE4RxC1jaxOEckZbhXjpjUpsaqu1C4me3I+QWP7ll+BXm5iBl0TpAN
	MRnYE30Yn15UW8zej1IpILUk3Gd0p7ic3Wzbtvnr8I86M298CIVhfz1pWggKRW508IeaWlXzdxq
	CgOG6Wg/By+xg4ZZ9R4hzvqHyaEStYpSxmTuixsfqM59X9UqVxc1M4B0rbw98qHR4xYHrMBopUF
	BK2E+bNfIbd4HTRH2NAoNm3rkLBtjO3pf1p0OP9yI9bQrwwv+3aKKeKDafSNDHpxdZPSFxdaXL6
	WmWbhJIIBjHFRW0ZL4/Wjl+8LVfquRpgjE=
X-Received: by 2002:a17:90b:2648:b0:3ac:9925:72ae with SMTP id 98e67ed59e1d1-3aceec9f950mr4070283a91.31.1792370237230;
        Sun, 18 Oct 2026 17:37:17 -0700 (PDT)
Received: from [192.168.21.192] ([24.18.106.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3b798d3sm7192438a91.3.2026.10.18.17.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 17:37:16 -0700 (PDT)
Message-ID: <0593b88f-6151-4975-a840-ef21f3df06e8@gmail.com>
Date: Sun, 18 Oct 2026 17:37:16 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH] sparc: populate sysfs cache topology information on sun4v
Content-Language: en-US
From: Tony Rodriguez <unixpro1970@gmail.com>
To: Jan Engelhardt <jengelh@inai.de>, davem@davemloft.net
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Stian Halseth <stian@itx.no>
References: <20261018222723.43442-1-jengelh@inai.de>
 <b69a7cd6-7f9d-4c8e-80b9-701a77a6805a@gmail.com>
In-Reply-To: <b69a7cd6-7f9d-4c8e-80b9-701a77a6805a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan,

On 10/18/26 5:16 PM, Tony Rodriguez wrote:
> Hi Jan,
>
> On 10/18/26 3:27 PM, Jan Engelhardt wrote:
>> The SPARC port does not publish any cache topology information. The
>> lscpu utility therefore falls back to assuming the published cache
>> sizes are for unshared caches, and as a result, reports way more
>> cache than there really is present in the system. On a T5240 machine:
>>
>> ```
>> $ lscpu
>> Architecture:          sparc64
>>    CPU op-mode(s):      32-bit, 64-bit
>>    Byte Order:          Big Endian
>> CPU(s):                128
>>    On-line CPU(s) list: 0-127
>> Model name:            UltraSparc T2 (Niagara2)
>>    Thread(s) per core:  4
>>    Core(s) per socket:  16
>>    Socket(s):           2
>>    Flags:               sun4v
>> Caches (sum of all):
>>    L1d:                 1 MiB (128 instances)
>>    L1i:                 2 MiB (128 instances)
>>    L2:                  512 MiB (128 instances)
>> ```
>>
>> This patch implements population of the sysfs cacheinfo structures
>> for sun4v (systems with mdesc). The proper amount is now reflected in
>> lscpu's output:
>>
>> ```
>> Caches (sum of all):
>>    L1d:                 128 KiB (16 instances)
>>    L1i:                 256 KiB (16 instances)
>>    L2:                  8 MiB (2 instances)
>> ```
>>
>> Signed-off-by: Jan Engelhardt <jengelh@inai.de>
>> ---
>>   arch/sparc/include/asm/cpudata_64.h |  8 +++-
>>   arch/sparc/kernel/mdesc.c           | 61 +++++++++++++++++++++++++++++
>>   2 files changed, 68 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/sparc/include/asm/cpudata_64.h 
>> b/arch/sparc/include/asm/cpudata_64.h
>> index 056b3c0e7ef9..e28b841ffe23 100644
>> --- a/arch/sparc/include/asm/cpudata_64.h
>> +++ b/arch/sparc/include/asm/cpudata_64.h
>> @@ -18,13 +18,19 @@ typedef struct {
>>       unsigned int    irq0_irqs;
>>       unsigned int    __pad2;
>>   -    /* Dcache line 2, rarely used */
>> +    /* Dcache line 2+3, rarely used */
>>       unsigned int    dcache_size;
>>       unsigned int    dcache_line_size;
>> +    unsigned int    dcache_assoc;
>> +    unsigned int    dcache_id;
>>       unsigned int    icache_size;
>>       unsigned int    icache_line_size;
>> +    unsigned int    icache_assoc;
>> +    unsigned int    icache_id;
>>       unsigned int    ecache_size;
>>       unsigned int    ecache_line_size;
>> +    unsigned int    ecache_assoc;
>> +    unsigned int    ecache_id;
>>       unsigned short    sock_id;    /* physical package */
>>       unsigned short    core_id;
>>       unsigned short  max_cache_id;    /* groupings of highest shared 
>> cache */
>> diff --git a/arch/sparc/kernel/mdesc.c b/arch/sparc/kernel/mdesc.c
>> index 23b51a32e96e..029d9d812074 100644
>> --- a/arch/sparc/kernel/mdesc.c
>> +++ b/arch/sparc/kernel/mdesc.c
>> @@ -818,6 +818,7 @@ static void fill_in_one_cache(cpuinfo_sparc *c, 
>> struct mdesc_handle *hp, u64 mp)
>>       const u64 *level = mdesc_get_property(hp, mp, "level", NULL);
>>       const u64 *size = mdesc_get_property(hp, mp, "size", NULL);
>>       const u64 *line_size = mdesc_get_property(hp, mp, "line-size", 
>> NULL);
>> +    const u64 *assoc = mdesc_get_property(hp, mp, "associativity", 
>> NULL);
>>       const char *type;
>>       int type_len;
>>   @@ -828,15 +829,21 @@ static void fill_in_one_cache(cpuinfo_sparc 
>> *c, struct mdesc_handle *hp, u64 mp)
>>           if (of_find_in_proplist(type, "instn", type_len)) {
>>               c->icache_size = *size;
>>               c->icache_line_size = *line_size;
>> +            c->icache_assoc = assoc ? *assoc : 0;
>> +            c->icache_id = mp;
>>           } else if (of_find_in_proplist(type, "data", type_len)) {
>>               c->dcache_size = *size;
>>               c->dcache_line_size = *line_size;
>> +            c->dcache_assoc = assoc ? *assoc : 0;
>> +            c->dcache_id = mp;
>>           }
>>           break;
>>         case 2:
>>           c->ecache_size = *size;
>>           c->ecache_line_size = *line_size;
>> +        c->ecache_assoc = assoc ? *assoc : 0;
>> +        c->ecache_id = mp;
>>           break;
>>         default:
>> @@ -1251,6 +1258,60 @@ void mdesc_fill_in_cpu_data(cpumask_t *mask)
>>       smp_fill_in_sib_core_maps();
>>   }
>>   +int init_cache_level(unsigned int cpu)
>> +{
>> +    struct cpu_cacheinfo *i = get_cpu_cacheinfo(cpu);
>> +    i->num_levels = 2;
>> +    i->num_leaves = 3;
>> +    return 0;
>> +}
>> +
>> +int populate_cache_leaves(unsigned int cpu)
>> +{
>> +    struct cacheinfo *leaf = get_cpu_cacheinfo(cpu)->info_list;
>> +    cpuinfo_sparc *cs = &cpu_data(cpu);
>> +
>> +    leaf->id                    = cs->icache_id;
>> +    leaf->attributes            = CACHE_ID;
>> +    leaf->level                 = 1;
>> +    leaf->type                  = CACHE_TYPE_INST;
>> +    leaf->coherency_line_size   = cs->icache_line_size;
>> +    leaf->ways_of_associativity = cs->icache_assoc;
>> +    leaf->size                  = cs->icache_size;
>> +    leaf->priv                  = cs;
>> +    if (cs->icache_line_size > 0 && cs->icache_assoc > 0)
>> +        leaf->number_of_sets = cs->icache_size / cs->icache_line_size /
>> +                               cs->icache_assoc;
>> +    ++leaf;
>> +
>> +    leaf->id                    = cs->dcache_id;
>> +    leaf->attributes            = CACHE_ID;
>> +    leaf->level                 = 1;
>> +    leaf->type                  = CACHE_TYPE_DATA;
>> +    leaf->coherency_line_size   = cs->dcache_line_size;
>> +    leaf->ways_of_associativity = cs->dcache_assoc;
>> +    leaf->size                  = cs->dcache_size;
>> +    leaf->priv                  = cs;
>> +    if (cs->dcache_line_size > 0 && cs->dcache_assoc > 0)
>> +        leaf->number_of_sets = cs->dcache_size / cs->dcache_line_size /
>> +                               cs->dcache_assoc;
>> +    ++leaf;
>> +
>> +    leaf->id                    = cs->ecache_id;
>> +    leaf->attributes            = CACHE_ID;
>> +    leaf->level                 = 2;
>> +    leaf->type                  = CACHE_TYPE_UNIFIED;
>> +    leaf->coherency_line_size   = cs->ecache_line_size;
>> +    leaf->ways_of_associativity = cs->ecache_assoc;
>> +    leaf->size                  = cs->ecache_size;
>> +    leaf->priv                  = cs;
>> +    if (cs->ecache_line_size > 0 && cs->ecache_assoc > 0)
>> +        leaf->number_of_sets = cs->ecache_size / cs->ecache_line_size /
>> +                               cs->ecache_assoc;
>> +
>> +    return 0;
>> +}
>> +
>>   /* mdesc_open() - Grab a reference to mdesc_handle when /dev/mdesc is
>>    * opened. Hold this reference until /dev/mdesc is closed to ensure
>>    * mdesc data structure is not released underneath us. Store the

I need to correct my previous reply — parts of it were wrong, and I'd 
rather retract them clearly than leave them in the thread.


The claim that the patch doesn't fix the L2 over-reporting was 
incorrect. I misread the "before" lscpu output in the message.

     L1d: 128 KiB (16 instances)
     L1i: 256 KiB (16 instances)
     L2:  8 MiB (2 instances)


What may still be worth a look:

These are the points from my earlier list that don't depend on the 
behavior claims I got wrong — but please treat them as questions and not 
assertions.

leaf->id is int while the MDESC handle is u64; the *_id fields are 
unsigned int, so there's truncation (harmless if only equality matters, 
but worth a cast or a comment).

Growing cpuinfo_sparc shifts sock_id / core_id / max_cache_id — worth 
confirming no SPARC asm hardcodes offsets into those.

fill_in_one_cache() handles case 1: and case 2: only; if S7/T7 report L2 
and L3 at different MDESC levels, it'd be worth confirming both are 
captured (the "after" output only covers T2, so this is untested 
territory rather than a known bug).

num_leaves in struct cpu_cacheinfo is version-dependent; worth 
confirming the target tree has it.


Apologies for the noise — I should have read the "before/after" pair 
more carefully before replying. The patch does what it says for T2, and 
my earlier message should be disregarded where it says otherwise.


Regards,

Tony

