Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48612468C0C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788391237; cv=none; b=UpGtMhmkrRTbUD9l40PXWkMv/xbbqt559Ltpc1+4Tn7FakhsP6HAZsdDJW/BWItVJzmGGT5Q73ClHnRBtKPVL+9Zp2HCnAT016uuAFGWpVq7pN32j/5NuZxr8n3leWmz/DLbUJQiw4LL2Z96XK/S2pVmy0KnGwFWRntS1RzUfwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788391237; c=relaxed/simple;
	bh=FSGBRuEwSzDJ3Vm1ryh1BmDfkHN4mR10cVRnM1E5HAA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=t2V/VrkPsSEWYq2BqLKj3lZnuSGlsPUbqBK+wDwE/2WCO6KgIcTBlQEw0G+/A7NiYnF0S1CQGVgrPAdjN6pEqMJR7W1KVzkaM7rwG/9V7a+VJMgDGM4kgBSW+RLDQ/fLNB9byd2DxozLjIt7uPE4Yj2t4/3AUAiJ7rnKP3Cffgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hyJwR4ig; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hyJwR4ig"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso2339104a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788391236; x=1788996036; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0Np7Ag6FWXRYQphBkLQrwzv96GttQT1QLppJ7Rhn8bg=;
        b=hyJwR4igCP4n6dYUEf3Ar4mb7hdQinNbHG1dZIMfaUmuJ+F5RN514QTV1jQn6Xw97L
         L4FYkLDqMVXYcIGe4zBqeIY3m5O9F4EfuKe5bNeHBRLlSYfFAqNsITScToPjIyM7+NgV
         Cu3vSr0E2BsM3FeM3WEFVRFrJT0hmlSYOKSGd+2Z5xS5pXeQNCuIOh9Nu0hHNmcuhXg7
         zArJfclzAXVltR8x7O23+EEkmhhhmYgVwMcQ7HUCaKp20154PWS+LOh72STp42qhAIjU
         ODNuD+3YT7Sn0t4sJc9UKVB+B/DpXDfMc4CFihHI7YugtU/ayaJadV1XldCqsf3/ZYJi
         GPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788391236; x=1788996036;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0Np7Ag6FWXRYQphBkLQrwzv96GttQT1QLppJ7Rhn8bg=;
        b=OrvrqWmUs8ViA9UJyKpOgJgmp8oG/Ax2WhRl4EcKDX+z4mLPdhteid9JUighyv75zr
         vHdB6sPyff/0QokdyQ1Wdmu4gGek8ccQW6nl0ZpWdPgqtgY4dEv+3ikQ7QYHOq7nfDXO
         wI/Ege1446UC9PLda0a7UjFfiG3ZPaJX7I/AAGBul1F86yqWT5OgYIYBvUCj/mNWooJy
         mu2DGv0Bg/+NBR3szSbD9+vKnZ/D4+kTMAMBk/wiZDe5q4dMrwv/cyAkEJmbDUGK6HJN
         8P3PtU+Z5RICtuuWsPwRMF+2RaZqogb8mfeysQATNc0RHKJeVRIX5tJue3DNzHejovLd
         pULg==
X-Forwarded-Encrypted: i=1; AKwUvBwF0I/k1/TncnM26/GUh7wKCz0QrIT5Xt9NFL6A9EARyexlYiQcLjtyIjbchn1CYnorQViFL52zrB3sGPI=@vger.kernel.org
X-Gm-Message-State: AFuF++nAlIda9wXyXV+L8cxIqs69dYoUhhjfudCbw8nSkF8fzoQg1JEC
	kQyi+CP67gcEbqEWbo+hkoemgHYcgivldbsYtKAd+c4H9GYEi9gQLdrfKXVUUoykEyXYI7MYuUo
	H7HMqug==
X-Received: from pjbli10.prod.google.com ([2002:a17:90b:48ca:b0:398:b684:5c15])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1a8a:b0:398:9be9:ab8c
 with SMTP id 98e67ed59e1d1-39aee0e7272mr10212107a91.17.1788391235459; Wed, 02
 Sep 2026 16:20:35 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 16:20:28 -0700
In-Reply-To: <20260902232028.2767071-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902232028.2767071-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902232028.2767071-6-seanjc@google.com>
Subject: [PATCH v2 5/5] KVM: x86/mmu: Convert MMU walker's bounds check from
 BUG_ON() to KVM_BUG_ON()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"

Bug the VM, not the host, if KVM's sanity check that walking guest PTEs
doesn't underflow the walker's level fires.  Bugging the host while holding
mmu_lock is all but guaranteed to panic the host, KVM hasn't _yet_ consumed
the out-of-bounds level (i.e. hasn't corrupted memory), and KVM is already
committed to bugging the VM and synthesizing a guest page fault if a fatal
MMU error occurs while walking guest PTEs.  I.e. there's no reason to keep
the BUG_ON() at this point.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/paging_tmpl.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index f925b11d76dd..c8ec47b09264 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -392,7 +392,9 @@ static int FNAME(walk_addr_generic)(struct guest_walker *walker,
 		offset    = index * sizeof(pt_element_t);
 		pte_gpa   = gfn_to_gpa(table_gfn) + offset;
 
-		BUG_ON(walker->level < 1);
+		if (KVM_BUG_ON(walker->level < 1, vcpu->kvm))
+			goto error;
+
 		walker->table_gfn[walker->level - 1] = table_gfn;
 		walker->pte_gpa[walker->level - 1] = pte_gpa;
 
-- 
2.55.0.970.g62bdec98f9-goog

