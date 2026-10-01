Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DF25304CB
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790886179; cv=none; b=aH0gI/9seYj2HhMrIHR0LICvsOI8sxkwgmXxQtI5BYyLd6cGyEUnU7ndqYIj3qQuUdSziUfKdcGbdpXI9wUpm5ClZScqIjHJcw3iilFSTjjame9M3q8cKfpHQf5yBcFd7bNrIvmqsfB1quiDIsFIvvcvoGncr12qghZjVuMShUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790886179; c=relaxed/simple;
	bh=xWmI4R5U22NJjAIxqajbiTM9PPBEDTvKud9hixV72Kc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=htXhTw81T0OcK8niV99ZV6wvqd9A9oxgUJBqxD2MVoB/eDiF7FSGSBb3zMCrjyPxLu38VBLvmaoPyfTki3OQNIfbw2pzW6fURLPsTgW5aiI6ucnghupgGDAY9Rs66E7pdcjMBhihdVuPnGZXN/qZBjHs7Y9AStUq2kWc8sYDh0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bD9lELGM; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bD9lELGM"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso4758818a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 13:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790886169; x=1791490969; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=odUI0VjKINbAApKe2J4PsRbiL/cueYQz4jU79+gDb2k=;
        b=bD9lELGMDXUxOUCnN5VTR+kguxiy+a8p0DtnBvKnx+TRRLdsK8NtV08MJdN5zLFJHV
         puBaSLMjzeJXWY0PBe0g787BILr3O/1n8r4MUpIMakD/PkVRs4kgREytGddJ84LuQH2/
         IjHCKOElIBOh1kQZuDEKxhz0SIpnurmSZ8eaElvXdZqgBjAOXVhbdiSZJMneaf2aCdf8
         oTcEU4KmlA+rUZWz2BpH02B9VcPbsm7GAzL+3Q3j+nl1g7PCLCZgbNImSRS32gt7rEDg
         qUNJVIQFBmDkNSYFxFjF1fzWrc67sYb/23YP7wsTkG5X61aTIw6PiPLyNDOTKq9oYWcd
         yqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790886169; x=1791490969;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=odUI0VjKINbAApKe2J4PsRbiL/cueYQz4jU79+gDb2k=;
        b=CYxoocDAY+9mlT0CCGAs6nzLBUAoEovDw9N4ljrcL5ELnxDPeMQtZH3Rn2dREby/Qu
         Csm11QO/Nad1IWQLQwlnb2xt4UdZKW4/LFZ4aPlf7iUd1ALlq1AeWmVXUDbVvoapsEPU
         13PGwvwsRl7pFrafyNEK0+zgKE2o3xOFVYpn9/byoK1htc/Eanez2s9pPdM/miSRar5F
         Kp8T0GQYPnocBCW1AJGEQ48e0OsSfzG5fd7KygiQDGIQTszBzLbA4sMPet0J8VW5e0Cp
         DLuyZaZyqgSl7B2OL0E7rRD3WT76b/sAASa0n1WJbczB3vyM4Ise8YQi/ImuK14epuqD
         LP/g==
X-Forwarded-Encrypted: i=1; AKwUvBxTAa0VXxUdk/kbYh4KQmfETEEqF8yId3jkqlwwLtPOmkk/DwRZm9i6YiCoQHtcsNEDchsN6fuUgP5kyBw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTes7G0E0MEoB4eYTUufPibvSj0ufPKYfKydeCE4GL2i12lR09
	XWWNaDGfd/YvXr/0PiePpf16UDCeY54+G5L33d54kmBgsAGAIgtZFlxrhWkn3Al8eiDfs0Rp99Q
	z9kL9jA==
X-Received: from pjxd7.prod.google.com ([2002:a17:90a:c247:b0:3a2:a95e:c620])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:268a:b0:39e:2e79:7ce7
 with SMTP id 98e67ed59e1d1-3a6ce3b937amr517701a91.6.1790886169237; Thu, 01
 Oct 2026 13:22:49 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  1 Oct 2026 13:22:30 -0700
In-Reply-To: <20261001202234.3794060-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001202234.3794060-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001202234.3794060-7-seanjc@google.com>
Subject: [PATCH v2 06/10] KVM: WARN if KVM attempts to do guest-related
 uaccess with "wrong" process
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Now that memslots are torn down before kvm_arch_destroy_vm(), i.e. now that
the massive, unaudited path that is known to have at least one rogue access
to guest memory should be short-circuited before attempting to access user
memory, WARN if KVM attempts to do a user access to guest memory with the
wrong address space.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index b37cf275ef79..2a88e4ce145e 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1352,7 +1352,7 @@ int kvm_gfn_to_hva_cache_init(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
 
 static __always_inline __must_check bool kvm_can_do_uaccess(struct kvm *kvm)
 {
-	return current->mm == kvm->mm;
+	return !WARN_ON_ONCE(current->mm != kvm->mm);
 }
 
 #define BUILD_KVM_COPY_USER_WRAPPER(fn, to_user, from_user)				\
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

