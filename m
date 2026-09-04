Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD824A3F09
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531299; cv=none; b=iosmtRlN4eNyaXtmtlyzMYOdXWZYMg7UQTT8KLP+uf814qcpBk1vTfglsaJefWJ3J0L31C61F1pQUJC8fxABYb7xIzYLZhnNXk+Z2raIrqSeQWIXiStiAzThCbNBG7AlN5G1fbNxCdWL1gdK5ZZ84tChYH5ZiQo4hxfdb9ShIdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531299; c=relaxed/simple;
	bh=Vco+tt9wJ74DGFvZbAlxOqlG86N7PGrXSABKBzWaNSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CXC2//KD6o75wSiOvHHpvmH6NsJpveEwO8JXajtd1elXr02FHjnE4PVIj5pFmB/dPTE89E25Bcd7ydU42hcX/VnSo0l6zQzYux/j8kSClh/CDcMs9bxQqgPO1GwyPKSYt5xNDN4cVLiqu0wOY0hnSPMEOt/kxmsytmlsyfA9MwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JvK0KlaS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JvK0KlaS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso8751895e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788531295; x=1789136095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Mr8T4131YI10eAtmcwASZgkYb228WFu6m+uWsWDaTE=;
        b=JvK0KlaSthCWlXx7A+qAueOFP+9LLC90s5Bax3MMv5Rhi+ywFhtV9PJA6pRNCC8QnF
         w50+jqX3nkZKxM2NPWDH5lxSdlQeqZHv3h7CgfvaPkdOfkbVGtJ9NT0Wx9vpFzTgbG+I
         0Aylk4egGwC9ZKGDQ0u3u8ILzS6/qNT46jKmefjbJrn9HxIXZTgA7X97Ytj//R0vDlnT
         D/YLVUd0vb1uDySNQ7W+8GUKtAJCQfWKjeUWNc8XeJFcBneZGBpdZ/1bW+LOh1fyyS0F
         kh7xOlZXyEjc0PX72c+Jwx5m0/YY74PEqPjJpqNLkFSwV+cJH9s03gFiWRIpVh9dektI
         edzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531295; x=1789136095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Mr8T4131YI10eAtmcwASZgkYb228WFu6m+uWsWDaTE=;
        b=AcQ7LhbM9VJ0Wj5dvTs+pGGaeCsY+KAe+OB2ZDuz8l2BSx674XqcRNSLg0bMNqmnjn
         ELETp/ltDX8CYChLB0AUn0bqHuQRq8W46o4nN9lg06Esb3Ujm15NhsAjeBa99o8LbuYn
         xBbcStlW5Hfvy1aL6/fvQwWTpJBTmZrMo4AYcHiM/0qgRdahan2/22z2DEfyfsKjOehP
         0BDe/bHPcVwCcCj73tip35u8KW1iyvS34AYeLB4X452jMZNekbt3MIEOq/VSgeMMkx6u
         Qu1P/aLJ5M45r3bYKs6GIvQxYLWQwt7MWI/H6ZkSyA+eW0/94xinFjLKzyXSp0XpiOXf
         z3mQ==
X-Gm-Message-State: AFuF++kNhqP1F8SfUA4qaLmI/8QpswaOXhmTtNGiEGJgNvtbEE+aa8ck
	xxI/VrVYWq7q/drmhfTQc26bDurpI/LrCOCczfinJKfg9B2qnq/WM/12QEcNDAhwHm6zoaN4nOk
	OAb4XHdk=
X-Gm-Gg: AYBFou1LChbwW2uZpByul9/oOTdSSDUyPylwm27+JLeVFfYm5Ey6OwR4OVCCQJPtVYd
	+ltNlzz3UCkyFEaXfTg6GMt/vGzSYQ2LqSPU1ug20R1XWvwxjByM/TeLIBcgqexzp5stpDwJy3e
	cpkYSCuT8LBN0zgw1xD0OybqphRu1MkDGSL2RYArxS51g9hZED4C+bqkp8c1McC7q2mgB8/Q5hF
	YkTpA+As+Vii2y56DJOPoW9khACVLHlduf8qhePulI5sq0fOn+uMbR4u7qPWFaPEMwUSn8DqZPw
	JiPgL1wEnW2R6KGkKIfZdkMQinN76cUaPPcjXVnZh7Sh/x+APVMa1V2D6T1M9ufVPZ7tDcHYJh9
	iyfNqHasgdjw7byXmMWVeKauqjlx6E2jFBY1SAZvVUYHwd232zK6XUKBEa79M36zUpvk+bgNxXb
	FQ+5nhoUEWAw9ZqceG4FEuRE2kLxZymKwqOtNy2/7K+OUCiYdbv+nQ4ofi469W6fALVgnYxc6Qx
	mANgMQqOxZf3ZcjpwyR3Q==
X-Received: by 2002:a05:600c:a087:b0:49c:f467:7ce0 with SMTP id 5b1f17b1804b1-49cf81dc377mr57263965e9.3.1788531272977;
        Fri, 04 Sep 2026 07:14:32 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf5135353sm84723225e9.2.2026.09.04.07.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:14:32 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Breno Leitao <leitao@debian.org>
Subject: [PATCH v3 1/2] workqueue: Make alloc_workqueue() unbound by default
Date: Fri,  4 Sep 2026 16:14:20 +0200
Message-ID: <20260904141421.287647-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904141421.287647-1-marco.crivellari@suse.com>
References: <20260904141421.287647-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently alloc_workqueue() ensure that one among WQ_PERCPU or WQ_UNBOUND
is present. Now every user has one among these two flags.

In order to achive the future goal of removing WQ_UNBOUND from the code,
start changing the default behavior making alloc_workqueue() act this way:

  - if WQ_PERCPU and WQ_UNBOUND are present: remove WQ_PERCPU (as before)
  - if neither are present: add WQ_UNBOUND

The WARN_ONCE() when neither flags are present has been removed and it has
been replaced by pr_warn_once(): from now on, every alloc_users()
without WQ_PERCPU will be considered unbound.

The pr_warn_once() will be removed along with WQ_UNBOUND in the future.

Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 kernel/workqueue.c | 44 ++++++++++++++++++++++++++++----------------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 1ae3732a2c51..59a43bf1b30d 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -5895,12 +5895,33 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 	struct workqueue_struct *wq;
 	size_t wq_size;
 	int name_len;
+	bool wq_unbound_by_default = false;
+	bool wq_dropped_percpu = false;
 
 	if (flags & WQ_BH) {
 		if (WARN_ON_ONCE(flags & ~__WQ_BH_ALLOWS))
 			return NULL;
 		if (WARN_ON_ONCE(max_active))
 			return NULL;
+		flags |= WQ_PERCPU;
+	}
+
+	/*
+	 * Every caller that doesn't explicitly specify WQ_PERCPU will be
+	 * unbound (WQ_UNBOUND) by default.
+	 *
+	 * If both flags are present at the same time, WQ_PERCPU will be
+	 * removed.
+	 *
+	 * This must happen before wq_size is computed below, since that
+	 * depends on the finalized WQ_UNBOUND flag.
+	 */
+	if (unlikely(!(flags & (WQ_UNBOUND | WQ_PERCPU)))) {
+		flags |= WQ_UNBOUND;
+		wq_unbound_by_default = true;
+	} else if (unlikely((flags & WQ_PERCPU) && (flags & WQ_UNBOUND))) {
+		flags &= ~WQ_PERCPU;
+		wq_dropped_percpu = true;
 	}
 
 	/* see the comment above the definition of WQ_POWER_EFFICIENT */
@@ -5927,22 +5948,13 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 		pr_warn_once("workqueue: name exceeds WQ_NAME_LEN. Truncating to: %s\n",
 			     wq->name);
 
-	/*
-	 * One among WQ_PERCPU and WQ_UNBOUND must be set, but not both.
-	 * - If neither is set, default to WQ_PERCPU
-	 * - If both are set, default to WQ_UNBOUND
-	 *
-	 * This code can be removed after workqueue are unbound by default
-	 */
-	if (unlikely(!(flags & (WQ_UNBOUND | WQ_PERCPU)))) {
-		WARN_ONCE(1, "workqueue: %s is using neither WQ_PERCPU or WQ_UNBOUND. "
-			  "Setting WQ_PERCPU.\n", wq->name);
-		flags |= WQ_PERCPU;
-	} else if (unlikely((flags & WQ_PERCPU) && (flags & WQ_UNBOUND))) {
-		WARN_ONCE(1, "workqueue: %s uses both WQ_PERCPU and WQ_UNBOUND. "
-			  "Dropped WQ_PERCPU, keeping WQ_UNBOUND.\n", wq->name);
-		flags &= ~WQ_PERCPU;
-	}
+	if (unlikely(wq_unbound_by_default))
+		pr_warn_once("workqueue: %s is using neither WQ_PERCPU or WQ_UNBOUND. "
+			     "Setting WQ_UNBOUND.\n", wq->name);
+
+	WARN_ONCE(wq_dropped_percpu,
+		  "workqueue: %s uses both WQ_PERCPU and WQ_UNBOUND. "
+		  "Dropped WQ_PERCPU, keeping WQ_UNBOUND.\n", wq->name);
 
 	if (flags & WQ_BH) {
 		/*
-- 
2.55.0

