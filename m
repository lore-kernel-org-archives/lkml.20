Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.83.223.162
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975356;
	b=qWISPwkZhs9auYHLsJDZCJPdzy3E4qFtRLuMM3FaMdl+mY37XQ0kFfsQcwX3Tinno+7X
	 bcrreiga5dh+eEuS9K4dLnsZl84SQi25YcGcT6vtrXtHkDZiRCqV/H99qkWCV4VPM3h1r
	 B8VKd17Wawwe2T6f1P5r2Rap0U0HMG1qAEHy0inOQpthq67mg7aqdB8l6azBHreXunOiu
	 qgi1nHZjw3zTtkE2UrcdiGmt6PwphBSE9iZyHr/dEDoJED2YLi6HnD2uBRiuWGyPUrjXT
	 6YnXyCKCBCVgMkF9WXPeRu13s0pBPSnVOiREyLf5BIEMuPJaPibeKn4AbBOLXvtSYgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975356;
	h=DMARC-Filter:X-Sender-Id:Received:Received:X-Sender-Id:X-MC-Relay:
	 X-MailChannels-SenderId:X-MailChannels-Auth-Id:X-Glossy-Industry:
	 X-MC-Loop-Signature:X-MC-Ingress-Time:Received:Received:
	 DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=ubtLilUuKAm7/ob2XlUVCx3tABcVwsQNjiV/URQNZI4=;
	b=ALfJKRc+9+80KqxSCYoYpVhNWJ+4yxLJ73CMFHwSvWFeElUxWXRWouD0iyES95igihlU
	 YyQEZR26TsM/n5Hi4WV4eqLg32CZwJrDb0W+fie2CB/o9WrTC5IOQVfkTJ/spkSwBDhO3
	 uEpQ94qR8qSgVMtZqmY4eP+1LMHcqZfQ/3lIU52GpLoqwn0T+SMpqBNj7yB+dtrqctR3Q
	 3jDEiJrR2icTpMruSJjmOyaorJIY89sMFRfgk2iq0ARJF1KezNhWU6CttgBJN53oQKf7F
	 3khVLOsp5QxIT0yCFEorTZe1d3htsKq5toW+hfCtT6JogAOwd669mcBJkUxskNqaBQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stgolabs.net;
	spf=fail smtp.mailfrom=stgolabs.net;
	dkim=pass header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=oBDK2PiW;
	arc=none smtp.remote-ip=23.83.223.162
Received: from seashell.cherry.relay.mailchannels.net (seashell.cherry.relay.mailchannels.net [23.83.223.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A2B606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78A2B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.a=rsa-sha256 header.s=dreamhost header.b=oBDK2PiW
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id F0611942F13;
	Fri, 06 Nov 2026 14:29:08 +0000 (UTC)
Received: from pdx1-sub0-mail-a256.dreamhost.com (trex-blue-0.trex.outbound.svc.cluster.local [100.99.198.86])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 6BF86942F68;
	Fri, 06 Nov 2026 14:29:06 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Glossy-Industry: 36b28a1f41afe35d_1793975348804_345534686
X-MC-Loop-Signature: 1793975348804:3988946489
X-MC-Ingress-Time: 1793975348804
Received: from pdx1-sub0-mail-a256.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.99.198.86 (trex/8.0.2);
	Fri, 06 Nov 2026 14:29:08 +0000
Received: from offworld (unknown [172.58.167.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a256.dreamhost.com (Postfix) with ESMTPSA id 4jLhPr3v9Fzymb;
	Fri,  6 Nov 2026 06:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1793975346;
	bh=ubtLilUuKAm7/ob2XlUVCx3tABcVwsQNjiV/URQNZI4=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=oBDK2PiWYd9TnRuGNnVYtOh7QJP8qinw0SiQhj+dAlGWADCEANB7uOunGBSZ2OkAm
	 T+mqINpPuVj2M2ucF3rz3BDkkj7N4hG+zB07OE8enVLdFR3nhh0Z2UGEiaZLTBkwMw
	 JHNY25KYs42H87uurOxJ624W7DgpEwfVz8nL+eQCyANGHs1N0Ggt2Ny3f8C6bzEYys
	 asSeX2V4gxvvDFv1TE+wGNNfbnZpkTlcXVvtWLNBhUmtwzn8sec/z4hsQG2qksiYNE
	 dgs5s/tvqFTt3mbaenSZRSGqIm3vez5R2Es02qXHh9Al38lIUpFRFG0SySFIuFvRVW
	 3xSuQWS+V45gw==
Date: Fri, 6 Nov 2026 06:28:57 -0800
From: Davidlohr Bueso <dave@stgolabs.net>
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: alex@ghiti.fr, parri.andrea@gmail.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: Avoid smp_mb__after_spinlock() fences on non-SMP
Message-ID: <20261106142857.g5lxebqy6mvv6rtc@offworld>
References: <20261019013456.1898839-1-dave@stgolabs.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261019013456.1898839-1-dave@stgolabs.net>
User-Agent: NeoMutt/20220429

ping?

On Sun, 18 Oct 2026, Davidlohr Bueso wrote:

>smp_mb__after_spinlock() is defined in asm/barrier.h, which
>linux/spinlock.h includes unconditionally, so non-SMP kernels get
>RISCV_FENCE(iorw, iorw) as well and emit a full fence.
>
>The other architectures that override it, arm64, csky, powerpc and
>xtensa, define it in asm/spinlock.h, which linux/spinlock.h only
>includes for CONFIG_SMP, so their non-SMP builds get the generic
>kcsan_mb() fallback. Move the riscv definition, the SMP fence is
>unchanged.
>
>Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
>---
> arch/riscv/include/asm/barrier.h  | 27 ---------------------------
> arch/riscv/include/asm/spinlock.h | 27 +++++++++++++++++++++++++++
> 2 files changed, 27 insertions(+), 27 deletions(-)
>
>diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
>index 700ba3f922cb..2284473844d8 100644
>--- a/arch/riscv/include/asm/barrier.h
>+++ b/arch/riscv/include/asm/barrier.h
>@@ -24,33 +24,6 @@
> #define __smp_rmb()	RISCV_FENCE(r, r)
> #define __smp_wmb()	RISCV_FENCE(w, w)
>
>-/*
>- * This is a very specific barrier: it's currently only used in two places in
>- * the kernel, both in the scheduler.  See include/linux/spinlock.h for the two
>- * orderings it guarantees, but the "critical section is RCsc" guarantee
>- * mandates a barrier on RISC-V.  The sequence looks like:
>- *
>- *    lr.aq lock
>- *    sc    lock <= LOCKED
>- *    smp_mb__after_spinlock()
>- *    // critical section
>- *    lr    lock
>- *    sc.rl lock <= UNLOCKED
>- *
>- * The AQ/RL pair provides a RCpc critical section, but there's not really any
>- * way we can take advantage of that here because the ordering is only enforced
>- * on that one lock.  Thus, we're just doing a full fence.
>- *
>- * Since we allow writeX to be called from preemptive regions we need at least
>- * an "o" in the predecessor set to ensure device writes are visible before the
>- * task is marked as available for scheduling on a new hart.  While I don't see
>- * any concrete reason we need a full IO fence, it seems safer to just upgrade
>- * this in order to avoid any IO crossing a scheduling boundary.  In both
>- * instances the scheduler pairs this with an mb(), so nothing is necessary on
>- * the new hart.
>- */
>-#define smp_mb__after_spinlock()	RISCV_FENCE(iorw, iorw)
>-
> #define __smp_store_release(p, v)					\
> do {									\
> 	compiletime_assert_atomic_type(*p);				\
>diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
>index 52f11bfd0079..54bd8db8eb4f 100644
>--- a/arch/riscv/include/asm/spinlock.h
>+++ b/arch/riscv/include/asm/spinlock.h
>@@ -3,6 +3,33 @@
> #ifndef __ASM_RISCV_SPINLOCK_H
> #define __ASM_RISCV_SPINLOCK_H
>
>+#include <asm/fence.h>
>+
>+/*
>+ * This is a very specific barrier.  See include/linux/spinlock.h for the two
>+ * orderings it guarantees, but the "critical section is RCsc" guarantee
>+ * mandates a barrier on RISC-V.  The sequence looks like:
>+ *
>+ *    lr.aq lock
>+ *    sc    lock <= LOCKED
>+ *    smp_mb__after_spinlock()
>+ *    // critical section
>+ *    lr    lock
>+ *    sc.rl lock <= UNLOCKED
>+ *
>+ * The AQ/RL pair provides a RCpc critical section, but there's not really any
>+ * way we can take advantage of that here because the ordering is only enforced
>+ * on that one lock.  Thus, we're just doing a full fence.
>+ *
>+ * Since we allow writeX to be called from preemptive regions we need at least
>+ * an "o" in the predecessor set to ensure device writes are visible before the
>+ * task is marked as available for scheduling on a new hart.  While I don't see
>+ * any concrete reason we need a full IO fence, it seems safer to just upgrade
>+ * this in order to avoid any IO crossing a scheduling boundary.  The
>+ * scheduler pairs this with an mb(), so nothing is necessary on the new hart.
>+ */
>+#define smp_mb__after_spinlock()	RISCV_FENCE(iorw, iorw)
>+
> #ifdef CONFIG_QUEUED_SPINLOCKS
> #define _Q_PENDING_LOOPS	(1 << 9)
> #endif
>-- 
>2.39.5
>
>
>_______________________________________________
>linux-riscv mailing list
>linux-riscv@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-riscv
