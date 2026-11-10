Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=83.166.143.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342296;
	b=j+ybPdaTK4IrmZ2juqZz++xK5ObJbOh7MpyrlC3P8OInoN1gYuj7cptKvVLegWNolzG0
	 uMtb5ZBF8FkCvvc/h7BgopeH/pmNyCyJX6FNOg6Oj3bsqp3jw/NLme1MSjHY2bgDeHJhN
	 WJkRhHRuPXJmV85MTa6LKZcxIsiegVg56zhFRy+cA1h4fvZIeSSnBRsg8d6sy2sHCmzL2
	 Ck4J0/Bh3a1jzE/eYmcSYp7/L/+Q71GcZoqcAKK2Opl93To0jyjrxozZoou2+Vbu1yryX
	 FtgiBhS07IJWBtu4rF55IOGK6FRakAULoruWTh31pI7PZ9oovYCFxSX3jYf9ymq+UgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342296;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=hA373uOc1Lcxuf6hAC6Ys8l3H4oHw6I8HK47UONly0Y=;
	b=LFCkEA+6U5+xQusXXw5Oz25PNRFjDItdu3v2NLTJsvjH7nDBenY94Nm9F5cfqmUz8cRZ
	 HbynSi2k0E2GmZlUHyIDti/yr9IkxauOvY9B/xpoOwaYw+laBFD7PgJsUPuCNayzw4ZJl
	 nLbeHDFSeYZZhJrhBixZLSiLunAaD8MXXB0f9eKwtO94CAHf+tJEyov4Xuc4dfUn7e58M
	 ICWuC22AMgI1NdSdUEJ5sXxCg19J43NcoYSMVnEJsZFAIqYlB5CnenMnOshXlapENm8S3
	 4AN3pm0+GWfB9uB/Bgcx/LUxJOlvaaelZ47/+Hr02NXAdO2sbM+NEz2eVxhY/TFOvHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=digikod.net;
	spf=pass smtp.mailfrom=digikod.net;
	dkim=pass header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=JwtsxlFW;
	arc=none smtp.remote-ip=83.166.143.170
Received: from smtp-8faa.mail.infomaniak.ch (smtp-8faa.mail.infomaniak.ch [83.166.143.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD601606A883
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD601606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=JwtsxlFW
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jPJ6R3gqvzK1d;
	Tue, 10 Nov 2026 21:24:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1794342287;
	bh=hA373uOc1Lcxuf6hAC6Ys8l3H4oHw6I8HK47UONly0Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JwtsxlFW7+Cifi85o39IqstgWX6p7F2YJ1B1NviF3D5UT/H73023ZPwY/5XafdC4H
	 MW1Tv/IMuGu8IZ7Cwk//IULedNP3ZnsKOlkO06Dw07wqr8wL7VG4hohYRTv50KdNaX
	 tlC4m2CKei8tmFryjcvoMCVeacKeJeNvpxuaAUtY=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jPJ6Q3CP7ztHT;
	Tue, 10 Nov 2026 21:24:46 +0100 (CET)
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Ada Smith <adasmithgt@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	James Morris <jmorris@namei.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Paul Moore <paul@paul-moore.com>,
	Serge Hallyn <serge@hallyn.com>,
	kernel-team@cloudflare.com,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [PATCH 1/6] landlock: Factor out capability denial checks
Date: Tue, 10 Nov 2026 21:24:29 +0100
Message-ID: <20261110202436.2408244-2-mic@digikod.net>
In-Reply-To: <20261110202436.2408244-1-mic@digikod.net>
References: <20261110202436.2408244-1-mic@digikod.net>
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
Signed-off-by: Mickaël Salaün <mic@digikod.net>
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

