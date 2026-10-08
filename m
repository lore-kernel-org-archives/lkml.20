Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A335A3BE175
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 05:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791437882; cv=none; b=ZFk2s7eWSnsDCvKFTX3P3WPk2O3q2ALkbanHsdDdsyG4oyEIYozaO+m0/UQPYPpnhCLVh3HNDsuc0b8/ERY76s9lmbDICkK5dBpyxasQozIHaxXBnxdpS/uwqAnQYVigqXQYtBW/YCE8KJnisHanjW6AqFzfLg6/XkVUVSllf7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791437882; c=relaxed/simple;
	bh=rvDjT6+rkk/VmCiFIRydEcSy1yOMxPWIRLLIGRibt+E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RFidmNI0jGCwAX1jEp74vyoOcUnfz3Q2MCBxf5VJJN/FF6fGLH19dmDDakysNNvBjrQMnZjUAWDw7DMEtGepJWJOEEv0MIQQMrEKF9sbDwdCsqS789rkVb8XXD8odIkXM7S1bR0D5Q+cdiDjFySUI58hQeYp54M9hmJ//byfmsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yh7cMBgm; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yh7cMBgm"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4be28b82so2273185f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 22:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437879; x=1792042679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FsH0cWn1LlvsmNG6WCJYq22XE9O6pVl1IRSuRFpVGDU=;
        b=Yh7cMBgmo/6b3k4PctoEFzhD1e/0KD17cA82ogqXm+7ubHjRBxuz3nyiQmM8Cx+5r9
         DIxXxYjk2hJMGrkqsr55v+zrTCI5ifQ+Jd332fas4pNIUvVHQtb/t0BfYILk46GepYtb
         Q9wklXu2iHmxarNKtwahW+5Eig4JSHSxv6+DePExzzuui0MkdSb7fTEKDuswI/FuuQaB
         3pt/S5Aj6GCvNGVKCUYLlzF4SH4aLF8D1D+UQfMniBiHyIqvOZkBThYNSXg70oWufCup
         /k5KPKimHiSZhBn+E8rwczL516L733mvPmYFVL6EUFgdvre/F85WnkHAxsS3riXCVISl
         qXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437879; x=1792042679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FsH0cWn1LlvsmNG6WCJYq22XE9O6pVl1IRSuRFpVGDU=;
        b=nRr5JHVHBdvp67TUPUFJsl8x01xHBprsPUMw/gsGwm4zFhw21e7uAntB0HoulOwq4c
         jBnvz6JrqkfumQZKmK25BzHOnjh5LkdYdaVapQWOAzdLHXE+228GEGxL6rkfY+W76Wmw
         5Ih/GZUNSUfaa0f3oQ1KpAssjirMDktyJleLEyzPaCD9axWzalfKyHcy/kXdhBVafUyN
         YBXVTEB0FL1g3pCj8xtkyQqqla/1dKweoO3X+CML1OMF4nqCWWQ/wVrHeBQ/aWEhz9rb
         mEWWuhRAlWFg2vh/Wx+9NfoRIZHZkQCuezAxDez9Zmh2W+ryq9nR4FcFCuS/qAa7zcMM
         jI+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzz7VQIsKYOmjUQ/z1PpRikNmv7dlB5YZPBU4a8SQn9q04NyL4/OtqaI+jZPE8unClveQFylqOonbVxkWY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqPhrvAGhNk2meRS7juTn3NIKtFsiD8zR8aP0GoX6mdkn38JR6
	ynaOmikBgFcazpQTxFCqqC9u3OT5dkBVH0XH+QDFKZmYvq/X/p4SZH8y
X-Gm-Gg: AYBFou2Rg5C998rdAaXWLkiOGvG+YRSjDYalxYgFcP2WXJuT6AhwqUCWk4VGHHe1N4V
	c11ToWKHrNSlIJW+1NJkMxTqtTSZQLK3nys0D3gmnLLaDtRRCTqkAruFe/QUmdnyj1J7S7il93N
	fsGHhn3br4zr5OU6+0CBg70UVn5tkSOARsv6IWQaO04nvgkcjFpyPWLmKOwXjqvAUZPTafr5jXd
	z6GzMMtPuB099jXT8qrshZ9AwxUEq/sjZxAbMqiuDgZf088YXDcTyc7mahPRgI15vReGoA9bzTc
	9UqJSWYrQhtpA9iSg2dZcMpYwbsUp+MX5a7srgAXpo0CZzQ5QkGfFW6Szfuu6VhbyHisFciSWnj
	ZniqeTWuukRwJgcBOlSZUMujlNnm5jB6feztkTKZoedXtY/Bf+aFlgINLrSWyrAqjGMP/6xYNkS
	BvrkYbSlaXLX8unRBX1kooKAoTRawxdX8Xu26oSljCQHyPbU6QeQ6AocwweHFLNiv+0Ff/eYj7G
	w5uaUJ+lnc+krNYf/j4ofBFcII8mjGd/Up8lhS2ykUOmKL+LJeP8RXn7kaB19ZmJGEdtlYOoHdT
	1eYZhPUCrpXpsikHl7uyByU7Hl+hvEXG2Tt5rrX+BNbtkPpHWiu1L/lxoLrexAbtOnfJOoBXUSc
	8wqBY73s=
X-Received: by 2002:a05:6000:2407:b0:48a:fcf9:aca5 with SMTP id ffacd0b85a97d-48c72779796mr7901474f8f.11.1791437878835;
        Wed, 07 Oct 2026 22:37:58 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm8458219f8f.33.2026.10.07.22.37.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 22:37:58 -0700 (PDT)
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
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] ARM: cmpxchg: support 2-byte xchg() on pre-ARMv6 CPUs
Date: Thu,  8 Oct 2026 07:37:42 +0200
Message-Id: <20261008053746.49631-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261008053746.49631-1-kmehltretter@gmail.com>
References: <20261008053746.49631-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pre-ARMv6 CPUs have no halfword swp, so __arch_xchg() only handles 1-
and 4-byte exchanges there and turns any other size into a link error
via __bad_xchg().

No C code needs a 16-bit xchg() on these CPUs, but the Rust atomic
helpers in rust/helpers/atomic_ext.c provide xchg() for Atomic<i16>
unconditionally, so building with CONFIG_RUST=y for ARMv5 fails:

  ld.lld: error: undefined symbol: __bad_xchg
  >>> referenced by helpers.c
  >>>               rust/helpers/helpers.o:(rust_helper_atomic_i16_xchg)

Implement the 2-byte case with interrupts disabled, as the pre-ARMv6
atomic_t operations already do. This is safe because a kernel built
for ARMv5 or older is never SMP.

ARMv6 before ARMv6K (ARM1136r0) has no 16-bit exclusive access either.
It is not handled here. Rust stays disabled for those kernels, and
they cannot be SMP since commit d70242427110 ("ARM: rework ARM11 CPU
selection logic").

Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Bradley Morgan <brads@mainlining.org>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/include/asm/cmpxchg.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/cmpxchg.h b/arch/arm/include/asm/cmpxchg.h
index 0ce5225af442..18555ae22893 100644
--- a/arch/arm/include/asm/cmpxchg.h
+++ b/arch/arm/include/asm/cmpxchg.h
@@ -31,11 +31,10 @@ __arch_xchg(unsigned long x, volatile void *ptr, int size)
 {
 	extern void __bad_xchg(volatile void *, int);
 	unsigned long ret;
-#ifdef swp_is_buggy
-	unsigned long flags;
-#endif
 #if __LINUX_ARM_ARCH__ >= 6
 	unsigned int tmp;
+#else
+	unsigned long flags;
 #endif
 
 	prefetchw((const void *)ptr);
@@ -106,6 +105,15 @@ __arch_xchg(unsigned long x, volatile void *ptr, int size)
 			: "r" (x), "r" (ptr)
 			: "memory", "cc");
 		break;
+#endif
+#if __LINUX_ARM_ARCH__ < 6
+	case 2:
+		/* swp has no halfword form. Pre-ARMv6 is never SMP. */
+		raw_local_irq_save(flags);
+		ret = *(volatile unsigned short *)ptr;
+		*(volatile unsigned short *)ptr = x;
+		raw_local_irq_restore(flags);
+		break;
 #endif
 	default:
 		/* Cause a link-time error, the xchg() size is not supported */
-- 
2.39.5 (Apple Git-154)

