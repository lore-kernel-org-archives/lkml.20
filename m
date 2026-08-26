Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A79361963
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787779128; cv=none; b=CfRmvVv6AC3WC7wB1MbHzpFkjxOEvXMM1Fi6YXZSMLg6/G0xr7Emfwain6cqX5QBBt0wAtl5BqdHBV7o4BLJWCGC4zoQrynJ4a5X0KI43jBE5saICEopIRZmP8z8ZdupjdIv/0ncjYChMTYSmrXR6ASDlzXO2FWaHyUQbjDFoR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787779128; c=relaxed/simple;
	bh=Yh4sPDW9kk5y3uW53S1YAoXUxoviKmWXeWPpfZ4iwlY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=TV68TLoD4DROUhtqSHCNq4O96kIUVfFqWJF2YVxc67CUpo6tJzaw9AhdD7oA+XOyFwiqRbgnCa5qa3lrasLjz3ZEX/lFme4xDDklknvJ8dTYut6LLyREs8qTgAydE8ZPi4T5s7jv2A9umjC6PojQUssW7aqZ+mtwW9zc/Q0Gbt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lieirZr0; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lieirZr0"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d52734fc41so29314625ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787779126; x=1788383926; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7g4idZin41ZUz3z+kuvFwKs/iT9PIFB0LkzvVo5mWgE=;
        b=lieirZr0eioAR72GZ2aocagcsVwyY5ZXJYy2nop01bfj5yX/1ta4AJyAd0L9ig7Xxh
         XTwnDmt1aV1RNfXlVj4kKHyLRRrZyRSwwxdg/93Q4dbwkdoUqdNUQATyN2/mpWUIAfrR
         Ae7yiWUL9VzDiqgjWTTUlUIXJw87BzjwVwBfrMEx799ZHCtJHLmzw2h1v/kZx2LF7LrX
         /v8ZrkdfL+ePfRV80O3xbp/YqhFDs341ItOrO2Z0jbWTk/nvz8zqqj469UNWQ5OYFHpq
         lffN0HIyb7xdNAsQh+fLCgIktSU0ffWowYrixeWrT10SYsxI7GTMhlPiZ9cE63W1ICqC
         ZSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787779126; x=1788383926;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7g4idZin41ZUz3z+kuvFwKs/iT9PIFB0LkzvVo5mWgE=;
        b=byJvJh9PMBxetP8GLhcsQ1r+XgUq0yE77BqtrYkz36cJbncn19so8MQjM2dEWGIPqv
         /xsDczm36TpG3X5ZflbSAF8/BrVJ1+UJovyDt285iSrUu7xqhIjd7RBqKtspflSo36EO
         bFTNaXgCsiHig5sN+XrHiAsUYa4SHvThCuMLNr1HknUJ2Gb0PQNx8VyP6/uI3BANtpNA
         jKVOkmndxAwEZHf1+kzOlZbhgr1XBpxvC47aFjEuWAng6wXP89Qx3F1IJdrR1AS/7JNL
         KHIymGNgTSTqLuh/bRMFRYfdJDMEMNGbZkGB8C8U4QnfYFd2SH1by2DQDpx+6aq0qlcv
         gnSA==
X-Forwarded-Encrypted: i=1; AHgh+RoTsY3jjx1b3Aw3CQEehvauViEdQ9ixv9NkhzDYP3l1gIoVa+MYTpBS4CYfdKVzBp4tUDgenLOTUKxaj7I=@vger.kernel.org
X-Gm-Message-State: AFuF++meMLI0X5RnoEg3EevrX68Xerzg3gxLxFI9Ez0QUR+bNlQUUG/Y
	WkMVSLPgO2hGBtG5saVFsScxsXtgHXlIaoEvpf/qZw/dH2S/zt3wmoJR7zgwITwJ63EUMvK5ttA
	iK/sBuA==
X-Received: from plkq13.prod.google.com ([2002:a17:902:edcd:b0:2cb:6ca0:1248])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fda3:b0:2c9:aae1:a61a
 with SMTP id d9443c01a7336-2d707b7262cmr51037285ad.14.1787779126039; Wed, 26
 Aug 2026 14:18:46 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 14:18:40 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826211844.884951-1-seanjc@google.com>
Subject: [PATCH 0/4] KVM: nSVM: Disallow bad L1 EFER for KVM_SET_NESTED_STATE
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"

Fix a bug where KVM allows userspace to set an impossible EFER for L1 via
KVM_SET_NESTED_STATE, which ultimately can lead to KVM misconfiguring L2's
MMU (yay, NPT!) and overflowing the guest_walker arrays.  Then, harden the
MMU against similar bugs (hopefully it works this time; nVMX also had a
similar bug, but the "NPT uses L1's EFER/CR4" wrinkle rendered the existing
hardening useless).

Sean Christopherson (4):
  KVM: nSVM: Reject KVM_SET_NESTED_STATE if L1 has EFER.LMA=1 &&
    EFER.LME=0
  KVM: x86/mmu: Bug the VM if KVM attempts to walk more levels than the
    MMU has
  KVM: x86/mmu: Bug the VM if KVM calcs a CPU role with EFER.LMA=1 &&
    CR4.PAE=0
  KVM: x86/mmu: Convert MMU walker's bounds check from BUG_ON() to
    KVM_BUG_ON()

 arch/x86/kvm/mmu/mmu.c         |  3 +++
 arch/x86/kvm/mmu/paging_tmpl.h | 17 ++++++++++-------
 arch/x86/kvm/svm/nested.c      |  1 +
 3 files changed, 14 insertions(+), 7 deletions(-)


base-commit: 76671054f9a1ff6abb976583cd8da37650acdc97
-- 
2.55.0.887.g758fc8c411-goog

