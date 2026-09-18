Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347263FD137
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789771336; cv=none; b=Bd036Fth91b1bFkGF0YJ2PCpPgn1yjZwYBHhSyqMfqNyJeR7rXDb6jP4eUk0gdWDLyN7gjPzZhjdbsHOtQEkrSmMaHFS3eGwPISQ+aKTOtV+DkpRYETOo5eJHjNeLvvRy2jFI0l/OUiIiGuT7ryq+j2wR2OXkinfBm+reOKd3tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789771336; c=relaxed/simple;
	bh=evLNxRFSdfnaoL/T+o1W4E+1wOJyvmwliIuk58GNRCk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ytwy9t7wfnEOT9BHkk5G9fBxte8td/Gl8bE0+MHYk/0x6iqyiiDSmArq0cUZ8dApBMYwHAEXZGYQcnJBLBfJcFE+bpl/eIHSqupvCO2qGYj6XNEwu6wHFXBYKPV73NIHOaAksb1v/+avxfE4u4u+pISB9FaudWprIxMoyzB/dEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vQVWM0zn; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vQVWM0zn"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-855315ccb64so1249468b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789771334; x=1790376134; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tc716TApKQEJSK6qhR6cXCUJJx/CKA0S6sBYjQMPGMw=;
        b=vQVWM0zn+S3kxL6vk6hf4NfcSUbjQDMRgUZXCxxfB1gd18peopBc+H//lSZpBG77Jt
         F5BGqv9nU2AICnyPKs6lkg+m1hL38+ptvfMAcGbV7Ub0hlqWGpdo/hpWwz5CkD7fG/qf
         Vy4IkW/XQA5bM8cLx1V96DoIh+hylj9ipE5/J9QRhNXb1B52fY+YIu0MPTA7edWturxa
         ZSEBS+HVQZTkaTubq66dtNzh+3QYj59diQFMWHQxPumd767uy0foZ0GI+eLJs0bFkcEu
         T0iyOhc08AU7AxW7rOq7S4Ptke6ZtkwraREWlp9VqDFN+ErU22zDcBWfix0//wY2e5jw
         BA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789771334; x=1790376134;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tc716TApKQEJSK6qhR6cXCUJJx/CKA0S6sBYjQMPGMw=;
        b=ZP8KJRD1HSm6nQTKh4bnA/JWsUACgNln3PLDN//RRANuYD4FpdwewsidYJBbFfzW2R
         B28zzAEPJYEiL/el6Zbn71Z8BMQZR9SL1dgpMsDfDUOl24Hm3FoifV4F+9nOav0LLO7w
         5DpffkPMjjYIO55FRaf0+avXLaaquNtBSX/ztlrvTg1+hawNSzOKSx+aFVF27B4OtkHg
         y+R2aIr9yKNwCkbBNSUGe3K1XAJzTFYSHzXiRWG16DreW6NkRRXGc2uWFNH4rG33aRdf
         KkqslvG8SRNa/l/W2Nrd55gacp3r9YumSSLNrHk6evfhofwTSjZlCeH/eaez4JNhpQb/
         jOTg==
X-Forwarded-Encrypted: i=1; AKwUvBxxg/usPbpGmuecWnqald24eLgm2cyEjeW3isODM/a3LBnN/wFFGqgZLJGoYCdkFKx5/OvpXaV4RUWH2Co=@vger.kernel.org
X-Gm-Message-State: AFuF++mMFLoP8GHQYFZcV2RSKiOlmB4nNKFhJ06Ys0OvjJdNk+6D3Ptl
	l6g06SCHVTqR3DhPgANuMWIWvYFtGxMsT4MEbVI++HXHG0Q1cGQiTdxZc4m18jKkAxtJbn1h7q5
	PkgbPODvjDnekozeO+S5SaREFhQ==
X-Received: from pgcfm15.prod.google.com ([2002:a05:6a02:672f:b0:c96:6f3e:49c9])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:798c:b0:3dd:a009:3189 with SMTP id adf61e73a8af0-3dda0093253mr1525130637.49.1789771334228;
 Fri, 18 Sep 2026 15:42:14 -0700 (PDT)
Date: Fri, 18 Sep 2026 22:41:52 +0000
In-Reply-To: <20260918224157.1471085-1-dylanbhatch@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260918224157.1471085-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918224157.1471085-7-dylanbhatch@google.com>
Subject: [PATCH v7 06/11] arm64/sframe: Validate IP addresses
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
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"

Validate the given IP and computed function start address against the
known vmlinux and module text address ranges.

This requires arch-specific validation for vmlinux. This is because
arm64 keeps .exit.text (normally discarded) and .rodata.text, both of
both of which lie outside the bounds of .text and .init.text. Note that
.rodata.text contains code that is never executed by the kernel mapping,
but for which the toolchain nonetheless generates sframe data, and needs
to be considered valid at lookup time.

Suggested-by: Jens Remus <jremus@linux.ibm.com>
Signed-off-by: Dylan Hatch <dylanbhatch@google.com>

---

This patch is split out from v6 patch "sframe: Introduce in-kernel
SFRAME_VALIDATION", and includes just the IP validation logic without
the SFRAME_VALIDATION option.
---
 arch/arm64/include/asm/sections.h      |  1 +
 arch/arm64/include/asm/unwind_sframe.h | 32 +++++++++++++++++++
 arch/arm64/kernel/vmlinux.lds.S        |  2 ++
 kernel/unwind/sframe.c                 | 43 +++++++++++++++++++++++++-
 4 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/include/asm/unwind_sframe.h

diff --git a/arch/arm64/include/asm/sections.h b/arch/arm64/include/asm/sections.h
index 51b0d594239eb..5edb4304f661e 100644
--- a/arch/arm64/include/asm/sections.h
+++ b/arch/arm64/include/asm/sections.h
@@ -23,6 +23,7 @@ extern char __irqentry_text_start[], __irqentry_text_end[];
 extern char __mmuoff_data_start[], __mmuoff_data_end[];
 extern char __entry_tramp_text_start[], __entry_tramp_text_end[];
 extern char __relocate_new_kernel_start[], __relocate_new_kernel_end[];
+extern char _srodatatext[], _erodatatext[];
 
 static inline size_t entry_tramp_text_size(void)
 {
diff --git a/arch/arm64/include/asm/unwind_sframe.h b/arch/arm64/include/asm/unwind_sframe.h
new file mode 100644
index 0000000000000..8eb720f59434c
--- /dev/null
+++ b/arch/arm64/include/asm/unwind_sframe.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_ARM64_UNWIND_SFRAME_H
+#define _ASM_ARM64_UNWIND_SFRAME_H
+
+#include <linux/module.h>
+#include <linux/sframe.h>
+#include <asm/sections.h>
+
+static inline bool sframe_is_kernel_ip_valid(unsigned long ip)
+{
+	if (is_kernel_text(ip) || is_kernel_inittext(ip))
+		return true;
+
+	/* .exit.text is retained in vmlinux on arm64. */
+	if (ip >= (unsigned long)__exittext_begin &&
+	    ip < (unsigned long)__exittext_end)
+		return true;
+
+	/*
+	 * .rodata.text is never executed from the kernel mapping, but
+	 * still has sframe data
+	 */
+	if (ip >= (unsigned long)_srodatatext &&
+	    ip < (unsigned long)_erodatatext)
+		return true;
+
+	return false;
+}
+
+#define sframe_is_kernel_ip_valid sframe_is_kernel_ip_valid
+
+#endif /* _ASM_ARM64_UNWIND_SFRAME_H */
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index eb1f54829503c..82fd20ccb7c43 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -237,12 +237,14 @@ SECTIONS
 
 	/* code sections that are never executed via the kernel mapping */
 	.rodata.text : {
+		_srodatatext = .;
 		TRAMP_TEXT
 		HIBERNATE_TEXT
 		KEXEC_TEXT
 		IDMAP_TEXT
 		. = ALIGN(PAGE_SIZE);
 	}
+	_erodatatext = .;
 
 	idmap_pg_dir = .;
 	. += PAGE_SIZE;
diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
index 503d4a2beb50e..e6542bb678585 100644
--- a/kernel/unwind/sframe.c
+++ b/kernel/unwind/sframe.c
@@ -42,6 +42,45 @@ struct sframe_fre_internal {
 	unsigned char	dw_size;
 };
 
+#ifndef sframe_is_kernel_ip_valid
+
+static __always_inline bool sframe_is_kernel_ip_valid(unsigned long ip)
+{
+	return is_kernel_text(ip) || is_kernel_inittext(ip);
+}
+
+#endif
+
+#ifdef CONFIG_MODULES
+
+static __always_inline bool sframe_is_sec_module_ip_valid(struct sframe_section *sec,
+							  unsigned long ip)
+{
+	struct module *mod = container_of(sec, struct module, arch.sframe_sec);
+
+	return within_module_mem_type(ip, mod, MOD_TEXT) ||
+		within_module_mem_type(ip, mod, MOD_INIT_TEXT);
+}
+
+#else
+
+static __always_inline bool sframe_is_sec_module_ip_valid(struct sframe_section *sec,
+							  unsigned long ip)
+{
+	return false;
+}
+
+#endif
+
+static __always_inline bool is_sec_ip_valid(struct sframe_section *sec,
+					    unsigned long ip)
+{
+	if (sec == &kernel_sfsec)
+		return sframe_is_kernel_ip_valid(ip);
+
+	return sframe_is_sec_module_ip_valid(sec, ip);
+}
+
 static __always_inline unsigned char fre_type_to_size(unsigned char fre_type)
 {
 	if (fre_type > 2)
@@ -68,6 +107,8 @@ static __always_inline int __read_fde(struct sframe_section *sec,
 	_fde = (struct sframe_fde_v3 *)fde_addr;
 
 	func_addr = fde_addr + _fde->func_start_off;
+	if (!is_sec_ip_valid(sec, func_addr))
+		return -EINVAL;
 
 	fda_addr = sec->fres_start + _fde->fres_off;
 	if (fda_addr + sizeof(struct sframe_fda_v3) > sec->fres_end ||
@@ -438,7 +479,7 @@ int sframe_find(unsigned long ip, struct unwind_frame *frame)
 	if (!frame)
 		return -EINVAL;
 
-	if (is_kernel_text(ip) || is_kernel_inittext(ip)) {
+	if (sframe_is_kernel_ip_valid(ip)) {
 		if (!sframe_init)
 			return -EINVAL;
 
-- 
2.55.0.1082.g2b9226bbc0-goog

