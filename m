Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896287;
	b=bO/JfdxbXDtfaVxIVB09rcQKre2eOx/tHND6UsikhWoPDx0G9E9QIm5TIQHLjVyAbjgo
	 A8yIIIyEfqDjgAkaOhj2jNkltfO4OWF6cHApWTVbs7CGMIPVQNCvcjE2xPa5VfhnKWpFb
	 y4FzLtistmkoX9xADcGbTbLrGzCyVJPYUkes4P6qLrOeUK5JznUBObtxfp7Y/igaXa5Nb
	 p7UGRuuf+rVxP7hkWFP/QQhrUo0maIljg6jUUc3hJJzWSLUXCWQ34gFDgJCFFGMoy6a7F
	 Lb+0hoc50eGPdapDyba4x5KB5jsAcrQHmtg6Cca66EzzCweYL9sDEUKjCBNFVzGLWmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896287;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=mVtsMj5XEE3qubwQwtrQRFRXFyxzTG5U474iN8S5YJI=;
	b=Nhnxhbjo6RzEXaH+x81OU+7pnXUoSya/ZaPIZt4m9FwoF5YJjBJQglcgzpe8riGP13lZ
	 OmjMl4dmWFLVlND69dubWCMTnTVkk6Qe2cU3izg+j24vhgQ/rT+kV68OaBYuL4psRDcRJ
	 gSurcRRGXID1zdzOkmPI9nf7958hSAI/S8WVzYsTYeh/aw/JmdIIQOFamHltMn07QZbQx
	 goZ3ghUxrPwqzBRYydTyJOIyYic8+C2aNpfCf5TfpQxchua3daeQ3Wd+iCBnbLgJ2EnnL
	 jtkQIuJenfyWuGELlmqRtL7SIDll/mw6D8Llwln4jWna2aAMM8z1F8QYMx3ZltgHfLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NUGZkj3Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145FE60A3837
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NUGZkj3Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800F91F000C1;
	Thu,  5 Nov 2026 16:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896286;
	bh=mVtsMj5XEE3qubwQwtrQRFRXFyxzTG5U474iN8S5YJI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NUGZkj3QOorZcYf4QiyUrm1qGZRt26hv8cVeCv9oi1ontFiySJnJh35uZ04iiIbOP
	 ioYa+cS6yELNPiks7N5Bu4b7mH/EZ6mckFjk7Ninh6vy49wSvWa6b1Qi61llT/jWtD
	 QzE1/HHwU9yPQXlbltE2adxnxxAY3nfunuqn16tMBvSPN+wTRF0i6zThKd3ItPU7MJ
	 FTCa2qv3KUvMvA2icVpX2TqGKXW8tWKfVYv57xUnx19hDBbc+o3/JkwGc0MEz4uoSe
	 aC4VYlcSsPN/xdSA/zMBWsXhwfIvjzSWtywOvRYQlXNm2l/f4hmzlGuMlWoJWGXmei
	 B85rJqDQiFHkQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Radu Rendec <radu@rendec.net>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 11/47] irqchip/aslint-sswi: Move CPUHP_AP_IRQ_ACLINT_SSWI_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:09 +0100
Message-ID: <20261105163045.38862-12-frederic@kernel.org>
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

The callback here simply disables the IPI in the per-CPU region, which
nobody should touch concurrently because all other CPUs see the current
one as offline at this stage. It also disables the per-CPU IRQ, which is
internally protected by the IRQ desc lock. Therefore it can safely run
concurrently with other CPUs.

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index c7794716bca6..c86570b13fed 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_ACLINT_SSWI_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING);
+	WARN_ON(st->state != CPUHP_AP_IRQ_ACLINT_SSWI_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

