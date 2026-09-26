Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AA12D7398
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 00:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790383295; cv=none; b=gXlcM7PWlw2g6+QkZSCxtWoxMXGuR3ZwBd0xemaSQjn2sft5XRVNBmnXSbVVC9eptia5ECmUK3mWdkKhpny5yODE1zo/XXpXEsJeg+aeW+xtlYkEz6KCfDcWBA/mYc9wJqVfkyX9Q2glDl0+0vReYg6OaTr9QNkrGMfI2O+CMIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790383295; c=relaxed/simple;
	bh=L4pjiiOkTsFKR81K0S5Kv3PjGwd6F9XUUXbeF6BNDuY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZKdWmAeJgQ6iJv8Rk+rgYKT332P3xmlkyecgya906BtimdC0X3y49dVQWb140tPhVQzwGW5lorJlLnB8Cskz4V9aHmboIQXhmRvzn7BY86jpjtoCgDP2ehS525v35GekKAyMK3G6GuZDTrO9KAYI49VJV2pbRGXKUBYXzjTO9oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ER0ag8VZ; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ER0ag8VZ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843796e373so836511f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 17:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790383292; x=1790988092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lNkdwYA6jM3MWWOGlSN+cxClsTBHiOh8WfmAfJNZcGg=;
        b=ER0ag8VZrH0mjlA1gn7FGxjV7UOR/ZJlO4WWMfr3u9Imhf/8TTUBKT1uUvz2jPnTok
         Ii6KVQYB7wnDj9tRhQRc1HCzCPjqTy+aXLo7p1eifZqkr8DqV66Y61QBY6e0SET/G1xH
         VP8sWdh5mmZlkM71tlAzUX14kOYMfplXqPwUDAQDg4lKlQhsBvF/SwARWdNl8SqKbOZL
         q3qI7WVJVlrUUQHHIkmEZJOvuzSPCfTkKsUfu5BrbDO3rcfsgknRYLIE6PIUJwJAVW9F
         rdDaWJ/1hohbHvMJYmzSShitYl0rZj2X7sfy2eyxKy7KoXTRVNrdQXqdbinPzkgceBYi
         wLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790383292; x=1790988092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lNkdwYA6jM3MWWOGlSN+cxClsTBHiOh8WfmAfJNZcGg=;
        b=Jd/6Ve0T2CIkIHPx8iXoVyHCF0FKvAjCpRBbwewij4Q50Z+67w/p0QY0mRgbxIkiCu
         Ofgpe1TOtAHhLcp7j/ChWzmN0FDSYFRE8TQOcXOTXe7EfemTNbsEHGKEek3FcSYKrq5Y
         jMHC4XXiO4RwhVQsBekPVJXgUDZS/l3bCEswzxnoFAMh2gs1AyRQjNQYRJjyT3OVK8qe
         xLLC5650N6aDYxltkdwpG0l5BZeISCljKMgv9jsh0Ey42NnqQoskU7rKqgzDIVwD+iZ3
         sIjIU9w/ZCMhrC9G4+fqh4cYw95/g/oGlsaCsvwgV0Lh5Z8MCsrfxgrCAAtbDILamh4E
         yv7A==
X-Forwarded-Encrypted: i=1; AKwUvByiExXTQWHLQE/DS8PLZv9XofmF+BYH18jWkmENvHJx9LRFmvmAngWfA687T92GTpxPhEz4F44s3NZxKV8=@vger.kernel.org
X-Gm-Message-State: AFuF++ljZHdhsMK537gz1+IQs8j+IKKncNifEnjyzv8uxmTq+5AuVgvE
	xFsMb1XhR8InRi1xtkAcCjfXHpkzSixLcjNvIgdR1T2zZu+OLhaFahnn
X-Gm-Gg: AYBFou3HFaTJrVq099XpL6o+U4zOnK6YziYIRZiBNuXSkDjpJFbKDy2nodHUqiyGfct
	FFWs6FSsfjdY3Qu+pa1wwqZkvqdq0S0hNSCgbMLGU66hzDcdCZMAAtesZVWdI0VVzxHooD/RSKf
	hsoFBzNCR5AUdxbU1tOlUjTK3LD0Cn637igB4cdV9wcvDy5Yuw/uYPy8+hmHN8XPsA6HKfaT8+J
	k0hNvynjGoFoI3dpyOubGjZ6PNB4BkJZ85fpZ32Y22QhSdXd4iBlj8Lf6jP0Fhy3oFPPblfRVaA
	mTwgGYbwvLylMIXQujrcfrFOCiw4AFWxZYRTZFMFffnbBw9ejsZHFOnMGhLWHznfvXcETQw2dFf
	NzWpcWyBFxD/Gyd5O4OOcKJQOd1gNc8dndajs4R+qM6ewa8VCQRgSvtu52RNfzSy8CsT9eBe3I7
	71giL/yjHELCLi9PPq+m1lBQ6tdOF6HNm2kYWFf1eWt8jUjB/zJ92/DiRzClgVI36ZJkWxR0IA6
	KT4hLNwTAHxpUMLsaR1lc4ri1WrZgxvfs4uznBZLpjs4k7qJAfxiWDlhSyU9QBL+GKWR8/5Sv+J
	q+aCMu/lj17F3dL+21ZHCTkb4Z3QSGz9NTgB2aWqKSBYkix6agr+FErRqKf/141N74x52di6Hio
	3DmFpv2A=
X-Received: by 2002:a05:6000:4285:b0:485:8fb2:b8cd with SMTP id ffacd0b85a97d-488716b2917mr14426193f8f.6.1790383292443;
        Fri, 25 Sep 2026 17:41:32 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a9e5-4c01-21ce-313a-e569-2df7.310.pool.telefonica.de. [2a02:3100:a9e5:4c01:21ce:313a:e569:2df7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a648895sm10350830f8f.28.2026.09.25.17.41.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 17:41:32 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Radu Rendec <radu@rendec.net>,
	Boris Brezillon <bbrezillon@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] irqchip/atmel-aic[5]: Disable interrupts in the irq_pm_shutdown() callbacks
Date: Sat, 26 Sep 2026 02:41:24 +0200
Message-Id: <20260926004124.88221-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

irq_gc_shutdown() calls the irq_pm_shutdown() callbacks from
syscore_shutdown() with interrupts enabled. aic_pm_shutdown() and
aic5_pm_shutdown() take the generic chip lock with raw_spin_lock(), and
irq_gc_eoi() takes the same lock from the interrupt handler. An
interrupt from the chip while the lock is held spins in irq_gc_eoi()
and hangs the reboot.

Lockdep reports this on every reboot of a SAM9X75 Curiosity board:

  WARNING: inconsistent lock state
  inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.
  busybox/101 [HC0[0]:SC0[0]:HE1:SE1] takes:
  c1c2b434 (&gc->lock){?.-.}-{2:2}, at: aic5_pm_shutdown+0x34/0xd8
  {IN-HARDIRQ-W} state was registered at:
    ...
    irq_gc_eoi+0x28/0x60
    handle_fasteoi_irq+0x120/0x214
  ...
   aic5_pm_shutdown from irq_gc_shutdown+0x4c/0x58
   irq_gc_shutdown from syscore_shutdown+0x5c/0x9c
   syscore_shutdown from kernel_restart+0x34/0x78
   kernel_restart from sys_reboot+0x180/0x25c

Use the irqsave guard, as
commit 33517881ede7 ("irqchip/brcmstb-l2: Use _irqsave locking variants in non-interrupt code")
did for brcmstb-l2.

Fixes: b1479ebb7720 ("irqchip: atmel-aic: Add atmel AIC/AIC5 drivers")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes:
    Tested on a SAM9X75 Curiosity with v7.2.8 plus this patch, PREEMPT_RT and
    non-RT lockdep builds (clang 22, LLVM=1): the report is gone. On SAM9X60
    and SAM9X7, lockdep only gets this far once the PIT64B timer report at
    boot is fixed, which I am sending separately. The irq-atmel-aic.c change
    is build-tested only.

 drivers/irqchip/irq-atmel-aic.c  | 2 +-
 drivers/irqchip/irq-atmel-aic5.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-atmel-aic.c b/drivers/irqchip/irq-atmel-aic.c
index 1dcc52760eca..4a7935e75e4d 100644
--- a/drivers/irqchip/irq-atmel-aic.c
+++ b/drivers/irqchip/irq-atmel-aic.c
@@ -123,7 +123,7 @@ static void aic_pm_shutdown(struct irq_data *d)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 
-	guard(raw_spinlock)(&gc->lock);
+	guard(raw_spinlock_irqsave)(&gc->lock);
 	irq_reg_writel(gc, 0xffffffff, AT91_AIC_IDCR);
 	irq_reg_writel(gc, 0xffffffff, AT91_AIC_ICCR);
 }
diff --git a/drivers/irqchip/irq-atmel-aic5.c b/drivers/irqchip/irq-atmel-aic5.c
index 1f14b401f71d..07a317ed06ef 100644
--- a/drivers/irqchip/irq-atmel-aic5.c
+++ b/drivers/irqchip/irq-atmel-aic5.c
@@ -217,7 +217,7 @@ static void aic5_pm_shutdown(struct irq_data *d)
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	int i;
 
-	guard(raw_spinlock)(&bgc->lock);
+	guard(raw_spinlock_irqsave)(&bgc->lock);
 	for (i = 0; i < dgc->irqs_per_chip; i++) {
 		irq_reg_writel(bgc, i + gc->irq_base, AT91_AIC5_SSR);
 		irq_reg_writel(bgc, 1, AT91_AIC5_IDCR);
-- 
2.39.5 (Apple Git-154)

