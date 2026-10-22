Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792635732;
	b=iWs1Tb6wk7gj1hYeuamEzj1t8Fsy84F8OPu3nMpOLJQm+7GHuD1iGpAkofIY1Mv5fmeL
	 Cn/akatVHVffrdIXenYVENHqYlYfjEuyeWkW7Ia3m6QeGkKx51hnaPERWEsLnh7qXxl8x
	 ctvgJ7VlN2Ckn+5XtNB2uYEE0kJcCm/lL4rus/BYvE5AvGvC1gDHZ7CA1YfqmwrK0wv0a
	 v7VxW+6+qTfYT4+KhgTDxVgCIC9VV4CpBUvQFCUl6bpqanXAzBeMZIC6Tlq9k+EtHOSQb
	 QSXrbZZn+7DWHaPJq1pjoRLU5ADAnNVlFlPDI2cY+wXZMLMAquGUV0LYmOu/M0m1wNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792635732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=DBN7G3ke//fK5LgEVkVD2hWk0C91Efg59xeDWJWdH2g=;
	b=ayThoOgvWpEIVk3Su60oKs5Iijnuev1BzvleGvrzgUdp+fKyU689ak3taVEMTE+sP5aT
	 F9XvPrqGpaZWQFy/v42iUDVeosUvgUAGXU8yXV6B/0Z+AijaWHHQRRigzusQzy+SrizyF
	 TLIFFWWMbhHD/f4BYPolM+2RssvLZzOLmR2OUHgUesnZ1if2ep1KIY47vfoDfybk9phY0
	 R9whBy9ZFRySqNGpayKeQNYfXd5rLJWb/hKtLkbk6VEFrwR7xA31ZtBS7KpunjHuStI/a
	 oRduMBR0t9tMJXgQDj/8ixIbCXbgsyHbACgiA1JQ8886trurZnNMC35Jlzb+FSrrX7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=VdZRYFr9;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828D5606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 828D5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=VdZRYFr9
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so1775470a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792635732; x=1793240532; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DBN7G3ke//fK5LgEVkVD2hWk0C91Efg59xeDWJWdH2g=;
        b=VdZRYFr9MhiM6Os8Xus6euGZIniSOc74tpAN5iDcStpKM+lcfqBNa2gQI8n8fYC63r
         CPhg5CSlfsD89zjlBk+oa2kYHokKSsS0OVsXaFP1p4mEpLckMU2i9KrJ4nLlHXlFnNEK
         BlILv77Vl2CobLl5zLa64/I6O96F+BFczcVaXnsulvT9qzo9XdUyt+2TunAEFWvfP61L
         Y1kK7w7I6fp/FSZWN1TBYTaoTYYj7pCpWpzA2gNH/BPHRHQ/h71ILG2Cza1H8TxsGD07
         K8lH5KepMYcYb/4QHpOVSAbzptcJ6dnKiQD9oXxRhWCWKqKVBGSHf5V1pVC/RcfzcwtJ
         tolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792635732; x=1793240532;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DBN7G3ke//fK5LgEVkVD2hWk0C91Efg59xeDWJWdH2g=;
        b=s7R54jif7LAlduD7bAXJxu6bnraqyL2xSSL2sHBUvAH0Xq0YVstMgO22PtANe6Kb/C
         HAgXMe60DdSlsdPEs8MRbY/XJ3o/M2VPnIDnrnZwCRXNZBuhwEhPOPQ5XBZ1Y0W1J3XC
         BGr7XZI0YmFACSzYfxB6uBEbkvTOeTWDSpPg3Eju1W/qXKyxjL3RNQbNj+ixA1vv1jHP
         Md+I1wH6/vIE6sXgGCcMJwpFxlkZyUeaeyRkaC4MB77KShGS9w3UYXWgghsox0THqjhL
         90BH5wOFD6xL+fcmMi7Yrk2Ar1rPdyeb/AKLGh3ypShcejladmi6mU1ZM3n8ikxedWnv
         ejoQ==
X-Forwarded-Encrypted: i=1; AKwUvByMIM8R3qWPnboVr9QdPRWi2roEe+bKwSoSTudIfOuxHKA9eyETi7ZFtdiuDT0o0Njx4qkdDaovKMbfgaU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4wAOU1RwC0da9mDgg0Hxark5airCyZ3a8MmASgF1ppl38ALMa
	f9YEqjFnrYhJYsCsi4ysixitQ4v6vU8C/vf4cekKFPaghUwyNbWgdn6ft4q/D93VnB1T2Y0RLSe
	nhbOx6Q==
X-Received: from pjbrm9.prod.google.com ([2002:a17:90b:3ec9:b0:3a7:e2d8:4f4c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:50cb:b0:3ac:da41:ef7e
 with SMTP id 98e67ed59e1d1-3ad86f650acmr3239423a91.52.1792635731679; Wed, 21
 Oct 2026 19:22:11 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 21 Oct 2026 19:22:09 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261022022209.300964-1-seanjc@google.com>
Subject: [PATCH] KVM: x86/mmu: WARN and flush TLBs if TDP MMU replaces present
 SPTE with MMIO SPTE
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"

If KVM is buggy and manages to replace a shadow-present SPTE with an MMIO
SPTE in the TDP MMU, WARN but emit a TLB flush to prevent a potential use-
after-free.  It should be impossible for KVM to resolve a GFN to a memslot
and then later find no memslot, but due to flaws in KVM's handling of GFNs
that can be generated by the guest[*], KVM can/wrap truncate GFNs when
walking SPTEs and resolve two different GFNs to the same SPTE.

Note, this is NOT a fix for the GFN truncation issues, it is purely a
stopgap that also happens to be valuable long-term hardening.

Link: https://lore.kernel.org/all/20260219002241.2908563-1-seanjc@google.com [*]
Cc: stable@vger.kernel.org
Reported-by: Stefan Teodorescu <fane@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/tdp_mmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 44dad106fad1..2735cbb21293 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1151,6 +1151,7 @@ static int tdp_mmu_map_handle_target_level(struct kvm_vcpu *vcpu,
 		return RET_PF_RETRY;
 	else if (is_shadow_present_pte(iter->old_spte) &&
 		 (!is_last_spte(iter->old_spte, iter->level) ||
+		  WARN_ON_ONCE(!is_shadow_present_pte(new_spte)) ||
 		  WARN_ON_ONCE(leaf_spte_change_needs_tlb_flush(iter->old_spte, new_spte))))
 		kvm_flush_remote_tlbs_gfn(vcpu->kvm, iter->gfn, iter->level);
 

base-commit: 814607cd40df80d5727957adaa857e0feca43497
-- 
2.56.0.218.g1ec904b173-goog

