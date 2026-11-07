Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794076538;
	b=lx2s7qoE0pO2cmKfebzEvo+Qmjnos5FbhCLi3U/FXht+8dv5U4R24W45x9YA8cK9jCgo
	 vOiCdWCxEvUgooTQLDfpIjI6AEDsHyY99uXdIwPWTsaKcaSbOcahP8QlgBq97MgpY0KO7
	 SW/fbPiRsJ9INyO17knM2k+jPGVs1QG3v2M9IlNEPMGK5bcuRSMuEWJbXnyEF4W5afTV8
	 CJhnEYErsQ7CdXQoe+znL+juEhBYaFn0l4HUm3sQ+8QNaSCeE3GCgbZcHrUGB9/puDi7Y
	 Xr/tSo6WPonRdD3DBZETysgVgzq6UTRYtmp/b0ySJEyoOnUtortvh3hP49kooVGkFVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794076538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=edAgMeDTSdzzewfHuukTFL6aVX95e9fem3szzjNzGNs=;
	b=Ex3eB4rZlwil2m9BioOm9cxjuFhoDpjkVIj3f4iA8lLMNEMV5eB//gmXZ8aScRWJYdoM
	 tH1iTAqyj/Ap+7QQTO5VhNbH9rqChfCTB7Y4TkdVigu6h+qI9/sTciEwuj2Y3jLb7ExKh
	 6x9pae2h1SGscyfEFjHSWbyaqK7O7jESeDVzi+7GvuwsIKf/WwPv3RP0NhouURUjtKFF1
	 w9wbewcxqEC/1ZRwN9mJEtoq4FAmZp06/bkdi5CzclxbQZGGMvBP/VNuzMCKQ4XHGJhJ5
	 KB1w/PWDtW3NaZM7OFgMn2/jdlKW2jG8NEh1GRTPXJbTZYSBFMT1njR5eFzZpAbAAQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KqcwiZ3n;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B264606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 18:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B264606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KqcwiZ3n
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so631576a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 10:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794076537; x=1794681337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=edAgMeDTSdzzewfHuukTFL6aVX95e9fem3szzjNzGNs=;
        b=KqcwiZ3niNxWjz9hp9UhKgTfpndMRTTSiJDtL6X30kmtqhy87YGmMfb+zrQ9BMf9Tn
         lmnnSftcmxK69g872T+ghkWQIjhefoQ4azpZ9psO/5EwDUEOaygpREJwXq1pcqAAAmti
         wIPYQ7dPF73p7SYGZ17vM3360ibJ/CEpt6xBYPrvsY3Am8UbL7gnQ8ZdAddKCn5Jaknb
         oFHoexi9TCVKysYqbZGRFKKUf1Hte8QKOWKK0+mN6M+j57tKci9afJqc3/owDNDAw0TO
         z6qn6Z9o61otCASh3u9LlUavTlyeEzkDKb3jZmszMja8kIn8TS9d5/v3AD6W8nv8rFIV
         4tIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794076537; x=1794681337;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=edAgMeDTSdzzewfHuukTFL6aVX95e9fem3szzjNzGNs=;
        b=Vlg3XkWndEUCyxvwGLAB5pOTDckdSPOfYXELJ61cgAYe1GxyOAI3Ii+tFgYf8uPKjU
         3fF2NQGd0rgIgsqrfswO1wxwafhUyn7pyJNuLeUMBNmC+ZyrMfDbl1Ep3U6wqMIb0rUk
         4iHduRaMVBO2+e4f/Xk/LJM1LslKe008Fon2MWQijc771Oh/u4BuuS+grusDSu5F6SLX
         WGJ7Hf+rxqGLZxCgDmdtcYcJOXUvv7T6Q9ce0sPkKj0hWI1+aFeS0UxMUVMJOYShRH+U
         QTJQpRjcsO5Zj63qU0GzGNjoZRa/JVFWDAYPVKT+h/VgnBeQCbiLUK0H/IoJM7wuyywo
         WU4g==
X-Forwarded-Encrypted: i=1; AL+hErF6VpIR2LnxhAcAz+OWgQ2EH9m1HCR0vLkYAL2d56UijP79n92b42Z56ltJcMzKaZlb99igWqU9QBQfiio=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eCMJYyYYC8czq64aazNQ6q1YquhBUrU9ucMncdW0hwm6xaSGf
	xOB1lu8kRZGH6K1Nn3rpru7aULTPPJPHgFnoQnzm07Tz7PUFf/4KmNPD
X-Gm-Gg: AYBFou0ajZlOU4vHjlIe29Ybnq60Rnke6f7yUaoSb3w+Lg9FjrMVdpp0yWPNxRhBFEc
	YP20zRn0dm+lnlzmqfmGJ/R+WXXUD7zbL20JATDcgbWx2WFfVR677U4WZusTsIr1lHSJPm9kbQM
	DVRsgOgExcPebAh07jNBvjhmNidpV5YLpOL5tpJ5A536D8GQ+4ScYQxKliWFYBLEDjcMhlMB9I1
	uw8lFdX60e3o4EDBGpB8EaNUqTMyo1HjVNE8L8sJ+sK9Q3iN5RI1mtwwmLEqftO9XB+b+ozNReL
	f7dLftbvFqZAXITzvgu1ZfYTlBhR5qEHV3Hzq5HsP6HMgBJ/Zznmrr9+WsNls3qjHo8naLwZDiA
	W/sZx/SZhapeydIVSEGCfm6a1OXuiirxQdK1RM5N3N/dRp9wv1EFCDAivJReRCDGKheWjv3Wh7b
	FlbR7MLKSt04B4HKpkXi1dAZ4hhisFQCTmsX2GgYNg9AibNCBNdvwB4WAo8RvCSmHwK5uGhBJ6u
	yI6GyJAZeoFOX9QegptV5eEPmt5jNXh/TMTV9Qh56lZe1zU76mZEggIdWCQr1ha/ri/0wMWFedi
	wfd8lZrnUcgq2t1+9C7/a5NnVlmymC4y3Boh/2QxrdlX7qxuLAdM8+L9vei7gjdunbD4vbqWV7i
	lpdA=
X-Received: by 2002:a17:90b:4d82:b0:3a8:f70f:2437 with SMTP id 98e67ed59e1d1-3b0db722a02mr5510329a91.50.1794076537030;
        Sat, 07 Nov 2026 10:35:37 -0800 (PST)
Received: from Terra.tail0ac356.ts.net ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1152fa888sm1392566a91.9.2026.11.07.10.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:35:36 -0800 (PST)
From: Weiming Shi <bestswngs@gmail.com>
To: John Johansen <john.johansen@canonical.com>,
	Georgia Garcia <georgia.garcia@canonical.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>
Cc: linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shuangpeng Bai <shuangpeng.kernel@gmail.com>,
	Xiang Mei <xmei5@asu.edu>,
	Weiming Shi <bestswngs@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] apparmor: hold candidate profile reference during attachment lookup
Date: Sat,  7 Nov 2026 10:35:15 -0800
Message-ID: <20261107183514.1575928-2-bestswngs@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

find_attach() retains the best matching profile in candidate while walking
the profile list under RCU.  When matching xattrs, it pins only the current
profile and drops the RCU read lock around aa_xattrs_match().  A concurrent
policy removal can therefore free an earlier candidate during this window.
If the policy revision changes, the retry also preserves candidate and its
ranking state because they are initialized above the restart label.  The
final aa_get_newest_profile() then dereferences the freed profile.

The reproducer triggers:

  BUG: KASAN: slab-use-after-free in aa_get_newest_label
  Read of size 8 by task poc
  Call Trace:
   aa_get_newest_label security/apparmor/include/label.h:413
   find_attach security/apparmor/domain.c:505
   profile_transition security/apparmor/domain.c:700
   apparmor_bprm_creds_for_exec security/apparmor/domain.c:1034
   security_bprm_creds_for_exec security/security.c:793
   bprm_execve fs/exec.c:1861
  Kernel panic - not syncing: KASAN: panic_on_warn set ...

Take a reference whenever a profile becomes the candidate, drop the
previous candidate reference, and reset all candidate state when restarting
the search.  Release the held reference after acquiring the newest profile
or before returning an unsuccessful match.

Fixes: 8c62ed27a12c ("apparmor: fix aa_xattrs_match() may sleep while holding a RCU lock")
Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Closes: https://lore.kernel.org/linux-security-module/20261105164839.66760-1-shuangpeng.kernel@gmail.com/
Cc: stable@vger.kernel.org
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 security/apparmor/domain.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/security/apparmor/domain.c b/security/apparmor/domain.c
index af9e8431e3ea..53465caca702 100644
--- a/security/apparmor/domain.c
+++ b/security/apparmor/domain.c
@@ -395,9 +395,9 @@ static struct aa_label *find_attach(const struct path *path,
 				    struct aa_ns *ns, struct list_head *head,
 				    const char *name, const char **info)
 {
-	int candidate_len = 0, candidate_xattrs = 0;
-	bool conflict = false;
-	struct aa_profile *profile, *candidate = NULL;
+	struct aa_profile *profile, *tmp, *candidate = NULL;
+	int candidate_len, candidate_xattrs;
+	bool conflict;
 
 	AA_BUG(!path);
 	AA_BUG(!name);
@@ -405,6 +405,12 @@ static struct aa_label *find_attach(const struct path *path,
 
 	rcu_read_lock();
 restart:
+	aa_put_profile(candidate);
+	candidate = NULL;
+	candidate_len = 0;
+	candidate_xattrs = 0;
+	conflict = false;
+
 	list_for_each_entry_rcu(profile, head, base.list) {
 		struct aa_attachment *attach = &profile->attach;
 
@@ -477,7 +483,11 @@ static struct aa_label *find_attach(const struct path *path,
 				/* Either the same length with more matching
 				 * xattrs, or a longer match
 				 */
-				candidate = profile;
+				tmp = aa_get_profile_not0(profile);
+				if (!tmp)
+					goto restart;
+				aa_put_profile(candidate);
+				candidate = tmp;
 				candidate_len = max(count, attach->xmatch_len);
 				candidate_xattrs = ret;
 				conflict = false;
@@ -487,7 +497,11 @@ static struct aa_label *find_attach(const struct path *path,
 			 * old exact non-re match, without conditionals such
 			 * as xattrs. no more searching required
 			 */
-			candidate = profile;
+			tmp = aa_get_profile_not0(profile);
+			if (!tmp)
+				goto restart;
+			aa_put_profile(candidate);
+			candidate = tmp;
 			goto out;
 		}
 	}
@@ -495,15 +509,17 @@ static struct aa_label *find_attach(const struct path *path,
 	if (!candidate || conflict) {
 		if (conflict)
 			*info = CONFLICTING_ATTACH_STR;
+		aa_put_profile(candidate);
 		rcu_read_unlock();
 		return NULL;
 	}
 
 out:
-	candidate = aa_get_newest_profile(candidate);
+	tmp = aa_get_newest_profile(candidate);
+	aa_put_profile(candidate);
 	rcu_read_unlock();
 
-	return &candidate->label;
+	return &tmp->label;
 }
 
 static const char *next_name(int xtype, const char *name)
-- 
2.56.0

