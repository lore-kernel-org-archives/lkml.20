Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE4A425888
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378511; cv=none; b=IHZdCOJwi8YBVD37NxECX2uTSgFvywCn3x7eZ9iXymgZW7ntAJjJ1XXIyvlYt31rl6BZPx8TxofX7Eyy3AUUM279dQVyqwClIeIUaMSTYJW2KAV65yREFYJwtEXp5qXQKpfkVl9gTHaLLhs6zX6C/0F0VDBSCJ6BVxAO7+inZ4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378511; c=relaxed/simple;
	bh=AaTPGmc07kKC+uF/wcEqFJK98KQDzZQ5+h3ErmNQP5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ldazXdztmN4u8+R5Pvny2vca9bXDQUFxXTC25s4CQS+r3O5TyNBfjM6y0tBAYUHozXXv3371uYR5lfaoGgbHUEKiA2Aewngn4ig1ViXBspA3oVgS6YvqCucOUf8H1KaJ/Wcp+huwDTsEinP9UWDsDHK/SKiyfQI2CHyVST8pG8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oJCGjk9P; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oJCGjk9P"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed6d6eso11220065ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789378507; x=1789983307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jIXoOdHN0FbScEAQfYR8vM5M5/92HY0s7q+t9tEs9HY=;
        b=oJCGjk9PuFMtOSzELL28Qv8UjnKoPmJ3oVuAb7CZamkYCaE4ttvR4rqZbf9NRudRYw
         PwaX0ihqcBarSXZL4Bw4G13YbE4Jp+KXXkRTFju+hlfBlMizcGdR50+C5uDts3wLIPcv
         VODvH8RMD1ir0glqgxMtbYXYK5muodTmZsjrRgBWs+1/i53cebVmSmQkC2cNlo3M4DBA
         MJo4ycQC2Ze9CY5VJqg6QRK/GPyLToLhxYesJJwefiNQ3mCYIpcPS6KyKXJzx2+V6lGK
         amk5QzTZRTvDXDXTYhMT7wTX2W7o/SqdRR+rsH3fPzxTZs3u7zEVy+DcC8ELx5N2A9Pe
         wi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378507; x=1789983307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jIXoOdHN0FbScEAQfYR8vM5M5/92HY0s7q+t9tEs9HY=;
        b=WmtJF3S/EjbzN3kolHF8sCD9KNTy2h9DA4Dyw6eJFtOVqDxqh+Hjj2EKj7IcnHQuqj
         m3bYaxbXcgviOw4l1Zt42DTvrJe8YT6Wu3HWxSbtKTtQOOZaTX41rbv9YFosAwuDKdo5
         26wrshzv3JyNCP7nCwNSHg37jcV2UPsDcJT767ngtyNTTdC3gT2Oy6B6xnqMnlriJVq6
         quWRpqYJBG/y7IBLLMbs6YHpoLU5rD73qJG5mZzDut6zgWcSaNrtZYgqwATmuGMfGjhz
         LSYk+JrQiHVJKVnK9uveYCexD9bBVpnrsDXLE7TngtRfn5LMUdJdAPAvZgqkV33OsrD0
         gunA==
X-Forwarded-Encrypted: i=1; AKwUvByz/3F9ofYn7EUI4JuYup2quTROfdQWlVMIwuIJYhRs74Gw1QUrlRKLLCcSqOQG195y4cKAGbnsmwjIE0s=@vger.kernel.org
X-Gm-Message-State: AFuF++nMN3g0BsmGQ261WQanX6iy0rPYqypOfCMnIWpqe+glf30N637N
	gJn9Mwt0TjzFJYb6SS1b+NLbnE6eG3ZKxpFEm+qDRk0RENqap+nmSceA
X-Gm-Gg: AYBFou20rNGFQKlx1B0FaYGFgze98Sc1wL0zAGoThUMmbvQX6Y8jjsYcvVCOuQ63efJ
	YmbAo44/jV9w1e477vvPYXq6lccTi2MBcG9SUYHRfSzfLnNU7kkT6nW3a7v2wZWd7Wx7h/McVq6
	n7n30vxICZd5ZVDMw77wouFloBrgRitR79sRZJeEfXbKelR2S9E14x/NbjcJqUI5AyZ3TIGAM3U
	VtaLQEzmse2etTNl2/Gd6YzqB0+LtKuJYoFSzrjX6Myk2Xccerp/y3zNr0U2EXWYhJTcdmFEkm1
	BQpYg14UBDNNAL6jptpw6irI8Yka0WJORtuMvvhkmkc9vjFfU/QlQDZraRXBH2o4JeKA7wdgiii
	aY1L3jD6b/nSgnTimpxZNNyHsbHkc5tq8pbIxajzYOfLrJ1nimU6hwwEWS3lw4SzczDBH4RDM48
	R9mYV2uZwpww9zjs4xW0YZasVL4MFI1UtCp7lCwqL/1DkWsktD8Z1n2/2TYzzpzoBcCTPH0OTBa
	YM8/aoRPF8a4oMaIw==
X-Received: by 2002:a17:903:244d:b0:2d9:438e:b70d with SMTP id d9443c01a7336-2dd6c5c1352mr38430615ad.1.1789378507308;
        Mon, 14 Sep 2026 02:35:07 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc2d3bsm46109865ad.48.2026.09.14.02.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:35:06 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: jiangshanlai@gmail.com,
	paulmck@kernel.org
Cc: josh@joshtriplett.org,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>
Subject: [PATCH 5/5] rcutorture: Add atomic SRCU cross-CPU IRQ context mismatch test
Date: Mon, 14 Sep 2026 17:34:19 +0800
Message-ID: <20260914093419.1474829-6-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914093419.1474829-1-kunwu.chan@gmail.com>
References: <20260914093419.1474829-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add testtype 7 to verify that lockdep detects an IRQ-context
mismatch when an atomic SRCU read-side critical section is held
with IRQs enabled on one CPU and synchronize_srcu_atomic() is
called from an IPI handler on another CPU.

This covers the cross-CPU case that cannot be detected by
checking the current task's held locks.

Co-developed-by: Zqiang <qiang.zhang@linux.dev>
Signed-off-by: Zqiang <qiang.zhang@linux.dev>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/rcutorture.c                       | 27 +++++++++++++-
 .../selftests/rcutorture/bin/srcu_lockdep.sh  | 36 +++++++++++++++++++
 2 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index ac9c726cb391..6f5a1d635f94 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -4695,6 +4695,8 @@ DEFINE_STATIC_SRCU_ATOMIC(srcu7_atomic);
 DEFINE_STATIC_SRCU_ATOMIC(srcu8_atomic);
 DEFINE_STATIC_SRCU_ATOMIC(srcu9_atomic);
 
+DEFINE_STATIC_SRCU_ATOMIC(srcu_irq);
+
 static int srcu_lockdep_next(const char *f, const char *fl, const char *fs, const char *fu, int i,
 			     int cyclelen, int deadlock)
 {
@@ -4709,6 +4711,11 @@ static int srcu_lockdep_next(const char *f, const char *fl, const char *fs, cons
 	return j;
 }
 
+static void srcu_sync_irq(void *unused)
+{
+	synchronize_srcu_atomic(&srcu_irq);
+}
+
 // Test lockdep on SRCU-based deadlock scenarios.
 static void rcu_torture_init_srcu_lockdep(void)
 {
@@ -4892,13 +4899,31 @@ static void rcu_torture_init_srcu_lockdep(void)
 		return;
 	}
 
+	if (testtype == 7) {
+		int cpu;
+
+		for (i = 0; i < cyclelen; i++) {
+			idx = srcu_read_lock_atomic(&srcu_irq);
+			cpu = cpumask_any_but(cpu_online_mask,
+					      smp_processor_id());
+			if (cpu < nr_cpu_ids) {
+				pr_info("%s: CPU%d sending IPI to CPU%d\n",
+					__func__, smp_processor_id(), cpu);
+				smp_call_function_single(cpu, srcu_sync_irq,
+					NULL, 1);
+			}
+			srcu_read_unlock_atomic(&srcu_irq, idx);
+		}
+		return;
+	}
+
 err_out:
 	pr_info("%s: test_srcu_lockdep = %05d does nothing.\n", __func__, test_srcu_lockdep);
 	pr_info("%s: test_srcu_lockdep = DNNL.\n", __func__);
 	pr_info("%s: D: Deadlock if nonzero.\n", __func__);
 	pr_info("%s: NN: Test number, 0=SRCU, 1=SRCU/mutex, 2=SRCU/rwsem, 3=SRCU/Tasks Trace RCU, 4=SRCU_ATOMIC, ",
 		__func__);
-	pr_cont("5=SRCU_ATOMIC/raw_spinlock, 6=synchronize_srcu_atomic inside rcu_read_lock.\n");
+	pr_cont("5=SRCU_ATOMIC/raw_spinlock, 6=synchronize_srcu_atomic inside rcu_read_lock, 7=atomic SRCU cross-CPU IRQ context mismatch.\n");
 	pr_info("%s: L: Cycle length.\n", __func__);
 	if (!IS_ENABLED(CONFIG_TASKS_TRACE_RCU))
 		pr_info("%s: NN=3 disallowed because kernel is built with CONFIG_TASKS_TRACE_RCU=n\n", __func__);
diff --git a/tools/testing/selftests/rcutorture/bin/srcu_lockdep.sh b/tools/testing/selftests/rcutorture/bin/srcu_lockdep.sh
index 3acaffe52c78..c29a39f7d891 100755
--- a/tools/testing/selftests/rcutorture/bin/srcu_lockdep.sh
+++ b/tools/testing/selftests/rcutorture/bin/srcu_lockdep.sh
@@ -115,6 +115,42 @@ do
 	fi
 done
 
+# Verify that synchronize_srcu_atomic() detects IRQ context mismatch
+# when SRCU reader previously ran with IRQs enabled.
+for c in 1 2 3
+do
+	err=
+	val=$((1000+7*10+c))
+	tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 5s \
+		--configs "SRCU-P" \
+		--kconfig "CONFIG_FORCE_NEED_SRCU_NMI_SAFE=y" \
+		--bootargs "rcutorture.test_srcu_lockdep=$val" \
+		--trust-make --datestamp "$ds/$val" > "$T/kvm.sh.out" 2>&1
+	ret=$?
+	mv "$T/kvm.sh.out" "$RCUTORTURE/res/$ds/$val"
+	if ! grep -q '^CONFIG_PROVE_LOCKING=y' .config
+	then
+		echo "rcu_torture_init_srcu_lockdep:Error: CONFIG_PROVE_LOCKING" \
+				"disabled in rcutorture SRCU-P scenario"
+		err=1
+	fi
+	if test "$ret" -eq 0
+	then
+		err=1
+		echo -n Missing lockdep warning for > "$RCUTORTURE/res/$ds/$val/kvm.sh.err"
+	elif ! grep -q "inconsistent {HARDIRQ-ON-R}" "$RCUTORTURE/res/$ds/$val/SRCU-P/console.log"
+	then
+		err=1
+		echo -n Missing lockdep warning for > "$RCUTORTURE/res/$ds/$val/kvm.sh.err"
+	fi
+	if test -n "$err"
+	then
+		grep "rcu_torture_init_srcu_lockdep: test_srcu_lockdep = " "$RCUTORTURE/res/$ds/$val/SRCU-P/console.log" | sed -e 's/^.*rcu_torture_init_srcu_lockdep://' >> "$RCUTORTURE/res/$ds/$val/kvm.sh.err"
+		cat "$RCUTORTURE/res/$ds/$val/kvm.sh.err"
+		nerrs=$((nerrs+1))
+	fi
+done
+
 # Test lockdep-enabled testing of mixed SRCU readers.
 for val in 0x1 0xf
 do
-- 
2.43.0

