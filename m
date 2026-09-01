Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402AF38D3F2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238826; cv=none; b=LA6EWmXxzABvIw60/3leWq7Sn+bzUImL0aYWDBgbB3tJqLsrqqGFmO7tlWkbryaQBrnR5YEa8ZVYfsSVnmgx8DsFLO7GW4edwXgaYnhpz2HxwrPaG+tgG8w1vkjLQJvqOSZ1dV7KhW/pz7Q2RhFyMX8/M0cLCpKyeFhJGePxuFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238826; c=relaxed/simple;
	bh=uVtGUyIWHyjoUK8L0H3DB3EX/vfhDouF0fbHo6dDlXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sSf1VCn5jMa6a080dzTgyADCyvTgJTkqT05nuPXc5qEqqCvlzLXYhcYvAS7B9XeI7SwZSD16cS3hrU8A38CCCnzyEs+Ql9zC+R82TkgGX+Hm4Q3ruYhsNPAZkEhSVtDLrgtoCaFTm+ni6msX9fHwmx01FQK4IShwLXSd4tZzMdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOFSeLal; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOFSeLal"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BA21F000E9;
	Tue,  1 Sep 2026 05:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788238825;
	bh=Ut/plU37hD5FU0JK0VZhhjzCZo1toEUrT5tdJhQhLbc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KOFSeLalu7RlfBOOrdjKw1xHW46q6Ara4dLGnjFHb/y9LUPjl7w/jLIp7kBS5yPtt
	 6gW/wiwq4QnKqTIkYGPZWydFVktDxG9Hu12pz9BqXsauMQAUinU7ToI7lw61BzQ5y+
	 Nxc3p/VYo7m9ZLPxtOxMGKhhnSe91z35LY914jieSEOXf0Wa3cdGMeHgMgXnG2LA/n
	 uwFRKpCc1nWk6QDF9Tk0XMWLMWbCi3FRxwop+gRYZx02Q22t2frUl6w3Ol6zRZuPpz
	 dnMWikyT+yRflAk0taclfza+VByoaU5305sHJNvr4KVxWE1tTg1czpP/u/eccPIYSe
	 P+4JGkbpF7ApQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 3/3] riscv: word-at-a-time: improve find_zero() for Zbb
Date: Tue,  1 Sep 2026 12:40:31 +0800
Message-ID: <20260901044032.5635-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260901044032.5635-1-jszhang@kernel.org>
References: <20260901044032.5635-1-jszhang@kernel.org>
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
 arch/riscv/include/asm/word-at-a-time.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index ca3d30741ed1..8c5ac6a72f7f 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -38,6 +38,9 @@ static inline unsigned long prep_zero_mask(unsigned long val,
 
 static inline unsigned long create_zero_mask(unsigned long bits)
 {
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
+		return bits;
+
 	bits = (bits - 1) & ~bits;
 	return bits >> 7;
 }
@@ -69,13 +72,19 @@ static inline long count_masked_bytes(long mask)
 static inline unsigned long find_zero(unsigned long mask)
 {
 	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
-		return !mask ? 0 : ((__fls(mask) + 1) >> 3);
+		return __ffs(mask) >> 3;
 
 	return count_masked_bytes(mask);
 }
 
-/* The mask we created is directly usable as a bytemask */
-#define zero_bytemask(mask) (mask)
+static inline unsigned long zero_bytemask(unsigned long bits)
+{
+	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
+		return bits;
+
+	bits = (bits - 1) & ~bits;
+	return bits >> 7;
+}
 
 #endif /* !(defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)) */
 
-- 
2.51.0

