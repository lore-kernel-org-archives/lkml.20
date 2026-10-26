Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793025757;
	b=MtIT5PJKBjxyh8PluAws52ZYSX54+J25dJ7dg2FBip6tKmUttTFztQBoq1/YO77oNXEG
	 aNgnSf7elbk1cwGpitBV/Kz5M+jzVv/BlunlxrMmxfCPQZmcmtCyIgTnAqPZwkwh6maum
	 sAIASHjLykbzn6QlxVfD5LnhGOFfea4UCtk80rBb271OrfgJIqt8Hp576rZZP2mmgh7N8
	 owAAZwW+/HhFvlQHu0t4VaMRd+CgHRFvyJPgtcvNE+gS/87qsepes2jep950pf21tFJwy
	 esDFaBFl0JdrncM3aXXsFdUHLjGT0Awn1jP7aXVal8T1zl1Jl/7qXwCPQqJRrp2qACQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FiyIo88XtSCmKUOLGbnBLJ62ZVS25doiOE2fXhFGrhU=;
	b=A2qPw9q03LzogZxDK5YUenKvyVzLveEXs3Ium0oTDykLwgPoXWLYXit4hYenFOc2uf6j
	 OJOupg9YJVysq1UTyR9xp1YDaswlOr6ynRCD4oZTPfy0CkX7YT7UxKihx8FflX7brgbGM
	 DPxSoVv7jGMORWOTiwnGmQsMCVmek1cRfFqTfqxC8xi9wO9GNUqFHwPrWfHlPnZigvXe/
	 tBDRzBXl0R8xybzKCOkY3zXBJ9ih31vsOL4VuocL6SlLr3oxuvGBbmoSmwDRacwMR2GOb
	 Km4p2VZbZw3QqcicMYJMjJhIegeAx32sfXKRXJMwbBgumzecBJRe/tK5+WwoJ208xNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GKfIPL5Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8B4606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A8B4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GKfIPL5Z
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-8451a619da7so1782134a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793025755; cv=none;
        d=google.com; s=arc-20260327;
        b=O4WHZiRgAM8BOITUuz4j4MLom2ra93/rE8J5Ic8yn/Kv/s1fhCoVcxHHLXJSmKReL1
         PBhcH8enL46dHAlX7V8xWqCEeSm61oUo2U7YrxiAXt9+WRrJgoNUOxHCF4GR7EjBgZv6
         WQQf7tCxsIzk39+50T8Z5F6WZDveiXjypgAHuIbzs3kKogtxRkDpUPmV5zvtlYMkcOhx
         I8Rx8iDf+KdWu6LP2XD6vNkckCvfGEXXIybQIQ8BL1pfgEjbHX/KnzzN9FYzpf8czgEH
         VhEkLh0aNpS9z9Tt/SMhnxOuBbi4Sv4G69FBA2xGpI05zYTmHeNcLQmFe/V1S7D80PFa
         IiQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FiyIo88XtSCmKUOLGbnBLJ62ZVS25doiOE2fXhFGrhU=;
        fh=9BXRKtabha+lPqfbjdw/j8WCvvhKyu68Za5EbIzU6aI=;
        b=jHtskdMxVK+8Ygna8riYIU2Pvn+Iy02yeNTiNFTRpMqT6IfQ83EsfThdZXpCMA25ct
         bcnez/DaP/bQYPxPQ1E5HN8lM7QQlvSrciRjacpTTDkS7mxLvYoPFt26KgeMkoKoxCbG
         Cg3lZCcvrTbQKxsjsvb1NMvnifGdjPyqJ9Fa62nL9VTlaTP3KCcxIxvfxmlXFiak1HDZ
         wz5KFp+1RP8xua7ycoqMyxk0X0PP1rVFcZo/cpxuWrD22F2biq96cUf6Afz/OaHG4RZF
         bQ0QOTZ3Mw3aqj+4sOyP5mPpt+DhdpnZGr2scPUHU3uEDtdyhzyXHXzD9U7DKi9AcVjp
         b1MA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793025755; x=1793630555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FiyIo88XtSCmKUOLGbnBLJ62ZVS25doiOE2fXhFGrhU=;
        b=GKfIPL5ZKa6e9p2e9kBDTVAckDJTe/+XOPYoEiJxEQfZFvGSFjg1XEuIryHOB8e27W
         L7FfIWwQSWZSxteWjHhD8wAL6WkiqxJgMkaNVNjvGC4963SIIR7t66OaU2YNyxK+VJxR
         xH4vmsTmM1IJ8mXg6wjf/YYh1sMIkF+4iiYtxYswLUvogttdUY5CTfzBY/2Bpfbg/M5L
         4Jg4RqvkpcFddiL2TZLaekEEUVBbC3KBy0eoQZobK7Heag1Twk19EWRR6vUDN2LuOVai
         rP3DteeycAvBG4eA3MgJeEv/8JlXbnwsaZYgE/tPBK0PcQmTpiHBu52Q63LEZU7Svr1e
         D20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025755; x=1793630555;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FiyIo88XtSCmKUOLGbnBLJ62ZVS25doiOE2fXhFGrhU=;
        b=HGwrTzC/3N/2oTNiwgCEqoXfCWJHOst36gUaN3mo9oEyMQrutz4L0S76u8zdCGt6ID
         x0FFwk2TXeT1+rBe4csx7nkvdjVPdYgne7+bgw06xicIxY5UWkIHIJ+Iag3Rk1rR7nzd
         Ucafxo88lR0R5R8BlKQyCmZZVSK5bVcQr7wQ3++/Ggd2ZtXyEDqK+0DpW+6+IHfiUxkN
         L2hsuW8JcSR+Zr4EGvh+Q4c6j5MprdIUeP6LdZCe9SauFYtmtx6kMqIvWrjMnEu60uWx
         z06okMi12PKuFIWNFQ1OpW+ZaDWBBQHwk6goA+TJIpXqg0UVngiFJ2AB1aE3yBFXg9lb
         ZzbA==
X-Forwarded-Encrypted: i=1; AKwUvBwNgutMtNSEuZzpxz6xhX8HE6AbTLwEtXMF/e2ZsghvsiXpxxfkcvkmipuyAoZo8m/O9kPFgGirOfMtSa4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzfMJizvrB5Vhkc5j6ifE1FRwQqjF4oZsagtihjRrwFc7UbAbv
	6vxhSYxkG7FIX+EtmjbHfXDhXjj0fdZe2yR2uk3WOzrALRTXAiy33ZRjvDnWtf4GzOTDWGqKbYC
	Y5+nXFMk17SiJl0piJPPLfVdyee3vvNs=
X-Gm-Gg: AYBFou3wnaDbf8yJ4GkLz+2zCcdVMqWMLKK2Vz07vmVA5eQyz30iQ2I55otDWbu027i
	yKjlRYtDStgqGalNtTkivK5KUN8uhMZtvaAS17FKfsKkeB+nGkjquN14Fouzt6ix5kRx85KN/Yu
	3+ZOc6qqgOARfvN7wTIkoO8kQ8fOWDMf38tNlIcbq9WB91M13+GsRj2+hJl+j4zLpcgqBKmDiky
	n0qpB0DTd9g4bUCrqinWlCoIY961eRJRLyy+EcHGHU0uEan2sql9fmt3LmxaKgmkoIJLy8YzEs0
	gVkfjTEIkX5Bb9fOVGfx1E5liEzsLsWcFOt6piZuHLbQUiUWpn18+YKT0zEMg506HuWnX4/ZYI6
	d48qycELkpkBP+QEWD/zw5NbrrBsFeGgG3XXrsw==
X-Received: by 2002:a05:6871:73a2:b0:491:4a20:8ab8 with SMTP id
 586e51a60fabf-4a83f53b47amr3712608fac.28.1793025755162; Mon, 26 Oct 2026
 07:42:35 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019013335.13512-1-yangtiezhu@loongson.cn>
In-Reply-To: <20261019013335.13512-1-yangtiezhu@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Mon, 26 Oct 2026 22:42:24 +0800
X-Gm-Features: AclHuK9VfDqy3TFsNraLnkzPJtLGJTrw97NH5dTf1M621wbyFJ758LDBDfZcRk0
Message-ID: <CAEyhmHQhi6rgxXEvg6aCA=5XUVBSUpBUbFrjSyJDoD_bz5dDLw@mail.gmail.com>
Subject: Re: [PATCH v3] LoongArch: BPF: Fix stack arguments for indirect trampolines
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, loongarch@lists.linux.dev, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 9:33=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>
> LoongArch passes arguments beyond a0-a7 at the caller stack pointer. The
> trampoline store_args() helper always reads those arguments at FP + 16,
> which is correct for a regular fentry trampoline: its prologue leaves FP
> 16 bytes below the stack pointer at trampoline entry to hold the saved
> RA/FP frame record of the parent function.
>
> A struct_ops indirect trampoline is entered through a function pointer an=
d
> only saves its own RA and FP before setting FP to the entry stack pointer=
.
> Its stack arguments therefore start at FP, not FP + 16. As a result, ever=
y
> stack-passed struct_ops argument is currently read two slots late.
>
> Select the source offset based on whether the trampoline is indirect. Thi=
s
> also prepares the stack-passed arena argument path to consume the actual
> pointer slot.
>
> With this patch, the BPF selftest "./test_progs -t struct_ops_multi_args"
> passed on LoongArch.
>
> Fixes: c9ebe2016de9 ("LoongArch: BPF: Support up to 12 function arguments=
 for trampoline")
> Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---

Acked-by: Hengqi Chen <hengqi.chen@gmail.com>

> v3:
>   - Reword the log and comment to clarify that the 16-byte frame record
>     is saved for the parent function, not the traced function. (bot+bpf-c=
i)
>   - Remove a stray blank line after the opening brace of store_args(). (b=
ot+bpf-ci)
>   - Reorder the comment sentences to match the true/false branches of
>     is_struct_ops for better readability.
>
> Here is the original link:
> https://lore.kernel.org/bpf/20260821233516.3426127-8-memxor@gmail.com/
>
> This version is based on the series:
> https://lore.kernel.org/loongarch/20261016081006.26069-1-yangtiezhu@loong=
son.cn/
>
>  arch/loongarch/net/bpf_jit.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
> index 1a7c8effc37b..c6784602f029 100644
> --- a/arch/loongarch/net/bpf_jit.c
> +++ b/arch/loongarch/net/bpf_jit.c
> @@ -1725,17 +1725,22 @@ int bpf_arch_text_invalidate(void *dst, size_t le=
n)
>         return ret;
>  }
>
> -static void store_args(struct jit_ctx *ctx, int nr_arg_slots, int args_o=
ff)
> +static void store_args(struct jit_ctx *ctx, int nr_arg_slots, int args_o=
ff, bool is_struct_ops)
>  {
> +       /*
> +        * Indirect struct_ops trampolines place incoming stack arguments=
 directly at FP.
> +        * Regular fentry trampolines need to skip the 16-byte RA/FP fram=
e record saved
> +        * for the parent function.
> +        */
> +       int stack_args_off =3D is_struct_ops ? 0 : 16;
>         int i;
>
>         for (i =3D 0; i < nr_arg_slots; i++) {
>                 if (i < LOONGARCH_MAX_REG_ARGS)
>                         emit_insn(ctx, std, LOONGARCH_GPR_A0 + i, LOONGAR=
CH_GPR_FP, -args_off);
>                 else {
> -                       /* Skip slots for T0 and FP of traced function */
>                         emit_insn(ctx, ldd, LOONGARCH_GPR_T1, LOONGARCH_G=
PR_FP,
> -                                 16 + (i - LOONGARCH_MAX_REG_ARGS) * 8);
> +                                 stack_args_off + (i - LOONGARCH_MAX_REG=
_ARGS) * 8);
>                         emit_insn(ctx, std, LOONGARCH_GPR_T1, LOONGARCH_G=
PR_FP, -args_off);
>                 }
>                 args_off -=3D 8;
> @@ -2068,7 +2073,7 @@ static int __arch_prepare_bpf_trampoline(struct jit=
_ctx *ctx, struct bpf_tramp_i
>         func_meta =3D nr_arg_slots;
>         emit_store_stack_imm64(ctx, LOONGARCH_GPR_T1, -func_meta_off, fun=
c_meta);
>
> -       store_args(ctx, nr_arg_slots, args_off);
> +       store_args(ctx, nr_arg_slots, args_off, is_struct_ops);
>
>         if (bpf_fsession_cnt(tnodes)) {
>                 /* clear all session cookies' value */
> --
> 2.42.0
>
