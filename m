Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E951FBC8C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790041000; cv=none; b=oGuBIxGpU+zJ/73pdNYVAK/p+Qbm116PHSBfa+z7EG3DE3UahY81CeMiRFLfAf8FxF9uZVsiuUGk28lVUPGrTzPMgkxUpLpttES63eCpQ6aqC5JuaPYnUNLzFdIrLt7vTEzp7262pUTgpxTOoHaQSlTCv7etNWnEh7RWQhiuJjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790041000; c=relaxed/simple;
	bh=ujpK8OEW3FZmpmkP0A/G1nyS8tVAZhHHIDpsIr1cNIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H+luy/sBB8iiEmYLVwcyNORAOn9fWzPeoFRu1Ja7DZHeNz8O6nKkHk/xGv5TMGLDI3DYMI+LKFp2c9BvG5ZoSC9fmBtZSLQmkvONaYQHUpyEKhczTb1N5paQIpt1Ztynbo6KRAC7T1CQTAHvx92BMaHpl7qpmjUTCKM+lnMppt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=IpObFzvx; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="IpObFzvx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=vD0k0Ck20NkaSxC+0yD9Mf/6md9yMaogJma8MOuOCCM=; b=IpObFzvx6OMOkVteh8tSW55725
	2zMdnjO0AJ2F0aI9fUvhxpgfdu/a6I9p52vKandRvZpy811pd5QsAzeLT/t2csxIKraMucDaL0qK3
	wDdUbce7+tYpFzUxggUko7j5ytHpdkWEYoxjRl5FsXaFi4DWreCxw5pC9s08IqQZAL4fpxpoKyO//
	15N6GxwY/ukBdeX1IJse6gmHiNXxbBgb7YcSysNJZYCe4TD5O4Ob8SSyVot0nDIzg2M0rdiW/5UOj
	C5ZRct7ITrl98hI4NnU1kPPKGt5yondaXCc53o1YApMrXrXBuUJT6pwyMqUPIpmBlKI/weInDJwpV
	XY9F7PhQ==;
Received: from 186-249-150-130.shared.desktop.com.br ([186.249.150.130] helo=[127.0.1.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x8pQs-005NkF-MI; Tue, 22 Sep 2026 03:36:30 +0200
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Mon, 21 Sep 2026 22:36:35 -0300
Subject: [PATCH v10 4/4] x86/cpuid: fix unbootable VMs by really inlining
 memcmp() in cpuid_base_hypervisor() and xen_prepare_pvh()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-pvh-kasan-inline-v10-4-08da47943d8e@igalia.com>
References: <20260921-pvh-kasan-inline-v10-0-08da47943d8e@igalia.com>
In-Reply-To: <20260921-pvh-kasan-inline-v10-0-08da47943d8e@igalia.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>
Cc: kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2

Even with __builtin the compiler may decide to use the out of line function
instead of the inline implementation.

The existing code is broken with gcc-14/15 but not gcc-12/13 (Ubuntu 25.10)
and vmlinux no longer boots with CONFIG_PVH if CONFIG_KASAN_GENERIC is set.
The instrumented out of line function performs a memory access to a region
not yet initialized by KASAN, as it is still in the PVH kernel entry point.

For testing purposes, if the size argument in cpuid_base_hypervisor() is
reduced from 12 to 8 the compiler decides to use the inline implementation.
In xen_prepare_pvh(), it (still) decides to use the inline implementation
(at least in these compiler versions), but it is not guaranteed to remain.

Switch the builtin to the inline implementation to address this.

Fixes: 416a33c9afce ("x86/cpu: fix unbootable VMs by inlining memcmp() in hypervisor_cpuid_base()")
Fixes: fbe5a6dfe492 ("xen, pvh: fix unbootable VMs by inlining memset() in xen_prepare_pvh()")
Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/cpuid/api.h  | 2 +-
 arch/x86/platform/pvh/enlighten.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index 82eddfa2347b32b76c2ea9b85f005ca5416ac71f..2d9f3d4d63de6e721f275d9e80d372edbdfedf30 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -204,7 +204,7 @@ static inline u32 cpuid_base_hypervisor(const char *sig, u32 leaves)
 		 * from PVH early boot code before instrumentation is set up
 		 * and memcmp() itself may be instrumented.
 		 */
-		if (!__builtin_memcmp(sig, signature, 12) &&
+		if (!__inline_memcmp(sig, signature, 12) &&
 		    (leaves == 0 || ((eax - base) >= leaves)))
 			return base;
 	}
diff --git a/arch/x86/platform/pvh/enlighten.c b/arch/x86/platform/pvh/enlighten.c
index f2053cbe9b0ce3d2178938269607c652ae8f528e..cb442cbd9d828619421babb281bfe9759edbca8a 100644
--- a/arch/x86/platform/pvh/enlighten.c
+++ b/arch/x86/platform/pvh/enlighten.c
@@ -8,6 +8,7 @@
 #include <asm/hypervisor.h>
 #include <asm/e820/api.h>
 #include <asm/x86_init.h>
+#include <asm/string.h>
 
 #include <asm/xen/interface.h>
 
@@ -129,7 +130,7 @@ void __init xen_prepare_pvh(void)
 	 * This must not compile to "call memset" because memset() may be
 	 * instrumented.
 	 */
-	__builtin_memset(&pvh_bootparams, 0, sizeof(pvh_bootparams));
+	__inline_memset(&pvh_bootparams, 0, sizeof(pvh_bootparams));
 
 	hypervisor_specific_init(xen_guest);
 

-- 
2.47.3

