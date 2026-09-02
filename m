Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958102C032C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788391231; cv=none; b=ebvNXy0L37BDpVTr1vH4e0sISyV9V2SV5B8ELMs8XsDfNhblME2JTvPoEF39UKg0sRsvU+6Z1dYFyorOmLLcF4Dlq5la935XFqAHCZDafLZg/Jpa9gSR62g9tvDXKEjXyIBth0DlhrZMebXeOLGO1iDUmbvPlErAaS/+RA7TzpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788391231; c=relaxed/simple;
	bh=0YL4pUGksUPcTc2pjS4qyF/pZkKFpe0oVjaJJjHE8Bs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gg/F6/ra0FnV7Ia8UQPrlsvuzmdcfqUzRwBNTVKF+PW7ncnOMB7eOAj8somGaNg+HbcUH7YNxyOxEXfIIDH7Y7dgVKxT7SWdF99Pl2JFNSQnT10QB/bVLrR0owUv6gXLuyluhjdjZ8ggWqSZLORCyj0kdIXWRZ/Rkt4sauMnXnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kTFJJSI4; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kTFJJSI4"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso3092022a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788391230; x=1788996030; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a5sOKx8insVJq3PbA5iAw1GAkg9Psa++g7ztigked7c=;
        b=kTFJJSI4hhGWeai/G0YoPP1dybIU8n7OWSwCGQxM/FBgqHUSRSpUxXmMGRck0ByO5R
         GPNpZfG2U1yTC41wLlETcs0jzX3gH8zpEjuL1JjLWTD5lWfJWVkOsZhyNbl+tKRX9bq9
         o50O7lMT1n/G1xAnmk7D1040EyLPCRMulISajseiRzqWTerqEB6nIO8T4x1iNRMRusT+
         ywuJMc/0lH8LJkxBqIInaDsknxoZR1mBZNLADQjVlWIy/Y5uk+CVwczA8RSNA6El2GEl
         PhwrBdpGYRc5XQ6VX3j5V4FkjB9LV2c1fnci7zpGJYaveBsoGe7au+35GxHk3gmrlrJL
         qwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788391230; x=1788996030;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a5sOKx8insVJq3PbA5iAw1GAkg9Psa++g7ztigked7c=;
        b=HWINPuNtZWy05uAz5gwtxMByQQDaecHrSlURuJGFBy+dZtz2pyeeYeSh6+KhHtOOzK
         KiIlto9cvoos0Ttx109TI/XROKbBZxJgNgIPb/WgQj24NkX4wp05az6eQD8ZKfrTj62u
         8FqD/ppw16hTkzji6DCpGRpSd13TCyU5ifUC3FSpg3Q9bXhnvEQ58PALFM8X0XEp8/0w
         vNuKcbAwvPljVjexDyAca0dpJvuUba8eDD8+OlQlguQMHuHlzBL3zsv/cEgKlZtfe2Wn
         1zt0YquAV+NN07r6pd7AvFPmvoSkEjooLnkYN9snFWDJbO6xeUGfDQnHXBgiLV3kJyAl
         WUdg==
X-Forwarded-Encrypted: i=1; AKwUvBwkWRncop6ArMJrK89m0sk08nnmznaIrOv3DqXkk57ouVq/WzouCVTNLIxem3WkZl3J2Vh8qx74dp/4sQY=@vger.kernel.org
X-Gm-Message-State: AFuF++lE8sHAh89Ll9hYWZPXAevIxIDmsRV1NbvyTMy9S3Pm8qGZxKRl
	oVIA3nAZ5xxTt6Lh9FVYiJPx9kbRb0bgfYnWQVzkmXY0H+aS5qJ/H54B5Ar+4oRuHCPNgEmJfmU
	Ia3DA+w==
X-Received: from pjbgn19.prod.google.com ([2002:a17:90a:c793:b0:38f:f04:c1e8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:17c2:b0:396:b918:c2a
 with SMTP id 98e67ed59e1d1-39aee13cbb6mr9850558a91.12.1788391229724; Wed, 02
 Sep 2026 16:20:29 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 16:20:23 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902232028.2767071-1-seanjc@google.com>
Subject: [PATCH v2 0/5] KVM: nSVM: Disallow bad L1 EFER for KVM_SET_NESTED_STATE
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

v2:
 - Check walker->max_level, not w->cpu_role.base.level, to play nice with PAE
   paging on 32-bit hosts. [Sashiko]
 - Force EFER.LMA=0 in nested_vmcb02_prepare_save() if EFER.LME=0 to avoid
   confusing MMU code.

v1: https://lore.kernel.org/all/20260826211844.884951-2-seanjc@google.com

Sean Christopherson (5):
  KVM: nSVM: Reject KVM_SET_NESTED_STATE if L1 has EFER.LMA=1 &&
    EFER.LME=0
  KVM: nSVM: Ignore EFER.LMA if EFER.LME=0 when preparing L2 state
  KVM: x86/mmu: Bug the VM if KVM attempts to walk more levels than the
    MMU has
  KVM: x86/mmu: Bug the VM if KVM calcs a CPU role with EFER.LMA=1 &&
    CR4.PAE=0
  KVM: x86/mmu: Convert MMU walker's bounds check from BUG_ON() to
    KVM_BUG_ON()

 arch/x86/kvm/mmu/mmu.c         |  3 +++
 arch/x86/kvm/mmu/paging_tmpl.h | 17 ++++++++++-------
 arch/x86/kvm/svm/nested.c      |  5 +++++
 3 files changed, 18 insertions(+), 7 deletions(-)


base-commit: 76671054f9a1ff6abb976583cd8da37650acdc97
-- 
2.55.0.970.g62bdec98f9-goog

