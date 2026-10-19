Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94746511E68
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415462; cv=none; b=IMaAqFKb02uR+UkUJbFvuOBVSXtkXLvVA1/UT/MmXy9nqRDFPfP8WzOO+lMvVeCkmWGet66WqifAmngvhSnnpr/FA6tKpp0aF+Jp3Wv7no7T93dzVUkkjnaGrLc6ZN23utt6LIu08R91bKGQkJ7vLeB8JmTcAelJ2fX7LvHUaw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415462; c=relaxed/simple;
	bh=+OGb2CxVoE+AboXsXUFP1Qn10McT5s5Rj7M+20rfodI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J8O+ZE4Vek1TWTtvv0J+fIQxUnP3qECPchqLc/rk5ngykT2tH87JUzskrNFBpViE0sM4uL16W71ry732iG5G6TbZa5gjXGgBXzBq6yn5pbzzGkhcmiJpzNyMkKySbwscFLvhnmreLEcXf7JE7HI1ThDCSHjdO7IluAvsl0vgLnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZjhdnCX/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZjhdnCX/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB421F000C4;
	Mon, 19 Oct 2026 13:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415461;
	bh=e94KeCfk+tz3G0dq/mjsq4/4Xph63O/NBKRF2vRWB4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZjhdnCX/eHkSIo+9Fwq5vIiSdFO/iRFr6SjxMNaGNA4nzPII1X42LMSt5RkyzKoqY
	 w3oBHtmssQK/vlbYgHti5YTQe6UwYie5rBr1xRShfhTSri87BH6pQq2p7v7j94c3aN
	 ETKhAh7Oz64qAPjXMgG8u2KXqnR+bAvq+HRIK++I8Rt5QcmpPfu+V+SKEMub+9YhD9
	 c+XOz3SNIcRPu+HktzYusqBS4YcyiQ0v70C9G7fLgarrOoWe1BvejjuWDL/9NnOcNo
	 u5jt811/zSC33cFhIWFZkmp+VQe7LoZhiPzJ5o5lC8Kta1KZXKqGvehie0cMDKOrN/
	 w3qTkNbwu88zg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: [RFC PATCH 42/49] ARM: xen: Move CPUHP_AP_ARM_XEN_RUNSTATE_STARTING and CPUHP_AP_ARM64_ISNDEP_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:49 +0200
Message-ID: <20261019130856.49711-43-frederic@kernel.org>
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

None of the states here have a teardown callback.

Move them to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 8509c6377a61..c27e4aa109ba 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_XEN_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM64_ISNDEP_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_ARM_XEN_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM64_ISNDEP_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

