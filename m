Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916195;
	b=ewsgWJqpLF7ssWGn9jxS46Bhd6Cf3i+WBtRaOISXM3CmqkLCS5FPhFsRY0lqUOkCW3CS
	 1BAypCj6z5VZujn2VerEgGL/eO9bhNYrj8HTLg6FmVl4iCBayrXKq/k3pduPPggoLV2lB
	 XNkMOca1RNSqcLeVe3XsPU/jTf00TSVV3ufFWacD2SLET5L2EU4QEzl5QwOSjpm6qmz9J
	 Wjnd3KRxrLhJKd59iUZPpXeC603FuA7mwwgs6NGsBY+LnlGa9GwcVIJCWJEH0AErxfZ/E
	 g7OxdsXcwgkhT1VvNaXpSOvP+iPnLcs2+NBw2A4Y3lZODEtWDO+fj3yT4pky2KyL4lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916195;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=18ZHHDBDT2iiqQ6vinpecoUhNdWbTNjIuab4R2JSkRw=;
	b=KZhtWrbOT2MsPtEalBPITIRAQlO205WMbz2PgHkhlrhecQZJhKpDt+JZWxs9m8Ckm65a
	 8kmWALMaUpRDqMEMiWtnQoyhKNwvP+uYn4WARuuK0KHK2ndD+uCO6d70+TVJHBJi5ioO4
	 JOYjz/L4r5w6txotUM2kJIi22JPfcwS2QzCR9EheUVK2MvMb6Wi4nuUuoKUW30uO7XWrS
	 jwR7U4hizc/ONRVAEE6iQrv7m6TgyUU+5Wyx45/XJ9hDJAJwC7WzjQDI774DHTZhdelv9
	 84sKeA3lYUqwKQoXo29VcTB+toQQh75wkCo82B3PHUa5LRW2BVM1kvZV+dJYned50bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k194TiNJ;
	arc=none smtp.remote-ip=95.215.58.227
Received: from mta1.migadu.com (out-227.mta1.migadu.com [95.215.58.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC8F606A881
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CC8F606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k194TiNJ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AiYQuQkup3uVDt+BqI8T8e63CilYInTtTsRGRSVebRM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794916192; v=1; x=1795520992;
 b=k194TiNJciQ9zfSjJr2C7HMEZ4rPmX3eliMeO0gINyXW7ICPYnFO7E/FjK4UVXSF025/k9vA
 5pGRGp5pXqhBusaeb/Lp2Bp6L3E0qKnuA9ZxGNj+Nrol3ZEA0uvOCR485ac8NvmJTcGGdKMEC92
 EPJOsIcllTvjmYaeYT7Etywo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 68b5ba9fa6b5c9ee;
	Tue, 17 Nov 2026 11:49:51 +0000
X-Mizu-Trace-ID: 68b5ba9fa6b5c9ee
X-Migadu-Flow: FLOW_OUT
Message-ID: <dde3f6de-06bd-4e36-ad03-1c36eb3be645@linux.dev>
Date: Tue, 17 Nov 2026 19:49:45 +0800
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
Subject: Re: [PATCH bpf v1] selftests/bpf: Fix CO-RE relocation of anonymous
 unions for bpf-gcc
To: Michal Luczaj <mhal@rbox.co>, bpf@vger.kernel.org, ast@kernel.org
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Sechang Lim
 <rhkrqnwk98@gmail.com>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261117094544.148437-1-jiayuan.chen@linux.dev>
 <5efc22be-a517-4587-8e43-609bc876b54f@rbox.co>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <5efc22be-a517-4587-8e43-609bc876b54f@rbox.co>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/17/26 7:19 PM, Michal Luczaj wrote:
> On 11/17/26 10:45, Jiayuan Chen wrote:
>> bpf-gcc fails to load test_trace_iter_unix:
>>
>>   Error: #766/6 verifier_sockmap_mutate/test_trace_iter_unix
>>   libbpf: elf: skipping section(3) .data (size 0)
>>   libbpf: elf: skipping unrecognized data section(18) .comment
>>   run_subtest:PASS:obj_open_mem 0 nsec
>>   libbpf: prog 'test_trace_iter_unix': relo #0: insn #0 (LDX/ST/STX) accesses field incorrectly. ...
>>   libbpf: prog 'test_trace_iter_unix': BPF program load failed: -EINVAL
>>   libbpf: prog 'test_trace_iter_unix': failed to load: -EINVAL
>>   libbpf: failed to load object 'verifier_sockmap_mutate'
>>   run_subtest:PASS:unexpected_load_success 0 nsec
>>   validate_msgs:FAIL:1014 expect_msg
>>   VERIFIER LOG:
>>   =============
>>   0: R1=ctx() R10=fp0
>>   ;  @ verifier_sockmap_mutate.c:124
>>   0: <invalid CO-RE relocation>
>>   failed to resolve CO-RE relocation <byte_off> [4] struct bpf_iter__unix (0:0 @ offset 0)
>>   processed 1 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0
>>   =============
>>   EXPECTED   SUBSTR: 'cannot update sockmap in this context'
>>
>> GCC only applies preserve_access_index to types that carry the attribute
>> themselves. The anonymous union holding the sock pointer doesn't, so the
>> CO-RE access stops at the union ("0:0") instead of reaching the pointer
>> ("0:0:0"), and libbpf rejects the relocation. Mark the unions too.
>>
>> Fixes: e16c83fa764f ("selftests/bpf: Add negative test for sockmap update from non-sockmap iter")
>> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
>> ---
>>  tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c b/tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c
>> index 1516fe1524bb..68b1a5323470 100644
>> --- a/tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c
>> +++ b/tools/testing/selftests/bpf/progs/verifier_sockmap_mutate.c
>> @@ -16,13 +16,13 @@ struct sock {
>>  struct bpf_iter__sockmap {
>>  	union {
>>  		struct sock *sk;
>> -	};
>> +	} __attribute__((preserve_access_index));
>>  } __attribute__((preserve_access_index));
>>  
>>  struct bpf_iter__unix {
>>  	union {
>>  		struct sock *unix_sk;
>> -	};
>> +	} __attribute__((preserve_access_index));
>>  } __attribute__((preserve_access_index));
>>  
>>  struct {
> What about dropping the unions?
>
> -struct sock {
> -} __attribute__((preserve_access_index));
> -
>  struct bpf_iter__sockmap {
> -       union {
> -               struct sock *sk;
> -       };
> +       struct sock *sk;
>  } __attribute__((preserve_access_index));
>
>  struct bpf_iter__unix {
> -       union {
> -               struct sock *unix_sk;
> -       };
> +       struct sock *unix_sk;
>  } __attribute__((preserve_access_index));
>
> Works under clang.



Right. I grepped the tree and verifier_sockmap_mutate.c is the only place
that puts an anonymous union inside a hand-written preserve_access_index
struct, so the test doesn't need it.


