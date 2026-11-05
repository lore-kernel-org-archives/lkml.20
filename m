Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.88
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901006;
	b=E/gKo0Fefk0co2AZZft+lIQqXkObt7o0i3Ndl+7tMr/UQfB0A2nu/AVKQ3Gv7gTEWtPN
	 Ez8/aFOYX3aFcWyrQwGsvWjbUJHffVYJ9srDVJFtY5EAItFk+r8ozPAXm05md+0IgTSIo
	 2LCWCGd0wmD9q22WyIBxDHlcOCyhL1Y8MwK0o0oC3q4l7LogxYfpgzrOkMqUZH1uVFb+x
	 Ek0QqE081quhMl0/cF61YTsruYnVjN0fv8e/XmhSfdOB6IurvQL6hoet6rnl7iPS0okvB
	 q2DoS08Mo5mCNeA/UoExwWmIlB+ofz7JT/w8CJMEpGgJyI/s9Rxnd4wO5tUVrnDOU0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901006;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/m8BIPyWHR7QPpRxIdVxi+0o4TtIEMtMDjUbnzWw31E=;
	b=YLwyQwn8B8g8ahxvVRxnuTj65EHuPbvjC6KI7fW8qYY5ZirOnPCsaoNU1bE6TpBsw17z
	 q6SgGf6/7twRlSaY4vtQnBrK+JWnhXmzIgHVXwZM0F/L7rT2tzDwtChfB4GXCABesjJ3H
	 HTUPY7MzphZgdUtAkJdULYlACysuVK44THTEZ5rwjwb025ayDv/wuLVOv6t2Sytk/XfXq
	 n4UhoHUo5NpY33iFruOzjcyg5GqyANMi+F3EP12RUt6uuvJ/l5wZ9ieSBf8yFOiMtDFhB
	 kaDW6J5OoG0k3+DdwIyBY632RSN6HdHhXCZECe5InKxoMNmg05uCbiR3N6aWM2Ev+RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HLxHITNu;
	arc=none smtp.remote-ip=91.218.175.88
Received: from mta0.migadu.com (out-88.mta0.migadu.com [91.218.175.88])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65306606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65306606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HLxHITNu
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=R0MiMKT7oCdmLTMl+nh9doqjYDmVX+Oc6zc31w2j6uU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793901003; v=1; x=1794505803;
 b=HLxHITNu+ehePBhUYKce/mCrYXH0bt/UX8QFniCEY1f3S5zBoVZeDIGbpxxjOVzlopiYfRyU
 5uzF0LsKOoRYFPjLIjse+fg70w7nxit2epGYFxPEvUjK8QMVlwOwDB8sL7jZHr0Gvjl1/Klhuy+
 xPN13k5sTLoqhkAhE1vgUb+w=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 50df8c96363af832;
	Thu, 05 Nov 2026 17:50:03 +0000
X-Mizu-Trace-ID: 50df8c96363af832
X-Migadu-Flow: FLOW_OUT
From: wen.yang@linux.dev
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Nam Cao <namcao@linutronix.de>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wen Yang <wen.yang@linux.dev>
Subject: [PATCH v8 05/14] rv: Add a KUnit test for the storage free path
Date: Fri,  6 Nov 2026 01:49:05 +0800
Message-Id: <a00e4d311cbb9da36a621177f8b2c420bd532c7f.1793900349.git.wen.yang@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1793900349.git.wen.yang@linux.dev>
References: <cover.1793900349.git.wen.yang@linux.dev>
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

From: Wen Yang <wen.yang@linux.dev>

A per-object HA monitor whose timer is armed through a pointer resolved
before da_destroy_storage() outlives the storage and reports against a
gone entity.  Real handlers resolve and use a storage under one
guard(rcu)(), so the fixture issues the two steps separately to reach
that window.

Add rv_test_rvtest_arm_after_destroy() to rv_ha_kunit.c to verify that
the free hook properly disarms the timer before the storage is freed.

Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 kernel/trace/rv/rv_ha_kunit.c | 51 ++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/rv/rv_ha_kunit.c b/kernel/trace/rv/rv_ha_kunit.c
index e8aaee110fae..29ee8a739739 100644
--- a/kernel/trace/rv/rv_ha_kunit.c
+++ b/kernel/trace/rv/rv_ha_kunit.c
@@ -3,12 +3,16 @@
  * KUnit tests for RV hybrid automata (HA) framework
  */
 #include <kunit/test.h>
+#include <linux/atomic.h>
+#include <linux/delay.h>
 #include <linux/rv.h>
 
 #if IS_ENABLED(CONFIG_RV_HA_MONITOR)
 
 #include <rv_trace.h>
 
+static atomic_t rvtest_expired;
+
 /* rvtest: a minimal per-object HA monitor driven directly by the tests. */
 #define MONITOR_NAME rvtest
 #define RV_MON_TYPE RV_MON_PER_OBJ
@@ -19,7 +23,7 @@ typedef void *monitor_target;
 #define trace_rv_retries_error(...)	do { } while (0)
 #define trace_event_rvtest(...)		do { } while (0)
 #define trace_error_rvtest(...)		do { } while (0)
-#define trace_error_env_rvtest(...)	do { } while (0)
+#define trace_error_env_rvtest(...)	atomic_inc(&rvtest_expired)
 
 enum states_rvtest {
 	idle_rvtest,
@@ -134,8 +138,53 @@ static void rv_test_rvtest_underflow(struct kunit *test)
 	rv_this.enabled = 0;
 }
 
+/*
+ * rv_test_rvtest_arm_after_destroy - a storage outlived by its own timer
+ *
+ * da_destroy_storage() cancels the timer, then unlinks:
+ *
+ *	da_monitor_reset_hook()		cancels
+ *	hash_del_rcu()
+ *	call_rcu()
+ *
+ * A reader that resolved the storage before the unlink can arm past that
+ * cancel.  Handlers resolve and use under one guard(rcu)(), so the two steps
+ * are issued separately here.
+ *
+ * The timer is still queued after the destroy, and it fires -- reporting a
+ * violation for an entity that is gone.
+ */
+static void rv_test_rvtest_arm_after_destroy(struct kunit *test)
+{
+	const int id = 4242;
+	struct da_monitor *stale;
+
+	atomic_set(&rvtest_expired, 0);
+	da_monitor_init();
+	rv_this.enabled = 1;
+
+	da_handle_start_run_event(id, NULL, start_rvtest);
+
+	scoped_guard(rcu)			/* resolve before the unlink */
+		stale = da_get_monitor(id, NULL);
+	KUNIT_ASSERT_NOT_NULL(test, stale);
+
+	da_destroy_storage(id);			/* cancel, unlink, call_rcu */
+	ha_start_timer_ns(to_ha_monitor(stale), clk_rvtest,
+			  RVTEST_BUDGET_NS, ha_get_ns());
+
+	rcu_barrier();
+
+	/* A timer the free path missed expires here. */
+	msleep(600);
+	KUNIT_EXPECT_EQ(test, atomic_read(&rvtest_expired), 0);
+	da_monitor_destroy();
+	rv_this.enabled = 0;
+}
+
 static struct kunit_case rv_ha_kunit_cases[] = {
 	KUNIT_CASE(rv_test_rvtest_underflow),
+	KUNIT_CASE(rv_test_rvtest_arm_after_destroy),
 	{}
 };
 
-- 
2.25.1

