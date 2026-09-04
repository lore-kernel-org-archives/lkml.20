Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AA13EBF02
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522891; cv=none; b=CGv5ilVQ+LpxjP5u2vwU5rQ5JirhQ0MPLtEZ1jB9vDfgGzM238oljBEKbACRl99JTty0wyssMRuSe/2NebvX+hzmNuBFmuPuZ82KtUTxrUerlhDTWcPMwj59oyQjdCGgshK25L542BLyZvD4jPqPH5RZ1QWuyKgWvBB+yyDGPoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522891; c=relaxed/simple;
	bh=jusHzKoVhkao8JeAX9oPIbju8ArWLvXrmJZyQ8jsvTE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G2yFNQoIJTkmm0SKkPNXair6G8VhdsK2UPeUcxWYI9Tftm2QuoQvbJblG2sQ8qMOuK/t6nXgWZRGpgsQ97LBEhUJkfWlH+5FWEeNkqJB8MKjojjcTDXjA/YH37MFb1lNc4UBXEEdcedSyB3MXEcyNGuMP9c+o4HP9/jVkFePDS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwhvkjUc; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwhvkjUc"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b1afdf98dfso571823eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522888; x=1789127688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=folFrH9uw2PuUynBhmUN5Wc2/Vdy05QW9u2royXb9N8=;
        b=XwhvkjUcM2A1DYX72P7gc2Nze4e2+i9boDSCnJKFGJRzPSJwULiI6AABdW+Zl8Qz2q
         vNJqHSDXr/H4MznN8OmDvIvdG60pHtG+/qIQh9nWnvKJktLVGJi5ns02Qito1ptXVAnP
         AfWwVPn+W81KPEKf8hxTfewG3g7uddq1AwhenOLRqF4+QOuHbUHlTPu8zBuuzGxR73XE
         vBx97FhhAGvzg9xWZUHXPjCQm0P+hxBPQEMrykKNEBSVM38kykwhjQ9asSL5PqrVdoV5
         sCdMivetb1cbTpsXI0VG0PxoBf5lBEPz6VRzemYrHtgz5f0wdJFEridLMaIetirq3sRz
         CxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522888; x=1789127688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=folFrH9uw2PuUynBhmUN5Wc2/Vdy05QW9u2royXb9N8=;
        b=GoMBdemmeUwJYRuH3OU4fNz/+OP1mgL21SCEqKBjXccIa26FlOaa5QRjZ/AmXqDwKj
         SCDZ3Ij+uku2uTYsWEsZuAaEqkvmZKC6KQlfWxnl3up5i+7BZl1s/8WoLEPhcknlXnyX
         oVZaFjtJT0qolnIGcKettjpxpP1woq8NC2U1eG1dKCZCzsLXMnyKtOXt8vozsKYoq1TM
         ymhlLHAOkqwQGGeoab6HFSpu/7wNpFIJpI3qoYQdQh6KpyaPXy/UEgomLCHCYySBVX94
         An1V5jVltJbDefJaf/uZ65XnQ3Yiq4Uoujx/Sd/CwoaJk5xMEqLyx6LOH9TW7bRJwefb
         zwQA==
X-Gm-Message-State: AFuF++nTuIdRfjBVUEUFZ4NMGtfD09TXdTpi+GqTkEd7qLgEE7hfBcEl
	SQ3mI2APRZSSRUa55ipHO6sqtoFu4CaclgMyYI49R6B2qPtXQzwp3vbM
X-Gm-Gg: AYBFou3GxRNDWx2mr3r5FVXJRP6Um6fCxyRbm7DUMGo3nfdmsxNNvAL4wyAVn/9mIj6
	jumb2/tBnQZ3x6qdGtgPf9knq+NzYGMpC9tVaUr21eNpLmk2gRDg9NVWNkiiyo8plXPh1mLzEwZ
	O5UpCFgU2lwnrJB/JLb1iMFVkJ+KcNPpQk7iQNoRznkDqTlA3wqRPedk7Aaeyif0Fr3xTKUGHPS
	x0I1EIWAs+Kagj+ueZATd4KDgzkwqdY7NyKs2h+38XYSsnoL6zytusGHZ8NqjUARv2P2BkDl7Hq
	fhU1CfyOjMmQKZeOmYN8ms9Lk/hyeqWr0kVBHBQtmPQWC5ZK7RgVmRhNWm/lWcSJ8TcW4wVKc54
	osfJZ4+fix1uDzd3RsXVdZg2Ud3MSKep8mp45aXuftCHzmWFSLS4ju0Z7W6JN0LlGzagUrF8HnV
	AsxPz0qEBbxx0slJY5dlppVAJDvNJt/NdkxlB+sc+waamYL+z3+Dg5tDwNJ8Ym3HqRrXs8nbpwe
	kpS071EBxyi6bo=
X-Received: by 2002:a05:6820:190b:b0:6b7:83c5:fdf1 with SMTP id 006d021491bc7-6b783c6039amr1442395eaf.50.1788522888262;
        Fri, 04 Sep 2026 04:54:48 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm5643585eec.6.2026.09.04.04.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:54:47 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] xtensa: fix typos in comments
Date: Fri,  4 Sep 2026 17:24:41 +0530
Message-ID: <20260904115443.10393-1-hemanth.selam@gmail.com>
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
 arch/xtensa/include/uapi/asm/mman.h | 2 +-
 arch/xtensa/kernel/entry.S          | 2 +-
 arch/xtensa/kernel/vectors.S        | 2 +-
 arch/xtensa/mm/init.c               | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/xtensa/include/uapi/asm/mman.h b/arch/xtensa/include/uapi/asm/mman.h
index 99d4ccee7f6e..aa64ab9109c5 100644
--- a/arch/xtensa/include/uapi/asm/mman.h
+++ b/arch/xtensa/include/uapi/asm/mman.h
@@ -96,7 +96,7 @@
 #define MADV_HUGEPAGE	14		/* Worth backing with hugepages */
 #define MADV_NOHUGEPAGE	15		/* Not worth backing with hugepages */
 
-#define MADV_DONTDUMP   16		/* Explicity exclude from the core dump,
+#define MADV_DONTDUMP   16		/* Explicitly exclude from the core dump,
 					   overrides the coredump filter bits */
 #define MADV_DODUMP	17		/* Clear the MADV_NODUMP flag */
 
diff --git a/arch/xtensa/kernel/entry.S b/arch/xtensa/kernel/entry.S
index 272fff587907..49b4c9eca80e 100644
--- a/arch/xtensa/kernel/entry.S
+++ b/arch/xtensa/kernel/entry.S
@@ -1671,7 +1671,7 @@ ENTRY(fast_second_level_miss)
 	 * This allows to map the three most common regions to three different
 	 * DTLBs:
 	 *  0,1 -> way 7	program (0040.0000) and virtual (c000.0000)
-	 *  2   -> way 8	shared libaries (2000.0000)
+	 *  2   -> way 8	shared libraries (2000.0000)
 	 *  3   -> way 0	stack (3000.0000)
 	 */
 
diff --git a/arch/xtensa/kernel/vectors.S b/arch/xtensa/kernel/vectors.S
index 1073fe4a584d..063a6acc64e9 100644
--- a/arch/xtensa/kernel/vectors.S
+++ b/arch/xtensa/kernel/vectors.S
@@ -21,7 +21,7 @@
  * use a first-level dispatch table to dispatch the exception to a registered
  * fast handler or the default handler, if no fast handler was registered.
  * The default handler sets up a C-stack and dispatches the exception to a
- * registerd C handler in the second-level dispatch table.
+ * registered C handler in the second-level dispatch table.
  *
  * Fast handler entry condition:
  *
diff --git a/arch/xtensa/mm/init.c b/arch/xtensa/mm/init.c
index fe83a68335da..7b5f82932a45 100644
--- a/arch/xtensa/mm/init.c
+++ b/arch/xtensa/mm/init.c
@@ -43,7 +43,7 @@ void __init bootmem_init(void)
 	 * accounting doesn't work for pages below that address.
 	 *
 	 * If PHYS_OFFSET is zero reserve page at address 0:
-	 * successfull allocations should never return NULL.
+	 * successful allocations should never return NULL.
 	 */
 	memblock_reserve(0, PHYS_OFFSET ? PHYS_OFFSET : 1);
 
-- 
2.48.1

