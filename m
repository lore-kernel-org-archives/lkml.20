Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF934F5DF7
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790960375; cv=none; b=YOiEmXQkfhfVIas4ppCCNm2ntiNf8GjlpKUL2ku3YLfc/zk1FtLvHDcFBBdOi79z3lFX716IkkEmOCA1qJQO9bZq0pvsdo60oMKrTF0ESsATX14ZhsxWWks+xJVUrvObqBkrNFqY97sU9kGvH0AhrxiqsM1T7kNLPsvG1TJQNdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790960375; c=relaxed/simple;
	bh=gYrirgYnQ9XMIy1Vtf1rvX6MFIAi0FdUABXR87b9c3A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N0WV8HX6Hg8LFHrnjUksQQ+OUwnpRmvuLhqNpcXVovJ6wbo/fpq86KoRjDUoX0PW/p5I5qLojVG/OJrrnkHwM8umZ+w7aHy+dOEQhUH0V5tV4WL2jpR/GOeWkOhxiF3vT1FN6Z93DWKYXDon4XosDMO/dk0uca6WTrO9KwsdTv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=b/nw7cc8; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="b/nw7cc8"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebcb8d7so1962348a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790960373; x=1791565173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YwgXqw+/KPKoTG01IpAwkiOh262ZlS4PFU+UVMlRK44=;
        b=b/nw7cc8uNGCvI4Jag73Un/y4EAr4GRmglJ6yizzW/p89c3UvM8w6rVDpM0paBT/Q1
         uHkLp4+tB1s9/PuzfYEcmdXhkBkkUAc2fLYYqPWrhG8Cb0ldoGAfy8PW1v9eLjmaV/0j
         KNVhajn/ODFbej80bp+x2nwwYiOVD5vHlPO0473yQ94vDTv7zdBg0vydnsZZFuxy0g29
         ITx9VSHeLGW3wtmSWeq3qTc5UOdjOnRCfXAPV5huoP1HB/F9LXSuZT/K6K/BAoJhxQGl
         YEG/lVluNz0+i1MqntMzce77ZOQsuvWFcqkKb3v9XzhKjv+CKrj5oprXDXXVPi0zbkyg
         s1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790960373; x=1791565173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YwgXqw+/KPKoTG01IpAwkiOh262ZlS4PFU+UVMlRK44=;
        b=ZcqR6AmFHH8Qd56wmuzZKEqbXvw9sFRsssL14yD90xvTjFL02Mau1e6F7akB4/lPrO
         VS7fN9aRg01Udyic+BNw1+ExiAMPi6egWRd/XMK0w7awAWZtKVHYXKpKskbQaLjpTlKx
         6mmHMUW43iJSUpMeUyks4BgGZgVMJByl6p2lHJNH5Hqb/tEy7zCWJPsXd8I/ynfuNBZJ
         bb3UF2WyDh9erV3QtcZ4F1QF1quOhUqgMTei90/Xp/5+z1ZX6t9c5zPo7cHWA5EX+SLh
         zuLFw3FMVAUeVaCZvN9d9zYGZ/WoA04o8dfteRMdp/qEeMIZpYf0ZEpNiPiC1ZlGCxEx
         +OhA==
X-Gm-Message-State: AFq9FYLD9l1KeH26s058ny3b+R+VW7qSTzwtdTPF7jq2O7o6UAjBGUEb
	0qSsniuQ2aUgLBSeZN+J9Jhnu0D8UNuLMTspfpkEHkLKmNo4FCNbTFnrRBoqKimwc7o=
X-Gm-Gg: AYBFou2r9y++WoDkVBS/dK9+3aRNIGsyTx0Y1npx/3sg+GUiakPGW+dgk6B2Lw9imE0
	zCa3X0gFSKG9A6Yu0c75lDP0hm6e6YOGAF7IRzB5b3HyvfKKyXZ4YHwUbimbe0Y5goqcLT/QpZX
	vsMgEY2TRBPmcKd4w105oSx9JS900m6vSy+e1Iiaq/ZxR1XtDz2B5lIVIyNu8iRMRn0THjmfPMO
	Bz/43AMsSylmFSuLsszbT++uSrzgtOgRC96VJQTkE8Jn6mApBeo8i6wmexrYB0DJJGeUHfl14Gt
	nfpXIWcKrAlIE6jIaJ+1BIuHO29geRsr3nLG89ktb2H8C75KLZZwoyny6Zw+FcQrlNV67hew9e1
	RX81KqlU8BqDwM77nLZpC6Fz+94bdgyY5i16CjPL9HVWAtW8qz5+20XQO3FxQxdVa/lMXzkaAaD
	I7ZHIbo1Y1Y/EVOXSqq6D3VkHLl7wcErhOwUQD7vGn5t9RolfKkQjNbi4myptkYrzigCdWunPhr
	czGBb4UuvBKTotPNw==
X-Received: by 2002:a17:90b:134c:b0:3a0:eec6:b065 with SMTP id 98e67ed59e1d1-3a6ce97cf78mr1833682a91.13.1790960372758;
        Fri, 02 Oct 2026 09:59:32 -0700 (PDT)
Received: from n37-012-226.byted.org ([115.190.40.12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd5d88bbsm4900871a91.12.2026.10.02.09.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:59:32 -0700 (PDT)
From: Qingwei Hu <qingwei.hu@bytedance.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Gary Guo <gary@garyguo.net>,
	Andrea Parri <parri.andrea@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Qingwei Hu <qingwei.hu@bytedance.com>
Subject: [PATCH v5 2/5] riscv: Apply Zalasr to smp_load_acquire/smp_store_release
Date: Sat,  3 Oct 2026 00:59:07 +0800
Message-Id: <20261002165910.3818940-3-qingwei.hu@bytedance.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261002165910.3818940-1-qingwei.hu@bytedance.com>
References: <20261002165910.3818940-1-qingwei.hu@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Xu Lu <luxu.kernel@bytedance.com>

Replace fence instructions with Zalasr instructions during
smp_load_acquire() and smp_store_release() operations.

|----------------------------------|
|    |     __smp_store_release     |
|    |-----------------------------|
|    | zalasr        | !zalasr     |
| rl |-----------------------------|
|    | s{b|h|w|d}.rl | fence rw, w |
|    |               | s{b|h|w|d}  |
|----------------------------------|
|    |    __smp_load_acquire       |
|    |-----------------------------|
|    | zalasr        | !zalasr     |
| aq |-----------------------------|
|    | l{b|h|w|d}.aq | l{b|h|w|d}  |
|    |               | fence r, rw |
|----------------------------------|

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
Co-developed-by: Qingwei Hu <qingwei.hu@bytedance.com>
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 arch/riscv/include/asm/barrier.h | 78 ++++++++++++++++++++++++++++----
 1 file changed, 69 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index 51a73712b6a12..d2200e826ec00 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -13,6 +13,7 @@
 #ifndef __ASSEMBLER__
 #include <asm/cmpxchg.h>
 #include <asm/fence.h>
+#include <asm/insn-def.h>
 
 /* These barriers need to enforce ordering on both devices or memory. */
 #define __mb()		RISCV_FENCE(iorw, iorw)
@@ -53,21 +54,80 @@
 
 #define __smp_store_release(p, v)					\
 do {									\
+	typeof(p) __p = (p);						\
+	union { __unqual_scalar_typeof(*p) __val; char __c[1]; } __u =	\
+		{ .__val = (__force __unqual_scalar_typeof(*p)) (v) };	\
 	compiletime_assert_atomic_type(*p);				\
-	__asm__ __volatile__(RISCV_ZALASR_ALTERNATIVE(			\
-		RISCV_FENCE_ASM(rw, w), RISCV_FENCE_ASM(rw, rw))	\
-		::: "memory");						\
-	WRITE_ONCE(*p, v);						\
+	kasan_check_write(__p, sizeof(*p));				\
+	switch (sizeof(*p)) {						\
+	case 1:								\
+		asm volatile(RISCV_ZALASR_ALTERNATIVE(			\
+			RISCV_FENCE_ASM(rw, w) "sb %0, 0(%1)\n",	\
+			SB_RL(%0, %1) "\n" __nops(1))			\
+			: : "r" (*(__u8 *)__u.__c), "r" (__p)		\
+			: "memory");					\
+		break;							\
+	case 2:								\
+		asm volatile(RISCV_ZALASR_ALTERNATIVE(			\
+			RISCV_FENCE_ASM(rw, w) "sh %0, 0(%1)\n",	\
+			SH_RL(%0, %1) "\n" __nops(1))			\
+			: : "r" (*(__u16 *)__u.__c), "r" (__p)	\
+			: "memory");					\
+		break;							\
+	case 4:								\
+		asm volatile(RISCV_ZALASR_ALTERNATIVE(			\
+			RISCV_FENCE_ASM(rw, w) "sw %0, 0(%1)\n",	\
+			SW_RL(%0, %1) "\n" __nops(1))			\
+			: : "r" (*(__u32 *)__u.__c), "r" (__p)	\
+			: "memory");					\
+		break;							\
+	case 8:								\
+		asm volatile(RISCV_ZALASR_ALTERNATIVE(			\
+			RISCV_FENCE_ASM(rw, w) "sd %0, 0(%1)\n",	\
+			SD_RL(%0, %1) "\n" __nops(1))			\
+			: : "r" (*(__u64 *)__u.__c), "r" (__p)	\
+			: "memory");					\
+		break;							\
+	}								\
 } while (0)
 
 #define __smp_load_acquire(p)						\
 ({									\
-	typeof(*p) ___p1 = READ_ONCE(*p);				\
+	union { __unqual_scalar_typeof(*p) __val; char __c[1]; } __u;	\
+	typeof(p) __p = (p);						\
 	compiletime_assert_atomic_type(*p);				\
-	__asm__ __volatile__(RISCV_ZALASR_ALTERNATIVE(			\
-		RISCV_FENCE_ASM(r, rw), RISCV_FENCE_ASM(rw, rw))	\
-		::: "memory");						\
-	___p1;								\
+	kasan_check_read(__p, sizeof(*p));				\
+	switch (sizeof(*p)) {						\
+	case 1:								\
+		asm volatile(RISCV_ZALASR_ALTERNATIVE(			\
+			"lb %0, 0(%1)\n" RISCV_FENCE_ASM(r, rw),	\
+			LB_AQ(%0, %1) "\n" __nops(1))			\
+			: "=r" (*(__u8 *)__u.__c) : "r" (__p)		\
+			: "memory");					\
+		break;							\
+	case 2:								\
+		asm volatile(RISCV_ZALASR_ALTERNATIVE(			\
+			"lh %0, 0(%1)\n" RISCV_FENCE_ASM(r, rw),	\
+			LH_AQ(%0, %1) "\n" __nops(1))			\
+			: "=r" (*(__u16 *)__u.__c) : "r" (__p)	\
+			: "memory");					\
+		break;							\
+	case 4:								\
+		asm volatile(RISCV_ZALASR_ALTERNATIVE(			\
+			"lw %0, 0(%1)\n" RISCV_FENCE_ASM(r, rw),	\
+			LW_AQ(%0, %1) "\n" __nops(1))			\
+			: "=r" (*(__u32 *)__u.__c) : "r" (__p)	\
+			: "memory");					\
+		break;							\
+	case 8:								\
+		asm volatile(RISCV_ZALASR_ALTERNATIVE(			\
+			"ld %0, 0(%1)\n" RISCV_FENCE_ASM(r, rw),	\
+			LD_AQ(%0, %1) "\n" __nops(1))			\
+			: "=r" (*(__u64 *)__u.__c) : "r" (__p)	\
+			: "memory");					\
+		break;							\
+	}								\
+	(typeof(*p))__u.__val;						\
 })
 
 #ifdef CONFIG_RISCV_ISA_ZAWRS
-- 
2.39.5

