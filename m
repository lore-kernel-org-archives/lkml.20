Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822186;
	b=yD0ubCx1Th3T25maF9tgDPRekY5k2IMFqWXtxAD4OFgucTsMVfGj4P0yY4CtiOulkfWN
	 DB50IJ/u1bIbK/f06ePui/3CJusCoR2z07BssbHzyiAll9E9m72C0K96vNnxhJuFELx0G
	 8nm6vAgKh1U0DohSTFWKUspntOlX/D4OH5+50wmNqq/karQDX3rTdvV1+Q0yL6Ev5/2KB
	 79wD3y80uYPaMbco6sxbGxry+BgGz8Q9BSCNRiYg+bPFc2D9GfrCBywFcmjzOBScpcoOU
	 O3MxWRO5pklsT5hnIqY0rFKuPjUyo8uiVLWOf5x4RD31JRiutgwawLqt9dINKaTT+IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=aQYuNsJG+unqWiBaoF2MWGnUGOMRtZW004M8c7FPvgY=;
	b=DtiYV9nLMqPBTtE+V6dbXTkFCWdRdzQNnyZJCstZ4ot2XQcSMEUvgqijt3cww2CyVN8b
	 6IeuZi0edHJUK1rcYqFNUqcMHGYrZCBuVQCqkyHD3/5dAUminabPWZRLKQM7K1lUhTqwu
	 JdJrFQ3kKpkkA8TKmOIaj8CScCQ+svbavlDrOJMxWtfTm2m0IIxaO+Q7yGEgsLUTWW6R6
	 x8nRc1rp+Sj5zJGtmp3l4NxsgKNXSaOaIUh+WbTravOVw8yaEo58ZrP5IEnEt1lz/iZ1K
	 MKFv36IHViKS5JJ8AZIdHxM5jTOWFuqn+grdplNK3LwmQlyq1J1r8dpDMSl+SLXqi/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x+z3PMKr;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F67606A333
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54F67606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x+z3PMKr
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so1673667b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794822186; x=1795426986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQYuNsJG+unqWiBaoF2MWGnUGOMRtZW004M8c7FPvgY=;
        b=x+z3PMKrzaeN5x7kM12ZzJJeP6+nKYOvnaPZFOoQ5iMFLlaa/aoKMhg2vD0L7SOOEh
         OGTzG4bCgZ6D1qsgswsZRbs0sLFZpiEJNme3eD1L6uAJ9JGrvPYFtEOYEOqlH2ZZeZCe
         rK9UBMSgB0GZYJGf2gaSxzh85bt88JsISY7cVE7Hvasyyz2rGaOuqqJ4fDg+TbnJMFA1
         jFQt6d9CZrKGc5cAur+jZC5/bpkIikT5LlGN0XCRzfJzkUm3Cseq2e1jXFHRJW6WWbe3
         moROyBlKLtFnRGC3KMcpLP5iOHQoL1moFk79kk4E4rBeEkTyyB31JgIhB8Wez6ibrgI8
         /pcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822186; x=1795426986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQYuNsJG+unqWiBaoF2MWGnUGOMRtZW004M8c7FPvgY=;
        b=wODdl9SVS07bzPGUtAu3AU+67qbaoBYBWAampCyWVroju/hGJKUuEH1RYWeqVJZI2z
         TqHEfYpflZayoTg6fEW7YQIYezHhIbVrxRG8ycuHo8J3dJYDerPjWhkkngoiqgfOnEmR
         AfxiVE4c6Mmi0LZoX5s5LW/4GoPs4rx8eSx4mBQXgGeTO9v5pl0wOI0qgoJKHhPoH+bI
         ob8klR+/8oultnsG8fIDTI0Rlws42W47Lo6PSsf8mHIHoKJjitpC7ALaQn19zEUb8RM2
         XTLY7Jvw4CRddjd8LMwnWhnaKQSlEn5+6eX/edvE4yL50wEoJnYeCutHvWVjQLqqer7z
         OC/g==
X-Forwarded-Encrypted: i=1; AL+hErF+sCE1sL7nCmNjFmEseSh5J4Aeh/vC7FCsrmRwopUkzZgyMoN2kIvtpqrfi+c9Km7mPGdzdrPpX0fl4qc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XSl9dGlJQU331MkPON/27B1FtXzsfwLQx/i0AGtRpJaJcPE1n
	Hhtiey5WFQfWby5Bh6rMy0HZK2nUUXxh/+fVvt0JFhWM34SM5FrUcEcs
X-Gm-Gg: AYBFou1+OV87at5B6SXqiWDfxZ/g+B/M/DctJYT3wuYkBK0ZKXXeVq42aANAZBWQexH
	ny0GEBzKgJeBt61BMqVJSaBH0bP3bFGb8oA1svin/dTjQn2zn/7dLdTGpX9M6JnyxfnXv15+RWf
	kvRhsiQgXSaxIdNwh5zm8pfalFNOyOM9xsICTRklriJXxXXojC/cOJ5AmXT09MKCYUoztWcovNe
	0bDKnYG/4j8AejlaweJb62HyolVstqZX+3bSwamwMj0gCrsu6NmDe1E1i5Kf3mLzJZdHSd3tTqb
	+DzAw3ymJ/IpkyBzk8M+nFVixrMJTjU4roYBBf00uLfF2YMdZnB+iw37W25C1aW8OLNvAP+2+rh
	asEj4GyQSKrwDMe8kPJYSEbQycnZPmWL1f4CfWtaz6vUlADsdrviQjqAiPledIZMOeTGEMRFoRI
	aBYIIfpT92dvZVQrmeYZGQts9r1uHYtRfMxuZ4oSHKmAMUmq+94p/y5GZlxOMyhwkg/btPRNGRr
	1pXWtCoLHP0sJi53skf9Czn41+KlJMktHnzrrrwpzODbIMh1yZ4CD3FT+0TTcyu6NwSreofG+2S
	iN2PhzdCFNcdW/F2jbzfIj7sf/5rESk3p2FgdVsMYBzpCbVZApg0X4IEkH1vzOsYlyMM45I9pQt
	mM1g5aCJ0y3pVZzFnvw==
X-Received: by 2002:a05:6a00:189e:b0:89f:b166:bddf with SMTP id d2e1a72fcca58-8beb7c1fae7mr9373366b3a.58.1794822185494;
        Mon, 16 Nov 2026 01:43:05 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f133:af41:7614:f46c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a90fdsm3424231b3a.15.2026.11.16.01.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:43:04 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 16 Nov 2026 01:42:55 -0800
Subject: [PATCH 3/4] sysfs: support SYSFS_GROUP_INVISIBLE for unnamed
 attribute groups
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-sysfs-group-invisible-v1-3-94cd173a7d9a@gmail.com>
References: <20261116-sysfs-group-invisible-v1-0-94cd173a7d9a@gmail.com>
In-Reply-To: <20261116-sysfs-group-invisible-v1-0-94cd173a7d9a@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Fernando Fernandez Mancera <fmancera@suse.de>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

DEFINE_SYSFS_GROUP_VISIBLE() and DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE()
evaluate the group visibility callback only for the first attribute and
return SYSFS_GROUP_INVISIBLE when the group should be hidden. While
named attribute groups check this flag before creating or updating the
group subdirectory, unnamed attribute groups skip that check and proceed
directly to file creation.

As a result, skipping the entry that returns SYSFS_GROUP_INVISIBLE
during file creation hides just the first attribute while still creating
all remaining regular and binary attributes, and updating an unnamed
group to be invisible leaves those attributes behind.

Resolve the target node first and check group visibility in
internal_create_group() for both named and unnamed groups, removing any
existing attributes (and the subdirectory for named groups) when
updating and returning early before creating directories or files. Drop
the now-redundant SYSFS_GROUP_INVISIBLE checks from create_files() so
that the invalid-permissions warning triggers if SYSFS_GROUP_INVISIBLE
is mistakenly returned for attributes after the first one, and update
the attribute group documentation accordingly.

Fixes: d87c295f599c ("sysfs: Introduce a mechanism to hide static attribute_groups")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 fs/sysfs/group.c      | 66 +++++++++++++++++++++++++++++++--------------------
 include/linux/sysfs.h | 52 +++++++++++++++++++++++-----------------
 2 files changed, 70 insertions(+), 48 deletions(-)

diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
index 290e70034329..699c2f9e8926 100644
--- a/fs/sysfs/group.c
+++ b/fs/sysfs/group.c
@@ -69,7 +69,7 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
 					mode = grp->is_visible(kobj, *attr, i);
 				else
 					mode = grp->is_visible_const(kobj, *attr, i);
-				if (!mode || mode == SYSFS_GROUP_INVISIBLE)
+				if (!mode)
 					continue;
 			}
 
@@ -99,7 +99,7 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
 						(*bin_attr)->attr.name);
 			if (grp->is_bin_visible) {
 				mode = grp->is_bin_visible(kobj, *bin_attr, i);
-				if (!mode || mode == SYSFS_GROUP_INVISIBLE)
+				if (!mode)
 					continue;
 			}
 			if (grp->bin_size)
@@ -145,42 +145,56 @@ static int internal_create_group(struct kobject *kobj, int update,
 		return 0;
 	}
 
-	kobject_get_ownership(kobj, &uid, &gid);
 	if (grp->name) {
-		umode_t mode = __first_visible(grp, kobj);
-
-		if (mode == SYSFS_GROUP_INVISIBLE)
-			mode = 0;
-		else
-			mode = S_IRWXU | S_IRUGO | S_IXUGO;
-
 		if (update) {
 			kn = kernfs_find_and_get(kobj->sd, grp->name);
 			if (!kn) {
 				pr_debug("attr grp %s/%s not created yet\n",
 					 kobj->name, grp->name);
-				/* may have been invisible prior to this update */
+				/*
+				 * The group may have been invisible prior to
+				 * this update; treat it as a new creation if
+				 * it becomes visible (or a no-op if it stays
+				 * invisible).
+				 */
 				update = 0;
-			} else if (!mode) {
-				sysfs_remove_group(kobj, grp);
-				kernfs_put(kn);
-				return 0;
 			}
 		}
+	} else {
+		kn = kobj->sd;
+	}
 
-		if (!update) {
-			if (!mode)
-				return 0;
-			kn = kernfs_create_dir_ns(kobj->sd, grp->name, mode,
-						  uid, gid, kobj, NULL);
-			if (IS_ERR(kn)) {
-				if (PTR_ERR(kn) == -EEXIST)
-					sysfs_warn_dup(kobj->sd, grp->name);
-				return PTR_ERR(kn);
+	/*
+	 * If the group is hidden, remove any existing attributes (and the
+	 * subdirectory for a previously visible named group) when updating,
+	 * and return early.
+	 */
+	if (__first_visible(grp, kobj) == SYSFS_GROUP_INVISIBLE) {
+		if (update) {
+			remove_files(kn, grp);
+			if (grp->name) {
+				kernfs_remove(kn);
+				kernfs_put(kn);
 			}
 		}
-	} else {
-		kn = kobj->sd;
+		return 0;
+	}
+
+	kobject_get_ownership(kobj, &uid, &gid);
+
+	/*
+	 * Create the subdirectory on initial creation or when a previously
+	 * hidden named group becomes visible on update.
+	 */
+	if (grp->name && !update) {
+		kn = kernfs_create_dir_ns(kobj->sd, grp->name,
+					  S_IRWXU | S_IRUGO | S_IXUGO,
+					  uid, gid, kobj, NULL);
+		if (IS_ERR(kn)) {
+			if (PTR_ERR(kn) == -EEXIST)
+				sysfs_warn_dup(kobj->sd, grp->name);
+			return PTR_ERR(kn);
+		}
 	}
 
 	kernfs_get(kn);
diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index b1a3a1e6ad09..bd9a1f910bfa 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -68,28 +68,33 @@ do {							\
  * struct attribute_group - data structure used to declare an attribute group.
  * @name:	Optional: Attribute group name
  *		If specified, the attribute group will be created in a
- *		new subdirectory with this name. Additionally when a
- *		group is named, @is_visible and @is_bin_visible may
- *		return SYSFS_GROUP_INVISIBLE to control visibility of
- *		the directory itself.
+ *		new subdirectory with this name.
  * @is_visible:	Optional: Function to return permissions associated with an
  *		attribute of the group. Will be called repeatedly for
  *		each non-binary attribute in the group. Only read/write
- *		permissions as well as SYSFS_PREALLOC are accepted. Must
- *		return 0 if an attribute is not visible. The returned
- *		value will replace static permissions defined in struct
- *		attribute. Use SYSFS_GROUP_VISIBLE() when assigning this
- *		callback to specify separate _group_visible() and
- *		_attr_visible() handlers.
+ *		permissions as well as SYSFS_PREALLOC are accepted,
+ *		except for the first attribute where
+ *		SYSFS_GROUP_INVISIBLE may be returned to hide the entire
+ *		group (both the subdirectory for named groups and all
+ *		attributes for unnamed groups). Must return 0 if an
+ *		attribute is not visible. The returned value will
+ *		replace static permissions defined in struct attribute.
+ *		Use SYSFS_GROUP_VISIBLE() when assigning this callback to
+ *		specify separate _group_visible() and _attr_visible()
+ *		handlers.
  * @is_bin_visible:
  *		Optional: Function to return permissions associated with a
  *		binary attribute of the group. Will be called repeatedly
  *		for each binary attribute in the group. Only read/write
- *		permissions as well as SYSFS_PREALLOC (and the
- *		visibility flags for named groups) are accepted. Must
- *		return 0 if a binary attribute is not visible. The
- *		returned value will replace static permissions defined
- *		in struct bin_attribute. If @is_visible is not set, Use
+ *		permissions as well as SYSFS_PREALLOC are accepted,
+ *		except for the first binary attribute (when the group has
+ *		no regular attributes or neither @is_visible nor
+ *		@is_visible_const is set), where SYSFS_GROUP_INVISIBLE
+ *		may be returned to hide the entire group. Must return 0
+ *		if a binary attribute is not visible. The returned value
+ *		will replace static permissions defined in struct
+ *		bin_attribute. When group visibility is not already
+ *		controlled by @is_visible/@is_visible_const, use
  *		SYSFS_GROUP_VISIBLE() when assigning this callback to
  *		specify separate _group_visible() and _attr_visible()
  *		handlers.
@@ -128,11 +133,13 @@ struct attribute_group {
 /*
  * DEFINE_SYSFS_GROUP_VISIBLE(name):
  *	A helper macro to pair with the assignment of ".is_visible =
- *	SYSFS_GROUP_VISIBLE(name)", that arranges for the directory
- *	associated with a named attribute_group to optionally be hidden.
- *	This allows for static declaration of attribute_groups, and the
+ *	SYSFS_GROUP_VISIBLE(name)", that arranges for an entire
+ *	attribute_group to optionally be hidden (both the directory for
+ *	named groups and all attributes for unnamed groups). This allows
+ *	for static declaration of attribute_groups, and the
  *	simplification of attribute visibility lifetime that implies,
- *	without polluting sysfs with empty attribute directories.
+ *	without polluting sysfs with empty attribute directories or
+ *	unwanted attributes.
  * Ex.
  *
  * static umode_t example_attr_visible(struct kobject *kobj,
@@ -208,9 +215,10 @@ struct attribute_group {
 
 /*
  * Same as DEFINE_SYSFS_GROUP_VISIBLE, but for groups with only binary
- * attributes. If an attribute_group defines both text and binary
- * attributes, the group visibility is determined by the function
- * specified to is_visible() not is_bin_visible()
+ * attributes (or without is_visible()/is_visible_const()). If an
+ * attribute_group defines both regular and binary attributes and sets
+ * is_visible() or is_visible_const(), group visibility is determined by
+ * that callback rather than is_bin_visible().
  */
 #define DEFINE_SYSFS_BIN_GROUP_VISIBLE(name)                                   \
 	static inline umode_t sysfs_group_visible_##name(                      \

-- 
2.56.0.679.gc527c65306-goog

