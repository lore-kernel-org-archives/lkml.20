Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.237
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933440;
	b=IjxvJBHWBmI8t5qR4nxw6Ak0nIjPLstutp9kP/VkDC4+brv+Y7cjdoDL3imoLJvdE6Kb
	 eOaY0MZ1Orhz4tY9WiKAvUdH3ucsmMRsOB76cMB4efoQ+J9lXgC1pnznBABa0BnJIef6S
	 24nSWZ7d7uHtsLeK0s3cB96VznwJR5e0eHM74AMIT4F1SfSp6RECsSNZlVuWbdJqstRP0
	 My2WUcekNdrLcUtiiOSsIf/4X9Qd9K3s9lWWjQhkNpxcuFmBQkot9gIUGZEGhvq4vFP2u
	 09Q5srotg7qbrRdPD8wUYYayOi9eFyXUAv8/YUsYnOl2WriJ4Q5t9sjQIk71eXYT+Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933440;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ihyr4DFcCTnUi8RpBAkPBo5h4glV/gGCS8t9FUoUP5c=;
	b=n8H9weGTXaAvjo+ImixC9UEVjkjKUSXHOIrIX/cZSHHUU2gwfhntyU9M1+hNbpIbVmUK
	 FFvH/4liBkbbfWaT0j99E/Xfzk4F0HXhlfi4pUT0PHpK2rEKyj6KtFbJJ9Z8MPsNPVBEF
	 X0cPPHi65e967LxupNlhQ0ugVq1PPhx00c8wCGy6fnR3iiPdcf8H5IqEok+zk0ZBKpAmi
	 RrtIASGCgsMc3mwrkH48o3/Zf1zIiXrdsdDXiw6dY49jep6h7M2aJbg1zEXJiRUE5q62O
	 2gVZ7GCscx0E0Yrpc5vJ2dqgge3ya0Zq9UoV72Ivb0XCTS+QMn1uSmaS6JtSWpVtoAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Q7Pj5+NK;
	arc=none smtp.remote-ip=91.218.175.237
Received: from mta0.migadu.com (out-237.mta0.migadu.com [91.218.175.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3B7606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D3B7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Q7Pj5+NK
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=daj20mbvFvBdLEpKz25aOkweMY59YlNCAihrBtLyt2c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794933437; v=1; x=1795538237;
 b=Q7Pj5+NKA4t5HUgDYsiw/WXYCpd8LYBNQaRf9cSGQxNWDXzyXvgDmqY81IePvMzTvNRzoAYn
 rkqRckqmdlbbAGn1hPu0qnd2pxsSHjLTcwolHL/E1fm0UVBeZ2zasJCFg9trL+mEUmH0+AOArtF
 z5GyQOZJA0S9yRJdzHbfDlrU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 89a4f049cb720cd1;
	Tue, 17 Nov 2026 16:37:17 +0000
X-Mizu-Trace-ID: 89a4f049cb720cd1
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] KVM: arm64: Don't run a pVM with firmware Spectre-v4 mitigation disabled
Date: Tue, 17 Nov 2026 16:37:01 +0000
Message-ID: <20261117163702.1678277-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117163702.1678277-1-fuad.tabba@linux.dev>
References: <20261117163702.1678277-1-fuad.tabba@linux.dev>
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

EL2 handles a protected guest's ARM_SMCCC_ARCH_WORKAROUND_2 discovery
query using a copy of the host's Spectre-v4 state taken at init. If the
system is mitigated and the guest doesn't have SSBS, EL2 returns
NOT_REQUIRED, which indicates to the guest that firmware mitigation is
permanently enabled. However, EL2 forwards the host's
ARM_SMCCC_ARCH_WORKAROUND_2 calls to firmware, so the host can disable
the mitigation and then run a protected vCPU.

On a mitigated system, the host kernel disables the mitigation only
while its own userspace runs, so a host that runs a vCPU with it
disabled is misbehaving, whatever the guest was told. Track the
mitigation state per CPU from the host's calls, and don't run a
protected vCPU on a CPU where it's disabled. Forward the calls without
hints, so that firmware decodes the same function ID as EL2.

Firmware enables the mitigation when a CPU powers up (SMCCC DEN0028,
7.6.4), so the tracked state doesn't have to be reset on CPU_ON or
resume. When an SDEI event completes, firmware also restores the
mitigation state of the interrupted context. EL2 can't track that, so
this fix relies on the host's SDEI calls not being forwarded.

Fixes: fe40ff87ead5c ("KVM: arm64: Implement HVC handling for protected guests at EL2")
Reported-by: Ryan Roberts <ryan.roberts@arm.com>
Closes: https://lore.kernel.org/all/5fa8a1fb-4e2c-4746-8a70-a47f387ef0d6@arm.com/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_host.h  |  1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 97332ffcb1300..80d0665b93f25 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -839,6 +839,7 @@ struct kvm_host_data {
 #define KVM_HOST_DATA_FLAG_VCPU_IN_HYP_CONTEXT		4
 #define KVM_HOST_DATA_FLAG_L1_VNCR_MAPPED		5
 #define KVM_HOST_DATA_FLAG_HAS_BRBE			6
+#define KVM_HOST_DATA_FLAG_SSBD_DISABLED		7
 	unsigned long flags;
 
 	struct kvm_cpu_context host_ctxt;
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 37fb9896ba3ad..8cc541e6e521b 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -925,6 +925,15 @@ DEFINE_KVM_HOST_HCALL(int, __kvm_vcpu_run, struct kvm_vcpu __kern *, vcpu)
 		if (unlikely(system_supports_sme() && read_sysreg_s(SYS_SVCR)))
 			return ret;
 
+		/*
+		 * Firmware Spectre-v4 mitigation can be advertised to a
+		 * protected guest as permanent. The host kernel runs with it
+		 * enabled, so if it's disabled the host is misbehaving.
+		 */
+		if (pkvm_hyp_vcpu_is_protected(hyp_vcpu) && spectre_v4_state == SPECTRE_MITIGATED &&
+		    host_data_test_flag(SSBD_DISABLED))
+			return ret;
+
 		/*
 		 * ON has a single writer, pkvm_reset_vcpu() on this CPU, so
 		 * READ_ONCE suffices. ON_PENDING takes the reset; -ECANCELED
@@ -1656,6 +1665,16 @@ static void default_host_smc_handler(struct kvm_cpu_context *host_ctxt, u64 func
 		return;
 	}
 
+	if (func_id == ARM_SMCCC_ARCH_WORKAROUND_2) {
+		/* Drop the hints, so that firmware decodes the ID as EL2 did. */
+		cpu_reg(host_ctxt, 0) = func_id;
+
+		if (lower_32_bits(cpu_reg(host_ctxt, 1)))
+			host_data_clear_flag(SSBD_DISABLED);
+		else
+			host_data_set_flag(SSBD_DISABLED);
+	}
+
 	trace_hyp_exit(host_ctxt, HYP_REASON_SMC);
 	__kvm_hyp_host_forward_smc(host_ctxt);
 	trace_hyp_enter(host_ctxt, HYP_REASON_SMC);
-- 
2.47.3

