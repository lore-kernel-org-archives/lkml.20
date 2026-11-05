Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883907;
	b=q/xIEKU91JhMkFhLat1cbXQdpLUQciFSXXsiUfP8ZeZUyp8xHEJOO3/37ANeY9kpvyoL
	 s8xqWYuQzV1lua/063cHbkJINn6Ie8sRiiezFbNgPO+dz3LSDP9ivJ2w5+uPkBsk2OeRA
	 ORRpM/IjHt7O2SwodiNnpNq3YGsr/Lz7Hr41i4wtN8uS0FrqsND4EYt0EWqnDQ5F0w1QD
	 qDZKhN9Ch9Yj0fpb7vJt+oQzArR/2S/87M5XuINUGtlwapedlKF6aKnUeARu1R+BKkHiJ
	 ctfkdXh1SxyxA+p31goXGereMCJm4ng/BaE97i39zu0jqPFJMLktzvroKDiMvViIn4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883907;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ITFZfqTf6HLA8M80Gc6oqzXf0FVpiSw0NR/yGEmW2ls=;
	b=mIB0ktQDa8CKoZ6wtCJbOgL63N7iP6E6AX0S1E3BBg+kvDbndPbT/ROqx9B1v95iiZcU
	 c4lbdhuJk3ICDz+kCvtHxWcCSSAtZ0G0f1cmpS0mN1RJN5qgluR+7MsT2fmZruBMpUJCF
	 5i7p1QJ9ZUVv3ojyOP+XdZuJwlV1Y2IT7yyQC2gFwQa5nKrVyoagOea1MHqIbj2XGVbvX
	 WT9pIjgKCZQ+9Cy/l2YOY2TIEULwncelBk3FNTLDVbPs3tHoegZpHMcut9uiRtNzPLcAu
	 EGA1GcmciHfK5l1ELGJFIdJzC6UzHabOuh1LCiJ5peRMHLb2X9KjdNIRcPQt3SoEnFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wM8RlSos;
	arc=none smtp.remote-ip=91.218.175.182
Received: from mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7B8606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C7B8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wM8RlSos
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VlBWOdFHmpR7E9vPrR5lo8vubxtfca2eYX+pam8dCPQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793883904; v=1; x=1794488704;
 b=wM8RlSosKq28ghg0TCYbcpogXAb2iERutHvUNHnj/hu3/Ne8RjXvPJI/HGB3h+EsExi0+iC+
 MfzW/uVvoPv5weMIEggj3mbsOcl61iPxbGqRhTrBNJtEhXMJVDoGxqMM+fa+xVJz1d1VLaa7+Z3
 Xx/OP2pqi2F3qDPLyhwAWnB8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 73a9a296ef247332;
	Thu, 05 Nov 2026 13:05:01 +0000
X-Mizu-Trace-ID: 73a9a296ef247332
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
Subject: [PATCH 0/4] KVM: arm64: Support SVE in protected VMs
Date: Thu,  5 Nov 2026 13:04:52 +0000
Message-ID: <20261105130456.1617185-1-fuad.tabba@linux.dev>
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

Hi folks,

This series adds SVE support for protected VMs. EL2 allocates a
protected vCPU's SVE state from its own heap rather than pinning the
host's buffer, so the host never sees the guest's vector registers. It
then advertises ID_AA64ZFR0_EL1 to protected VMs, and routes the SVE
trap to the lazy FP switch. The first patch is a small tidy-up of the
pKVM FP sync code that saves a guest's SVE state.

v2 of the pKVM selftests series [1] will add a selftest for this.

Based on Linux 7.4-rc1 (6628e7d4c6b25).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261104084842.132944-1-fuad.tabba@linux.dev/

Fuad Tabba (4):
  KVM: arm64: Remove redundant kern_hyp_va() calls from the pKVM FP sync
  KVM: arm64: Allocate a protected vCPU's SVE state at EL2
  KVM: arm64: Advertise ID_AA64ZFR0_EL1 to protected VMs
  KVM: arm64: Allow protected VMs to use SVE

 Documentation/virt/kvm/arm/pkvm.rst |  6 ++---
 arch/arm64/include/asm/kvm_hyp.h    |  2 ++
 arch/arm64/include/asm/kvm_pkvm.h   |  1 +
 arch/arm64/kvm/arm.c                |  1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c  |  4 +--
 arch/arm64/kvm/hyp/nvhe/pkvm.c      | 41 +++++++++++++++++++----------
 arch/arm64/kvm/hyp/nvhe/switch.c    |  1 +
 arch/arm64/kvm/hyp/nvhe/sys_regs.c  | 22 ++++++++++++++--
 arch/arm64/kvm/reset.c              |  2 ++
 9 files changed, 59 insertions(+), 21 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3

