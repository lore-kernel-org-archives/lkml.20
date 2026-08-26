Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21230398902
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787769907; cv=none; b=kfVeuSPV65Zftx2dUMqQawiNt8nXHgigoHh3yW+N1SGTrJK8YgWQXH3HTYr+CZqSIwIEjCxBcXBhD49WUiOhAcPL2TisPvedUhyqVA2t/hQe8X+BEh1tcO9KcfQiwEYMjFKA+He9BYkegYFvi7DaEVoXzUKyVXe9JXaYIePfavA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787769907; c=relaxed/simple;
	bh=1b8Qr855KYUK73BAwj+crcS6Ne53L5zvJVEQY+vroN0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=qOEhhOvL7KfSAD3OxysXwipbJl5cW7z329q2/ZE/kYfucfdP48Yp0t54m4u+8oOCkJznC+hrjqcOoHUmnYa29gwkGMoD+v4YByvUXpUggNBHfM++fhSwqt0+hRcPhW2OfjxHTl4XI9ibwBy1YRDOIOu1j0oLRvpJwCjAgT7E6/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P/uMkde3; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P/uMkde3"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d52734fc41so26273395ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787769891; x=1788374691; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=loiXTTHQz/zpU95R8TVM392sAaOQqoIrCXBsU2v94TM=;
        b=P/uMkde37bpsG2Yg3XbYKHdh41VtYUBlahR/9S6TXIlCLXlrxln+lnQh1aRAXX5H3p
         yq7hTtbOqTFg4NToUq/rUb/0y9BKo3Uu9UYSd4ZHLv8HrgPAOKXNWUoSWunUu3uU2aUN
         AqUebaC9i5zBM3QgHpq9DGrQ73UhDgi2ykLxUSHmk1a/WjELAyHhJgPlqFV/wkju3WfS
         GLuChxI4eiZFxaHPvYo4QvAWnYbSEKAUrLFKmUNY5ZO/RCfR9sqwfHvAdtfcrjVGGAAW
         HdcLWZaslYUfbAmwfA9Cg4tGhvVK0ZHxmNM2z6r9cogGg9VUP1ljrQpUdENxKqyMpyCn
         RCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787769891; x=1788374691;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=loiXTTHQz/zpU95R8TVM392sAaOQqoIrCXBsU2v94TM=;
        b=MXn7sGXc8VktuDQ5fw0OxUFhVpZgWr/VsYGSYNknR8hIwu9G0wD9Ms2DgKqQcpHzY5
         IjzbfrJD+T2UMjib4jur0bwwaTEI0HH3UcBlgkoB3qvzCFvH+PS/TkJs28F7XBIfHLHJ
         22wrqkFtYLT1csQOr0Nrs2hd1pKl+gNgvLvjhT6Ph1IOzv+IeH27/JnXYiK7oIyoAYIE
         fwElAtio/K+7y7tyw8G+b8RAnq3K/EUhjChEhfkyIi+MYQixH5qNKv1CuxrThVCD1VIS
         aeHVxrfI/z9wkS2gprbi+j92fl7vS1Qp4AHTMpvrNpqwa1uG/OCfmXxJd/EMBeazwP2u
         CUmw==
X-Forwarded-Encrypted: i=1; AHgh+RrbfS2y+j6xPGJoU8EY02HrpWaAd8Q2zpDPV5hUqgFNj4IizsYHTfIEB+W0tyE30YUUMmCVGHyGHoBRJwE=@vger.kernel.org
X-Gm-Message-State: AFuF++mCgvQaVDFBj50asDTOh7P/IkebKoKeXhrMm02ZWSDmDjd0cI/T
	pGgxDY68UWdyMaL2es/3zKx0vyChxHDtyuJjLsuFcTwuB7PzEYvNslQKNhZuxgWqT4rO3INEGCk
	z1QR46g==
X-Received: from plho15.prod.google.com ([2002:a17:903:23cf:b0:2cc:2c68:b71b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:40c9:b0:2ce:9c48:22d3
 with SMTP id d9443c01a7336-2d707af8432mr169786675ad.11.1787769891000; Wed, 26
 Aug 2026 11:44:51 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 11:44:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826184449.814130-1-seanjc@google.com>
Subject: [PATCH] KVM: x86: Zero reserved synic flags when delivering message
 to avoid stack leak
From: Sean Christopherson <seanjc@google.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"

Ensure all reserved flags are zeroed when setting the msg_pending flag as
part of SynIC message delivery, as setting only msg_pending can leak seven
bits of kernel stack data to the guest.  E.g. gcc typically uses a
bitwise-OR to set the msg_pending flag, without initializing the on-stack
variable.

Precisely zero the flags, e.g. as opposed to zeroing the entire structure,
to make it somewhat more obvious that the flags *need* to be zeroed.  E.g.
it would be quite easy to misread the initial read of guest memory and
think that zeroing the entire structure is completely superfluous.

Fixes: 3a0e7731724f ("x86: kvm: hyperv: simplify SynIC message delivery")
Cc: stable@vger.kernel.org
Reported-by: Stefan Teodorescu <fane@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/hyperv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
index 604651cb2739..8d2669d8ef34 100644
--- a/arch/x86/kvm/hyperv.c
+++ b/arch/x86/kvm/hyperv.c
@@ -802,7 +802,9 @@ static int synic_deliver_msg(struct kvm_vcpu_hv_synic *synic, u32 sint,
 		if (no_retry)
 			return 0;
 
+		hv_hdr.message_flags.asu8 = 0;
 		hv_hdr.message_flags.msg_pending = 1;
+
 		r = kvm_vcpu_write_guest_page(vcpu, msg_page_gfn,
 					      &hv_hdr.message_flags,
 					      msg_off +

base-commit: 76671054f9a1ff6abb976583cd8da37650acdc97
-- 
2.55.0.887.g758fc8c411-goog

