Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158329;
	b=vZ8X8+4RxuVwgzKIwgEJ9k2K+PNBKS5YtUC5CL4HWnME5wdAliWdk49IgPDApHykGDoj
	 nX//0OKf3WUJm9VJvR/FWXBdEEcmu8Pu37EyosDIEp4Klecz4ByepBIT4vLQglcqWyfQt
	 1irJajRVOnAX1qsmYMwbhJPFhBzffccDB7+bw9zQfyBUmGbaXKXR8FDKNrFTseOxLS0KR
	 hohuCNzsni0FcMX9wtk3l8HdJ1JcI9bxcvNzznrCjVaWy9ndCuGtJavzm9Qb47p62Aofz
	 6oyAhzThdVRZ33uW1yK+839HtbosUIL1D8xesY5cQqVC8qP5mEUK5DqmV8IVlFtuMIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gbskEFrs/q8sEy5EcDMb9bqLWWCDi117BEzygxdkUw4=;
	b=tQ4S6BvRJEYYRm45ZNpTRerrmGBpstjpOzJaY0Rw8JedXOTz4YfvmT09hkjdYB0JPzUd
	 fZ2XH1bITI4aqgodg1uNvHuVxAEVVu7D3YggShq9a4nI8mpi71NKQwIjFtlOD6Iv/m36J
	 KSEQ7rhb0c/19M4Yg3nsXOHxwmjkNuM3mtIE5KfflPyEabHgyvpjQaQCs4nsU32BSekkd
	 rb0SLqAgNlCDd5NPFS9WkH2r6HizVjuJYmRrjTMVNwpkdvU3pM0D7P1qYY+s8jNvdGLRq
	 7PW5fLHpmJgdf8JF+wz53bsFQC6THDId3N3hk93XWH541OG8PMBY0LMiWJoGKowk/LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7XYMGBq;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C75606A331
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29C75606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G7XYMGBq
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e04773687so174932f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158328; x=1793763128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbskEFrs/q8sEy5EcDMb9bqLWWCDi117BEzygxdkUw4=;
        b=G7XYMGBqJmubaJh8YPmweABf9WZGYmShKWmI+xTWhoK57zVk8AINXQEr0ADgOQCEQH
         vlx7pYyUdyopPBa0wb/fKAvL7xshDUwLGdRQyY2wFwIJcQPS8Bl1bm7KXwlloCUZoZ6F
         DsHWLv1FiAKw2KBgPXdxC+/LIb2ZhtoRaD2RCUm58duTMKwubNKXEOlRHzEVIYFq2Xs3
         j0qX+3PTSTF6AbOsSSHqzH+KpGEo5+JVDeZNQiTFlmSN0lzk+vXUPX05IaGc/Clw8LEX
         LZWLAu0BxdyJhBM6g/2BfP3tmKJAokJXze0WRQGJ8GeV4YR4PePF3dIaujw1yw68x30F
         6bNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158328; x=1793763128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gbskEFrs/q8sEy5EcDMb9bqLWWCDi117BEzygxdkUw4=;
        b=J08BSS+q91dLDKtZPxRwA3xIQK6gp7UmQ3/A3TPgP0/dqc+m7cNU5E3VWmQl0NqOO6
         4l01DkdYVTkyrtP+Xer5Ns9jrziiK1Wu2wydth0jPbh7jNH2icM6ZS8Cl6v2MF3RfH3K
         EpL2rXaVva23oV0xhUPvv+OqdgDM02lVPIZGedAFwCwLpb79dKDC18Bp7LZR9jUhx245
         8bOvA2wOf9TF+By5kpWsNdDnx+HfzJqhhiT95PlgfKuWIV887xG3zfKTPDHqraKgfuPV
         8ezM/kSjfUAuEXjBitwebKrHtP334/LYHVtHUwrQJlQwsAzKaSxxH+gUK6KEdGs0lNEo
         2hAw==
X-Forwarded-Encrypted: i=1; AKwUvBytss8brIKRA2iU1hIhN9qNAH8JDG6EIdpALKNBAZC/s+mZg+v+JFwjEYztHAkZGxeAV1LfA4VZBNNVt8g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvHDVhszyFmi7XBlyBRczTmCHce2yMiQnwftHrWEkzB1udgW95
	Y0sdS1tNu015E2OGeB6xHA7UzLyd9saFxjhMU15c7t3ygeKYoBLXlYhH
X-Gm-Gg: AYBFou0tVT3Vb3huKWgSwmAGrci+rqeW2GLJY0W3qXwakQxk/H0UmvEIgJ5HkliEKhs
	yKmyRwfneMH/MRWI+uMjxKak0UfHUk99JARW+hDhlTkMO4Ecq7XiYILS5uvKR8Bfr79lLqOYZpm
	WjNTefwwADzl5f9jxgpGEQkOjPoUcQsvXxwAnJDK1kU/k3zbPcWv0nxiQ9rLRnfle6VTK9ww7pq
	aF2eN+bDPNR70Ibnt5YWbv+LbyGtPdj2ZIk95cjUkeBiUT+kHzLjzE4HVm30QGdv/jRmdzFuLXW
	cDdrvfstrvB/IjNDnghH+eaJ5T/amfnvW4PDzv8mPbhkCjbP2iWii4yxUxKm1ZMpwsa2ZnyicAY
	QCiw1s15+9XmKqCGiiXAVK+sQgd0zB80ew3jroliQKmmKrFewPC5RsXcqmSQlzcC7Aps/s+tMSV
	3Fxglbf5406S/Xc4TMN/SykwiM4TbVUa9Z+rf1Ldiv6yCAqI7CY6Pe/KAtqQBWdC/5YG3R6utpI
	z9cRpP9CtHuXbMT8xfrCsiit6tspEyRycJRQHdtONdIhQPTIoc5SI4CO06mgm59AbvcedjNP8Za
	4OB8RrtiU36AnQU/WK+bUOPGJyEDSNOq2DFLtm46snmamd+V/BOG99wJ+DTEO1vvplefn1xv3Wx
	fXrQ2a6elc8vbShrDuFtn0EHk136SyAJzLTBDDV8Q8sH8abWzsyaiEZxhQnurghrB+U1Z8fJbB7
	XliG/3fD0ZohJUCqOQdW2QLb3j7B/SqlCo
X-Received: by 2002:a5d:5e8d:0:b0:48d:f464:6989 with SMTP id ffacd0b85a97d-48e5d45a4edmr2964330f8f.27.1793158327517;
        Tue, 27 Oct 2026 20:32:07 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.32.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:32:06 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
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
Subject: [RFC PATCH v2 09/13] entry: Carry ordinary-hardirq provenance through kernel return
Date: Wed, 28 Oct 2026 04:31:23 +0100
Message-Id: <20261028033127.82193-10-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
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

Initialize the hardirq state in every entry path so irqentry_state_t
distinguishes ordinary hardirqs from other entries across kernel return
while keeping the two-byte generic state layout. A later return tail can
restore hardirq classification only for entries which established the
pre-counted hardirq lifecycle.

Assisted-by: LLM
---
 include/linux/irq-entry-common.h | 6 ++++--
 kernel/entry/common.c            | 6 +++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index e1fd9155410c1..6f649f6613312 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -341,8 +341,8 @@ enum irqentry_hardirq_state {
  *            exit path has to invoke ct_irq_exit().
  * @lockdep: Used exclusively in the irqentry_nmi_*() calls; ensures that
  *           lockdep state is restored correctly on exit from nmi.
- * @hardirq: Encodes whether the current staged hardirq-count attempt was
- *           applied.
+ * @hardirq: Encodes ordinary-hardirq provenance and whether the current
+ *           staged hardirq-count attempt was applied.
  *
  * This opaque object is filled in by the irqentry_*_enter() functions and
  * must be passed back into the corresponding irqentry_*_exit() functions
@@ -412,6 +412,8 @@ __irqentry_enter_from_kernel_mode(struct pt_regs *regs, bool hardirq)
 {
 	irqentry_state_t ret = {
 		.exit_rcu = false,
+		.hardirq = hardirq ? IRQENTRY_HARDIRQ_APPLIED :
+				      IRQENTRY_HARDIRQ_NONE,
 	};
 
 	/*
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index 9d207c37c5707..c7814c51bb35d 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -112,6 +112,7 @@ noinstr irqentry_state_t irqentry_enter(struct pt_regs *regs)
 	if (user_mode(regs)) {
 		irqentry_state_t ret = {
 			.exit_rcu = false,
+			.hardirq = IRQENTRY_HARDIRQ_NONE,
 		};
 
 		irqentry_enter_from_user_mode(regs);
@@ -144,6 +145,7 @@ noinstr irqentry_state_t irqentry_hardirq_enter(struct pt_regs *regs)
 	if (user_mode(regs)) {
 		ret = (irqentry_state_t) {
 			.exit_rcu = false,
+			.hardirq = IRQENTRY_HARDIRQ_APPLIED,
 		};
 		irqentry_hardirq_count_state_set(&ret, cookie);
 
@@ -193,7 +195,9 @@ noinstr void irqentry_exit(struct pt_regs *regs, irqentry_state_t state)
 
 irqentry_state_t noinstr irqentry_nmi_enter(struct pt_regs *regs)
 {
-	irqentry_state_t irq_state;
+	irqentry_state_t irq_state = {
+		.hardirq = IRQENTRY_HARDIRQ_NONE,
+	};
 
 	irq_state.lockdep = lockdep_hardirqs_enabled_raw();
 
-- 
2.39.5 (Apple Git-154)

