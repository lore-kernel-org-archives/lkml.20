Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036834;
	b=0c3n2p2jX79mURKxSt2McGL2GZUUmKPewfiIq8pRPnW0tBV5LLkjN8zju/5o6SyWz28g
	 ZWmbtH6IUHgb0IPke31oJU6rU4rmVwJK7uFcBBJt6BV9uLCxxdgW4yn6e6dL9qO2absUw
	 NY09aU7wrBGsqI3l809oZT8IhTiOQJCJKfLnklB+DceuL74m8eZrqgTXl/aQxik36SjFT
	 EFURi0sMp2gXaPy70WroHWOisTHiaYF4uGk40j6xJhZM9fnUhTNcBpRbLS8lJRE59IiXH
	 ud/L4FbeGX/2RljgFAseZzMjXiDcon+Mly3Hq/ZQD+6kcqqzkXbSONZdPRRwcnNbI3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036834;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=1o7E6/PEZfnHFqDMeLtzchjTUh2bQgzVUzqTp6fm5lQ=;
	b=Ye07QDnIUbyPPopyDgncFNrBCFQm1VL9mFvA1hZNdJOxXhy7ZfNQYjtk6cOVdAP6xIkZ
	 AJCjzXJqMnsqVsHVIBTRf/OMDLKrADIXEGQjqSBJdUgK9Dq5exZSGJN3yaX70op8ulqP4
	 ha23Qo5xi/Mz8bVzTfI+gf8PeRoh6ZOxcVGAyacCyw3NZbu+pNrzIQFqWTTLbTcbGrhDL
	 Y82/JkC8DbmziVdwGW2j6JLh977z0kj8WtePqD6YR5Bz8iM3uC7vDutQ2ixqlcsHkUTu2
	 zvwnmERJK09QfAcPwuhBJwlVHIoqmkqIk7IW62bm08au6eVUGevCtMIDPbn1uBAXilA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z7pu2Zcw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38030606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 07:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z7pu2Zcw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D261F008A1;
	Sat,  7 Nov 2026 07:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036833;
	bh=1o7E6/PEZfnHFqDMeLtzchjTUh2bQgzVUzqTp6fm5lQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z7pu2ZcwoD9OUreYyHE8HU2dJMBtk1hv8qhGCbK5WFxTzxQ/fCQJIjX/XgtL/Z8ap
	 6WtNwMVARJt+lSBu/3YH8/pFiFLqy8RG2C1/tpgIZgNG3WtpSZb2mpwfAYDn0XEqRI
	 eJt5QT1QhFhprtJqgtS24CZEYz8bAzg5u24ARNVM/SJKCsUXyihBZZNYUD44XxHIkO
	 hg5I19k3iUtXfRrjDCGwQ7fop2m8hCf4FsGkAMJNGnguVofPbfM8ntRTgnpveMAJYg
	 dn3J713D3P9N/DmFjaCxDdpubU2gU9vDBy2vE2bgobq5YuoEYiZOCJf0EfY4KY54e2
	 6i9qnERwrEMZg==
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
Subject: [PATCH 1/4] arm64: percpu: Always inline helpers used by noinstr code
Date: Sat,  7 Nov 2026 15:13:36 +0800
Message-ID: <20261107071339.17467-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261107071339.17467-1-jszhang@kernel.org>
References: <20261107071339.17467-1-jszhang@kernel.org>
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
 arch/arm64/include/asm/percpu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 3cc316091d66..7c344de5052d 100644
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
-- 
2.55.0

