Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2AF470E8E
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762570; cv=none; b=LvOTidgupfAhjvzv07affX78gaD4UEV5B9ShizvgD1zkKxi2IMDI0jQn2V27fUzJmDGyJyrqbkSFAuPsLrLcuUxLHXx3HbnoxVpUX1MqImT8anwIcQ3QGudxhb2IZ4KQnueGOx9C2M68b7XgTpCDOSn3CY56WB6/pW9I/owS1D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762570; c=relaxed/simple;
	bh=4eSK8pU1dmh/XamK6Y3En78UgfUaTPDadfBbBp/fvUI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=axsas0nW7wg5HovQ2oeij8Q30t5BL5u5qmVxqg1G10B27Eyxsderg63O0Cim6FvJDc6TeiEtDSBBKn2NbdfhgCvQur3AU+KOrLk6rZxO0Lz2CAOoXuBShWiB7SCuri/Yk4tQykcoEdtWCQhPdPC3OVAbBCY7JhhrYLvf7vwQ2xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pgz8r9Z5; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pgz8r9Z5"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1a439db36so1344605a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787762541; x=1788367341; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BBZMmsivox8ZLj9npWSJpItnIK5TSzdBCqDSLHP2rcA=;
        b=pgz8r9Z5JP95qPHy6H0jr/Xbn1mMDMUNS1QQi7Hcm9iaPofbvxn43EgW8mJB8jFj+D
         wu8evYH3lgODrq2vl4s5CY379N+lrNq+Xux7jDC6C6Ue0R2gr1b1W1JXjbVIgbskEFOv
         2jqyRc+tz06QUDXUSX/0xam5Q008ZMt4DH6w5U7k8zWQve1rWxFvwiFLwyzBKFyri1TG
         qM3b4GGZg+mHKUZ3qyOLyu7O04X+z5s7lr59agwP1AdGGmoNIGNH1z0V4lfSDBJ045L0
         4bMwylC9l23Dqxk18rB+mMLPJ/oaPLsQ5xGiRTON7CB6PcllcZD9WS2M0gJE2tEkbNxE
         ZPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762541; x=1788367341;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BBZMmsivox8ZLj9npWSJpItnIK5TSzdBCqDSLHP2rcA=;
        b=Y1jiOkufp13vywEdM9Vs15ZzQM+y4BXxjAN/gnFpN6+w9YiiMBdOsC2Rl8gul+gOHZ
         DI0Atlq0nkHGHKbvDsqXPOWjQqq7tokcgHhOxztZwjpe5EV1YbcWrfYeT5bZDpbB9KKE
         aijixW5M66N3owUmlgGKG67lF/DRwlgbwpSEZGP1jz7UKROtbtuQRNjxTY/Ry37VYKRa
         tTE2/esqPhoW3+ipSgOzeuk/OlXiXHVf0bmXAyrbD+ZvceOaYnyGD7+hwfyfk9U+ctih
         NsZJeX7zLKtmhPiNm0NUWP8oNBt5HJOQA8qYur/IyyGPMAYnkJH1D75+/6R8W6KgNEPT
         +VPg==
X-Forwarded-Encrypted: i=1; AHgh+RpKDtt9QCOF0bwzSLoFqh2Cx6Jb86FHwsTdqTOfooWhtvafzp8BkRKGIwcbEoEjgic5qIOCiZTQLK2bASE=@vger.kernel.org
X-Gm-Message-State: AFuF++linzIZGWoKXqFoqgNsLRNusSUOFSmFgfOzyKyOgchm+gK0HZmY
	B8xyqZtCUxDrvfUNv8gvVyhcIVSzBrfpJY/3iu39pV87X+PHNfjSbAtoNKJdsZGp1Ob949NeokA
	aCr6Khg==
X-Received: from pgdq18.prod.google.com ([2002:a63:9812:0:b0:cc1:bf16:dc3c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:8087:b0:853:2ca8:c42d
 with SMTP id d2e1a72fcca58-85371fa59a6mr17184684b3a.2.1787762540664; Wed, 26
 Aug 2026 09:42:20 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 09:42:14 -0700
In-Reply-To: <20260826164214.756512-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826164214.756512-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
Message-ID: <20260826164214.756512-5-seanjc@google.com>
Subject: [PATCH v2 4/4] KVM: x86/mmu: Add sanity check to detect stale page
 faults in "map private PFN"
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Harden the "map private PFN" flow against potentially-fatal bugs or future
KVM changes by checking for a stale "fault" prior to actually mapping the
PFN into the guest.  While it should be impossible for the "page fault" to
become stale, the sanity check is cheap, whereas a broken assumption would
have a high probability of leading to a guest-expoitable use-after-free.

Snapshot the invalidation sequence after acquiring mmu_lock to avoid false
positives, even though doing so completely voids anys and all protection
against unexpected invalidations.  Pretty much the entire point of
kvm_tdp_mmu_map_private_pfn() is that it allows mapping a PFN that was
gifted by the caller, i.e. the caller would have to mess up its one and
only responsibility.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 19a501029f08..79c450d677b4 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -5236,6 +5236,18 @@ int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
 		 */
 		WARN_ON_ONCE(kvm_test_request(KVM_REQ_MMU_FREE_OBSOLETE_ROOTS, vcpu));
 
+		/*
+		 * Snapshot the invalidation sequence counter after acquiring
+		 * mmu_lock, as guest_memfd guarantees the validity of the pfn,
+		 * i.e. any concurrent invalidations are guaranteed to be
+		 * irrelevant.
+		 */
+		fault.mmu_seq = vcpu->kvm->mmu_invalidate_seq;
+		if (is_page_fault_stale(vcpu, &fault)) {
+			r = RET_PF_RETRY;
+			continue;
+		}
+
 		r = kvm_tdp_mmu_map(vcpu, &fault);
 	} while (r == RET_PF_RETRY);
 
-- 
2.55.0.860.g4b6b3295ed-goog

