Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08C54D990C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788792029; cv=none; b=cMmqzLOQARnSyQkISNh/xL61IItmiXNbhOlj7JoQRxAaQTvlQ2QUKDcCfcMMnk7G0qdkborYWurihFYuHFZ36EEqVuYwp9qVluJbu9ZgleHNZygVf4/ssHAg330S1JB/eT2pzUMpgqfUsth+o6pwA4n47YaJ7nST6DsKjXgaeDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788792029; c=relaxed/simple;
	bh=MjNB8CfDfmUW8DNyKbXFDh49Xf8rTBZBCl6feZdIEbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nc/XrK91i5VJIExclA7K/v7Fjuz35fC7WNwM9QHfTXScI82ROQkUYVmLknrU9T6VMERtmGTvHwloEjcq2/FFppd3FXROh+qplIXq4U8ywu/sgqJeopKLeONHcVnbPVGVv1n+DqI84I8bFXfFH578SYyVDOZQkf0iSfkHMWdqfAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oRDQ2/sU; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oRDQ2/sU"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a60f0dbeccso4606465a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788792023; x=1789396823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGuPIZsv+YqjLH8QIDchsgmrHPKGlBy1gWk3UBJliXU=;
        b=oRDQ2/sUSKUMyYEBIWNdef2fjAttQhwI2Mjazs54BNt2fSYWzi5dXpNsJ822BA/sZ3
         ikCP124uRjQNEc8CHIpXelqnG0eVnQEnJk8zTORs9XKqtqm84P8MvaYPy59yqErd7XlB
         Th4jjZQs3+jA3bP2O/vcbWy2H5VJ8UOJw/WfYiETvni8nQTqeZph1YP2/wUT/oKvFLQ/
         sFERuIPX622gRkd0Vze28jznflq8CvMFa9cn35DbLJMid/TDJWpt8RB3dK0b7Vb9N651
         1HHBXxFjelg/QnHyLRaw3TSF2LAvNENN6r6oRjqvC8feXoviPpyotPVI5yS815fky5Dq
         n2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788792023; x=1789396823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bGuPIZsv+YqjLH8QIDchsgmrHPKGlBy1gWk3UBJliXU=;
        b=ebM7KbPXpFKVUxqbnz4kBrjgeHrb+QD96KmP0gb9JNh9CA1/8EdUy6Mw3SPiJcU6ED
         DFx7GtzXXugWCBlT1re3NrC91ylwOO/pY2X3rbSBfEyhmYHcXVQLBElLTrBiuHYwO0K6
         ZxLu9T5vqOAdfREDaQyqx4vG2KF05Kptxp1YjnVtVM8/7DewLjDhk61MY2R71Q5QpTRZ
         UAToLfg2lOeRtR2tTFPKxfBmyFD9h3FIPTsOIS+Xe7w3NlDQI4mOArm2kPGYtsqC9+nr
         K7Zv6qXTrL4do9DVfFwCG9IVkC4G8IGv6C7hf/q/jIBiAP8j9o55JqlR5cmcKpamt4xr
         eHfg==
X-Forwarded-Encrypted: i=1; AKwUvBzdjm3ojTz8R/x4mAo/m2F0p/xzsURFi8SwSk7m/10138LXWzmHQxd24WN6g4525IcLe01XGPNN2/91nr0=@vger.kernel.org
X-Gm-Message-State: AFuF++lX89g+OiKNTkAVCAqy+i4IgBDp2z5PuhkSkWsX+Rap/Dkb5ecb
	9lf5QVXQfC8l1H4p6kor92VSTokCR5cEKH2RL6ssXy1GIlo2WoVmM3QV
X-Gm-Gg: AYBFou1i6tfxqGuGIkZT9I7cwdMisrqtLUNB1KhvRK3hVNwFpA0E4jDUiV1oAFPctzb
	sEAiC68+TKJAQ9JhnThEkZKvOS5W888Ews1sLvWbWMeRL9er3T1CP8RwuDIgs2btKdEbJzgm887
	lIwj8wupgczFVdYc05EDiRosERsuBfBKOeLWLnvDGZ8o/VzYSXTR+1F3jzn3TY4tcSOLGtImXPm
	FHMnq2ergPkhH5uF4+U/tfXv32rvsAJJ+qPNhoI5zSc6wMTGJuK1V76yc0Be2pOUwG4saPrUcZ3
	vlFWGBfHOmAfzy//sgYHJtzY4TfBREtHW9c2Sh8cM2hWpbhKZhIHfL8D7YQc/+iEaYRb922JUKj
	Z6D/fcqOe9vlpMJyi+8uzWu2p+Kcki+KI/kFy5e7MoXBWNuIJ58xYBtrT/qtggmGW9Ef/nn2gMH
	qIyiH2sOywsdwFwhm/k058rtzip3Fr64/DYwxn+LkUAG71AWV307M0y++E14T8ybaf/Qkscbk=
X-Received: by 2002:a05:6402:a0d6:b0:6a7:ea54:38f with SMTP id 4fb4d7f45d1cf-6a7ea542648mr7291724a12.32.1788792022928;
        Mon, 07 Sep 2026 07:40:22 -0700 (PDT)
Received: from grower.astralinux.ru ([82.22.172.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e6c20a41sm4438279a12.31.2026.09.07.07.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 07:40:22 -0700 (PDT)
From: Alexander Martyniuk <alexevgmart@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexander Martyniuk <alexevgmart@gmail.com>,
	lvc-project@linuxtesting.org,
	Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Eric Paris <eparis@parisplace.org>,
	James Morris <jmorris@namei.org>,
	"Christopher J. PeBenito" <cpebenito@tresys.com>,
	selinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bryam Vargas <hexlabsecurity@proton.me>
Subject: [PATCH 5.10/5.15/6.1] selinux: reject an unclaimed class value in security_get_classes()
Date: Mon,  7 Sep 2026 17:39:55 +0300
Message-ID: <20260907144009.162239-3-alexevgmart@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907144009.162239-1-alexevgmart@gmail.com>
References: <20260907144009.162239-1-alexevgmart@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bryam Vargas <hexlabsecurity@proton.me>

commit 22b05fec62c0fe9864cfceb52f7d0f3a34d9b1dd upstream.

security_get_classes() sizes an array by p_classes.nprim and fills it at
value - 1, so a class value the policy never defines leaves a NULL.
sel_make_classes() passes every entry to sel_make_dir(), reaching the same
d_alloc_name() dereference as the permission array. The class symbol table
is allowed to be sparse (policydb_class_isvalid() exists to absorb that),
but this getter builds its own array straight from the hash table and has
no such predicate.

Fail the lookup when a value went unclaimed instead of handing out the
NULL. Conforming policies define every class they declare and are
unaffected.

Cc: stable@vger.kernel.org
Fixes: 55fcf09b3fe4 ("selinux: add support for querying object classes and permissions from the running policy")
Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>
Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>
Signed-off-by: Paul Moore <paul@paul-moore.com>
Signed-off-by: Alexander Martyniuk <alexevgmart@gmail.com>
---
Backport fix for CVE-2026-80912
 security/selinux/ss/services.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/security/selinux/ss/services.c b/security/selinux/ss/services.c
index 80340bc0ee6a..a1e3520596d6 100644
--- a/security/selinux/ss/services.c
+++ b/security/selinux/ss/services.c
@@ -3414,6 +3414,7 @@ int security_get_classes(struct selinux_policy *policy,
 			 char ***classes, u32 *nclasses)
 {
 	struct policydb *policydb;
+	u32 i;
 	int rc;
 
 	policydb = &policy->policydb;
@@ -3426,16 +3427,29 @@ int security_get_classes(struct selinux_policy *policy,
 
 	rc = hashtab_map(&policydb->p_classes.table, get_classes_callback,
 			 *classes);
-	if (rc) {
-		u32 i;
+	if (rc)
+		goto err;
 
-		for (i = 0; i < *nclasses; i++)
-			kfree((*classes)[i]);
-		kfree(*classes);
+	/*
+	 * The class symtab may be sparse, which policydb_class_isvalid() exists
+	 * to absorb; the callback fills this array by value, so an unclaimed
+	 * one leaves a NULL that sel_make_classes() hands to sel_make_dir().
+	 */
+	for (i = 0; i < *nclasses; i++) {
+		if (!(*classes)[i]) {
+			rc = -EINVAL;
+			goto err;
+		}
 	}
 
 out:
 	return rc;
+
+err:
+	for (i = 0; i < *nclasses; i++)
+		kfree((*classes)[i]);
+	kfree(*classes);
+	return rc;
 }
 
 static int get_permissions_callback(void *k, void *d, void *args)
-- 
2.43.0

