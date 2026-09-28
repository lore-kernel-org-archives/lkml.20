Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E0E49D5AC
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790592317; cv=none; b=jTwFlOYkNH+W2lzr1ewSDnl3FK2eJY7553S/L1dt6MxyXKLFGqbQ3tt3ZnSajrd72O2pkfntRlkE/eUCVikzOvouydIJEiS+SAfDLQlO9ea0ZCXdYfp/YnBiqZGaDjirZkUEJvQpdNLDvnutxu3WXD9D+LXO/j6JgvUXnj2fEnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790592317; c=relaxed/simple;
	bh=TKNn4LEOUUv0yJ9yNzSuHJV5b+Vs5Z355F4qo0GHiBg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s9UZLBfnBe+WnDDoPXsI6V8JwmVZdFaR73aAQFOUc/u8B/yQkAP8tsduqUpXrd6uPWGkf/b6vG8c83uMCngncjPyXW2Xy55eIrkhWs2fXm6G4+pDyIS1wPOrIWuSGLiLgsVIgq9tuQRQMJTfg8C0OVxjeLDjjdxWrGPIlElE7QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBGhWTsu; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBGhWTsu"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4d04d73b8so978641a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790592315; x=1791197115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nf/66osJudXLuEZ03+OHFd4peJaJBQJPrvu5ptsPZms=;
        b=dBGhWTsu9vSZ1jwbYN2vJCa215NS5rEoUQiUE00EFenYUpaeDv+Ci5PMpFb+zPMbRs
         z+bNrSL+idlTpEejiMw4JkzM+UtP5ES9gzdmX3f6Am62fl5xa5pV4bolN8tY5zU/WBbo
         AMmyLCrYW3YFg1SFht/KV017qxspPYD9e43Z5FHGe+METuExn79aQf0Ay30DvAvsUpaU
         Q8atK/QsMkRt/eyojP3lWBPnSUbZDeSYaW0s9BwmVS9/2iflC5N7zhIQEiX/wgj4FEQ6
         gPmJM/pzdMHXelDrbTRqN1Fjifl3rwbXmhZRNHm+kDsfZBKC+S1/WKM32QAqGVDh7ZmS
         6uBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790592315; x=1791197115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nf/66osJudXLuEZ03+OHFd4peJaJBQJPrvu5ptsPZms=;
        b=EKLpk/53gg8XTJpRilV2JDN6ZZejp6TDlVG0Ux1Wh1WMEPtOdbytkIKaiyF8EOC4Tb
         z5VsSJgh+ZDja68akqf44UmeCRDOrdFyt2K7Y9PHbBB4d6J2gXH3DG3alnp9PRlhMtJO
         xzRkU0TjZj6EIbGBK4b142z9oumrdKheAjNkgJeJY8xViGpSzCAfHbEVovtwq40ed4nV
         zaf0oQbbf+PyO0tQP9Df8PjRGS6W4FEJrVNiQQbUI51TAuYpK7JJOxVhd2ar9K1PXZL3
         MZSh9lSn2Q48hj3dEHGU3DK/Y9A7NfejVfTyX4/v2xsdJobpZLTjOpW+TYEzuPNlOXES
         TMqg==
X-Forwarded-Encrypted: i=1; AKwUvBw1AjRy+n7Ja7N6d55l2qBWqZgrSwgE6R+3fwN0WzWmZbM/bYfUGPjYVcBeqPbIZj7+vav8VPrcZggxGAk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVNnsHF38f+qkQ2bkzMBHiemkAQ+wdX2S1zAb9aSN8Tm8FqgY+
	DXm1A+XjOj4ma2APxFcMuOQUr8m642Q0CrIzwjy7XO9iruFaydD9bmLi
X-Gm-Gg: AYBFou325jWew9TqUrvgFDjR0Qj9Y2M/i6FTNw1LoFzTjNAoMg0T0NznMOfR19UPBR1
	HXiv5VXg1yEdQv2zUwbVtg8pxHypSWKCjyHFB3cGR5/4Prlnccigh+J2E4EVcvFEHBGauALjOT2
	ny1cV63jxuyD0QRtzFBN1DH7Z8TNDn7TwQD0+u0jyUxe6rDJJLwtAzE8LTVxPh4TbDaAUZabate
	P79nZucDYbgj86NqfE4u8H0/57JCSzusIAa30ademP1z9nfVo/VV4PfILt6/36hVu71Ix/Jq21X
	qj8Zfut/+0lvcCwJGbzp/ZIaCB6Sgld8tfchCVrWlzJktDPjNeBcNc2npumo8WOTkB7QGQw+yvC
	1k1JCQ5zceD7cMXT+G/xUI0av/Tqws/NCAHkQGwugddHHYlDn/CjB0TnyYy0MmhHjWwXLkAs1WL
	ciej9ejAqaPvnVRwsOLrIrOXXNKdX7lvyXLiwmPgA6/Zz190RvvpOdEXifZdynp5kIbWwLX8Ygq
	ClCdjpwXnCEFYKG7zG1vQGwbTIIYCIEBth/SfeIr5/Q5nzqHpKmx79afBVy
X-Received: by 2002:a17:90b:4fc8:b0:39d:f4fd:8075 with SMTP id 98e67ed59e1d1-3a098ce492amr9654551a91.19.1790592315575;
        Mon, 28 Sep 2026 03:45:15 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976c8f8dsm27071975a91.12.2026.09.28.03.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:45:14 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Marco Elver <elver@google.com>,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC 6/6] powerpc/mm: Enable context analysis
Date: Mon, 28 Sep 2026 16:14:36 +0530
Message-Id: <f7cc79150caab4f355de8e8c44fda5f954f55130.1790590014.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1790590014.git.ritesh.list@gmail.com>
References: <cover.1790590014.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

powerpc/mm/ objects now build with Clang context analysis enabled.
Turn it on for book3s32, book3s64 and nohash mmu.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/Makefile          | 2 ++
 arch/powerpc/mm/book3s32/Makefile | 2 ++
 arch/powerpc/mm/book3s64/Makefile | 2 ++
 arch/powerpc/mm/nohash/Makefile   | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
index 8c1582b2987d..33e51abb5aac 100644
--- a/arch/powerpc/mm/Makefile
+++ b/arch/powerpc/mm/Makefile
@@ -3,6 +3,8 @@
 # Makefile for the linux ppc-specific parts of the memory manager.
 #

+CONTEXT_ANALYSIS		:= y
+
 obj-y				:= fault.o mem.o pgtable.o maccess.o pageattr.o \
 				   init_$(BITS).o pgtable_$(BITS).o \
 				   pgtable-frag.o ioremap.o ioremap_$(BITS).o \
diff --git a/arch/powerpc/mm/book3s32/Makefile b/arch/powerpc/mm/book3s32/Makefile
index 50dd8f6bdf46..d5069a586c7b 100644
--- a/arch/powerpc/mm/book3s32/Makefile
+++ b/arch/powerpc/mm/book3s32/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0

+CONTEXT_ANALYSIS	:= y
+
 KASAN_SANITIZE_mmu.o := n

 ifdef CONFIG_KASAN
diff --git a/arch/powerpc/mm/book3s64/Makefile b/arch/powerpc/mm/book3s64/Makefile
index 33af5795856a..c5d8d2ef72ac 100644
--- a/arch/powerpc/mm/book3s64/Makefile
+++ b/arch/powerpc/mm/book3s64/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0

+CONTEXT_ANALYSIS		:= y
+
 obj-y				+= mmu_context.o pgtable.o trace.o
 ifdef CONFIG_PPC_64S_HASH_MMU
 CFLAGS_REMOVE_slb.o = $(CC_FLAGS_FTRACE)
diff --git a/arch/powerpc/mm/nohash/Makefile b/arch/powerpc/mm/nohash/Makefile
index cf60c776c883..7d7409d2cf97 100644
--- a/arch/powerpc/mm/nohash/Makefile
+++ b/arch/powerpc/mm/nohash/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0

+CONTEXT_ANALYSIS		:= y
+
 obj-y				+= mmu_context.o tlb.o tlb_low.o kup.o
 obj-$(CONFIG_PPC_BOOK3E_64)  	+= tlb_64e.o tlb_low_64e.o book3e_pgtable.o
 obj-$(CONFIG_44x)		+= 44x.o
--
2.39.5

