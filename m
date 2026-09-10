Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DE5582BBC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789065906; cv=pass; b=bSA8Fu7/SC4m+40TivXGOcXtBqT2bupAIVxUbnYLKXo5xdqDCJlHhgXi/ukDy7hDvcF4MNIoKxSuCMfcqcR6BjYTl+0uXscKzHgM+d+hB+X80qSzf8TOXvKZ12H5g0Wf7VyIn4XxsypfhtCC+9itYPhFs9rWxRBgBtJePPweYLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789065906; c=relaxed/simple;
	bh=ZXmoK/6pYB0EUku110iJZ39Wy6sowbSU+f/mh13+y/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WcNyHG9kiVcryO7Xd7SGDwNAvEPNvsOhExhB8Eki7pANuN7jV90HnhRhNmQDl3wSYYzj0QLYePuLGIhQ4glaHBmbjScg1YwXqdwZpYhmr7APSvV4pH9J8bQlGicR/bI7xbd7EDOVbnplsobl3NOU1n9B5cICfZ0QvahO1BWMV2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fLnEKeph; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fLnEKeph"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so9462e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:45:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789065903; cv=none;
        d=google.com; s=arc-20260327;
        b=rmUFFWU9lOuAL7JNlO23opFOh95KiGh1FTj61NukyOtg12bbeZCTz3G0EDSGAeAvjw
         UOX4mVIUOSycV39KUQ/JAZjd9Vz//sKI7LmcWqlQ8urZZF9jFEZUY6JM9s3RUJFkfbPe
         wK9KKW3k35E1UBWosz460qa3MT95R7hZLHLZMoh/PtpWcz/EifgJ0yiBfxr9jxxDIBox
         nBf49Ym/5LVsILUk/dfUq9x6OPE72nZrzVilwq4hV9WVFt/zvF9KQW325R+7AKRNZNI2
         0mc0jo5LHNhvzVxn7/7VPpMAPbOM1T+hU7L8jYnjuWTsd7IkqBd0QQQwW4w4N/w0OWiu
         B6og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6mxXlzJuLSIxRk+E9jigAcfOHrY2xXO1oOwkSi2OYVs=;
        fh=wn5S6GJavFICUAV47FhnF1UtjDftsvaQJ1pFqyM8e/8=;
        b=KSP1qYXFb0RpTikZqJJ9Bx5DhiKu6NDRVC9kzN8VNO3PNhTYdBAq+MSOD9wzt8p0ZC
         2b9hqrfjoY3MW9jTDjHHpfV1Ic3waWV9kvgZ7vFQKzV4hr4dH0EsDIwBnCj45ViUCRWX
         1O/0/bKNKRKEa2/K310B+rRlY78+BHiDUEQYApiKCdX3+0cOMIa5UHEzqBGYnxSMQAH+
         MG0GfHJra5dgxoA7TEoThhJnJBFWfhR9mk856oL6Q7LRS0W5cEa7liu4yqQ1Wyr2du5t
         z3QRceA72+hD+T7NuzaUHWida9JXKn48UN00oCjTNi2iZQwVHfCYqrh4GiibUJVQQl10
         k3+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789065903; x=1789670703; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6mxXlzJuLSIxRk+E9jigAcfOHrY2xXO1oOwkSi2OYVs=;
        b=fLnEKephQ0nEjdy8vDpRj9pDepK80AbusoyGTByKGSnclQLFszrrzhS94FOPUkbH3X
         HJs/q5Rh85NVjFtKzWebOLQ4oUyVfbbzpmlNwPnc/mu8FodOYz0AcThfEtXwEpAECVO6
         BFtIuB0jhsBGdFwxitkRzt6/Lbvb0yAv7e500dpwowdj201YBIRuKD8tPng8PAnAWcqK
         kt8/ch5T8XmCGLC9PZdMMAHznHmQQy+oQxAcKAtM/jU/U2Z40yeoHb1M8U6FE/iignzY
         48ccy1RJ6y7Zhs+d5ZBLsRwUO58X1eQxy76JtYn8qFcDUEKsWsM1+fDFxpvCB3L5TWOv
         PGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789065903; x=1789670703;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6mxXlzJuLSIxRk+E9jigAcfOHrY2xXO1oOwkSi2OYVs=;
        b=cthgjmKktUZrOXBuTlG+e5aB7OdDAkIk9ENvbip2MdVSj23iKkwD0jDZBMknQAu6E6
         BToEw8T6HKiWuuQEKxzIPiFkieR7lBPGrzlc/zwY3JCFnTUZ1giEIuOE16yNNCHrzLIW
         Lpyr3z4MA+SFAHLYauDuqA+r+jhOEn3Vsgp4ZQbtbisPWmvqLtN6I30HmX1fhenO89SV
         dNwVB+uRpm1X2jf6sIrDJPOTfkePqymK/8cKYYoDzmL2oH5qBxoefdz5brM9yp4FKVYs
         FWk7UrlZBcLolhr3pjFBDc+ghe5hY4pPrkoz/SLDZwNONGqAjCbkqfLGuqCLM00aI+2m
         0rRg==
X-Forwarded-Encrypted: i=1; AKwUvBx8dBMMkO6WVz6cWoyhfQbO0HzQMMbx5Vi60mil2DzkY+k7rFepuSnTuTQ9kU0kqDXsDxP6ZfadC484lz0=@vger.kernel.org
X-Gm-Message-State: AFuF++lgkh8BTmy/pQYa8+mjJEilROIwjw7SOncw9iUeVrrNs9u8dZKh
	pB+hlVxjLDyqJWuEc8i/pm9G/VZp58+msYVRW/zmdHrJyIUBXUZmPces1O7jDsAsm47Za//tAqL
	erXOIOwP5/y664MpwSvAalEsT2QR8c2DC9bqCiUTo
X-Gm-Gg: AYBFou12qoU9lOLrDK6cNtUVu/BcCnaEvzBHkCFJpGlwmKuU1hhMDVzKjkcv4BYwef8
	wUJvw3dGu+7tJmPsMj/TEh/FB2PCqwRjFT1fLZLLRXQgfNIGz8fwGZjkNyCJG53+SL63sxW7jZY
	elgQcG+T62BJSjTG8eFj6lA4b4PfC9cTlt70QubjGuJdJlW1VsUchAcK1wPCijidptyJeK9knK1
	JoW9GDNY7gDJTuMIu4n9cG6v9SDF8qvmnsRU//LmGZ3jGP5kMNbYdR+QdwKOm8twKIrwMTv523b
	FvIcwj+xH4B9plUdUW649zCyYwus1Gfl1OltT1EPzqx/GcNh/5wuvSuwxFleaIJhhR+aM7ctb7G
	7DCOHUepiMIGVXg==
X-Received: by 2002:a05:6512:2346:b0:5ae:b0ee:f737 with SMTP id
 2adb3069b0e04-5b8a07b13f4mr18218e87.9.1789065902145; Thu, 10 Sep 2026
 11:45:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825-kvm-arm-prefault-v1-0-befe8947702e@kernel.org>
In-Reply-To: <20260825-kvm-arm-prefault-v1-0-befe8947702e@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 10 Sep 2026 19:44:25 +0100
X-Gm-Features: AcwNN1Xstr2nKNQ0qtLcezmwbWTpmOb8zSO-m5akVdu8AVpy9ds-Ainfdlx4-oc
Message-ID: <CA+EHjTw=7M+ac5UCfM5yPmuX8RuqZN08TLfXAmTLbQgmuhNWtw@mail.gmail.com>
Subject: Re: [PATCH 0/8] KVM: arm64: Add KVM_PRE_FAULT_MEMORY support
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Lorenzo,

On Tue, 25 Aug 2026 at 17:01, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> This series implements the KVM stage 2 page table pre-faulting feature for
> arm64.

I know there's likely going to be a V2, but FWIW, I tested this series
as follows (finally managed to get protected mode running on my Mac):

QEMU (arm64, -cpu max,pauth=off):
- Protected-mode host, boots non-protected and protected guests
- pre_fault_memory_test on a non-protected host, VHE and nVHE, all 13
guest modes
- nv_pre_fault_memory_test with kvm-arm.mode=nested

FVP (AEM, FEAT_NV2):
- nv_pre_fault_memory_test with kvm-arm.mode=nested

Apple M4 hardware, running as a KVM host at EL2 under Apple's nested
virtualization (nVHE only):
- pre_fault_memory_test, anonymous and anonymous_thp backing, over the five
  guest modes available there (the IPA is capped at 40 bits and the 64K
  granule isn't implemented)
- with kvm-arm.mode=protected, pre_fault_memory_test skips on
  KVM_CAP_PRE_FAULT_MEMORY, so the pKVM exclusion holds on a live pKVM host

Tested-by: Fuad Tabba < fuad.tabba@linux.dev>
(happy to retest again when you respin)

Cheers,
/fuad


>
> == Foundations ==
>
> The series begins by establishing required foundations:
>
> 1. Updating kvm_s2_fault_desc to independently store the exception syndrome
>    register (ESR) value, and updating all code paths to use this value
>    exclusively.
>
> This is needed so we can later generate a synthetic fault to perform the
> pre-faulting - we need to be sure the code doesn't grab an incorrect ESR
> from elsewhere.
>
> 2. Updating kvm_s2_fault_desc to independently store the kvm_s2_mmu and
>    updating all code paths to use this value exclusively.
>
> Similarly this is needed so we can generate a synthetic fault against the
> canonical stage 2 MMU (it would make no sense for it to touch nested shadow
> page tables) - we need to be sure that the code doesn't grab an incorrect
> MMU from elsewhere.
>
> 3. Updating the abort paths which consume kvm_s2_fault_desc to also return
>    a kvm_s2_fault_result data structure.
>
> To perform pre-faulting the code must know the granule size of what was
> just walked. So the abort paths have to tell us what that was.
>
> 4. Pass walk flags to kvm_pgtable_get_leaf() to permit walking page tables
>    under the MMU read lock.
>
> This is Jack's patch, verbatim, which allows the use of the
> KVM_PGTABLE_WALK_SHARED flag to walk page tables under the MMU read lock.
>
> Pre-faulting requires it to be able to work in parallel as specified by the
> API. The read lock precludes page tables being torn down behind our back.
>
> == Implementation ==
>
> Pre-faulting is implemented in kvm_arch_vcpu_pre_fault_memory() whose job
> is to pre-fault the stage 2 page tables which map a specific GPA (which,
> for arm64, is the guest's IPA).
>
> This function is called by kvm_vcpu_pre_fault_memory() for each GPA in the
> range, which itself is ultimately invoked by userland via the
> KVM_PRE_FAULT_MEMORY ioctl.
>
> The implementation is simple - try to walk to the stage 2 page table
> mapping the GPA - if unmapped, fault it in through a synthetic page fault.
>
> pKVM is not supported regardless of whether the VM is protected or
> not.
>
> This is because pKVM instantiates vCPUs upon run, but pre-faulting is
> typically performed before a vCPU is run. It would be confusing and
> inconsistent to error out on non-running vCPUs but to pre-fault running
> ones.
>
> Jack's original test suite is also included in the series.
>
> == Credits ==
>
> This series is based, with gratitude, on Jack Thomson's series and their
> respins (links provided below) as well as the feedback he received.
>
> The series includes Jack's v5 "KVM: arm64: Pass walk flags to
> kvm_pgtable_get_leaf()" patch verbatim, and all three of his test patches,
> two of which required minor fixups.
>
> Link: https://patch.msgid.link/20260612162354.73378-1-jackabt.amazon@gmail.com/
> Link: https://patch.msgid.link/20260113152643.18858-1-jackabt.amazon@gmail.com/
> Link: https://patch.msgid.link/20251119154910.97716-1-jackabt.amazon@gmail.com/
> Link: https://patch.msgid.link/20251013151502.6679-1-jackabt.amazon@gmail.com/
> Link: https://patch.msgid.link/20250911134648.58945-1-jackabt.amazon@gmail.com/
>
> == Reviewer Notes ==
>
> I synced with maintainers on this who asked me to take a look, as there hadn't
> been progress on the series for some time.
>
> Am happy to rebase again after -rc1.
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
> Jack Thomson (4):
>       KVM: arm64: Pass walk flags to kvm_pgtable_get_leaf()
>       KVM: selftests: Enable pre_fault_memory_test for arm64
>       KVM: selftests: Add option for different backing in pre-fault tests
>       KVM: selftests: Add nested pre-fault test for arm64
>
> Lorenzo Stoakes (ARM) (4):
>       KVM: arm64: Propagate and use esr in s2fd when handling guest aborts
>       KVM: arm64: Propagate and use mmu in s2fd when handling guest aborts
>       KVM: arm64: Propagate and use kvm_s2_fault_result on S2 fault
>       KVM: arm64: Implement KVM_PRE_FAULT_MEMORY
>
>  Documentation/virt/kvm/api.rst                     |  17 +-
>  arch/arm64/include/asm/esr.h                       | 129 +++++---
>  arch/arm64/include/asm/kvm_emulate.h               |  52 +---
>  arch/arm64/include/asm/kvm_pgtable.h               |   5 +-
>  arch/arm64/include/asm/kvm_pkvm.h                  |   2 +-
>  arch/arm64/kvm/Kconfig                             |   1 +
>  arch/arm64/kvm/arm.c                               |   1 +
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c              |  10 +-
>  arch/arm64/kvm/hyp/pgtable.c                       |   5 +-
>  arch/arm64/kvm/mmu.c                               | 324 +++++++++++++++++----
>  arch/arm64/kvm/nested.c                            |   2 +-
>  tools/testing/selftests/kvm/Makefile.kvm           |   2 +
>  .../selftests/kvm/arm64/nv_pre_fault_memory_test.c | 206 +++++++++++++
>  .../testing/selftests/kvm/pre_fault_memory_test.c  | 152 ++++++++--
>  14 files changed, 736 insertions(+), 172 deletions(-)
> ---
> base-commit: aa8e5dc6a7a2a1141ab40706a51010adcd0e57d2
> change-id: 20260815-kvm-arm-prefault-9bb411b6897d
>
> Best regards,
> --
> Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
