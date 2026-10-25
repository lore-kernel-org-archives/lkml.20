Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792914726;
	b=feuv6ATkVIk4oiFa1rypJIwkwJ7kdGjJO0q2yvShCQbQwRDQqG9rzcDjKFRNodK7c4cT
	 8bkAf4mu0vo/YqvsbXWhISYEn+yxwvZ5ZJWLkMzNjCtBz8ABsD2CFo8DOHgxhNPaPw+FF
	 vgNkUKoSyPSLBnUPFl0Ah7q4EHEENxC+pG5xOK7ZeC095sVDJZN3yI1n6/Cb8jV8PgDm7
	 WRxbnP+dA9LL6XRuRqZDyfvDZcuILGGhllTAZFku9Ku49xKVYWjd1e3fTGL/t3qbnIcYQ
	 5vcnCStGHEumeGeYy0zN4MdPuDFsT+OwjuJlhzaa/ueNDUHnU1wcs94hJ309yepVheg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792914726;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mhsArRboNOG7MEYGvuVxZAVzLd8DQVPPiwRvsOHZhfo=;
	b=ZvG2uo2k4+IybQBIB1AHV/P2D4q2Ukac2a71KR2AEvIahJytLCct+u8rEZ4m+YTIBedW
	 gqKkLuLOzjEz9ZvXgqvcIznyN5BWPzx7Lv6i6wNHr0y98do5rEG2DDbn+HphbEFyjMxCr
	 9KtRnByThrL7mo6me+mNzx/VUVtJQQ6rBJ8uTLleK6hHRqM79r1OkMkjkcrUYxY9BShK6
	 1/8BEfQZQ9p9h0oZPkvvatfeki4IItYijrqz11kdsNMaz8VlSe3W8anDul07PQX/bXyk7
	 /3Joy5f+P2GjynyaIaS14y5//2LCGMYc0Y62/AvuHada9SA3MmWoN+zqNQHRB67jIRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="sC/6rAUw";
	arc=none smtp.remote-ip=91.218.175.1
Received: from mta0.migadu.com (out-1.mta0.migadu.com [91.218.175.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF08606A321
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CF08606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sC/6rAUw
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LcQIPG/aqOFsoIK9+iuAeL5MlGsV4fSp77IzdGl2HiA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792914724; v=1; x=1793519524;
 b=sC/6rAUwXo0pzNTDUH8x0UXP5BF9FnWVhg6DikAT7/VVzO4B8Yv1xnhyp2wDNqpZtOqjzo+h
 Bo/7itC0JMa/Grty6vd9OyQpYCutmeHa8SobhWmx2N+dwrp3NYjWNq+cYMJZ8ZnhoigXuI/yWOS
 3l6tTv7YpoRcy5NGxFUNtfG0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 176e5694bb0be5f6;
	Sun, 25 Oct 2026 07:52:03 +0000
X-Mizu-Trace-ID: 176e5694bb0be5f6
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] KVM: arm64: Enable ST64BV0 for guests with FEAT_LS64_ACCDATA
Date: Sun, 25 Oct 2026 07:51:37 +0000
Message-ID: <20261025075138.2919734-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025075138.2919734-1-fuad.tabba@linux.dev>
References: <20261025075138.2919734-1-fuad.tabba@linux.dev>
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

Since commit 58ce78667a641 ("arm64: Add support for FEAT_{LS64,
LS64_V}"), a guest sees the host's ID_AA64ISAR1_EL1.LS64, but KVM only
enables the FEAT_LS64 and FEAT_LS64_V instructions in HCRX_EL2. On a
host with FEAT_LS64_ACCDATA, a guest's ST64BV0 therefore traps and hits
the WARN_ON_ONCE() in handle_other().

Set HCRX_EL2.EnAS0 when the guest has FEAT_LS64_ACCDATA, now that
ACCDATA_EL1 is context-switched.

Fixes: 58ce78667a641 ("arm64: Add support for FEAT_{LS64, LS64_V}")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_emulate.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index a3c1928bdf743..d07f72082531c 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -712,6 +712,9 @@ static inline void vcpu_set_hcrx(struct kvm_vcpu *vcpu)
 		if (kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_V))
 			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnASR;
 
+		if (kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA))
+			vcpu->arch.hcrx_el2 |= HCRX_EL2_EnAS0;
+
 		/*
 		 * NV3 is a host-specific extension, and we always use
 		 * it when present and that the guest uses NV. It may
-- 
2.47.3

