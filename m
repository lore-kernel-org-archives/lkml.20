Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482199;
	b=2JhXmu0f2SCCytFq7Q2ZqOwZ9x4I5KYetW2neP+PmbJQHePbLpmUoeQ1Lb7wim9KMnn+
	 FQU4ztYWviPFDINRNotdvfefQbgcXSzkoq86srW1Db983+U24AtBvckq3VZKXiwUDnQ8A
	 Vka/eaPkdsf4XT1ze+Nph92Bj50/oIRiY9/HwKq04iDmLtajgukerH9V6mrQUKgfdNitk
	 X7thQKMctcxGOBEdsNBpsdC13kCUIO1tOBVwlGURtx1by/bk+xA7u+Dzye7OovzBnEPo7
	 KDjU8usAuKe2Vycupa5zZyFFQzC5f+X7NPB+T5R/e/mCQqO5XmeCLe5OIc5Vm0S+DNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482199;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=lMJm3X8wFtXe66OPPwiKiE4WIXPVW/SEHFXXFjYPF+k=;
	b=bRKlCYgBflCzPWyEY3f4z0pqPVUk2jF99ErqGXIBjp6x+oiVwWdBjJ+7UrieIjYAWOmE
	 H1raszRAg+X3X/vLKcgifqHf3X03QteNcyra5aURoS7Ht8VjnIX+9/dnqqf3wgqa/roHx
	 Wkv7kOwPVZTO3ZbSF7x+XUVmyc/nfzeXHapeukDXCjx0I1DgzS8QwLnFx/A/F6sUWkScU
	 4jU7u/Kaypjc4yt4Bjvsc0RKH37Y5Id7NCSM+QChPCouSroap1tYdzhuGBprFGgAq6NXQ
	 +XZfRpdQ0IQqho7l9mnVp8aI92/u//M+DJQWTSM3zNkKtkfvHOBJf2R3XsoYR2uHOeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lJOGm6c9;
	arc=none smtp.remote-ip=91.218.175.1
Received: from mta0.migadu.com (out-1.mta0.migadu.com [91.218.175.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271CF606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 271CF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lJOGm6c9
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LiHaq6+uFROwaYPn/aBBgjxC+LLOn4WfwOUQ+ggb2Q8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792482196; v=1; x=1793086996;
 b=lJOGm6c9NKRvqL24Oe2LB1rtqNthJSHxeU7cl4a/TQyH+bueoxpFbnSY6TSOY25hxV9313Mz
 Zym8/a4rnMn7/0Wt6F8DvHkEhVO8EZnN4tJlth/bCFQUAIc2OMyeLiDLnsyI5Uhmxl5psuUXZGq
 OIQUMXM0SM6e5aEbwzHS27Cc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1d3d4c1ab1469a46;
	Tue, 20 Oct 2026 07:43:15 +0000
X-Mizu-Trace-ID: 1d3d4c1ab1469a46
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
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] KVM: arm64: Ensure TLBs and I-cache are private to each vCPU in pKVM
Date: Tue, 20 Oct 2026 08:43:11 +0100
Message-ID: <20261020074311.1873316-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
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

All vCPUs of a VM share its VMID, so KVM flushes a physical CPU's TLBs
and I-cache for the VM whenever a different vCPU of that VM is loaded
there. pKVM guests, protected or not, run on the hypervisor's stage-2
and VMID, and the host doesn't flush for them. Nothing at EL2 flushes
instead, so a vCPU can hit TLB and I-cache entries that another vCPU of
the same VM left on that CPU.

Track at EL2 the last vCPU of each VM loaded on each CPU, and flush
when it changes. EL2 can't allocate per-CPU memory for each VM, as the
host does, so use one per-CPU array indexed by the VM's table entry.
Reset the entry's slot on every CPU when a VM reserves it, so that a new
VM starts with no last vCPU, whether the entry is unused or was left by
a VM that was torn down.

Fixes: fce886a602073 ("KVM: arm64: Plumb the pKVM MMU in KVM")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
Changes since v1 [1]:
  - Dropped patch 1, which added a CPU number at EL2. The last vCPU is
    now tracked in a per-CPU array indexed by VM table entry. (Marc)
  - Moved the check from __pkvm_vcpu_load() to pkvm_load_hyp_vcpu().
  - The array is unsigned int, initialised to UINT_MAX. (Vincent)
  - Dropped Joey's Reviewed-by, since the patch changed.

Based on kvmarm/next (dd0bc00e3e920).

[1] https://lore.kernel.org/all/20261014125510.2928306-1-fuad.tabba@linux.dev/

 arch/arm64/kvm/hyp/nvhe/pkvm.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index ac020d0501d2e..1fc59229c8e86 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -38,6 +38,9 @@ unsigned int kvm_host_sve_max_vl;
  */
 static DEFINE_PER_CPU(struct pkvm_hyp_vcpu *, loaded_hyp_vcpu);
 
+/* Per VM table entry, the vcpu_idx of the last vCPU of that VM loaded on this CPU. */
+static DEFINE_PER_CPU(unsigned int, last_vcpu_ran[KVM_MAX_PVMS]);
+
 static void pkvm_vcpu_reset_hcr(struct kvm_vcpu *vcpu)
 {
 	vcpu->arch.hcr_el2 = HCR_GUEST_FLAGS;
@@ -261,6 +264,7 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
 {
 	struct pkvm_hyp_vcpu *hyp_vcpu = NULL;
 	struct pkvm_hyp_vm *hyp_vm;
+	unsigned int *last_ran;
 
 	/* Cannot load a new vcpu without putting the old one first. */
 	if (__this_cpu_read(loaded_hyp_vcpu))
@@ -290,8 +294,18 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
 unlock:
 	hyp_spin_unlock(&vm_table_lock);
 
-	if (hyp_vcpu)
-		__this_cpu_write(loaded_hyp_vcpu, hyp_vcpu);
+	if (!hyp_vcpu)
+		return NULL;
+
+	__this_cpu_write(loaded_hyp_vcpu, hyp_vcpu);
+
+	/* TLBs and I-cache are private to each vCPU, see vcpu_prepare_mmu(). */
+	last_ran = this_cpu_ptr(&last_vcpu_ran[vm_handle_to_idx(handle)]);
+	if (*last_ran != vcpu_idx) {
+		__kvm_flush_cpu_context(hyp_vcpu->vcpu.arch.hw_mmu);
+		*last_ran = vcpu_idx;
+	}
+
 	return hyp_vcpu;
 }
 
@@ -652,6 +666,7 @@ static int find_free_vm_table_entry(void)
  */
 static int allocate_vm_table_entry(void)
 {
+	unsigned int cpu;
 	int idx;
 
 	hyp_assert_lock_held(&vm_table_lock);
@@ -670,6 +685,9 @@ static int allocate_vm_table_entry(void)
 
 	vm_table[idx] = RESERVED_ENTRY;
 
+	for (cpu = 0; cpu < hyp_nr_cpus; cpu++)
+		per_cpu(last_vcpu_ran[idx], cpu) = UINT_MAX;
+
 	return idx;
 }
 

base-commit: dd0bc00e3e9201fd49b62ff9cc07890c89003afe
-- 
2.47.3

