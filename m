Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794881222;
	b=jUYQbblP+Cp1xlEdttyWy5I7M2m0GrjMrzcN5Io/6UhvSE4Bzy893FymdTxnnNc9cpWn
	 eJr69aXjT1kY4QqENj+mYd5KE0gRzxkfLltenBFJyYL1s0XDNSsIU7NXyvVc0hGu/L+fu
	 /nR0zOiky2oehV8Q0kMQ0Zz6bF46h6JgoxNV8/Z9SBh8iYm2WtsqvmHa3lXINaT0dYqXj
	 006nw2eALV0ezgO8Va2WOqwgoViupvaLnfV/AviyxPTdGvbhBO4/vSMHi9G8fwAHGVD6/
	 DbsNHZxnwgzAPU9Dh0vssFj9TnOW39OYtrcbzyZ/PZ5LrMkx+mFqbSto8XBkGwrqPGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794881222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=MKrCvWPM8oTt1xTdSWVSXvg0CX0IDLCZJIWYopBqA58=;
	b=IW3mReoWpI/gyW8QafZOLmWcFiZQj8EhTg6CTN2PvA/TLk4pm1OEItpKChVlXibTE5oW
	 Iy9Mru8nW91gyYFFhAlYGpse+MRUVzNzPUfJAZfoNHMCpsHpWh43sKsSPudYPNdee9yAw
	 54YZMYtKZLW6lKQbnjKdvgYfaZy3jyUr3q9RQ/NB3diRQnNhvrn13yvnSvKAwQoQF5FVC
	 QlcwFVZydHYADsAf/6L3VDJyav8zreLJSHTe3tUZJ3krEcqOdPQ21A3LX/kd/9Gv3/6eA
	 fUXriI/XPx2Gx0Jt0azUlx6iRFFSPDGOVHjGe31trauNgwj5cFuZ608XuL3KPGZEndw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZZLPjIyU;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55359606A888
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55359606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZZLPjIyU
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3a9826f6dso520646a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794881221; x=1795486021; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKrCvWPM8oTt1xTdSWVSXvg0CX0IDLCZJIWYopBqA58=;
        b=ZZLPjIyUStoK5CVbuAsQDSeHBIyVsvO1CwebkUxdTsGUt59ZVP5x709OHWA/0ddowv
         7W8MbzYsEvCIJc+tFbzCPfIOsSdWbygRTeLsDBP8ofqQrZjNLQrRGzayNNL3YNfOAxrm
         gAv+RzrLjVWdqheEmspbZYN2x4HKdB0LGv23cgL8ew6qAlL4xPHYgznx7DdIGVBZN/Ji
         hzm6YIHUSp82kAJG2VFtMKD+ZANH/60o/O0BBh/Toc4p6Y+aNAEYlHKwKMER+KIJhRTQ
         jxtOvLZ08l8tnQGHJx5VQWx/TynIwvZzyopZmxWWG5nfJ1sXjXtmX+3KvQ1s62+YY5zX
         +gZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794881221; x=1795486021;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKrCvWPM8oTt1xTdSWVSXvg0CX0IDLCZJIWYopBqA58=;
        b=Vb5hHb+zMz3LIo+MxVY9DnSTfgRisZy2RTyEp09fuaLFK7V/C6/yzm25f4c5zWCJ5O
         NpGGTrDErlT5jBKQaK9+dcj7X8ze7n5WYq61Q6bRl9VLlpatOuxuCW+GMOD5L8Lxdpv0
         M4uzpvyHiVvNYEisQ8w6T4gjHvcJA65iBP+mO6GL+GZtulgBHJQgnPYjMA961Ee9mQAo
         +pR4GoZMtr61FDd/5QS4DDNu5zroIHZUUhu049obv5cAKgG7j38DFVWtFmpjVLnUfoNI
         LALVHOvDZH1TPIjJNiQGF23/3eo45wh1vyRncQojaqhtL29P0lUYwb6gUJrcBtxVJzCL
         wxwA==
X-Forwarded-Encrypted: i=1; AL+hErGRKmsGwnXeKl/F5Nbh+TyFh1SIwAGv9EWrMcrlCL8s8x3/bBOtU1Ri2waAN/k87jiL5z/zu6mnKhYJ2zE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MDP7SrAoBLALdAbgdJ8Hb0XI3dfm0W5qH0jqOqo51nRZsbqMK
	wkW1p1oWTuVsJg4rJbfebKdj/LocoaGjERJN6+UFXK8vOi9UvKfKkB1Fwn6nrvQFLq8VFkBe8QP
	Mw1ptpno1xmL2WnDasx0yQImRbw==
X-Received: from pgjk26-n1.prod.google.com ([2002:a05:6a02:81da:10b0:cdd:bfcd:be0a])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a:b0:3ad:544f:81e9 with SMTP id 98e67ed59e1d1-3b1b09fa382mr9942186a91.15.1794881220412;
 Mon, 16 Nov 2026 18:07:00 -0800 (PST)
Date: Tue, 17 Nov 2026 02:06:42 +0000
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
Message-ID: <20261117020648.323464-6-dylanbhatch@google.com>
Subject: [PATCH v9 05/11] module, sframe: Add sframe support for modules
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

Add sframe table to struct module and support sframe PC lookups when an
.sframe section can be found on incoming modules. SFRAME_F_FDE_SORTED is
not set for module .sframe, so FDEs are sorted right after the sframe
header is read.

Co-developed-by: Weinan Liu <wnliu@google.com>
Signed-off-by: Weinan Liu <wnliu@google.com>
Suggested-by: Jens Remus <jremus@linux.ibm.com>
Reviewed-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

---

Changes since v8:
 - (sashiko) Preserve KASAN_SANITIZE_sframe.o, KCSAN_SANITIZE_sframe.o,
   and CFLAGS_REMOVE_sframe.o in kernel/unwind/Makefile.
 - (sashiko) Replace unused includes in include/linux/sframe.h with
   'struct module;' forward declaration and drop redundant includes in
   arch/arm64/include/asm/module.h and kernel/module/main.c.
---
 include/linux/module.h |   5 ++
 include/linux/sframe.h |   8 +++
 kernel/module/main.c   |  20 +++++++
 kernel/unwind/sframe.c | 118 +++++++++++++++++++++++++++++++++++++++--
 4 files changed, 146 insertions(+), 5 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 76f4f35964773..6793e9feb20a5 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -25,6 +25,7 @@
 #include <linux/export.h>
 #include <linux/rbtree_latch.h>
 #include <linux/tracepoint-defs.h>
+#include <linux/sframe.h>
 #include <linux/srcu.h>
 #include <linux/static_call_types.h>
 #include <linux/dynamic_debug.h>
@@ -581,6 +582,10 @@ struct module {
 #ifdef CONFIG_DYNAMIC_DEBUG_CORE
 	struct _ddebug_info dyndbg_info;
 #endif
+#ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
+	struct sframe_section sframe_sec;
+	bool sframe_init;
+#endif
 } ____cacheline_aligned __randomize_layout;
 #ifndef MODULE_ARCH_INIT
 #define MODULE_ARCH_INIT {}
diff --git a/include/linux/sframe.h b/include/linux/sframe.h
index c1fe8ac7df7b3..ad6d693c6f059 100644
--- a/include/linux/sframe.h
+++ b/include/linux/sframe.h
@@ -5,6 +5,8 @@
 #include <linux/init.h>
 #include <linux/unwind_types.h>
 
+struct module;
+
 #ifdef CONFIG_UNWIND_SFRAME_LOOKUP
 
 struct sframe_section {
@@ -15,6 +17,7 @@ struct sframe_section {
 	unsigned long	fres_start;
 	unsigned long	fres_end;
 	unsigned int	num_fdes;
+	bool		fdes_sorted;
 
 	signed char	ra_off;
 	signed char	fp_off;
@@ -23,12 +26,17 @@ struct sframe_section {
 extern struct sframe_section kernel_sfsec __ro_after_init;
 
 void __init init_sframe_table(void);
+void sframe_module_init(struct module *mod, void *addr, unsigned int size);
+
 extern int sframe_find(unsigned long ip, struct unwind_frame *frame);
 
 #else /* !CONFIG_UNWIND_SFRAME_LOOKUP */
 
 static inline void __init init_sframe_table(void) {}
+static inline void sframe_module_init(struct module *mod, void *addr, unsigned int size) {}
+
 static inline int sframe_find(unsigned long ip, struct unwind_frame *frame) { return -EINVAL; }
+
 #endif /* CONFIG_UNWIND_SFRAME_LOOKUP */
 
 #endif /* _LINUX_SFRAME_H */
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 34e0204ea37c1..ea7e49e294291 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -3024,6 +3024,23 @@ static void module_deallocate(struct module *mod, struct load_info *info)
 	free_mod_mem(mod);
 }
 
+#ifdef CONFIG_HAVE_UNWIND_KERNEL_SFRAME
+
+static void setup_sframe(struct module *mod, const struct load_info *info)
+{
+	unsigned int sframe_size;
+	void *sframe = section_objs(info, ".sframe", 1, &sframe_size);
+
+	if (sframe)
+		sframe_module_init(mod, sframe, sframe_size);
+}
+
+#else
+
+static void setup_sframe(struct module *mod, const struct load_info *info) {}
+
+#endif
+
 int __weak module_finalize(const Elf_Ehdr *hdr,
 			   const Elf_Shdr *sechdrs,
 			   struct module *me)
@@ -3043,6 +3060,9 @@ static int post_relocation(struct module *mod, const struct load_info *info)
 	/* Setup kallsyms-specific fields. */
 	add_kallsyms(mod, info);
 
+	/* Initialize sframe metadata. */
+	setup_sframe(mod, info);
+
 	/* Arch-specific module finalizing. */
 	return module_finalize(info->hdr, info->sechdrs, mod);
 }
diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index 50afaed9a0c93..55b7838bdd485 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -7,8 +7,10 @@
 
 #include <linux/mm.h>
 #include <linux/overflow.h>
+#include <linux/rcupdate.h>
 #include <linux/string_helpers.h>
 #include <linux/sframe.h>
+#include <linux/sort.h>
 #include <linux/unaligned.h>
 #include <linux/unwind_types.h>
 #include <linux/kallsyms.h>
@@ -98,6 +100,9 @@ static __always_inline int __find_fde(struct sframe_section *sec,
 	struct sframe_fde_v3 *first, *low, *high, *found = NULL;
 	int ret;
 
+	if (!sec->fdes_sorted)
+		return -EINVAL;
+
 	first = (void *)sec->fdes_start;
 	low = first;
 	high = first + sec->num_fdes - 1;
@@ -411,12 +416,53 @@ static __always_inline int __sframe_find(struct sframe_section *sec,
 	return __find_fre(sec, &fde, ip, frame);
 }
 
-notrace int sframe_find(unsigned long ip, struct unwind_frame *frame)
+#ifdef CONFIG_MODULES
+
+static __always_inline int __sframe_find_module(unsigned long ip,
+						struct unwind_frame *frame)
+{
+	struct module *mod;
+	int ret;
+
+	if (!rcu_is_watching())
+		return -EINVAL;
+
+	instrumentation_begin();
+	scoped_guard(preempt_notrace) {
+		mod = __module_text_address(ip);
+		if (mod && smp_load_acquire(&mod->sframe_init))
+			ret = __sframe_find(&mod->sframe_sec, ip, frame);
+		else
+			ret = -EINVAL;
+	}
+	instrumentation_end();
+
+	return ret;
+}
+
+#else
+
+static __always_inline int __sframe_find_module(unsigned long ip,
+						struct unwind_frame *frame)
+{
+	return -EINVAL;
+}
+
+#endif
+
+noinstr int sframe_find(unsigned long ip, struct unwind_frame *frame)
 {
-	if (!frame || !sframe_init)
+	if (!frame)
 		return -EINVAL;
 
-	return  __sframe_find(&kernel_sfsec, ip, frame);
+	if (__is_kernel_text(ip) || is_kernel_inittext(ip)) {
+		if (!sframe_init)
+			return -EINVAL;
+
+		return __sframe_find(&kernel_sfsec, ip, frame);
+	}
+
+	return  __sframe_find_module(ip, frame);
 }
 NOKPROBE_SYMBOL(sframe_find);
 
@@ -436,7 +482,6 @@ static int sframe_read_header(struct sframe_section *sec)
 
 	if (shdr->preamble.magic != SFRAME_MAGIC ||
 	    shdr->preamble.version != SFRAME_VERSION_3 ||
-	    !(shdr->preamble.flags & SFRAME_F_FDE_SORTED) ||
 	    !(shdr->preamble.flags & SFRAME_F_FDE_FUNC_START_PCREL) ||
 	    shdr->auxhdr_len) {
 		pr_debug("bad/unsupported sframe header\n");
@@ -459,6 +504,7 @@ static int sframe_read_header(struct sframe_section *sec)
 		return -EINVAL;
 	}
 
+	sec->fdes_sorted	= shdr->preamble.flags & SFRAME_F_FDE_SORTED;
 	sec->num_fdes		= num_fdes;
 	sec->fdes_start		= fdes_start;
 	sec->fres_start		= fres_start;
@@ -475,10 +521,72 @@ void __init init_sframe_table(void)
 	kernel_sfsec.sframe_start	= (unsigned long)__start_sframe;
 	kernel_sfsec.sframe_end		= (unsigned long)__end_sframe;
 
-	if (sframe_read_header(&kernel_sfsec)) {
+	if (sframe_read_header(&kernel_sfsec) || !kernel_sfsec.fdes_sorted) {
 		pr_warn("invalid vmlinux SFrame header\n");
 		return;
 	}
 
 	sframe_init = true;
 }
+
+#ifdef CONFIG_MODULES
+
+static int sframe_sort_cmp_fde(const void *a, const void *b)
+{
+	const struct sframe_fde_v3 *fde_a = a, *fde_b = b;
+	unsigned long func_start_a, func_start_b;
+
+	func_start_a = (unsigned long)fde_a + fde_a->func_start_off;
+	func_start_b = (unsigned long)fde_b + fde_b->func_start_off;
+
+	return cmp_int(func_start_a, func_start_b);
+}
+
+static void sframe_sort_swap_fde(void *a, void *b, int size)
+{
+	struct sframe_fde_v3 *fde_a = a, *fde_b = b;
+	struct sframe_fde_v3 temp;
+	long delta;
+
+	/* Swap potentially unaligned FDE */
+	memcpy(&temp, fde_a, sizeof(struct sframe_fde_v3));
+	memcpy(fde_a, fde_b, sizeof(struct sframe_fde_v3));
+	memcpy(fde_b, &temp, sizeof(struct sframe_fde_v3));
+
+	/* Adjust FDE function start offset from FDE */
+	delta = (long)((unsigned long)fde_b - (unsigned long)fde_a);
+	fde_a->func_start_off += delta;
+	fde_b->func_start_off -= delta;
+}
+
+static void sframe_sort_fdes(struct sframe_section *sec)
+{
+	void *fdes = (void *)sec->fdes_start;
+	size_t num_fdes = sec->num_fdes;
+
+	if (sec->fdes_sorted)
+		return;
+
+	sort(fdes, num_fdes, sizeof(struct sframe_fde_v3),
+	     sframe_sort_cmp_fde, sframe_sort_swap_fde);
+	sec->fdes_sorted = true;
+}
+
+void sframe_module_init(struct module *mod, void *addr, unsigned int size)
+{
+	struct sframe_section *sec = &mod->sframe_sec;
+
+	sec->sframe_start = (unsigned long)addr;
+	sec->sframe_end   = (unsigned long)addr + size;
+
+	if (sframe_read_header(sec)) {
+		pr_warn("invalid SFrame header in module %s\n", mod->name);
+		return;
+	}
+	sframe_sort_fdes(sec);
+
+	/* Ensure SFrame is initialized when sframe_find() happens */
+	smp_store_release(&mod->sframe_init, true);
+}
+
+#endif
-- 
2.56.0.679.gc527c65306-goog

