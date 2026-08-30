Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E693B8D70
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 16:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788106354; cv=none; b=RfyUxxmW83FC7BjDbFg5OGkcBeOUReweCqkNoflC0BiqnMBPe25Bb3+wVIlwIhITncJ/5WHx7DfbzlYzn2KTzi85J379Rfp7zgt6277t9Ieb7pyhDx5z9dbw0PnQnz9zYXIDAC+A8v0zSTooOLDKDiASLL5AUIqROzOiHLlOwUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788106354; c=relaxed/simple;
	bh=9DJZMB7UOJGJmvWQBrhA3BWiZH+aupD6L+/YhsXD9T4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sNUzjlF6qnYWyp/mxMoCC+ypnDok2biEnCEzrn59scUjo5STdvtfslKTyyWDQYZxKQugfQAOda+XiGTLhj9B9/s7edF/OjMrSjTD+oYIuDa3uOcDVokeSdbuxq6E6esTBAvo+UcCDeOEanHORboKvrR5EwVfBo7E2ZXzWkkjJw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EwpDsnls; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwpDsnls"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so2585606a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 09:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788106349; x=1788711149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3oPpwMsCahf6JtLGhYR2mgNDmu982ouZaUg+WHl9e+M=;
        b=EwpDsnlsNhcPubF9v5YWvGR1JdL0FHlkcQp0CsLQopdjjKRI+TOZ/BYZhH14FaBxmK
         cgyOZGSEiwOyfhT4lb9L/Ta3lDzeA/xdSUnmqHcBuu1V+PWQnUEJej63DH00aT0KghCb
         I6s8e2EsK/ww5XFn6ruKzHxy2ZyPT6J1/CvosFHaeZWJjg7QLxjDR+O5+H7E5QTVUueD
         rlqlBs9jy4LPr+bh4sXjNm8V1vhNOmDa34NcfR+/4fIxFu0rJqYpUP6WlfRhPeSZTaEP
         O/TMIhMIx0SgNVEtsnysD1FvQ9Q6YVkZ6UZjPbCbzmjpkswUNb5qLYq6uIucvijWNYc0
         bqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788106349; x=1788711149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3oPpwMsCahf6JtLGhYR2mgNDmu982ouZaUg+WHl9e+M=;
        b=ntiuPM0del7nqjsztacxcz2827EqNturIk2jr2edtzAH+jca6VmGLOY5+Vavm5W16g
         Qttshh1butKpKS/qY0AKAYJZMXHmXYaqMfIRyTXisMajcLHyxNIsKYALAgWE7dYDM7Df
         wDhb9LiKn/T5EC0z/45bujyXChIX+2nnNdCOwRRluA6d+hphANM7yb0SEO1pvUC/ruZ7
         gBEhwXeIjyBsR1FBvpJ42G8WEJvzotPGSO66d0SY7Fm8t4TTJ4sNMm7sPqg/dx+Wz4+I
         HZDghHNicubd1YwToSLx0knBNG0V5uyuc+p0h7J7YhswZrX363TOicVLaYw/LEtjgFIF
         MUNw==
X-Forwarded-Encrypted: i=1; AKwUvByLFyenqgS3icu2zreVzAtfMfEE/XyQsxXuFruE5IBIiIbqHyS4PXyJcKUPUm/e4x1gBD7tN5h35Ef3bgU=@vger.kernel.org
X-Gm-Message-State: AFuF++ml92IDfE1eVyBvWg2sm7A8bHYYVKK62DESXAJrHRCAOf4Gv6Kk
	mbE6BwpKGtRMWqGEzgwsLJrTH9QP7Mag2/endvSdDz45432BNKxmIienXqkwJxDco1c6kw==
X-Gm-Gg: AYBFou1nM71oXJP2NIak4JPl1oM36R4ICE0wB+NTBaYjhrxNv4Iy+6rfOZyJmOQ9EcI
	FJbHK0L2WPk+1Is52qOSk3NYYmb8cn2U5godX3DIu4qeYsfcArqf9vVX0EN0sEQ0ZRgk4EoE439
	CCxGjbio0xlT0CIKBhYey64IjlWNDMEs27TCLRKz8nxMrrZde+rU26eyL2nBZuzqGLPIiVXYv0n
	0UoZoOkpl+sqh5NIe6hhfZRz0MsdZpJXuj1+WL+lEzTM0BLevUeTLRJvWhyTWI8AfgVXOuHVPIl
	QxsXOF22NHyLcdFnyOoxHITaWsFohS3ZzNLK7lZiujY69phAOrkNGYnjYOHl8TiA0hw+VJ+XI27
	m8rxJrRyiC2mnzqoSFrAw9oOUhYL9qbYlkg9awm8UR5vVOXPg0ug0AbsUHE9W8vBGMo2UsLFcFA
	yXJbHPKB9QTzbGLTP90OgZq7JYH98OiW3xK8nnLpo0gMfwnrJcxCRQhOFSVIUUajfsujVwkfUmK
	wruQkhhWwsnYMl4nrR3Subj5Zt5iIFZ7uY=
X-Received: by 2002:a17:90b:3ec1:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-396d0f2dcd8mr23466138a91.10.1788106349495;
        Sun, 30 Aug 2026 09:12:29 -0700 (PDT)
Received: from localhost.localdomain ([134.195.101.83])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm5719005eec.1.2026.08.30.09.12.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 09:12:28 -0700 (PDT)
From: Yu Jin <lambda.jinyu@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Yu Jin <lambda.jinyu@gmail.com>
Subject: [RFC PATCH 1/2] docs: riscv: document the Sv32 virtual memory layout
Date: Mon, 31 Aug 2026 00:12:04 +0800
Message-ID: <20260830161205.80162-2-lambda.jinyu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830161205.80162-1-lambda.jinyu@gmail.com>
References: <20260830161205.80162-1-lambda.jinyu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RISC-V virtual memory layout documentation describes the 64-bit
paging modes but leaves the Sv32 section as a TODO.

Document the rv32_defconfig layout and clarify which boundaries depend
on the configured size of struct page. Distinguish the maximum direct-map
range from the portion backed by physical memory. Also explain why the
34-bit physical addresses encoded by Sv32 page table entries do not make
all of that address space usable as RAM by the current RV32 kernel.

Signed-off-by: Yu Jin <lambda.jinyu@gmail.com>
---
 Documentation/arch/riscv/vm-layout.rst | 28 +++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/vm-layout.rst b/Documentation/arch/riscv/vm-layout.rst
index eabec99b5852..8e1447cf574e 100644
--- a/Documentation/arch/riscv/vm-layout.rst
+++ b/Documentation/arch/riscv/vm-layout.rst
@@ -16,7 +16,33 @@ RISC-V Linux Kernel 32bit
 RISC-V Linux Kernel SV32
 ------------------------
 
-TODO
+Sv32 provides a 4GB virtual address space, with the upper part used by the
+kernel. Unlike the 64-bit layouts, the kernel image is part of the direct
+mapping. The following layout is produced by ``rv32_defconfig``.
+
+::
+
+  ========================================================================================================================
+      Start addr    |   Offset   |     End addr     |  Size   | VM area description
+  ========================================================================================================================
+                    |            |                  |         |
+           00000000 |    0       |         9c7fffff | 2504 MB | user-space virtual memory, different per mm
+  __________________|____________|__________________|_________|___________________________________________________________
+                                                              |
+                                                              | Kernel-space virtual memory, shared between all processes:
+  ____________________________________________________________|___________________________________________________________
+                    |            |                  |         |
+           9c800000 | -1592   MB |         9cffffff |    8 MB | fixmap
+           9d000000 | -1584   MB |         9dffffff |   16 MB | PCI io
+           9e000000 | -1568   MB |         9fffffff |   32 MB | vmemmap-sized reserved area
+           a0000000 |   -1.5  GB |         bfffffff |  512 MB | vmalloc/ioremap/modules; BPF JIT uses the last 128 MB
+           c0000000 |   -1    GB |         ffffffff |    1 GB | direct mapping of physical memory
+  __________________|____________|__________________|_________|___________________________________________________________
+
+The layout before ``VMALLOC_START`` depends on the configured size of
+``struct page``. The direct mapping row shows its maximum range; usable RAM is
+limited by its mapped portion and the 32-bit ``phys_addr_t``, despite the
+34-bit physical addresses encoded by Sv32 page table entries.
 
 RISC-V Linux Kernel 64bit
 =========================
-- 
2.43.0

