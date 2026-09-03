Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E374E4DA543
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448981; cv=none; b=DLnZnffXaLXz0wVxsGGqDT89575TM8hoGfW03ggGUVEWBGvD63d9xbLYO8JaOt+rCFtBH1dV0AAp78qJTydjTp35jMgxoZ7RysJkWP1XgtitnPuSkrB1E0vjY9pCOXd1hp8nGufpL388roSW2MehFRAtQMUPVND9uPMY6Ts+lks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448981; c=relaxed/simple;
	bh=WdQvvlXMHNopY09CMyQCSuEacColb45jXilQsgXt3d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tgwqz2RVgjH5Dh+jT3k+6iGDttgccWSxHoevxM3sCcla6aDpwp/UxStG5MdniLY1z/cBq048b3vaU2Cs6k6TScAMlepLzL6ARvot9T7yQK9OwHg7uBZbWpJdvgY2GXM+oEQVHTuCF0rSPrsAw/L+xY/KkjpuZ8HtVenHCwa70ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Hf2VRhX9; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Hf2VRhX9"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48436216a98so1608037f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788448978; x=1789053778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l9fxFfAJcOejAOccFioTdZSgoVChkZbm2FvtNGTKlno=;
        b=Hf2VRhX9HxAvCT5JYuX1unTvKSCoxg52l9Q+jgvDCNIfYjkPUTHZE1VMFHFk0SEHxV
         r+EUx+qIDTOsnxGlTyMGKPguri4qN4hZ9cbyf8z3AQ6H8HCe57zTxIpT5mgXC0X0EYmb
         /zgOqcZ4zndvDpjO/XQWLzA/RdWWJebmjwrTmFA1xkuLWHkZdviSyBltCN6kbs21N3/j
         FKylXniJStRHNl+pVRE4Z5ocojewh071AjSX09DxK4WBefkosqix/8XGA8MDOcO0AqQA
         ArsF5GLMjxoU3kCbEo/JEEEno7SLbJylNG31aFJ/j/TEyL1yVmJmmuXRxXZuT/j4aBNv
         ds7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788448978; x=1789053778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l9fxFfAJcOejAOccFioTdZSgoVChkZbm2FvtNGTKlno=;
        b=SL4XOQONH+6l4vJg0PgNzqMKD2Nd/Hnxn6KGVXs1kh5Z1B53VRZBYZwmuV6nAFI4ed
         qS5rkKahpl4nVrZDehPDEnV1czzkb/E0eq0z5B/3wRdD4zRZV9GCqzRSLpfM8NnXzu67
         +khOi3VM5id5V0fl5EtJWePC/pumCiedMSy66+xZSzhUyoTkFvG4U8FgqwmydN+Ov7gI
         DtBHz+h6W1GqnD2ww8AgPGcKuXFjfDoKewwghTuG6XLzCZ6gu4gVpaS9l5i9QuTxBsXr
         M1JscYklCU6CRp4mLGIoqxJ1QSGZoz9FwR/K+e/cy2Cj+XSMgwqMdNdHWKDtFvM5DuTu
         RZ9A==
X-Gm-Message-State: AFuF++nskvRqS5kea1vvlcWCW3tX3KlE7A/5JIJm/p884PN79Z7Bz2V7
	8XE9/xXTrnFfKu+Y5Bay5PtLjrO4rGegHWSEoZ5fsXXrARtf6m7M6Vom75nqjqSnbxg4MY2uoU5
	YDxzdxLc=
X-Gm-Gg: AYBFou2Wg3xb9zM24kMDWNqNH1eVy+plKo6FrUEfX5eIrBK/a3JDDGD2KkJqmhdGhyY
	dMSYdgaLCSyNuhcXPt8FEnRKBrkOq2zceEJxZTG82d6KeYwYCfj1YI6tfoefpbg0fQRjzhTPUiH
	CmwFlmtOQp7uL4pHQrt68eYBN/XffPcmIGTnkvsBKFtEDV6imwPUcXjO/oQEeRj1OT4GKIbfdTv
	vL3llwuZTcIswbAFo/At/OBw3EXdX6Yzyd/Ukuan7LcMSPXm/K5d3tJiYDkUZxALLTIuURbWRBi
	1nhvPvh5c4hs0z3fmnaf4u3KdCM+kqGdpxm65czqAVwTLT+fKSQ7PDdPY/dSHb7gwRfGt0juavi
	dR23ZR1pvvHqPGrPl0YGxVEdiOgw/rwd48cDMkIDZXLuvC1xte35fCxswcm8zpHiAF/zbm/KEJt
	poFvvKYbAL6E60R02oxtiUQNjv7p0L0v0rfXJ/8WiXVjwj5ARPSlfvgujD9gX//64xoEK+
X-Received: by 2002:a05:6000:4709:b0:484:3317:a19 with SMTP id ffacd0b85a97d-484914cce06mr26492189f8f.26.1788448978144;
        Thu, 03 Sep 2026 08:22:58 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e13db0sm14648114f8f.0.2026.09.03.08.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:22:57 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Breno Leitao <leitao@debian.org>
Subject: [PATCH 1/2] workqueue: Make alloc_workqueue() unbound by default
Date: Thu,  3 Sep 2026 17:22:03 +0200
Message-ID: <20260903152204.401638-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903152204.401638-1-marco.crivellari@suse.com>
References: <20260903152204.401638-1-marco.crivellari@suse.com>
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
 kernel/workqueue.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 1ae3732a2c51..8681343597e8 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -5928,16 +5928,16 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 			     wq->name);
 
 	/*
-	 * One among WQ_PERCPU and WQ_UNBOUND must be set, but not both.
-	 * - If neither is set, default to WQ_PERCPU
-	 * - If both are set, default to WQ_UNBOUND
+	 * Every caller that doesn't explicilty specify WQ_PERCPU will be
+	 * unbound (WQ_UNBOUND) by default.
 	 *
-	 * This code can be removed after workqueue are unbound by default
+	 * If both flags are present at the same time, WQ_PERCPU will be
+	 * removed.
 	 */
 	if (unlikely(!(flags & (WQ_UNBOUND | WQ_PERCPU)))) {
-		WARN_ONCE(1, "workqueue: %s is using neither WQ_PERCPU or WQ_UNBOUND. "
-			  "Setting WQ_PERCPU.\n", wq->name);
-		flags |= WQ_PERCPU;
+		pr_warn_once("workqueue: %s is using neither WQ_PERCPU or WQ_UNBOUND. "
+			  "Setting WQ_UNBOUND.\n", wq->name);
+		flags |= WQ_UNBOUND;
 	} else if (unlikely((flags & WQ_PERCPU) && (flags & WQ_UNBOUND))) {
 		WARN_ONCE(1, "workqueue: %s uses both WQ_PERCPU and WQ_UNBOUND. "
 			  "Dropped WQ_PERCPU, keeping WQ_UNBOUND.\n", wq->name);
-- 
2.55.0

