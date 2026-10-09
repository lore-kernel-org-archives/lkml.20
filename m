Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0142474E1D
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791590662; cv=none; b=q+Y7ezkBnKYPVgp7BmOrqzGwoTe9cqF+0y24R2gyluz9pWN0adARSoGq5YdrqhxyoiZphx1figcWOs/QRw5i6UQRGDuCc45LqcNrrZDWWTRvLRquCVe0m4qiqAou2R18buhna21Hu9XMO6o9WGoyM9r7iUpZDyNmT+sOcjKBEiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791590662; c=relaxed/simple;
	bh=PO5mbM0Ay+LqIcoHoIm6gnMvZoMx3ER/Sa+R6XErsCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cx+mCP1U4NQK2pntJ7Dyy17J2dr6OVho4mUbHwfSfnAVTiDu56Q/5v4ADVxJhqROvrfiWeC59Wx2O0uYJ0muFp+yZrMoprFa1yd7weBOdZsRrB+mJL6aa3Nj0nPury1hZa0LU6glzeeOkk7/SYDU/PRFs+1LcrtKVtziZr9ivok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nV/d+RFx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nV/d+RFx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 102D11F00893;
	Sat, 10 Oct 2026 00:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791590660;
	bh=r2JBLUn0jLXJkG9RPQb1uAP2LawVO+bKfxaHk5Aygmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nV/d+RFxcG7qX4G1O15+W/wDNmO3ZoSXWWQuHuTZoSfasHh8FxPMfUjwrlAaqH4Fh
	 7Y3eLCBYsJ6MZA2TKoeQ+EsxMBClIVwdnRGP/hhWnWPDw068pjOd74iMnasS6lu1p1
	 qUdisc6bRkHpL4BYOcf3LfF5VvYTax4X9jsletgt2gOt55QjRJv/zX/NglhjRmJa0R
	 iHnSf82TtBQlyVDSnfyI5ovqi2m9PyfDY5dxqeaAkCPj0nwp+gBR/WFCSob18ntymn
	 LIov7vvbrL2nPw5ZFpnBrsFFfxC1eRvQYSsDcJjYHr77tUql8y5T5hbdOVS8LctvbL
	 kYX94Dj7iuE/A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nam Cao <namcao@linutronix.de>
Subject: [PATCH v5 1/3] riscv: word-at-a-time: improve find_zero() for !RISCV_ISA_ZBB or no Zbb
Date: Sat, 10 Oct 2026 07:44:18 +0800
Message-ID: <20261009234420.29425-2-jszhang@kernel.org>
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

Current find_zero() heavily depends on fls64() for calculation. This
bring non-optimal code when !RISCV_ISA_ZBB.

But in word-at-a-time case, we don't have to go with fls64() code path,
instead, we can fallback to the generic word-at-a-time implementaion.

And there's another case: RISCV_ISA_ZBB=y but the HW doesn't support
Zbb. We have the same heavy generic fls64() issue.

Let's improve both situations by checking Zbb extension and fall back
to generic count_masked_bytes() if Zbb isn't supported.

Before the patch:

0000000000000000 <find_zero>:
   0:	c529                	beqz	a0,4a <.L1>
   2:	577d                	li	a4,-1
   4:	9301                	srli	a4,a4,0x20
   6:	03f00793          	li	a5,63
   a:	00a76463          	bltu	a4,a0,12 <.L3>
   e:	1502                	slli	a0,a0,0x20
  10:	47fd                	li	a5,31

0000000000000012 <.L3>:
  12:	577d                	li	a4,-1
  14:	8341                	srli	a4,a4,0x10
  16:	00a76463          	bltu	a4,a0,1e <.L4>
  1a:	37c1                	addiw	a5,a5,-16
  1c:	0542                	slli	a0,a0,0x10

000000000000001e <.L4>:
  1e:	577d                	li	a4,-1
  20:	8321                	srli	a4,a4,0x8
  22:	00a76463          	bltu	a4,a0,2a <.L5>
  26:	37e1                	addiw	a5,a5,-8
  28:	0522                	slli	a0,a0,0x8

000000000000002a <.L5>:
  2a:	577d                	li	a4,-1
  2c:	8311                	srli	a4,a4,0x4
  2e:	00a76463          	bltu	a4,a0,36 <.L6>
  32:	37f1                	addiw	a5,a5,-4
  34:	0512                	slli	a0,a0,0x4

0000000000000036 <.L6>:
  36:	577d                	li	a4,-1
  38:	8309                	srli	a4,a4,0x2
  3a:	00a76463          	bltu	a4,a0,42 <.L7>
  3e:	37f9                	addiw	a5,a5,-2
  40:	050a                	slli	a0,a0,0x2

0000000000000042 <.L7>:
  42:	00054563          	bltz	a0,4c <.L12>
  46:	4037d51b          	sraiw	a0,a5,0x3

000000000000004a <.L1>:
  4a:	8082                	ret

000000000000004c <.L12>:
  4c:	2785                	addiw	a5,a5,1
  4e:	4037d51b          	sraiw	a0,a5,0x3
  52:	8082                	ret

After the patch:

0000000000000000 <find_zero>:
   0:	102037b7          	lui	a5,0x10203
   4:	0792                	slli	a5,a5,0x4
   6:	40578793          	addi	a5,a5,1029 # 10203405 <.L4+0x102033c5>
   a:	07c2                	slli	a5,a5,0x10
   c:	60878793          	addi	a5,a5,1544
  10:	02f50533          	mul	a0,a0,a5
  14:	9161                	srli	a0,a0,0x38
  16:	8082                	ret

33 instructions vs 8 instructions!

And this kind of instructions reducing dramatically improves the
performance of below micro-benchmark:

 $ cat tt.c
 #inlcude <stdio.h>
 #inlcude "word-at-a-time.h" // copy and modify, eg. remove other headers
 int main()
 {
 	int i;
 	unsigned long ret = 0;

	for (i = 0; i < 100000000; i++)
		ret |= find_zero(0xabcd123 + i);

	printf("%ld\n", ret);
 }
 $ gcc -O tt.c
 $ time ./a.out

Per my test, the above micro-benchmark is improved by about 1150%!

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/include/asm/word-at-a-time.h | 30 ++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index 3802cda71ab7..ce04d6a088f6 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -39,9 +39,37 @@ static inline unsigned long create_zero_mask(unsigned long bits)
 	return bits >> 7;
 }
 
+#ifdef CONFIG_64BIT
+/*
+ * Jan Achrenius on G+: microoptimized version of
+ * the simpler "(mask & ONEBYTES) * ONEBYTES >> 56"
+ * that works for the bytemasks without having to
+ * mask them first.
+ */
+static inline long count_masked_bytes(unsigned long mask)
+{
+	return mask*0x0001020304050608ul >> 56;
+}
+
+#else	/* 32-bit case */
+
+/* Carl Chatfield / Jan Achrenius G+ version for 32-bit */
+static inline long count_masked_bytes(long mask)
+{
+	/* (000000 0000ff 00ffff ffffff) -> ( 1 1 2 3 ) */
+	long a = (0x0ff0001+mask) >> 23;
+	/* Fix the 1 for 00 case */
+	return a & mask;
+}
+#endif
+
 static inline unsigned long find_zero(unsigned long mask)
 {
-	return fls64(mask) >> 3;
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
+	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
+		return fls64(mask) >> 3;
+
+	return count_masked_bytes(mask);
 }
 
 /* The mask we created is directly usable as a bytemask */
-- 
2.51.0

