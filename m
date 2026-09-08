Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0805B52ED42
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788875744; cv=none; b=NMt5STHIX04mLJS9AQiouX58R/5Da3kDASOPstAHFQ300ebm3kGz/JtZ6v5jUmSJvnUjNYVZ+0rE1BwwOrMLsa0vVkF3GfVvw7MHkBXoK3hdjgWHeG/Y3B7KVvbjwcc6+odzK+JcskZInx681z+9YrSbOjxA0fRJWPMO2KQNMbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788875744; c=relaxed/simple;
	bh=l8zQ8gaaosLPCP/ua5PJrU04UXFyMZZD3zSNZKhzdDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SGUxopvtoFbJ8L7Qll2iZgzUdl5VDh4qR5WNzTc65H6+ESicT2zclpKThSmEMmlJ2OnhOAK8EThLvgvcNvlsPB48CwEK31CsolN5HjG8n8vWYkBlGeovetvpN5d/OtFW3WS20tc6u+NmzpY+lWLHlBsSOyTO6y9pMbA3inpAeB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r2mPNW9B; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r2mPNW9B"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-485850cbac3so3016076f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788875730; x=1789480530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TeLftOAZTRHFHvRQQ4oc3BHhZnVr27RofYS2zXbSRTI=;
        b=r2mPNW9Bt+apSF4/JyhPnp2LpufunjCPoLlUOj6Cgky8HbUuRmITNEpYxQ/ZmelkkE
         v7BCMyPbdlUttAyq0fasJGc96dUmMGbcuBkdQq+Z8ZCzbh+ikLQtbPDLw8hM/S1Yz4nB
         RMH68Kz7b0urOG+MO/tg6p+mTDtNgm5SSCgucLvEkjtPXNmYrIkVnZ4o8ptQS1UjPYQW
         bfPTZ0F7hLfXree3syhLIdUS5sTwh31m7lPaWOOBjjJnIb1Ldi5mg2QKz9J7cO06UgTf
         iepvB6A+tKrkfT69V0hUBMeSwlB51SMCetFEwNCNg0oB6QC71v0TSOuhSQhuHnQGQtzi
         OONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788875730; x=1789480530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TeLftOAZTRHFHvRQQ4oc3BHhZnVr27RofYS2zXbSRTI=;
        b=BPsxepiX2tbfJtQUjD5yy06LrHcu/7Ysjy/ENkHkOM0Ozh0VIDQrkZK6oDz363Y8r1
         9jbCAcTV08bByS4MUECUlSYp42hfQ8RW5NvmrKBTaLeapU5p+rwe7K5JAg+3E9tevuBq
         x9B2rdH8GD7F6FU4uFzwej6v1ZnNIYuWNnTuPnHc9GQlT5Nk6YNVtk04h/cMAFz984Kj
         q9pA2BH2HtO1aZwdBhMIVXFs6r/VMXMnDGKftkgs7jX1WXuItrDQKMP3Tfk4ADJXnCU4
         vtB73511Ti1osT8EnlSIYUeA61aDcy9i34rG2i/DOgEum4/Sn9AlSspMYduR7EX7ySC9
         B36w==
X-Forwarded-Encrypted: i=1; AKwUvByPMk99aC079Dx0KKGsDMXso/roBCJ0L/YjN6qW8AW1j4tm0xCVYwTU0MQ6fsS+UEvlnWq6gLb9vKPYwLQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ny0wQ/2QZNFS4eX4o4iZxfjBDTwD5+ebrzjDVHFcRC7BlXS8SY
	DC3Ounz98QtoEursbjIgGjImCouqgc9b5tpOtfZNOIsUOKpGiQ5/rZ7eg6z8VcwaV80=
X-Gm-Gg: AYBFou07IDMDiebeuj1/zQvOmwnGkaUTN/NEXqwrvvQREVTiUbwZ2TaCF+4dkt5jOuD
	N0EoqYc+VX1Vk+Aw8MdalLMOpZ95qjrsPhoRlBqYa/FHXhUSTQTp1kPGyL4gJfGrCTyTxb0vLH8
	QeUek9kKmJGEKS7zXnF8MEKq5BdJASm7CKpM0nzKdk2uK2LJJyGfdRcm/orROrnoTDZiUkpEcxX
	MQUx3+rkHEEQOwAty8RE04En4yTYUTH4TuD+Km13J7KQh4CChlGNp9Y2K89OAmTSgZe7xYbPHJr
	vPcsVQxQRynfpNbVCTJZjDWTFLyK+H0MIPyfQrAaQ4kY6RGFETLHyff/ldFzOeBDfOC9Sl8Vsfp
	PR4oQOyyps3OFzgrHMMW8hS2libwOWiubNogtsQmK77hGbbMCdbeTfQCtn0TxL3pUxvN1G1M+Bt
	LsY7pI8vIjf0Zg+2z84y0061p93tPZyi1bX5VMUEO7ecydF0OXZVEutILAOOKCn+lS/lOtwKJ2y
	wk6RA==
X-Received: by 2002:a05:6000:2311:b0:485:8bc6:3caa with SMTP id ffacd0b85a97d-4858bc63de5mr24596207f8f.16.1788875729492;
        Tue, 08 Sep 2026 06:55:29 -0700 (PDT)
Received: from vingu-cube.home ([2a01:e0a:11f4:3020:f501:8b31:adb1:5205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885b7bfasm36991225f8f.29.2026.09.08.06.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:55:28 -0700 (PDT)
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
Subject: [PATCH] sched/eevdf: fix rb augmented with multi fields
Date: Tue,  8 Sep 2026 15:55:26 +0200
Message-ID: <20260908135526.2783039-1-vincent.guittot@linaro.org>
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
---
 include/linux/rbtree_augmented.h | 35 +++++++++++++++++++++++++-------
 kernel/sched/fair.c              | 15 ++++++++++++--
 2 files changed, 41 insertions(+), 9 deletions(-)

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
index db5937d7e46e..019812c4fe32 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1037,6 +1037,16 @@ static inline void __max_slice_update(struct sched_entity *se, struct rb_node *n
 	}
 }
 
+/*
+ * se->min_vruntime = min(se->vruntime, {left,right}->min_vruntime)
+ */
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
@@ -1064,8 +1074,9 @@ static inline bool min_vruntime_update(struct sched_entity *se, bool exit)
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

