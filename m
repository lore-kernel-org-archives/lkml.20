Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1547238C423
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790050335; cv=none; b=SelaMnaJX4toB0YeSEQW0uJIBFxwHCT6amUGENPCGQ4GZwiuqN/cKAlh5Tjvqp6FPmiHsd8CU9g1PJOzfS4EETuE4HAJn/p6cUywrTwZRB19Yv8fcMX0Nfk0AVqv1k0ulr0BeRBVacXiPOEZwxNB2oJajjiia8UZHjP8mCk+An4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790050335; c=relaxed/simple;
	bh=5aL03vW1m9jKduYwV6IRhyFNcudiVyfwVkrHgYrxGyE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=tat6TkqCTJCME8c8qXZGVpHYx8Kvf/9lBgbEMCDp/8Z+MoD8sS9ItDdPRW2b74wyFkB9uwltcpBNUQOhTbxuSb4EWvWXdEIfDuqSsZeDjMpqJiDoYZxQnWuhltswsC1EO1lei0MEMJulNu7Z1zuBkEF5uhLPzAtduieoFXuZTNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4ab4ca7ce3fso4143549b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790050333; x=1790655133;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HIrNxOnWEBb08j6CkzaxA9I/x7kXrNK+Z/qZ8wXXpzA=;
        b=RRFUQLpNTkNulHI7jC6GonVWdt2dFfyfY64jfZkKxMgSyaxTJfAFpDwWlOilQ0swCH
         n+zDoHEIxeREtYn+29U4ulFZwZ8HSrC4yKmd1Vz1L83YLYWH0EQOX0kJQ6g+qg4TwhvW
         4boYOlZbYAVyq0wfBN9Ab7kLzFgrPbHiruf+b6mKkCWiIVGog55hC4ULs/LMYbL3RghK
         RbYYepTJdDHsdHJZXpR5jMsiiqRqhhT5qgKe3EsmXrINsDpOnp6cFhdKguajGcyP2LuG
         KiMtbbvVU99MFg7kTjizfNXkJeuieGBiKdQh1cDtL+f74nT4/x82MKI5a5BQ1JtFQpvF
         +9Bg==
X-Gm-Message-State: AFuF++mH+rn6Kglb8XQSiTdJF3d71j2tZTysXRooRSck0ZRvVS2QiQh5
	Elqdd4jehJChqPIMWWJfrWUZtN8iYtn6D4TWOuIEnTPIb6GDsG9k2fphuTW2a7jRZHDvip+/bfv
	0kwqdr3NM4euV3t2spGsRRmoNWws1jmYpnxt/tz7+pDnuQFfyzr6U5PUFOVU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:906:b0:6be:19a6:fe60 with SMTP id
 006d021491bc7-6d18fb37b65mr1101733eaf.41.1790050332967; Mon, 21 Sep 2026
 21:12:12 -0700 (PDT)
Date: Mon, 21 Sep 2026 21:12:12 -0700
In-Reply-To: <6ab152fc.71f81b7d.15fa6d.0030.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab2001c.3179f8cd.1e36b2.0026.GAE@google.com>
Subject: Forwarded: [PATCH] ecryptfs: validate auth_tok key payload size
 before use
From: syzbot <syzbot+e4391e0d6e7c89b8c84e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] ecryptfs: validate auth_tok key payload size before use
Author: kartikey406@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master



ecryptfs_verify_auth_tok_from_key() casts a "user" type key's raw
payload directly to struct ecryptfs_auth_tok without checking that
the key actually holds enough data to back that struct. Since a
user-type key's payload length is fully attacker-controlled via
add_key(2), an undersized key whose description matches
global_default_fnek_sig lets later code (e.g.
ecryptfs_write_tag_70_packet()) read fields such as
session_key_encryption_key/session_key_encryption_key_bytes past the
end of the actual allocation, causing a slab-out-of-bounds read.

Reject the key up front if its datalen is smaller than
sizeof(struct ecryptfs_auth_tok).

Reported-by: syzbot+e4391e0d6e7c89b8c84e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e4391e0d6e7c89b8c84e
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 fs/ecryptfs/keystore.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index 51651314b7a6..81768a0e43b1 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -462,6 +462,15 @@ ecryptfs_verify_auth_tok_from_key(struct key *auth_tok_key,
 		goto out;
 	}
 
+	if (auth_tok_key->datalen < sizeof(struct ecryptfs_auth_tok)) {
+		printk(KERN_ERR "Auth tok key payload too small "
+                       "(have %d bytes; need %zu)\n",
+                       auth_tok_key->datalen, sizeof(struct ecryptfs_auth_tok));
+		rc = -EINVAL;
+		*auth_tok = NULL;
+		goto out;
+	}
+
 	if (ecryptfs_verify_version((*auth_tok)->version)) {
 		printk(KERN_ERR "Data structure version mismatch. Userspace "
 		       "tools must match eCryptfs kernel module with major "
-- 
2.43.0

