Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EC15304B4
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790886178; cv=none; b=uU0IhuXeowhoBiTFhnMtLFiY731JWVh9AE4N5Fqoy//V4q6R5LcUbg0JuXUPvjhZwTA5xqD3RVcD0dyXQeq9Kq1SL3wJ6k47Dz0rbDJ7IKE72PSzENJrAAcPYreC+qRdsSVkODl3ZcsTeTFT6ijQhBI42mVkvbKXEJy9yW83LAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790886178; c=relaxed/simple;
	bh=ahVJWHj505qxPz8+R1JEO0RsWMwQJzs+wdjA15BZGzA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TyyTBMmdrUNVOKO09oe2dIDBqfdHl1dmlzLf/VAF+rF2bbkVfC242aHa3bfjItk01RdZnHX1MrPC4AgaBAoaei/GX0En+riMfQ0e6n+9BRAMyIlyjQrnQ+Ks/VR+W/z18jjCEgRjsYcadIsOriYrk2jfRWXl0VyB1nJRV0Mjm9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j5w8b2x+; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j5w8b2x+"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e2dc7312e5so22102565ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 13:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790886167; x=1791490967; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qdNDM6n2ZDbcN7ldHmyQd+gWcanpH4YXON8+JKW9Ils=;
        b=j5w8b2x+nxi73huhKKi8MsMqKd1ltt0WHcY3dCN90KAvQr4liGEdhudhBZYSJHG7Hi
         SK+3zH7M7F2YXGqDTEYxVXu4N/xvB6r22TjtCTSS8+LYGPiycrsSLws3IU7XcNGmawXX
         zfg1o7xGzt/4ET+YZ8ZIGovTeTzU2qsG8JJ8gf4np866WoRpMW4hO/Ql4NMDs19zDpIL
         AlcNDO0AjaJbtGK3EmY5KMs5OUP5Izt//tAXr00VQgeUcm8HfwerRCz5c9pXcN9YTACU
         ZLjAWmiLb3ZsOkC6b3h7XnO/WvwFLLwron/zE9ESCT/z+hu28T7eDDxjKpKoDLXbeYiB
         r3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790886167; x=1791490967;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qdNDM6n2ZDbcN7ldHmyQd+gWcanpH4YXON8+JKW9Ils=;
        b=kXEwArHMHCFvAPnWQzOs/Kx2fAZ11qwakW/EHzUO4tppoDJB8g4QZggbbngDRHz57K
         77DxDvkf2eNVfXErqXReqiQvEa09ZIyE6+2LkgEOEtYb2Wbqa5mPo//a8i3DDNPi5tZy
         nQwavW8rf1LxXpoxFSEAypR8Zh4dPILQ+ohw8VY1SyTZKG30OmYeWQBtmVbVQGe6KMJV
         xYvzU+H8xOuUhtg78kUhqtvyLushc27DE4bAh/NhT3HVPgsIrok5/kh9WGMRB+EjkT7o
         PqC9N/uy+ZLnIsYUS/iwFXHwOfEg8vMNKGyVlQw//qeZkprLiFLM0mVtkpXF2PDqn4ej
         guWA==
X-Forwarded-Encrypted: i=1; AKwUvBzIP7h5lrafXtBeOcGhsBOdRvhTMy9VnMIRzuuBBn3eDvFr7N/6I0/ciDv7w77TXd9VVzWvDy78IeIbtao=@vger.kernel.org
X-Gm-Message-State: AFq9FYKt6mzm3IMdNflFWvMvZzIiAOTJutjnrvTyT25VKJoz55/yFuxN
	zVwjcbKzapLdyQ9Z05RMrhJa7dUup2ZHv2jIK4Gbglus4QjVDLOUBerVSN76DsLAQ3cDFDx6Q0n
	k1lDPCw==
X-Received: from plsc13.prod.google.com ([2002:a17:902:b68d:b0:2df:4aa4:16d0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ec84:b0:2dd:c100:4259
 with SMTP id d9443c01a7336-2e49b6d1e0fmr4572245ad.61.1790886166440; Thu, 01
 Oct 2026 13:22:46 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  1 Oct 2026 13:22:28 -0700
In-Reply-To: <20261001202234.3794060-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001202234.3794060-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001202234.3794060-5-seanjc@google.com>
Subject: [PATCH v2 04/10] KVM: Disallow setting memslots when the VM is being destroyed
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>
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
index 9a24c3064896..f368240aa1cd 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2015,6 +2015,9 @@ static int kvm_set_memory_region(struct kvm *kvm,
 
 	lockdep_assert_held(&kvm->slots_lock);
 
+	if (WARN_ON_ONCE(!refcount_read(&kvm->users_count)))
+		return -EIO;
+
 	r = check_memory_region_flags(kvm, mem);
 	if (r)
 		return r;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

