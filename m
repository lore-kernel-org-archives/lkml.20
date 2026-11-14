Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675412;
	b=tCdy71k7Y00Gydv7yAWZQ21rcAQm75A1DAhkLvJJBckdeEsNxZ5G7quBpseee98Dcdc9
	 Lby6YZZqcvMHgIzDirYBSDeii78jITeW55gzMYKLFubigyVYgD+Ra0rRNFGMVQl8dKkH7
	 RK1e4dyc5lLvTyowN+5zT+WCP79/kBNJ26rkl24A8fme81RB+OOIRytLtANwgy7S4OqIq
	 QqKGBSwg7JnI+nV7sqeZwMtLTe85laBP7xrYdRftNeV0iic1G3RwD0z1OsCTzJN1buUdF
	 2Y5bWfvPfTsdODktGSqN3AWiH8CiWROtxt4v36ewjgyGgUExo0McRuPshDAShiqZo1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EFaQhSzmT3PK8VQiQr7HruQbkLNN3qjfxSYlosLuFSg=;
	b=UOtKo7amYsjHc1RXfG8X87YoUhgZr8S3WCZkUHUY/Qjhdr2m59DjnEWzpk//FIRoW5Qy
	 +eyCJlQsmJleZiPym/reE2DlH4wS2vkcJgGhilyA7FJO5rcXiOpSUfgKTo0yQNrMEnDCG
	 /jmU1Fc3Ji7w6nrmZtV36kSQ9dG4IX3P4gilBqeG8aDI/yBHl04LKbHn+crXahZvYDS+V
	 RuGqRYRamGc/jcD21jcqAHmhTouziuYham7yI5QpiQyR6+DPRPkNlViRjHSFXL9bsvbTb
	 pZmTWe96LL+cIjb1WH03Xc6aooadCF3unESuppmSyC2AXuWBYwoxWLaGyB79Hg1U/EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sWaVVps1;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF286606A338
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF286606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sWaVVps1
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bfbc67991cso1626537e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675410; x=1795280210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EFaQhSzmT3PK8VQiQr7HruQbkLNN3qjfxSYlosLuFSg=;
        b=sWaVVps1+ysH/6QaDDmIa3WTyj4xEDtjjApVfpsBrbL38jPWdx/uwdhikoyIa7dO3W
         R6mOTdIG1tOOyMI2iDPAhEQQMMWLm41ECQBhKWA5g8LalyaVoGCEm+Qg525wbItI25vC
         GTiNFWCJpFSyK3FtkC73kcN6A4DwDtVfskqMdaPWoHzgnOKY6dX5++/XWw8bsFvbrxdV
         RdhO6Z2fWJ3IWIL2dNIVl0hJnodH+bqsrywEL5xaGAUpHTKN7JQkhr34kTaUi1YqvrLs
         dF4NeYrglEKQMoJzkpmv0gN7JB4dU6GsPnhaKaGw+uw2YefoKgi0FmCMuNRlLKL7ODv9
         nYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675410; x=1795280210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EFaQhSzmT3PK8VQiQr7HruQbkLNN3qjfxSYlosLuFSg=;
        b=hJCUQ8/vXv+6U237z2w349fhKw9ROGAObHhjvaCq6btYrSmo2B9+SCYrX256z2H8yX
         wotjfsFJWwv1pb2XkyUlRXLcW5fICWJ9Mk0T2r2az3NCrhxUqpnEVTEZLYxlKuYJinJx
         JSsxSJAi91+diKYRFulMaGQhso10u7fJXmhuV9U+IF51/5seDfQ0F5MXA86Fq6S9Coz4
         1q0ev9yIB5J6wWwZ3lc7MY6v33nejyka6NgfPbk1iyb4yNhyU2Qdc8U7OspRs45RaujH
         lU73OJdeUqI32LULr7Iu0Uqsik+pz/F2pFQ3KOrUwqh8u677GzsyO8in9rkmvlpazCrj
         ESeQ==
X-Gm-Message-State: APuU4Z+zQSOyKkxBSl7ka/8XiTm0kfP/B1U+JV4xxVwTXhhpIf2e+KpH
	j6UNWmzSxM1f0rcVAxAPOUHBN0DwksDMJBtssqMcxnktC2fzojK9n/h0
X-Gm-Gg: AYBFou2ceGEJOFexWhVaIyZRoL1xzLjSBn/3vSfOSuQkJ8gm/6Tbnao12QG49hVyHUt
	BlaEoF8qmA9zPWMll+mUCtzbTNBqR1jwoImJ1J0hvLRNLGiD5smQEbYatk0alc+w7ULM1WSjr5J
	JZS8ZDVaouVxYHIxP9aOZyIpppKRlpuIwelwUCKxjcA7OO+xujgtanHklpSMDRu0DUwILGvN9U5
	mUZmSkFUSNWMk0b1Q7RN0Izh5yr2eJi6HgUBR65ceal6EczW0h871wJPctTq0Q6J9CtRbPgbe8k
	0y11bK46byvNTXDAqCRA2IaAKS0y+MFBzRHkcFtol1WyMLx1SZO4MgWZv+IbeM7z1m6vJVH0UOe
	+GCl7f0mZMPYkh855dB8yl8VKXn4HYBd3vOrjRCj+H83B3ASyui+wyCg0QfCdXxXEBt1CCw+oLM
	vwoJ9CuR/LyuGc9aR726LLe96L1wmFMJB7vilqVvKtugM/1Y4Up0+aU2Kc+kSsiJWAL9WWxbuca
	jEs2yIN1e6q0xdAgTguGhQXpb+rnNfpwSQp39H3mvIXQ2ujkM12jAl/UmYKoB+bA2Sg3cY6Kz6q
	ph6k6GxdWNFbRseRZQmkLutAd74H3YXslwfm6+LSPm0PSQhwAgA/YLuMTQG+Y+p741Pt+vG3L6w
	QDLuvMWRKkw==
X-Received: by 2002:a05:6512:31d0:b0:5bf:d9b8:15f9 with SMTP id 2adb3069b0e04-5c170b1ecf6mr2496505e87.34.1794675409725;
        Sat, 14 Nov 2026 08:56:49 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad26sm1792051e87.8.2026.11.14.08.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:56:49 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 06/14] riscv: fix duplicate extern declarations
Date: Sat, 14 Nov 2026 20:55:46 +0400
Message-ID: <20261114165612.368785-7-safocl88@gmail.com>
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

