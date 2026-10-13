Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39AF54CF68
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923521; cv=none; b=bD8zmg/Sh5fxHlDg38UIDPy/BQlJ3bm+Li1gOBYlhm2PtU7TfyvAUoGipV0Clt8FMuUhQLMofH5o9tLQV6lYe0AFdL/yQh2rnkdDNU8G/fTSObH1oEmiQoA2v8Hhu9Y93oPtN+DGnSxd053TSQEQ3ipKOJTqnPb43ms8pmvx70o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923521; c=relaxed/simple;
	bh=f9EkJkO0/YdEpyV9iZEvDv1BUADI4zTrdrfFh5OACE4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VUPZLWM3jA87LqSnXY+fkHDo3fhMb1oahKjtYHG5mkU93Z5K2+nWmCCcVMOLB4YdCMR2sfnUKEXYaEEpwwGo7GfaTlDH/2vmFO621lsQPw4rbXkI0HMUO4GHse66pzGJ0oXlw/AZtmK77gevFDwQXRo1nNdwluLuFUEPB3r/imQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvyU9O+b; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvyU9O+b"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a02718da81so27260275e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923517; x=1792528317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dSRlsCJ/5tvpWWe5VR84qQBeBhF4B6Pki9zDFnj6lNc=;
        b=JvyU9O+b8TuhIDYebZB2p6HUdZtbELUnoGK7yeN5ZHwiV+nlqYvIoVtx16bs7pVbot
         IfI6xxihqrjxmEK5W0k6OobbVaSEkribya1boFMU+h4ZpHYKJDV1Ha1AaiKS/XNftIQ9
         luZy2HPLZXVHViU9nEeiwjetwPTCj1izQtuL8Uv+oMVgZKXZqy8SIQbKMgwa5Li6cvEf
         WqBvNh/R9G9gQxiqLtCbBi3ocMqfRWPLm6ZlYXhBh08wkpJhDFs2TmjZ/w4H5L9Wgtzb
         cN/Kkwger4tfeU0PgWswN9j545gdUz5lCuL+fWncZ8x0Vkj9A48q8vIISLScfJEpo3Aj
         sHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923517; x=1792528317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dSRlsCJ/5tvpWWe5VR84qQBeBhF4B6Pki9zDFnj6lNc=;
        b=SXTz1c65PLhjDex7q5xflZN0JTCl7Dot5WKCYTFvMAIYtqWJM9etB8vG5tHVxG2d3q
         y5rkwpYeDEOtxlEE+aK3XWhyhxXWpP7f7U+teQmhTRuYeRhU4oOBdXTK9spsiNJgpfBl
         tWLnuRPsZ7XeHvrUom7nPXmzeuew0rCGdZEv3GTEPOW8/MMF6Um23Ful23ls3V0Uketu
         CcU5nW3KVP4pyLlp/dLTsL1rbSE8B9wsFzrVvqih8fnKQ7SmjEnFKsF1DqNCq9tMJ3/T
         ds/AltUQut9CLWYXg2vDrfyf/LikOtnO5lg7b+QziXQTVe/Q2fTcv/Nd69ymGcRbGaXD
         ax0w==
X-Forwarded-Encrypted: i=1; AKwUvBzzM/Y6fkPoU2V3TQ2VZ379ajnlPy6u+Nczi3Iw2OCE2hUnWmodyCc78d1/vpITcBiOo+HLbb4ZSaKtAu8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAxVxeFNqe6pW7/FwZV9NozsZIJfw2hL/tt63c0cqWX7XOQM5A
	RSWgw+OdbX4rl8QAm8wE/TW3NA1mkrTC7m6FRzPk/l3heAZitdSQzS02
X-Gm-Gg: AYBFou3Rtj1+NUaHVSTbyMQYlSQTw8CTnWUIdsHzPEkcXP0shOnGTnfshVni5AXbO+f
	VeqdbpVReHmKsUrIdM5LiZVR/11xg21p45FAIfcEa9hvq3qE0HVJa1tvQHHyOReKil+X/qZxQj2
	/0D0OnmeA5nCVjIvWtE2Wbia4tTcu3wZRyIf91IHUOpP3DVeBhE8a4Z00LF7dYeLziWwionhcLq
	17V/X6dAcIzYu3yFjSMPfSTK9DnxaI4cJ9r9NQ1LF4PLew8/tYo4woCUyoUD8uhRUcdH3nQi+hw
	Txl0QNwUMTV/yck/mLeT868dMxMXioqTdb4VRuyfhwnQraRe4AUoz9UusyKy9I6kSH2vrZI+ge0
	TB7ueh8ZzwDNhWyCEkgBCpeMmEDCaKd4bRkJLMY7GNQeBd1GZ9A+nsPaIA+fdas7Tuw6ZzE7pNY
	eKQX/DSEmboHgDLVrrwo6GfDmyPGwC86EELVlWEIrKn3uHQkLK6C7i9f0x0D3kue3ymOp7r0xJ+
	YSZx9eOElaS31SzOYLEWsFc2GK7IanRm95zM7k2qrplo1dKmfJrytF2CGEWJG7lAGfhDNQeOIG4
	I/XgaKHzzCw2KTdZcMGn5uY7RL5ZnGhnPKyUMhH7h/fV4ph8TDX4SVK3ptVifwx7Ew8u6X7hNvE
	L6vhBK2+LEuBxC10v
X-Received: by 2002:a05:600c:34d4:b0:4a0:108:3b54 with SMTP id 5b1f17b1804b1-4a18e4d67d6mr260625985e9.32.1791923516977;
        Tue, 13 Oct 2026 13:31:56 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a189-2701-8c58-155a-0279-7389.310.pool.telefonica.de. [2a02:3100:a189:2701:8c58:155a:279:7389])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm5237345e9.3.2026.10.13.13.31.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 13:31:52 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] ARM: cmpxchg: always inline __arch_xchg() and __cmpxchg()
Date: Tue, 13 Oct 2026 22:31:35 +0200
Message-Id: <20261013203140.31741-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261013203140.31741-1-kmehltretter@gmail.com>
References: <20261013203140.31741-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__arch_xchg(), __cmpxchg() and __cmpxchg_local() rely on inlining to
remove their undefined-function calls for unsupported sizes.

With gcc 8.1.0 and CC_OPTIMIZE_FOR_SIZE, bcm2835_defconfig with RUST=y
fails to link. The compiler emits out-of-line copies for the many
callers in rust/helpers/helpers.c, retaining those calls:

  helpers.c:(.text+0x424): undefined reference to `__bad_xchg'
  helpers.c:(.text+0x4ac): undefined reference to `__bad_cmpxchg'

Mark the functions __always_inline so the compiler can remove the
unsupported-size path for each caller's constant size.

Fixes: ab717dd98bee ("rust: helpers: Add i8/i16 atomic xchg_acquire helpers")
Fixes: ac8f06ade38a ("rust: sync: atomic: Add Atomic<*{mut,const} T> support")
Cc: stable@vger.kernel.org
Reviewed-by: Bradley Morgan <brads@mainlining.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/include/asm/cmpxchg.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/include/asm/cmpxchg.h b/arch/arm/include/asm/cmpxchg.h
index 9beb64d30586..0ce5225af442 100644
--- a/arch/arm/include/asm/cmpxchg.h
+++ b/arch/arm/include/asm/cmpxchg.h
@@ -26,7 +26,7 @@
 #define swp_is_buggy
 #endif
 
-static inline unsigned long
+static __always_inline unsigned long
 __arch_xchg(unsigned long x, volatile void *ptr, int size)
 {
 	extern void __bad_xchg(volatile void *, int);
@@ -155,8 +155,8 @@ extern void __bad_cmpxchg(volatile void *ptr, int size);
  * cmpxchg only support 32-bits operands on ARMv6.
  */
 
-static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
-				      unsigned long new, int size)
+static __always_inline unsigned long
+__cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
 {
 	unsigned long oldval, res;
 
@@ -220,9 +220,9 @@ static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
 				      sizeof(*(ptr)));			\
 })
 
-static inline unsigned long __cmpxchg_local(volatile void *ptr,
-					    unsigned long old,
-					    unsigned long new, int size)
+static __always_inline unsigned long
+__cmpxchg_local(volatile void *ptr, unsigned long old, unsigned long new,
+		int size)
 {
 	unsigned long ret;
 
-- 
2.39.5 (Apple Git-154)

