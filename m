Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8365D23E33D
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 13:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791033240; cv=none; b=nWaePcSs7bsOuzQmb4AMRwgq1WDPHDsArbA7Rc/LNs7oExBjd3nDyXSBEvmZPiO6nMnbrKxIdkCODTfC1Ys+iRW5yvnSyYVgjzVf9zYYhnxUz28imyOT7tyYcU5ZTKK5R+fJp9EIwLzZ+D8YMQsKh1gwfkbPD/7dspF+TkSllx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791033240; c=relaxed/simple;
	bh=n9FfhBYuFIKuM0JKNvNL7w8NHvM+L7kz5nJM6xzTARc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Vzj7jc+YWMxi8GudoC+oPfdeyjhRa4M2HdiFjUf3KOpuK6tOC0FktVoO6JmxYgYShTVfjqxckVur9kInieN8tHvRwCXakGodTwqbzn2myyQCuBzcHjOLUZVIAnqrBqjnI8gtF1VMbaInV2vg45cMdZUO/0vY2HF7UZeZA1ivZd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b28dafb8e1so155564b6e.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 06:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791033237; x=1791638037;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=onKem4/H9ibCzX4aAMGlQkAgYidwU0xk7xyv/UiX7tY=;
        b=Hysdg+44/4klvWQAKlP+KU8LKLz2siYcracffP6QjIAX9TWieliTYRoY+ef6Xd5MAl
         ud706TtS1jKY3ZAj+oHXFXoKr4/+mW+C0rkkmFTVA5bvXNjtcOkaKfPALNDtnBCL/els
         CoFysWCX4xGdV4IMitpE0jS2xrt3puJjMDy5WvTPi+PD5bUQtSuUiDkmLqVkpaqe17TO
         Cp6ocN27XmJcxXZjVqK/hdXMy59veiV8pyEZjQ62Vs2VkJiSPomPuHjVQv2tfqAjhHJP
         dcEecfYe+3jgCKtjgp7rENSCLYmwb3OjE2T6QOjQy5Cifb3DOcnRs4XXLOPLZOfpeQDz
         cevQ==
X-Gm-Message-State: AFuF++kMeZ+q+nhdWylW4Khr85WQnm4/0I7+MHsKr7BMaeG4l+aoNNAS
	SgYUONzrFsQJlQjsHxr8/cfHJDJ+SyKkXtczOLa6RdhE5eDP7Iobgc5IyFFeYB9zc65fKmurlUf
	TU7k1ZojpEKmQII3QqzIK9KcxLOUWM1BZQQXQMGaDeq/Ha6Yyw8+1fIEoW3E=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:138f:b0:4f4:415:6f17 with SMTP id
 5614622812f47-4f52ad93baamr4647775b6e.43.1791033237323; Sat, 03 Oct 2026
 06:13:57 -0700 (PDT)
Date: Sat, 03 Oct 2026 06:13:57 -0700
In-Reply-To: <6abeecdc.7503fbd6.2d3f6.0010.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac0ff95.9ad129c8.3858c0.0017.GAE@google.com>
Subject: Forwarded: [PATCH v1] Testing for a slub out of bounds and uaf...
From: syzbot <syzbot+46bbbe175b7eea8036b8@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH v1] Testing for a slub out of bounds and uaf...
Author: nsvatoslav515@gmail.com

#syz test

Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
 fs/ecryptfs/keystore.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/fs/ecryptfs/keystore.c b/fs/ecryptfs/keystore.c
index 51651314b7a6..b9cdafb98e45 100644
--- a/fs/ecryptfs/keystore.c
+++ b/fs/ecryptfs/keystore.c
@@ -19,6 +19,7 @@
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include "ecryptfs_kernel.h"
+#include <keys/user-type.h>
 
 /*
  * request_key returned an error instead of a valid key address;
@@ -738,6 +739,20 @@ ecryptfs_write_tag_70_packet(char *dest, size_t *remaining_bytes,
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

