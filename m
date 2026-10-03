Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8FA13CF82
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 13:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791032738; cv=none; b=CBwX3fYWfiqHrCQZxaKGQHHsN82aElYAnEXh0qgBJ7wd/rW8TQpqGFvIAC81JE9v/VDK2pZ13pu3ipt+WD+Dcd1ocl7pOTgltMk5jr/0MIsoWEPTQlYOFkMdoUExKFUiIxBtKUehbFT3tYCxbW59dfo90Q54dQRw+DPARml0EVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791032738; c=relaxed/simple;
	bh=KMxCu1hB1PPPKRvBu8s7rQwT+lFZ7ZTQQ3a+EzPzevU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kgvglN/FmI9j2gciWbZbQOVqsdOzHG6RJbznSOm59fGiwgbdC8AkeCTQKTL/iJ3iEvDbV8S7LvhTr3sHTvfNaDK3Qwrd0tSrLkIZk0eTS4oGmxMkAuJDjvS4I1UpFVDYL80bQJAmLeAlFjt2SdbCwLqqjMd6pLYSd+a0RGMKtwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c55ba309c2so123779b6e.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 06:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791032735; x=1791637535;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LA1UwbOFOb6MvjWoT1yb+WWsSx+lZTj9pwHI6EhTaM8=;
        b=h3t/SGtDEy6tVyOA96yt4nqrPWVJCrGvQoICDI1FDrxn88MpxFSCWEHMHI2QF8r1My
         ihymYxpGIhn0g9nyR3iWZM2J1E6Kz25FUrCxSoMSgBwoHh5+h6iva4d5yc5k9HSozHNx
         GcsE5NuwMwy5zLNOxSS8hA7Z2DR44sZz3DCHG0RkM9xmXUYAxSQyODI0FC8y0fw1kF5P
         MLdFFTdG99A1VRdat4oKLXzRVV7Y7Loa/B4v/qQhF/t7mGM4XDrUS4hUkr06MGRX2if3
         kDEY+eYRyQJ4JydCsx+D7Y5eKPA9PBLnvzl5nYobtgEX/v/ohb+Xa84CcUGimeDHUfnZ
         4TIA==
X-Gm-Message-State: AFuF++mWwH1QtMrx2+YKDtr0Z1IdsMQ+tO/Hgu4IhVnxwcjpif1Ex5xk
	Gc2f3uMJ3YHkAap4algGHR027v8Gbk7muAehhiDVLxh5Hj9L12LyGeBYRezo23EZVDU3SsOrQeE
	NzJzM+bn6xTpsxQydRRpFzux/gaPjQUkObD4j2jWNKmvcD4pv4JDpgjW9R7U=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:130a:b0:4c3:b6cb:da37 with SMTP id
 5614622812f47-4f52a784935mr4568256b6e.35.1791032735572; Sat, 03 Oct 2026
 06:05:35 -0700 (PDT)
Date: Sat, 03 Oct 2026 06:05:35 -0700
In-Reply-To: <6abeecdc.7503fbd6.2d3f6.0010.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac0fd9f.9ad129c8.3858c0.0016.GAE@google.com>
Subject: Forwarded: [PATCH v1] Testing for a slub out of bounds and uaf
From: syzbot <syzbot+46bbbe175b7eea8036b8@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH v1] Testing for a slub out of bounds and uaf
Author: nsvatoslav515@gmail.com

#syz test

Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
 fs/ecryptfs/keystore.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index 51651314b7a6..256b7e317ea8 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -738,6 +738,20 @@ ecryptfs_write_tag_70_packet(char *dest, size_t *remaining_bytes,
 		goto out_free_unlock;
 	}
 
+	struct user_key_payload *ukp = user_key_payload_locked(auth_tok_key);
+		if (!ukp || ukp->datalen < sizeof(struct ecryptfs_auth_tok)) {
+			printk(KERN_ERR "Error key payload too small\n");
+			rc = -EINVAL;
+			goto out_free_unlock;
+		}
+
+	if (s->auth_tok->token.password.session_key_encryption_key_bytes >
+			sizeof(s->auth_tok->token.password.session_key_encryption_key)) {
+		printk(KERN_ERR "Error FNEK key size too large\n");
+		rc = -EINVAL;
+		goto out_free_unlock;
+	}
+
 	md5(s->auth_tok->token.password.session_key_encryption_key,
 	    s->auth_tok->token.password.session_key_encryption_key_bytes,
 	    s->hash);
-- 
2.47.3

