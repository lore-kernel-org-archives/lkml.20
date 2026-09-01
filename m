Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE9A3A168C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248943; cv=none; b=NSSZTqOQf9t3QoqnB2nvklNhMU82Aft8+13/KzPRZblMXkkC3csESb5AXFFw+joZUaSJqggYV9KTozKtxBcicivKb9pWpB8OdotRR0fIJ6Sa2pIA1ijDN6c8eOFUkSWY1i5LeGRxGpw6G38ViLJ/2DpSoCspzW4DlQNe66yqWec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248943; c=relaxed/simple;
	bh=6XI3eg8IaD/wYB87LRoiYG7IH7ZCCHeePKHRPOP75Dw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dexoOUy5zNWL9L1XEHF9ZgQWOvHkofF438zEBH84Cwn8MmR+VrIWNfArwAe2r4LkZI1fM4bIudxANMnhvcl+hnh/dacJ6lYSxvVfG5T1X0Xk/vsxFyxngbWxdWPL1szaCakJIpGKNOV1WP4VQ0QWFKK9GlJ/ePKvNP6aC8/En/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXzQc/Cm; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXzQc/Cm"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d6f9e2f681so42953875ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788248941; x=1788853741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OhH+6P1yI44nri9QpXqL2U01mVLBeU0+majSA9ZCwVI=;
        b=WXzQc/Cmcw7mlCQtIHv8pmi8agtx7EAfNy2Nvr1lD/CJVGfC8wvBAzBzzjq7TLAs/R
         KbL9c1EMPLIYKLwRRtOUz3s/ko5meJmYnzawn/JVYfv9VOHz9rKpSsgva4uTm1XUQ2uG
         Ejxs7r6zfMQReMXxn3nB9RQHHOD9mlj8rtaoszgSm1WYnoJ16jVcHQa2vhcaEiKK3Jhc
         +ZiogzVvcM5spCnVLBAEIhK6xZcwLQPVaTGkzlNmdHcVGaljDTd0nXec7toMLXBCX7VC
         X+RJNAXyHye+H9sIxj8HeUgW/zQ7ZYbNyG4scfqZ2kFqYEgBq6o8V6wXk7cw6v48Jfjh
         rgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248941; x=1788853741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OhH+6P1yI44nri9QpXqL2U01mVLBeU0+majSA9ZCwVI=;
        b=p7PXG1QWgan1mOq9JaRsrA0gL3CCph+qRtp0EX9q7VaLcLCS3fFEsR6MrjbvYD/koG
         8GswGp+TGiG3KSsMod/nOHL3N9qu4s4aBUpXoqfxBGS8qsiv/fIJIf8/OsX2M+tiE8/m
         XNvDl9rDUT/H2XFbxsIZQcOJw+Wt4QrC2LCjLR8Htsq5x3Q5G96nNsFFLpsukzopzIwe
         ikrQIK6qBK+mmXKjsh5fmZulC9xsawz+axJQEYPn5fsclnb/UO6Arevp0H+jGT72OL2I
         SjtXyo4Ef7OOh76nmY8XSJoswkXZuYtM+6KULXo0/mu1xxZQ/SA9XO7yJnwQMNUy1lbq
         vb4A==
X-Forwarded-Encrypted: i=1; AKwUvBzyB5f18+th9RCtr7XtfGsMrAemRnvuq4CYsehvTl1dWlMHXF2VcJXwZSmifYaDrSr8i/Aoq8klZXh+RJs=@vger.kernel.org
X-Gm-Message-State: AFuF++nwScV3ZAPbTLMZCJ9PQTf0+Zi2h3EnLe5seDoZxkGIJF1C2gPa
	ouQq/2omeuQ+SVk+G4bgKkt1t5MkxwIKtH1JZLPXTNDg1zmJQhnSSOV0TEG0aUNC
X-Gm-Gg: AYBFou23JhW/9DYxDBB41KDWQyx4PhNDfBJ1kEK1uzbnhi6hpPSR15XBqEbnd5EFuhr
	5ExaMWjuphpXIG855lbnFL81pcGa/y+hIz9DVK2/74R+M96ZiJcY4OC1jStHstDYUMw/Sqcx04v
	XBIQ0EX+smqpIBq5xs91Ch0q1+nWyHlNT6ykWOzBGcO4bAR762UDoGiLSyno6tho6fA7CiM7CmT
	wzO2v+RU8M0nRCpOxYRqIvx+eWWGME6Y+0tu1fjK8O6h+qlwLAUiJC8ci4uYfBg6Zj9TKoOMh41
	I1GmOUqPvARfdI0REdq+G75oIiP1XtSnXvFfo/IUpr9IJ2zBjf8s69pSN2OtKbpfEQk7JUQcvk0
	kEJBRLLjLSb99TpzUOnsLy2go7lUb1uz7TMPxj+HI1biKoOxbCYQhUA7FodRy4DZuC9TUZYqs5q
	6jrqM+11TMNWN7mgNqutzNDBuDxhBoavXIsf8GpSMSIqETP3VqVvj6NxZMMhMjBL7xnRrfqLsNh
	IavhPY=
X-Received: by 2002:a17:90b:2552:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-396d0f02a58mr48677714a91.7.1788248940660;
        Tue, 01 Sep 2026 00:49:00 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990c40d0c9sm4535507a91.7.2026.09.01.00.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:49:00 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: jiangshanlai@gmail.com,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com
Cc: rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH] srcutiny: Enable atomic SRCU flavor tracking
Date: Tue,  1 Sep 2026 15:48:15 +0800
Message-ID: <20260901074815.3145037-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kunwu Chan <kunwu.chan@gmail.com>

Set srcu_reader_flavor to SRCU_READ_FLAVOR_ATOMIC in the Tiny SRCU
atomic initialization paths, so that the entry-point checks added by
the previous commit can identify atomic SRCU domains.

For static initialization, add a flavor parameter to
__SRCU_STRUCT_INIT() and pass SRCU_READ_FLAVOR_ATOMIC through
DEFINE_SRCU_ATOMIC() and DEFINE_STATIC_SRCU_ATOMIC().

For dynamic initialization, initialize srcu_reader_flavor to zero in
init_srcu_struct_fields() for the generic initialization path, and
set it to SRCU_READ_FLAVOR_ATOMIC in init_srcu_struct_atomic().
Handle both CONFIG_DEBUG_LOCK_ALLOC and non-debug initialization paths.

Enable srcu_check_read_flavor() for Tiny SRCU, matching the Tree SRCU
behavior, so that readers can verify that the requested flavor matches
the SRCU domain.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 include/linux/srcutiny.h | 39 +++++++++++++++++++++++++++++----------
 kernel/rcu/srcutiny.c    |  1 +
 2 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/include/linux/srcutiny.h b/include/linux/srcutiny.h
index 2b293336525a..9dce4b5aa084 100644
--- a/include/linux/srcutiny.h
+++ b/include/linux/srcutiny.h
@@ -40,7 +40,7 @@ void srcu_drive_gp(struct work_struct *wp);
 void srcu_tiny_irq_work(struct irq_work *irq_work);
 void srcu_defer_drain(struct irq_work *irq_work);
 
-#define __SRCU_STRUCT_INIT(name, __ignored, ___ignored, ____ignored)	\
+#define __SRCU_STRUCT_INIT(name, __ignored, ___ignored, flavor)		\
 {									\
 	.srcu_wq = __SWAIT_QUEUE_HEAD_INITIALIZER(name.srcu_wq),	\
 	.srcu_cb_tail = &name.srcu_cb_head,				\
@@ -49,6 +49,7 @@ void srcu_defer_drain(struct irq_work *irq_work);
 	.defer_cbs = LLIST_HEAD_INIT(name.defer_cbs),			\
 	.defer_iw = { .node = { .u_flags = IRQ_WORK_HARD_IRQ },		\
 		      .func = srcu_defer_drain },			\
+	.srcu_reader_flavor = flavor,					\
 	__SRCU_DEP_MAP_INIT(name)					\
 }
 
@@ -57,29 +58,43 @@ void srcu_defer_drain(struct irq_work *irq_work);
  * Tree SRCU, which needs some per-CPU data.
  */
 #define DEFINE_SRCU(name) \
-	struct srcu_struct name = __SRCU_STRUCT_INIT(name, name, name, name)
+	struct srcu_struct name = __SRCU_STRUCT_INIT(name, name, name, 0)
 #define DEFINE_STATIC_SRCU(name) \
-	static struct srcu_struct name = __SRCU_STRUCT_INIT(name, name, name, name)
+	static struct srcu_struct name = __SRCU_STRUCT_INIT(name, name, name, 0)
 #define DEFINE_SRCU_FAST(name) DEFINE_SRCU(name)
 #define DEFINE_STATIC_SRCU_FAST(name) \
-	static struct srcu_struct name = __SRCU_STRUCT_INIT(name, name, name, name)
+	static struct srcu_struct name = __SRCU_STRUCT_INIT(name, name, name, 0)
 #define DEFINE_SRCU_FAST_UPDOWN(name) DEFINE_SRCU(name)
 #define DEFINE_STATIC_SRCU_FAST_UPDOWN(name) \
-	static struct srcu_struct name = __SRCU_STRUCT_INIT(name, name, name, name)
-#define DEFINE_SRCU_ATOMIC(name) DEFINE_SRCU(name)
+	static struct srcu_struct name = __SRCU_STRUCT_INIT(name, name, name, 0)
+#define DEFINE_SRCU_ATOMIC(name) \
+	struct srcu_struct name = __SRCU_STRUCT_INIT(name, name, name, SRCU_READ_FLAVOR_ATOMIC)
 #define DEFINE_STATIC_SRCU_ATOMIC(name) \
-	static struct srcu_struct name = __SRCU_STRUCT_INIT(name, name, name, name)
+	static struct srcu_struct name = \
+		__SRCU_STRUCT_INIT(name, name, name, SRCU_READ_FLAVOR_ATOMIC)
 
 // Dummy structure for srcu_notifier_head.
 struct srcu_usage { };
 #define __SRCU_USAGE_INIT(name) { }
 #define __init_srcu_struct_fast __init_srcu_struct
 #define __init_srcu_struct_fast_updown __init_srcu_struct
-#define __init_srcu_struct_atomic __init_srcu_struct
+#define __init_srcu_struct_atomic(ssp, name, key) \
+({ \
+	int __ret = __init_srcu_struct(ssp, name, key); \
+	if (!__ret) \
+		(ssp)->srcu_reader_flavor = SRCU_READ_FLAVOR_ATOMIC; \
+	__ret; \
+})
 #ifndef CONFIG_DEBUG_LOCK_ALLOC
 #define init_srcu_struct_fast init_srcu_struct
 #define init_srcu_struct_fast_updown init_srcu_struct
-#define init_srcu_struct_atomic init_srcu_struct
+#define init_srcu_struct_atomic(ssp)					\
+	({								\
+		int __ret = init_srcu_struct(ssp);			\
+		if (!__ret)						\
+			(ssp)->srcu_reader_flavor = SRCU_READ_FLAVOR_ATOMIC;\
+		__ret;							\
+	})
 #endif // #ifndef CONFIG_DEBUG_LOCK_ALLOC
 
 void synchronize_srcu(struct srcu_struct *ssp);
@@ -148,7 +163,11 @@ static inline void synchronize_srcu_expedited(struct srcu_struct *ssp)
 void srcu_barrier(struct srcu_struct *ssp);
 
 static inline void srcu_expedite_current(struct srcu_struct *ssp) { }
-#define srcu_check_read_flavor(ssp, read_flavor) do { } while (0)
+#define srcu_check_read_flavor(ssp, read_flavor) \
+	({ \
+		u8 __f = (ssp)->srcu_reader_flavor; \
+		WARN_ON_ONCE(__f && !(__f & (read_flavor))); \
+	})
 
 /* Defined here to avoid size increase for non-torture kernels. */
 static inline void srcu_torture_stats_print(struct srcu_struct *ssp,
diff --git a/kernel/rcu/srcutiny.c b/kernel/rcu/srcutiny.c
index 22f7716cbb0e..873b30ccf563 100644
--- a/kernel/rcu/srcutiny.c
+++ b/kernel/rcu/srcutiny.c
@@ -42,6 +42,7 @@ static int init_srcu_struct_fields(struct srcu_struct *ssp)
 	ssp->srcu_gp_running = false;
 	ssp->srcu_gp_waiting = false;
 	ssp->srcu_atomic_gp_flag = 0;
+	ssp->srcu_reader_flavor = 0;
 	ssp->srcu_idx = 0;
 	ssp->srcu_idx_max = 0;
 	INIT_WORK(&ssp->srcu_work, srcu_drive_gp);
-- 
2.43.0

