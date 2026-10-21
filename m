Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591076;
	b=etWFemumrb2cwjEYvV6FVwPf1jDjewIpGmODkGZYyw6g7/zhXmHq5w5JnCFHCijeOqzc
	 icpHaZ7RUgONksCHikUOVTnLdX6yUXWEeP0oaki7iPWrGJL3FP/JdiUT7RZsJkCeYivBa
	 aa1WsOqfiy0GL39Nq4HWlnbxmNssRzppJ8D5VF8m/mUhhdVSr4W5PWHd7tniyTfXeNLX2
	 xv2ynhLOlKSk4Xoy71kdz34ljDoh1MQWIa+MgfquMKU8knu4xMupY4JWmBSS03m5FBW6v
	 U11lQkk4lzrw0TPwXywM8RZAD0Igr+twzs0xFX6d37lSp/QqFC8NUno10NHkd1Lh9dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591076;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=eJuMiTB5KqqxHu+kRpvR+2NBQvBa3j/Debz07+GL6LQ=;
	b=dWHVPi69WvT88OW1A04Qbjlco6pHSMarf6Co3kgYjfhcwB7a7fWcnzhZLytj7M1RNBOi
	 mEPtybc/XRxYEVBxLr7CmIHyoAzhtaYQpP3fXBmIulczlUTo9b0P9COQS2XDSiKD+cdOC
	 OTo6AQ7OAllGlgrfjMXjXntPdfULf6WEO1wLfjRrhKaFlrTnNxDY1BngHwoBPQgoIFyf/
	 3dapT4b57nRAaKPoFPakCycTKeJd2fqHsmLbBqKqZUa/W37Jo7/51E3wfuERX2DiQ82zs
	 Ugj8CznGEy8AUyHTxlhy9lbUT9foB0/IYo5MbYi7gK+geABuhJ6AQOviGY0OJ6KawbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Em7Cvs/z";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DD5606A31A;
	Wed, 21 Oct 2026 13:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Em7Cvs/z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CCB91F000C4;
	Wed, 21 Oct 2026 13:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792591075;
	bh=eJuMiTB5KqqxHu+kRpvR+2NBQvBa3j/Debz07+GL6LQ=;
	h=Date:From:To:Cc:Subject;
	b=Em7Cvs/zoZnbIJM1G2IdehHFQdua+PeJgewXqzxQUcdZYOjTx4uMwOlISfxHMwGpl
	 wKgmf4Redu+NYRNJJzyt2cG/llt9H5B54P/80fFIJqO89Wi2oULtJtQaKXuZQ1FQPe
	 Yg30TBlSxN84KKQi412asV0DZMVOLx8BbB0Jsj6gu6KJaBdc7k+CytxE/RfRGPoBzF
	 cRCDGOyjn8P5ao5Nt/2Di94YxpihLi3oEwDl2EzDjeq4pxru+0pYNcdqVID0BsxQWY
	 ywum5elhZ/ZnGll8oiBS1NCBw4sd1tOxdAZmXMDfjttmrywDfa1X7vKItIcC/Xjaja
	 vohvYSirPaRDA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 980A61AC5994; Wed, 21 Oct 2026 13:19:41 +0100 (BST)
Date: Wed, 21 Oct 2026 13:19:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Gary Guo <gary@garyguo.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: linux-next: manual merge of the rust tree with the kbuild-fixes tree
Message-ID: <atit3cSBFwe9cDY7@sirena.co.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ub0y7tD3ArN9k/RK"
Content-Disposition: inline


--Ub0y7tD3ArN9k/RK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust tree got a conflict in:

  init/Kconfig

between commit:

  f85147b291e35 ("kbuild: move the toolchain checks into scripts/Kconfig.to=
olchain")

=66rom the kbuild-fixes tree and commit:

  3504d1bce9920 ("rust: kunit: use `file!()` inside `kunit_assert!`")

=66rom the rust tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined init/Kconfig
index 046ae0bf11863,24b019104d886..0000000000000
--- a/init/Kconfig
+++ b/init/Kconfig
@@@ -1,6 -1,198 +1,6 @@@
  # SPDX-License-Identifier: GPL-2.0-only
 -config CC_VERSION_TEXT
 -	string
 -	default "$(CC_VERSION_TEXT)"
 -	help
 -	  This is used in unclear ways:
 =20
 -	  - Re-run Kconfig when the compiler is updated
 -	    The 'default' property references the environment variable,
 -	    CC_VERSION_TEXT so it is recorded in include/config/auto.conf.cmd.
 -	    When the compiler is updated, Kconfig will be invoked.
 -
 -	  - Ensure full rebuild when the compiler is updated
 -	    include/linux/compiler-version.h contains this option in the comment
 -	    line so fixdep adds include/config/CC_VERSION_TEXT into the
 -	    auto-generated dependency. When the compiler is updated, syncconfig
 -	    will touch it and then every file will be rebuilt.
 -
 -config CC_IS_GCC
 -	def_bool $(success,test "$(cc-name)" =3D GCC)
 -
 -config GCC_VERSION
 -	int
 -	default $(cc-version) if CC_IS_GCC
 -	default 0
 -
 -config CC_IS_CLANG
 -	def_bool $(success,test "$(cc-name)" =3D Clang)
 -
 -config CLANG_VERSION
 -	int
 -	default $(cc-version) if CC_IS_CLANG
 -	default 0
 -
 -config AS_IS_GNU
 -	def_bool $(success,test "$(as-name)" =3D GNU)
 -
 -config AS_IS_LLVM
 -	def_bool $(success,test "$(as-name)" =3D LLVM)
 -
 -config AS_VERSION
 -	int
 -	# Use clang version if this is the integrated assembler
 -	default CLANG_VERSION if AS_IS_LLVM
 -	default $(as-version)
 -
 -config LD_IS_BFD
 -	def_bool $(success,test "$(ld-name)" =3D BFD)
 -
 -config LD_VERSION
 -	int
 -	default $(ld-version) if LD_IS_BFD
 -	default 0
 -
 -config LD_IS_LLD
 -	def_bool $(success,test "$(ld-name)" =3D LLD)
 -
 -config LLD_VERSION
 -	int
 -	default $(ld-version) if LD_IS_LLD
 -	default 0
 -
 -config RUSTC_VERSION
 -	int
 -	default $(rustc-version)
 -	help
 -	  It does not depend on `RUST` since that one may need to use the version
 -	  in a `depends on`.
 -
 -config RUST_IS_AVAILABLE
 -	def_bool $(success,$(srctree)/scripts/rust_is_available.sh)
 -	help
 -	  This shows whether a suitable Rust toolchain is available (found).
 -
 -	  Please see Documentation/rust/quick-start.rst for instructions on how
 -	  to satisfy the build requirements of Rust support.
 -
 -	  In particular, the Makefile target 'rustavailable' is useful to check
 -	  why the Rust toolchain is not being detected.
 -
 -config RUSTC_LLVM_VERSION
 -	int
 -	default $(rustc-llvm-version)
 -
 -config RUSTC_LLVM_MAJOR_VERSION
 -	int
 -	default $(shell,expr $(rustc-llvm-version) / 10000)
 -
 -config RUSTC_CLANG_LLVM_COMPATIBLE
 -	bool
 -	default y if CC_IS_CLANG && RUSTC_LLVM_MAJOR_VERSION =3D $(shell,expr $(=
cc-version) / 10000)
 -	help
 -	  This indicates whether Rust and Clang use LLVM of the same major
 -	  version.
 -
 -	  Operations involving handling LLVM IR or bitcode (e.g. cross-language
 -	  LTO) require the same LLVM major version to work properly. For best
 -	  compatibility it is recommended that the exact same LLVM is used.
 -
 -config ARCH_HAS_CC_CAN_LINK
 -	bool
 -
 -config CC_CAN_LINK
 -	bool
 -	default ARCH_CC_CAN_LINK if ARCH_HAS_CC_CAN_LINK
 -	default $(cc_can_link_user,$(m64-flag)) if 64BIT
 -	default $(cc_can_link_user,$(m32-flag))
 -
 -# Fixed in GCC 14, 13.3, 12.4 and 11.5
 -# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D113921
 -config GCC_ASM_GOTO_OUTPUT_BROKEN
 -	bool
 -	depends on CC_IS_GCC
 -	default y if GCC_VERSION < 110500
 -	default y if GCC_VERSION >=3D 120000 && GCC_VERSION < 120400
 -	default y if GCC_VERSION >=3D 130000 && GCC_VERSION < 130300
 -
 -config CC_HAS_ASM_GOTO_OUTPUT
 -	def_bool y
 -	depends on !GCC_ASM_GOTO_OUTPUT_BROKEN
 -	depends on $(success,echo 'int foo(int x) { asm goto ("": "=3Dr"(x) ::: =
bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
 -
 -config CC_HAS_ASM_GOTO_TIED_OUTPUT
 -	depends on CC_HAS_ASM_GOTO_OUTPUT
 -	# Detect buggy gcc and clang, fixed in gcc-11 clang-14.
 -	def_bool $(success,echo 'int foo(int *x) { asm goto (".long (%l[bar]) - =
=2E": "+m"(*x) ::: bar); return *x; bar: return 0; }' | $CC -x c - -c -o /d=
ev/null)
 -
 -config TOOLS_SUPPORT_RELR
 -	def_bool $(success,env "CC=3D$(CC)" "LD=3D$(LD)" "NM=3D$(NM)" "OBJCOPY=
=3D$(OBJCOPY)" $(srctree)/scripts/tools-support-relr.sh)
 -
 -config CC_HAS_ASM_INLINE
 -	def_bool $(success,echo 'void foo(void) { asm inline (""); }' | $(CC) -x=
 c - -c -o /dev/null)
 -
 -config CC_HAS_ASSUME
 -	bool
 -	# clang needs to be at least 19.1.0 since the meaning of the assume
 -	# attribute changed:
 -	# https://github.com/llvm/llvm-project/commit/c44fa3e8a9a44c2e9a575768a3=
c185354b9f6c17
 -	default y if CC_IS_CLANG && CLANG_VERSION >=3D 190100
 -	# supported since gcc 13.1.0
 -	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D106654
 -	default y if CC_IS_GCC && GCC_VERSION >=3D 130100
 -
 -config CC_HAS_NO_PROFILE_FN_ATTR
 -	def_bool $(success,echo '__attribute__((no_profile_instrument_function))=
 int x();' | $(CC) -x c - -c -o /dev/null -Werror)
 -
 -config CC_HAS_COUNTED_BY
 -	bool
 -	# clang needs to be at least 20.1.0 to avoid potential crashes
 -	# when building structures that contain __counted_by
 -	# https://github.com/ClangBuiltLinux/linux/issues/2114
 -	# https://github.com/llvm/llvm-project/commit/160fb1121cdf703c3ef5e61fb2=
6c5659eb581489
 -	default y if CC_IS_CLANG && CLANG_VERSION >=3D 200100
 -	# supported since gcc 15.1.0
 -	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108896
 -	default y if CC_IS_GCC && GCC_VERSION >=3D 150100
 -
 -config CC_HAS_COUNTED_BY_PTR
 -	bool
 -	# supported since clang 22
 -	default y if CC_IS_CLANG && CLANG_VERSION >=3D 220100
 -	# supported since gcc 16.0.0
 -	default y if CC_IS_GCC && GCC_VERSION >=3D 160000
 -
 -config CC_HAS_BROKEN_COUNTED_BY_REF
 -	bool
 -	# https://github.com/llvm/llvm-project/issues/182575
 -	default y if CC_IS_CLANG && CLANG_VERSION < 220100
 -
 -config CC_HAS_ALLOC_TOKEN
 -	def_bool $(cc-option,-falloc-token-max=3D123)
 -
 -config CC_HAS_MULTIDIMENSIONAL_NONSTRING
 -	def_bool $(success,echo 'char tag[][4] __attribute__((__nonstring__)) =
=3D { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
 -
 -config LD_CAN_USE_KEEP_IN_OVERLAY
 -	# ld.lld prior to 21.0.0 did not support KEEP within an overlay descript=
ion
 -	# https://github.com/llvm/llvm-project/pull/130661
 -	def_bool LD_IS_BFD || LLD_VERSION >=3D 210000
 -
 -config RUSTC_HAS_UNNECESSARY_TRANSMUTES
 -	def_bool RUSTC_VERSION >=3D 108800
 -
 -config RUSTC_HAS_FILE_WITH_NUL
 -	def_bool RUSTC_VERSION >=3D 108900
 -
 -config RUSTC_HAS_FILE_AS_C_STR
 -	def_bool RUSTC_VERSION >=3D 109100
 -
 -config RUSTC_HAS_SUSPICIOUS_RUNTIME_SYMBOL_DEFINITIONS
 -	def_bool RUSTC_VERSION >=3D 109800
 -
 -config PAHOLE_VERSION
 -	int
 -	default "$(PAHOLE_VERSION)"
 +source "scripts/Kconfig.toolchain"
 =20
  config CONSTRUCTORS
  	bool
@@@ -1262,17 -1454,6 +1262,17 @@@ config USER_N
 =20
  	  If unsure, say N.
 =20
 +config USER_NS_MAP_KUNIT_TEST
 +	tristate "KUint test for user namespace map insertion" if !KUNIT_ALL_TES=
TS
 +	depends on USER_NS && KUNIT
 +	default KUNIT_ALL_TESTS
 +	help
 +	  This builds the KUnit test for user namespace uid/gid map insertion.
 +	  It validates map insertion, limits, dynamic allocation of the
 +	  extended extents array, and mapping sorting functions.
 +
 +	  If unsure, say N.
 +
  config PID_NS
  	bool "PID Namespaces"
  	default y
diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
index a99d875489eed..279ebadaac04f 100644
--- a/scripts/Kconfig.toolchain
+++ b/scripts/Kconfig.toolchain
@@ -267,9 +267,6 @@ config LD_CAN_USE_KEEP_IN_OVERLAY
 	# https://github.com/llvm/llvm-project/pull/130661
 	def_bool LD_IS_BFD || LLD_VERSION >=3D 210000
=20
-config RUSTC_HAS_SPAN_FILE
-	def_bool RUSTC_VERSION >=3D 108800
-
 config RUSTC_HAS_UNNECESSARY_TRANSMUTES
 	def_bool RUSTC_VERSION >=3D 108800
=20

--Ub0y7tD3ArN9k/RK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatit2AAKCRAv73Ows9A4
iR3vAP4t11QZrffbLOQbr+R9hrJsXjIXvTe21SdbNM2SSd7v4wEAmgkFK361+MeX
Em2sCdRmjfawrqL1YpgYdbo7PSWS3ws=
=BKAi
-----END PGP SIGNATURE-----

--Ub0y7tD3ArN9k/RK--
