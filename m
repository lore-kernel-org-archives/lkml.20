Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794528923;
	b=YebqoQfcwKdjNtsny07FXIW+MmxhNfsCI7vQy97nRY+x4L7MOBFufqBj+SlmNunhVzzA
	 jK4ana/GlL5hM55NmHxB1z4cebZJuz+3fjY9hkqiib/YK1kDXq8yRFd+wnjrKKx1VlTZe
	 m4MprFgnm/X0pHhZAtBkOXsjdYC7nIk1hQ4RIzvRC0vTZHdSwXGp7WX9BbbLFZp4kHsgo
	 bSJxCT4DvkBOiwwspSoTAAlil+vZ9Qrex9DqjJ2z6a0hXYWVeAZyR5teXcSIXkWAixe77
	 d+nLg3yP6ivjJCxMdtW11jLWsIT3rFBMNpvdXpXVgZEZVycD4731fjqaYitjqWWE18A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=J2LkBRUVTRexRTSqdlSVNAYuG65U41LgIRZGkSwqN8Y=;
	b=DvmJKB8WGwR3BxN/23RaurezoAwnuKVSQWtYFPAzjV5ehjKdoBIIpBvBpWR/ZKLqpEcb
	 WarcjrNOhh5R1EHK4ZKfbjV6BHruyfsDPgU6CeymupVpAkKnAKfq7R1CU8STap8BGDb0C
	 1CUU7Jt2HuEE2F25HCTegRENBuQoxjZhxmYVRLbr0m4kJ2lNxvQEh0XliSlfZt2+fqQK9
	 StlBTByueEpcVQTkKgpVv94FtDQZwXQ1sOKnddp6vBRLWZljuEvw4aLpbZMTayRTPqqUV
	 a1UCuAmvZ7xcVrpr+ecKSQjRMxZzNNl2MdBbcM9teB8xgGqvBAsEIiyG+BmDcT0e/pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wNQqWfxc;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7202606A8B9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7202606A8B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wNQqWfxc
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c0a520df2eso513130e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794528921; x=1795133721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J2LkBRUVTRexRTSqdlSVNAYuG65U41LgIRZGkSwqN8Y=;
        b=wNQqWfxc+T/vgy4P0xPbC80WGOq5HFGxw8MuxnF7CIt0MFEJMKfp4NQe8XBv5TX5Tl
         FPRjXU6Vk1u5zn0waaJM83G62Ns+PODnHtoF/6kzTLGSzXCTMx/4HtvyjE74UlNW8E0O
         QjjXWNOkZM4Ziu+PVun4lYPXqiuv2k7o9MjOpCUghgRubDyzOobB8S9Qx9cHy5ZvfXkB
         6mumplOoEzUyOAGD0aH9AS+jIf3PrtISlqhFmRyqDwbkXZiD8EtpB4TYmLEsb09R+QfQ
         tAcMuKKmFV//2xnAjA2Ppj0GJf08Lh3G0nCufIpAWFVEODTG3HSuqoKfE/FIs6vFk7SU
         CICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794528921; x=1795133721;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2LkBRUVTRexRTSqdlSVNAYuG65U41LgIRZGkSwqN8Y=;
        b=zxRqFZuIP+IYu5YVfgKL2zvajdgKe9T8OOIBPctZ/1XzcA3FxPs9rTHaRWkVBgcYHt
         8HKYFxtJGmoTGS8tN8KwY9afmlo066Y34FOCf72MB1zPJB83ZQq7n5+KNRsxMRyKQraj
         XeclYpp2FOVBDgDbfuCJ5fe95yVwknjzHgqMsxS1tgTkHm/vMdgP/nkoyoMroGVNn7b3
         lvcI9a131MF+d67lhIwq+B+wRcVM0BGLhy0TPK/CKMAfVMWy1Av48+ul0K+YEt4TIAQZ
         ZW5GRfVVqvLjw8uiAk5BvyWIiKMbjw3GBXKNd119P5RJnfODda6FJQ7Cfxlx+gWrR3kg
         hMiw==
X-Gm-Message-State: APuU4Z/UKPM55fBefK5hBnBnvFwadVPkiT1QIXjmhxJ9LBMWMpwc8pDu
	AdaNi0MA30NrPQPD04zov6GPvrl1RyjTR+OLXqvty7w72dZ4BEptZihB
X-Gm-Gg: AYBFou3uOW2TFnLs4VjAI7SFDgMxPoblbgd6zhIM1JHgbh9ML35Ni8IqUz1388x/5ik
	EmmuXll6KJr7hc4NiROmlq/ZHDuSXMzoP8sBtWI5GkGZ8CK0rjtSL1/cS8BBtHYGHc1yZy/XtBi
	5g26byL1zt8CLDigbxZnsV+G2DfBlb7/BVSvBHAbs8LGci/YdAYp22vizMYfVVozkkwB5JgY27O
	pV1HmhVS16guvxF18xG5NqkSZcFlWd7rcI/J/nmReZLXSzEHoPnXj0vPTZUdB3sGBM3Ph7gwNDg
	O7XfRRb08nEI4NvLZyutpBPqyui8vEaUspzroBsBImSy5wKiZYIaDhJAst+bje+wP+TgV6yrn/x
	rbagjt58tocwruBq3OGWC4TIiWDudJ2GfXDAFY9K4Sv5GYFgYiaE8bBOClnJnTyhzAUvCCrB0oQ
	mVnPPhcrazdgCOWkOJZCamPBma4Ls5arZRrDR4JFAAJwKKARkUo/dcJxsrJwl1X29/UevV7Yozj
	9EhykmqyFYGvaN37mFvHMzeHBC0fwWpqzZJnjy/IrcBXfeaXWK4x9/MtmgMBAJwkNmOLXNjpKav
	8cNBdqs6Ws7pEcIW+3gBmTjjzKoeDKxpqFDjHG6i3IwlWsZykpEyUWGJxT5ieN8jWOj2SOj8+oB
	HAFnMNJd5MQ==
X-Received: by 2002:a05:6512:32d6:b0:5bc:ddf0:d96 with SMTP id 2adb3069b0e04-5c170a0dcc9mr397802e87.59.1794528920769;
        Thu, 12 Nov 2026 16:15:20 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133ca01sm200968e87.36.2026.11.12.16.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:15:20 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 06/10] riscv: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 04:14:12 +0400
Message-ID: <20261113001432.128201-7-safocl88@gmail.com>
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
 arch/riscv/include/asm/string.h | 24 ++++++++++++------------
 arch/riscv/kernel/process.c     |  4 ++--
 arch/riscv/kernel/stacktrace.c  |  2 +-
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
index 764ffe8f6..ac895358c 100644
--- a/arch/riscv/include/asm/string.h
+++ b/arch/riscv/include/asm/string.h
@@ -10,33 +10,33 @@
 #include <linux/linkage.h>
 
 #define __HAVE_ARCH_MEMSET
-extern asmlinkage void *memset(void *, int, size_t);
-extern asmlinkage void *__memset(void *, int, size_t);
+asmlinkage void *memset(void *, int, size_t);
+asmlinkage void *__memset(void *, int, size_t);
 #define __HAVE_ARCH_MEMCPY
-extern asmlinkage void *memcpy(void *, const void *, size_t);
-extern asmlinkage void *__memcpy(void *, const void *, size_t);
+asmlinkage void *memcpy(void *, const void *, size_t);
+asmlinkage void *__memcpy(void *, const void *, size_t);
 #define __HAVE_ARCH_MEMMOVE
-extern asmlinkage void *memmove(void *, const void *, size_t);
-extern asmlinkage void *__memmove(void *, const void *, size_t);
+asmlinkage void *memmove(void *, const void *, size_t);
+asmlinkage void *__memmove(void *, const void *, size_t);
 
 #if !(defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS))
 #define __HAVE_ARCH_STRCMP
-extern asmlinkage int strcmp(const char *cs, const char *ct);
+asmlinkage int strcmp(const char *cs, const char *ct);
 
 #define __HAVE_ARCH_STRLEN
-extern asmlinkage __kernel_size_t strlen(const char *);
+asmlinkage __kernel_size_t strlen(const char *);
 
 #define __HAVE_ARCH_STRNCMP
-extern asmlinkage int strncmp(const char *cs, const char *ct, size_t count);
+asmlinkage int strncmp(const char *cs, const char *ct, size_t count);
 
 #define __HAVE_ARCH_STRNLEN
-extern asmlinkage __kernel_size_t strnlen(const char *, size_t);
+asmlinkage __kernel_size_t strnlen(const char *, size_t);
 
 #define __HAVE_ARCH_STRCHR
-extern asmlinkage char *strchr(const char *, int);
+asmlinkage char *strchr(const char *, int);
 
 #define __HAVE_ARCH_STRRCHR
-extern asmlinkage char *strrchr(const char *, int);
+asmlinkage char *strrchr(const char *, int);
 #endif
 
 /* For those files which don't want to check by kasan. */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 34c1d498d..3e531b6d0 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -39,8 +39,8 @@ unsigned long __stack_chk_guard __read_mostly;
 EXPORT_SYMBOL(__stack_chk_guard);
 #endif
 
-extern asmlinkage void ret_from_fork_kernel_asm(void);
-extern asmlinkage void ret_from_fork_user_asm(void);
+asmlinkage void ret_from_fork_kernel_asm(void);
+asmlinkage void ret_from_fork_user_asm(void);
 
 void noinstr arch_cpu_idle(void)
 {
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index c75554471..6ca60cd3d 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -32,7 +32,7 @@
 	val;						\
 })
 
-extern asmlinkage void handle_exception(void);
+asmlinkage void handle_exception(void);
 extern unsigned long ret_from_exception_end;
 
 static inline int fp_is_valid(unsigned long fp, unsigned long sp)
-- 
2.56.1

