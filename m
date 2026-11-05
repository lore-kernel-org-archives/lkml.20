Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883928;
	b=xbBktceYUqtJ8SRwvp1uhr2U997MGk42u7JemSiVZu3JdVLAov5m3WhAY36u+Eba95B0
	 L2tLfsQaGcNkNf9XM71MYA6OhOZctnEoX5PPJN+xoF7f034GGi13vNW6d6/xzblzQoT/+
	 QulXi+I0vwOaHP60dFFbc3Dw+gCoJBZcYZk8LEY8gx4OAMcQhHgBTZ8pev7bdRGJqyMhk
	 NjSkdzkeyWKe8IcFmPN3tMCViHjFFJnmtkDjYsSVlM3X5citjNvuJW2DyFrZrq/raC1BV
	 64feIZehtEa21O9OcWR+8tLrwKQa59C5n1BGetCgFDab64fSx+sRgxMykTzy4WzdbTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883928;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U1YPN3OgBZ6MC41gzP1YSCgDTdcndw5WoSOxyRkhuTE=;
	b=jT6pgOdDJ01X3K4NslFIFy1t1Vmgdj+Kd1rFq/P0XBJm12BVJ3nsHllC5mt06mHFxA2R
	 M0NeL+1uqYZYQB4k+IhaAhK/ZyZOf+c77l4ccvzIfxQN3K0M1VL4dvgkcLSM93wgr0WEy
	 hsKz42htBF7+tLX6M3zSrKB9LRO5UbpVICwpZVZSm7M4hor1Fvuu44Ph7h0JlIdXS55vN
	 vXmZ+IY67H+U/dpib2wKUwQP7FmsUdS1FlPqTPfcAXGtsHE/t3qW46/wvlTM2o6DHuQGV
	 CTsZx4d+A9vcOj8M/Hkd4cm+CREmrLvjz7AWOzV3xfWQtPQ9xo8KMPBWLjRqmNXzznQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="PnjcY4h/";
	arc=none smtp.remote-ip=91.218.175.207
Received: from mta0.migadu.com (out-207.mta0.migadu.com [91.218.175.207])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E5C606A334
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95E5C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PnjcY4h/
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IAD0JHK5u0AjR1SS9NS5jBII24VCj84wL7W/E6MbcFQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793883925; v=1; x=1794488725;
 b=PnjcY4h/pHslTwUIPa3dSfFaHqKrGwk4SQQA2UpAqzI0TAn6K2F4Gb0fxAaPcdrrxWIinxXK
 Qu+UuElPuNDMuBp4UeFdquyTVmoDOZ9a2jSvPjC2/+Hqv+V9tWX9/qVdjGM8fVU4iHnkItNVw1a
 GZWws9eoIJipNkXJDRq4f1kk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 981a1b1030f162c4;
	Thu, 05 Nov 2026 13:05:23 +0000
X-Mizu-Trace-ID: 981a1b1030f162c4
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] KVM: arm64: Allow protected VMs to use SVE
Date: Thu,  5 Nov 2026 13:04:56 +0000
Message-ID: <20261105130456.1617185-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105130456.1617185-1-fuad.tabba@linux.dev>
References: <20261105130456.1617185-1-fuad.tabba@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that EL2 owns a protected vCPU's SVE state and advertises
ID_AA64ZFR0_EL1, allow KVM_CAP_ARM_SVE for a protected VM, which lets
KVM_ARM_VCPU_INIT take KVM_ARM_VCPU_SVE.

A protected guest's SVE access trap injects an UNDEF. An SVE
instruction takes the SVE trap rather than the FP one, so a guest whose
first vector instruction is an SVE one would get an UNDEF instead of
the lazy FP switch. Handle the SVE trap as the FP trap is:
kvm_handle_pvm_fpsimd() switches the state for a vCPU with SVE and
still injects the UNDEF for one without.

Update the documentation to match.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 Documentation/virt/kvm/arm/pkvm.rst | 6 +++---
 arch/arm64/include/asm/kvm_pkvm.h   | 1 +
 arch/arm64/kvm/hyp/nvhe/switch.c    | 1 +
 arch/arm64/kvm/hyp/nvhe/sys_regs.c  | 2 --
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/virt/kvm/arm/pkvm.rst b/Documentation/virt/kvm/arm/pkvm.rst
index b75bb8ad6f26d..163aa01ac5067 100644
--- a/Documentation/virt/kvm/arm/pkvm.rst
+++ b/Documentation/virt/kvm/arm/pkvm.rst
@@ -134,9 +134,9 @@ A protected VM boots from a single primary vCPU. Before the first
 * Set the primary vCPU's boot state with ``KVM_SET_ONE_REG``: the kernel
   entry address in ``PC`` and the DTB pointer in ``x0``.
 
-``PC`` and ``x0`` are the only registers EL2 takes from the host. Other
-pre-run writes are accepted, but the guest starts from the state the
-hypervisor resets it to.
+``PC``, ``x0`` and the SVE vector lengths (``KVM_REG_ARM64_SVE_VLS``) are
+the only registers EL2 takes from the host. Other pre-run writes are
+accepted, but the guest starts from the state the hypervisor resets it to.
 
 Secondary vCPUs are started by the guest itself through PSCI ``CPU_ON``
 (see `Power state`_), which supplies their entry point and context ID.
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index fd042d2b54624..5f1b3308b42e1 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -40,6 +40,7 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
 	case KVM_CAP_MAX_VCPU_ID:
 	case KVM_CAP_MSI_DEVID:
 	case KVM_CAP_ARM_VM_IPA_SIZE:
+	case KVM_CAP_ARM_SVE:
 	case KVM_CAP_ARM_PTRAUTH_ADDRESS:
 	case KVM_CAP_ARM_PTRAUTH_GENERIC:
 	case KVM_CAP_ONE_REG:
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 89fb9dd351ad5..0626f4203ba6d 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -230,6 +230,7 @@ static const exit_handler_fn pvm_exit_handlers[] = {
 	[ESR_ELx_EC_WFx]		= kvm_handle_pvm_wfx,
 	[ESR_ELx_EC_HVC64]		= kvm_handle_pvm_hvc64,
 	[ESR_ELx_EC_SYS64]		= kvm_handle_pvm_sys64,
+	[ESR_ELx_EC_SVE]		= kvm_handle_pvm_fpsimd,
 	[ESR_ELx_EC_FP_ASIMD]		= kvm_handle_pvm_fpsimd,
 	[ESR_ELx_EC_IABT_LOW]		= kvm_hyp_handle_iabt_low,
 	[ESR_ELx_EC_DABT_LOW]		= kvm_hyp_handle_dabt_low,
diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index e6bbc897cd7b1..0ddddf957f5ab 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -502,8 +502,6 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
 	ID_UNALLOCATED(7,6),
 	ID_UNALLOCATED(7,7),
 
-	/* Scalable Vector Registers are restricted. */
-
 	HOST_HANDLED(SYS_ICC_PMR_EL1),
 
 	RAZ_WI(SYS_ERRIDR_EL1),
-- 
2.47.3

