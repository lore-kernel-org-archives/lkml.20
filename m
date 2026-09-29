Received: from mta0.migadu.com (out-7.mta0.migadu.com [91.218.175.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A452F3C1D5E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672455; cv=none; b=f9eLXKw4RpmdWTOaYayNv8niTxzSGt58Cu6lC7HabRS+4kqulRPQXq0J8TF0JLJ2EaJyYCmK1yKPrwV3HLem7AJNtqL4NzUYc9pTN1AVAZAZzu3FzP/8I0e64YwOSf3WygMlb98MBiEpKam97Gi6mnhfeS8vhE4NY5CWXHxH4/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672455; c=relaxed/simple;
	bh=XqxrlL1PeFm7f3HhyjzmfZu6nSsKkuNbuQg38YPJ+sg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BMDHKmbu+zE7sDVunzYOOApDHFaFTL8Vf66qDQOdQDoOmwl/tJA9mE7cZPUaIUMuX9so+qA7ZOqDY0Uwn7I5q5bkLmq2OWIRwxQVEIGeYajNYThmx3FMXpCJYZ31TleuIWpA83a5jy1BMkxZ4q17j1TPgW+3Bx3ZlZf/uCvag8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AN53gpYr; arc=none smtp.client-ip=91.218.175.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AN53gpYr"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XqxrlL1PeFm7f3HhyjzmfZu6nSsKkuNbuQg38YPJ+sg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790672451; v=1; x=1791277251;
 b=AN53gpYrdXj1+501YrYDkRdXfYsB5tIwgugBvY9QeKF6Xka7EFUyFwswtPrf6WX/riGjqDWN
 RDs154vU03d2Vwq1LxB+uv7SLvWJ9FkiYtFXWmpSH2CjOvL8Uz172AsTBfg9RXCWK+fVcnArNuU
 X0Zie3cbIlcC3icLm+oQSWKQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b89483134b4c43d3;
	Tue, 29 Sep 2026 09:00:36 +0000
X-Mizu-Trace-ID: b89483134b4c43d3
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
	Quentin Perret <qperret@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Venkata Rao Kakani <venkata.kakani@oss.qualcomm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] KVM: arm64: Fix HCR_EL2 for non-protected VMs in pKVM
Date: Tue, 29 Sep 2026 10:00:27 +0100
Message-Id: <20260929090031.3829185-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

Changes since v2 [1]:
- Patch 1: apply the FGUs on a CPU without FEAT_FGT instead of moving
  the check in handle_tlbi_el1() (Oliver [2]). Wei-Lin's Reviewed-by
  dropped with the rewrite.

In pKVM, EL2 sets a non-protected VM's HCR_EL2 in pkvm_vcpu_reset_hcr(),
which misses the RW, TID5 and TTLBOS handling of vcpu_set_hcr(), and
takes only TWI, TWE and VSE from the host. As a result, an AArch32 VM
can't run, a VM can read GMID_EL1 or execute a TLBI OS its ID registers
hide, and the host's TVM, VI and VF never reach it.

The second patch clears RW for an AArch32 vCPU. The third also takes
from the host, for a non-protected VM, the bits the host varies with the
VM's configuration or at runtime: VI, VF, TVM, TID2, TID4, TID5 and
TTLBOS. The rest stay EL2's, and a protected VM still takes only TWI,
TWE and VSE.

The third patch depends on the first: once TTLBOS reaches the VM, a
trapped TLBI OS from a non-nested guest on a CPU without FEAT_FGT hits
a WARN in handle_tlbi_el1(), as it does without pKVM. The first makes
the FGUs apply on such a CPU too, so the access is UNDEFINED before it
reaches handle_tlbi_el1().

The last patch adds a selftest that checks a feature hidden in an ID
register is UNDEFINED in the guest. Its TLBI OS case fails in pKVM
before the third patch.

VSE still comes from the host as before. Syncing it back after delivery
is a separate fix [3].

Based on Linux 7.3-rc4 (93f51579e7df2).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260928064643.3265087-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/arqeRSIoEwurSrya@kernel.org/
[3] https://lore.kernel.org/all/20260921101030.1231605-1-fuad.tabba@linux.dev/

Fuad Tabba (4):
  KVM: arm64: Apply the fine-grained UNDEFs without FEAT_FGT
  KVM: arm64: Clear HCR_EL2.RW for 32-bit non-protected vCPUs
  KVM: arm64: Use the host's HCR_EL2 for non-protected VMs in pKVM
  KVM: arm64: selftests: Check a feature hidden in an ID register is
    UNDEF

 arch/arm64/kvm/emulate-nested.c               |   3 -
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h        |   9 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |   7 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c                |  25 ++-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../selftests/kvm/arm64/hidden_features.c     | 184 ++++++++++++++++++
 6 files changed, 214 insertions(+), 15 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/hidden_features.c


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.39.5

