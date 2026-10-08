Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3D03B961B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 05:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791437886; cv=none; b=IG1ndJnl3E/jPmt9G9l2v6Ah9tUjZ9CznZt/IXXL7NJR9g3p24pBVf+Xpl1jcXkbjcWXyEF3XaMiwJDkDkX2TDsaqsNCjZ6h+nGbhEd5oNyBsQufgvXJAUmvEZnR4dmdssYM2a87YtQBuC/AyKhLiUmkk8PHmJgZAju+CdYjIKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791437886; c=relaxed/simple;
	bh=BvggPv4kZfzbeu1jtryiItpml/YYYx6+O0UApBbSUnY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tfiA90NPTQetQ8EHiwvn9dmMFvRt4Nkj4stAvHiJfSJAXdKaTAVi82bWucDI1zf5dpXMNW2B0zAZgJFxgFTqQjO9iwAe9RQ2z0PDoTM/oU/RVqX+r0wcstK97RkkoPEbXbqfJlICjjsUVq6z5pVm4KCCjRH8beYaIMKjrCxZ56A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l3aAfNFA; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3aAfNFA"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c5358fc28so2965477f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 22:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437883; x=1792042683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vMKKbcz+29LcMEVBUnKydYLylxMe84zHBke0K0F7tBw=;
        b=l3aAfNFADoqsxumAWT4sQ9B6P3a6HaM//aNUDE96riTjkXLLSHKyh4AXBoq2inthHm
         hJyT57JFQbi/7DjgcU0cK0+x9RWv015GuJa1JQVeoBMfufMbt1OAipVPt7zp214yQErs
         tCbsn49ASADfk+2Q+ZlXIP99RTRQ/BbbrdMPUkgKmuADTS+YI+iY3mqs27iwxH2Xb3cS
         l8/aV5nW9mU4Jv2LhYf9LehlXaP0mVupG1vDQZ47W+ocP++MMZSPAPN9yXfGKbsfu0iq
         sTPXWQiCO4yS+D2HGPTv9XaIBUehEjmIlb+QtvTUvlPfvizMUgz329Xji8brtV8t67kl
         nFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437883; x=1792042683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vMKKbcz+29LcMEVBUnKydYLylxMe84zHBke0K0F7tBw=;
        b=M3/M2S+M5VWYn2GVQrFY9AnwgA5esqKbZOJaVZDJOBCFAfcLon7e/nuPIn5gjQpVT0
         QkLW7hvLE2M11VKdoKMBJOqLetDFkjFnZ7z5rS8JCsAEjS5g/poBtEErpURlabk8Ms8G
         mMBU3joexdZSLK0OshyfgkEQoUfVPGPmYq27Knzuf+n2WJJR8/3S+9b6/WT1L+pSRbEP
         qKyWp0KtcN2h5/uNCRW9Ji9jPHrvS7FzuVKfAKBhiIBePzApk6RI0n+KWv6VxXziVqdK
         6KPRzELOBXaQTZKracmpSMH9QnWNOiyGVj0lLtP5Qi4HOP+ObjVD2P/uZ8Rha9EfEeDh
         FrOw==
X-Forwarded-Encrypted: i=1; AKwUvBy6glFkkiVqFp71iWKGBXosfQBi3LOgkiPcc5/FiVWhk4HE97RDqa1za+TDz4lWaI1DbqpDTYTMTqFAXic=@vger.kernel.org
X-Gm-Message-State: AFq9FYJX0r7VncjPlcxRDVF9lCUD3VvQOmbK9SCpdMrvOKmokQlQXHbs
	4Pw6ABUkPkxszrMHbyncFEniUNzP9IrGLFGPfcNX5aLyFHYBLJoOG2Zz
X-Gm-Gg: AYBFou0UbNahU2jzNzoqe1AsEz6mVZ/EDqnzVDUot/rd7sTBRAMj/gf+llL8yPaep/K
	vaUSpClP2+/+zaRhJlecbdmn0pib1rkNpxJSWSbbHtVTHdwjCnGWAj7aI28mnpKepYmcnqX614x
	Gu/J1k0DnYesu7VL6sSloQAjRIpXGgATEiS3TSAqO4itui6MtHRo6Phi2fHSFbeh98uv92qblzt
	OErqXDn8/gXt7fPYNRzoC1Au8tfh9ccssusv2OFTRzy7nS0PgY+69GRKkAAaZcnn8rLiYeOc0+h
	y/PaTfdosoiNudOwJ6uQWzVt04PLwT5TslZl7AOnBkdYFNvfqztPdnf/rUz8UeVvH1QCDzOHEgD
	n2oLHoxczg6vR9WuSZW7Ci18XEbz24yt656jDO0Gifvl7Jcz/kqOTlI550owM4TEiQAO56Ydsqw
	yuPGoitZ9XnQsIfylA7BttCtV8SZPG/A5whcr7ANVQKYFX4CEh+ne/1zMq2zvrEgCzAhFbVNrYz
	3z3bs00J0YKIGY+JiqydfbJ5GxxOm65leAlVVGUWtd0MUArQ6l5dvH7eVq1kNGVx/Ni9aM288Uj
	Dvs9UflRmBM4SABfC9EIlbRaMVxjq6oPP5YeBZL507koReNK7tQ0IQ+84vXkl2quaQ8rtQkQrLL
	ynvytGpk=
X-Received: by 2002:a05:6000:46d9:b0:48b:9ed:b81f with SMTP id ffacd0b85a97d-48c7276a71amr5394670f8f.10.1791437883101;
        Wed, 07 Oct 2026 22:38:03 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm8458219f8f.33.2026.10.07.22.38.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 22:38:02 -0700 (PDT)
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
Subject: [PATCH v2 4/6] ARM: rust: Enable Rust support for ARMv5TE
Date: Thu,  8 Oct 2026 07:37:44 +0200
Message-Id: <20261008053746.49631-5-kmehltretter@gmail.com>
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

The arm-unknown-linux-gnueabi target used so far has +v6 in its
feature list and emits ARMv6 instructions such as uxtb, uxth and rev.
It cannot be used for ARMv5.

-Ctarget-cpu does not help. It can add features but it does not remove
the +v6 of the target. libcore built with -Ctarget-cpu=arm926ej-s is
still ARMv6. Adding -Ctarget-feature=-v6 gives ARMv5TE code, but rustc
warns about an unstable feature on every invocation. The generic target
also declares 64-bit atomics, where the ARMv5 one declares 32 bit.

Use rustc's armv5te-unknown-linux-gnueabi target for CPU_32v5. It keeps
the Linux EABI (no short enums, unlike the -none-eabi targets) and is
soft-float and strict-align. The target is chosen next to the -march
option so that both follow the same CPU selection.

Kernels that also contain ARMv4 or ARMv4T CPUs are built for the
lowest architecture and stay excluded here. CPU_32v5 also covers the
ARMv5T ARM1020. C code is already built with -march=armv5te there, so
Rust matches.

The kernel crate implements atomics through the C helpers rather than
core::sync::atomic, so the missing atomic instructions on ARMv5 do not
matter. The only gap was the 2-byte xchg() added by "ARM: cmpxchg:
support 2-byte xchg() on pre-ARMv6 CPUs".

core::sync::atomic types up to 32 bits still compile on this target,
but LLVM lowers them to __sync_* libcalls which the kernel does not
provide. Nothing in the tree uses them. Such code would fail to link
on ARMv5 while it links on ARMv7.

Tested in QEMU versatilepb (ARM926EJ-S) with versatile_defconfig. The
Rust samples, all Rust KUnit suites and the doctests pass with the
current and with the minimum tool versions. They also pass on a
Microchip SAM9X75 Curiosity board (ARM926EJ-S).

Link: https://lore.kernel.org/rust-for-linux/CACRpkdYF0sVB2-qgy=GzETSR3+2sagVQPGdunDQDJrn8KqJorA@mail.gmail.com/
Link: https://lore.kernel.org/rust-for-linux/b13d37bd-ec68-4713-94e5-e9ed4d6a6354@gmail.com/
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/rust/arch-support.rst | 2 +-
 arch/arm/Kconfig                    | 8 +++++++-
 arch/arm/Makefile                   | 7 ++++++-
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index bdc42a24bf30..d6d1bef44c8f 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -15,7 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 =============  ================  ==============================================
 Architecture   Level of support  Constraints
 =============  ================  ==============================================
-``arm``        Maintained        ARMv6K and ARMv7, Little Endian only.
+``arm``        Maintained        ARMv5TE, ARMv6K and ARMv7, Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
 ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index b5816f28783a..9275a85f95e9 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -138,7 +138,7 @@ config ARM
 	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
-	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v6K && !CPU_V6 && !KASAN
+	select HAVE_RUST if CPU_LITTLE_ENDIAN && ARM_RUST_TARGET && !KASAN
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_UID16
@@ -172,6 +172,12 @@ config ARM
 	  Europe.  There is an ARM Linux project with a web page at
 	  <http://www.arm.linux.org.uk/>.
 
+# The CPU selections for which rustc has a matching target
+config ARM_RUST_TARGET
+	def_bool y
+	depends on (CPU_32v6K && !CPU_V6) || \
+		   (CPU_32v5 && !CPU_32v4T && !CPU_32v4)
+
 config ARM_HAS_GROUP_RELOCS
 	def_bool !COMPILE_TEST
 	help
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 573813ef5e77..168779e9e93d 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -73,6 +73,11 @@ arch-$(CONFIG_CPU_32v4T)	:=-march=armv4t
 arch-$(CONFIG_CPU_32v4)		:=-march=armv4
 arch-$(CONFIG_CPU_32v3)		:=-march=armv3m
 
+# The rustc target fixes the instruction set. -Ctarget-cpu cannot remove
+# the +v6 of the generic target, so older CPUs need their own target.
+rust-target-y				:=arm-unknown-linux-gnueabi
+rust-target-$(CONFIG_CPU_32v5)		:=armv5te-unknown-linux-gnueabi
+
 # Note that GCC does not numerically define an architecture version
 # macro, but instead defines a whole series of macros which makes
 # testing for a specific architecture or later rather impossible.
@@ -150,7 +155,7 @@ endif
 KBUILD_CPPFLAGS	+=$(cpp-y)
 KBUILD_CFLAGS	+=$(CFLAGS_ABI) $(CFLAGS_ISA) $(arch-y) $(tune-y) $(call cc-option,-mshort-load-bytes,$(call cc-option,-malignment-traps,)) -msoft-float -Uarm
 KBUILD_AFLAGS	+=$(CFLAGS_ABI) $(AFLAGS_ISA) -Wa,$(arch-y) $(tune-y) -include $(srctree)/arch/arm/include/asm/unified.h -msoft-float
-KBUILD_RUSTFLAGS += --target=arm-unknown-linux-gnueabi
+KBUILD_RUSTFLAGS += --target=$(rust-target-y)
 
 CHECKFLAGS	+= -D__arm__
 
-- 
2.39.5 (Apple Git-154)

