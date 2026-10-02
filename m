Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED9E4E020E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790960381; cv=none; b=F6K0maa2BdJiNAAvF8h22U/qIb0HTLK+GCV2AbWijj9+d3PHEbu8ZjqZIzuAeJr3ETRiZ4mBx6ZFhBUdnIgB2SLFifmZdn3PcUcnLXXntmvkuUhvf4Yh4vKd1eAw4M2ShLKE1FRGQ4wrn0p+v/a2diHV+m6A/UL17IzIwhGobjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790960381; c=relaxed/simple;
	bh=kd7OAG6c1iwUyUoZxDoHr392YykdB2Kdbv1eldfS5t4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iRXH2yUROfM9Qv5Zwd4KDoOGX3UDnI2pSw7606lJRbRDbt7UO3DCL3gssdRCJQ+mAxzodeIz8/65OqrhfuaJB24MnYBe4hwpykPWN89CFE0qlAQcgDf3trCnEhVElEcb/s9v7zA6btfoTUqi8kIZHBnGprD9rSvK+XPgYThJmuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=WnQt18WX; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="WnQt18WX"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2e4c841e9bdso1483735ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790960379; x=1791565179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZLuPtuADBRa2rGkYmsXjO56D54ZyazJQSU1TrksMpbM=;
        b=WnQt18WXBxY5Un5WTJAy+icDNBacBGiLilSgPvD0WiwP5uRTUsgIDsVab4uWq8GyAc
         x9OCAxPtGJ2vKQCbBm22ZFAvFuEQ8u0rYaZzdmtQQQGCnq3ccSIYwAw8bem8DJbc59Vr
         MygpxuM43aOe8ay3Ai0QiNAsADKqMii58ZxC0h8tuQyfotDFaL6BPNek9MZVN5ONrpQG
         rhqshmqIyid+AEgb9miio+E8Wzzn3vLJfb43w34yTOBJ6BFzP3h64EViHt+djN9KnSis
         MwTTzSO/4aidPYuIoK5BdwRxpHEaVoIeouM2eeInfc9VdYFPp55QKX2JoKvR62PdufQO
         9Bwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790960379; x=1791565179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZLuPtuADBRa2rGkYmsXjO56D54ZyazJQSU1TrksMpbM=;
        b=mL3IaF6v5sHGlBl1ScXq82dPsnGtGz7uD2ZU74SWnkm4X9t5U5l+UjizP9i+bsCvMF
         2CjSaq+R5gKItIFwaGB7TJ7FcQ0mcWB+xSmyoOixY4jz+o1j4m8ImaWBAY1RL3xesFUP
         FMq3/Yr/GZObHIwBR5XJkYx+H/LSs5o0Chx++ZW5rpdX/0JOVS19+6iLmYuoXCX32w1u
         AOTWOA2+SI+OmQpeWSrM2imswhrijXEJunYqomvOWjCiX2foytXY4uR6/BWiNU5RaKUu
         VBOxZ4f0PcSzywNrWnX7zISJM9KQHV5HGH6DLQoQ2/SE6l3x9NbVt6R+S8fwtLYnnbyD
         YrVA==
X-Gm-Message-State: AFq9FYKxxTdUVy1Sm01L/E7TlxEmeV4eSOykIyOk0RZ4kKe5EKskdX9x
	4J4D+wPbR7lY+z4nJq0f2Rr0oMcKckZW3fvSIRk6QmxeyR11KQh/gsAx8I1+k+RpRtNB6jVj4/q
	LjGBu++kslQ==
X-Gm-Gg: AYBFou1SZcfWrkQaoYe+59wRlta3Wt1SSn6BG5Y9/owIEL61DpdRi8dx8lPb+FSk7YL
	Bk8FWM16X+1u71yANWjpRo1eJi11x7lG3CTVSQL9jGd5VgAo2BawTu8F0f55g5oYm26EDXQrP11
	AN9Taf65ZZYkok4ek6tfZo2nPXRJNzn4vPdpggGakj3xdy3O97o4FQse10ptTTx97FkUwws2LtO
	S+zWshGreHgsg1tByuIFXldGR0Y/6+ivmoS22hqEV3rEfr0b+S+huGeMozPZWpdTXR9D64jeLA2
	FMNQtRznsKT8fGjjllmfP+H9gTYCgb45HKBNusZuVsYQE8rVOjn7Nc032IJV18lm81X+U+2Fs6t
	NkZUyfGKWBNClNrej38n0vMshbkC4vwtIdfGGJRy6mWQ3NMaI1rgLipifcOoU3aWiCR7u38wGaV
	clbpIxpcxbTJMnzN+OBPBUzrG95eBoCplsxs9BimVahCJ4cZyKEWqwDDQ5N/RreEGcyioPCf/CL
	88OoMz0puosCitkItSOJlKC37UCuQ==
X-Received: by 2002:a17:90b:2e4b:b0:3a4:b076:f0e7 with SMTP id 98e67ed59e1d1-3a6ce59f8eemr2982621a91.6.1790960379019;
        Fri, 02 Oct 2026 09:59:39 -0700 (PDT)
Received: from n37-012-226.byted.org ([115.190.40.12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6cd5d88bbsm4900871a91.12.2026.10.02.09.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:59:38 -0700 (PDT)
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
Subject: [PATCH v5 3/5] riscv: Optimize smp_cond_load_acquire() with Zalasr
Date: Sat,  3 Oct 2026 00:59:08 +0800
Message-Id: <20261002165910.3818940-4-qingwei.hu@bytedance.com>
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

From: Yunhui Cui <cuiyunhui@bytedance.com>

The generic smp_cond_load_acquire() implementation spins with relaxed
loads and applies acquire ordering after the condition is satisfied.
With Zalasr, each iteration can use an acquire load instead. The final
satisfying load then provides the required ordering.

Use the Zalasr path only when the extension is available. Keep the
generic relaxed loop followed by smp_acquire__after_ctrl_dep() as the
fallback, and retain Zawrs waiting when configured. Evaluate the
original pointer once and avoid shadowing the helper's private variable.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Co-developed-by: Qingwei Hu <qingwei.hu@bytedance.com>
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
---
 arch/riscv/include/asm/barrier.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index d2200e826ec00..b37ae9544d08e 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -142,6 +142,29 @@ do {									\
 	}								\
 	(typeof(*ptr))VAL;						\
 })
+#define __smp_cond_load_wait(ptr, val)	__cmpwait_relaxed(ptr, val)
+#else
+#define __smp_cond_load_wait(...)	cpu_relax()
+#endif
+
+#ifdef CONFIG_SMP
+#define smp_cond_load_acquire(ptr, cond_expr) ({			\
+	__auto_type __zalasr_ptr = (ptr);				\
+	__unqual_scalar_typeof(*__zalasr_ptr) VAL;			\
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZALASR)) {	\
+		for (;;) {						\
+			/* The satisfying load provides acquire ordering. */ \
+			VAL = smp_load_acquire(__zalasr_ptr);		\
+			if (cond_expr)					\
+				break;					\
+			__smp_cond_load_wait(__zalasr_ptr, VAL);		\
+		}							\
+	} else {							\
+		VAL = smp_cond_load_relaxed(__zalasr_ptr, cond_expr);	\
+		smp_acquire__after_ctrl_dep();				\
+	}								\
+	(typeof(*__zalasr_ptr))VAL;					\
+})
 #endif
 
 #include <asm-generic/barrier.h>
-- 
2.39.5

