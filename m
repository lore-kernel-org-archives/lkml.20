Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663408;
	b=Vj08MEs1RdezL1EzT9pPjvpdMJZsDn2AGUgDdHiRDBY9MswuDNseKn63qPR1yyU+CJRy
	 zM7Q9rpErM42QMr9/SI0x5e69cP9fJFsADW+9YunZHAIBSoRHXr7Ob0wQdn0RzOopzfHk
	 H4JGck7yEtrl/QInfZtFboOmB2d5fnaQycfOa2A8DXJ5cZo0+x2uNRebGVU5Tdx0UUOfs
	 8i0yQ1MyII8IXwDYRFpQ5+MpNGcfsPAnD+YCmV8eGCczMcLQDtw6fVbZoGj9bzRBBNnds
	 mSnOtATjXqW6g3Qo1MoBoJxHcr6oI2h6kdBq3vFS4X9UihU+V03w1e/vDj1rOrg27DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663408;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=tytNRA2x/cdXQgb+WGb9wUkqID3jyg9++uqej4viFWA=;
	b=C1IU4zWLBPoT1F6gMsphAyu04NV35+87sV5NalW4P2EEnXBdOxL4wQA8pQxakMed6Fyb
	 G9GWtfLmIjq+Goidu59BxGiltQSKiH0k5C2XU2cyj340hDa7f1zMt0yR8wl32a5eqt0We
	 ikOvpeZ+rRCea2FITCWBpENk4tSxdIV7pLihbSWTToXNCIN+IhN96WSRRef2nienE/IWm
	 l5cfcV6iLULV5jtXo9vzCM9wb0xcveiJwBb4e3cIJ9sEYt+m3bAI90WYwGfKCvEbAkalx
	 eI51YPbSA5HjvSGLcCV6oKLn0PHnisPsa/OLYPez2NtKFDRZ6KdE8/VEPgdDPVw4PpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.231
Received: from mta1.migadu.com (out-231.mta1.migadu.com [95.215.58.231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD29606A335
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DD29606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bdwUyWR/ogB0uruaLKskLrPi9QHrdsAZ7cDFPYUW9pg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792663405; v=1; x=1793268205;
 b=wtk2tfok5DtBnkyhCxjarl+rdNrbWxaw0zgeTVXX5yy8E2cuEb/99lvOMktpGjXG8J7EZTTy
 bg1c+GRjmsR49oOige7EXjMJX5sPG1WvlEBZE3G99e7u2PSI/+nOqZwamt61pyDbnTEOIurVOqb
 tLoHOQjWAxXblrJLzQ5B+KD0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f968876e0cbfdf44;
	Thu, 22 Oct 2026 10:03:25 +0000
X-Mizu-Trace-ID: f968876e0cbfdf44
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
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: arm64: nv: Don't WARN when L1 sets IMO and FMO differently
Date: Thu, 22 Oct 2026 11:03:19 +0100
Message-ID: <20261022100319.3046476-1-fuad.tabba@linux.dev>
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

When L1 runs L2 with only one of IMO and FMO set in its HCR_EL2,
vgic_state_is_nested() WARNs that this isn't supported. KVM then runs
L2 as if both bits were set.

However, IMO and FMO are independent bits, so any L1 can trigger the
WARN, which panics a host running with panic_on_warn.

Drop the WARN.

Fixes: 146a050f2d8c4 ("KVM: arm64: nv: Nested GICv3 emulation")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260714235020.2F4151F000E9@smtp.kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
I dropped the WARN rather than demoting it to a print, the same way
e6e3e0022ef8f ("KVM: arm64: timer: Drop warning on failed interrupt
signalling") dropped one that was loud and easy to trigger from
userspace.

Tested on QEMU with kvm-arm.mode=nested. A reproducer of mine sets
L1's HCR_EL2 to IMO=1, FMO=0, TGE=0 through KVM_SET_ONE_REG and starts
the vCPU at EL1. The host WARNs on the first KVM_RUN without this
patch, and not with it.

Based on kvmarm/fixes (c5b7894f1a26b), which has the HCR_EL2_* rename.

 arch/arm64/kvm/vgic/vgic-v3-nested.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
index 82bfc4d4f122f..c70e06c46a7a5 100644
--- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
+++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
@@ -121,9 +121,6 @@ bool vgic_state_is_nested(struct kvm_vcpu *vcpu)
 
 	if (is_nested_ctxt(vcpu)) {
 		xmo = __vcpu_sys_reg(vcpu, HCR_EL2) & (HCR_EL2_IMO | HCR_EL2_FMO);
-		WARN_ONCE(xmo && xmo != (HCR_EL2_IMO | HCR_EL2_FMO),
-			  "Separate virtual IRQ/FIQ settings not supported\n");
-
 		return !!xmo;
 	}
 

base-commit: c5b7894f1a26b5cc942be1cd11b15c3876c837a1
-- 
2.47.3

