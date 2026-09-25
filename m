Received: from mail-wr2-f10.google.com (mail-wr2-f10.google.com [74.125.225.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0FD38553F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790303866; cv=none; b=tuPwtwbBJcykq+5rhgSy5rl/poDCyX/xfLm7do8VBNUNzHy4RL5irikTkRGUILBiACrXxewCN7YwDBh0xY1VifS7PXi1B0OsQuJ8TyTVnMpcQF/8fF6cophCgKKOmDnv5qm50jE7t3uVLKRaJjBGtUQiMrfxMP9rd/xkCcnN3cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790303866; c=relaxed/simple;
	bh=AsFUfSymoXxe3PYq49HqvkD0Rmv1ux0SLMXVI/O8HtE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=BTMtt6ByxLgA2CXh8RPtRCccLiBpn4Hs84jDo4pO1mF9NLQuOND15uoDii6t0u3MGMqrD9Rv9kqUfbi6wQqfR5QunNtyT50yWeUBC/WhBi80s/SBSCGiunBGVCgC6yXk5KeIhZfADlncUihykUIIaqocX/Tf9Qu0Fgy5xkkf+50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJN5szcE; arc=none smtp.client-ip=74.125.225.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJN5szcE"
Received: by mail-wr2-f10.google.com with SMTP id ffacd0b85a97d-484372811e5so90614f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790303863; x=1790908663; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WkiNZFTPZPZT1wc5CDbxjD82Jdoa50pqexDq5GslU6U=;
        b=hJN5szcE+khVBCf5W/semLM/6ymKBvD0xpWxLVz1M7d2TqDCFA0DfjsU4WLU3idT7j
         VQMexFHJ2NGR6WTy1YoLLiKm+Isa3Etm/0HuvrnpoT1yVE8Jdes4c0/M4wQlJ2h/0JTK
         7pn60Fhtgx4KLreL2bfn6m7nWmCsM2783zQX/XzL7ufUBEdNMqQi5XP2mx2LbdX0pGDO
         8Y32qrouEzzIC+3QyIK1W1gJukW0Lhfxfzawbw3Uqil2vA0ZMRpA5gXXd8dtARi25o65
         4sUx5vAhnKFPvQkIdzcBtaVUB8ApVIOpqcE3z7ASYnI130dWJDg73qM1qpRKAkkvik0w
         KREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790303863; x=1790908663;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WkiNZFTPZPZT1wc5CDbxjD82Jdoa50pqexDq5GslU6U=;
        b=05u96ILN7gRQX5CatRT3SgljTAajzzJ2Sij8ixa4m2V9+lZ3XjgKNKkqSLxGzZ0M5b
         BVohx3py89YJBJ/9bhZuJsnqo8tSAc3cLTEezh0I24/qex9Yd0HV4J0/Opgmv1VPovs9
         WApn1ZqY1pw3OrWKMQyGPsO5DEZInqaGWN1UrNZPOyfPK2RvyF2obhxKvpybffKtYthA
         NNkzZmnUNDRRqFXnmz/slT8e85wEsC4dZ96z4/Bm4RpMDe1iuvknIk3NG+ppqwu6c6c+
         FooA6AGizX15n7KlrFDTQYwLcpDmBJoqmDd43fGDAWAXl6DGdIsed3NSH47IBtHUZlMp
         Vy3w==
X-Forwarded-Encrypted: i=1; AKwUvBzxldIxNNT9aWHiGVd57dRRzm4OKTZdCg24LNZP9Kcuqy9mY2Y2dblZRVIx1vxYsA8HMEsLr1lUU6N7TK4=@vger.kernel.org
X-Gm-Message-State: AFuF++noVCOS4tJ8LkrnxmRgz8I7vCcLLv2qKyZjS4NIhAXOqwd6cb6+
	nl6yr2v8ySa0rxWXCU0rxK+I95+5UQo2CrGZiw3jdXTf087XMy3uEIyf
X-Gm-Gg: AYBFou1NFcqXVyxsgRPLtTO8u4vWp0IlpTELaAWmSwPaQmz4P3BTWRn0L7HA2tHhlKO
	Rw78GnvHrd9rCQG7NNgjPZMnPlLwfW8ZC0MnC7fU69Zl5NEvMyqlCu+yzAnwtG1d0MRPok0GhAO
	xFJwfdQ0JqVPkZMAOymPR9a+pAWmjvYrXnL0pNDcEJfuBTqU+Qv09gAV2l8N57c4+BxwXKNkwpF
	izK8X0EoIhtO41SgBDZ4rdSsZasftPLL4RQrDdnZPvCFdSJSbT5XTw2rzqzsUJNaosfYLHNvfMl
	KAdU4LSXUAQTUE2hlgXq5RH5jh5yRpKgkdjDDIF+Cq8r4CljLRJPlrhZI6cHq632RgIolG9APMi
	+cMVm8kcxdLotGoRLoTgCCPQFybuLQ/VjaYqkwO12YvJWX6SSjBntrz6+OUjQo5bUPtRvjjGg7x
	N5O3/dDzv31KUtKeIunspr/qX5znp4ztnQUzGf7xS2yOr//4QkoyKUVPnq69LqclM+/kUP472tB
	WOLQbXzOQyihkTM3F+Wx88IL2yffhLDKnRNsgxFHduHv1rZ0pubzm03+OsLuuOhGgI8OK5jPQ6Y
	BhVFFAw09i22NbqhTpA+XaGRyEIjrzLal6iplg==
X-Received: by 2002:a05:600c:1d0d:b0:49c:f4e1:4c2d with SMTP id 5b1f17b1804b1-49fe66f144fmr74853495e9.16.1790303862667;
        Thu, 24 Sep 2026 19:37:42 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fee911e9bsm35417685e9.1.2026.09.24.19.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 19:37:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Sep 2026 04:37:40 +0200
Message-Id: <DLO1R3IFYJS1.23SRQCZUUG6NF@gmail.com>
To: "Hao Sun" <sunhao.th@gmail.com>, <bpf@vger.kernel.org>
Cc: <ast@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>,
 <eddyz87@gmail.com>, <john.fastabend@gmail.com>, <martin.lau@linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] bpf: Fix uninit read for non-fetch atomics on
 partially spilled slots
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260924131342.934290-1-sunhao.th@gmail.com>
 <DLO1FZU14J3C.1SLTCMVTS8DD5@gmail.com>
In-Reply-To: <DLO1FZU14J3C.1SLTCMVTS8DD5@gmail.com>

On Fri Sep 25, 2026 at 4:23 AM CEST, Kumar Kartikeya Dwivedi wrote:
> On Thu Sep 24, 2026 at 3:13 PM CEST, Hao Sun wrote:
>> check_stack_read_fixed_off() skips partial spill checks for non-fetch
>> atomics; the following prog can be loaded:
>>
>> 0: (b7) r1 =3D 1                        ; R1=3D1
>> 1: (63) *(u32 *)(r10 -8) =3D r1         ; R1=3D1 R10=3Dfp0 fp-8=3D????1
>> 2: (db) lock *(u64 *)(r10 -8) +=3D r1   ; R1=3D1 R10=3Dfp0 fp-8=3Dmmmmmm=
mm
>> 3: (79) r0 =3D *(u64 *)(r10 -8)         ; R0=3Dscalar() R10=3Dfp0 fp-8=
=3Dmmmmmmmm
>> 4: (77) r0 >>=3D 32                     ; R0=3Dscalar(smin=3D0,smax=3Dum=
ax=3D0xffffffff,var_off=3D(0x0; 0xffffffff))
>> 5: (95) exit
>>
>> When test run:
>> 	retval=3D4294967295
>>
>> Note fp-8 is ????1 at #1, yet it becomes fp-8=3Dmmmmmmmm after the
>> non-fetching atomic add at #2; hence the high 32 bits are leaked.
>>
>> Fix by applying the partial load check; after the patch, the
>> prog is rejected:
>>
>> Verification failed: Memory Safety: Uninitialized stack read
>>
>> Reason:
>>   This rejected read uses 8 bytes at stack offset -8, but byte 4 in that=
 range is uninitialized on
>>   this path. Programs loaded with CAP_PERFMON can be allowed to read uni=
nitialized stack bytes, but
>>   this program is being rejected without that allowance.
>>
>> At:
>>   ...
>>       0 | (b7) r1 =3D 1
>>       1 | (63) *(u32 *)(r10 -8) =3D r1
>>   >>> 2 | (db) lock *(u64 *)(r10 -8) +=3D r1
>>       3 | (79) r0 =3D *(u64 *)(r10 -8)
>>       4 | (77) r0 >>=3D 32
>>
>> This affects CAP_BPF only.
>>
>> Fixes: 354e8f1970f8 ("bpf: Support <8-byte scalar spill and refill")
>> Signed-off-by: Hao Sun <sunhao.th@gmail.com>
>>
>> ---
>
> The same root cause is also reachable through check_stack_range_initializ=
ed().
> It takes the spilled register path for every byte of a slot holding a spi=
lled
> scalar, without looking at the byte's own slot_type, so a helper or kfunc=
 memory
> argument spanning a narrow spill still reads the uninitialized half witho=
ut
> CAP_PERFMON:
>
>   r1 =3D 1;
>   *(u32 *)(r10 - 8) =3D r1;
>   r1 =3D map_ringbuf ll;
>   r2 =3D r10;
>   r2 +=3D -8;
>   r3 =3D 8;
>   r4 =3D 0;
>   call bpf_ringbuf_output;
>
> loads with CAP_BPF alone and copies four uninitialized bytes of kernel st=
ack to
> user space. The fix is to only take that path when *stype =3D=3D STACK_SP=
ILL, so the
> rest of the slot goes through the usual MISC/ZERO/INVALID checks like any=
 other
> slot. Could you add that to v2 with a matching test (same Fixes: tag), si=
nce
> it's the same bug on the helper path?
>
> Locally I tried something like this and it addressed the problem.
>
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index 200ec0f71617..9166dccef95a 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -7481,7 +7481,12 @@ static int check_stack_range_initialized(
>                         goto mark;
>                 }
>
> -               if (bpf_is_spilled_reg(ss) &&
> +               /*
> +                * Only the bytes marked STACK_SPILL hold the spilled reg=
ister.
> +                * The rest of a narrowly spilled slot keeps its previous=
 type
> +                * and must be initialized on its own.
> +                */
> +               if (*stype =3D=3D STACK_SPILL &&
>                     (ss->spilled_ptr.type =3D=3D SCALAR_VALUE ||
>                      env->allow_ptr_leaks)) {
>                         if (clobber) {
>
> Please also target bpf-next in next revision.
>

Actually, I just applied these two, so you can just follow up with extra fi=
x +
test.

> pw-bot: cr

