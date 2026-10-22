Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792634263;
	b=fhpvZ7+4nA6Ec8Yueg+d4So2Fs0RX+WIwH1e7/BbWo2WaF8cTQNY++Twyq80oETRE+GE
	 ohbpeVFIhOwRIJeQaRN+9Vu9YEgmcmkiCiPn/F4xrYTvvYSklhIfJtpN1/SCTF2CMbvU7
	 JnSs07qbvzApAS9BbBaHV5T6OWNZDfpqPaM73dbLXmGwQXnMcWJBf3AD2EJ1czHXR/hYJ
	 QTeq4qEGHUSGSeUB2+xDoDJJeNjm7CXZO8Zb1dp4pgHUJcHWMpGYgEv2HxWk2NTenr3WZ
	 QAGEPFctG2+dCq+5wAkdeQt2A2hrWmcggGuen27MO+4yeYRZ2PUr92DPfnYvETBmsRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792634263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1YfAOVlMmaFO1m8awbcQvUypoDPfeD8mK+PEX0oRAyM=;
	b=eH4SUd1SIdJhfsxlqYton46F/Y+h/JxDpAJq9VLaTGRojMom4/V/Uke0H9xpQh1jFjjg
	 lQMgf4mnVcfhN0gaRlL7nVMaVQd62i/NPjHvUXUhjVwalATdaYEtT4JI+5SY2jh1hAwON
	 C1HGZrptv1iXrG3a9QaHWS9fum4lIAlFrbI2K5q39xlbsM2szZ5tccTqwMG7nEBWSMx+M
	 mN+uKFjTu7lLpzjSUttxGK58Gay09sst4247444AYus//2JlySKLbVVWOrzPAPhcqtDHI
	 oshkFRhUUN8cPal2UZoAKuaaa6ul4qZVYSIYAJvaD6+1qgpR5Kt8R7CrYzYZxyNRW7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QMifRPw7;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B210F606A328
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B210F606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QMifRPw7
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e8fe8e343fso9014815ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792634262; x=1793239062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1YfAOVlMmaFO1m8awbcQvUypoDPfeD8mK+PEX0oRAyM=;
        b=QMifRPw74ATHweuZbPUqbEJKY4CbQGRNSsvn3yPOvskEWe71YJcI/zC4jQs+00oX7w
         AnfEnYnVX28dLRI44N3yfdkR61rnHMRP4lNoh2cSUyUUtPRruc1ZumwNqmtF4opAMb1K
         dFb0OkilKx4tuI2gsL1PUSXTuXHCGkJpRxzMXDY5Q97X6m6a6FwdHdyOfvPuIjU1OweG
         oKw+fYZgVxT1ENZeN6Lcprmt0I3Wyyvw7Fd7d2dCsxHovO4BrdnGaZ7NBtM6AUJ+YrTR
         03ldC4K4udelto6khrnvnMnHTt0BonrFcW5VNoCjJpVS1CTcvaFHocA//TqSOTId+e26
         jQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792634262; x=1793239062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1YfAOVlMmaFO1m8awbcQvUypoDPfeD8mK+PEX0oRAyM=;
        b=iiVFA/MbkSgBb92erKqSKLrBFY821pT1q7w7hku58obyFcOkP5RVlAAo4SZEsHBFQr
         IQG4LCrGFizG+tzcdWS+Lk6CVHJNjDqwk2emY14MCyq2Vkcy5vNrnENM9we6nk9o6lja
         xqEeMIphnxtSG9EvKpBWsXmd4x1i7UB83wJiEcFEhFvc+o+BGUqEEAYRwzvEtfaqvkIA
         xmBSrBH0+VjTq+JdnjnRjbfoFQmz4/96terVv4OusTx51xYlZonH2NUL1b1NWoeIxqpF
         IsoMYIrTuUACivEC4LDNtaRTXmqRNsXbkZHfng4ELaTAnAT+fQ1oBbvwlemDcyM9HI6d
         bWbw==
X-Forwarded-Encrypted: i=1; AKwUvBzW+0Tysy2PXyg9mwClyb5yAv5s3/wmhI/NnQed6/+iv7FyaAPtQ/XvBaJ7m4gICvojvbPOuV7nOdTku48=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBg7mtEIS7Uy+AVywivlFs5QzeD6cs+/ePUdY76cj+3O9dYy3K
	Mii6aUxBFDvLFjrQCATyijORFUVwrQnrHKxwLnkYeytP8cnchiIrTbIz
X-Gm-Gg: AYBFou09aAjCkyydVsuna0JSUw6/Emcs6Ksz4V3KMZPpAPpshQsxO7Tv5G5UEqJmE3D
	5+M2IdS8gWiWIuqZKzACfJbh0IKHdX8s35lablSjf94iByxoOsbgHkrPhTKUw48rO95SdR5VxG+
	6ntiftQ7IG1whaUlFpvQ2DLNv8Uy6kG0MkP1zSNYdCFZecgijG8WYiOJ6drxjVL5n8MDO7PV6lQ
	PGnrq92MsVggecCfEieVyGsrwoO6/oWBnxro39WG/5p26HtcpYOElSBnMzAJekQFWg0PbH4z+gI
	MK3YGsY8vi+gDl/lsIbny/irXEhdExekdUDCz3n3TxJ4l/8jDw6Pmj98h/Pc1BG6xuTCHak2Vik
	iTBxQbGFQKyT/Uik49g0vL6Jjxe5AL7M8XWbjR467YhpdGRZsdhGuT8fV9VJROblFMG+NY0VFi8
	oANzwUhExVWljSMMA0+1rtRwqSFQbR9x8iS9dM1wX5nhLBUA72UeUIdy39MxpLTwiQPzv052dZ3
	D0SlOKHneriT94usMwMtJgT1Nc5LKFrihVpyMNKOp8xpuZbLR+BNIBKN3PNbDgDbikBr5Azh1iL
	008avKwhRrzjLGjJK9qajNZclTSeSpRUDHTr1MnLr/vzBG7tqJZlU9MMym5b+mCFI0dBYg13w9Z
	bvwR8x/BFwRn0mrvNb8X6jUdg
X-Received: by 2002:a17:902:e74c:b0:2dd:c0ff:e72b with SMTP id d9443c01a7336-2ea4404e987mr25918265ad.61.1792634261828;
        Wed, 21 Oct 2026 18:57:41 -0700 (PDT)
Received: from coder-ast-ast-dev-ml-0.tail2dda0.ts.net ([153.61.198.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4af4dasm17474295ad.75.2026.10.21.18.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 18:57:41 -0700 (PDT)
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
Subject: [PATCH bpf-next 4/9] uprobes/x86: Don't WARN if an optimized probe can't be written
Date: Thu, 22 Oct 2026 01:57:07 +0000
Message-ID: <20261022015712.1297331-5-alexei.starovoitov@gmail.com>
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

__arch_uprobe_optimize() and set_orig_insn() do WARN_ON_ONCE() when
uprobe_write() fails, and user space can make it fail:
- -EINTR from get_user_pages_remote() when current is being killed.
- -ENOMEM when COW can't be broken, since memcg is at its limit.
- -EINVAL from __update_ref_ctr() when the process cleared the semaphore
  of SDT probe.

Kill the processes that call probed nop10. It warns in 8 of 8 runs:

  WARNING: arch/x86/kernel/uprobes.c:1186 at arch_uprobe_optimize+0x291/0x3a0
   uprobe_notify_resume+0x1c3/0x4c0
   exit_to_user_mode_loop+0x63/0x4e0
   exc_int3+0x1f3/0x250

The next patch calls set_orig_insn() from fork(). Kill the processes that
fork and keep mmap_lock busy, while a trace event on nop10 is enabled and
disabled. The kernel with the next two patches and without this one warns
in 3 of 3 runs. The whole series in 0 of 3:

  WARNING: arch/x86/kernel/uprobes.c:1161 at set_orig_insn+0x161/0x170
   register_one_mm+0x154/0x180
   uprobe_dup_mmap+0x61/0xb0
   dup_mmap+0x149/0x9f0

The callers handle the error. arch_uprobe_optimize() marks uprobe as not
optimizable and byte 0 stays a breakpoint. set_orig_insn() returns
the error. Drop both WARNs.

This depends on the previous patch. Without it WARN was the only sign of
the bytes that set_orig_insn() cannot restore. Hence no Fixes tag.

Signed-off-by: Alexei Starovoitov <ast@kernel.org>
---
 arch/x86/kernel/uprobes.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/uprobes.c b/arch/x86/kernel/uprobes.c
index 62bbe41c6466..33c35bf07801 100644
--- a/arch/x86/kernel/uprobes.c
+++ b/arch/x86/kernel/uprobes.c
@@ -1170,11 +1170,8 @@ int set_orig_insn(struct arch_uprobe *auprobe, struct vm_area_struct *vma,
 		int ret = is_optimized(vma->vm_mm, vaddr);
 		if (ret < 0)
 			return ret;
-		if (ret) {
-			ret = swbp_unoptimize(auprobe, vma, vaddr);
-			WARN_ON_ONCE(ret);
-			return ret;
-		}
+		if (ret)
+			return swbp_unoptimize(auprobe, vma, vaddr);
 	}
 	return uprobe_write_opcode(auprobe, vma, vaddr, *(uprobe_opcode_t *)&auprobe->insn,
 				   false /* is_register */);
@@ -1197,7 +1194,7 @@ static int __arch_uprobe_optimize(struct arch_uprobe *auprobe, struct mm_struct
 	if (IS_ERR(tramp))
 		return PTR_ERR(tramp);
 	ret = swbp_optimize(auprobe, vma, vaddr, tramp->vm_start);
-	if (WARN_ON_ONCE(ret) && new_mapping)
+	if (ret && new_mapping)
 		WARN_ON_ONCE(do_munmap(mm, tramp->vm_start, PAGE_SIZE, NULL));
 	return ret;
 }
-- 
2.55.0

