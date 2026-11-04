Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796404;
	b=3dnByGgEmZ0uuN92PhTLiKmK/GAscdrXd3VCiid+KUJd3az5d1dAk0VfQHS/4EtxgW3J
	 qSNHCSLY3u6DAURQmfyRiG5xeiZn1AVxf8v41CcxXCKKrm/yaMXiDXJl9rgtPdwi7qzyS
	 08QxcboHxq84k+N54LRIjC/tJnSTeNbiPXQ0cvZBd4S8Pr2CTO4iXya1jOJ3dpGQTir/n
	 +7tt6vnyn1f9tlzdtTSAeeU4XloKyQSdsTu8vSMYcIbsT6JTmxVbPMj8sTAEtVfgw1wIP
	 mdsnPiocZI2hSDhfebjyi82Lb8F+EAqeMoOQ7GDCYv6OexDy0kd6b97Abovwahc2Fug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796404;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=eyikFY7C3QT90Wffq51wylQVXUvJEQUhu4OAz+HFx3o=;
	b=R+1//Tvu0CLQATT5Jn0lP+V+H/stPs7lU7beirUIRH3cdsqjY7yJRgU/4vhgN55uMH2X
	 wOyHD2faE5Pafc3xoKkZyicmQIiF+CVKN/Zd2pq7dqCek0XQ/41DcGbzS1tY1eToJ5JrK
	 7vpaZgfQVfDr3xNS/qGUc8y4OydkAxm8xiT1+pSIoD4Q2r+NyRj7CPAnpIbx3fPVG14y9
	 PaWiJ7+I/4/dbHOrrAeQ3vD9atXOcYg4Lq2Xr87Dtxo79+bmZKY3fsA3q+JE2DkzHdSVX
	 Mvdbd6dOtPdWGpSsFYq3PJOrLksS1bmaxxOrvHXYebOsMYml6K6lQh3LqPuyg6LADtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zdBtH5ob;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wIQ63DUR;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADBF606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ADBF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zdBtH5ob;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wIQ63DUR
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793796402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eyikFY7C3QT90Wffq51wylQVXUvJEQUhu4OAz+HFx3o=;
	b=zdBtH5obaDFfrIctvpeUqRTTkgwPxfazmbskLSgltT/A94ZZ1K8Ppk4tSyDeXlLq8Wx2k1
	xm9ByBkUCxUiom+fr+IVp02kRd5m6iu2qU829IjaMp2QyPLlJieJAM7mzSIuKtXcDYoPfN
	sLevhww+VRm2riDO01iSzzMS8K2KfcD2EbaQWERirQnKh2J+JJQNVc8kuQO/Ga3fMzomUo
	JbnyD7Jj9NZf9uk1Yt89g7NO3leHPmsT7/6BCH2qd8l2LhB6XR7IQFObQ8IGCLU1DiJZdy
	0EmxvLSN+t6QBD80CxIRbkyiunmehDMsBX/1Fq5VxVh7oG7FRQ7g4TMvaIy2nw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793796402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eyikFY7C3QT90Wffq51wylQVXUvJEQUhu4OAz+HFx3o=;
	b=wIQ63DURVvopOx1dWx+LtaFunvLP89idAslCHEliWa9o2uFPZnpxOZ3jh7s7PD9Za+/h2r
	BFZaL97Vc/yVlOCg==
To: Breno Leitao <leitao@debian.org>, Marco Elver <elver@google.com>, Petr
 Mladek <pmladek@suse.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, Waiman Long
 <longman@redhat.com>, Dmitry Vyukov <dvyukov@google.com>,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
Subject: Re: [PATCH v2] kcsan: Don't enter an nbcon emergency section for
 verbose reports
In-Reply-To: <20261104-kcsan-irqtrace-emergency-v2-1-ceafc0098a25@debian.org>
References: <20261104-kcsan-irqtrace-emergency-v2-1-ceafc0098a25@debian.org>
Date: Wed, 04 Nov 2026 13:52:41 +0106
Message-ID: <87v76cahn2.fsf@jogness.linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On 2026-11-04, Breno Leitao <leitao@debian.org> wrote:
> Since commit 59cd94ef8009 ("lockdep: Mark emergency sections in lockdep
> splats"), print_irqtrace_events() runs inside an nbcon emergency
> section. It is not only used by lockdep splats, though: verbose KCSAN
> reports call it too, and a data race report is not an emergency. Yet in
> an emergency section, every printk() flushes all pending records to the
> nbcon consoles from the calling context, instead of leaving them to the
> printk threads.

Wouldn't the below diff be the proper fix?

John

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index c3dc84a7cef26..71f1b4b8f06d5 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -4245,8 +4245,6 @@ void print_irqtrace_events(struct task_struct *curr)
 {
 	const struct irqtrace_events *trace = &curr->irqtrace;
 
-	nbcon_cpu_emergency_enter();
-
 	printk("irq event stamp: %u\n", trace->irq_events);
 	printk("hardirqs last  enabled at (%u): [<%px>] %pS\n",
 		trace->hardirq_enable_event, (void *)trace->hardirq_enable_ip,
@@ -4260,8 +4258,6 @@ void print_irqtrace_events(struct task_struct *curr)
 	printk("softirqs last disabled at (%u): [<%px>] %pS\n",
 		trace->softirq_disable_event, (void *)trace->softirq_disable_ip,
 		(void *)trace->softirq_disable_ip);
-
-	nbcon_cpu_emergency_exit();
 }
 
 static int HARDIRQ_verbose(struct lock_class *class)
@@ -5797,8 +5793,11 @@ static noinstr void check_flags(unsigned long flags)
 	}
 #endif
 
-	if (!debug_locks)
+	if (!debug_locks) {
+		nbcon_cpu_emergency_enter();
 		print_irqtrace_events(current);
+		nbcon_cpu_emergency_exit();
+	}
 
 	instrumentation_end();
 #endif
