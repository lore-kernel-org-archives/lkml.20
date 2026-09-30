Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C5F4E324D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773261; cv=none; b=l4CVflTj4GMb+JBrudfyPN/QoHT90NcoR2vlIBWtvG7BLPv+yUMmuifunvNGxvHd35d15twtYohygjsWlkSVYGBUn0NPXitHH7zoImzF1dTPkPVVecIv08BZxQrmpMn5E8PntAHHiUsMKPo6nOyeA4SzUc2q7eyYpCzDtQ4rZ7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773261; c=relaxed/simple;
	bh=qc3plJurrfn2/1/o3dLYDwfPbYCuSayA+fBrR1xzyR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LtlF0uc53+QTQS3KBZ2hdvnG1QX/jqjurvaibZ4qlfvKVPGsuXK//HO5vKPmP6APj0w2i/0TEEuFQ+Im4IbzlsGQKBPOWFjGTXqejf6LGy40bairwafH3RD75MG5LACDzy+VHAqFiqAD6LAZu7+xUnUf9AHWJNtACwMIMd9fBYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4geHWF3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4geHWF3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9739C1F000FF;
	Wed, 30 Sep 2026 13:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790773250;
	bh=BN61Chre73hrYLj0CBq/u0yA/QVkhU4K+myvgwugnmI=;
	h=From:To:Cc:Subject:Date;
	b=U4geHWF3sGD8zeH7k7va2WH/jQHrLWud0syMY6PYrIvnSyPkMEss2x8l8EaAwp0hd
	 L0ZezYAAPC+z/QbPC2f4clQlgbXV6nZmULk6yu7zhxV0dDXS6piq2yHu/ioZOFyCmK
	 SIZp28bMtWH00nHKwGklpPI/L2TfQGUbxSscpT8hC22vgQn7LsXxPBlaRu7JnAICWQ
	 +tCmO0aly6FhOvTnRxYCNzFrxkgIAZn4os4Zc1d9crzttq14Wd75M9sFKhpPDQ0noa
	 P1XTxu+G6T2SiIUBnGX6B1eWyEYzy0+uRbK8H+PcgfJttwNbrkrKhpKWkbX+4/sMrw
	 HhxHNIc3+KMeg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] riscv: word-at-a-time: improve find_zero()
Date: Wed, 30 Sep 2026 20:40:49 +0800
Message-ID: <20260930124052.21986-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, there are two problems with riscv find_zero():

1. When !RISCV_ISA_ZBB, the generic fls64() bring non-optimal code.

But in word-at-a-time case, we don't have to go with fls64() code path,
instead, we can fallback to the generic word-at-a-time implementaion.

What's more, the fls64() brings non-necessary zero bits couting for
RV32. In fact, fls() is enough.

2. Similar as 1, the generic fls64() also brings non-optimal code when
RISCV_ISA_ZBB=y but HW doesn't support Zbb.

So this series tries to improve find_zero() by falling back to generic
word-at-a-time implementaion where necessary. We dramatically reduce
the instructions of find_zero() from 33 to 8! Also testing with the
micro-benchamrk in patch1 shows that the performance is improved by
about 1150%!

After that, we improve find_zero() for Zbb further by applying similar
optimization as Linus did in commit f915a3e5b018 ("arm64:
word-at-a-time: improve byte count calculations for LE"), so that
we share the similar improvements:

"The difference between the old and the new implementation is that
"count_zero()" ends up scheduling better because it is being done on a
value that is available earlier (before the final mask).

But more importantly, it can be implemented without the insane semantics
of the standard bit finding helpers that have the off-by-one issue and
have to special-case the zero mask situation."

On RV64 w/ Zbb, the new "find_zero()" ends up just "ctz" plus the shift
right that then ends up being subsumed by the "add to final length".
Reduce the total instructions from 7 to 3!

But I have no HW platform which supports Zbb, so I can't get the
performance improvement numbers by the last patch, only built and
tested the patch on QEMU.

Since v3:
  - fold part of patch2 into patch1 and make the RV32 improvement
    as patch2.

Since v2:
  - fix wrong version(PATCH vs "PATCH v2" in cover letter)

Since v1:
  - rebase on the latest rc1
  - Use if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))


Jisheng Zhang (3):
  riscv: word-at-a-time: improve find_zero() for !RISCV_ISA_ZBB or no
    Zbb
  riscv: word-at-a-time: improve find_zero() for RV32
  riscv: word-at-a-time: improve find_zero() for Zbb

 arch/riscv/include/asm/word-at-a-time.h | 46 +++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 3 deletions(-)

-- 
2.51.0

