Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5449D4F7CD4
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790960369; cv=none; b=M4Ocl2oy2rQrBYbVuK90TJZdA1Ajo4XIvwYHDnElupo54yQkLqNzf97yDyDXEo4AZ9e6/cIM0slT4h7ZhpTLOb8/oDcEZu0vaIFJN+4ulYBIpfAvMhjYzyi2WeCZyBDDhqHNuwUVRfqjvJnKsvUz0O9b2MeCndBaCCcOc3LsSC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790960369; c=relaxed/simple;
	bh=yHVY1lRaH33QP1FUrFobus6B4Ie7w7iE60Bw4WY/Ta0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HUsk1gawoTwVvV+bH69KKXNJouzoZ4gA++s+sGJ98BY+m2ROioJla9B3oP3o5MlKe5susXxxSxwdhi5JV5iFRr2ycLakQjddmDImSExqpUi8EKP+vwe5/Hi9nRrnaF8ovGnCXuXX9G4gqlct15OHhfN4X/uuNJi/LhPILoaCKg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=jhtwRXJH; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="jhtwRXJH"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so109140a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790960367; x=1791565167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/KecXxzmarKjPHcGWecVVcSwGLZFLihD2GXEEcgxEQQ=;
        b=jhtwRXJHixQbzQ6X48mFjYuCokygK9+6J5wZWr7WzqnzkTQPBD0MSFPnoShncukXZF
         EWa/A6NWau2ceKqObSbwezIsQwJzYQ6cFB4qx6F+vbNL442ExRGyXVpVOFNcb8z6vzBr
         YlJ8muwu3qogNACQT6llNlMxWW2SI3F42tsdfdZ0+6O6Y2y2DD3FiUYng5hjtEHBwizQ
         i5Ahgy3j8WhvCQjZAs4jLnNRylxxJley1mWKL87IFo0Ofp2+W/lVpzO4opDuQTlf+X2Z
         w+eQax7BAmxytpPv4z3IYkToJAf2uqbgL+Icwe5A8wlTt2TgEnx4sy/eTWSnNuzxGlHN
         7ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790960367; x=1791565167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/KecXxzmarKjPHcGWecVVcSwGLZFLihD2GXEEcgxEQQ=;
        b=r7ImyKdbCoEZiZrLKuKgHrWxDWE2qiWBcA+uoLkLf0HlSli0uqtHDfJukFH4EXZx7T
         FmkYic6ms8H794dx0uTRxYAG5qy8ivBr6LMBEwSOUXLu/rF1i3rP1HeYxYg3T8ld+G6M
         djNTQ13ckKu2aFX5Irl7CCt3vW8FiN2gfcpfabEyH2Sc8f6pbBEzjf452NJR2R+sy2f3
         jDJo2NVBhYoKym/V4uLJU9W+NTGPfDiEkQ7kBDHNZhMukPvhpHUWHeUo09H3QjG79xPg
         uLDBRwtIFw+hyfh7pujB4e+/nHPqHLltaucsEJt1sPrJMNS4ZvW8LNNxSFpP9FpLA93y
         iUmA==
X-Gm-Message-State: AFq9FYJEh51h6ZRXCX3elBh0u5dwG5ygvVchs2DxPVOu5zBtF8UU5otw
	9vdxABgPA13oOhcS+x4/rIA8oTtJJZN2erVs8XPCwQhoYJxb609mzDZI7lul8FKIv2k=
X-Gm-Gg: AYBFou3n3yHmzZq/7TpTfHlHbahYA5m8FRFf7BYlYuV/zVdxi2NvoQs72eIoMMOqd1d
	JevQemlA8ZT9BEeyyV80qogiCJp5+crfcVvR8TA9CJeEDTHeM5LrvKg4eHhmLgJfkzUALQFvFVs
	BEHbOLwMRnnHkIwuRYh5TjtGOF8CiP7KmF2rBZgczq+mv/TuvlpReGLvxiYz7imQ3YJyubzqgnB
	TdNaiQTEA40lDld49cRXww9Gj0tkvThAZv7ZhK22JpP02WmAhPDt7bZD8kMI9tgi3ClEP6XRQ9a
	furlTmsCZEN393MMlPVSPPmUP4OrHTomgtQjgZ9akIjN6HhNWJBCvx+zZtbkF1XpZWT6GlvH/UQ
	jembOw8rL1m4eJrb78wPGKD1ITOGFT3H/9ReUdZYp7+ZqxJQ4QSz5ocyUU4sl24zlkkhJX+sz3C
	TEXCZd+waT/TohUUq/wmjw6eUlsRWv57eFZKLt4iDGBEJIt7hk8dE7sFCllPdcm9ZnR/Pdv0JlI
	ezuVQ1qYDSjlk/IaQ==
X-Received: by 2002:a17:90b:3a0f:b0:3a4:d476:e10c with SMTP id 98e67ed59e1d1-3a6ce79667amr2617795a91.28.1790960366557;
        Fri, 02 Oct 2026 09:59:26 -0700 (PDT)
Received: from n37-012-226.byted.org ([115.190.40.12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd5d88bbsm4900871a91.12.2026.10.02.09.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:59:26 -0700 (PDT)
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
Subject: [PATCH v5 1/5] riscv: Strengthen fallback barriers with Zalasr
Date: Sat,  3 Oct 2026 00:59:06 +0800
Message-Id: <20261002165910.3818940-2-qingwei.hu@bytedance.com>
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

RISC-V acquire and release primitives currently use directional fences
around plain loads, stores, and relaxed atomic operations. Later changes
can use Zalasr acquire and release annotations instead. Mixing the two
mappings needs a full fence on the fence-based side to retain the RCsc
guarantees expected by the Linux memory model.

Before introducing annotated operations, use alternatives to upgrade the
remaining directional fences in load/store, xchg/cmpxchg, and generic
atomic fallbacks on Zalasr systems. Keep the existing fences when Zalasr
is unavailable.

Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 arch/riscv/include/asm/atomic.h  |  8 ++++++--
 arch/riscv/include/asm/barrier.h |  8 ++++++--
 arch/riscv/include/asm/cmpxchg.h | 25 +++++++++++++++++++------
 arch/riscv/include/asm/fence.h   |  9 +++++++++
 4 files changed, 40 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 616b8b332ac56..03d477a65dc6e 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -19,10 +19,14 @@
 #include <asm/cmpxchg.h>
 
 #define __atomic_acquire_fence()					\
-	__asm__ __volatile__(RISCV_ACQUIRE_BARRIER "" ::: "memory")
+	__asm__ __volatile__(RISCV_ZALASR_SMP_ALTERNATIVE(		\
+		RISCV_ACQUIRE_BARRIER, RISCV_FULL_BARRIER)		\
+		::: "memory")
 
 #define __atomic_release_fence()					\
-	__asm__ __volatile__(RISCV_RELEASE_BARRIER "" ::: "memory");
+	__asm__ __volatile__(RISCV_ZALASR_SMP_ALTERNATIVE(		\
+		RISCV_RELEASE_BARRIER, RISCV_FULL_BARRIER)		\
+		::: "memory");
 
 static __always_inline int arch_atomic_read(const atomic_t *v)
 {
diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index 700ba3f922cb5..51a73712b6a12 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -54,7 +54,9 @@
 #define __smp_store_release(p, v)					\
 do {									\
 	compiletime_assert_atomic_type(*p);				\
-	RISCV_FENCE(rw, w);						\
+	__asm__ __volatile__(RISCV_ZALASR_ALTERNATIVE(			\
+		RISCV_FENCE_ASM(rw, w), RISCV_FENCE_ASM(rw, rw))	\
+		::: "memory");						\
 	WRITE_ONCE(*p, v);						\
 } while (0)
 
@@ -62,7 +64,9 @@ do {									\
 ({									\
 	typeof(*p) ___p1 = READ_ONCE(*p);				\
 	compiletime_assert_atomic_type(*p);				\
-	RISCV_FENCE(r, rw);						\
+	__asm__ __volatile__(RISCV_ZALASR_ALTERNATIVE(			\
+		RISCV_FENCE_ASM(r, rw), RISCV_FENCE_ASM(rw, rw))	\
+		::: "memory");						\
 	___p1;								\
 })
 
diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 662e160b05229..39f8195c9fd6c 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -105,10 +105,15 @@
 
 #define arch_xchg_acquire(ptr, x)					\
 	_arch_xchg(ptr, x, "", "", "",					\
-		   RISCV_ACQUIRE_BARRIER, RISCV_ACQUIRE_BARRIER)
+		   RISCV_ZALASR_SMP_ALTERNATIVE(			\
+			RISCV_ACQUIRE_BARRIER, RISCV_FULL_BARRIER),	\
+		   RISCV_ZALASR_SMP_ALTERNATIVE(			\
+			RISCV_ACQUIRE_BARRIER, RISCV_FULL_BARRIER))
 
 #define arch_xchg_release(ptr, x)					\
-	_arch_xchg(ptr, x, "", "", RISCV_RELEASE_BARRIER, "", "")
+	_arch_xchg(ptr, x, "", "",					\
+		   RISCV_ZALASR_SMP_ALTERNATIVE(			\
+			RISCV_RELEASE_BARRIER, RISCV_FULL_BARRIER), "", "")
 
 #define arch_xchg(ptr, x)						\
 	_arch_xchg(ptr, x, ".rl", ".aqrl", "", RISCV_FULL_BARRIER, "")
@@ -279,14 +284,22 @@
 #define arch_cmpxchg_acquire(ptr, o, n)					\
 	_arch_cmpxchg((ptr), (o), (n),					\
 		      SC_SFX(""), CAS_SFX(""),				\
-		      SC_PREPEND(""), SC_APPEND(RISCV_ACQUIRE_BARRIER),	\
-		      CAS_PREPEND(""), CAS_APPEND(RISCV_ACQUIRE_BARRIER))
+		      SC_PREPEND(""), SC_APPEND(			\
+			RISCV_ZALASR_SMP_ALTERNATIVE(			\
+				RISCV_ACQUIRE_BARRIER, RISCV_FULL_BARRIER)), \
+		      CAS_PREPEND(""), CAS_APPEND(			\
+			RISCV_ZALASR_SMP_ALTERNATIVE(			\
+				RISCV_ACQUIRE_BARRIER, RISCV_FULL_BARRIER)))
 
 #define arch_cmpxchg_release(ptr, o, n)					\
 	_arch_cmpxchg((ptr), (o), (n),					\
 		      SC_SFX(""), CAS_SFX(""),				\
-		      SC_PREPEND(RISCV_RELEASE_BARRIER), SC_APPEND(""),	\
-		      CAS_PREPEND(RISCV_RELEASE_BARRIER), CAS_APPEND(""))
+		      SC_PREPEND(RISCV_ZALASR_SMP_ALTERNATIVE(		\
+			RISCV_RELEASE_BARRIER, RISCV_FULL_BARRIER)),	\
+		      SC_APPEND(""),					\
+		      CAS_PREPEND(RISCV_ZALASR_SMP_ALTERNATIVE(	\
+			RISCV_RELEASE_BARRIER, RISCV_FULL_BARRIER)),	\
+		      CAS_APPEND(""))
 
 #define arch_cmpxchg(ptr, o, n)						\
 	_arch_cmpxchg((ptr), (o), (n),					\
diff --git a/arch/riscv/include/asm/fence.h b/arch/riscv/include/asm/fence.h
index 182db7930edc2..607f56c9b8516 100644
--- a/arch/riscv/include/asm/fence.h
+++ b/arch/riscv/include/asm/fence.h
@@ -2,6 +2,15 @@
 #ifndef _ASM_RISCV_FENCE_H
 #define _ASM_RISCV_FENCE_H
 
+#include <asm/alternative-macros.h>
+#include <asm/hwcap.h>
+
+#define RISCV_ZALASR_ALTERNATIVE(old, new) \
+	ALTERNATIVE(old, new, 0, RISCV_ISA_EXT_ZALASR, 1)
+
+#define RISCV_ZALASR_SMP_ALTERNATIVE(old, new) \
+	ALTERNATIVE(old, new, 0, RISCV_ISA_EXT_ZALASR, CONFIG_SMP)
+
 #define RISCV_FENCE_ASM(p, s)		"\tfence " #p "," #s "\n"
 #define RISCV_FENCE(p, s) \
 	({ __asm__ __volatile__ (RISCV_FENCE_ASM(p, s) : : : "memory"); })
-- 
2.39.5

