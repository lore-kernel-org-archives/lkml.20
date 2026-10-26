Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.127
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793046071;
	b=3dmzA79S8pwXnF+4LTmjg8+7g4QtUbzDsHHoJSBouXSQb9HdSCcpwosjR7gQFts8Jurd
	 wc+NAz007CCbYibeSfxDD34owU1kmpLvPa0Q5hJXnJCZ4dMPWv5YOl02bNOZiGq50Bajc
	 gkyyi6EDTAM8+1toHktP8ileRu9sYukPgk5YZ7k3bKbPSzG3f/0Ds5rMgmILeTRxSc7A/
	 xZb998vpabU7o+a69IjOxrQ82EqsWrG1+8C8LU2Rw5XFOs4ugSTK29rQWOSpAx+rSGx3S
	 2Zl3x2MKRsLfcyyGugb01zyFoztTyJmkRd1J8bthHo907dGdfJe+VCcETALFSMxzjgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046071;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=E33wi6Gi4cgpbpmbmSH1yY0fn5sf/GiXkzMRUkbqsVM=;
	b=poASCN+8DaHDjfXhOfIiVjCgPdT6+IJ3eE/F6pfp0hSH+RO6RkIlaXgPGgWb+KOXiqH3
	 zS5tZtw/Rz789/G60Ofkzw2+yQQNe2mXj2533vNXCTVQ+K4nrgv56n2NLYoDXxkZ3BqsJ
	 SKmXbmt0d14gr7TuL2JbACcV4gkth5E3E4g8DiT+oWbIf2gtSEx1Hq+yxG32CykYCcgrS
	 mgSNG8Sw2eXWGFdL3E+/TAL8Ht7ah0vS9UeCKZcQSphmL2jKQ9zm5t+7VprE/Wajo0P5h
	 QaftBlJAExgJuWY9LZ+9S07ZURDKXlQXBPYbTgp3MZuW2sM1eJWUiOEROLCC0KGdOpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Mw2GY1OE;
	arc=none smtp.remote-ip=95.215.58.127
Received: from mta1.migadu.com (out-127.mta1.migadu.com [95.215.58.127])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD51606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AD51606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Mw2GY1OE
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IExywFcdcz5Fqxu4ycRZf/Zm9+V9ZMsYzn4S5XFHY3E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793046067; v=1; x=1793650867;
 b=Mw2GY1OE5S52isi1dTMf0MHWi5+QqEfjGm/W0p2Lb7qgfdP0t27lRxfxpfvcWI+l8yjQOFS0
 vXqFLf0oZufNNMkFR4aoM2ci1QkUyeEkkbvpue6tEc6w0XyVYp2uTMjD//ODKLNl1/p2k5f015T
 A3V5AJCij9rEZSCGrK6V9Arc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 39f23623df81c01f;
	Mon, 26 Oct 2026 20:21:07 +0000
X-Mizu-Trace-ID: 39f23623df81c01f
X-Migadu-Flow: FLOW_OUT
Message-ID: <2b712ff8-21cf-4371-9663-2395ceed351e@linux.dev>
Date: Mon, 26 Oct 2026 13:21:02 -0700
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
Subject: Re: [PATCH bpf-next v3 10/12] selftests/bpf: Cover the low-32 link
 for narrowing stack fills
To: bot+bpf-ci@kernel.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com
Cc: martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
 john.fastabend@gmail.com, shuah@kernel.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 martin.lau@kernel.org, mason@kernel.org
References: <20261020161907.2115379-11-vineet.gupta@linux.dev>
 <fb6e1da8e20593510ea7dbfc1527db1aaf4682c22968a209dbf2ed771646a6fd@mail.kernel.org>
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <fb6e1da8e20593510ea7dbfc1527db1aaf4682c22968a209dbf2ed771646a6fd@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 9:52 AM, bot+bpf-ci@kernel.org wrote:
>> selftests/bpf: Cover the low-32 link for narrowing stack fills
> TL;DR: Test issue: sext_fill_does_not_inherit_zext_link appears never to put a
> zero-extending link on the stack slot, so it can't distinguish the new
> check_mem_access() condition from the old one; its comment and commit message
> look inaccurate.
>
>> diff --git a/tools/testing/selftests/bpf/progs/verifier_linked_scalars.c b/tools/testing/selftests/bpf/progs/verifier_linked_scalars.c
>> index 69efe1381eca..ab78285153fb 100644
>> --- a/tools/testing/selftests/bpf/progs/verifier_linked_scalars.c
>> +++ b/tools/testing/selftests/bpf/progs/verifier_linked_scalars.c
>> +/*
>> + * A sign-extending fill must not come away with a zero-extending link. The
>> + * slot below already fits 32 bits, so the fill is not narrowing and assigns
>> + * no link kind of its own, and "state->regs[dst] = *reg" copies the slot's
>> + * verbatim; check_mem_access() is what has to drop it, since it would leave
>> + * r2 recording a zero-extension of a value it has just sign-extended.
>> + * Asserted on the register dump rather than on a guarded branch, so it pins
>> + * the rule itself and not a downstream effect.
>> + */
>> +SEC("socket")
>> +__success __log_level(2)
>> +/* a copied link would print as R2=scalar(id=N+0,smin=... */
>> +__msg("(81) r2 = *(s32 *)(r10 {{.*}} R2=scalar(smin=")
>> +__naked void sext_fill_does_not_inherit_zext_link(void)
>> +{
>> +	asm volatile ("						\
>> +	call %[bpf_get_prandom_u32];				\
>> +	r6 = r0;						\
>> +	call %[bpf_get_prandom_u32];				\
>> +	r0 <<= 32;						\
>> +	r6 |= r0;		/* r6 = full 64-bit unknown */	\
>> +	w7 = w6;		/* r7 = zext32(r6), fits 32 bits */ \
>> +	*(u64 *)(r10 - 8) = r7;					\
> Does this test ever put a zero-extending link on the slot?

Sorry, it doesn't and nothing in this patch can, so it is dropped in v4.


> The w7 = w6 above does give r7 BPF_REG_LINK_ZEXT, but the spill that follows
> clears it.  In check_stack_write_fixed_off(), r7 fits in 32 bits, so
> assign_scalar_id_before_mov() runs before save_register_state():
>
>      if (src_reg->link_kind && src_reg->link_kind != BPF_REG_LINK_SEXT)
>          bpf_clear_scalar_id(src_reg);
>      ...
>      if (!src_reg->id && !tnum_is_const(src_reg->var_off))
>          src_reg->id = ++env->id_gen;
>
> The slot ends up with a fresh id and link_kind == BPF_REG_LINK_NONE.  The
> 4-byte ldsx is not narrowing, so the fill copies a plain id, and
> check_mem_access() drops it through the existing !no_sext clear.  The
> link_kind == BPF_REG_LINK_SEXT part of the new condition never sees a ZEXT
> kind here.
>
> This leaves two problems.
>
> First, the in-test comment looks wrong:
>
>      /* a copied link would print as R2=scalar(id=N+0,smin=... */
>
> print_reg_state() prints +delta only when link_kind is set, so a surviving
> plain id would print as R2=scalar(id=N,smin=...
>
> Second, the commit message says "The last two pin the link-kind checks in
> check_mem_access()", but this test cannot tell the new check from the old
> one.  It passes with the pre-series:

Agreed. Pre-series the fill gets a plain id from 
assign_scalar_id_before_mov() and check_mem_access() drops it through 
the existing !no_sext clear, so R2 prints without an id either way and 
the assertion cannot separate them.
The changelog said "the last two"; it is now "the last one", counting 
only sext_byte_fill_drops_sext_link.


> That holds even after 3649346488fc ("bpf: Track low-32 scalar equality across
> narrowing stack spills"), because the fill-side
> assign_scalar_id_before_mov(reg) clears the slot's new ZEXT kind before the
> copy.  No later commit in the range (3649346488fc, 73fbac05c8bd) changes this
> test.

Right.

> Should the comment, the test name and the commit message describe what is
> actually pinned here (a plain id dropped across a range-changing 4-byte
> ldsx)?  Or should the test be reworked once a ZEXT-carrying slot is
> reachable?

Neither: the test is dropped in v4.

Re-describing seems viable but is conceptually wrong. It pins a plain id 
dropped across a range-changing ldsx which is pre-existing behavior that 
this series does not touch, so doesn't make sense to introduce here. 
Reworking after "a ZEXT-carrying slot is reachable" might be better 
suited, but that is 11/12 and 12/12, which are tagged [do not merge]. 
12/12's version has the same defect and is dropped too, so both go.

Thx,
-Vineet

> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/39458500836

