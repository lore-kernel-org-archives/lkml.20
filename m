Received: from mta1.migadu.com (out-139.mta1.migadu.com [95.215.58.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2057E3B47F1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790637093; cv=none; b=Lap3G/ktdI3WndbJ/Z0kK4pOxL0R0QLLQLA2vi7g1+jpp+92eW6Fw4ApfjFvdR0vq5COQM/+9Ev5nbLlbtzX5FzfTp2u3MkwNJpaLQgjYfMqgjtuMzMbuX2SGGEE0e9HKHqJqTv5/ncNw1CRT7Igxd7igAPDLPGMeyhxEbI4YFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790637093; c=relaxed/simple;
	bh=B8Df9Ko2Ru4RIFP8wDzuShpIicq73rIi/+6e3pkLRNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mOB9wjOWIHLnt5p8CCi5LqWLT271Cv1prx6n2NAhncwiLry/81sZtaM01sHKy4QDVKrSZUAriPIR9wKLuFlaUP4VhWEpQtiiAhaq9AbOi/oImuAxCP7ubQcITv4xMoRG70Rt88+ngj7Ppo2Cwbenl1+AD1cdcuokLuw7nlJoutw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cMdLlRm4; arc=none smtp.client-ip=95.215.58.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cMdLlRm4"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=B8Df9Ko2Ru4RIFP8wDzuShpIicq73rIi/+6e3pkLRNw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790637088; v=1; x=1791241888;
 b=cMdLlRm42F0Il34ufV2Ag9heLWPuH/V5HGTvLbdapVxTS6495Rb4hHnWPXFvub72zcjCEdBG
 qPF0F9pHjv3/RHrqDbQKmVXVqyCbDGzgmbqkZPORu9BBjKx18kUljcwjVWPEl3kJFFEbIqu8162
 KWTWTUZLCk7Ts+Xh89u4gTtA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3cc8c901e7cc37e2;
	Mon, 28 Sep 2026 23:11:28 +0000
X-Mizu-Trace-ID: 3cc8c901e7cc37e2
X-Migadu-Flow: FLOW_OUT
Message-ID: <e5e37ef2-b061-4319-a12b-987c518fc169@linux.dev>
Date: Mon, 28 Sep 2026 16:11:23 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next] selftests/bpf: Fix linked_externs with bpf-gcc
To: bot+bpf-ci@kernel.org, bpf@vger.kernel.org, andrii@kernel.org,
 ast@kernel.org, daniel@iogearbox.net
Cc: eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev,
 song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
 emil@etsalapatis.com, ihor.solodrai@linux.dev, linux-kernel@vger.kernel.org,
 martin.lau@kernel.org, mason@kernel.org
References: <20260928215110.3966357-1-vineet.gupta@linux.dev>
 <c450ab4be9ca9cdf0934b52ee5c4f8d0bcaec49c39c454dae22712fbd24ad42c@mail.kernel.org>
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <c450ab4be9ca9cdf0934b52ee5c4f8d0bcaec49c39c454dae22712fbd24ad42c@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/28/26 3:42 PM, bot+bpf-ci@kernel.org wrote:
>> diff --git a/tools/testing/selftests/bpf/progs/linked_arena1.c b/tools/testing/selftests/bpf/progs/linked_arena1.c
>> index 3e8788dec1d9..dd9c5fa424dd 100644
>> --- a/tools/testing/selftests/bpf/progs/linked_arena1.c
>> +++ b/tools/testing/selftests/bpf/progs/linked_arena1.c
>> @@ -10,13 +10,33 @@ struct {
>>   	__uint(max_entries, 1); /* number of pages */
>>   } arena SEC(".maps");
>>
>> -long __arena a_val = 1;
>> +/*
>> + * Dereferencing an arena global needs the compiler to emit an
>> + * addr_space_cast, which only clang does. Keep the variables so the arena
>> + * is still populated and the skeleton still has its arena member, but skip
>> + * the test elsewhere.
>> + */
>> +#ifdef __BPF_FEATURE_ADDR_SPACE_CAST
>> +bool skip_tests __attribute((__section__(".data"))) = false;
>> +#else
>> +bool skip_tests = true;
>> +#endif
>> +
>> +long __arena_global a_val = 1;
>>   extern long __arena b_val; /* defined in linked_arena2.c */
>>
>>   SEC("syscall")
>>   int sum1(void *ctx)
>>   {
>> +#ifdef __BPF_FEATURE_ADDR_SPACE_CAST
>>   	return a_val + b_val;
>> +#else
>> +	/*
>> +	 * Reference the extern without dereferencing it, so that the relink
>> +	 * test still has an extern to resolve.
>> +	 */
>> +	return (long)&b_val;
>> +#endif
>>   }
> Does the relink_arena test exercise externs in allocated sections under
> bpf-gcc as intended?
>
> The commit message explains that __arena is a pointee annotation and
> that placement comes from __arena_global. The definition a_val was
> switched to __arena_global, but the extern declaration b_val still uses
> __arena.
>
> Under gcc, __arena expands to __attribute__((btf_type_tag("arena")))
> with no section, so b_val has no explicit section. GCC does not put an
> extern that has no explicit section into any BTF DATASEC (GCC
> PR112849), which means under bpf-gcc b_val is a free-floating extern
> VAR, not an entry of the .addr_space.1 DATASEC.
>
> In tools/lib/bpf/linker.c, find_glob_sym_btf() returns btf_sec_id = 0
> for it. linker_append_elf_sym() never takes the branch for externs in a
> real allocated section:
>
>      if (sym_is_extern && btf_sec_id) {
>          ...
>          if (strcmp(sec_name, BTF_EXTERN_SEC) != 0) {
>              src_sec = find_src_sec_by_name(obj, sec_name);
>
> That branch is what d07d3efd0141 ("libbpf: Fix static linking of
> externs placed in allocated sections") fixed and what 34354db1b148 is
> meant to cover. The check in test_relink() only walks the .addr_space.1
> DATASEC:
>
>      id = btf__find_by_name_kind(btf, sec_name, BTF_KIND_DATASEC);
>      ...
>          ASSERT_NEQ(btf_var(t)->linkage, BTF_VAR_GLOBAL_EXTERN, "var_resolved");
>
> Under gcc that DATASEC never holds an extern, so the check cannot fail.
> The reported "linked_externs/relink_arena:OK" for bpf-gcc would hold
> with or without the linker fix.
>
> By contrast, linked_maps1.c declares its extern with an explicit section
> (extern map2_t map2 SEC(".maps");), so relink_maps covers the
> allocated-section path under both compilers.
>
> Declaring b_val with __arena_global would do the same here: under gcc
> that is SEC(".addr_space.1"), and the bpf_gcc flavor builds with
> -Wno-attributes, so the ignored 'used' on an extern is silent; under
> clang it is address_space(1), same as today, because clang ignores
> btf_type_tag on non-pointer types.

Thanks. Fixed in v2.

I had only checked that b_val survived as an ELF UND symbol and missed
that it was not in the DATASEC test_relink() walks:

   [23] DATASEC '.addr_space.1' size=0 vlen=1
           type_id=18 offset=0 size=8 (VAR 'a_val')
   [18] VAR 'b_val' type_id=11, linkage=extern     <- not in the datasec

With __arena_global on the extern declarations it matches clang:

   [24] DATASEC '.addr_space.1' size=0 vlen=2
           type_id=18 offset=0 size=8 (VAR 'b_val')
           type_id=19 offset=0 size=8 (VAR 'a_val')
   [18] VAR 'b_val' type_id=13, linkage=extern

One correction: the 'used' that SEC() adds does not keep the extern
alive. With __arena_global on the extern but nothing referencing it,
bpf-gcc still drops it and .addr_space.1 goes back to vlen=1 -- 'used'
is ignored on a declaration, which is what -Wno-attributes is hiding
here. So v2 needs both halves: __arena_global for the placement, and the

     return (long)&b_val;

in the !__BPF_FEATURE_ADDR_SPACE_CAST body so the extern is still
referenced. Dropping either one and relink_arena goes back to passing
pointlessly under bpf-gcc.

Thanks,
-Vineet
