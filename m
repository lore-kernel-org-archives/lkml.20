Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.58
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933436;
	b=laxz/pklgA9MlVP7ZUIWCSGub8WKFg/pL2uoYmbclUX+xd6KeHFKY4JB61K+A4ULW//j
	 tzhvegEdYsXsDAonzfIUhoavEHNSAbQf7/VZ2vm2KRdj1qc/IVdnzVjDVlblXP7rIUX9d
	 MAtMrNrRDjNJPFlGNdZ1hMUWwflzhfQgBASeQI0F1OLadntZ86nqxS07+NbN8B/TsWCpv
	 LFmq1TQ1PF2F/q4XJhYZUsmUwKN2PJDMEeyCr6/hxG3+F1A+NT4ciDK3Qpe6LnwCDax0G
	 Eb+dXblcdH8IyBgxELPllow2DjbDrPxmolpsHaMN5BxCCg5dgvgtKOYFx7Tp3QVk+HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933436;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=z4eKzkcWk1IKH8doz5gGRdUtFm1MYHG1rOm73vYxulA=;
	b=HjRaA+kzVqRUF090srBAV9mPDQIJIqmfNUP/pvSKZl8SoW65DlyEgSl21m1qYoNhnxy7
	 arUjhLCyXXUmtPURxH4ZSTnMRYiRnpoGfhM0+dRKqGWpTckSmKyL0lqkviT9ggUCQw0dF
	 iPEqPapI/CqcIE6EyyFwxQL5qKEXUe8kahAcflJ3A+GqqvE4dUrxpLwfqGKHnnBW6KnI7
	 NGTqwTxX5vRwJ6B5JOVuQuQy3AoWvTtM/XMzjdMg7rQreLmZhKGpKP8LK76H6BtdWYPs3
	 6u7Di8o4fCFRSI1ScDKOtfMd4JjIzg2ZgKYPFcVyl/3ErlgdEucRsuvrRtUQ0zHmJ2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ihXQb4NC;
	arc=none smtp.remote-ip=95.215.58.58
Received: from mta1.migadu.com (out-58.mta1.migadu.com [95.215.58.58])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00444606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00444606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ihXQb4NC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=LbJlXuBe4UMUHY+VoPzgCOZA0cis0LLWHwrzjRk/Y8U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794933432; v=1; x=1795538232;
 b=ihXQb4NC8XpR0PtBi8TqGTsv8vtHIhdw424+U2bJzCTvMEy7IbaESe9VxWBOYOWgxhmtabIk
 w+etAwUIpxM8bgaibwoxjE8y0d7ApkmUZrDjOmyxtdZ3p6VD741M95xOcLhEgrHFCsXNTuJtN8S
 UJQ3wp2+Ca/Z46O9fM4q0HYc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9105d92f22dcb935;
	Tue, 17 Nov 2026 16:37:12 +0000
X-Mizu-Trace-ID: 9105d92f22dcb935
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] KVM: arm64: Don't forward the host's SDEI calls to firmware
Date: Tue, 17 Nov 2026 16:37:00 +0000
Message-ID: <20261117163702.1678277-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117163702.1678277-1-fuad.tabba@linux.dev>
References: <20261117163702.1678277-1-fuad.tabba@linux.dev>
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

In protected mode, EL2 forwards host SMCs that it doesn't handle to
EL3, where they arrive as calls from EL2. TF-A treats EL2 as the SDEI
client whenever EL2 is implemented, so the host can register an event
handler that runs at EL2.

A pKVM host kernel can't use SDEI, since sdei_arch_get_entry_point()
fails when the kernel is booted at EL2 but runs at EL1. Return
NOT_SUPPORTED for SDEI calls instead of forwarding them.

Fixes: b93c17c4185bf ("KVM: arm64: Trap host SMCs in protected mode")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 179d7c8277b88..37fb9896ba3ad 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -10,6 +10,7 @@
 #include <hyp/switch.h>
 
 #include <linux/irqchip/arm-gic-v3.h>
+#include <uapi/linux/arm_sdei.h>
 #include <uapi/linux/psci.h>
 
 #include <asm/pgtable-types.h>
@@ -1647,8 +1648,14 @@ static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
 	cpu_reg(host_ctxt, 0) = SMCCC_RET_NOT_SUPPORTED;
 }
 
-static void default_host_smc_handler(struct kvm_cpu_context *host_ctxt)
+static void default_host_smc_handler(struct kvm_cpu_context *host_ctxt, u64 func_id)
 {
+	/* Firmware would enter the host's SDEI event handlers at EL2. */
+	if ((func_id & SDEI_1_0_MASK) == SDEI_1_0_FN_BASE) {
+		cpu_reg(host_ctxt, 0) = SMCCC_RET_NOT_SUPPORTED;
+		return;
+	}
+
 	trace_hyp_exit(host_ctxt, HYP_REASON_SMC);
 	__kvm_hyp_host_forward_smc(host_ctxt);
 	trace_hyp_enter(host_ctxt, HYP_REASON_SMC);
@@ -1675,7 +1682,7 @@ static void handle_host_smc(struct kvm_cpu_context *host_ctxt)
 	if (!handled)
 		handled = kvm_host_ffa_handler(host_ctxt, func_id);
 	if (!handled)
-		default_host_smc_handler(host_ctxt);
+		default_host_smc_handler(host_ctxt, func_id);
 
 exit_skip_instr:
 	/* SMC was trapped, move ELR past the current PC. */

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.47.3

