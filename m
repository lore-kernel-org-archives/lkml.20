Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369100;
	b=RwLBSXQa/47P6OLoQ6zQe50mgIGvr1SqsnSkUqMu7VNBOBLz5j6raVo4ze8sD04yh4oJ
	 VavATL2zuZjvUSoFB6vHrBfUH0QSE0Xvcj69/TA7IB0OcJPuGiolrjoH6Au13ip1JMfq3
	 RkzUXVogce199V2YxUKEOGgiufvU3TH3qdSs5KWqeEOn0+6S6x+tmPuuwqKzkF/y/u8IQ
	 G42LfvcIy8MDQCC7VtBHjY3w4L9qT3Fm0+BOmKJppj8gN3Jsmv4em5+PTEixhz7eLSgox
	 G2RWZLxx0HCKT6YN5UAkhAnVy8FrDXp3DrQB3RJBF7aemT5ZY8Qf6q78R4+1bsMs8zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eCbFQAnD6kO5eER8bkFilt/J6fSMOzIEmOATP+B2WGU=;
	b=WIs+y19kPcQFJ0Xi5nbEXwJLNUCursiEdnP6hDXaanCR0KCBTtLbhYL3J7DzGhFCANm0
	 mKrnfAlVmbspFzXGp54gnpxZeeEMO0a+R/pzF7vg3/u032ANUi1tRbeJKcKILElZ0k+mQ
	 TsIyxHrWruDhQlxcGN/I3ZSg4nv8BOL+1BAgzvF6igShVfwPRU00K6QB5kGg0OTYPnUpb
	 fo5Vu7jvKLsLpXTF9x+NYaTOaS9S9i4BoQUFIadm0/m5qc9fDrrw2Fu5FU68kbzxDSHv5
	 FuTJk4Ax04Tr3CsnAUTSB4zi7X5N0NhBmM2kV1jpPwA0Gxhit+xAlfVbAvdH/wDY64w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TSxDqL/I";
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B99E606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B99E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TSxDqL/I
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3535a54bed9so1213469eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793369099; x=1793973899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eCbFQAnD6kO5eER8bkFilt/J6fSMOzIEmOATP+B2WGU=;
        b=TSxDqL/IRoDoTKjrPRS7xWIOkgn5uF/xQGjx01WAx9zIrbuE5G8ki9cOgipYvOq9PO
         uIVJCMhU0/2COJnZb58lpW9kipOjQPuCYaY1PNaP4Zfm03N3Zdhhxup8qtYkog4zcvYd
         KER4dU0oZfvAD+S9u78SkO96YwLKySkXlG2jJXpuMDPdrlv/ZE2vdsIZfXknThtzqIZt
         ttLIAWBiCU7Gx/p19qXUiLzwYH/boW9eRyjvg47DaGdRYVyA1CE7dYXLh1LA7oG9q0FT
         RH1HrzG59Ozly2ixX6bUy9MTZMxPFnKPPkfVWIKDAHo9oSuya5gC7YC4ArJMHn91gQIA
         Bb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369099; x=1793973899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eCbFQAnD6kO5eER8bkFilt/J6fSMOzIEmOATP+B2WGU=;
        b=SHfibI95TWXirIUjGQ0KnI9lBP7rcO86ANYmOx4QUn03ZwmDbbWKNLwy6gW6D/dDt0
         lBciBgQ7hCRWmK5oReqU3lljXsME/0mAamZhROJq/vQbSyMaXY0v+LXMl3D0zYpW5c8c
         qdawIBZHozKA0oVz9RIOtAkTMoN5+il8gL1WrSr/mtVTWLZtwjORf01re73tLgFc/Wg6
         AggcU9/tbaD7/HOwiw8gytYmWmCBPn9cHONeqlRJy0ztrG/izblcxLSDPYXbPlAY2rWk
         9YbZrrXv6EOUP4iCpKSO+f1yeqiMVJSh7vWXgnMzPNl76wa0q86xvdAj9YU9vU9J4374
         KZTw==
X-Forwarded-Encrypted: i=1; AKwUvBz9IvetBCGJ/uYLwMOR9fkFllqW5+YB6pT5kMvDGFl0f9DMxosQaGaK2CDrlmOwNOCbAnjc8szaJkI6ucw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2AhJD5zYhXNH+tIzp8gwJ6OXVbNiI9L3H+x0TwcMGVrKzbCym
	uH1ZCmg3Ujw8m6Yi+qO3Tya5EvmuYdhIRj9Fj1b3vNa8dNBqFa4bc7eu
X-Gm-Gg: AYBFou0aGk71MM0RBT820OjXi3xALatHROaY/wloxTZ+m25vRc3gApdwpQjfjiKtDWB
	xv0g5azXnRPwTJqivtfvpXJBy8doAPNb7ZvAhi95SRDvMv39PbuimdS4XXF2lfYP2acFnePjq4M
	Qh62gUGqcv+Rnz9XT3Z3LNRm7syDjJQKJPOMT1bYlkP6DfHjCDVjqJzmbkhHAzas5elmk25cDFB
	dGtSy9Rqlg2mg9FlKL7/InKQMmBgTMgGjCc67JYRtkGksgTqfyaEi2yVe71ozD8UNWWbM4neui1
	UCIF0DVE1WZyjh6ld5kUrfjUm4X0zGWsH3xgKnnxiKIAmA4AhFvRt99fYgboe58zPOWiyBp7RvM
	/ZoRYGJ/qVWaexVQW1rctJsIyDQaDgBvQAbcN6wDnC8EscJTci9G21NNr9vz8o2TUMnpI81mkb/
	6yT5TebgD2x6HKYlrE53fNy43KgIR0E6lQ7szoU3fAZielMxut76u5YXxbQ95+KYI2SbkGWU6mu
	6MyNy9a8MGiJ7o4hiDyqYd6IelrdaPwuz3Jqmnf30LtVIYzMe60nC6qJoJ4yAYQSnd2ocMG7iyZ
	DJC+qWkx6vUgk6QnP3dYvWaOXHM36K516Q==
X-Received: by 2002:a05:7301:6187:10b0:35b:cb8a:8d0e with SMTP id 5a478bee46e88-36a4242f5c3mr3801266eec.16.1793369098356;
        Fri, 30 Oct 2026 07:04:58 -0700 (PDT)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42662f23sm9529876eec.2.2026.10.30.07.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:04:57 -0700 (PDT)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	linux-mips@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	=?UTF-8?q?Beno=C3=AEt=20Monin?= <benoit.monin@bootlin.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH] MIPS: Make cpu_has_mips64r6 constant on 64-bit r6 kernels
Date: Fri, 30 Oct 2026 22:04:30 +0800
Message-Id: <20261030140430.1857741-1-shingekinocore@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 64-bit r6 kernels, __fls() and __ffs() never use dclz: they always
run the C binary search, 37 and 39 instructions with GCC instead of 4
and 6. __ffs() calls __fls(), which uses dclz only if cpu_has_mips64
is a compile-time constant:

	if (BITS_PER_LONG == 64 && !__builtin_constant_p(word) &&
	    __builtin_constant_p(cpu_has_mips64) && cpu_has_mips64) {

cpu_has_mips64 ORs cpu_has_mips64r1/r2/r5/r6. On r6 kernels the r1, r2
and r5 terms fold to 0, but the r6 term tests cpu_data[0].isa_level, so
64-bit r6 kernels have never used dclz here.

The r1, r2 and r6 macros were run-time tests until commit 1aeba347b3a9
("MIPS: Hardcode cpu_has_mips* where target ISA allows") made r1 and r2
constant in 2018; it kept for r6 the flag test that tells MIPS64r6 from
MIPS32r6 CPUs. Commit a2ac81c6ef40 ("mips: Fix cpu_has_mips64r1/2
activation for MIPS32 CPUs") later added cpu_has_64bits to r1 and r2,
and left r6 alone. Every other cpu_has_mips32rN and cpu_has_mips64rN
macro is a constant on the kernels built for its ISA (the 64-bit ones
for cpu_has_mips64rN); only cpu_has_mips64r6 still tests the flag at run
time on 64-bit r6 kernels.

A 64-bit r6 kernel only runs on a MIPS64r6 CPU, so define
cpu_has_mips64r6 as cpu_has_64bits && MIPS_ISA_REV >= 6, like r1/r2/r5
without the flag test. It folds to 1 on 64-bit r6 kernels, and pre-r6
kernels build to identical code. On 32-bit r6 kernels, cpu_has_64bits
tests isa_level & MIPS_CPU_ISA_64BIT, and set_isa() gives r6 CPUs no
such flag except MIPS_CPU_ISA_M64R6, so the run-time result is
unchanged. No __isa_*_flag() helper fits: a pre-r6 kernel cannot run on
an r6 CPU and vice versa, so the flag test adds nothing, yet a helper
keeps it as a run-time load in r6 kernels (__isa_ge_and_flag(), the
current form) or in pre-r6 ones (__isa_ge_or_flag()). The r1/r2/r5-like
cpu_has_64bits && __isa_ge_or_flag(6, ...) grows 32r2el by 3352 bytes
and 64r2el by 264 bytes with GCC 16.

Because __fls() and __ffs() are inlined into find_*_bit(), cpumask
iteration and ilog2(), vmlinux of the 64-bit r6 defconfigs shrinks by
105-108 KB with GCC 16 and 124-147 KB with Clang 23
(scripts/bloat-o-meter -t). In the 64r6el and eyeq6 builds, the other
users of cpu_has_mips64r6 change 3 functions, by 148-248 bytes in all;
the rest comes through these two functions. __fls(0) now returns ~0UL
instead of 0 on 64-bit r6 kernels, as its comment says and as on 64-bit
r2 kernels.

Signed-off-by: Tzu-Ching Yang <shingekinocore@gmail.com>
---
No 64-bit r6 hardware was available: every run-time test below ran on
QEMU. A run of the ffs and bitops KUnit tests and find_bit_benchmark
on an EyeQ or Boston board, before and after, would be welcome.

Instructions of a function that only returns __fls(x) or __ffs(x)
(return included), compiled alone with the lib/find_bit.o command of
64r6el, before -> after:

               __fls     __ffs
  GCC 8-16     37 -> 4   39 -> 6
  Clang 17-19  62 -> 4   64 -> 6
  Clang 20     61 -> 4   63 -> 6
  Clang 21-23  55 -> 4   57 -> 6

The new __fls() with GCC 16:

	li      v0,63
	dclz    a0,a0
	jr      ra
	subu    v0,v0,a0

find_bit_benchmark built into 64r6el on QEMU boston (I6400 model),
random-filled bitmap, executed instructions per iteration counted by a
TCG plugin, before -> after:

                                  GCC 16           Clang 23
  find_next_bit                   53.1 -> 28.4     86.0 -> 34.5
  find_next_zero_bit              55.1 -> 29.4     87.1 -> 35.5
  find_last_bit                   54.1 -> 29.4     76.9 -> 27.4
  find_next_and_bit               60.5 -> 34.7     90.4 -> 38.8
  bitmap_find_next_zero_area_off  3839.7 -> 2176.4 6045.6 -> 2625.9

The other three tests (find_first_bit, find_first_and_bit and
find_nth_bit) spend their time scanning words or counting bits rather
than in __fls(), and change by 4% or less. The helpers themselves shrink
alike: _find_next_bit() goes from 61 to 31 instructions with GCC 16 and
from 85 to 34 with Clang 23.

bloat-o-meter -t on vmlinux of the 64r6, 64r6el, eyeq5, eyeq6 and
eyeq6lplus defconfigs, bfe97f12a0a6 before and after with the same
.config, kernel.org GCC 16.2.0 and Clang 23.1.3: -105340 to -108352
bytes with GCC 16, -124340 to -146692 bytes with Clang 23. Of the 105 KB
of 64r6el with GCC 16, inlined bit search (find_*_bit(), mostly cpumask
iteration) accounts for 74.4 KB, log2 math (ilog2(), get_order(),
roundup_pow_of_two()) for 21.6 KB and direct __ffs()/__fls() calls
(lib/find_bit.c among them) for 7.0 KB, and secondary inlining for most
of the rest. With GCC 16, 13 symbols grow and one function is added
(1712 bytes in all): 608 bytes are the alignment gap that bloat-o-meter
assigns to the __unlikely_text_end marker, 64 bytes are two loops that
GCC lays out differently, and the rest are callers into which a now
smaller callee with a bit search is inlined, or changes from GCC's
inline growth limit and IPA-RA; the ten largest growers with Clang 23
are callers into which a callee with a cpumask loop or a bit search is
inlined.

__isa_ge_and_flag() has no user left after this; I left it next to
the other __isa_*() helpers, but can drop it if you prefer.

Switching MIPS to the generic builtin helpers would fix this too, but
was dropped in 2019 because the builtins become libgcc calls on pre-r1
ISAs:
https://lore.kernel.org/all/20191001215249.4157062-1-paul.burton@mips.com/

Testing: built before and after (W=1, no new warnings) with GCC 8.1
to 16.2 and Clang 17 to 23 for 64r6el, eyeq5, eyeq6, 32r6el and
64r2el, and with GCC 16 and Clang 23 for 64r6, eyeq6lplus,
malta_qemu_32r6 and a 64-bit r6 allmodconfig; Clang 17 to 20 cannot
assemble genex.S before or after, so they were compared on objects.
Pre-r6 kernels build to identical code (64r2el and 32r2el with every
compiler; malta, ip27, loongson3 and cavium_octeon with GCC 16).
64r6el on QEMU boston (I6400) and malta_qemu_32r6 on QEMU malta
(mips32r6-generic and I6400), built with GCC 16 and Clang 23, pass
the ffs and bitops KUnit suites and test_bitmap and print the same
"isa" line in /proc/cpuinfo before and after.

Against the mips-next branch of mips/linux.git (bfe97f12a0a6); also
applies to next-20261029.

 arch/mips/include/asm/cpu-features.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index 3f11e5218e6c..2842e22c69ea 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -317,7 +317,7 @@
 				 __isa_range_or_flag(5, 6, MIPS_CPU_ISA_M64R5))
 #endif
 #ifndef cpu_has_mips64r6
-# define cpu_has_mips64r6	__isa_ge_and_flag(6, MIPS_CPU_ISA_M64R6)
+# define cpu_has_mips64r6	(cpu_has_64bits && MIPS_ISA_REV >= 6)
 #endif
 
 /*

base-commit: bfe97f12a0a64c3682be21a02404238e3b91e945
-- 
2.34.1

