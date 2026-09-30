Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573B146C859
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797007; cv=none; b=jFs+W5EXlWUiepH9mGRgenE7Q6Wm4DIA2IPP7MBPUJvK33uuSlDgAEBkB/JSnmXROK76WBp6DOhO9znr8TQVt5s5vDoUbrUCd3dlMM9WTbTl5cgs/xDKknESgqQ2X3WaquBpeDp73VJ1d4O8pr4x+2faCJ1yV2MOwRNEhU3rTIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797007; c=relaxed/simple;
	bh=MDASNbgoJfxIWQptpUPAjqRzqDBOHMVhcmtonFQohYk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dWHxnhcprjKqhM75DxBUEALAEnV1u9mf4QimbcaHkPktxTftYqo8+JP66X6+wNCYh7y00CQ4742y3BP5PhEChSYv8QQpviEnnhhlVK+4v3ex7J1U0S3dvghbd3TFutE8ZMvOx/bj5JnC/nWm8/cBsIuJ+8KRX+zSpEAtYAU/ees=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MRLiUmZb; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MRLiUmZb"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cec4226c70so45754265ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790797005; x=1791401805; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TO3xUvtUv8iOIewFINcG0bzeMMV0ynS9Llc7pxoXl7U=;
        b=MRLiUmZbF68nnO/3Crs9JEF6HDlco/NoTseWydoyVLi8xRWXvtRx+V/2LsKAyxXC6L
         PeTfLPNuMAJpt98/0VGSy9FHUz6HcmSeADyDr3vehFLeEXArZG0lERt8YQYOKEKUH/qS
         IromQUWXj3GYewLr90cclsr1rFrdHzrah5nJJRwaFsApeS88YszCBMM+FxX8C0pcZFzV
         KkltCz3nEzVEp0GNsQYt4zbCoUlEkpmPE3GcxxcLqkRIN5isiLOLMZaqXm1k6AFeg3JI
         S1zn2AoYzzbfp61BghwJpjad4aLoy/fa+lNGgKsHVLxUJDS0FTmZj8XAquV6Z9GaX6i1
         uN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790797005; x=1791401805;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TO3xUvtUv8iOIewFINcG0bzeMMV0ynS9Llc7pxoXl7U=;
        b=FwsY6RN6VIgQu7428PyI8UnEUqSWIMtqW+TKH35dRpMAlmtzY55OJrqoqDS4enoXg4
         7aNM6l0vXDrVEIS70Q30Zudor+1hLGeOXMhjAQ4dyRvln+YjsmrHkc9QDpEnbyPcd5pM
         /7eH0Lm2LSa9uChyfc3gOOMz5zspHZJjN7XL/aBtfMQphlkng7P/eChUXBVJ9RDcVR9B
         jxGe6Pq+IxCZZcrqMZbtfac35TvINPiXNtvHEQtYzBjmsOIl3AedRAy0h/dzl+uQZkc1
         rAd2oAO2wlOjjnKK8qh/jN+NZAWO9FfLVO4Gp6oZa1MWxqdISZNM/Wbk6UJbqKN+dZkq
         dSNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlWx7Gvsq9uiV9Cf1ThRI8ZkNkMecHAbk8d5+rCjfnRfeXFbx1gyHaCHwq0Fh4Zrn7HUCRGy7P4/+pJ1U=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4jRormKoAqM3buKeMD3nKoagE5h95x3gSezlLcKBjCMOnNhkx
	1VLqKBROUnpa6XEIxJneT1PCh04Mb8Y39/y5/EnTjgV03+Esz4Yj9jC86J9emXqB13KxAgUZ3p2
	RydHlrQ==
X-Received: from plec2.prod.google.com ([2002:a17:902:f302:b0:2e1:2dd1:e080])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2303:b0:2df:98a2:a2e2
 with SMTP id d9443c01a7336-2e2e4b48e3fmr18870695ad.30.1790797004526; Wed, 30
 Sep 2026 12:36:44 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Sep 2026 12:36:28 -0700
In-Reply-To: <20260930193634.3415089-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930193634.3415089-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930193634.3415089-7-seanjc@google.com>
Subject: [PATCH v6 06/12] KVM: x86: Kill off DR6_FIXED_1 to prevent future misuse
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Shivansh Dhiman <shivansh.dhiman@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

Now that the only user of DR6_FIXED_1 is kvm_get_dr6_fixed_1(), drop the
hardcoded macro to force all references to fixed-1 bits to use the vCPU-
aware helper.

Opportunistically reword the comment about DR6_ACTIVE_LOW to explain why
treating fixed-1 bits as active-low is correct (barring a *very* egregious
architectural goof).

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/regs.c |  2 +-
 arch/x86/kvm/regs.h | 10 ++++------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/regs.c b/arch/x86/kvm/regs.c
index db43ade8ceb1..0c76cf17e884 100644
--- a/arch/x86/kvm/regs.c
+++ b/arch/x86/kvm/regs.c
@@ -774,7 +774,7 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_update_dr7);
 
 unsigned long kvm_get_dr6_fixed_1(struct kvm_vcpu *vcpu)
 {
-	unsigned long fixed = DR6_FIXED_1;
+	unsigned long fixed = DR6_ACTIVE_LOW & ~DR6_VOLATILE;
 
 	if (!guest_cpu_cap_has(vcpu, X86_FEATURE_RTM))
 		fixed |= DR6_RTM;
diff --git a/arch/x86/kvm/regs.h b/arch/x86/kvm/regs.h
index 3ca5cd8a8d95..97c17b120a57 100644
--- a/arch/x86/kvm/regs.h
+++ b/arch/x86/kvm/regs.h
@@ -38,16 +38,14 @@ static_assert(!(KVM_POSSIBLE_CR0_GUEST_BITS & X86_CR0_PDPTR_BITS));
 #define DR6_BT		(1 << 15)
 #define DR6_RTM		(1 << 16)
 /*
- * DR6_ACTIVE_LOW combines fixed-1 and active-low bits.
- * We can regard all the bits in DR6_FIXED_1 as active_low bits;
- * they will never be 0 for now, but when they are defined
- * in the future it will require no code change.
+ * DR6_ACTIVE_LOW combines fixed-1 and active-low bits (bits that are currently
+ * fixed-1 are guaranteed to have active-low semantics if they are ever used to
+ * support a new feature).
  *
- * DR6_ACTIVE_LOW is also used as the init/reset value for DR6.
+ * Note, DR6_ACTIVE_LOW is also the INIT/RESET value for DR6.
  */
 #define DR6_ACTIVE_LOW	0xffff0ff0
 #define DR6_VOLATILE	0x0001e80f
-#define DR6_FIXED_1	(DR6_ACTIVE_LOW & ~DR6_VOLATILE)
 
 #define DR7_BP_EN_MASK	0x000000ff
 #define DR7_GE		(1 << 9)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

