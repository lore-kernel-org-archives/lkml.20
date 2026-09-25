Received: from mta0.migadu.com (out-15.mta0.migadu.com [91.218.175.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF87636E489
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327186; cv=none; b=V7sCc+w7RYGQ7pUpL0onbnUfRBoV0BYM3x9BA+YZFExNzXmPLIo8O6vfcUst7ivKhZqeNvzkf/8TfCzV0hMJEsH6+jQlpgSZWDaVm57CUaR3w/SIFSWPSLWbBRpbAaOGe8sfLD9N+9dqQCDF1hKLOIJF57FgrCzqDO4RepUdDAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327186; c=relaxed/simple;
	bh=uT67jQLLkVIaTp0qSTH277698A/g5o9SVMksMSSr6LM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NydG41YFP/ScNunSONp56o+mJ7dSE4PrFoJMLa8u/Aooklogn3p9PBdWM7QY0QBp654B5OsQ4wQvoVM9cdB4X4ZcFm8mU4FWEppuVZKeijk6GvV2RDgQ4QBPUaIMspYrFr1n6hzRGqvnd4xt6ZJDmFeFqPR1G4Aa1C6JMCGkNHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=u4ji/SGu; arc=none smtp.client-ip=91.218.175.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="u4ji/SGu"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uT67jQLLkVIaTp0qSTH277698A/g5o9SVMksMSSr6LM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790327181; v=1; x=1790931981;
 b=u4ji/SGuK7WT3Xkdo6yolw5trjxl5lo25MrWKrgRJqzaL5rzjwhe4epnBovhQT7cgx3gnBR/
 nbULNmo6uHfdveaEC9rAkOTEDzKuaULMoZ3DkU96NOFC8ZTdFH+2wXCMrU8c98YsYTMtt0VRPJ/
 oX29T6h8m/Cu7qCL6fS55apA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 784084d02c7ed006;
	Fri, 25 Sep 2026 09:06:21 +0000
X-Mizu-Trace-ID: 784084d02c7ed006
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
	Quentin Perret <qperret@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] KVM: arm64: Clear HCR_EL2.RW for 32-bit non-protected vCPUs
Date: Fri, 25 Sep 2026 10:06:17 +0100
Message-Id: <20260925090619.852995-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260925090619.852995-1-fuad.tabba@linux.dev>
References: <20260925090619.852995-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In pKVM, KVM_RUN on a vCPU created with KVM_ARM_VCPU_EL1_32BIT fails
with KVM_EXIT_FAIL_ENTRY. pkvm_vcpu_reset_hcr(), pKVM's EL2 counterpart
of vcpu_set_hcr(), never clears HCR_EL2.RW, so the first ERET into the
vCPU is an illegal exception return. Protected VMs are AArch64-only, so
only non-protected VMs are affected.

Clear RW for 32-bit vCPUs. The vCPU's features come from the host, and
on a CPU without AArch32 EL1 a cleared RW would make EL2 switch
registers that are UNDEFINED there. Clear it only when the system has
AArch32 EL1, the same check system_supported_vcpu_features() makes on
the host.

Fixes: b56680de9c648 ("KVM: arm64: Initialize trap register values in hyp in pKVM")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 459bd9eb7e4bc..affc9595fda20 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -54,6 +54,14 @@ static void pkvm_vcpu_reset_hcr(struct kvm_vcpu *vcpu)
 	else
 		vcpu->arch.hcr_el2 |= HCR_TID2;
 
+	/*
+	 * At EL2, vcpu_el1_is_32bit() reads HCR_EL2.RW, and EL2 switches the
+	 * *32_EL2 registers when it returns true; they're UNDEFINED without AArch32 EL1.
+	 */
+	if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_EL1_32BIT) &&
+	    cpus_have_final_cap(ARM64_HAS_32BIT_EL1))
+		vcpu->arch.hcr_el2 &= ~HCR_RW;
+
 	if (vcpu_has_ptrauth(vcpu))
 		vcpu->arch.hcr_el2 |= (HCR_API | HCR_APK);
 
-- 
2.39.5

