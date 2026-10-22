Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646256;
	b=gGfnb0MI8RsM6/BwfyCkvKWCuxh66tybuFnlbNZoDWxEgp6w94gkNSlXP6ONCXF8772V
	 XokceUyU6eYk0K/YHyayMmxhDlfVe50e9erWkPnN/APZfoax0mmH+BIqYjllFTkKH5vSm
	 Z0PrFl1LH7zWoLGTWA8AvknAWNhCIcH3UAWGHxZfAAumq7qH3Rl8qeDsNtbXHC8+aBc9C
	 HOmIXpRNvR01IfkRjU0R3eJRFKlGN4bLs2unGc2oOryyf66pF8UBgcLpFJNfvW9/gNSZQ
	 nJSi2QDHkOEYM2pgS1N+KyDv4PMRx1cP47zNBmupT6cdZU0mJOAq9qr6tz8TPLJIDWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=o431Tw10LszC2V1Uv9HWe6VBCp/9n4XWQz8uJL/s53U=;
	b=LreBUjxtULTOmBOxSJ0Xbiwa33KEuCilC7BE4Yf8nHKUsw2alOV/zcq1sYexzcuyXKw8
	 S5v70+fWta11nFCV0ER5XuiDOiLo0t9KuNI9h8A2CrEwkrp7UVgcz9YzzvkcK6g/HfU6y
	 Z1EMSmZ9seulf7tvYVQ+8xla4pUy2MhFE17AGdQ+V7oGFRLeg5YQ97UAdbUGGN0AV414Q
	 7SF9fMDVcHBXFG+jC7y2wd3hTm23LU9jPEKmomwsRxUeap70gzsVjW7Fp+h+xMA61ex11
	 K4zHf1Qxbd3U2hqHSup3A3N88KgjcZtaLc23RUsT9pU5Py2ZFB4QObFFYWwG7wl+4Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RzHwvSq2;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6945A60A2613
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6945A60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RzHwvSq2
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1e34ecb02so9633915e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646254; x=1793251054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o431Tw10LszC2V1Uv9HWe6VBCp/9n4XWQz8uJL/s53U=;
        b=RzHwvSq2K3s5a0rf/pDlZSEgoSA7iM8cuXfaPb7r/TLPrxl+I2LC8gNwKD2BUcXCK6
         O6SFBM7XdQRVhTDql5gW8i+3zErEep5djtSe7MUTJSt4Vyy6ICuNP7imXUtDe1eoxu37
         lGbYIBJ4eI0SJoRqY6aMdinrDOvkcQvt5V45URI/IZuErdzvr1nHqsBw8dYjJGQ/O7vM
         H0+FeMdrq9hnYUszy0CA9URw0h1HNdRhElAQlXrpEXr4pD7XP5mHWnL8fzmtMarP1Z/k
         aCuub+KE0gPpACapqN9xqJrVUhZE0AabWfr98dH9+IXvjbcmPNU1oO/wg3QZcFJUKoxY
         BGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646254; x=1793251054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o431Tw10LszC2V1Uv9HWe6VBCp/9n4XWQz8uJL/s53U=;
        b=gsSxpVFLvgGHNkq6JO18yiyGuBDIUF+wuwycvVH/brxZaQ7uyFShLwOvAMPpGM1OfQ
         tzrNcv21nKqASQgxlDkYNx5g1fl9t7V1ReCY7GOv4vmbVMM8rrzAF2df1bqXLNwlSlMm
         LG/AJCIKWYvE6y7pFUfOlervDnq3Ja/2zFzjA+cY7ZoRP0oWsohqqGbZXvEFH6tpLXuE
         +45+S3Ad3dbs43zxJjssTp2TG8WCHq47uyroVEoeRf/Rj0sK7n1X3Li89DmrXSQlvBmL
         wSsXBY4ggJyIcUAY9p+5hW4lxPqRblbI349/GIRfQhDHpMbpj4nHquSgziNrIm3H7zIw
         2Axg==
X-Forwarded-Encrypted: i=1; AKwUvBzGXYunQuiSfDFxjGD22w/vrewm/5Sv7mHWPCmtPm7aLe0wkBwGctHhzRhgJDVx6uzfoodFGdFI4YCyn+o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiA18MBCvRpwxmW4yWRH/QW7ojX6mWtl77meiItYeGjZKZNfq5
	xAxUjBckgORRGGB68fjXtka+Nqd2tthdMyuNurhSGubCvicwmXFKaGg3
X-Gm-Gg: AYBFou0jbOyJxLrwJ8XiT1SrKWgmnjrmxIBYapRtFslkrQRwxy9LfbXPEbgWLThUobA
	X6dX9POTVNhFa2Q/eMIu3salGwHediPyqnf4iILLr6Wk00RzCqvH7ACYsWMtWtFRoDd2WYBljMr
	2CFfnYeYaQ47L5+jRky+45+nVOKpyrlEQNqru/Gs63uNzYO7wBBIAGMKY6SxKdFd9/iSU/VTpLp
	U29D9Wj+zO2mBrXeH94i7aWCn9Lcfs0iyxstGwQiVBt/N/QMmaVh2IoYlUt+4E1bp2LbZGFdRTG
	1CXdWP4WwBp90iQzLfDWz2Gy1DF5DaUW697v5BYwkDLwzpKPf9aoo8ixzrEW/ofBOFUOR8Su5QB
	qUG2XQ8AQHAq+ukWkdYcgbvjG5zdHCZNT6nzlj3U2mOeJogJpiN+utozXZX/bXGBuQ9xoLK2DMt
	E31rrsk7kWWuFvYGlGFvsZGAhajT4B+KtdW1xGQPhEAwMXTzHqtWhKkKjAy51b3//EXfmcuFi0Q
	sxI0pNPzabWwPonCVytg/noFSMQ/b3FTh2L5NdknXiyA/3hwPRIJfbeH9b7tKtWuh+CCDOMGHr9
	17OihtvYX62mc+3BB3QiGsDqqNswpZzFM6CnOKv6V6jKDHqyuQzUCC6Lq/8MxsX2l1dXTnFEadK
	3ODUYatBMs7i9fGS0iqoleUu5WEdl0dIf1uwdGTAHfMyCIs2GszEsIMnO//Q=
X-Received: by 2002:a05:600c:4e03:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a1fdd14200mr75350095e9.12.1792646253837;
        Wed, 21 Oct 2026 22:17:33 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:32 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 07/12] entry: Carry ordinary-hardirq provenance through kernel return
Date: Thu, 22 Oct 2026 07:16:49 +0200
Message-Id: <20261022051654.79224-8-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022051654.79224-1-kmehltretter@gmail.com>
References: <20261022051654.79224-1-kmehltretter@gmail.com>
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

The entry state can cross hardirq teardown and a possible reschedule before
the architecture completes its return tail. At that point preempt_count()
no longer identifies whether the original entry was an ordinary hardirq, a
synchronous exception, or an NMI-like event.

Record ordinary-hardirq provenance in irqentry_state_t and initialize it
in every entry path. A later return tail can restore hardirq classification
only for entries which established the pre-counted hardirq lifecycle.

Assisted-by: LLM
---
 include/linux/irq-entry-common.h | 4 ++++
 kernel/entry/common.c            | 6 +++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 24c2b9fdff4f4..2ed637cf66b0c 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -333,6 +333,8 @@ static __always_inline void irqentry_exit_to_user_mode(struct pt_regs *regs)
  *            exit path has to invoke ct_irq_exit().
  * @lockdep: Used exclusively in the irqentry_nmi_*() calls; ensures that
  *           lockdep state is restored correctly on exit from nmi.
+ * @hardirq: Records that irqentry_hardirq_enter() established this state for
+ *           an ordinary hard interrupt.
  *
  * This opaque object is filled in by the irqentry_*_enter() functions and
  * must be passed back into the corresponding irqentry_*_exit() functions
@@ -347,6 +349,7 @@ typedef struct irqentry_state {
 		bool	exit_rcu;
 		bool	lockdep;
 	};
+	bool		hardirq;
 } irqentry_state_t;
 #endif
 
@@ -396,6 +399,7 @@ __irqentry_enter_from_kernel_mode(struct pt_regs *regs, bool hardirq)
 {
 	irqentry_state_t ret = {
 		.exit_rcu = false,
+		.hardirq = hardirq,
 	};
 
 	/*
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index 36c43d3c76eae..ba5959a84bc4a 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -112,6 +112,7 @@ noinstr irqentry_state_t irqentry_enter(struct pt_regs *regs)
 	if (user_mode(regs)) {
 		irqentry_state_t ret = {
 			.exit_rcu = false,
+			.hardirq = false,
 		};
 
 		irqentry_enter_from_user_mode(regs);
@@ -140,6 +141,7 @@ noinstr irqentry_state_t irqentry_hardirq_enter(struct pt_regs *regs)
 	if (user_mode(regs)) {
 		irqentry_state_t ret = {
 			.exit_rcu = false,
+			.hardirq = true,
 		};
 
 		__enter_from_user_mode(regs, true);
@@ -199,7 +201,9 @@ noinstr void irqentry_exit(struct pt_regs *regs, irqentry_state_t state)
 
 irqentry_state_t noinstr irqentry_nmi_enter(struct pt_regs *regs)
 {
-	irqentry_state_t irq_state;
+	irqentry_state_t irq_state = {
+		.hardirq = false,
+	};
 
 	irq_state.lockdep = lockdep_hardirqs_enabled_raw();
 
-- 
2.39.5 (Apple Git-154)

