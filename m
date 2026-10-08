Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0615A3B95FA
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 05:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791437891; cv=none; b=OSvIjJv7QdFGupecli6JBj+jajKf8ut1aFBwTROW6PWwXw5jRWTGxLWmFIdzCumAQQhwVoHkdEQq3wVbOBQqle/azGs7LNODrhITcT/wVa5B8FqgWdbtZI9zrwPy4UFW1lN2tKFayBdnznOEbnSxBGSP9LTAMeeyAo4oYvzLRZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791437891; c=relaxed/simple;
	bh=x/su43TmMUkJUZgcKoaIOqCX48ZiVCOwVIkzl9S0tHU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W7MFKitmKPkPR0JysNYnPxkrUtJMBRM1TQJaUWgpF3Q5FceVIKt4fDIPhlH+eDK39FCKhUBTlXstWNJ88p2NZBAQ3drd99JALlbNxC9Q5o7CGPHcQI5kYkVt/Afj3bXikQk3HdV5mF7l/W9pw8qYySsBbcradITAuhU9quK/AFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k86O6mrY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k86O6mrY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso1592645e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 22:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437886; x=1792042686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIRMTkLx0GIudIk/+pSUKhYjEeCdyW0COsPRuKtAivU=;
        b=k86O6mrYJxPbqs80UKEmXbnLLtqJAAeppIwRigL3YPON7xRXHXyHvR6Qu/vDM/E9hs
         GBgNXTVZTEAC7USpfBu4nbioh3N/HEKNm6Wj+OQvBFLFqDrKwQFmL9oeYJhbbztDRUUg
         O5ilFk+MkXW0rPEzDld5UfjkKE4DumHlKFRzdfdSFVJzcxzE+0FHJV4slyhpIo9Vzsdf
         q1Ck5tllaGKkUV60cRgcjGGpeJOGyzbBh1kx3UGtk9OLKTW7UkY/1ZXP+zxNJXmXB704
         7WUbWTCmFNhB/Vol9o/hLDKPlls3hyDLtWFx1kWvOjFj2fTIc+QuHe4WK5F1cst9xG6T
         dPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437886; x=1792042686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zIRMTkLx0GIudIk/+pSUKhYjEeCdyW0COsPRuKtAivU=;
        b=hoFMCbC6VLd4f0AjqTh0jq99CmtqCMWeOVs0wUPs56+g5G6YMCufE9iGEQ+MfPj2Ub
         6Zr4OMT2dwnhYwJsiQ4KjAb3+xmvKPPGEI11Lflh5Kg+6XwCukTW1gzpX75N4L/8o4Xx
         96d4KsG5ovkTwMAabisIjzatdKKZ/bDzQcYyEVgj3H1r6Xgy6iDhhlgkN2LgQZfOf1XR
         J6+TJr3nAfMI1DdBtMIXdbyVLbi2L2Gr2U1I0qEwN1HvAClP7a4el8B3TdwVfTXxGf+5
         4UEQEYaKKRhK3t8JknTN3U8OidhQSn9G2PibQJRIKse/y/W++UYM5i84Ivcv3eyFDYKl
         euQA==
X-Forwarded-Encrypted: i=1; AKwUvBwEfqWcrMr7Q9hXEPqKAcv9c+tCWG2ycamhdAxNGX5mor6IFX3tLW3aoDbQ0mNUBpRBQXP+8DyQFIgBhI8=@vger.kernel.org
X-Gm-Message-State: AFuF++k45FjiXsEiaWYFoDd8Xbe7rdNdrna3Q46rqFbW/23hUW7ANqiL
	PYJEe1ApCjdDZGLPeVnSfoPL/K91So2OVl6jNK58Rt76U1xNDUlmPoz1
X-Gm-Gg: AYBFou0Y/loFJ+jKJHxW8sozDLH2wXDjUkgbN4KMOwAcZaqs9Ebe2dkPm8oFa0P0OTd
	Yf2gE00CXxAkhX0EC9Bx+WD18Ow7oMFtwHkocXE2Q5/RSAxyrJibALwvLF6cgBdXzZhHM7wvzzQ
	R99jGAAefTYbOV5PtZv4KakO57HZfbCHjCmU8BeV+uC9OMgnQ89uYz9RMZb7jtQ5twfzfS29uwe
	bCP0AIM04btri79xaZ32n9ucq/Vtd4j4x2JQupTlCbJmE1bK7kj2Q41BQ4UisVkZoYkYh1kkWb5
	rUOpmEi/zrQgX49lo7rOmbB6K77G2Neg43cvu5JrPDQ8VTCVfjM2+cll/ZTPwm4fueOaMwTSDK+
	6IseABe/3RVf3wF4mYcPlwjwof/RTQ00Zx9yzpwUwaDZd8pfLKKy0YBoEt2zFiAPiQCfpiD9KY2
	PTURBcsivzt5bWZjXI71KZHRDupXjC555sfbk4YPC+wzsUAvwonVEYT08Y9YCtXQRTn178y8KU4
	HosgDuIv+9AS2qS7Is2FKtHNGtdrcXDSYJFlzciu/vEJKI+6Raj1P++nGGZW0Zv6H7lojmP9kcf
	dgiUECRsVz/WjWHLdrQdIkJk5ThIYVBChDyrGu3pobnQtt+QqDlnhhW4rrZDmPWWWGTmy7a3GFR
	xl4b0w5M=
X-Received: by 2002:a05:600c:4691:b0:4a1:6282:1cf3 with SMTP id 5b1f17b1804b1-4a1851b3756mr26848495e9.9.1791437884887;
        Wed, 07 Oct 2026 22:38:04 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm8458219f8f.33.2026.10.07.22.38.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 22:38:04 -0700 (PDT)
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
Subject: [PATCH v2 5/6] ARM: rust: Enable Rust support for ARMv4T
Date: Thu,  8 Oct 2026 07:37:45 +0200
Message-Id: <20261008053746.49631-6-kmehltretter@gmail.com>
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

The armv5te target emits clz and blx, which ARMv4T lacks. Kernels that
contain an ARMv4T CPU are excluded from Rust for that reason.

Nothing else in the Rust code depends on ARMv5. Use rustc's
armv4t-unknown-linux-gnueabi target for these kernels. Like the C code,
the Rust code of a combined ARMv4T and ARMv5 kernel is then built for
ARMv4T.

ARMv4 (StrongARM, FA526) stays excluded. It has no bx and rustc has no
target for it.

Tested in QEMU sx1 (OMAP310, ARM925T) with omap1_defconfig. The Rust
samples, all Rust KUnit suites and the doctests pass with the current
and with the minimum tool versions.

at91_dt_defconfig combines ARMv4T and ARMv5 and is built for ARMv4T.
That kernel passes the same tests on a Microchip SAM9X75 Curiosity
board (ARM926EJ-S).

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/rust/arch-support.rst | 8 ++++----
 arch/arm/Kconfig                    | 2 +-
 arch/arm/Makefile                   | 1 +
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index d6d1bef44c8f..3f39cf55b6f4 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -12,15 +12,15 @@ which uses ``libclang``.
 Below is a general summary of architectures that currently work. Level of
 support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 
-=============  ================  ==============================================
+=============  ================  ======================================================
 Architecture   Level of support  Constraints
-=============  ================  ==============================================
-``arm``        Maintained        ARMv5TE, ARMv6K and ARMv7, Little Endian only.
+=============  ================  ======================================================
+``arm``        Maintained        ARMv4T, ARMv5TE, ARMv6K and ARMv7, Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
 ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
 ``s390``       Maintained        ``CONFIG_EXPOLINE`` must be disabled.
 ``um``         Maintained        \-
 ``x86``        Maintained        ``x86_64`` only.
-=============  ================  ==============================================
+=============  ================  ======================================================
 
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 9275a85f95e9..cf782fc04872 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -176,7 +176,7 @@ config ARM
 config ARM_RUST_TARGET
 	def_bool y
 	depends on (CPU_32v6K && !CPU_V6) || \
-		   (CPU_32v5 && !CPU_32v4T && !CPU_32v4)
+		   ((CPU_32v5 || CPU_32v4T) && !CPU_32v4)
 
 config ARM_HAS_GROUP_RELOCS
 	def_bool !COMPILE_TEST
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 168779e9e93d..a72843890241 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -77,6 +77,7 @@ arch-$(CONFIG_CPU_32v3)		:=-march=armv3m
 # the +v6 of the generic target, so older CPUs need their own target.
 rust-target-y				:=arm-unknown-linux-gnueabi
 rust-target-$(CONFIG_CPU_32v5)		:=armv5te-unknown-linux-gnueabi
+rust-target-$(CONFIG_CPU_32v4T)	:=armv4t-unknown-linux-gnueabi
 
 # Note that GCC does not numerically define an architecture version
 # macro, but instead defines a whole series of macros which makes
-- 
2.39.5 (Apple Git-154)

