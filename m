Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1F5582BBF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066663; cv=pass; b=TBIGLnYAit0h4BY1zKJcmFGbEdUNyl6iPzNHvPbNityb5W5kFsESsHMx727QEdiQp3ipTmTuEIU5iq6AM03hURmt/EN03kzdE4QGyJ8xC3vtFFamEImTAyNYssPtHlj4Ahnudp9dCf4fGKYGK+4PBikbcVe3bzJADjajBV3vXkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066663; c=relaxed/simple;
	bh=LvLi2WG97zBBaTutxiZFhYxTjRdgTSJJxA2epdOyf9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VoQMnQUQ61hpC6rN7ra1pswym+3w9URiNX/AZWlAGbH6uiOHBjyA/kdVvclRxw8HR8oBkpr0wN8nizq9z6k60RhELYnaXzOVmUUrYpGaGkdBFknk6DVkEJEak5y4a3LXIO+Ffuct4SaXZs6rsIiMbjEaYBNMPG5Fh3XTthsGpgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oJOtVM85; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oJOtVM85"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b78e073980so10178e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:57:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789066660; cv=none;
        d=google.com; s=arc-20260327;
        b=Vq179HujvJA8MmQtlkN5YlpRST9PT/imqYlSImfxl/dh3BMGLjj6EWYoWm+HpiFzKQ
         vncP9vrmFhCmtURd9VQU0i5DFsW+APwpAFug9nrztx1Hm/VOKQuYnLA5FDlTDUYJnIj4
         HiTQIrekeuc2H3mSXxFLv5+qSBFElRgWRm+HfM09qwoZHRBvpBr4ykmsRkI3T7NSXwcz
         79pk1ipHTUWVsdjSOxA6HICv7cTBCUJKLjXtCV44T/rTGyy16NqiQn0JwsGbcJ2UxpAd
         cADMoj0fq2/FGL7jST5DOd9O1beXvAuegaxeVizUXyPLBSC6aefHgkA8MIxtxS0RiXP2
         YIIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZrdVF7ALBocEe70y9+Oret+TDRXY2tEOhMpJsYsf+II=;
        fh=8vNU7s8HLxlP3SyWYbmHPLx40MehlYBK6UJ2RO5w0nw=;
        b=H6JWl3LBE47H1PyPFhXE9vMliCejEI/7CBL8yTKqULPar0YmYLTeTxGKEdhe4nlth5
         dHfMr7uqDWh47ZIBNO+XfDnQgvqYWiqP7mblyXO8/cMv+g2q/cP4XeKQwDOiFE0KwJhS
         OjW4+VvlfPqVtpvI0JOkdztBuLON2uWLQgZXRniuWszxlfX/1bM8yZIqnwLpZ9Y6VO3x
         gMk/hve9P9KJRyQgMzDuGtb0XnruaXVct+m0CxubBkSjv5WTaLvGd06y1ZDbD6d2hwRX
         PtLP6PIoduegieGBilzU2BKOtPULfr61JwonsVpGO6AsHiS6BZazlrSSzdqa/atjGtIj
         TSjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789066660; x=1789671460; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZrdVF7ALBocEe70y9+Oret+TDRXY2tEOhMpJsYsf+II=;
        b=oJOtVM85a9xcyN7YMuseSSWyp8vAN2Qfn8tI8OVrWxUeIsBShlbI0OEAysQ6gLuG6p
         IyfC+Azdn+tz1fniwC4FOS+kyKTdW7UlptpNUrd3+w0KiBiNevQSPciVjvpiExxAsQIa
         NSl5/L4pB2ug9R3/9LdXDkcE27tmYnbD89oOi2w6ZXnee5diXL15ovuRmc7o+MbuW5nA
         AauSZEoUy+qpV51brEhIaXQd60IPDVLI6vVI4p6IGVMBvZYRtnaOF2vve6vofXJ2srJ/
         9x759VHui0Fg02/EFz97Tn+v0DYbCg4VPdsQOP+BdTq0+l6E1HV7FgkkSwETo2zHn1Ap
         fyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066660; x=1789671460;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZrdVF7ALBocEe70y9+Oret+TDRXY2tEOhMpJsYsf+II=;
        b=P3pfN4719LyUf7vQ18jDElXS0WVvf8uXeJldawpHyNQXRasunkYc5Pny4AGzGJSi4u
         YXATxzNfExhzOTCb3pknqF3VbIVxh9Yg8wKFznyU7zI683H6/7VJqfeP94GDhWqGUusK
         rBf25fFvctQ5eTRvGHeFwdzWiS8IIILlQxC+EyL9xJRiQvsibxBotG6alqdMHZ0VJjDs
         imwpC2n0MAsqKRcpcAvZrRZDtpX70MTX1Mv82sHCQ3JubJnwcDmDFFHeqFj+YvnvojoW
         y4DxVRX5Ad2JpHisZHg/nqPtMrZ2njpgBQ/qHSep9qQesTY/g6U8p0b7qrfvCMQEG0L6
         1A+g==
X-Forwarded-Encrypted: i=1; AKwUvBwk4oH0I0TDEpQ4mDKgkzypq8Dqa5soGTCw28Ra4O2Xi+ImVVnc//uSXppgdXuHXCXs2pc9M9m8RPdAz5M=@vger.kernel.org
X-Gm-Message-State: AFuF++m2ym0eWkj6OoN+I6XKB15Z8V7DK3ZfOa8d+EYNrxJC9RYVkl2S
	Ooy7H+jBfx3Rjw44xCDjR1fizeqjJxaj3yrT05K0xk4ufmyACSMaCNge7ywqHzUOHo9VoVtewox
	1T3lKelILFSLwaNM3IgjemUrXbxTrFPtizrYyo2QF
X-Gm-Gg: AYBFou2QJ3W+dUMAgtOYaHI+zduFkp7d+S0hmBlXWGQUUzNb++1IPm8FCTYMMo27KP9
	E5T4GRFxAeW3OnN1v15Pyl+YTwwhTaesF6fdTJ3awSJ00nRozvlby4tp4r9DexlbOB3D/zBdx0X
	efTB0b5y0e+UqFlZPlGVfbMH58nwppa/CfsLHDRF14aHfL0bNECjMgtNSAs96p/WWiKQlYtPF0m
	NsvspwZdwVythSEXI0pJksu4LsvNDerMoAaW/fffcBnvw17Qk4RICvytvBI67ArK36GUAI1H84T
	V6f0Tv/KGdZZEHc452l6HyGkXhE5lctMVZgtK3EHVTrObZTMOSRArFv4iaNGp1FjCB7Wggg5Xyy
	zFXLB4mTV7Kfz2nd/8CDc1QHU
X-Received: by 2002:a05:6512:108c:b0:5b2:a967:c0c9 with SMTP id
 2adb3069b0e04-5b8a07ad04amr18706e87.7.1789066659207; Thu, 10 Sep 2026
 11:57:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825-kvm-arm-prefault-v1-0-befe8947702e@kernel.org> <20260825-kvm-arm-prefault-v1-8-befe8947702e@kernel.org>
In-Reply-To: <20260825-kvm-arm-prefault-v1-8-befe8947702e@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 10 Sep 2026 19:57:03 +0100
X-Gm-Features: AcwNN1WRbRt_RViN6lNXEa633ZkRLMSCIUfMJ0FeZLRCcdVLjr-AEUXzwXInRdA
Message-ID: <CA+EHjTy8m=b8D6sLOTv3AW05vXqFPRrTYvG7-t3D64Vt1+jAWQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] KVM: selftests: Add nested pre-fault test for arm64
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

Hi,

On Tue, 25 Aug 2026 at 17:02, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
..
> +int main(void)
> +{
> +       struct nested_s2_state s2;
> +       struct kvm_vcpu_init init;
> +       struct kvm_vcpu *vcpu;
> +       struct kvm_vm *vm;
> +       struct ucall uc;
> +       u64 npages;
> +
> +       TEST_REQUIRE(kvm_check_cap(KVM_CAP_ARM_EL2));

Would test_supports_el2() work better here? It honours the NV=0
opt-out, and since HAS_EL2 is set unconditionally below, NV=0 doesn't
disable this test as things stand.

Cheers,
/fuad

> +       TEST_REQUIRE(kvm_check_cap(KVM_CAP_PRE_FAULT_MEMORY));
> +
> +       vm = vm_create(1);
> +
> +       kvm_get_default_vcpu_target(vm, &init);
> +       init.features[0] |= BIT(KVM_ARM_VCPU_HAS_EL2);
> +       vcpu = aarch64_vcpu_add(vm, 0, &init, guest_code);
> +       kvm_arch_vm_finalize_vcpus(vm);
> +
> +       npages = TEST_MEM_SIZE / vm->page_size;
> +       vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, TEST_MEM_GPA,
> +                                   TEST_MEM_SLOT, npages, 0);
> +       virt_map(vm, TEST_MEM_GPA, TEST_MEM_GPA, npages);
> +
> +       vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
> +                                   NESTED_S2_ROOT_GPA, NESTED_S2_ROOT_SLOT,
> +                                   vm_adjust_num_guest_pages(vm->mode, 1), 0);
> +
> +       /* Run the guest until it has ERET'd from vEL2 to vEL1. */
> +       vcpu_run(vcpu);
> +       switch (get_ucall(vcpu, &uc)) {
> +       case UCALL_SYNC:
> +               TEST_ASSERT_EQ(uc.args[1], 1);
> +               break;
> +       case UCALL_ABORT:
> +               REPORT_GUEST_ASSERT(uc);
> +               break;
> +       default:
> +               TEST_FAIL("Unhandled ucall: %ld", uc.cmd);
> +       }
> +
> +       /*
> +        * The vCPU's last-run context is vEL1, backed by a shadow stage-2
> +        * MMU. Enable nested stage-2 with an empty root so that the ioctl
> +        * fails if it tries to interpret the userspace GPA as an L2 IPA.
> +        *
> +        * Prefault in two halves so that the second ioctl exercises a
> +        * repeated shadow-MMU attach and canonical stage-2 swap.
> +        *
> +        * (Note that an implementation that wrongly populates shadow
> +        * stage-2 page tables would not be caught as userland can't
> +        * inspect these.)
> +        */
> +       s2 = enable_empty_nested_s2(vcpu);
> +       pre_fault(vcpu, TEST_MEM_GPA, TEST_MEM_SIZE / 2);
> +       pre_fault(vcpu, TEST_MEM_GPA + TEST_MEM_SIZE / 2, TEST_MEM_SIZE / 2);
> +       restore_nested_s2(vcpu, &s2);
> +
> +       /* Resume at vEL1 and touch the prefaulted range. */
> +       vcpu_run(vcpu);
> +       switch (get_ucall(vcpu, &uc)) {
> +       case UCALL_DONE:
> +               break;
> +       case UCALL_ABORT:
> +               REPORT_GUEST_ASSERT(uc);
> +               break;
> +       default:
> +               TEST_FAIL("Unhandled ucall: %ld", uc.cmd);
> +       }
> +
> +       kvm_vm_free(vm);
> +       return 0;
> +}
>
> --
> 2.55.0
>
