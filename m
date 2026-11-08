Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794165655;
	b=Fm6vGCFY2uRwwwiHb2RkktOLEE3MRUMd11YKJEH8zvboa7qwdWMKpgMFouXB+m+Y5efA
	 3agzHGxvpJe3d7iiZjQcmnmVKT/cmUXb3YzNM6/PSxN7kYe6zV8PeatxCvqp5YzC1mb0b
	 uvIpvx7M8MBnkAeUZpkt/pSH7IxMplraIpXxd+ghELzgInglB55BEBX5JYl3JLT2Yl1L5
	 JBXBaJqLAxDdy0TqgLhCQsy//0HCgbmCv6XonKaYkodYnCFIeZ0lmRRLuW9dWObfXWz9S
	 OdufQfOyYNH4T8cLZ/9DtgIUsJv32OakuM1yo3GFGVNaSzXaNdFSE+HdD19mnu6f8hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794165655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/BOOKQBNkJ2h331uHqW5sD5W9IEZRjh1wOOx6OQVw2c=;
	b=y3BzKLVdjWb6/IlIX2dt3NwlvmPT59EmEP1MhSum0czABlZRWKwnay6pXr9BSykPyXtc
	 fqEWWeL3fx2KM7W0Vx+tCDizGdIkV6pj38IETgr3u6TcKpS4BNI8+icNEYH6w3vkz5kgr
	 JlvPt5+dezfkpP38ARC/rUIuzfCBfwjqe5zB+QxmP8dbtd3bk0PlPDFOvKLkNj5eTd9B6
	 ouS50CLWLKgnsTGgssLuGryrRVvfmxYsr2dtuVo6ka/D/3pf7jIUbvidI+PKOV3+P8k/D
	 bxdDWXwzwGeCTFAoLjsTcZpkk3UZ8m5zNejqKz6v8lwhBk1q+/+P83Bmgrg2nFenkxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="no/4CrUJ";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E93606A332
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 19:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70E93606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=no/4CrUJ
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso170134f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 11:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794165654; x=1794770454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/BOOKQBNkJ2h331uHqW5sD5W9IEZRjh1wOOx6OQVw2c=;
        b=no/4CrUJwSv/ZObw8Fvp8ImnvcHzO0eqwwqjjqLegaeGZohS4Tqgs9NC5SrAgiwGxc
         TQv4F8lvRKx5uN5G15rNPdQ/6ILpHl+d7CPJ/Az8TS7KATaQJtIiPLznarMwJuu1M8vI
         5utFUU5FuMszJEJXYkOV8Ev54UZ6k+YtSxiYMtpuwPJjgT5u6lDIUzijITv9G6LuvlFV
         Vc+0ID7IX98MXs5NNU/rodtzbabZxqBIcOiMB3QVFP2KQav7x5qHdMvtaW3W7x63yrKt
         g1HF3GLjdpOebBCC1/mObhOZ7CrR/yMfUZ1buaOAGIpouZqrtwPIO0RbDXcwY+3pR00o
         PDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165654; x=1794770454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/BOOKQBNkJ2h331uHqW5sD5W9IEZRjh1wOOx6OQVw2c=;
        b=gowUr+OTnEXgNERyip3uEKUISUZYyZv9OAbjOaRn+TSvF7k843TnMqsAeMApGG1TDR
         12jpFA8nDbj2Cbq6aTxm66Iptc1vy6vymIqsfJFqPL1GU2ndCwMKjkeYQJyHJ7Q3//y6
         aTTkDCpHYL8/VFHsWMooBTqe9esOGk2aH7+rXZFX52b/Bzwl368LL4waQH9A56OJb+wO
         GYfZy4kuVSMb1yiBJWR1iqNmqiyVW4HTreKeIb0UGhkppSjOviBJgjMsuyQbBPzxCCff
         OkUu9X+d4AuonUu5pK1+ZJSIDtWY7WYOsCNkDdYk665dRxIcJtzH6DdwzAsw8MALS7g7
         XCCg==
X-Forwarded-Encrypted: i=1; AL+hErEWsdykGOIvI286zwMLpzy51LISX83r8RPnGNs5lsjXMtTbY7fr1EYn8WCdoSzTi05G3vOFrlfYwtnMzVc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/E/c9xjEPSkqwH5CHBhomjjFhee3X6OJ1WsCjC+eMpYJEVTHZc
	ipWj2Ph7wmDQRTBo/MM+EMBqzf6xPp9dFAqwRQdy98YH7Sxixuscmr0wy2TpNAwc
X-Gm-Gg: AYBFou3vFXv53bZMjG1/vjCzKv09b/yb/2dbY4SO0H8X1nymD5Tv+eTTADpXNWC/71G
	qXylt7+rPF69aToKgzi5TFP7S6s+3vHdKJmxAtHTvmRaF/CKEWZwQB7TJtPA9hLAHkEQbnH9nDL
	TwHNNKYRhlLphJGrxly/S+kM5RuSb7yeRwd4+I3qko3PkXmXMs3lKwLUUUxcyl70I1nlVUmi4/5
	BdcqxuTOzDYvHH2XMU6Tq0czc63U3YV6qhKUyywPZmkYqm53WOcm0GWARCmlrc15htWHz9UTNkQ
	uZOmz8WrEEPWArIdWDbIUqZupJ/EatElpdLh+acwMAKmjIO0g0EmnWKflAr/3LZbeKmMjeiKZ0H
	KGmVQDuce4B8P+7llNFNMB4ZbsjEpHOT20RtQOM4gbvs9OyJmNu1giCmOEgH1uqjzq2XYpy1wRl
	k8uLIudW3DvkZSMhEETkWmeNMelDtl8zwvtJXVs32Y4PetWFVpzhKaBCBSsBYiTf9+Dab9kn+Em
	J/HyE+WHldl8jkyBLxVU9BLx98yI2O+eY4MxC1UNTyo3xtXBFNt8yUL4nVjyHmBc+YRW6ZY6yWg
	h9K/hNrSS/wavQgKLWr2F1Wwok/KtLgYG4amYpC3VMSjBUpDJON0ZuEN6ABC4FdFWdfBAApdjj0
	pPHnQRFkx8xVomZxryfwA7nFY9AXlPmCmcXlBoCW0Ks58jgdJO6jy8yvah0kvvga417K9OPJAXe
	xOJpAniz7Ttbtur5/Cp39lRRHiWF2iZFa+
X-Received: by 2002:a5d:6f0f:0:b0:488:8347:a110 with SMTP id ffacd0b85a97d-4958852d7camr4675476f8f.7.1794165653516;
        Sun, 08 Nov 2026 11:20:53 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-a16e-6b01-f478-4cea-a156-2612.310.pool.telefonica.de. [2a02:3100:a16e:6b01:f478:4cea:a156:2612])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597b2066esm5651250f8f.52.2026.11.08.11.20.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 11:20:53 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] parisc: irq: Trace hardirq state in do_cpu_irq_mask()
Date: Sun,  8 Nov 2026 20:20:41 +0100
Message-Id: <20261108192042.14425-1-kmehltretter@gmail.com>
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

intr_extint calls do_cpu_irq_mask() with PSW[I] already clear. Since
commit 044d0d6de9f5 ("lockdep: Only trace IRQ edges"), its
local_irq_disable() then skips trace_hardirqs_off(), and lockdep
assertions fail in the timer tick:

  WARNING: kernel/rcu/tree.c:2739 at rcu_sched_clock_irq+0x618/0x1f84

The return to a context with PSW[I] set has not been annotated since
TRACE_IRQFLAGS_SUPPORT was enabled. Annotate both transitions.

Fixes: 366dd4ea9d5f ("parisc: Fix ftrace function tracer")
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Assisted by an LLM.

Tested under QEMU hppa (32-bit, -smp 2, PREEMPT, PROVE_LOCKING) on
mainline d48723711bae: 13 to 18 lockdep warnings per boot before, none
after (two boots each and one with ftrace=irqsoff). Locking selftests
pass.

The exit annotation assumes intr_return does not call
preempt_schedule_irq(). It currently never does: intr_do_preempt tests
PSW_D rather than PSW_I ("bb,<,n %r20, 31 - PSW_SM_I"), and a kprobe
saw no calls. Fixing that needs the same annotation after
preempt_schedule_irq().

 arch/parisc/kernel/irq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/irq.c b/arch/parisc/kernel/irq.c
index dff66be65d290..d9f6cb04e4bcf 100644
--- a/arch/parisc/kernel/irq.c
+++ b/arch/parisc/kernel/irq.c
@@ -497,7 +497,7 @@ asmlinkage void do_cpu_irq_mask(struct pt_regs *regs)
 #endif
 
 	old_regs = set_irq_regs(regs);
-	local_irq_disable();
+	trace_hardirqs_off();
 	irq_enter_rcu();
 
 	eirr_val = mfctl(23) & cpu_eiem & per_cpu(local_ack_eiem, cpu);
@@ -535,6 +535,8 @@ asmlinkage void do_cpu_irq_mask(struct pt_regs *regs)
  out:
 	irq_exit_rcu();
 	set_irq_regs(old_regs);
+	if (!irqs_disabled_flags(regs->gr[0]))
+		trace_hardirqs_on();
 	return;
 
  set_out:
base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee

-- 
2.39.5 (Apple Git-154)

