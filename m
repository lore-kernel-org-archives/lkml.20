Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060391;
	b=vhzu5VXYKMoxuRiLBQ1sV1gHsT0KYZE6Z9KoAzMciyP1yxSzAMRoUhuZunT4dNDfDdJr
	 aQb5NETvO0waGVBJZ7Cq9gDXcYc+WOCimiKtNCzmfi+gE9P5VYqlGIJVAdfFe2KSr7Utr
	 HmJyjUMVi0YRp6yFumj0ejKgR5i0znbnfDnLXmzMyv7+a5pNSR8yDWiumMlI+mul8sLCn
	 9B86lg5q77uS1wYsQyZ+Gi7Dh7YjNQJp/jgH3LWmqfBo1HrfcW1Jy8cmOfoTj3It27oPv
	 7ihy0Y3RdOJ/SvovGjHDRQxVjLNVYEuM10YgFuU5BNljNdl83lJ0xfXqQqE9mdU7T1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060391;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=+4jpQxhUM2rm241PTUEfsH6sQtxcE1qdLAK5XanGPhw=;
	b=AaktXs1ySD2mMjCwzRk8pJPls+sZ5MP0LC8wX/JBbYvioHP3OoEx4GSfM/hfvQ0Lww+W
	 9tdDIHUpxgmnOj5KzsjXmMmG61o5i2fWhdgvpQq+6eLpkJiSO2gjLSoM2sM2t2DJipq0d
	 LkAKA78UJ7/lJUAV0YelglAmw6jm4cvDc+K4BBQaiSrQwzZ+uNiMKNdYIWttOObCMf6+G
	 eaqLgsFhN4uufzJ8BIYOPNSxO5bL4duly0yS0p6wKCJwHzIMZJzi0fjEsa72lG6FSoyQk
	 ps3VA8avqqPdYj6w6diAsFsJED7WtMbZ8iyEcWAxMb+HY/lrjLcemb7X3z6fNTEZZrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W4cwxv6A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A27A606D806
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W4cwxv6A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EBAD1F008A3;
	Sat,  7 Nov 2026 14:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794060390;
	bh=+4jpQxhUM2rm241PTUEfsH6sQtxcE1qdLAK5XanGPhw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W4cwxv6ADq9WikNCPRz5ZHzLSQBRwN0hCigf5po9luXmBSicSse0y162x2Q2BrPKc
	 5nBp+qpUO26+UX38SCnJR9P8tTiylIQpbX3dVjl5+j4keqote5U4sd1upo8Ar4nCCC
	 jqU3PCmgQc7HBBbLSl7qtZYiRhH/2d9OIsBZmvXTfmTWhgvTjU3vKaIXwlzBnPVCxR
	 jD9woDqdyCjPeYI/KNJ22H5QIzeZnlHsp0/WLr2VoHnkdY1Ls7R8ibWOutV3/LhP8l
	 mBqcv+pTryZXGHHJt6B5IYpOloCD94uZ+W5nO+/kZOKJ7eWCksFnLLhww7MNYkmrsJ
	 MEJK7c9BulpSQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v5 3/3] riscv: word-at-a-time: improve find_zero() for Zbb
Date: Sat,  7 Nov 2026 21:46:13 +0800
Message-ID: <20261107134613.17830-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261107134613.17830-1-jszhang@kernel.org>
References: <20261107134613.17830-1-jszhang@kernel.org>
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

