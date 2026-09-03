Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9454E56D0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788454456; cv=none; b=NnbaexufMvNT+gFm25c/fJMWmBacnylx4SMJad9utDTpJYKcNCLH4lnJRd3BR58zIswe4EIbCuHBFAErOByEe7nzso0O27iiqzW011gFnzXSuV1ZtGp895ai/3kJcV/fIYKZD345btrx+QP/Ql1gUtXlExFlYMejCPUxWKyYgWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788454456; c=relaxed/simple;
	bh=Og/aP01ymRggO+nQAHN57TRNgksDR8YQBwlii5mFZPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LYDgNTKcfTBz5Hf7xYtgmO8bcTE7IdNoTb5dIryly6c2hZb4lAYRQh/oFhTO8Zu+XIFHahnykTAk6kjZDj4Sq86iQI+oAY7JyqilomZeDeEQzp9FiujVHwDMpnicSJ6zflwdpVHI9SOSnj9nQRQcomdmDNFhpUXdtPrkWCunhMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LYb8NcUN; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LYb8NcUN"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-482dd6ee390so88491f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788454453; x=1789059253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yYmOvM27Czvl6pkooLClbWW9XztVFTVuY4FT6K+XRcc=;
        b=LYb8NcUNpUn65xfKHEdb1w1UFmtg+o2lMzQsa2yc8QmYGoVJW36ysxLosBFIgqnKbd
         kh2K/op/HNZJKxanSjNxXBa/EdiOoUGQQqAVam51LMrbWFIESm4/kk2NEO76sWDYCJEh
         wHKQUwxrKaeOUWM3Hma/kFQCnM3rLvlpW0f7aX0cB5D/j70e+DgV/4eP/OOvdbdzqxef
         ZXbVWv0fHx24cX43a8PiGbF+itJ5v6poUoGwcnBKue/uTjqvi1RVOG9A7tfxIVPus9I6
         8WVR+If1ASOrVf2Scr62ZFhL8rf2XOZOiekqPr+ykQ2BXaNKcc/t8iBQoBescoqsQ8Cd
         9U3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788454453; x=1789059253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yYmOvM27Czvl6pkooLClbWW9XztVFTVuY4FT6K+XRcc=;
        b=Tej63otb+FEkm46tGk8ALAE/U3Meq3PwTCxPgHwP30Gu6pTHTw4uJelHBIH6qgug4Q
         7ERR8GTa996V/hC0wZ3T6MlllfOhliBEhp9igTCECnw8z16lNom/QZR80s6vwjESDGSd
         WF2WOEub5SabqriehWldqdBQdNUH5ZP3/c8STsE6rLeYZM5sUk/XwAv6ypOM3PVh8ej3
         OkXlTHm6UKRV/LXRPIP7qi0OSbz3/g4/1rUCUk8ZWUY4FcvlUFJR0EQ4f1P8i8bsp+nT
         muMlpfsfaXb7YFWTzopKGDWTw4yWHeRnv4ndKN4LDmuDRm1uDh4XWensyuZYuDkgEYQ/
         qCsQ==
X-Gm-Message-State: AFuF++nRYDUdB6+uYQwqrUT4/O/4OheikQFXwCrzRqa5/KBxNwMzSrbD
	DW2CRk/9rGC6uoC5iA2vphDUYtk3wwJoMhjJn9Rp05c+0CBZCnVKyZYQjWbEH3EWJaJjVWottCd
	5hJNcxvU=
X-Gm-Gg: AYBFou18LqgCgkg/EaNSfvgZfHOdTFuXIkkRFZhL/irDNIzuwyb64iiSJT1SYsUxNUY
	ULtN/MT4q91H6K/fZQsKPcN+oOyQtrsvBxBfNAd16CqAw8WRAEf3Pa8z1aFoy4eEzpM4zqcczS7
	ALQmJWYlLLNHYQr4dVxLU5ZoiKUkvcpgibQEzhK8yAMmMi7K6PIOJf271r+fwKhp0OLRUKhCA0S
	TNKIFnBwCmlurDQho+0uqHPl4pfYou++EiK4Sp+EqtIdG+6sUbeNIF7M40nFqvYTisgEokxuUyx
	39Bof90bhuItdFVxpTiPCgUmS4Ct9BmUAAWFYhlYP+QmvGfrM6kuFSDdeaW7qTEhij72iqkkF06
	yX39O9/eBuiHbpB8ZV6tVMPcnN8iDXiJ94P2f36oi5M18OB8frsdqFBNnaqkT+9Zrf7OK4TaoyC
	9yiq89V3gWHuvIE8i8i7Rnx04DxyORrkCBN3i1h4QJ5LqtSldQrOZWc4lyIRIJ67rqAMrp4wT3n
	2GqOHIL3AY=
X-Received: by 2002:a5d:5f88:0:b0:484:f26c:ba9a with SMTP id ffacd0b85a97d-48587087b9fmr749853f8f.16.1788454453105;
        Thu, 03 Sep 2026 09:54:13 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea5b4sm15311657f8f.27.2026.09.03.09.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:54:12 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Breno Leitao <leitao@debian.org>
Subject: [PATCH v2 1/2] workqueue: Make alloc_workqueue() unbound by default
Date: Thu,  3 Sep 2026 18:52:50 +0200
Message-ID: <20260903165251.481362-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903165251.481362-1-marco.crivellari@suse.com>
References: <20260903165251.481362-1-marco.crivellari@suse.com>
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
 kernel/workqueue.c | 43 +++++++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 1ae3732a2c51..c1e5f2c6c8dd 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -5895,6 +5895,8 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 	struct workqueue_struct *wq;
 	size_t wq_size;
 	int name_len;
+	bool wq_unbound_by_default = false;
+	bool wq_dropped_percpu = false;
 
 	if (flags & WQ_BH) {
 		if (WARN_ON_ONCE(flags & ~__WQ_BH_ALLOWS))
@@ -5903,6 +5905,24 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 			return NULL;
 	}
 
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
+	}
+
 	/* see the comment above the definition of WQ_POWER_EFFICIENT */
 	if ((flags & WQ_POWER_EFFICIENT) && wq_power_efficient)
 		flags = (flags & ~WQ_PERCPU) | WQ_UNBOUND;
@@ -5927,22 +5947,13 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
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

