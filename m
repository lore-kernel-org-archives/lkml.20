Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6A82749C1
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791019168; cv=pass; b=nxuLxowAPfVgTyzTN+YpCdLshUM/hu0e4CqQXMDrRECSaSXCa2qqrnNlgZ86KYK0Qh18HpkRyXJjffB89+Ea3/BhXP3nJz+/YkGIhgCSqEgQhZ7PY8x1X2bGV8ogPDVz4cBgCA3YMqKSMYHBn0Xvybv6EllcKbEv+HThHTTHTuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791019168; c=relaxed/simple;
	bh=1vkbLOapIoZdupJGLkgKVFftR3WGofzckhtFonhwkmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qvGICRGAoVb2qAqX7bYirb0wUjT+T/pJwAawn4WeObHCaLaa/C81QuVzxGrpn7DcE4+uRZGlabbNjUqKBcF/fwVjXj58q6zVnZVMIsVz3BKMLErPEWrP1yefPqt4r+SnXy+9PdfjPUPXlw1aRA6n7WuORiwGy6X21Xtyhe7YFHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=CxXdmGYr; arc=pass smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="CxXdmGYr"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b00a0ac65so98530f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:19:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791019165; cv=none;
        d=google.com; s=arc-20260327;
        b=jpqYHdyEKiN/sgN0ANGmWiTE057bHQawxIEaMtYZO5qgnAbDkosg56N2s0dLl70xsl
         uO8gYNnOa5Tw4HfsIwPlo/ZFOmUWA+9mTt9knuEifcunZo7bj0LFshpmRPP6/q0aiu3H
         KGP+F6kKz6LD0JglG6TfQDmJq+yEoNlSLwn6hVlctqgjIiX5hlLsTle1qksDzy5d0YDO
         IVI/4TJ8J0gtWtln8BOYSQwPf1w+cAJXVu7TNjXu5ERVGjmpXZKVZ6ds3KAVmTNWS3PW
         z3UqtDAptMB4ObR7ZvArqsGkYjmCfJTao4yifBmBbCZoJI2xmUSyuUIwK06+TeISMjeD
         Vnwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f7G906vmlH00LsrZjaBVRjiLd8jr6S5ZtecbYcljE/E=;
        fh=K+RLX1rYbBv5pvn8bB8nCByP/xzoYj7WlxNj8KOypkk=;
        b=sWuOYgcvH2fq3eJDWIlefQuMTXX3+3uMfHIjXr1EVqJcYxlbyu7Hgtu/V12MZe6VBY
         aiyKXyEdE316BANKl0CZhZ5Q4440O4nPKb/qnKJhrh0SYDiC3SgBvrSsdcquxqdYtQPq
         R66jxb2qg4pFgZXPXZf9nuoHBZrqxHoMoNhiAuaCyH47j53ZKZJ/0dCrnzi2xm6Zfqcj
         6nmZpGYFYPhIqNhVz52etusTdKSYOD9PQqEkvWf1iRoWAee39otMB4Nit980H7nZGTgf
         IuPvlZLdZDTIKrpeNvY336vZ6ACW3QK1XeUxV6dgfjt/Bi74jwQtqKFgM/O8gnSqv5Og
         RHVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791019165; x=1791623965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f7G906vmlH00LsrZjaBVRjiLd8jr6S5ZtecbYcljE/E=;
        b=CxXdmGYrA6t3j6pahclV2ZdEhiB7E0rH3NoeRO6XYogSXvGfo/ygDNLeL6VIvcqMA5
         jylLnXX0qE6wBhNiEP8JqpzkhI8ZGtlI/Z9b9eLRpfr3bCunjKid7U8AdhmZ/8Qp08vR
         X/cbxYttPFSGkxVIcrN+TBLNBvnufoXjTsyzZtdRvGYxTT1znRXeY1vJy0Ave7/zXI7+
         dtAwW1Kiylj2qVyjOK+BqVk2DbHRgBbg/6KMj/SccpbOx7Ozy8fgXKtvhy5zdKM9/KXk
         Ky4/cLKxmTIu3Efc6tJwjWnZCIlXEW1ayUqBILGihs/jmWJfyF7ab07C6f4u5SfMN+6M
         K9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791019165; x=1791623965;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f7G906vmlH00LsrZjaBVRjiLd8jr6S5ZtecbYcljE/E=;
        b=H38GdfuUQex1E6sh8W4bFN5MXZyyb40bq8hSVpBXcM+iD7q7UFm/6fAcJRYK2nrxEU
         J30v4Sn00abS9He+S66s1kaWk8zyU5W/nNMI7q7kel+W6nC/ZRCeqxNN4QZVP5TvNkVq
         jnXd0NZmyjA06IJMcxfmATMSlR0fBswWpC+DJ3JB+TJm0wB6H9YFiXwgbTkRp1mRK1Ey
         i8GFo2nCJRIswuRYGFdHm2rLgJdUHMucAGzg2iw1CcS54GwxWGkzrFBWwMKxqXHnGUo5
         AXq+adAvoBbXhAomN1FGRrPMp24VT5btFmpNO9WnJAKRQ/NgQHOY8969mFTWQh3cdfUl
         GEoA==
X-Forwarded-Encrypted: i=1; AKwUvBwPeGdp1jDWsylLJOUtbrm994jvo292RqYrFhJHf/l9sjIu69Dhn37Pk1SumCIdOE9JjiConN46/1cEc8g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBjlvfEqA2+Atn4a+/vl6OYP6emuK33fTVZzgt9l8kQotCE2kA
	ZFYO6sro12keCA2aNOzLF4ZqTp9vUA7j2yDiS5pQMemvsQ3WOvqi1wvYejuGeFJWOYc3+zJ/DIz
	N/VahImO/p2iM+SEC2yZIMIrLCbwhwIrX4Ps1Faa65w==
X-Gm-Gg: AYBFou1GAz8OrHVadriKRGBXEmQnUZzsUla9N8Qok5bcEyB6V2jQ6GTD0V9lnuUL2rM
	q4YGjK9ly8OXTaCnRHv3k8rKLAQh5MhluuoqJUz9Yq0rRICYxkc+HcjxyWZDQfbMnPy1MmO2mbV
	5pfCD9u3GiH4FcUs3oYAKY/7t/F8zcqZUqxm2XUPlDBncEBNHtqSsya/ZcnzXelLDKJkiAp1Xmd
	FyyoKevSl6n5E4YaETxApPqVwtBeOSvYwCIwwXQNcXlgMw+rWsaq/nQ17bc8LfhHMdKdBYs2HNZ
	HxBtywW5djb4ySvoD/TBU1uwbb63Q/eK/uCrHUz16JEpEvfkXd93ypCQ87g8UcZzUASd/JS9mPe
	hbha7pp7dIM2ch7jQS6TxgtVYE5fjXUpkGNMdB6hNdsAVM2bZTb7CN1DBdtlJg5tP8ssC3Fdxze
	+J
X-Received: by 2002:adf:f14c:0:b0:487:27f6:a4df with SMTP id
 ffacd0b85a97d-48b1275c3d9mr6420136f8f.47.1791019164372; Sat, 03 Oct 2026
 02:19:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7C0512E558D1614D+20260813095615.3843757-1-jinrui@haiwei.tech> <20EA6EE00884FB87+20260813102930.3892251-1-jinrui@haiwei.tech>
In-Reply-To: <20EA6EE00884FB87+20260813102930.3892251-1-jinrui@haiwei.tech>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 3 Oct 2026 14:49:10 +0530
X-Gm-Features: AclHuK-xVBdazlcCE3cizjwPJo6pXdqplydNmBBVwMTC6dRcHa5DgpPQEbOzyeI
Message-ID: <CAAhSdy04HzvdSnOn7oWQH9zvGtjBWQW6DJsyun7EOR77PNqS=Q@mail.gmail.com>
Subject: Re: [PATCH v13] KVM: selftests: riscv: Add lazy V extension
 enablement for guests
To: JinRui <jinrui@haiwei.tech>
Cc: pbonzini@redhat.com, shuah@kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, atish.patra@linux.dev, 
	alex@ghiti.fr, sashiko-bot@kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 3:59=E2=80=AFPM JinRui <jinrui@haiwei.tech> wrote:
>
> From: jinrui <jinrui@haiwei.tech>
>
> When the cross-compiler defaults to an -march that includes the V
> (vector) extension, -O2 auto-vectorization generates vector instructions
> (e.g. vsetvli, vadd.vv) in guest code. Executing such an instruction with
> sstatus.VS Off raises EXC_INST_ILLEGAL (scause=3D2); KVM's hedeleg forwar=
ds
> it to the guest, but the bare-metal selftest cannot handle it, so all
> guest tests fail. A real kernel handles this via
> riscv_v_first_use_handler(), which enables V and re-executes the
> instruction.
>
> Fix it in processor.c:
>
> 1. Delete the now-unused guest_unexp_trap() handler, replaced by the full
>    exception vector table.
>
> 2. In vm_arch_vcpu_add(), advertise V to KVM via __vcpu_set_reg(V, 1)
>    (best-effort, errors ignored on hardware without V) and install the
>    full exception vector table instead of a raw stvec handler.
>
> 3. In route_exception(), decode the faulting instruction (stval) with
>    insn_is_vector() and, when it is a vector instruction while sstatus.VS
>    is Off, set VS to Initial and sret to re-execute it, before any
>    test-registered handler. Genuinely illegal instructions still reach
>    the unexpected-exception path.
>
> 4. Make vm_init_vector_tables() idempotent by checking vm->handlers
>    before allocating, so tests that call it directly (ebreak_test,
>    arch_timer, sbi_pmu_test) do not leak memory.
>
> Tested on a riscv64 host with KVM enabled.
>
> Signed-off-by: jinrui <jinrui@haiwei.tech>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this patch for Linux-7.4

Thanks,
Anup

> ---
> Changes in v13:
> - Assemble the 32-bit instruction from two 16-bit halfword reads instead
>   of a single 32-bit load, since with IALIGN=3D16 a 32-bit instruction ca=
n
>   start on a 2-byte boundary (Sashiko review).
>
>  .../selftests/kvm/include/riscv/processor.h   | 13 +++
>  .../selftests/kvm/lib/riscv/processor.c       | 99 ++++++++++++++++---
>  2 files changed, 99 insertions(+), 13 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tool=
s/testing/selftests/kvm/include/riscv/processor.h
> index e3acf2ae9881..685baefebdb1 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -25,6 +25,19 @@
>  #define GET_RM(insn)            (((insn) & INSN_MASK_FUNCT3) >> INSN_SHI=
FT_FUNCT3)
>  #define GET_CSR_NUM(insn)       (((insn) & INSN_CSR_MASK) >> INSN_CSR_SH=
IFT)
>
> +/* Vector (V) instruction decoding, matching arch/riscv/include/asm/insn=
.h */
> +#define RV_INSN_OPCODE_MASK    0x7f
> +#define RVG_OPCODE_SYSTEM      0x73
> +#define RVV_OPCODE_VECTOR      0x57
> +#define RVV_OPCODE_VL          0x07
> +#define RVV_OPCODE_VS          0x27
> +#define RVV_VL_VS_WIDTH_8      0
> +#define RVV_VL_VS_WIDTH_16     5
> +#define RVV_VL_VS_WIDTH_32     6
> +#define RVV_VL_VS_WIDTH_64     7
> +#define RVV_EXTRACT_VL_VS_WIDTH(insn)  (((insn) >> 12) & 0x7)
> +#define RVG_EXTRACT_SYSTEM_CSR(insn)   (((insn) >> 20) & 0xfff)
> +
>  static inline u64 __kvm_reg_id(u64 type, u64 subtype, u64 idx, u64 size)
>  {
>         return KVM_REG_RISCV | type | subtype | idx | size;
> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/te=
sting/selftests/kvm/lib/riscv/processor.c
> index ded5429f3448..d00ac997291c 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> @@ -17,6 +17,11 @@
>
>  static gva_t exception_handlers;
>
> +struct handlers {
> +       exception_handler_fn exception_handlers[NR_VECTORS][NR_EXCEPTIONS=
];
> +       bool v_available;
> +};
> +
>  bool __vcpu_has_ext(struct kvm_vcpu *vcpu, u64 ext)
>  {
>         unsigned long value =3D 0;
> @@ -298,13 +303,6 @@ void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *v=
cpu, u8 indent)
>                 core.regs.t3, core.regs.t4, core.regs.t5, core.regs.t6);
>  }
>
> -static void __aligned(16) guest_unexp_trap(void)
> -{
> -       sbi_ecall(KVM_RISCV_SELFTESTS_SBI_EXT,
> -                 KVM_RISCV_SELFTESTS_SBI_UNEXP,
> -                 0, 0, 0, 0, 0, 0);
> -}
> -
>  void vcpu_arch_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code)
>  {
>         vcpu_set_reg(vcpu, RISCV_CORE_REG(regs.pc), (unsigned long)guest_=
code);
> @@ -348,8 +346,26 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm,=
 u32 vcpu_id)
>         /* Setup sscratch for guest_get_vcpuid() */
>         vcpu_set_reg(vcpu, RISCV_GENERAL_CSR_REG(sscratch), vcpu_id);
>
> -       /* Setup default exception vector of guest */
> -       vcpu_set_reg(vcpu, RISCV_GENERAL_CSR_REG(stvec), (unsigned long)g=
uest_unexp_trap);
> +       /*
> +        * Advertise V to KVM so -O2 auto-vectorization in guest code is =
valid;
> +        * ignore errors since the tests work without V too. Use the full
> +        * exception vector table (which lazily enables V in route_except=
ion())
> +        * as the default handler; vm_init_vector_tables() is idempotent.
> +        */
> +       __vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(KVM_RISCV_ISA_EXT_V), 1);
> +       vm_init_vector_tables(vm);
> +       vcpu_init_vector_tables(vcpu);
> +
> +       /*
> +        * Record V availability for route_exception(), which runs in gue=
st
> +        * context. V is enabled uniformly for every vCPU, so this is a
> +        * VM-wide property.
> +        */
> +       {
> +               struct handlers *h =3D addr_gva2hva(vm, vm->handlers);
> +
> +               h->v_available =3D __vcpu_has_isa_ext(vcpu, KVM_RISCV_ISA=
_EXT_V);
> +       }
>
>         return vcpu;
>  }
> @@ -408,19 +424,43 @@ void assert_on_unhandled_exception(struct kvm_vcpu =
*vcpu)
>         struct ucall uc;
>
>         if (get_ucall(vcpu, &uc) =3D=3D UCALL_UNHANDLED) {
> +               vcpu_dump(stderr, vcpu, 2);
>                 TEST_FAIL("Unexpected exception (vector:0x%lx, ec:0x%lx)"=
,
>                         uc.args[0], uc.args[1]);
>         }
>  }
>
> -struct handlers {
> -       exception_handler_fn exception_handlers[NR_VECTORS][NR_EXCEPTIONS=
];
> -};
> +static bool insn_is_vector(u32 insn)
> +{
> +       u32 opcode =3D insn & RV_INSN_OPCODE_MASK;
> +       u32 width, csr;
> +
> +       /* All V-related instructions are 4-byte, i.e. not compressed. */
> +       if ((insn & 0x3) !=3D 0x3)
> +               return false;
> +
> +       switch (opcode) {
> +       case RVV_OPCODE_VECTOR:
> +               return true;
> +       case RVV_OPCODE_VL:
> +       case RVV_OPCODE_VS:
> +               width =3D RVV_EXTRACT_VL_VS_WIDTH(insn);
> +               return width =3D=3D RVV_VL_VS_WIDTH_8 || width =3D=3D RVV=
_VL_VS_WIDTH_16 ||
> +                      width =3D=3D RVV_VL_VS_WIDTH_32 || width =3D=3D RV=
V_VL_VS_WIDTH_64;
> +       case RVG_OPCODE_SYSTEM:
> +               csr =3D RVG_EXTRACT_SYSTEM_CSR(insn);
> +               return (csr >=3D CSR_VSTART && csr <=3D CSR_VCSR) ||
> +                      (csr >=3D CSR_VL && csr <=3D CSR_VLENB);
> +       }
> +
> +       return false;
> +}
>
>  void route_exception(struct pt_regs *regs)
>  {
>         struct handlers *handlers =3D (struct handlers *)exception_handle=
rs;
> -       int vector =3D 0, ec;
> +       int vector =3D 0;
> +       unsigned long ec;
>
>         ec =3D regs->cause & ~CAUSE_IRQ_FLAG;
>         if (ec >=3D NR_EXCEPTIONS)
> @@ -432,6 +472,36 @@ void route_exception(struct pt_regs *regs)
>                 ec =3D 0;
>         }
>
> +       /*
> +        * Lazily enable V on the first vector instruction: if the faulti=
ng
> +        * instruction decodes as vector while VS is off, set VS to Initi=
al
> +        * and re-execute it, like the kernel's riscv_v_first_use_handler=
().
> +        * Genuinely illegal instructions continue to the unexpected-exce=
ption
> +        * path.
> +        */
> +       if (!(regs->cause & CAUSE_IRQ_FLAG) && ec =3D=3D EXC_INST_ILLEGAL=
 &&
> +           handlers && handlers->v_available && !(regs->status & SR_VS))=
 {
> +               u32 insn =3D (u32)regs->badaddr;
> +
> +               /*
> +                * stval is not guaranteed to hold the faulting instructi=
on.
> +                * Vector instructions are always 32-bit, so check the fi=
rst
> +                * 16-bit halfword and, for a 32-bit instruction, assembl=
e it
> +                * from two halfwords to avoid an unaligned 32-bit access=
.
> +                */
> +               if (!insn) {
> +                       u16 half =3D *(u16 *)regs->epc;
> +
> +                       if ((half & 0x3) =3D=3D 0x3)
> +                               insn =3D (u32)half | ((u32)*(u16 *)(regs-=
>epc + 2) << 16);
> +               }
> +
> +               if (insn_is_vector(insn)) {
> +                       regs->status |=3D SR_VS_INITIAL;
> +                       return;
> +               }
> +       }
> +
>         if (handlers && handlers->exception_handlers[vector][ec])
>                 return handlers->exception_handlers[vector][ec](regs);
>
> @@ -448,6 +518,9 @@ void vcpu_init_vector_tables(struct kvm_vcpu *vcpu)
>
>  void vm_init_vector_tables(struct kvm_vm *vm)
>  {
> +       if (vm->handlers)
> +               return;
> +
>         vm->handlers =3D __vm_alloc(vm, sizeof(struct handlers), vm->page=
_size,
>                                   MEM_REGION_DATA);
>
> --
> 2.53.0

Regards,
Anup
