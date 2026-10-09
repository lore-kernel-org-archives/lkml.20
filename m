Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695943D9556;
	Fri,  9 Oct 2026 05:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791523538; cv=none; b=gQxxmUbiQ3QmDS6yOEV2qWK7Lww1gikgtnYgqZG/yhj1Pl4B3xi7SCgMKypGV/oo0gux4iNKnq5Ua4MeGNsR3qwH8keZ1rl3oVS0pYVpShbedZcdycCL7rHhvnjO5cXOB8bH1DrAVXHvquAIGhm8q2429Au0/ffkf+UhNt0TbN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791523538; c=relaxed/simple;
	bh=5XFToSMPlXDYnoEpKp92QLokgssjNR++5cJstGj4MNc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qv7HkofATIYlGb7F/MHib4w6M5dVlJJp3NTLrp3/hZescuSqNCU8JMO/osEHgmUiOUOH7nDNzV6hi0lBt3flK0OufEoslwqsY0hgnuIxjBZq8rWfwjq6PtqKvVqHHyl6zBen6ByK8PHYvVKjrBBvNHanWtQVuiWYNMKrdEcOrCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowACnrjzNeshqxfMcCg--.3390S2;
	Fri, 09 Oct 2026 13:25:34 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clocksource/drivers/qcom: Fix error propagation in msm_timer_init()
Date: Fri,  9 Oct 2026 13:25:36 +0800
Message-Id: <20261009052536.3139407-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACnrjzNeshqxfMcCg--.3390S2
X-Coremail-Antispam: 1UD129KBjvJXoWxur4fKFW5Jw4xAFy7tr4kXrb_yoW5Ar15pa
	y3u3sxtryjva12vwsxtFn7JF95W393tFWxGa4Sk343Ar43Ar1qyFWUtFyjqFy7GFZ7Zw12
	qFn5ZF43uFyDAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUySb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWxJVW8Jr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
	0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
	14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20x
	vaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8
	Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07beYLPUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRQPA2rIZLs7SQAAse

msm_timer_init() reuses the res variable for the clocksource_register_hz()
return value in its common exit path. When request_percpu_irq() or
cpuhp_setup_state() fails, res holds a negative error code, but it is
unconditionally overwritten by clocksource_register_hz() before the
function returns. As a successful clocksource registration returns 0, the
failure is reported as success: the percpu IRQ is not registered (or the
hotplug state is not installed) and yet msm_dt_timer_init() believes the
timer is usable. The same happens when alloc_percpu() fails, which also
leaves msm_evt NULL for the hotplug callbacks to dereference.

Return -ENOMEM when alloc_percpu() fails and bail out through a dedicated
error path that frees msm_evt and returns the original error code instead
of falling through to the clocksource registration.

Fixes: ab51189ca485 ("clocksource/drivers/qcom: Convert init function to return error")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/clocksource/timer-qcom.c | 34 +++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/clocksource/timer-qcom.c b/drivers/clocksource/timer-qcom.c
index ddb1debe6a6b..d12c1c3dd6d8 100644
--- a/drivers/clocksource/timer-qcom.c
+++ b/drivers/clocksource/timer-qcom.c
@@ -160,28 +160,28 @@ static int __init msm_timer_init(u32 dgt_hz, int sched_bits, int irq,
 	msm_evt = alloc_percpu(struct clock_event_device);
 	if (!msm_evt) {
 		pr_err("memory allocation failed for clockevents\n");
-		goto err;
+		return -ENOMEM;
 	}
 
-	if (percpu)
+	if (percpu) {
 		res = request_percpu_irq(irq, msm_timer_interrupt,
 					 "gp_timer", msm_evt);
-
-	if (res) {
-		pr_err("request_percpu_irq failed\n");
-	} else {
-		/* Install and invoke hotplug callbacks */
-		res = cpuhp_setup_state(CPUHP_AP_QCOM_TIMER_STARTING,
-					"clockevents/qcom/timer:starting",
-					msm_local_timer_starting_cpu,
-					msm_local_timer_dying_cpu);
 		if (res) {
-			free_percpu_irq(irq, msm_evt);
-			goto err;
+			pr_err("request_percpu_irq failed\n");
+			goto err_free_evt;
 		}
 	}
 
-err:
+	/* Install and invoke hotplug callbacks */
+	res = cpuhp_setup_state(CPUHP_AP_QCOM_TIMER_STARTING,
+				"clockevents/qcom/timer:starting",
+				msm_local_timer_starting_cpu,
+				msm_local_timer_dying_cpu);
+	if (res) {
+		free_percpu_irq(irq, msm_evt);
+		goto err_free_evt;
+	}
+
 	writel_relaxed(TIMER_ENABLE_EN, source_base + TIMER_ENABLE);
 	res = clocksource_register_hz(cs, dgt_hz);
 	if (res)
@@ -190,6 +190,12 @@ static int __init msm_timer_init(u32 dgt_hz, int sched_bits, int irq,
 	msm_delay_timer.freq = dgt_hz;
 	register_current_timer_delay(&msm_delay_timer);
 
+	return res;
+
+err_free_evt:
+	free_percpu(msm_evt);
+	msm_evt = NULL;
+
 	return res;
 }
 
-- 
2.25.1

