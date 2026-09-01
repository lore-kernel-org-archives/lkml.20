Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69B32F3C18
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226171; cv=none; b=myI3l6c594+GvIeIeOLKIg2Avm2EXcQuIiXw5N/ynAjmEf7TmWqKjSytrxX013g201AKbCgmqPfoIO+M5GJH/sAI5tCBy1aAfgv3IhBUKWBf8kfnEMOj6LWMPWx73KKAwlPfFs4NPPiFd13E5Xqn14PzGlGszBxBfohvY6jEnKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226171; c=relaxed/simple;
	bh=HHPbnFg/6LLSJDTZN4vrpNfAb2y21Om1UreVNkgyK0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UeGcA/KsvrtOC8ecwK13KWpF2SfaZEquHEHkNg//2G2m+1FRoDiaFetKN87uSrf2Bngx5UkL8xLhE+Le2yKQHYD7Gx8F9e2k79myXVVOwo8ECRP+OQ1DzQBFIPh4+rjtZsh/oK6M0SO97X+BzRQo2VTEP2KaHEjRronJZx8Xm64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=T/9ByHfo; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="T/9ByHfo"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso388147a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1788226167; x=1788830967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0NVKKl81fU/CQuRIFdsvNj0ubnql/KKTqeCqVjLnots=;
        b=T/9ByHfo1euqtz/8zbhqYVERx+jegEL/9230KfXDARbr7GZ8fJx1JTMSZ26VKeMPXD
         ei2ycz6GizhpMtrpTcvi5wSvT7xS6Gj4hnNr1tYryiJxDIKZAKMLzacjxQLL59WjaJ84
         /mXUC7q0kdnRulAO/r0t5uk3QmeLYxEuV6mbW7ZcG3wfXCrfn6eDvYSHp+ye9hwRoxGV
         bzOZcvDyl99O3fVs2Z8jXM9+huHpZzBUQpLNx2xNkHinwWsU7KIMA/Cxpsn4Aqg8CFjU
         QEmOiLqMAGhQu4zqH24N44B8xn/96AcognEe6E55QD3PVYv6gj7QY8ie8uVykBeyNnjH
         6E9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226167; x=1788830967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0NVKKl81fU/CQuRIFdsvNj0ubnql/KKTqeCqVjLnots=;
        b=bqTyKXlgsYJM4e+82sOrKdyoiz3SNS5eF5Puj0uLQrzBceAXsA73uFsPG1gdPtI6fQ
         DtUa/FTQMthBNNrqJhk6IBYXwHKaPAdm1xziJNXYR8oZZoWNnkKaAR+daiCtc5uyjNPG
         OJSwVrnU66zFh8l7t24wul6SyK6HhS5m9RpeE6iM+qbgzD40ILsudlFscK5e/HBxgwra
         c1pyuYkr/DdIOOKXHX0ViF321EawDARtmwa295X4f0VooD8kJKX3bzblvrbO1P389MYK
         2d7x38w1ARY1prva+r0rzHtdqLxWeIeh33P2Rd7x+43SIE65woHWxVvrbHrLIVrsJppE
         zY1g==
X-Forwarded-Encrypted: i=1; AKwUvByvczykvKPMwi2Ts7DNlpmIAGz63iH2OPPUi1sHVI1FoLw/4sG4r/AEjY21jFDmW/tKVFkxH/XoNIniKYs=@vger.kernel.org
X-Gm-Message-State: AFuF++k0rxy7T3u2C7TSxrSyVpUwkZ+sGtni4L0LH6kf3o8vp8gBz1nu
	txGwDgZk/gjm4VmhIexIzjc+DwyWZaNuSRlD2TJvcoWftxW7wIqN/CZ1tYRz2eynSMw=
X-Gm-Gg: AYBFou2tIK7nYmBogsztxU8DT6dKDPYtq7DbKzsv8f/v7epKmvHyVZ6TlCQMsQABUGJ
	jZGBhZFTfJxIwDyK5q/2+ZGRec1N7pAwuW6Xxy5TYz4hPXWYHPpQW6+goEB+PBNLxxbvCjrJclp
	TtQwXDTV53O3socZJTsk8gi+GqYMJurYjqGBIthuqr4O4OfB/bXWdWxPnvWs8W6PgDwk7fN0dix
	llvhwr5oxwNcnODw9h50ihP8kPC1XXTqq1pUmGY2DjhvvZbKcFQN0SOHvl5ht+WYy9+x/EBfObq
	iydQZ/gJUtpgpfB4+tgO0QKYglxts+prPCN77JD09Rb7mKfEe9CEnXWAKyV0leicbes4dR3b5hd
	brHu66qnlwX7kmyYT8vx4PByUMDxxuvAIAyoE4i5IC74XeP+jwUqaFW4fLbrpN3HBy17SwHYGgl
	MVhyevc312hVjZAP76ZEK7SRtzy3szo8HxH+5kjwsywupPDoxJmTS51yz0ikkpK1A=
X-Received: by 2002:a17:90a:c110:b0:396:7c01:553f with SMTP id 98e67ed59e1d1-3990f8a8dc3mr2030397a91.21.1788226167356;
        Mon, 31 Aug 2026 18:29:27 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b5bef7683sm19390817eec.12.2026.08.31.18.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:29:26 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Mon, 31 Aug 2026 18:29:20 -0700
Subject: [PATCH v7 02/10] of: update /aliases lookup on reconfig
 notifications
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-nh-of-alias-overlay-v7-2-02754604805a@nexthop.ai>
References: <20260831-nh-of-alias-overlay-v7-0-02754604805a@nexthop.ai>
In-Reply-To: <20260831-nh-of-alias-overlay-v7-0-02754604805a@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawnguo@kernel.org>, 
 Grant Likely <grant.likely@secretlab.ca>, 
 Grant Likely <grant.likely@linaro.org>, 
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>, 
 David Daney <david.daney@cavium.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788226164; l=11267;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=HHPbnFg/6LLSJDTZN4vrpNfAb2y21Om1UreVNkgyK0A=;
 b=EBuWe1hDbi1tsoCCSvqwENOllyrKYHQUWmSIpIk3eCgiy97GoyUg9lfrp2XlNmPkfS6elWMrl
 j8d/JRvdAVIAtTNk88GnfBcbpJ3QnaYFW0OEX9GHIIcqsV2ei87Zrjf
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Aliases added by overlays never make it into aliases_lookup, which is
only filled by of_alias_scan() at boot. of_alias_get_id() returns
-ENODEV for them and drivers using alias based numbering (i2c, spi,
tty, mmc) fall back to dynamic ids.

Register a reconfig notifier and mirror /aliases property changes
into aliases_lookup. The notifier chain covers changesets and
overlays, so no overlay specific hook is needed. Same approach as
Geert's 2015 series [1], which was never reposted;
of_alias_create()/of_alias_destroy() keep its names.

The /aliases node is matched by name and root parent instead of the
of_aliases pointer, which is still NULL when an overlay creates the
node on a system without a boot-time /aliases. The name match is
exact, of_node_name_eq() would also match "aliases@1". ATTACH stores
the node in of_aliases with a reference held, DETACH drops it again
and flushes aliases_lookup. The reference makes the lock-free
of_node_get(of_aliases) in of_find_node_opts_by_path() safe: a reader
that observes a non-NULL pointer observes a live node, and on DETACH
the changeset holds its own references across the notifier so the put
here cannot be the final one while readers still walk the node.
Nodes attached with properties already set are not scanned, as
before.

Lookup entries are created by of_alias_scan()'s old loop body, moved
into of_alias_create(). Entries created at runtime have kstrdup'ed
names and an of_node_get'ed target and are flagged "owned" so
of_alias_destroy() knows what to kfree(); boot entries live in
memblock and are only unlinked. Removal matches entries regardless of
ownership so updating a boot-time alias does not leave duplicates
behind, which was Grant's main concern on the old series [2].

A new aliases_mutex protects the list. of_mutex does not work here:
the notifier runs under it on the overlay path but outside of it on
the of_add_property() path.

of_alias_create() skips names that are empty or all digits instead of
creating an entry with an empty stem.

Only built for CONFIG_OF_DYNAMIC: there are no notifications without
it and the register stub returns -EINVAL.

Link: https://lore.kernel.org/lkml/1435675876-2159-1-git-send-email-geert+renesas@glider.be/ [1]
Link: https://lore.kernel.org/lkml/20150630172131.D4E6CC4041A@trevor.secretlab.ca/ [2]
Assisted-by: Claude:claude-fable-5 [Claude Code]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/of/base.c       | 199 ++++++++++++++++++++++++++++++++++++++----------
 drivers/of/device.c     |   4 +-
 drivers/of/of_private.h |  14 ++++
 3 files changed, 175 insertions(+), 42 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index f7aa14d90e50..23d9bb073d8b 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1926,6 +1926,159 @@ static void of_alias_add(struct alias_prop *ap, struct device_node *np,
 		 ap->alias, ap->stem, ap->id, np);
 }
 
+/*
+ * Protects aliases_lookup and of_aliases. of_alias_scan() runs single-
+ * threaded at init and skips it; every other reader/writer must hold it.
+ */
+DEFINE_MUTEX(aliases_mutex);
+
+/* Callers other than of_alias_scan() must hold @aliases_mutex. */
+static void of_alias_create(const struct property *pp,
+			    void *(*dt_alloc)(u64 size, u64 align),
+			    bool owned)
+{
+	const char *start = pp->name;
+	const char *end;
+	struct device_node *np;
+	struct alias_prop *ap;
+	const char *dup;
+	int id, len;
+
+	if (is_pseudo_property(pp->name))
+		return;
+
+	if (!of_alias_value_ok(pp))
+		return;
+
+	np = of_find_node_by_path(pp->value);
+	if (!np)
+		return;
+
+	end = start + strlen(start);
+	while (end > start && isdigit(*(end - 1)))
+		end--;
+	len = end - start;
+	if (len == 0)
+		goto out_put;
+
+	if (kstrtoint(end, 10, &id) < 0)
+		goto out_put;
+
+	ap = dt_alloc(sizeof(*ap) + len + 1, __alignof__(*ap));
+	if (!ap)
+		goto out_put;
+	memset(ap, 0, sizeof(*ap) + len + 1);
+
+	if (owned) {
+		dup = kstrdup(pp->name, GFP_KERNEL);
+		if (!dup) {
+			kfree(ap);
+			goto out_put;
+		}
+	} else {
+		dup = start;
+	}
+	ap->alias = dup;
+	ap->owned = owned;
+	of_alias_add(ap, np, id, start, len);
+	return;
+
+out_put:
+	of_node_put(np);
+}
+
+#ifdef CONFIG_OF_DYNAMIC
+/* Unlink @ap; free its storage if it was runtime-allocated. */
+static void __of_alias_del(struct alias_prop *ap)
+{
+	list_del(&ap->link);
+	of_node_put(ap->np);
+	if (ap->owned) {
+		kfree(ap->alias);
+		kfree(ap);
+	}
+}
+
+/* Callers must hold @aliases_mutex. */
+static void of_alias_destroy(const char *name)
+{
+	struct alias_prop *ap, *tmp;
+
+	list_for_each_entry_safe(ap, tmp, &aliases_lookup, link) {
+		if (strcmp(ap->alias, name) != 0)
+			continue;
+		__of_alias_del(ap);
+		return;
+	}
+}
+
+static void *alias_alloc(u64 size, u64 align)
+{
+	return kzalloc(size, GFP_KERNEL);
+}
+
+/* Callers must hold @aliases_mutex. */
+static void of_aliases_forget_all(void)
+{
+	struct alias_prop *ap, *tmp;
+
+	list_for_each_entry_safe(ap, tmp, &aliases_lookup, link)
+		__of_alias_del(ap);
+}
+
+static int of_aliases_reconfig_notifier(struct notifier_block *nb,
+					unsigned long action, void *arg)
+{
+	struct of_reconfig_data *rd = arg;
+
+	/* of_aliases may still be NULL when an overlay creates the node */
+	if (!rd->dn || !of_node_is_aliases(rd->dn))
+		return NOTIFY_DONE;
+
+	mutex_lock(&aliases_mutex);
+	switch (action) {
+	case OF_RECONFIG_ATTACH_NODE:
+		if (!of_aliases)
+			of_aliases = of_node_get(rd->dn);
+		break;
+	case OF_RECONFIG_DETACH_NODE:
+		if (of_aliases == rd->dn) {
+			of_aliases = NULL;
+			of_aliases_forget_all();
+			of_node_put(rd->dn);
+		}
+		break;
+	case OF_RECONFIG_ADD_PROPERTY:
+		of_alias_create(rd->prop, alias_alloc, true);
+		break;
+	case OF_RECONFIG_REMOVE_PROPERTY:
+		of_alias_destroy(rd->prop->name);
+		break;
+	case OF_RECONFIG_UPDATE_PROPERTY:
+		if (rd->old_prop)
+			of_alias_destroy(rd->old_prop->name);
+		of_alias_create(rd->prop, alias_alloc, true);
+		break;
+	default:
+		break;
+	}
+	mutex_unlock(&aliases_mutex);
+	return NOTIFY_OK;
+}
+
+static struct notifier_block of_aliases_nb = {
+	.notifier_call = of_aliases_reconfig_notifier,
+};
+
+static int __init of_aliases_reconfig_init(void)
+{
+	return of_reconfig_notifier_register(&of_aliases_nb);
+}
+
+/* of_alias_scan() runs pre-initcall, so the boot-time scan is complete */
+core_initcall_sync(of_aliases_reconfig_init);
+#endif /* CONFIG_OF_DYNAMIC */
+
 /**
  * of_alias_scan - Scan all properties of the 'aliases' node
  * @dt_alloc:	An allocator that provides a virtual address to memory
@@ -1961,42 +2114,8 @@ void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
 	if (!of_aliases)
 		return;
 
-	for_each_property_of_node(of_aliases, pp) {
-		const char *start = pp->name;
-		const char *end = start + strlen(start);
-		struct device_node *np;
-		struct alias_prop *ap;
-		int id, len;
-
-		/* Skip those we do not want to proceed */
-		if (is_pseudo_property(pp->name))
-			continue;
-
-		np = of_find_node_by_path(pp->value);
-		if (!np)
-			continue;
-
-		/* walk the alias backwards to extract the id and work out
-		 * the 'stem' string */
-		while (end > start && isdigit(*(end - 1)))
-			end--;
-		len = end - start;
-
-		if (kstrtoint(end, 10, &id) < 0) {
-			of_node_put(np);
-			continue;
-		}
-
-		/* Allocate an alias_prop with enough space for the stem */
-		ap = dt_alloc(sizeof(*ap) + len + 1, __alignof__(*ap));
-		if (!ap) {
-			of_node_put(np);
-			continue;
-		}
-		memset(ap, 0, sizeof(*ap) + len + 1);
-		ap->alias = start;
-		of_alias_add(ap, np, id, start, len);
-	}
+	for_each_property_of_node(of_aliases, pp)
+		of_alias_create(pp, dt_alloc, false);
 }
 
 /**
@@ -2014,7 +2133,7 @@ int of_alias_get_id(const struct device_node *np, const char *stem)
 	struct alias_prop *app;
 	int id = -ENODEV;
 
-	mutex_lock(&of_mutex);
+	mutex_lock(&aliases_mutex);
 	list_for_each_entry(app, &aliases_lookup, link) {
 		if (strcmp(app->stem, stem) != 0)
 			continue;
@@ -2024,7 +2143,7 @@ int of_alias_get_id(const struct device_node *np, const char *stem)
 			break;
 		}
 	}
-	mutex_unlock(&of_mutex);
+	mutex_unlock(&aliases_mutex);
 
 	return id;
 }
@@ -2042,7 +2161,7 @@ int of_alias_get_highest_id(const char *stem)
 	struct alias_prop *app;
 	int id = -ENODEV;
 
-	mutex_lock(&of_mutex);
+	mutex_lock(&aliases_mutex);
 	list_for_each_entry(app, &aliases_lookup, link) {
 		if (strcmp(app->stem, stem) != 0)
 			continue;
@@ -2050,7 +2169,7 @@ int of_alias_get_highest_id(const char *stem)
 		if (app->id > id)
 			id = app->id;
 	}
-	mutex_unlock(&of_mutex);
+	mutex_unlock(&aliases_mutex);
 
 	return id;
 }
diff --git a/drivers/of/device.c b/drivers/of/device.c
index be4e1584e0af..5ca249fca02f 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -238,7 +238,7 @@ void of_device_uevent(const struct device *dev, struct kobj_uevent_env *env)
 	add_uevent_var(env, "OF_COMPATIBLE_N=%d", seen);
 
 	seen = 0;
-	mutex_lock(&of_mutex);
+	mutex_lock(&aliases_mutex);
 	list_for_each_entry(app, &aliases_lookup, link) {
 		if (dev->of_node == app->np) {
 			add_uevent_var(env, "OF_ALIAS_%d=%s", seen,
@@ -246,7 +246,7 @@ void of_device_uevent(const struct device *dev, struct kobj_uevent_env *env)
 			seen++;
 		}
 	}
-	mutex_unlock(&of_mutex);
+	mutex_unlock(&aliases_mutex);
 }
 EXPORT_SYMBOL_GPL(of_device_uevent);
 
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 9bba999f0bf8..731b606ae3e3 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -17,6 +17,11 @@
  * @alias:	Alias property name
  * @np:		Pointer to device_node that the alias stands for
  * @id:		Index value from end of alias name
+ * @owned:	True for runtime entries, where the struct and @alias are
+ *		kmalloc'd/kstrdup'd and freed on removal. False for boot-time
+ *		entries, which live in memblock (@alias points into the FDT)
+ *		and are only unlinked. Every entry holds a reference on @np;
+ *		removal drops it regardless of @owned.
  * @stem:	Alias string without the index
  *
  * The structure represents one alias property of 'aliases' node as
@@ -27,6 +32,7 @@ struct alias_prop {
 	const char *alias;
 	struct device_node *np;
 	int id;
+	bool owned;
 	char stem[];
 };
 
@@ -40,6 +46,7 @@ struct alias_prop {
 
 extern struct mutex of_mutex;
 extern raw_spinlock_t devtree_lock;
+extern struct mutex aliases_mutex;
 extern struct list_head aliases_lookup;
 extern struct kset *of_kset;
 
@@ -223,6 +230,13 @@ static inline bool of_alias_value_ok(const struct property *pp)
 	       strnlen(pp->value, pp->length) < pp->length;
 }
 
+/* the /aliases node: root child with the exact name "aliases" */
+static inline bool of_node_is_aliases(const struct device_node *np)
+{
+	return of_node_is_root(np->parent) &&
+	       !strcmp(kbasename(np->full_name), "aliases");
+}
+
 #if IS_ENABLED(CONFIG_KUNIT)
 int __of_address_resource_bounds(struct resource *r, u64 start, u64 size);
 #endif

-- 
2.54.0

