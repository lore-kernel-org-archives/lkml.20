Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F03314A86
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966328; cv=none; b=jI6p6tLQUKk49ulvDm8B/Ocd7ST6/VnRR8DsNRSWvpsrB1ug0T7a8TCJz1Kxc1S1xXTYLTgqWj584szUJpJ8/yZ9Y+UrLlBe4HpP8E8zAtifG8ie32O+yHmSSjG/jMgORv2yjwREmWzKDYI40ZuO1UTcF75B76em+iv9gKJOzt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966328; c=relaxed/simple;
	bh=hPLDAWP2aS57X9Xt/mWJpO/cMy5Tq59Z7RzboJ6Gb+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=as5ORN7nOQ2pAax10rPSjAzQpD4agitlE4DjQT3QwssVM3zjN92JIBiZaBVzI6YE3c5HzmVdjzNfTHKRxKXWpd7IRkeK6Jl5cPYrixeFU/mi3oOsd3/ZDY883rs+5NFQGoGJAIwatt/PW+tdwak/7yP3oCbx/OdP5ZwCCNd1b18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WlRAE0Nq; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WlRAE0Nq"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4843f205a5bso3951600f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788966325; x=1789571125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mtv01hJCvtzKYFztxGKy0mezALCxm6JqrX+gYIgWGJM=;
        b=WlRAE0NqRdmUKrfUfbDObrq8YAlFMsIvOKgIaGKjY8V3o7F19mNR+j8q6ps5XdenvW
         0wq0yXVLwofC1/sd08Thhvb/Wr1TsnlOri0FTA+y+ILDcI8N6L2QjcwwtzvcpTu9GfHd
         Pw0iWSU28WbsNbfEigolUMtZspqmCHmrEJaxx9deWg7Xudfyd11CDaxOXephTmpkvgk5
         Dd/kPPp1eJCk3FgB7M0VdndjhhuixuZQW5blgyllFumju54D4WfTrMi/vZKQoezg6KDw
         dS1jpjnpV29yCkAR2gwJ14c4TlXX4gHUmUn0FMiciQyJCa5RNCXEyUxMcL504F/HqGy+
         7dEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966325; x=1789571125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mtv01hJCvtzKYFztxGKy0mezALCxm6JqrX+gYIgWGJM=;
        b=ZACXuzrI4WxciZLxwmv2snZUZhv5DJEloKgZsf5VK8OGHiUcwvW14xZjzmHqicURuV
         dzUo7mE/DV6XT1StOqCRPFu2S7VbaL9Ive+hL4piDjUd5rQUePwHqdZm2uHEF8JvgPzN
         /AO8J1z4iTRnXYHSOL5wVmkNCJeSLSdeE4/Ix5nF+EA3AyPypCT4/T8+cR73kRlIey+Q
         HmLWmlaRlQ2t+zE3lDc+yFt38fW++heuqwasaD8twY7PYcuCfA5kIuMxhN/YpEX7XSay
         Yes498b+HFgb+hAfYb2vEhl4Hi+97PLHm96GyJ3nU/ciP9QDJ1RCFSUi+9gYieP80HKq
         /UWg==
X-Forwarded-Encrypted: i=1; AKwUvBzoX6tBMi8zsmYbZC0bjVsb+zn3dlodYmzu9MCiUIoqAlOLNVsXKxMFgt6hExyZ/5V3xV2c1p3CuYH9Zp4=@vger.kernel.org
X-Gm-Message-State: AFuF++kHI2Abl+0pLgExWfChfqPoDePjtiFojXctt/Azxn6Ir/zTPF4Y
	fCUYPAGD78aNsIU0WjhskmFi1QIP78ceSKbiDAYUZ7VqTnW6khISu1/1R1/kkOGCgdY=
X-Gm-Gg: AYBFou0jyGAk0g06buCoVlPshgmSif1JVA963W+TD2+kWiWrNBkOkI4WDJ8SK7fzsy/
	NKFkbi1JEC/sV/c5ruVcKfNE7iQ7VL0hWIH7Yi0ZmI05SJ1fiNnE+db89ZtBgZbXr+UNexpeBIf
	mCBEJEbrQOo+aW0Oo3ooy/rFHCz1hyg8quaEUoVT1RJhRzFvOkGKNSgJinWfaKa0BAHhgVMOaD7
	IOvu2WWWJlGqvgpLEJbr1B6Zl6gAn7oLgQeue067EvA+Ae9kd7jmYmlZ4tBDcnr5GBtQBdfP6zu
	2yhOb3ctOLoqlt45nApqooA5AkO95XflKc0qkTAOCjOaxpEzYI29v2CXlBj+yY9VCst19VYhvhp
	yxUVpHOU5BG0U1ajsdzwVmzcUrZh8hNyb/8p7KgwXKOdAzqfOFQzDEy7O4wsfLtHKl5bxFuUu8q
	XuXptLcUhwnMn8RrQORes0CAcb/W9rJNPbOmnNEk9I/71S/bx4x5BB43H+/XhiG2LnIw7WkaCiO
	vHWAaxuwjbffFe6
X-Received: by 2002:a05:6000:2307:b0:485:ac96:724b with SMTP id ffacd0b85a97d-485ac967324mr6648728f8f.7.1788966324791;
        Wed, 09 Sep 2026 08:05:24 -0700 (PDT)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:6cc2:4a61:10d7:2bac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588392b3esm50268381f8f.12.2026.09.09.08.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:05:24 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v2] sched/eevdf: fix rb augmented with multi fields
Date: Wed,  9 Sep 2026 17:05:22 +0200
Message-ID: <20260909150522.858312-1-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The eevdf rb tree maintains 3 augmented fields but only one is currently
copied when balancing the tree.

Add a more generic define that can be used when there are several augmented
fields. In this case, we provide a function that takes care of copying all
fields.

Fixes: aef6987d8954 ("sched/eevdf: Propagate min_slice up the cgroup hierarchy")
Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
---

Since v1:
- Removed useless the comment of min_vruntime_copy()
- Added tested and reviewed tags

 include/linux/rbtree_augmented.h | 35 +++++++++++++++++++++++++-------
 kernel/sched/fair.c              | 12 +++++++++--
 2 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/include/linux/rbtree_augmented.h b/include/linux/rbtree_augmented.h
index 6dbc5a1bf6a8..d2fa1c41bfd2 100644
--- a/include/linux/rbtree_augmented.h
+++ b/include/linux/rbtree_augmented.h
@@ -87,18 +87,18 @@ rb_add_augmented_cached(struct rb_node *node, struct rb_root_cached *tree,
 }
 
 /*
- * Template for declaring augmented rbtree callbacks (generic case)
+ * Template for declaring augmented rbtree callbacks (generic multi fields)
  *
  * RBSTATIC:    'static' or empty
  * RBNAME:      name of the rb_augment_callbacks structure
  * RBSTRUCT:    struct type of the tree nodes
  * RBFIELD:     name of struct rb_node field within RBSTRUCT
- * RBAUGMENTED: name of field within RBSTRUCT holding data for subtree
- * RBCOMPUTE:   name of function that recomputes the RBAUGMENTED data
+ * RBCOPY:	name of function that copies the RBAUGMENTED datas
+ * RBCOMPUTE:   name of function that recomputes the RBAUGMENTED datas
  */
 
-#define RB_DECLARE_CALLBACKS(RBSTATIC, RBNAME,				\
-			     RBSTRUCT, RBFIELD, RBAUGMENTED, RBCOMPUTE)	\
+#define RB_DECLARE_CALLBACKS_MULTI(RBSTATIC, RBNAME,			\
+			     RBSTRUCT, RBFIELD, RBCOPY, RBCOMPUTE)	\
 static inline void							\
 RBNAME ## _propagate(struct rb_node *rb, struct rb_node *stop)		\
 {									\
@@ -114,14 +114,14 @@ RBNAME ## _copy(struct rb_node *rb_old, struct rb_node *rb_new)		\
 {									\
 	RBSTRUCT *old = rb_entry(rb_old, RBSTRUCT, RBFIELD);		\
 	RBSTRUCT *new = rb_entry(rb_new, RBSTRUCT, RBFIELD);		\
-	new->RBAUGMENTED = old->RBAUGMENTED;				\
+	RBCOPY(new, old);						\
 }									\
 static void								\
 RBNAME ## _rotate(struct rb_node *rb_old, struct rb_node *rb_new)	\
 {									\
 	RBSTRUCT *old = rb_entry(rb_old, RBSTRUCT, RBFIELD);		\
 	RBSTRUCT *new = rb_entry(rb_new, RBSTRUCT, RBFIELD);		\
-	new->RBAUGMENTED = old->RBAUGMENTED;				\
+	RBCOPY(new, old);						\
 	RBCOMPUTE(old, false);						\
 }									\
 RBSTATIC const struct rb_augment_callbacks RBNAME = {			\
@@ -130,6 +130,27 @@ RBSTATIC const struct rb_augment_callbacks RBNAME = {			\
 	.rotate = RBNAME ## _rotate					\
 };
 
+/*
+ * Template for declaring augmented rbtree callbacks (generic single field)
+ *
+ * RBSTATIC:    'static' or empty
+ * RBNAME:      name of the rb_augment_callbacks structure
+ * RBSTRUCT:    struct type of the tree nodes
+ * RBFIELD:     name of struct rb_node field within RBSTRUCT
+ * RBAUGMENTED: name of field within RBSTRUCT holding data for subtree
+ * RBCOMPUTE:   name of function that recomputes the RBAUGMENTED data
+ */
+
+#define RB_DECLARE_CALLBACKS(RBSTATIC, RBNAME,				\
+			     RBSTRUCT, RBFIELD, RBAUGMENTED, RBCOMPUTE)	\
+static inline void							\
+RBNAME ## _copy_single(RBSTRUCT *new, RBSTRUCT *old)			\
+{									\
+	new->RBAUGMENTED = old->RBAUGMENTED;				\
+}									\
+RB_DECLARE_CALLBACKS_MULTI(RBSTATIC, RBNAME,				\
+		     RBSTRUCT, RBFIELD, RBNAME ## _copy_single, RBCOMPUTE)
+
 /*
  * Template for declaring augmented rbtree callbacks,
  * computing RBAUGMENTED scalar as max(RBCOMPUTE(node)) for all subtree nodes.
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index b8bd308c2d5b..b0e24f379e97 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1032,6 +1032,13 @@ static inline void __max_slice_update(struct sched_entity *se, struct rb_node *n
 	}
 }
 
+static inline void min_vruntime_copy(struct sched_entity *new, struct sched_entity *old)
+{
+	new->min_vruntime = old->min_vruntime;
+	new->min_slice = old->min_slice;
+	new->max_slice = old->max_slice;
+}
+
 /*
  * se->min_vruntime = min(se->vruntime, {left,right}->min_vruntime)
  */
@@ -1059,8 +1066,9 @@ static inline bool min_vruntime_update(struct sched_entity *se, bool exit)
 	       se->max_slice == old_max_slice;
 }
 
-RB_DECLARE_CALLBACKS(static, min_vruntime_cb, struct sched_entity,
-		     run_node, min_vruntime, min_vruntime_update);
+
+RB_DECLARE_CALLBACKS_MULTI(static, min_vruntime_cb, struct sched_entity,
+		     run_node, min_vruntime_copy, min_vruntime_update);
 
 /*
  * Enqueue an entity into the rb-tree:
-- 
2.53.0

