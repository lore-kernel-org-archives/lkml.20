Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158342;
	b=DscMZ6Vi0N5CVxGOwyK/3Hw5XdrU7eygXvT/TWtFYPcZethCPpO9W+4GG4h7/PkZC+hr
	 0DDBitSSPEv9V95Wf7rTkZHF57qpcOxud8g8B71+W5jAMcLbKLRTc4Krkdg2fLTnCXpFw
	 1enonkXm3Ow21V8cTODWC5/GA7WE0SRQ1bJNqi62eFMjJFFI/5fsQZYb0y3wvtwzXnymt
	 wmEYfzI9ynvwNAfeLqsEyfpS3kPQzUQwhPKg6x/RtzmbWiWYX3nfL3+OcOmru19p51lq9
	 JT5hNKlO+HMp4cJvAI8xSpDKlmerg299zxeSpp5heOve8vOiI4rMOclSeR87KQZ+Ujg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZR3iK/21HRL590OT/HWs7TggzA8Gmahp8IuVcPxIo1I=;
	b=if/Y1w+rJ7/DAQqpZS/qfpanaPp/nIjFV8E1DlaxXu/mdRbu9olYVvwRP2Mna/HNc/ma
	 1Mcb1WhpsVAsVMmHa596dTBzZGuEcDIRSlc9JCtghjbYZhLR6GDG49azt9KhcJ7Z5fuAu
	 95kZm1ny8GK5fHVD0HBFLvJmqjZ8GGmEC1dRXs+NYycF1pRlGGvPjNuRnXsYyfOGqZXgO
	 2YvMGVIAbboT9Bl5DD9TVCZGfcfjLAId8+ptOh5ek+eHcfyyF/SZfElGtnLRBKgJeKZld
	 HUo4E6cikB3og1uMcOQOdD/iZcKKpaxzxsr2Kb1CXyAZSoIKXrCiJP1dQTNrWUPqjpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Td9F3R7p;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631F660A2605
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 631F660A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Td9F3R7p
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so949575e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158340; x=1793763140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZR3iK/21HRL590OT/HWs7TggzA8Gmahp8IuVcPxIo1I=;
        b=Td9F3R7pKt9XoyGMCk2tSwEFepXc6mG0UKbjwl4qrQPGswD12MrUnQNew0T0VRdVx7
         Z0ASLPwsJAX6QRsg5D6z23EVXQ2Ij7jQvCFtTbdkbwv2ZLCC/x1dqh6Bf1tgIJW8y3zf
         K8R58PTVmwPzqGUT4lIFqDjBHVlL3f8McSL/ryhcPxOO+n36Tl/svJ7iBjqTIdlIDe8S
         YORIEupvQ+PVliBwnBmNTvqvHz64J9V4C495f7Pv297tROUMULxaTRDp6OIyJPGQsbeg
         6UlwdRVZsD3MQN95UOXuEcpKM9WBvg4sTUemDgeJMG5zEst3NYtyD0tLqVDiikRt2uiG
         kmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158340; x=1793763140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZR3iK/21HRL590OT/HWs7TggzA8Gmahp8IuVcPxIo1I=;
        b=uzl79mcaGztNGgbKB4gRh8ddbdZaruHU9Srv8+OWkrZBNA3nwu78ELEUb1I7kfSPen
         wv9XNX1BoTHU5fZCp3IK0zYnPa0R2jYkkgkvAl5cwSrJvBzOLzDW5geldA7M4TIEQO3W
         Hi0xMy8TaBOIMzoFZd7aFGZ/93hhpogfqnHJ3N9myboj4hQNoDCkybO/ph4XEREkZ+Lk
         MFAvLJeEmIKx9tGnVRn7drNRRRT41UAAMptBvbZjbsj5OzqabLG/WXv3oUq3pHaJ5168
         3C+46461TbHH0/mdy8HUhOzyfRF6uO2j2sY8YqJ3SYhJOCrKdTCdTj/reGg/RPFPxavW
         B1Pg==
X-Forwarded-Encrypted: i=1; AKwUvBy0PlGvl/bqlCVs5IbcgPoee3eGoPKsNYyXzrMaKjZkn4CUvF5Pfl2tkzRa4tqWj5TQzDo+jO07mZwgk1Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8aV1wH6YQV517ccw8A1QjeGVA/9SqBqXnRVL93bCp2LQskyaU
	MSzCFKPY/pE4ev0lA0cczJmV98cqIiephVZe6XY+Qv8Vor3QHyrIdPRu
X-Gm-Gg: AYBFou1grUVkznWhQxAjSGbL6K0kuQYV47C6/3mmv6jq5kqhUBLYFwwGe7TF7NSCXMe
	Hywz9+jFnjMj8epAbRNaWJ+Y544e0Hg9dQDenO3c/yPWQ6HWOKy8Q8DbUuF/s66nht28h26kO4X
	qMTJtnwTQP73YHGtyx5fDLWiEzOHV+RaPKgQj7cj/PZnoCiyNuKC8BsZimoXz79zgEJXBVYtAzg
	rj4xaalSXzWQipQHYSnX13CiIpW2/giuhQcbHhWZn2PCH7wSqkTZeTVA0vEGC7SEJJ+e62R5u9/
	k4gy0cBZdTGedcayezSHBNDDcDPkepnEPx0DenIaOy9OOoE7kcwnc2r9C4iIgWlap41AAPMeRJG
	QRtqj8HTvx4nKJz8WAffwAK90vLlr+l2hPUDDiWPxt7HaVpzoVPUd8Lr094eXBAAFCV+0vpHYlN
	hAjZ+uXf3UbQt6U2SxwCahprSBwD+gXtyo7mmrDGrfwEShLCbh7DfdbpQpj7mEZDhHWOGJIxHQ+
	ZvJQHrqzXjZ9ibUiZOnTuFmjUrC7/Y0Li4kAfRzweSvzESOGMYiaDrUQ47m6BPTNAOF3cXfNQyl
	W74dWoKEvyAvK+Jz6y+C8z039XBxU3QbkWiRCXKd59CaxTDR6Hk3kGftd05GiFa8tt0ygyMSOlN
	vhYt9BSRTR4ySQrapNWKsYHV9NazxoZ4asi2DXrzqmTRYu5no8vw4oVZFz8wfyhisjG0ZLltTUx
	kSRWXnjVEopWAF9s+KXiyemqblNBK9Hcjl
X-Received: by 2002:a05:600d:8641:20b0:4a2:10d:5e0d with SMTP id 5b1f17b1804b1-4a7c58f389cmr88355155e9.14.1793158339700;
        Tue, 27 Oct 2026 20:32:19 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.32.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:32:19 -0700 (PDT)
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
Subject: [RFC PATCH v2 13/13] locking/selftest: Exercise hardirq return-tail preparation
Date: Wed, 28 Oct 2026 04:31:27 +0100
Message-Id: <20261028033127.82193-14-kmehltretter@gmail.com>
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

The return-tail lockdep preparation must see a live hardirq context. A zero
depth must fail. Depth one and nested contexts must pass. The ordinary
preparation helper must continue to reject a live hardirq context.

Add focused boot-time lockdep cases for those four states. Skip the final
IRQ-state transition after an expected preparation failure so that each
failure remains attributable to the preparation invariant.

Assisted-by: LLM
---
 lib/locking-selftest.c | 53 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/lib/locking-selftest.c b/lib/locking-selftest.c
index c3d976c801bb4..7e26b757344a4 100644
--- a/lib/locking-selftest.c
+++ b/lib/locking-selftest.c
@@ -222,6 +222,55 @@ static void init_shared_classes(void)
 		local_irq_enable();		\
 		local_bh_enable();
 
+static void irqtail_prepare_test_enter(unsigned int nr)
+{
+	unsigned int i;
+
+	local_irq_disable();
+	for (i = 0; i < nr; i++)
+		__irq_enter_raw();
+	trace_hardirqs_on_prepare();
+}
+
+static void irqtail_prepare_test_exit(unsigned int nr)
+{
+	unsigned int i;
+
+	for (i = 0; i < nr; i++)
+		__irq_exit_raw();
+	if (debug_locks)
+		lockdep_hardirqs_on(_THIS_IP_);
+	raw_local_irq_enable();
+}
+
+static void prepare_irqtail_0(void)
+{
+	irqtail_prepare_test_enter(0);
+	lockdep_hardirqs_on_prepare_irqtail();
+	irqtail_prepare_test_exit(0);
+}
+
+static void prepare_irqtail_1(void)
+{
+	irqtail_prepare_test_enter(1);
+	lockdep_hardirqs_on_prepare_irqtail();
+	irqtail_prepare_test_exit(1);
+}
+
+static void prepare_irqtail_2(void)
+{
+	irqtail_prepare_test_enter(2);
+	lockdep_hardirqs_on_prepare_irqtail();
+	irqtail_prepare_test_exit(2);
+}
+
+static void prepare_regular_1(void)
+{
+	irqtail_prepare_test_enter(1);
+	lockdep_hardirqs_on_prepare();
+	irqtail_prepare_test_exit(1);
+}
+
 /*
  * Shortcuts for lock/unlock API variants, to keep
  * the testcases compact:
@@ -2934,6 +2983,10 @@ void locking_selftest(void)
 	DO_TESTCASE_6x2x2RW("irq read-recursion", irq_read_recursion);
 	DO_TESTCASE_6x2x2RW("irq read-recursion #2", irq_read_recursion2);
 	DO_TESTCASE_6x2x2RW("irq read-recursion #3", irq_read_recursion3);
+	DO_TESTCASE_1B("IRQ tail prepare", prepare_irqtail, 0);
+	DO_TESTCASE_1("IRQ tail prepare", prepare_irqtail, 1);
+	DO_TESTCASE_1("IRQ tail prepare", prepare_irqtail, 2);
+	DO_TESTCASE_1B("regular IRQ prepare", prepare_regular, 1);
 
 	ww_tests();
 
-- 
2.39.5 (Apple Git-154)

