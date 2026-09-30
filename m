Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABB542BEA4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797002; cv=none; b=WTzJllA6H7ym3QlsYzN9AAAEn02wDG6zHlESDGbz2BziLuuGg9SQ6tvEEaQMYkUnxs2yjc9MK9/jWG50w5eRL3DE8Y3YhyZ3dc2WGYg+sliZp9iGHvaIi60x83nI1s+4U0i2A4+fuE9BPcSoNpDWxAY38WP0PeWcYvZcYNdVqp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797002; c=relaxed/simple;
	bh=IG1RFG7JM2igBgdTr4qbALiuJCKa94wBRCLlp9vz/Yk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FSGAs3UZzzGhQ9wSe0ZPAZ6CWdQM0vWef1dR7G4F40gS7bSn7t2uRP25bF2KtiClt2wQuB6sJJUh+oTT8p+oputf+i9NFIFm8ITI7bYxTIt3j9rPnY1u5ERuziChTEldQS5ZduQdhYxBpfM2Ozu+XFKBx2BPzEKshQAxbwcfA3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JEvL+U1S; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JEvL+U1S"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2df8cffbdbaso39365135ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790797001; x=1791401801; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Zf6V7qVlBg/9H6Aj6n5GwJRdbCo9HKQWheBBXTou4EY=;
        b=JEvL+U1SNsIaOPugcePFTUs40StUfWhTSbveghtvL+HH5Ob8R+njVuwMfAn0dVeHPO
         uPn5Kd0MV5Mi3/mrqkWaHPeL51aEJKGxsdU7nCvDs4IP4YbVcXAsfjWqAqW0pwLJI/C5
         jtujCWYw09ZW9LX9NBGo9PyYezULAejI3T/t7lka0+PfhBH/o0a/vIeQNPl+2tGORkTG
         jI5uJb4EVXNCtyH3BumIUC89udX0fMPVt4XCElPImIPCESTQ2FsEGdiZN3cB246uMtLG
         AxKayQKWXt6xrb9jmbH+ZCyMNh0oU2zdM/2AxyGVOY6YopcaTktUZDquoQLRGc3XbM1L
         fDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790797001; x=1791401801;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zf6V7qVlBg/9H6Aj6n5GwJRdbCo9HKQWheBBXTou4EY=;
        b=R9yUDJe3EsB1EiBJ3lDfuXtpLOByCLW8+x1kUIqtdwW+9D5aoBki4FtzB6SFDHZCQ0
         k6xJ3Mr9vJPaZkjG+/cKnDft/hltTKspXCc3wg1twMJzZoPfjR354gSTrERCVypIUsT8
         /7cv/Bx0pHc+uNr55F6BHlWuyqgsRI7syWbdf7QRiDuJPX5XIFROAgbdazjyq0Xv/rWb
         UGj5Co6QKLMbNmoF/LYcA2RTzHQsQgG6K6zuaXbb1Kb11bTian0+3ZhtNY64EKfUUz7X
         2UW9gkH7j8GVDiWR/L075CS4tbsThKhQhW+xNKJV73aPZPNseDDWJE+N6zA8RipppqUf
         HttQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGyQOEhFXbruFN3+wGVVD4taHeyFJt/qyttmALZKK/SYUkqkOou3FRLc1a1uDfrnT7fp78x3KcwjlBAT8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUJwuW27QtvvuIkO1fjwQSkrB3zgzHwKVKRpw+aGLi1tfLaW5D
	xb21GXA6UalUPWAoE6EiH634omj4KzOoJ+V6OP2pulLXRPGxwGoALwHkHYPXX4/5tGu6dCTIuP9
	QTJq8ug==
X-Received: from plct20.prod.google.com ([2002:a17:902:d294:b0:2e3:214:e99a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db08:b0:2e2:db9f:3e88
 with SMTP id d9443c01a7336-2e2e4b85249mr18284175ad.52.1790797000662; Wed, 30
 Sep 2026 12:36:40 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Sep 2026 12:36:25 -0700
In-Reply-To: <20260930193634.3415089-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930193634.3415089-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930193634.3415089-4-seanjc@google.com>
Subject: [PATCH v6 03/12] KVM: Return an "unsigned long", not "u64" for the
 fixed-1 DR6 bits
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Shivansh Dhiman <shivansh.dhiman@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

Return an "unsigned long" instead of a "u64" from the helper to get the
fixed-1 DR6 bits, as debug registers are natural width registers, not
64-bit registers.

No functional change intended (the fixed-1 bits only set bits in 31:0, and
the sole caller truncates the value to an "unsigned long").

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/regs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/regs.c b/arch/x86/kvm/regs.c
index 62075443f6b9..f74a29621661 100644
--- a/arch/x86/kvm/regs.c
+++ b/arch/x86/kvm/regs.c
@@ -772,15 +772,16 @@ void kvm_update_dr7(struct kvm_vcpu *vcpu)
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_update_dr7);
 
-static u64 kvm_get_dr6_fixed_1(struct kvm_vcpu *vcpu)
+static unsigned long kvm_get_dr6_fixed_1(struct kvm_vcpu *vcpu)
 {
-	u64 fixed = DR6_FIXED_1;
+	unsigned long fixed = DR6_FIXED_1;
 
 	if (!guest_cpu_cap_has(vcpu, X86_FEATURE_RTM))
 		fixed |= DR6_RTM;
 
 	if (!guest_cpu_cap_has(vcpu, X86_FEATURE_BUS_LOCK_DETECT))
 		fixed |= DR6_BUS_LOCK;
+
 	return fixed;
 }
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

