Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833853;
	b=GZZJeyxt5u8gDxiLj60l3fUqo8OVW935HRjOXe7jFmPZOxEeWcjNaxvtiV+JSWDsBWn4
	 jEp6c9uNoklirIREUpKXOCZjHtIp4nQ5Bugl9Gqt+pFnW0zDnkX7doH0djYoEDVzRetKx
	 Fj8c9gCL4USiqFWdOxpcv7GZpgC4/XYlWrRiB5yNJTIH/Q/DDpIBMcU257OUc5CifCQwE
	 I0jTIaYzE2U+ZTnu3HKVFktre0uF6/DuHaIWdque9mXREz/lZGo2O4mx6hCZylD0ChuLx
	 bwSwNl5IhBhhY+byFrIi3vqr7J6uk2pltUe7XLHh6dXQyJ6AIoLu8jS4u3d7wGBH7SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9lJTku6tZLx6gKrffgVjANOZdcGCC7AXBaK81+9zGYE=;
	b=APQm65LQUzsUyuoL0zJNLAuIO4dJJpw2oLpZqPySb51q8B+3EzO/wukGLZgP4r9wUUtR
	 lugcD74Bg/koykMXzPq7U7+y/jMt9RIcP/q7y//0GthGwKeDWgq3drELilnHpOE8eyznb
	 gGMwybAUM9+4YhLFhcAaW9ffE1zr23QBAM+ZT+qWwImhkc4V3ZXloprv0XjMwkQax4LaH
	 ynZLe2AqVSSXA28byzhnJWKh7014P3Lj2NtxHch7vqOPzdK/i3fiK/FPeU4Bzdb5mlEwG
	 FNhUn2gzuVvzOHdpH0Xo6N4/j15ES8Vdho07ce7ZLZYfTBjdQod46x2VDUpEpUCljJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=peNOYkXB;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60F6606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D60F6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=peNOYkXB
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-53aa0802881so605798b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793833852; x=1794438652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9lJTku6tZLx6gKrffgVjANOZdcGCC7AXBaK81+9zGYE=;
        b=peNOYkXBykh5hzcRhdfilpYXoUuuRG3sK0s9aagDiqbAuXWBhH9lXpDftM39uVsKUn
         nLDBR0fRDWcwO9MpLkFRWNe3KuJbrlG6lmb9FugsGCH6hkb40P6tqMLoTYOj7gdWGj5k
         +5Mlrqz5MBqpTd7Cmb1HdJN7jZn4a6dZmhe0aAbme7UhTBN9rN7SVV5K4D66jtkcG93m
         iL2UtG1Zl5aMbYxD4i2sW9LXZ+uve/DnCQfv/Il2Awcc2sdsNM/jVPFEvDxktUoeRcQM
         uHiI/XCUazDziJdVkzmYwgYvqp3+zkzlQE7c19xvz26VU1wojYm5JQFCM+/wew2CD06F
         ovOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833852; x=1794438652;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9lJTku6tZLx6gKrffgVjANOZdcGCC7AXBaK81+9zGYE=;
        b=1due2h15RuovuyAglstGOatLQl5/RZb/9S8vxCpDRhgIJF/6qFooU2EgcqcuJZvg2+
         C6hnOEbb6oquKvaQndCiSA7d+NTDLHpMNPaN9FAFu0sTTpL5XCkpOUTFzNT1ODlA8Ge2
         o/o3wdiRormhisuJEd8kv9bpw139JzHwhf+b5nlO1Ythfz2yeKzUljggSnRW/hJISMR9
         hOCGzBwyWJX80UBF0C/fXfIjnY7TeDj3mBhED7jzqbdgyiyaqP5TKM1cr3f07qI/0Ijf
         2e+vIsvxtxj2e6bOgTQwrnwJ/lCjfdY0Lk+iVSuKTOSpgdOdhbrfG9NjolhqjHuR10mA
         tbug==
X-Forwarded-Encrypted: i=1; AKwUvBxuo+tUE8Ub+U27dzj5AMpEMOG/cLF00EUHvy1P95XZ4JrbqDja4qyzODuRHXWZZMGD2Fm7EpsEXuq2P5U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8We7oRupKr5rNMiZuVbzOyv3MTZDtElSERzZGNqvbS4t4E+sQT
	l17x8+YamdzUVAiqJNhd2iqIfyQtcWCDuyF0OMR2AerORpDUsdHEBuw3RPgWK7u/
X-Gm-Gg: AYBFou1cfVjjLO2uYGtX8VesJwDyRBPykpDqbcV5hGeGBxQhCFaBNRyYya483STBnff
	jAs81UV/Sep8+MaNK6vmlXAa23nAZh5+wL6PohYJy4miHyjaYkyrRA8XkBSzYJZiMxUTbOkQatE
	4Xk48R8uklNw1ZztQJYqyohdJsE/TgVnH1fMZamZijX8D8ZK+y9Y8pMclfZv/50Eq0V/wq2nMgN
	IbBp9vpmVJLdwKqyfECVBeADLouop1mn5uBfP1qvAo2wuvl31RhMCtvJtR65YmfPuE1EJylync9
	Zb1a8DTGrWwo6qHdCATGkKc7rzdxrs9Rct1AaMFFntjTcDIesykYGffqeGy6qWpOEvsKf/bnUr/
	3B96Dh5+r0NI4Mhtc0+mNJdFcZxRMcKrwZAlJC4TGJm9LvlXSkCVbHXxwhQq45P6Of+sZLTrxIH
	MVOkA0OSU/GtNiUCpgQqo9+hW6qPk82TEVGlw6fwir6+Wr9raUsnZNYHk/pUqofRfVLPpIdMUKz
	UCnJXcVGroa3UNKLX5ncWDPRpymmizbkfZUFBGFR78MsOBO2LikGYskZoVsisFQoFYV48HloQqD
	vXqtTaJt3VgZHN2s7scL/bDbhZwY9A==
X-Received: by 2002:a17:902:dacf:b0:2e2:dfe4:adab with SMTP id d9443c01a7336-2eb36426d08mr166711845ad.10.1793833384590;
        Wed, 04 Nov 2026 15:03:04 -0800 (PST)
Received: from cxlqual.. ([220.120.90.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed0908587dsm10999175ad.36.2026.11.04.15.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 15:03:04 -0800 (PST)
From: Anisa Su <anisa.su887@gmail.com>
X-Google-Original-From: Anisa Su <anisa.su@samsung.com>
To: linux-cxl@vger.kernel.org
Cc: nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ira Weiny <iweiny@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Fan Ni <nifan.cxl@gmail.com>,
	Li Ming <ming.li@zohomail.com>,
	Benjamin Cheatham <benjamin.cheatham@amd.com>,
	Gregory Price <gourry@gourry.net>,
	Richard Cheng <icheng@nvidia.com>,
	Anisa Su <anisa.su@samsung.com>
Subject: [PATCH v1 10/14] cxl/extent: Enforce cross-region tag uniqueness
Date: Thu,  5 Nov 2026 08:02:34 +0900
Message-ID: <20261104230445.66625-11-anisa.su@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104230445.66625-1-anisa.su@samsung.com>
References: <20261104230445.66625-1-anisa.su@samsung.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A tag uuid identifies one allocation across all regions and memdevs,
but nothing checks a new group's tag against the allocations already
live on the host: cxlr_add_extent() only compares it with the chain
group being assembled.  The orchestrator owns tag allocation and is
responsible for global uniqueness, but if a firmware bug or other issue
causes a repeated tag, the kernel should also reject it.

Add a host-wide list of live tag groups with non-null uuids.  Null uuids
are skipped because untagged extents are not associated with a single
logical allocation.

Check the list during tag group validation and return -EEXIST if the tag
is already live on the host via cxl_tag_already_committed().  New tags
are inserted to the list via cxl_tag_register(), which inserts atomically
under cxl_tag_lock.

Signed-off-by: Anisa Su <anisa.su@samsung.com>
Tested-by: Wonjae Lee <wj28.lee@samsung.com>
Tested-by: Junhee Park <jh9934.park@samsung.com>
Tested-by: Heesoo Kim <habil.kim@samsung.com>
---
 drivers/cxl/core/core.h   |  6 +++++
 drivers/cxl/core/extent.c | 56 +++++++++++++++++++++++++++++++++++++++
 drivers/cxl/core/mbox.c   | 16 +++++++++++
 drivers/cxl/cxl.h         |  3 +++
 4 files changed, 81 insertions(+)

diff --git a/drivers/cxl/core/core.h b/drivers/cxl/core/core.h
index 528eec2a1cc3..b7f8886db498 100644
--- a/drivers/cxl/core/core.h
+++ b/drivers/cxl/core/core.h
@@ -79,6 +79,7 @@ void kill_regions(struct cxl_root_decoder *cxlrd);
 
 int cxl_add_extent(struct cxl_memdev_state *mds, struct cxl_extent *extent,
 		   u16 seq_num);
+bool cxl_tag_already_committed(const uuid_t *tag);
 int online_tag_group(struct cxl_dc_tag_group *group);
 bool rm_tag_group(struct cxl_dc_tag_group *group);
 void discard_tag_group(struct cxl_dc_tag_group *group);
@@ -117,6 +118,11 @@ static inline int cxl_dax_untagged_add(struct cxl_dax_region *cxlr_dax)
 	return 0;
 }
 
+static inline bool cxl_tag_already_committed(const uuid_t *tag)
+{
+	return false;
+}
+
 static inline
 struct cxl_region *cxl_dpa_to_region(const struct cxl_memdev *cxlmd, u64 dpa,
 				     struct cxl_endpoint_decoder **cxled)
diff --git a/drivers/cxl/core/extent.c b/drivers/cxl/core/extent.c
index 334a97ab583d..4a59db823af4 100644
--- a/drivers/cxl/core/extent.c
+++ b/drivers/cxl/core/extent.c
@@ -6,6 +6,54 @@
 
 #include "core.h"
 
+/*
+ * Host-wide list of live tag groups with non-null uuids: a tag uuid
+ * identifies exactly one allocation across all regions and memdevs.
+ * The orchestrator owns tag allocation; this rejects a repeated tag
+ * from a firmware bug or other issue.  Untagged (null uuid) extents are
+ * not tracked: they are not associated with a single allocation.
+ */
+static DEFINE_MUTEX(cxl_tag_lock);
+static LIST_HEAD(cxl_tag_groups);
+
+static int cxl_tag_register(struct cxl_dc_tag_group *grp)
+{
+	struct cxl_dc_tag_group *g;
+
+	if (uuid_is_null(&grp->uuid))
+		return 0;
+
+	guard(mutex)(&cxl_tag_lock);
+	list_for_each_entry(g, &cxl_tag_groups, registry_node)
+		if (uuid_equal(&g->uuid, &grp->uuid))
+			return -EBUSY;
+	list_add_tail(&grp->registry_node, &cxl_tag_groups);
+	return 0;
+}
+
+static void cxl_tag_unregister(struct cxl_dc_tag_group *grp)
+{
+	if (uuid_is_null(&grp->uuid))
+		return;
+
+	guard(mutex)(&cxl_tag_lock);
+	list_del(&grp->registry_node);
+}
+
+bool cxl_tag_already_committed(const uuid_t *tag)
+{
+	struct cxl_dc_tag_group *g;
+
+	if (uuid_is_null(tag))
+		return false;
+
+	guard(mutex)(&cxl_tag_lock);
+	list_for_each_entry(g, &cxl_tag_groups, registry_node)
+		if (uuid_equal(&g->uuid, tag))
+			return true;
+	return false;
+}
+
 static struct cxl_dc_tag_group *to_dc_tag_group(struct device *dev)
 {
 	return container_of(dev, struct cxl_dc_tag_group, dev);
@@ -15,6 +63,7 @@ static void dc_tag_group_release(struct device *dev)
 {
 	struct cxl_dc_tag_group *group = to_dc_tag_group(dev);
 
+	cxl_tag_unregister(group);
 	xa_destroy(&group->dc_extents);
 	/* Drop the pin taken in alloc_tag_group(). */
 	put_device(&group->cxlr_dax->dev);
@@ -93,12 +142,19 @@ static struct cxl_dc_tag_group *
 alloc_tag_group(struct cxl_dax_region *cxlr_dax, uuid_t *uuid)
 {
 	struct cxl_dc_tag_group *group __free(kfree) = kzalloc_obj(*group);
+	int rc;
+
 	if (!group)
 		return ERR_PTR(-ENOMEM);
 
 	group->cxlr_dax = cxlr_dax;
 	uuid_copy(&group->uuid, uuid);
 	xa_init(&group->dc_extents);
+	INIT_LIST_HEAD(&group->registry_node);
+
+	rc = cxl_tag_register(group);
+	if (rc)
+		return ERR_PTR(rc);
 
 	/*
 	 * Pin cxlr_dax: it is used after cxl_rwsem.region is dropped, so a
diff --git a/drivers/cxl/core/mbox.c b/drivers/cxl/core/mbox.c
index a1d3e04a1e1b..0fa501f5800c 100644
--- a/drivers/cxl/core/mbox.c
+++ b/drivers/cxl/core/mbox.c
@@ -1640,6 +1640,22 @@ static int cxl_validate_group(struct cxl_memdev_state *mds, const uuid_t *tag,
 	struct device *dev = mds->cxlds.dev;
 	struct cxl_extent_list_node *pos;
 
+	/*
+	 * Cross-More-chain uniqueness.  A non-null tag seen in this group must
+	 * not already correspond to a committed tag group anywhere on this
+	 * host.  More=0 was supposed to close that allocation, and tag uuids
+	 * must be unique across all regions and memdevs (the orchestrator owns
+	 * assignment per spec).  Either constraint failing — same chain
+	 * redelivered, or two distinct allocations colliding on the same uuid —
+	 * is a firmware/orchestrator bug; reject the whole group.
+	 */
+	if (cxl_tag_already_committed(tag)) {
+		dev_warn_ratelimited(dev,
+				     "Tag %pUb: dropping group, tag already committed (firmware/orchestrator bug)\n",
+				     tag);
+		return -EEXIST;
+	}
+
 	/* Sequence-number integrity */
 	if (cxl_check_group_seq(dev, tag, group, shareable))
 		return -EINVAL;
diff --git a/drivers/cxl/cxl.h b/drivers/cxl/cxl.h
index f7d7749d704c..79f5773f8f81 100644
--- a/drivers/cxl/cxl.h
+++ b/drivers/cxl/cxl.h
@@ -642,6 +642,8 @@ struct cxl_dax_region {
  *		allocations.
  * @nr_extents: live count of dc_extents in the group; the group is freed
  *		when the last dc_extent device is released.
+ * @registry_node: anchor in the host-wide non-null-tag registry that
+ *		enforces tag uuid uniqueness across all regions and memdevs.
  */
 struct cxl_dc_tag_group {
 	struct device dev;
@@ -649,6 +651,7 @@ struct cxl_dc_tag_group {
 	uuid_t uuid;
 	struct xarray dc_extents;
 	unsigned int nr_extents;
+	struct list_head registry_node;
 };
 
 bool is_dc_extent(struct device *dev);
-- 
2.43.0

