Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793939683;
	b=275w+kZnsVm2CY/RWTAvZsm1bkidgmnfviOgXuYg5Jmp/pkweC8nQY5lGEdtm4DVfw43
	 LFiBU7uqtKL6I1yxhpGXeer0G2TaaPGYLSxVem8KPt/U+tMJMfYGzXyMWfd68tCIBpUEL
	 YAoTjszhEqkVlq+KSd85jZQt427LYpwo7+v734zYfwuqwqQxIBlgEZ50+m76A/XD8vtWv
	 qTihoolsKVF3haVzufv6IgyfCQmRKFxBXLHSuDBIi9UXZbC+fvQh+Ci6VfXya1OKIx5EB
	 BDUwDjWM81ghWgYc2n6GpxpHy8d+Mw2I0U1UnkiDzwwoTukwLdoSKRX37pZro3crUJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793939683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GTWpSOIrW/I0u+o69vNXQD1in08W0Oj8xg0zoxTU70I=;
	b=r6lGw6xpyItgz65v8Isdvlc/EmXVYzI9Eo6z/Y1pCTNbIMvfw5HX+WrALuDmVwIRw8ME
	 1XT4FIJplVFIRhBbmK1xSL2+4/1tBc98o30T+nFPmZgZXbfGC1j9y+KSFAW0aMN6y8BG5
	 OqLD0WpHVsreCXy15sEgpB9FfcE2j1RZrKKCPZmeSjy1e1++7OH3R5P3CzSrYzd0hy25D
	 FpXz1Lrk04jSRtNWokYoU6n0T+Dvgpv2vcH/nM6nRztVabQGBmEyqcVy/t2AzJlOh15MW
	 8TgjHwAoNtxWR+i4ie06m1N7U2QVdiwKHpFSFw+bwfHI0fqLpGpi+St2Q39g808eDWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ehsHOBSU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07AE606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C07AE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ehsHOBSU
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b571a45a2aso1791a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:34:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793939681; cv=none;
        d=google.com; s=arc-20260327;
        b=V25uo/0Pri091R5iXloH4PbP15hnEHW8bCBns5lgqb6eac/A8Zauahj44GKXOqzbEf
         oGryJNqk9sP/89XmJPQ/CUI0KhFNc1AVhu5Ng/k2AnkY/KrQTHm8sIgpmLScXCpOZ/dJ
         axiadhz4rL8QJJxA9Cecb8retvOEwxJfZBJ9yq1ShcT3RRd1+211zpCuT2zM7zKaxxde
         Ow98/MWSzdf+A3z1S07MS4wWLA7maHwSmccwUpYzOwbgboQHuEkSs9aunW1Q30Msyrf8
         woqGcdjehOsZf4cjTJmFJJ1G6ynWVHKbnzh9aOINykXka2N/zNjhhQSXzRzgp2OtEkRm
         d4xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GTWpSOIrW/I0u+o69vNXQD1in08W0Oj8xg0zoxTU70I=;
        fh=F5QwjHJxR2ZykMJJCOH668lo3atL89Z6s2c2HVSw49o=;
        b=Gf16ujlsbLR7rv7DzcFIlVfC2B4PSwc1RND0bfN6/xhygX4fB3lNA2TQxI/PmZkv/v
         BCREvzmKkVSHogfE8qC4L9qxX5EdKMtouJ7WhwthNdRRJ9f1KGTgjn/D3YNysY3AGMnU
         L+bedt33lQnz0IJonRSgJHk1kxk1rIEPhbJSz9TEVfVAZFVMTBtfs2umFhjdJBx/X8Hz
         Cbb+4bUUo/a6leFI+rNJ96WwhbpHXiFwPSF7txKDqo2UN8JSbPT1FZqQz3QcChB/9wGA
         dy164fDtsLgJBzlCLutl2uKoanAvFDCu/HqMiQupGUo/pp5uM2WqCzDJMa+I1w83XueO
         4zaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793939681; x=1794544481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GTWpSOIrW/I0u+o69vNXQD1in08W0Oj8xg0zoxTU70I=;
        b=ehsHOBSUrScJ0CckZozJsURRaHwfw7o+/weAZ+Groz3G/H9UusoTeLPSkyCa55ZBnq
         ye3I+2cqUNJXW3pbYDMn6GxLfrcgGj3t8O1Lrol2OTUvARGsEcrMw64gqfqJQ7xRWwor
         zehhfIRbFU0iuG7NrlrCnCscl8FUKhl2TR/v+q+gHHiscYfQyx8lF+GlKbr1u70hxYGR
         KM7G7B3I/YsA66EcCBqqgnn+CE/k+GhcK31pNKGOOqu2QYQAgzuKs08wTCah7oA6v2zI
         qxYMEdQoFQXaZ6kspc5KXxrK8WrP8SAbd4lxWAKpLICWkTVeEhLEyrY8VThYg89y9SNs
         0CAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793939681; x=1794544481;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GTWpSOIrW/I0u+o69vNXQD1in08W0Oj8xg0zoxTU70I=;
        b=qkHd3KnKpuZRV+Zr8D8viWA9KJ5/eWAB3Lhri+DOXUhdRrkM8Sy6UbT2jvf+rpk5kK
         BXuFRhQRJjNdOA3X4ev7l2Bpd2MQLtpJCS128h+/kGashR4V6AV6a5mtBDvffID0KNtq
         yDQSmCMyQ29nyIRifk4Do0giml92gObBkJl1/xCDwvI+Qwql0gO/COhuN9EqxDGUOUdv
         IsYyRMcgUi4WOI6kFf3Uj/TxHGCRZl16yLJXphD+ksI4NgysEKZqroCytKPglm/aM6Fv
         Rur34izLy2j/HdW3bI2KJJ5IwaS5RGADPGEYKAtMG4sRqmJGVKu5o3j4X4QJkdLyAnhA
         +MEA==
X-Forwarded-Encrypted: i=1; AKwUvBze8Jsmco0AdMsAY9t1Ue3AlYVxcwbi9QPEppYPeXKOgA79ruhE1yddrunheIhMCvneI3NoUPZ9QaLBMYo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Im2KNQftxkwlYQHIz/LPVwEwT3fE4L5kro9OJBWooygjYNuS1
	0uOyiKGr5i9/nEnwE1MvwAyATcjTB9TF8LSB6zufEBZSLEPnN+QlKjk1S/rRO3D+6J/NWP2tXtS
	3FHSrxMfyhXOXisxC0eUuve8CwYlONHOH9WlSavrF
X-Gm-Gg: AYBFou3Dp7oLVtXc4s+DjDDRFTOiARJJEnMaMqP9I12nyle/ys5U2U67vATyf9ZOZ79
	tLdk5asyCKRya1h3GdBSvlD2iKCHRMk6m8STE/HOTAWIoa8ZEGEiyMSD0RtMC4cGu33xpxz7YyG
	qSSJBRsceUVH9vaJ+7kLF60jfFJLsJTXYjlZzEW8wOhzao9Hom61M/YGoXXqAPFB14ZoEHiYzn5
	x746jM+iqEJKgnJtOKhVrCxpBgN+8amR63C0pQe+TKqIjM0ul0/vbzEMbU6FQLfobJIZPKpzFy5
	OYeBQVpzmDnIih/fS3/SNxMSJ1TqYHlFJiEsXnN3uSrddZyuZMsz37n7XXzPOEpmMpeNG7IOAUg
	hUtOcYsvmIQydyEcqEqvwvXo1pqssqOLNjNG14T8wLWeU10Q7XWksT9xYeRCtHMIoNx5SXoo2eR
	X5AGCf6WKp25Q37yVjw28qOac8
X-Received: by 2002:aa7:d691:0:b0:6b3:f12d:7405 with SMTP id
 4fb4d7f45d1cf-6b6e76232abmr107a12.14.1793939680539; Thu, 05 Nov 2026 20:34:40
 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930210750.1487547-1-chang.seok.bae@intel.com> <20260930210750.1487547-12-chang.seok.bae@intel.com>
In-Reply-To: <20260930210750.1487547-12-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 5 Nov 2026 20:34:28 -0800
X-Gm-Features: AclHuK8Cx6t65NL8zYNN-6JjRZdlWwlMy8grczsKPGO2ySINkfgIV4cdy6ZZwi0
Message-ID: <CALMp9eSqUV64WbzZ0xbAc42+nyBJLN7CQ-ark5j-4P8PNPwC5g@mail.gmail.com>
Subject: Re: [PATCH v8 11/20] KVM: x86: Handle EGPR index and
 REX2-incompatible opcodes
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 4:38=E2=80=AFPM Chang S. Bae <chang.seok.bae@intel.=
com> wrote:
>
> Prepare the emulator for REX2 handling by introducing the NoRex2 opcode
> flag and supporting extended register indices. For the latter, factor out
> common logic for calculating register IDs.
>
> REX2 does not support three-byte opcodes. Instead, the REX2.M bit selects
> between one- and two-byte opcode tables, which were previously
> distinguished by the 0x0F escape byte.
>
> Some legacy instructions in those tables never reference extended
> registers. When prefixed with REX, such instructions are treated as if
> the prefix were absent. In contrast, a REX2 prefix causes a #UD, which
> should be handled explicitly.
>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Tested-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> Link: https://lore.kernel.org/1ebf3a23-5671-41c1-8daa-c83f2f105936@redhat=
.com
> ---

[ ... ]

> @@ -1119,9 +1130,9 @@ static int decode_modrm(struct x86_emulate_ctxt *ct=
xt,
>         int rc =3D X86EMUL_CONTINUE;
>         ulong modrm_ea =3D 0;
>
> -       ctxt->modrm_reg =3D (ctxt->rex_bits & REX_R ? 8 : 0);
> -       index_reg =3D (ctxt->rex_bits & REX_X ? 8 : 0);
> -       base_reg =3D (ctxt->rex_bits & REX_B ? 8 : 0);
> +       ctxt->modrm_reg =3D rex_get_rxb(ctxt->rex_bits, REX_R);
> +       index_reg       =3D rex_get_rxb(ctxt->rex_bits, REX_X);
> +       base_reg        =3D rex_get_rxb(ctxt->rex_bits, REX_B);

Per Section 3.1.2.1 ("REX2 Prefix") of the Intel APX Architecture
Specification (rev. 9.0):

  Note that the R, X and B register identifiers can also address
  non-GPR register types, such as vector registers, segment registers,
  control registers and debug registers. When any of them does, the
  highest-order bits REX2.R4, REX2.X4 or REX2.B4 are generally
  ignored, except when the register being addressed is a control or
  debug register. Furthermore, if ModRM.Reg addresses a segment
  register, both REX2.R4 and REX2.R3 are ignored. For example, using
  the REX2 prefix, the instruction "ADDPD xmm1, xmm2/m128" can use all
  32 GPRs as the base and/or index registers in its memory operand,
  but it still cannot access XMM16 to XMM31 because REX2.R4 and
  REX2.B4 are ignored when the R and B register identifiers address
  vector registers.

In __decode_register_operand(), unlike the Mmx case (which masks
"reg &=3D 7;"), the Avx | Sse cases do not mask reg to 15 before setting
op->addr.xmm and calling kvm_read_sse_reg(). If a guest executes a
REX2-prefixed SSE instruction in twobyte_table (e.g., MOVAPS with
REX2.M0=3D1 and REX2.R4=3D1 or REX2.B4=3D1) that traps into the emulator,
reg will be in the range 16..31, hitting the default BUG() in
_kvm_read_sse_reg() / _kvm_write_sse_reg() and crashing the host.

Similarly, em_mov_rm_sreg() and em_mov_sreg_rm() use ctxt->modrm_reg
directly without masking off REX.R / REX2.R3 and REX2.R4, so setting
R3=3D1 or R4=3D1 on opcode 0x8C or 0x8E will erroneously inject #UD.

[ ... ]

> @@ -4297,15 +4308,15 @@ static const struct opcode opcode_table[256] =3D =
{
>         II(ImplicitOps | Stack, em_popf, popf),
>         I(ImplicitOps, em_sahf), I(ImplicitOps, em_lahf),
>         /* 0xA0 - 0xA7 */
> -       I2bv(DstAcc | SrcMem | Mov | MemAbs, em_mov),
> -       I2bv(DstMem | SrcAcc | Mov | MemAbs | PageTable, em_mov),
> -       I2bv(SrcSI | DstDI | Mov | String | TwoMemOp, em_mov),
> -       I2bv(SrcSI | DstDI | String | NoWrite | TwoMemOp, em_cmp_r),
> +       I2bv(DstAcc | SrcMem | Mov | MemAbs | NoRex2, em_mov),
> +       I2bv(DstMem | SrcAcc | Mov | MemAbs | PageTable | NoRex2, em_mov)=
,
> +       I2bv(SrcSI | DstDI | Mov | String | TwoMemOp | NoRex2, em_mov),
> +       I2bv(SrcSI | DstDI | String | NoWrite | TwoMemOp | NoRex2, em_cmp=
_r),

Per Section 3.1.2.1 and Section 3.1.3.3 ("64-Bit Absolute Direct Jump
(JMPABS)") of the Intel APX specification, opcode 0xA1 in legacy map 0 is
an exception to row 0xA* being reserved under REX2; REX2 (with M0=3D0 and
W=3D0) followed by 0xA1 encodes JMPABS. Marking 0xA1 with NoRex2 causes KVM
to raise a bogus #UD on a valid JMPABS instruction.

[ ... ]

> @@ -4385,12 +4396,12 @@ static const struct opcode twobyte_table[256] =3D=
 {
>         N, GP(ModRM | DstMem | SrcReg | Mov | Sse | Avx, &pfx_0f_2b),
>         N, N, N, N,
>         /* 0x30 - 0x3F */
> -       II(ImplicitOps | Priv, em_wrmsr, wrmsr),
> -       IIP(ImplicitOps, em_rdtsc, rdtsc, check_rdtsc),
> -       II(ImplicitOps | Priv, em_rdmsr, rdmsr),
> -       IIP(ImplicitOps, em_rdpmc, rdpmc, check_rdpmc),
> -       I(ImplicitOps | EmulateOnUD | IsBranch | ShadowStack, em_sysenter=
),
> -       I(ImplicitOps | Priv | EmulateOnUD | IsBranch | ShadowStack, em_s=
ysexit),
> +       II(ImplicitOps | Priv | NoRex2, em_wrmsr, wrmsr),
> +       IIP(ImplicitOps | NoRex2, em_rdtsc, rdtsc, check_rdtsc),
> +       II(ImplicitOps | Priv | NoRex2, em_rdmsr, rdmsr),
> +       IIP(ImplicitOps | NoRex2, em_rdpmc, rdpmc, check_rdpmc),
> +       I(ImplicitOps | EmulateOnUD | IsBranch | ShadowStack | NoRex2, em=
_sysenter),
> +       I(ImplicitOps | Priv | EmulateOnUD | IsBranch | ShadowStack | NoR=
ex2, em_sysexit),
>         N, N,
>         N, N, N, N, N, N, N, N,

Per Section 3.1.2.1 of the Intel APX specification, all opcodes in row 0x3*
of legacy map 1 trigger #UD when prefixed with REX2. Leaving 0x36..0x3F as
N (NotImpl) causes KVM to return EMULATION_FAILED to userspace instead of
raising #UD when they are prefixed with REX2.

[ ... ]

> @@ -5001,6 +5012,13 @@ int x86_decode_insn(struct x86_emulate_ctxt *ctxt,=
 void *insn, int insn_len, int
>                 opcode =3D opcode_table[ctxt->b];
>         }
>
> +       /*
> +        * Instructions marked with NoRex2 ignore a legacy REX prefix, bu=
t #UD
> +        * should be raised when prefixed with REX2.
> +        */
> +       if (opcode.flags & NoRex2 && ctxt->rex_prefix =3D=3D REX2_PREFIX)
> +               opcode.flags =3D Undefined;

All other opcode attribute checks in x86_decode_insn() are performed on
ctxt->d after the "while (ctxt->d & GroupMask)" loop. Checking NoRex2
before group expansion means NoRex2 will be silently ignored if it is ever
placed on a group table entry. Should this check be moved right after the
GroupMask loop?
