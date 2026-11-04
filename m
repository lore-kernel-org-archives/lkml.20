Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782146;
	b=uzbzgXPCHC6cgifVWAJXepGeRVi6rYXFQEiOCs+aiWH+sTYx5Y7gLQ9s8B+c9t6atTS9
	 74cC2feP11Ykq4uuRnx+Ox1emkclmtG9mMs3rfm0mwUEZtz05K4QHLp222T69se4xrpIR
	 h24J9Rrmjg3dGSFV7sRvha++27VPESVJNb0ftjmvs/JZGGAltapv9H2iKDKeZjHn+oghf
	 Hir8R3oig7+GseQuO+DhIh1Oud/YUKRsKclFtLMIyk96oLwr46OzCbgR2enB+j3jXJ1j/
	 hmMM7eikc47zf1qZ9D9iqmYa0H8FoUCgU3/n1/6VbDa5ZiGVzdzwmPdFuOZFcYLcHLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782146;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AfXeCeneHqNmuixn/C9DCjk2UEGT5HCCQsR07Fy0vVk=;
	b=eF54eABc8s12Jjxorlm5IL9qt6ftTFOv9AdOLNymTVzXpN3I2yuIwp+6iUnGpBF9StNG
	 IKW2Mpbe9lriEtxCaWyMw2GOl+KqyDuFG86XqvlsdWlVht5933e4tsdK8d45Gvu/3uQm6
	 pY69QL/0cEROYkEwhC3WGnVn7lJ6W4CtVMDrjlUE/wFH6cpTJmqXE6/BVu5xWrodW5dxY
	 q+iQ10zuZm4rivwDZAxaWxh5p98KjLskXSYIqcJBVXLKQETUQNA43QgEDetmOXqc9mYPE
	 xCoaqwV75PvvAu6vmNnNsrSv4E5aNyfipnQ5Z1lUqJYzWN9uSrP6TWvhFGVi+/PWW5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=C7a+11ac;
	arc=none smtp.remote-ip=91.218.175.232
Received: from mta0.migadu.com (out-232.mta0.migadu.com [91.218.175.232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08469606A33A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08469606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=C7a+11ac
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RoNzd28AyvTb0ibr+4xItgKDPl/EqyvaBO8VS7dD1Vo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793782143; v=1; x=1794386943;
 b=C7a+11ackZbgb+aoeqHxTKr2NqhHLNB+/SjhmaHu354feBrAsEBVQLXff0fhSWuJPcfdnXKM
 tGnZqanlKkLCV28wwDjpMaPHmMLvaqFd8rXmFG4sBQhJzhrJdpmcv2VM5ld1eAN6PbqWyD7BKwc
 HmsLhb6y+tkmMaZMvNPHZ+Lc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0936b15fc4cf6f51;
	Wed, 04 Nov 2026 08:49:03 +0000
X-Mizu-Trace-ID: 0936b15fc4cf6f51
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/16] KVM: selftests: Export the ucall pool's guest physical address
Date: Wed,  4 Nov 2026 08:48:30 +0000
Message-ID: <20261104084842.132944-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104084842.132944-1-fuad.tabba@linux.dev>
References: <20261104084842.132944-1-fuad.tabba@linux.dev>
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

A protected guest's memory is private until the guest itself shares it,
so the guest has to share the ucall pool before its first ucall. The
host can't do that for it. Only the guest's copy of ucall_pool holds the
pool's address.

Add get_ucall_pool_gpa(), which reads that copy, so that the host can
pass the address to the guest.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 tools/testing/selftests/kvm/include/ucall_common.h | 1 +
 tools/testing/selftests/kvm/lib/ucall_common.c     | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/ucall_common.h b/tools/testing/selftests/kvm/include/ucall_common.h
index cbdcb0a50c4f9..3a6cdf9aa0464 100644
--- a/tools/testing/selftests/kvm/include/ucall_common.h
+++ b/tools/testing/selftests/kvm/include/ucall_common.h
@@ -41,6 +41,7 @@ __printf(5, 6) void ucall_assert(u64 cmd, const char *exp,
 u64 get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc);
 void ucall_init(struct kvm_vm *vm, gpa_t mmio_gpa);
 int ucall_nr_pages_required(u64 page_size);
+gpa_t get_ucall_pool_gpa(struct kvm_vm *vm);
 
 /*
  * Perform userspace call without any associated data.  This bare call avoids
diff --git a/tools/testing/selftests/kvm/lib/ucall_common.c b/tools/testing/selftests/kvm/lib/ucall_common.c
index 029ce21f9f2fa..aa1f0f92c6d1d 100644
--- a/tools/testing/selftests/kvm/lib/ucall_common.c
+++ b/tools/testing/selftests/kvm/lib/ucall_common.c
@@ -21,10 +21,17 @@ int ucall_nr_pages_required(u64 page_size)
 
 /*
  * ucall_pool holds per-VM values (global data is duplicated by each VM), it
- * must not be accessed from host code.
+ * must not be accessed from host code. The host reads only a VM's copy.
  */
 static struct ucall_header *ucall_pool;
 
+gpa_t get_ucall_pool_gpa(struct kvm_vm *vm)
+{
+	struct ucall_header **pool = addr_gva2hva(vm, (gva_t)&ucall_pool);
+
+	return addr_gva2gpa(vm, (gva_t)*pool);
+}
+
 void ucall_init(struct kvm_vm *vm, gpa_t mmio_gpa)
 {
 	struct ucall_header *hdr;
-- 
2.47.3

