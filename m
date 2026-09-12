Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E0438F93B
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 19:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789242965; cv=none; b=dk2lSZAFgVUXJ0OlQouB8zB9J5vq8hcyWc/0WitvWrVySXVSL+RUGscpyGutRnFf0T1cX7uxhCg5AStgbRynRZKZ/OMth2sc7E5ILVlRFkbN2uNWyHXuC+tikbKFohlJp+ChGXd4yeREpvAn9ZkPKm8sS0AYExm5yM7g8HBrrQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789242965; c=relaxed/simple;
	bh=lambDYX2lwAsI5keUktYfmRvkhvX1OmYUKy53CnCprs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fuxwx10DPZWoAhpQbD/yjUZCidnLhGVqd3NZvZY2SYqM8troWJtYRU6NYr9+jkb6ahEXWz7zq9NFDpCPO7CMTtuOv+j0G9MeaC7KF8uF4YfB0sZKvm4+SxcY2Jlv16fLD7BqPma3SDGJSpJsp0YI2b+iidJuORRX86VPATEJ1S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUivE7Es; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUivE7Es"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso6494825e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789242960; x=1789847760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NwiXawn/cOlpKopFTshA1Oy47KkInxpQCTdPgG/ctyc=;
        b=HUivE7Es62sxR+XLVXov6xp7S3xA7zc5sHg2aPtEm1D76vGg1cOSKxrjCSovHeU7zj
         Z4XWperoqM/Nf13+t4OeR96Ig/PZiaG2eMVn+b0aS7RQPAwJkd3oF2hhQCIal448eu+Q
         LbRCIw7BZceNKu2BD2oaddvMuIswR0fMS3mUzgdptZG/8oCVm1fUvgSLnzjGlMgs4Aws
         IN5tIEcKDkmdm2wkY02rHkEkzo7Fkxw4i+mTh/TKaEIKoEUQFgEpw+6G5930rkhshcrp
         jjDGbby1UGLM/3SL5Loma2LMNtsSftBmNfAbsju/FlhLg7AT08XO9A5ce0zRqZD3F5FB
         X6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789242960; x=1789847760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NwiXawn/cOlpKopFTshA1Oy47KkInxpQCTdPgG/ctyc=;
        b=jMgx4XdkOUUr4U3vUk3L8wr2wXhW1+K0ECAVb6tTXGYjPwE1GlrAqGOBnYLCvD2XsJ
         sf4lnJRzc/4O+ptZifcz/nb/dZ2211uFm5r6rh/z/lQ43bJlSazA3W3BPKJII0VjP9qS
         FFdNy8+mEo29ysqkE+eC4nD0+fCA9epHAXuM3YsaqxBT1avMVoY1GGzWs9sN5YfShTwQ
         UmUevKwzcavMW/AgF8NR4x1JU8k+79GxzgAx8w7U7B1oU5a9aShcP+G8vqmFRpCnlBwc
         QRYJ8xSy0a2YqlYIuWYbmOcXncCIG+OV8Mr7oaMzc/LsG33K/0nCccduNX0OwdYBNlUm
         S+uw==
X-Forwarded-Encrypted: i=1; AKwUvBwpWsZlnVk6uB3k53cOYf5P0H67l/Tqf23oUHq1E8/lw6FV2MmmvcZTPGJqdMFNspb/1F8Vi2bTVwyoUDc=@vger.kernel.org
X-Gm-Message-State: AFuF++l08Y+p5o1FcUG9R1GpIdSc5a/qpr82/oJPgLQ/736FRcpq/E93
	YFSorJvv8NuVsKN0XC2N6Iz3KKRuT704Sc0hd/SF2g+/UvTLRbILyE5s
X-Gm-Gg: AYBFou2hDz9TdYzDUlAMTQI6kOvU77g0sotwpYV0XOCS4Fd3Ebxqq4icISpiNQuUc5T
	3D6o24Gr+zHiBb7lU5sUKx3NuOZDqdFDu5Hak4Hy681CO+Mv+nRKS2UQGLSZt+IKBUf5c5lodIF
	7469S4nsf9M/FaWAlIw+rb1GDZT/WxaLv3FvE1If/ZCmUKL8l2eiFxacfPv7OgAQ7PPKxxhdn6G
	/MsIrKJuHV5HM1CU2nWB3EKr1T/kfeFJL6+HnKa2sWIdEyRf6GNYv9UxvdgM1az6ZQOOK9CpzOg
	/BfML2BBHDIr/UGcSRQqM2FP+ciAjTnXOnP5+PeyCA0jjUGWTc9h9eQnC8lfg2m+Z3ojT619SWt
	TSzWUbQbduSAHR6IfRSmba9etR58GyclipkGv/1OrZEen2Luat3IfSggThdhpoFDtxElRXdTztj
	V3YRNN8aQXVLKW931zbwicPE2SWlnT/jkTRLhwFgDZbFXmUmLRfOsgM5unT9iIZGxK8qyuc3jGZ
	H28aLD/zLLtTK/YzVT4IZ4lIHAqzYCAs5AKy9NFjVFAiIe17tGIA2BHLino1JybkoN+zHWd54xt
	AzF3mleSapQ+xZ0UXb6jtq/pdep3MeeYTNZfh5WFMvDHeCbP7FdCDpsL6AWPIDfFVOcM2IEHANT
	2rLp/CWI=
X-Received: by 2002:a05:600c:8b38:b0:49d:272d:74b4 with SMTP id 5b1f17b1804b1-49e619a1e56mr222951175e9.2.1789242959747;
        Sat, 12 Sep 2026 12:55:59 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm267089045e9.14.2026.09.12.12.55.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 12:55:59 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	Radu Rendec <rrendec@redhat.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/4] ARM: cacheinfo: avoid out-of-bounds write in populate_cache_leaves()
Date: Sat, 12 Sep 2026 21:55:49 +0200
Message-Id: <20260912195552.76673-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260912195552.76673-1-kmehltretter@gmail.com>
References: <20260912195552.76673-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

populate_cache_leaves() advances its bounds-checking index once per
cache level, but split instruction/data caches consume two entries.
CLIDR-based allocation supplies enough entries. Early allocation from
the device tree can supply fewer and expose an out-of-bounds write.

Count each written leaf and stop before a split level that does not
fit. This prepares ARM for DT-based early allocation and matches
commit 875d742cf532 ("arm64: cacheinfo: Avoid out-of-bounds write to
cacheinfo array").

Fixes: a9ff94477836 ("ARM: 9433/2: implement cacheinfo support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
The overrun was reproduced with KASAN on QEMU virt, cortex-a15, using
a device tree whose cpu nodes carry only d-cache-size, so one leaf.
With patch 4 alone the boot reports a slab-out-of-bounds write in
populate_cache_leaves(). With this patch the boot is clean.

 arch/arm/kernel/cacheinfo.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm/kernel/cacheinfo.c b/arch/arm/kernel/cacheinfo.c
index e1469b641780..860eeb03cfe5 100644
--- a/arch/arm/kernel/cacheinfo.c
+++ b/arch/arm/kernel/cacheinfo.c
@@ -151,7 +151,7 @@ int populate_cache_leaves(unsigned int cpu)
 	unsigned int level, idx;
 	enum cache_type type;
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
-	struct cacheinfo *this_leaf = this_cpu_ci->info_list;
+	struct cacheinfo *infos = this_cpu_ci->info_list;
 	unsigned int arch = cpu_architecture();
 
 	/* CLIDR is not present before ARMv7/v7m */
@@ -159,13 +159,15 @@ int populate_cache_leaves(unsigned int cpu)
 		return -EOPNOTSUPP;
 
 	for (idx = 0, level = 1; level <= this_cpu_ci->num_levels &&
-	     idx < this_cpu_ci->num_leaves; idx++, level++) {
+	     idx < this_cpu_ci->num_leaves; level++) {
 		type = get_cache_type(level);
 		if (type == CACHE_TYPE_SEPARATE) {
-			ci_leaf_init(this_leaf++, CACHE_TYPE_DATA, level);
-			ci_leaf_init(this_leaf++, CACHE_TYPE_INST, level);
+			if (idx + 1 >= this_cpu_ci->num_leaves)
+				break;
+			ci_leaf_init(&infos[idx++], CACHE_TYPE_DATA, level);
+			ci_leaf_init(&infos[idx++], CACHE_TYPE_INST, level);
 		} else {
-			ci_leaf_init(this_leaf++, type, level);
+			ci_leaf_init(&infos[idx++], type, level);
 		}
 	}
 
-- 
2.53.0

