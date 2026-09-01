Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C81547255C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290276; cv=none; b=gl1X8gGuEiIwaWaCwKFRR662riDx6mnhY2qZ7hWMyX+Z1Y/wpul9lKpYlEkvIGBePA75hRbyOUS/zql+cnO1HSMfXP9svJleiD18cJArHTTTzj7XSku+1smfA97Se9CtE1kQzYPBa5YdDzThUMavEaT8NKZf61dAfhW9KIQx1RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290276; c=relaxed/simple;
	bh=0jwdXdfk3syk+XHr1u1Yc/KPjSCjcGtTUI06brHURIg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MQnnBvAX77yc5TbmJAYhq865ch4HGgIAlvp0Ca6RUg8vvGVnxHiAbUc2Zxvmpg73508RuC/oOMLGn14TG2HjXGcSYHaINCF9EPbyjy0o4ktmTu3f1dfU1NSyHrhsEGg8gw7SSMSir1cdXie3vistw17j0BauXKo96YsRTgjmr4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPoWDFHl; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPoWDFHl"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so1017395e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788290273; x=1788895073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eg0ua7x7JoyJExrPZs1KOT80PnYes7wKoAQi5Fj6K9s=;
        b=kPoWDFHl0ZjIYcHyQbonMk1eAe9CAtG/v5+n6xWeCgRP79zBgxkMJWxIgeWte1XyFd
         ETQWqGWOb0o74JlPAXlADznAy0b4MZZYkktcho5U02igkpg+9nqcZ8gXmatLfK6B6TdB
         dR6ukOaxj+3ClDj80o7RNSPmgt9sly5bsDww8Ne5y32ch+j2TAxnczKBolNxMToii/wn
         2J3QDo6a5rseAIbflEmOxbkCpD7LYXQphExm60B2ITuh8swzTMyK4/D1z1RfXojop+28
         SuyJvAAN+FpCmmjYm0+5yvPu/lQ/r+OjpbsxAEjQfWG1guHQv0uWc2p/VZW32GW5K9RA
         TYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788290273; x=1788895073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eg0ua7x7JoyJExrPZs1KOT80PnYes7wKoAQi5Fj6K9s=;
        b=k8DsFABA6NxT0ihS/IY00kPpPj14SZB0DsYTNJ8+aX3iyjkNuGbC5AFD0swY69ocB9
         SO3QqJdmQ+w4cMtxrl+2mPHVupUEqtYRjKB6Rr7aY5dTzFd6OMff0ts3qYYslHqDg1sv
         ym6G/n2c0T1WV1MhrbZO5hezpwC5fEjgznCKg/2FZRznA0Jw/NZcY0wieWoNI1qfxSfF
         g9+rKUpSfqpFcTKXjuIJr5MyBVbkAwrV0M22u8mvzVPxBeYma82FNtjGbFcRAw7Akmhg
         9EgCJSsOaY/nRkUQG6bQmW5H+lP/j40/r0paVYeezFEssW8coVrYUn/ln69S5VXpD8G6
         eEOQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLCiHUGrZ6h7DXYgqzG/o/9RVoJkjSlVVQRjXSiDA30yKLTnIwCVy/jA2iAAfzsYhNJcwqwBvU/PnKTcU=@vger.kernel.org
X-Gm-Message-State: AFuF++mzt+BbybxVvKevDS95rl4cdJUzg14/ZeIs+AZPxzt9rSAnb3m3
	eCWb+CwxMWnU3PJnTSrF1TgU0phkgAF+zJTHVboC0nvztt9u9ejnwUgk
X-Gm-Gg: AR+sD11KpXiuo9iu5Fcn2PlSdeo4Vqwr1Duvqh+1H6Rz4Hz42UqbIn3KN27EFXthJ9b
	AyHXDPfu+ladWALY0Z0RXIdnJb43swooMBQ27bcInqfPu3PAASc6DEItR/h1lHuoIdvp4CjI0pT
	rWSGTmPGFDGPVqiZdixUzJIQ6uWFjUBtwDQfEtPwp+n53tgH5pqhluZrFjtwSDgo/yh0x3yF9oD
	AyMQSCAt5fDdJX+KsodF3q83fvjzBCm0zvKLcSLFMMW/pTiAQGCVKiJjJN1CPEbxsYTVRsv7Qa/
	QnAC5r19YGlfAFCsZ7BaGiQgxKMkYKqu108GsA/1cnwN/m63U+bQ9mXxhQG6524LBgeYg8RmSie
	OEdOic5lPqE1fQdA/lOZdndTU7W6sF+NG+zm8dlnaBNrjXMdoKEeO9+AZGV2q/8Rr58IesrnkLV
	oXEUakEBKgbnpOpR5WtKLc68ya1OQ++KrdwwfXLTUV81/v+p4T8qlfK61o8USZZLrlTOhyjIyPJ
	5bi4g59ETbcau+qAdlZGFoPG4V5Gr/lbWUyavhNkDKa3Y8UeqSWtbXHp3TNH1OIfmnPfG9fPZCL
	0wxZ6sSbm5Ayd4DB0aq8Sbs93d99uQyWpZwYMv8NDMYtjIG/ZiFPtvZImRE3WBrDtbU=
X-Received: by 2002:a05:600c:1389:b0:499:49f3:77b1 with SMTP id 5b1f17b1804b1-49b91c1713emr527192075e9.3.1788290272273;
        Tue, 01 Sep 2026 12:17:52 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a16a-7801-fd8c-4b37-36b4-e53a.310.pool.telefonica.de. [2a02:3100:a16a:7801:fd8c:4b37:36b4:e53a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce47885b1sm7189615e9.14.2026.09.01.12.17.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 01 Sep 2026 12:17:51 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] keys: finalize persistent keyring timeout after link attempt
Date: Tue,  1 Sep 2026 21:17:43 +0200
Message-Id: <20260901191743.39210-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When no keyring exists for the requested UID, KEYCTL_GET_PERSISTENT
creates and registers one before linking it to the requested destination.
The configured timeout is set only after the destination link succeeds.

A destination restricted with KEYCTL_RESTRICT_KEYRING makes that link fail
with -EPERM. With persistent_keyring_expiry set to 60 seconds, /proc/keys
still reports the registered keyring's expiry as "perm".
The failed call therefore leaves a quota-exempt keyring in the namespace's
hidden register, where it may remain until namespace teardown.

Rename the write-locked helper to key_get_or_create_persistent() and return
the key reference through a result parameter. Return 0 when it creates a
keyring and 1 when the retry finds an existing one. Return a negative error
on failure. Another caller may create the keyring between the initial
read-locked lookup and the retry under the write lock.

Set the timeout after permission checking and linking. Do this on success,
or on failure if the call allocated the keyring. This leaves a new keyring
collectible after failure without starting its timeout while linking is
still in progress.

Fixes: f36f8c75ae2e ("KEYS: Add per-user_namespace registers for persistent per-UID kerberos caches")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Changes in v3:
- Return the persistent key reference through a result parameter (Jarkko).
- Keep lookup-or-create atomic inside the helper and use 0 for creation, 1
  for an existing keyring, and negative values only for errors.

v2: https://lore.kernel.org/r/20260901164323.35785-1-kmehltretter@gmail.com/

Changes in v2:
- Rewrite the commit message around the restricted-destination reproducer
  and trim the explanation (Jarkko).
- Track whether the persistent keyring was newly allocated and finalize its
  timeout after the permission and link checks. This preserves an existing
  keyring's timeout on failure and avoids expiry during linking.

Tested with QEMU 10.2.1 TCG on i386 and x86_64. With
persistent_keyring_expiry set to 60 seconds, KEYCTL_GET_PERSISTENT returned
-EPERM and /proc/keys reported "perm" before the fix and "1m" after it on
both architectures.

Also tested on x86_64 with persistent_keyring_expiry set to 1 second and
gc_delay set to 0. Successful calls reused the same serial, a newly created
keyring from a failed call expired, and a failed call using an existing
keyring left its timeout unchanged. A test-only two-second delay before
timeout finalization did not allow the keyring to be collected before link.

Two concurrent callers returned the same serial. A test-only 100 ms delay
after the read-locked miss forced both callers into the write-locked retry
and confirmed that the second caller took the 1 (existing) return path.

 security/keys/persistent.c | 55 ++++++++++++++++++++++----------------
 1 file changed, 32 insertions(+), 23 deletions(-)

diff --git a/security/keys/persistent.c b/security/keys/persistent.c
index 97af230aa4b22..e99929b81a1a2 100644
--- a/security/keys/persistent.c
+++ b/security/keys/persistent.c
@@ -33,25 +33,31 @@ static int key_create_persistent_register(struct user_namespace *ns)
 }
 
 /*
- * Create the persistent keyring for the specified user.
+ * Get or create the persistent keyring for the specified user.
  *
  * Called with the namespace's sem locked for writing.
+ *
+ * Return 0 if a keyring was created, 1 if an existing keyring was found, or a
+ * negative error.  On a nonnegative return, persistent_ref holds a reference
+ * to the keyring.
  */
-static key_ref_t key_create_persistent(struct user_namespace *ns, kuid_t uid,
-				       struct keyring_index_key *index_key)
+static int key_get_or_create_persistent(struct user_namespace *ns, kuid_t uid,
+					struct keyring_index_key *index_key,
+					key_ref_t *persistent_ref)
 {
 	struct key *persistent;
-	key_ref_t reg_ref, persistent_ref;
+	key_ref_t reg_ref;
 
 	if (!ns->persistent_keyring_register) {
-		long err = key_create_persistent_register(ns);
+		int err = key_create_persistent_register(ns);
+
 		if (err < 0)
-			return ERR_PTR(err);
+			return err;
 	} else {
 		reg_ref = make_key_ref(ns->persistent_keyring_register, true);
-		persistent_ref = find_key_to_update(reg_ref, index_key);
-		if (persistent_ref)
-			return persistent_ref;
+		*persistent_ref = find_key_to_update(reg_ref, index_key);
+		if (*persistent_ref)
+			return 1;
 	}
 
 	persistent = keyring_alloc(index_key->description,
@@ -61,9 +67,10 @@ static key_ref_t key_create_persistent(struct user_namespace *ns, kuid_t uid,
 				   KEY_ALLOC_NOT_IN_QUOTA, NULL,
 				   ns->persistent_keyring_register);
 	if (IS_ERR(persistent))
-		return ERR_CAST(persistent);
+		return PTR_ERR(persistent);
 
-	return make_key_ref(persistent, true);
+	*persistent_ref = make_key_ref(persistent, true);
+	return 0;
 }
 
 /*
@@ -78,6 +85,7 @@ static long key_get_persistent(struct user_namespace *ns, kuid_t uid,
 	key_ref_t reg_ref, persistent_ref;
 	char buf[32];
 	long ret;
+	bool created = false;
 
 	/* Look in the register if it exists */
 	memset(&index_key, 0, sizeof(index_key));
@@ -100,23 +108,24 @@ static long key_get_persistent(struct user_namespace *ns, kuid_t uid,
 	 * also need to create the register.
 	 */
 	down_write(&ns->keyring_sem);
-	persistent_ref = key_create_persistent(ns, uid, &index_key);
+	ret = key_get_or_create_persistent(ns, uid, &index_key,
+					   &persistent_ref);
 	up_write(&ns->keyring_sem);
-	if (!IS_ERR(persistent_ref))
-		goto found;
-
-	return PTR_ERR(persistent_ref);
+	if (ret < 0)
+		return ret;
+	created = ret == 0;
 
 found:
+	persistent = key_ref_to_ptr(persistent_ref);
 	ret = key_task_permission(persistent_ref, current_cred(), KEY_NEED_LINK);
-	if (ret == 0) {
-		persistent = key_ref_to_ptr(persistent_ref);
+	if (ret == 0)
 		ret = key_link(key_ref_to_ptr(dest_ref), persistent);
-		if (ret == 0) {
-			key_set_timeout(persistent, persistent_keyring_expiry);
-			ret = persistent->serial;
-		}
-	}
+
+	if (ret == 0 || created)
+		key_set_timeout(persistent, persistent_keyring_expiry);
+
+	if (ret == 0)
+		ret = persistent->serial;
 
 	key_ref_put(persistent_ref);
 	return ret;

base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.53.0
