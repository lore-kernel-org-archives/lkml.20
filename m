Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793139146;
	b=R71zGQYr1/vpBkB4vZnPTiF8sSzR68O7O7nrepyZOCZP9nTNrU0Ju0ti4vql96XBH7Mv
	 RObjam6l19sBz9oEUdBl8pDp8wsFuDn9vtaht8kqOrndl6oJF8WtYOGsQnyGMzSctQ5DG
	 6KaSdFMvwhV5C98E7/lnZWvficcNxptLBWArnXl3cHDjPqldvBZGasEiEeHzZSA+lfVTi
	 dUSDsQ00km1FVbXW27auPDVrxYn2Q4snA8F3xgrJuwwSwJm8mI3JhWtFA+R/4bA9TBuzs
	 DuCF+BbxlQGJFAIhzQGN7B2G5ufJvOTG7wIaI48IZ4MwTparR7QyHgqHaLj7X4bF6uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793139146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=46E3EGLnWSLxFlTim02Ohjypmi0q8zDH6vLR5FUSx5Q=;
	b=wzlak1t0MLrLR99v4LkeIjUyKCQE4UKAIcjumHX10i78p/ge4Xmh5gEW+V4nCeVbOhfs
	 yHWegeKh1YVKUUU6kxB0QOqTE9H4BfeHG51i12CHZzp0GSiouVm1kmNPDjldPeafMbL3r
	 sK6v0vuuUtix6Z9H+odxanUp+ySu2LK3ioXf2wDY99ysCOfBKixWmG4CYyynsAjPNwi1p
	 z7oCrfaUiThAhQC0aeouQagK+c1J9ULgsZ7DH3Y6a+nSShCcnkc5gwlIEg2SlmX+ZIvxF
	 5Ya2Si02unRBM88p0dpqrpGNbWYL/RVcrGkFdeByM5mzH0qAu1tACtftP9RNEP0hAQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FEiUD6Nm;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A1660A2602
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22A1660A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FEiUD6Nm
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdae10aebfdso154356a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793139137; x=1793743937; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=46E3EGLnWSLxFlTim02Ohjypmi0q8zDH6vLR5FUSx5Q=;
        b=FEiUD6NmA4q7Lj9g0qrqngYzU8vV5soYbosUJyfiZMiWBd/dw+maunFfwuqyTSvW03
         nTkzlAmArJ09UypObCpx7NnIewwkl/iDuRIp5s6MKhUm+UbmgqANvqdL7P1s2PEUY2sg
         nBnOPxkB5EvpAprFdIsBAgrCLpmVhdoqk6oASVXHjd3vE3lXJLTd0BU9t+Wrv+dDX1ja
         7KoeKi/6tMbmP0PiaIp9+N2Dlz3XxneGfxFyp7qZy4RHDein73of4VYgbxF0RPJnjikX
         QhOCk/q3apHeK2iQ1RjrmTcErsw2YXZckmV1LqGKQHAM4qiVkCWs5xHBMW3PphB2OjOb
         OX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793139137; x=1793743937;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=46E3EGLnWSLxFlTim02Ohjypmi0q8zDH6vLR5FUSx5Q=;
        b=tSmCdJqz0x5U0wureMm8cISX4CzPSjuw8HO6s/38+vNdJd05Tn+/rVSA7TAVoySrAC
         DeKyofEgzY0J0/X0CDhlPrMcC/lXu7ryNjgANYscRZ5RYr+CiHVlTSCPa/wmM2P0LFmQ
         mEH0em7pd5NMqO+tBBX9/xgiR0uMUHJBlSBfllKL8cVlqkfK9ql+jXmf6WPom+uBAlRR
         k1SNrh3hTLvIOF14z8nAAPJwgcKYBRFT8zRMLPW7BkUvHnomkVxDMLVI++rnIhfF6z2t
         964+ez+SBnke/Fqb1i3c3XULyNNJvAWAu4XgAW0YdlOCnKiZTxfbsEQMf8+NauotPHtA
         AjYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvi7NVur2r6gudNvplfBZCsW6n5cFoROgHesPF5NWL+maKcCM2EvX+qHdSsMlJRO1MOGz5wBS5zoKKUFg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLh8+z+Y60z0ouNEhOFui2ohwKS0Nism+ghUAOlx51zdh9OvAqW
	RFnrD8cA2Vm3qCvIcdhvfarwy+TKtZgLSwARTcTMv71hpgWPcr6ZvXzUVxkHwIYWKZzepdVp9sX
	4wK7sug==
X-Received: from pjbsv6.prod.google.com ([2002:a17:90b:5386:b0:3ab:334f:21ca])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c0c:b0:3a2:bb9f:f87d
 with SMTP id 98e67ed59e1d1-3ae580d22admr196697a91.21.1793139137381; Tue, 27
 Oct 2026 15:12:17 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 27 Oct 2026 15:11:58 -0700
In-Reply-To: <20261027221209.1560865-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027221209.1560865-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261027221209.1560865-6-seanjc@google.com>
Subject: [PATCH v3 05/15] KVM: Disallow setting memslots when the VM is being destroyed
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Now that KVM doesn't delete KVM-internal memslots as an unnecessary side
effect during VM destruction, WARN and reject any attempt to set memslots
after the VM's refcount has hit 0.  There's obviously no need to CREATE,
MOVE, or do a FLAGS_ONLY update when a VM is being destroyed, and there
should be no reason for arch code to manually DELETE a memslot: once KVM
KVM unregisters its mmu_notifier and does the final kvm_flush_shadow_all(),
there absolutely must not be any outstanding references to memslots.  I.e.
if arch code "needs" to manually DELETE a memslot, then it's already buggy.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 218456372b11..e7c89861632a 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2041,6 +2041,9 @@ static int kvm_set_memory_region(struct kvm *kvm,
 
 	lockdep_assert_held(&kvm->slots_lock);
 
+	if (WARN_ON_ONCE(!refcount_read(&kvm->users_count)))
+		return -EIO;
+
 	r = check_memory_region_flags(kvm, mem);
 	if (r)
 		return r;
-- 
2.56.0.307.g5fe7bd680c-goog

