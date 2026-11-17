Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.157.188.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910741;
	b=k8JgKWPKKERplehf2ikxLYQbv/OpoZWbvRV9jMuc3uBnB0fRHv0WZakqHWxm+kgxRDlc
	 DfxTdIlr0Twes0fAwNDaJlfHLutWxKl/x1wps6gzEkm3sWTtTWYKjp4opeTogH1D3t/CY
	 Qu1tUK+HPWNeOBZcpdMX1Yh87iXiwXrfxTZrgC5KtKpCJJsInkU8Da739ZTATakKSUNB2
	 jHNV1T7eicc6uylaevct8Dm9ymzGmqoVdI70XneORbW/1dvMraw5yMk7tdoBtNlTikW7V
	 o5AyTA5fPNYnuD35R1tjQWeDmjjb/F4JIKYtA9Y8NTfFK9B5tMyI4e3HzqUNFO2KK3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910741;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=xyJt/IA562jYSqS9g8xyRoMMlRr+/oArZPwne7/nZrs=;
	b=jA+JFwSF9zJF56mcny5/gD2wReTQ6rNIoFaET4/CzEalFsG2jTLbuiWHbuvpYfRuRKli
	 wu1yxs+fMDtrNwHgZQEu4ocCKPi2IJlJxUMOPeRBIJNo9bBNwIp/XE55Krc35jJUtl+4h
	 YwaYFPV2Xm84Dbukn/VLPIfHF//I6mSECcYilRDPzotAlR453zvnmL8GNNCjMhHj/nSAr
	 ZwNFYIovDckjIT+9iuj0FNsDDJWtyt1s3pJNoErWRvML2Tr96NWtkO1O7CNYbM8b4+juA
	 Ctf5ekuoLQKbBW2AjigUAVilGWp9Pzfm+AzcAJxvS26DSpjIH2pE+LZ4sykepomka6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=digikod.net;
	spf=pass smtp.mailfrom=digikod.net;
	dkim=pass header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=Dv9awIs5;
	arc=none smtp.remote-ip=45.157.188.10
Received: from smtp-bc0a.mail.infomaniak.ch (smtp-bc0a.mail.infomaniak.ch [45.157.188.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24641606A8BA
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24641606A8BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=Dv9awIs5
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jTLL56hthzfCB;
	Tue, 17 Nov 2026 11:18:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1794910733;
	bh=xyJt/IA562jYSqS9g8xyRoMMlRr+/oArZPwne7/nZrs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dv9awIs5gUzRG+z63H0PIB1hWCqFtXbb/oeVorObp4TuVEOdcTZrZKTlMT7XLHc1v
	 Akfz04OdpGBVlHdY4vBJw3SjsM0gurUmSKllW5Xi+q+NQUksPhScHUZ44KyD6AFEBl
	 Oo7riDrp7FE6PgKklYtzrdM9PuU4IilcZVtQIxLw=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jTLL43Dp3zK4J;
	Tue, 17 Nov 2026 11:18:52 +0100 (CET)
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: Casey Schaufler <casey@schaufler-ca.com>,
	Georgia Garcia <georgia.garcia@canonical.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	James Morris <jmorris@namei.org>,
	John Johansen <john.johansen@canonical.com>,
	=?UTF-8?q?Ondrej=20Mosn=C3=A1=C4=8Dek?= <omosnacek@gmail.com>,
	Paul Moore <paul@paul-moore.com>,
	Serge Hallyn <serge@hallyn.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Christian Brauner <brauner@kernel.org>,
	KP Singh <kpsingh@kernel.org>,
	Matt Bobrowski <matt@bobrowski.net>,
	apparmor@lists.ubuntu.com,
	bpf@vger.kernel.org,
	kernel-team@cloudflare.com,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org
Subject: [PATCH v2 3/6] apparmor: Use security_capable_lsm() for policy capabilities
Date: Tue, 17 Nov 2026 11:18:40 +0100
Message-ID: <20261117101845.2523770-4-mic@digikod.net>
In-Reply-To: <20261117101845.2523770-1-mic@digikod.net>
References: <20261117101845.2523770-1-mic@digikod.net>
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

AppArmor checks CAP_MAC_ADMIN for policy management and CAP_MAC_OVERRIDE
for unconfined stacking with cap_capable() instead of capable(), so that
other stacked LSMs do not have to authorize them.  This also lets a
process in a Landlock domain that denies CAP_MAC_ADMIN manage AppArmor
policy, and one that denies CAP_MAC_OVERRIDE avoid the stacking
restriction on unconfined profile changes.

Commit 31ec99e13346 ("apparmor: switch to apparmor to internal capable
check for policy management") made this choice for CAP_MAC_ADMIN.

Switch these checks to security_capable_lsm(), which keeps this choice
for LSMs that only implement the capable hook.  policy_ns_capable()
still makes its own aa_capable() check.  Update the comments that
described these checks.

Cc: Georgia Garcia <georgia.garcia@canonical.com>
Cc: Günther Noack <gnoack@google.com>
Cc: John Johansen <john.johansen@canonical.com>
Cc: Paul Moore <paul@paul-moore.com>
Fixes: 97c8386f1d74 ("landlock: Enforce capability restrictions")
Signed-off-by: Mickaël Salaün <mic@digikod.net>
---
 security/apparmor/domain.c | 9 +++++----
 security/apparmor/policy.c | 7 ++++---
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index af9e8431e3ea..d2c111783457 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -884,11 +884,12 @@ static bool is_profile_priv_restricted_to_stack(const struct cred *subj_cred,
 {
 	if (profile_unconfined(profile) && profile == profile->ns->unconfined &&
 	    aa_unprivileged_unconfined_restricted &&
-	    /* cap_capable returns false (0) if true, hence true here means
-	     * doesn't have capability and the stack will be restricted
+	    /* security_capable_lsm() returns 0 if CAP_MAC_OVERRIDE is granted,
+	     * otherwise the stack will be restricted
 	     */
-	    cap_capable(current_cred(), &init_user_ns, CAP_MAC_OVERRIDE,
-			CAP_OPT_NOAUDIT))
+	    security_capable_lsm(current_cred(), &init_user_ns,
+				 CAP_MAC_OVERRIDE, CAP_OPT_NOAUDIT,
+				 LSM_ID_APPARMOR))
 		return true;
 	return false;
 }
diff --git a/security/apparmor/policy.c b/security/apparmor/policy.c
index 63f7821b4dff..ba162d921805 100644
--- a/security/apparmor/policy.c
+++ b/security/apparmor/policy.c
@@ -876,8 +876,8 @@ static int audit_policy(struct aa_label *subj_label, const char *op,
 	return error;
 }
 
-/* don't call out to other LSMs in the stack for apparmor policy admin
- * permissions
+/* don't ask other LSMs' capable hooks about apparmor policy admin
+ * permissions, only LSMs restricting capability use through capable_lsm
  */
 static int policy_ns_capable(const struct cred *subj_cred,
 			     struct aa_label *label,
@@ -886,7 +886,8 @@ static int policy_ns_capable(const struct cred *subj_cred,
 	int err;
 
 	/* check for MAC_ADMIN cap in cred */
-	err = cap_capable(subj_cred, userns, cap, CAP_OPT_NONE);
+	err = security_capable_lsm(subj_cred, userns, cap, CAP_OPT_NONE,
+				   LSM_ID_APPARMOR);
 	if (!err)
 		err = aa_capable(subj_cred, label, cap, CAP_OPT_NONE);
 
-- 
2.56.0

