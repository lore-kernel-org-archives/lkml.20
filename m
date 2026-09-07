Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE96393DD3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 19:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788808078; cv=none; b=BqWAZIb8oGOKA4jcDKXSYVGJitRY4ITNUg/J298KocK1YVAF9Tmu/FDTuzBP8cJih5QEbZphiDAdWqmiJWcrI8tWqx85yEYVSLeIoDOMwlD73++WLe4KItXjpNUSvPcEOG0f0k6NrEwZNURj/4yyMdAT23paBXfy4ufoAO6+m+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788808078; c=relaxed/simple;
	bh=AeMqMKtXIsHvLhox+UqL0AFJ5LkyanpxXo50+ZUujmI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TFctFxxu/aesh+SSMOY88zSFBrQPiBVH7O8xhvuqeFKCL85ltwL119lb44XXVjoQVlH4HRT58RsH0mLAwcoTL3aLjfSttgAnbDF4lVAETZ/lNnagglgSJS2jqvWZmDYuMuWR6oq+n/cl2k9NQ0eLGhucwI3hqvHnGgfSPJwhCYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PHuk1wD1; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PHuk1wD1"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so39049085e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788808075; x=1789412875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FCg+kqJBNRvAirf0IACBhcdBxWIbdof2JqDpd+PZMGE=;
        b=PHuk1wD1Z6GSw8xq0G622ZLuDUM98G6BATV7FF8AGAQHQvV7GBCnBAThz6mYTGnZU6
         ZaIAeTJBklpr/fa7WF4c/KCLMmwYK/mhK26DvW4lbujR/5TwMH61qdLDM8DC2NMEUMeF
         CPgTZN4GmOdc2PNqQXiA2DZg4qw4+SXohzcS6xljgXlzAMyltz5RA8JAJk2P5sY7egRC
         DgQtVA+iSztBPqS4OrbFbTOo75X+Za6onxFV2lP28129KnnRNlEL6tDt3s5xrg6XRVXQ
         odzd8Wb50k6eTR3fnLfod6zn9nTJxqVpQSc1sWYEGVps9Ow0oRx9PpzNV4uxjHKmzTSJ
         cAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788808075; x=1789412875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FCg+kqJBNRvAirf0IACBhcdBxWIbdof2JqDpd+PZMGE=;
        b=J14PG6lS7ZqlPVW27m3kFQDqtBILhPJeji16P1s+S/1z5exosvviPEKnAP8CjWynwi
         q5a92Xtma2p9nhBCDCPaFynf4KSTPIhVcak48CmMmO8Q4B+N1AW+DIgCNRqRBK4shGJZ
         IpmcpACxN3D/CXw0QCjj7JswOwle1q/AzxJGG+ifCWixPMljjXDBsCw+BonAjCowotMU
         IAGc+lONIt+HCHpPgiyyxszrQ9+N6Xm2491AhL1QOdAGpCPIUr/PdY9AqOvEeOOXbqBv
         ernOazbDjtXP3nwVCfC5RJlaKDgpcq25DiLAo5ugBWdwFVn6d/6VaY7JhK50l/2xGNgg
         1L4A==
X-Forwarded-Encrypted: i=1; AKwUvBxZH/4ok7KsbfPlbkbi3rNp/tE6E3ucJaKiYKmHh4/da8NltCJgppRKnmXOulj+ML17Vy1peJaBUfFSr2E=@vger.kernel.org
X-Gm-Message-State: AFuF++nJkRkDAHgh3rAjW9NobgbDl23Hwv4drza8PS9uevn5wbWxhOUm
	DQ9IAeKySTvxVnQbULWTGtHB4zBdFFJIkd4G1Bs9HtK6ANRrXr9eLVQmCYEkEUbz
X-Gm-Gg: AYBFou19mu/NX89Hr1gbEYAMtCeBugeTt2bRLslH6JhVhWuIGPoZYh5bXtluW16xVSz
	2T0YixMwWfI/r4F7N+4pYL08jrgAu7gKZ7vzu1qn8+2pnsl+wKQy4GoALpRaUzPV002qmx4phG3
	cRrsoxVKCDOtbyVYzn69mRKk9RUVWwkcSiq8ZVr7XFo3NVZJbuvJbF86wz41LY4vfgFiwj/w2Ge
	y8oszSRuNb2Tzgpv1C8LIdRHCr4iONGgSZZrdeV5I7grFChXuh78Z2gLc6LlpCtVIoTCfRFPnQi
	gb3M+WGqBwhbfudmb8jQXqe19ZIc6zjOWLmgmp9WYHvg0/65vl4UnMiRfNERynX9lOhgHHr69mQ
	ZxiwOQnNqhw6xaWthnDhp9NBmDyRrtlRrsxi43K4Id1+C0AQDfJpILQQDBMzH+Jp8x/YJVKS9uF
	AXEd46rUhLriNfV77daDI2jfQ87bYmPf4cwkFvmX0AsdZhu9kCltQ7a9uYWWX0+BN0g70L8Kn+o
	lnt7uPODpVc4Pf5krGUXMIkBF7T560sAfwLhkLPMWBB9HR4+4XiauSaTJVMWGhDlq0mo3vxlAj6
	kz0JhWgzfyhsUkBDT/4H8GGdPdUei4Q+NJwOWn2e67nso97BCJMQyg4US4Lpfl9Q2qhVVC7KUit
	nv0ic8wns0C4/
X-Received: by 2002:a05:600c:46d5:b0:49c:fc6c:be06 with SMTP id 5b1f17b1804b1-49cfc6cc142mr205512535e9.29.1788808074866;
        Mon, 07 Sep 2026 12:07:54 -0700 (PDT)
Received: from MBP-von-Karl.localdomain (dynamic-2a02-3100-b0c9-3601-cdce-ba4b-d0e3-dede.310.pool.telefonica.de. [2a02:3100:b0c9:3601:cdce:ba4b:d0e3:dede])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d00a5b19dsm265229165e9.2.2026.09.07.12.07.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 12:07:54 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: fix load_unaligned_zeropad() fixup for RV32
Date: Mon,  7 Sep 2026 21:07:50 +0200
Message-Id: <20260907190750.26303-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fixup for load_unaligned_zeropad() runs when REG_L crosses into an
unmapped page. REG_L is lw on RV32 and ld on RV64, but the fixup assumes
an 8-byte load: it rounds the address down to 8 bytes and derives the
shift from three address bits.

On RV32, a load starting in the last three bytes of a mapped page selects
the word four bytes earlier and shifts it by 40, 48, or 56 bits, more than
the register width. The caller gets earlier bytes instead of the string
tail followed by zeroes. This affects RV32 MMU kernels built with
RISCV_EFFICIENT_UNALIGNED_ACCESS=y, which selects DCACHE_WORD_ACCESS
and lets dcache name hashing and comparison and strscpy() use this
path.

Derive the alignment and offset masks from sizeof(data) instead of a fixed
8. This makes RV32 use the correct source word. RV64 code is unchanged: the
complete extable.o is byte-for-byte identical before and after.

Fixes: d0fdc20b0429 ("riscv: select DCACHE_WORD_ACCESS for efficient unaligned access HW")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested on RV32 QEMU virt/TCG with a KUnit guard-page test. Before, the last
three offsets returned fill bytes from the previous word (0xa5, 0xa5a5, and
0xa5a5a5) instead of the string tail (0x44, 0x4433, and 0x443322), and the
suite failed. After, all three cases and the suite passed.

Built full RV32 Images for both sides with GCC 15.2.0. The complete RV64
extable.o is byte-for-byte identical before and after the change.

 arch/riscv/mm/extable.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/extable.c b/arch/riscv/mm/extable.c
index dd1530af3ef1..e252eba55ede 100644
--- a/arch/riscv/mm/extable.c
+++ b/arch/riscv/mm/extable.c
@@ -68,8 +68,8 @@ ex_handler_load_unaligned_zeropad(const struct exception_table_entry *ex,
 
 	addr = regs_get_gpr(regs, reg_addr * sizeof(unsigned long));
 
-	offset = addr & 0x7UL;
-	addr &= ~0x7UL;
+	offset = addr & (sizeof(data) - 1);
+	addr &= ~(sizeof(data) - 1);
 
 	data = *(unsigned long *)addr >> (offset * 8);
 
-- 
2.53.0
