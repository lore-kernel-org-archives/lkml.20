Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59FC598BEB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789655567; cv=pass; b=Wwlh/fdLCH+3C/ATWnKHJDDL6T/qB3ISN3BV0XS1ms82bEBmdE2j5f/Fx3cXPI0D0YK0uU9JvFB97++D5CiUbp0/7r1nZITk2ZqmcEuImBkhMM2x/USx+lMurDqLKfUnmry5wGVq/ZrHz5mPIaUpdeYdni/xovvQttEnumD5x2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789655567; c=relaxed/simple;
	bh=e52PCCrpI/rn5l+5D4OuGimA62WJjNDBide2zC7K/fI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jetkYgvq2mYDp3J/f3s5eNv7u8B3P+PoSsYo82C0BMp1Go3RX56fOKZn1AUug89TNCZ74okHpTv/oQaMaltFb0LQJjyg5YS/rBXCfRFzvbr41TNyk2mBiredrwxRg1FkMsq5dg+E/YpTZDRyka5llkaPegThcHl2pCXwhynoAAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cbT9ydgv; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cbT9ydgv"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b83c1421ecso2849e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789655561; cv=none;
        d=google.com; s=arc-20260327;
        b=g2M72z+XQj0AqWicG1IjfFne0vV4XQjg6sJzdhAXruOfX9Zd0DUmbbGR9HRArx+cRV
         Ma/QE0cTgLa7oHnDLy+gmOLiNV76ZCtaY9S7zwUjbw198iWpVgvxhrf8Vom6aYvCY8Lo
         Eo+kus6JWRYrP5v83U0CE5OukpGWRkfPjnQuB0CBRNb7gNjTmO4Zj4DhyYwpemcYoEa0
         rZ/adxmpxWCu2B6DYrO3iXcO3TZ5hysc4Dz9EItwZsfYFOEQ5F0UHjOc1Q/u+4b8ACaF
         oKMuMTZ6GljN6JGbujzaupgpCC7OZefLqu0nfXKdPLx175cm2ij4OmmyR2voTJTZFAJh
         R95A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PRPfZxZL7iiKajZEZpQuenLhAMrtnttjwuYtcsC7ahY=;
        fh=aofb4iio+3L741uNbjJ+TA+4llnpa8frM+Q/gzur0vk=;
        b=E1tXV72ZortLI0iaxsfsgS/Dz9tpxSrH+BP+QdQ3ZdLochcfmIYBauaAgEKGzA3jcQ
         u4NDODfcReyiHdQ+2RTcp7cZKi5EXT2DJEIcZ2PYUzh2vSTnW0vUNpHKBFgaUhLpZnZx
         lrjhQdDNhDxf/b+z8ldZR2ercGgeQ+pEl5cU2364ffPO44Jxhv2GyiC0oUFbAArzo+Cv
         XfDBX06/2aiJ+6UlJfKG//HsW+9m8fvX06BhIVFlmYzB+IiSXCNy/BUXunzHEJSo0HTs
         tnQLXujm736CaUBw88nJkKtPwW4SE8+w/LQvGgO72605GuTYhVpMcgfO+typIBBXDW8w
         3Gqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789655561; x=1790260361; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PRPfZxZL7iiKajZEZpQuenLhAMrtnttjwuYtcsC7ahY=;
        b=cbT9ydgv1W7qdL1xSnC8nS+XkwumjiXvTKsSoXKH2r99eNZ2EEGtezaSgFdzwt9c/+
         dtRZfVxQugtRO/d6KsaRRaGuPqbVzmMLZSefZJ3c1qLp8Fq22mj5zeJVebg4tFINAqWu
         rJy7GqOixG7dFMJKQ/CYrTVZHmhb2C6oq8kwR+hxBpDIcz1xaeG7IhmFmbMQXtTKV/xE
         bYt2GjnYOrUZl0g5MY73tgbDMcZkK0nybMBk5vTgEIpX8e+hsiiPtfHL/G6yZWtuuvdK
         hxC8xJx6CefF5imgt5J42gpuKeQ1atAA9cyuNmD2cBPgtBnM0NCHONPcW7a/PVWQM5Fd
         ZemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789655561; x=1790260361;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PRPfZxZL7iiKajZEZpQuenLhAMrtnttjwuYtcsC7ahY=;
        b=CueRL9xH44eGty4fMXVcSGwiw2jy8k4K2hAXw1nW2cL3zPOdmMtOoSrTdwD6/jANM4
         EuEbYpXLFf1tVYByFe06dCcJRzawq5IxJjcGKBEa4UYxVCXz5Ot6um6+sNjut/lxjuYc
         /sXIcp2XsbJ+Vw5I8853gYfCN0nG3U1aVoHIbWJNZkQ2Z8V242I3fO4vULIyzAe4MHEO
         s4O9RJqfsNKocOC87esdwwiJmn7jE/HFT4kinzWzSq+Ocv4R2vSHpn90ijIDIgmyqzLN
         2ww78mJI4r+ishwiPvW3Q1gHc2DmcJZ6a47pf4iVqWkWdXqhRAhyiIglpT2FQjzAz924
         rutQ==
X-Forwarded-Encrypted: i=1; AKwUvBzv8ZBw81XzLhkN8dnlRu/0eF36pKjrOfozMDPyEkypXMbhZQNJgLzFAb1+8469gFPuwqU26UeVVPkVbsQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l/alPXRW5y0MMnBA+c/+wBaTv+HbXgIZ2AaDmMTzv+R2/vkYLd
	l4iJBitUwNOz8Vr/kmL5NE8ly+bGxeX0wgGWDk095s3l1sfd49j8D37+4kecQZHMBEJS4FFaild
	wQfPd0m8mnY9AplxqxXoOQwLW2p5Y/bQMZBmMoe4Y
X-Gm-Gg: AYBFou0IGTI5qFc7cFdjyfR3zW/hP9vK6BuqTrvdN6riAxoEPImJZ2RW/ehuq08SLur
	zaq0v40seIad528E9naxkkSqgy53t+/VSO/pe+7TgayXqyroaimBDQ9yvl286crs+6AAsVtgZrL
	stY1GtUwlr9GdMxQSSzjeKmZdH5uEpck8hyp95yBRPf0lt80sWVfGRxlRNyxrJIWRk9n4nFtW1O
	hhxuZWsZWWziH2GmHuagHV7ZTMT+n4GACu+8EpwDysjWvu/gFpBcoZtnWMXnjGyWM0nBBc2OP7d
	Ho2fWMDZlOO2M5SPARbSV5HNBhz96p1uSugTceE0hL3G/Wtpq92MxoMWn33kqWlFqyXI9WS5J1Q
	2LOuUWKzTwc0WQ/R0XmjUE0KZ
X-Received: by 2002:ac2:5688:0:b0:5a4:ec:53d9 with SMTP id 2adb3069b0e04-5b8bff1625cmr55295e87.1.1789655560856;
 Thu, 17 Sep 2026 07:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915160141.3543048-1-suzuki.poulose@arm.com>
In-Reply-To: <20260915160141.3543048-1-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 17 Sep 2026 15:32:04 +0100
X-Gm-Features: AcwNN1W_068MDIwpUtuw49Yy1PeVxQfVd9fKCVvGdj2PjeQoOQdH9b0b6js4h-g
Message-ID: <CA+EHjTzfgoZ6pxoGx-PjV5O4QfmPZrCjSrBAvoS-V2muLBVM8Q@mail.gmail.com>
Subject: Re: [PATCH v18 00/23] KVM: arm64: CCA: Add basic plumbing for Realms
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

On Tue, 15 Sept 2026 at 17:01, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> This series is a trimmed down version of the Arm CCA KVM support, previously
> posted here [0]. Like in the v17, we have tried to split the entire series
> into the following chunks.

FWIW, this boots and runs guests on VHE, nVHE and pKVM (protected and
non-protected) under QEMU, and on an M4; arch_timer and get-reg-list pass.
Didn't try it on FVP.

Cheers,
/fuad


>
>  1) Base RMM RMI support under drivers/firmware/arm_rmm -> [1]
>  2) Linux Host support for handling GPFs - [2]
>  3) NEW: Enlighten KVM arm64 about the different VM types and use call
>     backs for the VM type, rather than spilling the is_this_type_of_vm()
>     everywhere. Adds VCPU and Stage2 MMU related callbacks with support
>     for the existing VM types. There are other places where we may be
>     able to abstract, but those need careful performance evaluations
>     to make sure they are fit (e.g., vcpu_run)
>
>    Later in the series, we generalise the predicate "kvm_vm_is_protected()"
>    to cover all  "Confidential" VMs (which includes Protected VM and Realms),
>    which allows us to handle common themes without having to do things like :
>      if (kvm_vm_is_protected() || kvm_vm_is_realm()),
>      instead:
>      if (kvm_vm_is_confidential())
>    Also replaces the code with precise check for a given VM type to
>    avoiding combination of if (). e.g,, kvm_vm_is_unprotected_pkvm(kvm).
>    The checks under arch/arm64/kvm/{nvhe,pkvm} still retain the vm_is_protected()
>    check as pVMs are the only possible protected VMs there.
>
>  4) Bare minimal Realm VM support without the actual functionality to
>     run a Realm. This would help the maintainers to review the series in
>     smaller chunks. This doesn't depend on [1] and can be independently
>     merged, without being "functional".
>     This series includes vcpu operations and the s2 vm operations, which
>     do need the RMI driver backend to be meaningful. But the KVM handler
>     is in the right shape. The remaining changes would be added once the
>     RMI firmware library lands.
>  5) Core implementation of the RMI driver for KVM and actual enablement of the
>     Realm support. This depends on (1), (2) and the guest-memfd-in-place
>     conversion series v12 from Ackerley. This is available here at the integration
>     branch [3]
>
> This series is comprised of (3) and (4) above.
>
> The integration branch has been tested with the following components:
>   tf-RMM:   main branch (commit 5e6e2acd) compliant to RMM-v2.0-beta3 [4]
>   kvmtool: git@git.gitlab.arm.com:linux-arm/kvmtool-cca.git cca/kvm-v18
>
> [0] Arm CCA KVM Support v16 : https://lore.kernel.org/all/20260803134403.80630-1-steven.price@arm.com
> [1] Linux firmware RMI https://lore.kernel.org/all/20260912083611.2513845-1-suzuki.poulose@arm.com
> [2] Linux GPF Host https://lore.kernel.org/all/20260913070459.2547407-1-suzuki.poulose@arm.com
> [3] https://git.gitlab.arm.com/linux-arm/linux-cca/ cca/cca-host/kvm-v18/integration
> [4] https://support.arm.com/documentation/den0137/2-0bet3/
>
> Changes since v17:
> https://lore.kernel.org/all/20260908162223.1683432-1-suzuki.poulose@arm.com
>
>  - Add a patch to fix pKVM handling of SYS_CNTVCT/CNTPCT to override the counter
>    offset (Patch1)
>  - Restrict Realms to VGIC v3 only - New patch
>  - Add kvm_vm_is_unprotected() to replace is_protected_kvm_enabled() &&
>    !kvm_vm_is_protected() - New patch
>  - Use macro to initialize the per-flavor vcpu, s2_vm ops
>  - Add a wrapper to initialise vcpu and s2_vm ops with a BUILD_BUG_ON()
>    for the array size checks against VM flavour types
>  - Drop forward decalaration of the vcpu, s2_vm operations that spoiled the
>    fun ;-)
>  - Remove irrelevant comment about the order of timer loading for !VHE
>  - Use the explicti kvm_call_hyp_nvhe for pKVM specific ops
>  - Don't call nvhe_vcpu_put from pkvm_vcpu_put, open code them
>  - Drop cpu argument for vcpu_load() callback. We set the cpu
>    before the callbacks are invoked
>  - Drop kvm_vm_is_confidential(), instead widen the scope of kvm_vm_is_protected()
>    to cover pVMs and Realms. Add an explicit helper kvm_vm_is_protected_pkvm()
>    for the cases where we need to check for a "pVM on pKVM"
>  - Add kvm_vm_hyp_is_pkvm() for checking if the VM is running on pKVM.
>    covers both unprotected and pvms. But really uses is_protected_kvm_enabled()
>    under the hood
>  - Add kvm_vm_hyp_is_distrusting() to cover pKVM guests (both protected and
>    unprotected) and Realms. Use this for preventing the vgic v2 mapping into
>    Stage2 for a guest
>  - Drop superfluous !kvm check from kvm_vm_ioctl_enable_cap() - Sashiko
>  - Drop KVM_CAP_CREATE_IRQCHIP, as we don't support VGIC_V2 for Realms
>  - Filter out the vm_ioctls that are based on blocked cap.
>  - Repurpose the pkvm plumbing for filtering the caps and ioctl to generic
>    and plumb the Realm support in
>  - s/PKVM/pKVM for the comments
>  - Drop type argument for pkvm_init_host_vm and also drop protected variable,
>    now that we have the vm_flavor to check.
>  - Use kvm_vm_hyp_is_pkvm() to replace is_protected_kvm_enabled() with valid
>    kvm instance
>  - CCA: Merge the GET/SET REG handling patches into a single patch
>  - CCA: Reword the commit description for SVE VL access handling
>  - Reordered the patches to group the Realm realted to changes to the rear end
>
> Jean-Philippe Brucker (2):
>   KVM: arm64: CCA: Expose SVE VL register before VCPU finalization
>   KVM: arm64: CCA: Control user register access for Realms
>
> Steven Price (3):
>   KVM: arm64: Avoid including linux/kvm_host.h in kvm_pgtable.h
>   KVM: arm64: CCA: Support timers in realm RECs
>   KVM: arm64: CCA: WARN on injected undef exceptions
>
> Suzuki K Poulose (18):
>   KVM: arm64: protected VM: Handle set_one_reg CNTVCT_EL0/CNTPCT_EL0
>   KVM: arm64: Disable Steal time accounting for protected guests
>   KVM: arm64: Include kvm_emulate.h in kvm/arm_psci.h
>   KVM: arm64: Track the type of VM in kvm_arch
>   KVM: arm64: Refactor the vcpu_load to allow for VM specific callbacks
>   KVM: arm64: Add vcpu load/put call backs for flavors
>   KVM: arm64: Reuse kvm_stage2_unmap_range in kvm_unmap_gfn_range
>   KVM: arm64: Add VM specific callback for S2 MMU operations
>   KVM: arm64: Abstract out memory abort handling
>   KVM: arm64: Use kvm_vm_is_unprotected() for !kvm_vm_is_protected()
>   KVM: arm64: Widen the scope of "protected" VMs
>   KVM: arm64: Add a helper for VMs running on hyp that don't trust the
>     host
>   KVM: arm64: CCA: Add a new mode for supporting Realm guests
>   KVM: arm64: CCA: Add VCPU load/put for Realms
>   KVM: arm64: CCA: Add bare minimal S2 operations for Realm
>   KVM: arm64: CCA: Introduce Realms
>   KVM: arm64: CCA: Mandate VGIC_V3 for Realms
>   KVM: arm64: CCA: Don't expose unsupported capabilities for realm
>     guests
>
>  .../admin-guide/kernel-parameters.txt         |   3 +
>  arch/arm64/include/asm/kvm_emulate.h          |  16 +
>  arch/arm64/include/asm/kvm_host.h             |  63 +++-
>  arch/arm64/include/asm/kvm_pgtable.h          |   6 +-
>  arch/arm64/include/asm/kvm_pkvm.h             |  25 +-
>  arch/arm64/include/asm/kvm_rmi.h              |  61 ++++
>  arch/arm64/include/asm/virt.h                 |   1 +
>  arch/arm64/kvm/Makefile                       |   2 +-
>  arch/arm64/kvm/arch_timer.c                   |  37 +-
>  arch/arm64/kvm/arm.c                          | 330 +++++++++++++++---
>  arch/arm64/kvm/guest.c                        |  73 +++-
>  arch/arm64/kvm/handle_exit.c                  |   2 +-
>  arch/arm64/kvm/hyp/nvhe/pkvm.c                |  28 +-
>  arch/arm64/kvm/hyp/pgtable.c                  |   1 +
>  arch/arm64/kvm/hypercalls.c                   |   4 +-
>  arch/arm64/kvm/inject_fault.c                 |   1 +
>  arch/arm64/kvm/mmu.c                          | 210 ++++++++---
>  arch/arm64/kvm/pkvm.c                         |   6 +-
>  arch/arm64/kvm/pvtime.c                       |  14 +-
>  arch/arm64/kvm/rmi.c                          |  18 +
>  arch/arm64/kvm/sys_regs.c                     |  29 +-
>  arch/arm64/kvm/vgic/vgic-init.c               |   3 +
>  include/kvm/arm_arch_timer.h                  |   3 +-
>  include/kvm/arm_psci.h                        |   2 +
>  24 files changed, 758 insertions(+), 180 deletions(-)
>  create mode 100644 arch/arm64/include/asm/kvm_rmi.h
>  create mode 100644 arch/arm64/kvm/rmi.c
>
> --
> 2.43.0
>
