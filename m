Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523275;
	b=jG8ACVAi/0/jqqSYRqMSGlJCJSnExnVRzKUR4QvOt6tDzajPyBJpqjWldcvrIUimxH00
	 8KH4GWj5s6NaS3jWTJCthAFt7GkQQKX5LMnFoUqwpigrKNFXPYxcRzfydta4yLhXJmgKO
	 7tOr0BID/cMrPj5jc2K7fMlODJpTLX7loqZPiDy7ij1ZnqgTmNSteSbFJCBv7EwuYu/E4
	 9E/HoUY3hDST/2k7TdTrYtfFIGreIbS9zsPK9vhFpB44qy7vRBXgmTCALV6iVIeBrDKVY
	 zkUfMOAxuRL/8unk/AXMdPF0poPhhUrtYdP9llRixeF966LsXMPB/uC6dzc7W40ffcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523275;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8Mqlwa6EX3DhYKNmeMt2IGTARTOODXfafQJowRn4dlM=;
	b=mLAmZ37voTnTg1F+2cdnZQ6e8sPeGzbiqv+DdwnaBC35qLr915RaF0A7Y4vu6VVY6jJO
	 pPqG13XIcKv7uMFEqymVRfRKIIbtxi0yOd4XzmSmTZBxeXB18+84c/Uktts3sAd8sZSZd
	 0pm/oAEP9xQJl1ymCPB5tDbv2TaMd+EmxADqeexDTybMXsT68XZNGrsMPLHbAopKF9IKU
	 wUwiZOLauuQyOEW1C6ANTIE0OvOxZ6GcEguL+cOlWxTiTWtzL8e7knN/ckpoMxooK1SgG
	 5rFKviL82L1IiZdySWY9/UvuVagMENDaprHMttElBZaNo9lcFnN4qy7bzoY9iZyVd5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iEz0rFk4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5922E606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iEz0rFk4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1FC51F000C4
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794523275;
	bh=8Mqlwa6EX3DhYKNmeMt2IGTARTOODXfafQJowRn4dlM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iEz0rFk4pcrqXqU+BQldjX3tyQ2671GVCvFqd0kWoAc8QviKfCEIeiN3Kx6uhPxdF
	 utPgLyhtTsNElrHLA04HCJJu8sUzswM0Di/1xwsJZaevuXjEEX5S80dmE7iQ7u9PK9
	 ryz4/odhO85LJ8cdMxBnc9sMjC9ccJb0VCtOhppwx6GlgYo3yVZLt0KKsYvHqxELYq
	 Ztidx9YkbQnprLVIWjwfE4CtHwKOxKLYlXvfSUA/1q1dWTwkaA8OOGWUu7rnKQOsyT
	 JUumxDhRGaMh6J+Z0D+vXFbcKaPzzzWf74pIHEz9mIPLGHoV4SoIka1fJO5VUoyYg3
	 X2F04FUeyX+bQ==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c45551fa84eso46904266b.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:41:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFRfL/7WyWp5F7r/lCyLspsgcUj5tuBmS7V2pCF5JMEhbHare64X4sYWLTEHKamOF6ZLELE6IzKDZBlCfM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Cy17OPkFM1INwiA3iR6eRab+LlTMB4q+T3ZkaNA7KBfW4P8cP
	wF3gfvh+D9vPprKpy6BBFqWpD7hUhpYsKjbOnWBzjqmLl7xKP8LiSxKp92l5bEs+n7XJt17TuQD
	Rmo6O/LzQKsN5kCaqf2FwzhkseX2+VAE=
X-Received: by 2002:a17:907:d7cb:b0:c50:6222:7b0b with SMTP id
 a640c23a62f3a-c509619b3c6mr57994366b.2.1794523273963; Thu, 12 Nov 2026
 14:41:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112212628.265262-1-jmattson@google.com>
In-Reply-To: <20261112212628.265262-1-jmattson@google.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 12 Nov 2026 14:41:02 -0800
X-Gmail-Original-Message-ID: <CAO9r8zMkKXRT0N18haYG+=jyO6FvL7VE84-=n9kpm7vnARH5UA@mail.gmail.com>
X-Gm-Features: AclHuK-hQsdGLd3NwGyUYGMiZEoeH0DYgS5sqPTrrpIqwcFjykynjnQHXUyAQXI
Message-ID: <CAO9r8zMkKXRT0N18haYG+=jyO6FvL7VE84-=n9kpm7vnARH5UA@mail.gmail.com>
Subject: Re: [PATCH] KVM: nSVM: Gate CET state copy in svm_copy_vmrun_state()
 on guest SHSTK
To: Jim Mattson <jmattson@google.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 1:26=E2=80=AFPM Jim Mattson <jmattson@google.com> w=
rote:
>
> Like nested_vmcb02_prepare_save() and nested_svm_vmexit_update_vmcb12(),
> svm_copy_vmrun_state() should gate copying s_cet, isst_addr, and ssp on
> guest_cpu_cap_has(vcpu, X86_FEATURE_SHSTK) (i.e. the feature is advertise=
d
> to the guest). Instead, copying is gated on
> kvm_cpu_cap_has(X86_FEATURE_SHSTK) (i.e. the host supports shadow stacks)=
.

This is a bit confusing, nested_vmcb02_prepare_save() and
nested_svm_vmexit_update_vmcb12() are about vmcb12 <-> vmcb02, so L2's
state, while svm_copy_vmrun_state() is for L1's state. I think the
patch is correct, but the examples are confusing.

Perhaps a better example would be __kvm_set_msr() and __kvm_get_msr()?

>
> Check guest_cpu_cap_has(vcpu, X86_FEATURE_SHSTK) instead of
> kvm_cpu_cap_has(X86_FEATURE_SHSTK) in svm_copy_vmrun_state().
>
> Fixes: c5ba49458513 ("KVM: nSVM: Save/load CET Shadow Stack state to/from=
 vmcb12/vmcb02")
> Signed-off-by: Jim Mattson <jmattson@google.com>
> ---
>  arch/x86/kvm/svm/nested.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> index 1299fdadeb73..b73bc9c3ebdb 100644
> --- a/arch/x86/kvm/svm/nested.c
> +++ b/arch/x86/kvm/svm/nested.c
> @@ -1248,7 +1248,7 @@ void svm_copy_vmrun_state(struct kvm_vcpu *vcpu, st=
ruct vmcb_save_area *to_save,
>         to_save->rip =3D from_save->rip;
>         to_save->cpl =3D 0;
>
> -       if (kvm_cpu_cap_has(X86_FEATURE_SHSTK)) {
> +       if (guest_cpu_cap_has(vcpu, X86_FEATURE_SHSTK)) {
>                 to_save->s_cet  =3D from_save->s_cet;
>                 to_save->isst_addr =3D from_save->isst_addr;
>                 to_save->ssp =3D from_save->ssp;
> --
> 2.56.1.703.gf848ed807c-goog
>
