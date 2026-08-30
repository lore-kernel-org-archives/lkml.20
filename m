Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0FE3AEF46
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 17:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788110639; cv=none; b=U/fRZXgodNF8N5cJX0xf6qsPTvI5fp1TJXWhCilhAs6Ejrsb685oIJdvVThCjQR4NgDVytw1Dbxs/7ksGMXJWPAh89ECuTGOkDudp5vE9JSnnab5AdygKJtYPIUjZwXPJXzV67EuHNbGTC8+cj5m/71oBFM83sdp4BiHz+q5v14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788110639; c=relaxed/simple;
	bh=cdXpE5ZYf170UGqgipwiUJA2Ozp0cK2IMmJnesvY1Do=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qdfxLI/3IVxd/BDhdS/19eOXbtuFXYeFKlTeTDfisRym6Snwg2x0ATTlFaKKB5eLWzeZB1Wmh5SzFGy0FXKH8sgYTI0YlB8/RAy5mdbYTQ/5QwmvetKgczBvFpmWO4UD2OaxJs0NU6VsSsmwkY2XqGMdw9uQ9YCAb9CU5408NRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHDUcg9d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHDUcg9d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B9AC1F000E9;
	Sun, 30 Aug 2026 17:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788110638;
	bh=RUQXlwj7uSjpiw/7CJUxBxHOVF3WkXMqnPE7Hd8+ijE=;
	h=From:To:Cc:Subject:Date;
	b=FHDUcg9dGq2zGgjotRwwlqixv2W5NKpHkfFEOb5iCcKWy4JZGcESsfF9ScF2ald7H
	 FbLDR3Ww54o1Mbx6RoYvWHD+A/f0daHq0bGJH8h3m1zkB1PjFMZbsUS3lJefDIvOD4
	 HQTvIf+SaJmjAY/18UYZ3ruHaTI8HClmTZSF6MupbJWhh4nrCofBngwFLzRTFSok0G
	 voZA2bTfuyyTH5sR2LMiSVaeVjPAMhywAUcDtbHES/GXL226n+XlJ7Fq0zHWyYw4Sz
	 dS+TSfIAsO+d2Rq2J+/rACSm12KIISPyTK5GExkJw+wP3RjaaFklDiYVOifFQxQ8BC
	 rMzm/Y1RMyhUQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] optimize pgtable_l4|l5_enabled
Date: Mon, 31 Aug 2026 01:03:58 +0800
Message-ID: <20260830170414.4505-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In 2022, I tried to optimize pgtable_l4|l5_enabled use static branch[3]
But as is known, static branch has some drawbacks. 

This series is another round of optmizing pgtable_l4|l5_enabled, but
with another mechanism. Below the is normal cover-letter.

The pgtable_l4|[l5]_enabled check sits at hot code path, performance
is impacted a lot. Since pgtable_l4|[l5]_enabled isn't changed after
boot, we can use alternative mechanism to optimize them.

So the question is whether we can add RISCV_ISA_EXT_SV48/SV5 and use
riscv_has_extension_*() or not. Although, per [1] and [2], SV48 and
SV57 are ISA exensions too, RISCV_ISA_EXT_SV48/SV57 are to describe hw
supported extensions, while this doesn't mean the pgtable_l4|l5 is
enabled, for example, we may pass no5lvl/no4lvl kernel boot args or
explicitly ask for SV39 by setting dt mmu-type property as
"riscv,sv39". If we clear RISCV_ISA_EXT_SV48|SV57, then internal
extension queries and potentially userspace reporting can no longer
distinguish “unsupported” from “supported but disabled.”

Introduce cap framework to describe the capabilities selected by
kernel. It also uses similar alternatives mechanism as the
riscv_has_extension_*() helpers.

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
there are only two j or nop instructions which avoid memory load and
test branch.

Initial test lmbench's lat_syscall write on TH1520 platforms shows that
the write syscall latency is reduced by about 2.38%.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Link: https://github.com/riscv/riscv-isa-manual/blob/main/src/profiles/profiles.adoc [1]
Link: https://riscv.atlassian.net/wiki/spaces/HOME/pages/16154732/Ratified+ISA+Extensions [2]

Jisheng Zhang (3):
  riscv: remove RISCV_ALTERNATIVE Kconfig option
  riscv: convert pgtable_l4|l5_enabled to inline function
  riscv: introduce cap framework and use it to optimize
    pgtable_l4|l5_enabled

 arch/riscv/Kconfig                          | 24 +------
 arch/riscv/Kconfig.errata                   |  5 +-
 arch/riscv/include/asm/alternative-macros.h | 24 -------
 arch/riscv/include/asm/alternative.h        | 12 +---
 arch/riscv/include/asm/cpufeature-macros.h  | 54 +++++++++++++--
 arch/riscv/include/asm/cpufeature.h         |  8 +--
 arch/riscv/include/asm/hwcap.h              |  6 ++
 arch/riscv/include/asm/pgalloc.h            | 14 ++--
 arch/riscv/include/asm/pgtable-32.h         |  4 +-
 arch/riscv/include/asm/pgtable-64.h         | 62 +++++++++++------
 arch/riscv/include/asm/pgtable.h            |  4 +-
 arch/riscv/include/asm/vendor_extensions.h  | 18 ++---
 arch/riscv/include/asm/vmalloc.h            |  5 +-
 arch/riscv/kernel/Makefile                  |  2 +-
 arch/riscv/kernel/alternative.c             | 24 +++++--
 arch/riscv/kernel/cpu.c                     |  4 +-
 arch/riscv/kernel/cpufeature.c              | 43 +++++++++---
 arch/riscv/mm/init.c                        | 73 ++++++++++++---------
 arch/riscv/mm/kasan_init.c                  | 20 +++---
 arch/riscv/mm/pgtable.c                     |  4 +-
 arch/riscv/mm/ptdump.c                      |  4 +-
 21 files changed, 230 insertions(+), 184 deletions(-)

-- 
2.53.0

