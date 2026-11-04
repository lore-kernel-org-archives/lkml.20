Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796296;
	b=dBGXh/mmvu416T1CrfEaDk0DJEqXOH8nyhKMvj6nPe0CsKQuiyLbGR8zPtZfY6BEOFiq
	 8Rp4Jy8QqQ/8K9wGyjcXlYl1JoKztWA2D4hgArpK06JF17CX4pv6+4X0yTuh+TUiML2Am
	 4vfqYRrBL/OUinzNBsTzfYz0DqAQxq58E1FpnYWz6WUuhAJnBt0foFBzHfuAy+qNy+JDA
	 NVbpmQvkEzkTcW26vvSeTzUkY5EQV1nua31UI4D+oVxApizmWlJjyZtj0qEb6S8rparh4
	 8lnti+spbVwdhHd+6gn8oMM90dx4GSkJ7l5wu0WxvXV5rJl9+vZpr/kzBhL8Jdq8wUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796296;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=txtaZAcRMKdG/6PvTtOqQBPubj70UFKtaDsquMMzFvw=;
	b=0FVkNhAnecQjz/UXIxD8bQtX2RvkpWRucAQAu8B3WWN+s6JrIzAsgPlDVlWHymzxqFRi
	 INPKF43UR/Fg3uaY/2mcB9Xs+545KERYWTD5LfznWaYZt2XdOsihShWiT3W3GYtFKz9mt
	 m/NWjqrWCAJi/f4eaKiQIz7Nr/5zCE65npfrz6KfZfsS066YrBruUCb9JDFkYPRzjuovT
	 it++p4hv4FDaHbaBYguGXaWrIOb0xXumT+woKRHi/UM8jpdDx68jsGjmotn29FcXVa/Ob
	 V/LU7LVS+Mz9zLq2VgPDTD+PtnETN49cPSekdfjmxB+aNZ2uK//jHAXz3gFSNUAa5HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LJ4IguBc;
	arc=none smtp.remote-ip=95.215.58.151
Received: from mta1.migadu.com (out-151.mta1.migadu.com [95.215.58.151])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56AC606A336
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D56AC606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LJ4IguBc
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QEva7TCaSMpCjlP1oVH5gOdE6FBEUp30xJbq+yDM/Y0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793796293; v=1; x=1794401093;
 b=LJ4IguBc02zgkRjzp5f0Z2EurZt1jYdFb4ffyLRG9VK5ObfCDxQmBNZ2sUzTo8FIKWyfVdTu
 PQC4fr/4DSYkvOhK/Z4GINxzS/4ERWdXxAJYErs274q7t5B98uuUPLW14xLy7VgoRC04ty/bb/X
 XPfPZw8jc1nq4G1k6QrYdaVA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 05ef130eda10926c;
	Wed, 04 Nov 2026 12:44:53 +0000
X-Mizu-Trace-ID: 05ef130eda10926c
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
Subject: [PATCH v2 2/2] KVM: arm64: Resume a pKVM stage-2 teardown at the next mapping
Date: Wed,  4 Nov 2026 12:44:51 +0000
Message-ID: <20261104124451.2148724-3-fuad.tabba@linux.dev>
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

pKVM keeps a VM's stage-2 mappings in an interval tree, and
pkvm_pgtable_stage2_destroy_range() releases the ones in its range.
stage2_destroy_range() still calls it for every block-sized chunk of the
IPA space. As pKVM gives every VM the host's IPA limit, a teardown with
LPA2 makes 2^27 calls with 16K pages (2^22 with 4K), however little the
VM maps.

Return the address of the next mapping instead, or U64_MAX when none is
left, so that the teardown skips the space between mappings. No mapping
crosses a chunk boundary, as pKVM maps at most PMD_SIZE, so the next one
starts at or above the end of the range. A VM without a handle doesn't
have anything mapped, so return U64_MAX for it straight away.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/pkvm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index f21c3326dda68..77315c83c61b3 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -504,9 +504,10 @@ u64 pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
 	pkvm_handle_t handle = kvm->arch.pkvm.handle;
+	struct pkvm_mapping *mapping;
 
 	if (!handle)
-		return addr + size;
+		return U64_MAX;
 
 	if (pkvm_hyp_vm_is_created(kvm) && !kvm->arch.pkvm.is_dying) {
 		WARN_ON(kvm_call_hyp_nvhe(__pkvm_start_teardown_vm, handle));
@@ -518,7 +519,10 @@ u64 pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
 	else
 		__pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
 
-	return addr + size;
+	/* Mappings left by a failed release are still in the tree, so look past the range. */
+	mapping = pkvm_mapping_iter_first(&pgt->pkvm_mappings, addr + size, U64_MAX);
+
+	return mapping ? gfn_to_gpa(mapping->gfn) : U64_MAX;
 }
 
 void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
-- 
2.47.3

