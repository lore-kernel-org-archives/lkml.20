Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C388145A1F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789872364; cv=none; b=f3H6axDA1a/RHDYAIThPEX8HxcPTDxFdtdzm49G0pgpP9567moz/q41AK29I9CzIQD4kEqQJ0aaiR0ZD58f1eX908g/whJtzPde2LLLe/yGFewKMfQZLCq8gsQDsCpsoIG32/Zansu7Lkb7brp+IvwOiIPCnf+6XHmS14IoWDpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789872364; c=relaxed/simple;
	bh=PKik7t6gtAUJu9fPdS9cTxYBU5Q1vGuSqoz4IgWVPIg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VPybH+okJBhsdlXKTtC4JLWJMSQYAUfIKzWEia44H/3IzAGnOW3DPr0Ul18T1HUcTCnuxaGZ9RssBRTvG+KRHi624HbVSZ28BlS+Sw7N90lo9YfvLB/Fw94kZN8vUXXvQcuctpZrOySv2/yI5AvF4M5uCfw7gTdV7xFrkxrBMSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cd+rsCNX; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cd+rsCNX"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so1628207a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 19:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789872362; x=1790477162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X5tzKgBqsXWjkHl6zAcCKVutWz11bLsFdoRDD5JKFIg=;
        b=cd+rsCNX6Ih4deuZ1BNyMIDplMwsKMARw7PfSRFixqRJOnXAFIC619J3NTIOcjO4oG
         2syDSrE7PUQFqnmT+2n2ApXlVbwc3mAoPEwKaV5G/HFN/0b2+LpmXvX5O+G9blgCY/A5
         Qnt2Lv5nUadLLeWhXmeD9RZne4uBHKixOrroqZrmOLzDZ4sROzaMTHFBQwYlz3+TkWbz
         0cTQI3ITmDYzfHT6yYYXNqhug5k5qIY+mtQxB/01jTOhvAh29OwYlTXWhwW7hJHhgqsC
         bvbvzGLVvWYEhWHgohxUpggt5H8KH96mMeDDPd9K4JWyYz8eJIZ6vQbdY+wdiLmKkfjL
         zvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789872362; x=1790477162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X5tzKgBqsXWjkHl6zAcCKVutWz11bLsFdoRDD5JKFIg=;
        b=TwOD1AFtnDrXSvsHxFdg3rUJ4gAn8m7vaC0qVPjJCIv6Z0nJWzVLxDkyuMDNz/fRXq
         1zzYx+zRkhYo3ISJ2mlaJFdJg97pj6X0Sc0zxd3yDAd7ekU4QUDWBgWC3f63MRTwfm77
         To9AJVlig4rxfAWcY55ojIGDUdCsu6MvueQ78tSthBVqOp/UY+PTt2rauZIRKa3OTOcc
         qlCkVMi42+L+9Qju0GznenV4Yaow1fcxAoFzTTSN8ktDhH/KEOzsbIvsZim6bnMLJyyT
         xhpgRMi2crgCG06+p4BQ3o2nLgwSuUNFZaMCKNtZ2osWaNBqek0ahDgGcLusffc/q/Wo
         wAjg==
X-Gm-Message-State: AFuF++kbTSsdf1CWj+Gnu4zUruHp4HZKclsdnaCBcQRQ9VMgChEQqb/p
	95SZw1lYQpN3iizhZ87ANsKbpwscZZuYvvhy3HeTeMM7U/uQ0ChdsLs2
X-Gm-Gg: AYBFou1GZ3n4IdHAjT+3/wur9gyILsLvG5ue5WGNnzYYhTngoJTA9Iof0wW0y9MNBfZ
	sSps98ZtHHKc11hcT8sKjlvu124fHeqHXeSfq5QY2u/sIt1nOQiq1UIAkK2HiElUrNrf/6605Ty
	0JLKhgVOkTJokWfKDxNNHX2KfIrszuH5QFVNmXRiEvZfnE+9H1+EWLgabfuCE4oRQ3xVWF21fog
	l/FwF0o7C1mG+KPB98TfvO8A7H+RtMaSUvXv9xDrfBFKUugmRBz5Cjeon9RliVm99B/7mPTvuXP
	8RNDj1/TwO+RMATBP1FyoZdobwqzsUKp6/5qUwzdAXjSttlnswZaFEt5k1H6cd9vkOQjTjDcKxw
	PyOyvaqAQxpoSh4HBtyyHSDlgq9/09/V7+VqYUf8lGABSIVXntS96jn07u7nV/Ve1RbidoRa4Ot
	o0oKOC0ebAVVRlIwemaPc7fTcvHb5douZyT3ACCejTggDQSRZNfftJK+G3xE2hZQGrec+NOQZJS
	8I4ze7Fvzv7i12Wxw==
X-Received: by 2002:a05:6a21:e8b:b0:3d3:ae40:51e3 with SMTP id adf61e73a8af0-3dd8c53b507mr10728091637.23.1789872362274;
        Sat, 19 Sep 2026 19:46:02 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72ae71fe3sm1485971a12.8.2026.09.19.19.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 19:46:01 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: tj@kernel.org,
	jiangshanlai@gmail.com
Cc: linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH] workqueue: Drop redundant rcu_read_lock() from dump functions
Date: Sun, 20 Sep 2026 10:45:50 +0800
Message-ID: <20260920024550.2278408-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

show_all_workqueues() and show_cpu_pools_busy_workers() are called
from contexts that already provide RCU read-side protection.

show_all_workqueues() is called from wq_watchdog_timer_fn(), which
runs in softirq context, and from sysrq_handle_showstate() through
__handle_sysrq(), which holds rcu_read_lock().

show_cpu_pools_busy_workers() is called from wq_watchdog_timer_fn()
as well.

Drop the redundant RCU read-side locking from both functions.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/workqueue.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 3c034cbc5bb3..266c3549df0f 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -6711,8 +6711,6 @@ void show_all_workqueues(void)
 	struct worker_pool *pool;
 	int pi;
 
-	rcu_read_lock();
-
 	pr_info("Showing busy workqueues and worker pools:\n");
 
 	list_for_each_entry_rcu(wq, &workqueues, list)
@@ -6720,8 +6718,6 @@ void show_all_workqueues(void)
 
 	for_each_pool(pool, pi)
 		show_one_worker_pool(pool);
-
-	rcu_read_unlock();
 }
 
 /**
@@ -7883,15 +7879,11 @@ static void show_cpu_pools_busy_workers(void)
 
 	pr_info("Showing backtraces of busy workers in stalled worker pools:\n");
 
-	rcu_read_lock();
-
 	for_each_pool(pool, pi) {
 		if (pool->cpu_stall)
 			show_cpu_pool_busy_workers(pool);
 
 	}
-
-	rcu_read_unlock();
 }
 
 /*
-- 
2.43.0

