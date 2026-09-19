Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B247731F986;
	Sat, 19 Sep 2026 21:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789851938; cv=none; b=bIexLwT7QdHW5L3Lj6jfjmLTeRu7sA6Cl3cG1rfNPIkTNuZ2nzRrOf3NbSMWETghClEoTTlEXh4zPV85zib5IBJPUyxMHPz7JgELMxSb4kafCxgxcBejxCJHkqf+OZ8geottrtf/dePr0dPImbz/PLiy+ULBEx4htj0oWv0yzMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789851938; c=relaxed/simple;
	bh=09b7W/iFuQvTF/RmUELSmTR2VOXacH0F37Dz2w7L9fI=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=ammpZv7ozPBuLT0aYIHzTSTFOHPUVgMr2PK7TO+kviCIm0RfjfTTR2XUVO1PCs1vcZoIW1qCSieO9BFLdfV2eFX6qivEbno6krOVtvHcE7LfZEl8vq7ldc+CowQm4l1VKPXWmILElX/w4gqitKRmSiiokoPrdx3+9G8NuYUmKZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gYaIH4HH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=W6VzZuDp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gYaIH4HH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="W6VzZuDp"
Date: Sat, 19 Sep 2026 21:05:32 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789851934;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+gGhDdg4FNisdbn+YDMczWed8gOJNK1QbVrV6bw0EIc=;
	b=gYaIH4HHrVWgVAxiASl3hP78GgDx+/QnhdJT0/rVYVBVriyiXF85jCHmqMHzOoDP9Acgav
	9NH4V17jxMUmem1A0aQBZUvr+d39GVvAZnLr3Gdy4vQhE9DB9CJEEHXskPwmkXDsxAN7+m
	QyKbRDRaJ79v5MhPdLKKeW+Ok2pLAaJaENZqtIde67EvCWiSoqSvV6rma/NliOQLys95Dv
	lvMVNzOyWo3iuVxmzjfB7+yTXE1zHPJL1otp7aH9GzXfS8NKJi1VMMUpXbNIsEhlSAwXdq
	ONPBMx4msoGin7ncl1qOHOCC+ldjBmjnUdkYDYnlscld6jXk7iFi25qownXJQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789851934;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+gGhDdg4FNisdbn+YDMczWed8gOJNK1QbVrV6bw0EIc=;
	b=W6VzZuDpAnLgIyAWO8hrAquowaMaifezDPfUXN5C7TfAk+UtPWI5YgWx/neILobvbsHLTx
	+AW7r+aaDCwoQiDQ==
From: "tip-bot2 for Wang Shuaiwei" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: timers/nohz] tick/nohz: Add BLOCK_SOFTIRQ to the hotplug safe mask
Cc: Wang Shuaiwei <wangshuaiwei1@xiaomi.com>,
 Thomas Gleixner <tglx@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260904064506.671203-1-wangshuaiwei1@xiaomi.com>
References: <20260904064506.671203-1-wangshuaiwei1@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178985193276.2819794.55124822433246938.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/nohz branch of tip:

Commit-ID:     a59a940ff89fcaf305362443335f99010ff3b9cf
Gitweb:        https://git.kernel.org/tip/a59a940ff89fcaf305362443335f99010ff=
3b9cf
Author:        Wang Shuaiwei <wangshuaiwei1@xiaomi.com>
AuthorDate:    Fri, 04 Sep 2026 14:45:06 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Sat, 19 Sep 2026 23:01:14 +02:00

tick/nohz: Add BLOCK_SOFTIRQ to the hotplug safe mask

During CPU-hotplug stress testing combined with an I/O workload, the
following message is observed:

  "NOHZ tick-stop error: local softirq work is pending, handler #10!!!"

On CPU offline, ksoftirqd is parked at CPUHP_AP_SMPBOOT_THREADS while the
CPU still takes interrupts. A block completion raised after that point
stays pending, and if the dying CPU goes idle before teardown,
report_idle_softirq() sees it, keeps the tick alive and prints the error
above.

Such pending block completions on the outgoing CPU are drained later by
blk_softirq_cpu_dead() (CPUHP_BLOCK_SOFTIRQ_DEAD), so a pending
BLOCK_SOFTIRQ is harmless here. Add it to SOFTIRQ_HOTPLUG_SAFE_MASK like
the other teardown-covered vectors.

Signed-off-by: Wang Shuaiwei <wangshuaiwei1@xiaomi.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
Link: https://patch.msgid.link/20260904064506.671203-1-wangshuaiwei1@xiaomi.c=
om
---
 include/linux/interrupt.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index 3bf969a..52bb684 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -573,9 +573,11 @@ enum
  * _ IRQ_POLL: irq_poll_cpu_dead() migrates the queue
  *
  * _ (HR)TIMER_SOFTIRQ: (hr)timers_dead_cpu() migrates the queue
+ *
+ * _ BLOCK_SOFTIRQ: blk_softirq_cpu_dead() completes the remaining requests
  */
-#define SOFTIRQ_HOTPLUG_SAFE_MASK (BIT(TIMER_SOFTIRQ) | BIT(IRQ_POLL_SOFTIRQ=
) |\
-				   BIT(HRTIMER_SOFTIRQ) | BIT(RCU_SOFTIRQ))
+#define SOFTIRQ_HOTPLUG_SAFE_MASK (BIT(TIMER_SOFTIRQ) | BIT(BLOCK_SOFTIRQ) |\
+				   BIT(IRQ_POLL_SOFTIRQ) | BIT(HRTIMER_SOFTIRQ) | BIT(RCU_SOFTIRQ))
=20
=20
 /* map softirq index to softirq name. update 'softirq_to_name' in
