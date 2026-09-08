Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8A5146D5A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 00:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788912787; cv=none; b=lIA8ucp3ZSPvhd5WVYixRP2pgS6vqd37kUul4IyE/6+EL85IXahjnwouL8MfBfdTOxfJeIvoEqiyvJ95pyMpih3Jwac3H+bnaf1hFmETQhUkIkEsd1VdIAVimYHk1qy5hh/B0etZGnjmtb4RM3vO+z8nBsaxfHnkFkRmzs/sONI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788912787; c=relaxed/simple;
	bh=ZK1O7KYuEr3rzcB8WPP1+gyGYb3hDxuJ9CWbYDMMmNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J1SdNahhlNhr/LffKsyS5xfa1vbV93uACpqR8xI7H/PY13stvQWc7Puzc508BFWUYnxRnvHv1LvMWw8lcYPr6Mk2q4c6mDymq2BZwrfIb7lQRcrzdH7XLQrdQ5jN6ALUWNT5GBto/dRLkw0BjQCsNS+JwUfgaF4l4oen2ho76k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDByqrPK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDByqrPK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7495D1F00A3D;
	Wed,  9 Sep 2026 00:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788912786;
	bh=U1/4nM4HTUPSSUQ1nie+OmGSZKZ9RR8PG8T23avywYE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fDByqrPKFBoc5p3L71aUU1PQoZlJ2QUW3OqbBp+LXhGFE/MpstF3LoaAKwH84B0NP
	 uLz0AqoojfLldWY6/eD+eiAYZFOvpBVI9SiT7onggHqZ85Lbl8+mqsTLBSY8hzxC3N
	 frlzcn716iNZhJ9/x7eVdtvyuZ52uZQIDW+ROr/qNpRCPLvWo9Hg/ny/n1eQ5QwY9Z
	 Q+UsDXOb1DuzgGPIHM/UajWGpghmRjVn89VXJvxRylbStjslHY/2zGj8Xb1/DhqCjM
	 FUONCJQY81zlF38++I9vQbOlUB9nbQ/xDrc82eGKdgDeXYOv43uHTXVI0Qpoo108OK
	 gXRvajFnZwb4g==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] riscv: word-at-a-time: improve find_zero() for Zbb
Date: Wed,  9 Sep 2026 07:53:12 +0800
Message-ID: <20260908235312.8440-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260908235312.8440-1-jszhang@kernel.org>
References: <20260908235312.8440-1-jszhang@kernel.org>
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
2.53.0

