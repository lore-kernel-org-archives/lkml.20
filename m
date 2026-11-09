Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794225701;
	b=e4Ef18QehyJQwXHtoyjPY8ImntTkxetm1AsorAV39ihYP4AKBZKRrEqqSmzbGUSdXx9X
	 901ZstgR+uMrooZSSZZGWRyRFPGX+yjmy727bRGt10gtmA14O493lwAe7csAIuORAq3hZ
	 Gau9/4h/sL9V3kj5O+kQbhN5uz2IgN6VBRdi5MiIekAJf6lmqi/UIMnIawxZvoqJFZvmR
	 45CpxkI2eA4L9Ek6+r+9J0aqpod1xcb8H5Cuj6HKWhn+Y1h+FNe4H3/DPLE2QKbHzVcRh
	 03Ij9LT0MCzUuInrKPjRuVWbGKLNSkUQVbzN9PjnpxA2zf7897F8CHlh4du411E/p2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794225701;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PKOCGL5PIUh+iIhYhoT2eo6Jh8jb4ovmpmj5cMu0mOM=;
	b=Q3p3sppm6YETdfmd6I6DkjKNGlBra1SVaPxCW7AJTJZ94I4kbf6wxZB4TU7NldQUW1kC
	 STzBPUhdu0s8xcCzMkuibIjdHofU3fOkMcsLHRhSy137DetKFei71Rl1Zn+qUB0s2NqzU
	 lDLNUptdyr0FwKQ+O05+H9GdKoO2urYlaYtozQCaDVnuNHdGTsk6LbnkN0ef2sTljOrZk
	 qBXMOb4IFGIeOI3EkYA3TYai8SfftcIvrbUyMbABS9+xPljCAN2R6ZlvV4ZLPQlofFfbI
	 q0LpxC2+HZh0WhJn9nPmh35aUL7S8n4uB2kGQ087hGD/G+wYbOab1ZvmuTb79ZuVgtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g9+zhOrB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD53606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g9+zhOrB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A90851F0089F;
	Mon,  9 Nov 2026 12:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794225700;
	bh=PKOCGL5PIUh+iIhYhoT2eo6Jh8jb4ovmpmj5cMu0mOM=;
	h=From:To:Cc:Subject:Date;
	b=g9+zhOrBYHMFIDH+YNar3XAFNMIY1Jprc27Y8kgQZLsDDW3hrnc7EzBhpEpqm08xa
	 CQES66TAbDFIC2KcmOq/FJ1NaOYkY+sPfeEOsQ8+L49DzVwsVk26xsHue5bLZBb0WL
	 Ec3WNsZnTV/VAnRGtmJFBqA/mW/VU1q7IX/NcI/MparpkHTPUYPfMwdN0ge7Y12m40
	 ov63WznnnSzH7w+f6tuDNIi1VIrxdAECCgiXUowYisKSfwzPB2+1uOFmOPMc4DgfWf
	 +qEfqPImqNGnDLxvl+HmbBb69aRlv+g7swQdxOEYZmhpBwAlTY7AhhUOHAvOZ1q8bY
	 +CjQ72hmLoZ4Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] riscv: Keep helpers used by noinstr code in noinstr text
Date: Mon,  9 Nov 2026 19:41:27 +0800
Message-ID: <20261109114129.20260-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
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

A plain inline annotation does not guarantee inlining. In particular,
size optimization can cause helpers called from noinstr functions to
be emitted out of line in .text. Such copies do not inherit the
caller's instrumentation restrictions.
Use __always_inline for the IRQ, idle, stack-check and vector helpers
reachable from non-instrumentable entry paths, including their nested
helpers. Also force inline arch_exit_to_user_mode_prepare().
do_trap_misaligned() is called by some '__trap_section' functions such
as do_trap_load_misaligned() and do_trap_store_misaligned() which are
noinstr code. So we also need to mark do_trap_misaligned() with
__trap_section to keep it in non-instrumentable text as well.
Build-tested the affected entry, trap, idle, stacktrace and KVM objects
with GCC and CONFIG_CC_OPTIMIZE_FOR_SIZE=y. Inspected object symbols
and relocations.

Since v1:
  - add Fixes tag to patch1
  - add more missing __always_inline or noinstr to vector.h and
    kernel_mode_vector.c, these are missing in v1.

Jisheng Zhang (2):
  riscv/traps: Mark do_trap_misaligned() with __trap_section
  riscv: Keep helpers used by noinstr code in non-instrumentable text

 arch/riscv/include/asm/cpuidle.h       |  2 +-
 arch/riscv/include/asm/entry-common.h  |  4 ++--
 arch/riscv/include/asm/irqflags.h      | 14 +++++++-------
 arch/riscv/include/asm/processor.h     |  2 +-
 arch/riscv/include/asm/stacktrace.h    |  2 +-
 arch/riscv/include/asm/vector.h        | 22 +++++++++++-----------
 arch/riscv/kernel/kernel_mode_vector.c | 17 +++++++++--------
 arch/riscv/kernel/traps.c              |  3 ++-
 8 files changed, 34 insertions(+), 32 deletions(-)

-- 
2.55.0

