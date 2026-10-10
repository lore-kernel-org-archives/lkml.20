Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8317344D9B
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 17:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791651669; cv=none; b=I/1Mlq4rK5Z1egVhzODOnV8N1bEnY8MmZ4WF5y/nDuLWJbP+ltlgxhJlKjYSijjHOdig97VpBN6CvYzeC+WR9APtn9YkbJpVVE0VlhkUqmoEnJevUiaEzTybgGg0r7EGI1HbVUisdwg4JjOQz/NtiO69M/hFhT9o5zhF6Hy0YzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791651669; c=relaxed/simple;
	bh=svmSHL/ynjXEg6ajN2kLOnbWJgU4XqKuOp5k7Pc0r3w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aHnazHVSm0Jf5f4VLFw84113O2zS3g6M6rSIBLar/Y6DWUX/lPfZhB78BUf2bqFXk9FIzoFyfE1MRHecBwcEIhCLBm2B33p8TNICPGb8PEz0ItRPHXdZZBROMuzDjnF5ES8iqKXpkVMkK9AUODgFq5bs7JFgba9WO/yaIf5qCEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FbWeEpQl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DvR2KWd9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FbWeEpQl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DvR2KWd9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791651666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I+m7pBfG9zN2hTnmKrun1UbP204UC9X1YckW1gKfjXo=;
	b=FbWeEpQlmZGgy37/AfUwlNUXZsgArubCKOYm7/1IRQe6SmqtszAY0v9BrV6MOk+1t+YXmn
	3NF6tOR/G3TeVln7JpslaIrUZ+FiaqohaVb/kJWBzh7lcaC4JbQ/20Y0NwqOKaOSamx5WE
	AfX2EbxAiG9/feCwhEhij9J+pH3ycb4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-Wx970jJBNQS3a2hvmQ7OKg-1; Sat, 10 Oct 2026 17:00:59 +0000
X-MC-Unique: Wx970jJBNQS3a2hvmQ7OKg-1
X-Mimecast-MFC-AGG-ID: Wx970jJBNQS3a2hvmQ7OKg_1791651659
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-917870a9be3so57881876d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791651658; x=1792256458; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=I+m7pBfG9zN2hTnmKrun1UbP204UC9X1YckW1gKfjXo=;
        b=DvR2KWd98CX5rDtNT+dPWk2eGQ3C4m2UIDl+blR8+WNvD2aV9+P6Sgpacxt4Ek+Kg0
         thmX2y6YY9/Fos5Gbg6nn9MANIlmm8ohcZ6d8RubXXOjlYRD+y78OyMVfT/FqBwWVtEG
         g7kkxIFYAVFGx1n8mK+KB3/KDvJ4FC7oO0NS4mfeScxwlojcNdRGi8iqiKpIYe01SxoR
         wgJK5LD4/qD8DsmTO28iZc+IICuA2Kg/8AmSrm+PSxOicQd7srRQnQpwfXMKZBMUxQwc
         YBtDm4B2EaGjSw4iaffM6Ts8bm+TRpIrr/Ha8gXfeuk3Z71X/7VsmmG7XZOunKtknaYd
         u7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791651658; x=1792256458;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I+m7pBfG9zN2hTnmKrun1UbP204UC9X1YckW1gKfjXo=;
        b=O3jir4UvIEZjFeDNFGmzNXarKRwnfg3BLoOEe6ssfR+KQX0wfs0ci4SgdC5/kno2LI
         SukHGHiSq6ztn5V1IMNl+9cwi2hX1LWNc7Y5aB4v+jzL7Ok2jLfByG4OAi+0pEll8yRl
         BRioRIWNXiLT1hg29Iu/e9zphnN+nXUJQ8sCAYHXTL3w+ce+R1CBRaT0MvDiVK0BfL6S
         VLsIxFXg6Nf60Ta3nh3xkXK81so4xYlMNcorqJp52O92STpGKnEiwSOoShA4S8iJQvEz
         KjmeXGtKZfSyui7FGq91qCBSFEFcnWAJF3tpAuFVFhbfjKt9U+K+8Qk35VGtfOM6q+yU
         16KA==
X-Forwarded-Encrypted: i=1; AKwUvBz0U4M65oXT+wpzGBejZgMIwYPz7SnfTFPjidb6opFDBCAp9Yg4CGpUill6KeII4lqr0Zbq6g6lMPN4OOY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2+byxMXGVsc+nMXoa60i2A4C6d5Gco3lruO4RZHzrwheQTKDE
	OrkcDIVAATmcWuEWv2SsBgMB4zT3FDCaGafetWyigLnj0Nv+3zHwWXzMnMW0aChYkXkBU6VGioZ
	b8jJ5YD7gesm1NQyLo2kwiIS5sgWsrQKGEJorzlvNGCmFAgwtKgx6nv/54D+x5NJNBfOnbhSOgg
	==
X-Gm-Gg: AYBFou2sxHaLevHNtzSyjQVshr8GADAtcQtR6edkvHp8FJDHqP+aJSejIe9N0QfZLY2
	ebDQhSYYPBylY2fCrBj/HNSog/ssYFsPss707i0gqgPaAe3Mqu41WAgYxb07TSmGy7Rb/z3o3ex
	6g8ns3HNuGWVtPcd6XoyX0OG/AQfhQsVqa+KWi2Eo1E8GCJfJvtdvjCFVy8WPkLZ3QNNY+atx8n
	H8fjYB4Z6OyUSAv6icMU+BLnGS8dV0tk8QbujxbopSpVE1C+x4COzaKSfamwpSxP3/m/7eV+C4v
	KbpCfIXUuekfLZbkLmGQ0gK8Uq3FO09zLo5sx9TEyiRNLMQqry5rWjeUUnI12VaHlJpPTmtoRsj
	IrsfeO5pStOYp74A+XQFfXP9G0aClFdPiXYobzbr912tyCpKfzxKIZ0uGOgtpOwaKk8Ugnlvkl0
	X6n96Hqo6Q
X-Received: by 2002:a05:622a:2285:b0:535:1463:ec25 with SMTP id d75a77b69052e-535a61e2915mr68879351cf.25.1791651658422;
        Sat, 10 Oct 2026 10:00:58 -0700 (PDT)
X-Received: by 2002:a05:622a:2285:b0:535:1463:ec25 with SMTP id d75a77b69052e-535a61e2915mr68878661cf.25.1791651657794;
        Sat, 10 Oct 2026 10:00:57 -0700 (PDT)
Received: from mlevitsk-thinkpadt14gen3.ibmmarkh.csb (pool-173-33-204-162.cpe.net.cable.rogers.com. [173.33.204.162])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b46b471sm44058171cf.1.2026.10.10.10.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 10:00:57 -0700 (PDT)
Message-ID: <898b1b8ba85284a4f4094ce0453ea59d094c1c3b.camel@redhat.com>
Subject: Re: [PATCH 2/2] KVM: nVMX: avoid losing the posted notification
 interrupt when exiting L2
From: "mlevitsk@redhat.com" <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Cc: x86@kernel.org, Sean Christopherson <seanjc@google.com>, Paolo Bonzini
	 <pbonzini@redhat.com>, linux-kernel@vger.kernel.org
Date: Sat, 10 Oct 2026 13:00:55 -0400
In-Reply-To: <20261009205036.672523-3-mlevitsk@redhat.com>
References: <20261009205036.672523-1-mlevitsk@redhat.com>
	 <20261009205036.672523-3-mlevitsk@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-10-09 at 16:50 -0400, Maxim Levitsky wrote:
> While delivering a nested posted interrupt notification
> (see vmx_deliver_nested_posted_interrupt), KVM assumes that,
> as long as the target vCPU is in the guest mode, KVM can send the
> special POSTED_INTR_NESTED_VECTOR, which will either trigger APICv ucode
> to inject all interrupts into L2 or cause a VM exit, after which
> vmx_complete_nested_posted_interrupt is supposed to finish the job.
>=20
> However, a third case is possible: if the target vCPU is about to exit
> to L1, the posted notification interrupt must be instead injected
> to L1' APIC, but KVM doesn't do this.
>=20
> Detect this case in the nested VM exit path and act accordingly.
>=20
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
> =C2=A0arch/x86/kvm/vmx/nested.c | 10 +++++++++-
> =C2=A01 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> index 2142e25c9b6c..4d8bb7f7fcd4 100644
> --- a/arch/x86/kvm/vmx/nested.c
> +++ b/arch/x86/kvm/vmx/nested.c
> @@ -2445,7 +2445,7 @@ static void prepare_vmcs02_early(struct vcpu_vmx *v=
mx, struct loaded_vmcs *vmcs0
> =C2=A0			 ~PIN_BASED_VMX_PREEMPTION_TIMER);
> =C2=A0
> =C2=A0	/* Posted interrupts setting is only taken from vmcs12.=C2=A0 */
> -	vmx->nested.pi_pending =3D false;
> +	WARN_ON_ONCE(vmx->nested.pi_pending);
> =C2=A0	if (nested_cpu_has_posted_intr(vmcs12)) {
> =C2=A0		vmx->nested.posted_intr_nv =3D vmcs12->posted_intr_nv;
> =C2=A0	} else {
> @@ -5162,6 +5162,14 @@ void __nested_vmx_vmexit(struct kvm_vcpu *vcpu, u3=
2 vm_exit_reason,
> =C2=A0	kvm_clear_exception_queue(vcpu);
> =C2=A0	kvm_clear_interrupt_queue(vcpu);
> =C2=A0
> +	if (lapic_in_kernel(vcpu) && vmx->nested.pi_pending) {
> +		vmx->nested.pi_pending =3D 0;
> +		if (!WARN_ON_ONCE(vmx->nested.posted_intr_nv =3D=3D -1)) {
> +			kvm_lapic_set_irr(vmx->nested.posted_intr_nv, vcpu->arch.apic);
> +			kvm_make_request(KVM_REQ_EVENT, vcpu);
> +		}
> +	}
> +

Hi!

After giving this a bit more of thought, I see that this will introduce spu=
rious interrupts to L1,=C2=A0
if the posted interrupt was actually served by APICv.

ON can't be trusted, so I only can add scan of PIR here to reduce chances o=
f this happening, but I am not sure
that this can be completely avoided.=C2=A0

I think that a spurious interrupt is better though that no interrupt becaus=
e the guest can depend on it, and might
not even enter the L2, until it receives this posted interrupt.

What do you think?

Best regards,
	Maxim Levitsky



> =C2=A0	vmx_switch_vmcs(vcpu, &vmx->vmcs01);
> =C2=A0
> =C2=A0	kvm_nested_vmexit_handle_ibrs(vcpu);

