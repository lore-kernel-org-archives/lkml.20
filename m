Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45A552ED59
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072922; cv=none; b=UwaRbSRMEE5IWafKwbEF38LqCw4okHczzUyJ8fj+7GqqfrOhDofHmnVzvYVFhMplLPjuL/tnI8GNUWJ9P3NKaYFgIhxbojhyZpli5JcXAcrRm8j57pJV1i9WSN67PgvTb3T0RsIUIMxB3T/Qp+a9j5ZPbr8RgI+IB8urRNSlp/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072922; c=relaxed/simple;
	bh=1ADOci/irXMmZAVINIckyy0iPqmUh1+EOW3piz+yioo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h5cZB8V7dlMkmEGFnRlMHMc3HCxuScqAudW1drHf7LLsxN1c3nyg9xGnaTy9AUqJSuMLKMQEDwiThdgWhedq++u03spJphHZg1o9GSTP5rAJT7tsvYTzmBTvPI3we38xe6nHcGCtRCl1wrzqQADZfgflifvpWMoUFFyj/ZWEQDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MOeG5iah; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MOeG5iah"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso50398425e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792072919; x=1792677719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=68U5GGAVdfTItBWwfs4ReS1T7JMDY6WEApnIqOPfIA0=;
        b=MOeG5iahE55l1uui7ZKMoFuWNMp7kjZYiD4gkhPFXvUvjXSv935FW4AYAATNz0woRC
         rVqDz+S0byoI+sEP1r6mnChxM7CxUXwTndf5H7ZF4nA7fEv8cXFP/LI8fgIyxguiMP11
         Hmt6F3orac/gZTuDLeCBgPyi5wb1CaNuy9nA3tuf2ahMqg0slcYD61F6PZ+mVrnq4DPG
         49IzUwxNHdJBFxtH73rYSKR0ycc4OSgDdI2FWInAGdSDpHVeJkrSq1ck7gmp1PjWpzHU
         dkzcYoZwwC63fDJ2XjdBqESQso29RXll2CsqbdQfHs4ktkVOiw7V/PZTtUbIVZ2BAOKB
         2QvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792072919; x=1792677719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=68U5GGAVdfTItBWwfs4ReS1T7JMDY6WEApnIqOPfIA0=;
        b=tsUhpSDXemrYNFVe8iPImkrbG782VAngiNb8kT96cu8AF2OmnnwhdQwXCUShkOh0aX
         iLUCqUGh0Z6LwEG2uj7XOU4yqS/OrrD4uKFRQfKKn9SWwsrFtyTNeswRm2PSi6oOaHz3
         rVbhdbbRTxAgYZcjBoYK0WUxseFptC2259YqWzhNVyziEL+iH2mcJ8F1I0+VUfQyuobZ
         DKKmg87kKQ4JQtnvs11Ir2F/gvYmsNvONhNFMhq/LyMcgk7EPuDih7g5jpOm+OeLFzWn
         csC+rXusBI0lgIf4cG5oLHMZABwy3Qq+edjDkQcwDuZKAU7+ziOQH1Q3LZ597Tbjt0i1
         rZBw==
X-Gm-Message-State: AFq9FYL/HLPz6e9B75zrrTA+wiOQNw9oBCLaC65Szw1u72lxDZEdEIGU
	e7gfjt/nxCvhFNg1IVm7VrP1rVK++s2p/1buZXjYess2hu8P4wpMIU0Sgzk16LoKVYV07HH4RFy
	4nxYaQXs=
X-Gm-Gg: AYBFou0oOUDHP7LE72mynLoehqqEq7snvh+o6PDzKID+26/MIVkM7zSDJSnv+qhl36f
	HQ46h1AgcbfaPLgbwpwEp8shm3noEZB14h1KVASRSGLOBZdDaWoIIBxeRUNYXYHx/8gwnS71bFr
	QQS6DoENMrsnaxWbnS8+Pwgy8rNEVHFkOHN9bp2tCsw7BnTZxZI7sxgzKTbWNR1Yja6fK6TKWA+
	1SPvTHdF9BY1YDGkHxLkIkd//BQl/GSQfrZP9qajfhydwFRkCFEzQGBxuKibPiOL+K0iMC2Q/lm
	PbPzrf1oTQTb5YDGwd0YKx6AW3PfplOLCwfR0VdCfPQ52k4YpygBTuYNWlNYt+Ls0qVKNWGQ2B0
	0qdC9hLoZydHJNaij9xwiVk7pyYQ6EEsGipGMmMwsrG2X9zD4je2JFQASlgvi+IQGDj1MtCP6qi
	nZrNCyR2OOAyVVi7qxJROsuZA3fYDhEsnrxJyrYBNGrift51pBgOPNgs53KEOy3vSN1AizmiZsg
	/JR2TOmUwxs/7sEnLvTag==
X-Received: by 2002:a05:600c:3488:b0:4a1:7690:d878 with SMTP id 5b1f17b1804b1-4a18e4b8028mr396247885e9.17.1792072916336;
        Thu, 15 Oct 2026 07:01:56 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd7319c6sm85233365e9.0.2026.10.15.07.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:01:56 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Breno Leitao <leitao@debian.org>
Subject: [PATCH v4 1/2] workqueue: Make alloc_workqueue() unbound by default
Date: Thu, 15 Oct 2026 16:01:47 +0200
Message-ID: <20261015140148.231126-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261015140148.231126-1-marco.crivellari@suse.com>
References: <20261015140148.231126-1-marco.crivellari@suse.com>
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

BH workqueues (WQ_BH) are always per-CPU and can't be unbound, so
WQ_PERCPU is now unconditionally forced for them before the above
defaulting logic runs.

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
index c56c042d1c35..aba94a8e0c38 100644
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

