Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E66A46AEF4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525295; cv=none; b=jxWsjwwqdI7XQjfUCSdlK5252UD49JAW5PP2jCOp7TfKuq41c1vO3tlrGo1Yv079+FsKl5nIXp3MExWoS9oEa1kEJIZFjHC0q43yh0YKK3KlB6viuRh5Pw5Y9wJaf00Gb6RBSlHV9dCc7SxNNPSz18If5oDCJlE7JYkVSPhfTrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525295; c=relaxed/simple;
	bh=a7Enk69Gb9qnY0DHihsQKRbXaroF1zh7gwuihVPwej0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=faT0wwl8wwPKDh5y5diJzBq5GOWylHnbYPxyjcBD54LZHr0Zdm0Wgxn6gfR/S670VN2NBngwMpkLIWUV6SnV0VSae5B1fNrhpUsCGZ4DrVKVt9Gb7x/Nu7Pqou+6EWEembN2qbt4jvTFh1qhJ1PA7lIwohgNVSPKtGBIXqKH2a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CppMXi/l; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CppMXi/l"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-395cf2535acso1045628a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788525294; x=1789130094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0h8prBNmCcbgcEQm3o7dPvrnfCWXGWTDKECfff92L9Y=;
        b=CppMXi/leJ913tr9oSINZAsnvfD8H1KIE8b9bE/x3s4xCRgLtor5WgDM68K/tRc++e
         OMz12lBqE+uigmDwBSoEq32s/yo7rMwmgAmNjaS8AEtieljOd8SX7ke+Tp8Nq4XN9GWb
         94zIXFyyBOhJkCKAjR71VdEpLaqC3afplNA6XXWGk5sE1LW6nBd153JpBi1SjvYcwnMp
         LFqMZ3EqXY3/SpEGs9PuBUrB5b9iMM+McrgAgGPNyKaizvKwy0N+8JQdFQmbIBC/LS2D
         HBr8QCCCPQEHZy9hKuTMBKCUQWAItDc9CYuv6ndalvCZ9nRP1qfFguQTouDwXKlRyBWP
         lI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525294; x=1789130094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0h8prBNmCcbgcEQm3o7dPvrnfCWXGWTDKECfff92L9Y=;
        b=IbakfMoDmikE2NZ1VAF+yaeCLKafA4AEZY0vlZFMXw8tpozhn53b+V/dyzhqVvyjBx
         QNj3nVimR7us+zIXtQdFw19GC7Tg1TLUQLfkkpZrtqVHEnr3FO9uRtJoZsR0hSxRp/lN
         hLX3Op+oGcU1zu/KsDHp1Kv6jbsb0SLnjqbPaLHOJkgDhwyV4pXLQr0O4SRS0Be3XYm2
         h9SDrq2QT6C8Y0CZkQioLHo8NXUMvUFrmEpNR1XtRawAPk+3o5NlCCXwXwRxdB33yHAb
         bYoH+N/e5UdkT3I07vwKucyul6a5UMW/3wpheemjqaOsoP18N7vTnNzKXZoGUieos+9w
         8OmQ==
X-Gm-Message-State: AFuF++lOozBSWviB3k19t8O+fNoOFAGz5aE+wn+mmJ4fbfunHfUh7VKD
	viH4TGFfCD8a9l4Slj/JN6eQyeGKalF/o/zG+mpNX+GJiGtosv4AUWcn
X-Gm-Gg: AYBFou0ff5HdWciA4y5gpQ3s0CIf5KQINlBrqy/+Hp2EHukB8aZl8vqeh0jSkDWcqfU
	S4Q9YzEeFcJP0GgK+urfDegdOgTce2JRXePFrq5K3BP7igspDIdYep4kWrFL4kziTBnexC9e6hX
	SktEZqCJtUm0eHkWCIn80UrKaBjvmko9VFNIo4QVbRoyRvyqc+WZJqU/7nMOrrg7pG1eio9UcOx
	cP88/9M9UoXfWNCQbnfkh/up0xgmk3FDuW+uhFXV/2KNllqt7hX0NcVoypH7s98rJwqp/bN2DwP
	ViL0jeQSRWRBr5QN8GrfG5fOUjoK8KP/GyQLZUrUzDBYmJ3P3OuqXG4jn0Dp0IPab8lBoP5VbZP
	6GZF7c0H/bA0817vsVpFu1BS+yWuhhwBs44CXufpZG3SMsZIN1mQHpojZa3/LeXjHWQyX5L437u
	4OaR8k/SBkKvNiGUbEVuNoCALyMRbHj5pg8MIvEn7qiib4jh7W4+xDktvJ+iu9s6Ui4XAjMJiC1
	CzphHmVB+QDfUStp+ecUdbs3Cg=
X-Received: by 2002:a17:90a:d64d:b0:394:ed5c:ff9f with SMTP id 98e67ed59e1d1-39b086549c0mr15480843a91.17.1788525293769;
        Fri, 04 Sep 2026 05:34:53 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm7522735eec.1.2026.09.04.05.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:34:53 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Subject: [PATCH] alpha: fix typos in comments
Date: Fri,  4 Sep 2026 18:04:47 +0530
Message-ID: <20260904123448.38021-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
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
 arch/alpha/boot/bootpz.c           | 2 +-
 arch/alpha/include/uapi/asm/mman.h | 2 +-
 arch/alpha/kernel/pci_iommu.c      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/boot/bootpz.c b/arch/alpha/boot/bootpz.c
index c6079308eab3..85ccfae58960 100644
--- a/arch/alpha/boot/bootpz.c
+++ b/arch/alpha/boot/bootpz.c
@@ -456,7 +456,7 @@ start_kernel(void)
 #ifdef DEBUG_LAST_STEPS
 	srm_printk("Preparing INITRD info...\n");
 #endif
-	/* Finally, set the INITRD paramenters for the kernel. */
+	/* Finally, set the INITRD parameters for the kernel. */
 	((long *)(ZERO_PGE+256))[0] = initrd_image_start;
 	((long *)(ZERO_PGE+256))[1] = INITRD_IMAGE_SIZE;
 
diff --git a/arch/alpha/include/uapi/asm/mman.h b/arch/alpha/include/uapi/asm/mman.h
index 1e700468a685..6b98bd3e7df6 100644
--- a/arch/alpha/include/uapi/asm/mman.h
+++ b/arch/alpha/include/uapi/asm/mman.h
@@ -61,7 +61,7 @@
 #define MADV_HUGEPAGE	14		/* Worth backing with hugepages */
 #define MADV_NOHUGEPAGE	15		/* Not worth backing with hugepages */
 
-#define MADV_DONTDUMP   16		/* Explicity exclude from the core dump,
+#define MADV_DONTDUMP   16		/* Explicitly exclude from the core dump,
 					   overrides the coredump filter bits */
 #define MADV_DODUMP	17		/* Clear the MADV_NODUMP flag */
 
diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index 955b6ca61627..093a265adcbf 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -466,7 +466,7 @@ static void alpha_pci_free_coherent(struct device *dev, size_t size,
 	-1  : Not leader, physically adjacent to previous.
 	-2  : Not leader, virtually adjacent to previous.
    Write dma_length of each leader with the combined lengths of
-   the mergable followers.  */
+   the mergeable followers.  */
 
 #define SG_ENT_VIRT_ADDRESS(SG) (sg_virt((SG)))
 #define SG_ENT_PHYS_ADDRESS(SG) __pa(SG_ENT_VIRT_ADDRESS(SG))
-- 
2.48.1

