Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588027;
	b=OIzjiKl/N4wSNKYt6atyKxtZkDsIisb8Lw/SHn2E2S1MKjHR95xs3nHhuzXAUNGBTygr
	 CbNkqOu3bCS3K1TYj/NYG+l530NEEiQFKScGf9dorvZuu/nB0ptiTVJHRvdu0FNGcmbwM
	 d1ZGXQHj/Civ/z1kYQi8eou1ZvwqUf56JChg7EulsiCFRIeD29Pa71APLxxzJiu7ewHKw
	 n4XI+f9BZoUttXnYMM1QudsCoMwqEQlPuBA7W+7qtTTi969+YSQS8P50i/WZYirf4s3yC
	 SZzqLemXTQBLETwlmrgV7DK2ty+lVGfgGTwqrqpEm69q7d2S3xD4YBJ90MXWBQUhL8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588027;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=+G1J6ze90CoH1Fe5qdyBFgs1f8joZZQgtA29HRmiQRg=;
	b=VoTw6CjEIMIvanKbgOiaR2eU2Cz6IdnTV69yKaDbPOxjRL9WnfJRptZY43KEjWXak4GQ
	 VfmWys8NVFyMfAJxQcP7djoRstGXNzQk/eIMxnN21URyKlnGp/sdbRFIkwjJJ8RRulaVe
	 XoCzNe2QI/8oiVJzt5wx3v+ElefYai9NJAIQ9SpSwI2YiIMpVJTrij2Oa5fOy0G+lWHZ2
	 WaqcT8cILezfcZON1Wf3Wad/8kMo7ZrsiHa0OO3hO7nX6QqUPQ9ZSUC6t4QQs/G+lyaJM
	 DHLznMV7q++5SxUnFvDXR4F9SHiS3EOSLjAX6hzWAKEFI4Qhd5NQDs8JNZk/HlJrbJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=E5Yk1Cug;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AEF060A5BCE
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AEF060A5BCE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=E5Yk1Cug
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 10D754E415A7;
	Fri, 13 Nov 2026 16:40:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C022460015;
	Fri, 13 Nov 2026 16:40:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F86D11BC05CC;
	Fri, 13 Nov 2026 17:40:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794588024; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=+G1J6ze90CoH1Fe5qdyBFgs1f8joZZQgtA29HRmiQRg=;
	b=E5Yk1CugyYEKDHwv6LUBK+u3E/GyKEvQL49JLo6pgd6dxtHwcdE6Gv7CSBEBg/Ozrz3Mm+
	Lv8CnVZx4uVl4cZmN9KLjzpqyoJ0e4CF4Ld8UsGU930PU9GooWFy/h6vuhTZFjEfBX4pBa
	KXRtXvZnbyiRRtIZFaGFFEVmO7ifUtxkXiM3+5TpEOKmV+n+ab6g7+1R1QHpRYFWyvf4hW
	4ZD5M8s6nx6DECOs6vipps+O9nxukJVmq1H48Fxpb12xgFXUcv71cJ+ESUSotYlBm4mL2y
	0eAXJ9aV0PCpXT0HSppt/6tJN513pCt/AtWCDV300GFskcg3p/ZSTlBtOaRO2A==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 13 Nov 2026 17:40:09 +0100
Subject: [PATCH] time/sched_clock: Call enable_sched_clock_irqtime() with
 IRQs enabled
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-sched-clock-might-sleep-v1-1-e11e404fba10@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAGg992oC/yXMQQ6CQAxG4auQrm1CJ4agVzEuoPwwVQQyRWNCu
 LujLr/Fexs5ksHpXGyU8DK3ecqQQ0Eam2kAW5dNoQyVlBLYNaJjHWe988OGuLKPwMLHuulDpfV
 JpKVcLwm9vX/ny/Vvf7Y36Prd0b5/AJ3Q17d7AAAA
X-Change-ID: 20261012-sched-clock-might-sleep-48af26c8911b
To: Thomas Gleixner <tglx@kernel.org>, John Stultz <jstultz@google.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Herve Codina <herve.codina@bootlin.com>, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

sched_clock_register() disables interrupts with local_irq_save() and
calls enable_sched_clock_irqtime() before restoring them.

With CONFIG_IRQ_TIME_ACCOUNTING, enable_sched_clock_irqtime() calls
static_branch_enable(). With CONFIG_JUMP_LABEL and CONFIG_HOTPLUG_CPU,
this takes cpus_read_lock(), which eventually calls might_sleep() from
percpu_down_read_internal(). So with CONFIG_DEBUG_ATOMIC_SLEEP the
following is reported:

  BUG: sleeping function called from invalid context at include/linux/percpu-rwsem.h:51
  ...
  Call Trace:
  ...
  [<a8000001008ad9c4>] __might_resched+0x3ac/0x3d0
  [<a8000001008598b0>] percpu_down_read_internal.constprop.0+0x30/0x1b8
  [<a800000100af5ddc>] static_key_enable+0x14/0x30
  [<a80000010099b600>] sched_clock_register+0x2a0/0x370
  ...

Most callers of sched_clock_register() are early init functions,
for which might_sleep() stays silent because system_state is still
SYSTEM_BOOTING. However, platform drivers such as timer-nxp-stm,
timer-ti-dm, timer-mediatek and timer-rzn1, as well as the mips-gic-timer
promotion work, call it later, where the warning is reported.

Only the sched_clock data update requires interrupts to be disabled.
Enabling IRQ time accounting only flips a static branch, so restore
interrupts before calling enable_sched_clock_irqtime().

Fixes: 2707745533d6 ("time/sched_clock: Disable interrupts in sched_clock_register()")
Reported-by: Chen-Yu Tsai <wenst@chromium.org>
Closes: https://lore.kernel.org/lkml/20261109095036.GA722431@google.com/
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
Found the sleeping-in-atomic warning while working on the GIC
synchronization series [1] and testing configuration options on the
Mobileye EyeQ6H SoC, but the issue is not limited to that clock source.

Chen-Yu Tsai reported the same issue with timer-mediatek.

I also discussed the issue with my colleague Hervé, who reproduced the
BUG on a board using timer-rzn1.

[1]: https://lore.kernel.org/lkml/20260929-sync-gic-counters-v4-0-ec70c4b60434@bootlin.com/
---
 kernel/time/sched_clock.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
index f3aaef695b8c..b4e317b8a585 100644
--- a/kernel/time/sched_clock.c
+++ b/kernel/time/sched_clock.c
@@ -238,12 +238,13 @@ void sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
 	pr_info("sched_clock: %u bits at %lu%cHz, resolution %lluns, wraps every %lluns\n",
 		bits, r, r_unit, res, wrap);
 
+	/* Restore interrupts now as enable_sched_clock_irqtime() might sleep */
+	local_irq_restore(flags);
+
 	/* Enable IRQ time accounting if we have a fast enough sched_clock() */
 	if (irqtime > 0 || (irqtime == -1 && rate >= 1000000))
 		enable_sched_clock_irqtime();
 
-	local_irq_restore(flags);
-
 	pr_debug("Registered %pS as sched_clock source\n", read);
 }
 EXPORT_SYMBOL_GPL(sched_clock_register);

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261012-sched-clock-might-sleep-48af26c8911b

Best regards,
--  
Benoît Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

