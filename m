Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213169;
	b=EilekHmuLPP99tnYYG5ZlaFA/9tK6dqD0zRlLeBKiDR+a9pkArT8O2M3VFMuY3Tzmk3t
	 PflCKr5+oicSiLLqJVHIq5f9KAjlvZ9wuiFjBcVfTRC9K7QLLrJv9oVb8M2+ApQL6w7P4
	 gbdmMPfVkKb7DCWRMznUYCcP9AhTAYv1mq9gIJGwi1/gDcuqO+DQkaN5kTrDIDfJnT2tE
	 TCCbdgQFsRtUe7NlMw35zpVqHNv7opKHA35VjXRNwwWkPxojWF1sdpgU9rolAbmATyveJ
	 8Vw54A+vHz2Pu996uEyiL8TLwJoermw+LPeiGXp5gOstAN9ZWns0WJOMHkLVa/m/Wmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213169;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bo1WlELU8ik+Rr+Abdwa067G5JksNkxTfxKiETgF/pA=;
	b=gCs5WBcgiNOOYvd8F7HrmV2SJ6UNFEBe+A3YREn1aZ8xpPDCPDsSRg9lxn7ovAGFbhsq
	 o2YXK2fzObK0HZ7GSKcOmgFpOBfCyQ/8KBCSeU8dXYqcE9Duiz3bmieq8Fhp10psFn6D7
	 ad3omYRSXTNp5SXanZem39nFJ9tBmWqnhTODqLIjFTtkwQTbnb8cX9sV5MJ0BqsNpiPxh
	 dBiRVcyf5Kb8CXYBz9MZUNHL2sqh2Y2HIwWMUteuCG4SQc3B5k4YdsnB6cQUC3fUwTxTr
	 e6v25Y2qQ7v2CmGuX8pORZUg+UM3qAmvS7kyphCwGwrHqkmAMPZjvITunFFH1VzXbTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=S9jMCK95;
	arc=none smtp.remote-ip=91.218.175.218
Received: from mta0.migadu.com (out-218.mta0.migadu.com [91.218.175.218])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E554F606EEB6
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:32:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E554F606EEB6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=S9jMCK95
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=W7dlvw4NdcdYKD2+I77uCjjseY0CwzVUAyYBCfePwsI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794213166; v=1; x=1794817966;
 b=S9jMCK95QtcoMLf+7bXj5kUxvWLP+RKC3Y6fSEZhcv58cQDtKU+0kt+GkJkWHatYSbGK6KJg
 IlMykHYdMLqNAxO8qrnGq2hAky39aOsP1i4a8dvo1yfJClM/VQTaVgrJVJY2tDxyGad1qRxefYG
 LQn5WdLi51Kxu1L9Zo+JDv4k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 909104da5cd6237e;
	Mon, 09 Nov 2026 08:32:45 +0000
X-Mizu-Trace-ID: 909104da5cd6237e
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
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/16] KVM: arm64: Advertise AFP and RPRES to protected VMs
Date: Mon,  9 Nov 2026 08:32:02 +0000
Message-ID: <20261109083205.806619-14-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109083205.806619-1-fuad.tabba@linux.dev>
References: <20261109083205.806619-1-fuad.tabba@linux.dev>
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

Advertise FEAT_AFP and FEAT_RPRES to protected VMs. Both are controlled
through FPCR, which EL2 switches with the rest of the FP state.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 73ef47a8e687b..08805c7e4e5a7 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -169,6 +169,7 @@ static const struct pvm_ftr_bits pvmid_aa64mmfr1[] = {
 	MAX_FEAT(ID_AA64MMFR1_EL1, PAN, PAN3),
 	MAX_FEAT(ID_AA64MMFR1_EL1, SpecSEI, IMP),
 	MAX_FEAT(ID_AA64MMFR1_EL1, ETS, IMP),
+	MAX_FEAT(ID_AA64MMFR1_EL1, AFP, IMP),
 	MAX_FEAT(ID_AA64MMFR1_EL1, CMOW, IMP),
 	FEAT_END
 };
@@ -212,6 +213,7 @@ static const struct pvm_ftr_bits pvmid_aa64isar1[] = {
 };
 
 static const struct pvm_ftr_bits pvmid_aa64isar2[] = {
+	MAX_FEAT(ID_AA64ISAR2_EL1, RPRES, IMP),
 	MAX_FEAT_FUNC(ID_AA64ISAR2_EL1, GPA3, IMP, vm_has_ptrauth),
 	MAX_FEAT_FUNC(ID_AA64ISAR2_EL1, APA3, PAuth, vm_has_ptrauth),
 	MAX_FEAT(ID_AA64ISAR2_EL1, MOPS, IMP),
-- 
2.47.3

