Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792634256;
	b=VBfP4iLebmtPV0aJSAqtA9UJM+9rfY1zZZ4hnB7evKbUpNjhgEf0XiN/qV+E/kWXyUXS
	 NHlZHOi1MP+psKlJtTb0L0WxSfSRc9ME4T8ttBItnT6AXLQlEt8UZr4n4nuQnbGBm9HR3
	 Kps5SsGOhPIXBaDv1Hdlda2IQz9phHlzzbFl4LqnDiruOdlQ9NH3cfgz8fK1x++UxrWRi
	 DFVVuAMhQ27BDV17tZCHsp0hjLQbYzMmV/oo4bm+vpmitDS10CTd5Csgbsk2SpSIv9toF
	 kW0dgfkfh7EcuCWyP1Cbxyls4EXMgArM+Qe+YWrkYxlbe0iH4R7mtDYgeACx/KQLZDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792634256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hzZTIl9xajYqJye47ARFhIH6S/mo0DE83iMFJBmKqCA=;
	b=mpZTtuDtQB4QCfMBDpYhV7xLgHmT6Od7P9hjSHJc7wITQoj42wIjXHG8O/uXhX0bNrnl
	 fWm2VwoangBX8f6gA3k4md0UrQQ+ETDm0h5GIPZffaOmWgEDvEMfoWgxvdxYfRiD/BYWw
	 K8v6p+daZgCbtOrkQ7svBAphjKsQlsrP/oO3pAw+sDKKmviVPwsKrEjNMWVi8VUEulM/w
	 N1kAYldhiqMQKCuMSUJkxQ3WjMzWX/lwWQaJKb3UyR0202VSgKc42UsutG9leUhYXIk3Y
	 wOOgH9tXDeDTqcl73xy3jF4Ifa+XVJG4QJ5WhNe4J/SHMRuqqze7aNMg0kE5ud/C9ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ENH+XPCy;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF804606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF804606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ENH+XPCy
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so767363a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792634255; x=1793239055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hzZTIl9xajYqJye47ARFhIH6S/mo0DE83iMFJBmKqCA=;
        b=ENH+XPCyJctxYy0tq/P/dNgxodBKniOt72zMFjcHfl88zP152hyucaTU7RJZf4QI1x
         1VpGfRQTR9BMTIjq7PqmW4d78toRZTLTxsmwNZLt56CIZqKfeDGwd7/hVLiAQGUE9xLn
         F6LDiVHHO3801WBDL3nqEPo57ozaTFsl5oZIT4EPDiOWTd41sFl/XYF6hvSs1r9WurX2
         LXE4lsm4XWPQo2UgKi2+Q6LrGO/06MLbgfsSUUp8N/mlZQyiDVupLjeRTdemuXbfK63X
         mPm1iX4y2RdwuUMCaRNX4Slq5YKvU1lf3YRAFvofA1yVVeHpFoFuPQvpIr8zc8Z0+B7Z
         wHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792634255; x=1793239055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hzZTIl9xajYqJye47ARFhIH6S/mo0DE83iMFJBmKqCA=;
        b=qnme5EONT658u+HFrr8zrzjWYmvr7MgKaIPLhMbZhyF2vbwGIgYOxA06VqxZ6N8Vrn
         nrvD78a4PxZATCsi5cV+Or+z29orIlKz797oeR/i6ALOuzWH2QX7ga9I8S+Sep3BH/es
         nAED0Mkr6VvyuD7SGcx7JNV1QcTT8DGuyKKVCFnhoRxp8AKiSCi32L3v9V6hhHDvonWL
         dST46kOZriS4GtAoEsdSr0G1jyQ2A1OPShMV4mbaYHHGmd1ANRG7y0hUoknPPChsedDg
         RkxyKE+L95+Fo8aVMv1i66NGXWVsV/TY6lf7scLFHDhQHmy5u6LCKjHd3UgktYBtfq1q
         RItQ==
X-Forwarded-Encrypted: i=1; AKwUvBxH3piIROwxIh0KKPaxs2iiF4OgXgHCcJiK+SSHRytOPhPxJ0U2rCTNw4e/GrVwL0g/bM3b2rVg43VrW8Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcZ2NyPUWeRB7ucrawTcKGA3RItu4G4IOC7JyM9mJuulAeyfDh
	vT1SMXUvReAoxl2YM/y9j+otL9tlKol0020K21kZriNTABBhXMy2Nhdp
X-Gm-Gg: AYBFou0atQe0Fj7ulo78p8j7ijP1drjooxCIF9ykLcSzG9ZqXJQoI55iyMJW49DGCSq
	+uhYwJcdD3slboHbY+e8kHf3BGxiZmSzGf8XeCqCbVCVua3WF/eOxGtKGdf3dQRPqTtIlAA1wkW
	solhSxwQvOjkHxrI8qKWHUhnqhEbpodIJP04TiHoNu0K6PFOCwNQ9TUDVzDPpdaoXOA6E2yccBU
	Y21coEG/6CqcjBJeuGdsNHBkiph8WRsN+EIn+jUSco5y29PJ4IN1bVLeeMGj2pw7apMgN8DpOj5
	x6pLRnmrmoi+moT0MPep3rXuLN9bmjLwlzxC7pxg23FL1Wn10l6ZD9VRGRheqbE0DnkfVfAiWx6
	4azbvM1NmZ2PSn4gzfV+5u0D15amodBoD4tJ1rKcoUliVnPixLqnVlN4if7oF9Ml9wIARjMoJxh
	dJt17iFcXMF/j1mrd+l6JdB7ZxFfLetWwJ+FRQJFvLtcxm34lHM0CNfUE8+cqanXR4Awda0l0bh
	P9LfTeohpGzSJVypW06TztqF/xUV1rt8q8H86Icju+4PmtoE1dQ84lEEmHZm1FcCkCmUL8e/GJc
	NNStnzEcuHTsjmoRm29hpwxE0ek6M6xEwZXOpnoazXjboI753GEZXFSuOmoAHC9aGV2+MCTrJ9W
	O9RAeugLY6iE1R6i3VT9R7Qeb
X-Received: by 2002:a17:90b:1dc4:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3ad86d4e4abmr2953396a91.40.1792634255162;
        Wed, 21 Oct 2026 18:57:35 -0700 (PDT)
Received: from coder-ast-ast-dev-ml-0.tail2dda0.ts.net ([153.61.198.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad85fa6b87sm2978876a91.3.2026.10.21.18.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 18:57:34 -0700 (PDT)
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: bpf@vger.kernel.org
Cc: daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	oleg@redhat.com,
	peterz@infradead.org,
	mhiramat@kernel.org,
	jolsa@kernel.org,
	akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	surenb@google.com,
	david@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	hughd@google.com,
	kees@kernel.org,
	mingo@redhat.com,
	tglx@kernel.org,
	x86@kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next 3/9] uprobes/x86: Finish an unoptimization which failed half-way
Date: Thu, 22 Oct 2026 01:57:06 +0000
Message-ID: <20261022015712.1297331-4-alexei.starovoitov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022015712.1297331-1-alexei.starovoitov@gmail.com>
References: <20261022015712.1297331-1-alexei.starovoitov@gmail.com>
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

From: Alexei Starovoitov <ast@kernel.org>

int3_update_unoptimize() restores optimized nop10 in three writes:

  48 8d 64 24 80 e8 d0 d1 d2 d3    lea -0x80(%rsp),%rsp; call tramp
  cc 8d 64 24 80 e8 d0 d1 d2 d3    1. trap new entries
  cc 2e 0f 1f 84 e8 d0 d1 d2 d3    2. restore bytes 1..4
  66 2e 0f 1f 84 e8 d0 d1 d2 d3    3. restore byte 0

uprobe_write() can fail with -ENOMEM, or with -EINTR when the task is being
killed. When the 2nd write fails the result of the 1st one stays. Byte 0 is
a breakpoint and it works. But the next set_orig_insn() doesn't find lea in
byte 0, takes it for a plain breakpoint and restores one byte:

  66 8d 64 24 80 e8 d0 d1 d2 d3    lea -0x80(%rsp),%sp; call tramp

Nothing recognizes these bytes anymore. The process keeps the call into
uprobe trampoline, which can be unmapped already.

Teach is_optimized() to recognize the half-way state, and let the 1st write
of int3_update_unoptimize() skip what is already done.

The failure wasn't reproduced, but the state can be made by hand. Attach to
nop10, call it to get it optimized, write 0xcc over byte 0, detach.

"uprobes: Don't sleep on mmap_lock under dup_mmap_sem" needs this. There
fork() removes the breakpoint from its mm. When fork() is killed in
the middle register_for_each_vma() removes it for the second time.

Fixes: 554ba38456da ("uprobes/x86: Move optimized uprobe from nop5 to nop10")
Signed-off-by: Alexei Starovoitov <ast@kernel.org>
---
 arch/x86/kernel/uprobes.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/x86/kernel/uprobes.c b/arch/x86/kernel/uprobes.c
index 65a2de82ecd2..62bbe41c6466 100644
--- a/arch/x86/kernel/uprobes.c
+++ b/arch/x86/kernel/uprobes.c
@@ -896,6 +896,9 @@ static int verify_insn(struct page *page, unsigned long vaddr, uprobe_opcode_t *
 	case EXPECT_OPTIMIZED:
 		if (is_opt_insns(&old_opcode[0]))
 			return 1;
+		/* An earlier attempt got this far and failed, nothing to write. */
+		if (is_swbp_opt_insns(&old_opcode[0]))
+			return 0;
 		break;
 	case EXPECT_SWBP_OPTIMIZED:
 		if (is_swbp_opt_insns(&old_opcode[0]))
@@ -1109,6 +1112,17 @@ static bool __is_optimized(struct mm_struct *mm, uprobe_opcode_t *insn, unsigned
 		s32 raddr;
 	} *call = (struct __arch_relative_insn *)(insn + LEA_INSN_SIZE);
 
+	/*
+	 * INT3 followed by the rest of the optimized instructions is what is
+	 * left if int3_update_optimize() or int3_update_unoptimize() failed
+	 * half-way. It works as a breakpoint, but to restore the original
+	 * instruction it has to be unoptimized like a completely optimized one.
+	 * The same has to be done if a debugger has put its INT3 on top of an
+	 * optimized uprobe. The trampoline can be gone already, so do not look
+	 * at the target of the call.
+	 */
+	if (is_swbp_opt_insns(insn))
+		return true;
 	if (!is_opt_insns(insn))
 		return false;
 	return __in_uprobe_trampoline(mm, vaddr + OPT_INSN_SIZE + call->raddr);
-- 
2.55.0

