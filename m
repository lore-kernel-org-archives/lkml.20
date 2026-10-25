Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792950355;
	b=bFEcx1wtJ5wuRMTABCC0RZv62oBTGuB+JVTjKIUPaYKqMzLfTEbH3XAtn1bWWYdpA0l1
	 obCz0j2PHufU0FfDJ4ybWgGm57OetHS0SLxOdvgdtjQ8F/h6OV3N9PnOsGF5s6rSr08po
	 YdbEbig7bOPNzl0axM4e6mhu4qqPQdi9OxA/yby1r+aMZbqi+Wg7qGzLcIcTmj1WSFJfG
	 LJ5jKpskq0j+yDmdTe7g0SLV2YjGeuV+1rwPs7Dq1Lh/NmbFK/uKzsOxcaE3qiFprZg1e
	 U2CWPKr7lvbKF97r9LhdNjMDcisXKlYrZRPHgMCB+Ybzmkgyccst6SIkoSj72ptnybg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792950355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+n72e+M/xoRLIldiCvujYO4sGLRVl1RjA57TS53m3BQ=;
	b=G535k3usfWK/sRJpexLDZSD0PFUIhaEUh7PI/b1qrZTtVpKzRjj5chq1wtSJovj8Z3Vp
	 o7RdgJlxaY9n7hUTRu0OzaXw1B4O1IWE7sJaQUnb3gOKgYtDFH9nLzmBeuN0eTwG2pY4+
	 S7xiS2d+2iNHfGreT2pAEH9+MlDMIhOc8fPxH+HiWT8If7q30ajZca/1NCyh/BOf88Vqq
	 YON+e9FVQxFA8rsLI1UXzLkT7EEMY7FPAkHIxtrVUjXhZvITYPJngkcpRRuok+6DLxP1X
	 cZbJHLlFRuJx/JqbzB8PPXqSaibJeDP0UN17Czz+7kuWbPPJR46Y/hj7qShh4XSlTkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e2tQlGZC;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC50606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEC50606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=e2tQlGZC
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c423b145922so301391366b.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792950353; x=1793555153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+n72e+M/xoRLIldiCvujYO4sGLRVl1RjA57TS53m3BQ=;
        b=e2tQlGZCZjYYgdkOtMEKfNcGBHJQUNwM0u6Pfhil7wEAmK03cnLEHMs8WvSvLrLtnQ
         r/hASwLw8EaWs+02IrV7Rq1JqeWD9MmIjW6GaWM2Y6VJb9yZyhNT8J/saVf965vJ1qWF
         D64TQylFJp4o/bt1uKE1jfFiP/ZZL4NbKGkPxRPXq8mWQ1l55eQefbEzYYjfcR9yRjvt
         qK5f9G7sBM6FUAXow8K2vcr1/W29xZnFLF8sy4u8Qcgk7lccwauGa6xZKblyD3YyUnlp
         c9G6EH2qBEb+qq1bReGGvh9+d3a7L4rDAoYBB8jbs9ga8T24HHCj04BX0GR2+1YMdCE5
         XaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792950353; x=1793555153;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+n72e+M/xoRLIldiCvujYO4sGLRVl1RjA57TS53m3BQ=;
        b=2aMY23QiJXF1QcmllJgUmccGFwrh85qRoBUdZM73LNaBSq+CX5k/cFX2m8eJweDQdP
         4i7/GnjAbzV1J5ZbUPQZ7TVs/Qw9+NsUG+DHwCL5RUnucJfrSTJTJLvscB47K9kfombT
         MoJmxf611Eofm+KSQZcHQMw9qVNdle1+uM5n9Pu4imHLdUUAqT+p5LdOr5DLIBGccLbK
         0z7o8Sl92INzav4qSjK1GaZmlWyLaL6JAb5MW7goKpj8cnEDATqA38jAPEB/pyZCnIOe
         sEOQsBJ0odG81md8i/RnztyG4HEVQceS8X6RzOUe14In/IaSSa5u/yEfwCsKjlDfEzSk
         0hLA==
X-Forwarded-Encrypted: i=1; AKwUvBwSBhlTvMxG1Fmj65kEdDE6D7KyysJTaozxXkPx+aWPSt3dtT/8ux2dOx/u+uXghvL4uOSn0IKGRnNASAQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJfu70TXt2N7+Owa/L5LIw4IDEWwZwUT113vbvEROQwoSXv/Ef
	7apPCKGD7Cfx1ZHuLPERqkszrmMOiGlhvuOKJ783pJXBD/nUv89/sJ5wi0isWj6OcNmr8g==
X-Gm-Gg: AYBFou3HHFx7DWMbJMdBRe2ClttbGqHOSRwAeRG7gnzJLSq8W2nFHI9dbIiuf0xB3mV
	bp6VggHTXFzDEbO31owYsoM4DwuJUzbm6dH1FGMXWzwSkwrZTPgwN1O4VN3QcF/Y2JtlIy0pdnS
	DmFXTQYmCus+A+pCfxIQ2DtJj38WmOQ+qlDscuaPitEzPST8U+nQsCqmiLeoQhGm58gn2NKTKfl
	2Tut6+gJlrnAmnPttWImkbq2nH/oREnacubHNx3nB3pu1da796dI6FTRj31X9yE/nRexm9VyXB7
	kGUApxPD8UTqw9QbV9B9RyXOXvmnFbG/5074JRT2LYnVzdpeTpHctvffvOqq1pfrkCcpwAH4PEL
	U6tTpQPmAAoaJ5TTJZgjL4eoessl5mqmzp/Ts/ahC7Lvwu406ZyjIeUaVpYZ9DUFGAQQvgk7msh
	jp6xuDPu7u1l6ZraiCMjLxxt2dF9OQ9Zy3N2FM9Q0uQunaGQxdMPTYzt7Kq14vof1IohsWRMhEi
	aQdB7dvM3FUGtpHqNn1TvG1urGLOxXueMsC+JONkmj22stk45YexPGQ0OGKaUSD
X-Received: by 2002:a17:907:a0c9:b0:c46:9e42:2563 with SMTP id a640c23a62f3a-c46bde8a1e4mr606692466b.39.1792950352903;
        Sun, 25 Oct 2026 10:45:52 -0700 (PDT)
Received: from antekk-kvm.a.lan ([45.137.227.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd666561sm224235266b.54.2026.10.25.10.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:45:51 -0700 (PDT)
From: =?UTF-8?q?Antoni=20Kuczy=C5=84ski?= <antoni.kucz@gmail.com>
To: antoni.kucz@gmail.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/build/64: Prevent native builds from generating SSE/AVX code
Date: Sun, 25 Oct 2026 18:43:35 +0100
Message-ID: <20261025174336.8857-1-antoni.kucz@gmail.com>
X-Mailer: git-send-email 2.47.3
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

With CONFIG_X86_NATIVE_CPU=y, GCC is invoked with -march=native after
the -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -mno-sse4a flags
that keep FP/SIMD code out of the kernel. The GCC driver expands
-march=native into an explicit list of ISA options for the build host
(e.g. "-march=ivybridge ... -msse4.2 -mavx ..."), and because these come
later on the command line they override the earlier -mno-* flags.

As a result, on any build host with AVX the compiler is free to use
SSE/AVX registers throughout the kernel, for instance to zero or copy
structures. A trivial reproducer:

  struct s { long a, b, c, d; };
  void f(struct s *p) { struct s z = {0}; *p = z; }

  $ gcc -mno-sse -mno-sse2 -mno-avx -march=native -Os -c t.c
  vpxor   %xmm0,%xmm0,%xmm0
  vmovdqu %ymm0,(%rdi)

On an Ivy Bridge machine (i5-3317U, GCC 14.2) a v7.3 kernel built this
way resets immediately after the bootloader hands over control. Booting
the same image in QEMU with "-d int,cpu_reset -no-reboot" shows:

  v=06 (#UD) IP=0010:000000000125e47b
  v=0d (#GP) -> v=08 (#DF) -> Triple fault

  __pi_startup_64_load_idt+0xb:
  c5 f9 ef c0    vpxor  %xmm0,%xmm0,%xmm0

The startup code executes an AVX instruction before CR4.OSXSAVE/XCR0
are set up and before an IDT is installed, so the #UD escalates to a
triple fault. Even past early boot, compiler-generated SIMD code would
silently clobber user space FPU state, since the kernel does not save
it on kernel entry outside of kernel_fpu_begin()/kernel_fpu_end().

Re-apply the -mno-* flags after -march=native, the same way EGPR use
is already suppressed for native builds.

Fixes: ea1dcca1de12 ("x86/kbuild/64: Add the CONFIG_X86_NATIVE_CPU option to locally optimize the kernel with '-march=native'")
Cc: stable@vger.kernel.org
Signed-off-by: Antoni Kuczyński <antoni.kucz@gmail.com>
---

Notes:
    Tested: v7.3 + this patch, CONFIG_X86_NATIVE_CPU=y, GCC 14.2.0 (Debian),
    boots on i5-3317U. arch/x86/boot/startup/gdt_idt.o contains no xmm/ymm
    instructions after the change (previously 2).

 arch/x86/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index b7e08519b8c1..2c0575fd7bbc 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -161,6 +161,9 @@ else
 
 ifdef CONFIG_X86_NATIVE_CPU
         KBUILD_CFLAGS += -march=native
+        # -march=native expands to explicit -msse/-mavx/... flags that
+        # override the earlier -mno-* ones; disable FP/SIMD code again.
+        KBUILD_CFLAGS += -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -mno-sse4a
         # Prevent the compiler from generating EGPR use. The kernel is
         # not yet prepared for general in-kernel use.
         KBUILD_CFLAGS += $(call cc-option,-mno-apx-features=egpr)
-- 
2.47.3

