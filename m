Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619629;
	b=2/4xiKKjPFlRvG1cojOOEUZyxiN0sHT64b5g0LH0XCB0Xylyi4RXnLlY3I9xfCCu5vw5
	 IfG+7TbcDawbF669c6OelJG21602nveQaCdTQ2bMLX5TSLkKUYiGZZszFC/cmf546xl0Y
	 aDZTwseb/o5Xv0yMLL/XB4vJt+lBh6iYbPq9Rfpn+Lu0mOgcBiiR0SzAuGl9Rwi4LIGlx
	 GrqneG561hHAxkRj4nhbcdM12kl+4WvctYoBkJxODniiiryt5Zq2c5IoZ5ovDTjj2rR4e
	 uhU0LqtaMi8jFOhTXFqfNbshM1994tc4ZZi13ORFYytt/ijE0Gb917UfZZnR+RIkaIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619629;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:User-Agent:
	 Date:From:To:Cc:Subject:References:MIME-Version:Content-Type;
	bh=6w4/Cz0Pewsj3ccPudP5UZndmVHedkJ3826U+l1XlTg=;
	b=CA2qm4DxxN9MyWKIM8hy3GZTqurx4uOwbEX/LMuhwOqKouzM9ecRCmBBC3um0FdQ2XW7
	 /iyABvG6xkzPfMwJ8w0g0DQGBCKp523ENdk/MIF8IBwKoneto7ZgS1y6Ww9Mnsc+VGgBc
	 htXjAfesViA8hKFHkJSBC1g0A1S/ZVBf5r8OAx3HPV+LPMVRsbNOitCmFkWdqfVl4rOD8
	 YYSrL/MyUw+CNBx7KlZ6Pw8TGNQ/mZNAnO++VE36+zWj6exxsARYpnELFcl1BrDVTX6eJ
	 /aikjQqiCX631fgGCnT8cGWIOa0w8b0vshGDVxKlMdXcpvN1zpjPYE6LwgZLaqTqoSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=QwKSDi7l;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FDB606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3FDB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=QwKSDi7l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=6w4/Cz0Pewsj3ccPudP5UZndmVHedkJ3826U+l1XlTg=; b=QwKSDi7l+eakubr0KJ4/GvLi1E
	pe1OMLoeaZ8mZx1vvD8GAiFvHmadd1vx2UKBo2acuGSqUjCXaSzvTAlASrSZVAHKSxtnZdojA4Tb7
	tyvUQvDguluPPzR5HgIS9702XsY5TCtg85CpRRo+KOa/gWUtk84uKwcX+Twg5jm521wQBe9/sJPp3
	oAPbi07ZQRPewO2FTGdc0tpqXpJc8a+S5Z0u/NHclyo/sJyxH0mjuNsPH6GC6Cx7l3S0IuxSc1D8X
	KiTiZimePcPlTDCTrJy34qb6z5h4a4kBsCNGYuVXdfMnqyfF3hgGvHqauDmA3euQCb0OpjkiBWVVN
	LUeb73DQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqOn-00000002K7a-1ubl;
	Mon, 02 Nov 2026 11:40:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 7F2E130312D; Mon, 02 Nov 2026 12:40:24 +0100 (CET)
Message-ID: <20261102114000.661335545@infradead.org>
User-Agent: quilt/0.68
Date: Mon, 02 Nov 2026 12:25:52 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 jpoimboe@kernel.org,
 leitao@debian.org,
 keescook@chromium.org,
 hpa@zytor.com
Subject: [PATCH 3/6] x86_64/entry: Make syscall dispatch noinstr
References: <20261102112549.714541309@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Being able to put breakpoints and the like inside syscall dispatch is
'unfortunate'. Simply push noinstr out one more layer.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/entry/syscall_32.c |    3 ++-
 arch/x86/entry/syscall_64.c |   13 +++++++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

--- a/arch/x86/entry/syscall_32.c
+++ b/arch/x86/entry/syscall_32.c
@@ -43,8 +43,9 @@ const sys_call_ptr_t sys_call_table[] =
 #define __SYSCALL(nr, sym) case nr: return __ia32_##sym(regs);
 
 /* The unsigned int @nr argument is intentional as it creates denser code in a 64-bit build */
-static noinline long ia32_sys_call(const struct pt_regs *regs, unsigned int nr)
+static noinstr long ia32_sys_call(const struct pt_regs *regs, unsigned int nr)
 {
+	instrumentation_weak();
 	switch (nr) {
 	#include <asm/syscalls_32.h>
 	default: return __ia32_sys_ni_syscall(regs);
--- a/arch/x86/entry/syscall_64.c
+++ b/arch/x86/entry/syscall_64.c
@@ -34,17 +34,26 @@ const sys_call_ptr_t sys_call_table[] =
 #define __SYSCALL(nr, sym) case nr: return __x64_##sym(regs);
 
 /* The unsigned int @nr argument is intentional as it creates denser code */
-static noinline long x64_sys_call(const struct pt_regs *regs, unsigned int nr)
+static noinstr long x64_sys_call(const struct pt_regs *regs, unsigned int nr)
 {
+	/*
+	 * Because -fno-jump-tables, this compiles into a binary branch tree
+	 * rather than a jump-table. As such @nr is not used as an array
+	 * index. Additionally, this is an out-of-line function on purpose,
+	 * such that all the actual syscall function calls are tail-calls,
+	 * returning to our caller for the common bits.
+	 */
+	instrumentation_weak();
 	switch (nr) {
 	#include <asm/syscalls_64.h>
 	default: return __x64_sys_ni_syscall(regs);
 	}
 }
 
-static noinline long x32_sys_call(const struct pt_regs *regs, unsigned int nr)
+static noinstr long x32_sys_call(const struct pt_regs *regs, unsigned int nr)
 {
 #ifdef CONFIG_X86_X32_ABI
+	instrumentation_weak();
 	switch (nr) {
 	#include <asm/syscalls_x32.h>
 	default: return __x64_sys_ni_syscall(regs);


