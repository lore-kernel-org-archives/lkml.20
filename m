Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896329;
	b=OcL9OkyqSS9wyLrXZ+14SD+nidtEhmlWyGkkOWPF+fxVItrQZd9tyP5wUWNPlOejaxvQ
	 n8Pn2e678bdu6Khmy8N7MMw7D0bfhCvseUfFj+6okk6hr1S6gN4i6pB0nUOjl662a5x/5
	 ahPrXDJEb3g7BpCEAdZ8aellrlNajqHJkHLZE7gKNrpQInLVOgUlFawgS0syUV/x2MsCZ
	 Va4C9Q1VCdfw0NOh+FHLuTJK3E/r/6y+OU5RHBUmkbXt3EGHtuay/x9XTKt3JKSiVhyWF
	 ACxhcpLuKWNN58TryVrY4X1OCCo4zIAWljS36tGvz8PJYln1svgz2lbuMk5RbVKTjyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896329;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=WJTiMGqrIsOG3gHsS8L9VK6yNKhZ8u8EFDk2aXiMvE4=;
	b=HL4WN8Yggcpt7VFwcsJd4hmc3enGQwpBPeRBdiNth7g1OlRko2fuQ1lloVhlwqv+lWS5
	 Nl4N/uNwVIcCiT+2h2453sPk0u38b2sZ4z/k+tXREAuXOZB2uD8VtqpjWfC1IV0RYKiiM
	 H32xOCmxmUEXdA0bdvnFBJRq7gSzHl01Qq1mlwGF5cRpxn8pDW8XrXD3a4mBUspn9YENP
	 O7DK5c9bFBA/677jBI875IZpcQh82xbr2/Wuyy1GKN6GMlJMp6Njp2F63/OBg/gk4moj1
	 uIz0NFZ0svgjt7DVdHEw8t3tLBiXu/30FbCmrFwBL2jqfCfmUgF9plSqUrJ4AxmDjkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PFbB7XVR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860C16082BD1
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PFbB7XVR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B5D01F00A2A;
	Thu,  5 Nov 2026 16:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896329;
	bh=WJTiMGqrIsOG3gHsS8L9VK6yNKhZ8u8EFDk2aXiMvE4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PFbB7XVR2DoaX5auLaixnkFRJwdVCK41dwTVRkBm4i9yF5Kh16r9aChHuAruPERbO
	 cYO4jz75qZdCynNQxIFnXX2Z4gk7tJ6bp3p53XQoqtO8LHEMV9jxM5ZZfo/pBwC4zx
	 xAL1XO5Xjnenehf7tSj7WwaMC8In+W+Hl5jOi03q+fQ1xp4HwxXD5/+3jx41uocXw7
	 C3eEiQ9Duav/HT5Dkod7/TyssPlgrkRi0tfpFmG8z9PCSvmri/GNt7PDt94+wOWTAp
	 DKWf0HU/oZGj36E6TlQSaXldcsvEYTmxVnXE4f5Xqs2Y6qz3oP4Qk0DrUA3t4jVoTO
	 o5/JWJTGJrupg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 23/47] clocksource/drivers/arm_arch_timer: Move CPUHP_AP_ARM_ARCH_TIMER_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:21 +0100
Message-ID: <20261105163045.38862-24-frederic@kernel.org>
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

The teardown callback here simply performs IRQs disablement, which can run
concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index a4db04807aa7..3c561a630962 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_ARCH_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_EXYNOS4_MCT_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_ARM_ARCH_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

