Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EA03E5EDB
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282614; cv=none; b=oBleoQ00F7amojxhzJvIIoO/kklN9QQ7UVPdy9SFMBQSBsFf9swF+g7J4q4LSUJovArQhZhrIIBLfi1hs1SIOM20KpB7QECRkKE+5V8hq8ACTFiqsnCxP1157coYLPSPiJhivyFAnMY7+mziCx4UhDhvsiGakLehKVDNUzrCqa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282614; c=relaxed/simple;
	bh=XTktCJaBUl50p3dwCGibrPPIEyla8e0KXF878DSWLXE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uowbusLTOEfVJQ0moaEgZ8jVvyAlcAhN3wmSv/e6GMoRYSavMsFz3qM1qp82PGXju7GcdpS+cAUGIgOiklSjMSgUi9DMxitluJC3aubgO3pGLa5ngZBwrcWvZmA6JESrFmol55Pi8vMsJWsLEOqpkQ7ys9SjjmxHJZhphZqqL4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rUWtA6jX; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rUWtA6jX"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35120d43ecaso3868862eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791282612; x=1791887412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s2Zcwb3I3/jpfEE/S/vABdVy3sksCEmjvmUeEvSUJ10=;
        b=rUWtA6jX3UmjmoikLIlkZQlfjjdrfSJkT5PhFeV7nmp5z8DPLVmhEKG49uOoZ/TR0K
         IoQblsrr624vIm0LGyWXl1xhnvvyFRZwhRIjR12uxEC+4X0VlgkUeYp5h96wrFfqSLhQ
         c9BJuDAeB98aJQGFGs8HEPFInRF+j8KJxHo3ZV+/X7CplW6a0Xkm0YKw8yjVj/+lH0Vf
         msAO9PFuf08R6m2gM0DM+RUbWRzs5fuknNpM/gTknhO5t8it7QuT5nq1zLGLBcaKcb83
         pONYkyvljyXxT5Bx+HRhUV4Mj2pq+jSqxWp8ZybPJKQE+IlmPi8RxNUCHLFXrxoMlPDa
         xMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791282612; x=1791887412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s2Zcwb3I3/jpfEE/S/vABdVy3sksCEmjvmUeEvSUJ10=;
        b=x9O/Gb068ZgA3OMjrbqa1hMaSGDJM1ZfuBvlG+A67grUQ6qlq2vn0BhC6GNE76rqMI
         2L0maGTQiPlXsLo+n9RUngtjnNLgu9ccmOUa4HhUquxbWJWyvJnjl0xxPeY3ifBOxAkq
         Tb6VMehiOr/W4M1wOd/hq2dKkOrn1csoJ78mx0mFinM9UKmiY7tJgHcAq4GXmD0kn4k0
         wUyP7kvwNjcd96vl8hj5OzUPyK2OW2ODX7/mAs3tVKmLY8h919ZNzbmVBKvUnXwVwnBY
         XkXLDtCA46ZmxZoNfC8Qgrv1xVb1uNrtJzWmHJ5aIhUa0+wpTyukWLIZDp87FNtrdCQc
         Rc2Q==
X-Forwarded-Encrypted: i=1; AKwUvBy3Cax70E0QgH/XZiugBf+yM1myh6sC+gKxi8IZiMgMZAOHatrPnwaP7HU3JqMhqGC1Ikfn3tZfwEzEQF8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCPIgamBaH9lvtiw4Bh2NLvhFeMl5Abg8JyQOEIRfzglM+R00j
	1umJiIrN/VYOTQxcnpzjTU/zAtmFhEghXzbLAevLptI63f0bvOHLsJsW
X-Gm-Gg: AYBFou1kJkEtHS/ioju6e0bMm+v7tBCYku23IOMwQRCZd9vZas7oMKPDllEEVBZui24
	Be7m7Z3yFq/LkZE+HOAAuQFdjffC44vta4/S2BNrbUPnWnpKOkWecQ+asbXKZqZ8XT6RRA1IT1x
	Bpgrpau0Z5Qws1kXrQwYWXTxG0BOtKWngsFTgvltLbulrz3Px2J/rpoRKxy+KjD270z+yfNi1PN
	a6WEMRCuSdnzdgzAAcM7hu1v+177NmrqIgGjK0HkEA1yrXgYChlC3Kx5ViI2zAep+C+54HEFHTe
	rK8CEGtPH6XsLOmVB7sIEyPv8BuA8DPYb0YQxV/OFjMXiG2BsJjM9uthWV/4BEjvG5qpQVX5N+/
	EKSw52NMQ6libDEmFLmGWY0Xk0GZrmUG4ZiUoIhgxE1E+u9OMFpqsMe+w7gdpPubn8sqbxiAObE
	ry0J3yXjIO5DqL9Bc44LnjxEXW7F+68FFpCMBcWHyxhBSbdFeMgU/gtRsEjYW4AUZ9Bd+vYYCKN
	f45LcPauZJppvEt0BXJAuySm/d0XC1rJttvaDB6/EjSEd7LcWHfYnLyi4rp
X-Received: by 2002:a05:693c:88cc:10b0:33c:b64a:3b82 with SMTP id 5a478bee46e88-3514df98ecamr955005eec.10.1791282611239;
        Tue, 06 Oct 2026 03:30:11 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351469fa189sm7443970eec.6.2026.10.06.03.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:30:09 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: kvm@vger.kernel.org,
	Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Anushree Mathur <anushree.mathur@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v7 5/8] KVM: selftests: Add helper for checking if running on powerpc pseries LPAR
Date: Tue,  6 Oct 2026 15:58:39 +0530
Message-Id: <294c0fcd19d6b00626e230985cf9906f98934d1c.1791280439.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1791280439.git.ritesh.list@gmail.com>
References: <cover.1791280439.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PowerPC's PAPR L0 does not guarantee H_GUEST_CREATE/H_GUEST_CREATE_VCPU
hcalls to create upto MAX_VCPUS or hundreds of VMs, this is due to
limited resouces at L0 for guest management space. This helper allows us
to skip such tests which creates a lot of VMs/VCPUs, when we are running
nested.

Note that there is no easy way to differentiate between running nested
on PowerNV v/s kvm-on-powervm case. So we use a common helper to detect
any nested case.

The helper is added to the common kvm_util header file to avoid
sprinkling multiple #ifdef __powerpc64__ everywhere.

Suggested-by: Sean Christopherson <seanjc@google.com>
Tested-by: Anushree Mathur <anushree.mathur@linux.ibm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 9df16c8dc82a..258ae5879a5e 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -14,6 +14,7 @@
 #include <linux/kvm.h>
 #include "linux/rbtree.h"
 #include <linux/types.h>
+#include <unistd.h>
 
 #include <asm/atomic.h>
 #include <asm/kvm.h>
@@ -1063,6 +1064,22 @@ const char *exit_reason_str(unsigned int exit_reason);
 
 bool kvm_arch_needs_naturally_aligned_page_tables(void);
 
+/*
+ * True on powerpc when this host is a pseries LPAR (nested case).
+ * PowerPC's PAPR L0 does not guarantee H_GUEST_CREATE / H_GUEST_CREATE_VCPU up
+ * to MAX_VCPUS or creating hundreds of VMs - due to limited resouces at L0 for
+ * guest management space. This helper allows us to skip such tests when we are
+ * running nested.
+ */
+static inline bool kvm_is_ppc_pseries_lpar(void)
+{
+#ifdef __powerpc64__
+	return !access("/proc/device-tree/rtas/ibm,hypertas-functions", F_OK);
+#else
+	return false;
+#endif
+}
+
 gpa_t ____vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages, gpa_t min_gpa,
 			     u32 memslot, bool protected, bool naturally_aligned);
 gpa_t __vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
-- 
2.39.5

