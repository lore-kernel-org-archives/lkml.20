Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700857;
	b=oDXHa20GbN9iiBPICBBmucKJBuJxvc4+8A7xLKups27KEosHIJq9VmaGJaVU4zi1+qaV
	 pikyBCArVge5aoh2WnTyGiqvym/unUXKlJUWmTabUnfv2X8p/2xygs4ZzHfIdmeI0Hby1
	 EzwlEH+lvhyrJKpYssO8k5zppOa7on8K6popEefadi7qePxxqcsQMANYJf/yKoxCLsSdL
	 EhKpLSNhnXoyb4kpxtkqFrKfaYX7L5pitnxbX+4dCK0bu5eKa1jh8yoXthHAWjGp6eVRd
	 3idySDh1GWRJZR9f4p1iqcXn7kNoexhi2Gw1xnjdzRnaj5XrZt88Kp3uajE0ClkETEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=CmlLUlHh19saemg7b3QpaN9wK1Oa5vIw+YCFEOWdibw=;
	b=SQcnQr9ejy6kWLDtSoeZhFMLe3pRFfhUdK5w70tScaBtr2tpFzpwduuTr34kQQ868poV
	 QrRAcXjpfonfddY8qZ1T2twJrS+c8VpttvKWoxP9FFtDNf40B74LbrFJj18DZsvrH9GFY
	 tX4qU2SosqG2MqqMMLNMFMAkTEbvUm7Ol4cHxx9WtGT22g1oVohUe2LWYadIBWYEFSbyt
	 XA//k5NtvTkLi22Mygv93Y4nhV5c8ROEr2aX/chmNvywURcRb+g4JBt1FSsMtAE8Xtny6
	 rpQFOetrTX2OAoj4LI7aRDQW2sgo5nNGW1DtrKFghyPMviaVZ0L9k+HIYrhpeqJS7pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=OfxH6KeJ;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3C3606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE3C3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=OfxH6KeJ
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a03834d8ffso324195b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792700856; x=1793305656; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CmlLUlHh19saemg7b3QpaN9wK1Oa5vIw+YCFEOWdibw=;
        b=OfxH6KeJ7E67dvFuBfGD9iyfsgfriMJHxkJvWXC6G0hjmQDrS9CoeYgEu+ffPUr1//
         84SWNiFXCxJU3PQnH71Q7GPEOMMvfXKddLW/GAm5c65KrSw/mQyH2q0jjcYcLYN06jyk
         tJqBAjqsg/gSwUC0yqgT6QWlbmjWWR7opoeAsMIPvwrQEJZ7bZpIX7+jWHWCWqTFxSXn
         B8GV7THukFvINvVQ4VJJESPzpIKi+ceP5DTkbCogYMFSOixMxXTgyDvwHIjY5hkOCPCI
         BqMs9mAk+n7RQnrbZhIeS67J0Z4maZV4jbYZm69GXcycd/7u2FlBGd/qvJCPZvq1QEVa
         y2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792700856; x=1793305656;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CmlLUlHh19saemg7b3QpaN9wK1Oa5vIw+YCFEOWdibw=;
        b=0Hc4JGuhYCkjmDWwhY0YFJVRicYTiA5Vw73kGRV1Roq8WSSZbm8j7J9sQNmU5HkItU
         p3Qh9sMLirJEa2FmFIj0ON04APgXFOwCqTR7xJJgFWYHbIUJSWr9yPCcxh0uNVhq9YR7
         KyHwpU++VgS5StKND+SzLRahR459JwdKFY0PiNvhlcZBWXNFht8/65s6RoHIvJfWji9t
         GAEO/f9FojoX3h3OHUt3WPDFxqGeFALVGTdJwzbOgr9AgbAuHyF9LDyuHdUi/xRYvvtD
         A1G+eISRtJoLbNkbb5YYlOam2/NgcotbSkNczbJfdzRGMl6ukaOL4rdkxh4eXWZu5pzO
         VK+A==
X-Forwarded-Encrypted: i=1; AKwUvBwUiwbfyZKFwLo5f+T3BMl7Dim8YaueLmfijsFP9TBoBhPUIJVcXIAjwsUDdzPaZIeFo+ZmP1Y7Ze/DV2w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXfHdz4Ha4Ep4S1Ab65Zdv8inEy7V2luEGkqvr8yTcQ5gSNkzr
	YDnZkXFTtaRHCnkKkYw9z9O5NGOGOfWB2+ez8IbPtTQip1JavyB8LKRJ2ZYwlLbM5qb3yBE1Ig+
	Z53jkjA==
X-Received: from pfbb9.prod.google.com ([2002:a05:6a00:ac89:b0:89f:827e:eb47])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4b16:b0:89f:e248:5727
 with SMTP id d2e1a72fcca58-8a2c5e3a37fmr256625b3a.6.1792700855792; Thu, 22
 Oct 2026 13:27:35 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 Oct 2026 13:27:33 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022202734.592745-1-seanjc@google.com>
Subject: [PATCH] KVM: nVMX: Nullify cached vmcs12 pointers if entering VMX
 operation fails
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
Content-Type: text/plain; charset="UTF-8"

From: Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>

Nullify the cached vmcs12 pointers after freeing them if "entering" VMX
ultimately fails (because of an allocation failure), so that if a stale
pointer is consumed, KVM hits a NULL pointer dereference instead of a
use-after-free.  I.e. crash the host instead of providing a potential
guest escape vector if KVM is buggy.

Signed-off-by: Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
[sean: rework changelog, drop stable@]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 9b0bfa2f854c..3509a84acde2 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -5463,9 +5463,11 @@ static int enter_vmx_operation(struct kvm_vcpu *vcpu)
 
 out_shadow_vmcs:
 	kfree(vmx->nested.cached_shadow_vmcs12);
+	vmx->nested.cached_shadow_vmcs12 = NULL;
 
 out_cached_shadow_vmcs12:
 	kfree(vmx->nested.cached_vmcs12);
+	vmx->nested.cached_vmcs12 = NULL;
 
 out_cached_vmcs12:
 	free_loaded_vmcs(&vmx->nested.vmcs02);

base-commit: 164405e8e9a0378c7e1aff2254625a6553a291f1
-- 
2.56.0.257.gf7497c7d27-goog

