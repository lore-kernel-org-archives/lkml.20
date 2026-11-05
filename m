Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896340;
	b=WCAS/V1coDiF6Jt62kknAwhfrdTh76cA46hk2RgX0DblkQ9torYpWt2o/Bp8hd8E7zZI
	 Kgbsu6TjM+ckF7OBH1mxBSrZ38wEaKrUD/AQ6koPo1aoAxSnTTsKpNOkb9Hun8n2oYl9b
	 1yxU696DY6d5eRor4DuDPuh4M3VFftk20j6tUvtuHwxFaKF+8DME7nrlwyPECbSDiOTcO
	 X86GwZwrs81uX31FUEX4ZKZZ4nFNv+YSJdfy6I5xopgF+mKAQyAFGOg1xoFZxCjVQdGMh
	 U00R6w57/xvnjkoNCIkbjOjPs3Qy7693eM/0BUx2qrWdZxYsCjdw7ZatxUITuNA1JPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896340;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=b460Q3cwnl04EHCg8MutI2uS9sgGHru84RfF/i2AAKA=;
	b=1jlp+iy+2E14TIAm2Pn7/QnbfYXY2/eNCHyIMhj6BFhQQ9KmgNq50JU0wyGZ9DBMIYHz
	 km18Y/5j2vOYwQflPe3lc8vsd566UZNB2AyW1I+rXW/DG/Ayqd2KIGZrmNThK8YihxfLm
	 NicvgEgu800YNp3Smxj/6953w9Kl3loI/C5YLclBX8qsEJ/AvgrE1hTuOGl/5XLHq0Ivd
	 Rvx6l3SqHhc3r+L4bF04KQx128sSD2ulkRCvLSNAVVBsViVjGAgF78027OciqY3sfGkYv
	 uIPQ+OQ67HC1NBP5CyEHfGqVkuv0gnokV7sBPe5FXIwrxH2xY2v4ojIRET/owgrAD6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="UyZtP/2i";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A7D60A6F72
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UyZtP/2i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A41981F00919;
	Thu,  5 Nov 2026 16:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896339;
	bh=b460Q3cwnl04EHCg8MutI2uS9sgGHru84RfF/i2AAKA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UyZtP/2if2EtBCr0hvwUtvmhrbOiwo50jhs1QAMhe0u0drleGnIFma1sgbIeTwunH
	 +EUDfuSgPv89WmLqSRnXcN6YTFfMqVSOTmZjuJFsFEDFGyZCMOGr7B/g5T2BRtd+Qg
	 16yB78OWIe4qreWQQIl/F2nlPBgQ05eqBeOMAtFWqeUYPdLfqyHrC3GVCH7bGxOib/
	 ILLCCJ7zf819IAGUWDACxaDoDSk7lDflp7TN8OE3aeYqySGQqLnH1aIg3XY8X4QOKn
	 BKpugwQBduNmMD8lJi/2RR8x3B6mlhc5q/pQAqXataEAYI6SaOMuxR/Rsseyy+xpKM
	 4s5698hNaTHIg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 27/47] ARM: smp_twd: Move CPUHP_AP_ARM_TWD_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:25 +0100
Message-ID: <20261105163045.38862-28-frederic@kernel.org>
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
index 38d60ddc166a..d7a6dcb14885 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_JCORE_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_TWD_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_JCORE_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_TWD_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

