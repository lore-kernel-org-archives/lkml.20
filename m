Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9694B3EAC61
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510485; cv=none; b=SR7QTMIOabip55402Mz3qHd8rtxYuyD+tDuzYh5ejHfpCgOPX4tHCFV1cdZlRj5pPI+ty6F5FI87UGPuMl+y7FXwzJ6HAndLd6LP9dSCF0IHCnMhdrJ1+1o1Ayq6T9A5Ki246zkrApQZyn7eTfIMKtUQqIGrmbECdmrsi7baRuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510485; c=relaxed/simple;
	bh=ehf7cibTHV13kn1I4/w1gH3nk2YrtsX5RQWrQhshmiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QHfbVnYdyux3RHhPFUpp0ap1WSBFqzwTNJOKyj1Gs+SuQTY/2POZZYwN93Sv3Hhgi+vNWqSu6UzebAW0DXtT5z2GuWuxyfBZarFInBcHLluJPKDxEU7Z3CRw16Pl7zXBz9NY8ZB/A5YT53Fx2hoYu6eH9VJ1gYAhKPro+5afYkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FEZdgZm3; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FEZdgZm3"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4843f205a5bso455547f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788510478; x=1789115278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qKPV5jw6GtP47CgKC0/pvUAoRdY5Wx++I9+qXsxCWi4=;
        b=FEZdgZm3oH6vqFMvfwNS4P7r9nnOhhC0NNu46F7uYW5jdGxsIgPQZjT5zf1M8GYkYW
         BqGtF/8aiZ5fY+E0liPCklFqlU7RvKgh0TmEWD8xsUgmRFz0hecuNVePfwTPabhKIzYa
         +JWcRMCwJ3z2RCJFBWhmpD/E9Fl2K4nlVs7nuPpdMAQF6KU6okY+2NMctiWLJqkzrbsE
         8cjTf9TqFRzq/L+1NnGFn3kxQr4jSjItgSPTOqauU1oJIuQ1YPSl8EGkDOIZvkRG8YUH
         2BTD0f+iBzUlpntdPqzSpk3JZSgMypt3ExD1/QD/iX4IdXDGPwtuBbEtRtp6mah1YGjv
         oZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788510478; x=1789115278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qKPV5jw6GtP47CgKC0/pvUAoRdY5Wx++I9+qXsxCWi4=;
        b=c3ThHxPcg9dovO5OaOeWFTi9M61TzfhyXlEATIILbO59vSEhOpx0UldKcgVgefLAG3
         Asz0luvlJrBUG+sBIJHxgBmHHMxsqwSnF/ScJwcJSdKvI3QqyLcuLa7yRNs4/JvHikHk
         tlTIHXue+YlT6QfhDmz+JFczotTp82S6a/ZTh+76JKO3s+oQFpU+y7Iha3rWSvb/oY2U
         YQp9nZF+1Gs/x6lbAL85yEujeXkasiE986P4u1O9+p/CgEvM5B3ZmT+t0kXwWLATDdsH
         qkOuxHWHLj8kM/z584y8m6RV/Wcw+lQJvnpK8zOgG0H1uZizNKCFMiyTMxQYHLi6X9H+
         RaqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCUvGP80FkmuWv3pcCUCRK1MMqrInp0gjUopzfN04ItWnwTjlv9Mr9C1NhcxOixmbdy8xu4pIPtdzlc4w=@vger.kernel.org
X-Gm-Message-State: AFuF++m06GVWkpyZOj7ZtzQR55Ziy41eivvxBuNJWnX/ktaJ2Gtd0LzT
	wFhq1/Ww1RGdb977zuLEiZOx/A2NJ7kdLepEpL+Av7P9ZuF+c6LQB8KK7krOs6eA
X-Gm-Gg: AYBFou3QBq8rw+aJAXOgK3AtSHA4QEwD9I+QRmrWiD6r7e+WdNLvwchhD0oDaNJ7feQ
	CLFR9T5+CnIG9F7TvoUDvC27rmsfsOS5iM2DdgTpR9ZDqJSydZv/T6wAgykqm3/So07YrH8uhqk
	PIhFyozdNPI+XW/QD1CRUxe+6s0h6Kf4Nsxvwor91g9Xw0CM4ho7J+aA7+P1KO9jOKLv71XbyPb
	WbvM4LsoZ4V1znWeqazgBmpIkfKgvwrVP5D0oDt+Qxbhd6/SDjw+shYbmMMOBseNzeH0FBnJJKn
	VvaVTBLjybYLqRSFRDrHzue/JqPXGgMmeXOFWlWEyPp05iWZWmaw+9rwCXv5TW38q/Jj/EbHR/e
	6FRTbHQKizNCZgUySNfUYxnuhHWs5euzZdw2hrY0VAr5Y1aZ0RYGGfbUZwZu48muIKqETsO/SMO
	ffI01tWZZMZuT1Om1rZ/cv7851RZ7ei6/w0mxB5+oWm7GIORqTABy1zS8ok/FUavhUySTZAQObS
	P6Ai6idMoLwHu8vexZskkTTmYCpmUoJZYn3yJ4gxBgSjDx28TedI486UiWz1ax1KDOFKg==
X-Received: by 2002:a05:6000:29dc:b0:482:eadd:174a with SMTP id ffacd0b85a97d-485872a7ef3mr3396378f8f.17.1788510478134;
        Fri, 04 Sep 2026 01:27:58 -0700 (PDT)
Received: from fedora ([193.77.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885cb03asm4556228f8f.37.2026.09.04.01.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:27:57 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2 2/2] compiler-gcc: Remove obsolete RELOC_HIDE() macro
Date: Fri,  4 Sep 2026 10:25:23 +0200
Message-ID: <20260904082741.578048-3-ubizjak@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904082741.578048-1-ubizjak@gmail.com>
References: <20260904082741.578048-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the RELOC_HIDE() macro from include/linux/compiler-gcc.h.

The GCC specific macro was historically used to workaround very
old compiler bugs (including pre-4.1 ppc64 GCC). These compilers
are now long obsolete.

Use the generic RELOC_HIDE() macro instead.

Removing the GCC specific macro allows the compiler to better
optimize the code and results in the following code size
reduction for an x86_64 defconfig 7.3-rc1 build:

     text    data     bss     dec     hex filename
  29826466        4953091  743828 35523385        21e0b39 vmlinux-ref.o
  29821414        4952963  743828 35518205        21df6fd vmlinux-new.o

Removing the GCC specific macro also enables the compiler
to better analyze the code and avoids suppresion of warnings.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
---
 include/linux/compiler-gcc.h | 25 -------------------------
 include/linux/compiler.h     |  8 ++++++++
 2 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
index 5de824a0b3d7..081e658754b9 100644
--- a/include/linux/compiler-gcc.h
+++ b/include/linux/compiler-gcc.h
@@ -10,31 +10,6 @@
 		     + __GNUC_MINOR__ * 100	\
 		     + __GNUC_PATCHLEVEL__)
 
-/*
- * This macro obfuscates arithmetic on a variable address so that gcc
- * shouldn't recognize the original var, and make assumptions about it.
- *
- * This is needed because the C standard makes it undefined to do
- * pointer arithmetic on "objects" outside their boundaries and the
- * gcc optimizers assume this is the case. In particular they
- * assume such arithmetic does not wrap.
- *
- * A miscompilation has been observed because of this on PPC.
- * To work around it we hide the relationship of the pointer and the object
- * using this macro.
- *
- * Versions of the ppc64 compiler before 4.1 had a bug where use of
- * RELOC_HIDE could trash r30. The bug can be worked around by changing
- * the inline assembly constraint from =g to =r, in this particular
- * case either is valid.
- */
-#define RELOC_HIDE(ptr, off)						\
-({									\
-	unsigned long __ptr;						\
-	__asm__ ("" : "=r"(__ptr) : "0"(ptr));				\
-	(typeof(ptr)) (__ptr + (off));					\
-})
-
 #if defined(LATENT_ENTROPY_PLUGIN) && !defined(__CHECKER__)
 #define __latent_entropy __attribute__((latent_entropy))
 #endif
diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index cb2f6050bdf7..a44a88236f6c 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -148,6 +148,14 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
 	= (unsigned long)&sym;
 #endif
 
+/*
+ * This macro obfuscates arithmetic on a variable address so that the compiler
+ * shouldn't recognize the original var, and make assumptions about it.
+ *
+ * This is needed because the C standard makes it undefined to do pointer
+ * arithmetic on "objects" outside their boundaries and compilers assume
+ * this is the case. In particular they assume such arithmetic does not wrap.
+ */
 #ifndef RELOC_HIDE
 # define RELOC_HIDE(ptr, off) ((typeof(ptr))((unsigned long)(ptr) + (off)))
 #endif
-- 
2.55.0

