Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794060386;
	b=UH/3N0E+uTOpepXEgpzYsVzQqqpcULdAuOstvVpYj0SDUFpyctl/gI2bjE81pc3qUAv5
	 GKFfMN9zpdFOltZ/5a1gIo+1urIBJjq3XdufZgxcqN6oEKBpQ4xa6BOxKeQtAqyx/JU9D
	 lwgsOWAFu/eEqTNfljTh5a/UuRD933ZwMv6vRhURvdHdPCIjYyxcC9CKkDWFzymxE2ofF
	 3pKDFZN9Mdzv4ScUGUQ/G0WJJP0iMzrCDBBqrA0oS22J2iWzGgwyWjulSSKRvL1xED8KE
	 uVMjuRaQjAcJw3lMu8AL3c4jUwb0zuqwSOuYdbuFgHKs5rbyVPmIcwDoRPXJz909IuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060386;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=r2JBLUn0jLXJkG9RPQb1uAP2LawVO+bKfxaHk5Aygmk=;
	b=VYxIywc5xT3aYq9bRfaFymPBc0nvIjq3JsGgtmMlpcW/nVyVGE5l6l9e5TOyqY5iA9zl
	 ipG7M6tQcRBbTq8pGWdZaVsNmHV2Gi5qS6+C5O4/PshweJbtuPd6+pP/N6dO4ItleWXYL
	 URaQS6SVkv414DGxqiqZX+yNdfQGwmAQwUrttDohcdIu8J8UrwS6x7oO66c6jTjh9Gxhf
	 YrDDE3bjv298k1++pxkpJNResIZN9cld6btdsXaZY20XNWT+iLvjxdTlzTg6QoutwiPgP
	 wp2jBldfTYBqftkI0jFsaJc41sgyRkqq2p3gOYkcZZXSpY3Y6qU0H94n1L3ljVScALQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gdL6mIjZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA74606A33C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gdL6mIjZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF3251F008A3;
	Sat,  7 Nov 2026 14:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794060386;
	bh=r2JBLUn0jLXJkG9RPQb1uAP2LawVO+bKfxaHk5Aygmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gdL6mIjZjGokndDoqF2UJYNhkZKodLgzqdGtJH72GWxOKOpoknPFMM/J7RY0bPAM6
	 Bt4/1sA4pLzc7/3/gW/MSNSZbnqDlUljl1Q+CVRM01qw/7gPUswYmpLwhADQkc4Ckk
	 ahU9WSsNy9ht+OgqQu0Bu53N0s4wLCEDW5/A8CrziPu7KfOHkProWbI7ZPGM9yNVkn
	 QizJNrS36IbbliOUIyQO7PamgKUZ/59Y3AB5DEMdIIKf2NoUq6KaWkxT0bySbqqPjR
	 bs9j9oL2EpbYKxevUhrWx6085VfaX50BNv1RiieeiafK9EhhI2AuHirZG49iOjXQeG
	 xWSQ+0e2Abicw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nam Cao <namcao@linutronix.de>
Subject: [PATCH RESEND v5 1/3] riscv: word-at-a-time: improve find_zero() for !RISCV_ISA_ZBB or no Zbb
Date: Sat,  7 Nov 2026 21:46:11 +0800
Message-ID: <20261107134613.17830-2-jszhang@kernel.org>
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

