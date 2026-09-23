Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8F83EC82A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790186219; cv=none; b=b4do4rWC+vcuHde8DFHmyJ+T+3lygmQQQE/7Ky+2HWbh1BIa5mjF3uC5F38ovlOXKtSF0Th3yGp1QhpCtecT5K+p07IUICYAy7fJDIonAtObHvse5jRLXDun8xNO9E1GitIMnLQTnujP3Xcy4Iyl0Hi7BDQmdJAiOn4YgufYjI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790186219; c=relaxed/simple;
	bh=yhmW4LgoNkdqr/VgxrG0RMJ7Phvr3FQmapY+4d+7YdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=umze1PQKVz1Xnb2FY2zndVk5yAH3wN4P86s/bi3SdIA3LkeleoEUVHlf0ghfhik/28BE/HRjIEeYGzW1GJ0cCmi45qvnW5dOHX7ssp2BSlul7sTRgH3bpimSEOIyIfcp7aSMLojJJJJlZTRvT8OcV2xbkzt0YNelXkINd48JaC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=lzr4J4by; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=X21p5EiV; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="lzr4J4by";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="X21p5EiV"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1790186193; bh=141VReK+zgrUNEQ7SKZlJPm
	SQ/VGClgbDdQxKbNBjLE=; b=lzr4J4bypeIYRjdzpmrqq1YnKH2YkWTxci5DjZV9Yt6OD25mO+
	IWyzHetWMqiT4tOtS7lYRUyd6xW6V/0leILZ8jlQIwDqL9vNvyrT2M5UIeT6TTpNlEfGqBvBJ+C
	0tS59piqD2TPcvLJf0wrkdOphJD6P/a5We6XF8qwuUYmKVTbud6Zd/RZG1NisSpSSu/nl1XifnP
	4ablrrgRls6ctfxIIL9pSLvxRFs1nkU6NXkrkO0goWv6AFPlXQCSKCLANHNl4iNfQ4CSH0q+4P1
	YtWirSuY8XnI0T5YMdqhmW8VcAmZx+OB33AW1kTzD3ZT+iwFvPcW4Tw1GXzojB0Zr5g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1790186193; bh=141VReK+zgrUNEQ7SKZlJPm
	SQ/VGClgbDdQxKbNBjLE=; b=X21p5EiVfQXmq9KUBAMYUqzGLw9lrbnOmZsJ+g8QoUwP5hG73k
	r7MGLHqOdgmLfnwv1ghgRPaSN07rBbQelrBQ==;
From: Bradley Morgan <brads@mainlining.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	brads@mainlining.org
Subject: [PATCH] powerpc32/modules: Reserve a PLT entry for ftrace_regs_caller
Date: Wed, 23 Sep 2026 17:56:31 +0000
Message-ID: <20260923175631.235276-1-brads@mainlining.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 7dfbfb87c243 ("powerpc/ftrace: Activate
HAVE_DYNAMIC_FTRACE_WITH_REGS on PPC32") made count_relocs()
undercount the PLT entries the loader
consumes: module_finalize_ftrace() now creates two trampolines
(mod->arch.tramp for ftrace_caller() and mod->arch.tramp_regs for
ftrace_regs_caller()), while count_relocs() reserves only one entry
for ftrace.

So the core .plt ends up one ppc_plt_entry (16 bytes) short. The
walk in do_plt_call() scans for a free slot with
"while (entry->jump[0])" and has no bound check, so once the last
reserved slot is used up, the walk steps past the end of the section
and patch_instruction() writes the 4-instruction trampoline into
whatever module memory follows the .plt.

Count the second entry, mirroring what module_64.c does for the same
pair of stubs.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 arch/powerpc/kernel/module_32.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/module_32.c b/arch/powerpc/kernel/module_32.c
index f930e3395a7f..61152deffc55 100644
--- a/arch/powerpc/kernel/module_32.c
+++ b/arch/powerpc/kernel/module_32.c
@@ -41,6 +41,9 @@ static unsigned int count_relocs(const Elf32_Rela *rela, unsigned int num)
 
 #ifdef CONFIG_DYNAMIC_FTRACE
 	_count_relocs++;	/* add one for ftrace_caller */
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+	_count_relocs++;	/* add one for ftrace_regs_caller */
+#endif
 #endif
 	return _count_relocs;
 }
-- 
2.53.0

