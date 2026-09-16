Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263064C9DEE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789578233; cv=none; b=ozzojRWVqXbn7tZqUrJoozI/UI6ERKwwznDxB1Rqxdk1kLfVY2rJphnNwuXSHuSzsz0+SLSnm94kfLFh4Cdm2rUn7f80lpLCDjUzK70AHdq2z/6io40c104MyxE4nudxMC0wDTZoZ6B/VdEODGZ106kxD5KKAlMpPaPbpRNT71s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789578233; c=relaxed/simple;
	bh=Ks4WXakjDHaULISnrpHV/j5kbM2MXAKKMjVWUBVW3xk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VQHLF20fQJzM4m2Va0YeEW7d83u102zylgModo9YpzDP7gsNwBxP9rpsyYYir/7qp9p8M8+YCmz9Q2IvAfAeqxiEXHVXkvWd57mJoQoS3/PzY2cJespGRhg0tMrZ6rMmyw2RlPwMV7sUCtMYtmD6NUyNjiDh8mPcjedhjnbdz/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTlmxjDC; arc=none smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTlmxjDC"
Received: by mail-oo2-f40.google.com with SMTP id 46e09a7af769-7ff1e4ffb3aso832072a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789578220; x=1790183020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XPj8i2bxKQOSEoNifSANwZq2nYwCvvCNoM4rujFqkpk=;
        b=LTlmxjDCgOTX+Iv6NIjiaRTEPmNIhR5QIOJrzuzqpJ/PmD8+T56CPau6AKI8ZSqpPR
         9Hr0e+aF1z/vizB+FR14KiigEESe1c6oxW9OVJhP8II96/FCVOLJpWPd/HI2Fa5rBRt9
         Gg2tRV0s4GKp3KyrGBD0PAHE6CvQz617q61mHp30b9oOVcDckzCuc2AF3lsxZlAo/VeT
         U+QBurRoWMDiqsX3Pbb3/0o/Z1WedhTOQRfqH/VFrxoUAHvadn9jbVV/3sfFYoVzodqA
         VcbydKCq3zzvESwlNwej+gAeeKQIud68AqCIJxzrSIUlr44vO3M0XHXXNrbfgObOiLqK
         pTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789578220; x=1790183020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XPj8i2bxKQOSEoNifSANwZq2nYwCvvCNoM4rujFqkpk=;
        b=g94tbtTxOgdzbJPZri7fOm3ksIg5FHEU8ma2NfTPHSh3aolDpgOz7nhy3jqke4/su2
         J36C1cEkgOCjBN+rc6+vactAhN7tLkiFWq27cfo/dQ1Dsm8BjkFC57RkPfOwAi0y58IP
         2ydVUXfUKcVwRYzUbu2R4fXVU3nJjJ+uFXxqg6nvblMy79R5VB7rbAxhgsqmMdiezOTz
         om6eMmG1IwGbuHKTxnKnzsEsQac1NyDbX24TUocfIDoytIZSIsV8k8qdUJ5Q1rLLVaXZ
         OlHrW89gMYtSP2g2m+YZr+HLHPgWF/seRB2ZR1Bi2cDpVKgACDyTrgShiEz52sDpNspR
         51hQ==
X-Forwarded-Encrypted: i=1; AKwUvBws3aU9yVLsFJSuQgJf2TliJR8YEuMwZ0DJcziScvwAw/IJD9MkRHkr3s0gTwzGJUwXfhrXFDevWYfmNio=@vger.kernel.org
X-Gm-Message-State: AFuF++kg6cGg3GpNC5yMfyB9yUEVWyra4qZu8NCEOQHiP6QZM1Q/WmX9
	JyGQT7s416Itid/W4gZc16+JuX2XUvcOzfCfF/5W2PqZc1+jvNwZik7R
X-Gm-Gg: AYBFou09siMELNrZcrLDF9dHV/nXuVZx8Lz/zMlF1xnjS/7yVVgK+gsCH7zTGzUdYza
	S29xoHEfjwuLAm1m6VF8jCPrBnJPv8xRMMoX31lAwFawVmoG9QipMnT+ECqpYHL9kLEXWJ+uOkc
	Zwt1zbnCr574b5/9vK9mY6ysJlP6eHBnA0dlEHwfhqgSzRdyciQPd5oC5Vp90DMD7kqDOJ1yz8R
	y3ZTvfOkwmw2dcXPPpKPOlcDmVO/FcYcxhZyxYcz8BorlewbwCV04waHAM25K1mToE+Q2z2f8i+
	QLVQcYxQ1Y5A2oNaoR2rZHOohnfpVEGtBxE/gzS24Cd64xrOIKE7+m4r2DI6Z9aBgab/Hqs18j8
	7dgGQZx9VLbi1YMsj48Qa2W5KihZr32+g6VZ3wHKI4ZD6vcatYv6rPDuZUWIbwn1oXtkjAKuGMt
	jmLxISzOjUZi1dzEMnGk8zqwAjxhmMXKWx9Q4b7cdS
X-Received: by 2002:a05:6820:1f04:b0:6c4:28bd:fdf3 with SMTP id 006d021491bc7-6c7d340555amr3126331eaf.34.1789578219819;
        Wed, 16 Sep 2026 10:03:39 -0700 (PDT)
Received: from gmail.com ([2804:1b3:c402:7a4c:6d25:8c4:21f3:ba2c])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c8f7bc41basm366840eaf.15.2026.09.16.10.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:03:38 -0700 (PDT)
From: Murilo Duarte M de Almeida <muriloduartemouradealmeida@gmail.com>
X-Google-Original-From: Murilo Duarte M de Almeida <murilo.almeida.dev@outlook.com>
To: john.johansen@canonical.com,
	georgia.garcia@canonical.com,
	paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com
Cc: apparmor@lists.ubuntu.com,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Murilo Duarte M de Almeida <murilo.almeida.dev@outlook.com>
Subject: [PATCH] apparmor: lift path_name lookup in umount
Date: Wed, 16 Sep 2026 14:03:09 -0300
Message-ID: <20260916170309.396648-1-murilo.almeida.dev@outlook.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before this change, pathname lookup for umount permission checks was
performed inside profile_umount(). This mixed object-specific path
information with profile-specific path configuration.

PATH_IS_DIR describes the object being unmounted, while path_flags and
disconnected belong to the current profile. Keeping these inputs
together inside profile_umount() unnecessarily coupled pathname
resolution with the permission check. An existing TODO in
profile_umount() already called for lifting this lookup.

Separate pathname resolution from the mount permission check.
Calculate PATH_IS_DIR once in aa_umount(), since it is specific to the
object. Then, for each profile, combine it with profile->path_flags
when calling aa_path_name(), using profile->disconnected from the
current profile.

Move this per-profile pathname lookup into umount_path_perm() and pass
the resolved pathname to profile_umount().

Keep profile_umount() focused on checking the resolved pathname against
the mount policy: DFA matching, permission lookup, profile mode
handling, and the final AA_MAY_UMOUNT check.

Signed-off-by: Murilo Duarte M de Almeida <murilo.almeida.dev@outlook.com>
---
 security/apparmor/mount.c | 42 +++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/security/apparmor/mount.c b/security/apparmor/mount.c
index 4ed7b9136beb..c7dfdae95747 100644
--- a/security/apparmor/mount.c
+++ b/security/apparmor/mount.c
@@ -541,13 +541,32 @@ int aa_new_mount(const struct cred *subj_cred, struct aa_label *label,
 	return error;
 }
 
-static int profile_umount(struct aa_profile *profile, const struct path *path,
-			  char *buffer, struct apparmor_audit_data *ad)
+static int profile_umount(struct aa_profile *profile, const char *name,
+			  struct apparmor_audit_data *ad)
 {
+
+	AA_BUG(!profile);
+	AA_BUG(!name);
+
 	struct aa_ruleset *rules = profile->label.rules[0];
 	struct aa_perms perms = { };
-	const char *name = NULL;
 	aa_state_t state;
+
+	state = aa_dfa_match(rules->policy->dfa,
+			     rules->policy->start[AA_CLASS_MOUNT],
+			     name);
+	perms = *aa_lookup_perms(rules->policy, state);
+
+	aa_apply_modes_to_perms(profile, &perms);
+	return aa_check_perms(profile, &perms, AA_MAY_UMOUNT, ad, audit_cb);
+}
+
+static int umount_path_perm(struct aa_profile *profile, const struct path *path,
+			    int flags, char *buffer,
+			    struct apparmor_audit_data *ad)
+{
+	struct aa_ruleset *rules = profile->label.rules[0];
+	const char *name = NULL;
 	int error;
 
 	AA_BUG(!profile);
@@ -556,23 +575,14 @@ static int profile_umount(struct aa_profile *profile, const struct path *path,
 	if (!RULE_MEDIATES(rules, AA_CLASS_MOUNT))
 		return 0;
 
-	/* TODO: lift path_name, need to separate profile path_flags from
-	 * the lookup
-	 */
-	error = aa_path_name(path, path_flags(profile, path), buffer, &name,
+	error = aa_path_name(path, flags | profile->path_flags, buffer, &name,
 			     &ad->info, profile->disconnected);
 	if (error)
 		return aa_audit_perm_error(&profile->label, AA_MAY_UMOUNT,
 					   error, ad, audit_cb);
 
 	ad->name = name;
-	state = aa_dfa_match(rules->policy->dfa,
-			     rules->policy->start[AA_CLASS_MOUNT],
-			     name);
-	perms = *aa_lookup_perms(rules->policy, state);
-
-	aa_apply_modes_to_perms(profile, &perms);
-	return aa_check_perms(profile, &perms, AA_MAY_UMOUNT, ad, audit_cb);
+	return profile_umount(profile, name, ad);
 }
 
 int aa_umount(const struct cred *subj_cred, struct aa_label *label,
@@ -587,12 +597,14 @@ int aa_umount(const struct cred *subj_cred, struct aa_label *label,
 	AA_BUG(!label);
 	AA_BUG(!mnt);
 
+	flags = S_ISDIR(path.dentry->d_inode->i_mode) ? PATH_IS_DIR : 0;
+
 	buffer = aa_get_buffer(false);
 	if (!buffer)
 		return -ENOMEM;
 
 	error = fn_for_each(label, profile,
-			profile_umount(profile, &path, buffer, &ad));
+			umount_path_perm(profile, &path, flags, buffer, &ad));
 	aa_put_buffer(buffer);
 
 	return error;
-- 
2.43.0

