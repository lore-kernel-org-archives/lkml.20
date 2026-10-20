Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792471470;
	b=QoHfd1CVEd/Za57rPS+xGxQwviPD5pmiR+goaVenECPNkMVPbexxs6aBVqaxEDmjiHZG
	 tqmSOTP3KYmbZ0KoU1crEHNisMbkyekloQz97w3MhJAVonlXvjghUaX7hvypKS+9ko0In
	 HJ4e1KBqMU14vDC49U1EBRAa1DoapxRBHQ7xtsIopE2mrJfLSWY+EqhQggJF3oIwh2kQ0
	 Hm1+r1QXjg6cGrWJeVA5REYJ34cBC7WjOWa+SRr2v33Eiq9p7GHzssbVWWSABnZ5sdU7M
	 nKi13y8K+BV/c3iAqfCNqORGkWANtJd3nNaSX/RuxUVKFfajVq9yTkWbkDRm5OWNjeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792471470;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=szyR4KfBL/tKrcSFzd7HxZqukrrPYz3HlQOuPZYEGzE=;
	b=wO35N6GY0qez9kNmPeSIyhv2o7twH/usH48rHQO/saC+4TBfU4iumyW26TxZvW4/wQIi
	 5SM6oB2tnZcGKtbD+kVKaKO1gQ2QvU0pFOrv+eKEYCpEYON8nOhzQp0vSPg35Ypk2+5RZ
	 D9BoGcETwH71xXcSyI67fi8ctiqNl5QSBcmbxM4ikdoXAzb8iMrjxGgIfJMwQ//0WLdyz
	 lU8rmJTZjf7gOrvJgBlhSUYykIUE09E2YqvueYuObMSTNsYfUT/gf/SFc1F8QxPGDUqAc
	 dGxsmkSgFKCFeOIXiAiRrBMXJhdLO7L8Rx1c/o56VeLHAT5Lr9OWcA5JmuurplY+YFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Osq3aot9;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CE7606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8CE7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Osq3aot9
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4C9DB40E029B;
	Tue, 20 Oct 2026 04:44:27 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mebp0GSbYnDv; Tue, 20 Oct 2026 04:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1792471463; bh=szyR4KfBL/tKrcSFzd7HxZqukrrPYz3HlQOuPZYEGzE=;
	h=Date:From:To:Cc:Subject:From;
	b=Osq3aot9A1YbIP7BLnpmUtFxGNJTz5J5cHUAllfW4oqjPAvpgD62G9dsdTrVkz6Nv
	 XBsoDfF3pSeKOezKfE8GJYEgv5nF2njcR48oG+6Sf5MmyTWBSborz2vEDDZtqVhxac
	 YX3vN/GyTtLVP1Tzbj1U82eBVmOEcmlFOqHUbbwwvTB0WFOIMWu6FJCWEoB1PrPErO
	 iPEX4NJz3VeLTDsZvy5AriTdnOXHSVEMZrJCPSQY1NGKQdRV/iqCaDBC3Cft3S/kdp
	 BWyRkMNpY55BfiZxmXbWU3EK/A23dzvCmnsrCNY+IyDr/TUIN+Ed8P1GSvcbddFETP
	 SBgtpgNmLPNHAVGFD+AnKM+Vlr4SzZmneIZ548hL8TqON/TpaFVs3o+IeBjXpttv7a
	 rE7kv2hMhVcuEXz/y1XNqmQAmV1bvYT3SJhV6eCXtsioSwH4DZPIdYJ+tnEAuCvfTv
	 D6Y3ZCviQIwc6lkCa/81cBcoNcufKU3cCewoot3QPvCORg0q1XY/CNm+60D1nqvMvO
	 RPC2hjW3FJSnXs0a9ktjjJKGsm3DpjMgUCT0J94qihrHhV1pL9fy53f7jXUqRBbjtt
	 XYYzzAlXrVfWzCte8sA0s78xuAObr09W245ydYURNjI3H9YNrqRuiRrlFkH/gAwD9X
	 d4z/obFdUTc/B9MkOa3JRPzs=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9EF2940E015B;
	Tue, 20 Oct 2026 04:44:19 +0000 (UTC)
Date: Mon, 19 Oct 2026 21:44:15 -0700
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: x86-ml <x86@kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] x86/fpu for v7.4-rc1
Message-ID: <20261020044415.GAatbxnwqKePxD-0FC@fat_crate.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

please pull the x86/fpu lineup for v7.4-rc1.

See end of mail for some merge fun.

Thx.

---

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tags/x86_fpu_for_v7.4_rc1

for you to fetch changes up to 7606d01b963fc3e4e19dd53ca6c5fdd97f7bc1d7:

  x86/fpu: Remove additional remnants of math emulation (2026-09-26 12:01:48 -0700)

----------------------------------------------------------------
- Document and cleanup the signal frame handling with the goal to allow
  process migration between CPUs with different FPU capabilities but which use
  only a common set of FPU features, i.e., think checkpoint/restore. By
  Andrei Vagin

- Consolidate how XSTATE features are checked by doing them once during boot
  with the intent of removing cpu_has_xfeatures(). Latter will happen in the
  next cycle. Work by Eric Biggers

- Other cleanups

----------------------------------------------------------------
Andrei Vagin (7):
      x86/fpu: Document signal frame layout and portability
      x86/fpu: Clean up and rename variables in signal frame handling
      x86/fpu: Extract restore_from_ia32_fxstate() and clean up fpu__restore_sig()
      x86/fpu: Document reasoning of FX-only fallback
      x86/fpu: Fix potential underflow in xstate_calculate_size()
      x86/fpu: Pre-fault only required size of xstate buffer
      selftests/x86: Add tests for signal frame FPU portability

Eric Biggers (9):
      x86/fpu: Check for missing AVX and AVX-512 xstate bits
      um: Check for missing AVX and AVX-512 xstate bits
      crypto: x86 - Stop using cpu_has_xfeatures()
      lib/crypto: x86: Stop using cpu_has_xfeatures()
      lib/crc: x86: Stop using cpu_has_xfeatures()
      xor: Remove redundant X86_FEATURE_OSXSAVE check
      xor: Add AVX-512 optimized xor_gen()
      x86/fpu: Remove unnecessary checks for X86_FEATURE_FPU
      x86/fpu: Remove additional remnants of math emulation

 Documentation/arch/x86/xstate.rst                  |  54 +++++
 arch/um/kernel/um_arch.c                           |  78 ++++++-
 arch/x86/crypto/aegis128-aesni-glue.c              |   3 +-
 arch/x86/crypto/aesni-intel_glue.c                 |   7 +-
 arch/x86/crypto/aria_aesni_avx2_glue.c             |  11 +-
 arch/x86/crypto/aria_aesni_avx_glue.c              |  11 +-
 arch/x86/crypto/aria_gfni_avx512_glue.c            |  11 +-
 arch/x86/crypto/camellia_aesni_avx2_glue.c         |  11 +-
 arch/x86/crypto/camellia_aesni_avx_glue.c          |  11 +-
 arch/x86/crypto/cast5_avx_glue.c                   |   7 +-
 arch/x86/crypto/cast6_avx_glue.c                   |   7 +-
 arch/x86/crypto/serpent_avx2_glue.c                |   9 +-
 arch/x86/crypto/serpent_avx_glue.c                 |   7 +-
 arch/x86/crypto/sm4_aesni_avx2_glue.c              |  11 +-
 arch/x86/crypto/sm4_aesni_avx_glue.c               |  11 +-
 arch/x86/crypto/twofish_avx_glue.c                 |   6 +-
 arch/x86/include/asm/fpu/regset.h                  |   6 +-
 arch/x86/include/asm/fpu/sched.h                   |   1 -
 arch/x86/include/asm/fpu/types.h                   |  25 ---
 arch/x86/include/asm/fpu/xstate.h                  |   2 +
 arch/x86/include/asm/math_emu.h                    |  15 --
 arch/x86/include/asm/processor.h                   |   2 +-
 arch/x86/include/asm/traps.h                       |   2 -
 arch/x86/include/uapi/asm/sigcontext.h             |  15 ++
 arch/x86/kernel/fpu/bugs.c                         |   4 -
 arch/x86/kernel/fpu/core.c                         |  13 +-
 arch/x86/kernel/fpu/init.c                         |   6 +-
 arch/x86/kernel/fpu/regset.c                       |   6 -
 arch/x86/kernel/fpu/signal.c                       | 136 +++++++-----
 arch/x86/kernel/fpu/xstate.c                       |  39 +++-
 lib/crc/x86/crc-pclmul-template.h                  |   6 +-
 lib/crypto/x86/blake2s.h                           |   4 +-
 lib/crypto/x86/chacha.h                            |   3 +-
 lib/crypto/x86/nh.h                                |   4 +-
 lib/crypto/x86/poly1305.h                          |   7 +-
 lib/crypto/x86/sha1.h                              |   4 +-
 lib/crypto/x86/sha256.h                            |   4 +-
 lib/crypto/x86/sha512.h                            |   3 +-
 lib/crypto/x86/sm3.h                               |   3 +-
 lib/raid/xor/Makefile                              |   2 +-
 lib/raid/xor/x86/xor-avx512.c                      | 122 +++++++++++
 lib/raid/xor/x86/xor_arch.h                        |  31 ++-
 tools/testing/selftests/x86/Makefile               |   5 +-
 .../selftests/x86/sigframe_fpu_portability.c       | 235 +++++++++++++++++++++
 tools/testing/selftests/x86/xstate.c               |  12 --
 tools/testing/selftests/x86/xstate.h               |  20 ++
 46 files changed, 693 insertions(+), 299 deletions(-)
 delete mode 100644 arch/x86/include/asm/math_emu.h
 create mode 100644 lib/raid/xor/x86/xor-avx512.c
 create mode 100644 tools/testing/selftests/x86/sigframe_fpu_portability.c
 

So if you've merged tip/perf/core first (you should have if you go through the
pull requests chronologically) then merging this will create the below and you
probably wanna whack that second duplicated prototype.

Thx.

diff --cc arch/x86/include/asm/fpu/xstate.h
index 19dec5f0b1c7,33343e5d54b0..25308312cd78
--- a/arch/x86/include/asm/fpu/xstate.h
+++ b/arch/x86/include/asm/fpu/xstate.h
@@@ -110,10 -110,9 +110,12 @@@ int xfeature_size(int xfeature_nr)
  
  void xsaves(struct xregs_state *xsave, u64 mask);
  void xrstors(struct xregs_state *xsave, u64 mask);
 +void xsaves_nmi(struct xregs_state *xsave, u64 mask);
 +
 +unsigned int xstate_calculate_size(u64 xfeatures, bool compacted);
  
+ unsigned int xstate_calculate_size(u64 xfeatures, bool compacted);
+ 
  int xfd_enable_feature(u64 xfd_err);
  
  #ifdef CONFIG_X86_64


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
