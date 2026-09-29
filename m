Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB7C53E302
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695507; cv=none; b=d+o6YkznKc9xm6SWQd2iwrEudM5frKsHP+1btEJ6o0A2iDEwi0G6vj+DPakCRZsheZxw/xGb7zU9LQPMHi2kueO/rPOH7SwlUBcJUZaQw6wNdp/tQrrw8KkgHHr38O+rLwF9zAzvG7ckzQ4lKurDuLmH3uzpl01BPRftorMzrjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695507; c=relaxed/simple;
	bh=+cEEr6znaNoigBam8Uz4P3hHrN1WO+xiS9Xy1l2461g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g9O4SY1xTOluWsgdSSQ+Y4wS9rWpqB/b4rZcmofiaJU5TnM4y40QSlZztlNhjRnV8yLHEc+LjHegtBR5ntQPaQdBF8bC3oqWkkcC40+h/gmB0wOmRUiGGEaC4aXwTXTW0vVNZgFpGkMhE8oNfIj178YgJku0GLXoXszgJBkOz5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r2A/V9iL; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r2A/V9iL"
Received: by mail-pj2-f41.google.com with SMTP id d9443c01a7336-2df9754484aso22128195ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695501; x=1791300301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Avi89gTSEr8pephIlQG3FXl3Hk0q/RUFdATAtng+nto=;
        b=r2A/V9iLUr7hnQULU6G44Xtoap9OJvFZGWqm2BCHKd2X2EJOV/qpdbDJLxHNfAthKa
         XthnPpuXebFycydcQXBuXC3dw08tyccB+hJs8eqNDVKK9zfm2ue6HluwhitQJt41l2dx
         Sjs8N11dxzGUXofhk+FDP5QvBXnUjCbxrVpdvwDyhVT5jvJDW0dvs5pDqcRikhq6e6PH
         QCjo0Twu802fOz5q1NbFeh4THeGSbDRBfSGqwYWFZA2NEwVkduKJxsJjccJfuKfa0P3g
         URWYGJbeiWiQK28AI6bpB6JhHoAqFTciwjR2WHb1+aOn3XjMBFmds4GAMbmSggveAWub
         k4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695501; x=1791300301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Avi89gTSEr8pephIlQG3FXl3Hk0q/RUFdATAtng+nto=;
        b=VBOwgWjkM1/oc4LvEe4abx20P6FjzvVojT630wsd0V2bvHMpDCn5yWOF5Oyk09f72X
         ejjcF1ziPUYp7y7LiHByA5KKFePFhkubQKlUle5O/LCFM+dnrJtkz3Q4qPD//Dp3rbKm
         /t6odYEgjCCKway5LHvK6uRYBylCrBSwX847XFwZxNZIkkDcJNG/pzHtgoy1+hX3JbSG
         wGfet+2J6SqdJuLLKmIzgXU4T6I/fTujZK45076/r9GCg2UmtphnbLW1eWwvhRsv6+2d
         2Zj2z46H0J66/B4vdMQQdvrRxcRM7GEoAXWQhfeXCYCbER+zzRk4nsBqt25URfEZneff
         HY0w==
X-Forwarded-Encrypted: i=1; AKwUvBx3sgVBbX9W+3qicgvao6MdFr571G5f0OUhw/CMp/GrP0vtQclWb0EPyDsDbF/gbjyaqJn+8E0WnHM0gAM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+iViIN9HYYnfk/VidDHTTlxs8gk6/KPGcMWi2KtEX7lhHr0LL
	Kcm6tQa97xgim9OV0X2DAon8XWIgrwq1w217DxTqvgcH25mNBqoCGI8Y
X-Gm-Gg: AYBFou0IRF48GErZxE8O2GcXMDgrdIwz2LKWS2RiKWfKL2pI5wo5EA8eKJNq/lcLfhW
	ol4fpOTl0G7mkp+rEStKijjv6MgtWlmNMRxwbBtJlcJI3Yrk1jqC4jt/Q1+TuCHh04kJ+Bs9J/b
	032b37djxkaJZUrXavz1tslSfaZB2t6OFIgExWxR0DBH7s8FGucvwoGWvd34easfwXeo8QNMSWx
	wjGtXYD8CRaaBgoLOvUbCyJ2YwOOlGGK5YDH2Scwaua7IneiKsijGHxuOOOBFNuFtwDfOMPrZp3
	IHTbpaZhVa4ti9U+PhxMLsgmLBeqy3RUYUPrW0EK6/X6UFKNotNdJsLwoOWIFYl7tzkMDmA4ROi
	+aGRyAWGM0Ib5j7jSF4MKcupJieyN3OeiYspCfq1X+Tlrb7UUiAiD0LAJXanW4ikzFuGFxqsNX7
	q2FADxWoCToskt1jShIwtTsRbkM4gvMa9QbzLxL5vc+ZVuiMI8fgfsydHlPhxl/ED4/DivIKCjG
	tFywQ66XUkoTFhBYTC8kTLpHng9Se1v7RxtCu7uYgb2hm4ylReRPFwRgEg3xyHaIYo9eFEDNaqI
	qNiWFE8EmoReRfg6Wa7V
X-Received: by 2002:a17:902:fc86:b0:2e2:c604:b436 with SMTP id d9443c01a7336-2e2c604cbbcmr25400595ad.49.1790695500578;
        Tue, 29 Sep 2026 08:25:00 -0700 (PDT)
Received: from NV-9MNJ414.tailae2068.ts.net (2001-b011-2005-5b75-0412-f652-3152-53f1.dynamic-ip6.hinet.net. [2001:b011:2005:5b75:412:f652:3152:53f1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91476bb4sm59762255ad.83.2026.09.29.08.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:24:59 -0700 (PDT)
From: Yiwei Lin <s921975628@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Yiwei Lin <s921975628@gmail.com>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jon Maloy <jmaloy@redhat.com>,
	netdev@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] rbtree_test: use rb_add_augmented_cached() for the cached augmented test
Date: Tue, 29 Sep 2026 23:24:39 +0800
Message-Id: <20260929152439.91443-5-s921975628@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929152439.91443-1-s921975628@gmail.com>
References: <20260929152439.91443-1-s921975628@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

insert_augmented_cached() open-codes the descent that the generic
rb_add_augmented_cached() helper provides.  Use the helper instead,
so that rbtree_test covers it: it is what sched/eevdf relies on and
nothing in lib/ exercises it today.

Signed-off-by: Yiwei Lin <s921975628@gmail.com>
Assisted-by: LLM
---
 lib/rbtree_test.c | 25 ++-----------------------
 1 file changed, 2 insertions(+), 23 deletions(-)

diff --git a/lib/rbtree_test.c b/lib/rbtree_test.c
index c1386d328cfb1..00f62e4f9d10e 100644
--- a/lib/rbtree_test.c
+++ b/lib/rbtree_test.c
@@ -89,29 +89,8 @@ static void insert_augmented(struct test_node *node,
 static void insert_augmented_cached(struct test_node *node,
 				    struct rb_root_cached *root)
 {
-	struct rb_node **new = &root->rb_root.rb_node, *rb_parent = NULL;
-	u32 key = node->key;
-	u32 val = node->val;
-	struct test_node *parent;
-	bool leftmost = true;
-
-	while (*new) {
-		rb_parent = *new;
-		parent = rb_entry(rb_parent, struct test_node, rb);
-		if (parent->augmented < val)
-			parent->augmented = val;
-		if (key < parent->key)
-			new = &parent->rb.rb_left;
-		else {
-			new = &parent->rb.rb_right;
-			leftmost = false;
-		}
-	}
-
-	node->augmented = val;
-	rb_link_node(&node->rb, rb_parent, new);
-	rb_insert_augmented_cached(&node->rb, root,
-				   leftmost, &augment_callbacks);
+	node->augmented = node->val;
+	rb_add_augmented_cached(&node->rb, root, less, &augment_callbacks);
 }
 
 
-- 
2.34.1

