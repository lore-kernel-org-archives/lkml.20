Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.25.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910337;
	b=0YYztr1m7Fwx34tixJuymiZWWMAt3MBrqaDtZRZZavZs9tHAJUQtgKBSo/LF+FoJsSwN
	 CKk2K/ijs1WNhmdA5J6n7e4fFXy8k+z7JP51WJA1qG6dPzGaML6F2F4Sjhln6+l2N5hkM
	 0Fb9Z8FjBJnKnF4n6+jTNm9JeHTkE9+Zw2mZF6ywqTcD+zjpyQ9LEZ2b9jKrHGMv04nhN
	 FaoP0tObVFmTd50rCYpLeH9mxTp8dvS9mEbhvYllOgnItNzl3yqSdI43vbBqvmvuARw5W
	 jHUN1DKCdPm96n0buWPQMgS+gj+apnzAUWM12fFdHATYR3JWze57dFLsSWZgwQ3rutw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910337;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=5Vh92X8arPXBkTL+XLJSQhPFc2VzHJvjncW2BO9XOhs=;
	b=VIOknHTz1IWGh3ptuqGOL9sMjXCmSRjGy+iPXY3DmK/RTMMiOt9awBaf3YS9ebyjcMKh
	 GefgSdcLs9ph2x6YSAvy+dpJGB/C+rtrA/rnL/T/9apktNtJ+QiUIFq83p5vaJdpHstwy
	 F8AWYk2JeDY8f8hQmfwqP/sD8pXqbhED9VqTzRIma9Nqbevb5EKXEAaaP85mPy6EmSy0T
	 IjZkE3evwGHugo1IeNo0yW11BB0cBO8qDSPvu/4OJhBwEyqZvDL4kv1P3XU3qJkTwhy99
	 OLhotBUSzMms4FNfroO/ihOmfD6IGPevM3mH6j9pJRh9fDC5CDi/ajtP8wa83Ucl0yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=digikod.net;
	spf=pass smtp.mailfrom=digikod.net;
	dkim=pass header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=IJ+uvxKO;
	arc=none smtp.remote-ip=185.125.25.11
Received: from smtp-190b.mail.infomaniak.ch (smtp-190b.mail.infomaniak.ch [185.125.25.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED96606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ED96606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=IJ+uvxKO
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jTLBJ1dlFzNd4;
	Tue, 17 Nov 2026 11:12:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1794910328;
	bh=5Vh92X8arPXBkTL+XLJSQhPFc2VzHJvjncW2BO9XOhs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IJ+uvxKOn1eyBSQhY1ql1lRlvGjoRCZVOoMZX19+UfOuTvbs9Q/n18CQkDQ3BOPVb
	 Ps4brH/x9hgMimTjjeyqbS8B5veo0M5PmwsMVI6mIjJtQF2JqUtE2If4TgxVxkvaBE
	 LRKdiagBtTaJgwNyqlhSkWsqo3gKo/R+v1SOwr/s=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jTLBG6rh9zDN2;
	Tue, 17 Nov 2026 11:12:06 +0100 (CET)
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Ada Smith <adasmithgt@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	James Morris <jmorris@namei.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Paul Moore <paul@paul-moore.com>,
	Serge Hallyn <serge@hallyn.com>,
	Serge Hallyn <sergeh@kernel.org>,
	kernel-team@cloudflare.com,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [PATCH v2 1/6] landlock: Factor out capability denial checks
Date: Tue, 17 Nov 2026 11:11:51 +0100
Message-ID: <20261117101157.2520463-2-mic@digikod.net>
In-Reply-To: <20261117101157.2520463-1-mic@digikod.net>
References: <20261117101157.2520463-1-mic@digikod.net>
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
X-Infomaniak-Routing: alpha

hook_capable() is the only place that checks a capability against a
Landlock domain.  commoncap also makes capability decisions from other
LSM hooks, and the following commits add Landlock counterparts for them.
Move the check and its denial logging into check_cap() so that these
hooks share it.

No functional change.

Cc: Günther Noack <gnoack@google.com>
Acked-by: Serge Hallyn (AMD) <sergeh@kernel.org>
Signed-off-by: Mickaël Salaün <mic@digikod.net>
---

Changes since v1:
https://patch.msgid.link/20261110202436.2408244-2-mic@digikod.net
- Add Serge Hallyn's Acked-by.
---
 security/landlock/cap.c | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/security/landlock/cap.c b/security/landlock/cap.c
index b4f491b09baa..fa59118e3486 100644
--- a/security/landlock/cap.c
+++ b/security/landlock/cap.c
@@ -24,25 +24,21 @@ static const struct access_masks cap_permission = {
 };
 
 /**
- * hook_capable - Deny capability use for Landlock-sandboxed processes
+ * check_cap - Check a capability use against the domain of @cred
  *
  * @cred: Credentials being checked.
- * @ns: Target user namespace (intentionally ignored; policy depends on the
- *      acting credentials and @cap, not namespace ownership).
  * @cap: Capability number (CAP_*).
  * @opts: Capability check options.  CAP_OPT_NOAUDIT skips the denial record:
  *        no audit record, no trace event, and no denial count.
  *
  * Pure bitmask check: denies the capability if it is not in the layer's allowed
- * set.  This hook is purely restrictive: commoncap is registered with
- * LSM_ORDER_FIRST so cap_capable() always runs first, which means Landlock can
- * deny capabilities that commoncap would allow, but never grant capabilities
- * that commoncap denied.
+ * set.  It does not check that @cred holds @cap: only call it for a capability
+ * that commoncap already granted.
  *
  * Return: 0 if allowed, -EPERM if capability use is denied.
  */
-static int hook_capable(const struct cred *cred, struct user_namespace *ns,
-			int cap, unsigned int opts)
+static int check_cap(const struct cred *const cred, const int cap,
+		     const unsigned int opts)
 {
 	const struct landlock_cred_security *subject;
 	size_t denied_layer;
@@ -72,6 +68,28 @@ static int hook_capable(const struct cred *cred, struct user_namespace *ns,
 	return -EPERM;
 }
 
+/**
+ * hook_capable - Deny capability use for Landlock-sandboxed processes
+ *
+ * @cred: Credentials being checked.
+ * @ns: Target user namespace (intentionally ignored; policy depends on the
+ *      acting credentials and @cap, not namespace ownership).
+ * @cap: Capability number (CAP_*).
+ * @opts: Capability check options, see check_cap().
+ *
+ * This hook is purely restrictive: commoncap is registered with LSM_ORDER_FIRST
+ * so cap_capable() always runs first, which means Landlock can deny
+ * capabilities that commoncap would allow, but never grant capabilities that
+ * commoncap denied.
+ *
+ * Return: 0 if allowed, -EPERM if capability use is denied.
+ */
+static int hook_capable(const struct cred *cred, struct user_namespace *ns,
+			int cap, unsigned int opts)
+{
+	return check_cap(cred, cap, opts);
+}
+
 static struct security_hook_list landlock_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(capable, hook_capable),
 };
-- 
2.56.0

