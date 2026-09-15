Received: from mta0.migadu.com (out-222.mta0.migadu.com [91.218.175.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B226D47887F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464681; cv=none; b=anndF3bDgm3ksaIXTDrIVZVmn3AcelA54qYeP9dlhKZzWwL6DmSir4NA35/1G8tyaUaC8/8On2i2lpkfiygo19ZVu49Iep/lxJ+Pz/zHT30XYC40ESnSWN+SbPjFCmo4xuXtKSzXqVjlLWG1jDPyr9vhX3W3Ewx+7B/gn/Nw45U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464681; c=relaxed/simple;
	bh=K1tpiBhMEi6xm6OL69dgTWLGxpnuijEoB8W6TLPj2Rw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I7vnDMqoSIY0e1aZMc8u+5ghy927/xv/1lfzP+aoEjB1wKllBF8Y+yhdXY+zZr1VX0ic9ZUOooBr4/UlMgOxdteRl4/K8b6S670L7AVq6PM0BfbNvKzdS/jLcVaxyPakok74Dm3GV5h5IrSt2MLCta5NO73GbapVlRbLKuIQEUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QFkP9RiP; arc=none smtp.client-ip=91.218.175.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QFkP9RiP"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=K1tpiBhMEi6xm6OL69dgTWLGxpnuijEoB8W6TLPj2Rw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789464673; v=1; x=1790069473;
 b=QFkP9RiPj76LxFOu7moY/uG7HB8F0kqvcHLklvnNUbwHuZTJyhCr6pNgOLAx+67y6ie6x94R
 ZBxbPgXYHRnuI31d/0ow9J2qwILm1Kp9ajvk3YqyalWGRM2qm0jPMk8N0LSekhZjRDnaaVS/MZg
 zxvN4joUCOWLGQEK4VRA/i5E=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f9ad1675c5cdb16e;
	Tue, 15 Sep 2026 09:31:13 +0000
X-Mizu-Trace-ID: f9ad1675c5cdb16e
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so3757e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:31:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxwhlZmvD0Ke7QfutkRizj6CmPP7e5eynW+75dIXQvRWKcnqTaa0WOLVhrVkoxvVN9FNFHf573Vk2qukjI=@vger.kernel.org
X-Gm-Message-State: AFuF++memXZj8FRFkJ+aHb1V8QsrBrCGQ0OjmZyEoMyI/Wx3QE/zCjFo
	NJtcLhIEoZkgO/0NLSvQq/7j1pT9JWOYHRtX3WGCuk2Gxk9lHbhtPhwiTOS7YrXBN6tjuw/cVUY
	WJJpPe1yOdC9qJFAQUw2ucD9fEKLhW0pSlm9KKW7L
X-Received: by 2002:a05:6512:3dac:b0:5b1:ca0b:25d2 with SMTP id
 2adb3069b0e04-5b8b2d0db8bmr149174e87.4.1789464668791; Tue, 15 Sep 2026
 02:31:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914174521.832575-1-fuad.tabba@linux.dev> <86zexi6f4x.wl-maz@kernel.org>
In-Reply-To: <86zexi6f4x.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 15 Sep 2026 10:30:32 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzWJGzVswdwckfU6ByYQWmQ4z7BU0wQWQTxxHsDjG=ZKQ@mail.gmail.com>
X-Gm-Features: AcwNN1UQshuXGF5Wu7l-zOdL8fXBqDP838U_-8aNt2NxCj12tCNZ1V9nXV-BhVE
Message-ID: <CA+EHjTzWJGzVswdwckfU6ByYQWmQ4z7BU0wQWQTxxHsDjG=ZKQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Reject the stage-2 MMU pointer hypercalls
 under pKVM
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, vdonnefort@google.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Tue, 15 Sept 2026 at 10:24, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > @@ -602,6 +614,9 @@ static void handle___kvm_flush_cpu_context(struct kvm_cpu_context *host_ctxt)
> >  {
> >       DECLARE_REG(struct kvm_s2_mmu *, mmu, host_ctxt, 1);
> >
> > +     if (unlikely(is_protected_kvm_enabled()))
> > +             return;
> > +
> >       __kvm_flush_cpu_context(kern_hyp_va(mmu));
> >  }
> >
>
> Anf why not __kvm_flush_vm_context()? It doesn't take a S2 MMU
> pointer, but it is still logically wrong to let this being called.

I'll respin these, as you suggest, and consolidate them. I'll mention
in the cover letter which series/patches the new one supersedes.

Sorry for the noise,
/fuad

>
> And the whole sprinkling of guards like this is just horrible. We
> already have a filtering mechanism, just make use of it:
>
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index bffdeb36da1d2..51bf30b671fe4 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -62,6 +62,11 @@ enum __kvm_host_smccc_func {
>         __KVM_HOST_SMCCC_FUNC___kvm_enable_ssbs,
>         __KVM_HOST_SMCCC_FUNC___vgic_v3_init_lrs,
>         __KVM_HOST_SMCCC_FUNC___vgic_v3_get_gic_config,
> +       __KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
> +       __KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_ipa,
> +       __KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_ipa_nsh,
> +       __KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid,
> +       __KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_range,
>
>         MARKER(__KVM_HOST_SMCCC_FUNC_MIN_PKVM),
>
> @@ -70,11 +75,6 @@ enum __kvm_host_smccc_func {
>         /* Hypercalls that are always available and common to [nh]VHE/pKVM. */
>         __KVM_HOST_SMCCC_FUNC___kvm_adjust_pc,
>         __KVM_HOST_SMCCC_FUNC___kvm_vcpu_run,
> -       __KVM_HOST_SMCCC_FUNC___kvm_flush_vm_context,
> -       __KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_ipa,
> -       __KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_ipa_nsh,
> -       __KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid,
> -       __KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_range,
>         __KVM_HOST_SMCCC_FUNC___kvm_flush_cpu_context,
>         __KVM_HOST_SMCCC_FUNC___kvm_timer_set_cntvoff,
>         __KVM_HOST_SMCCC_FUNC___tracing_load,
>
>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
