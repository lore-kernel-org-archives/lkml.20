Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794924488;
	b=1T844MiroGqg43GyaJpXQzT1pNM/UwAiOSP0j3R8OP58eYN87W8T3IonrMReAZMOZ9LU
	 Er8bvRIzk/TK/gB3IrTreGw4Lx9UHRMpTVySd3UptUA0DhKW4jNdEn6ASJ/s6YMceDUe4
	 z9WOPn0Qj9VMODJwPH28tPOaQXPCsxYldGdhX7vnSsrRC6xSobSAzMJ/sML2uOmYPic/d
	 W+REKiOpjyv8Wbx/iO3iPMsMrAe85YwaKJmnu5uWhM682cyhUzUhWSSmSmCfY5d/FWIJn
	 U0sLXht0X9fWqEBGQAuFTn2EhptxIOQv246AN2PTlUjM0PIo0NaeKxut9rqobtTtg5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=htWpbWvWjkzp2iYbY9MWMmeINInucOJuS3Dv1JVxhx8=;
	b=Nswdrl5ZmEc9uonrbweIigySDj5VWMtWDhaBxI6B09HJWME4vmI6ACkzZYDUN5GgrSZH
	 hcu7/07tDJQ6zG6Ok5SPf/HryaRfEquUz/KpKQTM4x7Tru3JuqjlHNJNeJcHjGmWIBc3Q
	 xuVNRJz2XfX5IylWIQ0uTmp5VGi6ycIQFegMe5EbJ5vpdgLIx1yoi+Mmdv7yiOXd20rmV
	 KjS5j29wNM8bvw55tBP3oCy4dMIobpJfhHEEhqi/88SxWPurvcAUYNzp1dViu/T8h0Oen
	 3NWv2tvFUG3oEDSi/U/Isk0qjC16scT9MtYn2sBi57muEKNCMpudlzqTVOJ4aYHMadA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O2MXcFTx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548ED606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 548ED606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O2MXcFTx
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so6110e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:08:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794924485; cv=none;
        d=google.com; s=arc-20260327;
        b=nKgWyfxRbxrttFo55/hCTKOduu1XpGyc3I+Gpps2vob0ZMYRZwCiglNHxhaA7y0mrl
         JZz6xMwFWdd6vx1nuHN6gJLP2D8ZdEm/YeurSAZe7CLqr9Ke3taVQKC/aVXsN5ypgpkA
         4sIFZ5CaCP0rLi62P+5TKG8+HP5jYnYjrVJKX4A0MXkQSsP+JpPu+dckr7maZ1vEMUFB
         CU+/WoHPbelOWuDWmr28eiMclpnJWZihT1NnnOl7rccs9ZBf71C3ZLWTpmZ40GqHTZND
         +9kWWvptOh3J7xnQldUJADfmsELJWnDohUP7sRl45AKpnS0skXboCVVQwY2B2yPjGZ/c
         sXKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=htWpbWvWjkzp2iYbY9MWMmeINInucOJuS3Dv1JVxhx8=;
        fh=ym7mFboQvKCLP2jsI9mRiIHpXLxnOh/i3wXdpBVmSjg=;
        b=QAf5xTxnb9FdRRTiRyWcdSmCbj6CynhEQan9yq5J2ICm+m50RW1hSM4N8+38tpzPQu
         GlO5bJl3f2VoygoJQ0nhbWOyGkPxjKg3DdPUlcBzv+GKBB3QfPWJy9aK7RNjsQN0nzjh
         UeGB5OwGpUQXe80hPYXsFOz2HKmm0nwTpTRArYUzfUOELQKQonwSS8mlwfKDrVxF3QUs
         BoRjQP0RlTC3OLGYSTkSEOms5K6cemr+NmujJ2XtNhc9GOW0FB3Afb8YRL6smre13EYU
         ks69OInSWPvmCVWoEAnSxaNvxzpKBpD/hoVyT9pY88RMc+PdL5L5eXMM9EwDKTdTTcjt
         +7eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794924485; x=1795529285; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=htWpbWvWjkzp2iYbY9MWMmeINInucOJuS3Dv1JVxhx8=;
        b=O2MXcFTxaYhVSzP8sKYxuSFIgq9l9y02jAa+4/Cn3o/EO7Nkr21qsMFrwOS+TsHJUn
         ZFakCfwFtdgWK5T8jNky2Vyd+yBjvUmzAkSPajBpNjvOaE6z1D9PeqMS7Pq2mZxtIdt8
         q73nfzlg1UHJVZhLbLlNDNhx4v5wVkw/xIKRPh8nNGUDVyDuTZ5ea1TBUY9DUKR3DNDw
         G0QsPfCBtwy13Pu+tFqZ9payoZzErGHL074vg6ZcxKtFaZAB6y21U6E8QmoWg8Wb+qGA
         e1EO5UiWSVyJsKLrlkrAP6viDbnV6t/fN3+vh6rKfGOQefhZHMVAsXWFlG+XDwRv8DFd
         j92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924485; x=1795529285;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=htWpbWvWjkzp2iYbY9MWMmeINInucOJuS3Dv1JVxhx8=;
        b=OOg1EWswNPO1lxFrKxUIR1fXC5zRsI53ADjolTjID3wV3GRcsF9UM5O1isOrOF+XFb
         mT5T4OsvxWqhY60mZRtJKQX9MGaWCsT5MKiTwzacbMHXfXywxj0Em7P1j6Wq6dgRB+ri
         HekXsRCk/5+NYM6nfGjsP9QBddACJ0/hAHdODMayQKWTLG1zsLECrYhCSsnvoPgDuPKH
         iVyCfaGm3x1/6RIR4WF21W72u/LlOLSHCJD6Wc9Ai9TgFA+wT0BNYeRVlpSBhFD7yCl9
         nLJjB+nwpUjv5+bD8QcsvaE6JxIWnWKTb6g7VKFH92jvYfPVJHS74jVcZTlh8vI18dlE
         uR6w==
X-Forwarded-Encrypted: i=1; AL+hErEEMfK9eWUIDnqZkhgk700wjBjFTbHWqYaGwdM8fyKmQ+2RiD/dLbWxDiF/t5rRNDqp6wxlvhXa53c8yew=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7VSpjLciw5mshPBuSfwrdOF9zCMnqVGRIaAV/K0oiOAoP8Rg4
	/nZFa+uwkhFVusGbY60P4KP9mvDTqUnF4YHou3W/eoMbR8WoL/q3CIwI0EEOfMa08qenZPDXAHb
	Fj+ZVPXbp6e4W9uzJEpQ+Mp81S4gzKDjzIacBBAx7
X-Gm-Gg: AYBFou1UrSxoHQGLKAN+m2fqD2rVups7ZX8VDUD4QVy/J5jeYCvGOGS0w9pvVl6smCv
	1fcLFGW5X/UYdVBRtGsWtqJd1U2c5WFl3lhVkzx6DyAChVccM1Fs5VvtQlESqNovk1z5y51Ro+F
	PsMjjDZgHQlDD/5Ai291nePNiFEzf/vcu9RvnLzwrjunSGsaqUak2LK4nntXQbycR9iHtxf4+g4
	jQp8vCOcAKy9E5/wjBKAQ+TJZTc6W6cWN6a9eh3QLBAebgl71xpPDuS+Z/SQaI2d4sVMcov1mIP
	/w/whCWcvDXGxwBW2qKWWpBdbMykovyFN+iC/1KIGp+/BnnFEbNu4fPZhkVkjn+QBzu6vAGmjlu
	SD4Pb1MkUddVKjYhNY75S9T1dU1loCeKhPSJhP8EGhPUTLVDqYUuE1EBVxHRxcTqUYS7meuuTMv
	GeTNlWkb8n1dGKfVciJ2T7KEA=
X-Received: by 2002:ac2:4e07:0:b0:5bf:f84f:1d74 with SMTP id
 2adb3069b0e04-5c1a2185fadmr137629e87.13.1794924484857; Tue, 17 Nov 2026
 06:08:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116164358.142785-1-steven.price@arm.com> <20261116164358.142785-3-steven.price@arm.com>
In-Reply-To: <20261116164358.142785-3-steven.price@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Nov 2026 14:07:28 +0000
X-Gm-Features: AclHuK_JC9RetKL5Q3HHKVX6R6ajyHm2xDLO6StGpKQMwUtLiIUPvzFbgoEna3U
Message-ID: <CA+EHjTwfp8p7uwP2LXEqSmTwL6ZHuDCYbvMie_Wr_30xJwfO6A@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] KVM: arm64: CCA: Introduce Realms
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Kohei Enju <enju.kohei@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 16:43:48 +0000, Steven Price <steven.price@arm.com> wrote:
[...]
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
[...]
> @@ -1571,31 +1576,39 @@ struct kvm *kvm_arch_alloc_vm(void);
>
>  #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
>
> -#ifdef __KVM_NVHE_HYPERVISOR__
> +#define kvm_vm_is_protected(kvm)        ((kvm)->arch.vm_flavor >= __VM_PROTECTED)
>
> -#define kvm_vm_is_protected(kvm)                        \
> -        (is_protected_kvm_enabled() && ((kvm)->arch.vm_flavor == VM_PROTECTED_PKVM))
> +#ifdef __KVM_NVHE_HYPERVISOR__
>  /*
>   * Accessing vcpu->kvm from nVHE hyp stub is tricky, as we need to convert the
>   * pointer to the hyp VA. With pKVM, the nVHE code runs with the hyp_vcpu,
> - * which is populated correctly and is gated on is_protected_kvm_enabled().
> + * which is populated correctly. Always vcpu_is_protected_pkvm(), which is
> + * gated on is_protected_kvm_enabled().
>   */
> -#define vcpu_is_protected(vcpu)                                                \
> +#define vcpu_is_protected(vcpu)                BUILD_BUG_ON(1)
> +#else
> +#define vcpu_is_protected(vcpu)                kvm_vm_is_protected((vcpu)->kvm)
> +#endif
> +
> +#define kvm_vm_is_protected_pkvm(kvm)                                        \
> +        (is_protected_kvm_enabled() && ((kvm)->arch.vm_flavor == VM_PROTECTED_PKVM))
> +
> +/*
> + * Rely on is_protected_kvm_enabled() check in kvm_vm_is_protected_pkvm() to
> + * make sure the vcpu->kvm is always valid VA in the context
> + */
> +#define vcpu_is_protected_pkvm(vcpu)                                        \
>          ({                                                                \
>                  struct kvm *__kvm = READ_ONCE((vcpu)->kvm);                \
>                                                                          \
> -                (__kvm && kvm_vm_is_protected(__kvm));                        \
> +                (__kvm && kvm_vm_is_protected_pkvm(__kvm));                \
>          })
>
> -#else
> -
> -#define kvm_vm_is_protected(kvm)        ((kvm)->arch.vm_flavor >= __VM_PROTECTED)
> -#define vcpu_is_protected(vcpu)                kvm_vm_is_protected((vcpu)->kvm)

This brings back the _pkvm variants that Marc asked to drop in the
plumbing series [1]. In the nVHE hyp code, kvm_vm_is_protected() and
vcpu_is_protected() already mean pKVM-protected, so I think the hyp
side can stay as it is.

At EL1, the pKVM-only checks that a Realm vCPU also reaches are in
kvm_arm_vcpu_power_off() and kvm_psci_vcpu_on(). Could they check
vm_flavor == VM_PROTECTED_PKVM directly?

> +#define kvm_vm_is_realm(kvm)                ((kvm)->arch.vm_flavor == VM_REALM)
> +#define vcpu_is_rec(vcpu)                kvm_vm_is_realm((vcpu)->kvm)

vcpu_is_rec() isn't used anywhere in this series. Could it be dropped?

[...]
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
[...]
> @@ -906,7 +907,8 @@ static bool kvm_arm_vcpu_suspended(struct kvm_vcpu *vcpu)
>  /* Only the guest's CPU_ON may start a vCPU EL2 holds powered off. */
>  bool kvm_pkvm_vcpu_is_powered_off(struct kvm_vcpu *vcpu)
>  {
> -        return READ_ONCE(vcpu->arch.mp_state.mp_state) == KVM_MP_STATE_UNINITIALIZED;
> +        return vcpu_is_protected_pkvm(vcpu) &&
> +                READ_ONCE(vcpu->arch.mp_state.mp_state) == KVM_MP_STATE_UNINITIALIZED;

Only a pVM's vCPU can be in KVM_MP_STATE_UNINITIALIZED, so is this needed?

Cheers,
/fuad

[1] https://lore.kernel.org/all/86pkxs2npx.wl-maz@kernel.org/
