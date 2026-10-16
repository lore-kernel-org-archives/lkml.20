Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9444E1C9E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164341; cv=none; b=Md1NBITAD5m1X7MB6/1vcwtnF+CE/TDPPKoqknONgMXpxn3nQrsOdzOhb6+uLwLs4A2igvTdwy972qzytcRsg+Kf9cR4ne6Yas8ydDEzpnQ/tM8jfDkuwEpZN8XE2Wx4YWVI6BtI3oliAVMbK06wOi2ll20XB7gnY1xAe8cOUoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164341; c=relaxed/simple;
	bh=0Q2F8eMXPptzTA6CFnPdDDK7WMX88/q6nK1Vu+WDDwY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qyAjPkfz9hH1jgARZG4Wt9dp52cWWM+DdLY4c4IQm3UitcNt8lFB2zlqQp02gxQx0fmTI3oI5RF5ey1bK8YLom+dZ/I6EZPo/V2sgMw06qz/m4o+5CZwIcb8lPNrbSkVP5CaetFyxYhR5EDN7yB0z/3RZzJAgERiEz8QwaMWRBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b/mI+PQ0; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b/mI+PQ0"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e617b5e9b3so46720485ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792164335; x=1792769135; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iFPRBPV73hLcdeayNzC5abDouETyR83o00x/J8+4uxc=;
        b=b/mI+PQ0hDBHW+ZQ1eXxNuy43qU5OktSky8Za7V+LexvFwHgyfG3vzZuGRPMFsaj4G
         d1v16KTZzW/vPbsnpAzurzxt10JXhxPMDMYjQA6TQzqJXcq0ZVOeregCNQ/Uckta0hR9
         8GNGvHhhpMtAT/qQWWih57xNfXVf4//ZMgKwR1fHGphuaHVh3mVJ53/CtsgO+2BmQZwa
         mt3GW+ukrAC4RgUztMUlGW+toISUxaVJqcSdmDwJLGOD7HwQWpNz4bUQvcI6fHr7hi7c
         W8B9MjOC6U+09GtK1cwXB2j1c7F/c1grPwH06V6JTHy/KWOpM/n3diIRW/TSqpVW8zkx
         KOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792164335; x=1792769135;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iFPRBPV73hLcdeayNzC5abDouETyR83o00x/J8+4uxc=;
        b=rxXBR+Pd5RgfiKUTbYEaLyhT4ThfEI4dFa3snxg37o320F2ucNj6Lzglv6EuCB6IOL
         Mh7DpZsQ0ALpKAbnUrq6K1+U8pjUzy3Aun5pVY1Z0mEQ81hxcxSwWKT96MOzgLDp2Z7u
         N7Q90d3u7CWMUxWcQ6eloTlHbU3SSKqFmaBx8NfAjFR1N6qXG69z5ucvsEaoEfMTeZUm
         7I6u6CsaoRF5rs8vrmPsd2qJ7/4cG7356efy7TV6dhlAFmoYE2MJ7IqL08IcxzotN3od
         bXS2sYGtDaNfHd7qh1TONfBMlrMGZwglhitr+iof//tckdvjD8gwKlMQnpY6EnwBO1pH
         k/Fw==
X-Gm-Message-State: AFq9FYJQJfOF3LU65piBRGBAS1J07cbGHUTsQ+of17hQa9e5ljZ/lUjw
	HJikbx5u8316tU81zf1BZ67FCK+NfBuH0YnMLt26xVKVSX6vAiZcXvui+KxGRHuIicRZlzw0D9X
	oRstjWg==
X-Received: from plot22.prod.google.com ([2002:a17:902:8c96:b0:2e5:94eb:e1f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:da48:b0:2e8:1ec2:a8c4
 with SMTP id d9443c01a7336-2e9a6c1b779mr3046575ad.14.1792164334914; Fri, 16
 Oct 2026 08:25:34 -0700 (PDT)
Date: Fri, 16 Oct 2026 08:25:34 -0700
In-Reply-To: <20261016091422.3182216-2-binbin.wu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261016091422.3182216-1-binbin.wu@linux.intel.com> <20261016091422.3182216-2-binbin.wu@linux.intel.com>
Message-ID: <atJB7kDzKsvzrMau@google.com>
Subject: Re: [PATCH v5 1/5] KVM: TDX: Check unsupported CPUID bits against the
 TDX module's subleaf
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, pbonzini@redhat.com, 
	dave.hansen@linux.intel.com, andrew.cooper3@citrix.com, nik.borisov@suse.com, 
	kas@kernel.org, rick.p.edgecombe@intel.com, xiaoyao.li@intel.com, 
	chao.gao@intel.com, tony.lindgren@linux.intel.com, kishen.maloor@intel.com, 
	dedekind1@gmail.com, adrian.hunter@intel.com
Content-Type: multipart/mixed; charset="UTF-8"; boundary="eT79xhp2T0neg3Wb"


--eT79xhp2T0neg3Wb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 16, 2026, Binbin Wu wrote:
> Don't reject the mismatch outright, as the ABI allows userspace to provide
> an arbitrary index when KVM_CPUID_FLAG_SIGNIFCANT_INDEX is cleared.  It's
> userspace's responsibility to provide the intended entries; KVM only needs
> to ensure that the values it validates are the values it applies.
> 
> Fixes: 6d415778f106 ("KVM: TDX: Disable support for TSX and WAITPKG")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/kvm/20260604024927.E22311F00893@smtp.kernel.org
> Cc: stable@vger.kernel.org
> Signed-off-by: Binbin Wu <binbin.wu@linux.intel.com>
> ---
> v5:
> - Split out from "KVM: TDX: Validate userspace CPUID input for
>   KVM_TDX_INIT_VM" as a standalone fix.  Sashiko reported the issue
>   against the TDX CPUID validation patch, but it also applies to the
>   existing code, so split it out to allow backporting to stable
>   independently of the rest of the series.
> - Check the userspace values against the subleaf reported by the TDX
>   module instead of rejecting the request when there is a mismatch.
> 
>   A simpler alternative would be to require a zero index when
>   KVM_CPUID_FLAG_SIGNIFCANT_INDEX is cleared, but that would be an ABI
>   change.

The even simpler change is to reject the incoming CPUID if userspace doesn't set
KVM_CPUID_FLAG_SIGNIFCANT_INDEX as expected.  Yes, that's an ABI change.  No, we
don't care.  The rule isn't "never change the ABI", it's "don't break userspace",
and there's basically zero chance a TDX guest can function properly if userspace
doesn't set KVM_CPUID_FLAG_SIGNIFCANT_INDEX as appropriate.

diff --git arch/x86/kvm/vmx/tdx.c arch/x86/kvm/vmx/tdx.c
index 75a86d64892a..7e0d81066420 100644
--- arch/x86/kvm/vmx/tdx.c
+++ arch/x86/kvm/vmx/tdx.c
@@ -151,8 +151,12 @@ static void tdx_clear_unsupported_cpuid(struct kvm_cpuid_entry2 *entry)
                clear_waitpkg(entry);
 }
 
-static bool tdx_unsupported_cpuid(const struct kvm_cpuid_entry2 *entry)
+static bool tdx_is_unsupported_cpuid_entry(const struct kvm_cpuid_entry2 *entry)
 {
+       if (cpuid_function_is_indexed(entry->function) !=
+           !!(entry->flags & KVM_CPUID_FLAG_SIGNIFCANT_INDEX))
+               return true;
+
        return has_tsx(entry) || has_waitpkg(entry);
 }
 
@@ -2386,7 +2390,7 @@ static int setup_tdparams_cpuids(struct kvm_cpuid2 *cpuid,
                if (!entry)
                        continue;
 
-               if (tdx_unsupported_cpuid(entry))
+               if (tdx_is_unsupported_cpuid_entry(entry))
                        return -EINVAL;
 
                copy_cnt++;

Can you test the attached patches?  If they boot TDX with QEMU, I'll go ahead
and post.

--eT79xhp2T0neg3Wb
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename=0001-x86-cpuid-Mark-CPUID-function-0x23-as-being-index.patch

From 73ab6386bac6625333526ab6b137c445d22ab5db Mon Sep 17 00:00:00 2001
From: Sean Christopherson <seanjc@google.com>
Date: Thu, 15 Oct 2026 18:34:12 -0700
Subject: [PATCH 1/4] x86/cpuid: Mark CPUID function 0x23 as being index

Add function 0x23 to the set of CPUID functions that are index, as per the
SDM and the many sub-leafs defined in leaf_types.h.

Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/cpuid/api.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index 82eddfa2347b..25b22b173f2a 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -181,6 +181,7 @@ static __always_inline bool cpuid_function_is_indexed(u32 function)
 	case 0x1d:
 	case 0x1e:
 	case 0x1f:
+	case 0x23:
 	case 0x24:
 	case 0x8000001d:
 		return true;

base-commit: dea4f6380f4ec96e8f3b0aaf2343764bd0d25ef4
-- 
2.56.0.176.g3575e65682-goog


--eT79xhp2T0neg3Wb
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename=0002-KVM-TDX-Set-SIGNIFCANT_INDEX-flag-as-appropriate-whe.patch

From 90bd7cecc21de49fc30eda93de1d9f59d0c9a428 Mon Sep 17 00:00:00 2001
From: Changyuan Lyu <changyuanl@google.com>
Date: Thu, 15 Oct 2026 18:39:30 -0700
Subject: [PATCH 2/4] KVM: TDX: Set SIGNIFCANT_INDEX flag as appropriate when
 filling CPUID entries

Set the KVM_CPUID_FLAG_SIGNIFCANT_INDEX flag in the kvm_cpuid_entry2
structures returned by KVM_TDX_CAPABILITIES if the CPUID is indexed,
otherwise KVM could confuse userspace and induce a configuration error.
This also ensures consistency with the CPUID entries returned by
KVM_GET_SUPPORTED_CPUID.

Fixes: 61bb28279623 ("KVM: TDX: Get system-wide info about TDX module on initialization")
Cc: stable@vger.kernel.org
Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
[sean: keep the WARN, don't key off KVM_TDX_CPUID_NO_SUBLEAF]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index ee1d412b0ee6..bcfecd2b1f31 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2,6 +2,7 @@
 #include <linux/cleanup.h>
 #include <linux/cpu.h>
 #include <asm/cpufeature.h>
+#include <asm/cpuid/api.h>
 #include <asm/fpu/xcr.h>
 #include <linux/misc_cgroup.h>
 #include <linux/mmu_context.h>
@@ -163,11 +164,18 @@ static void td_init_cpuid_entry2(struct kvm_cpuid_entry2 *entry, unsigned char i
 
 	entry->function = (u32)td_conf->cpuid_config_leaves[idx];
 	entry->index = td_conf->cpuid_config_leaves[idx] >> 32;
+	entry->flags = 0;
 	entry->eax = (u32)td_conf->cpuid_config_values[idx][0];
 	entry->ebx = td_conf->cpuid_config_values[idx][0] >> 32;
 	entry->ecx = (u32)td_conf->cpuid_config_values[idx][1];
 	entry->edx = td_conf->cpuid_config_values[idx][1] >> 32;
 
+	if (cpuid_function_is_indexed(entry->function))
+		entry->flags |= KVM_CPUID_FLAG_SIGNIFCANT_INDEX;
+
+	WARN_ON_ONCE(cpuid_function_is_indexed(entry->function) !=
+		     (entry->index != KVM_TDX_CPUID_NO_SUBLEAF));
+
 	if (entry->index == KVM_TDX_CPUID_NO_SUBLEAF)
 		entry->index = 0;
 
-- 
2.56.0.176.g3575e65682-goog


--eT79xhp2T0neg3Wb
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename=0003-KVM-TDX-Don-t-zero-non-significant-CPUID-entry-indic.patch

From c5cb713d03fa7cc41b999db8b014da6aa3d2a424 Mon Sep 17 00:00:00 2001
From: Sean Christopherson <seanjc@google.com>
Date: Thu, 15 Oct 2026 18:42:36 -0700
Subject: [PATCH 3/4] KVM: TDX: Don't zero non-significant CPUID entry indices

Now that KVM sets KVM_CPUID_FLAG_SIGNIFCANT_INDEX when filling CPUID
entries based on output from the TDX Module, don't zero the index for
entries without a signficant index, as doing so incorrectly suggests that
zero is somehow special, which it is not.  The critical piece of info is
the SIGNIFCANT_INDEX flag, which tells KVM (and userspace) to simply ignore
the index.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index bcfecd2b1f31..75a86d64892a 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -176,9 +176,6 @@ static void td_init_cpuid_entry2(struct kvm_cpuid_entry2 *entry, unsigned char i
 	WARN_ON_ONCE(cpuid_function_is_indexed(entry->function) !=
 		     (entry->index != KVM_TDX_CPUID_NO_SUBLEAF));
 
-	if (entry->index == KVM_TDX_CPUID_NO_SUBLEAF)
-		entry->index = 0;
-
 	/*
 	 * The TDX module doesn't allow configuring the guest phys addr bits
 	 * (EAX[23:16]).  However, KVM uses it as an interface to the userspace
-- 
2.56.0.176.g3575e65682-goog


--eT79xhp2T0neg3Wb
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename=0004-KVM-TDX-Reject-KVM_TDX_INIT_VM-if-indexed-CPUID-func.patch

From c38351fecf16d9bbb694f3a08127ab90ae64484b Mon Sep 17 00:00:00 2001
From: Sean Christopherson <seanjc@google.com>
Date: Fri, 16 Oct 2026 07:41:34 -0700
Subject: [PATCH 4/4] KVM: TDX: Reject KVM_TDX_INIT_VM if indexed CPUID
 functions don't match

Reject KVM_TDX_INIT_VM if userspace doesn't configure the canonical CPUID
entries correctly with respect to KVM_CPUID_FLAG_SIGNIFCANT_INDEX to fix a
bug where userspace could bypass the TSX and WAITPKG checks by simply not
marking a CPUID.0x7 entry as being indexed.  This also sets the stage for
more in-depth validation of the incoming CPUID configuration.

This is obviously an ABI change and diverges from KVM's general approach of
"let userspace do what it wants".  In practice, no "real" VMM that supports
TDX misconfigures a TD's CPUID entries in this way, i.e. the probability of
actually breaking userspace is basically nil.  And unlike normal VMs, where
KVM has full control and thus can deal with bizarre CPUID input without too
much fuss, TDX VMs require extra care due to the TDX Module also reacting
to the CPUID configuration, i.e. KVM_TDX_INIT_VM needs to be more strict
than KVM_SET_CPUID{,2} to avoid creating potentially dangerous-to-the-host
setups.

Opportunistically rename the helper to make it more obvious that it's
checking if the passed in @entry is unsupported, as opposed to returning a
set of unsupported entries or something.

Fixes: 6d415778f106 ("KVM: TDX: Disable support for TSX and WAITPKG")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/kvm/20260604024927.E22311F00893@smtp.kernel.org
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 75a86d64892a..7e0d81066420 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -151,8 +151,12 @@ static void tdx_clear_unsupported_cpuid(struct kvm_cpuid_entry2 *entry)
 		clear_waitpkg(entry);
 }
 
-static bool tdx_unsupported_cpuid(const struct kvm_cpuid_entry2 *entry)
+static bool tdx_is_unsupported_cpuid_entry(const struct kvm_cpuid_entry2 *entry)
 {
+	if (cpuid_function_is_indexed(entry->function) !=
+	    !!(entry->flags & KVM_CPUID_FLAG_SIGNIFCANT_INDEX))
+		return true;
+
 	return has_tsx(entry) || has_waitpkg(entry);
 }
 
@@ -2386,7 +2390,7 @@ static int setup_tdparams_cpuids(struct kvm_cpuid2 *cpuid,
 		if (!entry)
 			continue;
 
-		if (tdx_unsupported_cpuid(entry))
+		if (tdx_is_unsupported_cpuid_entry(entry))
 			return -EINVAL;
 
 		copy_cnt++;
-- 
2.56.0.176.g3575e65682-goog


--eT79xhp2T0neg3Wb--
