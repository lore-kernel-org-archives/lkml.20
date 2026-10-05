Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE84D43F0A6
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 22:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791240671; cv=pass; b=VmYrQXEg1UZ11Y3P22YmcnCivW/Lhde9c0q7U3N9OO9l952BqkJDgCSSSkU6tQPooColElROYvQsWH3pHTjE9q1zOeG22LzHXQ4jwbHp3709NgQmzI3irbIrQt+VVU7jsT4EXuNrHeCcnhlgU8S5EpkHiYTBTBtaXqh7i+qDLwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791240671; c=relaxed/simple;
	bh=JQp79QdXMBa8gKuR5AX2akv+YN6nx4DC8+zM8t67W/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cr4Ni/HgyfE/Tm5dIb8WFkdvaHmObXOKLe7mhdzcXDFsIs9tUvkIagl/Zq8uVgdXt2/s5sNMU8OhKp8OOQS0ru3Lv3rXniPZjf1i5hEEJCDD6z+aDo0fJ18XlrB1VA/9Qc9AJnE07ZIPofwCjLbJQt8fMVstJ2K9FeQjslXQb2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WxoN9861; arc=pass smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WxoN9861"
Received: by mail-oo2-f39.google.com with SMTP id 46e09a7af769-82401febe1bso1565750a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 15:51:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791240667; cv=none;
        d=google.com; s=arc-20260327;
        b=gHZVomC9gk3Pz7nWMHcqZ53p9WCXhdJOdu/GaFonbwj4lgwVwIYTWF5q1CmqXAe2tD
         EzjCclXIiMlGp4Ge0/pG9Gr1ZN/ioQ2Wfda0x35a1br+D0hb1AyVf/QCyqkXO4cCX918
         BJogdWeKIywBTZckZswvBgH3QJT5Ow1CBG9YuvA0qAWtdQzzOsE3O748naysJFkDN+fl
         fJEaCDnD3KN9JPOqHCssaMGDJOS5msLOqoEyPiutYZUfDUYj5VhMxRqhmJPgmtPK6qKj
         qUBPiOA0bdrkkNDgzoN2f3ogq2Cpp9ZWoFNL0ioRzHU3ZT2b7sihe4OZ2+7V06jTFJZ3
         wnlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ecuq0kzHluDJrU005ZlX/7dg+ri9ToBEBr09r3eRnfg=;
        fh=Is/neBtuz5WAMylLFo2CXmAr7g2WX2S7HNIMSKrEXMo=;
        b=aNqELvKUgsZery/aPsnWdQDGGMD2gq3bxizXFjs9omAJBDNH+/xBZGvlnvrkNM5XT0
         DwOjR0phVNVsS6qq42Prd3Wbm00GuGgONjs7P8HwOVzKfD79NPscleslUkEErhNxppSi
         plLUhXqGwfnNuQDXhQyW+abG0FL2dOCtyR9sdxlTFmzVTrhafu5bxLR6utidUzyPam5v
         4QOBQRxzpUyTfDzzIHe6nWIzZOik2KVROpsHrL165hDn5X73i/84T0S42swemBdIQPXc
         DmRWkDt1zpss7iFNIT6w06Zf7nWBB/CT+wuZ5Oe12GJHXGKpMe+CKUeus8Q4vfVyVavP
         1W0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791240667; x=1791845467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ecuq0kzHluDJrU005ZlX/7dg+ri9ToBEBr09r3eRnfg=;
        b=WxoN9861sK8lRXrTKSIipQ4Ujp+mWI9aJQSGfeL4lYo0TjcFIZi/jOitbum/62TJYH
         JWDATsefbqlZcTI/X49puzfBbRk76q6Gxb7lDT+miF3DOBHHilh5vJKtwTDdBDdb6x7C
         bUDCfzWXhbanaLC3QbzGiPJ/sYwjJ2N3u6Ldilq+bA2f01DDuEm7Wh0RvoFXQIkKiyqR
         d5ylju8fevUyhMR1wZ9DR+v0aF9iEd0J28JdaQLXLHF5+oqCUa6OKnIV0uAzx4RX9Ayu
         qIDzMQt0je3lpYYuF8dodOHgfqWHuH2uU93+MdAYMy2ikwFnmpq6TNmDguT95xhCj6RR
         f/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791240667; x=1791845467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ecuq0kzHluDJrU005ZlX/7dg+ri9ToBEBr09r3eRnfg=;
        b=VeSnrTLMz5IchDhsnmuIy2EtbxldPFdt/fyTE41bkV7oU2Q0ExahyZZIO91y37L1I5
         9ypYeXIPYu710IDPU4V6XJN6q/9LI4ujz059ReeVHUEPezh88tDpiWpKXYa+cxffxb3A
         Gc8uuuz+T2am7var8db/EITfayjphcBybykk/rc5GdUMZY1zkXX6z+DfCwI0/LV2lVsv
         MWJmZamGL2QToXbw1KrNgcMMrPBWlWqlzLSNDWGMUqJVwk6zJjwxlMXKFB9E9SKd5Tnj
         Kxvf4s7Ftl5MZwAL84UlHjDJLxhcWcu3ahkLbJQSp2Jbze4lX2sVbaPRQLN5K2GyNX0U
         w1kg==
X-Forwarded-Encrypted: i=1; AKwUvBx57Gyk6MnVDnN/D4AeCFind01yyr1fMjreLt1qz0VeWlS1UycZDiziMi7mH4QTiL74Cgx+pSbW9T077uA=@vger.kernel.org
X-Gm-Message-State: AFuF++kADfvTQvIUxz081R1KqZDybI19YoW9DUmODgldntofjCXXDrWd
	cQVoashac5Nyv3ONa3ZPlQewH86LhLgjjuslFSKh2SCm6uKsWzXVeFve4Ti/dcgZwyCKRTnMqYK
	GZykMPN/vQxNgxCv4T3mVnbblvuTVf7Q=
X-Gm-Gg: AYBFou24rjyk7JednIfOjw7mndN6KY1VciQFKrYy3nVms+uNY5vVmmCWkjoOsiEHr8k
	214Wv7KWjtsNjZxOoExc+lIAe8V9OUomIH/QuG6dgHOd0eRGMY6YeeTkhC/lcRDO01cOu3sgA7/
	qRHOsyCquM1vThBctj2yoQpksj0yR2h+FGhwF/4Ljz3rncA06LVZX+4bt7DV4pKkLfAN9IiU7Dr
	8UEaLv2PldBjNsTgKyMWu9eAtEknhmVHELSQ8x68+0MZ+TgRM3R8/xevPvlRl2C1WfnVNZ68R17
	vBQfrCIPk1zrhKZDfofUMBXFVeabRxM0f4IBv9xcOHCgH4RpWpKpV07mRqQIRGs=
X-Received: by 2002:a05:6808:508e:b0:4f9:595:b80e with SMTP id
 5614622812f47-4f905960b1cmr4500444b6e.34.1791240667582; Mon, 05 Oct 2026
 15:51:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-a3-arg-trusted-v4-v1-0-50ee0268fd39@mails.tsinghua.edu.cn>
 <20261005-a3-arg-trusted-v4-v1-1-50ee0268fd39@mails.tsinghua.edu.cn>
In-Reply-To: <20261005-a3-arg-trusted-v4-v1-1-50ee0268fd39@mails.tsinghua.edu.cn>
From: Amery Hung <ameryhung@gmail.com>
Date: Mon, 5 Oct 2026 15:50:54 -0700
X-Gm-Features: AclHuK8zBX-mtp_yJj-5sCOyT12IpJXdXhLg7yENqiCJALP4ywh6Sl7KbDFCwoo
Message-ID: <CAMB2axNnY5wxkTrd3_tHyXBzXYyjJUkqRb1uNbUquwTJ_FLVMg@mail.gmail.com>
Subject: Re: [PATCH bpf 1/2] bpf: Require referenced or trusted pointer for
 __arg_trusted arg
To: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
Cc: Eduard Zingerman <eddyz87@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	John Fastabend <john.fastabend@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, bpf@vger.kernel.org, 
	Song Liu <song@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 8:23=E2=80=AFAM Yiyang Chen
<chenyy23@mails.tsinghua.edu.cn> wrote:
>
> A global subprogram parameter tagged __arg_trusted is documented to
> accept only the PTR_TRUSTED flavor of PTR_TO_BTF_ID, but the call-site
> check also accepts a bare PTR_TO_BTF_ID and an MEM_RCU one.
>
> check_reg_type() resolves the accepted set from the base argument type
> alone and compares only MEM_RDONLY and PTR_MAYBE_NULL, so the PTR_TRUSTED
> bit of arg_type is never consulted. The trusted/RCU enforcement in
> check_func_arg() is gated on is_kfunc(meta), which is false for a
> subprogram call, so that block is skipped for __arg_trusted arguments.
>
> The callee is then validated with PTR_TRUSTED set on the register while
> the caller passed a pointer that is neither referenced nor trusted.
> bpf_may_fault_on_deref() is false for PTR_TRUSTED, so the dereference
> becomes a raw load instead of a BPF_PROBE_MEM probe, is_trusted_reg()
> kfuncs accept the pointer, and the callee can pass it on to a kfunc that
> would have rejected it at the original call site.
>
> Reject a PTR_TO_BTF_ID that is neither referenced nor trusted when the
> argument is marked PTR_TRUSTED. A referenced register is accepted, as in
> is_trusted_reg(). PTR_MAYBE_NULL is not counted as an unsafe modifier
> when __arg_nullable declares it, so trusted-and-nullable arguments keep
> working. The kfunc path is unchanged.
>
> Fixes: e2b3c4ff5d183da6d1863c2321413406a2752e7a ("bpf: add __arg_trusted =
global func arg tag")
> Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
> ---
>  kernel/bpf/verifier.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index fd3c0206bd67d..fe5edbef85a16 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -9597,6 +9597,27 @@ static int check_func_arg(struct bpf_verifier_env =
*env, u32 arg, u32 slot, u32 p
>                         }
>                 }
>
> +               /* A __arg_trusted argument requires a referenced or trus=
ted
> +                * pointer. btf_ptr_types also matches a bare PTR_TO_BTF_=
ID and
> +                * an MEM_RCU one, but neither is referenced or trusted, =
so the
> +                * callee would be verified with PTR_TRUSTED while the ca=
ller
> +                * passed something that is not. PTR_MAYBE_NULL is not co=
unted
> +                * as unsafe when __arg_nullable declares it, because
> +                * bpf_type_has_unsafe_modifiers() treats that flag as un=
safe.
> +                */
> +               if ((arg_type & PTR_TRUSTED) && base_type(reg->type) =3D=
=3D PTR_TO_BTF_ID &&
> +                   !reg_is_referenced(env, reg)) {
> +                       u32 flags =3D type_flag(reg->type);
> +
> +                       if (!(flags & BPF_REG_TRUSTED_MODIFIERS) ||
> +                           (flags & ~(BPF_REG_TRUSTED_MODIFIERS |
> +                                      (arg_type & PTR_MAYBE_NULL)))) {
> +                               verbose(env, "%s must be referenced or tr=
usted\n",
> +                                       reg_arg_name(env, argno));
> +                               return -EINVAL;
> +                       }
> +               }
> +

Could we avoid adding a second provenance check and make the existing
kfunc check contract-driven instead?

Kfunc ARG_PTR_TO_BTF_ID arguments implicitly require trusted or
referenced provenance through the is_kfunc(meta) condition. Global
subprogs express the same requirement explicitly with PTR_TRUSTED.
Likewise, __nullable and __arg_nullable permit PTR_MAYBE_NULL,
which should not by itself make the provenance invalid.

First, encode the kfunc requirement in its generated prototype:

if (base_type(arg_type) =3D=3D ARG_PTR_TO_BTF_ID) {
        arg_type |=3D PTR_TRUSTED;

        /* MEM_RCU denotes an accepted alternative provenance. */
        if (is_kfunc_rcu(meta))
                arg_type |=3D MEM_RCU;
}

The common check can then be driven entirely by the argument contract:

reg_type =3D reg->type & ~(arg_type & PTR_MAYBE_NULL);

if ((arg_type & PTR_TRUSTED) &&
    (!is_trusted_reg_type(env, reg, reg_type) ||
     bpf_type_has_unsafe_modifiers(reg_type))) {
        if (!(arg_type & MEM_RCU)) {
                /* must be referenced or trusted */
                return -EINVAL;
        }
        if (!is_rcu_reg(reg)) {
                /* must be an RCU pointer */
                return -EINVAL;
        }
}

is_trusted_reg_type() would contain the existing
is_trusted_reg() logic, but use the supplied normalized type for its
type and modifier checks while still using the original register ID for
reference lookup.

resolve_func_arg_type() should continue dropping PTR_TRUSTED when
it changes ARG_PTR_TO_BTF_ID into ARG_PTR_TO_MEM; that is a
different, fixed-size memory-buffer contract.

This also lets a kfunc __nullable argument accept
PTR_TRUSTED | PTR_MAYBE_NULL, as its existing contract specifies.
Please add corresponding kfunc coverage and adjust the claim that the
kfunc path is unchanged.

>                 if (is_kfunc(meta) && (!is_trusted_reg(env, reg) ||
>                                        bpf_type_has_unsafe_modifiers(reg-=
>type))) {
>                         if (!(arg_type & MEM_RCU)) {
>
> --
> 2.43.0
>
>
