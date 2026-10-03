Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71208352020
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 10:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021723; cv=pass; b=JUhnccD9Koy+pBTxb7Ubx7leF8JXXQRNYX4CuaAlLWPSA8L1YLDV7GUtDC7SyLyH1KQ4ZaODbiXzfgrdlqOoA3SvOGlwi3zy2mSorx2/wkD8jTATRyBHC/+w03ddcnnn3wGV20VI7RCkR6F0dMZOeQY4VsXD9zfLPs2ZhKG1Y4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021723; c=relaxed/simple;
	bh=9i9dctui2j8y6dJnAzDejHHRA0xGrLuN2S3+baGa4zw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pfbcww5G3xetwTyGfO5T6gXW/caBhLQtkf0JmzcODQwnqbVs/ErE5JUfzpy1SY+/T4GugZk9A8FOJipifOJHw842zDsYVTX1BAcFVsnaPAujfPB+VE7LmLTEQ811vwYABWdKXxLuSWIB2tJgFD+RUiuxC5EopG4uc1h5oFskH60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=l+NAwLGx; arc=pass smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="l+NAwLGx"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b05fdb2f9so219801f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 03:02:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791021719; cv=none;
        d=google.com; s=arc-20260327;
        b=BJX7TVgL4rrvbgwQoUffcKAQy/y4Y75rohYhpy+FyUZ0jKIKR/4IIYpvIrnmNVnvFS
         xjME89gNrmsFCkpafCamW4lZBTNO6PBQJNl6IKi1GM9XQaG3vEGPCktCoh/o0BMAaihG
         21G+C7ozpJ5a8I/x5bVnQUFA3ystiSdlrxekOSznUmE75sMM5dD6mygBdy/psAVtTE0g
         KQI6fFPTcCyfCmI1twrNGkwfsqGkB/zlk0sWeQiM37Vlb0XGBkvcjrV6Uzo4bvuHuOpo
         D+icbfSQSIR6yHD6KHbsBCbni4xK458mQwO5lHYyMsHSXXVztDSwU7l4c+yRmsJf5FMv
         LtZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=toFwkFZa1NLpcYuyov6v0MW1/I0mrWgEqkrs2TGLYcE=;
        fh=jDpytubikuxaAYm9lgXn1etm4niLAQVTfrcu+RHGawI=;
        b=SEFErnXcc3KYh8AswkA/WkHDszpl4PlbrqX7vTtrQdmHcQDx+EeNcert4xvAfmX6e5
         i/jWBj5TxhBKrwJFb8dkUNtIESu59NH8HMP3FHFvjkD7CnVnUaQ6xgjolnJstzub3u1i
         +kkZXVWeSyBFSbPjE3qBz8U+2dIYAiduImG3F+kJ+bwNoW0ZSgvA0US7lHbjECHQwKmX
         Yt0rkpUxntRVvXV93KcDSeVLDH0I1gQXwyiEnp11uei11tMIzfTKQL8J5tB7fz5r289n
         JPJA+K+sQvTs3M73rOew85uiwRVdQR030R8BI15EZoabDdt3xOJYq4WVQqm3IoHX6UYI
         2p5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791021719; x=1791626519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=toFwkFZa1NLpcYuyov6v0MW1/I0mrWgEqkrs2TGLYcE=;
        b=l+NAwLGxdMy+Mo11c5SuNYUk2++WL7MD1Rdxi+J3iKTe8Z4ep/pDw3/22Q34H5avWv
         kilKLN46bSt0zOfv7hYf5tX2farNlIQ6F+5cj0/RR/mJj0d9IMCTOr+kHNm75+ibt0Vp
         9RbK6W64x9BBzvLYcU6IIkjvREjMbKXwmaRzQUsE7LVlgAKWROzsVaYxp8uv3Gf4U+rW
         t9rCmXsV3j/K2YbDs3PZQIaAIytS1GebDYV7eAwgPGF99NK6ng5K0mn/XqaV2Zcp1XjN
         W52rKq3yXAN7/ZyFB488xjpIzpY0LGgGWp7C51orolalYTJjnVBb+s0GtBN7uzHaUz3y
         FE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791021719; x=1791626519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=toFwkFZa1NLpcYuyov6v0MW1/I0mrWgEqkrs2TGLYcE=;
        b=qluXMnDB1WAmZiw57R4OOtaQ5ObqPpZBzRDOSyxL2RmaNOnYJRyPBUbirq8+i787Rh
         DEN81e66uIaydDxtKWwGKsyw3z+TLuBA7uMyfyVgCI3oc5yuX6t7quBetnmupnydeRA9
         1hmp56Z6c+ZEuMD5skdiG9rLKdP2wZRFagfhUfg5VumryZyDg1JWPlwg1qbuGoITEojg
         l97VwfHRIq87s4y0zmNoooZx5vKClZusHuK9sHkRc9xHOxpdClLm8QHsNI8aJuJER5ph
         09Yl2rTvbLM53CSufK72qRGCP3p9U7vKUV9RF50i1bzLVhIE6Dbbb0qdNokXARxfFV8L
         oQ/w==
X-Forwarded-Encrypted: i=1; AKwUvBzWAhVSIYLEK+3NZ6YywmArX4M+ADVYpUO3bOmgBlbo/hPzxLwQ3Ty11jSMF0aTF/3zvc2Cr0Sd9v8k3FE=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9Zz60aPA84tyAPEagFNyr9PGqAIgx2rFcsQkh6X3KbThf6Jmx
	mdpbcogth7jzQmyZEzIRLMTDBSsQWJXMFZ3/D/GZz3N0mpu3dKLFoN1ezPlz2JL9IZZ17r7Z37a
	7ipOSOC2JiUWt4WbPwDQrA1H5EY0fXIe2GH5Wcnwrtw==
X-Gm-Gg: AYBFou0FEQUTEjnuqTF9d7HMB+UTc98BTymIRHlfP/OcZbZUE+Mtl++SEXZkv/l1Umm
	0Ky4jk/I+G1riDsMa1tCGbRw6+ZSuP8uDjWcZTQ23yWEggDetm8qxID1qA4n9xR4Ev4XLuXqu71
	1n35LdsVJu30zNNUmEUH8kTjIlT3A2qSueU6NnOP6hbjbIOV+igR37g9vPqiyjKzh0qv/bnlswq
	EDrSdLGJyybLPVxXa4v8aQ27rXN/XKKx8ZRqQparpCTb8FeP3aM21RGOCUbAYkmTOWwkl427+Wz
	xsdZ+OzaTJ9t1cJ+wLvTakwhQcQ4y8vhrTKPy3WBp42ih7BH+Gp3luw0MCpEOuqxsG7yKLwZoEB
	8khUlVt9bUBdNBkbMPjPxg8WEUuCvs0fM+eercXRefSQCEPix69D9a0Lcjfkr+kN+fiB1fhzH1i
	M=
X-Received: by 2002:adf:e199:0:b0:48a:efee:db70 with SMTP id
 ffacd0b85a97d-48b126c255fmr8787711f8f.7.1791021719467; Sat, 03 Oct 2026
 03:01:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814114507.583424-1-jinyu.tang@linux.dev> <20260814114507.583424-3-jinyu.tang@linux.dev>
In-Reply-To: <20260814114507.583424-3-jinyu.tang@linux.dev>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 3 Oct 2026 15:31:48 +0530
X-Gm-Features: AclHuK_dkAiQSJCFKF0TsjCXthGT7oWYDuuxVVTi1OVsI6Ecqotq3FhGa4Yyvnw
Message-ID: <CAAhSdy2rj7fV0_Apk79NQqdsTW4-tK1JLo9S7ty3JorfukSVLQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] KVM: selftests: Add RISC-V Sv57 page table indexing
To: Jinyu Tang <jinyu.tang@linux.dev>
Cc: Anup Patel <apatel@ventanamicro.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Jinyu Tang <tjytimi@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 5:16=E2=80=AFPM Jinyu Tang <jinyu.tang@linux.dev> w=
rote:
>
> RISC-V selftests can create guests with five page-table levels, for
> example when the selected guest mode is Sv57. The RISC-V page-table
> walker only had index arrays for levels 0 through 3, so
> virt_arch_pg_map() indexed past the end of the arrays when level 4 was
> used.
>
> Add the missing L4 index mask and shift so selftests can build guest
> page tables for Sv57 VMs.
>
> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
> Signed-off-by: Jinyu Tang <jinyu.tang@linux.dev>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this patch for Linux-7.4

Thanks,
Anup


> ---
>  tools/testing/selftests/kvm/include/riscv/processor.h | 3 +++
>  tools/testing/selftests/kvm/lib/riscv/processor.c     | 2 ++
>  2 files changed, 5 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tool=
s/testing/selftests/kvm/include/riscv/processor.h
> index e3acf2ae9881..abde3c71c891 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -127,6 +127,9 @@ void vm_install_exception_handler(struct kvm_vm *vm, =
int vector, exception_handl
>
>  void vm_install_interrupt_handler(struct kvm_vm *vm, exception_handler_f=
n handler);
>
> +/* L4 index Bit[56:48] */
> +#define PGTBL_L4_INDEX_MASK                    0x01FF000000000000ULL
> +#define PGTBL_L4_INDEX_SHIFT                   48
>  /* L3 index Bit[47:39] */
>  #define PGTBL_L3_INDEX_MASK                    0x0000FF8000000000ULL
>  #define PGTBL_L3_INDEX_SHIFT                   39
> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/te=
sting/selftests/kvm/lib/riscv/processor.c
> index ded5429f3448..b4d41a407553 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> @@ -43,6 +43,7 @@ static u64 pte_index_mask[] =3D {
>         PGTBL_L1_INDEX_MASK,
>         PGTBL_L2_INDEX_MASK,
>         PGTBL_L3_INDEX_MASK,
> +       PGTBL_L4_INDEX_MASK,
>  };
>
>  static u32 pte_index_shift[] =3D {
> @@ -50,6 +51,7 @@ static u32 pte_index_shift[] =3D {
>         PGTBL_L1_INDEX_SHIFT,
>         PGTBL_L2_INDEX_SHIFT,
>         PGTBL_L3_INDEX_SHIFT,
> +       PGTBL_L4_INDEX_SHIFT,
>  };
>
>  static u64 pte_index(struct kvm_vm *vm, gva_t gva, int level)
> --
> 2.43.0
