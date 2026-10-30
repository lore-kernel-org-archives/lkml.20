Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395280;
	b=S+V23sQ5/z3i4ogP28O4shW55xNZjwuaSYq+zMGeVs2w6g8WW5rBwsqv3co+aiISlan6
	 wOC3XLaU0aJk5rmQ7pwGEwbPdtSRUHZ7oe7uZ6xKMIT1NrGV8x7xMTyW1DCbl+dmQp47s
	 Orx5NHSH+MQl3TyFAkkIzhw21WmLiuVfzeP+Jucabm/c8IUiWXQ7PZDgPZMz0rlvjThmO
	 qengGBOgid4/Kz4bhYD/FDEeZc8DaCEERoTf911N9mWsOF0KLizcbrtdvrhnIaP5Re0mu
	 UAeZx/urwZ90yb3AVItxBdNc13ZWSXyytTdQHZbvffeuL/o027XJT2E+1t80R097Qgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=MEhWTFe6jtxX2Dal10Wapygbfs7VfCvFh36BKYtVScI=;
	b=h/9N3DBHhHrkVPXKluUQGjanVZSMyu0kgi2yyGI/BC4eRrwqgxE9z35WCBLaMb6UauQ7
	 JJ4OslIE/BK9lI9o87i+TkmvUVwZB758+8WqhrFzPnOOsEjXQh15S+onWK3hpSaK3uG3T
	 Mm7czPYwK58FD8CpsMMpTo+4fuM4Fj9cBKTv2R1tcRscKRiV3t+VaIXQt3nUmEpR2oLln
	 OcV4mMye0bMzIHLHK1azXxf5hFMlO59VDOTUtR1p3YHBHSQ2nprvQkfabmw3I5nq262uo
	 k04Aglp4IMHKM02NqWKmJUz00ZpmnQw2Fk7LCMVhIi1FiBHEyoGene/Rq/N5cSevRaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="L9/I4MRO";
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1551260A3834
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1551260A3834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=L9/I4MRO
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cca35cf9f77so686969a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395278; x=1794000078; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MEhWTFe6jtxX2Dal10Wapygbfs7VfCvFh36BKYtVScI=;
        b=L9/I4MROpIUaWaVHMpI4y9WQFiUA/81ULVBw6yuBd7Fyu3T7XxSq8PdTk47iMRW6Qa
         50Pv7uuRm/3e7vtQnJvjf3OeMhCYAqhEenMyN/aKGJO+oKLWAxWud/n7n9VgZ6pk2Ylv
         4jVO3AxuEA39T4cxKWG9fS3EYmrSP6tBA+JRC3+1UulY959Ja5AebvO5Yqu+ip3Amuk/
         w7oJ6GUD6/ki+gpXqVpccOWf4XmKD16mVBSuNxl8YVJy/UI5PTfC75+PHiz4B7/D2DTe
         gMhOBccFyWL/5qNnG0n8WIQUZVxqV/v19M2L9QzggSp45iqgjxHjr/tjhUKaqY78n6hK
         IPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395278; x=1794000078;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MEhWTFe6jtxX2Dal10Wapygbfs7VfCvFh36BKYtVScI=;
        b=L1znmOcf9bNPoWDHqSxIgAmteIURbOg18mPFEicscSCKo8OzZgefglkTAlhkOeUkd7
         avEA83lRln8/d5hY17Gtx3FkRtUxK76NAe7JYoBqnXPdEyc1Iyy9KMak1KyKVlYEDuUP
         zVEqBduWUStOd3D0ZOZXV9uCcpY1Q7yc8fcMsC4d73ppeGB/JAqjimN/n7LZ5IDvTB+P
         4r+BQsydiumyHhkidFM6KcdWtnSHadGeR2cCALkHYY3BLFeOixzmXGLljLrJ0md+lDiO
         knAkOfFLyeZBG0Nhq0x3Kc3sOYUDFjzXoyB41LtxKst3lV0sW36FzzLMMbG5bVeuqJI8
         Ow+w==
X-Forwarded-Encrypted: i=1; AKwUvByAQ5ZhtuJPqQ1m9c7ncglR+nS+9CuhqTDRSeN3YePnwceGFc5MHDiBvdt0njDZdU7layVvD5KY9TSOmsE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzFO2Rllr+YVg+1qFbX9Uo3ERkOXnM3NT7Qqoyc3gmrPblaElD
	FV9nXLajJSrIHf6bszzmV/2goXWC8dnQJNe/vw0O10PNCcrajdZS591+8bSsujCD5a08r3l7r2r
	WpZw/tQ==
X-Received: from pgbd28-n2.prod.google.com ([2002:a05:6a02:64dc:20b0:cd6:1088:b8f3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6e8e:b0:3e1:c08f:c41a
 with SMTP id adf61e73a8af0-3e928daac3fmr3216721637.49.1793395278183; Fri, 30
 Oct 2026 14:21:18 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:20:52 -0700
In-Reply-To: <20261030212112.2598640-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030212112.2598640-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261030212112.2598640-5-seanjc@google.com>
Subject: [PATCH v4 04/23] KVM: x86: Drop dead check on an existing memslot not
 having any pages
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Drop the should-be-impossible check on an existing memslot not having any
pages.  Ever since commit 0577d1abe704 ("KVM: Terminate memslot walks via
used_slots"), KVM returns NULL if there is no memslot.  Before that, KVM
pre-allocated all possible memslots and relied on npages==0 to denote "no
valid memslot".  The check on npages was deliberately left behind to aid
debug, but that was over six years ago.

Side topic, there is no need to check for KVM_MEMSLOT_INVALID as it
should be impossible to see an invalid slot while holding slots_lock, and
more importantly, invalid slots preserve their original size, i.e. the
npages check has nothing to do with to-be-deleted/moved memslots.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 32563a91fba9..cb8b60da5b11 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10043,7 +10043,7 @@ void __user * __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
 
 	slot = id_to_memslot(slots, id);
 	if (size) {
-		if (slot && slot->npages)
+		if (slot)
 			return ERR_PTR_USR(-EEXIST);
 
 		/*
@@ -10055,7 +10055,7 @@ void __user * __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
 		if (IS_ERR_VALUE(hva))
 			return (void __user *)hva;
 	} else {
-		if (!slot || !slot->npages)
+		if (!slot)
 			return NULL;
 
 		old_npages = slot->npages;
-- 
2.56.0.385.gac671c819a-goog

