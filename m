Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D782F3B47C9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334348; cv=none; b=WtWjOodwwpFtoj285/hLjreQ0TbAU/YGd++Nad6q27ewNC43jf3AdLnlC9bovCq876LKKJzl0/zwN/ESMIupfqBKqFwQf/tgbMRpXcVyugKfc2xWrSvDEPBJjqbzHNEa4EYIwDz2hrhUJtcFuLMMuPJuD0XdlK76wzsbS8xlWSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334348; c=relaxed/simple;
	bh=Y6IX8/0lLvnQsuCIT3ysVkmxDeCp9TsVFX+CxW/Z7ZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MmXhnNmsmQ45BPey5g3vbmFERNchj4euz1V682ft4Q+eIuu+4jlXJB9Kc4PFIbhYmzeKUe1ZNVwxHrtg5OB8sqenbIASvOoHjevgYLifJeRhNAYYCjHubJV16zu+5bmERA6LB40P979uxX4+AcCn91kTpA9WowABdgbLWHtiu2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wq8+Lw2S; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wq8+Lw2S"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-ca7fcfe1669so413499a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334345; x=1788939145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cwr70l9V39DZcorg71LVRPBxIRt7bXPqTCF0S2pUJMg=;
        b=Wq8+Lw2Sy6oxptoeLoRVy05T4J52rW+Hf8H/j9h055yyAF/eEokcINZe4hdP9mjd17
         /hbiuTuAESY6aLdlWAWDykpuluZxlPKXZRmvaXypsODiEG/vuSfYCjF+EdgrqSaEzcpg
         SWr2s+0jPx4jOHxlTnf+dI57sxOiqSwgVVGgrrOmvwkrLTuSIoUVIo2kgwO7AyvBh1rc
         0b0usJYtFgL8PNR5XevjF7r5bHq1Ra5FEmeC1XK4ZWGFgaaunNtJDi4AL5S2Y5ePRorR
         LIR0FwtIrya87Q+C+zYBLn1xmoOfbdDA2141UAsX5vCfwfBcWmpQxh03q1uJYzmZle4Y
         ibmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334345; x=1788939145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cwr70l9V39DZcorg71LVRPBxIRt7bXPqTCF0S2pUJMg=;
        b=cy9lXSgzaTBorPR5Yt/5W/x+2yOptBAvgInYZhfRCATSbdugK8I7OqJcTf1iTl6FEr
         0FOLpC8nral1CWC3pealkgpDle2QoZwtw7Btw6b/6K3Hj6C7XKgz8b80zsCbVktxkYcr
         3PTlU9zwFMSUDrwc6EHQT9DEd0Guev3BzKJFfsLTcGzPgKi/N//rE0OPzbY1cytmEFCR
         qZjwlB8X3E2/IqTF++vE5pIDC/jW81eMFiPdn3q5ZChkbk6C/fsR3n12hbXMMFy7KYpA
         /NdCay41otCociBB6Yc6+2Ygybv+/4CPcXkk/XBfZoOI/EbTtoioHjwDTFlBpCa2Ba2z
         6RlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqOmbtrzaCtA2pzAtR1dcIVMFgYIcYQpqMZvdtqL81BBOamR7H+ZesGbAxeGCZlgY0SI4Q94oTe5pgymk=@vger.kernel.org
X-Gm-Message-State: AFuF++nakVGNBNAjPEwYKw+EboPXC4sX3o2CjCavrBOBAm71NVB4Vsv8
	xkvyQEttZkpNnu9EpPTUNUvr1yFYadJmLn2YAHnMguHDV/bbQNV6woY+
X-Gm-Gg: AYBFou0hTYX/opG4FxBybowHB8d0q2OLAaeqxVFY7ZQ5s9ris6qe2IO32Xs07sFvxk0
	Jus+jlKASGVPioosRPLpZEHQqjivrtHS07eaH3uRRp4uCkDGD9LJikdSe5kCD8cr4BVx5qINboQ
	kJ57R54EkGCzTYTAsdrp4vJdMwXFY1GcBJoxuVMMFvAMt7qq5kmQi8jV2212sfHjGnJFTTTTpeF
	vx13yIpLEOsSR+klHmug7xSUvcttF71CX6+tAojJGSvoDEKqwZZxtSINEWpqgHvLM3Qx170u3ze
	6EFTz5RMomxU6E5buah7GaUk0llvvWXzfre9JfNUhw5IBExoC+xV0wJ92CWxhtm/VwRO4rqT65S
	K3kbhjW/LUq38qWXkVWKgVwvXp7/nQ+4Pi8j1vDTS8TAFkmaZ/ipv1R7bb9n1Y+ng++Wib8sMfq
	UFzGDdLoFGOctNxZL4jpE1l1AtN6iZqAX5caDpExyxp82BeOamIzp/geE9VMBNh5OQyPyL3TsXU
	Pq5JR1342k=
X-Received: by 2002:a05:6a00:238b:b0:85c:c8db:8e4b with SMTP id d2e1a72fcca58-85ed23dea9emr4650515b3a.6.1788334344871;
        Wed, 02 Sep 2026 00:32:24 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2adcbedsm926914b3a.20.2026.09.02.00.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:32:24 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	m.szyprowski@samsung.com
Cc: mark.rutland@arm.com,
	kernel@xen0n.name,
	alex@ghiti.fr,
	hpa@zytor.com,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v6 04/10] crash_core: serialize crash header preparation against hotplug
Date: Wed,  2 Sep 2026 15:31:10 +0800
Message-ID: <20260902073116.802752-5-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902073116.802752-1-chenwandun1@gmail.com>
References: <20260902073116.802752-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

crash_prepare_headers() counts memory ranges before populating the
allocated crash_mem array. The weak implementation used by ARM64,
RISC-V and LoongArch walks memblock.memory, while x86 performs the same
two-pass operation over system RAM resources. Concurrent memory hotplug
can change range source between the two walks and make the populate
pass overflow cmem->ranges.

Take device_hotplug_lock when preparing crash headers during
kexec_file_load(). The x86 memory hotplug path already takes
device_hotplug_lock, so call __crash_prepare_headers() directly
to avoid recursive locking.

Sashiko reported this issue in [1].

Fixes: 3751e728cef2 ("arm64: kexec_file: add crash dump support")
Fixes: 1bcca8620a91 ("LoongArch: Add crash dump support for kexec_file")
Fixes: 8acea455fafa ("RISC-V: Support for kexec_file on panic")
Fixes: dd5f726076cc ("kexec: support for kexec on panic using new system call")
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Link: https://sashiko.dev/#/message/20260806101002.1F84E1F000E9@smtp.kernel.org [1]
---
 arch/x86/kernel/crash.c    |  2 +-
 include/linux/crash_core.h |  2 ++
 kernel/crash_core.c        | 17 +++++++++++++++--
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index e681ec9cf1dc..284d78bc3fd0 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -465,7 +465,7 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 	 * Create the new elfcorehdr reflecting the changes to CPU and/or
 	 * memory resources.
 	 */
-	if (crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
+	if (__crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz, NULL)) {
 		pr_err("unable to create new elfcorehdr");
 		goto out;
 	}
diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index bc087124cd78..28e7a81cf263 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -61,6 +61,8 @@ extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_ma
 				       void **addr, unsigned long *sz);
 extern int crash_prepare_headers(int need_kernel_map, void **addr,
 				 unsigned long *sz, unsigned long *nr_mem_ranges);
+int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			    unsigned long *nr_mem_ranges);
 extern int crash_exclude_core_ranges(struct crash_mem **cmem);
 
 struct kimage;
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 77285ae3ce60..3adee1ae120c 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -16,6 +16,7 @@
 #include <linux/mm.h>
 #include <linux/cpuhotplug.h>
 #include <linux/memblock.h>
+#include <linux/device.h>
 #include <linux/kmemleak.h>
 #include <linux/crash_core.h>
 #include <linux/reboot.h>
@@ -338,8 +339,8 @@ int crash_exclude_core_ranges(struct crash_mem **cmem)
 	return 0;
 }
 
-int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
-			  unsigned long *nr_mem_ranges)
+int __crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			    unsigned long *nr_mem_ranges)
 {
 	unsigned int max_nr_ranges;
 	struct crash_mem *cmem;
@@ -376,6 +377,18 @@ int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
 	return ret;
 }
 
+int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
+			  unsigned long *nr_mem_ranges)
+{
+	int ret;
+
+	lock_device_hotplug();
+	ret = __crash_prepare_headers(need_kernel_map, addr, sz, nr_mem_ranges);
+	unlock_device_hotplug();
+
+	return ret;
+}
+
 /**
  * crash_exclude_mem_range - exclude a mem range for existing ranges
  * @mem: mem->range contains an array of ranges sorted in ascending order
-- 
2.43.0

