Received: from mail-pz2-f21.google.com (mail-pz2-f21.google.com [74.125.228.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D774D0CDF
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790960388; cv=none; b=ffxiL1sbySGCN6jp8RCca5aMywzd5oj/ZDwO01krkIhlzI5oEELM5NO30vxQrh+bRtM2LW7Ddsap+xo6atFVRzKrbMtu4JhJqXjfYUL7x8nuQElsL83cteE7ucZ64ec70PRcWTsK0Jpb5rXLkteBZDA0lb1tkZKPEu0q/TnSYr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790960388; c=relaxed/simple;
	bh=cGxj2bFT+Q1rbyuH9cWCMXDaMWD6XJBoDbvLhnBXqgg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DusxGknTomTuacNAl1NLqhXi/9ay+7R/geeAjobmhHz+TkYc7Vqz55FFpzqxL1/u44ZnTN72aBviTn6z+ZP64ETWJhYklmMtLRGdncWvMm5FfRAq2fbrsNCwLU7LwRVfgx4rKBt0lQ0bEGJn18TehrbWED1PDR4PONGcELP1Dps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=YrD8bmOo; arc=none smtp.client-ip=74.125.228.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="YrD8bmOo"
Received: by mail-pz2-f21.google.com with SMTP id 41be03b00d2f7-cc4cacd3409so4719774a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790960386; x=1791565186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wr4LtdUbpqcAeSn0rG32NGieF132dt6UAMZa+jOZzQA=;
        b=YrD8bmOoSpPvipA6DTvSO1f9sXo/W/2TPSkm88EuEDoOJ3EXRB4RBAM1XbQVqW+bH5
         mUP9n2mBAfZAJVBIteYp2a0yuQUExfUeSMyeqN6P1RAkFuy9HfM9EH2UFDBuryRNzrN7
         jcTwpku2qhJuG9UmGec+aT2ZOc8CAPeHqfA9R5FPAFHg3J1r5McgWHkY50tEuxKtB0WC
         BWIgDMdtheM88JQ6A/95MJlj9yXtQ8q2oowZE2hFK3Wvw+YMUmz/y35sWc6HPZY9FiGw
         ieucDORh+eCBp248lDgnVh+8ZLRKLrL8+EG1puhfH01fctLzYcrkyDl7p9+5KoTlzBHb
         zEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790960386; x=1791565186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wr4LtdUbpqcAeSn0rG32NGieF132dt6UAMZa+jOZzQA=;
        b=ITf+PYBIstQfdwA5OkPRhVUiR4OWGosPxUhuJ/fza16XtGDjEJipsjJd1G58aUQ3Dj
         xNPQCbF1ooqQ5lFmGHfiwwIPnK7aR1K3bA7sz4EWvCUTBS/p1lL4LryxKx7jHILUm4Xt
         d45oRjvZxri+WTqC8UrBTILlPf0y/hfLHpAVLoLKVykQr/Ch0iuiV0srt90TFr7JvJVY
         CRdQ5feBSZLn9xmmzd/c2uMEtHFath6b6WQqwhQ+Vza5Yv+gGSWq1fnfA7ZdOZQOAz+i
         FSnYvFfyX5aSwGGiL7LLBGczys6LjjmERbGqoXp4etS5L2wTSABj/FBh293CorOgxAC2
         Ax/w==
X-Gm-Message-State: AFq9FYJvfZTcVCors6BLmjHq/zeBKuNsX464kbzv7W4OuTMFCPoQQnX7
	j08HjtVhhSvIYGE8lYxjSQmr6aeHGiv6ZryiC976RBvnyJCndtcwuouLvCUKyjwg6SU=
X-Gm-Gg: AYBFou1e8xCw3OrMOYVe4to+b1P8cw36GFgBQ6INIuFxf9+UcKn+OIh5vzcOUisDXQl
	utLWeKIsLujRpXv0U5ehRhrpDM2/0FieIJesuYPXC9KkHpp+j0G3BAWcncgOW3K6USdbBVXUxIM
	3l7tP2osfyUpERI3/HMfBNxCrFuVZHR7xUKUUAOM3mkdRzXdjz+PF5R7nVb/yvfg+yidaDvpb6i
	rFUpiuC5si8Fv2n5hgYUtAlO5IgtqGJx0Kan6Tc91i9WzGyUksh0Z5yB1oe7Gykr/6LIsLg+QJh
	dpVexTgyxEAQhRWnj5VAZtWXI2dKKneeBIYY/I6tIGbr13zpLCY77i5PP6Ot1Y+RMASNpKyWy3X
	AO/OdNhdHvq3JTdXAIcAijmdhS9Wm3AjXZmcJ52wGATV2e/2Yu+ZA9K2ase62lY2LCQEv5i41BH
	OQlv6lQHRuEH8/OWtAtQSXHDdlagIPt5Pa4u3CX4/aCKQh0tkf9XMA8rY1hc/OrtEVXFoLRRBBp
	jHuokTPHyEuSofkxq4GIxmhbyAT
X-Received: by 2002:a17:90b:528d:b0:3a0:d2f3:fa80 with SMTP id 98e67ed59e1d1-3a6ce647e72mr3012020a91.6.1790960386164;
        Fri, 02 Oct 2026 09:59:46 -0700 (PDT)
Received: from n37-012-226.byted.org ([115.190.40.12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd5d88bbsm4900871a91.12.2026.10.02.09.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:59:45 -0700 (PDT)
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
Subject: [PATCH v5 4/5] riscv: Use Zalasr for xchg and cmpxchg ordering
Date: Sat,  3 Oct 2026 00:59:09 +0800
Message-Id: <20261002165910.3818940-5-qingwei.hu@bytedance.com>
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

RISC-V implements acquire and release xchg/cmpxchg operations with a
directional fence before or after a relaxed atomic instruction. Fully
ordered LR/SC fallbacks use sc.rl followed by a full fence.

Keep those sequences as the default alternatives. On Zalasr systems, use
aq or rl annotations on the LR, SC, AMO, or CAS instruction and replace
the matching fence with a nop. Use lr.aq together with sc.aqrl for fully
ordered LR/SC fallbacks. Direct fully ordered AMO and CAS paths are
already annotated and remain unchanged.

Apply the alternatives to both the Zabha/Zacas paths and their LR/SC
fallbacks while retaining the instruction-set option scopes required by
newer toolchains. Relaxed operations do not gain alternative entries.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
Co-developed-by: Yunhui Cui <cuiyunhui@bytedance.com>
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Co-developed-by: Qingwei Hu <qingwei.hu@bytedance.com>
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 arch/riscv/include/asm/cmpxchg.h | 186 +++++++++++++++++++------------
 1 file changed, 114 insertions(+), 72 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 39f8195c9fd6c..eac60cf91b9b5 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -16,8 +16,12 @@
 #include <asm/processor.h>
 #include <asm/errata_list.h>
 
-#define __arch_xchg_masked(sc_sfx, swap_sfx, prepend, sc_append,		\
-			   swap_append, r, p, n)				\
+#define RISCV_SELECT_OLD(old, ...)	old
+
+#define __arch_xchg_masked(lr_alt, sc_alt, swap_alt,			\
+			   lr_sfx, sc_sfx, swap_sfx,			\
+			   z_lr_sfx, z_sc_sfx, z_swap_sfx,		\
+			   prepend, sc_append, swap_append, r, p, n)	\
 ({										\
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&				\
 	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {		\
@@ -25,7 +29,8 @@
 			prepend							\
 			"	.option push\n"					\
 			"	.option arch, +zabha\n"				\
-			"	amoswap" swap_sfx " %0, %z2, %1\n"		\
+			swap_alt("	amoswap" swap_sfx " %0, %z2, %1\n",\
+				 "	amoswap" z_swap_sfx " %0, %z2, %1\n") \
 			"	.option pop\n"					\
 			swap_append						\
 			: "=&r" (r), "+A" (*(p))				\
@@ -43,10 +48,13 @@
 		__asm__ __volatile__ (						\
 		       prepend							\
 		       PREFETCHW_ASM(%5)					\
-		       "0:	lr.w %0, %2\n"					\
+		       "0:\n"						\
+		       lr_alt("	lr.w" lr_sfx " %0, %2\n",		\
+			      "	lr.w" z_lr_sfx " %0, %2\n")		\
 		       "	and  %1, %0, %z4\n"				\
 		       "	or   %1, %1, %z3\n"				\
-		       "	sc.w" sc_sfx " %1, %1, %2\n"			\
+		       sc_alt("	sc.w" sc_sfx " %1, %1, %2\n",		\
+			      "	sc.w" z_sc_sfx " %1, %1, %2\n")	\
 		       "	bnez %1, 0b\n"					\
 		       sc_append						\
 		       : "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
@@ -57,19 +65,23 @@
 	}									\
 })
 
-#define __arch_xchg(sfx, prepend, append, r, p, n)			\
+#define __arch_xchg(swap_alt, swap_sfx, z_swap_sfx,			\
+		    prepend, append, r, p, n)				\
 ({									\
 	__asm__ __volatile__ (						\
 		prepend							\
-		"	amoswap" sfx " %0, %2, %1\n"			\
+		swap_alt("	amoswap" swap_sfx " %0, %2, %1\n",	\
+			 "	amoswap" z_swap_sfx " %0, %2, %1\n")	\
 		append							\
 		: "=r" (r), "+A" (*(p))					\
 		: "r" (n)						\
 		: "memory");						\
 })
 
-#define _arch_xchg(ptr, new, sc_sfx, swap_sfx, prepend,			\
-		   sc_append, swap_append)				\
+#define _arch_xchg(ptr, new, lr_alt, sc_alt, swap_alt,			\
+		   lr_sfx, sc_sfx, swap_sfx,				\
+		   z_lr_sfx, z_sc_sfx, z_swap_sfx,			\
+		   prepend, sc_append, swap_append)			\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(*(__ptr)) __new = (new);				\
@@ -77,22 +89,26 @@
 									\
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
-		__arch_xchg_masked(sc_sfx, ".b" swap_sfx,		\
+		__arch_xchg_masked(lr_alt, sc_alt, swap_alt,		\
+				   lr_sfx, sc_sfx, ".b" swap_sfx,	\
+				   z_lr_sfx, z_sc_sfx, ".b" z_swap_sfx,\
 				   prepend, sc_append, swap_append,	\
 				   __ret, __ptr, __new);		\
 		break;							\
 	case 2:								\
-		__arch_xchg_masked(sc_sfx, ".h" swap_sfx,		\
+		__arch_xchg_masked(lr_alt, sc_alt, swap_alt,		\
+				   lr_sfx, sc_sfx, ".h" swap_sfx,	\
+				   z_lr_sfx, z_sc_sfx, ".h" z_swap_sfx,\
 				   prepend, sc_append, swap_append,	\
 				   __ret, __ptr, __new);		\
 		break;							\
 	case 4:								\
-		__arch_xchg(".w" swap_sfx, prepend, swap_append,	\
-			      __ret, __ptr, __new);			\
+		__arch_xchg(swap_alt, ".w" swap_sfx, ".w" z_swap_sfx,\
+			      prepend, swap_append, __ret, __ptr, __new);\
 		break;							\
 	case 8:								\
-		__arch_xchg(".d" swap_sfx, prepend, swap_append,	\
-			      __ret, __ptr, __new);			\
+		__arch_xchg(swap_alt, ".d" swap_sfx, ".d" z_swap_sfx,\
+			      prepend, swap_append, __ret, __ptr, __new);\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -101,22 +117,36 @@
 })
 
 #define arch_xchg_relaxed(ptr, x)					\
-	_arch_xchg(ptr, x, "", "", "", "", "")
+	_arch_xchg(ptr, x,						\
+		   RISCV_SELECT_OLD, RISCV_SELECT_OLD, RISCV_SELECT_OLD,\
+		   "", "", "", "", "", "", "", "", "")
 
 #define arch_xchg_acquire(ptr, x)					\
-	_arch_xchg(ptr, x, "", "", "",					\
+	_arch_xchg(ptr, x,						\
+		   RISCV_ZALASR_SMP_ALTERNATIVE, RISCV_SELECT_OLD,	\
+		   RISCV_ZALASR_SMP_ALTERNATIVE,			\
+		   "", "", "", ".aq", "", ".aq", "",		\
 		   RISCV_ZALASR_SMP_ALTERNATIVE(			\
-			RISCV_ACQUIRE_BARRIER, RISCV_FULL_BARRIER),	\
+			RISCV_ACQUIRE_BARRIER, __nops(1)),		\
 		   RISCV_ZALASR_SMP_ALTERNATIVE(			\
-			RISCV_ACQUIRE_BARRIER, RISCV_FULL_BARRIER))
+			RISCV_ACQUIRE_BARRIER, __nops(1)))
 
 #define arch_xchg_release(ptr, x)					\
-	_arch_xchg(ptr, x, "", "",					\
+	_arch_xchg(ptr, x,						\
+		   RISCV_SELECT_OLD, RISCV_ZALASR_SMP_ALTERNATIVE,	\
+		   RISCV_ZALASR_SMP_ALTERNATIVE,			\
+		   "", "", "", "", ".rl", ".rl",			\
 		   RISCV_ZALASR_SMP_ALTERNATIVE(			\
-			RISCV_RELEASE_BARRIER, RISCV_FULL_BARRIER), "", "")
+			RISCV_RELEASE_BARRIER, __nops(1)), "", "")
 
 #define arch_xchg(ptr, x)						\
-	_arch_xchg(ptr, x, ".rl", ".aqrl", "", RISCV_FULL_BARRIER, "")
+	_arch_xchg(ptr, x,						\
+		   RISCV_ZALASR_SMP_ALTERNATIVE,			\
+		   RISCV_ZALASR_SMP_ALTERNATIVE,			\
+		   RISCV_SELECT_OLD,					\
+		   "", ".rl", ".aqrl", ".aq", ".aqrl", ".aqrl", "",\
+		   RISCV_ZALASR_SMP_ALTERNATIVE(			\
+			RISCV_FULL_BARRIER, __nops(1)), "")
 
 #define xchg32(ptr, x)							\
 ({									\
@@ -135,10 +165,11 @@
  * store NEW in MEM.  Return the initial value in MEM.  Success is
  * indicated by comparing RETURN with OLD.
  */
-#define __arch_cmpxchg_masked(sc_sfx, cas_sfx,					\
+#define __arch_cmpxchg_masked(lr_alt, sc_alt, cas_alt,				\
+			      lr_sfx, sc_sfx, cas_sfx,				\
+			      z_lr_sfx, z_sc_sfx, z_cas_sfx,			\
 			      sc_prepend, sc_append,				\
-			      cas_prepend, cas_append,				\
-			      r, p, o, n)					\
+			      cas_prepend, cas_append, r, p, o, n)		\
 ({										\
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&				\
 	    IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&				\
@@ -151,7 +182,8 @@
 			cas_prepend							\
 			"	.option push\n"					\
 			"	.option arch, +zacas, +zabha\n"				\
-			"	amocas" cas_sfx " %0, %z2, %1\n"		\
+			cas_alt("	amocas" cas_sfx " %0, %z2, %1\n",	\
+				"	amocas" z_cas_sfx " %0, %z2, %1\n")	\
 			"	.option pop\n"					\
 			cas_append							\
 			: "+&r" (r), "+A" (*(p))				\
@@ -169,12 +201,15 @@
 										\
 		__asm__ __volatile__ (						\
 			sc_prepend							\
-			"0:	lr.w %0, %2\n"					\
+			"0:\n"							\
+			lr_alt("	lr.w" lr_sfx " %0, %2\n",			\
+			       "	lr.w" z_lr_sfx " %0, %2\n")		\
 			"	and  %1, %0, %z5\n"				\
 			"	bne  %1, %z3, 1f\n"				\
 			"	and  %1, %0, %z6\n"				\
 			"	or   %1, %1, %z4\n"				\
-			"	sc.w" sc_sfx " %1, %1, %2\n"			\
+			sc_alt("	sc.w" sc_sfx " %1, %1, %2\n",		\
+			       "	sc.w" z_sc_sfx " %1, %1, %2\n")	\
 			"	bnez %1, 0b\n"					\
 			sc_append							\
 			"1:\n"							\
@@ -187,10 +222,11 @@
 	}									\
 })
 
-#define __arch_cmpxchg(lr_sfx, sc_sfx, cas_sfx,				\
+#define __arch_cmpxchg(lr_alt, sc_alt, cas_alt,				\
+		       lr_sfx, sc_sfx, cas_sfx,				\
+		       z_lr_sfx, z_sc_sfx, z_cas_sfx,			\
 		       sc_prepend, sc_append,				\
-		       cas_prepend, cas_append,				\
-		       r, p, co, o, n)					\
+		       cas_prepend, cas_append, r, p, co, o, n)		\
 ({									\
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&			\
 	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZACAS) &&			\
@@ -201,7 +237,8 @@
 			cas_prepend					\
 			"	.option push\n"				\
 			"	.option arch, +zacas\n"			\
-			"	amocas" cas_sfx " %0, %z2, %1\n"	\
+			cas_alt("	amocas" cas_sfx " %0, %z2, %1\n",\
+				"	amocas" z_cas_sfx " %0, %z2, %1\n") \
 			"	.option pop\n"				\
 			cas_append					\
 			: "+&r" (r), "+A" (*(p))			\
@@ -212,9 +249,12 @@
 									\
 		__asm__ __volatile__ (					\
 			sc_prepend					\
-			"0:	lr" lr_sfx " %0, %2\n"			\
+			"0:\n"						\
+			lr_alt("	lr" lr_sfx " %0, %2\n",		\
+			       "	lr" z_lr_sfx " %0, %2\n")		\
 			"	bne  %0, %z3, 1f\n"			\
-			"	sc" sc_sfx " %1, %z4, %2\n"		\
+			sc_alt("	sc" sc_sfx " %1, %z4, %2\n",	\
+			       "	sc" z_sc_sfx " %1, %z4, %2\n")	\
 			"	bnez %1, 0b\n"				\
 			sc_append					\
 			"1:\n"						\
@@ -224,9 +264,10 @@
 	}								\
 })
 
-#define _arch_cmpxchg(ptr, old, new, sc_sfx, cas_sfx,			\
-		      sc_prepend, sc_append,				\
-		      cas_prepend, cas_append)				\
+#define _arch_cmpxchg(ptr, old, new, lr_alt, sc_alt, cas_alt,		\
+		      lr_sfx, sc_sfx, cas_sfx,				\
+		      z_lr_sfx, z_sc_sfx, z_cas_sfx,			\
+		      sc_prepend, sc_append, cas_prepend, cas_append)	\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(*(__ptr)) __old = (old);				\
@@ -235,25 +276,35 @@
 									\
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
-		__arch_cmpxchg_masked(sc_sfx, ".b" cas_sfx,		\
+		__arch_cmpxchg_masked(lr_alt, sc_alt, cas_alt,		\
+				      lr_sfx, sc_sfx, ".b" cas_sfx,	\
+				      z_lr_sfx, z_sc_sfx, ".b" z_cas_sfx,\
 				      sc_prepend, sc_append,		\
 				      cas_prepend, cas_append,		\
 				      __ret, __ptr, __old, __new);	\
 		break;							\
 	case 2:								\
-		__arch_cmpxchg_masked(sc_sfx, ".h" cas_sfx,		\
+		__arch_cmpxchg_masked(lr_alt, sc_alt, cas_alt,		\
+				      lr_sfx, sc_sfx, ".h" cas_sfx,	\
+				      z_lr_sfx, z_sc_sfx, ".h" z_cas_sfx,\
 				      sc_prepend, sc_append,		\
 				      cas_prepend, cas_append,		\
 				      __ret, __ptr, __old, __new);	\
 		break;							\
 	case 4:								\
-		__arch_cmpxchg(".w", ".w" sc_sfx, ".w" cas_sfx,		\
+		__arch_cmpxchg(lr_alt, sc_alt, cas_alt,			\
+			       ".w" lr_sfx, ".w" sc_sfx, ".w" cas_sfx,\
+			       ".w" z_lr_sfx, ".w" z_sc_sfx,		\
+			       ".w" z_cas_sfx,				\
 			       sc_prepend, sc_append,			\
 			       cas_prepend, cas_append,			\
 			       __ret, __ptr, (long)(int)(long), __old, __new);	\
 		break;							\
 	case 8:								\
-		__arch_cmpxchg(".d", ".d" sc_sfx, ".d" cas_sfx,		\
+		__arch_cmpxchg(lr_alt, sc_alt, cas_alt,			\
+			       ".d" lr_sfx, ".d" sc_sfx, ".d" cas_sfx,\
+			       ".d" z_lr_sfx, ".d" z_sc_sfx,		\
+			       ".d" z_cas_sfx,				\
 			       sc_prepend, sc_append,			\
 			       cas_prepend, cas_append,			\
 			       __ret, __ptr, /**/, __old, __new);	\
@@ -264,48 +315,39 @@
 	(__typeof__(*(__ptr)))__ret;					\
 })
 
-/*
- * These macros are here to improve the readability of the arch_cmpxchg_XXX()
- * macros.
- */
-#define SC_SFX(x)	x
-#define CAS_SFX(x)	x
-#define SC_PREPEND(x)	x
-#define SC_APPEND(x)	x
-#define CAS_PREPEND(x)	x
-#define CAS_APPEND(x)	x
-
 #define arch_cmpxchg_relaxed(ptr, o, n)					\
 	_arch_cmpxchg((ptr), (o), (n),					\
-		      SC_SFX(""), CAS_SFX(""),				\
-		      SC_PREPEND(""), SC_APPEND(""),			\
-		      CAS_PREPEND(""), CAS_APPEND(""))
+		      RISCV_SELECT_OLD, RISCV_SELECT_OLD, RISCV_SELECT_OLD,\
+		      "", "", "", "", "", "", "", "", "", "")
 
 #define arch_cmpxchg_acquire(ptr, o, n)					\
 	_arch_cmpxchg((ptr), (o), (n),					\
-		      SC_SFX(""), CAS_SFX(""),				\
-		      SC_PREPEND(""), SC_APPEND(			\
-			RISCV_ZALASR_SMP_ALTERNATIVE(			\
-				RISCV_ACQUIRE_BARRIER, RISCV_FULL_BARRIER)), \
-		      CAS_PREPEND(""), CAS_APPEND(			\
-			RISCV_ZALASR_SMP_ALTERNATIVE(			\
-				RISCV_ACQUIRE_BARRIER, RISCV_FULL_BARRIER)))
+		      RISCV_ZALASR_SMP_ALTERNATIVE, RISCV_SELECT_OLD,	\
+		      RISCV_ZALASR_SMP_ALTERNATIVE,			\
+		      "", "", "", ".aq", "", ".aq", "",		\
+		      RISCV_ZALASR_SMP_ALTERNATIVE(			\
+			RISCV_ACQUIRE_BARRIER, __nops(1)), "",		\
+		      RISCV_ZALASR_SMP_ALTERNATIVE(			\
+			RISCV_ACQUIRE_BARRIER, __nops(1)))
 
 #define arch_cmpxchg_release(ptr, o, n)					\
 	_arch_cmpxchg((ptr), (o), (n),					\
-		      SC_SFX(""), CAS_SFX(""),				\
-		      SC_PREPEND(RISCV_ZALASR_SMP_ALTERNATIVE(		\
-			RISCV_RELEASE_BARRIER, RISCV_FULL_BARRIER)),	\
-		      SC_APPEND(""),					\
-		      CAS_PREPEND(RISCV_ZALASR_SMP_ALTERNATIVE(	\
-			RISCV_RELEASE_BARRIER, RISCV_FULL_BARRIER)),	\
-		      CAS_APPEND(""))
+		      RISCV_SELECT_OLD, RISCV_ZALASR_SMP_ALTERNATIVE,	\
+		      RISCV_ZALASR_SMP_ALTERNATIVE,			\
+		      "", "", "", "", ".rl", ".rl",			\
+		      RISCV_ZALASR_SMP_ALTERNATIVE(			\
+			RISCV_RELEASE_BARRIER, __nops(1)), "",		\
+		      RISCV_ZALASR_SMP_ALTERNATIVE(			\
+			RISCV_RELEASE_BARRIER, __nops(1)), "")
 
 #define arch_cmpxchg(ptr, o, n)						\
 	_arch_cmpxchg((ptr), (o), (n),					\
-		      SC_SFX(".rl"), CAS_SFX(".aqrl"),			\
-		      SC_PREPEND(""), SC_APPEND(RISCV_FULL_BARRIER),	\
-		      CAS_PREPEND(""), CAS_APPEND(""))
+		      RISCV_ZALASR_SMP_ALTERNATIVE,			\
+		      RISCV_ZALASR_SMP_ALTERNATIVE,			\
+		      RISCV_SELECT_OLD,					\
+		      "", ".rl", ".aqrl", ".aq", ".aqrl", ".aqrl", "",\
+		      RISCV_ZALASR_SMP_ALTERNATIVE(			\
+			RISCV_FULL_BARRIER, __nops(1)), "", "")
 
 #define arch_cmpxchg_local(ptr, o, n)					\
 	arch_cmpxchg_relaxed((ptr), (o), (n))
-- 
2.39.5

