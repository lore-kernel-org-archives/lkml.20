Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF3A495ADA
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 12:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791634917; cv=none; b=bCQgtf2YUDUbvFwvL/fDUUmfUNeUeZh8p/Dp1ThTtYxfp9+t+xnqfJhvm/MDqaSVguWR6gcY1moibiW1M1gkEuX6p4VA7GdAPKWxghBOKIxkC83Ud+dnDV45wN9pKTh0XLRLA7cMYRr9EKIGl+DcTBIuPbgdno605M4SHemyQlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791634917; c=relaxed/simple;
	bh=2WoopbEg435q3Z2a4bipIUB7pewJTFEdA0jv3qf/73c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZR7hSKh+2ULicHB/9b9FsG4Qhd4bpVEVchcA+ylISQ0FfYGInQfq8QktFok37XRmBzyytSoY6KfwqQRO6dFQQftKWIa91lrBXSazwd2bmeZ+KxMdtLHhrRjMqgFDbKg9wPFx6YlAhyo1u+VtzmNL+Q1H1XUTTvcHQmSobw2KduA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=makAdL8c; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="makAdL8c"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1419d3416ceso989178c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 05:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791634915; x=1792239715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEEN2Zy6O9+c2gqiVvvZWE7KSK1IHYRZNAT8ZPZiGT0=;
        b=makAdL8ciqzmSfp9xshiqGCtBqic+8AtN9/60jr8wdweXnOEzqnNdxDvT8WicBB6fL
         c+IxgNpVj3X/9k7dYLlfhULgQLa73/l1NDksg0l+UbXjOWgLCJRrjfmXLw4UxKc2yTXh
         J60tsg/WU9aP17XWhlp/KkSjd26L05r5aTWKmuTu2qI6548fH39F2UxfLnWEZykdmW9w
         lTPxJva3z0asg7BZ6gO5YqoVG/5QCSBLiJTfBZjENfpjMf2524c40FtDra48HnvIj8Zb
         FbbMBTTmVI5KBCQfvmmmo5qQ+R0yaesz+Jbrm9JXGalphM1RMWIBgk4Zo06HjqcANM6X
         pcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791634915; x=1792239715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CEEN2Zy6O9+c2gqiVvvZWE7KSK1IHYRZNAT8ZPZiGT0=;
        b=oZbn84kAySPtGhyOVEcT2loDBrtR9xZX/f2wphuunhRy5sUwLdjLELLtmBSzJWstf1
         LSPPfSPR1+eg8Z3LYhp1SqV3s710R426xoqfLkHxGLgHeMRrsifaU7TegfeLqlHNXyNV
         YC99hE21ktnnfQKtfmgvijMrI9+9gw+4RNkLEfz+2g1fsxdPQTkIcNtE2PC/1zinTeAt
         dB3LKl3A5pAH2ndqRlkTuAMCfgI56AQa4EfTkC8TKe8BhLxq1FnwmSAYjrFxQCE6Mja5
         TsXl7hX7CctM99gK8IOB+HFUaLl8S50LvMd9Fj8z8SY5VQDH+erAntHyqNDzQ4z+InWo
         vHEw==
X-Forwarded-Encrypted: i=1; AKwUvByRXiId4oASaWRRjdxsUBwvXAL1FHaW/4Rz187yS5In6Aw7Zq0AzywnOIRsd/SJJah/QBTDqj8cf05ZyEg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgjPKSkpO0nXTNRDh5jPS6dZyUIyk8kQQw9jhDDBr80KUK7+J6
	maFFEvTITUH/H0rRaeo00B2vat6YZwEUQqpTiVjQ7afY4ltEK62WatQ7
X-Gm-Gg: AYBFou0qBwaXD7r6wvE/TOFBy2eauQDQiCkKOncnhnkOUn6w5XW0zlK1QZmC9HVlnDn
	+0AEifd1eauoZNpfzc5cm8bOShkjSpl4byYed6tLzNuehujCFBJ4/LzF/HGggXnTx4nJETEIFye
	G5kfqAxcuDGRN+XVPM3bPGeCagSUbkPeQfvArH8YVwq4Varsp0qx+sM239p19dZmMQULEh/N45r
	NoMtkIwopJ10cBdFfwNiBSadwB5jxwIwasA4hIn4gs/ED/Owm8mIWYEXsmzMXLF3cVeJEpaGM7E
	gdllNzhwZuZp7iTS9il1G1auyfQd0H+7qX23gydqQha1UDH23XC8sn52emhJh+5IqMi9BrA9u/a
	SZ5ZUJhdD8RzbkEhsyaZl9Icdsl6xaE896DGP/D27fIZjrZMXAXoH0WZsaTJKSwFDHAaIC6tLo8
	jFBzhFlSLMTU3VccNBsaN4VkATiWWLO5wtbpwaOaAzF16OHC7JqDNwuJuLTK9vpNJUxWjNCBW7A
	TX8u735+kIgR3+hRh665IVJH3zugEcAei5yZSk6QkSEIbUGcwh1E0wWpgfr
X-Received: by 2002:a05:7022:ea4e:b0:144:eaa7:2765 with SMTP id a92af1059eb24-16a60ce72e1mr5151179c88.18.1791634914808;
        Sat, 10 Oct 2026 05:21:54 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm15401816c88.5.2026.10.10.05.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 05:21:54 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC 1/4] powerpc/64s: Add linear_map_use_base_page command line option
Date: Sat, 10 Oct 2026 17:51:09 +0530
Message-Id: <69b592b9741156be07b745f61f45b15c7a6aa31e.1791608423.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1791608423.git.ritesh.list@gmail.com>
References: <cover.1791608423.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The radix linear map is built with 1G and 2M mappings wherever it can.
That is the right default for TLB reach, but it also means a single page
cannot be pulled out of the linear map later. There is no support for
splitting a live leaf, so memfd_secret() has nothing to work with.

debug_pagealloc=on already forces PAGE_SIZE mappings, but that turns on
a lot of allocator debugging that nobody wants just for secretmem. Add
linear_map_use_base_page so the linear map can be built out of base
pages on its own. debug_pagealloc=on still implies it.

The extra page tables are roughly 3% of RAM (for 64K pagesize) and it
can also cause extra TLB pressure, so leave the option off by default.

Only radix honours this for now (later we will implement this for Hash as
well).

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         | 10 +++++++++
 arch/powerpc/include/asm/book3s/64/mmu.h      |  2 ++
 arch/powerpc/mm/book3s64/pgtable.c            | 22 +++++++++++++++++++
 arch/powerpc/mm/book3s64/radix_pgtable.c      |  2 +-
 4 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 33cd30996e47..382d18c6e8e8 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3563,6 +3563,16 @@ Kernel parameters
 			If there are multiple matching configurations changing
 			the same attribute, the last one is used.
 
+	linear_map_use_base_page[=<bool>]
+			[PPC(Radix), EARLY]
+			Build the kernel linear mapping out of PAGE_SIZE
+			mappings only, instead of using 2M/1G mappings where
+			possible. This allows individual pages to be removed
+			from the linear mapping at runtime, which is required
+			by memfd_secret(2). It costs roughly 3% extra memory for
+			page tables and increases kernel TLB pressure, so it is
+			off by default. debug_pagealloc=on implies this.
+
 	liveupdate=	[KNL,EARLY]
 			Format: <bool>
 			Enable Live Update Orchestrator (LUO).
diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index 48631365b48c..3739e5677312 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -73,6 +73,8 @@ extern unsigned int mmu_base_pid;
 
 extern unsigned long __ro_after_init memory_block_size;
 
+bool linear_map_uses_base_pagesize(void);
+
 #define PRTB_SIZE_SHIFT	(mmu_pid_bits + 4)
 #define PRTB_ENTRIES	(1ul << mmu_pid_bits)
 
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 85ab6723c8f2..1a007902f307 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -48,6 +48,28 @@ static int __init parse_kfence_early_init(char *arg)
 early_param("kfence.sample_interval", parse_kfence_early_init);
 #endif
 
+static bool __ro_after_init linear_map_use_base_page;
+
+static int __init parse_linear_map_use_base_page(char *p)
+{
+	bool val;
+
+	if (!p)
+		val = true;
+	else if (kstrtobool(p, &val))
+		return -EINVAL;
+
+	linear_map_use_base_page = val;
+
+	return 0;
+}
+early_param("linear_map_use_base_page", parse_linear_map_use_base_page);
+
+bool linear_map_uses_base_pagesize(void)
+{
+	return debug_pagealloc_enabled() || linear_map_use_base_page;
+}
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 /*
  * This is called when relaxing access to a hugepage. It's also called in the page
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index cf692b2b5f7b..2c4cb6d6ab6e 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -308,7 +308,7 @@ static int __meminit create_physical_mapping(unsigned long start,
 	if (mapping_sz_limit < max_mapping_size)
 		max_mapping_size = mapping_sz_limit;
 
-	if (debug_pagealloc_enabled())
+	if (linear_map_uses_base_pagesize())
 		max_mapping_size = PAGE_SIZE;
 
 	start = ALIGN(start, PAGE_SIZE);
-- 
2.39.5

