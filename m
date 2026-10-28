Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793226522;
	b=xu4QWe8+ayC+aY93Ww3IzWyLBJFL3Y8bQb+pBf4ZjYC+8re38xlk4cWmsfpIt6SZWrR9
	 4KCy9qcvxN5giHKSz13qL7KsBM1emFaZ6ZoYNBpzJnTsGNLmCBnoPBfYqWnp6/v23XQAS
	 hW3Atyvd9sUjZSEU83sODRPm5BMoVLEeOqoMpKxh/up+M0QWpQbb7Y5y1SqZLUR78C/JQ
	 M9hJvJxl7s9Dm2EhYAz98SdL9SaR2I+3Vx5REXD5bfYMCiSBdUc+wkPWeJBzH/v05zw8H
	 GUrVys/mJy7to8Ma3+g8Q3Pa+qPYEzm+pW4QGrIDXN4NFTcZT+hp/wMyjkb3roaxtcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793226522;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=OGKoilLDqI57ndA3j6iCyQcfcnOJQlWxhVYQp78DFdY=;
	b=oFnfaCppo0bIJgsvNS4i9+Naj8p9eWsZJiZx+QfiUuOl5+bTdCdSzf4ZDRRZzqQ6BC6S
	 8BtWhlibkYanWmL0Ojo51lgawMHLFbg3cgbcjYaahW+cXZPMbLP4/0n295KpNFwnAfNyZ
	 HS5gbr6Iz6fd5OwODmPTmZ9q/gEzm4QhsjgiDQ3AQ4QVGbvVChbxytCp/NxavYp4ctqvc
	 HIz+15Q3ADdUz1+CUM9TJ0YOQJScpOpAwlrLI3RVC+h+8OW/SPHanszqh2MYA1umW//aY
	 +JKXgxB5pRY2gMzRs5yGMsOBNPhGf9myqegwbfsIoM00BgszKXxCuW8f4X6ns7mn60w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Uz2z09VJ;
	arc=none smtp.remote-ip=91.218.175.53
Received: from mta0.migadu.com (out-53.mta0.migadu.com [91.218.175.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8846606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:28:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8846606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Uz2z09VJ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2msV4av53g6r0fL60/qaZ1TAQzVa83d1LHrrXkxGuyI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793226519; v=1; x=1793831319;
 b=Uz2z09VJ0QHV+sHPbD3QuUNhvSCZ4cnO/UyancUz4ZqW3ubu0s09cqtuLmx4NhPx3VLZmyn+
 jGUXPUhny9yCWk2DpQ1GBGKTx9RsKurJZ7r4krr1RUUnZKkogQHFC3VvZmD8m+hzGpfgUc8mpMK
 XyzBjKk6Ynsh4X+oJwbWfsU8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fd49d74d26d472b6;
	Wed, 28 Oct 2026 22:28:39 +0000
X-Mizu-Trace-ID: fd49d74d26d472b6
X-Migadu-Flow: FLOW_OUT
Message-ID: <29d16b30-bc19-4865-86a7-1611c8407a12@linux.dev>
Date: Wed, 28 Oct 2026 15:28:33 -0700
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
Subject: Re: [PATCH bpf-next v2 1/8] selftests/bpf: Build callx tests with GCC
 that defines __BPF_FEATURE_CALLX
To: bot+bpf-ci@kernel.org, bpf@vger.kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 ihor.solodrai@linux.dev, john.fastabend@gmail.com, shuah@kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 jose.marchesi@oracle.com, david.faust@oss.qualcomm.com,
 martin.lau@kernel.org, mason@kernel.org
References: <20261028204158.1021284-2-vineet.gupta@linux.dev>
 <3833268383adcd104d44051cbbb7687180f4e13bcccb0057e8747f2e10a5ad68@mail.kernel.org>
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <3833268383adcd104d44051cbbb7687180f4e13bcccb0057e8747f2e10a5ad68@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

  10/28/26 2:22 PM, bot+bpf-ci@kernel.org wrote:
>> selftests/bpf: Build callx tests with GCC that defines __BPF_FEATURE_CALLX
> TL;DR:
> - data_in_arena.c use_ops() isn't converted to CAN_USE_CALLX, so GCC with
>    callx support may still call add1() directly; commit message claims all
>    tests converted
> - Commit message typo (nit)
>
>> selftests/bpf: Build callx tests with GCC that defines __BPF_FEATURE_CALLX
>>
>> Commit 7cd1f73b37ea ("selftests/bpf: Fix build of callx tests with GCC")
>> gated the callx progs on __clang__. GCC had indirect call support which was
>> recently refurbished along with a __BPF_FEATURE_CALLX macro [1], so gate
>> on that as well so once this GCC is released, the tests start passing.
>>
>> Put the arch and compiler conditions in a CAN_USE_CALLX macro in
>> bpf_misc.h, and use it all the test programs.
>>
>> While at it, mark the placeholder programs left for unsupported
>> toolchains and arches with __skip(), so they report SKIP rather than OK.
>>
>> [1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=ffe3ead4a8ad704b557b0cfa4f823df647c65a0d
>>
>> Measured on bpf-next with a stock bpf-gcc that defines
>> __BPF_FEATURE_CALLX, test_progs before and after: 76 subtests run that
>> previously did not exist in the report, 75 OK and one @unpriv SKIP,
>> with no failures.  The two dummy placeholders retire and
>> callx_rodata_lskel goes SKIP -> OK.
>>
>> Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
> The commit message says CAN_USE_CALLX is used in all the test programs, but
> use_ops() in progs/data_in_arena.c is not converted.  It still gates its
> indirect call on __clang__ and keeps the same comment this patch removes from
> the other files:
>
> progs/data_in_arena.c:use_ops() {
>      ...
> #ifdef __clang__
> 	return ops.fn(*ops.data) + ops.name[1];
> #else
> 	/* gcc doesn't support indirect calls */
> 	return add1(*ops.data) + ops.name[1];
> #endif
>      ...
> }
>
> With a GCC that defines __BPF_FEATURE_CALLX, doesn't this still take the
> #else branch and call add1() directly?  That means the GCC build never makes
> the callx through a function pointer in .data.rel.ro, and the "gcc doesn't
> support indirect calls" comment is now wrong for that compiler.
>
> A grep for "indirect call" under progs/ and prog_tests/ shows this is the
> only remaining gate.  None of the later patches in the series touch
> data_in_arena.c.
>
> Should use_ops() be converted to CAN_USE_CALLX as well?  That would need
> data_in_arena.c to include bpf_misc.h, and it would add the x86/arm64/riscv64
> arch gate that clang builds of this file don't have today.  Otherwise, could
> the commit message be adjusted so it doesn't say all the test programs were
> converted?

Yes it missed the grep. Will be fixed in v3.
Do note that this also adds the JIT gate which is the right thing to do 
- the prior __clang__ only check would generate callx even for arches 
not supporting callx.



> This isn't a bug, but there is a missing word in the commit message:
>> bpf_misc.h, and use it all the test programs.
> This should read "use it in all the test programs".

Right, will fix that as well.

Thx,
-Vineet

> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/40768193895

