Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1650E486E7E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791837746; cv=none; b=S4zsXRCRrSbBzgHVsPYE+aKtuGTJPSic+rZ3nKCkOa68ifqcTv/o/ANqGi5Z3o9w4EXDYTkUNhTIyWGSaPADuHaJg6TMstaQ1zDycLzHwWBGIYKpZB4LRvccSJN1bMBvCM0ryUrrxAMNC46QmBdo4g+5PYtEscPROe7AgoGv6K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791837746; c=relaxed/simple;
	bh=wMbEwuPPMU/11A0D4bqsr+2FfGjvtTzmXYLOKlRkP2c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WKtAXjMj6rqSEO9c5AA9mhkdHjiPFwf5jE7jceWOrTjgj1wRAz1JprlGhtqwEaSQ1jIopqPFXzcbaSMYA37yH7j9xstlh8bEx3yZnfWJsED17GsQAGL3b02BEaI9k6hipKzncpA+uOyeqLLlMsVbEOhz/EiXRuNs6afIDKpXExM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSevQDVv; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSevQDVv"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso2178434f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791837743; x=1792442543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fqf3rGQ/R9PQCmxqvsD5ZLcC98lXYPCxdFatXGsliLY=;
        b=jSevQDVvqgyzAZ6nabtjMS7tsPrh8FIYaAW/xJ7mRTxeAWp+bUNrYPSxAQI7DCZJ5A
         iibwNJZDotNl8x7+amDSeG80FyEOr9hhhyGPNk8PFoECNgwKjB9IKj7dWXC5bWCwAYRN
         5IZdPN1I18E+RE08ctbgtkU2UhAqZka5r3g65+jUwlFfrBpbRQ6M1zHNgK4HDRAbcSzn
         QXzMdLzj7DtYshYmMkOhBh7VNN3CnutJmyIFsPKyJ5tyxtAhDSpUd5OfgNx6Tc/lu45y
         oh6aikiZJYfJDjU47zh6yO09Pjz4q7hn/NnHOY4apML0fREO0yTop7crmxe9QXbCWify
         ICzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791837743; x=1792442543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fqf3rGQ/R9PQCmxqvsD5ZLcC98lXYPCxdFatXGsliLY=;
        b=E1Nf7+/1ff4VHV8Df4TTWUPD+xheigMCqG9DAKReBM4qmIMTx3Wmzdf9YOaNQOfn8X
         2z6t024bbctCuKn6V1fhg3iKZsZe2fM6Pg7WkVtmhuffhBnR6A7Cdl9R7+fqYRAv2/e7
         jSFuloSloWCDaNomR017T+rUVbbiCpg2+DlbAHB838Di0NbkdFHa6OayQnu59qEFdw46
         vJBzKkkIFNJRVI/tjEPzqRkgu549On3Icqwm+w3fqxU8G53vRkkScIv/TxRN9sZpce5R
         yhRMRooP0EXMD5p0i/rZd0UAk87n5sd9P0CDtADH3IAgFG0yF76HAnw15D+OpHuehTEm
         OmUA==
X-Forwarded-Encrypted: i=1; AKwUvByJx1+Bnj66eapWBica59Wnn3LCB2fex1Y2LwKRQ0LXYMUf4uVyg0MDFUfAEBZj1wZuAL1ahDezHAjX+rc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKOPtlTsTncYx/qiavBQilXcdmZYbRn1QFCOwzPwhyjvRpBFu8
	3J5gOHYo/OdKh5+M6FPUynCwrO/qMLNC/U8fl8p6EQEBNURccMnO6k5K
X-Gm-Gg: AYBFou2YWKpJYPsE794Y4dECCgKga9d257ja3N/85BSJhGb0CVEB/VzKHq8NA2Rcy1R
	OmiT9+lSGLnyIOBrxlvuDfZ5ndHRtDtTGJGbDC5llPEAQTqJVVzCtfo+A2Qv3VMbb7JCcFSfzmJ
	3jX0R5XTbhkLXyc0XA3RL5AgYAUhObB3wckQRC+hEuHekDWsuldJPsBVMMfMNDuoRUdNLsgyNOm
	gtG6Ly+XQRzD8xvi2wbNaoHSm2tdQF4UiEIaGyqa9OzfBAHiJFgX7vzXNVszV0IWAKzMt0fZuuh
	uL1x0vUefEpXXkeC027HNmkfSqbeW9kO9Ayxy7BDMPJmKrTNw6i17KIfsGlGlsDp4i46fsUOZeq
	fteb8bFhkbfTF3lJzRxEHAyEIdMomirFaYsJC1jEOHJvFm1RJstrHLvIGvNPBOJ9XJT3fStjLHH
	z0GrM2XsWyCPSNALelWf+Md2iVqpexe55QK9eURdYony+2ga3/T4dN+kMXogx/2ZaAc08JpDusu
	cnV6TTf6wiVUktBwXvOtSSeaPczr7Ef1a+ix1UbR3Fp0MayzougKHkU4S2d+exsalJZV5dXQxy2
	di8oXy/y+ult1NOHSy4ddBxuhenX8bilXQKgxWPVj50JD1znhmU4WPRYagRqd6EEAuT0beF7o8s
	=
X-Received: by 2002:adf:efc6:0:b0:486:e9ab:2b88 with SMTP id ffacd0b85a97d-48dbaadb11amr14086227f8f.24.1791837742943;
        Mon, 12 Oct 2026 13:42:22 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8ab-0f01-016a-c770-797f-eaee.310.pool.telefonica.de. [2a02:3100:a8ab:f01:16a:c770:797f:eaee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac3970sm1186179f8f.37.2026.10.12.13.42.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 Oct 2026 13:42:22 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Always inline on_thread_stack()
Date: Mon, 12 Oct 2026 22:42:11 +0200
Message-Id: <20261012204211.3351-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With CONFIG_IRQ_STACKS=y, GCC may outline on_thread_stack().
CONFIG_KCOV_INSTRUMENT_ALL instruments it, and do_irq() calls it before
irq_enter_rcu() increments the hardirq count.

Normal KCOV records this interrupt coverage in the task's buffer, making
results timing-dependent.

With CONFIG_KCOV_SELFTEST=y, current->kcov_area remains NULL. In QEMU, a
timer interrupt called the helper before hardirq accounting. KCOV treated
it as task coverage and dereferenced NULL. Fault handling recursed to stack
overflow and stopped boot.

On a BeagleV Ahead, the unpatched kernel did not finish the selftest within
120 seconds. Three patched boots completed it and reached init.

Mark the helper __always_inline to keep it in noinstr do_irq(), following
commit 1894a4030582 ("x86: Always inline on_thread_stack() and
current_top_of_stack()"), which fixed the same out-of-line call from x86
noinstr code.

Fixes: 163e76cc6ef4 ("riscv: stack: Support HAVE_IRQ_EXIT_ON_IRQ_STACK")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested with GCC 15.2.0 and QEMU 10.2.1 on v7.3-rc7. Both images
used byte-identical configs and v7.3-rc7 rebases of these seven pending
patches (canonical commit IDs shown):

  3a25097bf845 kcov: use unsigned int for kcov_start() mode parameter
  e39a9c820c37 kcov: add kcov_pause()/kcov_resume() helpers
  ae2662563c3e hrtimer: pause KCOV during deferred rearm
  554af946139e sched: pause KCOV in __schedule()
  7f608b777204 sched: pause KCOV in try_to_wake_up()
  2ba73ec2a246 sched: pause KCOV in wake_up_new_task()
  5ee777070fac context_tracking: exclude from KCOV instrumentation

                              plain inline  __always_inline
KCOV selftest started                  yes              yes
KCOV selftest finished                  no              yes
Reached /init                           no              yes

The plain-inline image stopped after printing "kcov: running self test"
and reached the 45-second limit. The patched image reached /init in two
60-second runs. Those runs timed out after the marker because the test
/init deliberately loops.

The first common patch is a type prerequisite. The remaining pause and
exclusion changes suppress separate KCOV callbacks that otherwise obscure
this test. CONFIG_RISCV_ISA_V_PREEMPTIVE was disabled to avoid a separate
vector-entry callback. The only A/B source difference was this patch.

The same images were tested on a BeagleV Ahead (TH1520, four C910 CPUs).
The plain-inline image did not finish the selftest or reach /init during
120 seconds after the start message. It reported RCU stalls, and CPU 1
did not answer NMI requests. No panic or stack-overflow message was
printed. All three patched runs completed the selftest in about 0.301
seconds and reached /init.

 arch/riscv/include/asm/stacktrace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/stacktrace.h b/arch/riscv/include/asm/stacktrace.h
index b1495a7e06ce..c7c991452e11 100644
--- a/arch/riscv/include/asm/stacktrace.h
+++ b/arch/riscv/include/asm/stacktrace.h
@@ -16,7 +16,7 @@ extern void notrace walk_stackframe(struct task_struct *task, struct pt_regs *re
 extern void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
 			   const char *loglvl);
 
-static inline bool on_thread_stack(void)
+static __always_inline bool on_thread_stack(void)
 {
 	return !(((unsigned long)(current->stack) ^ current_stack_pointer) & ~(THREAD_SIZE - 1));
 }

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.53.0

