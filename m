Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1E151DE0C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790803117; cv=none; b=tBdOe1g/5pyH4Pgd/nEYkIcpsBrobBjFvIWSh9kOi+tF7kFNys9ZMqfUhiLREz5wO27qKiyRiE1/kAX4lwUe/kTDWAw4SNf1Ru/+BKFenyGY92GR7s+gTy3VOjFOMvsuo5LE8cSU7cGnmMyo2haQaBKS9/QE74GI8VwNbuEDkhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790803117; c=relaxed/simple;
	bh=bBIz71XabS8gsl10MkZY2WdwbNn2woPnnwp8G7PdlC4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=G8SQk/DeqvpS/FrElwhHd9SwkIO87EeM1fFgH+6XVlCtQFCHkRwZ+TdutEHoGPxsoJVyVw4grCtDtZ6gDAbtdbyLPd0x/e3iupRYz9Z45dN6quwAwzsOfVeoSvGcJoqClPBTqDP3rrwSAD+4fOotGIe6O6/8Px/M2CsNvzCedcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d9unN/oq; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d9unN/oq"
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c55ba309c2so10085712b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790803115; x=1791407915; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=631pnrFuqDRXd3BfizV2s6nQYFa+PIycK6cr0Zp6o9g=;
        b=d9unN/oq8JFqoulfoY1odb90kkrMFH2Fgy0ZKNdLnzWsARCsIzRJX93qv3aaQ+yBi+
         6zR/NRw1F1i2xOFaae03qAg3iKByHnww11wA3oRhY7KD+8jBlNV30buToioygXIG8Zok
         ETEE488jUn3taQVTqDOBZ+K9n9PBez8GDTvdd6Jvz+BUU4MEIpIFvvC/BdXufzm09JAp
         uf9dBhUVZcXkXYnspYQtC3SaiNmur6uKpRGYTbc1ZOaJTHWwdBLBmCXExHIIWdXXrFew
         2yotWQgHoMo4yvWXpZGWKp64S0jmLJvN7y1I2qaMtGVWNFnb9xfUjKXj0VYN/rA0ETRf
         jipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790803115; x=1791407915;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=631pnrFuqDRXd3BfizV2s6nQYFa+PIycK6cr0Zp6o9g=;
        b=BY+Awgej4yPoTj9uXG33Ls0J/5ktOEc8ZYo1Z6Kxkn+/dGq1JPS1ge5M5XVt6FI8og
         tC2JnrbP05r3N7EYkZ2uVf4R7VNylltUl5oC065x4ZRlipR86WHgwe7UMn5xCjXRrBbg
         GbflZwd8K3ivgs+zOn73ChOCU8L4mG0fNc9u8LpcLEFrCp0eGXNtC6CTV0M8WDaNVdDc
         8M6Dt1rpumVjEqmZtnym+1dOgw9mf7/FFd0g/mHN9TjVTll+WyX69hB9FstJzZS7SDqa
         2a9UpKkeha0azNGyPBbiKzPo6SqyVJ2FX4dGJxlCDMZrBXsr++UvIhvBjwXlnflY9oJn
         VgPw==
X-Forwarded-Encrypted: i=1; AKwUvBy6FP4cZRiXOH8biN6Fh6TcfURRaO4/25Yk2pwGu2qe67B4zqC6rfAdNB2DLfMwDsUDuniC4el8F5mr9js=@vger.kernel.org
X-Gm-Message-State: AFuF++l4yjvRoln5DtNn4BCsCx8GKiwmfxtvv8Gq9XoUaL5FgQEN+W+r
	AD1ZS1ciJr3e05nXOp1n+vWeGnb2j0sX8ANfc07w9XZ82uBexmsrCVkpgkCKhZS8J207rte8mIL
	05/hVFggn825ggxpp47e59dfNUw==
X-Received: from iocrj27.prod.google.com ([2002:a05:6602:a71b:b0:9c7:5b85:f7d6])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:14ca:b0:4d6:92b3:5c8d with SMTP id 5614622812f47-4f1bafb3d3bmr3357156b6e.67.1790803114797;
 Wed, 30 Sep 2026 14:18:34 -0700 (PDT)
Date: Wed, 30 Sep 2026 21:18:32 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930211834.2773546-1-coltonlewis@google.com>
Subject: [PATCH v2 0/2] KVM: arm64: Handle hidden FEAT_PMUv3 in ID_AA64DFR0_EL1
From: Colton Lewis <coltonlewis@google.com>
To: kvmarm@lists.linux.dev
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, pbonzini@redhat.com, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

When userspace initializes a vCPU with KVM_ARM_VCPU_PMU_V3 and hides
FEAT_PMUv3 via ID_AA64DFR0_EL1.PMUVer, KVM hits a WARN_ONCE("Unknown PMU
version 0") during reset_pmevtyper() and continues to expose PMU system
registers instead of emulating guest accesses as UNDEF.

Patch 1 handles ID_AA64DFR0_EL1_PMUVer_NI in __kvm_pmu_event_mask() and
removes the redundant kvm_vcpu_has_pmu() check in reset_pmevtyper().
Patch 2 updates pmu_visibility() to check ID_AA64DFR0_EL1.PMUVer via
kvm_has_feat() so PMU registers are marked REG_HIDDEN when FEAT_PMUv3 is
not advertised.

Changes in v2:
- Handle ID_AA64DFR0_EL1_PMUVer_NI in __kvm_pmu_event_mask() and drop
  the kvm_vcpu_has_pmu() check in reset_pmevtyper() (Oliver)
- Drop Cc: stable@vger.kernel.org (Oliver)
- Add patch 2 to check ID_AA64DFR0_EL1.PMUVer in pmu_visibility()
  (Oliver)
- Link to v1: https://lore.kernel.org/r/20260929220411.3756519-1-coltonlewis@google.com

Colton Lewis (2):
  KVM: arm64: Handle ID_AA64DFR0_EL1.PMUVer == NI in
    __kvm_pmu_event_mask()
  KVM: arm64: Check ID_AA64DFR0_EL1.PMUVer in pmu_visibility()

 arch/arm64/kvm/pmu-emul.c | 5 ++++-
 arch/arm64/kvm/sys_regs.c | 6 +-----
 2 files changed, 5 insertions(+), 6 deletions(-)

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

