Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57722501F2C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415443; cv=none; b=FOP0274k9YNKQr6/DdtUc+rnUk1qELvONF6xCtrDiwNoC6w8ucszgV+CMvQZb4BOfBauoLMSI9xkGzlOR4OtcdclzdglyccO1oE/mrktZChRjefMMC+9IqSmuMgTH9NQoo8UFfCaJLWpre/8epFtja4jp3kcQ1qsSl46FttmJDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415443; c=relaxed/simple;
	bh=wlxy2j05KCotJozRwRouPM2Igi9mXCXuwiQ8vGfzCT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T5KOWr5pk09T20NyKacB75u19BqM/Yqa+n0/GAoPzWCmd3KBAlNrbJwef6YWjLlqdUrqXgEw32gNwFeNzAw1+bqjBEFa8AMq59ZyaUbT+dfI+36yIONttp2jewjwpnHUEQHyPXmKrm7UpcbcHwMgUDAwGHLTvpZzwKHSsrDmQb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ApXkVETF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ApXkVETF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093691F000C4;
	Mon, 19 Oct 2026 13:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415440;
	bh=O/cND9DK761g7Od/EFbbufGMF0NPniq3RLhpe77Yjxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ApXkVETFl7JaWshAVImeu+NLrNbgbpjtVP0iuKOro5OWf8eUjHSwThMzxOumKHkPE
	 frdDeAzPLG1OVIn8ZTvm5nAl/XjetpnOOP3n4eRstEAUSvRSJQb+enQoTCfcQAndEQ
	 McWbFpxebAIjw7Myy5Gex8ZMwltmtEFjW118FwEXf5HDcdOBtyElCKwDBQERl119FM
	 I6kDVJEw/zGQrZOIQPn2YVZNDvVqYwVll4letJexbBMFL9ZO6XMCmx6DS+sA7j+F5P
	 kUJHECJYHRA1Mhz2GXou3jMpRbAMRIA88wzA+/MWU9xaiWHeMn5PZGHxBSQtLXUaiy
	 Y2G/lpbYWzWKg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [RFC PATCH 34/49] clocksource/drivers/rtl-otto: Move CPUHP_AP_REALTEK_TIMER_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:41 +0200
Message-ID: <20261019130856.49711-35-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019130856.49711-1-frederic@kernel.org>
References: <20261019130856.49711-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while stopping all CPUs in the system. This
doesn't mix-up well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

The state here has no teardown callback.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 75f4cae8971e..374e7599baae 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARC_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_REALTEK_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_ARC_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_REALTEK_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

