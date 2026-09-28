Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB8D3AB46F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790576079; cv=none; b=ATSbXQ58BCOZ5t93eUdDaGXHgBcPWvehof4hxsUKQsF5ZwSqVjqPf4DtiIl/PPYHW3d+SdlmYtSBSwgSMcdGIkE4dsVaOkf9zK6fvH4nnu8wFroJvWW1AfWXawrFhrs+SInw+CLD+dMRL3HHxgzvZfM2+1vmaz5yho4tJUnLUSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790576079; c=relaxed/simple;
	bh=UCFUk147JwUFVYjXeYUCRdWoewnJvL3Q1qa2fY4mraw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R3BeMAp7e7U8kwOJVjiVz1/VAMN93tzhpdFP5iFNCNPeP2O8WQtuBg6ZMWjWExljiDPCr2TSEDvdAN2xjLRwQPkC0ZMW+t3MPyhPqU2aK4sHwgVukZog1nLfx2fjuzYkDZ7shfr6P7trxS1C1hOBPEOpVDWs8K/zo3F4dJFxZ/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZKUbMbm; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZKUbMbm"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso1500475a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790576063; x=1791180863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XaC6DkyMRoZdb4oAVjU9pdXNfcIMayAmSL3fDY/VEnU=;
        b=aZKUbMbmU7dwJ3QP/KtbaMm/fAX/Xt99c5Tmv2HrDENOkRhjovj28plhhHTjt3gbrL
         wiA8luk/Xxw/gRt2hmdM4r/UObGxBFNtPGHmTsI81STH8ty5K7vu57KBbFxwu2WolNg/
         UHAuVjBHjL86F0H9Sbc7NVTx2sh3FXGrMJfPwmfuyPua9FsmoYWxuE8HMlvYLe28BLKb
         jvA4P54SGvf/APzlQjLCrn0Jxqw3uf1rxhBFKraogx5qVibybmGb1Md4j0hGHjc3BulL
         bKSvKHtNYLrv1KQMsaE/uW1Q8Rdu84LK9HY5qlmDed+fuxJEZlvQrz4C8/YbLMWCQTah
         LmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790576063; x=1791180863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XaC6DkyMRoZdb4oAVjU9pdXNfcIMayAmSL3fDY/VEnU=;
        b=sif0o1jBgbCqIcoxwy1/GCGmIUAX2KwnJMawgHF/18O7Ctm1C5ZmiWbkPTmjvnhzwf
         64hVGh/7DhDFHj896ePNMf81Jy2cdHIhxvRUDFMgVhi9tieCMYCW3vdahEsS9I7n5mBP
         AYqf+vxQJrgHzVzbdcbNSsXdEWDBD3s4wOxnNarVxx9ElggIaSB0itA0y0TB8GCXs16u
         cIN1sLbKP/CX6EDUeedPQ5Gb9w61pNqA/Tskt31M7JsKw19hr+xxk6EoDhseWkX8L/yp
         zDoqTw9V0/SSwABgmav1c4TlWNTvPU1eMpE95zUbFg6Xa+GXaCdIvqNRLYjMXd7IpAhU
         KIJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQQCJmWm2v3Cn8PlUjTyk2czgkuJgbWQSlK3/C4+swPJxBICBKFyUFkeWv5ro2gQfh83w9Ge0LN9keAPM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+I5bMj5wUEcNAzpMyttYzuSpiE/3BL7KfOisvwY3+CxdEc5a3
	KcpI1nmcV0ILjvDQFspIXoOGhnlrYl+2pA09EJZeQFMYysn8+wcckZgl
X-Gm-Gg: AYBFou3IEZJ0fF/3j41EgaG1Fe03Hty0PnQfOJhZ1vg3YSoPVM7GkvqGni+dlXktzYW
	unItV/aujy22LKIyPhECBcoUGj4MB6KL8kwJBMpp+OERtAkCYBCmRvRzfCpbVmQ/qtGTiIGwdvm
	ZdZSETUbV7WTdsT4n9/9RY5rXKP3zTIS8Se3af4hqt9Ibt6MtUrU1s3Tm3tDtt4HVLB2g8lR93V
	MLadfShPOPts6Cv/H0Mt3LCEfGr5o6KrD4S7Goh7j9dbnwptdOYg8lRVgHLJoOSCKBbzAT1fy+z
	6lMQHOOk9FLWKnCJkO6+6jAl4WG/I5aHHKd5oQp2dpey2LFofz923VwR/b47/nAjw9bMeIUevvW
	qZQRZIGDeJ6lES6q6SpQvmAMGMRM73eTeI1+j+M1QnZ9HuIN1YpCuYJq71DFY2y4osj6YYD4X7F
	ngMh65VQ7XXNt5fWah8xTJMneJ7KDbz5OgdmzEpejhiRjp0qeoSeWhqVly3TgWry4ghRNbNMhK6
	ntkWjut6cCTVn+wyXic6QR+mmTCShYSKLSGl9BvcP5WYI6zesnnET/IFumo22xHucmgsaJz94b8
	0sY=
X-Received: by 2002:a17:90b:560f:b0:3a0:9aa4:f9bf with SMTP id 98e67ed59e1d1-3a0bb552f06mr6777589a91.12.1790576062923;
        Sun, 27 Sep 2026 23:14:22 -0700 (PDT)
Received: from yupeng-XPS-15-9520.. (c-73-169-192-12.hsd1.wa.comcast.net. [73.169.192.12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9892dbfsm18864088a91.11.2026.09.27.23.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:14:22 -0700 (PDT)
From: Peng Yu <yupeng0921@gmail.com>
To: Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>,
	Maurizio Lombardi <mlombard@arkamax.eu>,
	cgroups@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Yu <yupeng0921@gmail.com>
Subject: [PATCH v6 1/3] cgroup: track the effective css in each cgroup
Date: Sun, 27 Sep 2026 23:14:15 -0700
Message-ID: <20260928061417.1574676-2-yupeng0921@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928061417.1574676-1-yupeng0921@gmail.com>
References: <20260928061417.1574676-1-yupeng0921@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Track the effective css in each cgroup and make cgroup_e_css() and
cgroup_get_e_css() use it. When a css is brought online or offline,
update the effective css of its cgroup and of all descendants.

Signed-off-by: Peng Yu <yupeng0921@gmail.com>
Assisted-by: Claude:claude-fable-5 [Claude Code]
Assisted-by: Claude:claude-opus-5-5 [Claude Code]
---
 include/linux/cgroup-defs.h |  2 ++
 kernel/cgroup/cgroup.c      | 53 ++++++++++++++++++++++---------------
 2 files changed, 34 insertions(+), 21 deletions(-)

diff --git a/include/linux/cgroup-defs.h b/include/linux/cgroup-defs.h
index 3754d697854b..5bbe6025fc77 100644
--- a/include/linux/cgroup-defs.h
+++ b/include/linux/cgroup-defs.h
@@ -555,6 +555,8 @@ struct cgroup {
 	/* Private pointers for each registered subsystem */
 	struct cgroup_subsys_state __rcu *subsys[CGROUP_SUBSYS_COUNT];
 
+	struct cgroup_subsys_state __rcu *e_css[CGROUP_SUBSYS_COUNT];
+
 	/*
 	 * Keep track of total number of dying CSSes at and below this cgroup.
 	 * Protected by cgroup_mutex.
diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 2d532bf2c0c7..69b0f0cf2f3e 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -548,20 +548,11 @@ static struct cgroup_subsys_state *cgroup_e_css_by_mask(struct cgroup *cgrp,
 struct cgroup_subsys_state *cgroup_e_css(struct cgroup *cgrp,
 					 struct cgroup_subsys *ss)
 {
-	struct cgroup_subsys_state *css;
-
 	if (!CGROUP_HAS_SUBSYS_CONFIG)
 		return NULL;
 
-	do {
-		css = cgroup_css(cgrp, ss);
-
-		if (css)
-			return css;
-		cgrp = cgroup_parent(cgrp);
-	} while (cgrp);
-
-	return init_css_set.subsys[ss->id];
+	return rcu_dereference_check(cgrp->e_css[ss->id],
+				     lockdep_is_held(&cgroup_mutex));
 }
 
 /**
@@ -585,17 +576,10 @@ struct cgroup_subsys_state *cgroup_get_e_css(struct cgroup *cgrp,
 
 	rcu_read_lock();
 
-	do {
-		css = cgroup_css(cgrp, ss);
-
-		if (css && css_tryget_online(css))
-			goto out_unlock;
-		cgrp = cgroup_parent(cgrp);
-	} while (cgrp);
+	css = cgroup_e_css(cgrp, ss);
+	while (!css_tryget_online(css))
+		css = cgroup_e_css(cgroup_parent(css->cgroup), ss);
 
-	css = init_css_set.subsys[ss->id];
-	css_get(css);
-out_unlock:
 	rcu_read_unlock();
 	return css;
 }
@@ -2131,12 +2115,17 @@ void init_cgroup_root(struct cgroup_fs_context *ctx)
 {
 	struct cgroup_root *root = ctx->root;
 	struct cgroup *cgrp = &root->cgrp;
+	struct cgroup_subsys *ss;
+	int ssid;
 
 	INIT_LIST_HEAD_RCU(&root->root_list);
 	atomic_set(&root->nr_cgrps, 1);
 	cgrp->root = root;
 	init_cgroup_housekeeping(cgrp);
 
+	for_each_subsys(ss, ssid)
+		RCU_INIT_POINTER(cgrp->e_css[ssid], init_css_set.subsys[ssid]);
+
 	/* DYNMODS must be modified through cgroup_favor_dynmods() */
 	root->flags = ctx->flags & ~CGRP_ROOT_FAVOR_DYNMODS;
 	if (ctx->release_agent)
@@ -5856,6 +5845,22 @@ static void init_and_link_css(struct cgroup_subsys_state *css,
 	BUG_ON(cgroup_css(cgrp, ss));
 }
 
+static void cgroup_update_e_css(struct cgroup *cgrp, struct cgroup_subsys *ss)
+{
+	struct cgroup_subsys_state *d_css;
+
+	lockdep_assert_held(&cgroup_mutex);
+
+	css_for_each_descendant_pre(d_css, &cgrp->self) {
+		struct cgroup *dsct = d_css->cgroup;
+		struct cgroup_subsys_state *css = cgroup_css(dsct, ss);
+
+		if (!css)
+			css = cgroup_e_css(cgroup_parent(dsct), ss);
+		rcu_assign_pointer(dsct->e_css[ss->id], css);
+	}
+}
+
 /* invoke ->css_online() on a new CSS and mark it online if successful */
 static int online_css(struct cgroup_subsys_state *css)
 {
@@ -5869,6 +5874,7 @@ static int online_css(struct cgroup_subsys_state *css)
 	if (!ret) {
 		css->flags |= CSS_ONLINE;
 		rcu_assign_pointer(css->cgroup->subsys[ss->id], css);
+		cgroup_update_e_css(css->cgroup, ss);
 
 		atomic_inc(&css->online_cnt);
 		if (css->parent) {
@@ -5895,6 +5901,7 @@ static void offline_css(struct cgroup_subsys_state *css)
 
 	css->flags &= ~CSS_ONLINE;
 	RCU_INIT_POINTER(css->cgroup->subsys[ss->id], NULL);
+	cgroup_update_e_css(css->cgroup, ss);
 
 	wake_up_all(&css->cgroup->offline_waitq);
 }
@@ -5966,6 +5973,7 @@ static struct cgroup *cgroup_create(struct cgroup *parent, const char *name,
 {
 	struct cgroup_root *root = parent->root;
 	struct cgroup *cgrp, *tcgrp;
+	struct cgroup_subsys *ss;
 	struct kernfs_node *kn;
 	int i, level = parent->level + 1;
 	int ret;
@@ -6010,6 +6018,9 @@ static struct cgroup *cgroup_create(struct cgroup *parent, const char *name,
 	for (tcgrp = cgrp; tcgrp; tcgrp = cgroup_parent(tcgrp))
 		cgrp->ancestors[tcgrp->level] = tcgrp;
 
+	for_each_subsys(ss, i)
+		RCU_INIT_POINTER(cgrp->e_css[i], cgroup_e_css(parent, ss));
+
 	/*
 	 * New cgroup inherits effective freeze counter, and
 	 * if the parent has to be frozen, the child has too.
-- 
2.53.0

