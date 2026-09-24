Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46F342901E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248757; cv=none; b=uMjspAlb5eym/0TQ6CEeEyisxd7sYT6kf+ANZu4gkGjgZAbjKSMULT0kkCiJZY8BZ8Zrnjd5tjtdfe1l4K3DksIvOKWyanoEWzzT7D84eeBa9Xj4QKUqnk0oqrgAXEUpuedwgAWmykovTPQs/7ovRgKs5srkwnhBsHf36vlxjpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248757; c=relaxed/simple;
	bh=/uCNuyAC+bB2LSuLUVVmbArZTQ+h/k1E0mj7CM6a0k8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AOTEBH/JayN0lMux4rH8lhyF87JdMqy28LVFpIofTXWXhrh930ZzwkuwZ45vUMIy2PUtv7gRjjKWUG379c16lER3gxXwL94TlDG1eLsD7b6ThxXgvNc8R3zdXA03FbRijlWDUo+ugNHSOGTRaPXSeigAx9fX++V9DREXbdeqdv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=a+g1pxFc; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="a+g1pxFc"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d91ede8035so17340365ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1790248755; x=1790853555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NER6dA4qTx1oxMdjLFfWJnc+/DEral7661ynzmv99co=;
        b=a+g1pxFc8IpCbmKGfmtKlh6NFAziwtGN3LRq3VwEMtosaveZg6ZBQVKASL16TQxrBZ
         ZAdOGU0siTpD6OjgGV8D1N8P4hz8qOvg6P7gd+x6io4MTXysAsTbMSQgq5Vr/ek8JQO5
         r+LsOG3fyc1cuHB+H82gDWLy0Lhg7+f3rhm8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790248755; x=1790853555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NER6dA4qTx1oxMdjLFfWJnc+/DEral7661ynzmv99co=;
        b=1n30U3JhJYmb6vsmHThGDKb5YZfm4pPh6syKDOXsgzK4oXk5N2eGf+8FZtM5opqOFA
         XtY6nULuhNHbjUvdtb8h1w9Ln4S511hoVIBcwfwggJlaSHNOrcLnyvXn8qjcZhgNpUVU
         ivgsgKCtVXkltvXpVoH4xdJ+HR8IUY6dbFH3UyRQkGHzD78YaNrRdp7DY97RIEjdwbfC
         y4ScMnL9zSLd7JuLItMVpQ/DEYUn8n30ZLLRl51kvNPbAMZ5xCjByPsowR8dvOs+pKWo
         YPGMjVNe6UvOfcH2lrwz2OOb8LVMWmPCdzTBjcVRpDR4f/VSFQAmQRRGKrsL3ky6ztO2
         36Gw==
X-Gm-Message-State: AFuF++lbYObXn1HdSiOwLDalbEicXffQEvGmla59YpKQOMJXQFeBTvSL
	BglkYky42tghfmOK5iSNJcjgCus0eYjQm+5vyKNmVQ61lAF2sw6P938U8TwJj2QWq2c=
X-Gm-Gg: AYBFou3g/nQhJKUqKiz4ezqKXDQp7WpaoYFAAK3Gy5zdPkbYemUa0hUGVREjPYRrUGe
	13onFercTFJfuYPHEzZQv1DFMJ04f2vcBESiveimkIjr/Wqcc4OqMuBb+JVCLovf4frwisRs4ea
	qbgKTBeIRtsoCi9r+7QUfBWEjULNVxqegYlA7KEf+4nsv0n82sdlVmufYK9BBUPWh5AxwYpXZr4
	YrnC9ekL2E30iuHOVEqT++3NvBldGjZyF/UmSQBFvFwIFl5wyCvSoelY255Mq8Ov8Q+uXcb3nV4
	2yVEuDD6MEZ+Kh04Ego2YP9G9BwZI4TEimcoDff45nHtwRlN+4WdhGCuCY273VthRrFN9qKyOuJ
	UpiPad1tRD8hQOTIW4LJW+WLQqW6ffUX/UXoxbn7+dYfiL0urNrp5GLyFF/gfGjoRC8KknScfp5
	tuvYdawbZSW+ZlH9jNvt5w4lktG3ff1svrUTO/cvU3eHZlmz7WEiHDesWZmXFdqGFJGiiC4mIFN
	TaY6Go4XE0jVjnGgeZMlnGCjm+f8YNDUj1qvkc=
X-Received: by 2002:a17:903:98b:b0:2d5:e3ce:3988 with SMTP id d9443c01a7336-2df7e24f225mr18698905ad.11.1790248750293;
        Thu, 24 Sep 2026 04:19:10 -0700 (PDT)
Received: from shiro (p1935159-ipxg00g01sizuokaden.shizuoka.ocn.ne.jp. [153.129.99.159])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2df6a5c18c1sm24683465ad.36.2026.09.24.04.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:19:09 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
To: sammy@sammy.net,
	geert@linux-m68k.org,
	linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 1/2] m68k: sun3: register RAM with memblock and set the low pfn limits
Date: Thu, 24 Sep 2026 20:18:50 +0900
Message-ID: <20260924111851.3501100-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924111851.3501100-1-daniel@0x0f.com>
References: <20260924111851.3501100-1-daniel@0x0f.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sun3 memory init never talked to memblock, so paging_init() and the
first slab allocation found no memory at all:

 * register physical RAM with memblock_add() and reserve the kernel
   image (and embedded initramfs) below memory_start.  The generic
   m68k_setup_node() no longer does this, and sun3's paging_init()
   allocates its page tables straight out of memblock, so without it
   memblock is empty and paging_init() panics;

 * memblock_set_bottom_up(true): paging_init() runs while only the low
   RAM the PROM handed us is mapped, so its page-table allocations must
   come from just above the kernel rather than the unmapped top of RAM;

 * set min_low_pfn/max_low_pfn: memblock_free_all() clamps the pages it
   releases into the buddy allocator to [min_low_pfn, max_low_pfn); with
   them left 0 the whole of RAM stayed reserved and the first slab
   allocation BUG'd.

Assisted-by: Claude:claude-fable-5.1
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/m68k/sun3/config.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/m68k/sun3/config.c b/arch/m68k/sun3/config.c
index cd8af809e0ca..cb4e19b95a1b 100644
--- a/arch/m68k/sun3/config.c
+++ b/arch/m68k/sun3/config.c
@@ -118,6 +118,30 @@ static void __init sun3_bootmem_alloc(unsigned long memory_start,
 	high_memory = (void *)memory_end;
 	availmem = memory_start;
 
+	/*
+	 * memblock_free_all() clamps the pages it releases into the buddy
+	 * allocator to [min_low_pfn, max_low_pfn); without these set the
+	 * whole of RAM stays reserved and the first slab allocation fails.
+	 */
+	min_low_pfn = __pa(memory_start) >> PAGE_SHIFT;
+	max_low_pfn = max_pfn;
+
+	/*
+	 * Register physical RAM with memblock and reserve the kernel image
+	 * (and the embedded initramfs) below memory_start.  The generic
+	 * m68k_setup_node() no longer does this, and sun3's paging_init()
+	 * allocates its page tables straight out of memblock, so without
+	 * this memblock is empty and paging_init() panics.
+	 */
+	memblock_add(0, __pa(memory_end));
+	memblock_reserve(0, __pa(memory_start));
+	/*
+	 * paging_init() runs while only the low RAM the PROM handed us is
+	 * mapped, so its page-table allocations must come from just above
+	 * the kernel (bottom-up) rather than the unmapped top of RAM.
+	 */
+	memblock_set_bottom_up(true);
+
 	m68k_setup_node(0);
 }
 
-- 
2.55.0

