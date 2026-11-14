Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675418;
	b=5ftxOYZnNZbF/Fp0zJZXVjX9mVf6IcwusfPHtVCyurTYn3UatgBUKj5AjcWxmoVibR7u
	 1jWBoZ0OcGx2//zQVLY9RdqlNfstGIk3t86QTJ7U9gntlRc0+4QLDdIF2SJyAtWNjybqu
	 fzSBtv8NhBZ7ttyttCVq3DMM8+55LRK1jvLDyhZ9IOyEI22ngN5HqYt4rpQ259/5qFE9z
	 kEDWcPixdOB1WyodDHCp2vWzv1Uiq9ID/hBOps9d9grbp5CJhq8izGh6WVGwlF6D1AzJx
	 4DpLXYRB0Dduv5j0BIr30VfySW1b2tKd4jf9czWmo2phmdwcHkarqX79nCXctW9tUzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675418;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uQximJwLYj6Lfa3XenE63rosMCyJlomCN9RTOM5F9N0=;
	b=F97uAFzHEPAnM+B1g5y3f+YgNOoYlx6bLUW1kZ66Pws7VP1Zqvz7Z5+sg5PT9UwJvyKj
	 cV4ms7NLP4N9/OY6/CnJfa7l8AU/FUfomQbYpGDAfeOsHfKO5BRE5P/97Vu3HfMWzdtmt
	 3mSOh9ORX12LDz/8B4Zv+Oz3IBa4mLF9xF5j+ksYQyGlYqE8t7EsQGLFWAgmf5REG8vCH
	 1u4bxoXFREAnuVjllzOD3siNZj155J0ikWJRA8rUXgxoYPRspzKrNXVYU/RG5Ryh3qdQA
	 GxnVSUPOz5sNOz+/muxJlx2bs6Rm1bXRufz5BClrgUH4atssTUspchZnsul+k9uZlDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v6qLJSeg;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628F0606A33D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 628F0606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v6qLJSeg
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3ab3b29a1d4so22953121fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675416; x=1795280216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uQximJwLYj6Lfa3XenE63rosMCyJlomCN9RTOM5F9N0=;
        b=v6qLJSegZUS7+CLnyvtWid+jXPX+TRuUV59RiVKeTXtxdW3D+FcXkAuOxkqSX6PqXl
         9IHY+uifybmWbN5HjO0RxAk/20UW5E2+tDxFBxUoi9xETZQBpZA6hHCL+dvrH5/F2Zdd
         MLcbJL0gDonDQP8BdHzCHC5thlt3xJfeIJTq+aAPp2yMgJngBq+C34FcjCtW0uqgBbe3
         MaW9GrvGFWnzo9sjTAQkksHa93nm1KKpYup0RaxlqwtB05YQIaO73rRmKe0FVGs2Cz5b
         qka7dUz8g4F95OKhTlg31u9vp35WXZFX4nq94RVy6Jhh4F35XE3S5I1qcmm/ocomT3Fg
         F0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675416; x=1795280216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uQximJwLYj6Lfa3XenE63rosMCyJlomCN9RTOM5F9N0=;
        b=V+wGvoUs9s29diEh4mKT/Lnz2rKgRlboNcTcRnCHr4N/aXKKcUjwhBj545PpU94y/l
         t0JOlpfWrI6Ya7sNP8Mqw5jAwWxxXahtal0YDU+V+sJ9TZcLAqZorRT1+vo3Xk2kZ6ud
         rFi7IjHZK6eLvXzRL5BEBcJ+v5JqOleUc9SzOGkp3J7mZ3nVyewHhp6a7LXGHrmr6UPr
         HXwRPsWvVERzsno9eRjWjtBpVn/bTw9IUGlqmtyFE8VHLsUSiJw0ywXXu98ATBAzVn9z
         zpFCelKaAQaMmSoUITxuACrG1Seytma0eVKsln7Nq0Uklxf8pXOikYZqWx6d1XK4hP8A
         fuZw==
X-Gm-Message-State: APuU4Z+VpeWX3E3c+4l6HtS/K5RkAdETXrAAnNQPfY/ZOFJPA49yfA3H
	pBZkMtvmntQmqPo7KkfoFSuXrISHSBCqD/1fatcFAZywkMmgS4SK8xFo
X-Gm-Gg: AYBFou1vKPjsHl4+Rsm9VJ87AEFqe15xf3a4GjoIWxGXKcZzPSKghlaTyJnIBtuX1D2
	hucrDHgAotHi8Z/o+tteOk6D/7gyj7oh6B3ZfpeOUMDjXKdCtU4uIRKFfgc30EPCr9XRTSy5k/a
	pnC307kUU1On5oWkSZSzD2KluaODg9q3abRFt/1LOJ+URCSh6F4YhYWCU7uOd9nWU0y5xlKBodD
	6Mm8FbTGYzNmcF4EyJqn4onQe6er21SeXoM2kX2oQhKBiWt310j+DjIh9iNUEyaBTWu85WDZUJv
	B8dV0/ZWODBiriQCWRcHEHfhPRdbwMWhUeHGo9qyzMEHB6FPqxFZ3ghptyaSHkDAQ/xnakytY/i
	hDTwLfgZ0YCDKYIAO977PXoCc3CDd+iYSqzoqkq9anlhrBjd/Gp6sEzWzjqdLwocbKhlko7V8Sq
	fwJmCjI6NTbDGP2mdMBmH+T9Ju9dHRmzhYso/jq73p4c2EjyuWvDCrY8LZkxuGij6DGQfqIwNmk
	L2wPkf+DGyx4zBNiUh0mm7jaSzjsQtjDORAxq26rKhS9iVNQSOF6cs8LY+JzNTXLp1pMfEJ6a7s
	s5ZfKNKqwHLZ/RbfT7G9Gr6iT4KlMspaCjcH93z0zjttHsqpEKM/vFIQljhOGo63x7JnYXYdhIH
	EHlujKJX4FQ==
X-Received: by 2002:a05:651c:b22:b0:3a6:95a:52a6 with SMTP id 38308e7fff4ca-3ae2b51fa1bmr19487401fa.20.1794675416400;
        Sat, 14 Nov 2026 08:56:56 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad26sm1792051e87.8.2026.11.14.08.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:56:56 -0800 (PST)
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
Subject: [PATCH v3 07/14] x86: fix duplicate extern declarations
Date: Sat, 14 Nov 2026 20:55:47 +0400
Message-ID: <20261114165612.368785-8-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114165612.368785-1-safocl88@gmail.com>
References: <20261114165612.368785-1-safocl88@gmail.com>
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

