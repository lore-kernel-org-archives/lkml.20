Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793182412;
	b=A633y3S4jUugbskw7pSjzOQutTrlSEjeo7OPOAQYyJWw53820qOgTyPPwcrW3rblw6iq
	 kvEaMSvgF56KkNy1AIn0+z+aoJQYDn8N8JqrZtRdfR1G+X8gem3qK1fnsSoBh1H5Ef9z5
	 XJvLbQG2EEAzzXazfPVx/vJHFmQOfNzQLIhgrv2Xgezy5tyM8nxjPM16nrYkMXyrcz4Bv
	 t6oFH1HKyexlrbPwZfyVtpSJ6800aWiWm1fC2EKYhPzYZX34LHa6RNfV+wYX4pf0yJyXg
	 BEts3RAk9ZvZX8QbX3QgprN+gzlYMJv2WkKwmczV1FmciBH1O2UIWwSxSIXAEDKt4jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182412;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dAFgr5GFVCUFPSyhlg3DUaZpfnARnQey3lMyxNdSf/I=;
	b=RbaeM6JgEI+9MLVYCBmYklnabxAb/JU7IvjeiM4dx1HyVc5o4Ke86r/UNna1BN0WyzAe
	 9IIRnw5GUmOJXOJsulM4prdxvJkrFoeIwMR6qdCF9SYNYuZz6UwnwD+gX3FghFlfMlIED
	 LDPTkjXseRAI4i7C1YWLkhhO37G5Le1STj9U8zW1LYLsKs1IhCl0EnwtpWL/x1JUfr/u/
	 UGwyVN8PDcnyTajeeOO8XAw8B41fhGjtcswQvOwdY4KFuhpRsHn4aP2Vv4mLdNpsLx5B4
	 Wu59CVgi38uIuurkqkOmBcHEVheNKvd0v+7/jh1c6pnq9wyvwYsLLPBt2ggGkdXHelw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=u+86nyc+;
	arc=none smtp.remote-ip=91.218.175.69
Received: from mta0.migadu.com (out-69.mta0.migadu.com [91.218.175.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E277D606A326
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E277D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=u+86nyc+
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Gpfg/CtXJGh5QbnPt7iVXc/Il3CyiL4OHB1+vx17vOU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793182409; v=1; x=1793787209;
 b=u+86nyc+SENRUNyWl4DA32hNmfJJeMw+lr5AfguarO6spG4tvJqcb135F3u+oMLvjTiow/Ri
 zaypz3jI7ndq8t5fDO1wUiWOwjnhly8M7myl26fUQRse8w3+mmd1Q17ezHhQ4y0WjOWv3La5CTP
 u8YTM4QrCH0tm4luaRpSnHY8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 961729e0969fefcf;
	Wed, 28 Oct 2026 10:13:29 +0000
X-Mizu-Trace-ID: 961729e0969fefcf
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Eric Auger <eric.auger@redhat.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] KVM: arm64: vgic-v4: Don't allocate vPEs for a GICv2 VM
Date: Wed, 28 Oct 2026 10:13:17 +0000
Message-ID: <20261028101318.2170928-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028101318.2170928-1-fuad.tabba@linux.dev>
References: <20261028101318.2170928-1-fuad.tabba@linux.dev>
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

KVM can run a GICv2 VM on a GICv4.0 host whose CPU interface supports
legacy operation. Such a VM has no LPIs and never uses vPEs, so
vgic_supports_direct_irqs() is false for it and kvm_vgic_dist_destroy()
never tears them down. However, userspace can still create an ITS for
it. Once the vgic is initialised, vgic_its_create() calls
vgic_v4_init(), which allocates the vPEs and requests a doorbell IRQ for
each vCPU. They're then never freed, and each doorbell handler stays
registered with a vCPU that's freed with the VM.

Only allocate vPEs for a GICv3 VM.

Fixes: 74fe55dc9ab77 ("KVM: arm/arm64: GICv4: Add init/teardown of the per-VM vPE irq domain")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-v4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
index ed236f083f0d7..a01de4de608a6 100644
--- a/arch/arm64/kvm/vgic/vgic-v4.c
+++ b/arch/arm64/kvm/vgic/vgic-v4.c
@@ -248,7 +248,7 @@ int vgic_v4_init(struct kvm *kvm)
 
 	lockdep_assert_held(&kvm->arch.config_lock);
 
-	if (!kvm_vgic_global_state.has_gicv4)
+	if (!kvm_vgic_global_state.has_gicv4 || dist->vgic_model != KVM_DEV_TYPE_ARM_VGIC_V3)
 		return 0; /* Nothing to see here... move along. */
 
 	if (dist->its_vm.vpes)
-- 
2.47.3

