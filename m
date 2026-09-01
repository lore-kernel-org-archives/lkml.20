Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34A248A8B1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 17:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788284524; cv=none; b=fChnPl9YWBVDXNa7xNjp+HP7K102xYQxDpspgC4ZlaYMiPPJ9arB/SzdE2WHONwB6qCOmNhOUFTK3+lxwEPtpJBfNB6UG/sKHgs9ZSMky1oZV2H/ZjaO7Mf+jca8y87kxgNKZm+xUTW1lqeDtVa6grUJa+cPjXc/pBZ2WYsb1no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788284524; c=relaxed/simple;
	bh=Knciy0bo+UDETfe3BdK54qzwNZE0tRYeqpiCo6ccnoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zc7pVx2aPP5PpNRhFFwp/vrHwk+Mar7qpa+g1bo82/rQA+eONuGNr+9n/dv6+C0JaL+hPBJeRWEMO2TJYjy1PyI0A6fUl/KlaD4Vo4jHoxRUHvnew7EjZxuHkYSwtZWSgqLfegYQEQZoClSKT0DJQfLdVzhlMbi+WUSj5vuZlC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UNBohxKx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UNBohxKx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FA841F00A3A;
	Tue,  1 Sep 2026 17:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788284522;
	bh=ksh6yFu5bGeGsVFMN4yVIVHUeG1qltYeUrXjTEtnYDU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UNBohxKx031T6Gsy3Qow83SSr1CIrgtJM9eTn6QybCiY9JBHKqi4nVLBiilQWlxGM
	 dDM5zpu3IsW/oY+fvOAMY7NkUutFV1c7TTwPRCGdmspQzH/r0/uhdiCGB9faCPPcOb
	 vyY018HCY1o8v4REP7TTLE8BnTB62SD4ahDHwNLROfLVgX5Lg59ji/RuZ3TxbMFW8h
	 n30DovXMLmi2Sv5CNcy8NGnmqbNtfgNbxM0AqeVsf9WO1l7r7kan1lNG1HBwXNB+0p
	 ReU+x+Mi3xpPpen3PY18SmdC/k3GABeDZzY6aVnmJxHUPK6bSunuLd9b45KX66ZYkB
	 84HtZb4mXsn0w==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Sep 2026 18:38:41 +0100
Subject: [PATCH v11 1/2] arm64/fpsimd: Suppress SVE access traps when
 loading FPSIMD state
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm64-sve-trap-mitigation-v11-1-be8095543a46@kernel.org>
References: <20260901-arm64-sve-trap-mitigation-v11-0-be8095543a46@kernel.org>
In-Reply-To: <20260901-arm64-sve-trap-mitigation-v11-0-be8095543a46@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <Mark.Rutland@arm.com>, 
 Ryan Roberts <Ryan.Roberts@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7374; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Knciy0bo+UDETfe3BdK54qzwNZE0tRYeqpiCo6ccnoE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlw5krBQhZFScWiUEOg0+EM5IWyW3WHdFiKhQo
 JocRL8RcuOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcOZAAKCRAk1otyXVSH
 0JFYB/0R75XVtd0k+rhrWUr5crGapvqJiKYcOY2RkXEP8xhMApPNoFdsVkuQ86iFbhQ8bgIH5iM
 iZQ48MkUlQ/qyt1JVy6l2odx/SULgTNY3ZqzDGmFdHe/olRTkO5zlmabwesx3AmSYZH8jywlQhX
 /4oOBVqbMFrTuHy3bisNvV7lvW8IaV7EEqfQx56xFEw+xH2Fu4UpEa/kKzQrWFybLXkznqdj2ie
 lfpkce6dSdBWG/1z5a3gwkABrBtCfc50CKRBaoDFDTWWB9sOYKe3Em9Jk96v6UPzoleWZs1s426
 iIca8uiBQbmifyH8lE7sYwk3PGfFfyWL3pqNJPjc0qE5/7iC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

When we are in a syscall we take the opportunity to discard the SVE state,
saving only the FPSIMD subset of the register state. If we have to
reload the floating point state from memory then we reenable SVE access
traps, stopping tracking SVE until the task uses SVE again at which
point it will take another SVE access trap. This means that for a task
which is actively using SVE and also doing many blocking system calls
will have the additional overhead of SVE access traps.

The use of SVE for applications like memcpy() means that frequent SVE
usage is common with modern distributions, even with tasks that do not
obviously use floating point.  I did some instrumentation which counted
the number of SVE access traps and the number of times we loaded FPSIMD
only register state for each task.  Testing with Debian Bookworm this
showed that during boot the overwhelming majority of tasks triggered
another SVE access trap more than 50% of the time after loading FPSIMD
only state with a substantial number near 100%, though some programs had
a very small number of SVE accesses most likely from startup. There were
few tasks in the range 5-45%, most tasks either used SVE frequently or
used it only a tiny proportion of times. As expected older distributions
which do not have the SVE performance work available showed no SVE usage
in general applications.

This indicates that there should be some benefit from reducing the
number of SVE access traps for blocking system calls like we did for non
blocking system calls in commit 8c845e273104 ("arm64/sve: Leave SVE
enabled on syscall if we don't context switch"). Let's do this with a
timeout, when we take a SVE access trap record a jiffies after which
we'll reeanble SVE traps and then check this whenever we load a FPSIMD
only floating point state from memory. If the time has passed then we
reenable traps, otherwise we leave traps disabled and flush the
non-shared register state like we would on trap.

The timeout is currently set to a second, I pulled this number out of thin
air so there is doubtless some room for tuning. This means that for a
task which is actively using SVE the number of SVE access traps will be
equivalent or reduced but applications which use SVE only very
infrequently will avoid the overheads associated with tracking SVE state
after a second. The extra cost from additional tracking of SVE state
only occurs when a task is preempted so short running tasks should be
minimally affected.

As would be expected fp-pidbench shows minimal change from this patch,
it does not block and on a quiet system is unlikely to see it's state
reloaded from memory.

There should be no functional change resulting from this, it is purely a
performance optimisation.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h    | 15 ++++++++----
 arch/arm64/include/asm/processor.h |  1 +
 arch/arm64/kernel/fpsimd.c         | 47 ++++++++++++++++++++++++++++++++------
 3 files changed, 51 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index a67d5774e672..bce70a2a6d1e 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -332,6 +332,15 @@ static inline void sve_load_state(const struct arm64_sve_state *state, bool ffr)
 	__sve_load_p(state, vl, ffr);
 }
 
+static inline void sve_flush_p(void)
+{
+	asm volatile(
+	__SVE_PREAMBLE
+	FOR_EACH_P_REG("n", "pfalse	p\\n\\().b")
+	"	wrffr	p0.b\n"
+	);
+}
+
 /*
  * Zero all SVE registers except for the first 128 bits of each vector.
  *
@@ -349,11 +358,7 @@ static inline void sve_flush_live(void)
 		);
 	}
 
-	asm volatile(
-	__SVE_PREAMBLE
-	FOR_EACH_P_REG("n", "pfalse	p\\n\\().b")
-	"	wrffr	p0.b\n"
-	);
+	sve_flush_p();
 }
 
 struct arm64_cpu_capabilities;
diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index 6dfbcacd9ba0..0ff743440336 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -169,6 +169,7 @@ struct thread_struct {
 	unsigned int		fpsimd_cpu;
 	struct arm64_sve_state	*sve_state;	/* SVE registers, if any */
 	struct arm64_sme_state	*sme_state;	/* ZA and ZT state, if any */
+	unsigned long		sve_timeout;    /* jiffies to drop TIF_SVE */
 	unsigned int		vl[ARM64_VEC_MAX];	/* vector length */
 	unsigned int		vl_onexec[ARM64_VEC_MAX]; /* vl after next exec */
 	unsigned long		fault_address;	/* fault info */
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index e7f1682a3059..32e3d43c6e76 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -370,18 +370,11 @@ static void task_fpsimd_load(void)
 	if (system_supports_sve() || system_supports_sme()) {
 		switch (current->thread.fp_type) {
 		case FP_STATE_FPSIMD:
-			/* Stop tracking SVE for this task until next use. */
-			clear_thread_flag(TIF_SVE);
 			break;
 		case FP_STATE_SVE:
 			if (!thread_sm_enabled(&current->thread))
 				WARN_ON_ONCE(!test_and_set_thread_flag(TIF_SVE));
 
-			if (test_thread_flag(TIF_SVE)) {
-				unsigned long vq = sve_vq_from_vl(task_get_sve_vl(current));
-				sysreg_clear_set_s(SYS_ZCR_EL1, ZCR_ELx_LEN, vq - 1);
-			}
-
 			restore_sve_regs = true;
 			restore_ffr = true;
 			break;
@@ -400,6 +393,15 @@ static void task_fpsimd_load(void)
 		}
 	}
 
+	/*
+	 * If SVE has been enabled we may keep it enabled even if
+	 * loading only FPSIMD state, so always set the VL.
+	 */
+	if (system_supports_sve() && test_thread_flag(TIF_SVE)) {
+		unsigned long vq = sve_vq_from_vl(task_get_sve_vl(current));
+		sysreg_clear_set_s(SYS_ZCR_EL1, ZCR_ELx_LEN, vq - 1);
+	}
+
 	/* Restore SME, override SVE register configuration if needed */
 	if (system_supports_sme()) {
 		unsigned long sme_vl = task_get_sme_vl(current);
@@ -430,6 +432,30 @@ static void task_fpsimd_load(void)
 	} else {
 		WARN_ON_ONCE(current->thread.fp_type != FP_STATE_FPSIMD);
 		fpsimd_load_state(&current->thread.uw.fpsimd_state);
+
+		/*
+		 * If the task had been using SVE we keep it enabled
+		 * when loading FPSIMD only state for a period to
+		 * minimise overhead for tasks actively using SVE,
+		 * disabling it periodicaly to ensure that tasks that
+		 * use SVE intermittently do eventually avoid the
+		 * overhead of carrying SVE state.  The timeout is
+		 * initialised when we take a SVE trap in do_sve_acc().
+		 */
+		if (system_supports_sve() && test_thread_flag(TIF_SVE)) {
+			if (time_after(jiffies, current->thread.sve_timeout)) {
+				clear_thread_flag(TIF_SVE);
+				sve_user_disable();
+			} else {
+				/*
+				 * Loading V will have flushed the
+				 * rest of the Z register, SVE is
+				 * enabled at EL1 and VL was set
+				 * above.
+				 */
+				sve_flush_p();
+			}
+		}
 	}
 }
 
@@ -1324,6 +1350,13 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
 
 	get_cpu_fpsimd_context();
 
+	/*
+	 * We will keep SVE enabled when loading FPSIMD only state for
+	 * the next second to minimise traps when userspace is
+	 * actively using SVE.
+	 */
+	current->thread.sve_timeout = jiffies + HZ;
+
 	if (test_and_set_thread_flag(TIF_SVE))
 		WARN_ON(1); /* SVE access shouldn't have trapped */
 

-- 
2.47.3

