Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971812;
	b=VPYmRveBJfJ6OqnespYdg58aMNeWKMci0dYB/nRX5oUKMIpH5rWgnw0y9lCT6MLfIaJL
	 TwPRoGzbgE97BLN43UXx8BIJ4z2WUMcO8ZGABABgfpR/nyXw23vFBzbqCvYgaR4JCrC8/
	 oljJi4u/KJFXjDXbgNe77yocokI/zJlCXHiCUH69/Eyz0HXYTh9LpTkLFFcrKfmZVPNAd
	 i4OVzDV6lau/VydWb8dFa6/kkDDnO88PVnpXzvfUczLqYiDCcD+dOGlXoigGkWYsBJowV
	 TJjwI1jbHLbz3aiSUMd+jyUi8MaqMTKdsFenHm4sHPQgVJaCadyH2VLLLheEROFLhUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971812;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e/3XraEN+4mKAfyytUe7hFO8nk3KHRIKouz+zhkXDN0=;
	b=gtkQhJNsMLVPl2qCKgayHRbBsGpzs1eWrSSlU+AkIu8zzpsKw/PP9vIJYkHw1TlXvwfJ
	 W80m4o6MM2ZNdfRaoUwnWqE7KmnDWwEn1wj6Az0oDZd1BWKx9HUhfCexmTeXdrHS4XCS2
	 Z5eO0hvplhwXKUM85FlCAML55XCWiXxiHLO76rbowHQlWvfnQouuB4G9XXH7l+S0GmGry
	 QC88GRsjlmojkRHPQtLyXM4Jl3StBY+gb3qMsjjluwDYBHdZD2S2/3YF+H+rzP0RowqD5
	 yxkv4BpSTPL+B9RO83Ly8vfRDZMRBNwJ+f6lBQ7NBY/whj3UwSK5rFmAQB3XSf+WQVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XN36poyH;
	arc=none smtp.remote-ip=91.218.175.99
Received: from mta0.migadu.com (out-99.mta0.migadu.com [91.218.175.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15450606A331
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15450606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XN36poyH
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=n4Vsow1U4/zPQT8BxxJgvfPhA9r/J78hKay9DbA/hws=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793971808; v=1; x=1794576608;
 b=XN36poyHustH0MlLVgJjXZJY36PK5Gt1ynzAroBdRznA0OKgtvf3zjkFWf42BQx8BDrA+Lrs
 Ow9mVDR8pw8AytTAbYHfi+CytMkJvgYEMza3tUep7pUU++ky2ddpoxZXJC4pPZLlsdVWsFznv/A
 rkFpCDxVanGpoRtHkiItslXo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f286758a8028908b;
	Fri, 06 Nov 2026 13:30:08 +0000
X-Mizu-Trace-ID: f286758a8028908b
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
	Wei-Lin Chang <weilin.chang@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v3 2/2] KVM: arm64: Resume a pKVM stage-2 teardown at the next mapping
Date: Fri,  6 Nov 2026 13:30:00 +0000
Message-ID: <20261106133000.453240-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106133000.453240-1-fuad.tabba@linux.dev>
References: <20261106133000.453240-1-fuad.tabba@linux.dev>
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

Return the address of the next mapping instead, or S64_MAX when none is
left (U64_MAX would read as an error), so that the teardown skips the
space between mappings. No mapping crosses a chunk boundary, as pKVM
maps at most PMD_SIZE, so the next one starts at or above the end of the
range. A VM without a handle doesn't have anything mapped, so return
S64_MAX for it straight away.

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/pkvm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index d0a6308008512..ef36875e25610 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -504,9 +504,10 @@ s64 pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
 	pkvm_handle_t handle = kvm->arch.pkvm.handle;
+	struct pkvm_mapping *mapping;
 
 	if (!handle)
-		return addr + size;
+		return S64_MAX;
 
 	if (pkvm_hyp_vm_is_created(kvm) && !kvm->arch.pkvm.is_dying) {
 		WARN_ON(kvm_call_hyp_nvhe(__pkvm_start_teardown_vm, handle));
@@ -518,7 +519,9 @@ s64 pkvm_pgtable_stage2_destroy_range(struct kvm_pgtable *pgt,
 	else
 		__pkvm_pgtable_stage2_unshare(pgt, addr, addr + size);
 
-	return addr + size;
+	mapping = pkvm_mapping_iter_first(&pgt->pkvm_mappings, addr + size, U64_MAX);
+
+	return mapping ? gfn_to_gpa(mapping->gfn) : S64_MAX;
 }
 
 void pkvm_pgtable_stage2_destroy_pgd(struct kvm_pgtable *pgt)
-- 
2.47.3

