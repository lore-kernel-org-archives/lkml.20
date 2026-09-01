Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE0E48124C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277923; cv=none; b=BxBc6WOqUiZD1QB6DEAe/WxpvCsESc9+cL2zQgE3NxpgTefzNWRcLTqKSJiRI2co0+iL85qtghgtzDUZlKLzIl8bNBn5itVCYQZHIuOU6bjX6sDqtmDdc/Ii8tAfFYDUtK0D0MDPiv8oobB7FjCBePAOvFRMc4X2lDy13V4TvlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277923; c=relaxed/simple;
	bh=IrmQJrQjYW+syS3MPKmmU1lmLYVrnTHLsRqpvL2AFm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uZyrb4js4kxijGpjieXGYJ1lzMCheJZ29AsHXunXSak0y1PA2C82qEM7Qf6SpjGMmNdXInoqe+LDr4+dPmcVKHsn+9ugESUNLL7/maVq7rVDXZpHXnsI9Ig91JTy10UoM1ct5Z44UhXx/EBJgcB4JIptrXq8hGP5R1B3t0U8Wl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfuozS14; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfuozS14"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66e64e6e3fbso2572190d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277921; x=1788882721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5IKO4hnaZLZeyuDf2VX90nf4DpZe8sYuTvGzkkGTBlw=;
        b=GfuozS14Z76blgr+lSTuzavO7jVik06zqKWyLsSQFQDJvtZd29pnfYjk2yggB+bJ/T
         AmQZih8BVYSvpZQN8rK/jNy0ubN8jXxx4AVAGkH0lMCuelAJayywzZfQkaSrKRvKcmoq
         zlIKSzqXoj4i75Sjzhi4q7MkUlZVOhrosIkJF7tdgxSqZJwYlx4O6DV/d9ohYL8aI8W1
         hEYsTAQhM4xAVWEDjWAVk1EXzxCjWgJSfRk+WM/CMBe/7qM15Mla8Q40gLSv1am+PElZ
         yjBens9XdzxvIEt/KuV13pwyyUiytF6M989/lJEULc5t8tQEjlN0wOO7L5LQ3b1Ls4Kr
         GFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277921; x=1788882721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5IKO4hnaZLZeyuDf2VX90nf4DpZe8sYuTvGzkkGTBlw=;
        b=ra1Cev+9MhJRA9L7P/JJ7rknwXtxr0t4kPRgo5Gku1CGydnQxyyq6iwnnSLOeBa5lK
         2GVqImgxNXvxEhf7EgpG9qbc0P8x9kudG6bhEaJTd78lRb4pnGuGQCVudoDiEwnZgrGi
         wfL8cJw9i7iS2jMzfr7udnvbPbkx6KLnFxJASwgXyu+co7WufbgZaKpe6vMf/Hq9kfrl
         /oWdLmvcWN8y7im5Rf9W3znrvg0d2yQ4m2VrK+r2KdVVArieyzbF5KABAK9Qdn0Gru0V
         cjgZRevR728Fzhh1b1uG7+z5gvv1H9re0Ha281Qk5cseTvfgCR8mvhcPcO7s2pXvrC7o
         mfwQ==
X-Forwarded-Encrypted: i=1; AHgh+RqDm6aMcbPiGpGD4rIUNSjHKZVJtQ9VCtYfuS+BOIS4yAW3YYGgSHFIQGRReN+4ARQsUwvDsoxSo93Q1V8=@vger.kernel.org
X-Gm-Message-State: AFuF++ngtAOFr3UtzZ8mCeiesis0HflgFFo/YTZVidKsM9IPxEIOQP1d
	23PbO+X8Z9DhzYjDVHiyGfqMSS1qEYYtzZVpVUrNh/zBOCswpisEosWd3+pq9w==
X-Gm-Gg: AR+sD11pL5nW4t31Vi25QO47eGeWOL62Q8CoIivgXJsUpkiXv3IWI5aR3T3NuCTxIRy
	PRsNQ54u24uRoztIAkaIPpl/EK7Ny6BqhUGRv4EvG2jknNKQWf8WlRxkt5T3Jewvdg6RJ8sUxT4
	M/PhFTXwku0VHSjjQ4G+UBlDo33wSyZueJJPzdxGLmShI8Cyje8UFfu9wTILjDuW8qPhXEwPct6
	jLL4I1qpwlVsdUiW+wtPw1Yj3wGvRkdweHRVR0No3ImjFmuqqugRnTCannw+BJDcHSRRnGRRSVP
	POibuu3xta+f808VYpGdEWl98FlwjK1HtdxobmXTXsMMdYAuBewDlcGWdDehj9XJvRJUSS5GPe6
	G/tgMtKZqrTXrWhfgpYvZ99dUen0dGz+0LSbHBqxykoCRHwH5pDybcrzBKJKp0IH6bSnwkA6Zna
	sqvQnBK1lEVucn3Ti1TjdHvhYCFm94HooPHQOzJl2ehpUj5Gz9YLmCJHaaKZ1ION6y2Z7MZCqc8
	RaJEI0hFvdz/NwkqMRH6v/+FaarquQB0jAZ8S2rEVm4zFyafdI=
X-Received: by 2002:a05:690e:158a:20b0:66d:2c09:fb70 with SMTP id 956f58d0204a3-66f87256fc5mr2971313d50.0.1788277921001;
        Tue, 01 Sep 2026 08:52:01 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66e4ed163bcsm8657591d50.16.2026.09.01.08.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:59 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 23/24] alpha: select SPARSE_IRQ
Date: Tue,  1 Sep 2026 11:50:36 -0400
Message-ID: <def73d988ac3cee7f6454637902a296648c25d0b.1788277742.git.mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788277742.git.mattst88@gmail.com>
References: <cover.1788277742.git.mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NR_IRQS on Alpha is sized for the largest configuration each platform
supports, and for Marvel that is 32 PIDs, or 32784 interrupts.  Without
SPARSE_IRQ that becomes a static irq_desc[] array of 12.6 MB in .data,
carried by every Marvel and every generic kernel regardless of how many
interrupts the machine actually has.  A real ES47 uses 87 of them.

That is not just wasted memory, it constrains where the kernel can be
loaded.  The image links at a fixed 0xfffffc0001010000, just above the
console's low memory reservation, and with memory striping enabled the
console leaves only about 16 MB of usable low memory before the rest is
relocated to an interleaved aperture.  A 12.6 MB array of mostly unused
interrupt descriptors is the difference between fitting and not.

Alpha already goes through irq_to_desc() rather than indexing irq_desc[]
directly, so nothing stands in the way.  The platforms do wire up their
interrupts by number, though, which needs the descriptors to exist by
then, so provide arch_probe_nr_irqs() returning the machine vector's
count instead of taking the NR_IRQS_LEGACY default.  Without it every
interrupt above 15 would have no descriptor and the handler setup would
be silently dropped.

Tested on an ES47 (Marvel, 2 EV7z): boots with all device interrupts
working, and .data drops by 12.6 MB, from 15.7 MB to 3.1 MB.
---
 arch/alpha/Kconfig            |  1 +
 arch/alpha/kernel/irq_alpha.c | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index 74d13a29b8a9..06c3e55f01f2 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -62,6 +62,7 @@ config ALPHA
 	select CPU_NO_EFFICIENT_FFS if !ALPHA_EV67
 	select MMU_GATHER_NO_RANGE
 	select MMU_GATHER_RCU_TABLE_FREE
+	select SPARSE_IRQ
 	select SPARSEMEM_EXTREME if SPARSEMEM
 	select SYSCTL_EXCEPTION_TRACE
 	select ZONE_DMA
diff --git ./arch/alpha/kernel/irq_alpha.c ./arch/alpha/kernel/irq_alpha.c
index 1b799aafb7dc..3274568d6d52 100644
--- ./arch/alpha/kernel/irq_alpha.c
+++ ./arch/alpha/kernel/irq_alpha.c
@@ -148,6 +148,19 @@ common_init_isa_dma(void)
 	outb(0, DMA2_CLR_MASK_REG);
 }
 
+/*
+ * The platforms wire up their interrupts by calling into the generic irq
+ * code with fixed interrupt numbers, so the descriptors have to exist by
+ * then.  Preallocate the machine's full complement rather than take the
+ * NR_IRQS_LEGACY default, which would leave everything above IRQ 15
+ * without a descriptor and silently drop the handler setup.
+ */
+int __init
+arch_probe_nr_irqs(void)
+{
+	return alpha_mv.nr_irqs;
+}
+
 void __init
 init_IRQ(void)
 {
-- 
2.54.0

