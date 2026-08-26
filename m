Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C49648AE1F
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787781184; cv=none; b=XRWFD2Wewlpgu/y7bEsH0wUgwTLQM4EtN4gszNBUPelbql6EeIZqhv9PFr1ztYJXJWI1JIrtsTDGwsTl25669nmRSo/73+Ep9S6Q1EoVmg8ZlotUIJYmWH0N/fujNW1F7VtcXZjJ3KfRvVfXZIhNJbp2jHplxXNYkQFcVM+p6rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787781184; c=relaxed/simple;
	bh=AcusNnLxo2Z7Xde81SP/bkiy3fdpyYBq4gOw5irh9Aw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N2D2+M6FCJOC5FcehLj79H852qjxdcGxYhFaovXJc6OnTe5uQH5T0zxUNUFF3m8pvsfNfFUC1gZzkXNLwFyN2r22FBYmTqYOwD1Opk8HJrRuOu0gvDzCC7gsk1PX/UtBN9QB3r3bG8MdZ109CL2BuZx09z41RLkeCggawIZpHzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HJjhs3Hl; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HJjhs3Hl"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8486c3411c8so1932892b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787781182; x=1788385982; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jSM2PeQl6/o7PuZeCaTU3am0H8NptBv+w+O3HDayOjY=;
        b=HJjhs3HlhSyYxVUuYE7mI9CrUuv/aMase8+G6mOuUmHeacsHWIOalATwurmd92obzN
         u6N1mMPX/rqEL2QDkLsNVRAVLtulHziAnuW0JJfQ51T665/O7KEDS9v4GNJHPI4omBuP
         R4+pIp+CGozdSo22tkCVnKJhj0gjrrhbAgN8VYlFTdTOD3H9MT5ifZ6H8mUswZwBoUIv
         kGkbI4xAF8Jr11GSHJRtt3pZ5IQhoDyezvmt9VFT7qTWMOpbhP6kJ998T1MWjqicEOw1
         W/2zEuQXdlc57AfSLYJZL5Zw8Z/eW4B7nZYBhOG4I9xkThdBH02upYJ1D9wpqucaSyFG
         PRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787781182; x=1788385982;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jSM2PeQl6/o7PuZeCaTU3am0H8NptBv+w+O3HDayOjY=;
        b=GCNjQtzH0C8r4wNT97AiYx3FNTREZZDEZvizi8iYCbAya3TQ27CHXos0G/qJgGNWI0
         k+vcj2Mwp+zQ6fhAt5oB/HMJjngkgUrxCwc2mPcjQINzsJrsVtRJqXrL6iPnJ++9dDgw
         XGX7dm905nNAHUpoGUWnk302KJReRRw1GGE6MD+nNCnLO1b3Hc043ByGDQVA2mCNK94q
         ix19W2jZIh58EqmSaBHN44O4SF4uqSAMfhxgTDtXo5GlVrPoXkK/Wx4p9cXv5yJKljW2
         pVPh6P2cq6COXIFJgxmfBNjYZSUm1ZD7zbWOI5kwMzwdw3nAUOlAsJr2BmAWUlIjq19q
         BKWA==
X-Forwarded-Encrypted: i=1; AHgh+RrMie2ht4DQFHRFnkCJsoFpLPa6Ug02SrLDOp96XyUP3MVAjEDoxJbBEFW2fQQ22lOPBQ/44cxKVtpYA/U=@vger.kernel.org
X-Gm-Message-State: AFuF++kkoBpmNiWq/N4/D0eEB5EE3EdOXpEkhSJE8RaGNSnVdDif8/v5
	rTZZF1njIxaHAQaQZQkHHhYr8XzaKpDKazgFcOeXheQqdinCe0sqXVvwH9ZC/mcbYswwsYWjS8G
	fx5XiFQ==
X-Received: from pfll9.prod.google.com ([2002:a05:6a00:1589:b0:854:7643:4f63])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1403:b0:846:4d4c:23f8
 with SMTP id d2e1a72fcca58-85371ba7f2emr16629402b3a.1.1787781182323; Wed, 26
 Aug 2026 14:53:02 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 14:52:58 -0700
In-Reply-To: <20260826215258.937210-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826215258.937210-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826215258.937210-3-seanjc@google.com>
Subject: [PATCH v2 2/2] KVM: VMX: Drop TDX_SHARED_BIT_PWL_{4,5} and dedup
 related code
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Fold the GPA => GFN conversion and bitshift logic for identifying the S-bit
given the EPT root level into tdx_set_mirror_root_level() to dedup the math
and drop TDX_SHARED_BIT_PWL_{4,5} in the process.  In addition to deduping
a small amount of code, using the level to compute the S-bit position more
or less eliminates the risk of the mirror_root_level and gfn_direct_bits
getting out of sync.

Opportunistically switch the sanity check in tdx_load_mmu_pgd() to check
the mirror root level, not the S-Bit location, now that it's all but
impossible for the two things to get out of sync.

For all intents and purposes, no functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index e6b7da616817..a0bc9f818f43 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -56,9 +56,6 @@
 bool enable_tdx __ro_after_init;
 module_param_named(tdx, enable_tdx, bool, 0444);
 
-#define TDX_SHARED_BIT_PWL_5 gpa_to_gfn(BIT_ULL(51))
-#define TDX_SHARED_BIT_PWL_4 gpa_to_gfn(BIT_ULL(47))
-
 static const struct tdx_sys_info *tdx_sysinfo;
 
 void tdh_vp_rd_failed(struct vcpu_tdx *tdx, char *uclass, u32 field, u64 err)
@@ -1609,10 +1606,7 @@ static int handle_tdvmcall(struct kvm_vcpu *vcpu)
 
 void tdx_load_mmu_pgd(struct kvm_vcpu *vcpu, hpa_t root_hpa, int pgd_level)
 {
-	u64 shared_bit = (pgd_level == 5) ? TDX_SHARED_BIT_PWL_5 :
-			  TDX_SHARED_BIT_PWL_4;
-
-	if (KVM_BUG_ON(shared_bit != kvm_gfn_direct_bits(vcpu->kvm), vcpu->kvm))
+	if (KVM_BUG_ON(pgd_level != vcpu->kvm->arch.mirror_root_level, vcpu->kvm))
 		return;
 
 	td_vmcs_write64(to_tdx(vcpu), SHARED_EPT_POINTER, root_hpa);
@@ -2765,6 +2759,7 @@ static __always_inline void tdx_set_mirror_root_level(struct kvm *kvm, int level
 	BUILD_BUG_ON(level != 4 && level != 5);
 
 	kvm->arch.mirror_root_level = level;
+	kvm->arch.gfn_direct_bits = gpa_to_gfn(BIT_ULL(level == 4 ? 47 : 51));
 }
 
 static int tdx_td_init(struct kvm *kvm, struct kvm_tdx_cmd *cmd)
@@ -2829,13 +2824,10 @@ static int tdx_td_init(struct kvm *kvm, struct kvm_tdx_cmd *cmd)
 	kvm_tdx->attributes = td_params->attributes;
 	kvm_tdx->xfam = td_params->xfam;
 
-	if (td_params->config_flags & TDX_CONFIG_FLAGS_MAX_GPAW) {
-		kvm->arch.gfn_direct_bits = TDX_SHARED_BIT_PWL_5;
+	if (td_params->config_flags & TDX_CONFIG_FLAGS_MAX_GPAW)
 		tdx_set_mirror_root_level(kvm, 5);
-	} else {
-		kvm->arch.gfn_direct_bits = TDX_SHARED_BIT_PWL_4;
+	else
 		tdx_set_mirror_root_level(kvm, 4);
-	}
 
 	kvm_tdx->state = TD_STATE_INITIALIZED;
 out:
-- 
2.55.0.887.g758fc8c411-goog

