Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896337;
	b=rK/V2q5RwtksbP6N9Ohf9E+9DQ7W3509AaruXqRPlo+bQ7qxq1LeVbLNR9qtUEopsEmO
	 vcZKv82ET1+GHsWp1/ytI34+fOO46EZWOpFdoFJwKP6eZCRSD/mRGnrp1T+Ojb1Kshb4W
	 t6E4MolTPLhyXwn8wEg7J1ZOTIBVEJuUwq8SYk1IbB9Al2t8pAakBttai/L/9SKLD0OF0
	 RqNVglxIerOnr/lHI8fKNyEoQa4R+Mh+G9ep7u8qKypQY1Go2pg60cKFVGPZVxoDTKJsY
	 gCyB31g9XeF1Yta2noLbGBAaT/HWNg5STtoob0x1xs9tnNbooy/MbLu9qWX7R42L4FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896337;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=5+0F9/CJdtQc1vBt9OG1lnodhgpXqybDi34JHRqcAdc=;
	b=V8fCLFCwIe5cMppuwlMcu7sPRFoOGCYSDy+UK7avu/9wA5rqlUgJkyS3uVWW7q/VFppI
	 wl2GLO70W/vJLUNtHFbJi4buzEG8+H6x3ehdIvt3MzZdtwEKP5iRGcal9g84TxoRC5l8r
	 U3t485SLPqdRq3xenz9HKlYrhQwpHfQwCMk352XOxjiI8my6pC8gRduqHb2nE1rd5Ckn7
	 c58TAgBC2VtJmvg4jyjyMfLsDS+5USfPU5h8r+KIiC7zloQIaX7Yc/ZoV1o1MMH+7d48z
	 BqNKtiCDRjphl4edDOaEjS5UdXPPtoZ1vgepR95AmSr1ezBPUoZUhTCH32Wg4pqxb9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bn2UMefy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C09D606D83C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bn2UMefy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499801F000C1;
	Thu,  5 Nov 2026 16:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896337;
	bh=5+0F9/CJdtQc1vBt9OG1lnodhgpXqybDi34JHRqcAdc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bn2UMefyGXJAfCM3aSqcpR45mNzvYdqEtuAdtqsUSYgfRZii3r/TNJYmmtth4+v3S
	 HZ2rdwMfQhNzTQi+S6/1yZViPHkqMkQS2+MtUH1cZaldaI8DKthIDxVsgwt5WMG+XR
	 AnQYc6OsloY8RUagz/W2m291xq6YOhDBHaU0Kd5fciGjGuB9WujVJJDzaBUxd7bZa5
	 r23dNw1UFmEpmcEjdc5+CiMYZWrMz1Nc2OwWN26fslJgp2mXC9O74QGkl+HTNofzDe
	 caMLlqFlYUQA/J/YubG8sujcdKu3nPjHIdmUve/H1FToBitx88tMiywvtAYwQ2ghpd
	 lKVaMBQ2wd6xg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 26/47] clocksource/drivers/jcore: Move CPUHP_AP_JCORE_TIMER_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:24 +0100
Message-ID: <20261105163045.38862-27-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105163045.38862-1-frederic@kernel.org>
References: <20261105163045.38862-1-frederic@kernel.org>
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

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while stopping all CPUs in the system. This
doesn't mix-up well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

The teardown callback here simply performs IRQ disablement, which can
run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index d980d11abf27..38d60ddc166a 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_GLOBAL_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_JCORE_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_ARM_GLOBAL_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_JCORE_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

