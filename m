Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF00311C32
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 08:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788598221; cv=none; b=qj2gmCVf/HD5Lr3upqPmQsuHzTWRFiP4sS3/f6jkhwn4l8JdLDrWMxNmhpj0GjA/EpyCUii7kHBQw+FAK7s6ghC6YQ4SEx0nWr/qXKqVUSh3lnTLLz9YeeSNFQVMfamFjXA39wmwMEh92OEY21LlT/YYMDi33xVbfXDxWZ+7dWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788598221; c=relaxed/simple;
	bh=UamnaCiFCuL8dQ5tud7OMamejIVBv3CArWO/lHvmxZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HZ1XYS7EO6ZQrUnVZ1s/5mGhqSYHH0udnug5zvwuhveqm4J+CYkX8aUQrHGX2mpC8HbRJyO4gYhFeump24BHPEdU2jodceibF1j7HLuWH8jz7MvLrE05XYJsjCAMnn1FFJuu8V8Vsn/HO7LYOlvEC23Z/kgX6y/m/+2/Tia4Cvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3CvXYfP; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3CvXYfP"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2db18e5cb56so15094175ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 01:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788598214; x=1789203014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tv9XV+nVKZ7VK7O3UquLUzncJ434G9d9+lSSoPTL0vA=;
        b=h3CvXYfP9S808AKwNdlaNuNWJAGFzc6rPUXqBc8vOzZ8qqOgsnKybdexs7b7hqFYa/
         c1lgcVmkndIHhpxz93605zpkqDkx4FJXIfulkbxuaBrHrWTbNQvbjsJddrMo/FJiS0B2
         n277gKjf8NiUt31yEAvdKxyL0xgb4Tb8kfSn7Kz6d6wiVfEwzwkX0rBWgEFlmViNW+37
         7YdRuxfvqjdON0C6RiA9FB3uu19jN9kZyj68dCpCWYtFXATI6LM5a3XnPvYpU/fdlL1C
         pyDenU5TlTBHWz4SA/xnZVTCXP/3Assn0FAW2AHfFRDmlrOpQL4XSXYpTN98fYDJFbHV
         fzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788598214; x=1789203014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tv9XV+nVKZ7VK7O3UquLUzncJ434G9d9+lSSoPTL0vA=;
        b=ekR+WtYA/Omq4CM5xnFMuTW8F7SlJphOebPo6voPvFfpirvDK3avoIZ+W2mBzvLyJ/
         48AAcEoy4gh+VsvE5sG30LAawtTFs/t6NibRQaEsmXAFKK4BvCLgTuClMsBGR4Cwa/n6
         uie0ppG0xv6zxkirMvrcqvK7bl6tr6ufCFpJfnf1rYskRDoF4Ytt5nCCESR5Y9uBZWjJ
         LOubDyqQ7jbQD05GKaBBeLAULXTdKIt3qhkzRWTQ2DcMiOpiP0xG9TWVaN9liGWTLrxv
         3zvdljA54ndxbWsC4xj8qEVFQgOyWiDVbOP0dq2B+rqcvhaGcxrw9rYMTifisjX5Zwv3
         jswA==
X-Forwarded-Encrypted: i=1; AKwUvBwXIzDIAEzDTrI5OpHwA4MnmL0+cDgQASeCanE6YQI0U8hXDphMcbWdkkMOmXJPbwNGCFOAq1fRjy3+h+w=@vger.kernel.org
X-Gm-Message-State: AFuF++kM7pPVinkb8B6fQ4uHaMHauJLzsIvMn4UbrahuXGDMvF5uS9Ac
	IFyOBYW9UxfgTDMBGnAJHmo6l5ecowFeh3XG6fcv6ym7/4atcoOIy0Mg
X-Gm-Gg: AYBFou3v9dgT/raM9pmzQZCu1YVNj04eehOkeCuLEubYe8Kt30CVTzOTbQ8fkshrLqj
	W6QZBv8APbXr2eOOh1+C0Dip1O9tUJeAY+SAyjj3ItWxujqEkctZJaTzqMJW5JjfFnXfZZW2Zg9
	R1nzle7dXcAMVEIuT2XI9XyK+A/WaiqQ1XANSmtve9NZd3tSXvf5kLAWY03KbNNIk+xwkLKmzeV
	aDTVO4IB0Thamw/ALTTOTbJa/lRxVETn79jC+pbHLgn044YFGJwxN/ZBPpjqEhBQ+w0b4F4Q9w9
	n/8sTFRCZe+IJOXOz0YDqqyB5F5qrF8C0wPF95OaR6GvuLFQAfRlj+l8jiHSU0CklrNMHzG33uT
	Yf4AxrgBPtNTAoilhhGdOA9qLrKbGJGf8WANQRUVA54T8bILa/yDZR2NOZ4JQRe636pl8MQd594
	epzj4tBTcf95ieZuyHv0uR5QmE+2D4iqUBYxHhNm6q+Meqemrf9irgChyXxwZ2Q6DAr1ott0oP
X-Received: by 2002:a17:902:f549:b0:2db:1f50:6515 with SMTP id d9443c01a7336-2db1f506689mr92875435ad.2.1788598213665;
        Sat, 05 Sep 2026 01:50:13 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149c15besm20099625ad.61.2026.09.05.01.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 01:50:13 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: mingo@redhat.com,
	peterz@infradead.org
Cc: juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	yu.c.chen@intel.com,
	mgorman@suse.de,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH v2 RESEND] sched/debug: Validate writes to the scan_size_mb debugfs knob
Date: Sat,  5 Sep 2026 16:50:05 +0800
Message-ID: <20260905085005.1290752-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scan_size_mb ends up as a divisor and debugfs_create_u32() stores whatever
is written, so two values panic the kernel.

Zero, through MAX_SCAN_WINDOW / scan_size in task_scan_min():

  # echo 0 > /sys/kernel/debug/sched/numa_balancing/scan_size_mb

  Oops: divide error: 0000 [#1] SMP PTI
  RIP: 0010:task_scan_max+0x30/0x1a0
  RAX: 0000000000000a00 RCX: 0000000000000000
  Call Trace:
   init_numa_balancing+0xe0/0x200
   __sched_fork+0x13b/0x180
   sched_fork+0x12/0x1d0
   copy_process+0xdea/0x2370
   kernel_clone+0xd6/0x4a0

task_scan_min() is inlined into task_scan_max() there. It takes a CLONE_VM
child rather than a fork, since init_numa_balancing() returns before that
call for a new address space.

And a multiple of 2^24 with 4K pages: MB_TO_PAGES() shifts an unsigned int,
so it wraps to zero and task_nr_scan_windows() divides by that.

  # echo 16777216 > /sys/kernel/debug/sched/numa_balancing/scan_size_mb
  RIP: 0010:task_nr_scan_windows.isra.0+0x5c/0x70

The sysctl this knob replaced enforced the lower bound with
.extra1 = SYSCTL_ONE. The move to debugfs kept validation for
tunable_scaling, which got sched_scaling_fops, but scan_size_mb became a
plain u32 and lost it. The upper bound was never enforced.

Reject both the way sched_scaling_fops does. scan_size_mb is documented in
Documentation/scheduler/sched-debug.rst, so -EINVAL is better than storing
a value that panics on the next clone. Hex input keeps working, as
simple_attr_write_xsigned() allowed.

Verified in a 2-node qemu guest: both writes panic v7.2-rc6 at the RIPs
above; with this patch 0, 2^24 and 3*2^24 get -EINVAL and 512 still takes
effect.

Fixes: 8a99b6833c88 ("sched: Move SCHED_DEBUG sysctl to debugfs")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Reviewed-by: Chen Yu <yu.c.chen@intel.com>
---
No changes since v2.  Both writes still panic v7.3-rc, and the knob is
still a plain debugfs_create_u32() in mainline and in tip/sched/core.

v2: https://lore.kernel.org/all/20260810142050.3828587-1-zhanxusheng@xiaomi.com/
v1: https://lore.kernel.org/lkml/20260810081829.3149958-1-zhanxusheng@xiaomi.com/

 kernel/sched/debug.c | 51 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 72236db67983..68600b76a3fd 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -210,6 +210,55 @@ static const struct file_operations sched_scaling_fops = {
 	.release	= single_release,
 };
 
+#ifdef CONFIG_NUMA_BALANCING
+/*
+ * task_scan_min() divides MAX_SCAN_WINDOW by this, and
+ * task_nr_scan_windows() divides by MB_TO_PAGES() of it.  Zero breaks the
+ * first; a value that overflows the 32-bit shift in MB_TO_PAGES() wraps to
+ * zero and breaks the second.
+ */
+#define NUMA_SCAN_SIZE_MB_MAX	(UINT_MAX >> (20 - PAGE_SHIFT))
+
+static ssize_t sched_numa_scan_size_write(struct file *filp,
+					  const char __user *ubuf,
+					  size_t cnt, loff_t *ppos)
+{
+	unsigned int mb;
+	int ret;
+
+	ret = kstrtouint_from_user(ubuf, cnt, 0, &mb);
+	if (ret)
+		return ret;
+
+	if (!mb || mb > NUMA_SCAN_SIZE_MB_MAX)
+		return -EINVAL;
+
+	sysctl_numa_balancing_scan_size = mb;
+
+	*ppos += cnt;
+	return cnt;
+}
+
+static int sched_numa_scan_size_show(struct seq_file *m, void *v)
+{
+	seq_printf(m, "%u\n", sysctl_numa_balancing_scan_size);
+	return 0;
+}
+
+static int sched_numa_scan_size_open(struct inode *inode, struct file *filp)
+{
+	return single_open(filp, sched_numa_scan_size_show, NULL);
+}
+
+static const struct file_operations sched_numa_scan_size_fops = {
+	.open		= sched_numa_scan_size_open,
+	.write		= sched_numa_scan_size_write,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+#endif /* CONFIG_NUMA_BALANCING */
+
 #ifdef CONFIG_SCHED_CACHE
 static ssize_t
 sched_cache_enable_write(struct file *filp, const char __user *ubuf,
@@ -740,7 +789,7 @@ static __init int sched_init_debug(void)
 	debugfs_create_u32("scan_delay_ms", 0644, numa, &sysctl_numa_balancing_scan_delay);
 	debugfs_create_u32("scan_period_min_ms", 0644, numa, &sysctl_numa_balancing_scan_period_min);
 	debugfs_create_u32("scan_period_max_ms", 0644, numa, &sysctl_numa_balancing_scan_period_max);
-	debugfs_create_u32("scan_size_mb", 0644, numa, &sysctl_numa_balancing_scan_size);
+	debugfs_create_file("scan_size_mb", 0644, numa, NULL, &sched_numa_scan_size_fops);
 	debugfs_create_u32("hot_threshold_ms", 0644, numa, &sysctl_numa_balancing_hot_threshold);
 #endif /* CONFIG_NUMA_BALANCING */
 

base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c
-- 
2.43.0

