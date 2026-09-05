Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F0A2931E5
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 00:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788567448; cv=pass; b=gLXG06CwpNVNJizHI3eF/AsDWjwnaRu8R+rWx3uaETpOD1hwXLxuy8vW/sftHYDSL90U/L6ChN6J2DSHaRSVrLKXB738omXaFqaAXCcWrMX5EpfeEo0TAusRUm67iSggg7saf4xXdTcHgQagwCki6reXzNPMyHU8fBXfrbiUuF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788567448; c=relaxed/simple;
	bh=zI5fGSwjsWTiLlNBOtJtqSsIJLDmrw+sj2jKVbZYzU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CYw4m4VFutU3H7khuwrEKZ5AEx45YnbnwPo8FTHaMtYZzsqu32jMGmxhQ/SpfnvehA+38E0rEGusaSutS634UpdbTHy3ofdhZVM7IH2Im9QquRjO5vnYXcFKZcMrnu0WuFPQcHsjCE4YYhfPCafLQ6sdx4i35CgDP6Jf8cICCzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FIfYS9Po; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FIfYS9Po"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a5d8fd8d88so2586a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 17:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788567444; cv=none;
        d=google.com; s=arc-20260327;
        b=m244YX9RvUMTuOVIO75dn1iAi7DDExD3jknSTlCb7bacvj7GZNTAxn9smGAxY8Bz7z
         wcVW6K/5JbsBHHnn+TVQNJgm4GnNXpqbgzmKKGF2Y+ctTdht6hEMe3X9m7rlW9N6Q45j
         n177HaIg4fomm8MyC5F+pJ3hV5we+H2Yb6i927YmxtSmBqj4IzfZjdXz8bWefgPGc9fT
         slPZmzw/2casj27ijJG6h40px1rxqq9hWtjIQwl81k0ke/GggsGVkYk+YgMvnKCh4Emn
         v7gJqqOU7kLlQnqaMd6UiH8z2cGTLjlQOIunNCRiKOTHihreg11wIiycJoGq5jBWoXhR
         DZnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sc2IfuuJuGolKz2gmkWX0SVyqSmKQRXBMRP12Me7TNk=;
        fh=/sh4X59ql30+0Dsd7Crc7s067A7nE1kScP6Cjdwxp7c=;
        b=AA+DKfmcwseGx443E+jbbhQ8+X4slN8qPRvpbzoUdZQumIFGAPUs1cJ+C2FgVrNPDE
         en01utjgrYYBwqZnH0BsHJtr3EEyQmPoncxBr0spUisDe8F2a+cg8AkzXowWrRoGTdmj
         YHrci/svBVnFL1SiX5SR/E7Pe3n6fTPeSShVKKHMd/W9TOUWvVYQMBiQnGPHerg3MAZB
         k+KTSfW5vfNAvguUu3fcdMQqa8Iayz2VRUdvmw90Qqxsgp2O6iVCD5D6Kr8TA8eFoEU0
         5FDpEaVmc+Me6G/F+g/Pk7UXjfJAbkNh5OAMKuKU54VZRHSKezb9FG0uCGcBAGvI4EX1
         8lvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788567444; x=1789172244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sc2IfuuJuGolKz2gmkWX0SVyqSmKQRXBMRP12Me7TNk=;
        b=FIfYS9PoxECi1D2a0S3HzODWdnNdiutisOvWa5RnVsQTKjXrwVAzDqHFp4/cqLGx/L
         /fZRqapsCBDCGkOpo03fS5NojZVZvTJyJj0UwEMms2yoUh3nN4MM6twGVjhfR/EaCcmt
         uPe+e09/4daZ9pgzskNXAJSsbQc7/NcoD3ZfBwmdCnSsuLI/scmjaSg0tux67TfByjDF
         pUZ1L9TxA2zdKWlEtjWpYcQlbLecFb4W0OxmCqlYiPQutLn3aM9fA/sM0goxO9+j1RjK
         W9heGZfxGpfr5c428u+Bhnw+fmUiG3mGRLBflA0zQDMq+RsUbBaAPE9EtNwH7cm7f02+
         CmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788567444; x=1789172244;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sc2IfuuJuGolKz2gmkWX0SVyqSmKQRXBMRP12Me7TNk=;
        b=VWC2lxQu4MBaRxqJPO8HRlIFO+NZSxDVaBp5imVd7nLujW9zcToq5SqFiIm9RVzYkU
         rp0x6rl3MIpK0OpLC7Cyf+iUC0lmHn+3quww0Iq792g5ksptYcSePL29vLcO58tFaiqk
         rFktswxb4lcmJRFoGQcQtYjcLXpKUYZUssqMV2V39A/B1vIzv3hnZY70zXCSlbB8uu6/
         OMZPM4X0xl5aL+TV27aQ9YPzdKiTiZwSWlv7DTTkaHgIN9KNFLnCREIUAl4YcnvFKpZp
         OTyEYHyw4r8GEVHjtxb+AdXYTNfcqldWJOYE6MMbp85r9pgneKgj/fWSkNW8PjUv5PBg
         WSoA==
X-Forwarded-Encrypted: i=1; AKwUvBzF3uKZSsuwM36HdRYpGSEkblpxzXpQDPo5WVu7c0yyIITeUpSchfWiQ/9DoWPVgaAI8P1/48+Vf06b45E=@vger.kernel.org
X-Gm-Message-State: AFuF++nVNFvKKllSPMj6pTnPgj/UU0I3c2Cxhg7+w/GHPWC1cK+22f0Y
	u/cg4fqkZibD6dps/qpfhqsUXd0lqIFGgIPaW6/T4yg7f0V26NozmgP/ON7BYlWLTgH5xKS4q/m
	zRubc0NpQJe5aCxA9StaWmVX8P0x1LQTp4fqsuV2e
X-Gm-Gg: AYBFou3AQj/j9hxAtZJRCQZ3h/cnc+ojl6p857QDZSmqvtS0xJzC56weOoYgNfsMivX
	uc581s0Sr7i239Dm+6FQ/bIBeEvGj544XDttg5uH82tKeOWuFvZFxAGT5ZBA/L6J98EXfVOzE9q
	G7zonJ4iPNgTFBOJW6LSmeUFvSJtkxPgfeHgqvlMabxXDOffjfvS9vzn8g0nqXZJanU792+ui+C
	Ev32bDLQomJ1J2SChCTQpZdHfEIO/a84ncG3Gvj2ji0SG8lioPoo7WjlhIhdf6zpuBAUzdM+0DI
	Nksda8J4Bz1w6SSWZ75Yj72aYIZHphur4KfMC+YnsAKI
X-Received: by 2002:aa7:c0c3:0:b0:6a6:967c:3186 with SMTP id
 4fb4d7f45d1cf-6a7f67ae76amr12958a12.2.1788567443649; Fri, 04 Sep 2026
 17:17:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824123954.315112-1-zhang_wei@open-hieco.net> <20260824123954.315112-6-zhang_wei@open-hieco.net>
In-Reply-To: <20260824123954.315112-6-zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 4 Sep 2026 17:17:11 -0700
X-Gm-Features: AcwNN1U1BmZHUf7tYcSc1W-hMHQbwms_ZkVgDOwBA2YimPa5kIpujfF625gK86o
Message-ID: <CALMp9eQFtNihRpkxDTs05UnfLgYJOHR7AsTLWi9FGjpNDq_kBA@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] KVM: nSVM: Use emulator bytes for synthesized
 nested #NPF
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 5:40=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
> SVM DecodeAssists provides instruction bytes for data-access #NPF exits.
> Hardware-reflected VM-Exits can use fresh VMCB02 bytes, but a
> KVM-synthesized #NPF has no hardware byte state to propagate.
>
> Use the emulator fetch cache when the nested #NPF is the current emulator
> exception.  Store the bytes in a one-shot buffer that is consumed while
> constructing VMCB12 and cleared before the next nested run, preventing an
> unrelated nested VM-Exit from reusing stale emulator bytes.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
> ---
>  arch/x86/kvm/svm/nested.c | 50 ++++++++++++++++++++++++++++++++++++++-
>  arch/x86/kvm/svm/svm.h    | 12 ++++++++++
>  2 files changed, 61 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> index 2db0ec66e8dc..635ff20cc431 100644
> --- a/arch/x86/kvm/svm/nested.c
> +++ b/arch/x86/kvm/svm/nested.c
> @@ -81,11 +81,45 @@ static void nested_svm_clear_vmcb02_insn_bytes(struct=
 vcpu_svm *svm)
>         svm->nested.vmcb02_insn_bytes_fresh =3D false;
>  }
>
> +static void nested_svm_clear_synthesized_insn_bytes(struct vcpu_svm *svm=
)
> +{
> +       svm->nested.synthesized_insn_bytes.prepared =3D false;
> +       svm->nested.synthesized_insn_bytes.insn_len =3D 0;
> +}
> +
> +static void nested_svm_prepare_synthesized_insn_bytes(struct kvm_vcpu *v=
cpu)
> +{
> +       struct vcpu_svm *svm =3D to_svm(vcpu);
> +       struct nested_svm_insn_bytes *synthesized =3D
> +               &svm->nested.synthesized_insn_bytes;
> +       struct x86_emulate_ctxt *ctxt =3D vcpu->arch.emulate_ctxt;
> +
> +       static_assert(sizeof(synthesized->insn_bytes) >=3D
> +                     sizeof(ctxt->fetch.data));
> +
> +       nested_svm_clear_synthesized_insn_bytes(svm);
> +
> +       if (!guest_cpu_cap_has(vcpu, X86_FEATURE_DECODEASSISTS))
> +               return;
> +
> +       if (!ctxt || ctxt->eip !=3D kvm_rip_read(vcpu) ||
> +           ctxt->fetch.end < ctxt->fetch.data ||
> +           ctxt->fetch.end > ctxt->fetch.data + sizeof(ctxt->fetch.data)=
)
> +               return;

Peeking into emulator internals violates encapsulation. Rather than
performing arithmetic on fetch.data and fetch.end, the emulator should
provide a function for accessing the fetch cache.

> +       synthesized->insn_len =3D ctxt->fetch.end - ctxt->fetch.data;
> +       memcpy(synthesized->insn_bytes, ctxt->fetch.data,
> +              synthesized->insn_len);
> +       synthesized->prepared =3D true;
> +}
> +
>  static void nested_svm_update_vmcb12_insn_bytes(struct kvm_vcpu *vcpu,
>                                                 struct vmcb *vmcb12,
>                                                 const struct vmcb *vmcb02=
)
>  {
>         struct vcpu_svm *svm =3D to_svm(vcpu);
> +       struct nested_svm_insn_bytes *synthesized =3D
> +               &svm->nested.synthesized_insn_bytes;
>
>         nested_svm_clear_insn_bytes(vmcb12);
>
> @@ -93,11 +127,20 @@ static void nested_svm_update_vmcb12_insn_bytes(stru=
ct kvm_vcpu *vcpu,
>             !nested_svm_vmexit_has_insn_bytes(vmcb02))
>                 goto out;
>
> -       if (svm->nested.vmcb02_insn_bytes_fresh)
> +       if (svm->nested.vmcb02_insn_bytes_fresh) {
>                 nested_svm_copy_insn_bytes(vmcb12, vmcb02);
> +               goto out;
> +       }
> +
> +       if (synthesized->prepared) {
> +               vmcb12->control.insn_len =3D synthesized->insn_len;
> +               memcpy(vmcb12->control.insn_bytes, synthesized->insn_byte=
s,
> +                      vmcb12->control.insn_len);

These instruction bytes may be short. Although this is fixed in the
next commit, introducing a bug in one patch and fixing it in the next
is bad practice.

> +       }
>
>  out:
>         svm->nested.vmcb02_insn_bytes_fresh =3D false;
> +       nested_svm_clear_synthesized_insn_bytes(svm);
>  }
>
>  static void nested_svm_inject_npf_exit(struct kvm_vcpu *vcpu,
> @@ -106,6 +149,8 @@ static void nested_svm_inject_npf_exit(struct kvm_vcp=
u *vcpu,
>  {
>         struct vcpu_svm *svm =3D to_svm(vcpu);
>         struct vmcb *vmcb =3D svm->vmcb;
> +       struct x86_emulate_ctxt *ctxt =3D vcpu->arch.emulate_ctxt;
> +       bool from_emulation =3D ctxt && fault =3D=3D &ctxt->exception;
>         u64 fault_stage;
>
>         /*
> @@ -134,6 +179,8 @@ static void nested_svm_inject_npf_exit(struct kvm_vcp=
u *vcpu,
>         vmcb->control.exit_info_2 =3D fault->address;
>
>         nested_svm_set_vmcb02_insn_bytes_fresh(svm, from_hardware);
> +       if (from_emulation && !(fault->error_code & PFERR_FETCH_MASK))
> +               nested_svm_prepare_synthesized_insn_bytes(vcpu);
>         nested_svm_vmexit(svm);
>  }
>
> @@ -937,6 +984,7 @@ static void nested_vmcb02_prepare_control(struct vcpu=
_svm *svm)
>          * Clear stale DecodeAssist data before L2 runs.
>          */
>         nested_svm_clear_vmcb02_insn_bytes(svm);
> +       nested_svm_clear_synthesized_insn_bytes(svm);
>
>         if (guest_cpu_cap_has(vcpu, X86_FEATURE_VGIF) &&
>             (vmcb12_ctrl->int_ctl & V_GIF_ENABLE_MASK))
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index 610def16f700..9344707e9ffd 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -209,6 +209,12 @@ struct vmcb_ctrl_area_cached {
>         };
>  };
>
> +struct nested_svm_insn_bytes {
> +       bool prepared;
> +       u8 insn_len;
> +       u8 insn_bytes[X86_MAX_INSTRUCTION_LENGTH];
> +};
> +
>  struct svm_nested_state {
>         struct kvm_vmcb_info vmcb02;
>         u64 hsave_msr;
> @@ -245,6 +251,12 @@ struct svm_nested_state {
>
>         /* True if VMCB02 has instruction bytes from the current hardware=
 exit. */
>         bool vmcb02_insn_bytes_fresh;
> +
> +       /*
> +        * Cached instruction bytes for the current synthesized nested #N=
PF.
> +        * Valid until the corresponding nested VM-Exit is constructed.
> +        */
> +       struct nested_svm_insn_bytes synthesized_insn_bytes;
>  };

I think the implementatiom would be much cleaner if you wrote the
synthesized instruction bytes directly to the vmcb02, rather than
going through this staging buffer.

>  struct vcpu_sev_es_state {
> --
> 2.43.7
>
