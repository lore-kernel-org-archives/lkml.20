Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794532041;
	b=R71l0Tbmmumqz8IKkEZcfrqKTMWSvpZf1QNlUXMYQyqx8huZJPa5l/qhu+mZ2h1R7/2B
	 ygU4MEniNO/IqTArGmrSO8fBbf9EMO9zOet/vYNCB7zEsXoly0y+rzDQ2dz69LbAsvgxu
	 G1WQAcd7uFTITZ2u4A4k2GUH4iV9+HxxbLVZd2p1em4jyz3opxDYVruwm11XQe3KVW5Ta
	 o0+sBHUiQM9eAbAFO5pc1jdIJYKjBYGSiGVKzBHwb6gkf1VNOLTpX2ED1mfxHMvbRQ0YE
	 KWkgPqdc+y9SuAVR37fKIACqKmeVpFtYjwmpW+21uwpq6B2froeOSg/foVOEB2tSDBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794532041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c/cWqKIWduZoLOjk/RHPTZ+tnDRCPdJt/8RzdamyTqU=;
	b=CbG+iifpZ4B1wl4LgoV+EYRRAdmE+JuOIbEHuDkvjHP/nGPpZlkh+RXpG2l1q++wwNs4
	 ex4kzl8jUG3Il7EKlRjwGfQGv+QDgfygsbdtOtFStRfsHm6ZbNfqqSvleAqZ5dDZ1hQhD
	 VezlUcoxgZTeqXzKVg8XlPm2drKoFvNu/HxbXuzqwzyb2vRZ16xff0LX9Cv6YxfEYMnvy
	 QlouH2P8NVnHOqEv9QvJthM/c8d2lYzEezecumYxgrjLAjQiSF6uzImweycZhyacz4Yuh
	 0c/6YjQVnNME7tXRxBUPFG8m5v+4WCaMvG9hV6TaC9sZRixJRmjynSTKoQdHkzvykbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eq09Izgm;
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AD5606A333
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3AD5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eq09Izgm
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ab46699a09so5446721fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794532039; x=1795136839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c/cWqKIWduZoLOjk/RHPTZ+tnDRCPdJt/8RzdamyTqU=;
        b=Eq09Izgmr6L0mJQZ0HGFPuN0Br7L2lg0TYPw5RX5lMCWkxrGZLtvtY/8JVMh+7FffG
         2dLOX6yFXpe2n2Bhh5GSqYgsbdxgGb7z7Z17hHWQCgnAQW8NXry7apdnZyJI4lNWzP4f
         LYbV1NLTJFGYgWD4LitRiCjz25d5SbJFx/roCW34TlLX2Z6JHm7P0w7gMm/ozo7EBqQd
         fXzfsAdl/HCoQhZLgLZS03JQswxaEyqAInfAUV50YAX+ZZV+ZMtsY6tKCRUg/nCBdDu6
         zCsulkh4onxu8Eq/wGYIfooBilcdqPvnPTWyqIHlxNisBWz2mkRL2BnxsYw7DvLLToi2
         8Yxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794532039; x=1795136839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c/cWqKIWduZoLOjk/RHPTZ+tnDRCPdJt/8RzdamyTqU=;
        b=D6rTATJVTXSu7WJ7kWmNyCelNcisMnbHEZ3PazAggPhl/oA/VLwlqBKFu2KiJjtymi
         RQ5/lf1jABeTch+13YJ6XyCyfNdS1Hj24+UxssoHFt/9rHWBlIJroByzjeB6kLoL8Oy8
         tCWK21uXltubfxFph1Ff0MwtoN0uvp6OO7dyC1+M4haLZ4oh0CdE4BwXRR97LKsuY/WZ
         oGsAAfV2IDAW3fbQDKuitLU1AnIvAcIjGjxvQyXB1mgymB3VrAmqv9c/fDyVxGqgAJX0
         ngXGwRx/W4vtIqhQ4KZ3DXwl8ghOaqtyUEvXhAd0uo8yeZdwTezF7LUv+qFjBW3Mx+Gu
         rrAA==
X-Gm-Message-State: APuU4Z8bo8E13dgjYMbWUsWqrJN46KVX5Or+pnbP1YCItenEhWoJY3Ya
	corCh2geGzLFGm1/BwC+Wz6RTbUUwKJ+2KVOFVqXVi/oFbIxiAJ3CUD0
X-Gm-Gg: AYBFou1v93b8Rrs+BztL6RVF++ZrYkjc3XkFc1CVbrIZ5q7hFcHUOhdhok5U8vE3HHe
	ctGScJGRR2ZraSErgVBmSfzUY5TZ9kNI0dgYQl8gDsPMbHHGWGycnGIzyqJr3iwCTxK0XdQzaTH
	fNBtQpBeqBwn3kSVegJAwZ/OO6KLxO7WRqvAuCHEizOSlIk1/8lnfzHUSmE4z/p1KVyxSkcnV3B
	z0qF8dccw5rb5I50NIi2OX+rHnXISU1GRgOTHgVzvDMSUdbZDLRm0Ty0lUrjhT/59vYzbfrh9zq
	XOaRSo/s97laSFr2G+BX23rbn2sqRfYudbiAS19PY1S52wpqUBXiAcg8WNkqOgzhgldQUZCDCPa
	SxYdrsSkfmB0V6R+joRca2HOsIMJtZ3RNnmpE7o4gO4xbA5voTywt5OQsboOLvkLq6t4X4KuoH7
	DV/cSoSG4U5eP/ZgSgYWL4h/o1r3OQGbkgUWIalMTj43cCjxMtVyes/ckuKmustUf6vOofdLSCq
	K9i90/8goL00I5cw2f19Enru91X48QnoN7MxViI4iMazo/tEm0s0fKYdzxDWQZ2UCGplI1JSr5h
	QAnv9EftLC7RDpTbWTnjYlRuv7ta3OKAZ3OTs73HfWr1eoFCw7Uso+NdxMelay4lnHqkRByO+2y
	6hz8f4+ooqA==
X-Received: by 2002:a05:651c:a348:b0:3ac:dda0:efdc with SMTP id 38308e7fff4ca-3ae2b5074cbmr3651751fa.16.1794532039095;
        Thu, 12 Nov 2026 17:07:19 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7d183bsm3133941fa.31.2026.11.12.17.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:07:16 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-um@lists.infradead.org
Subject: [PATCH v2 07/10] x86: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 05:06:12 +0400
Message-ID: <20261113010631.139191-8-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113010631.139191-1-safocl88@gmail.com>
References: <20261113010631.139191-1-safocl88@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Compiling a kernel module with a C++ compiler results in a "duplicate
extern specifier" error.
This occurs because the code contains `extern asmlinkage`, and `asmlinkage`
expands to `extern C` when processed by a C++ compiler.
Since the code already contains sections that respond to a C++ compiler,
I believe it is a perfectly valid approach to gradually move toward a state
where kernel modules can be compiled by a C++ compiler without any issues.
The `extern` specifier must be removed.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257

Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
---
 arch/x86/include/asm/efi.h       | 2 +-
 arch/x86/include/asm/gsseg.h     | 2 +-
 arch/x86/include/asm/preempt.h   | 8 ++++----
 arch/x86/include/asm/processor.h | 2 +-
 arch/x86/include/asm/suspend.h   | 2 +-
 arch/x86/um/sys_call_table_32.c  | 4 ++--
 arch/x86/um/sys_call_table_64.c  | 4 ++--
 7 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/efi.h b/arch/x86/include/asm/efi.h
index be58b7f5c..f5cb179b8 100644
--- a/arch/x86/include/asm/efi.h
+++ b/arch/x86/include/asm/efi.h
@@ -94,7 +94,7 @@ static inline void efi_fpu_end(void)
 #else /* !CONFIG_X86_32 */
 #define EFI_X86_KERNEL_ALLOC_LIMIT		EFI_ALLOC_LIMIT
 
-extern asmlinkage u64 __efi_call(void *fp, ...);
+asmlinkage u64 __efi_call(void *fp, ...);
 
 extern bool efi_disable_ibt_for_runtime;
 
diff --git a/arch/x86/include/asm/gsseg.h b/arch/x86/include/asm/gsseg.h
index ab6a595ce..81ef16081 100644
--- a/arch/x86/include/asm/gsseg.h
+++ b/arch/x86/include/asm/gsseg.h
@@ -12,7 +12,7 @@
 
 #ifdef CONFIG_X86_64
 
-extern asmlinkage void asm_load_gs_index(u16 selector);
+asmlinkage void asm_load_gs_index(u16 selector);
 
 /* Replace with "lkgs %di" once binutils support LKGS instruction */
 #define LKGS_DI _ASM_BYTES(0xf2,0x0f,0x00,0xf7)
diff --git a/arch/x86/include/asm/preempt.h b/arch/x86/include/asm/preempt.h
index d16d9c2f7..135695ae3 100644
--- a/arch/x86/include/asm/preempt.h
+++ b/arch/x86/include/asm/preempt.h
@@ -134,11 +134,11 @@ static __always_inline bool should_resched(int preempt_offset)
 
 #ifdef CONFIG_PREEMPTION
 
-extern asmlinkage void preempt_schedule(void);
-extern asmlinkage void preempt_schedule_thunk(void);
+asmlinkage void preempt_schedule(void);
+asmlinkage void preempt_schedule_thunk(void);
 
-extern asmlinkage void preempt_schedule_notrace(void);
-extern asmlinkage void preempt_schedule_notrace_thunk(void);
+asmlinkage void preempt_schedule_notrace(void);
+asmlinkage void preempt_schedule_notrace_thunk(void);
 
 #define __preempt_schedule() \
 	asm volatile ("call preempt_schedule_thunk" : ASM_CALL_CONSTRAINT);
diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 77488ff5e..68d7292af 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -455,7 +455,7 @@ static inline unsigned long cpu_kernelmode_gs_base(int cpu)
 #endif
 }
 
-extern asmlinkage void entry_SYSCALL32_ignore(void);
+asmlinkage void entry_SYSCALL32_ignore(void);
 
 /* Save actual FS/GS selectors and bases to current->thread */
 void current_save_fsgs(void);
diff --git a/arch/x86/include/asm/suspend.h b/arch/x86/include/asm/suspend.h
index a892494ca..e29c071b9 100644
--- a/arch/x86/include/asm/suspend.h
+++ b/arch/x86/include/asm/suspend.h
@@ -11,4 +11,4 @@ extern unsigned long temp_pgt __visible;
 extern unsigned long relocated_restore_code __visible;
 extern int relocate_restore_code(void);
 /* Defined in hibernate_asm_32/64.S */
-extern asmlinkage __visible int restore_image(void);
+asmlinkage __visible int restore_image(void);
diff --git a/arch/x86/um/sys_call_table_32.c b/arch/x86/um/sys_call_table_32.c
index 51655133e..f79c0138e 100644
--- a/arch/x86/um/sys_call_table_32.c
+++ b/arch/x86/um/sys_call_table_32.c
@@ -9,7 +9,7 @@
 #include <linux/cache.h>
 #include <asm/syscall.h>
 
-extern asmlinkage long sys_ni_syscall(unsigned long, unsigned long,
+asmlinkage long sys_ni_syscall(unsigned long, unsigned long,
 				      unsigned long, unsigned long,
 				      unsigned long, unsigned long);
 
@@ -28,7 +28,7 @@ extern asmlinkage long sys_ni_syscall(unsigned long, unsigned long,
 #define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, native)
 #define __SYSCALL_NORETURN __SYSCALL
 
-#define __SYSCALL(nr, sym) extern asmlinkage long sym(unsigned long, unsigned long, unsigned long, unsigned long, unsigned long, unsigned long);
+#define __SYSCALL(nr, sym) asmlinkage long sym(unsigned long, unsigned long, unsigned long, unsigned long, unsigned long, unsigned long);
 #include <asm/syscalls_32.h>
 #undef  __SYSCALL
 
diff --git a/arch/x86/um/sys_call_table_64.c b/arch/x86/um/sys_call_table_64.c
index 943d414f2..555e65e66 100644
--- a/arch/x86/um/sys_call_table_64.c
+++ b/arch/x86/um/sys_call_table_64.c
@@ -9,7 +9,7 @@
 #include <linux/cache.h>
 #include <asm/syscall.h>
 
-extern asmlinkage long sys_ni_syscall(unsigned long, unsigned long,
+asmlinkage long sys_ni_syscall(unsigned long, unsigned long,
 				      unsigned long, unsigned long,
 				      unsigned long, unsigned long);
 
@@ -24,7 +24,7 @@ extern asmlinkage long sys_ni_syscall(unsigned long, unsigned long,
 
 #define __SYSCALL_NORETURN __SYSCALL
 
-#define __SYSCALL(nr, sym) extern asmlinkage long sym(unsigned long, unsigned long, unsigned long, unsigned long, unsigned long, unsigned long);
+#define __SYSCALL(nr, sym) asmlinkage long sym(unsigned long, unsigned long, unsigned long, unsigned long, unsigned long, unsigned long);
 #include <asm/syscalls_64.h>
 #undef  __SYSCALL
 
-- 
2.56.1

