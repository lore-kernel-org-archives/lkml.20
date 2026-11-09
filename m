Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794225928;
	b=TGqN3oroAdIE9z/tBHUrreLjTGy5wT/kmXKlm6UQq28whOTegUUrs/BdGSv6lfpx6I7w
	 1u2sHHfMQln55JTpnCSj6dhGq+7c7/FISyxbyzB0zPG2GUl2R4z8CNeBC4S33ftVI5TbP
	 +IQMVEWrGpOSmLvwYCxFMOClS9SlXTvwiOXo3JnOHF8R00TqKmHbe81im1rgUl1kTML8s
	 9L4hJH/NRNrduvrHGccsRyGQ2a53uQcigsRfJKqUNyC5pati8yTrttvyyxKd1YYOTKFe4
	 c4y36w8HcuDVj0h0u0NJuxlO//8X4ug1ukqxT6R9HTz+crdwCH26mbiXocLDpVGKirg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794225928;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=bP0SvI1SyNFWGaznG9wghum5HnnqOxchfJ6Ki1mewRQ=;
	b=KdmiDG/kEM2XLOwOlHbWHc7SshZM14Q6h3qanI2Rl8FFN5aFvNrWrXoB+bOtpI6GSy+i
	 4V5ZncKlSyXJGWT7o8VJPVWjfgudsUPMAOjmZ31Tv9tMzmx3Q//Rtgxy6/2MBbhQxiGJ7
	 CmB63uZlj0W4eYIyCIUV3Q91Zgu2ge9GcW6GuJKSzRCLaACjhpsdQPlqGLPpY7cPUfASs
	 5xXV717jSV33IOcawVs19auDtLxfy+paAuGjrGuy3O0Tkhl+r6N5L2Hw6cyKxPMmyUrxN
	 PFlQOpHGSee6Ct5FkKCiE5JWlsUVqDSsTQTXY6T/NTlmBRXlniPgEY8mkg7rTMtd0Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wi70OnYd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA062606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wi70OnYd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A39FC1F008A2;
	Mon,  9 Nov 2026 12:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794225927;
	bh=bP0SvI1SyNFWGaznG9wghum5HnnqOxchfJ6Ki1mewRQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Wi70OnYdXmU/O5nlE/GYtPpXZc8dZ424yjRjXLwEb6eTHY1K8E+36UyZSllQUnGCB
	 WQkz5zKyd6wqkCbfXFNIXaR1/R90WpjbgNB1/01+YQkDQ2ANmTwfMH+5ifbsMrEb7q
	 GkfDMhHXHhrpxrMVXW/sfzie1Hnru04kpBlgkiSA/Hs4JrAzE+/VqHiCLS+/RKB68+
	 ZEfKMa+J6A2lPZa4UFALIHcd8Q5uR+b9B5Ojdt5CbuDb+VYE0CNOYysFUzkPlusF1Q
	 hJ1tcHpm+kPyQtPHtcNolz6olZ7kUUl4DkKPFuTDs01ql81IZCQfXaj/i0bXkxpndd
	 3/uFwMb3OWb3g==
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
Subject: [PATCH v2 4/6] arm64: stacktrace: Always inline internal stack boundary helpers
Date: Mon,  9 Nov 2026 19:44:57 +0800
Message-ID: <20261109114500.20298-5-jszhang@kernel.org>
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

The noinstr stack walkers reach the stack boundary and frame-record
helpers through an __always_inline call chain. However, these shared
helpers do not themselves guarantee inlining.

With CONFIG_CC_OPTIMIZE_FOR_SIZE=y, GCC emitted several stack
information helpers and unwind_find_stack() out of line in .text.

Mark the shared stack boundary and frame-record helpers
__always_inline to keep their instructions in the non-instrumentable
walkers

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Assisted-by: LLM
---
 arch/arm64/include/asm/stacktrace.h        | 16 ++++++++--------
 arch/arm64/include/asm/stacktrace/common.h | 12 ++++++------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/stacktrace.h b/arch/arm64/include/asm/stacktrace.h
index 6d3280932bf5..b370c0e1e337 100644
--- a/arch/arm64/include/asm/stacktrace.h
+++ b/arch/arm64/include/asm/stacktrace.h
@@ -22,7 +22,7 @@ extern void dump_backtrace(struct pt_regs *regs, struct task_struct *tsk,
 
 DECLARE_PER_CPU(unsigned long *, irq_stack_ptr);
 
-static inline struct stack_info stackinfo_get_irq(void)
+static __always_inline struct stack_info stackinfo_get_irq(void)
 {
 	unsigned long low = (unsigned long)raw_cpu_read(irq_stack_ptr);
 	unsigned long high = low + IRQ_STACK_SIZE;
@@ -33,13 +33,13 @@ static inline struct stack_info stackinfo_get_irq(void)
 	};
 }
 
-static inline bool on_irq_stack(unsigned long sp, unsigned long size)
+static __always_inline bool on_irq_stack(unsigned long sp, unsigned long size)
 {
 	struct stack_info info = stackinfo_get_irq();
 	return stackinfo_on_stack(&info, sp, size);
 }
 
-static inline struct stack_info stackinfo_get_task(const struct task_struct *tsk)
+static __always_inline struct stack_info stackinfo_get_task(const struct task_struct *tsk)
 {
 	unsigned long low = (unsigned long)task_stack_page(tsk);
 	unsigned long high = low + THREAD_SIZE;
@@ -50,7 +50,7 @@ static inline struct stack_info stackinfo_get_task(const struct task_struct *tsk
 	};
 }
 
-static inline bool on_task_stack(const struct task_struct *tsk,
+static __always_inline bool on_task_stack(const struct task_struct *tsk,
 				 unsigned long sp, unsigned long size)
 {
 	struct stack_info info = stackinfo_get_task(tsk);
@@ -61,7 +61,7 @@ static inline bool on_task_stack(const struct task_struct *tsk,
 
 DECLARE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)], overflow_stack);
 
-static inline struct stack_info stackinfo_get_overflow(void)
+static __always_inline struct stack_info stackinfo_get_overflow(void)
 {
 	unsigned long low = (unsigned long)raw_cpu_ptr(overflow_stack);
 	unsigned long high = low + OVERFLOW_STACK_SIZE;
@@ -76,7 +76,7 @@ static inline struct stack_info stackinfo_get_overflow(void)
 DECLARE_PER_CPU(unsigned long *, sdei_stack_normal_ptr);
 DECLARE_PER_CPU(unsigned long *, sdei_stack_critical_ptr);
 
-static inline struct stack_info stackinfo_get_sdei_normal(void)
+static __always_inline struct stack_info stackinfo_get_sdei_normal(void)
 {
 	unsigned long low = (unsigned long)raw_cpu_read(sdei_stack_normal_ptr);
 	unsigned long high = low + SDEI_STACK_SIZE;
@@ -87,7 +87,7 @@ static inline struct stack_info stackinfo_get_sdei_normal(void)
 	};
 }
 
-static inline struct stack_info stackinfo_get_sdei_critical(void)
+static __always_inline struct stack_info stackinfo_get_sdei_critical(void)
 {
 	unsigned long low = (unsigned long)raw_cpu_read(sdei_stack_critical_ptr);
 	unsigned long high = low + SDEI_STACK_SIZE;
@@ -105,7 +105,7 @@ static inline struct stack_info stackinfo_get_sdei_critical(void)
 #ifdef CONFIG_EFI
 extern u64 *efi_rt_stack_top;
 
-static inline struct stack_info stackinfo_get_efi(void)
+static __always_inline struct stack_info stackinfo_get_efi(void)
 {
 	unsigned long high = (u64)efi_rt_stack_top;
 	unsigned long low = high - THREAD_SIZE;
diff --git a/arch/arm64/include/asm/stacktrace/common.h b/arch/arm64/include/asm/stacktrace/common.h
index 821a8fdd31af..7c502ae276b9 100644
--- a/arch/arm64/include/asm/stacktrace/common.h
+++ b/arch/arm64/include/asm/stacktrace/common.h
@@ -35,7 +35,7 @@ struct unwind_state {
 	int nr_stacks;
 };
 
-static inline struct stack_info stackinfo_get_unknown(void)
+static __always_inline struct stack_info stackinfo_get_unknown(void)
 {
 	return (struct stack_info) {
 		.low = 0,
@@ -43,7 +43,7 @@ static inline struct stack_info stackinfo_get_unknown(void)
 	};
 }
 
-static inline bool stackinfo_on_stack(const struct stack_info *info,
+static __always_inline bool stackinfo_on_stack(const struct stack_info *info,
 				      unsigned long sp, unsigned long size)
 {
 	if (!info->low)
@@ -55,7 +55,7 @@ static inline bool stackinfo_on_stack(const struct stack_info *info,
 	return true;
 }
 
-static inline void unwind_init_common(struct unwind_state *state)
+static __always_inline void unwind_init_common(struct unwind_state *state)
 {
 	state->stack = stackinfo_get_unknown();
 }
@@ -70,7 +70,7 @@ static inline void unwind_init_common(struct unwind_state *state)
  *
  * Return: a pointer to the relevant stack_info if found; NULL otherwise.
  */
-static struct stack_info *unwind_find_stack(struct unwind_state *state,
+static __always_inline struct stack_info *unwind_find_stack(struct unwind_state *state,
 					    unsigned long sp,
 					    unsigned long size)
 {
@@ -99,7 +99,7 @@ static struct stack_info *unwind_find_stack(struct unwind_state *state,
  *
  * Return: 0 upon success, an error code otherwise.
  */
-static inline void unwind_consume_stack(struct unwind_state *state,
+static __always_inline void unwind_consume_stack(struct unwind_state *state,
 					struct stack_info *info,
 					unsigned long sp,
 					unsigned long size)
@@ -142,7 +142,7 @@ static inline void unwind_consume_stack(struct unwind_state *state,
  *
  * Return: 0 upon success, an error code otherwise.
  */
-static inline int
+static __always_inline int
 unwind_next_frame_record(struct unwind_state *state)
 {
 	struct stack_info *info;
-- 
2.55.0

