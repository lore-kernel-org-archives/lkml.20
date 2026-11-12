Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794452028;
	b=AfAfo+BifXPH8zLwge2ecloOA1tu249pvI72gvMi1ADcw93FlIqnJjfedfdNsF2I6ply
	 rueBK7Yuh+V5r3P4xYCQxK0I8nWQQ3gASPezolG+DW1fQKEFY7FvAMOqEBQZ6c1Ds98v0
	 20Qu3PyJAdPAsm+rcQ6fbvLKdV3badOWZJKeSBQPB9/pv8x5wbN/P9NB7bsuIOb/A9GOb
	 r8l5rDTLQ4JXNhy854Qc0YxjQD9JK0O/4hEiob4tct5bYrG6lwc2jnLe5VnIcq1gGGMCw
	 2WazuXAI+PNjGW8qY3PVG28Ohe7dw2huKTkToyhP7+67fSpg5byOqNBvFSL2jh3tk1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794452028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8yMHCtcZ/1cI9oadvNBaz1GIBWo+u42FQNaRXMLSLbc=;
	b=mRjKbhN21+44OZSgOTr4ERiF4R63HWOEg6hgNgmYK8MA0oy3ApoiSloqIj51EHGn2Sy3
	 PaExzFw2SHvr7yDyyOW4eDocneNbbuM/YPvPL8NcL6RRJTO/rAO01xeK8y9oFroBnzwPq
	 4VBNlEAbmwp06m+9CZFz2f9QgfnDhYaDqnkeqhuXP7WMMMr5A6K6XiOJrprQ6LXFH016E
	 lKr5QY3JqhUmFO3sIL+NAMJh+aKtziJI/meYMbZ0t2Bx+tprxj6M6VJ4+Q8IAqfaHtsFz
	 5jDUogr6YMOYBzn+YM1gl4SZNTs19QozHH6IShNTlozdDWnDpA5p6d9uulJIOxwMcIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SoHAKYts;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26E4606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D26E4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SoHAKYts
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so3005930a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794452027; x=1795056827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8yMHCtcZ/1cI9oadvNBaz1GIBWo+u42FQNaRXMLSLbc=;
        b=SoHAKYts+CYz/wXS2LA4OxGNsSrUcR7FjvkZGOYp9Seetf4436d4GPJtdusZ2ZpaXB
         3VT1FerWekHSaM7hzUwHLmqTpJnnTHthYLMnwpmN+z03OkuyqnCcmQc8BBUUqp8PuscU
         n9osR6uokHoBknm9GTc1ZZwyOzczCObDGQ+RnosXayk9oCR4cs6slma7qZ569Wvj9t7+
         raPDMWMZ9lb2wfPvnSbE3uN/1LP6jqR/TwJp1/qZqk4LY1PRZxXRbfocg9PNELbWNv6u
         3EnIufpL8tTVmUWJVa7KvYRbwENtXVAkMlowGqwHKkcoZ29e4YyILB/uOBENwmKQ076R
         4nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794452027; x=1795056827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8yMHCtcZ/1cI9oadvNBaz1GIBWo+u42FQNaRXMLSLbc=;
        b=XtG/UlXbCmosLXIQVLR5ZRyn7yJrF0/cy7vVh+m12v0zACemgTcdNOKws8z60C0v/x
         dTZVF9bjBasK9d2I508UCklMlkhZbiFNgad6rF/vMWYk9qUvzX0ikohQ7JlDCpdfM1Il
         3FQRv4IT4xvt7wSnoQeQmvdcTTWyi7PERkL9IAw+Z+Oo50bvHXJJ5v3FN+y1aUd+uzEJ
         sIhjZGAXB3mwgTh8+VbPB0D6oRRDbjHHrrGNCeHBex5vwkQ9f8+m1oVt02/lX3C+AaRI
         Aqlc0FuoOEidKf5q6yiwJYZq2QTvMNhlkWKGr2PWwRvr+492zCeQabK64SEhpU0oITuU
         lIbQ==
X-Forwarded-Encrypted: i=1; AL+hErEqUcC2Rj0LoKFc1r7dnEdxi3NY9qEqWWbbhUOJBY6N/5dc4xpzTNPpsWPWnHZwxlgRfd/Hp3eBM3MYQeI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4/iBpwdIYaKV6bNwV5RQ6h5gJMz3BYaqHuq2Bd2mWVv51D9zl
	lX5A5tRa7d4nQSq/pWqMFy3+dV/0JcfXXuEPu6OIiel2nMSTUzvJEWfa
X-Gm-Gg: AYBFou1HjCPZWBOJacH2gu83v+zmHMD9pTGUKG5anNQGcIfmTS1QtFE1KexbyMBgBLw
	xndQO+kR5vkWyfJeLIS4B3WUgMHByZ2TCcYzFRsfX28SkF4yC9uxL1HzSQzeWli+eKbfMvBVoRH
	nK4sf1zZ/OB9hnFBt9stvZrF4Z4om+hCSIhBbjYpnJCmj4dL/wtc9WLD+cXhdFyMAbbDXFL8W2S
	T5fSdpMyhDE7IRiRH2BdDON/sSDxm8fluDvUgURhGHqQpW5AG9FMR9nehN1XduOjJPP+lhUrMLb
	Re4utQTA54t35qvkzu7C1Gi391cSvsMTmY6hq4BXl31q90TBoWyT/OuJupU7kf34WpaYoiTiuQP
	Gj/gd6z7DL4vaWnwmc/9LgCgVnwlAHKpVN7n2a/pLjem4OHgrSC/l7j8mnxCzEh1EkMokSvPe0u
	ElkhlIKzvxaja9jDL704VJTTEULarR+BjDYdUAFU9KwRpI02+EUouHtre3LMuSlyoGQCipD7Fy5
	SMPvjcrcBqZTva2SpH4hxVV+xM1gkwVnDn+IjVjMs0ZI1o8+UP9LMJk6axLaudnrP8Syb/tA0ud
	+yK9Cy3p2Cycdd4FmctD0at4RlSCJsNo3FQ+jFTnQDRy5zY+zAJfZNWr44IgvuMwsYCt29+VOC2
	gD/NO6aADPx1ZGXoTmpOeruWVwPz5
X-Received: by 2002:a17:90b:4a43:b0:3b0:a3eb:759e with SMTP id 98e67ed59e1d1-3b182e6f662mr4020514a91.17.1794452027099;
        Wed, 11 Nov 2026 18:53:47 -0800 (PST)
Received: from prox-debian13-dev.listerlab.win (203-96-142-148.dsl-dynamic.connections.net.nz. [203.96.142.148])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d7bf46sm27052045ad.31.2026.11.11.18.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 18:53:46 -0800 (PST)
From: Patrick Lister <patrick.lister.dev@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Keith Packard <keithpac@amazon.com>,
	Nicolas Pitre <nico@fluxnic.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Patrick Lister <patrick.lister.dev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ARM: nwfpe: use task_pt_regs() to find user registers
Date: Thu, 12 Nov 2026 15:51:59 +1300
Message-ID: <20261112025159.473997-1-patrick.lister.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NWFPE locates the trapping process's saved registers relative to
current_thread_info(), assuming thread_info sits at the bottom of the
kernel stack. Since ARM moved thread_info into task_struct, that
expression points past the end of the task_struct instead.

This breaks FPA instruction emulation, as the user registers are
never read or written and causes out-of-bounds reads and writes of
kernel memory beyond the task_struct. Any unprivileged process can
trigger this.

Fix by using task_pt_regs(current), which finds the registers on the
stack.

The bug was found with assistance from Claude Code (Anthropic), model
Claude Opus 5.5 (claude-opus-5-5).

Fixes: 18ed1c01a7dd ("ARM: smp: Enable THREAD_INFO_IN_TASK")
Fixes: 9c46929e7989 ("ARM: implement THREAD_INFO_IN_TASK for uniprocessor systems")
Cc: stable@vger.kernel.org # 5.16+
Signed-off-by: Patrick Lister <patrick.lister.dev@gmail.com>
---
Build tested on Russell King's linux-arm tree with footbridge_defconfig
(CPU_SA110, FPE_NWFPE,THREAD_INFO_IN_TASK), W=1, no new warnings.

Runtime-tested on 6.12.116, where this patch applies unchanged
(arch/arm/nwfpe/fpa11.h is identical to mainline):

 - QEMU versatilepb (ARM926) with OABI_COMPAT, FPE_NWFPE and KASAN:
   a test that executes FLT and FIX gets the wrong result back and
   KASAN reports "slab-out-of-bounds in PerformFLT" without this patch;
   with it the result is correct and KASAN reports nothing.

 - Nokia 770 (OMAP1710, ARM926, OABI userspace): fixes the maemo
   battery daemon's FPA arithmetic which would incorrectly calculate
   the remaining charge of the battery and power off the device.

Not runtime tested on mainline: since 25900bd99d4d ("ARM: limit OABI
support to StrongARM CPUs") NWFPE is StrongARM-only, and QEMU's only
StrongARM machine (collie) currently fails to boot mainline.

A reproducer is available on request.

 arch/arm/nwfpe/fpa11.h | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/nwfpe/fpa11.h b/arch/arm/nwfpe/fpa11.h
index d51195d41f5b..25c327a73a27 100644
--- a/arch/arm/nwfpe/fpa11.h
+++ b/arch/arm/nwfpe/fpa11.h
@@ -13,13 +13,12 @@
 #define GET_FPA11() ((FPA11 *)(&current_thread_info()->fpstate))
 
 /*
- * The processes registers are always at the very top of the 8K
- * stack+task struct.  Use the same method as 'current' uses to
- * reach them.
+ * The process's registers are saved at the top of its kernel stack.
  */
-#define GET_USERREG() ((struct pt_regs *)(THREAD_START_SP + (unsigned long)current_thread_info()) - 1)
+#define GET_USERREG() task_pt_regs(current)
 
 #include <linux/thread_info.h>
+#include <linux/sched/task_stack.h>
 
 /* includes */
 #include "fpsr.h"		/* FP control and status register definitions */
-- 
2.47.3

