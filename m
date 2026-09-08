Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5B858F088
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886517; cv=none; b=RlOXw6OdTZkVLmbixpI3XiSW9Mxx0jiiRYXYtI3pZwZQ62F8eIdfy8Z8HD+HV43H9EhuoeIR0S2FxThmFm4sA8Qys29ZghoCngMOYTlgEHkWJSyBz5ulsoSxuWBqAWgZu1Kc/9aFbSJd8FZeEPvKRJQtf/N813H9XwNfEucIPtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886517; c=relaxed/simple;
	bh=jWrqAHnqkILFV1YH9xYKa130B7ghMaQXLo+ayiQ9UN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pw0yimN3/XcxF4qJV4PVVGkAyhUs2Mo9WEQVV3n2cB+pG12iizQ/q1Mq6Tb4q3gZSUo6631wDEW+Om6uoNldyYBRuM/Td8L0g+t3wE4nBrH4438NwPYspNc+sp92cQyKKTI7oimpkbS6aDpV7gyA9jP8CZ9012J5ASnNzAhCEZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=asal/egh; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="asal/egh"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3bc34cso140875e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788886514; x=1789491314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R3DzdAFO70KwGDjJHYL4MMa9eTii8Dfq+RaBQI260U8=;
        b=asal/eghnRhaDgyws+BsMurzQ5LKja7MJpT9NMC3m4X7wnnZfPMVssZrcHXEdDGMWw
         8Bx1nmYSh3uH7ZJAprBeeGJ50FvLAdlLNt0duxYM5ZFZfg1R3ir082dgKTm4x49udNkB
         Es180eI+PtKJwdpRb34dB/NVYw3pAG0pe/Cf9u1cnZlLJGUAssk61qwA7/EmE6xJ54PK
         HJJEEPiE2PPbrK8phgDn7NCwIcN192vBZtjDm7tKykKGYB0mFhtygaMlHWd9uEL6v9Jk
         f9O1No5sktZ4rG5CkJ2qGWwdh7hj+M/41oqFZ87pmg96gKGmsRwi+FPQd77pAGWrecAE
         MACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886514; x=1789491314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R3DzdAFO70KwGDjJHYL4MMa9eTii8Dfq+RaBQI260U8=;
        b=lNWvFz8onEe7Gv0L0NB1QPJodVvYTaAvP8C8SC38tIZsERIrMntZiXddx/f3ZT5+XZ
         ae/WYqWRedY1a5pWuJIzJOC2nRq39zr+WRfkLTDTPHcHAiXuVg16sHnu97mRTd6PAeDW
         7gFgGHnH4GQnvmOjIvjxoNOMj1dGQ0/2W4zjD5Gj7fQTjLYEQwyqSsrzlj+vHUsHuJBk
         Jc2QJS1gyBE5dxEXEONKW2deyBybiC0/GhFuI1J4A4DUVQQqmOAws+RqDZlKGPF+mlW+
         0xLBy2xytEHrS2fRkUfjrh3dh1nXGFsEJIhRKIuaHKIB482CT5PScgew3LcdOR/mWWvs
         LA1A==
X-Forwarded-Encrypted: i=1; AKwUvBwdiKcb9PDfYd1PYQNZFUMx6YydD+xMQDgtMcucN25/Vf2JrU3rwY/PH2AIcc6P6P77bDmFD7V12S6eHGI=@vger.kernel.org
X-Gm-Message-State: AFuF++mlxTdX0xDHsx2BQwr7ZHS/r7i5IiGvpmEDiydqPOhOKR/CmSF3
	kjyTRmcW4vqs3Ejq2YHlfaztCh1wvj168m2pAq/dnJ2oe6ykIFJqtXljxC3QypwKVg==
X-Gm-Gg: AYBFou2kGtvf7cd9bBlznFhVd/s0r8ZmMBluLFUAs2+jupcyjj/pbYgKjNtboOk+b4l
	snPu2JlPqvbCpFKo+kP/BPQ0fPQa47zgFmE3M2+4MyKBJkhch0S8iKcw9ogz7NoH9oSo0L6RcKw
	a9sfBH9cxvsf9bVZkAPMMzOcR81lju7GqiqjLY2NbA4Xg40+YsNSoYWbsTipwzX+tzg4+NMUjHZ
	CwZzucu6WWKmKaWCgu0qJzwY4n0lXLzM19gL9CS8L+2WJrfmt9ZcJlzDgWwAHQgJHCo0tUkJxAh
	6/gwGJ0OYgBw6vM7uJs6E0ZQv3kcgeWUO+ZSR5Qd/Vw2xV+UtIoR6a/rI8FjJgdYzJzzb6utcrQ
	rYecumqt3VXxQG70tdP6SgNwwuqhjqFcx51LYJbVBy5aYyRTWurjfsBpiexNQHdR4p+ADFyJfYJ
	Ut4YlH6GHrQnof+8o8K7MlUb4DlbhI1umtTE5l9UXDlSTe1dgbBTQL4L+pZIwjL9PPacojj6dkl
	AuqFC6YFfM78s9GN2unXKfBbKc7kP9hJ3G/QCBS2C/MlTMc
X-Received: by 2002:a05:600c:a418:b0:499:7da3:dd0c with SMTP id 5b1f17b1804b1-49d00ab4237mr2533115e9.0.1788886513189;
        Tue, 08 Sep 2026 09:55:13 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:ac21:220d:3908:7e61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48591eb3d3bsm24137110f8f.0.2026.09.08.09.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:55:12 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Tue, 08 Sep 2026 18:54:47 +0200
Subject: [PATCH RFC v3 07/12] kasan: provide memory access information to
 KCOV
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-kcov-extrecord-v3-7-dcbc11593e88@google.com>
References: <20260908-kcov-extrecord-v3-0-dcbc11593e88@google.com>
In-Reply-To: <20260908-kcov-extrecord-v3-0-dcbc11593e88@google.com>
To: Dmitry Vyukov <dvyukov@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Alexander Potapenko <glider@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 llvm@lists.linux.dev, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788886494; l=6000;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=jWrqAHnqkILFV1YH9xYKa130B7ghMaQXLo+ayiQ9UN8=;
 b=XDDNcY0FkeFwasVBghiWsijYmlXi6Ml7BF/P9dZjWRpo+jfqVHsfEoOKHFmZBCIoyrxi6gMmF
 LHYJw90WPRKD7HDpuhMEaNyizksoKFaOWz41Njq17MJoqgWECkQiIti
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

In CONFIG_KCOV_MEMORY builds, let KASAN provide information about memory
accesses to KCOV.
Since KCOV already receives information from instrument_*() directly,
filter out those accesses by introducing KASAN_TYPE_EXPLICIT.
Because the KCOV usecase requires seeing ~every memory access (including
accesses to globals and repeated accesses to the same memory location
within a basic block), gate this on CC_IS_CLANG and let it flip some hidden
LLVM flags that disable ASAN optimizations.

Signed-off-by: Jann Horn <jannh@google.com>
---
 include/linux/kasan.h  |  1 +
 lib/Kconfig.debug      |  2 ++
 lib/Kconfig.kasan      |  9 +++++++++
 mm/kasan/generic.c     | 15 +++++++++++++++
 mm/kasan/shadow.c      |  5 +++--
 scripts/Makefile.kasan | 17 +++++++++++++++++
 tools/objtool/check.c  |  1 +
 7 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 03c7ac79345d..4b915e0c51bc 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -34,6 +34,7 @@ typedef unsigned int __bitwise kasan_vmalloc_flags_t;
 #define KASAN_VMALLOC_TLB_FLUSH  0x2 /* TLB flush */
 
 #define KASAN_TYPE_WRITE 0x1
+#define KASAN_TYPE_EXPLICIT 0x2
 
 #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
 
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 5de427ccc42d..f763f0504f62 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2221,6 +2221,8 @@ config KCOV_MEMORY
 	bool "Enable memory access trace collection by KCOV"
 	depends on KCOV
 	depends on KCOV_EXT_RECORDS
+	depends on HAVE_KASAN_REPORT_EVERY_ACCESS
+	select KASAN_REPORT_EVERY_ACCESS
 	help
 	  Provide a KCOV mode which records memory access operations and allows
 	  userspace to inject execution delays to impose constraints on the
diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index a4bb610a7a6f..9a43f6269c5c 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -228,4 +228,13 @@ config KASAN_EXTRA_INFO
 	  boot parameter, it will add 8 * stack_ring_size bytes of additional
 	  memory consumption.
 
+# Is KASAN_REPORT_EVERY_ACCESS allowed?
+config HAVE_KASAN_REPORT_EVERY_ACCESS
+	def_bool y
+	depends on KASAN_OUTLINE
+	depends on CC_IS_CLANG
+
+config KASAN_REPORT_EVERY_ACCESS
+	bool
+
 endif # KASAN
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index 9efd6fbbb7c3..6cf88f569e64 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -32,6 +32,8 @@
 #include <linux/types.h>
 #include <linux/vmalloc.h>
 #include <linux/bug.h>
+#include <linux/kcov.h>
+#include <uapi/linux/kcov.h>
 
 #include "kasan.h"
 #include "../slab.h"
@@ -182,6 +184,19 @@ static __always_inline bool check_region_inline(const void *addr,
 	if (unlikely(size == 0))
 		return true;
 
+	/*
+	 * Do not route information about an access to KCOV if we got called
+	 * through the instrument_*() path - KCOV can get those accesses
+	 * directly from instrument_*(), and get a bit more metadata about the
+	 * access that way.
+	 */
+	if (likely((flags & KASAN_TYPE_EXPLICIT) == 0)) {
+		unsigned int kcov_flags =
+			(flags & KASAN_TYPE_WRITE) ? MEMORY_ACCESS_RECORD_WRITE : 0;
+
+		__kcov_handle_memaccess(addr, size, kcov_flags, ret_ip);
+	}
+
 	if (unlikely(addr + size < addr))
 		return !kasan_report(addr, size, flags, ret_ip);
 
diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index a24f1225dd88..84f8567d4f2c 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -28,13 +28,14 @@
 
 bool __kasan_check_read(const volatile void *p, unsigned int size)
 {
-	return kasan_check_range((void *)p, size, 0, _RET_IP_);
+	return kasan_check_range((void *)p, size, KASAN_TYPE_EXPLICIT, _RET_IP_);
 }
 EXPORT_SYMBOL(__kasan_check_read);
 
 bool __kasan_check_write(const volatile void *p, unsigned int size)
 {
-	return kasan_check_range((void *)p, size, KASAN_TYPE_WRITE, _RET_IP_);
+	return kasan_check_range((void *)p, size,
+		KASAN_TYPE_WRITE|KASAN_TYPE_EXPLICIT, _RET_IP_);
 }
 EXPORT_SYMBOL(__kasan_check_write);
 
diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index 91504e81247a..82e88c5fb9bc 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -60,6 +60,23 @@ kasan_params += asan-instrumentation-with-call-threshold=$(call_threshold) \
 		asan-instrument-allocas=1 \
 		asan-globals=1
 
+# When we piggyback tracing of memory accesses for race condition testing on top
+# of KASAN, we want the compiler to report memory accesses even when KASAN can
+# prove that no UAF/OOB can occur; in particular, these optimizations must be
+# inhibited:
+#
+#  - suppression of ASAN hook calls for global variables
+#  - merging of multiple accesses in a basic block into a single ASAN hook call
+#
+# For now, known stack variable accesses are still ignored as a performance
+# tradeoff, though that will probably make a small number of races (where
+# another task concurrently accesses stuff on our stack) invisible to the
+# instrumentation. (Stack access instrumentation is gated on
+# asan-use-stack-safety and asan-skip-promotable-allocas.)
+ifdef CONFIG_KASAN_REPORT_EVERY_ACCESS
+kasan_params += asan-opt-globals=0 asan-opt-same-temp=0
+endif # CONFIG_KASAN_REPORT_EVERY_ACCESS
+
 # Instrument memcpy/memset/memmove calls by using instrumented __asan_mem*()
 # instead. With compilers that don't support this option, compiler-inserted
 # memintrinsics won't be checked by KASAN on GENERIC_ENTRY architectures.
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index d70cb640e2ec..08ebfe1f3fac 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1219,6 +1219,7 @@ static const char *uaccess_safe_builtin[] = {
 	/* KCOV */
 	"write_comp_data",
 	"check_kcov_mode",
+	"__kcov_handle_memaccess",
 	"__sanitizer_cov_trace_pc",
 	"__sanitizer_cov_trace_pc_entry",
 	"__sanitizer_cov_trace_pc_exit",

-- 
2.55.0.979.g7e5102b832-goog

