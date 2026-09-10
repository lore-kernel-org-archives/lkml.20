Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3ED41D11F;
	Thu, 10 Sep 2026 09:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030932; cv=none; b=eV5YewNLy7bOpBkAbEb4RnkPfpMI71fynzHeDCoA83xFc9NTGkeXPdwYx+ptGmHGjNysk3qCOZ8z1cnzbkRKa3bg6L3gDh8iD77PqDK+tcpeF69JrUjLNnch5RePcFDcqSVoQZNqIpoTCP0u0N8sgtBhQ1Jw+yVgLxWm1bNWNdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030932; c=relaxed/simple;
	bh=Z/lYafQ89LrgDrhJH0EN+5bvBJLBcCzLq6CLvg0xxBc=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=WnjZhUmY1kE+ucS4I9mmtwd/lgYttokW0GdQwfuGr3cyuyH3BRfyOay8K1bEYMn8YAPTpN2DyZvrSRmpRq5yLvpTU9nDiKAb8ce+81PDi7MGF6VGXfpHJJ8uYlLtj8F6WhUceToVV2eNqkPVK2yEtYJ+5FTr9++Dm0AoMBbrOCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LZft4cBL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ABqUPkB9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LZft4cBL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ABqUPkB9"
Date: Thu, 10 Sep 2026 09:02:06 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789030927;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Esya9YHDWJIFHatXOGEIf30doXztv2/LhV9S1cp4QFg=;
	b=LZft4cBLV7BI847TBG0dltnfIoPVFE+5qf208Uatdb+4jWbxgf6p7P6o/ASqbJYDmMTlQd
	UA5QHnU8C6rmgf3xGkahijvEWkczVKA1RJEIPax7xcPJFqhMDz17k0QaW02r6B/pVCSh/D
	5u9SrIxM/U3IKPa33rnR5ke6RmrkMPyVTIZJ3yCVDTIj5MdmKXVJpw/gWFjSk8/bhmgcnf
	RhjllRM4yENMF37L9RHp0hZ8RLiQWsZErSGMHkLXEtx0Uc2UjBRQXuyyJdRxkkDY/I58tP
	cHsUFD/fGSL5N2OF2VexJTOQYLzqGaE83cF9bnnk7edW9QMArRhh+ByVg9kSlg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789030927;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Esya9YHDWJIFHatXOGEIf30doXztv2/LhV9S1cp4QFg=;
	b=ABqUPkB9N2VVknMAfx+6ER7YLmcONi77iRYxVZYwArg2GeVUjJBCzf8jgSXg+nGBIzORn7
	cveq/kpVTmZ76NAw==
From: "tip-bot2 for Vincent Guittot" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/eevdf: Fix rb augmented with multi fields
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 K Prateek Nayak <kprateek.nayak@amd.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260909150522.858312-1-vincent.guittot@linaro.org>
References: <20260909150522.858312-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178903092601.623050.18196425077971155305.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     51b0e68cfa0ac69e3c3ea9d6753af7e15dfaab22
Gitweb:        https://git.kernel.org/tip/51b0e68cfa0ac69e3c3ea9d6753af7e15df=
aab22
Author:        Vincent Guittot <vincent.guittot@linaro.org>
AuthorDate:    Wed, 09 Sep 2026 17:05:22 +02:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Thu, 10 Sep 2026 10:22:52 +02:00

sched/eevdf: Fix rb augmented with multi fields

The eevdf rb tree maintains 3 augmented fields but only one is currently
copied when balancing the tree.

Add a more generic define that can be used when there are several augmented
fields. In this case, we provide a function that takes care of copying all
fields.

Fixes: aef6987d8954 ("sched/eevdf: Propagate min_slice up the cgroup hierarch=
y")
Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Link: https://patch.msgid.link/20260909150522.858312-1-vincent.guittot@linaro=
.org
---
 include/linux/rbtree_augmented.h | 35 ++++++++++++++++++++++++-------
 kernel/sched/fair.c              | 12 +++++++++--
 2 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/include/linux/rbtree_augmented.h b/include/linux/rbtree_augmente=
d.h
index 6dbc5a1..d2fa1c4 100644
--- a/include/linux/rbtree_augmented.h
+++ b/include/linux/rbtree_augmented.h
@@ -87,18 +87,18 @@ rb_add_augmented_cached(struct rb_node *node, struct rb_r=
oot_cached *tree,
 }
=20
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
=20
-#define RB_DECLARE_CALLBACKS(RBSTATIC, RBNAME,				\
-			     RBSTRUCT, RBFIELD, RBAUGMENTED, RBCOMPUTE)	\
+#define RB_DECLARE_CALLBACKS_MULTI(RBSTATIC, RBNAME,			\
+			     RBSTRUCT, RBFIELD, RBCOPY, RBCOMPUTE)	\
 static inline void							\
 RBNAME ## _propagate(struct rb_node *rb, struct rb_node *stop)		\
 {									\
@@ -114,14 +114,14 @@ RBNAME ## _copy(struct rb_node *rb_old, struct rb_node =
*rb_new)		\
 {									\
 	RBSTRUCT *old =3D rb_entry(rb_old, RBSTRUCT, RBFIELD);		\
 	RBSTRUCT *new =3D rb_entry(rb_new, RBSTRUCT, RBFIELD);		\
-	new->RBAUGMENTED =3D old->RBAUGMENTED;				\
+	RBCOPY(new, old);						\
 }									\
 static void								\
 RBNAME ## _rotate(struct rb_node *rb_old, struct rb_node *rb_new)	\
 {									\
 	RBSTRUCT *old =3D rb_entry(rb_old, RBSTRUCT, RBFIELD);		\
 	RBSTRUCT *new =3D rb_entry(rb_new, RBSTRUCT, RBFIELD);		\
-	new->RBAUGMENTED =3D old->RBAUGMENTED;				\
+	RBCOPY(new, old);						\
 	RBCOMPUTE(old, false);						\
 }									\
 RBSTATIC const struct rb_augment_callbacks RBNAME =3D {			\
@@ -131,6 +131,27 @@ RBSTATIC const struct rb_augment_callbacks RBNAME =3D {	=
		\
 };
=20
 /*
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
+	new->RBAUGMENTED =3D old->RBAUGMENTED;				\
+}									\
+RB_DECLARE_CALLBACKS_MULTI(RBSTATIC, RBNAME,				\
+		     RBSTRUCT, RBFIELD, RBNAME ## _copy_single, RBCOMPUTE)
+
+/*
  * Template for declaring augmented rbtree callbacks,
  * computing RBAUGMENTED scalar as max(RBCOMPUTE(node)) for all subtree node=
s.
  *
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 5b944f9..944833e 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1032,6 +1032,13 @@ static inline void __max_slice_update(struct sched_ent=
ity *se, struct rb_node *n
 	}
 }
=20
+static inline void min_vruntime_copy(struct sched_entity *new, struct sched_=
entity *old)
+{
+	new->min_vruntime =3D old->min_vruntime;
+	new->min_slice =3D old->min_slice;
+	new->max_slice =3D old->max_slice;
+}
+
 /*
  * se->min_vruntime =3D min(se->vruntime, {left,right}->min_vruntime)
  */
@@ -1059,8 +1066,9 @@ static inline bool min_vruntime_update(struct sched_ent=
ity *se, bool exit)
 	       se->max_slice =3D=3D old_max_slice;
 }
=20
-RB_DECLARE_CALLBACKS(static, min_vruntime_cb, struct sched_entity,
-		     run_node, min_vruntime, min_vruntime_update);
+
+RB_DECLARE_CALLBACKS_MULTI(static, min_vruntime_cb, struct sched_entity,
+		     run_node, min_vruntime_copy, min_vruntime_update);
=20
 /*
  * Enqueue an entity into the rb-tree:
