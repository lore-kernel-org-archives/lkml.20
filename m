Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF1E23EAAD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238818; cv=none; b=MGPMsfHSEl4bd+DIMZIshwmCbpGXORt4atK1ROYrgfKrWuiR+fkQ7LKWmRh7SO2ww8/Og1b+kKui5zf0YhICG3o/OVFFuRd/F0olxHayc3u4kdHCrOc9jBJvB0t9NuazYiebAFmO9A6U2gZKLiUl4nwMubmGXCfRRZM9UZ8ZsWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238818; c=relaxed/simple;
	bh=TBYx1StY+3M1knS5vLD/1vZ0bzvFkFUMS71WekuklOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QxX3wUwf8I5e43PA+aB1j3PpUcdaSRiE//BSesoX4LAxYfyVNXyq5QPdh/Jhx6vYv0ajd0wOCq39cYtzAVXpI7rUk0JrMuIee06d7cwTdF9qAhKFhIRR8wd11uqdmP3+jLeYu9C0M7OkfnG19doWnC2x3XQyYJ1fHEdyAwZIerU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jLZaQ4Sk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLZaQ4Sk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112741F00A3D;
	Tue,  1 Sep 2026 05:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788238816;
	bh=rVEVnDnCmmIl7ecM8N8brK3OzzR2flC2RoMKBklo9CM=;
	h=From:To:Cc:Subject:Date;
	b=jLZaQ4Skqvr1D2wbpHRCHkQ1S5WURRMU5fmKvgZlFHz68AioJKX7cMPrebBltqwoB
	 6WXoqSSN9KTgKylsPSdfgVGx7AyHDC7l6WXlFZcKtLnY0/A7dMLJJuAb8RUZvb2MPk
	 NDc1J//F0ZKg4/u6I9DSpzXJbMzCpytqLR2IU1NqZYwa3OiopcKJkvY3Ut+xJgEmh0
	 5/DBeEBnHrOwuQHzDUD7i7IUDFE/1bORTq0goLIUcQY0eeOSw1sPtlecQvtcZRmk5g
	 7hXtaiFlOuvNGaT8QSPaFbhKQLJp8jVPYwatE8RHnb+YeQ6gYe15ohocSpyf4tCsXG
	 QCY6EaJ10hTyg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 0/3] riscv: word-at-a-time: improve find_zero()
Date: Tue,  1 Sep 2026 12:40:28 +0800
Message-ID: <20260901044032.5635-1-jszhang@kernel.org>
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


Jisheng Zhang (3):
  riscv: word-at-a-time: improve find_zero() for !RISCV_ISA_ZBB
  riscv: word-at-a-time: improve find_zero() without Zbb
  riscv: word-at-a-time: improve find_zero() for Zbb

 arch/riscv/include/asm/word-at-a-time.h | 47 +++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

-- 
2.51.0

