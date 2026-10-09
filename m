Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5907E792
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791590665; cv=none; b=RzhKUL0ci/jxHDEDkSpjkw8zx1u/+1ZkB3MmswLs1zA6FTMz7B7qa21a5ZjBbtQsWaI334APRlbqsE5J64Tig1Qn/532zTHZixazbef0Intebi3iyQnuENW34QRCphLHRs7LgOLWyn0TbZfXol1SbSGrFJqbFfLk+HlXMTKpsto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791590665; c=relaxed/simple;
	bh=Pl89ldNA4zvYlLrYRMfvneG3sLxDMCMFtzjmXl10uZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rEKeLMKs3VlXvyJnNtFAb2BTnPXaXAXs1aw40Lk75H/oVzlVhp5BZRVGXKVcQv1ILW+8xp9y42f1RNVixiEY9HQKfZeRl20Zhmz6saqHTDmdHHg7mlW1z1xZVVQh/n0oTkWM4gi6lzqhAy94F7/DaHZOdO0Iip7iIVsq54OyA3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OlnPTHD6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OlnPTHD6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D63F61F00893;
	Sat, 10 Oct 2026 00:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791590664;
	bh=+4jpQxhUM2rm241PTUEfsH6sQtxcE1qdLAK5XanGPhw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OlnPTHD6IOcKD4UhXJBpgSqSsXPPRaoli5oBrjyjiaht8El0h6kM/kn2j3TjrNP6S
	 4mXbileyyJjw7y87gus2wOARX2ughy6GHRvEqvvLHzfPi8Gx/vqSZAmbXLqcWNNV1C
	 w5h9XNV0KnN518GXHER9v+dPDcTRtP1/SDf631FDBZn/BPrcOajrnvWly372gN5Rnk
	 b+Sky9m0EflYZyGdv+bzH9Pj9XIhMbYuUNGNNAmU5emqWYhxVbEE+mt2PFgIm2zCMo
	 PO/jvseY3vOBncRsm3SlDyqk1TWPMg+BjRIcTaRTWox53WWTk3iS0deW7Q7sdzpS9s
	 eqKQTSO/ZqHPA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] riscv: word-at-a-time: improve find_zero() for Zbb
Date: Sat, 10 Oct 2026 07:44:20 +0800
Message-ID: <20261009234420.29425-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261009234420.29425-1-jszhang@kernel.org>
References: <20261009234420.29425-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit f915a3e5b018 ("arm64: word-at-a-time: improve byte count
calculations for LE"), Linus improved the find_zero() for arm64 LE.
Do the same optimization as he did: "do __ffs() on the intermediate value
that found whether there is a zero byte, before we've actually computed
the final byte mask.", so that we share the similar improvements:

"The difference between the old and the new implementation is that
"count_zero()" ends up scheduling better because it is being done on a
value that is available earlier (before the final mask).

But more importantly, it can be implemented without the insane semantics
of the standard bit finding helpers that have the off-by-one issue and
have to special-case the zero mask situation."

Before the patch:
0000000000000000 <find_zero>:
   0:	c909                	beqz	a0,12 <.L1>
   2:	60051793          	clz	a5,a0
   6:	03f00513          	li	a0,63
   a:	8d1d                	sub	a0,a0,a5
   c:	2505                	addiw	a0,a0,1
   e:	4035551b          	sraiw	a0,a0,0x3

0000000000000012 <.L1>:
  12:	8082                	ret

After the patch:

0000000000000000 <find_zero>:
   0:	60151513          	ctz	a0,a0
   4:	810d                	srli	a0,a0,0x3
   6:	8082                	ret

7 instructions vs 3 instructions!

As can be seen, on RV64 w/ Zbb, the new "find_zero()" ends up just
"ctz" plus the shift right that then ends up being subsumed by the
"add to final length".

But I have no HW platform which supports Zbb, so I can't get the
performance improvement numbers by the last patch, only built and
tested the patch on QEMU.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/word-at-a-time.h | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index f2d16c1eea8d..31240133eccd 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -35,6 +35,10 @@ static inline unsigned long prep_zero_mask(unsigned long val,
 
 static inline unsigned long create_zero_mask(unsigned long bits)
 {
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
+	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
+		return bits;
+
 	bits = (bits - 1) & ~bits;
 	return bits >> 7;
 }
@@ -67,13 +71,21 @@ static inline unsigned long find_zero(unsigned long mask)
 {
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
 	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
-		return !mask ? 0 : ((__fls(mask) + 1) >> 3);
+		return __ffs(mask) >> 3;
 
 	return count_masked_bytes(mask);
 }
 
-/* The mask we created is directly usable as a bytemask */
-#define zero_bytemask(mask) (mask)
+static inline unsigned long zero_bytemask(unsigned long bits)
+{
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
+	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {
+		bits = (bits - 1) & ~bits;
+		return bits >> 7;
+	}
+
+	return bits;
+}
 
 #ifdef CONFIG_DCACHE_WORD_ACCESS
 
-- 
2.51.0

