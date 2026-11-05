Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896276;
	b=5IQg3tNHtjRQOJdsljXSiWa1dJXyhAkko8yNlELnzayncuz7CYlsset/+DkYuQ4HFau0
	 Wh6XKw7V4mU5GCcMRZaDFEIDnA59A7Ig9k8X4Edp/1xPZqhCRf0+lofEXzJ4BTnB8ydb4
	 LvpK4mm5zOmDQxty9r2dqiwFnmZeUkc8ggWBbHc05swHbcmy1Nnofi2DWVCeaJxA/1HuB
	 F96iVcCtSDFMJTVyfywky29NKKoeBzZ7G3mrQMD0aFM3j7Bp+nMjUck5KSWXAnoFFdLqc
	 JSVIs2oQbp1Xa3nV1oMowjAuoX2TxAqNQXqaXub3zTAH/Ray8SOsPPgJt7VlS5oU2jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896276;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=WUkJ/uQyix+oaAX0W/w8dGkL1c+RWgUGocv4iOBMsfE=;
	b=ndiH/b/b+58RtjMDo0iWTsJFbe83kP8EyEypCtd0qcjEJjL6f255Jnu2PzcfmtRblcOt
	 hqwksGUV7+Y/64DW8bHJK+shYk2xCmjuizc2tZx8qRIpDLEyWPRuhZhH8LpD653U4PPoZ
	 R4s7/HRlKwXJyqdcwLDzp4ptVuhZpA6mDCpP9YPueWiDcOJNNSfpboNZ7BcFFG4KpRyRd
	 2buMQwgjFdXoYSX9NEb+5xgmmOnHjAlfDbiLE0l27RWF/57x1oFcO42wR0AT7hvqoX3zs
	 GsRMSYNdYY5XxWawkK3V2EN2f917kupos6/wdTjyUAWmswl/COeqmMMgaujYRUh9vew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="BVFLYV/5";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434D4606D80D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BVFLYV/5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94D3B1F00919;
	Thu,  5 Nov 2026 16:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896275;
	bh=WUkJ/uQyix+oaAX0W/w8dGkL1c+RWgUGocv4iOBMsfE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BVFLYV/5xpdSR2YRfexITn/DydKF70LjKU++q5lqqF/G9DMhsRr5stOMuLQlIITvU
	 ouFbtqN+g8f2eQ3Str2ulruziZOsDYZ1rWGRq1ddRu3e/lOwfBKPcliDEIW4ASsKz5
	 xzTd4CD1dUd7RRE8wsIGp28RnNRmNCXORVHWglTgB1GIcNgFWioZ/DXsxKbrXRQmiJ
	 85kD8TORkP2M+odDS18MRRo6e67kLMRA8jXzTSlqWQA4eo7b24+TU4C816lTFkuBPx
	 sZxE2TUiLvItX0TWKIVyE1tbteMIcEtdxITcjXdkx/pw34Ie+eOJTAenFkUmtZVaAb
	 PRYS2DufiRDAA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Radu Rendec <radu@rendec.net>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 07/47] irqchip/bcm2836: Move CPUHP_AP_IRQ_BCM2836_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:05 +0100
Message-ID: <20261105163045.38862-8-frederic@kernel.org>
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

The teardown callback here just masks the per-cpu IRQ in the chip and
shouldn't race with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index cb0eb71c27c9..2e162425bfc7 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_ARMADA_XP_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_BCM2836_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_IRQ_ARMADA_XP_STARTING);
+	WARN_ON(st->state != CPUHP_AP_IRQ_BCM2836_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

