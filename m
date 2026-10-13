Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF47154EEB2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923523; cv=none; b=efT3Ls4qoVXfadLjUwkb9Irr4qHl5COtlN8kQFWMzg4r8gBeVZhAwpXjRSPGKNWlTHncBX/aenQljo61YsICnYJOsC4t7B94R18jRGF4jpv3nPP+AKRgfvYYtzr7T3vgtDuIVflA/DMNaR1zn9nMevLOsOSfjBnb+IuinBMvGQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923523; c=relaxed/simple;
	bh=rvDjT6+rkk/VmCiFIRydEcSy1yOMxPWIRLLIGRibt+E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QXcRgc6jC/w+cmZ94N4ELREIgjC0XKeWZb06hDRxyeqdNyvg6rsUQ9V6jwvuNaJoidK2QCrZ/bF9CpjXpd3jjEUDlwSxRvnksO9NLYxD7+l1zMEjgJTsV/1DNkNeFDZsd7E+YqyYffU/PIsMrJuEodGtEK+0BoSEPys9s0GuAao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLKhU1rG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLKhU1rG"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a061a13884so29481115e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923519; x=1792528319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FsH0cWn1LlvsmNG6WCJYq22XE9O6pVl1IRSuRFpVGDU=;
        b=eLKhU1rG49q88ag/gWs1HMDAUcoZLOb6EXdOJLFUyd0O0SXt5VPvOklW/Qz6A+7VnF
         lvPo/hXub3Gqi9ui2+6NPw1jfnKAhtsaO3fKD4XZyMmKi07Z7Eow1RNm1cW6DTvaXUzZ
         qj4vhQ2qTTLCH6gEc1n/VJYGiwzBwHwowpnm+8Qiz/Sp480Y8wv3gcopAf3PWSjXxmjB
         NYgcQzhjNYouv2+RrWeqgxqJF3+MiFlJ5XwOlwYdDBeJL3s2F6lQVN6oV1ZLU4pzynut
         Sj94e2JC3YRfq0fH4GC1vp4slwDQC1c/3j2DljXg+OlmVg66fbdjwwAGPJQOLBn0NGgk
         46og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923519; x=1792528319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FsH0cWn1LlvsmNG6WCJYq22XE9O6pVl1IRSuRFpVGDU=;
        b=X1a2p6RAr5Az45YdjJ65D5J+UcHwn+6/zXLzEkNMScY3u3KREBb94nGBXyOHDQUW1M
         yqikven/ixZqh+OvLxbnWd34IQeUbVVYswm7J4tZAXSjiBItqm7RTMBOIaR1MwoXxZGy
         ZkSCeCu3UmmBg5F70GEqME1IDHGe/nvWkTxSGS3v5dceRzxmVF8/GUmwWO8dGMiQC+pD
         nAt+OBhCoFUWoxSvlOeJWpWUvIuavLW7Q1VAF/5RIonhmKIQ3PQqF/G+Wngpso+gmIyG
         rlBTdYfJtbZcdA3ZH9ICZ+IWo7nJVdO60hpSqYNXyS7vNcjY7096RV0NDwTm/7pucjnu
         unQg==
X-Forwarded-Encrypted: i=1; AKwUvBxMZTB1Tg1DmsvM5pIK3Lmq5aAsaooKh8Nrr0Y+pY2oTY1DavLd0MB4JehChVKXORS9vunYt1EEy7nGvMQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHZ+vVEfbOL659ectn001P95dex0PV2zuEhNKEKlt5gyGEoUeP
	dDb1bZ2gzhkUMMcXY1XtusJt2LCR8u9fEgA5d3+ZtL9JZLBPWCQ+qsBW
X-Gm-Gg: AYBFou279h41QTb5bPFSQjwsdiuhl1K1kv9ZsukB3myyQi4h21+qC0nxp4B4JHAgIQa
	GnqF0Q6W7XVXDFnthU6y4EqCIAzOQW5btGIVTEkuVJ5IV/QPWek/ylp/NsrGlYmtF33KZ1pXbHf
	E7JVoMpN1kuA3W7NkNCajLQEgNM7D2d83/KqMXhKbDig/ZZnzMfVGiTVDakTq2rq5RWGM15Pobe
	JdV1svKijC3e2ub4GsiXYaAQ0im1PEqjAhHI5IsH7vHfxNGHE3/f5p9jtiBqkNCv/OETFVI8BJd
	qgYbeXK4CYw6n+l9jpttTeRty7FYDXe9FingXMYFGGoKUa0VCDoJh8C5VSAzZpJoVEkYvvvfFzP
	jZ6MMlkoe3pFYl6WlgbPZw6A3Qrwr/3KJAzK/xtJ5iDaDvzqUOTI5ns/rwlKPFkjdg4CZ8po/5p
	8odpqZyc5R+yZxcwbuq6BYeviUdTbQ5gEG8R1wxOGWs1nxOPjKF26ZQLvWqkE4V7PB0w6hId8c7
	dfqd3S9RF2Kc0dLx2+CnMw7tkAldiQLvaBgAT7M+qX53scGV+iJLfvbrgBVmXMwpnLCs+nPb9UT
	CdWLr7t9FJibPULn5/RmhOLCsUEU96XACOsvF6nK2kW6Tt/3jhBMR4dXfRidLUzdAgJzupqutPy
	TT5SyEA==
X-Received: by 2002:a05:600c:4ecb:b0:4a0:c01:1902 with SMTP id 5b1f17b1804b1-4a18e43a29fmr276884405e9.2.1791923518889;
        Tue, 13 Oct 2026 13:31:58 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a189-2701-8c58-155a-0279-7389.310.pool.telefonica.de. [2a02:3100:a189:2701:8c58:155a:279:7389])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm5237345e9.3.2026.10.13.13.31.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 13:31:58 -0700 (PDT)
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
Subject: [PATCH v3 2/6] ARM: cmpxchg: support 2-byte xchg() on pre-ARMv6 CPUs
Date: Tue, 13 Oct 2026 22:31:36 +0200
Message-Id: <20261013203140.31741-3-kmehltretter@gmail.com>
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

