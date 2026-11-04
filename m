Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.143
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796296;
	b=asZvW6PKD4rjuzmyi2Zk3axh4qQVRHn5TZGM7HLq6KGa3YqCyG+V9HfHq2tojPDLJiJl
	 IwzFltGtuLIhOFrYkrjr0mu8fy4KOYNlyca+wMHUD2uQRYMHCxJGE2dRxe5Y+aBlmyiuL
	 8h+pdOrH6Uxpv2D4KSl3IJZe+SYMqqTeFWr2yHUpf7yUimMkbc199wHR3+UiHG91AcqQ0
	 H8wyWIus8ywATn70rwk2xwuGjWkwt9R9oEveIkxYRwyg9oLDPKHh9IQKZV+mVr7LHd7Eg
	 fKSbxhHqEC6LCBq7z7ay8pCxoXGW4m4WFSlFXewqb6SBz23Y7FpupzkVw+NeGnJbOCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796296;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AOH3Su8TZJSoK9UPHpeuwIAfG494iGEabcz+aB8amog=;
	b=NNMSdyprhihpg9sgs3RxjOCrbaIjzR+WiUIf+th9s7ylMXaHfVI1PisCi8qkyfHxgzrC
	 93WQrARnU1+y/tLdc6n4cO5ju/jxyE7sC+k28dTnlBuxABO6mcO+WToPURJJOoFWIO7cs
	 YVOVTTVsnIIEaCQEuF2IDXa1l2tb+gMxwkbNUtqc6/+8K9ftOpN6d0UkHC0+RXvSs/c4e
	 7YV7eeff1fIyMsRKrxUWpTIVJy7fgV2IrF+JHIhcEbm6fVlaXnzBlpHxBoO6sDH+blsqW
	 b5SZqvbGtociXOu8ieCrLaCqiRX2wkxkQ5KEq0aZNkeNY2haJsl+WD7kp74fVCj1EiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QylGKXh7;
	arc=none smtp.remote-ip=95.215.58.143
Received: from mta1.migadu.com (out-143.mta1.migadu.com [95.215.58.143])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D68606A335
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00D68606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QylGKXh7
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MxRHPNAABvoNmLp9OTJVcSokfGwwqtsziGyV/1PffQk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793796293; v=1; x=1794401093;
 b=QylGKXh7uruaLMMEMoxZ64DR/6WRHSeRr9NW0qyTOuBE10TrPTF2dySKAaKqBH8OXK9T5lgW
 JuVyld+yb+3T7O/1JiDm1nj1jAxQHg1Yx+8Ir/sF6OYZ8nchI3kbHqN0Ed71GeYVXqwp3PGSJvU
 Px8botegn2j4AGcqtjnNkmgM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fec1c38f76d92ee4;
	Wed, 04 Nov 2026 12:44:53 +0000
X-Mizu-Trace-ID: fec1c38f76d92ee4
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 1/2] KVM: arm64: Resume stage-2 teardown where the walk stopped
Date: Wed,  4 Nov 2026 12:44:50 +0000
Message-ID: <20261104124451.2148724-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104124451.2148724-1-fuad.tabba@linux.dev>
References: <20261104124451.2148724-1-fuad.tabba@linux.dev>
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

Since commit 4ddfab5436b6 ("KVM: arm64: Reschedule as needed when
destroying the stage-2 page-tables"), kvm_stage2_destroy() walks the
IPA space one block-sized chunk at a time. The walker steps over an
invalid entry in one go, but the next walk starts at the following
chunk, so an invalid entry larger than a chunk is visited once for every
chunk it covers. Destroying a VM with a 52-bit IPA then takes 2^27 walks
with 16K pages (2^22 with 4K), however little it maps.

Have kvm_pgtable_stage2_destroy_range() return the address its walk
reached, which kvm_pgtable_walk() doesn't expose, and resume from there.
pkvm_pgtable_stage2_destroy_range() returns the end of its range, and
EL2's kvm_pgtable_stage2_destroy() ignores the value.

Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Suggested-by: Oliver Upton <oupton@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_pgtable.h |  8 ++++++--
 arch/arm64/include/asm/kvm_pkvm.h    |  4 ++--
 arch/arm64/kvm/hyp/pgtable.c         | 15 ++++++++++++---
 arch/arm64/kvm/mmu.c                 |  4 ++--
 arch/arm64/kvm/pkvm.c                |  8 +++++---
 5 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 1c9c57cd6ae40..20b988e99e074 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -599,9 +599,13 @@ void kvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt);
  *
  * The page-table is assumed to be unreachable by any hardware walkers prior
  * to freeing and therefore no TLB invalidation is performed.
+ *
+ * Return: the address the walk reached, which can be past @addr + @size
+ * when the range ends within a block or an invalid entry, or @addr + @size
+ * if the walk fails.
  */
-void kvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
-					u64 addr, u64 size);
+u64 kvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
+				     u64 addr, u64 size);
 
 /**
  * kvm_pgtable_stage2_destroy_pgd() - Destroy the PGD of guest stage-2 page-table.
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index fd042d2b54624..731632aa24520 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -349,8 +349,8 @@ int __pkvm_handle_smccc_req(struct arm_smccc_res *res);
 
 int pkvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
 			     struct kvm_pgtable_mm_ops *mm_ops);
-void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
-					u64 addr, u64 size);
+u64 pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
+				      u64 addr, u64 size);
 void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt);
 int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size, u64 phys,
 			    enum kvm_pgtable_prot prot, void *mc,
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 9c83837b184d3..6bb1c0beb4dcc 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1653,16 +1653,25 @@ static int stage2_free_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	}
 }
 
-void kvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
-				       u64 addr, u64 size)
+u64 kvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
+				     u64 addr, u64 size)
 {
 	struct kvm_pgtable_walker walker = {
 		.cb	= stage2_free_walker,
 		.flags	= KVM_PGTABLE_WALK_LEAF |
 			  KVM_PGTABLE_WALK_TABLE_POST,
 	};
+	struct kvm_pgtable_walk_data data = {
+		.walker	= &walker,
+		.start	= addr,
+		.addr	= addr,
+		.end	= addr + size,
+	};
 
-	WARN_ON(kvm_pgtable_walk(pgt, addr, size, &walker));
+	if (WARN_ON(_kvm_pgtable_walk(pgt, &data)))
+		return addr + size;
+
+	return data.addr;
 }
 
 void kvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1db10d8d6db73..4f1adadeffb8b 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1011,8 +1011,8 @@ static void stage2_destroy_range(struct kvm_pgtable *pgt, phys_addr_t addr,
 
 	do {
 		next = stage2_range_addr_end(addr, end);
-		KVM_PGT_FN(kvm_pgtable_stage2_destroy_range)(pgt, addr,
-							     next - addr);
+		next = KVM_PGT_FN(kvm_pgtable_stage2_destroy_range)(pgt, addr, next - addr);
+		next = min(next, end);
 		if (next != end)
 			cond_resched();
 	} while (addr = next, addr != end);
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 016997288fd23..f21c3326dda68 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -499,14 +499,14 @@ static int __pkvm_pgtable_stage2_unshare(struct kvm_pgtable *pgt, u64 start, u64
 	return 0;
 }
 
-void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
-					u64 addr, u64 size)
+u64 pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
+				      u64 addr, u64 size)
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
 	pkvm_handle_t handle = kvm->arch.pkvm.handle;
 
 	if (!handle)
-		return;
+		return addr + size;
 
 	if (pkvm_hyp_vm_is_created(kvm) && !kvm->arch.pkvm.is_dying) {
 		WARN_ON(kvm_call_hyp_nvhe(__pkvm_start_teardown_vm, handle));
@@ -517,6 +517,8 @@ void pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
 		__pkvm_pgtable_stage2_reclaim(pgt, addr, addr + size);
 	else
 		__pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
+
+	return addr + size;
 }
 
 void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
-- 
2.47.3

