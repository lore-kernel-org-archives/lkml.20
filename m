Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0101354EEAE
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923541; cv=none; b=DkQeXudlSlqcFwGGjKeINGRAo7WHetxsfLaBjX55tYy6d9X+KDC2H2wbvaw/eQZoQjSS7Y7mVl14/mWOJ0OFeX5RKVOHcrtpMMuETcQbzHRES/uEf1QR9HB/tjbTQQaxc2aeh/SS4NRnX4gfVjNHIQ8Hy16Se5wEZdDboqaStNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923541; c=relaxed/simple;
	bh=f7ap597eqe9kIeMvfJIQIfj+KMtkVG+gOZihvU7+3hs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hDF1V5i47V/f5Y/KY7pPr0ZvM4/XCpJNX2vYA9mR1nMz/F+J7pdto+mGz3MpIuIY4qo32jGHw40c4vtrSYhHrtPSw9LeyAvav78U33s2hZDlQhC6FIYshPROjziAOnoWoAdNGxqQpKPa0QP4GR8VmWJ7Zn86dzTLFDTglYx8h64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3uh9Xmk; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3uh9Xmk"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so2715745e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923537; x=1792528337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WP9XjF/+vFS48q37kPsonW+eIbmBaevH/xXvYsyzl+Y=;
        b=J3uh9XmkboTkSVQEwa0GJBx4qTtgEsxRgiHuWu/vP5lB3aOcMRCyn/kQwblM43fAe3
         XCA2or6PIXAB+tbILkZaKmBW30LWf+m2NpdUHgwC59jlla6rLdQ739gZ9+JoSd/52qEp
         79ZeDW0lzaTGsW/0rWZ3N81WvLwOiMUgCA2/obwQ05jBUM0VxMxAQI+1XeNAAm8ZJUii
         tiFjmd9yDhbphhPrut0BzcNwVfGJccPKGTaNoy3QDtHRXXSe6O/Ft9zTvidx8I8iwLtJ
         Q6YKIp0A98tp9bQgkcScZArClrSvvFRB5/7Hrt4CWB3gUKu3u5pRpW1yf+ghhPsqUAgz
         a6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923537; x=1792528337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WP9XjF/+vFS48q37kPsonW+eIbmBaevH/xXvYsyzl+Y=;
        b=G0MrCQ+265fiMAUf50R7L3mU38vuzEnbjZWxfRprSdLiaF1Zu1TVFcPJ236utatvUn
         h8UOv7xLiQRnSsPRFswEW4nfKQQ+gY2NQB7R4ON3UfD/CZcQI9MagyT+WQ/jRysTQZhk
         QGSJshGAB2c8EM1QjWAugcBu0cOEv01doMtHaX27C/9pHifaCtuus2XvzZtCf4oqc4ZK
         EeLXO+XdBfSJh2/FFH6qvHgyfpOilajI71DyM9BEtJwHRqlLoDVj/xbasrKSBgjrZwn9
         mc7MDAtWXA+hEPXwMEbtYuSfVff+/rbXCFgSlNvIEOhXeesyTa/gs0heWUXnLfpetzU/
         eT0A==
X-Forwarded-Encrypted: i=1; AKwUvByt5wXEjwseFoap++/Y6iwOnWgUmGcJcmjT3XAHlib4r8HNcPFkWslzzKQRQnO9hX8gZSf1nxa0BQrAGbA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcooj/juiXBI8i9n/crC6bz5AlgjZX8x653q3b/j22H9oQ6WDQ
	zWZ5DeQzx3XaOSDrKZYz/Ga7gBbgqpEdc0w34G4k9NEOvl6sN9yYlN2N
X-Gm-Gg: AYBFou167OMjELKUD4cFlkNUj7P4UrwpQ/fz93Ab6Cuh+GrvBJVn5WGWNvOfXB9x5mx
	+9O7PHbETxZl2f07UjuDcZV6b7oHCzTyP/Rb7ALTpxEFOx4DskcQTynYY8vZjKMFqx8KmIncQXG
	iXrCqJ/IrbjSHSH9V22om/QHB3wYvB/V4t0ayXW+NCr8W2kJ1a8evwMkg+k2Y2XGoHwBSZZV63h
	hhGArBVAO0gkUnSEYT2/SCE0YkXq+YqqzlI7Sl4uzVkkG2uI5UN5zOkdS+/I/MsHfKE9qfwB1AP
	2w7Ph2WEUFFuG2iJrpW94377R1B2QIVShT4ae0QyYyBhE4YQSWC1uwu8wAnof7Too+laqVRoc0z
	o14udCKBll23gq36Ysb8Ew+c1Vom0LfWWYDabe/L34FzOM/hzBA2GcCop3OM05clLU/cstxOG9Z
	3rq6SggHcauteGh81eNbtAUbQdWmhyBmYIvRbhL9BS2FLvV7Jnhiqi3Dw8jE9TMPzpEoFSbZAsG
	yxL3TKRTEuSZMq40Rj3YyyXKLjF21MkQvpihaoJjsEw4styAJRB0Xo8ZxVbMFizMGsFAeGpM3p9
	74SXFReLVgRtmhjCPKg+jxuJ+0U18C1mhYukQZQZBYjegC+b3I2+/2wvkY6zkGNfBBtI3m5ISgB
	AR2fn4g==
X-Received: by 2002:a05:600c:6383:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4a1a6e04d7cmr72732765e9.33.1791923537100;
        Tue, 13 Oct 2026 13:32:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a189-2701-8c58-155a-0279-7389.310.pool.telefonica.de. [2a02:3100:a189:2701:8c58:155a:279:7389])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b481b7f8sm5237345e9.3.2026.10.13.13.32.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 13:32:12 -0700 (PDT)
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
Subject: [PATCH v3 5/6] ARM: rust: Enable Rust support for ARMv4T
Date: Tue, 13 Oct 2026 22:31:39 +0200
Message-Id: <20261013203140.31741-6-kmehltretter@gmail.com>
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

The armv5te target emits clz and blx, which ARMv4T lacks. Use rustc's
armv4t-unknown-linux-gnueabi target for CPU_32v4T. A combined ARMv4T and
ARMv5 kernel then uses ARMv4T code for both C and Rust.

Plain ARMv4 remains excluded because rustc has no matching Linux target.
This also depends on the preceding 16-bit xchg() support for pre-ARMv6
CPUs.

Tested the Rust samples, KUnit suites and doctests in QEMU sx1 (ARM925T)
with omap1_defconfig and on a Microchip SAM9X75 Curiosity board with
at91_dt_defconfig.

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

