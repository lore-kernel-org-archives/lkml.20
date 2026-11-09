Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.205
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213167;
	b=Q6s+HCTsgf/XCTx6eXcpdJ6BbQ8O+4m41/JF8oh9Vw8SkR0Id4Me6p1kfITd6PFV6fOT
	 Wxs06Strjivk9dHy936o6XVIrCKrkM3d/YfIRAuE9iUniVzfbJP1p/PmPRXJyXB8W1cqQ
	 lC1PAqGK/u/6OausJIrmgVgIiK12QeLjGNFbtTL8Gu6OVNbkSGKsfISX0aXd6cPUw4HNr
	 ionPoYshUPpvcq7RtF5iUibc3zQ4A/S6+N3Zx81hliV2MeBt7UhLB9pEH+9PXTVKCr6Z6
	 DK+6TVf1cnsGV6iianVRiwCZiXRpaBZ6DiVhRrO/DH0br0XbzmIuuCjYfLJSMNCUJUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213167;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LF0Ejm61SZQjc0f58igDHYvnGorLWUKIVR39Ms9bxQo=;
	b=sfKwjfcuzg3aQljk825vriLo3asXExQCj5Hj6uS7Yj4OHhDb2h/AB4z9a4vTSlzTEpbz
	 5DwBR1KKUJm/iibQPaaiLbj9DCLWxO1sxJgDc42iFOFY9s4NWIIZTohAkL3slD0/zsoMJ
	 LYVSuuWa7gb74+umzq+MQd9+YdNGLw/neop2NvvDQGEjSLHF6kjRxbgTrGWL70A1fOgip
	 Z1m64+6zI4gZ90x+RQZp2WZBE4tnJb8P1wJGjAdszH8r61jfFsBJALYWYsjJwmij/SU2M
	 moKAzFZ6D/OVEi9NjUwuC5j7yfTV0LqVBdyx90UqYCZ22CO3qppbw4uMfaL+qYZHTnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c7ZQEn84;
	arc=none smtp.remote-ip=91.218.175.205
Received: from mta0.migadu.com (out-205.mta0.migadu.com [91.218.175.205])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C41606D82C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27C41606D82C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c7ZQEn84
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=R5BdSBLcdM34a45EFlY1mo16mKvKHeF1lP9Vx+en0yQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794213164; v=1; x=1794817964;
 b=c7ZQEn846anLKcyzh+/HxcKvLUA6xYOP24jyL/eJjTjeZX7KrKAQHH3uN5gvzE7g2Rbu8A05
 kbwFisq0r7ytJTZ8ZJQKGWc3hdmv9srq5En4kZkbHjNiqKzHtsE+ZdmZp1L9+LEOh3z0YJq6OA1
 l7bVRdnP14Pk9TeWciO+Ny28=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 889bac94e9d75174;
	Mon, 09 Nov 2026 08:32:44 +0000
X-Mizu-Trace-ID: 889bac94e9d75174
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
Subject: [PATCH 10/16] KVM: arm64: Advertise FPMR to protected VMs
Date: Mon,  9 Nov 2026 08:31:59 +0000
Message-ID: <20261109083205.806619-11-fuad.tabba@linux.dev>
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

Advertise FEAT_FPMR to protected VMs, and reset FPMR to 0 as KVM does
for a non-protected vCPU. With the field set, vcpu_set_hcrx() sets
HCRX_EL2.EnFPM for them, and FPMR is switched with the rest of the FP
state.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index bcc35d6990e67..a937aad009348 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -128,6 +128,7 @@ static const struct pvm_ftr_bits pvmid_aa64pfr1[] = {
 
 static const struct pvm_ftr_bits pvmid_aa64pfr2[] = {
 	MAX_FEAT(ID_AA64PFR2_EL1, GCIE, NI),
+	MAX_FEAT(ID_AA64PFR2_EL1, FPMR, IMP),
 	FEAT_END
 };
 
@@ -829,6 +830,7 @@ static const struct sys_reg_desc_reset pvm_sys_reg_reset_vals[] = {
 	RESET_UNKNOWN(TTBR1_EL1),
 	RESET_UNKNOWN(FAR_EL1),
 	RESET_VAL(VBAR_EL1, 0x1de7ec7edbadc000ULL),
+	RESET_ZERO(FPMR),
 };
 
 void kvm_reset_pvm_sys_regs(struct kvm_vcpu *vcpu)
-- 
2.47.3

