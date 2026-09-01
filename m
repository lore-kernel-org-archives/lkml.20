Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68332309EE2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 05:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238820; cv=none; b=DKGm3RoGzndH+GmvDPreAX7ChFkb1CSnytZzo6izoblCHyTtkp4oPHiB0cibTnIqu91ItVgJyA6apDWdFXALyNMx6C+T/fmSiGIeZvfn4987QAzz6dgWzjD4CBR1Rkt8ofXqRRblQ98rQr9qqqEh1UZOhp+vK8eI9KoMk+/anIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238820; c=relaxed/simple;
	bh=QvvHlpNsMHZYg0o05xxg11E/+PQv6nRN4oyH5aP5cos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WAiEKkdVAosWL5RiXmL/iQnJp1pybKuPcZJwEaoOUbLG0f7MWYz4AC56CiTBC6KoGbJScQG18STlUUFbdR/lYwYO3OXJBvAqxzXtNIhLCdn8p8rw/jLh5rNIfkhta+9R3oqeD/O3sOlX8Rdg9buu8aueMp7NkMQZEV77D9prsKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QOhP9NRN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QOhP9NRN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B216E1F000E9;
	Tue,  1 Sep 2026 05:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788238819;
	bh=nhbTlysx2qcUVkxU6t4jsy3LwWNBM53UJ2WzMWwNbCA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QOhP9NRNLVTyN8idbFPMJhE/NPWL7xHmjXnR2lrn3EwaFNcfRU2PSR9D/baB32atB
	 dEeyj/+bx7Wi96PJG2870Nngq8W/rtW2KO6lAAa+vEVTK0lxMNpyYE4sACUg2N1rpE
	 tc2qqJ5GeTaOcMb9ScdpxHqm5qnJzKbNiiMqUGRPVUj3dNOexMG9yOGP8Yzb5ddZCl
	 j82J0NRwuyGisdgf7a/wZawcil19xyrN6xyozqwQyT0lzR3WanCkqF8ls3oYFgRp/x
	 qGuA7SqrBSTsj8VupY31IhjaB1ufeP0/sS/cwpcoxGHpUxsVJs3T4bF8sFi+WOiM/J
	 vx5CdKs35trWw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 1/3] riscv: word-at-a-time: improve find_zero() for !RISCV_ISA_ZBB
Date: Tue,  1 Sep 2026 12:40:29 +0800
Message-ID: <20260901044032.5635-2-jszhang@kernel.org>
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

Current find_zero() heavily depends on fls64() for calculation. This
bring non-optimal code when !RISCV_ISA_ZBB.

But in word-at-a-time case, we don't have to go with fls64() code path,
instead, we can fallback to the generic word-at-a-time implementaion.

What's more, the fls64() brings non-necessary zero bits couting for
RV32. In fact, fls() is enough.

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
---
 arch/riscv/include/asm/word-at-a-time.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index 3802cda71ab7..0c8a9b337f93 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -13,6 +13,9 @@
 #include <linux/bitops.h>
 #include <linux/wordpart.h>
 
+#if !(defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB))
+#include <asm-generic/word-at-a-time.h>
+#else
 struct word_at_a_time {
 	const unsigned long one_bits, high_bits;
 };
@@ -47,6 +50,8 @@ static inline unsigned long find_zero(unsigned long mask)
 /* The mask we created is directly usable as a bytemask */
 #define zero_bytemask(mask) (mask)
 
+#endif /* !(defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)) */
+
 #ifdef CONFIG_DCACHE_WORD_ACCESS
 
 /*
-- 
2.51.0

