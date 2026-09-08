Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAF055409C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873779; cv=pass; b=h/ZGkmoyt1SJNrQjwg4jiPySUEV8dNkgz5zrxME1fVMi5biuK+wREAuOM2vJ/FMkZwsiqhPDqG2Bb2OFgypPr9nagTstvZAenazZb/tqOjEoCVdAuGvUVLfA+bLaSN4voj6keBh/F6xa4LhOlttWY8bSwjFlpI+E4W/ObJOSlZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873779; c=relaxed/simple;
	bh=A7SfgZQR67JkHs4RtZ5PrBDPAkQ3dc73TAafXDV/A8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=igOBvIPqgo5TSFvRWgHH4Z/ELEz/T4a8k9gkIbVpY/EvtNlmspolKg0lL4K8AJADn5AFxJ6wNO5oHsPYro20VOoO919hGupXjYnsIGk+gpIpfoXOa/Ibx7SDHMg2pTPiRNXmYbE0AVCwVkGbgzCTjKkgS1+iO/hJJX/PLMFzAZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gx4Q8uXk; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gx4Q8uXk"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2530cabcf4so710807266b.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:22:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788873767; cv=none;
        d=google.com; s=arc-20260327;
        b=HU+DTF8w6YhgJj0M2bQzMNh+tfveNLr9YxWWh72jrwUaAfC7Vala1kGU0Yel8XXO4i
         UxcIxAJIs3cAC8VirjAPORdkogi8UmHl/d4mIbASaMdrVmGfbTiVBuPlf5x3676R3Sgi
         pH3LJuUUpapqnvu3j/Vo6Rr+MaJSa86EVe4A6OxWD1rii3wds5v5kTkN9fcvOeWsgu7t
         +fCIr9JLooceK6ks6WX9YFYTkjVWNiNSEAoAV6Glz0pZjwCEiFdsTiTm04gkL9aJ587/
         42J1s5C3I8CfCcL02Ss6p2lqXyhBaQgVWC8sIGz8uznH7ObPbB6xko44hhp92t4zm20N
         1ejQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dHBGY2kA/rw8G86NktdRbSCOC4KbfeB6+f4Od1S5INw=;
        fh=neNAw3orUWm4dX2QlGpyHYhN3tHpS399vSuUQQCq/VU=;
        b=EVevs5/ONvU/hVKPn2EHT7L2Idfp5+hZzPFghMsmWS3QiVGySB6adZsAM48h+ma4oF
         /abeaW2tYvUrdz47p8E0GFjwT606subGvF7tvq22bvdNBbYQqRIX7K1Q/zNXGnvrJEfj
         nCOLjkRfdLBESQHGDyM/MTy2xxqnQe02iCOH69gE741aXxZv3mD2ZXhrjFWneyfEkJxR
         t6vkOemX3IMjNr14muNLyYvhByXf9jV8ocBI39DaQ6bq3W7t2nYA5U3AiFMosUt7TE1T
         kX5i8WbLqgsx4V+amYvv0UJYIuGT5v0gasOpGgKcEqao/mlQhkITcIYTl4FHUh4eaifI
         0weA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788873767; x=1789478567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dHBGY2kA/rw8G86NktdRbSCOC4KbfeB6+f4Od1S5INw=;
        b=gx4Q8uXkyOmUVZKhzbF5mvFtvjRldZuZ+LBIQ51Ukb1Xp6/mvHxbzuuXYg/1J607ss
         A2sPkk5zZf1RiJ83RKArKJVMyD6InZLqvz/FrGnN3sL4NSbN3+7kN8gXG9W/CuOLgpYH
         re3UVSRFmCNUluAcNrH7C9qrStCcvIIUZFjyTfGmQ5LQCsrNJ0GgvwTmfte2G1mMUD8D
         nEyuxQAPeD20V1i4kUx948EkqcB9F3HAryVlppwiuC9EIstqsqZpLFadO4kN4j111Ig0
         MdIhngc25fZXRANz6CXR7VYsoAwYbfnbQzoQ8QaHVpsPtoggXvSEAPjLXEkGTcQSVDfi
         WXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873767; x=1789478567;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dHBGY2kA/rw8G86NktdRbSCOC4KbfeB6+f4Od1S5INw=;
        b=I/bAvOdgUSKEFH2cAPSqEj+jxFTDEPnQoEZslEUNDBEiUBjvH8IOmy9nsdvL2JEISc
         +FdDZzIzwQomU3AW6wjMV0rLp5OHmNt+p05Kn2BIPVSV7i5JFgkzk/9l30pMo5sY1WFd
         btgo9G7q5KjCJk/DzhxB7fcXIqXTd/obgtEKvw6kLp3bsu/oOI7vId+n2tWTGptpBsim
         vAorc0RwGUfJH1h8zziCsjtbNGuFq+UWs2BqVnHUbsICs7mytOiTJe2g40fkxSZB0ctC
         uhm/Td8fHbWHTE4JmJWh4Z9X4tJO/A0Buna/L4kKYdS9zTNQ/oDr+65zPkUVLGoYIfZr
         lw6Q==
X-Gm-Message-State: AFuF++lj0NloSjSUYAVvGM3psKridmMNO38lI9pKdb8SmDFyK+5zF5M4
	PNuKjKFVPfCpPBgKF5GOv99ZLR0hd2JiLVeJMprMFuDcgejTaxpy1QwKIn1lBa3+GqaZdLR2/zz
	SHm5wZrFL+dYSedhGqrSI3vbtQ/T/+qW+Vgl3HWI=
X-Gm-Gg: AYBFou0tlAuOHY0dATFML6upCjieyDHm39tMK0NZ8f1PiA/I2JqX2g1EKoXTWLClUCU
	layGwws98xyHduLmIzoUgkIrj5sVb9qmmzh1HlCbPgLLBoVTzNOQCoNJ1XJ1zJ1H4UKFsPtfzT9
	nzv3AwQiXOA1MHkkWFAH6ULFg/A9yCeqYTUVfymmEc6eqgiDa7PQR1HKIrhj+aIiGOfxAb7cX7j
	M53bIkkhIlrFIXR+xvoUzlIK/FHk1ojHbVViJoXbJsF9ilx73LfougVW8WTIxKTkiiWwCTFB0HW
	kBCOejvAa3xXIF+jP6Zr9OBG74TQ6Gqyeok83UutlQ==
X-Received: by 2002:a17:907:3e1a:b0:c24:87e5:6491 with SMTP id
 a640c23a62f3a-c260c971f12mr1992348866b.2.1788873767245; Tue, 08 Sep 2026
 06:22:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-b4-x86-cfi-fineibt-func-hash-v1-1-6ffc0af5c4ec@gmail.com>
In-Reply-To: <20260831-b4-x86-cfi-fineibt-func-hash-v1-1-6ffc0af5c4ec@gmail.com>
From: Soheil Hassas Yeganeh <soheil.kdev@gmail.com>
Date: Tue, 8 Sep 2026 09:22:10 -0400
X-Gm-Features: AcwNN1WsRJreg-ZsABv9wLtOKN98BlTKw209GAXhviOOfU8RHEZMXLmVgvJqFLc
Message-ID: <CADAM+B2jgDiyShSSXYoUG36C7yVpjx2NrhP6tOHeDjB0h+GvTA@mail.gmail.com>
Subject: Re: [PATCH] x86/cfi: Fix FineIBT hash offset in cfi_get_func_hash()
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 10:49=E2=80=AFAM Soheil Hassas Yeganeh
<soheil.kdev@gmail.com> wrote:
>
> The switch of the FineIBT preamble from "subl $hash, %r10d" to the
> shorter "subl $hash, %eax" moved the hash immediate from offset 7 to
> offset 5 of the preamble. fineibt_preamble_hash was updated to match,
> but the open-coded offset in cfi_get_func_hash() was missed and it
> still reads the hash at offset 7.
>
> cfi_get_func_hash() is used by the BPF JIT to give a struct_ops
> trampoline the CFI hash of the stub function it stands in for. With
> FineIBT the trampoline now gets the upper half of the real hash
> followed by the first two bytes of the next instruction, so the first
> indirect call from the kernel into a struct_ops program,
> tcp_init_congestion_control() calling ->init() of a BPF congestion
> control for example, fails the FineIBT check and the kernel dies with
> a CFI failure.
>
> Move the FineIBT preamble template and its offset defines above
> cfi_get_func_hash() and use fineibt_preamble_hash there, so every
> reader of the preamble shares one definition of its layout. The
> CFI_FINEIBT arm is only built with CONFIG_FINEIBT, the only
> configuration in which cfi_mode can take that value.
> cfi_get_func_arity() does not need the same treatment: the __bhi_args
> call whose displacement it reads still ends at the function address.
>
> Fixes: 85a2d4a890dc ("x86,ibt: Use UDB instead of 0xEA")

Gentle ping on this one. To recap: since 85a2d4a890dc the FineIBT preamble
stores the hash at +5, but cfi_get_func_hash() still reads it at +7, so BPF
struct_ops trampolines are emitted with a wrong hash and the first indirect=
 call
through them (e.g. a bpf tcp_congestion_ops .cong_control) hits a FineIBT #=
CP.

We have large scale panics when we use BPF congestion control.
Happy to respin if a different shape is preferred (e.g. moving the
offset next to
the preamble definition), but this seemed like the best way to fix the issu=
e.

Thanks,
Soheil

> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Alexei Starovoitov <ast@kernel.org>
> Cc: Daniel Borkmann <daniel@iogearbox.net>
> Cc: stable@vger.kernel.org # 6.18+
> Assisted-by: LLM
> Signed-off-by: Soheil Hassas Yeganeh <soheil.kdev@gmail.com>
> ---
>  arch/x86/kernel/alternative.c | 72 +++++++++++++++++++++++--------------=
------
>  1 file changed, 38 insertions(+), 34 deletions(-)
>
> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.=
c
> index 91b1cdd16569..1b22062cabfe 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -1198,6 +1198,41 @@ static bool cfi_debug __ro_after_init;
>  bool cfi_bhi __ro_after_init =3D false;
>  #endif
>
> +#ifdef CONFIG_FINEIBT
> +/*
> + * <fineibt_preamble_start>:
> + *  0:   f3 0f 1e fa             endbr64
> + *  4:   2d 78 56 34 12          sub    $0x12345678, %eax
> + *  9:   2e 0f 85 03 00 00 00    jne,pn 13 <fineibt_preamble_start+0x13>
> + * 10:   0f 1f 40 d6             nopl   -0x2a(%rax)
> + *
> + * Note that the JNE target is the 0xD6 byte inside the NOPL, this decod=
es as
> + * UDB on x86_64 and raises #UD.
> + */
> +asm(   ".pushsection .rodata                           \n"
> +       "fineibt_preamble_start:                        \n"
> +       "       endbr64                                 \n"
> +       "       subl    $0x12345678, %eax               \n"
> +       "fineibt_preamble_bhi:                          \n"
> +       "       cs jne.d32 fineibt_preamble_start+0x13  \n"
> +       "#fineibt_func:                                 \n"
> +       "       nopl    -42(%rax)                       \n"
> +       "fineibt_preamble_end:                          \n"
> +       ".popsection\n"
> +);
> +
> +extern u8 fineibt_preamble_start[];
> +extern u8 fineibt_preamble_bhi[];
> +extern u8 fineibt_preamble_end[];
> +
> +#define fineibt_preamble_size (fineibt_preamble_end - fineibt_preamble_s=
tart)
> +#define fineibt_preamble_bhi  (fineibt_preamble_bhi - fineibt_preamble_s=
tart)
> +#define fineibt_preamble_ud   0x13
> +#define fineibt_preamble_hash 5
> +
> +#define fineibt_prefix_size (fineibt_preamble_size - ENDBR_INSN_SIZE)
> +#endif /* CONFIG_FINEIBT */
> +
>  #ifdef CONFIG_CFI
>  u32 cfi_get_func_hash(void *func)
>  {
> @@ -1205,9 +1240,11 @@ u32 cfi_get_func_hash(void *func)
>
>         func -=3D cfi_get_offset();
>         switch (cfi_mode) {
> +#ifdef CONFIG_FINEIBT
>         case CFI_FINEIBT:
> -               func +=3D 7;
> +               func +=3D fineibt_preamble_hash;
>                 break;
> +#endif
>         case CFI_KCFI:
>                 func +=3D 1;
>                 break;
> @@ -1363,39 +1400,6 @@ early_param("cfi", cfi_parse_cmdline);
>   * anyway.
>   */
>
> -/*
> - * <fineibt_preamble_start>:
> - *  0:   f3 0f 1e fa             endbr64
> - *  4:   2d 78 56 34 12          sub    $0x12345678, %eax
> - *  9:   2e 0f 85 03 00 00 00    jne,pn 13 <fineibt_preamble_start+0x13>
> - * 10:   0f 1f 40 d6             nopl   -0x2a(%rax)
> - *
> - * Note that the JNE target is the 0xD6 byte inside the NOPL, this decod=
es as
> - * UDB on x86_64 and raises #UD.
> - */
> -asm(   ".pushsection .rodata                           \n"
> -       "fineibt_preamble_start:                        \n"
> -       "       endbr64                                 \n"
> -       "       subl    $0x12345678, %eax               \n"
> -       "fineibt_preamble_bhi:                          \n"
> -       "       cs jne.d32 fineibt_preamble_start+0x13  \n"
> -       "#fineibt_func:                                 \n"
> -       "       nopl    -42(%rax)                       \n"
> -       "fineibt_preamble_end:                          \n"
> -       ".popsection\n"
> -);
> -
> -extern u8 fineibt_preamble_start[];
> -extern u8 fineibt_preamble_bhi[];
> -extern u8 fineibt_preamble_end[];
> -
> -#define fineibt_preamble_size (fineibt_preamble_end - fineibt_preamble_s=
tart)
> -#define fineibt_preamble_bhi  (fineibt_preamble_bhi - fineibt_preamble_s=
tart)
> -#define fineibt_preamble_ud   0x13
> -#define fineibt_preamble_hash 5
> -
> -#define fineibt_prefix_size (fineibt_preamble_size - ENDBR_INSN_SIZE)
> -
>  /*
>   * <fineibt_caller_start>:
>   *  0:   b8 78 56 34 12          mov    $0x12345678, %eax
>
> ---
> base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
> change-id: 20260831-b4-x86-cfi-fineibt-func-hash-e160f6eee02c
>
> Best regards,
> --
> Soheil Hassas Yeganeh <soheil.kdev@gmail.com>
>
