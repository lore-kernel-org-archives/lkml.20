Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792468338;
	b=Mx7hop9dEApIa11rbtnMLFEp+kKlluxMtvGhe+MJYPGW9g/pDb37cMBAg2+9k4IwWOan
	 LIIWRYIZcoF3bUi9/feswrNFuaTV4u3HabNLrlERCZhM+/XHNI/J0R1DUu/e4Y8SYY4NH
	 zWTHDEGhBlDXXhXfSPXtoZeshKXXM92SB6FCa+p8KETl6psewq/55KVLKOAJ1hEwCRVzs
	 +UdAIey6Mel4sJtcf//V8kuCW8ohj+ywT0EgFMQebwQvEvBxOc5Iao9XwZhmYgBGIHKEP
	 w4s1dBDDEqGY+Um3a4ADxJ/dh01IBZG6bcVNlMZWm0FHzkhxNfrpWxNybB6GD1jSxyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792468338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=p6i3Nyqj9VM8axM0TbP0nxGC8kaEPnrFMpaIGWIrppM=;
	b=ENSe60QTmItD8gIafk87X7gw9lps9p7amsXUQm7N/m8B9m3eYyH4j9MODd7Myi+7Lw0E
	 GV0um6IFC/zJLF/0HDbeaheKaddWgEzr0N9U4HZAKHfrS0GBJ1Xp9eKPEpllNlpb5cxas
	 yzIKT3eQ0SOogUC2si9yiiZ4uyLs9ZLpmOuxErpHNcWcF3PcjDL06gqLPwdqvC9E65rPT
	 gwQYTCN/OSX2z/nYoJ8ivIqG5yzWk+/xYnlFU0uP0KkLrRNag6oE8da8GEWPO2VdwUTV7
	 gtUwi2/fMSYKL/XULRZxFBLxygfLj36LbbPR2GS/qp+FXNBHJZ/zDI0KN36XQ5DH+kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O1lw4mFR;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8DE606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B8DE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O1lw4mFR
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so21451415e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792468335; x=1793073135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p6i3Nyqj9VM8axM0TbP0nxGC8kaEPnrFMpaIGWIrppM=;
        b=O1lw4mFRi/skXUvJdvDqHe+9u+ZmKs08VVKzN14/tEC2aR2MBmRqAbTK5YeeyRVmE4
         9t0vlNRCi4OzaqvfethRNyJpdvt7Pt+RfdQKoVaWDSVUjJ2Wj7WoGBN1uWjdiz7XpIln
         6kSuyHRJW4u5DD7ibNtavP/SsZa4j2wn+xgcKLh7QHBQQh4KCaJjMRzLmfXtClCVAmLL
         AmniQiYXn8tDf9Cv1fmiW2ynqSDGWG6dmIfawGQ3nY0oon3MoUJ7cExawIQmIl5klHE8
         rKRH+v/lU04So1O5vOMEW/ug+BPI5FnuFdS6HLqJQYFAuhMR2rVHzPduFypWe1cGp+eX
         jYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792468335; x=1793073135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p6i3Nyqj9VM8axM0TbP0nxGC8kaEPnrFMpaIGWIrppM=;
        b=XaCobw6YcseRuAte91YSiz+BXlmAjMMyr7N0ojg3yJ+D5LdjIp4BMA7bT+vd04nLO9
         GKxKZaRCSNHN+NfgMaqw0MUSJvWFMba7YPh75lnjVpDN+zqlKUkk+qUmDHcmnw5lNYcf
         aqihzFibk6oj1olcS8ep0Mmzn9+5iRPyM1yH8Dm5aK6vjPKuonh7RwjYVOdjwmXruPEf
         mQBxlp5o9KSB6ajy0dgrq41O0ACJcfGEjYCo/cXPMfdomHe0cpzsOvGow8JrKOdzkiMx
         JYr2VAJ83+R6TfimFuGNVZD18NwXk7QhSZOFASv6ST2NMSgsXxffe4jM184Hsz26pnez
         fDvg==
X-Forwarded-Encrypted: i=1; AKwUvBxVlRzgrmiVV1rvIbMefo3a2K7JnKAbeTUgJ9X2wWQ/1sVLWpYcQCqLmhulIkOooOsRkDsEflMVUMr5hU0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZBAsVFuDb6E2TP6k+m4yMVuG5hjwo4Y/YhoTpmWce4J+2Rvwx
	ymuESjkAcTArAPIGck5+b2FLVdTIhs/LFDO2Vz3XxhxWTEvDmR6RvMWh
X-Gm-Gg: AYBFou02mvR/bb9X+WtDUF9XSwyc6YBcr3wb2HGMokuFfzon9M/irfHeFZWoubWWsFP
	rqvT5dvg3+C/gDQ2va5EF7bh/DTH7JR8sSv3Y3D2SemzO+BnLBSnI+P4Ya4+9p68kJrqHMl74yC
	2/fZOQQFysKBIOC0U+WczSX0UaZCjeCfhqHOhkYFTfFgu2bKc9tnU03GUqL+1KunpwGXCeRhyST
	pStTJcTfWjjpyUDXuy9d9W6UcLR0NKQ7Fi/eHsCKQpjQ+F/HkSVj4OsU7oSqizjHe6aCQoz5M6O
	GHCVRnduYMiEMkL8xHvhx+P9ZaSBKfgxObggB0s6OJX0/bx6C/UhlIo5pH7bArMKGwZDshSglgi
	gh7z2qV+h2qpZnZttKI+KktfdpZn7MyEt15P63BRxhoM9J9skbiSBcydwNmLW81/wsM36+zrrvR
	y8gIrpEBCjqj0Awp66BqQhi55xvtcHKY3LRZj072D6jo/X/LhHU57gbl6Zp5cwKmgcwih5kqJZn
	hRvKqZrso31oE1tH+r6Wka2E3E0nxxslLBAaj5NXbVNI+FHdTH5Cg/qnxTiZBPJdIBvutrVOtp1
	22fhTJU7V5dYhZCvsVkvDY1E8XABkMA6Vj7Izwq6fEsA7fow+f2bZFpNFnnY+dDtqNc+ARVRBPq
	MfA==
X-Received: by 2002:a05:600c:3554:b0:4a0:2488:71cc with SMTP id 5b1f17b1804b1-4a1d76234a3mr201359065e9.32.1792468335363;
        Mon, 19 Oct 2026 20:52:15 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9c92-6501-cda9-90cd-4e49-75d9.310.pool.telefonica.de. [2a02:3100:9c92:6501:cda9:90cd:4e49:75d9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d569d4sm39329925e9.10.2026.10.19.20.52.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 20:52:14 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Nam Cao <namcao@linutronix.de>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rv: Normalize opid IRQ state to a boolean
Date: Tue, 20 Oct 2026 05:51:58 +0200
Message-Id: <20261020035158.90190-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

The opid hybrid-automaton guards compare irq_off with 1. However,
irqs_disabled() only guarantees zero or nonzero. On 32-bit Arm,
arch_irqs_disabled_flags() returns the CPSR I bit, 0x80. Consequently,
valid events with interrupts disabled fail the guard and spuriously
trigger the reactor.

Normalize the value before returning it. Add a KUnit regression test
that handles a need-resched event with local interrupts disabled.
Without the normalization, the test triggers a reaction on Arm.

Fixes: 2b406fdb33387 ("rv: Convert the opid monitor to a hybrid automaton")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested with an ARMv7 GCC 16 W=1 build and targeted SMP1 QEMU run:
rv_test_opid and the RV KUnit suite pass.

 kernel/trace/rv/monitors/opid/opid.c       | 2 +-
 kernel/trace/rv/monitors/opid/opid_kunit.c | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/rv/monitors/opid/opid.c b/kernel/trace/rv/monitors/opid/opid.c
index 9ae619f176fa1..a14532cc41778 100644
--- a/kernel/trace/rv/monitors/opid/opid.c
+++ b/kernel/trace/rv/monitors/opid/opid.c
@@ -20,7 +20,7 @@
 static u64 ha_get_env(struct ha_monitor *ha_mon, enum envs_opid env, u64 time_ns)
 {
 	if (env == irq_off_opid)
-		return irqs_disabled();
+		return !!irqs_disabled();
 	else if (env == preempt_off_opid) {
 		if (IS_ENABLED(CONFIG_PREEMPTION))
 			return (preempt_count() & PREEMPT_MASK) > 0;
diff --git a/kernel/trace/rv/monitors/opid/opid_kunit.c b/kernel/trace/rv/monitors/opid/opid_kunit.c
index 3cb087a74241e..8aa1fb9c62344 100644
--- a/kernel/trace/rv/monitors/opid/opid_kunit.c
+++ b/kernel/trace/rv/monitors/opid/opid_kunit.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/kernel.h>
+#include <linux/irqflags.h>
 #include <linux/rv.h>
 #include <rv/kunit.h>
 #include <trace/events/sched.h>
@@ -17,6 +18,11 @@ static void rv_test_opid(struct kunit *test)
 	guard(migrate)();
 	KUNIT_EXPECT_TRUE(test, preemptible());
 
+	/* Need resched with interrupts disabled */
+	scoped_guard(irq)
+		rv_opid_ops.handle_sched_need_resched(NULL, NULL, 0, TIF_NEED_RESCHED);
+	RV_KUNIT_EXPECT_NO_REACTION(test, ctx);
+
 	/* Wakeup with preemption and interrupts enabled */
 	RV_KUNIT_EXPECT_REACTION_HERE(test, ctx)
 		rv_opid_ops.handle_sched_waking(NULL, NULL);

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.39.5 (Apple Git-154)

