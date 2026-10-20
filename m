Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792539954;
	b=2e0TTZ4BuyOW8nVRlAPmIWvu+h6C7aWNbRnO9uYB6sedDsHBl65S1H7c4jhtNCS5d2kC
	 86wiWDUAMhZXmRCBcCqJ9UMEWDdiYCJwFRV3vjXiX16I5Gq5rXi/6cfvvwqidNPegL8Wy
	 x9zqqvixcIewjXP92T4eesZwyltEC9sVl0Yg/ttdcqZELP5X2ol0Kct2Wwh0uqi4O/jGT
	 AUnSnSB7uyvH0QzyhqpfmLYhdFSNAMoTjkID/MhnJc7PH2/67xaxTlGNLhFFTNt7w/x6y
	 P9b7Pybi1oMMYhkKmJISuPD78q85TQOd3Win/+aTQD7HxTDChSEc1iYF7X0oe+RWw3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792539954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=2tu+6V9vneXzOz6t4C0cOOOQWfAw1n5xSutLbHlCswQ=;
	b=p2zJaF2mLF1dCKGMlLOlYYSX8aS0rc/Me1lC5YamLycCG40dbfW4IW1+LYDrCjrrzQ9l
	 JJ90fVwdVy1iKjkN5MVN9lNjZN/VBBSnT/gxTS0f20V4MMjdzcS8rnxYPF5KVs74r3MaO
	 wtieP9CEBldxQUinGHXfQHVC323tgWTRlntyWK1h+fbApSfiT+54wpHKG41WNx/8oGoKR
	 v0rXMfrKIznVi67SoUQePleZn+93d6xd7/BiEtFcI0VOPHAFtjMezDH6uePyDNhLqsIQW
	 7VHR5pNgPh3+53XkqfWuZgaQxDBxQYspl7zDEDcU5GftKRPL4hyg3gpWGTBeeng65/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=CHPy0JzQ;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD32E606A331
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD32E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=CHPy0JzQ
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac77c3ff6aso261002a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792539948; x=1793144748; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2tu+6V9vneXzOz6t4C0cOOOQWfAw1n5xSutLbHlCswQ=;
        b=CHPy0JzQEmD+Zao/pNexvKSe24CWoOuQUeYVORXnncfaLOPqZEL0Ge/FG0j40u9A5v
         VTEK6M1SZbj56NVp90sQRydI4OqgQH+/YT2Zb04YPLhPBDLWQHPPFmOC0O0r4KzGONUU
         mGdidV4H/h6VWrnG+f5aSbtUtOqX4PpHDl0jCxd2x8dKxw3IQ8ZbiuLyRne8PlDTAJDQ
         cMz6VudylOCWtUxqA7eEMCEWn7JL1RcATtTGnV5m0+EuaEN9VH8vnHKCQL47h0VIaBIf
         v5D3EyZ0LoJPWZ+HPWq+qaqL/jHCA8FjNowTA4sc4gtteUlZ/YcYZ8AI0l3D7+poIcTe
         NxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792539948; x=1793144748;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2tu+6V9vneXzOz6t4C0cOOOQWfAw1n5xSutLbHlCswQ=;
        b=1HXcxyc1imJr6IpXZFRR9Ab32S4hIQUI9P1X9GkeTu8Oo5Q7nJBF9sQs5YNn3WbaVW
         3Bv6xQZz9fM9/swsWF31v28gpZ9mWdlySHnzUPehQjTwbHFkvfGSG8Ina70yjBSfyaFi
         sJY0Itym2U5MOabJ3WD3jsv2YpdxFpvPOmizdyC+b7bohScTFjxwgUteIjl8vRd2qJSE
         IBRc2slb5gTcf+bVrjExLxlXq2i8GRAerIjltdeN1xy3AoHC0SPjyL3CGkZfz+jDNmlM
         N22L1TVccG/6D4DDP/HF3AuvNpaD7TqGGmi1c6unz7p+pmkCTMWQoUuyE1cXF0Db6Kyv
         jtjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaem51ndK5sq2wWXF02KgsdXZBN1S1MUlpriyl73naWNS7Siyc+BNaMqTHawhrZJXdoRvAZOCE8tnT8Js=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZrPF0Q1sf9Zf0RHlMKaywpXAfhN18bvCBxzFhLLI3XPLe3SJd
	OPLJaIkBEXCt3shL1LdVLiQmfc1/0Gq9F8GGPL+QMWgMaPHv5Yoakpqot5l2mLsF8ReLWngoTTd
	mZ0mmxHbahaeDDA==
X-Received: from pjqd21.prod.google.com ([2002:a17:90a:a695:b0:3ad:850b:6f1c])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5243:b0:3ac:80de:44e8 with SMTP id 98e67ed59e1d1-3ad86f3da39mr344522a91.43.1792539947865;
 Tue, 20 Oct 2026 16:45:47 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:45:29 -0700
In-Reply-To: <20261020234535.3182385-1-jmattson@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020234535.3182385-1-jmattson@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020234535.3182385-4-jmattson@google.com>
Subject: [PATCH 3/4] KVM: selftests: Add a helper to request XSAVE permission
 without skipping
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Jim Mattson <jmattson@google.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Like Xu <likexu@tencent.com>
Content-Type: text/plain; charset="UTF-8"

Split the core of __vm_xsave_require_permission() into a new helper,
vm_xsave_request_permission(), which returns false instead of skipping
the test if KVM doesn't support the requested dynamic XSAVE feature, or
if the request for permission is denied.  This allows tests to opt into
dynamic features opportunistically, e.g. to exercise additional KVM
paths when AMX is available, while retaining the sanity check that the
request is made before KVM_GET_SUPPORTED_CPUID is first queried.

Like vm_xsave_require_permission(), wrap the new helper in a macro that
stringifies the feature mask for use in assertion messages.

Use __kvm_device_attr_get() instead of open-coding KVM_GET_DEVICE_ATTR.

No functional change intended for existing users, other than collapsing
the reasons for skipping into a single message.

Signed-off-by: Jim Mattson <jmattson@google.com>
---
 .../selftests/kvm/include/x86/processor.h     |  4 +++
 .../testing/selftests/kvm/lib/x86/processor.c | 33 ++++++++++++-------
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 6e6f70035508..6e9db81187c3 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1530,8 +1530,12 @@ static inline void cli(void)
 	asm volatile ("cli");
 }
 
+bool __vm_xsave_request_permission(u64 xfeature, const char *name);
 void __vm_xsave_require_permission(u64 xfeature, const char *name);
 
+#define vm_xsave_request_permission(xfeature)	\
+	__vm_xsave_request_permission(xfeature, #xfeature)
+
 #define vm_xsave_require_permission(xfeature)	\
 	__vm_xsave_require_permission(xfeature, #xfeature)
 
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index d31fa81ea075..12092e59b390 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -975,16 +975,18 @@ u64 kvm_get_feature_msr(u64 msr_index)
 	return buffer.entry.data;
 }
 
-void __vm_xsave_require_permission(u64 xfeature, const char *name)
+/*
+ * Request permission for guests to use the dynamic XSAVE feature @xfeature.
+ * Returns false, without skipping the test, if KVM doesn't support the
+ * feature or if the request is denied.  Must be called before
+ * KVM_GET_SUPPORTED_CPUID is first queried, as KVM enumerates dynamic
+ * features only if userspace has permission to use them.
+ */
+bool __vm_xsave_request_permission(u64 xfeature, const char *name)
 {
 	int kvm_fd;
 	u64 bitmask;
 	long rc;
-	struct kvm_device_attr attr = {
-		.group = 0,
-		.attr = KVM_X86_XCOMP_GUEST_SUPP,
-		.addr = (unsigned long) &bitmask,
-	};
 
 	TEST_ASSERT(!kvm_supported_cpuid,
 		    "kvm_get_supported_cpuid() cannot be used before ARCH_REQ_XCOMP_GUEST_PERM");
@@ -993,24 +995,33 @@ void __vm_xsave_require_permission(u64 xfeature, const char *name)
 		    "Dynamic XFeatures must be enabled one at a time");
 
 	kvm_fd = open_kvm_dev_path_or_exit();
-	rc = __kvm_ioctl(kvm_fd, KVM_GET_DEVICE_ATTR, &attr);
+	rc = __kvm_device_attr_get(kvm_fd, 0, KVM_X86_XCOMP_GUEST_SUPP, &bitmask);
 	close(kvm_fd);
 
 	if (rc == -1 && (errno == ENXIO || errno == EINVAL))
-		__TEST_REQUIRE(0, "KVM_X86_XCOMP_GUEST_SUPP not supported");
+		return false;
 
 	TEST_ASSERT(rc == 0, "KVM_GET_DEVICE_ATTR(0, KVM_X86_XCOMP_GUEST_SUPP) error: %ld", rc);
 
-	__TEST_REQUIRE(bitmask & xfeature,
-		       "Required XSAVE feature '%s' not supported", name);
+	if (!(bitmask & xfeature))
+		return false;
 
-	TEST_REQUIRE(!syscall(SYS_arch_prctl, ARCH_REQ_XCOMP_GUEST_PERM, ilog2(xfeature)));
+	if (syscall(SYS_arch_prctl, ARCH_REQ_XCOMP_GUEST_PERM, ilog2(xfeature)))
+		return false;
 
 	rc = syscall(SYS_arch_prctl, ARCH_GET_XCOMP_GUEST_PERM, &bitmask);
 	TEST_ASSERT(rc == 0, "prctl(ARCH_GET_XCOMP_GUEST_PERM) error: %ld", rc);
 	TEST_ASSERT(bitmask & xfeature,
 		    "'%s' (0x%lx) not permitted after prctl(ARCH_REQ_XCOMP_GUEST_PERM) permitted=0x%lx",
 		    name, xfeature, bitmask);
+	return true;
+}
+
+void __vm_xsave_require_permission(u64 xfeature, const char *name)
+{
+	__TEST_REQUIRE(__vm_xsave_request_permission(xfeature, name),
+		       "Dynamic XSAVE feature '%s' not supported or not permitted",
+		       name);
 }
 
 void vcpu_init_cpuid(struct kvm_vcpu *vcpu, const struct kvm_cpuid2 *cpuid)
-- 
2.56.0.212.g129ede20d9-goog

