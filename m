Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BAE370D54
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789364885; cv=none; b=D+86+f3TBPAP7zvTnPWJOxdchZkFOhh2D2LKb+nuo1P2F03RwiG0b0DJq6cX4zMLRXAwx03ZFdgNFqbVXlrOQJFLmLrOdIb28NXhLPsYsIwVf5Ckc/5Ll15kE3hPcDe84qkAJ1cXOlm9TpCS4Tw4inxcgka7sYmDOrJsAuT8kRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789364885; c=relaxed/simple;
	bh=vs8iIby2nXHPAbbxM+YDs27DIBOnDI8WdDFG6sw1nDM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GaefLa1vI/y8pnut8KkoodUVg21uCl5cBvxjbMK+a1IduDnZvY3PvzqiyrvVY0oUilP6e68O6SoEi61XJ28n/pIlqLZOVj4wyD3YY/5m6f4FYzrA9ODO1B4pt7ZdVfjgA5iaaAWGNzDd38eWGb5VQeU9GoZFAzo1P8qCdD1BnYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0WV3lCS; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0WV3lCS"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so7130985e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789364882; x=1789969682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dMwj6bRyrsgMgTwnA+0w1Z6ygXdtryIk5Fb3zMeqsM4=;
        b=L0WV3lCSZnHfQjOcjCCHDJsn0gl7p6p4CDujA2LiKAOqWR/s2fYIntUnqEe4dTYVPS
         y196xts1gLfNi83+00WQs+GaPegM6cZrw3uqOWdmdkq3jvbFAOeoHOpyec48W3slhXcD
         sTZ/gMbi6hXa7O/ZViFUN89iGzYK5RUldMJuhfn0FcBngAMhQvea12ywHN5qOm5wZxZu
         2aob8v4nwcPgjatv3bkKid2Kv54fOx7IWWcm5DkW/OuOd+Mc4QtkUgbgv6U9bvjSxZve
         ezfDSx+SRCUnB6MZo6GLWt/g+661Jf8o8S32Di735vk+bzaBRI/otDR0w7aGHeF9jmLR
         SMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789364882; x=1789969682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dMwj6bRyrsgMgTwnA+0w1Z6ygXdtryIk5Fb3zMeqsM4=;
        b=dlWs5V8lbsN/LVRu3xj1a6RwSJ7ICMl6nwSMOHDGpssv/U8Ot8xH32Ypi5LOHSC7LU
         qiCvxvEFYnpkduJkhDi5VkJkTPsZ34Z27BBzqk0HQcqnkzlf8fj9gDLiVqtGGRbJRgAM
         Kcd+sjAI9epRXGm+Rbb67mc3nB/2cAt6og3xruI3IslwoorhAEjfOsIbroEB557NiAML
         A6Oop2GBIotHjEPL68VbG2qNjIkAp80VHVYQtbdpXv8a1nfZ0u1AVahySA9mWJcBqlxS
         IQCjkNwsk0f1dld47vaLN7Rz0R4pHEQY0UA+CL8IQY7GFhKrkzSVudtXXrEvuw9ZN4Os
         Leyg==
X-Forwarded-Encrypted: i=1; AKwUvBy45PXc06SOgTVccC97JEOEP2/rSRuItUDppuIZPHIndAcAcs0Jdxee8WXZ8uS1OPIhioDfZVpaWBAWcAI=@vger.kernel.org
X-Gm-Message-State: AFuF++lnpyRi+trENmZ7ZT/JD23xxg+8U+joPMEPQpBWxvVrjg1jEroW
	H6CWn0PlwbKYFmylDHEATIIq+3gBWklqX0jx/tVf/IlaDvHTRDEKBpjJ
X-Gm-Gg: AYBFou2WBeWeoCWuZC2o2Jbio08fqmxgjft9STQ21y6Nl8saOQp8/MHPjxYEkV/rREH
	jKKspfSFTdRJNvLi4vdR/K99XGLgtIkiPN7O/jowkU3xPUw7DrQ1wBPrWN1iTqRo2pS6Q4DzzJf
	09mjqGLJNx10xb0vufMz/3gQxnigmJwe/NQI6iPzGkceWSlKukO195qMyVbFsh+SfWyYJXro4jM
	PHXZanKhtGT8woN67wKfuRtfFuydYx7mb/Ig/B1ip2RxGImEmDTNgmgfb5uK+L9Os2Xgy3rzQzZ
	I6hWNJ/YHAXR4NFSVvjWz8ayP1Z9qQFAxuovDBGwh1zd8n3fO6tejH7vxtRIm+yCBd5AIjts1sv
	pIoVAUkc7akw0QsU7BPGC0D/VBkc8QLnCn28yP9bhBdaCU191wvXQeCYipTl2LcP6ZOngmWBx0Q
	9A0RIioUfqlE0AiRFl4Tfcye4Mz28xVly9158pfbIiebmKQASFiT8P1dHdq7G/YddZ/0dDwQit7
	mLeIALedho0tLCWQMj71LRBgu9RpZDFo6sUArYJbycx+MGHEjzKMJVvK8ViFqro+W2Fi7tcm8Zj
	noV/zQbos8DOHjVF2twyKNvc1eLs9d0=
X-Received: by 2002:a05:600c:871b:b0:49e:69e3:884d with SMTP id 5b1f17b1804b1-49e7a63770cmr9516405e9.4.1789364882018;
        Sun, 13 Sep 2026 22:48:02 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-122-014.77.7.pool.telefonica.de. [77.7.122.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6a06cfb8sm214537735e9.5.2026.09.13.22.48.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 22:48:01 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Marco Elver <elver@google.com>,
	Bradley Morgan <include@grrlz.net>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] sched/core: Pause KCOV in __schedule()
Date: Mon, 14 Sep 2026 07:46:30 +0200
Message-Id: <20260914054632.12877-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260914054632.12877-1-kmehltretter@gmail.com>
References: <20260914054632.12877-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernel/sched/ is built without KCOV instrumentation, but callees such
as sched_clock(), architecture CPU-capacity helpers and profile_hits() are.

During preemption and schedule() calls, instrumented callees can add
nondeterministic scheduler coverage to current.

With CONFIG_KCOV_SELFTEST added to x86_64 defconfig, the interrupt
selftest fails under QEMU, detecting spurious coverage in
arch_scale_cpu_capacity().

Annotating each callee would spread exclusions across architectures.
Pause across __schedule() instead, extending the scheduler exclusion to
its callees.

KCOV_PAUSED remains set while a task is switched out. The guard in its
resumed __schedule() frame restores the prior state.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 kernel/sched/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index ae97c63842a4..54b5c5383fe6 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7116,6 +7116,9 @@ static void __sched notrace __schedule(int sched_mode)
 	struct rq *rq;
 	int cpu;
 
+	/* Instrumented callees would leak coverage into current. */
+	guard(kcov_pause)();
+
 	/* Trace preemptions consistently with task switches */
 	trace_sched_entry_tp(sched_mode == SM_PREEMPT);
 
-- 
2.53.0

