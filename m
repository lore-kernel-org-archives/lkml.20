Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792890731;
	b=GuB/nQ9s3KvjgUsb+kCKkFJ1ck0vZ+zvqsnjHwE46SwHyQ4bCJ7neiqhwG3BPmvxW716
	 VqJToIMsH0wfxBTFr2NkkAlh2eOHku6xLVmG11a3QlWHYt8uZWNkVRd4wT1l56GSwJ5vb
	 /rLjaSlrfaIB6BoDym7UJWl/ScQjG4LWyHzAmnt20X9l3wdQjhTfCiKChJr/7CNCHg8hJ
	 u9b3P3UYovfFhOWTZemqO0NrTdKeLlUTeaMZLb2ubNJ+DL1bfl/CI8zNbF1ry0X2Pe+mO
	 U3C8QAZqe1GaKLHInTG1fbcib4kSSavnb5PGhS9F3IU/OYEq7eYe4a7iDGiNAzess6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792890731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=JQp1/yEJUO+nFV/d8zf3vA+JnLRO6C01wwC42E0BIC8=;
	b=ke/MAmioc/Kry3ob/D1urGG4cT8Qe5TSRk8TaNPzOzWgxg5ksyVSWy6wuKKJK6Nni/zS
	 WV1deiXuSQnQCNlG/H6h8D0oZbrTYJdL/fmLE0QpjQziqxKQrB9Uqs4am+VbJu/lQwo5p
	 UpL9HJVtbcskVYxVB9hH+9PDbSNph8l4rgmzLUTImTKMpLGXZWawmIXbDtbiMN4hbQY6g
	 Jc4z0LjPTwF7bJIfD7BU+AHJ1BHYnPVn/DH/9nhWaqTgN2vRdvhSk/RcNyR1iP7+//Klp
	 lZzcQDO6rp/Z9MB+OpuyuIsnewun4r0EmxBfXZHflGfyGQqSWkGhZgsdrrgSw6xucEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="VGEjkK/0";
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD209606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 01:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD209606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VGEjkK/0
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e5fb79ce82so12559925ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 18:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792890730; x=1793495530; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JQp1/yEJUO+nFV/d8zf3vA+JnLRO6C01wwC42E0BIC8=;
        b=VGEjkK/0QJZMzIgfE/4xs00D7+feuZrEI9pKTYht1LO9lQXdYkJRbBA+rc5+3R+D3K
         S4L63spTRD1lcJ6FRV54dhJWvBEjLdW0KPIHXyl4S7G/ZWgiNP3KAKmLLkTgXW4BGh+o
         1fSlVqGiiFljiNTK11HjtDWRJ4BYgjH+Y85SOdLz0BgQPV2QM9+VTTn8xieALZ4Sf89a
         d65vCrx12Ux1P1QuMqyv9XQBqFHmeWrIkIKa6TsE6yRcc/GxbbGgsFQ+Ugt121AJfkUA
         cc13ID2vtXhwNGg2ZzOlQVzXOuPmG5R/d0PLoB4fCTYykfhyDW1t3WdWu/HwJ6p9tbto
         XRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792890730; x=1793495530;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQp1/yEJUO+nFV/d8zf3vA+JnLRO6C01wwC42E0BIC8=;
        b=JFh1Tw9OqsYYZkUARO0MRL1/IRJE8MeZraW0stkM8zG7oN+BHk2WZUGL2gtSbPaCw/
         7fna5gVo2hhydenKKYQ9OOoqIlGLYjnbWPYobXVZM67Rdhnpwm3jnIssG/O4hrkHU6Zu
         Rn3r7JR0+4hpctP1iAQk8o0xowAVcSl0+o1kk9JQgKt8oLu+L2KWGU0SUJ0liCxiMLkE
         lEbqbXEcHpCvlCBmYpjo+TxLAJjkAT3ToZ0qlZJX5AdALYXw0WagEFoICG9id5zuwp8Y
         Hqx4llgKb7yczxvUUiMtehODUm9mbr2ZT9YzVe+YA1yeL2e/TjdAbKjheYS66XXjefQ4
         skzg==
X-Forwarded-Encrypted: i=1; AKwUvByoCHnEom1PGZmgO3x1Fgz+tn7fwMvcubcisMsxOtGtE2pvlpWrbCxgmWxUBJYtDsGWgZV5ALPOmM+HqiE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCkZ94jyWmYPAdjxvusJIInFWt8wQyZ1SdSvRbvwjYwxbX1t7m
	VS8JLdVgf8SS1NjIZTbN3abF5nBRiEZduGYHiNOBl4Tiaq58HwJD1pqr
X-Gm-Gg: AYBFou3y77aXal/pX4x8395l7ZQOAcosVn296VInfxKyW9BSx1NIPS6KwkXt3RN1Bni
	KyH5OPcYTxbLD/EkU/WTab8BSKiSfcBv8dhLbqCNn5KRjkYmtxnkhL+BlonrN6m2o+rbMn7lkcc
	ZPDa6o7UnZuezzOj0vKg03f5Hq+jL+GwwgttefCZey6I+VYN0QzxcL9XjrsVAXskCfX27ZBWGgX
	Ps39fGeAuT4jQ/NsM439MCj4HaAnAQ+ze240/WTAES/3C8uKPKtnVf9c2vG6YGixp6u1APHhqWH
	ASmgyCBQ0eD3TZhjpBaY+aCFdyMGr1z2NWHaa9AtnPEl2PTOrcdJQHT10EAUAtxjb3oUVmx357u
	HyMN6cQlSGztjJcOBfT33aQGMTW9oUIvY3lJjQ3W6zJkFLqGM4rW4bMUD/4/MC8YeiVi4be5W73
	VsdBMLzFdu8X6DBB5oWmsF3NLncIGpJ4Od2G5nq0mNv3GlbhmCX7815ELnb0a5qVFwpXHbCUMDA
	JeQ2WLsZmM6lTpUf5HjF0ZAxVICnHyTwKCYmdMj4imGT3cPv6qzIKOqu/Uz6FccEF/jSLzMgLUA
	+HL0ry0rfGZQWdy8RsNtLoX8LTvXeypJ1XDkOhmIWy9QZpBLIJop0I1+m0z8
X-Received: by 2002:a17:90b:2891:b0:3ac:a7ee:6761 with SMTP id 98e67ed59e1d1-3adead4466fmr2879774a91.21.1792890729981;
        Sat, 24 Oct 2026 18:12:09 -0700 (PDT)
Received: from localhost ([153.61.198.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebbb1a13sm3888643a91.2.2026.10.24.18.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 18:12:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 Oct 2026 01:12:09 +0000
Message-Id: <DMDIPYF3NTY0.3SN2PAZ1PG9J2@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <co+eada64ce90ecebce@bugs.sh>, "Xiang Mei"
 <xmei5@asu.edu>
Subject: Re: [PATCH bpf v2 1/2] bpf: Validate stack arg reads against caller
 state
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Weiming Shi" <bestswngs@gmail.com>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "John
 Fastabend" <john.fastabend@gmail.com>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Shuah Khan"
 <shuah@kernel.org>
X-Mailer: aerc 0.20.1-349-gb940a4174a3e-dirty
References: <20261021080100.2663618-1-bestswngs@gmail.com>
In-Reply-To: <20261021080100.2663618-1-bestswngs@gmail.com>

On Wed Oct 21, 2026 at 8:00 AM UTC, Weiming Shi wrote:
> check_stack_arg_read() bounds a stack argument index with the callee's
> BTF-derived argument count, then uses the index in the caller's
> stack_arg_regs[] array. The array's actual logical length is recorded in
> caller->out_stack_arg_cnt, so the bound and indexed object can diverge.
>
> A crafted BPF_PROG_LOAD can use an argument mismatch to mark a static
> subprogram's BTF information unreliable. Later calls return from
> btf_check_subprog_call() before check_outgoing_stack_args(), while
> check_func_call() continues the static call on -EINVAL. The callee can
> then read a slot that the caller never allocated or initialized. The
> earlier commit 4286f5deee14 ("bpf: Validate outgoing stack args when
> btf_prepare_func_args fails") closed this hole for the first call, but
> not for later calls after the subprogram has been marked unreliable.
>
> Callbacks have a related problem. The verifier can make incoming stack
> arguments readable from outgoing slots at the helper call site. However,
> helpers and kfuncs invoke callbacks through an ABI that passes at most fi=
ve
> arguments, so the runtime callback receives no stack arguments. Async
> callback verification can also reach check_stack_arg_read() without a
> caller frame.
>
> On x86-64, KASAN reports the direct-call out-of-bounds copy as:
>
>   BUG: KASAN: slab-out-of-bounds in check_load_mem+0xb51/0xc60
>   Read of size 80 at addr ffff8881009af550 by task poc/131
>   Call Trace:
>    check_stack_arg_read at kernel/bpf/verifier.c:4234
>    (inlined by) check_load_mem at kernel/bpf/verifier.c:6645
>    do_check_common at kernel/bpf/verifier.c:19568
>    bpf_check at kernel/bpf/verifier.c:21318
>    bpf_prog_load at kernel/bpf/syscall.c:3134
>
> Reject callback subprograms with incoming stack arguments before their
> state is pushed. For direct calls, retrieve the slot with
> bpf_get_spilled_stack_arg(), which validates the index against the caller=
's
> out_stack_arg_cnt and rejects uninitialized slots before copying the
> register state.
>
> Fixes: 0f6bd5e7a804 ("bpf: Support stack arguments for bpf functions")
> Reported-by: <co+eada64ce90ecebce@bugs.sh>
> Suggested-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
> Assisted-by: LLM
> Signed-off-by: Weiming Shi <bestswngs@gmail.com>

looks good, but doesn't apply.
please rebase on top of bpf tree.

pw-bot: cr
