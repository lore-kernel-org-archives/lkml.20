Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6293C5616A0
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791928836; cv=none; b=MWWZk/VSxZhZlaL9Ah5hVd5sn8GHM9cHY1HrehqFseUxdJmSnlvtXy23GCUs2SWvyGUGHeV3vA/AnOqyEk1og5Dfmh9jyBNu+sj97RksD+MFU+mL91RmpJwoxZDpQaKHhYrvNHwXJzFuFxWf2gpXht6tAJLW8FGhc48O2IoXnfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791928836; c=relaxed/simple;
	bh=sn2mLGJH0tgKOcGLdG04mUbQQzWBRolRQ4hI/fHGez0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AsJ+NUl117SiKSbHhwNuvABtByQiuExOQEHQxbchq7n1B1DVCOrvM6JqbnoTC0gE0g+vu45bPZ50n0SaOhl58xcn5uWWmEfF8wlOwh4tpfOP3AoRmJhW6/EjlhBeHAvDXQESb5qeWXNT2espzHJ8u2X6nCB5nIPgcarEV2XMmOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gawf1Llf; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gawf1Llf"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso1336963a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791928828; x=1792533628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UI33XHytP9UeW0jMN4hGWfxaoI7IkHXeeChdjxsUSUw=;
        b=Gawf1LlfFwPJJ/yzr0pEXnALwLMR1MSuVuwaq04nbYEzIL4ZSl3kAr1MFg7fjoZMSM
         NQoFEW7dlTsQ20Ypf1aoLD7cHJwX7ahaTUPBKkrfRTsk7cgcNYtZZVQ5V16ExMUh0RoF
         A0ZdoiCmLYcLQ0bRRsULHT2zigxI0LPUI+X5aTDaDOrtNdo0Mld5S2X7CxQL15wwteMV
         p3xZzZWBAYBjOWfhVZ02EYrfnrkiGY1oIPwEWLfC81ySh9DW9Nhd/QUmVoGSZe2uIGCQ
         y3nCnZE8/rV8AmjTiHkC+DyBG3R4aFU8tEUAb9Z5Teo2OfWoxuP89f317vYE1vXz4SO0
         Fz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791928828; x=1792533628;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UI33XHytP9UeW0jMN4hGWfxaoI7IkHXeeChdjxsUSUw=;
        b=zjDQhFwgCceiTbOztnbNGn8fXJVg2khzWL8R4MIxb1dpkfnHlJ+w0jR0cVk3XpYZiW
         PDzajnGQLhoR4+7TxSvtEbqimX4w9dKLReC7MGCsrfu793vBFyol90TrVbjqpcfyXA01
         gWHw/Jq1IySGcGNT5fxVzybxJjJf4YBsW43/VvP6jKmJDgEoBb9JyTm91+Q5Ry+4Jvnj
         9of6G4ZZVZENfNBKfuKj2EWQF5EkHIuinaP71UzMk4CjDOTIUDAo7OLy6m6HVjEGLCjS
         iU+4E+G0A3M6/SNALEdp6PqrTmxWgRhFkEPsnL9/rARr+JeMgbiG97oILVUkjTeNhb0e
         elJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwR/8/vRGWC5GUOLXcuxWjE566UdqxY7KZSIeYseS1cYVg4W5pzVI6sSZqy6tV7Teo65ExrO44VFMZ/V3E=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6+/1ivtpqvOS4B+QCu8sMT/yRpCm1yigEgZFDUe65t2K9/rxe
	ZIsPth6fYIhXwkfSP/e9MaRSNRYlevUgO7wcZhgckEBz8UgxSpLqui74D4igzgBzNIc=
X-Gm-Gg: AYBFou2MTS3gtVjiTqWY2+Nx/46NFjA7OjSQqJaDcdD3Wvr9o3rF8rscCxEf46S1b08
	ycy87ahsc+IVfKG4kihtPp7rSFp8VoClYNRRO35CGi5CCxoypNhaFlkP8rVzpu+WhjokB05aMgg
	vCOg00GOrYSOJZpVo4mEzzRDYCD/LXdxVLigoIKuZ4w3RJKtRrhAvXnKa34efZxuDM2buXRbRTs
	IRK823wkqBuHJdcKpio68tLRwHTgvDZZWU3IGvcV2Nn3dH42Ino4I8astW7229sf3OwJyeeBBWa
	ke3I09w0o6yiqB9C0C+Y5YpQlmUKYOIC+TFHSnP3Q1D5/MBsVFjJWsAFZQp8OpdYD0VN8YX0/tl
	mGf0b90YLSj1IFSzqQqLqk4Pp/OiZYiJi89AoDhKSBHBrLSRk3HccPuJZs58O2TxhbLT6H8sOjf
	VUkz0LUy44VmgEFOtnuGzMnfmYOF5LP1/O1Or/3kkYnDNW0igBUBBNbhXNxNnr5s5BgS6EVzjCh
	w==
X-Received: by 2002:a17:90b:3d82:b0:3a8:f70f:2437 with SMTP id 98e67ed59e1d1-3ab3ab3771fmr9650115a91.50.1791928828071;
        Tue, 13 Oct 2026 15:00:28 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:adc4:c3cd:7c5f:3991])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac678d2229sm309218a91.3.2026.10.13.15.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 15:00:26 -0700 (PDT)
Date: Tue, 13 Oct 2026 16:00:22 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
	gshan@redhat.com, joey.gouly@arm.com, tabba@google.com,
	yuzenghui@huawei.com, linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com,
	jonathan.cameron@oss.qualcomm.com
Subject: Re: [PATCH v23 00/14] KVM: arm64: CCA: Add basic plumbing for Realms
Message-ID: <as6p9q051NgTKHum@p14s>
References: <20261007073537.2454351-1-suzuki.poulose@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007073537.2454351-1-suzuki.poulose@arm.com>

On Wed, Oct 07, 2026 at 08:35:23AM +0100, Suzuki K Poulose wrote:
> This is a trimmed down and updated version of the v22 of Arm CCA basic
> plumbing series [0]. I have dropped the CCA specific bits for the sake keeping
> them separate. This series now only contains the framework for handling
> different VM types and lay down the path for adding Realm as one of the
> protected VMs. The full support for running Realms under KVM is available as
> an integration branch at [1].
> 
> The integration branch has been tested with the following components:
> 
>   tf-RMM:   main branch (commit 5e6e2acd) compliant to RMM-v2.0-beta3
>   kvmtool: git@git.gitlab.arm.com:linux-arm/kvmtool-cca.git tag:cca-kvm-v20
> 
> [0] Arm CCA KVM basic plumbing v22
>     https://lore.kernel.org/all/20261005090754.2140522-1-suzuki.poulose@arm.com
> [1] https://git.gitlab.arm.com/linux-arm/linux-cca/ cca/cca-host/kvm-v23/integration
> 
> Changes since v22:
>  https://lore.kernel.org/all/20261005090754.2140522-1-suzuki.poulose@arm.com
>   - Drop the CCA specific patches for now, they are on the integration branch
>   - system_supported_vcpu_features() - Start off with a base set of features for
>     the type of VM
>   - Add () around 'flavor' in KVM_VM_S2_OPS() macro
>   - Drop BUILD_BUG_ON and redefine {kvm_vm,vcpu}_is_protected() for nVHE
>   - Drop {kvm_vm,vcpu}_is_protected_pkvm() macros
> 
> Changes since v21:
>  https://lore.kernel.org/all/20261001210703.1597150-1-suzuki.poulose@arm.com
>  - Keep the kvm_arch struct packed, by moving psci_version, closer to vm_flavor and also moving the vm_s2_ops, closer to vm_flavor.
>  - Drop the kern_hyp_va() for vcpu_is_protected() in nVHE, instead ban nVHE
>    code from using vcpu_is_protected() (by using BUILD_BUG_ON()) and convert
>    all users to vcpu_is_protected_pkvm()
>  - Drop kvm_vm_is_unprotected_pkvm() in favor of open coded check against VM_PKVM
>  - Drop WARN_ON_ONCE() in the kvm_vm_ioctl_allowed() to match Fuad's fix merged in v7.3-rc5
>  - Move '&' to the KVM_*_OPS macros
>  - Nuke __unmap_stage2_range() and define per-VM callback for stage2_unmap_range, removing the KVM_PGT_FN() hack for the call, and also for the others
>  - Drop NULL check for vm_s2_ops callbacks and always define everything.
>  - Add no_age_gfn() which plugs in for pVMs and Realms for the vm_age_*gfn callbacks
> 
> Steven Price (1):
>   KVM: arm64: Avoid including linux/kvm_host.h in kvm_pgtable.h
> 
> Suzuki K Poulose (13):
>   KVM: arm64: protected VM: Handle user writes to CNTVCT_EL0/CNTPCT_EL0
>   KVM: arm64: Disable Steal time accounting for protected guests
>   KVM: arm64: Include kvm_emulate.h in kvm/arm_psci.h
>   KVM: arm64: Track the type of VM in kvm_arch
>   KVM: arm64: Don't call vcpu_set_pauth_traps for pKVM host
>   KVM: arm64: Refactor the vcpu_load to allow for VM specific callbacks
>   KVM: arm64: Add vcpu load/put call backs for flavors
>   KVM: arm64: Consolidate stage2 unmap range into kvm_stage2_unmap_range
>   KVM: arm64: Add VM specific callback for S2 MMU operations
>   KVM: arm64: Use a local kvm pointer in kvm_handle_guest_abort()
>   KVM: arm64: Abstract out memory abort handling
>   KVM: arm64: Mandate VGIC v3 for pKVM VMs and Realms
>   KVM: arm64: Prevent unsupported vcpu features for VM types
> 
>  arch/arm64/include/asm/kvm_host.h    |  73 ++++++-
>  arch/arm64/include/asm/kvm_pgtable.h |  10 +-
>  arch/arm64/include/asm/kvm_pkvm.h    |   6 +-
>  arch/arm64/kvm/arch_timer.c          |  12 +-
>  arch/arm64/kvm/arm.c                 | 275 ++++++++++++++++++++-------
>  arch/arm64/kvm/hyp/nvhe/pkvm.c       |   6 +-
>  arch/arm64/kvm/hyp/pgtable.c         |   1 +
>  arch/arm64/kvm/mmio.c                |   1 +
>  arch/arm64/kvm/mmu.c                 | 247 +++++++++++++++++-------
>  arch/arm64/kvm/pkvm.c                |   6 +-
>  arch/arm64/kvm/pvtime.c              |  14 +-
>  arch/arm64/kvm/vgic/vgic-init.c      |   2 +
>  include/kvm/arm_psci.h               |   2 +
>  13 files changed, 493 insertions(+), 162 deletions(-)

Version 5 of my QEMU-VMM patchset [1] has been tested on this kernel and things
work as expected.  Instructions to build and test on the QEMU SBSA architecture
are located here [2].

[1]. https://lore.kernel.org/kvm/20261002202026.1204110-1-mathieu.poirier@linaro.org/
[2]. https://gitlab.com/Linaro/cca-public/build-instructions/-/tree/upstream-v5-kvmv23?ref_type=heads 

> 
> -- 
> 2.43.0
> 
> 
