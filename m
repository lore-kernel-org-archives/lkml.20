Received: from mta1.migadu.com (out-134.mta1.migadu.com [95.215.58.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECB4377EB2
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863051; cv=none; b=WUhdEs0SMsQgxI88gLNqAsLXvuPRWe2usRjWSdtcyVvU4x2SEw4zXD+WxkeubHc611qlx80KBVmvnGT5cX8QuT5gPFOl9KmNpzwtoSc3roBaxy26qLW0Yv+3GJ7IlUKbIpDkfV1u1npKmiUgnsv8zrjPNDD3+lmFejPahy7utm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863051; c=relaxed/simple;
	bh=PJujOV+1Z+2Pic9F+Xx2wknBh2QM3e+/EoajCgxNjqc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e91sNDk6RLWuXfSOV1MOvcKd94ZziRai1ZELUVgz9fuIG3SquE6kiSota2NRuTaq54BrQ5dM+7ai/XkmwbtFO/mi58TpujjVaFtTsJYtSqVrFrfXcYQri79fK4F3dzp+vbWuvAyq89rZbfpQPmy1UGzU1tSMDVleF806r5Cl5uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SgeNpYwQ; arc=none smtp.client-ip=95.215.58.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SgeNpYwQ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PJujOV+1Z+2Pic9F+Xx2wknBh2QM3e+/EoajCgxNjqc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790863040; v=1; x=1791467840;
 b=SgeNpYwQp1sPsNvNCZkpr5p2lleRentwyITBrM/1gyISeRTH3HXEpfvrtQoGJstx2IigIoOt
 fdJLQVjUquKwYCht6F3KFB2nu3aTTBTI+OM19KxCRwHyg45js/i4Wz/Trrjjh/5zU7ijU8y5mJD
 sxcxhIbJCbdfCh6H/ziySWvo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 92f42d1d26ba2f01;
	Thu, 01 Oct 2026 13:57:20 +0000
X-Mizu-Trace-ID: 92f42d1d26ba2f01
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	mark.rutland@arm.com,
	steven.price@arm.com,
	vdonnefort@google.com,
	qperret@google.com,
	tabba@google.com
Subject: [PATCH v4 01/18] KVM: arm64: Sync HCR_EL2.VSE back to the host vCPU under pKVM
Date: Thu,  1 Oct 2026 14:56:54 +0100
Message-Id: <20261001135711.1640520-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261001135711.1640520-1-fuad.tabba@linux.dev>
References: <20261001135711.1640520-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

flush_hyp_vcpu() copies HCR_EL2.VSE from the host vCPU into the hyp
vCPU on every entry, and nothing copies it back. Once the guest takes
the vSError the hyp vCPU's copy clears with the hardware bit while the
host's stays set, so the next entry pends the same SError again,
KVM_GET_VCPU_EVENTS keeps reporting it, and kvm_arch_vcpu_runnable()
never lets the vCPU block in WFI.

Reflect VSE back on every exit, which the flush-side comment already
states.

Fixes: 734dc8c01c838 ("KVM: arm64: Implement lazy vCPU state sync for non-protected guests")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 9a3b92e626adb..b6bfe502bcd04 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -276,6 +276,10 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 	host_vcpu->arch.iflags		= hyp_vcpu->vcpu.arch.iflags;
 
+	/* Cleared by hardware once the guest takes the vSError. */
+	host_vcpu->arch.hcr_el2 &= ~HCR_VSE;
+	host_vcpu->arch.hcr_el2 |= hyp_vcpu->vcpu.arch.hcr_el2 & HCR_VSE;
+
 	sync_hyp_vgic_state(hyp_vcpu);
 }
 
-- 
2.39.5

