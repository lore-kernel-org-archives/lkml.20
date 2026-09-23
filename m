Received: from mail-ej2-f20.google.com (mail-ej2-f20.google.com [74.125.228.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8193F7AA8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194768; cv=none; b=OmU8UXXc7JuxxCvr1TE/u1ON0V5F4IJp1VIEACKv4lvH/8jWjiQidZk4fBWXdioe7HN5GH6BYstS03jBtyqEqCiHdmki+RIA6xqiL0rzfxO4+CBr3wH4JhguBtYMNOS3bR6iUpDbPT8CXwLG8XRTwVkwOJb73lk35uC4PHArw44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194768; c=relaxed/simple;
	bh=LQwGWaSUCyV6P2RE8COWcXuJNQ6L+hNmHeoyYuwXRxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XxdcAbKSGta/hscCmF9sgi71r88mlpg5Ee7VE6T0kPJmAtT3ryj/7X1P9F/TlxmoAffVqtAopBmYF1UpJXVDfL2psMKIbsrzGYXY9ZXx64GzADYXG22DpxRXyF4XaUINAqgk2jLEDyBMctZ3brbAxZybZHO4EGl46xkvPlarhDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qIAa72YK; arc=none smtp.client-ip=74.125.228.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qIAa72YK"
Received: by mail-ej2-f20.google.com with SMTP id a640c23a62f3a-c293c683202so209018066b.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194761; x=1790799561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c8bT5gThy+ia4/Qr5Ql/txaiXmBbXP80XdJ68NHOdVU=;
        b=qIAa72YKTydPYGawugTA05UZG85wlFhqwmD1k30BBGUCe00y5ykonlX+2mX+hhaFbN
         hu4F/14GfwVgG55FkUzzkXeYdMXlDOy6+GVyxZwEpmFB4QxoBPdjMp7V/oZG15iAj7Oi
         FRgQlmy4bnrAMXibXwozYzBMxvgDYAIXUG6fEfs2ZxYZUKzhTSJE+VQG32fDcg7eQBMT
         c/ZMw7lB+tx06YbIFwG2suxfu+BAStBQ0/yb4jOKPmADOS/mpTRw/RpTkR6O5hmrHjvi
         7b6PHUoqDVkDNd4Mxtsmy+qAoR0fP2WXwhTpWs+2Qlg2zsC13DauilZrr1KDVQDZt4iV
         e4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194761; x=1790799561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c8bT5gThy+ia4/Qr5Ql/txaiXmBbXP80XdJ68NHOdVU=;
        b=JN9rfhbSYi+IdUdS2RUc82H4rFcYRVIiVSk1vVXe/OI7u2/ZC+eIF3anMV/Vreck+l
         55DUByFISyBXJdguIeQ4rEDQX72YchnCcfrVj4opcq2dLCNjaLT5kw1rBI7cMZ4q/aKo
         86aaiVprRS0EmALMh+1au8ZgPzq26h2x9m+psDUqqcA4K00EhzVeaKMzOuQRbkdJezld
         ErSLcgSH5NwAE6xFDovpfC4JzEw4fv0QWjyttU1/YNiWrj7vAPXPLlAlWMX4YNxbWoW2
         bJcPUVlKaMtGlZUc3dbX7tXcacbCrahvwYfl4gojkbCUVUnIOomtSO6yYnSSvs8RdsTM
         3YAg==
X-Forwarded-Encrypted: i=1; AKwUvBy1FgmeIdXP7q0dqyFMyZkeOd/SxKdrhIoVVrCxaKt51HqJf/aEtwP5d8f9ErPyLMqmWXg/YflQ3rSQBLU=@vger.kernel.org
X-Gm-Message-State: AFuF++lDuvRIH3LqwJf5g5SYxUDdRju5tpPnB9qUxO1tIuRjEFX6EPwZ
	L2XYPvrj8LXdA9VAeM2/140qPma2VNNlsblurIbUr7hnuiln/GfcBCzd
X-Gm-Gg: AYBFou2d/dA+fSPmTHA3fIrS4F/PwJz7JmCuUuXsNDt2NrnRAVxZdEo7+LwrN+1umKQ
	LZs0oZyjgWbLsAPqF1rCfurdr+nisbHiUGhf12TFDCFb6OQ7vYo769nUkjSCUv0ybm8RDWWXkdw
	1FDwZGhbGH5qtVmAVrBGrADZDZ2qmKDRCfOZ32bns2W3XudIs+cnrzwkAKopM5/uGS0vBvYfZna
	7Vf0NNkYr6FHoGn6G5Rn8UeX4uGTNKrhD1j3VwepmrXa4KQifp2Bq/l9PibB6orJkekzr6L/zFT
	CN78as3aMdcUZkTNMUzjEDmPbYBLaumPuAi9m+MtPCuCIeXoroqGmLJ32YNXsiyy7jdBFrrikZ5
	mU/HGERC5cPxa4NMnaBqrNfXfbmMI1FET53OZ8scodr0/4dzUxlDV5yjKLILy0x3xrxfXq1ZN/c
	+dAp5TwOaNGRpd5ngkHLQW5VtHYT9+Z7JamGlnvg2ckgDQYraRsAHJl2abhADqQN5qHAHrmUrVq
	ddrehYTEvhuR7f88vVihnKRHjORNSJR9GrRY9xu
X-Received: by 2002:a17:907:3d08:b0:c26:2c3d:67aa with SMTP id a640c23a62f3a-c2ac2373eb0mr21656366b.47.1790194761401;
        Wed, 23 Sep 2026 13:19:21 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae63dc17sm183626966b.33.2026.09.23.13.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:19:21 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [RFC PATCH 4/5] sparc32: advertise the compare-and-swap trap in AT_HWCAP
Date: Wed, 23 Sep 2026 22:17:20 +0200
Message-ID: <20260923201830.865553-5-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201830.865553-1-linmag7@gmail.com>
References: <20260923201830.865553-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A process that wants the kernel to perform a compare-and-swap has no way
to find out whether this kernel will do it, and issuing the trap to find
out is not an option: on a kernel without it the trap is a bad trap and
the process dies.

Guessing is worse than dying. On sparc64 ta 0x11 is not an illegal
instruction but the old 64-bit system call trap, so a process that issued
it there would make a wild syscall rather than take a signal.

Advertise it in AT_HWCAP so the question can be asked first.  Bit
0x10000000 is unused on sparc32 and on sparc64, so it reads as clear in
exactly the cases where the trap is absent: an older kernel, or sparc64
compat mode, where a 32-bit process reads its hwcap word from elf_64.h.
Reserve the same bit there with a comment so it is not handed to something
else later and mistaken for this.

A caller that finds the bit clear must fall back to whatever it can do by
itself or report the operation unsupported. A private lock is not a
general answer: it cannot make a word atomic against another process,
which is the reason for the trap in the first place.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/include/asm/elf_32.h | 7 ++++++-
 arch/sparc/include/asm/elf_64.h | 3 +++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/sparc/include/asm/elf_32.h b/arch/sparc/include/asm/elf_32.h
index 37a6016c9ccd..c60d803cf556 100644
--- a/arch/sparc/include/asm/elf_32.h
+++ b/arch/sparc/include/asm/elf_32.h
@@ -64,6 +64,10 @@
 #define HWCAP_SPARC_MULDIV      8
 #define HWCAP_SPARC_V9		16
 #define HWCAP_SPARC_ULTRA3	32
+/* Kernel compare-and-swap trap available; see
+ * Documentation/arch/sparc/cas-trap.rst.  Do not issue the trap if clear.
+ */
+#define HWCAP_SPARC_CASTRAP	0x10000000
 
 #define CORE_DUMP_USE_REGSET
 
@@ -121,7 +125,8 @@ typedef struct {
 
 /* Most sun4m's have them all.  */
 #define ELF_HWCAP	(HWCAP_SPARC_FLUSH | HWCAP_SPARC_STBAR | \
-			 HWCAP_SPARC_SWAP | HWCAP_SPARC_MULDIV)
+			 HWCAP_SPARC_SWAP | HWCAP_SPARC_MULDIV | \
+			 HWCAP_SPARC_CASTRAP)
 
 /* This yields a string that ld.so will use to load implementation
    specific libraries for optimization.  This is more specific in
diff --git a/arch/sparc/include/asm/elf_64.h b/arch/sparc/include/asm/elf_64.h
index 694ed081cf8d..a2117a81b6d8 100644
--- a/arch/sparc/include/asm/elf_64.h
+++ b/arch/sparc/include/asm/elf_64.h
@@ -98,6 +98,9 @@
  */
 #define HWCAP_SPARC_CRYPTO	0x04000000 /* CRYPTO insns available */
 #define HWCAP_SPARC_ADI		0x08000000 /* ADI available */
+/* 0x10000000 is HWCAP_SPARC_CASTRAP on sparc32 and must stay clear here;
+ * a 32-bit process reads this word too and there is no such trap on sparc64.
+ */
 
 #define CORE_DUMP_USE_REGSET
 
-- 
2.43.0

