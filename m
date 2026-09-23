Received: from mail-oi2-f42.google.com (mail-oi2-f42.google.com [74.125.231.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBA453B35C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174955; cv=none; b=qDC8khNwtTwSJmtW4dKMpHYwu+ENYgaW56P/dLdZ+KvOUnbiuBLqYeitByd+5cUbltlXNYj7m1PoLbmc3kRDaJsQLBaFCgVrhLot3q9MJ3E5gESRWvErf95KnCCWjS8/Dqt0fx+tUVcOvfOmwWQM/G8tEOyNe9Ya4KWmVAF9yB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174955; c=relaxed/simple;
	bh=wvFQBz25XEKcRJNL0SSe015v57XgY3JcbH7bg42CNMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V0fCCZS7Iz3W+veEfkdzg6r4KJa8qCSQFyxce2okmJiIF0nvTv9m10h2JhsWt400vdix8u0xo0ynsztUH6zwfSH/yZNOhqX+besHkukCNHmtSZ8ETgJJefd14X4Y/N2NTH7sPbnLQlkXJl9h9dEDkysw5mZe+TuIHgVMNnjmDEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pj8Hj02T; arc=none smtp.client-ip=74.125.231.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pj8Hj02T"
Received: by mail-oi2-f42.google.com with SMTP id 46e09a7af769-8167e0d1f90so397945a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790174953; x=1790779753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1JAcPQg636JNOKXQW2C4J8TQkuklMU5EX+3CopghKI=;
        b=pj8Hj02T5RrCa13vH2T6dW5BamMMzzI9RLcsJ7/rd3hZna05HBKy3gEoymkTskyEdd
         AWTg8e1upkbBxE3C8AEP4mONO3KZkM4GRiK+qwyvHuNytIROskMd6L7B6L68AA1zr+Zu
         ShiN+5esV0D1R7f9caPkTg16alL85axdwwaH3z4WUKPGoh5vNIkdV0U/FIxyVTRyLRbT
         p0yYq0B7XhG52UZBgrYsqyxWTbVV/dhGoNQxF/tjfTr/KL270pjj4LndKFMZKdVCYWFD
         l2SiHZiZWQM5xjwKHn5Udbw26F3Fz/AcGX5SmYxfObQ0H6GEFSBM7vFQfq5WbUpd9x8v
         0rnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174953; x=1790779753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1JAcPQg636JNOKXQW2C4J8TQkuklMU5EX+3CopghKI=;
        b=rf7Rd3yrheAxIb4slY6uEi7o9ObPVDBESnr9YMSWd4dBXHTjjfesvEy34bgLVsoUBS
         CwRljJgDtBR5eMatfXjbtc4u5EE1M2oOdBBrqGTT9zrWXMVphP6hBJBR1eg5WW0NsNWr
         v1EgkDPIOGmzyTniyYOn7p2TXVfWPEH+z+9LutEJY8Zl0P7SfecWOzG9GY7PbQiB+r+1
         t7BOaa1ja7BC0tWfyqtFHy42KgM+Isl749ulBwVDqb4RgaFnRsQ7OCjf0sd/vjxuep2s
         OZJmW82AAyoht0J7vjsqQLVghuLQPBD6r/m1V9s1H8Zr+C5AEsK2x2v70GKoXJlF6sAp
         2FQQ==
X-Forwarded-Encrypted: i=1; AKwUvByjc3TDk5Gd1HbfLrqM+07DqKUNbbOUarHtuMd66ZgsmEBc8qM3L/QNHktKrTCoNZRWcP2yrOybAaLprgs=@vger.kernel.org
X-Gm-Message-State: AFuF++l5rI7gbLNo+q0BQdzXsAiu0thCzdGnPYeiNrkjrD8+pQtV7OIk
	BGBk5CcDg0AyCgUgv8Emnf2k9U7wZ5vi6f9gBl3mfZLQWRyr7SIrz5TJ
X-Gm-Gg: AYBFou3bxXNBU6yDjH8NgJia19Lk/PNWPz7aiO9a5tl8FLKWHqbHnBw09Wyn++3xcwy
	dMSOrJ91/0/vaM8irRrDLb9UDOjTrA8QBolbfIBjtwuO/EGq+yHIeBBLgk/+Qt/NeLb8p32A+g9
	rXJzZga36kixgd1YN30V77QNpzgh1Ke/QJVq37ZZIqJ+DyDj7N7JiLNtvTatQk1hvG81TUsuBGn
	dqwsnJw2bDV84uoWNnkyrgFoHVHxp5Es2OZasBYrMqkNIv8SGusWwXuEam1+I/upNdkDLVaPiLy
	QS3zmOo1SAznLt9ahS1LaGZoFXKd83mOM4RuD8uj0EjR7wMWFhX1wLToNfi2lG4NG0qnBUjUuDj
	CqwvFyBIUWwiJPvFWBtMbqn4bno9LNdSyIvEw2l/qsvE53eMJofuko8MPDLB2jGguEVBXSdzCYT
	7O/mWj64RUTFQB2D3qKc0pTsYg43GCyzzdJQhr1Xjcmy6is05EiknkQvuMRTlgZRaUsSDGzPSig
	U8893neE/VHL9FtR5h7fFiPW7SpMUq+ERKRgrcu
X-Received: by 2002:a05:6820:4cc4:b0:6b1:3552:3195 with SMTP id 006d021491bc7-6d2cfd50098mr2368712eaf.11.1790174952926;
        Wed, 23 Sep 2026 07:49:12 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d2c92c2619sm2788537eaf.0.2026.09.23.07.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:49:12 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Allen Pais <allen.lkml@gmail.com>,
	sparclinux@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] sparc64: kprobes: fix relbranch_fixup() for BPr, FBfcc and FBPfcc
Date: Wed, 23 Sep 2026 09:49:07 -0500
Message-ID: <20260923144909.414968-2-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923144909.414968-1-danishkhateeb03@gmail.com>
References: <20260923144909.414968-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A kprobe single-steps a copy of the probed instruction in
p->ainsn.insn[]. When the copy is a taken PC-relative branch, its target
is relative to the copy, and relbranch_fixup() moves it back to the
probed code. It only recognizes call, BPcc and Bicc, though. For a taken
BPr (brz, brnz, ...), FBfcc or FBPfcc it keeps the target as is, and the
kernel continues at the copy's address plus the branch displacement.

GCC often starts a function with a BPr on an argument. For example,
__se_sys_getcpu() begins with "brz,pn %o0". With a kprobe on it
("p:kprobes/kgetcpu __se_sys_getcpu" in kprobe_events), the first
getcpu(NULL, NULL, NULL) crashes the kernel in QEMU sun4u:

  init(1): Kernel illegal instruction [#1]
  TSTATE: 0000004411001603 TPC: fffff800048d63c0 TNPC: fffff8000492631c
  Kernel panic - not syncing: Fatal exception

Add the missing branch formats. BPr is matched with bit 28 clear. The
CBcond instructions of newer CPUs share its op2 value, but they have no
delay slot, so a taken one never reaches the single-step breakpoint and
this function.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 arch/sparc/kernel/kprobes.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/sparc/kernel/kprobes.c b/arch/sparc/kernel/kprobes.c
index 191bbaca9921..9a26c57c8d33 100644
--- a/arch/sparc/kernel/kprobes.c
+++ b/arch/sparc/kernel/kprobes.c
@@ -207,12 +207,15 @@ static unsigned long __kprobes relbranch_fixup(u32 insn, struct kprobe *p,
 	if (regs->tnpc == regs->tpc + 0x4UL)
 		return real_pc + 0x8UL;
 
-	/* The three cases are call, branch w/prediction,
-	 * and traditional branch.
+	/* The cases are call and the branches with a PC-relative
+	 * displacement.
 	 */
-	if ((insn & 0xc0000000) == 0x40000000 ||
-	    (insn & 0xc1c00000) == 0x00400000 ||
-	    (insn & 0xc1c00000) == 0x00800000) {
+	if ((insn & 0xc0000000) == 0x40000000 ||	/* call */
+	    (insn & 0xc1c00000) == 0x00400000 ||	/* BPcc */
+	    (insn & 0xc1c00000) == 0x00800000 ||	/* Bicc */
+	    (insn & 0xd1c00000) == 0x00c00000 ||	/* BPr */
+	    (insn & 0xc1c00000) == 0x01400000 ||	/* FBPfcc */
+	    (insn & 0xc1c00000) == 0x01800000) {	/* FBfcc */
 		unsigned long ainsn_addr;
 
 		ainsn_addr = (unsigned long) &p->ainsn.insn[0];
-- 
2.55.0

