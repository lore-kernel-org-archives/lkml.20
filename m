Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B327151FCC4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651046; cv=pass; b=CC+cIWlnetNVFfkRG4YkXx0FAetAOEVKvqhnkax7FNljmefCRZeWMhj1Sh+tceJ1c1d4xlNC3WMxt9xx48EtLVCMRG1uqLK9XOsQKLRTb/dj3ilH/ji8EGDa5s4ZZq8JjA9LSobo2uZqHwchrhrsfz5QcX11Hur/F7ZhdSAyQ54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651046; c=relaxed/simple;
	bh=kO4HLKikSv+g/tlkono8w2r9mfJw0DOnYzMEnSqFOZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PXi0ZN/RP/LNRKCvm8gwa3+35U7cGSa3rhZ8XeF0ml7WLK/eMiy+YIhurFzTOg0viG4ZvOxHk5pU0qc5isINw62YDDSfpL14NeRjbqMT6px1CDnjuDe9w5/lsMPgVg89AvITmvlXrSJ2EK31hd9TcFKGOPztSGFtvMarrqazLdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ckfnxtz2; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ckfnxtz2"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b83c1421ecso1848e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:17:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789651042; cv=none;
        d=google.com; s=arc-20260327;
        b=gJzhVNE9LqYOAImRk+9yUYm8mV2o2aDTlklWN8Syn0RO9aStJUIQiipH4QhcYXrbK1
         iRnrQM3HVnuv1zkcM3yac36Cw5lMUmvBePHpamzW0/DegNxhARdvfX6Kiwdmt0v3G+Zm
         BnkqSYOpACdvGJWbembSG3z1jksObxD129B8qV9xQXpZmiMDfcLtf6pv2ra5U6iVNuQO
         fwRZCEJuIvCY4tGab7m0eZUNjmWWOfzMmed+akORy4nMHgvpJa7wYwTxlQE6t+kiv+Ol
         /K9zHu3XGX5PuLIkz/TgIw6yl9U6kUHiKzR0ge2jDz57i6EilyGa+re/goLDfy/10063
         qrjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yvMJselGvAoMrhysUaGitx662yndDSgH+0mQM9lz22E=;
        fh=6B9i0RHT9D6F/QzJYdPopbWCddz+UWyzCf02QKgDf3k=;
        b=SghsApwIfhhroo1j1hOnCyqcxK24qqUmmV+hLMrS1iEF6prOAlpOC0uHflCtu1f+Ie
         Lj/8VmdtATyOE2MLMS+4xp0mxMNZmGbfq8lqB6kR/zO6G2Fw68hfigip6I9sRdrBry0m
         s4yyjA6G97Eyfi4lXaMmntwNT7+HQ/eNtynyJQnNK57AEbkZooCrZx2Yj9s070+n/3Ot
         LlDvOoFu2u7NZYy20EW/H7uv7OaYJt59z84MB3WV1VHUjLmdr4z8+HeUGQJCD8dlJ0s2
         Mv2b1eJsN5WxFRmgd4Am0I+tB9XFq0HAyHJB/iEh6q1Yl5O6bwZi5e1ZZnnWuR4xe3/c
         pMxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789651042; x=1790255842; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yvMJselGvAoMrhysUaGitx662yndDSgH+0mQM9lz22E=;
        b=ckfnxtz2wGezph2qLayTqSjlDtfsqRO8GHSC0w7wIxNZHmVm7ha5M95vnusVcyL+sJ
         b9nIfsSPmBHDlQ7Mwxix/hDUSkysGfD85T2p0qqldo4lEwGKsAj+tRFg1Zzavzb9FUaZ
         IzV4+JnTWkvMZDAv7uBbEWBdXY5EIoazjG/qRZ3emYT96M4s7eYJhqI2kviyt9bLK83W
         qXEQfD1Q34401WnQK2DMEq+1iOZAjJgytem3QWH4DogmglY1I3Ood9SEgU+tygQDdAGA
         fV1AgX0FJOmRz0qecHVwebdw8k7ZUYZWSRG44DeWwCo3TY8xKsy/xPSKS4PwOejVEwpa
         fs7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651042; x=1790255842;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yvMJselGvAoMrhysUaGitx662yndDSgH+0mQM9lz22E=;
        b=DtdgMaTEqZu69w0jEf7AeIKg4H5obu0wc61Ot/JNkZeMNBfHpR6hcj+q0pFej9Q+9X
         kXN/22EOqBX/mR2Yu2bnaX5kM1hVF8e/MpI4Aixe9VpWjVXNsxFsqxJC6eVKMTREhyLX
         2/A5hUzPgMiaLWXkXB+8BuZmB+Q3h1S6r9mBpw8ORORXpHn+3lFGcV8M9/Nlgf/g5wIO
         /N8nw474UNz1DPjZASrn8Nu+k+3kqqB0kDNIit0J35cex2i4y+vThKIde0ogambCa5uw
         wPLBPeeDMH1Vi5MesX2XWEpHaqwYNIk8mp6F5sPwW7eIYBYltP/+OTyTxzfWyaVbnJSb
         YlnA==
X-Forwarded-Encrypted: i=1; AKwUvBzo5LtH3LYGrqw/4JyuIuZOM+2YDLwAaWsJzmnC2mUvFXjBgOY8vPQb+QvOHyWLiJpzTBIk2Blzm4LCtlU=@vger.kernel.org
X-Gm-Message-State: AFuF++m/PRdwOtJ8iTJbmIQAQezgN4yhcM8zIiBzmyjWkDmS05iOPjkD
	DpmmU7aHeKkvNaFE2jnqbsUVZ1hTGIgcOsAwSMO2bk8+VhyYNF476FysQF8joGLweX5+QStV0qW
	sz8XP0zDlNjzIGvjy6nFE/WMCDKeUojU228fdjC2I
X-Gm-Gg: AYBFou3nEDbus1hZ9xqtscmDL58uIxr0XraK7GYtjAn7vjUvKkmvixVLivpXw3Gf8mH
	WjUEDpdRsUFBk3BoVNw60e4QIcCRXvVYDtjB5Hz5Whse6Ex16G+HXtoS8Fwzp+9+L8ST6ZEPCzy
	e5Brh0mohxiSpTdVTVUYBqH8ELveAedKRINEqfUSoGQZBvCcUTbzyX0VGRN56DYoiqVyGo+7hM/
	g1JrEb+87BvpIRs29AlflK+T64ycdkDREImpWTbWwsBTHRjkbtWU9YgZcr+6QZQ/b6ym53VaPrh
	C1RXqK2qCuhez1Z3HdckeLS6SoVKyqGEBYiINhsilqMEjX5n2f6k3ABrR+tUlXmF4tCCHrlzy9x
	vnVVcZQhmvFRlhQ==
X-Received: by 2002:ac2:4c50:0:b0:5b2:8963:e5d4 with SMTP id
 2adb3069b0e04-5b8bff1d051mr39681e87.5.1789651041084; Thu, 17 Sep 2026
 06:17:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915160141.3543048-1-suzuki.poulose@arm.com> <20260915160141.3543048-21-suzuki.poulose@arm.com>
In-Reply-To: <20260915160141.3543048-21-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 17 Sep 2026 14:16:44 +0100
X-Gm-Features: AcwNN1VtWWKyrr6h6sFHMUccgZH0Chs5OMidTNSOoiZ_fDx_6ZmQhtU1SR2DO2Y
Message-ID: <CA+EHjTwYqTFzGdNPproWW5L6j5pNqmuWeFuu9HbHa8LBLPvY2A@mail.gmail.com>
Subject: Re: [PATCH v18 20/23] KVM: arm64: CCA: Don't expose unsupported
 capabilities for realm guests
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Content-Type: text/plain; charset="UTF-8"

Hi Suzuki,

On Tue, 15 Sep 2026 17:01:38 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
[...]
> +static inline bool kvm_realm_ext_allowed(long ext)
> +{
> +        switch (ext) {
> +        case KVM_CAP_ARM_PSCI:
> +        case KVM_CAP_ARM_PSCI_0_2:
> +        case KVM_CAP_NR_VCPUS:
> +        case KVM_CAP_MAX_VCPUS:
> +        case KVM_CAP_MAX_VCPU_ID:
> +        case KVM_CAP_MSI_DEVID:
> +        case KVM_CAP_ARM_VM_IPA_SIZE:
> +        case KVM_CAP_ARM_SVE:
> +        case KVM_CAP_ONE_REG:
> +        case KVM_CAP_ARM_PTRAUTH_ADDRESS:
> +        case KVM_CAP_ARM_PTRAUTH_GENERIC:
> +        case KVM_CAP_SYNC_MMU:
> +                return true;
> +        }
> +        return false;
> +}

I'd keep KVM_CAP_IRQCHIP in this list. api.rst has it advertising
KVM_IRQ_LINE as well as KVM_CREATE_IRQCHIP, so the cap means in-kernel
irqchip rather than GICv2, and the GICv2 case is already rejected by
patch 18 in kvm_vgic_create(). It also keeps the two protected lists
the same where the support is the same. And could this live in
kvm_rmi.h, next to where kvm_pkvm_ext_allowed() lives in kvm_pkvm.h,
rather than in arm.c?

[...]
> +static inline bool kvm_arch_vm_ioctl_allowed(struct kvm *kvm, unsigned int ioctl)
> +{
> +        long ext;
> +        int r;
> +
> +        r = kvm_get_cap_for_kvm_ioctl(ioctl, &ext);
> +        if (WARN_ON_ONCE(r < 0))
> +                return false;

You told Sashiko my fix covers this one [1], but that fix changes
kvm_pkvm_ioctl_allowed(), which this patch deletes, so the `if (r <
0)` has to go into this copy too. The guard you posted for the second
finding still leaves the WARN reachable on pKVM and Realm hosts, which
is the case the fix removed.

nit: kvm_arch_ is the prefix generic KVM uses for the hooks it calls
into the arch. For two static helpers in arm.c, kvm_vm_ext_allowed()
and kvm_vm_ioctl_allowed() would avoid the collision, and the same for
kvm_arch_vm_ext_allowed() above.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260914093838.1082637-1-fuad.tabba@linux.dev/
