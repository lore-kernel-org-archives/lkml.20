Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794881227;
	b=ipKctpcPdPvZev9alNu+BSwws9rbR5/da4Uc2tkfiK7NxiFKoH19ryRM48pVtcow+Fgw
	 uykBdV33rzQpTU3F9X7DgAKGBbnYUF5A7MVf2o6UX/XMnjBdPh7UGhMU24WbytrZkD2HG
	 rPc9pmAueUFD4PiZ7FoWqYszUbONFXk616qJ0io7dyXWElF3+JAeJqBvkQsoGOAWxerLv
	 lhfG5J5r2qlBR2gZs+TC4EVkmNWnHSn1dCYnwAl3CUfLvFnTgpLp5uXkc5G3KBpUP3Ufa
	 m+KbR7E1iHkMAoPm9+P9uPs7ICwiulYV6NN+9m29jXiMWXxrW6ig7fLzrQatUgggidw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794881227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=hfF6Uv3pPn1rjl+Pv9kjr5wAyjSpQG+P4h197PnyiyE=;
	b=OzPvtyaJflRsQUmbSto7kf8kUMS6m6VoXhaneHIva7kDfKHc4DGqnsY8kf08/x4RluCf
	 S3zY/IOKW77h9YAhQS+j0zogasiyNqj9+E6yvXqhrPsVXgeQdarYTt2/nGu02WJ3EQ5dy
	 0FJA+O4yG8Z2Vf3QzNsD3fTqY7v/xvS/eNuY4lrYsBzpLEGr9K+7hT5XGMSZnIxwD8KXy
	 Mn/RWyb2qEX5SvAUsou2JQ9m7M4wNdqexsB0FjdzJBzPja0CAAdruJv6N2S4qzxc8IuOe
	 XFID+koeULQeyrTvRplv26my9uUFnFCTCj/QdvB2nEymjYWsY/sR4kdvqUr1CiP0NCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ISSGNa30;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9831E606A338
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9831E606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ISSGNa30
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c55ba309c2so4943452b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794881225; x=1795486025; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hfF6Uv3pPn1rjl+Pv9kjr5wAyjSpQG+P4h197PnyiyE=;
        b=ISSGNa3015OAm9JQkdbmlqfoBKNV8u/n46/I+8HETv+XDxhjg+Ht9f4zSRlA9OdaCT
         sP4zIiapVbr8sZ9f7R30ATSJuV7bOy1mqjIuYQ8gutK3yh8n5HtHCOh9pwrJPVgQho+P
         7FATQPZ8c6kzyXfotJHFS0aIU0A/iVDYkMi/G2LPqDHZfAAdmOL1bWdZikE9m6+NhXRP
         qO/MI7ciPUOQ71ZQTv5W7jHz/JlWCxq5lZJDZV8uSXuP3J6nyrotw/HOOi7LU9OYeHo4
         hcGZiJ4C+A+4Jk7LXR+RtnCMXSFLrPWshVXr9Vv4B0pNgBqrualH/xWuWxIJSnqEr75i
         l42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794881225; x=1795486025;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hfF6Uv3pPn1rjl+Pv9kjr5wAyjSpQG+P4h197PnyiyE=;
        b=MsveN3xDyFN+/Mx3ZEbtILEg8X2RY/J3tfk2kUtqM7oZaoekvY+E/wyH3YYTa61KiN
         9a6YSTD8nR+xQUtE5EBK3nm+SArDCAB9CAiAh6EVP9NFvAKBUdLMJjoQwj7v89ily7s8
         aBXbUgQjoajVeMRLdgactyQxFOeCcpRLD3CZxCdp8EChyA+JRe17MSsF2K+oXkimfNrs
         42bepQuk9qYxscC0AJrjbAvQAHQPAcnqYGMljZtfChcNWvIiJEIPexOE11/rPV27+dp8
         YQWAz1SAG6Z6ByawUoUGDP33RXsWOKLCp7mHYd600bQe0CQA1C452Y24JXCTDOQOIHxw
         KjMw==
X-Forwarded-Encrypted: i=1; AL+hErHcR9RpTFIWuHcTbUZQMNqaEZY5SpBp74Sstp60DWBQEz8SGf+YyaPugDJlGwFOuHibUHCVu05pm6dIW3k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SYT1zDCrUGr/0/gF9bQ5To2djhMJfrnqa0r2m9cmS2u6i9MxP
	Vj/1EBLzD+IPL0VjHUt6hdLxDzWhXglKLTH0/bwo509i1v4WmUaJsPUYTFTVT09xbjRDd93dGI/
	cXUYSmq4p4owlCaTl/DYYUvho5Q==
X-Received: from ilbek7-n1.prod.google.com ([2002:a05:6e02:4f07:10b0:53d:d5c4:1e46])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:4d06:b0:572:86c8:6b4c with SMTP id 5614622812f47-57286c86d22mr7148123b6e.6.1794881224996;
 Mon, 16 Nov 2026 18:07:04 -0800 (PST)
Date: Tue, 17 Nov 2026 02:06:45 +0000
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
Message-ID: <20261117020648.323464-9-dylanbhatch@google.com>
Subject: [PATCH v9 08/11] sframe: Add .sframe validation option
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

From: Josh Poimboeuf <jpoimboe@kernel.org>

Add a debug feature to validate vmlinux and module .sframe sections at
boot and module load time rather than on demand during unwinding.

[ Jens Remus: Add support for SFrame V3.  Add support for PC-relative
FDE function start offset.  Adjust to rename of struct sframe_fre to
sframe_fre_internal. ]

[ Dylan Hatch: Adapt this patch for in-kernel sframe sections. ]

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Reviewed-by: Indu Bhagat <ibhagatgnu@gmail.com>
Co-developed-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
Co-developed-by: Dylan Hatch <dylanbhatch@google.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

---

Changes since v8:
 - (sashiko) Update CONFIG_SFRAME_VALIDATION help text and commit message
   for in-kernel vmlinux and module .sframe validation, and move
   <asm/unwind_sframe.h> include to "arm64/sframe: Validate IP addresses".
---
 arch/Kconfig           | 19 +++++++++++
 kernel/unwind/sframe.c | 77 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index d2fc68e7023db..255f419f3f20e 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -539,6 +539,25 @@ config HAVE_UNWIND_KERNEL_SFRAME
 	  practice, this can provide more reliable stacktrace results than
 	  unwinding with frame pointers alone.
 
+config SFRAME_VALIDATION
+	bool "Enable .sframe section debugging"
+	depends on UNWIND_SFRAME_LOOKUP
+	depends on DYNAMIC_DEBUG
+	help
+	  When initializing the .sframe section for vmlinux or a module,
+	  validate the entire section immediately rather than on demand.
+
+	  This is a debug feature which is helpful for rooting out .sframe
+	  section issues.  If the .sframe section is corrupt, SFrame unwinding
+	  for that object will be disabled immediately with a warning, and more
+	  information provided in dynamic printks.
+
+	  This adds overhead at boot and module load time due to validating
+	  every FDE and FRE in the .sframe section.  Not recommended for
+	  general use.
+
+	  If unsure, say N.
+
 config HAVE_PERF_REGS
 	bool
 	help
diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index 4d804f2ad9dde..2f491abc9f84c 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -509,6 +509,73 @@ noinstr int sframe_find(unsigned long ip, struct unwind_frame *frame)
 }
 NOKPROBE_SYMBOL(sframe_find);
 
+#ifdef CONFIG_SFRAME_VALIDATION
+
+static int sframe_validate_section(struct sframe_section *sec)
+{
+	unsigned long prev_ip = 0;
+	unsigned int i;
+
+	for (i = 0; i < sec->num_fdes; i++) {
+		struct sframe_fre_internal *fre, *prev_fre = NULL;
+		unsigned long ip, fre_addr;
+		struct sframe_fde_internal fde;
+		struct sframe_fre_internal fres[2];
+		bool which = false;
+		unsigned int j;
+		int ret;
+
+		ret = __read_fde(sec, i, &fde);
+		if (ret) {
+			dbg_sec(sec, "__read_fde(%u) failed\n", i);
+			return ret;
+		}
+
+		ip = fde.func_addr;
+		if (ip <= prev_ip) {
+			dbg_sec(sec, "FDE %u not sorted\n", i);
+			return -EFAULT;
+		}
+		prev_ip = ip;
+
+		fre_addr = sec->fres_start + fde.fres_off;
+		for (j = 0; j < fde.fres_num; j++) {
+			int ret;
+
+			fre = which ? fres : fres + 1;
+			which = !which;
+
+			ret = __read_fre(sec, &fde, fre_addr, fre);
+			if (ret) {
+				dbg_sec(sec, "FDE %u: __read_fre(%u) failed\n", i, j);
+				return ret;
+			}
+			ret = __read_fre_datawords(sec, &fde, fre);
+			if (ret) {
+				dbg_sec(sec, "FDE %u: __read_fre_datawords(%u) failed\n", i, j);
+				return ret;
+			}
+
+			fre_addr += fre->size;
+
+			if (prev_fre && fre->ip_off <= prev_fre->ip_off) {
+				dbg_sec(sec, "FDE %u: FRE %u not sorted\n", i, j);
+				return -EFAULT;
+			}
+
+			prev_fre = fre;
+		}
+	}
+
+	return 0;
+}
+
+#else /*  !CONFIG_SFRAME_VALIDATION */
+
+static int sframe_validate_section(struct sframe_section *sec) { return 0; }
+
+#endif /* !CONFIG_SFRAME_VALIDATION */
+
 static int sframe_read_header(struct sframe_section *sec)
 {
 	unsigned long header_end, fdes_start, fdes_end, fdes_size, fres_start, fres_end;
@@ -569,6 +636,11 @@ void __init init_sframe_table(void)
 		return;
 	}
 
+	if (sframe_validate_section(&kernel_sfsec)) {
+		pr_warn("invalid vmlinux SFrame section\n");
+		return;
+	}
+
 	sframe_init = true;
 	dbg_print_header(&kernel_sfsec);
 }
@@ -629,6 +701,11 @@ void sframe_module_init(struct module *mod, void *addr, unsigned int size)
 	}
 	sframe_sort_fdes(sec);
 
+	if (sframe_validate_section(sec)) {
+		pr_warn("invalid SFrame section in module %s\n", mod->name);
+		return;
+	}
+
 	/* Ensure SFrame is initialized when sframe_find() happens */
 	smp_store_release(&mod->sframe_init, true);
 	dbg_print_header(sec);
-- 
2.56.0.679.gc527c65306-goog

