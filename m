Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896394;
	b=U7JdWIxpbpFoHuo4pU9ScwTOZFujqTIPCzcRYoN3seLmlFVWuoew9ucrEN0xr7IZz1pS
	 zuOSbI4yXAqrbIOp/8btBRxdvLwrO+LWjpHd70U7caiwqpuUV3rIa04V7olZG5HfAT7vn
	 SB6w66f5TUbAACALLZB3vEPlbssh0dry/eoHXzw4TgwZZlBLW6hOiZE1zO/J43KsOPjet
	 FhMuHYSGHv3RnCKZEoPpLqyyyfmGPLQdS8xIX1wg11tvYNsh22jL1amb3kHYqAQOTVT/w
	 78TEPSeTu9THCQIUbbzv1Y5M/jD6J3CEmz5ouTef2AmPMT0ChBwQZ6S8jssVtkAQ7mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896394;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=6jlkUVb/gWI3Le+34SAC6/Tz4iZSDDWUllw6WlLU5mY=;
	b=lzNAKACNZc6ZJO0j16ZkN09zaj46XdO/Xn37i34PminEydWo5cWDnKGRgy/3r5NXCbfn
	 67PE5i5gh/Ui8Cry/rApgHJN6KkTOObv0qPVHyRuAaJfKwoKx+5TFRTVq4AUwbHD8Vy7A
	 j1om2mWzj3JCPj2j+aFzPHuP87gh2vSa8+mqxNU12caR1R5Pll8DEC4RmLpWqhxCZjY9k
	 srsgp6NZyK2EsA9NlnPGV+ZXEZ/DUUPmRCe5wC2/TxcQMenmJWlpgORVTIGPrfRK0Kf6b
	 avJFFsDK3SqR/YwBKGlW+uGbPvYzT25Mxrtv0ZF1oBiFpV7OP4xKq25U3l2yZaYE5bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JMoNsExK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F13C6070381
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JMoNsExK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9F41F0093A;
	Thu,  5 Nov 2026 16:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896393;
	bh=6jlkUVb/gWI3Le+34SAC6/Tz4iZSDDWUllw6WlLU5mY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JMoNsExK523hax99O+gPKCXuBCaq6h4JyTyvqPcxHvS2etUSAjJm19dioD9cQwTu6
	 a2HWAHBPxsflioyu2MzM6Wo2jfWjondrIpgpRVR+jbuzICElKWN7ufWtW7PraPt85g
	 GiBtysq93SNImAaMCOkvH5euITegScf7rM18e7FXTdd20l0E5DP+wesGIhutaD/vKZ
	 DtxQLfTA4tkm2/4Gb/pgdVgZvHJwp5peoRVRVJe9RDeaDaOkIAb72YELaHfWGWxNDp
	 vCrvfoLwNtSHRvHAgP6L+KDVLitdDMTNRpA7xJEkh6sIfRjczDeGIhNksdzFfSQzGJ
	 O1vwwpDmzpZFg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Ning Sun <ning.sun@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	tboot-devel@lists.sourceforge.net,
	x86@kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 46/47] x86/boot/tboot: Move CPUHP_AP_X86_TBOOT_DYING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:44 +0100
Message-ID: <20261105163045.38862-47-frederic@kernel.org>
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

tboot waits for all previously outgoing CPUs to be in Wait-For-SIPI mode
when the last secondary CPU goes down.

Although the expectation looks strange because the number in
ap_wfs_count should only match tboot->num_in_wfs + 1 at this hotplug
stage, anyway the CPU can run this wait loop while the other online CPU
is running concurrently.

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 82943ec3ba28..995b235da733 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_TICK_DYING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_X86_TBOOT_DYING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_TICK_DYING);
+	WARN_ON(st->state != CPUHP_AP_X86_TBOOT_DYING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

