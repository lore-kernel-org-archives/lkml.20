Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=83.166.143.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342298;
	b=Iwzq5hHEcyAB3JNGVC5uRypQ+MubEaXYwDGLZ0N+PFCfE6FJj+ZitwkXcutbVWXmctaj
	 VWA5CClJOjjNkdbz/Xkx6QvbKNAc0WWTuOIwlXXYr2KfOEtWvlHvEHMu4mMnnrpok8nig
	 wdJE8aRqEnjA+/l0qcDuxxVb2Qe2W8A/fbxUk138v2Z/7gJrAeCuVA0CQJDydxfPSXj72
	 nUHgWRM62kzPvcJA3RvbOt/NVQh0bfRpGyGEbpDqpX4RbXcZEaXGnMDngn47a44milHSS
	 5s4wsENUT2f7f+aCzOY9+6x5p6UIiea4Cy2uhNKbTv2uCJ9xX0rh1Gi7HtCp6+/rekQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342298;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=dtQBQsLXA/8DRdTm5gm8W/QZSwqaFp+c1ZQKm9GtCgE=;
	b=j7ghkclzmhd1W18h387lF/YSd1MPCgYjLBNBkr3ywDQlXixoVulRIE3DTkBy8zU2OteR
	 kLco97ivTID+rYkqhGaXfZYlksQTRhdc9ALZokRQD4Oml2gDa90lgFg3Pfu83ZL9zYTrl
	 hsGk1bEPVgefnooNU3gDtu8NpuKdYzMlwnfQVX7c1bDg6S4ZLTZVOmwYZ4mhgGEZymp61
	 Kv4TR527vWsEGlEP2u0HLzrav22b3A46/o9fp4TfEJaIFJ5diWXTyijI5BuY2WWN9ITRf
	 l+bmes2vC3020BQZHZrTYWwg6+MTaL1BacWjCu40jPRTntJSkoxf/w2OE967Tpi7wIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=digikod.net;
	spf=pass smtp.mailfrom=digikod.net;
	dkim=pass header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=NBkm4ljE;
	arc=none smtp.remote-ip=83.166.143.169
Received: from smtp-8fa9.mail.infomaniak.ch (smtp-8fa9.mail.infomaniak.ch [83.166.143.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68772606A89B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68772606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=NBkm4ljE
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jPJ6T5HKjzDVJ;
	Tue, 10 Nov 2026 21:24:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1794342289;
	bh=dtQBQsLXA/8DRdTm5gm8W/QZSwqaFp+c1ZQKm9GtCgE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NBkm4ljEH55q0mZ2ImjQcErIdLPtbr/dDkniCa+E9yd44yEsE2yUsZgrR/y53j5EB
	 vNS+KIsH052IB09ZlJX08Af8I2yVnjnQivUPxeHQYPtBt5pTrQ/TbmU/XcGu5GRduQ
	 amjO2eKxkGot61nERtb8vU+MILk3Jtmd9RjQ0jZE=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jPJ6S4xhlzs5Q;
	Tue, 10 Nov 2026 21:24:48 +0100 (CET)
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
Subject: [PATCH 3/6] landlock: Mediate CAP_SETPCAP for inheritable capabilities
Date: Tue, 10 Nov 2026 21:24:31 +0100
Message-ID: <20261110202436.2408244-4-mic@digikod.net>
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

A process in a domain that denies CAP_SETPCAP could still add
capabilities outside of its permitted set to its inheritable set with
capset(2), if it held CAP_SETPCAP.  cap_capset() checks CAP_SETPCAP with
cap_capable() in cap_inh_is_capped(), so the check never reaches
hook_capable().  Through file inheritable capabilities, such a set can
grant new permitted capabilities on execve() when no_new_privs is not
set, which is possible for a domain enforced by a task holding
CAP_SYS_ADMIN.

Add a Landlock capset hook that checks CAP_SETPCAP against the domain
under the same condition as cap_capset().  As with the mmap_addr hook,
LSMs implement their own policy in this hook: SELinux checks capset with
its own permission.

Cc: Günther Noack <gnoack@google.com>
Cc: Paul Moore <paul@paul-moore.com>
Cc: Serge Hallyn <serge@hallyn.com>
Reported-by: Ada Smith <adasmithgt@gmail.com>
Fixes: 97c8386f1d74 ("landlock: Enforce capability restrictions")
Signed-off-by: Mickaël Salaün <mic@digikod.net>
---
 security/landlock/cap.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/security/landlock/cap.c b/security/landlock/cap.c
index 10e1ca772b9c..c89e8d76db8c 100644
--- a/security/landlock/cap.c
+++ b/security/landlock/cap.c
@@ -91,6 +91,35 @@ static int hook_capable(const struct cred *cred, struct user_namespace *ns,
 	return check_cap(cred, cap, opts);
 }
 
+/**
+ * hook_capset - Restrict inheritable capability changes
+ *
+ * @new: New credentials (unused).
+ * @old: Current credentials.
+ * @effective: New effective set (unused).
+ * @inheritable: New inheritable set.
+ * @permitted: New permitted set (unused).
+ *
+ * cap_capset() requires CAP_SETPCAP to add inheritable capabilities that are
+ * not in the old permitted set, but calls cap_capable() directly, which skips
+ * hook_capable().  Check the same condition against the domain.  commoncap runs
+ * first, so this only sees requests that commoncap allowed.  capset(2) discards
+ * @new if this hook fails, so nothing is committed.
+ *
+ * Return: 0 if allowed, -EPERM if CAP_SETPCAP use is denied.
+ */
+static int hook_capset(struct cred *new, const struct cred *old,
+		       const kernel_cap_t *effective,
+		       const kernel_cap_t *inheritable,
+		       const kernel_cap_t *permitted)
+{
+	if (cap_issubset(*inheritable,
+			 cap_combine(old->cap_inheritable, old->cap_permitted)))
+		return 0;
+
+	return check_cap(old, CAP_SETPCAP, CAP_OPT_NONE);
+}
+
 /**
  * hook_mmap_addr - Restrict mappings below dac_mmap_min_addr
  *
@@ -113,6 +142,7 @@ static int hook_mmap_addr(unsigned long addr)
 
 static struct security_hook_list landlock_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(capable, hook_capable),
+	LSM_HOOK_INIT(capset, hook_capset),
 	LSM_HOOK_INIT(mmap_addr, hook_mmap_addr),
 };
 
-- 
2.56.0

