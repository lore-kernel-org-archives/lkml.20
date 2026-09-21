Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2745C3B6359
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790034861; cv=none; b=V6agU7+faioH+nIy/+riivwUZkdrDzBEatZwMtkEsHIZK4IGdyMqLSEzmS6ZIjiWgR9ehldU2HKnsB3KO6ejPdXyGOT8sIhsaG4EfaIOvZGfl+vcSGuMEEgID8wyv2ArPzKFctDM4Mt0DZo77/kfSMeqcsVlqlFSc85LuXYaA/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790034861; c=relaxed/simple;
	bh=9PMut9MJ7Pm5HqjHWQNgH6ctD3cXraH94O6ZKVbfEt8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Oh4AGqPg9KKwcRaWExW7mOJ5PCSZ/u3X/1OncDXb019Opd+4JB6E03YqW1CDTzpF2++YwsKeic9ZBeTqVePP4afe0vhKDJqEhFmeCWGUbTZkpdLnAiGWcFG8KMt4jDX9LuwiInoyJ8/Yrspy1wNlv4q6w8C9psa6nwD8pqYOhHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JWHOQgKZ; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JWHOQgKZ"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39d865b11b4so4798858a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790034859; x=1790639659; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JaYY0Y9Mba393n7XnQYCgbjSbi+4Gy3l5WhAEzkfleI=;
        b=JWHOQgKZV7q7zoIHYNeCFyOTLndhtvYAsWbIS1wo2q3fwm9lTMr135kee2eCv2ecnN
         Nopjj0lUyoqTYkuxq/dDsdz5bbCD0I+zLBtjWEL69q8Snd/H8xNI5bD+kD4FHtPLG3RJ
         bDjoJ16NwByiGHstp4P6dN7GolmTCIOOjeC57uQHFLmAx8Ca3ANnpx9woQ352DoRYrv0
         8+2PAXjsGrThXfLeVy1LT+lcnWGhGQ6Kg3khAJZTOxLAt7TFCVpSLYWsIAcIviw4QEsB
         9OgCEj0f53svRVmvUmnDJtxjCBFgkL8uJ3hMnYm0xFX0d3rjIkXTnStyjqqwXPvaydvF
         NlCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790034859; x=1790639659;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JaYY0Y9Mba393n7XnQYCgbjSbi+4Gy3l5WhAEzkfleI=;
        b=nXIVNnnC8onuXUL+SV3ta66RjqJDFDcUzXDg2eYsc85ZNnre/evC3m4L4d3Pluvx9K
         b5EJcMFUBcBw9psjzCMxLgQZmzHog2aYySURt1bO/McGT/7ynSBQMtMFjNeCBZkxVyFH
         +/+QKEwAfHv/fwGzPmiDl8Ry+j+5ZHfWk1Wqoh4Icg3YX1Rf5lcBkTdVTe2dpMJhMepx
         QL6PL+WQV4/IpMZuC/jWxLC44vZ8Wa1smuC0T9OxGDeKBxQkVdHVfwV4VzFFlwc6XE+8
         b7uQema4HeWpcJOb2OIkuHyE/8M+U7eHVIMUz+9JWBX38jexO1OTytM0/abGYWVhoPEV
         W4rA==
X-Forwarded-Encrypted: i=1; AKwUvBxJr65KnH31VkHFRCGpyxFlMjzx36VCFRZjGyfdp8AvQXiTwFin/7Mgo7aVofGPViz3B0LDKC2TxZrr0No=@vger.kernel.org
X-Gm-Message-State: AFuF++mFW96vhkFOMqnJMlcTj2P4KTufuMr5fhfhwFYVg8g86LbjbFNu
	aAevjQ0qsXjzK6RF38fW2ngfbfB/0CgVW4e5qnMK9b98sfcw2FKOFSB/zslUyr4XYIN0qMI847S
	1T0B7gQ==
X-Received: from pjbcn8.prod.google.com ([2002:a17:90a:f088:b0:3a0:6cbc:62ac])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:586f:b0:39e:6a81:f34d
 with SMTP id 98e67ed59e1d1-39e6a81fcedmr12603411a91.39.1790034859165; Mon, 21
 Sep 2026 16:54:19 -0700 (PDT)
Date: Mon, 21 Sep 2026 16:54:18 -0700
In-Reply-To: <20260819094903.3060020-4-xiaoyao.li@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260819094903.3060020-1-xiaoyao.li@intel.com> <20260819094903.3060020-4-xiaoyao.li@intel.com>
Message-ID: <arHDqhdvgvH8HsvO@google.com>
Subject: Re: [PATCH v4 3/9] KVM: TDX: Set bits 31:16 to 0 for the synthesized
 Exit Reason
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	nik.borisov@suse.com
Content-Type: text/plain; charset="us-ascii"

On Wed, Aug 19, 2026, Xiaoyao Li wrote:
> Set bits 31:16 to 0 instead of all-1s for KVM's synthesized Exit Reason.
> 
> KVM is going to support Bus Lock VM exit for TDX, after which bit 26 of
> the Exit Reason becomes meaningful and indicates that a bus lock happened.
> The existing synthesized Exit Reason, -1u, will cause a false positive in
> that case.  Change the synthesized Exit Reason from -1u to U16_MAX, so that
> bits 31:16 are set to 0.  This also avoids the potential issues when other
> bits in 31:16 become valid in the future.
> 
> As a bonus, the check for synthesized Exit Reason in tdx_failed_vmentry()
> becomes unnecessary.  Just drop it.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
> ---
> Note, the checking of tdx_failed_vmentry() looks to miss the case where
> a real EPT_MISCONFIG happens with failed_vmentry being set.  First, in
> practice, EPT_MISCONFIG cannot happen with failed_vmentry being set.
> Second, even if it can, this is a pre-existing issue and the next
> patch can address it.
> 
> Changes in v4:
> - Collect R-b from Rick.
> 
> Changes in v3:
> - split from the patch 2 in v2.
> - define a MARCO for the synthesized invalid Exit Reason.
> ---
>  arch/x86/kvm/vmx/tdx.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index 1dead84e6077..4e275cb6927a 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -935,13 +935,21 @@ static __always_inline bool tdx_is_exit_reason_valid(u64 vp_enter_ret)
>  	}
>  }
>  
> +/* Synthesized invalid Exit Reason */
> +#define TDX_INVALID_EXIT_REASON		U16_MAX

I very strongly prefer exposing VMX's magic "0xdead", i.e. not having two different
magic values when the exit reason is undefined.  I'll post a standalone patch,
and fixup this series when applying.

diff --git arch/x86/include/asm/vmx.h arch/x86/include/asm/vmx.h
index 3f1b3096ff04..e49b836c7313 100644
--- arch/x86/include/asm/vmx.h
+++ arch/x86/include/asm/vmx.h
@@ -20,6 +20,14 @@
 #include <asm/trapnr.h>
 #include <asm/vmxfeatures.h>
 
+/*
+ * UNDEFINED is a KVM-defined value used to indicate that the basic exit reason
+ * is undefined/invalid, e.g. on VM-Fail or if TDX never attempted VM-Enter.
+ * The value itself is arbitrary, it just needs to not collide with a real exit
+ * reason.
+ */
+#define EXIT_REASON_UNDEFINED                  0xdead
+
 struct vmcs_hdr {
        u32 revision_id:31;
        u32 shadow_vmcs:1;
diff --git arch/x86/kvm/vmx/vmx.c arch/x86/kvm/vmx/vmx.c
index 612ab07d4100..c897dbf0e954 100644
--- arch/x86/kvm/vmx/vmx.c
+++ arch/x86/kvm/vmx/vmx.c
@@ -6388,6 +6388,8 @@ static int (*kvm_vmx_exit_handlers[])(struct kvm_vcpu *vcpu) = {
 static const int kvm_vmx_max_exit_handlers =
        ARRAY_SIZE(kvm_vmx_exit_handlers);
 
+static_assert(EXIT_REASON_UNDEFINED >= ARRAY_SIZE(kvm_vmx_exit_handlers));
+
 void vmx_get_exit_info(struct kvm_vcpu *vcpu, u32 *reason,
                       u64 *info1, u64 *info2, u32 *intr_info, u32 *error_code)
 {
@@ -7474,7 +7476,7 @@ static noinstr void vmx_vcpu_enter_exit(struct kvm_vcpu *vcpu,
        vmx_enable_fb_clear(vmx);
 
        if (unlikely(vmx->fail)) {
-               vmx->vt.exit_reason.full = 0xdead;
+               vmx->vt.exit_reason.full = EXIT_REASON_UNDEFINED;
                goto out;
        }
