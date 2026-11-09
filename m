Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232181;
	b=sMypAXf/YbJvH+O9vlck4tVkWvliWTnrCicTVO7fgIxMR9FVj/VB68yHuIza5qrORMQo
	 4VLX6iaZwW4P0dz0w3RTGPHbFgsP23U+bnMONG2Mh5JbMlSd66qGMkWmIe94Pyt2VJiM4
	 kbelVAM/k2vypsLMd7Ppo3MZuJQ/XdcH9BQv4G7v/OAGjBJYaiBNnePJzXEsWR65fo/RQ
	 F0J0slWOJY9iKjghpiyy+Rc4keDGy5j6MAb/EURazyCEEjB1y+nhTOX+tabgH/moySuUk
	 typuxwlRqS4QGGT01PWumFd/cZiqIKvY2aC8BxWVrmRjKEE5W9T6Yg1HLk9uehOw2iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232181;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=NYo499NcQ1HcxrdxpLzUbMoJwp9JQPIZNc/APUl0LQQ=;
	b=pOXWgy3zg7QSh3ejkbihrjaXcJZog0iqstEsmo35K2ENjOGuh2taU7EmFCGZGMW29AV5
	 0z3idh8c/t9xgmbMaueQkbYiH5ZtQ+xGnaerDAAtOHXrF8hU4BOyqx0CBsR+6a+cNu+65
	 n+ucVPL+Y6mUyx4424YXoI9oVpFZOSXz0UXNNwt921+Fqd/6olams3dzICrAFQz16D/D3
	 6W5yg6I5k2rCSmT7Fu0naPVvH+Rhe2YcimYzIpB+lyHLDdT1RRqUxlrYBKB1KOfWzyL+0
	 AdnnsfA58S1ifZsGG6RQvwsEjULPl3ZHdrbcL3KQSXbSMqTNgfn4uDhgT30EpmEBw2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=mlXISrSP;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA70F606A338
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA70F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=mlXISrSP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=NYo499NcQ1HcxrdxpLzUbMoJwp9JQPIZNc/APUl0LQQ=; b=mlXISrSP0c7WWE1O/+ztTIgdP7
	EqHJr2Zlz15zy5cAtdx+35EybKzDCdaeVNI69afDWFCHZ2qiFyCWsW3eJxGuttOHl6ZtrFHvLzT/J
	cZU2MPTnA56uzSzaecVPuSnw0JrmxC6LwjgMGC9+SN4uh8WZR4YMhG8BnZgM6TRL4dcooU7vwbDE+
	OJu2OW0ntSAQ4EnG39DBvAYL1ydSUiQUT1d576l8DVz4fw8yhFF1xYE2ZUVPlZjekwVSp4PNk6sV1
	COkh1reCQnZa5NsoZ+hOGBFBcE+fENZmuWInZ65B2dR6kLMT0+O095OX/DYEDrxOkFWfTC2y9AmY6
	M4se7QCg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xQPkf-00BfN9-2c;
	Mon, 09 Nov 2026 13:49:38 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 09 Nov 2026 05:44:30 -0800
Subject: [PATCH v3] lockdep: Move the emergency section out of
 print_irqtrace_events()
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-kcsan-irqtrace-emergency-v3-1-6d62e3406b8d@debian.org>
X-B4-Tracking: v=1; b=H4sIAD3O8WoC/42NzQ6CMBAGX4X0bE1/gFRPvofxUNoFVmPRFhsJ4
 d1t8aIXY/Y0ybczMwngEQLZFzPxEDHg4BLITUFMr10HFG1iIpioOWeSXkzQjqK/j14boHAF34E
 zE205t1ZKpUtpSHq/eWjxuaqPpzeHR3MGM2ZfXvQYxsFPazvyvPsjEzlNVwuhlGBVKauDhQa12
 w6+I7kTxaep/GESyWRAt4axndLi27QsywsgXarvHQEAAA==
X-Change-ID: 20261103-kcsan-irqtrace-emergency-f11dd338a43c
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Waiman Long <longman@redhat.com>, Petr Mladek <pmladek@suse.com>, 
 John Ogness <john.ogness@linutronix.de>
Cc: Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=4026; i=leitao@debian.org;
 h=from:subject:message-id; bh=iQl8Vvu5t19ootrcA2YaQPnNb7nD4TSkOj/k4dC3Ezw=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq8c9uDXJYqtB9vo71JuLj6jntMNc9tqVgSLRtv
 bR+Us5RuuiJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCavHPbgAKCRA1o5Of/Hh3
 bQN/D/4qx+i9TQ7O9rrbpcyRHPc8w7rwTfwF3YS56e+bZC4THjfv516IMvVVRhZqdjxEtb/a+kg
 ENZklktd/4j5auKda842/DkbF3zwO2HNW7CefsQ8SaCzQMEKgPk8AKFVXZ97yJCoCsMRYU/ac8r
 7bomHi5ihLASFFJa+pkK7JKOLXSAZauE49q8nbhc9pIq+auuMmDxATgKqrgsETQEcymNCBNhKYp
 x0AKwDDt1XyweN3stTKanHbX5yhrHtVK5PmJiK/G7tYkNoKXQi7BE3ESl7HwuiBmXzDemRgq6/E
 ASGiJ6DMmZvEpjCiuqOYXh5ijjZn4UM+hLIx4K096IbxD3acSAgkKcA+nqZLT3xXou2CUZikVvI
 t6AgjccPgnR8XakNOPM4DRGee6PTEQTXCmT1QIfQ7/TvFyJ8Y3KtmSdghnc9SOues4dkJY5KNmH
 61EP+UZc+6UUc0Ux/25AEftu9lTsWMEqWAOB3POJ6TlIz4PtG/IyVg/anSrNEv0CMsQd1//Xg/m
 UF6HRbBxocl02zGMw6eNdkupJrTQ4tDlFoaf8y1CRBQFPyylJUiPQgDUtYaJoSBihRVje3upRPK
 tWE/+hOkeBXf8bz9bnr3id9QnDHv7kOr5n532On/2E6ZGQK0ELlUTiHtVAk3Q4/wtJO6pEWte0s
 rp7koNeRtj5wtyg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

Commit 59cd94ef8009 ("lockdep: Mark emergency sections in lockdep
splats") made print_irqtrace_events() enter an nbcon emergency section
by itself. That was meant for lockdep splats, but the function is also
used outside lockdep (by verbose KCSAN reports, the soft and hard
lockup detectors, etc).

For KCSAN, as print_report() runs with the raw report_lock held and
interrupts disabled, so every verbose report writes out the whole
console backlog under report_lock. Other CPUs that detect a race in the
meantime spin on report_lock with interrupts disabled, as the lock is
taken before rate_limit_report() gets a chance to drop the report.

That causes this type of problems (as seen in Meta's fleet):

  BUG: KCSAN: data-race in mlx5e_poll_tx_cq+0x5d8/0x998
  ...
  irq event stamp: 28975074
  smp: csd: Detected non-responsive CSD lock (#2) on CPU#35, waiting 5000000052 ns for CPU#26 ipi_mb+0x0/0x18(0x0).
  smp: csd: Detected non-responsive CSD lock (#3) on CPU#65, waiting 5000000020 ns for CPU#00 do_nothing+0x0/0x18(0x0).
  watchdog: CPU71: Watchdog detected hard LOCKUP on cpu 0
  Kernel panic - not syncing: Hard LOCKUP

Drop the emergency section from print_irqtrace_events() and enter it
around the call in check_flags(), the only lockdep splat that prints
the irqtrace events outside of one. The other splats and __warn()
already wrap their whole output in an emergency section.

Fixes: 59cd94ef8009 ("lockdep: Mark emergency sections in lockdep splats")
Suggested-by: John Ogness <john.ogness@linutronix.de>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes in v3:
- Drop the emergency section from print_irqtrace_events() and enter it
  in check_flags(), instead of adding __print_irqtrace_events() for
  KCSAN, so every non-lockdep caller is covered (John Ogness)
- Enter it around print_irqtrace_events() only, not around the whole of
  check_flags(), as DEBUG_LOCKS_WARN_ON() already WARN()s (John Ogness)
- Don't enter it in lockdep_cleanup_dead_cpu(), as that is not a lockdep
  splat (John Ogness)
- Retitle with a lockdep: prefix and reword the commit message, as the
  patch now only touches lockdep.c
- Add Suggested-by: John Ogness
- Link to v2: https://patch.msgid.link/20261104-kcsan-irqtrace-emergency-v2-1-ceafc0098a25@debian.org

Changes in v2:
- Retitled and reworded the commit message: a KCSAN report is not an
  emergency, report_lock only makes it worse (John Ogness)
- Add Fixes: tag (John Ogness)
- Link to v1: https://patch.msgid.link/20261103-kcsan-irqtrace-emergency-v1-1-162288205435@debian.org
---
 kernel/locking/lockdep.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index c3dc84a7cef26f..71f1b4b8f06d57 100644
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

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-kcsan-irqtrace-emergency-f11dd338a43c

Best regards,
--  
Breno Leitao <leitao@debian.org>

