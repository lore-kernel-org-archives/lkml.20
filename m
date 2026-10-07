Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF7845A29E
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363093; cv=none; b=QgxHTzUr5AU1cnBOlDkdUwhhu2h/W47nvLa+bcKO4Zog5ZZeOWhIXb78/uiQ6mCG6+XmCD4pQVahdjcfFcbHXlLFGWe/W2V8WF29BSr7ekFO9GwYgZ7Ot107Tqvw1FkUyI1scZfhM0zQiNs+ldA+Va1M/CMXmwg2m92fLXU/AzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363093; c=relaxed/simple;
	bh=8kurw5B/nKi2WatEgZh980MnApRsbW0QYJPfcklMkI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BFeDwCDkIgndpm5J8ITNshaz3IiNBPjUnYJ3jsooBfZ0l6wO4CyV7Lwan29OY/slSBUBlBrvcvGuUBkfmzMajR9qO9ziLdmSjdIa92WVUpk6ElfH2M7yDD2YtSaZ42bsI/+gOZ89DaQvtYM2gRmDWGjQqVxdyoBnhhgLJDwW+hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=jX2D+PM0; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="jX2D+PM0"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-14129667240so1420998c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791363090; x=1791967890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PngyxLkoG9CkjKZOP2vRA0EoHH3lWjAJhQ9czt2O6bA=;
        b=jX2D+PM0XqbPgBnmUMDrgI6amQKpV5GGBydE4VXCg6VN2ftIoN8xlCT/yXQ95JetWO
         l035XXrgNqxIyiSUp4JFNFfwWXHqBVYqKKmg/fRNjNhZ+J8fv/aAeKEoyYXistvFONiy
         MI5/BOWAxv0LQSVq2ObPprQaXEShBJPrHrcqFBJTUUgGxnm5fEJfYOgQ6CAvbE1ow/JW
         /vm8U0cqfT88XUo/2sgWwkP0E2mxE3nUuDiwxfsjOVt0V9dH4uBhLJP8OssD9Es2hZRB
         CxEPTyAXBmjEJKgXmyUh01DnFnTdJdzKAqZrRoYVjOc/e4xgVE4kn+WFj/ym8Oi8pR7X
         ym8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363090; x=1791967890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PngyxLkoG9CkjKZOP2vRA0EoHH3lWjAJhQ9czt2O6bA=;
        b=YHap0SUrQdfO1deoCOItw5oOOFc3q0lbrGaiEp1KpTYk8t1Hu57qj/taOgkitLd9xu
         U/84hJoEuOpMXZQeILYW9sg+zC3AGBJg78DLsRZsYhKGtfhMMoDApr4P7yzJCnYYcQKj
         47asTHg/17eQZYflOaZBY46WEilJ5wp3cU/aVIq4CgO4z2pH9zhnQ2ssq8jzy0urzrQn
         zYh0O+I6ULgaHwxpJ4viFlHHjG2zkxDcWh+wGsh5a322pVZ33nuISYAkQZxncQrxRjnl
         xMomHXFI3hwtCDH9m6YbIpmDSAmMPlRTwaPhirIS4dpeLsMKuMqKfO0TKTiDjEqjTTtW
         LlEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAo7RjBK7ofSPM5y+vcf+DymJ7dgR9n6NBU1Cdp+/x8BxHNJwS2iNJuq8m3waAGINRXFO27zz14oidE6M=@vger.kernel.org
X-Gm-Message-State: AFuF++nfJ2RNATlbrQWtm/XNn43CZT8+SSaHP/y3BUTov6m08vZ2TxUT
	3T2wsJENy4owu66CW36j54dFLK00m9QxXhOYnMbkyDbDdLgtno8D/dncn9D2NDRADUk=
X-Gm-Gg: AYBFou3HSCv2KODZIVlnHsXSRTrqvT3HNfLUmqlj/z60eLr0J/oNffDolKcH15/tMPE
	NOc26/eW1YoF4i6MU6QTHl+IBtuxC88HqRGCE86EFKJ0Ic9FhPlfkrFPoFv4MjmirT1SoV3/4/t
	hEt/n2STE5y+CvGbdTcfV1ebp/Ygu+JfSobXwHasLZB5xj/8pi1Bja2Jpi/A+F0UY0vEM48mlqr
	KpR1h0CUuIRdi9wGzrFjRnKpeKSknQlheU9m3Djqq+YQB+nwOhYu92SYF5dIbCKMe37KvlefjKA
	JDez3ocAx+o9qc5rS7FIfVdll2Zvt+qo4yQx8vG+LXzZe+m3KKWe/JXI19SJtGZaXU0gWyLRm1C
	UFs9UdIk7QbmWyhP5fwXle7nOXQpuZB0cR5TJdY3PvXb5kp1At+J57899UPQsEQgz/LkkhvdncK
	8urZjcbUQoy0eeFgewp7igOP5rPFGvO3X5wvlBB7VbqNca98BAnfOvc5qSOBvZ2oODRN5xFAC3q
	nqq1cUziX6CnTjZvPF+X1qNkZjMgvc=
X-Received: by 2002:a05:7022:6b8d:b0:156:3684:96d4 with SMTP id a92af1059eb24-16205eae0e8mr2228302c88.25.1791363090334;
        Wed, 07 Oct 2026 01:51:30 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-163e3c5bed6sm396251c88.7.2026.10.07.01.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:51:30 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Paul Walmsley <pjw@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Andy Chiu <tchiu@tenstorrent.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 2/3] riscv: Deprecate vector state prctl/sysctl
Date: Wed,  7 Oct 2026 01:51:17 -0700
Message-ID: <20261007085126.222688-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261007085126.222688-1-samuel.holland@sifive.com>
References: <20261007085126.222688-1-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ability to prevent userspace from executing vector instructions was
provided as a escape hatch for software that was broken by adding vector
state to the signal context. This appears to be unused in practice, and
creates confusion in the extension support returned by hwprobe(), as in
this one special case an extension reported as present by hwprobe() is
unusable.

Since we believe it is safe to always allow vector usage, hide the prctl
and sysctl behind a Kconfig option and mark them as deprecated, so they
can be removed in the future. Note that significant userspace software
like glibc already considers these controls explicitly unsupported.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/Kconfig                 | 10 ++++++++++
 arch/riscv/include/asm/processor.h |  4 +++-
 arch/riscv/include/asm/vector.h    | 16 ++++++++++++----
 arch/riscv/kernel/vector.c         | 10 ++++++++++
 4 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e26450f0d38fb..83e52a0a85ba7 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -650,6 +650,16 @@ config RISCV_ISA_V
 
 	  If you don't know what to do here, say Y.
 
+config RISCV_ISA_V_VSTATE_CTRL
+	bool "Deprecated prctl/sysctl for disallowing userspace vector access"
+	depends on RISCV_ISA_V
+	help
+	  Add prctl and sysctl interfaces to disallow userspace to execute
+	  vector instructions. These controls are deprecated because they create
+	  ambiguity in the ISA extension availability reported by hwprobe.
+
+	  If you don't know what to do here, say N.
+
 config RISCV_ISA_V_UCOPY_THRESHOLD
 	int "Threshold size for vectorized user copies"
 	depends on RISCV_ISA_V
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 815715c67f940..ad64df01417a2 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -121,7 +121,9 @@ struct thread_struct {
 	unsigned long envcfg;
 	unsigned long sum;
 	u32 riscv_v_flags;
+#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
 	u32 vstate_ctrl;
+#endif
 	struct __riscv_v_ext_state vstate;
 	unsigned long align_ctl;
 	struct __riscv_v_ext_state kernel_vstate;
@@ -202,7 +204,7 @@ extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src
 
 extern unsigned long signal_minsigstksz __ro_after_init;
 
-#ifdef CONFIG_RISCV_ISA_V
+#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
 /* Userspace interface for PR_RISCV_V_{SET,GET}_VS prctl()s: */
 #define RISCV_V_SET_CONTROL(arg)	riscv_v_vstate_ctrl_set_current(arg)
 #define RISCV_V_GET_CONTROL()		riscv_v_vstate_ctrl_get_current()
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index fffe72a772080..5425a25f8a196 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -404,9 +404,6 @@ static inline void __switch_to_vector(struct task_struct *prev,
 	}
 }
 
-void riscv_v_vstate_ctrl_init(struct task_struct *tsk);
-bool riscv_v_vstate_ctrl_user_allowed(void);
-
 #else /* ! CONFIG_RISCV_ISA_V  */
 
 struct pt_regs;
@@ -418,7 +415,6 @@ static __always_inline bool has_xtheadvector_no_alternatives(void) { return fals
 static __always_inline bool has_xtheadvector(void) { return false; }
 static inline bool riscv_v_first_use_handler(struct pt_regs *regs) { return false; }
 static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
-static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 #define riscv_v_vsize (0)
 #define riscv_v_vstate_discard(regs)		do {} while (0)
 #define riscv_v_vstate_save(vstate, regs)	do {} while (0)
@@ -435,6 +431,18 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 
 #endif /* CONFIG_RISCV_ISA_V */
 
+#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
+
+void riscv_v_vstate_ctrl_init(struct task_struct *tsk);
+bool riscv_v_vstate_ctrl_user_allowed(void);
+
+#else
+
+static inline void riscv_v_vstate_ctrl_init(struct task_struct *tsk) {}
+static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return true; }
+
+#endif /* CONFIG_RISCV_ISA_V_VSTATE_CTRL */
+
 /*
  * Return the implementation's vlen value.
  *
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 9641343732782..b35d11ff3cc89 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -20,7 +20,9 @@
 #include <asm/ptrace.h>
 #include <asm/bug.h>
 
+#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
 static bool riscv_v_implicit_uacc = true;
+#endif
 static struct kmem_cache *riscv_v_user_cachep;
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 static struct kmem_cache *riscv_v_kernel_cachep;
@@ -144,6 +146,8 @@ void riscv_v_thread_free(struct task_struct *tsk)
 #endif
 }
 
+#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
+
 #define VSTATE_CTRL_GET_CUR(x) ((x) & PR_RISCV_V_VSTATE_CTRL_CUR_MASK)
 #define VSTATE_CTRL_GET_NEXT(x) (((x) & PR_RISCV_V_VSTATE_CTRL_NEXT_MASK) >> 2)
 #define VSTATE_CTRL_MAKE_NEXT(x) (((x) << 2) & PR_RISCV_V_VSTATE_CTRL_NEXT_MASK)
@@ -182,6 +186,8 @@ bool riscv_v_vstate_ctrl_user_allowed(void)
 }
 EXPORT_SYMBOL_GPL(riscv_v_vstate_ctrl_user_allowed);
 
+#endif
+
 bool riscv_v_first_use_handler(struct pt_regs *regs)
 {
 	u32 __user *epc = (u32 __user *)regs->epc;
@@ -227,6 +233,8 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
 	return true;
 }
 
+#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
+
 void riscv_v_vstate_ctrl_init(struct task_struct *tsk)
 {
 	bool inherit;
@@ -330,3 +338,5 @@ static int __init riscv_v_init(void)
 	return riscv_v_sysctl_init();
 }
 core_initcall(riscv_v_init);
+
+#endif
-- 
2.52.0

