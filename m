Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698F3377558
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795058; cv=none; b=hXG9FlSSMSL/G9GUNWApSqSfu4hWTckH8SC25FWg9sMwwhTarK8NZzleYhlUXYnEuuoVoG4xTfzLYffTEw1+TIOXlXnwKdKr9bWKn+Ld+QKE7Gr5K2ylDeD/F+vDzZP//88Ty8oLY82xxY0YJXSWwlTy8kRDNKnsm1Wbz8SrQZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795058; c=relaxed/simple;
	bh=l9oKDL4BwbSZo0AW2MBU7N12My41/XYcMX5A4bjrbOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TjilXAkQEq516pjvIApJP5sv4qQQ+vtTuMhoYvGQxpdLi0a5lSW5ZTe8GACXiHpFXjrjG+LjaLraqdlyKn9GnK2Q6be8+tBT7ewWWRaLVvO4xHJLtWN0Hw6ovr+QiWGA8XsGbu1Mwp4cdnW89jhvXReSyksbMD9UfdtEzrhra4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DcgTUS2m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DcgTUS2m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6EC81F00A3A;
	Mon,  7 Sep 2026 15:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788795057;
	bh=AygeBGTDZ2oWU8QHGA0f9XVLcVWKrxlMH2XdKkG3oEQ=;
	h=From:To:Cc:Subject:Date;
	b=DcgTUS2meJa+TVgPacExIr5BNxRJRngNvDBsf5ZXl4lPjBM2b16GssU4s4z/Y65LI
	 1lxWIKrYgtV+98SkXO1Lwsc1C2/jOwbrAyJ+Pb50GDTtZVH8cF4iIFEGb5Rdn2slTJ
	 hbU0K4KG+9kR76zm+WXvN+iv0E/LKwijKKi9RkSLA7ECVatBCbBfmfV/C2YSdki59M
	 I5NAZUppX3IEHfej7KX/ZBqwuKRU+YDa7Lkhd67BVFqq3XgYJDVx2RMhqnHCWj3ZcW
	 kLxHivF6L41wGUwqnT6rFOY83TgBpaPjoUqiGhoCBPz5PzoJUh68bcJT/4k/vkF3Mk
	 pfwVyRwMAQFEA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] riscv: word-at-a-time: improve find_zero()
Date: Mon,  7 Sep 2026 23:11:05 +0800
Message-ID: <20260907151108.7538-1-jszhang@kernel.org>
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

Since v1:
  - rebase on the latest rc1
  - Use if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))

Jisheng Zhang (3):
  riscv: word-at-a-time: improve find_zero() for !RISCV_ISA_ZBB
  riscv: word-at-a-time: improve find_zero() without Zbb
  riscv: word-at-a-time: improve find_zero() for Zbb

 arch/riscv/include/asm/word-at-a-time.h | 46 +++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 3 deletions(-)

-- 
2.53.0

