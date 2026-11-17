Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794881224;
	b=Wy0OjnFVm/lpjzhEX1Kckw6qj3SU/gPlamXQfQKtd9InbK5FNKP32szzwOI8Wq+XQrsU
	 BlWv1BYN5eUyzD7fYWF3vNbLHHGMakC1rAOufJqL+BvaxcF/5Ds6nvpHsEACGI3j38vff
	 1ilSye7UrCb6gz4CQO0yLk/wNEyKfNpLxHkngvtXlg7kOSYfRU67SAZv4+iQxvRnDMsur
	 Q3tmvk4N3Gh2QBDFAIX4UVRlliJaQKHCL2h+1zbZDHZjdr2nBUDI71Nk8WgPS7d7WwAns
	 Zhgz6pEr9773dD3MtJWwrw/KMQQuTautJBAMNoKW/XzsrX+hlFlAhvBf0PT/HsPX/rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794881224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=KHqN+mR+uG5QpfV5UPkyJt+kNZKbMTcKRifAgMfeoZA=;
	b=RYt/fTQIcccq/h39a9zn2ddZVgx8EdyRiaCwvbwB8eOWo9qhBY0ScMVUxBhfnUaCEj1I
	 pOwjOZekegHuzZCAXgJiEaPoLjHR4RO+JWHqifdS+LtuaEJ2nGTL4+U3/tsaR1WIwYmnF
	 VpyupcLMht5uHzX6xZHrV8zR+LOiybO9H/T8nwuDcmo/N+POiaY1vPegyz7+taxgmJ9bL
	 dotoTLym9gXpxHBfsmz57cmudWjgtuhWOkIfZCovAMzlYk8BF1ZYpdaJO9AIVPInF6Aif
	 YradlabjzaO9K+zEfhIOSnahFRS45NyNNhi65RSXEB2uWIanw7jV1J4NoLk8RAI8nvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=N6LkZ8AL;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3E3606A88A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F3E3606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=N6LkZ8AL
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ee04c49451so57147235ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794881224; x=1795486024; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KHqN+mR+uG5QpfV5UPkyJt+kNZKbMTcKRifAgMfeoZA=;
        b=N6LkZ8ALt9kSDVqUkP38mAQiwV6aOsj7BKtCf8sgSPXs8j/LmnW65lpjo09iLIcLSf
         2WDFz7Q7sZ9EwyeKh690g/XicCoBn5FRmsZdAWGiJOIrgerNcBFeJmS7VlBvayYyyrX0
         8CPAsxtbGQo4nHF2qybZTmTR2uIW8QoXSS9+ZB74cg5SHd4vnigzKKjZZNlGU1zRZNnE
         fmhS3g08YAEmfr1jCTznLMBwA9hWaV0F6egO/2eY/o8nG89X1/0MN79LwkUHNstSK/7h
         nydY87AtEpVFiupAnrX8BCcCPVodNsc0Yp/0vOHWlO4ffvp24IJXszUT5JqR1XZYlA1m
         eM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794881224; x=1795486024;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KHqN+mR+uG5QpfV5UPkyJt+kNZKbMTcKRifAgMfeoZA=;
        b=vAhNGdWWJC2YiJfY5IhfzpC0eBkMG795yXDzZmn2fJnYi1phXDhv2LaS4V3L18AVmN
         bJEDM9fEnBH4W/K2z3zc5pjubI0/HvjFkR3sr6nRJ5agjry6lRQu3ayaUiM1eQbC/jib
         emk6fpHQOQbT7Ayhxurbvc0uOMAK8Y40/XQkXFT6r7W8DCyiFKQT2+6st1x4+ACryvPQ
         xX6uzle0aBMA2u4jVw1cuq46ef7fr23fhb8Nq1dxXF0EPQXiLrF/JOCPXmYTIT2DufUx
         CGsGfEAurseSkAVmpasXpW1xNp6IFm/TBBSGVl2Io7gKOmav/pAADYjRIuoZJV3EWt0g
         dmVQ==
X-Forwarded-Encrypted: i=1; AL+hErG48fgau9JD34ddEhzfvaFhYzc4FFIE0uzwr78gbfFaR9gndpa5N3pzpcXiANW9zOomJDpMocMQwFeAuyQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z90rseo/mrb2uFziUqX7UjRrK7qrF6x6ateq7mGQqTfBNsyFUCY
	1Yu6ueNmtSzjhx6r5XEf0CD5s18vSBJkXdziGJGbaKgSH1fbB2zo4JQnQL9ffJS4TFrZJwFG08h
	lrD2cL9LvTH00hVl9CqqHjkgRZw==
X-Received: from plse6.prod.google.com ([2002:a17:902:b786:b0:2ef:d8b5:15f5])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e88d:b0:2ed:99b9:7fd8 with SMTP id d9443c01a7336-2ee0dad0713mr139046645ad.30.1794881223257;
 Mon, 16 Nov 2026 18:07:03 -0800 (PST)
Date: Tue, 17 Nov 2026 02:06:44 +0000
In-Reply-To: <20261117020648.323464-1-dylanbhatch@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117020648.323464-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117020648.323464-8-dylanbhatch@google.com>
Subject: [PATCH v9 07/11] sframe: Add debug helpers with object name
From: Dylan Hatch <dylanbhatch@google.com>
To: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jens Remus <jremus@linux.ibm.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Prasanna Kumar T S M <ptsm@linux.microsoft.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>, joe.lawrence@redhat.com, 
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Randy Dunlap <rdunlap@infradead.org>, Mostafa Saleh <smostafa@google.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"

Include the object name for kernel .sframe sections, indicated with the
format "(<module-name>)" or "(vmlinux)".

Suggested-by: Jens Remus <jremus@linux.ibm.com>
Reviewed-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

---

Changes since v8:
 - (sashiko) Include <linux/container_of.h>, <linux/module.h>,
   <linux/printk.h>, and <linux/stddef.h> in sframe_debug.h.
---
 kernel/unwind/sframe.c       | 11 +++++++----
 kernel/unwind/sframe_debug.h | 38 ++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 4 deletions(-)
 create mode 100644 kernel/unwind/sframe_debug.h

diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index d5c1c8148dadd..4d804f2ad9dde 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -19,6 +19,7 @@
 #include <asm/unwind_sframe.h>
 
 #include "sframe.h"
+#include "sframe_debug.h"
 
 static bool sframe_init __ro_after_init;
 struct sframe_section kernel_sfsec __ro_after_init;
@@ -516,7 +517,7 @@ static int sframe_read_header(struct sframe_section *sec)
 
 	if (check_add_overflow(sec->sframe_start, sizeof(struct sframe_header), &header_end) ||
 	    header_end >= sec->sframe_end) {
-		pr_debug("header struct doesn't fit in section\n");
+		dbg_sec(sec, "header struct doesn't fit in section\n");
 		return -EINVAL;
 	}
 
@@ -526,12 +527,12 @@ static int sframe_read_header(struct sframe_section *sec)
 	    shdr->preamble.version != SFRAME_VERSION_3 ||
 	    !(shdr->preamble.flags & SFRAME_F_FDE_FUNC_START_PCREL) ||
 	    shdr->auxhdr_len) {
-		pr_debug("bad/unsupported sframe header\n");
+		dbg_sec(sec, "bad/unsupported sframe header\n");
 		return -EINVAL;
 	}
 
 	if (!shdr->num_fdes || !shdr->num_fres) {
-		pr_debug("no fde/fre entries\n");
+		dbg_sec(sec, "no fde/fre entries\n");
 		return -EINVAL;
 	}
 
@@ -542,7 +543,7 @@ static int sframe_read_header(struct sframe_section *sec)
 	    check_add_overflow(header_end, shdr->fres_off, &fres_start) ||
 	    check_add_overflow(fres_start, shdr->fre_len, &fres_end) ||
 	    fres_start < fdes_end || fres_end > sec->sframe_end) {
-		pr_debug("inconsistent fde/fre offsets\n");
+		dbg_sec(sec, "inconsistent fde/fre offsets\n");
 		return -EINVAL;
 	}
 
@@ -569,6 +570,7 @@ void __init init_sframe_table(void)
 	}
 
 	sframe_init = true;
+	dbg_print_header(&kernel_sfsec);
 }
 
 #ifdef CONFIG_MODULES
@@ -629,6 +631,7 @@ void sframe_module_init(struct module *mod, void *addr, unsigned int size)
 
 	/* Ensure SFrame is initialized when sframe_find() happens */
 	smp_store_release(&mod->sframe_init, true);
+	dbg_print_header(sec);
 }
 
 #endif
diff --git a/kernel/unwind/sframe_debug.h b/kernel/unwind/sframe_debug.h
new file mode 100644
index 0000000000000..748d69ff6c103
--- /dev/null
+++ b/kernel/unwind/sframe_debug.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _SFRAME_DEBUG_H
+#define _SFRAME_DEBUG_H
+
+#include <linux/container_of.h>
+#include <linux/module.h>
+#include <linux/printk.h>
+#include <linux/sframe.h>
+#include <linux/stddef.h>
+#include "sframe.h"
+
+#ifdef CONFIG_MODULES
+
+#define objname(sec) ((sec) == &kernel_sfsec					\
+		     ? "vmlinux"						\
+		     : container_of((sec), struct module, sframe_sec)->name)
+
+#else
+
+#define objname(...) "vmlinux"
+
+#endif
+
+#define dbg_sec(sec, fmt, ...)						\
+	pr_debug("(%s): " fmt, objname(sec), ##__VA_ARGS__)
+
+static __always_inline void dbg_print_header(struct sframe_section *sec)
+{
+	unsigned long fdes_end;
+
+	fdes_end = sec->fdes_start + (sec->num_fdes * sizeof(struct sframe_fde_v3));
+
+	dbg_sec(sec, "SEC:0x%lx-0x%lx fdes:0x%lx-0x%lx fres:0x%lx-0x%lx ra_off:%d fp_off:%d\n",
+		sec->sframe_start, sec->sframe_end, sec->fdes_start, fdes_end, sec->fres_start,
+		sec->fres_end, sec->ra_off, sec->fp_off);
+}
+
+#endif /* _SFRAME_DEBUG_H */
-- 
2.56.0.679.gc527c65306-goog

