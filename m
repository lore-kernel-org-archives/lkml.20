Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025887;
	b=HAogm89QgdR68GJBaY1I/St4E1c9kYW+y0UQTB93qLRpoumR/ogDURfE/LxjJ+/PrBnF
	 bZEW1x5ycMOpmvpmSbPreewN0pk8OvmZmd2qKEAXAJFbyRw2NOoWHYiS57Q6Z2ghva6Qy
	 WU0adjnAEBj2iaHn/p+6jC53jnarw8tR6DecpLdlfAc9kov83j3MBE+Hs2XH7HQYNCsbi
	 /anwfC3+zNKUntZl3xF3UWDjjCZ2znL0K3jDkctASYLYpSe1tFAN709zzdeHxPrJglpbM
	 wVTFmi5z+nsy3hw69Cejx3xzJNrtkAcI66im+6jq5vGHALXtciJ23bmu1CRMQBqx7Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025887;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=CssD/LAYwVkYuy5yMkAUe/+D+tcxyS7rOxl3Jzz2dMk=;
	b=ayJvzkbe/ZvqrIXBMzXC3t9vlEIOgBjjnskeJEP7Ts6F24eZE155ghZxozabZyaDAIE+
	 uG0ZIMgi/BoSefDPs9GBiUKMQt8whjYQ/iTm3HVVzBE/OXIWKUJaL9JbsVG5n3lMhMfIl
	 SeJ6NybPBo5zQHAbrhvJHAKM1b2lDwo9obM+7mGFls1R1MeJfIKcpkN0SRlChZweD+IVU
	 +MmviQiUpGNq5CA3t+kS61Bs7vsEGM2RssQZaYZpDjkcdnHipZR5+8NhIQR5TJuEFWFHh
	 XYbBekUkNG9ei6UVW7kSBCQdiQEYXFw428pkkH2AbU4RWwy1O+wRUvyAvE/CkUjOSow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=T4l57WYP;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91DC606A329
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C91DC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=T4l57WYP
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A698293B;
	Mon, 26 Oct 2026 07:44:43 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3126D3F7B4;
	Mon, 26 Oct 2026 07:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793025886; bh=fOsPjMCjhwurDmtr1XUkQ7PqX4RJ1KoomAWKFH0UkYc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T4l57WYPvhYHcb1lMYIVy9fATlStKpRHDO8us7XmeLK+AdKsY1FjoVKcQew9aYY6g
	 F8+/SMtumpwNPal9dC6alr+E1tx+brEtGtdfZQOqvMQ73e0oGGJ6P5hK1zcXNJqDa2
	 TBT8KzRa6W5pmU/i7oF/trF+e8fNHcqn93+kAwu0=
From: Leonardo Bras <leo.bras@arm.com>
To: Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Tian Zheng <zhengtian10@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 2/3] KVM: arm64: Introduce a dedicated walker for stage2 write-protect
Date: Mon, 26 Oct 2026 14:44:08 +0000
Message-ID: <20261026144413.441566-3-leo.bras@arm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026144413.441566-1-leo.bras@arm.com>
References: <20261026144413.441566-1-leo.bras@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1953; i=leo.bras@arm.com; h=from:subject; bh=fOsPjMCjhwurDmtr1XUkQ7PqX4RJ1KoomAWKFH0UkYc=; b=owGbwMvMwCX2pizjszvTwvWMp9WSGLLup1uIes79uO9v+P2Jq03WGhSd/LRimkeXkpjcTRYX7 RnWJtyHO0pZGMS4GGTFFFlkH81fxfN9SsaRKz8WwMxhZQIZwsDFKQAT+bWVkWHB9b2LA99/PbDr u5ko9zy2z/dUMz6VWwtvY3fhqCj82bqOkeFri2nw7vf6579fDsqX1tuzgS+jWd+slXPj9B3b7Ld H/+QGAA==
X-Developer-Key: i=leo.bras@arm.com; a=openpgp; fpr=36E6C95AE0F111CC5B6F4D2E688C33F8A0C5B0C5
Content-Transfer-Encoding: 8bit

When write-protecting a range, clean the writable bit (S2AP[1]) and keep
the DBM bit set for pages, so on HDBSS-enabled systems we can skip the
fault for making it writable again.

On block entries clean both the writable bit and the DBM bit, so we fault
even on HDBSS-enabled systems, in order to have hugepage splitting.

With disabled HDBSS, there should be no change in faulting behavior.

Signed-off-by: Leonardo Bras <leo.bras@arm.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 8c2320c6a7f1..837546be5c13 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1283,17 +1283,34 @@ static int stage2_update_leaf_attrs(struct kvm_pgtable *pgt, u64 addr,
 	if (level)
 		*level = data.level;
 	return 0;
 }
 
+static int stage2_wrprotect_walker(const struct kvm_pgtable_visit_ctx *ctx,
+				   enum kvm_pgtable_walk_flags visit)
+{
+	kvm_pte_t new = ctx->old & ~KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W;
+
+	/* We remove DBM on blocks so they can fault and get split */
+	if (ctx->level < KVM_PGTABLE_LAST_LEVEL)
+		new &= ~KVM_PTE_LEAF_ATTR_HI_S2_DBM;
+
+	if (kvm_pte_valid(ctx->old) && ctx->old != new)
+		WRITE_ONCE(*ctx->ptep, new);
+
+	return 0;
+}
+
+
 int kvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
 {
-	return stage2_update_leaf_attrs(pgt, addr, size, 0,
-					KVM_PTE_LEAF_ATTR_HI_S2_DBM |
-					KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W,
-					NULL, NULL,
-					KVM_PGTABLE_WALK_IGNORE_EAGAIN);
+	struct kvm_pgtable_walker walker = {
+		.cb	= stage2_wrprotect_walker,
+		.flags	= KVM_PGTABLE_WALK_LEAF,
+	};
+
+	return kvm_pgtable_walk(pgt, addr, size, &walker);
 }
 
 void kvm_pgtable_stage2_mkyoung(struct kvm_pgtable *pgt, u64 addr,
 				enum kvm_pgtable_walk_flags flags)
 {
-- 
2.56.0

