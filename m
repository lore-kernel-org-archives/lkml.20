Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DD32773F7
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 23:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791157712; cv=none; b=dxzjbecGt3fSA+qLcl6uKnGOFoq/nRrUmon4XhQEBsrSd4usoNXjjnZy0fyPiH5L+JtfC/WARbgU340821fwTBKcpBtfbscrwT6rowwbA7wDKUvoJm1OX+xYmt2Q4mbkguCLNFpSMx1vMZuhOkdyH5So7JoqLVGJndLSzj6GB/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791157712; c=relaxed/simple;
	bh=Yakr+ipymN7ZnA+Xz4TDokUUTt0zx6UpbPqxI12sIzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fR31buH0O32zL8VZw/iyqsaDmxbW2i7NBFNhT9T6xm8nxr1akNQhBocFYLwJItL5GsrSh8fuOMQGzeh/Jc6gaqTwr5cwgDs4mnLFWDaGAwqETwlKefFvClS5jtYyKt83ILn7H+vm86b0t9OBuuWDBk725l0OLEGDVP7WKaEPI2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C436IMPh; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C436IMPh"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2e494adf48dso5498285ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 16:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791157710; x=1791762510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dO6qiiwJ5mjkpx+bVW9ukEfz8rnMpwLVr276QlZKmZE=;
        b=C436IMPhgzSHcCaPbpqrBCHxhPGVgJCpHq5OadFUyEls0wJerWsJ59E21vBqSUhpBJ
         RPL1LdK8aVWQx2JB+USXBZofzQeDVaYuqMdZxmKFzar9I7nUScnl41MeO/Q3s0GOQFXE
         qiK07yKk0dKLcdIK5SB9wcKfV2O3fGMvgPpeTAcjLcv7IaQLOdRgJCJI+Ywk/xarOcLZ
         Ov1lDGLf0mPydr2QWzmm+sNtWTyZ8DcNlgOz+Vn6mop++D0yJUm3TdFRmkcKSc/N+9ld
         zx0i9PS1YgZN6aBlaIZOG+a+3h2neZjev+X2/aYvveplS3YIJbGRCghxc3bCROIuzdxS
         w/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791157710; x=1791762510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dO6qiiwJ5mjkpx+bVW9ukEfz8rnMpwLVr276QlZKmZE=;
        b=bbnQvDdUZDqSmnhd9n8H217V6HdGVkNMGTR0k2Q9XcGRML1w5mZZM0+XYvTs7JCm7T
         xK0BAegrd6WEuw5JMzzVJAZrqk6+s44pEGhAdMSVKj+eG1EcXmnC7V7z4DrjD5wTf6Kt
         oeqhOVS8LVJUEexpYeP0Yv4VdxnT+HhUAmTgxI5viMg19TSTAIeIFRSRDr4qIE5LL0Tp
         dt4o0NYbwY9+L2g4pH1nIkOX9y8f7pHMN0HnC9CfzgKydX8V7rYt0R/SCNVpBSLjzTD8
         ugWE7CjqMfMQmuxpQuqs4dobsLSNLJ7GK/w3PUyvplxq/kEMTr2DivXloe6pfvhCCihY
         mmLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOI8v7L2z+5ix9R5HEiA4n/q4skRe8EQrYSRQIIj0u1KDDMuMJxYZhNWy9d20Z94vZJ+lwJW/J4ekpEk8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhii25yiudddWPEMLcbslc+d0rCcwsjqvXrNButAh/KrX3vVEH
	/pqeNXwW+H59s8vbFo3XUbkW37YV8xZSJM2+L7A0Ocs214YmhXOAXyXi
X-Gm-Gg: AYBFou2XRdpyhRYV98yEwJF+341aHjTQEEfY3egyG6zz4g+ADs/sAmCCS0QHiU50fuV
	hzM46MkPU79+mgfaxeCjMZFjCzJPsFT6UhjAPBXFc597QO4nbKYpc7Htomnj8lzdcvnFH6gjwmp
	R0IMK+XPq4K9JGPBIw7iyvLk9mrvXoq9pkKEbAmBFfGSzuAfDCPXnJ+/nR/OfXgf0arXyCP7QRb
	pPKFsXw4NZvPaFQ3NbeARR7ZGuvlNemRhNtJ0zOIpfv6TDXaDimygPJ81qPzCjo5A9temk1ehgu
	6orf4Jk5uTBxHaOH3A8FlJBBF4rWaJBVIImBLRi8KAMopweKOfiXyxGlggWmWH5IZuRuQukP0Y8
	AgEeXZZW+WbtWmWa7ubDvh+W6G0Xf7eFHdakw84VpiKmZwl5iGjhmuSScTTaEqdMIezlFynnwm2
	2/oR+4SlvGmPPrsxeSwJmwuLJx2QDBMae8L+JSjYcO88qUsNKRiNdXvZvfNYF78T03sXxJ37rma
	MGmzUjsGrfR2w3mQA/WtHok27jxTcj1f2rZh+sIpv/ZU2zMfSEKg3QDZy5wEiaXwasXW3NyPnfj
	u6EXKc6uM1GVD7lSKlzqG9FZTwQPFTVUa9erM5efxnxSrBU2wqQgN8eBTJU=
X-Received: by 2002:a17:903:8c3:b0:2dd:c0ff:e727 with SMTP id d9443c01a7336-2e49b65f04emr81741455ad.57.1791157709961;
        Sun, 04 Oct 2026 16:48:29 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f6cd764sm26207215ad.48.2026.10.04.16.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 16:48:29 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Paul Burton <paulburton@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] MIPS: Avoid dead code/data elimination when using recordmcount
Date: Sun,  4 Oct 2026 16:48:26 -0700
Message-ID: <20261004234826.541468-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CONFIG_LD_DEAD_CODE_DATA_ELIMINATION builds with -ffunction-sections,
placing every function in its own section. recordmcount refuses to use
weak symbols as section bases, as a strong definition could override
them, so a weak function alone in its section, such as the generic
pcibios_fixup_bus() stub, breaks the build:

  Cannot find symbol for section 88: .text.pcibios_fixup_bus.
  drivers/pci/probe.o: failed

MIPS always records mcount locations with recordmcount, so this hits
any config with the function tracer and dead code elimination enabled,
e.g. malta_defconfig built with LLVM=1.

Only offer dead code elimination when recordmcount is not used, as
powerpc does since commit f8b2336f15f3 ("powerpc: Avoid dead code/data
elimination when using recordmcount"). In practice this makes it
unavailable together with the function tracer on MIPS.

Fixes: c0436b503591 ("MIPS: Enable dead code elimination")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ddabe25d6bf7..f4f82bd75b66 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -79,7 +79,7 @@ config MIPS
 	select HAVE_IRQ_TIME_ACCOUNTING
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
-	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
+	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !FTRACE_MCOUNT_USE_RECORDMCOUNT
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI
 	select HAVE_PAGE_SIZE_4KB if !CPU_LOONGSON2EF && !CPU_LOONGSON64
-- 
2.56.0

