Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.237
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580838;
	b=qggSGCmdHbjbfX/qAOkSRTOB458swMOK/RMvWne5PUU9/jiCCfzBLj5M60FmCXl6ONQz
	 6Rdjvcmu/moOHQYnJx96T4CApvsjDiCqQFuCob7o5q7+k0chjDO+ledTM0Rk1vO71ha61
	 jDZTZsWW5YAQqSUlgRywZ9GkHZvEf7c8Irjj+tFc/zVGltDafvUvs1iCOcOxyqy1EEfBY
	 FVCJ3jCdJd51wAXJn6+ygKDciRWuelzvFKcWEFfs06i0g4IjTZXpYzH2vu4EaijCBQLUd
	 6o4ldyDadgbv41tQBwjND0Gr3tiEloB3xTAiM8xCkaTfbg6m5A7a1Dk3zQR+mcw2FhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580838;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lfJEvxeugzbMy0UfOmSFFKEhA+PewXL6rgmJ57d1BGY=;
	b=tYMQjTfgwdU6pG6nETuvQwKkl1A453Q/QS61R2GqLkR9ACnza7rFPckX3C9m2ThpmWgb
	 +AWTtCCW/j43hbL7OYgz2Fg2eXvbOmlaBxNtSoIAJhvQ0ZZF+XSw0/qIQhwgotzPRm+ym
	 FFtTJIR6Fn8kDpP3owSQu4tfqSpbw1oXuOOEoribjzozYJbQG7CO1lmTTf5ZK9YqmC/I6
	 uzD6+y4tdII6jIMQlCAiEB05nbGqx7iKKFw4udW0yurKEDQzVm4IP+YyjJlaCY4e5Qs8e
	 w4vpeqMH7j/kCz4niVKZSk5mnucjeo1bkQMe+W6JoUSpcxKoMS7CrhA3NnsHVDho4qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IaPriw5B;
	arc=none smtp.remote-ip=95.215.58.237
Received: from mta1.migadu.com (out-237.mta1.migadu.com [95.215.58.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21E9606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D21E9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IaPriw5B
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Pju20CFh13puHUYFtOtzpLfsAN18NYvnMP/ZNBnwsKA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792580835; v=1; x=1793185635;
 b=IaPriw5BfVW9gEFnfu3PD1FlyMHM7/f5hFkSqPNok+4ccVfzjeGnnljf3cWCQ42NgoyUsyAt
 gp/yB1hle05hRGXFYpea6yXauJn80ffXE8lc7gC8wmumH/FnLLfjqAerP/OeDCHm7n/ZN7+ZNQV
 rcOnP8dbHEujL7l3+4lYlZ/U=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2cc7fc73b5d6669d;
	Wed, 21 Oct 2026 11:07:15 +0000
X-Mizu-Trace-ID: 2cc7fc73b5d6669d
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
	Steven Price <steven.price@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] KVM: arm64: Sanitise MTE tags when a permission fault installs a mapping
Date: Wed, 21 Oct 2026 12:06:59 +0100
Message-ID: <20261021110700.493315-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110700.493315-1-fuad.tabba@linux.dev>
References: <20261021110700.493315-1-fuad.tabba@linux.dev>
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

The stage-2 fault path sanitises MTE tags only on translation faults, as
a permission fault normally just relaxes an existing leaf. However, when
the page is backed by a THP, a permission fault at page granule installs
a block whose other pages may never have been mapped or sanitised. Once
dirty logging is off, a guest write to a page mapped read-only during
logging installs the block, and the guest can read the tags those pages'
previous owners left.

Sanitise whenever the fault path calls kvm_pgtable_stage2_map() rather
than relaxing permissions. If the VMM replaces the VMA after the guest
takes a permission fault but before vma_lookup(), that path would map
and sanitise memory from the new VMA without checking it. Run the
VM_MTE_ALLOWED check in kvm_s2_fault_compute_prot() on permission
faults too.

Fixes: ea7fc1bb1cd1b ("KVM: arm64: Introduce MTE VM feature")
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/mmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index a551b6bb13c21..6e10aa9913d71 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2004,7 +2004,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 	if (s2fd->nested)
 		*prot = adjust_nested_exec_perms(kvm, s2fd->nested, *prot);
 
-	if (!kvm_s2_fault_is_perm(s2fd) && !s2vi->map_non_cacheable && kvm_has_mte(kvm)) {
+	if (!s2vi->map_non_cacheable && kvm_has_mte(kvm)) {
 		/* Check the VMM hasn't introduced a new disallowed VMA */
 		if (!s2vi->mte_allowed)
 			return -EFAULT;
@@ -2059,9 +2059,6 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 		}
 	}
 
-	if (!perm_fault_granule && !s2vi->map_non_cacheable && kvm_has_mte(kvm))
-		sanitise_mte_tags(kvm, pfn, mapping_size);
-
 	/*
 	 * Under the premise of getting a FSC_PERM fault, we just need to relax
 	 * permissions only if mapping_size equals perm_fault_granule. Otherwise,
@@ -2076,6 +2073,9 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, gfn_to_gpa(gfn),
 								 prot, flags);
 	} else {
+		if (!s2vi->map_non_cacheable && kvm_has_mte(kvm))
+			sanitise_mte_tags(kvm, pfn, mapping_size);
+
 		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, gfn_to_gpa(gfn), mapping_size,
 							 __pfn_to_phys(pfn), prot,
 							 memcache, flags);
-- 
2.47.3

