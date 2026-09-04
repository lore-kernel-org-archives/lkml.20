Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE2C48D867
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526171; cv=none; b=Zbhi214TwP5n0Tj89YdnCm3t7KoQ5TKzcFFJypKsFZxd8jfIK2pGXOImMeXi8bhb7V1rCmEYpNcnYO7gviYvrhtJjjWN11hcTF1AvFquaKtIbcuiMok6Fy51FrSsLfMJOzoRf4Yd0C9w3SiLUg7YpeLO3brBUXAiA6dtrfpL338=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526171; c=relaxed/simple;
	bh=xMjw9BhExwYqDYeIkaOl/TPJ4YYBM962+ei6WlmFjNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J8RUxwi12dk7RQKNTsVFPVnYaBAQaAfX2PPXlEmiwJF7eoGaH7Rk3G2A7POreO9Lj1bPdj6m58/0egp3XD27USp2txxKKA46zciokigA/xyvNZhNOctf7PORbs55JsHBkbJy4Q2c0Kj7k0wcxVmSmHAyrTjlQoImduw4DwyJbLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPlc3VMk; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPlc3VMk"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1c3d79b9bso830696a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788526169; x=1789130969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kdc2eyHvO2C+AVSkBspXm1DrZERrlD721EvxKBzLlTk=;
        b=mPlc3VMkpYHSSRCc34m5bwb/2+eEvaksZ5YGbVas43N/Q1J3mr87VUp/RvdARwXgl6
         tATUrkrc2gODeN7f1GvyHpXPviTYWlIKXdDiyBWon6WaR3H+0o6uE+o8lkMl8cCGCpfJ
         UUwr80bNiq66PFBMYUmJn5YudPcetDtqv9IEY2grwSLZs4I2Phd4IrNg1On9IjGzJN7N
         bsvm2YrWXiA4bsiERMFoQ9ZWPAMs+4a811Q1tEZ6P/5H6t0rXylvqAd5yX9u0LLOV3hZ
         s8QTwB5kYs8IhRgTkwacWy3FvidHURmcq+DWBP6PY/GsB1XEjp3vr2Ih/jyhMQ13nDml
         gGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526169; x=1789130969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kdc2eyHvO2C+AVSkBspXm1DrZERrlD721EvxKBzLlTk=;
        b=GVdU20TasxTNn4ypiSeCaZ16gcdGwHlxX8U/HFZabIF1pqJyUY/8BRVEACbJiz6gmu
         9R5tlMgT/0s8C8Rt2FNQDTi7Bgqzs+5Wlf6eM6T+YwaAoEoF4B9HFUhYmdKNrLUb/C1V
         tcN3FwxxcE18KEmbr1XeN/XmZIMATyvLgf6h/DR3fmatzNYAf1Aek73eacdOoMBDHIjd
         cDX7Ce5ZBg+QOo1xrRtyvf+8zbN+hZngvAZF9dZZiDEC6ArcP7v6xrtvya6sr2YvnR7s
         bewISjHugJyZkmVahHu9wd4ZQ957LJOdXPtIhRcpVMaCoLL3aE06o4UEaC98XaNOxNPU
         qgRw==
X-Gm-Message-State: AFuF++mgflPtC+XW9oGTDOlevDr74xqrj2vYmTUdLirxnvHTp2QDAJ4t
	zowqdAEUyf80vUoJxeBtwjHT16cwg7F0AqbNQbL7yWh7grgVT3coVOT4
X-Gm-Gg: AYBFou0RdnFrthvmznYkJWg3/b+v2hvQ45C0harhsIvIZmQO+V0+rzZ7YobHHDUgDIJ
	tu+ejetp+GJjkDLk9eWPdgHMvmBoCFb8aZ/mD0679KyUUG1mBCr2PtggftMxMhHFpfus5tavaG6
	SFSn4Zbjkd7QKhHHfU0ROK6tCDjMOHSAwfsaaixElmhAtBU5nI3igTFqDkfqnLjBsnwECHkcMXD
	98y+6hOFR3cBPw07qzqRGKQu092ou9AyYqdkQvPVXBiin/+coy2z4gaGyHMVqn0JYfY5bQCosSF
	4B8iRwS6N1SE4/tmX/XsSVhOpOgH8PssTmOGsJjSZhBvDBXBYFzV5oyZ+4QWyMXZ2qV4V41VoxT
	NEJM/PuLbL34UPU+DlCwyDlx1hnl4dZrbEIBOJOSXyN309VMOuJqOmARw8ANeTrc8Qrl4RBj0W8
	eV920c1xWnmx6iA4dFv1lSf+F0Zmz3Yz4k/EPNMvmLsME2ui3ykGi3DeXZDO9nFTq/oGirxcKHr
	jluB4xf8Pyl7Vg=
X-Received: by 2002:a17:90b:2784:b0:395:4de5:1054 with SMTP id 98e67ed59e1d1-39b26272bdcmr10176213a91.16.1788526169321;
        Fri, 04 Sep 2026 05:49:29 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm7328079eec.30.2026.09.04.05.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:49:28 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH 1/2] MIPS: fix typos in comments
Date: Fri,  4 Sep 2026 18:19:19 +0530
Message-ID: <20260904124922.10256-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904124922.10256-1-hemanth.selam@gmail.com>
References: <20260904124922.10256-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/mips/include/asm/mach-loongson64/boot_param.h | 2 +-
 arch/mips/n64/init.c                               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
index 3a11ce85762b..3e5c2b3a7f9b 100644
--- a/arch/mips/include/asm/mach-loongson64/boot_param.h
+++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
@@ -24,7 +24,7 @@
 struct efi_memory_map_loongson {
 	u16 vers;	/* version of efi_memory_map */
 	u32 nr_map;	/* number of memory_maps */
-	u32 mem_freq;	/* memory frequence */
+	u32 mem_freq;	/* memory frequency */
 	struct mem_map {
 		u32 node_id;	/* node_id which memory attached to */
 		u32 mem_type;	/* system memory, pci memory, pci io, etc. */
diff --git a/arch/mips/n64/init.c b/arch/mips/n64/init.c
index 66ec28ab41f3..ddbd7d1224d3 100644
--- a/arch/mips/n64/init.c
+++ b/arch/mips/n64/init.c
@@ -20,7 +20,7 @@
 #define IO_MEM_RESOURCE_END	0x1fffffffUL
 
 /*
- * System-specifc irq names for clarity
+ * System-specific irq names for clarity
  */
 #define MIPS_CPU_IRQ(x)		(MIPS_CPU_IRQ_BASE + (x))
 #define MIPS_SOFTINT0_IRQ	MIPS_CPU_IRQ(0)
-- 
2.48.1

