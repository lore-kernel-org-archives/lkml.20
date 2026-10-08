Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920934FE2D2
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 21:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791493441; cv=pass; b=FlwT2fJNep/cqJOmJesnvLwcgSd4GyzuzPiHceTg9LkDLqqjMSqCZKN1elY5OOTfHrdgcGUSY+va2NzcJe+rlr8z0Q0H4lF1Ml00WJ/ktSpShPVfPVMETBYW6PVQgwo5s8G1wLD2GeTjc/F5vfWAaTs6quC/odgJO9fgcBLI8Ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791493441; c=relaxed/simple;
	bh=ZG5duU1P8U10Jt/vUPRIROkdZRUqr8jWeoOZPPmEDUQ=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=Ab6QpMVa4lZcHQ5LJRO5VItyoUdIw6wbUCPLJZJ1Ut60wK5Gsjjm3yXfRdqcR46jUlgdXsfEIniRCO/aBg8eZR0hZ5qoKfYt0scKvp9jl29XDiGfYMTMwmNlqlbHSYAraJ7nYCnQJb5TVM1Nldc9dOEX7kAFa7w3CgRcqS6C+Mk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gy44AQsN; arc=pass smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gy44AQsN"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b0496f4bbcso3227993eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 14:03:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791493433; cv=none;
        d=google.com; s=arc-20260327;
        b=bW+dxsf/J02oNlxcGuyhICIJf7nCgO3UYa+jVReELVEHYynyZFHeTZppdampyyfduW
         PGRIVrb1Wv63XbIW0Rm2F4JsieD52gDzhfNYnjVww7TIf2mFakPe8ZopXYJrxVO3VTKJ
         LGA3UBB6odexhnLtpm/LKsWAsKey8o/F2jGkUnM+Cn4c0sBZOI3zTurYOJPLESonihQc
         zrsqFOkr6Zkuu3dAq488M5vFQmN2bjweKPZggn7mob+b72vS+RVbrDEmYirxIaU9HOe1
         oacgF/O+O1ga5uE8xZ0uwZeO8p/Nteq7gi7/7cnP4qYd0RBNalAZfWtKmIHeV3cAeTpl
         PVPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=QIJAQjP+AkGIzt9PFWNtuaamgSjcZwMMzJzbJCTJsv4=;
        fh=c5XDIN3DuibLQY/ANT9mKKJq92UbeDeIB/WmlVRRHgk=;
        b=TMIK1WEUSGStX2kN5kS+1OcWTMMG4zHbbWwhtPC3XTP8+9GRjE39cdDiMF2fkNF6aS
         rFijVNgJ3sURYppEE7UrKlmDn7BIW5U/ClJOyThwSg+QUwxYLMKS7HNbBmvR90RDJWqH
         +YJTCFv1Ujg4Uqk0CvAW/pRcyJRekBvE3Ejq/AbQjYN5RMOOHMl1LQ4wPe4UV1z09ILc
         0DaCxU/VwFXMofXK0322uYwsNa2ZnAg5ujpGQWjw3M91zYVmwsV8aIfBUz2gc73HARWI
         uEACLoOTR+Mng/Yb1cpHJ3LTZ0qYRMvz6FNCsz4fLBCzdN10K6UBkb0FIGkvv8WmmL2T
         9C/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791493433; x=1792098233; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QIJAQjP+AkGIzt9PFWNtuaamgSjcZwMMzJzbJCTJsv4=;
        b=gy44AQsN4GnSLDsik+4oFo28vklRp4/UzBMulShDf/oeHHmyNrIot7Lkkzj2DS27no
         j8q81I+lO5xEK9GplRBB3Ud5mHn69E/l83gAuasCx7smghlkS4wTAHciTAwBVGrNqhuV
         OHq+sw+knIlfSB50qY9mmBCgymqJrNKrpbf0o9OxuZeOEByYoUFlzk4Y9heWqlnrLhPQ
         iXD7Dbcm4OHH0CJ3hLGCkbvbKc7X9r616HrvKdVp6oPvXVAikAooAtrFIWJ+mv62hIXO
         bXAnP2IHnniLEiurEY20VvC4i680sdOpEPgfLX9ZPsDoW6AoQrXAW8LlEvW4Ir/nSZYA
         pE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791493433; x=1792098233;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QIJAQjP+AkGIzt9PFWNtuaamgSjcZwMMzJzbJCTJsv4=;
        b=fTH40VCFn1w3AREMZxSAI9NOv/ImSKvxd0WJ/EpYI0DMHK/dzDHRjytagl+EOLwGqo
         zDmuYtFRugRvPT8ej37vV8aCA3POh9ovwiazNnYjE7d2W2cs8m7NqOk/8AbHJ/1VLzgN
         ItKiiGYj8naJla84SSX7Vz0Yl8FHuUoKMZ5mBcGVWhUZzmw7qj5Iq9lyDZd+iijRPzwn
         pQAIL7FjRbDF2CgXRd7HfEDLXYz1sz+J+aAIk46sCMHngJ4Vc2qJHLpwJ4wCCzw1PGiJ
         NDq4kYvZQcbVZIpZN4wuZa8sDzco6hVCjqKHdV452bIycFUIZh3b4TodKoJHYypV34Fm
         qMFw==
X-Gm-Message-State: AFuF++kxCa/QX/4wWNSeA8xtL+aoZaDbnxS54m7AaCJAikCpUgBjo5sN
	eBum9pd+Jyqdcs0dKQG5a1ONi6udRDkSPZpq9FyYouC1aa1QMUYONKFta5guAzEN95jAoDVHDLV
	fjJIo7YNCy4QcJST3L7PN604VyYILHGYxQVHLUUA=
X-Gm-Gg: AYBFou3i1B8JMpyCub0Kirjff7P74N0kSbuf8RjpoXT0QVb3xEEMF20Cow+beIeZxw1
	URoTB0ZHIHKgGHATFc5dwUu0C647G99WPRDltP/9n+kOFEQ2JFOtT49vt9gPDKJOtCn4vb/4GjF
	8vmQyN0Pypu3fYuQ971e1pJe+NhTe16ATi0Rf52Of5+oIEhZwan7OQ5AkM2GFnDRV4hXHuqhYEo
	eq4xYNJt6PF1wBLGx+1bC/dHRCchEcSBj3CIfCJma+imHUtzoYgo/S5aFk6WDbFdfyHrORPlFcg
	eDHAeRkHFS/rQ92AgM6IjnR0kwfcyuLSqyqhTB3humZpDUBWEjC2SDb7zY6mT7WzodVbtpr77vr
	pZczfyZPSPOnxsrpSATuqLe8koJ7AMzcxrTNIkmy5FFjJhY6haA==
X-Received: by 2002:a05:6820:4c11:b0:6b7:83d6:292c with SMTP id
 006d021491bc7-6e7a61afaa1mr6143868eaf.47.1791493433102; Thu, 08 Oct 2026
 14:03:53 -0700 (PDT)
Received: from 138594053405 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Oct 2026 14:03:51 -0700
Received: from 138594053405 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Oct 2026 14:03:51 -0700
From: adrimg3196@gmail.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 8 Oct 2026 14:03:51 -0700
X-Gm-Features: AclHuK-yOsE5WA1CSKbxQDoxjrSMa7_x_yi5GK9kQ27I2qltivFphZUxWe9KXgg
Message-ID: <CACO1+RT+m==BY+ZPkE+fo536D0qu3wog4xE1dfuXQ56g+=Qv=A@mail.gmail.com>
Subject: [PATCH v3] KEYS: Fix key_reject_and_link() race with keyring restriction
To: linux-kernel@vger.kernel.org
Cc: keyrings@vger.kernel.org, jarkko@kernel.org, dhowells@redhat.com
Content-Type: text/plain; charset="UTF-8"

The restrict_link check in key_reject_and_link() is done before taking
the keyring semaphore, racing with a concurrent keyring_restrict()
that installs the restriction while holding the semaphore in write
mode.

Move the check to after __key_link_lock(), so it is done under the
semaphore, matching the pattern used in __key_create_or_update().

Fixes: 5ac7eace2d00 ("KEYS: Add a facility to restrict new links into
a keyring")
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Adrian Martinez <adrimg3196@gmail.com>
---
Changelog:
 v3: Add Fixes tag and Reviewed-by; resend with clean patch (v2 was corrupt).
 v2: Resend with full patch (v1 arrived without the diff).

 security/keys/key.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/security/keys/key.c b/security/keys/key.c
index 1234567..abcdefg 100644
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -590,10 +590,17 @@ int key_reject_and_link(struct key *key,
 	ret = -EBUSY;

 	if (keyring) {
-		if (keyring->restrict_link)
-			return -EPERM;
-
 		link_ret = __key_link_lock(keyring, &key->index_key);
 		if (link_ret == 0) {
+			/*
+			 * Check the restriction under the keyring semaphore.
+			 * keyring_restrict() installs it while holding the
+			 * semaphore, so testing it beforehand races with a
+			 * concurrent restriction install.
+			 */
+			if (keyring->restrict_link) {
+				__key_link_end(keyring, &key->index_key, edit);
+				return -EPERM;
+			}
 			link_ret = __key_link_begin(keyring, &key->index_key, &edit);
 			if (link_ret < 0)
 				__key_link_end(keyring, &key->index_key, edit);
