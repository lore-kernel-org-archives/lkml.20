Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793139141;
	b=jILFaD3GSgrHos7Lg6hHR1iPNZgbgCxvj2eLjy2Co/iq8eJGLtsiZwBSuK+e2iw0sYX+
	 t+OfL3Zybxmy0vHv9fsZoMpiUzuWvwRtLXk6Kz944Xe6cBtsz2VKhhVJ4UYPgv2tO9Kq2
	 Z0SkXEpkLS1Pxwk/59F0GXkbs3WR3ED0DaaFMgfO1h7Ua3W8mftFx67MtyAkLXlWyCt2e
	 mPAJ5aqLmpAPCQCFwn7MLhvwW6zxgtvt9lhBe3Gcay05WpHjHPdEMfTDfDUgIAMu70hfl
	 joNJJObnKFpKSb/n5bgeLI7joAh/wfUEO5QiPaYqouVcW0ulEHO43vlIPRwlL2prGmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793139141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=EI446rcjrN0x44kbFFvKS4UWEA1sDeBtgZ/wnLAywEQ=;
	b=dLOp7ULKj+/Ez2HZVMZBJvVzoNPUEgK48QWJVKHDlV5Ibiyi2jqtPa/CZKrPzuomq+r9
	 +Z0nzaVhlTqQBeKk0KtjJo917X9jMiLBv+B+HsExIjYGNN923VAeNIyuZHmGJl6BDsdq4
	 KmLF5nZEM1sDgguykRG1Y/ujeLay+PUL3U+J28llljjNHrIvoonJf4LH9LqR0FTimUmTu
	 vKULG7XSU5ypxRuYud9YrNt4el/yxITHal3a6alspwmsTydWVywG+LhbMNqJGxv/RhLfy
	 OMLqxIOz7v4aADqEMMxeEbtf91nvl5/m2zG9RmO9Uwc4fLYn+GJ0DD+BCZNAbPAZyMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AW3lw8ir;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD5360A263C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BD5360A263C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AW3lw8ir
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ea0fe07201so1664455ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793139141; x=1793743941; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EI446rcjrN0x44kbFFvKS4UWEA1sDeBtgZ/wnLAywEQ=;
        b=AW3lw8irvpQz1EVNO8y6ShweTTX/lFmzpHv/V3/DNtPpSDXF5/ewearHPBZhdtaDzh
         6UdXWCH7E0smNjLM3fBbRIHL0MqbvaMpPpX/eHvLBpOqBOrA11yfQUmt8Qq4yej/4ZNL
         Z4mxiuBgHIrf3RI7O6umg/+bXLQ0tO7dU2OtxpjalkMh9hEw07eJivrPhCdXxVAy4yh7
         Kk+lRgXUiaO5O0WpL30UYYgCRges0W52tQBy+BoHyF5mWgx7D9YzlwX0h4o4UP3noawF
         vJEoEiCU2mnP9FSSw9v29mQoowB3MWgR/nrArkJ/ugoNn4QOb0EZUUSYG8BcXIPT8ya1
         T2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793139141; x=1793743941;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EI446rcjrN0x44kbFFvKS4UWEA1sDeBtgZ/wnLAywEQ=;
        b=QvbN4JfLDcmJWiGbwlJLIRounx6DgvwGK8yDPLPLLtuKjGAD0df0Ptx288VpKLnI2W
         jFozLZnTESIJFfBHEpLTZlIlcXy8vFqoNU1CbzDTVbz351kroQYKfk4CXVlG8fURVc4o
         xtApB2ba4VoUmzrk9zMrE1cgBToIuZbwNiDwTiVMv743hSZ0x7lMhTs9VLki1sSHHjea
         7AJXa1FSk+9FFOWW1UpjzxmDnFnqv48NacYuT5KpSTK0X9xjl8vFoQwtEPeW9QjFyYF3
         F4SQ5EzJHEiwI7IeWGt/viwpW/3+JjrXDvucGJjob1gdADxsfW+E3l3Ya7CQg9cUABFh
         Aecg==
X-Forwarded-Encrypted: i=1; AKwUvBzw3/iqkM3TMhzzV8lJwKQxAYffCIL7nDCtQubw9hVcGq/AiSWcFuiznzn8YEzhF+CWiBWlrQpykQTrbKM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvFn1MxbhS+WQdEEQzavPaWja6EuBnIb26/9LtVpTR2lxKccem
	AoLD6MPZKfvaHmkw/pAng4Rtz6Hbz9/LFn9tZ8O+SwUImZ3Fs6YAzPIkMDmdiurNTRmbL/JF3SQ
	/8s96Ow==
X-Received: from plnl5.prod.google.com ([2002:a17:902:fd85:b0:2e8:774e:e582])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f54c:b0:2e9:a090:dd80
 with SMTP id d9443c01a7336-2eb0048632bmr5982595ad.22.1793139140855; Tue, 27
 Oct 2026 15:12:20 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 27 Oct 2026 15:12:01 -0700
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
Message-ID: <20261027221209.1560865-9-seanjc@google.com>
Subject: [PATCH v3 08/15] KVM: WARN and reject guest-based uaccess if VM is dying
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

WARN and reject user accesses to guest memory if the associated VM is dying
even if the current address space happens to be the correct address space.
Accessing guest memory after the last reference to the VM has been put may
be "fine" from a safety perspective, but it's still a KVM bug.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index f3f59bdf7e18..ba8ea62b7304 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1355,7 +1355,8 @@ int kvm_gfn_to_hva_cache_init(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
 
 static __always_inline __must_check bool kvm_can_do_uaccess(struct kvm *kvm)
 {
-	return !WARN_ON_ONCE(current->mm != kvm->mm);
+	return !WARN_ON_ONCE(current->mm != kvm->mm ||
+			     !refcount_read(&kvm->users_count));
 }
 
 #define BUILD_KVM_COPY_USER_WRAPPER(fn, to_user, from_user)				\
-- 
2.56.0.307.g5fe7bd680c-goog

