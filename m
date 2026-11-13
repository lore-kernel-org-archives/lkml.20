Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794532034;
	b=Bt8nqT3ALyeHmohgLEmdNJmsFavCrW1eoZrEDGNZvbAzSVjl4mIAPLPJ4w/2EprMbrJG
	 cRvehQT7uQpt4/i/Ssaqe7M1oDy9ozlbRF+FcrwQlSjasovQg/shJ7SiLnQXbaR8Tf/y6
	 BCmm1WW4LUVh+hbtp8L80E69UHwuQ7K+oGBbeXq4yBQU6bIHHUf5TNJUYK3jZAN7l2yI2
	 T1PlOBUp/VSgw7uHj7QPHh0+O9B1fJYrQZsqykLuC4WV0HTLtiqOY8tWo+Mxp5bJZY/GA
	 /PMBOs9ZJLyt75RgLewctdBemQMHtvkN73HsRH9ifXLTbhBqNupXUZ2+FdwVdvSaTiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794532034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aKwOL7gGfUnR/4FiMNley7wGOgKp+Q8U8I3EBmgYU4E=;
	b=O6+oNsOR77KLZThNzlhbSlKcTmko3ZrBq9+Rm/d2/XveJO9S5yo7MXPkWLdYuXTNMVI3
	 7md0FQMEo7n6D3GA0wUFJs+FJpPL5RlXpc0Vhr/sGqN1Vr4r2Zdy2S7hTmP87wJnvtLV6
	 QbdvIxlxAFNfjuvqe+kMxq2BZe+sW9kzcnDNeQ5Xvihwxrqd+8EtVeDdpxUxf39hX6FEQ
	 GgKb0+r/lWsKVsEBW8SxBFBhyl04nrYGtALglDvqQ9SMSlYClqTcslXyRDHO8oI8pxTMi
	 BYdJ8NDqd3iHxgxhHI5Dzj87jNKri4cd5aZzef7CqFGIfiCmaZko6ZS6DRFh0G4lEjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P9H+TzKB;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A092A606A8B6
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A092A606A8B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P9H+TzKB
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3acd239776cso5237771fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794532032; x=1795136832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aKwOL7gGfUnR/4FiMNley7wGOgKp+Q8U8I3EBmgYU4E=;
        b=P9H+TzKBwJiVaLtgmKnIi/l/nWjQ5bON1/BL29rGQFcP6MTkJ8t0db7POLDFnidnQ/
         VJ7mA+02oQKya3la0Pp7rFeGbrwkwCTx+Q4VFhLQNUHGyfY9hnL79TKgRcr/5wv7cnvd
         3k6pP1rtj1qaj0+CZM2ROFC4IIYkVbv1tYKA6oSUtz2wRYI+aDyluWVY2iqkoHo+FuBz
         zOIhl/S5YXI+UXxqPDYjIaQnHIVIO2vI+wedd84nRU5TfXAAsOYRdPVQmMFeK/RULj8c
         cozd85mPO73/WM4/aETk0v/fueVokELo5y9UcUL5L7U1apq3lggw0sqIL/UclxkO/Fat
         387w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794532032; x=1795136832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aKwOL7gGfUnR/4FiMNley7wGOgKp+Q8U8I3EBmgYU4E=;
        b=gEQmOklb5aqp1eo2tNThyccTnCld2WjLL3Br/zHylxy/LZjfHGiLkFRxeVnzwmE2Wp
         j+FsqMVh1yYK1TFAxVjdo/1ZOsYoJfETMUg4xoDX8Q4SvBGFzTpVMe86lllChfVOkiKV
         KeCQ64NbrCBVaYWmOjrBdVA+Mg/xvDJgruITSUoJt1c0ZloI/U2/aiU5crpz1AmEToE5
         4YYMOd2ewQsevWpraHB10sp+yYIxG1fKD0/e0/6jgelqO0zsvw3hadDEIGvCpj0lNQ+p
         FcHebCoI/NBDaLkV11MAL4jwuToL9Q9gJIIA4YusIokjMvT5d8jBecWG3aJv5pMFMJqf
         cGKQ==
X-Gm-Message-State: APuU4Z+waflJgONME5FV2i5ltpMbDMrozNOiHWByZmVRWZDIcjE4Jb7B
	WNnm57ikAQXAI699wcyfx0eD8J45MiWsRAL5yiPWd2jvqWULYV+mKgi6
X-Gm-Gg: AYBFou347o68eEjq6g7BOQNaYiMHm4W8JaSYuD2CG8jek49Nmmzm+lIP132mL1bWKmF
	YwAoSd1sr8h31y2EdGKCdGsaFVkB0bgF2Pph6Bt4mST35Tnccpgp5C0lrQNd/QIxPcVQJI93w2B
	JYOBcsqWYpmP26QGXCiJbKqmJtnnRsH1qdZ4uel8sB7sEEAB+6OKbOJLWEMJ0MElZLbu4VknkM0
	FO5TvqNbzTcHJMrzsQznti5c0StjSmotXQt4VyjcIXYIDmgWffjFV1EpTOurI6yMIItvpIVsmUd
	Kg1uy2nTfMAsTkLsdpEFgzMEg606fAAUl+cMW2rRr0X5mwl2CbPnUwSapDwNSFtuJgDxmhfSARh
	U1fPJmUf6s3cff9SXvemwS+0Io5x2wjZpuFh8g9SlluWe6CPoWCzGImP6NpAAv8zIIdjBM2Nelw
	m1OFw8t1HH+Lq43l4L0mFjd7a+F9fA3Z+JUgp+tzhR6K8+/mFxJyxLKSzU+dBG7XezG/ASzcv6X
	ZCVNuccGgAf4qYz7fFP/WaCAfQDncpTZwZyOc9VF+yun6aHyqdylCwjHWT3WrznO79QLX9QTJWr
	XnjMtt8tBEhkVMwFTX81v2YTp0wgawFjLFcgmEgx/v3gd2LT41va1z7TFEC+EQAzOMmS/0xX4zj
	jDzp1t0qbnw==
X-Received: by 2002:a05:651c:41cf:b0:3a7:6d4a:1c9f with SMTP id 38308e7fff4ca-3ae2b4f54f0mr3050361fa.15.1794532031836;
        Thu, 12 Nov 2026 17:07:11 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7d183bsm3133941fa.31.2026.11.12.17.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:07:11 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 06/10] riscv: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 05:06:11 +0400
Message-ID: <20261113010631.139191-7-safocl88@gmail.com>
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

