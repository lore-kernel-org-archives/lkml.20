Received: from mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654DD4E9C00
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416085; cv=none; b=jwnE+jZGYq3ALalv87YSZSMBnODzBRsuXPAlJ7d3TGG3R6RoY9Os1qrz0T5ocQL/jTZBTkNGEHqoMtSR8NkEl9+KNLF92F2l2MprD4A21X70cfXVvopvc8yUm7wy6SBWfap2TYN2yZfgzqpuPYr42fH75F9I1lgOK0HITHdLQFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416085; c=relaxed/simple;
	bh=uakg/74zoXwi1Kx44nvRA0V20527TnJNQegACr4zriI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z3pwalhI0zob2IFI33prqRPw2WmZuCGxqtfHyK6ICygLQWB9CkPzWlWk9iW2a+2lK0vskLPK5uVJXO5EgZc+ttyV5XESlQA74styVu87+yCVuHAX9GkBK2bpKjXQSrnWRHT96XmkqqW+uy3ZBZnAjfH7BNDnVhDCfD+FOfmkI6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Qq67mSZj; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Qq67mSZj"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=uakg/74zoXwi1Kx44nvRA0V20527TnJNQegACr4zriI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792416081; v=1; x=1793020881;
 b=Qq67mSZjFBO4A1r0jVoSh6zHZHaFTU1O2RjZ0sdXpZrGOpq0gazfoSDxcHuLkdLUZThpD9uk
 95R+UxFMcFLNFUAEF3/xdfH5rc3H7O5rpLI5yimthe4Pz167fTAsyxbkB8ECqW4HIbd4AXVfj5J
 wA4YzA0Whnnw4ZuAe52c8lCY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b0f93a7c611f8a5d;
	Mon, 19 Oct 2026 13:21:20 +0000
X-Mizu-Trace-ID: b0f93a7c611f8a5d
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
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] KVM: arm64: Sanitise MTE tags when a permission fault installs a mapping
Date: Mon, 19 Oct 2026 14:21:03 +0100
Message-ID: <20261019132103.3836646-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019132103.3836646-1-fuad.tabba@linux.dev>
References: <20261019132103.3836646-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 48a08b608ea72..208fcae80f67f 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2005,7 +2005,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
 	if (s2fd->nested)
 		*prot = adjust_nested_exec_perms(kvm, s2fd->nested, *prot);
 
-	if (!kvm_s2_fault_is_perm(s2fd) && !s2vi->map_non_cacheable && kvm_has_mte(kvm)) {
+	if (!s2vi->map_non_cacheable && kvm_has_mte(kvm)) {
 		/* Check the VMM hasn't introduced a new disallowed VMA */
 		if (!s2vi->mte_allowed)
 			return -EFAULT;
@@ -2060,7 +2060,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
 		}
 	}
 
-	if (!perm_fault_granule && !s2vi->map_non_cacheable && kvm_has_mte(kvm))
+	if (mapping_size != perm_fault_granule && !s2vi->map_non_cacheable && kvm_has_mte(kvm))
 		sanitise_mte_tags(kvm, pfn, mapping_size);
 
 	/*
-- 
2.47.3

