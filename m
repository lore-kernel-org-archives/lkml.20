Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794395852;
	b=HwsTGfvxG5Ab9eqfJyaq0FDBhvkrEzc9gxrsiO//50K31G0toNytnTCarYYBdvnPB4Nq
	 J62rnQGXUPf5c+ZqAY49CZPA9uo40EzLDXo2imkdkEKvhPCR7X63T1W+pRy5k+zzCCdMv
	 kSza71ZXjydZCckf0BE80Zx8AQbPoGOCWK8WUuMvci5sAGxsHic+HjrbtIVLXdK5J8/D8
	 5nv9bZImY0TpCOLu3LfHcWr2j/WUd4ZQc3WjoQlddWOMP/ZG74FHhf9ExvMqA3LMBEPbJ
	 j0E50st3Ck8d34h0OiANw2hl9tAkvp0wHy+eyqe3RWh4vczV4lhci4P6+1jia12fevw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ozSf+hL1jldFALEH5fXM+3KXfDAEgs0BjajLN8xbzFA=;
	b=4PrO6BWTh0kAdjrpr3qRD2Djc64uut7d1APDCB5Hl7KsE+8KC5mKJTCMN/skeXEQ++0b
	 bEWcmbyqPOu54CM8MUwP7+vJx+RBQlmU3jHo1iPnpm6dbPGAgZdspc4brnP1UJ4ZCxzCK
	 zqNc3DaV8nZcqCkrtHeAPp9SOzzZ5HC9gGJUKy7LZrkPq/rJhcn1rJDjz684X+XvutXdZ
	 zMId/YbPdGBIrRfh+4V9IJo/V611VgJu3vjwd7B5oOSxYNv56oojMAj7patqvrqvEBAwh
	 1IQLhIMXOgeV3BjTXwwcQQ0QK1ZpDJ+RGTiuxOfZm1pKjLVLKSk+qwJbUgXaHAV5bfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uGeU3Xvv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F647606A336
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F647606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uGeU3Xvv
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67bec5dc8d4so2049245d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:17:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794395851; cv=none;
        d=google.com; s=arc-20260327;
        b=HUSU02qDK6FDPD1PRx5b1HcdqcG6dNp16/xfhXlqlRr/oa5t5z3WC35CnGPUuswYqg
         g8YCFo/dZDw/r4CMzXRxeSYfDySPoW7HjE8KRQ8k9KP8ZDzWhW+WBNjlUZfwEJe2DVrN
         LS05KCvfpWtOsIrQHNNVJjCSnGjww1BCmgsez71cXIUfXcQGSHQ4rtYAisrus5Xai/jg
         BqVu8GPPiaxa+y60I1i6vX0ERORLbix4sewlloZ8jhfjHzPlN+w0l+BeDztOGTwMs6Bu
         wKLpxOYrWyxChUUAWsot+h127NTQ4nIIpFahnT3X03+rxu7UnSU9UCC7PL2J3PHXsBbY
         zE8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ozSf+hL1jldFALEH5fXM+3KXfDAEgs0BjajLN8xbzFA=;
        fh=vnoocVpch77Xz5VxjgYITVOTBMKYpbfwR1x2kgvWBJI=;
        b=F4wv9DLYe+jL4gl1E4fPhUVaW+AW2tB87LtWBmVwoe64xosMEKkrJEA728eZ/jLS54
         lAi+ezp6sxBdOFKcOUyWC7DLATADI8PccTN5JQ8A+mzXLDLWdDLfZeC5tbC42fZDLihI
         8S3osBz0XaRi6Gab2OW56A8EzNZB4TcMeniVNxlaWOkvn0RVpK0P0pw8V8XbGSfCARDN
         3mWHTMarYnzpmFHsY6zha3+OVxuk71aRVcob023rDxb/KitICZPD/wOjlqTx9gesMdSh
         f5+D1Pbju+UIffEp3HT0oo1J4wtoD7+xbain8uwCIgW6NThfhgl8ujrKljf46r2+5uck
         A6nA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395851; x=1795000651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ozSf+hL1jldFALEH5fXM+3KXfDAEgs0BjajLN8xbzFA=;
        b=uGeU3Xvv/E7K4BHv6EBIagPuXvkh/1ouclHKAD7X+55xw3flHGdEAvIEZ1+liX+9Ct
         OK3eR6JiKmvu/bTADMu/L094pqKMP3JlFDrFkmeEuQL/qbs98nXqNAayfOE6SlLGBy/i
         5rWPVAMT2vjGduqRBzvKbha2e/14GMcDKrPOPrIZfuUrCLCPxtESkzNMGRAcSRTHGS3g
         tVxjimEidLB2HovXkax5tEhnhMNl9pI7hJ676R4QBJyp8VcJr6yuwZqzvj7KXnCZnpcr
         +UsUqY+lE3FVkkVFk8cYp4y/FHG6VlpsAD6kKqVhuqC7Ol1B80XgziGLdVWXkSJReizL
         HJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395851; x=1795000651;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ozSf+hL1jldFALEH5fXM+3KXfDAEgs0BjajLN8xbzFA=;
        b=dTPIQlS6e5tmDetH6NJDd43nHTMwnM3IRSNytpKiyU6bGYrfdg3VrmDW2Ndlvc98TA
         5BFPvtild9Dh2F+wwL3b3UZGHCpwdPV0umTLDaS5+q5bSDQHPk6Lv85dnwYCWQVFMRQd
         7wfHDnJqvxVoa5dApjKMaph0mN1gczW0XFDEhMAl2UCykN0o5dNQPq8ENiTr++ebBm3K
         H2IKDjTkMuChEfHwQMZve5ofykTugt9ApxktMWVyjfcjTtWrJoZ16nMDUAIMyvb0nBnb
         XQleVh+od9302/4jCw9KAvy/Hy3gUv/fDgy6RTYJvP5FBN1FiftJZYkIQcervDM8MAmx
         /8Xg==
X-Forwarded-Encrypted: i=1; AL+hErHc8sVqbD/FN3o7lf/U2dviQj/v5N64A4CAUsjjN5qnTQzXFW3OcieveLqR1Kt444r+qiYmz9f9pP8rMtM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uJxPlzPBD5J6rVZNn8baAR2dmTcfOrv+0YwT5pytmfuwZwwzi
	qkp8RYx9Engmu9ifOqJesy54L7tfMTodDQv/DsBUEOibzJn9+CWoxRilbS9CWi5P02ZbkF5jUJI
	PjEs/d9slbClnfRFuzJp/bMxsyUb+sTo=
X-Gm-Gg: AYBFou2RLyErdhMI/XRXJns1bLZ6Gvv96Hu6qURgveY/TvGB3jKvAnua981sgLPMXnW
	FC/H/2e7tBhTGojLdWENIL9mL5SgM0B7ci5WnpiUYdnXuryy7VOdC1zzQiekFF++jQm6fxUWifs
	zkPUhXsLqAcKzHs3HJce59y84e3uhN236DUU8SjcD44ZElLI5ZwLLWW9f7kjTls9MbBEWF4NFhL
	l+nIy7z6lRvYbNY/jMW8h8M5KGEsbPT0mw98a62HfHlK7iBbR5X6a1cztkm3BElsmWT7cJWxvZ6
	RToZdHZSjYHFWhDSm54leC6XZIisKA6mfPeTonNoHPkE2lJ4jhBYY6G/lMeCYLFjQMA3NG/eCyV
	B1ilkT7uYfdP0retYN0v1vMZrVx7Iv5cQCtGSfA==
X-Received: by 2002:a53:b852:0:b0:677:dee1:5238 with SMTP id
 956f58d0204a3-67c6800672fmr1304770d50.88.1794395851255; Wed, 11 Nov 2026
 03:17:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110164046.454431-14-a.s.protopopov@gmail.com> <c4f98afcae91b54b30f5e9fdab98125cdccf00b1c7a71afff1b16e931798c314@mail.kernel.org>
In-Reply-To: <c4f98afcae91b54b30f5e9fdab98125cdccf00b1c7a71afff1b16e931798c314@mail.kernel.org>
From: Anton Protopopov <a.s.protopopov@gmail.com>
Date: Wed, 11 Nov 2026 12:17:19 +0100
X-Gm-Features: AclHuK-dO1SKaAz8hkch1ydpFF2M6TtEYCVoI-_FOK3-FQcq1UUZ0nYxEBIVVmg
Message-ID: <CAGn_itydZuGfTHvNMo5VvmvAnXGp60J7MLXDWxBo5rj=aVh+5A@mail.gmail.com>
Subject: Re: [PATCH v3 bpf-next 13/18] bpf: Check the return values of
 fmod_ret programs on found targets
To: bot+bpf-ci@kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, almagui@kernel.org, john.fastabend@gmail.com, 
	qmo@kernel.org, brauner@kernel.org, kpsingh@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, sashal@kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, martin.lau@kernel.org, mason@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 9:21=E2=80=AFAM <bot+bpf-ci@kernel.org> wrote:
>
> > bpf: Check the return values of fmod_ret programs on found targets
>
> TL;DR: Possible wrong behaviour: fmod_ret programs on 64-bit found target=
s
> don't require the JIT, so in the interpreter -14 may reach callers as
> 4294967282; a later commit fixes this, leaving a narrow gap here.

This won't apply anymore (see jit-related commit before)

>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
>
> [ ... ]
>
> > +static int fmodret_retval_init(struct bpf_verifier_env *env, u32 btf_i=
d,
> > +                            unsigned long addr, const char *tname)
> > +{
>
> [ ... ]
>
> > +     if (!cnt)
> > +             goto invalid;
> > +
> > +     aux->fmodret_retvals =3D retvals;
> > +     aux->fmodret_retval_cnt =3D cnt;
> > +     return 0;
>
> For a found target that returns a 64-bit integer (size =3D=3D 8),
> check_fmodret_retval() accepts the full 64-bit R0, so "r0 =3D -14" is
> accepted as the s64 value -14.  Nothing here makes such a program require
> the JIT.
>
> If the program runs in the interpreter, prog->bpf_func is
> __bpf_prog_runN(), which is declared in kernel/bpf/core.c as:
>
>   static unsigned int PROG_NAME(stack_size)(const void *ctx,
>                                             const struct bpf_insn *insn)
>
> so only the low 32 bits of R0 come back.  The x86 trampoline handles
> interpreted programs, stores all of RAX and returns it to the caller of
> the traced function, so the caller of a long-returning found target would
> see 4294967282 instead of -14.
>
> That value is non-zero, so the function body is skipped, but it is not an
> error value either.  Callers would treat the skipped call as a success
> that returned a large positive value, which is the case the commit messag=
e
> says the check is meant to prevent ("Returning such a value instead of
> calling the function looks to the callers like a real failure").
>
> Should fmodret_retval_init() set env->prog->jit_required =3D 1 when
> size =3D=3D 8?  A later commit in this series, c4a7eee0c4d7 ("bpf: Requir=
e the
> JIT for fmod_ret programs on found 64-bit targets"), adds
> "if (size =3D=3D 8) env->prog->jit_required =3D 1;" right after these
> assignments.  No found target carries the tag until 8659bd72073c
> ("resolve_btfids: Tag fmod_ret candidates as targets"), which comes after
> that fix, so the window is narrow, but it is still a gap in this commit's
> own logic.
>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/429818=
85558
