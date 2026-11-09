Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794225916;
	b=LPtpba4rm2ih6liH4tZfWX2PzQ+UVS7+IgBvvvkJICLGFV3WiRUw0MgVtQYDr5ZcF+PX
	 65+MydlXs6/jvi0zomRyNbYtCTj7gUe8nz12LqJ96sLCzDriXLCiVgs/yOaf+kheJ7l5F
	 DSJfrgjKElD09Fv6W/733oO2F+xrUCo/WfPDQ7HaT03nhMvsq+O6Px9cccXiY70lVg8TX
	 nReeVty12zHtdrOMDOL6PsOu+EneIEf7OsOFE9/aGczdhMDucUNrpxEDioB0951w/56Uo
	 A2ysfOAvSxRZ2zixAScOatqX/qvp/nlKOayU1DLgxMx4vopqRj21GvQYAmZSF+bTVSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794225916;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=jDLLbZHLdq5MhOPUl4urb8863fHk2vd7x0ssvKzjf2U=;
	b=TW78wyh6Wu3K77TG4n6HmpAAwKkrezuRZc00utJ9+yzrSbm6QNRHOdSc/4kpY1UA3sMR
	 zWsfMK68x+GXsQRzZDZcO8lHrPZHFK/4WkgWGsnRCcjW7qL78djXSupqA+Og8IRH/PsJM
	 up5y7+zNnYni+s03BtECm79ToLzP9BOQPdyDXxunW8bvPTL8ICVHVrfWjwmJyNRBnByqJ
	 FjicNaDk12qavO/sfMQWmKfj1MxtMmMFqZ239vyuoex6rUklD3nSG8ibQHubaEzDbMOHA
	 QtNyIDXWE9R5edaoqm6XaUigZYeJ1OnzbPDYBskGGT+2Um6Z7Utmcyy2bDXju8/UtsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="iJ+/FIiU";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9FB606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iJ+/FIiU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971F71F0089F;
	Mon,  9 Nov 2026 12:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794225916;
	bh=jDLLbZHLdq5MhOPUl4urb8863fHk2vd7x0ssvKzjf2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iJ+/FIiUC1g6XzTjLwnj6XGPzszrze3zAChLy/4ghxYUT53y7oXHv0nPTPwvAGDd5
	 Y2ML8NJnlrYt2lZp4bQfZ32ARA3YddcGThJGF730a17Jssq3jO9mf5T3rqeN5ruouD
	 I4htAztWuwFT3frhnZJXAnfuKlg4bXY90JL9XVxaHJj+vct0XNDnPI4zf3YtG1mpGn
	 zhPx7XO/S6IAh7yCPqhX+GbkiHC3HfeGAdTRO/v6xGl6kmktyB+jqDcv64t5YT/PlR
	 g1Ehsq3Zng0Wl69d6k0yGBCU4B2M4HwE6GcK7zfNgw2LbvPJwJf059sp8iyJorxEQA
	 mOubsFL9yiUBA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Tejun Heo <tj@kernel.org>,
	Dennis Zhou <dennis@kernel.org>,
	Christoph Lameter <cl@gentwo.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org
Subject: [PATCH v2 1/6] arm64: percpu: Always inline helpers used by noinstr code
Date: Mon,  9 Nov 2026 19:44:54 +0800
Message-ID: <20261109114500.20298-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261109114500.20298-1-jszhang@kernel.org>
References: <20261109114500.20298-1-jszhang@kernel.org>
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

The non-instrumentable entry and stack unwinding paths use the per-CPU
offset and read helpers. Plain inline does not guarantee inlining, so
these helpers can be emitted out of line without inheriting the
caller's instrumentation restrictions.

In a GCC build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y,
__kern_my_cpu_offset() was emitted in .text and called from
.noinstr.text.

Mark the per-CPU offset and read helpers __always_inline to keep their
instructions within their callers.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Assisted-by: LLM
---
 arch/arm64/include/asm/percpu.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 3cc316091d66..40a327df41cd 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -23,7 +23,7 @@ static inline void set_my_cpu_offset(unsigned long off)
 			:: "r" (off) : "memory");
 }
 
-static inline unsigned long __hyp_my_cpu_offset(void)
+static __always_inline unsigned long __hyp_my_cpu_offset(void)
 {
 	/*
 	 * Non-VHE hyp code runs with preemption disabled. No need to hazard
@@ -37,7 +37,7 @@ static inline unsigned long __hyp_my_cpu_offset(void)
 		    "mrs " dst ", tpidr_el2",				\
 		       ARM64_HAS_VIRT_HOST_EXTN)
 
-static inline unsigned long __kern_my_cpu_offset(void)
+static __always_inline unsigned long __kern_my_cpu_offset(void)
 {
 	unsigned long off;
 
@@ -129,7 +129,7 @@ static inline unsigned long __kern_my_cpu_offset(void)
 #endif
 
 #define PERCPU_RW_OPS(w, sfx, sz)						\
-static inline unsigned long __percpu_read_##sz(void __percpu *pcp)		\
+static __always_inline unsigned long __percpu_read_##sz(void __percpu *pcp)		\
 {										\
 	u16 *gprs = &current_thread_info()->pcpu_gprs;				\
 	unsigned long off;							\
@@ -149,7 +149,7 @@ static inline unsigned long __percpu_read_##sz(void __percpu *pcp)		\
 	return val;								\
 }										\
 										\
-static inline void __percpu_write_##sz(void __percpu *pcp, unsigned long val)	\
+static __always_inline void __percpu_write_##sz(void __percpu *pcp, unsigned long val) \
 {										\
 	u16 *gprs = &current_thread_info()->pcpu_gprs;				\
 	unsigned long off;							\
@@ -167,7 +167,7 @@ static inline void __percpu_write_##sz(void __percpu *pcp, unsigned long val)	\
 }
 
 #define __PERCPU_OP_CASE(w, sfx, name, sz, op_llsc, op_lse)		\
-static inline void							\
+static __always_inline void					\
 __percpu_##name##_case_##sz(void __percpu *pcp, unsigned long val)	\
 {									\
 	u16 *gprs = &current_thread_info()->pcpu_gprs;			\
@@ -200,7 +200,7 @@ __percpu_##name##_case_##sz(void __percpu *pcp, unsigned long val)	\
 }
 
 #define __PERCPU_RET_OP_CASE(w, sfx, name, sz, op_llsc, op_lse)		\
-static inline u##sz							\
+static __always_inline u##sz					\
 __percpu_##name##_return_case_##sz(void __percpu *pcp, unsigned long val)	\
 {									\
 	u16 *gprs = &current_thread_info()->pcpu_gprs;			\
@@ -270,7 +270,7 @@ PERCPU_RET_OP(add, add, ldadd)
 #undef PERCPU_RET_OP
 
 #define PERCPU_XCHG_OP(w, sfx, sz)					\
-static inline unsigned long						\
+static __always_inline unsigned long				\
 __percpu_xchg_case_##sz(void __percpu *pcp, u##sz val)			\
 {									\
 	u16 *gprs = &current_thread_info()->pcpu_gprs;			\
@@ -307,7 +307,7 @@ __percpu_xchg_case_##sz(void __percpu *pcp, u##sz val)			\
 }
 
 #define PERCPU_CMPXCHG_OP(w, sfx, sz)					\
-static inline unsigned long						\
+static __always_inline unsigned long				\
 __percpu_cmpxchg_case_##sz(void __percpu *pcp,				\
 			   u##sz old,					\
 			   u##sz new)					\
@@ -463,7 +463,7 @@ PERCPU_CMPXCHG_OP(x,  , 64)
 
 #define this_cpu_cmpxchg64(pcp, o, n)	this_cpu_cmpxchg_8(pcp, o, n)
 
-static inline u128
+static __always_inline u128
 __percpu_cmpxchg_128(void __percpu *pcp, u128 old, u128 new)
 {
 	u16 *gprs = &current_thread_info()->pcpu_gprs;
-- 
2.55.0

