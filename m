Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3FF3FA5E9
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792019861; cv=none; b=uJPm85ucREnC8qsnb0REPZy/KgaYbBbGYOwzjWbr+BRSrqyoVg8JkVzePy6NE0sTLeeJszU4SmPowQFfvLLVCK9HvAZ2fHPY4hYt2O8M+JD6ObNpWXiil8ePf4/8WeW5K41KpmjCa63eYJzToFCleLFsLyN6Pm4y/P7pW6XDd28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792019861; c=relaxed/simple;
	bh=hgklcj9z6UPDcn2R9xqRKid9oojIiglf5AJRjZMYTxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SCweDU0KwpA7PHRRF4RyjApreARrXWZ3Z/xbvaQ0fnfHbxCaSyFypWABzbc5ZPnsW/98emwskwJ2JVuOZotbFjjVMK14Nki70jNP3hgSdvHw2bfP7IFtBxi1OKG+E/9r087TyNXiaSbR9xqEXIdHNe0wiwt5XBg6rcZOkQ4HqyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=DeL8dek3; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="DeL8dek3"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35aa0cf7c40so4660891eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792019858; x=1792624658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2Yxgh/6S662lF34ySeKVuwMWJaUOKKeneolxymqjf8=;
        b=DeL8dek3rmtTAcQuHlSoI5EX4rgTyTFQc9SfCal89RLmhl14KRfcVwiiNZbj5C5zPO
         88xynWskxHb9wfVoZiLXlZtZ1cJvCkhLr544fdcPOHSQVJuqYzGwGwQZ5vmkdtQ553o6
         kWRHMXa2wSik3n5eDn9w8y2MJNxtpDqbsDwmT79xp9FR0wzsdriS1CFZLytfpVmEzYfi
         vFgLKpFoCw4X8eg19lG5pkyy1vkHpGd4eZrlSJc86By1vJHuYDOqVbydlXGYGPvcNvav
         J+q+3fdpNVwFzt/om9czEIuUdu9KTjafkznLp0GvEuTCxhjhwkkC7BFQ2VqU353pLnIU
         FwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792019858; x=1792624658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2Yxgh/6S662lF34ySeKVuwMWJaUOKKeneolxymqjf8=;
        b=OsuHM+UJWfZFecY2rbRDdnjKqXbQjKF59UHVU68O6Ap5xBPZJhnrhwm0pug3I9PQBU
         IlY8I8zknudo5E8fkd8AEQKq+4lhHgyUoZK1pbgY8VXtsTF94qMOCWRfZZgz/lUziivZ
         7t3ZAMZSr+XqIycuIgllA0ZTLYFyLmDaq1Zm0cn7HkPs/ZWr0W4JMCiRG5GL8zho5yp3
         8wrb1osY+SW2OhNZmHM27vpzK5L8JeTA8VnUdJZBCe2HuFHI37yfCw/Q0BmHlod5E3QK
         rW5qV/kx8PfzjSz1+3KEliGGm++JGMta1/HEU9g7hRtbB7ldIWUXzIWZi8kKb+faNPGm
         V5aw==
X-Forwarded-Encrypted: i=1; AKwUvBx0cP3jICwtKCAkWlvee3KSEN5m23oSOknNKpFXru0nz6PNrq8zW5dhUy2x+MMGcvCG/7o0uK/ThBLribE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3OWRChzSgsEJrSdkNIy8Sjm1pgQZS/+qaq8OETmYxMdVR/6OF
	vB2AZE6epBYBDcRQSTvhjYzWX7aGaJ2X9dzrCiDboQFymXYI9lUMm8TkVZaphUVz8R8=
X-Gm-Gg: AYBFou3f9vTySnMS35UtBgnZv2nqmFCUDf6vPndLd1MGDqc/1v3yNm47oOWOXo0g1PP
	jlQ5FihsY+Znt7RCgyjBIVxlQPCKjMqaU3WSEtHK/GsV9oEhs4hBrbdnzxv6gs6brge8lz/mFuN
	MDt9j6zmn/1Zq02sP4xp0w452JW0w1oTmgPXEQz1wkZInIjpPwDwkdvsW95pNT5xgAwxYCm4zR6
	GI4SyeG0R3p6/hjULi7oHAnuGxeiPemSptAYMw507hsN6+fbjPZ79ARHMLct6ZlSkV58M0Qr1py
	/j+MGj0DuCYlFNQMCSKx9tQ+1TkgwUWPUmayHTbAjWcl1Txczvdtk7PZPoxufMKmGvrr8vTHEKb
	oIeEgdySkP0/1scj0I91H8t5D3+Aaz8EQMgoAgCHabMyQ8nZO+jNcgvMDmkqrmfgHIxw25YA7FI
	mZpw05VZzygr0d+9rLn/DqAHwcSzitUhy1j2ml+Xrq07P5WK5YKG7Byw1fexfzcvuAmTWuK9J3Z
	W6QSWtT11oy
X-Received: by 2002:a05:7301:fc18:b0:341:2466:2d68 with SMTP id 5a478bee46e88-3537e0cf2a1mr23040108eec.38.1792019857987;
        Wed, 14 Oct 2026 16:17:37 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35de709d928sm10678679eec.25.2026.10.14.16.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:17:37 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 14 Oct 2026 16:17:29 -0700
Subject: [PATCH v8 4/6] of: update /aliases lookup on reconfig
 notifications
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-nh-of-alias-overlay-v8-4-0f74f05ac762@nexthop.ai>
References: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
In-Reply-To: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Shawn Guo <shawnguo@kernel.org>, 
 Grant Likely <grant.likely@secretlab.ca>, 
 Grant Likely <grant.likely@linaro.org>, 
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>, 
 David Daney <david.daney@cavium.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792019849; l=12960;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=hgklcj9z6UPDcn2R9xqRKid9oojIiglf5AJRjZMYTxo=;
 b=o3yr7voU/hHf8X7KrkiXt+TNd65pAuJqGTJ5OqfkrpGhPEUAEZMD6F/M23UodbzS/pfNP2VqQ
 Gg0qL7vndQ8CC35dOj6HjBk+gSR2Wh7zH2FhBkmAcLMLW1RIT9bZDF+
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

Document the result in overlay-notes.rst, in particular that an overlay
alias naming an id a subsystem has already handed out dynamically now
makes that device's registration fail with -EBUSY rather than silently
falling back to a dynamic id.

Link: https://lore.kernel.org/lkml/1435675876-2159-1-git-send-email-geert+renesas@glider.be/ [1]
Link: https://lore.kernel.org/lkml/20150630172131.D4E6CC4041A@trevor.secretlab.ca/ [2]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/overlay-notes.rst |  16 +++
 drivers/of/base.c                          | 199 +++++++++++++++++++++++------
 drivers/of/device.c                        |   4 +-
 drivers/of/of_private.h                    |  14 ++
 4 files changed, 191 insertions(+), 42 deletions(-)

diff --git a/Documentation/devicetree/overlay-notes.rst b/Documentation/devicetree/overlay-notes.rst
index ba401ef850e7..1ba1770e2c16 100644
--- a/Documentation/devicetree/overlay-notes.rst
+++ b/Documentation/devicetree/overlay-notes.rst
@@ -148,3 +148,19 @@ pointers to the overlay nodes or data.  Any example of an inadvertent use
 of such pointers is if a driver or subsystem module is loaded after an
 overlay has been applied, and the driver or subsystem scans the entire
 devicetree or a large portion of it, including the overlay nodes.
+
+Overlays and /aliases
+---------------------
+
+An overlay may add entries to /aliases.  They are mirrored into the kernel's
+alias lookup as the overlay is applied, so of_alias_get_id() honors them just
+like the aliases present at boot, and removing the overlay removes them again.
+
+An alias is a request for one specific id, not a hint.  Subsystems hand out
+ids dynamically to devices that have no alias, and they cannot reserve ids for
+an overlay that has not been loaded yet, so an overlay alias may name an id
+that is already in use.  When that happens the device registration fails
+instead of silently falling back to a dynamic id: i2c_add_adapter() and
+spi_register_controller() return -EBUSY, and a serial port fails to be added.
+Choose overlay alias indices above anything the base system allocates
+dynamically.
diff --git a/drivers/of/base.c b/drivers/of/base.c
index 6a6d9f8439dd..b70dedce06fe 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1934,6 +1934,159 @@ static void of_alias_add(struct alias_prop *ap, struct device_node *np,
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
@@ -1969,42 +2122,8 @@ void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
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
@@ -2022,7 +2141,7 @@ int of_alias_get_id(const struct device_node *np, const char *stem)
 	struct alias_prop *app;
 	int id = -ENODEV;
 
-	mutex_lock(&of_mutex);
+	mutex_lock(&aliases_mutex);
 	list_for_each_entry(app, &aliases_lookup, link) {
 		if (strcmp(app->stem, stem) != 0)
 			continue;
@@ -2032,7 +2151,7 @@ int of_alias_get_id(const struct device_node *np, const char *stem)
 			break;
 		}
 	}
-	mutex_unlock(&of_mutex);
+	mutex_unlock(&aliases_mutex);
 
 	return id;
 }
@@ -2050,7 +2169,7 @@ int of_alias_get_highest_id(const char *stem)
 	struct alias_prop *app;
 	int id = -ENODEV;
 
-	mutex_lock(&of_mutex);
+	mutex_lock(&aliases_mutex);
 	list_for_each_entry(app, &aliases_lookup, link) {
 		if (strcmp(app->stem, stem) != 0)
 			continue;
@@ -2058,7 +2177,7 @@ int of_alias_get_highest_id(const char *stem)
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

