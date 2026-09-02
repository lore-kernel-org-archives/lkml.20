Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37BB456E11
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390582; cv=none; b=cXQjrysS1yv2DN6naClaUPcq9j2btEx3zNMOC7T7ndy+RxtoqBoXfxTbVdC2snsMK19f4KSuzDakqOjOfabdJn6SbnCQrL+rK8abFqxu2Ne0R12Mx2Knc/TH1fPyL0DWOrz2Z4u7A/Coi/1dSnJ9fmgoIL27oAQV3bUJwYtgUqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390582; c=relaxed/simple;
	bh=+1VgxsgnJQl02sR9ZTeNUA36gnlTtRp4JJQojJXfI0k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=B+4YDNg1lZpo6Ao5anwaxKKmZHUYXrfZeon/CeEiXHeokT1DzDx4RYM94sm9aY7W3oYckTJTWcjfd21SubTjSP7etCwS4Zk3NBLJWyZwtKnyOIMVKYuMDqwR6mYTGDqZTHUEQIZyFFhB0NAl7W/mZt23lM0J8c9p8BwluR1EBW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bsDkvaXI; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bsDkvaXI"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so2860931a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788390577; x=1788995377; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ry8TyeFFo2R/yg40KQakAe6hDAwm94Khs2os2DazZE0=;
        b=bsDkvaXID0M/xWoT88X9CwFb8J4u0GE5aLhdJ6FdfvN+qqRAGdx/5TfwN/XvdYIEk+
         v68T9+mesS2M+opDfhjKOcxGx0NwNz4PWuyqmgDQmGp6ciQALZ4QzDT44wcvAqFA8a6T
         OxgYbqyGrOG5qXDL0UDr0bjwEbnHubjlI/OISHlsYeENjlFjTKuD049jxDGIzXvWOuOs
         ass6zJ6g6ZGbf5tuaLDIh/Ddugd9Xi0KqURrkqcojXVWvOsGLTa6AEptIRctw1MBII7I
         yZOOe4QbFvcxcJ+J2BJGW/vyElVQ3qVHib8RnqyO6ZsmP3o8t1T6zo2SOxUa5efix2Zr
         wy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788390577; x=1788995377;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ry8TyeFFo2R/yg40KQakAe6hDAwm94Khs2os2DazZE0=;
        b=gQD0Z5v4U5otUn6Ijk0Pm2jkDZMA72XEvvTC8WuIDaVfs7bCZ2RN9iPdPl8bImE0d6
         imVInA4J7fmwcg4DCD4xnrNcHKL0zNBIA3Xc/hue14D9MqyGDRBJqnAfkjagjfmt1Fme
         +etfBdYcjMTWMds7Fo+qHoaL/WSz8hJPe8xx5BO8CEOZj724HrT1Va/Ja+39HEC6Z7Uo
         URiJOlYM8pN9zFmxHu35esODVnNwtv2p0jDDNqtI8BN4wokb//MNH9ngpxg9NCRXdoEB
         fi9UAf2gDkaKnEIeudiWUzadmBOfxDPHNgYWA+EWRQvjQS9//PmCU71WKJ2XC3CX81tj
         SDDA==
X-Forwarded-Encrypted: i=1; AKwUvBztBqJUcQhks564mjH1ANQtHw+34YM/INCR74VyBvCidVgdCLqEkGq8tKWOF8Pjtn7psv8taP8feXLdP8g=@vger.kernel.org
X-Gm-Message-State: AFuF++mpOo4iP38WRVXObUHLiwEsTh/iyY3Fh2VG4ZqtYTBm693z/VTn
	2Ul+xoCjMoFy02T982SRlbba8XpYQme1CgiLzCqtzKHEdoPygUPsB2and+P/l35Quy2Cf7cTFAy
	HiW3zHQ==
X-Received: from pjzd8.prod.google.com ([2002:a17:90a:e288:b0:398:d8f4:c3f6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2d85:b0:398:9c00:29f0
 with SMTP id 98e67ed59e1d1-39aee249bd7mr12524431a91.24.1788390577209; Wed, 02
 Sep 2026 16:09:37 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 16:09:32 -0700
In-Reply-To: <20260902230932.2760127-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902230932.2760127-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902230932.2760127-4-seanjc@google.com>
Subject: [PATCH v3 3/3] KVM: VMX: Drop TDX_SHARED_BIT_PWL_{4,5} and dedup
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
2.55.0.970.g62bdec98f9-goog

