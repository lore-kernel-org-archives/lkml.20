Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B714F68A4;
	Mon, 19 Oct 2026 13:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415426; cv=none; b=b9yJfsv8R1WnM9hsK/PEfMusJGpXqT/zW3NtaVh5TWUNk4A65H7toVY6Av//3TTafuSxgipFcL8XN9kgWYC4ng65E+fPMKYp2IR2nbJz23AmPUzC+kI5FPvTN1753R/FWzxuSEi7jqL4E6ZTQgIahkoF9j9WzGGcbeLdi9U7bOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415426; c=relaxed/simple;
	bh=6wjPecFOYgbfniQRz9KJ0Qq/PrKRtzqKxanlTh49Nxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c/iTzy8bANnfS04iGbfblEt1VAHXt+74bhvhnia/flKLyI/d6ip91ODLmZuhFucVYBNKC+LWLVe1ydJGKCdViHBVtA0pVT4bved8d6d1Vz+YEeZ0NFuanHxZUTsdhw+JHqGt/s4ufG+9bL80et4PqP/sr4jNp8RHykRwWiZttdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wc/7iJYr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wc/7iJYr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B921F000C4;
	Mon, 19 Oct 2026 13:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415425;
	bh=bknp2wfAkS2dNeolascWv95/7LUnc3K7PUmC5V2GAoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Wc/7iJYrGG72BcnCJdIMDOU/NOvvFp7cYg12KDvfReURrWLvG8Bdm+pftywwvGogU
	 Fd+RmR6l9tuKF0Ahy+InjzUywHL1CGLIEsmcvF+qS8ivxVD2fdnthYQ6v1lPJZREuJ
	 Khqg/6WZVascXlShUpUcVJ0aNwxuQSxBR8SJ1681gv4kmZkYX+LUH66KrgGCZJgewf
	 GBle/GCODv9BiXBYG78NNHe4OcyHR1My4s0Z36wsTeeLqepRfrqfgh1ybIMwRE1NxU
	 t3x12jyNB9fa76K+ZpDXF/QH2VIhmVOB+jAMHIzCzDH+UJVUbDX/Tut6SiwfL340qt
	 9Eqz20KB74ZTQ==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH 28/49] clocksource/drivers/qcom: Move CPUHP_AP_QCOM_TIMER_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:35 +0200
Message-ID: <20261019130856.49711-29-frederic@kernel.org>
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

The teardown callback here simply performs IRQ disablement, which can
run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 1a98d05c7f55..ba90e385d31f 100644
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

