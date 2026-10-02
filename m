Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D625B4E020E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790960394; cv=none; b=EEGI7MjDUw9kq97Y5xF60cIjIScMFgj2ejoKI1Vps0JsCcIAZIiC11hAxT3eKjfyCoHuAhd3TbK0W33WuMzjM3LQq1yTTxKP4DtjPx3cSyK4U1n5LX4dQ7c0pDeDXWjH8e2eZH2xYZgZLdNBImu0jb7nZzSOasnfD/1Wch+iJ8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790960394; c=relaxed/simple;
	bh=oe0jGFBNG8mYJHldBCoHz9WQy+NS0kHNKSNvjKhxlFc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jvc+XkwNbvXyWpLbUHSCrTblWh+Snr97ZJGkXZkxYiiSaHrJi2BW7c3MtWdeLOmR7p5Coj2ZDt0d1gVk7LT5XHnXtqOQw/hl/ErZF+rXBD8N55e70M/PeSirmiFcjMwoWtb1Gwe5OE/RRQUMAJrDyRLkTOVHh0p8XWy8xtClTqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=E8igypke; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="E8igypke"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a494638445so121249a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790960392; x=1791565192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MBwgWk41bkF2YCkIipKSeNP7+RMwXHpRbHO0AJjABsc=;
        b=E8igypkejoWk6MhERZoJ/9tkQMKs/sxcU4jV+QHGlY2UwK+JMfygimlXrNjYc5CEOd
         iqWjzaQAoir67Cy7vhhUsGtcPJ7fSH51FWekJMKC3Mo1yDbBkPBhqA4qlECK8XG4Lgsv
         oFeOtkvMVkPqlomV8oVgHE3sgVTayMGsJhOlmgnNUzEt4Hg9DBpQYDQbDhbtrrO4wRsB
         wYoXc6pn8tPNcz8iDjrx+gc7AKIjY7vnZxem99ZcdhGwzqvkQozzxoB2A/jEiSFkuObv
         tT/UWINxYLk7XrLcfVTkxYVHuOHiobWEs5hd/POnuy08cR3Hen86zyPKcmhNYIT+jwb9
         3ZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790960392; x=1791565192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MBwgWk41bkF2YCkIipKSeNP7+RMwXHpRbHO0AJjABsc=;
        b=dp2M/7uYuHWBCxs1TfTsFSIP3xxDUBi1AAYVLITww4clxepa1z1rZFZwDEyJ6cZ4sY
         eYTrWvF6y1OwbxZa+/Qu/lf3JnpYtKyYuZeEnji3f9m5l6+USUWW7X4CF3bpD/j4Xy+N
         HQyDPhVuiD+16JPMH5fcLTQJUjOGST1Yxphr/pQYE2JrTCKMXaLS0k76Gs/rpY1p8FRV
         dBgRp7kTlC4tV8iQJNosiqHgg6ilCZna3WIHAqasLgMSgO5kNq7OR2MihoduIjmcIalp
         S0gQWm1sihgnBHa0zsCPYwyQVjEpj1eOqATafJqIlXNh77UkFnjxT/GlrcIhl1XU7jCX
         sbsw==
X-Gm-Message-State: AFq9FYIo3owB8CBh+UaZdD2XR0qQtvC8IpyajY5dyUCokG8jugNu09MC
	jsfUXIqMbA3bws1sx6kKZsMk+Jlg9yDS4umwOcFwXLNUXdOam7Lzp3gdxKD+vXPmulM=
X-Gm-Gg: AYBFou25T/d85bvFWPUufeuPD23c3r2VdCAMdBc9seCxemjXNORGK6uj9k9M93ZQOCP
	/dkfnP8psAWIneAfYTInbSGNKqc32bCUZp5V80oPzqCvRsNTdZ8FzNN2vIrvxICydhVwa7Rw5TT
	Et0xbIU3c/Vau3MVlaOcCn1MjeHWCqAZlxsUv9j74lhLdXg56ppVwMZii0ax7wLx4sMVRHHbMGQ
	ENnf4Ke4cQcjVcXRQlOLc/Oy640GygUvP4OA8T/vhSpcGbIp5F9obEUc1Sz/zaHHQnWwCTDTkfK
	R3I4EOGKKJq0SneCaMODdeQUIvhVfuyaBARSysAJ5wrQmpXmzu2z/3cocCZjKUwA9rQUpTE2S1g
	3RoiYI1CVEaq1HaZBmLX4qbz1v0iHmBDbvq0gsvi9HI06z55ffB0Olr+XkgOWlNCnvXkxRlJGSt
	gyFiyBVNs1BpYIPsmC8XAGPWIcsx0NvQHTkVRZDreB5ihMoUrp5ugeD15Fp/T/8aLbDEWEPLu7Q
	WENLNSdEQDiWencYUIn6awA3NqF
X-Received: by 2002:a17:90b:4b0d:b0:3a2:b0a1:456b with SMTP id 98e67ed59e1d1-3a6cecb1b3bmr1963511a91.47.1790960391800;
        Fri, 02 Oct 2026 09:59:51 -0700 (PDT)
Received: from n37-012-226.byted.org ([115.190.40.12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd5d88bbsm4900871a91.12.2026.10.02.09.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:59:51 -0700 (PDT)
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
Subject: [PATCH v5 5/5] riscv: Use Zalasr for atomic acquire and release operations
Date: Sat,  3 Oct 2026 00:59:10 +0800
Message-Id: <20261002165910.3818940-6-qingwei.hu@bytedance.com>
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

The generic atomic helpers implement acquire and release operations by
combining a relaxed AMO with a fence. Systems with Zalasr can encode
the required ordering directly in the AMO with the aq or rl annotation.

Provide explicit acquire and release variants for the arithmetic and
logical atomic operations. On SMP systems without Zalasr, retain the
relaxed AMO plus directional fence sequence. On SMP systems with
Zalasr, select an annotated AMO plus a nop. Keep the existing plain-AMO
lowering for uniprocessor builds.

This optimizes both 32-bit and native 64-bit atomics. Relaxed operations
remain plain AMOs, while fully ordered operations continue to use aqrl.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
Co-developed-by: Qingwei Hu <qingwei.hu@bytedance.com>
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 arch/riscv/include/asm/atomic.h | 76 ++++++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 03d477a65dc6e..9f28e98fcd6bf 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -102,6 +102,38 @@ c_type arch_atomic##prefix##_fetch_##op##_relaxed(c_type i,		\
 	return ret;							\
 }									\
 static __always_inline							\
+c_type arch_atomic##prefix##_fetch_##op##_acquire(c_type i,		\
+						  atomic##prefix##_t *v)	\
+{									\
+	register c_type ret;						\
+	__asm__ __volatile__ (						\
+		RISCV_ZALASR_SMP_ALTERNATIVE(				\
+			"	amo" #asm_op "." #asm_type " %1, %2, %0\n", \
+			"	amo" #asm_op "." #asm_type ".aq %1, %2, %0\n") \
+		: "+A" (v->counter), "=r" (ret)			\
+		: "r" (I)						\
+		: "memory");						\
+	__asm__ __volatile__ (RISCV_ZALASR_SMP_ALTERNATIVE(		\
+		RISCV_ACQUIRE_BARRIER, __nops(1)) ::: "memory");	\
+	return ret;							\
+}									\
+static __always_inline							\
+c_type arch_atomic##prefix##_fetch_##op##_release(c_type i,		\
+						  atomic##prefix##_t *v)	\
+{									\
+	register c_type ret;						\
+	__asm__ __volatile__ (RISCV_ZALASR_SMP_ALTERNATIVE(		\
+		RISCV_RELEASE_BARRIER, __nops(1)) ::: "memory");	\
+	__asm__ __volatile__ (						\
+		RISCV_ZALASR_SMP_ALTERNATIVE(				\
+			"	amo" #asm_op "." #asm_type " %1, %2, %0\n", \
+			"	amo" #asm_op "." #asm_type ".rl %1, %2, %0\n") \
+		: "+A" (v->counter), "=r" (ret)			\
+		: "r" (I)						\
+		: "memory");						\
+	return ret;							\
+}									\
+static __always_inline							\
 c_type arch_atomic##prefix##_fetch_##op(c_type i, atomic##prefix##_t *v)	\
 {									\
 	register c_type ret;						\
@@ -118,12 +150,24 @@ static __always_inline							\
 c_type arch_atomic##prefix##_##op##_return_relaxed(c_type i,		\
 					      atomic##prefix##_t *v)	\
 {									\
-        return arch_atomic##prefix##_fetch_##op##_relaxed(i, v) c_op I;	\
+	return arch_atomic##prefix##_fetch_##op##_relaxed(i, v) c_op I;\
+}									\
+static __always_inline							\
+c_type arch_atomic##prefix##_##op##_return_acquire(c_type i,		\
+						   atomic##prefix##_t *v) \
+{									\
+	return arch_atomic##prefix##_fetch_##op##_acquire(i, v) c_op I; \
+}									\
+static __always_inline							\
+c_type arch_atomic##prefix##_##op##_return_release(c_type i,		\
+						   atomic##prefix##_t *v) \
+{									\
+	return arch_atomic##prefix##_fetch_##op##_release(i, v) c_op I; \
 }									\
 static __always_inline							\
 c_type arch_atomic##prefix##_##op##_return(c_type i, atomic##prefix##_t *v)	\
 {									\
-        return arch_atomic##prefix##_fetch_##op(i, v) c_op I;		\
+	return arch_atomic##prefix##_fetch_##op(i, v) c_op I;		\
 }
 
 #ifdef CONFIG_GENERIC_ATOMIC64
@@ -143,22 +187,38 @@ ATOMIC_OPS(sub, add, +, -i)
 
 #define arch_atomic_add_return_relaxed	arch_atomic_add_return_relaxed
 #define arch_atomic_sub_return_relaxed	arch_atomic_sub_return_relaxed
+#define arch_atomic_add_return_acquire	arch_atomic_add_return_acquire
+#define arch_atomic_sub_return_acquire	arch_atomic_sub_return_acquire
+#define arch_atomic_add_return_release	arch_atomic_add_return_release
+#define arch_atomic_sub_return_release	arch_atomic_sub_return_release
 #define arch_atomic_add_return		arch_atomic_add_return
 #define arch_atomic_sub_return		arch_atomic_sub_return
 
 #define arch_atomic_fetch_add_relaxed	arch_atomic_fetch_add_relaxed
 #define arch_atomic_fetch_sub_relaxed	arch_atomic_fetch_sub_relaxed
+#define arch_atomic_fetch_add_acquire	arch_atomic_fetch_add_acquire
+#define arch_atomic_fetch_sub_acquire	arch_atomic_fetch_sub_acquire
+#define arch_atomic_fetch_add_release	arch_atomic_fetch_add_release
+#define arch_atomic_fetch_sub_release	arch_atomic_fetch_sub_release
 #define arch_atomic_fetch_add		arch_atomic_fetch_add
 #define arch_atomic_fetch_sub		arch_atomic_fetch_sub
 
 #ifndef CONFIG_GENERIC_ATOMIC64
 #define arch_atomic64_add_return_relaxed	arch_atomic64_add_return_relaxed
 #define arch_atomic64_sub_return_relaxed	arch_atomic64_sub_return_relaxed
+#define arch_atomic64_add_return_acquire	arch_atomic64_add_return_acquire
+#define arch_atomic64_sub_return_acquire	arch_atomic64_sub_return_acquire
+#define arch_atomic64_add_return_release	arch_atomic64_add_return_release
+#define arch_atomic64_sub_return_release	arch_atomic64_sub_return_release
 #define arch_atomic64_add_return		arch_atomic64_add_return
 #define arch_atomic64_sub_return		arch_atomic64_sub_return
 
 #define arch_atomic64_fetch_add_relaxed	arch_atomic64_fetch_add_relaxed
 #define arch_atomic64_fetch_sub_relaxed	arch_atomic64_fetch_sub_relaxed
+#define arch_atomic64_fetch_add_acquire	arch_atomic64_fetch_add_acquire
+#define arch_atomic64_fetch_sub_acquire	arch_atomic64_fetch_sub_acquire
+#define arch_atomic64_fetch_add_release	arch_atomic64_fetch_add_release
+#define arch_atomic64_fetch_sub_release	arch_atomic64_fetch_sub_release
 #define arch_atomic64_fetch_add		arch_atomic64_fetch_add
 #define arch_atomic64_fetch_sub		arch_atomic64_fetch_sub
 #endif
@@ -181,6 +241,12 @@ ATOMIC_OPS(xor, xor, i)
 #define arch_atomic_fetch_and_relaxed	arch_atomic_fetch_and_relaxed
 #define arch_atomic_fetch_or_relaxed	arch_atomic_fetch_or_relaxed
 #define arch_atomic_fetch_xor_relaxed	arch_atomic_fetch_xor_relaxed
+#define arch_atomic_fetch_and_acquire	arch_atomic_fetch_and_acquire
+#define arch_atomic_fetch_or_acquire	arch_atomic_fetch_or_acquire
+#define arch_atomic_fetch_xor_acquire	arch_atomic_fetch_xor_acquire
+#define arch_atomic_fetch_and_release	arch_atomic_fetch_and_release
+#define arch_atomic_fetch_or_release	arch_atomic_fetch_or_release
+#define arch_atomic_fetch_xor_release	arch_atomic_fetch_xor_release
 #define arch_atomic_fetch_and		arch_atomic_fetch_and
 #define arch_atomic_fetch_or		arch_atomic_fetch_or
 #define arch_atomic_fetch_xor		arch_atomic_fetch_xor
@@ -189,6 +255,12 @@ ATOMIC_OPS(xor, xor, i)
 #define arch_atomic64_fetch_and_relaxed	arch_atomic64_fetch_and_relaxed
 #define arch_atomic64_fetch_or_relaxed	arch_atomic64_fetch_or_relaxed
 #define arch_atomic64_fetch_xor_relaxed	arch_atomic64_fetch_xor_relaxed
+#define arch_atomic64_fetch_and_acquire	arch_atomic64_fetch_and_acquire
+#define arch_atomic64_fetch_or_acquire	arch_atomic64_fetch_or_acquire
+#define arch_atomic64_fetch_xor_acquire	arch_atomic64_fetch_xor_acquire
+#define arch_atomic64_fetch_and_release	arch_atomic64_fetch_and_release
+#define arch_atomic64_fetch_or_release	arch_atomic64_fetch_or_release
+#define arch_atomic64_fetch_xor_release	arch_atomic64_fetch_xor_release
 #define arch_atomic64_fetch_and		arch_atomic64_fetch_and
 #define arch_atomic64_fetch_or		arch_atomic64_fetch_or
 #define arch_atomic64_fetch_xor		arch_atomic64_fetch_xor
-- 
2.39.5

