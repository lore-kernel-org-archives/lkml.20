Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646273;
	b=RjIQOmMVYJjQ7T3bcwrlXnGlFy58Vv2tiKQhp9jRaKP5xc49l9szwfhviaW2jLaG+o3i
	 kZPuToIuV7trJEDynGC8hxabPHthpGXf0cv5alpMerWLrFLUIn6SExggrHFWZFWGgk0cE
	 0+7Jo8JsG/cN9wV6ymoYiFmQPWt15Htw6bMuKEWGnJkmI19EOAlmEM2kIy9TyixD8TuwE
	 XGxbi4mRrjDoLpG5+GsJY6Tp+z4qCmq9AslW5p0P+7pHF2cUicElQC+2qVVwOqZgwRKoI
	 K2jH2ZGsYj/UdM/EsHhhtugO3iPV8mtNlq5878u2Y6uhrvUYTtYSK3wVmKxJIiRVh2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s8aI8a3P6Aq6+tBvBYl4aRZbjZMBmTJC4bYbBQam67c=;
	b=ed82b+YoMI55D4mdVkcuKR1P4eBXmbPsLDDoepq0NKWZvZ315EU6hoc9QXgkwFykRVL3
	 SNOQUONUzxq/rxrsA7NEE7ifjjOq/2MGMPdazkFSDh6VeClC4CLimieIucoFuhDofLGHl
	 fnJncpEnpyomd0HFQA4JBtEtHQrNBQ7tmS1BtRJ+KyvYuGU+HAh+Xcsn9mr8GOZ+ilVlQ
	 FcVGwe9GuPwMCRVabdbO/EcsVnMZHM/6q2HSa4LxdzCA4zOqlzwR0ev/RpK1Iy3l681fl
	 ritBlwcasV45fkUURuoOCAPzJCNO68aFQ2gIN4m61hbPo3WVGbOPchWbN5DKVHkNJUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bdlP3HwY;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C44C606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C44C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bdlP3HwY
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so11794715e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646272; x=1793251072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8aI8a3P6Aq6+tBvBYl4aRZbjZMBmTJC4bYbBQam67c=;
        b=bdlP3HwYABtdW2t5Kc6RbQyVLWSyQuUn28cJG+lTZyH+qUE3ESdgZoppiNpXH5gzcx
         V6FK0R9r4GaHGu3J+ixMOSAL7s9zG8KWyK3NfdfFmGNV2Ti3+w/tUL6R0fAJy8psy/Bp
         Ie0M6s9xXcttGP8b5SruTOlZJZZLtFyqZsleXdzbtM1elryCW+dGzm7wfD1Z5Ze4u5A4
         RscsN3yOrZtfqPlXO5u6hvn4urr5hOoZwxz8AjGsPB3AeT3LvLEvzDV0+GELrQTeu0gX
         F2NcizxNvFI+KNFNpKzJMrar/HQFdN4QwLpw8Oqf0bCYvlW/ORihPjM6IOEyx6qxQ2g0
         9ASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646272; x=1793251072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s8aI8a3P6Aq6+tBvBYl4aRZbjZMBmTJC4bYbBQam67c=;
        b=ZU/Ua36O/U0iuEILG90NS5JalgYyjQsd9A+Ex0Pv2KgMujYJ9uzTdksZECfmRrbrrq
         O0l2g7FOsyfUXOftIbYw7kFlMxVkP38NPzJSla3opDBW3QoTnM6xYXm7zzz2ItDVAKmH
         wZtQOCHflu2rnXYPMnoLXaw2dY5UvojxToQMCEtSSmnI5D1MKCEqrNlRDqVytSiOIgIW
         GzmjEIrgGykBuNC/m2QaJKeMNqbaJbq9R2Ta5JBWmsNfIgu8UKqbmPdY7lEZV+j6zpye
         APxXbBWx2P9kzfaTYWeXHzZGHGJj/50KcK00neTfDWk+cU/OiqN8g8Z4wbO0uWf5GJ3i
         wnVw==
X-Forwarded-Encrypted: i=1; AKwUvBzAj2QcjKl97gonihRrFPQ2j4tYlPAhaHozFWjuwb3pgp65Gss05rN3hEN+X3aImFYQFdSD5fpccYWSW2k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDSRpG5JryNoYnUtYoHhxF7VyCabtbQ6R8/AYlnUaZb3CdDHgp
	ttLthelzC5CIteB0/jFxdzcHHnBDaCaaATWqDkSAoDLQH+rDs7fYl9y0
X-Gm-Gg: AYBFou1h2zQAGcuSz3cVCRxhqF2brJIkBXmUAiq2pmK8GcsR58TlsnRTWPsmcTzS+cY
	KLgoQHwMpYARrYpUhPFCWexl6cVF4EeUHq1G54CrRUkNz6TxhBF7Y98PuHm//kRVLl2H8CVQIfH
	rAyZE8aRhOABpPOEIuop+S70kJNBtQPdObTzVgNFztTShczHBiaBS+ptPGBPjLOA6EM/lWHvX4T
	CdU9gzmkRAwtZd4tTRBz6oGESErwalDtcLiin/UZOkwNYdesyamv9yMNEeRV/LRu2Tf//MhTlL1
	8dlIakJ5QFqj7DCTS/HvCaILuR28zIYtZeeQ15Hoi3z9QrzeMUh6Yy315ighd1NU8csHZ9If1ve
	WBi+V9P4/SG2eMc6MFN0LMBDW8E3tRnrgaK4+Q6rRO8wwiAHp4ebYTiyLr2QzucBCARSRTOyS2I
	3XuRP3bubsmQeBoMf8u03WpxUhjxRVMYAC4v1CQUi0CT+c26eDADSnMBDsS4QRYEXUndwFAHX1b
	8Z1b7sTiClt0JHYO9qsNFrwHgCaXKN7+RcbJhDeAzo966eIrYQ0AI0izHRdAFc37sUusHJen7hY
	zwGFMbqiSn2s66QTOeLhcR161pB7ZLMm1wE96DInBftJLL4xeNL0hq19XL5nPm79KB2f6CQaWtm
	ZhYx1a7FIWXWnssiXQuUBlSszfjpGbuz/cmdqaQv6kYm6STPT2g8zlw05Yo3EYn4ttQen/6NXsU
	4bVSZZ
X-Received: by 2002:a05:600c:4715:b0:4a1:e46d:1bd4 with SMTP id 5b1f17b1804b1-4a1fdd574dcmr76596295e9.29.1792646271519;
        Wed, 21 Oct 2026 22:17:51 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:50 -0700 (PDT)
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
Subject: [RFC PATCH 11/12] locking/selftest: Exercise hardirq return-tail preparation
Date: Thu, 22 Oct 2026 07:16:53 +0200
Message-Id: <20261022051654.79224-12-kmehltretter@gmail.com>
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

The return-tail lockdep preparation must accept exactly one live
hardirq context. Zero and nested contexts must fail, and the ordinary
preparation helper must continue to reject a live hardirq context.

Add focused boot-time lockdep cases for those four states. Skip the
final IRQ-state transition after an expected preparation failure so
that each failure remains attributable to the preparation invariant.

Assisted-by: LLM
---
 lib/locking-selftest.c | 53 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/lib/locking-selftest.c b/lib/locking-selftest.c
index c3d976c801bb4..1575a04f65d46 100644
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
+	DO_TESTCASE_1B("IRQ tail prepare", prepare_irqtail, 2);
+	DO_TESTCASE_1B("regular IRQ prepare", prepare_regular, 1);
 
 	ww_tests();
 
-- 
2.39.5 (Apple Git-154)

