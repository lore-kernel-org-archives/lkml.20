Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896343;
	b=V6Pph30iKaaxQWgJPEHEYiRs3SND+bPn6ow3aEtc5yPJ4l/6D4heP+Qnj1O7H9HREUtz
	 I7RubO/WicvWgYUzp6rOlK8n3lJONCeQ9X2uKF2AHePEZ47496cKszwVkFfnBav4bTlOI
	 MhFS+f5Xjc5Abv1+NnhQZwsCTtuygQ4mGKnuuR/dRaXpu/i41mPiaIFkOoTWT8YbJGLOe
	 QO3HTiAwaI4rwSXLSjoV1cAwJGaOEax7cwKNVSNskPdeJ6osq5g/vHJLA0hN8/GDZVAGy
	 88gan6+5S5g66v7FMZ5OqT/OEdVLh8kwceItvyXh5TuETTkA5HD4hbjo8lq8ANmJooQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896343;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=tXXo53fMoAv9ArU0UJIQnmlggvFijz+IsVNz2/Uo7rg=;
	b=JsvP7NsO5OI0eOagUElVbA7/ELZMj9E3YRVuQqNlLYeEZZipL+zy0nrLaQ8rx7+jfrdH
	 5sISyagdzpidXwp7xoV7Fmelao8e0SrLEnM/ozZ73lmCEFAlPZBU9I3jyCFQPgDHA0MgF
	 Jnjf1DtUVMf8xPtWw0YCNtFIcueUzvPBBJf+zxr877IFIU3uYB+jyRLZ557aua8gqJz8v
	 3dq0pyGyEjKKn47S/78YqtUU11uZiSsxk5ICpzF3ffTubxh9I8byK1WTlNwxu4i8h94cV
	 Z8dbYBB8prZ4Zi04vzH1DtE2Txo5OfI4JBy2qCvH+oSgBjfcUqo3iEeHHa3Cxcvj21g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="I/HS+L8O";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6771606B3C5;
	Thu,  5 Nov 2026 16:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I/HS+L8O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 587071F000C1;
	Thu,  5 Nov 2026 16:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896342;
	bh=tXXo53fMoAv9ArU0UJIQnmlggvFijz+IsVNz2/Uo7rg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I/HS+L8ObJu/swOkvWfPEFiUe5hnsfwSlohdD346fvUP6gfPmzKAhD2ymKnT+SpUa
	 hfLaK5CYuda6G8v/ULfu0Utdjl7GeCi0/mhQlA9D9nnNPxV9a/97HOCfe1NINm2cMN
	 0lfJU9/Ao7Qe8VmzvsiaL23M138Ud8lnE5z5mKwiQ9ZxeiHKzG5w/wlcNwkDiyNHB3
	 KxSQwJ7FR30j8ZeYyLLt2ApXLjdJp1PCzLUUSM/VyekAIlB9fmbYfYw3+T+OYLcUAK
	 JPKEq93iRrfe91CC4t3QJ4Hj7DxwDlceChT49FNkfJDplDr3qh2b/K7dbJ8kgWpJLM
	 A8HAQXIMTUNTA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 28/47] clocksource/drivers/qcom: Move CPUHP_AP_QCOM_TIMER_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:26 +0100
Message-ID: <20261105163045.38862-29-frederic@kernel.org>
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
index d7a6dcb14885..fc29c33a03e1 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARM_TWD_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_QCOM_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_ARM_TWD_STARTING);
+	WARN_ON(st->state != CPUHP_AP_QCOM_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

