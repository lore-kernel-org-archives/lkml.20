Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC77B3C1D4D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 19:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982705; cv=none; b=gaI6+gWeVSbR39GBIW76BxG++DNj3hOc5A2HQlfXCsJDR5d5yNb4RYUyl1/4sSTVkxJz4foQFcBBWo3TqD1J1z1xWna6SO6H/h5clAltAQTpu6kWrL1rHbO+yCXPbIk+t2XRvwy2+Q+yL7QXS+IY7q8WQ/uDdSlWlUcKeGJkA8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982705; c=relaxed/simple;
	bh=lZBPKN9tIckw18hI3pUXLnkD8axvL7yGCPUsmHMAcok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=USZD+mfqlNPRKbUL2kVj0OCEbP83yGpf26Ub1HCAhCereSFMkd9mgjM6AQcG7nA014uSU+OsL9vZWzxhbGTdY27+JH0B7ZCgTilesIoe3dEEUMEaVh9VbdAhSrwRh0iGEpx4pC2+zNRDvJfmkVWmHc6lccdcJis4OIY7v9nkivE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K90a1jZw; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K90a1jZw"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-871c8a36fe3so73623877b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 12:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982700; x=1789587500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6LXObdENkcO6lDYtxSgA/vA2hc5vAc6IcovovYK/Cr4=;
        b=K90a1jZwUx1X0o+np8ih7KyaX4bQp4Gn+IC+5AU+2tOwsUiWPNoREutI1UKRVMrkBr
         Txc0x9QuMifJYuTvMEgbiOaL9NYN+yGz/eFBg7tExxdhXUpfHZ+ltfr4Xqh+9eQClo0K
         ksiGZU7F/mDHm4nEG6Y/iG6Bu9dk8KgqXF7Ny4jlgYLT+K+ro5l9bUJUrLnymgIpqmLX
         V91Nykh6zqLu9EbMxR2LBlmUxSqGn5JlbR+Hpvcak+AOEPqH9RgHHGw8IffeVlFnBMKz
         vG2WJGTW1dKLkqnHsZ5vCmslqVXx01dfhimvs0A+I3P+Sb9e5VNQJVbN0rjuVlrBSafQ
         h05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982700; x=1789587500;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LXObdENkcO6lDYtxSgA/vA2hc5vAc6IcovovYK/Cr4=;
        b=AAHUnssvjr04+MM/SwJ58Fx+gd/5m9VtuDVp7Ytd1P43iTSueSIJotbQSeTVjc+2bb
         p4hsBzw1rueMbpVlqCuVYcbNixA/TuOL9de4QlmdmnIaKfmznQjT3TMwmVAz6uJwKssN
         JZL+SWNv7lDIgJu+/uL91bXJFsa8GDFx8YpFV4EsuviI9Od3zFe7/etLtCgSZCRi2KMV
         lfZC+BG789/vB8kwK2du+EUChUHU9ePa1J7NbdzX/mw6+Mo+7zxhimDleNxZnnBge3aP
         ZGysxf0cdMKiONRkw7IwNvbqiDYTMK2RRUSIfOJpxvuqNC9DFewU/LhixfebhNmrQeDH
         55Vg==
X-Forwarded-Encrypted: i=1; AKwUvBwf6pz/v0o0X1b9ghWoJQDgXoaPGEY++F3UteYO0C0DBk+15IUOhidRIovxpzy6wRADVHkym4UYZ5JJkc8=@vger.kernel.org
X-Gm-Message-State: AFuF++k+uP8j/4ls8g1L+Ti+hKjfrZPeOQsCfIqX//J1lExDiUQ9xHTP
	iBLjtgSWlU2m7TbzGVp2x5TICMQSCQDrGfgnBtuFKqXFdtNM8yE3h1d4
X-Gm-Gg: AYBFou3LSUrYOAash80I2NG7iJttHSy+sQZEp6/E9oQvoz2i0edM93Abli6evDGnDs/
	5+7rVZZmTshuv/bvKqL4KOHVmDjuXgExIsFJOzlcj2aVz1JZuZ81FdH0xh29pwz66fzVptCd2kC
	C4MIM0YgKK9R3IyPDcKYJhzqT2UhD9HosCUFrFx+OASiElC6sBKLVFHpPlEqaAKnBCN1f4PuRWY
	h/0oqH7qKh4NDmO6Oc2Fov43YYa9kJMxMvYNhwHqhrn+0ahjoNVIt4dgHxJd2dXeP7dnk58fqft
	nhqXmDPqaK3d1Nhlwu/G06xuLtmbwB1nq2BuSLOyb5/iwISFJsyYrTnkOSEQk/5MaF03ZfldiOR
	wvZyOzt4hjl24J1DvvNhSTbCkd3Y7n8frCE648ab7ZxXaYnPhOLWspbKZjJ7SgLna6JTk5b0WZ5
	a9g3EYG+jOpFFr4fn/NqbwTZKTC/VR6fcMWlF/ScG9CwkbrF1ZHA+omwZlUlCmOHVEGG0HNeoSF
	sYvUbHqSax0z3SYfY55p2JUB2kubd+VSdEet6TJeXE=
X-Received: by 2002:a05:690c:288:b0:87e:2480:df7e with SMTP id 00721157ae682-87e2480e524mr54158337b3.49.1788982700039;
        Wed, 09 Sep 2026 12:38:20 -0700 (PDT)
Received: from zenbox ([2600:1700:18fb:6011:bae:bfc2:7e96:e5c8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-871493155d3sm115277577b3.16.2026.09.09.12.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:38:19 -0700 (PDT)
From: Justin Suess <utilityemal77@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	kpsingh@kernel.org,
	matt@bobrowski.net,
	paul@paul-moore.com,
	mic@digikod.net,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	kees@kernel.org
Cc: casey@schaufler-ca.com,
	gnoack@google.com,
	jack@suse.cz,
	song@kernel.org,
	yonghong.song@linux.dev,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	jolsa@kernel.org,
	m@maowtm.org,
	bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Justin Suess <utilityemal77@gmail.com>
Subject: [PATCH bpf-next v3 12/15] landlock: Free rulesets after an RCU grace period
Date: Wed,  9 Sep 2026 15:37:15 -0400
Message-ID: <20260909193719.518517-13-utilityemal77@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909193719.518517-1-utilityemal77@gmail.com>
References: <20260909193719.518517-1-utilityemal77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Defer every ruleset free behind an RCU grace period, and keep the
fields that stay readable while a free is pending out of the union
that overlays the deferred-free work item.

The policy_object_get LSM hook lets a caller holding only an
RCU-protected pointer to a ruleset (e.g. loaded from a BPF map kptr
field under rcu_read_lock()) race a refcount_inc_not_zero() against
the drop of the last reference.  For that to be sound, the ruleset's
memory, and its reference count in particular, must remain valid
until every RCU reader that could still observe the pointer is done:
free the ruleset through queue_rcu_work(), which waits for a grace
period before running the free work.

The work item is overlaid with the fields that no one may touch once
@usage reaches zero: @lock, @quiet_masks and @handled_masks.  @usage
itself stays outside the union so a racing reader observes zero
instead of the work item's bytes, and the tracing fields @version and
@id stay outside too because the landlock_free_ruleset trace event
reads them when the queued work finally runs.

Since queueing the work never sleeps, the might_sleep() annotation
is dropped: a following commit releases ruleset references from
BPF object destructors that cannot sleep.

Cc: Mickaël Salaün <mic@digikod.net>
Signed-off-by: Justin Suess <utilityemal77@gmail.com>
---

Notes:
    v2->v3:
        - No change.

 security/landlock/ruleset.c | 24 ++++++++++++++---
 security/landlock/ruleset.h | 54 ++++++++++++++++++++++++-------------
 2 files changed, 57 insertions(+), 21 deletions(-)

diff --git a/security/landlock/ruleset.c b/security/landlock/ruleset.c
index 0d07707523cd..00a6b9938fd1 100644
--- a/security/landlock/ruleset.c
+++ b/security/landlock/ruleset.c
@@ -21,6 +21,7 @@
 #include <linux/refcount.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/workqueue.h>
 #include <uapi/linux/landlock.h>
 
 #include "access.h"
@@ -346,9 +347,26 @@ static void free_ruleset(struct landlock_ruleset *const ruleset)
 	kfree(ruleset);
 }
 
+static void free_ruleset_work(struct work_struct *const work)
+{
+	struct landlock_ruleset *ruleset;
+
+	ruleset = container_of(to_rcu_work(work), struct landlock_ruleset,
+			       work_free);
+	free_ruleset(ruleset);
+}
+
+/*
+ * RCU readers (cf. the policy_object_get LSM hook) may call
+ * refcount_inc_not_zero() on a ruleset they hold no reference to: the memory
+ * must survive a grace period after the last put.  Queueing the free also
+ * makes this callable from contexts that cannot sleep (cf. the
+ * policy_object_put LSM hook).
+ */
 void landlock_put_ruleset(struct landlock_ruleset *const ruleset)
 {
-	might_sleep();
-	if (ruleset && refcount_dec_and_test(&ruleset->usage))
-		free_ruleset(ruleset);
+	if (ruleset && refcount_dec_and_test(&ruleset->usage)) {
+		INIT_RCU_WORK(&ruleset->work_free, free_ruleset_work);
+		queue_rcu_work(system_dfl_wq, &ruleset->work_free);
+	}
 }
diff --git a/security/landlock/ruleset.h b/security/landlock/ruleset.h
index b58e3d9846af..1465f8a5c464 100644
--- a/security/landlock/ruleset.h
+++ b/security/landlock/ruleset.h
@@ -15,6 +15,7 @@
 #include <linux/mutex.h>
 #include <linux/rbtree.h>
 #include <linux/refcount.h>
+#include <linux/workqueue.h>
 
 #include "access.h"
 #include "limits.h"
@@ -157,12 +158,10 @@ struct landlock_ruleset {
 	 */
 	struct landlock_rules rules;
 	/**
-	 * @lock: Protects against concurrent modifications of @rules, if @usage
-	 * is greater than zero.
-	 */
-	struct mutex lock;
-	/**
-	 * @usage: Number of file descriptors referencing this ruleset.
+	 * @usage: Number of file descriptors referencing this ruleset.  Kept
+	 * outside the union with @work_free: RCU readers may still call
+	 * refcount_inc_not_zero() while a queued free waits out the grace
+	 * period.
 	 */
 	refcount_t usage;
 
@@ -175,22 +174,41 @@ struct landlock_ruleset {
 	 */
 	u32 version;
 	/**
-	 * @id: Unique identifier for this ruleset, used for tracing.
+	 * @id: Unique identifier for this ruleset, used for tracing.  Kept
+	 * outside the union with @work_free: the free_ruleset trace event
+	 * reads it after the free has been queued.
 	 */
 	u64 id;
 #endif /* CONFIG_TRACEPOINTS */
 
-	/**
-	 * @quiet_masks: Stores the quiet flags for an unmerged ruleset.  For a
-	 * merged domain, this is stored in each layer's struct
-	 * landlock_hierarchy instead.
-	 */
-	struct access_masks quiet_masks;
-	/**
-	 * @handled_masks: Contains the subset of filesystem and network actions
-	 * that are handled by this ruleset.
-	 */
-	struct access_masks handled_masks;
+	union {
+		/**
+		 * @work_free: Enables to free a ruleset after an RCU grace
+		 * period, within a lockless section.  This is queued by
+		 * landlock_put_ruleset() when @usage reaches zero.  The
+		 * fields @lock, @quiet_masks and @handled_masks are then
+		 * unused.
+		 */
+		struct rcu_work work_free;
+		struct {
+			/**
+			 * @lock: Protects against concurrent modifications of
+			 * @rules, if @usage is greater than zero.
+			 */
+			struct mutex lock;
+			/**
+			 * @quiet_masks: Stores the quiet flags for an unmerged
+			 * ruleset.  For a merged domain, this is stored in each
+			 * layer's struct landlock_hierarchy instead.
+			 */
+			struct access_masks quiet_masks;
+			/**
+			 * @handled_masks: Contains the subset of filesystem and
+			 * network actions that are handled by this ruleset.
+			 */
+			struct access_masks handled_masks;
+		};
+	};
 };
 
 struct landlock_ruleset *
-- 
2.55.0

