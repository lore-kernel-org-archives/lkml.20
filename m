Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943BF494830
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795269; cv=none; b=GGHOupNGufDA8l8DBlrNKxaa+dx+xDw1TotnbWstbcBukuHubhoaPznUeixuIcQMDqjjw7ahgxuieNstZqNcjNop5UxKNuomfjykSJ1thZdWeFQi6KfN045uZNgjoRInCBIM7PYkQbv2z75TzgpH4XkK6WygA6YmHhtrqI/bL50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795269; c=relaxed/simple;
	bh=LPsxcs5SzQLy2MGgzQXRlM4zZSo7k4sZWV24wuFl1T4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LpiU9j1IOIZaUd0npGTbpux66GwM2PWTGwfhhgYVX4TGOJ6N/F4jYlpt/DpdyCepiTMPCHKsW/59t9SRGVa0iAAbMLeEb9ui63SrIAWDmNAIikRKo2X1HBlQBhtQvitgJs3N5/YVgigBzyxehmvd9Pr53PLtOeZ128Ngjx3T794=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWUQkOj5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWUQkOj5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B371F00A3A;
	Mon,  7 Sep 2026 15:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788795268;
	bh=EjAyqaHWJJCD8WZU9MsOvyhwLKZ2f6brl0AscimLQBQ=;
	h=From:To:Cc:Subject:Date;
	b=SWUQkOj5Y85Wxc3BWa8vOC39HG0fePLCSOWC7/Oo4ecKfVDCmVfm9wvBjaqjOme9e
	 G9O7zGhhPttzp60pjgo4uNafSQnclk4tVaM0B2jPFN+bPRv2IxaEidfQ5b2EqO9eci
	 lTwoD+ZT7L1XH1bTWEp7XfZLEn7Ej3pQu/E9g9wWehakuxqTfSLOq5yLwF7WQHUChn
	 jimHTGQj568iTgYIhS4RIgetAohZf0EYfHCUi7k0ac03TwzOt1dQvnkmw/J4hEKsCp
	 z0i/mFlgRqvovAQy8ZofNjjJDjhIp7kFivLQO1UgSpPbHP0wAlyHlLV9na11vro73e
	 NE8fcbhdFGQQw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: [PATCH v2 0/5] optimize pgtable_l4|l5_enabled
Date: Mon,  7 Sep 2026 23:14:32 +0800
Message-ID: <20260907151437.7603-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In 2022, I tried to optimize pgtable_l4|l5_enabled use static branch[3]
But as is known, static branch has some drawbacks. 

This series is another round of optmizing pgtable_l4|l5_enabled, but
with another mechanism. Below the is normal cover-letter.

The pgtable_l4|[l5]_enabled check sits at hot code path, performance
is impacted a lot. Since pgtable_l4|[l5]_enabled isn't changed after
boot, we can use alternative mechanism to optimize them.

So the question is whether we can add RISCV_ISA_EXT_SV48/SV5 and use
riscv_has_extension_*() or not. Per [1] and [2], SV48 and SV57 are ISA
exensions too. From another side, riscv_has_extension_[un]likely() and
other related functions report whether the extension is supported and
enabled on the platform. So SV48 and SV57 can be supported with current
isa extension alternative mechanism.

However, to use it to optimize pgtable_l4|l5_enabled, we have support
the "early" characteristic, I.E besides risc_isa bitmap setting, we
need to support appling alternative early before MMU on.

After that, use it to optimize pgtable_l4|l5_enabled.

For the typical access_ok(addr, 1);
before the patch:

...
auipc	a5,0xb43
lbu	a5,100(a5) # ffffffff80b51f68 <pgtable_l5_enabled>
bnez	a5,ffffffff8000ef46 <foo+0x56>
auipc	a5,0xb43
lbu	a5,91(a5) # ffffffff80b51f69 <pgtable_l4_enabled>
beqz	a5,ffffffff8000ef5a <foo+0x6a>
...

after the patch:
These memory load and test branch instructions are replaced with only
two j or nop instructions.

Initial test lmbench's lat_syscall write on TH1520 platforms shows that
the write syscall latency is reduced by about 2.38%.

After that, introduce RISCV_ISA_SV48 and RISCV_ISA_SV57 under NONPORTABLE,
so that the embedded platforms can choose the best option themselves,
while still keep the feature of unified one kernel Image for all SV39, SV48
and SV57 when !NONPORTABLE.

Tested on TH1520 platforms with both RISCV_ISA_SV48 and RISCV_ISA_SV48
disabled, we saved 20 instructions for access_ok(addr, 1)

Link: https://github.com/riscv/riscv-isa-manual/blob/main/src/profiles/profiles.adoc [1]
Link: https://riscv.atlassian.net/wiki/spaces/HOME/pages/16154732/Ratified+ISA+Extensions [2]
Link: https://lore.kernel.org/linux-riscv/20220821140918.3613-1-jszhang@kernel.org/ [3]

Since v1:
  - use current isa extension to support SV48/SV57
  - collect Reviewed-by tag
  - add patch4 to introduce RISCV_ISA_SV48 and RISCV_ISA_SV57 under
    NONPORTABLE
  - add patch5 to unexport _pgtable_l4_enabled and _pgtable_l5_enabled



Jisheng Zhang (5):
  riscv: remove RISCV_ALTERNATIVE Kconfig option
  riscv: convert pgtable_l4|l5_enabled to inline function
  riscv: support early isa ext and use it to optimize
    pgtable_l4|l5_enabled
  riscv: RISCV_ISA_SV48 and RISCV_ISA_SV57 under NONPORTABLE
  riscv: mm: unexport _pgtable_l4_enabled and _pgtable_l5_enabled

 arch/riscv/Kconfig                          | 48 ++++++------
 arch/riscv/Kconfig.errata                   |  5 +-
 arch/riscv/include/asm/alternative-macros.h | 24 ------
 arch/riscv/include/asm/alternative.h        | 12 +--
 arch/riscv/include/asm/cpufeature-macros.h  | 10 +--
 arch/riscv/include/asm/cpufeature.h         |  8 +-
 arch/riscv/include/asm/hwcap.h              |  2 +
 arch/riscv/include/asm/pgalloc.h            | 14 ++--
 arch/riscv/include/asm/pgtable-32.h         |  4 +-
 arch/riscv/include/asm/pgtable-64.h         | 74 ++++++++++++++-----
 arch/riscv/include/asm/pgtable.h            |  4 +-
 arch/riscv/include/asm/vendor_extensions.h  | 18 ++---
 arch/riscv/include/asm/vmalloc.h            |  5 +-
 arch/riscv/kernel/Makefile                  |  2 +-
 arch/riscv/kernel/alternative.c             | 24 ++++--
 arch/riscv/kernel/cpu.c                     |  4 +-
 arch/riscv/kernel/cpufeature.c              | 62 ++++++++++++----
 arch/riscv/mm/init.c                        | 81 +++++++++++++--------
 arch/riscv/mm/kasan_init.c                  | 20 ++---
 arch/riscv/mm/pgtable.c                     |  4 +-
 arch/riscv/mm/ptdump.c                      |  4 +-
 21 files changed, 238 insertions(+), 191 deletions(-)

-- 
2.53.0

