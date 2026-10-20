Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792520387;
	b=ThBDVR1o9K+WuzRyumv5MB52VdpBlPa5tJ6C+mT+L97eHTdxYiIUkj80s/L1Vf17gaNq
	 k06NkOQQedm8G9bd25lkvBXk9UMCgJk0VGNeOw5FIjTraFtxxCETocW0GI9GBsvFsbMHQ
	 jbLcJqFlExWRhwMYMOkt04II/XRNYd+jBL1WF+iLFWCNNd8p7FnbuakLkkV0vCWK68Cxw
	 6vBACnHcypmV4DlmkJEfPFZ+ZY7ogayVwdqJAnqbFmelHZBzZuqEvzKrPTIgdr4Kc3KEQ
	 GPKul8mrZksjMO0RcEkHNBO/KRKJ31T3z6G0jt41s9P7asrmEsLw6SewzWZKKZl1wbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=xOHuMA/WM9xuTdSj+ZDzOAw3l3xrB59FAR7IgfJil6U=;
	b=ZQ0/UytBmYfa9dWkp9XMq3unldFdGsWb1JIuDIS6rgqG81ZxMlcahmkJiGEgcSHwqNk1
	 xRq62f6I3MiEpoiO5LEuXXCvhCSB68c62wr3tdi0GQOJrXpS+z09AY9bAVrK6gUyDVpYQ
	 MNaXEL380YNv4aFgXv80ciLRtLdGvPUINaEsAz4gGYcsc8ELxTnA3G/qGS/A6MpO6yZ+Z
	 lVA99Pnj/zJDwgQRXrYCU2kJo8lteBQp+fU5IjNNJOUG7Pd1Bu0udpWtcf221q9iep6BU
	 ikOYnGRijeZh9Y6zgcc0aw/TVCZHpsII6CW4s6n6vW5m9j8W6GlNP10YWQf6qHs3WCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hErdiEsh;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54DE60A5BD7
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B54DE60A5BD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hErdiEsh
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-353804b591eso6666789eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792520386; x=1793125186; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xOHuMA/WM9xuTdSj+ZDzOAw3l3xrB59FAR7IgfJil6U=;
        b=hErdiEshqyyBX6eVApdQ4fgl8tgxFrBg2fPzMCcUXEqup6Sb4E12WO7BQ/6LGW0Edc
         eHy7b+xfCUMM32M6Nrb4GgoX7RLF2cIgR51c55M1wjPudfozchhazJ2grV4umIAOqzas
         YgJdoiOTwSTPo23AzTYk520o6YssvURQ3zvZ+uFaQFIfotJQCBhfDmPhQ4Cv4IQnsYai
         dI9Z+dxxsYjZfkjvEjSwSurXTtOekkhfMkAFd1AHIrihHTQhwAGyxSraE1+ekBOaknCP
         O56DsJTsisobk9t82Zp+LYjpGyBGbEy5JuLJVxW16x0j+sTGOXXeyR62jwb6hYpuxOly
         IM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520386; x=1793125186;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xOHuMA/WM9xuTdSj+ZDzOAw3l3xrB59FAR7IgfJil6U=;
        b=IO5Dk85QKdtGdOoCJVH4jcEEe4KrRj243Uhnmu9fip9vV35JKBYmEY44ZTHLk3sdO1
         ynwQ/meNKVcuD61Xhz6pD6r3vkT6JtuQKdKh5zUbn5khFMHiguU3HQTkSR8NMfut9yWL
         U1WNRqzcM5o1Ec4vVn0cV++ypU34Y51uFRZOxtRhhZd8rsUxCS17qWGLRiNZFvw0ydQy
         /pZ6Cj1TuUTvpV6r8iAFUhIXypNcbFx+IynWx3EpwAKKojCIv2cJFFY9RoacdA4M2WVd
         u2VwIrD0dkg0+LYN5gUr8PGLW5Fb4PDFfLNPJB+Ja9xqavHZsXNUDfM1a+in6nntcQ8C
         xy/g==
X-Gm-Message-State: AFq9FYL53PHJAOAIVq7FKIgbp366gGsVJTeP/R4a9HYg3DodWfuS3l/u
	w1i6YNPUWWHFulzSdcUHFFJYDsWW8+o8VqsjsgLPmGVVviNtDfzzN0X+
X-Gm-Gg: AYBFou0EUUCWYKDiLO7Gzvi4+YGk28T8E1ld2tgqj2ltGsaXs4T9T0AYZAVzDUSVy0N
	1giXjvHVmP59Q4lPpYNlDqRUsh4IokOSz/URPdEtEa5oqzVYh4IChqKh6ztak3C00oVzNZkSauZ
	MbdAa3hHbHigMqY9+VIplt9ATw4QgN6egl6pTrypeo/2bLEfYSJzIAqr/X05p3v0LxHph0T4JLL
	Lq9VSwsU9kbbf0PJX+SbawaUAnsntjjZeE2Kcu6Hwzn+l5S51MZAA85kMRbOgPbLScKY3jtp5i0
	HbjtybiC2dAJzThmIibDnScpcyHZX8uGg4boOq2kF5U4DJCrW/oLz5R07yiQ29tu4Nvr94A6kbS
	N7GDbm7Ze3DazYs3VNVgJ9a9ViDtL7dl9KtvJ00LhQcjX99oAqS+OfVZyIcuWoGVw3mOYLeGnHN
	l83+QiQbiWbZTHVb7seau3+2RGubk5TbwUy2DvwQQ9oqgQr4nYGTI3885RjpGUmR9N
X-Received: by 2002:a05:693c:65cc:b0:35c:99e1:c755 with SMTP id 5a478bee46e88-3674e355183mr55514eec.38.1792520385832;
        Tue, 20 Oct 2026 11:19:45 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm523728eec.2.2026.10.20.11.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:19:45 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/4] arm64/gcs: release GCS on failed fork
Date: Tue, 20 Oct 2026 15:19:30 -0300
Message-ID: <8522b8d3d3ecda7474d0af8b8517c1f5d708ecc2.1792519121.git.ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792519121.git.ivanrwcm25@gmail.com>
References: <cover.1792519121.git.ivanrwcm25@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

copy_thread() maps a GCS for a CLONE_VM child and can still return
0. A later copy_process() failure then goes through
bad_fork_cleanup_thread, which calls exit_thread(). The hole this
series hits is clone3(CLONE_VM|CLONE_PIDFD) when put_user() of the
pidfd fails after that mapping. arm64 did not implement
exit_thread(). deactivate_mm() is what normally calls gcs_free(),
and it does not run on this path. Each rejected clone leaves one
GCS VMA in the parent's mm until the mm dies.

Select HAVE_EXIT_THREAD and free the child's GCS from
exit_thread(). gcs_free() already ignores a cleared base and a
different mm, so the usual exit path (deactivate_mm() then this) is
a no-op the second time. copy_thread_gcs() zeros the inherited
tracking before a user-thread allocation, so an allocation error
still skips exit_thread() with nothing to unmap.

Tasks created through the args->fn path (kernel_thread(),
create_io_thread(), and similar) do not allocate a user GCS in
copy_thread(). They still inherit GCS tracking via
arch_dup_task_struct(), and with CLONE_VM a later failed
copy_process() still shares the caller's mm, so gcs_free()'s mm
check does not save us. Clear that tracking with
gcs_reset_thread(), an empty stub when !CONFIG_ARM64_GCS.

x86 does not need the same args->fn clear: copy_thread() runs
shstk_alloc_thread_stack() before both the PF_KTHREAD and later
args->fn return paths, so CLONE_VM replaces the inherited tracking
first.

Tested with CONFIG_ARM64_GCS on QEMU 11.1.2 -machine virt -cpu max.
Sixteen clone3() calls with CLONE_VM|CLONE_PIDFD and an unwritable
pidfd pointer leaked 16 GCS VMAs without the fix. With it, the VMA
count was unchanged.

Fixes: 506496bcbb42 ("arm64/gcs: Ensure that new threads have a GCS")
Cc: stable@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
Assisted-by: LLM
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 arch/arm64/Kconfig           |  1 +
 arch/arm64/include/asm/gcs.h |  8 ++++++++
 arch/arm64/kernel/process.c  | 19 +++++++++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index cab741a695f5..c7fc79409f98 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -177,6 +177,7 @@ config ARM64
 	select HAVE_ARM_SMCCC
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_EBPF_JIT
+	select HAVE_EXIT_THREAD
 	select HAVE_C_RECORDMCOUNT
 	select HAVE_CMPXCHG_DOUBLE
 	select HAVE_CMPXCHG_LOCAL
diff --git a/arch/arm64/include/asm/gcs.h b/arch/arm64/include/asm/gcs.h
index 8fa0707069e8..f47aaad30d7d 100644
--- a/arch/arm64/include/asm/gcs.h
+++ b/arch/arm64/include/asm/gcs.h
@@ -67,6 +67,13 @@ void gcs_preserve_current_state(void);
 unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
 				     const struct kernel_clone_args *args);
 
+static inline void gcs_reset_thread(struct task_struct *task)
+{
+	task->thread.gcs_base = 0;
+	task->thread.gcs_size = 0;
+	task->thread.gcspr_el0 = 0;
+}
+
 static inline int gcs_check_locked(struct task_struct *task,
 				   unsigned long new_val)
 {
@@ -167,6 +174,7 @@ static inline bool task_gcs_el0_enabled(struct task_struct *task)
 static inline void gcs_set_el0_mode(struct task_struct *task) { }
 static inline void gcs_free(struct task_struct *task) { }
 static inline void gcs_preserve_current_state(void) { }
+static inline void gcs_reset_thread(struct task_struct *task) { }
 static inline void put_user_gcs(unsigned long val, unsigned long __user *addr,
 				int *err) { }
 static inline void push_user_gcs(unsigned long val, int *err) { }
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 581f80e9b9b7..83d5a07a238f 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -341,6 +341,16 @@ void flush_thread(void)
 	flush_gcs();
 }
 
+void exit_thread(struct task_struct *tsk)
+{
+	/*
+	 * copy_process() calls this after copy_thread() returns 0.
+	 * deactivate_mm() does not run on that failure path.
+	 * gcs_free() is a no-op once gcs_base is cleared.
+	 */
+	gcs_free(tsk);
+}
+
 void arch_release_task_struct(struct task_struct *tsk)
 {
 	fpsimd_release_task(tsk);
@@ -503,6 +513,15 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 
 		p->thread.cpu_context.x19 = (unsigned long)args->fn;
 		p->thread.cpu_context.x20 = (unsigned long)args->fn_arg;
+		/*
+		 * Tasks created through the args->fn path do not
+		 * allocate a user GCS here. Clear inherited allocation
+		 * tracking so a later failed copy_process() cannot
+		 * release the caller's GCS when the mm is still shared
+		 * (CLONE_VM), as with kernel_thread() and
+		 * create_io_thread().
+		 */
+		gcs_reset_thread(p);
 
 		if (system_supports_poe())
 			p->thread.por_el0 = POR_EL0_INIT;
-- 
2.43.0

