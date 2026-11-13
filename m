Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794528928;
	b=qwnYgAhFPnuXHDanKG50M/+/e7wmLcqoJy0wuHF3O4WLs+lip+DxivcWTm4lpuiC4M3m
	 MeE/1mK8TKNp7w8s32sZVq2ECnpyIF1Kxdnst+xa+h75w3r9huqfZaWSRQM8mVSU5JsLZ
	 OiYjuh6D3Y5fjZSEkX2Tr6ivf0lJj2jCXDOrdKVrfcjseQakoXAAXxFTOMcSm5wPmVoQY
	 IIgvBmbss/RMvhUJP4jrVbCF+PO7ZL75UQ64rWJnIDunc+FOqAilCMLqr1adB1JWGtI0z
	 Zm4a4Zq2+Dr7f4cr0QMDnWNS0UYwgx00zAcWuGjeJowl3nFuGgtN2MInd3+VJUOz3aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Hw8SAjAXtby0kF3LHANcoNGHydVlujl/8fA/+KaplxI=;
	b=JC7ZIIsAhREtQ8tO8/6BwHW1bH56dBKcDO49CEdm+H3UplXxJG+ZzvFa/rWh4CP1Zh3M
	 bu4jAZyEcdkfnfZBI7Kb9neGHW+o1o42izZToQ2Op5jKTJyI6tiQeFGIU+iihQDt12VBE
	 KkAH91ttAsEtZB0oYOeaURYyj5p8Fsg5HVXvFEqmVx+tIkfKaDqQzu8SWgNqp40LRyivE
	 srISFzIhQtqG5pg5O31/iooVaXVO3T7XpYMEPSwyhX83Ub4Ykno5iIN3eWgzOQqWabufj
	 HMdQG2Qf6FGLKHKzcCXHVj34054fKNLbHEdTXhN98JFeETd8LsmpdukWT7HBywN8osQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ax8ADWmx;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FB3606A894
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1FB3606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ax8ADWmx
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c15ccd7fb5so422818e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794528926; x=1795133726; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hw8SAjAXtby0kF3LHANcoNGHydVlujl/8fA/+KaplxI=;
        b=ax8ADWmx5ZdW51IqgZyMG5APBrQOB7LeoflpFEQf06j35y8yQ3k5KDCc90Qs8kXxJr
         G+0Tal/ZpKfnjLH0FUTXx/gstA+RGNoI/dX0SyXAWEErz4fS5Oj2j7Uk2fgST+empmaa
         AuILrlKitpINnXjuGymbo6Jk4uM9I1DFP32HOwUiX+8R0+ejUo7dHIYrovszRy5NoflO
         TbuhxRbhd3EHxNCPIZrGKE1LSLGU8nN9at7DryNCvDz1jFwKmZVeca4hpE0kzVYjiYme
         FBlIjPezt+Odtxi1l+g94V+aC8eABw7VizlUZE+Hj2XXiPuShS/2M6Mt5j8MjnDhodqY
         jYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794528926; x=1795133726;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hw8SAjAXtby0kF3LHANcoNGHydVlujl/8fA/+KaplxI=;
        b=tTd9iFvfhZ4rPZwO3618tNKz9mAWAi92GNzCtkA68b5IVGTEwMOeP540wRwXUWvvb/
         56b8kHCiS3ISUixnmJyyB2q38VebVUsx863sZ6eR94qzh6vQVW8ghmjhBH+Mi9P5YnJV
         vs0vmVrIODgmhco6g90WTpM9XHFgxkMUgWdOnwM1I4ZC/ZYIw73EqExoa2kMdm/W54kS
         ImEe2YarHzoNod7mrN6PzELyQ7Rt7pyeUIE0py/Y5OI+y3xEpFglKia657R1oVyQtXCZ
         TCWzVlPPp0fB+3WCAXQPZcCeJpMZh+ekXC6YNEFKcAid9Ja9Tso0ntcbTjw0MPcL3Y1a
         Idnw==
X-Gm-Message-State: APuU4Z+CDhiWb3soohRlJfdmzlNoJsYdt3edG2G4MRPqvIVft5zxruB4
	IyOc4bvW77xsU1avrilZipSZEHn2J3ttE+uElyojgAWHHAAx8Awl2ROc
X-Gm-Gg: AYBFou3DCs7+zTUONMxmb8fjq5QyaJl6RweuiT6KoqBG1S/5AWVmnEjf0ABz41D1ysm
	UxwTQ0cEE5XXxTR+Doy09XD988r6Oa/MJNNX0n0Svumh5tv52HLVO6iaUtia2i/ywEHOiXdfTog
	8Lv6J0f9Clhg6avocKSpHUsKI3bUV5LhLM+MfOAmZzRQSlCzpEiOp6Ad7691VM2pljUVcVA+Zsd
	yAky9C+2/A49TOpvSm5WGrbea4lDswDldImTNVZEJCrVqZ4F3chhWDBYlJfdNtAp3KMI3l0a+0v
	TLFGg6DD7jPf7w2wKBdJBidwcMt4CeLow0ApS+tyVvUCXdw3i2UEn9LZE9F2PKnZr28y1EDLmm1
	bBiK9/IQ3HygWcxon6+majwmqdSdgWwD+a7MX0eDaOq5mIHcy4XImhHvR9KHybqizoO3C6n200N
	xAbL2Ij+fmg4rqmG+lmh+0ra/HZDkVF34GrODoQIeD7/FhKVkLyKpTU0fI8UGHOAtaganvIMzlw
	+RNdHTJk8LnGiIbZpTi/9NQf0THyUv5XYOevyOTmB7KZ3iRhxNUY7mGfl4Bnbsbzko9sBzbYd/K
	5K0PWtnJarVEKoZQzarriNAXRF3DeMkC0Pw3hRbE5E41h8tZ5ODAltJwfpNvOmm4mJVooDp3etJ
	sDBmKxow61A==
X-Received: by 2002:a05:6512:b06:b0:5c1:4a42:fb08 with SMTP id 2adb3069b0e04-5c1709cef9fmr362467e87.34.1794528925964;
        Thu, 12 Nov 2026 16:15:25 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133ca01sm200968e87.36.2026.11.12.16.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:15:25 -0800 (PST)
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
Subject: [PATCH 07/10] x86: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 04:14:13 +0400
Message-ID: <20261113001432.128201-8-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113001432.128201-1-safocl88@gmail.com>
References: <20261113001432.128201-1-safocl88@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Compiling a kernel module with a C++ compiler results in a duplicate
echo ‘extern’ specifier error.
This occurs because the code contains , and
expands to  when processed by a C++ compiler.
The  specifier must be removed.
https://bugzilla.kernel.org/show_bug.cgi?id=222257

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

