Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B282D73A1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789432761; cv=pass; b=i+tvcty8DgnCdE7fbhhSmKfgxIkWksM5GX/HlnhaHLYojuQmU99jnhheFwT0z02l+MqLrWwDnVULww1QDFwCk/O9cemLatC+nfx31fnsqxX51qX5jenj84dJ9biTdE9OUmd65Kzbz0nqxYwgtmlTCvBsg6Qko6SHWtSwUzvn+po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789432761; c=relaxed/simple;
	bh=BaMmrTOGqMeTWU4cHIgEhE8sDQ/KoVQiVvTC0uPQTBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FvpvyiDd87jE+E/eO+q77f+Wjs/DrWg3DKBKg9Nto8f8ibFqSFUb2Z+s63F4gmDnrx+rlAoNzm9RCJdUPMw6EkkktO3GgXVf/eXkwdWHhZ+PQohkFFyTv4bM9yQlAObi4k5LvEMELlJmV/eoLyTiR6dXcVGnsu1Ivip+svZ4bkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ccu2oByH; arc=pass smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ccu2oByH"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6b1334a3b16so2770055eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:39:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789432755; cv=none;
        d=google.com; s=arc-20260327;
        b=ecONUzw/esQd50F9Z1yVm6Pr5pmE6Q+2GRXhjcLKYOQFwlBoSaM4BtXryPBl7F4gF4
         TuGsn/uqJGIUejJCoop9GEAcIhNpM3+koj/0KyoYKsoHhfcTU0ul85QVj8vDC3cQNHiQ
         rE+vYxnmo/QLwmypBfoP1BkFBX6Qlm/CuaO8Rk5H6chSegl2P9Eu1790mJ6iAB/J5tI2
         tboAXDploSoizQHpkbQ9m6xI5Dazhq28Ny3rvCalC5C/2a2gTj/GEByB4/8zWnZG0pQq
         vBrX/aNt4MELYrfuMH592GEc5a957mWordCXCn7Ig9xQt7imCtsFMIMsnn09WkvXNOYz
         0t2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=acTxuAJD7BV/aV4sehYd/xwIkSac/YA3bN2NNfcEwh4=;
        fh=LfNloc9E+BgBNbz33Uadl/jF+S7YksXzTJcB/HmtnNE=;
        b=SqKIJlWVvcv0fD7xPjG7IdeXPqHSiEiCcgDCPk+E9GS6j4bZi2P06t2pMiNYS9j81V
         B6Z8erivZn/lUia1R9qVYb/M+lfAptJBXqrLiHEI2KJWxCIUpn/h9CJZdeW6BXjB5HvQ
         2yl8BGJv4U4FUg0LFs8oWr+1utABJHXfDxltxkHeSkwsI1EV5KwkFHFkO++/rrqh8U9U
         iWxl9MBZVEcBaq9CXGxv2iWZ7vcGdiex1BNuwZaRZNaQ8lVN3s2vY09unp5OjThUEXJa
         gV1JC7nGNAlAKkhXL+rIOYzpMEoWm3UYoC879x8xjrpzLdND0ISUe0YO8tbTNPBArIaT
         AH8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789432755; x=1790037555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=acTxuAJD7BV/aV4sehYd/xwIkSac/YA3bN2NNfcEwh4=;
        b=ccu2oByHCcoQfzQtaexMd9Ay6oJsJ28oznY98M9ygLCPyt2lkYI35a80FqK6RoD9Hs
         sWQkA8+cDgyLB7KNbo8SBsBScf2/9ArAVserSGi/dagwturj7LRkTD/9z27XnqImqXTH
         qGDNqcj1G8+dywX9TJhsOajM5tk86FWaYibkMZzhZ1lGTBdg1mVVcK+QebbDudfEkGwK
         Ln3va9ZoDFb15i94qoWEE+pD4GIV/lQuWw7wxACRMKqcLUL9YiH7dSjNZlts4SO8slcB
         qBRMdqnZOhA0Y9pvueBuwEl9KcdlEFEFuTCiC3Hyzxw5bzSDW9us2u2EZ2/Y9VTGjlYo
         sJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789432755; x=1790037555;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=acTxuAJD7BV/aV4sehYd/xwIkSac/YA3bN2NNfcEwh4=;
        b=AcLp6V7L5I2fsyx/TuoPXGuQOzkwN71PDUiH/PYQyBnrv2Dn8IxIyNR+NTkMV9jjIu
         eQJfowolLu+SUpDLIJjOF88nZqDoPSO1c6MEVJ1MlP1surtXsMx9AssPx1hzaHN8BhZh
         57MlEQYdtnFDXIOUhNSMDJ8XEAsib6i+blUuwE8J3fMENtc+VkdNb9+r9/H4QcihIX0Y
         8oP2YiX7lEegX0kIdxE3gos4OqTG3YiVEU9S/AEhrAp1CvjbkGHCvC4CQq4RmficEoGN
         gVNLCAF1YU4QzxKgSHJ7Kmgdcf3PPSUo+8cZTCwcm0Mpm0Xi9rsjOBYmqZ7BGi/0ujW0
         QQNg==
X-Forwarded-Encrypted: i=1; AKwUvBzHSeQ2NFBP025Zn+ieWbE5ScS12GsLpHj4n2JF5m5BgbUt+uRSEedInDUkOgN3OGQmezMlI2zuc3Xh6Tk=@vger.kernel.org
X-Gm-Message-State: AFuF++l5IESMqX2/YjIKGUu9hFQ0Pug8h6I76PIYBd6YWw+GJXSHgWX5
	f6yl5Yb2J+FhPqGdn1UC3bNNSz2rebXlOXJSf/RttmiaKiSuIjnGTIEQEOZzTW94h97bavr9asu
	Q34y2cg9JpFyhK0JwbgPlH8QMib8j59U=
X-Gm-Gg: AYBFou2PLO2FCUw4TE5RFnyQyhP6cAW5f6r+1dwh4bpmuGdYzY86tWCdddSzS0DybEO
	MVT8HvuFbKYuAWHH2W5be+reQCGIn9zbwe7/055dGkQDyPZVkhyZNYXXQZvyOxAtiAGzQ2EUdAy
	EYhm1sQfw7PLYXKp0dKKCNKHXjJY5DBYBI5j4zg50NZPmWDVVBfSoU9aSYyQSWo0/Q7n6xYDt7v
	onXZRtgP3Kw+DSl1u4BrFlwIi8NJesFBygbpw6zUAlxdvCH83pVs921trEuJJLFgUYUdAN+d4I/
	1H3oOzK+1YA9ZzGP5A9pSMnnUhsBmF9CFMtUcZpUvFxo8copiSxBYtyd70JXFapiuw==
X-Received: by 2002:a05:6820:4b87:b0:6b7:83d6:2924 with SMTP id
 006d021491bc7-6c542342787mr2847248eaf.39.1789432755522; Mon, 14 Sep 2026
 17:39:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <86d966ec88bbf27d21b2bb4e18c8aa00@kernel.org>
In-Reply-To: <86d966ec88bbf27d21b2bb4e18c8aa00@kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Mon, 14 Sep 2026 17:39:04 -0700
X-Gm-Features: AcwNN1WwzbGgP9OStftE8DTtFg0Y2xPQZsTNxTjlp_yK5QH7a8LBh2qdmMY2Tp4
Message-ID: <CAMB2axMJ6NJUtDc4xhUbSaqUsRyNXfyWTNTR7SCYyRwiBdoLAg@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf: Keep generic __uninit kfunc arguments live
To: Tejun Heo <tj@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, bpf@vger.kernel.org, 
	sched-ext@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 4:43=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> Stack liveness models a kfunc's __uninit pointer argument as a pure write=
:
> whatever the buffer holds before the call is dead, and 2cb27158adb3 ("bpf=
:
> poison dead stack slots") poisons those slots at every checkpoint the pat=
h
> visits before the call. Argument validation disagrees. Only dynptr argume=
nts
> honor __uninit. A generic fixed-size buffer goes through check_mem_reg(),
> whose read pass requires every byte readable. The two rules meet at the c=
all
> and the poisoned buffer is rejected with "slot poisoned by dead code
> elimination", even when the program initialized it.
>
> Every kfunc with a generic __uninit output argument is affected,
> bpf_ksock_create() through err__uninit and sched_ext's scx_bpf_cid_topo()
> through its output struct. The rejection needs the buffer's slots to be
> allocated and dead at a checkpoint, for example on the second iteration o=
f a
> loop around the call. Before e566701b9b0c ("bpf: Check fixed-size mem arg=
s
> of helpers and kfuncs the same way") kfunc arguments could read poisoned
> slots, so the call passed, but the slots stayed poisoned and the program'=
s
> next read of the buffer was rejected instead.
>
> Restrict the liveness write-only exception to dynptr arguments, where
> validation accepts uninitialized output. A generic __uninit buffer stays
> live and is never poisoned, and validation keeps requiring it to be
> initialized. Add a selftest with a scalar output buffer and a checkpoint
> between its initialization and the call.

I don=E2=80=99t think restricting the liveness exception to dynptrs is the
right fix. The fact that generic argument validation does not honor
__uninit appears to be the underlying bug.

A generic __uninit argument should behave like a helper output buffer:
generate MEM_UNINIT | MEM_WRITE, validate it as write-only, and mark
the written range initialized after the kfunc call.

With that handling, bpf_kfunc_stack_access_bytes() should continue
returning -size for generic __uninit arguments. The current change
instead makes their previous contents live and requires callers to
initialize an argument explicitly declared uninitialized.

>
> Fixes: 2cb27158adb3 ("bpf: poison dead stack slots")
> Cc: stable@vger.kernel.org # v7.1+
> Signed-off-by: Tejun Heo <tj@kernel.org>
> ---
>  kernel/bpf/verifier.c                                      |    3
>  tools/testing/selftests/bpf/prog_tests/verifier.c          |    2
>  tools/testing/selftests/bpf/progs/verifier_kfunc_uninit.c  |   45 ++++++=
+++++++
>  tools/testing/selftests/bpf/test_kmods/bpf_testmod.c       |    9 ++
>  tools/testing/selftests/bpf/test_kmods/bpf_testmod_kfunc.h |    1
>  5 files changed, 59 insertions(+), 1 deletion(-)
>
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -12755,7 +12755,8 @@ out:
>         /* KF_ITER_NEW kfuncs initialize the iterator state at arg 0 */
>         if (arg =3D=3D 0 && meta.kfunc_flags & KF_ITER_NEW)
>                 return -size;
> -       if (is_kfunc_arg_uninit(btf, &args[arg]))
> +       /* only dynptr validation accepts an uninitialized __uninit argum=
ent */
> +       if (is_kfunc_arg_dynptr(btf, &args[arg]) && is_kfunc_arg_uninit(b=
tf, &args[arg]))
>                 return -size;
>         return size;
>  }
> --- a/tools/testing/selftests/bpf/prog_tests/verifier.c
> +++ b/tools/testing/selftests/bpf/prog_tests/verifier.c
> @@ -53,6 +53,7 @@
>  #include "verifier_iterating_callbacks.skel.h"
>  #include "verifier_jeq_infer_not_null.skel.h"
>  #include "verifier_jit_convergence.skel.h"
> +#include "verifier_kfunc_uninit.skel.h"
>  #include "verifier_ld_ind.skel.h"
>  #include "verifier_ldsx.skel.h"
>  #include "verifier_leak_ptr.skel.h"
> @@ -214,6 +215,7 @@ void test_verifier_int_ptr(void)
>  void test_verifier_iterating_callbacks(void)  { RUN(verifier_iterating_c=
allbacks); }
>  void test_verifier_jeq_infer_not_null(void)   { RUN(verifier_jeq_infer_n=
ot_null); }
>  void test_verifier_jit_convergence(void)      { RUN(verifier_jit_converg=
ence); }
> +void test_verifier_kfunc_uninit(void)         { RUN_TESTS(verifier_kfunc=
_uninit); }
>  void test_verifier_load_acquire(void)         { RUN(verifier_load_acquir=
e); }
>  void test_verifier_ld_ind(void)               { RUN(verifier_ld_ind); }
>  void test_verifier_ldsx(void)                  { RUN(verifier_ldsx); }
> --- /dev/null
> +++ b/tools/testing/selftests/bpf/progs/verifier_kfunc_uninit.c
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2026 Tejun Heo <tj@kernel.org> */
> +
> +#include <vmlinux.h>
> +#include <bpf/bpf_helpers.h>
> +#include "bpf_misc.h"
> +#include "../test_kmods/bpf_testmod_kfunc.h"
> +
> +char _license[] SEC("license") =3D "GPL";
> +
> +/* keep the BTF FUNC record for the inline assembly reference */
> +void __kfunc_btf_root(void)
> +{
> +       bpf_kfunc_call_test_uninit(0);
> +}
> +
> +SEC("tc")
> +__success __retval(42)
> +__flag(BPF_F_TEST_STATE_FREQ)
> +__naked void uninit_scalar_struct(void)
> +{
> +       /* dead before the call, so poisoned at the checkpoint */
> +       asm volatile (
> +       "*(u64 *)(r10 - 16) =3D 0;"
> +       "*(u64 *)(r10 - 8) =3D 0;"
> +       "goto +0;"
> +       "r1 =3D r10;"
> +       "r1 +=3D -16;"
> +       "call %[bpf_kfunc_call_test_uninit];"
> +       "r1 =3D *(u32 *)(r10 - 16);"
> +       "if r1 !=3D 1 goto 1f;"
> +       "r1 =3D *(u32 *)(r10 - 12);"
> +       "if r1 !=3D 2 goto 1f;"
> +       "r1 =3D *(u32 *)(r10 - 8);"
> +       "if r1 !=3D 3 goto 1f;"
> +       "r1 =3D *(u32 *)(r10 - 4);"
> +       "if r1 !=3D 4 goto 1f;"
> +       "r0 =3D 42;"
> +       "exit;"
> +"1:"
> +       "r0 =3D 0;"
> +       "exit;"
> +       :: __imm(bpf_kfunc_call_test_uninit)
> +       : __clobber_all);
> +}
> --- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> +++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
> @@ -1087,6 +1087,14 @@ __bpf_kfunc void bpf_kfunc_call_test_pas
>  {
>  }
>
> +__bpf_kfunc void bpf_kfunc_call_test_uninit(struct prog_test_pass1 *out_=
_uninit)
> +{
> +       out__uninit->x0 =3D 1;
> +       out__uninit->x1 =3D 2;
> +       out__uninit->x2 =3D 3;
> +       out__uninit->x3 =3D 4;
> +}
> +
>  __bpf_kfunc void bpf_kfunc_call_test_fail1(struct prog_test_fail1 *p)
>  {
>  }
> @@ -1493,6 +1501,7 @@ BTF_ID_FLAGS(func, bpf_kfunc_call_int_me
>  BTF_ID_FLAGS(func, bpf_kfunc_call_test_pass_ctx)
>  BTF_ID_FLAGS(func, bpf_kfunc_call_test_pass1)
>  BTF_ID_FLAGS(func, bpf_kfunc_call_test_pass2)
> +BTF_ID_FLAGS(func, bpf_kfunc_call_test_uninit)
>  BTF_ID_FLAGS(func, bpf_kfunc_call_test_fail1)
>  BTF_ID_FLAGS(func, bpf_kfunc_call_test_fail2)
>  BTF_ID_FLAGS(func, bpf_kfunc_call_test_fail3)
> --- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod_kfunc.h
> +++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod_kfunc.h
> @@ -160,6 +160,7 @@ __u64 bpf_kfunc_call_stack_arg_big(__u64
>  void bpf_kfunc_call_test_pass_ctx(struct __sk_buff *skb) __ksym;
>  void bpf_kfunc_call_test_pass1(struct prog_test_pass1 *p) __ksym;
>  void bpf_kfunc_call_test_pass2(struct prog_test_pass2 *p) __ksym;
> +void bpf_kfunc_call_test_uninit(struct prog_test_pass1 *out__uninit) __k=
sym;
>  void bpf_kfunc_call_test_mem_len_fail2(__u64 *mem, int len) __ksym;
>
>  void bpf_kfunc_call_test_destructive(void) __ksym;
