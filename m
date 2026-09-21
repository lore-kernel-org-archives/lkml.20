Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DB34E325F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790024785; cv=none; b=t73pdKc6fQqZJSjE3aiQYRMEXBWdgy/o3TBuwT+dR77gy7NHg9rZAK/+aQAEcFmT+H4zO25zr1h/yx8sqZIaECZ6vvFxIjwQXdG43oaCa/i1Z06bLX4xZVdcLU5WKe9aj+CFrwAKzJyXagLMxe4ZuYqaZGIaCk2ePPdduETPP88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790024785; c=relaxed/simple;
	bh=JdOJf+2+GAEhZwBCGYJCZV2CMdKHgYqKlljHYuL2tJQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=O+ELw32jTMlg0h4OCSCY7JOLHcGotfHhcmr4AcjUDH22h0fOO1sfx0WUJxQ2u7C11Ls/id3EfVkO+ikmOfHFQdDD9cY1tIG/gDRvkFLffDXUFBVh2ES7CNCfYpz+Y5t5P3TQVLnUP2tCEazomZot5dM/WncfdFsmmCuv5yIZauI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IkuDeVVU; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IkuDeVVU"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39e3c10ac70so8574703a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790024783; x=1790629583; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jDeElCc4OjANkEErvoKCXV2KgfEdeXF0F1dMXf8gxcA=;
        b=IkuDeVVUUR/q+W05XYLEFzEqySGHU5H0VmQSGl4AOsF9rAJ5gKiP4VGngpdV117eXu
         iBVPuB+bWtGY3DAmas5HIJ+RZvvFdveaDpRRqlZ0XOwDHq7gAUZkdkoNJ8Bk4BbXEBk3
         jgsSqW4TgZNubpk/hSkYrW4vSzU9oCyD65GkoFnBj1i8jSje77DLc4YUucVKTpR0TK1G
         wC9j0ZptdFNalEKnzNJhS4LAv14xBJs85nBEPCu8ZpfRJMjJT5xv8dgW0fCR1izU4Sgh
         o1bsynFf/x7BuasuUC7qYJMXul/Un54Tost1kCovadJhfT5t+/NnM37XS8TyDURQB6tX
         pbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790024783; x=1790629583;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jDeElCc4OjANkEErvoKCXV2KgfEdeXF0F1dMXf8gxcA=;
        b=mTabotTwTvyYIE3Zi9mCHwq/GTVuGrj7aEkRXCWWh9ZgQTknoZg9eqROEnqSSl6vQG
         gYkhE8awpdPTimEqzhYAW2gnN0xL0Nqq/+f7QaY2bOa/qibBnlsF3zYuzBVCz1LUZWmr
         bUVpepZteAkbJJOypDW7lWHoVpTzMqgfOoO0ne37s2LsrCI3DsE7yVcMfocoQolZrfNg
         TvUWXr5Sxyyf022kWs96fp/N7i8OQZR2uXf5AhcbrZ7fCrAgWa/27/w27S5RmmeAcBma
         +kb55NaCSjt9MJgsfihZbiksuulaSMRu/DG+JHqiLkcDxeTLXe/nu/P8M1pgxTlwCL76
         eWwg==
X-Forwarded-Encrypted: i=1; AKwUvBySOQpAUg2ocfltijHQYi0LKmjD7DUViHxFsKg29pO2+TtE4zfJKP5l0INNgJw4KLdEmOlTc6Y2CjfbV2Y=@vger.kernel.org
X-Gm-Message-State: AFuF++m2PxaP9mbF9+Bg1gWJGChruNyKcULIvXO5694jFQK6l3R25xx7
	/Gbq8HYHW4NIPMv1KbrMHeZI7usWezZe6Ik+v9Yi35r5POTkek9KlTdMKGJIPgddG8FuhqiiyrL
	t0iHunA==
X-Received: from pjbhh5.prod.google.com ([2002:a17:90b:4185:b0:39e:2690:b1a6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:51:b0:3a0:2c7d:eddb
 with SMTP id 98e67ed59e1d1-3a02c7e2fcdmr8300758a91.32.1790024783047; Mon, 21
 Sep 2026 14:06:23 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 21 Sep 2026 14:06:13 -0700
In-Reply-To: <20260921210616.1024168-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260921210616.1024168-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921210616.1024168-3-seanjc@google.com>
Subject: [PATCH v4 2/5] KVM: Use goto to handle errors during memslot preparation
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>, Dennis Tighe <dtighe@google.com>, 
	Sashiko Bot <sashiko-bot@kernel.org>, Ackerley Tng <ackerleytng@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

Use a goto to unwind early memslot changes if preparing for a memslot
operation fails.  This will allow moving the creation of guest_memfd
bindings into kvm_set_memslot() without needing to copy+paste the unwind
logic.

No functional change intended.

Cc: stable@vger.kernel.org
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d9da8b51614a..24cf96840827 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1941,21 +1941,8 @@ static int kvm_set_memslot(struct kvm *kvm,
 	}
 
 	r = kvm_prepare_memory_region(kvm, old, new, change);
-	if (r) {
-		/*
-		 * For DELETE/MOVE, revert the above INVALID change.  No
-		 * modifications required since the original slot was preserved
-		 * in the inactive slots.  Changing the active memslots also
-		 * release slots_arch_lock.
-		 */
-		if (change == KVM_MR_DELETE || change == KVM_MR_MOVE) {
-			kvm_activate_memslot(kvm, invalid_slot, old);
-			kfree(invalid_slot);
-		} else {
-			mutex_unlock(&kvm->slots_arch_lock);
-		}
-		return r;
-	}
+	if (r)
+		goto err;
 
 	/*
 	 * For DELETE and MOVE, the working slot is now active as the INVALID
@@ -1987,6 +1974,20 @@ static int kvm_set_memslot(struct kvm *kvm,
 	kvm_commit_memory_region(kvm, old, new, change);
 
 	return 0;
+
+err:
+	/*
+	 * For DELETE/MOVE, revert the above INVALID change.  No modifications
+	 * required since the original slot was preserved in the inactive slots.
+	 * Changing the active memslots also release slots_arch_lock.
+	 */
+	if (change == KVM_MR_DELETE || change == KVM_MR_MOVE) {
+		kvm_activate_memslot(kvm, invalid_slot, old);
+		kfree(invalid_slot);
+	} else {
+		mutex_unlock(&kvm->slots_arch_lock);
+	}
+	return r;
 }
 
 static bool kvm_check_memslot_overlap(struct kvm_memslots *slots, int id,
-- 
2.55.0.1082.g2b9226bbc0-goog

