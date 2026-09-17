Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E7D1448E0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789608386; cv=none; b=uTuCQVqilJ1l7ZNI169ZjxfdNFbG8ikG1zKx41PO/7kRmRaLh+yJDEJqtVB4vEWx3/S1veUcqbBavIWZBcNkBNk+CETC+ylXyCOmeN86ira9VzD0+lzkMgJJCCaDkAAvfQQX2OGRdswRoFtckz8qamx3GoDoOD30gG6Yu62bPNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789608386; c=relaxed/simple;
	bh=Iwg1o8xrjdDAaqXLF1g326tRg46pawtn9ctQd5koHlA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=npqyTDX61hLLt17qJOoHS0Rv5Qs1Niu83Ox1sfMrGYcrYYBXRlpFrDGvDZm3kNSv4KlHpVyNbKT+3axGi5FMuGsPnrXZOm3HvA2bQGnILuTLvJv2CI/xRuU9g8iUKjQRnsPXBPKs0zAKa+2vhw+uk2RyBCjAnswh8MPcFYNbCPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28dafb8e1so620085b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789608383; x=1790213183;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6bhjM9tsttQJijG6S5/dISBKB3H8JDI8AFC6jULLqi4=;
        b=klQdS1jyQdPM5vXmTdzi4ApIeO0rNmBNcQCv+drlYR8od4fIpH9iOK8YUvQKaemMcO
         xgM5cGGCwEc7Q6YDT2Xg6Ays5JKMdEkPEd0yU8lRNnv9ScZI9YR5kT4Mpdx7kuhy3UPA
         6hXHYSImHPdkIra2Q/tuAZeo+fTQoB10O0J57hoEYRNMvW8/mkT+b+GUphwt3/ctTVjc
         SMMdPrnb7JTmjvAfswb69Bs8Y3g9DLLOMiJ9TiAwd+PxiBtBgaNcV/jIxIgmOo5kErUw
         ITYh+Oy0Sls1CtifPvWtQ9vMVipbbnW2ht9+Z0tI/iGOpcVBqqzz7Tw4GC7uQWHzhVsg
         Xktg==
X-Gm-Message-State: AFuF++mgKt74DAgSEiq70usEP6qqDRAwiO/0ljuu/0ar+Mxz1kwxmZE4
	G3wym0MkVTosfj/APv2TLWVn6gt4jgUOrrNmUzWockza8qfED8jjo7ooEIvflNxAaqOPdtNxOlh
	nK8+0XU1j6JAsN3nU50QIWrE1PpKhgTpEn+FCw0T8erBj7an02KKB3fkOQfI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:5090:b0:4c5:e178:2a4e with SMTP id
 5614622812f47-4ca4c17f285mr6357370b6e.20.1789608383788; Wed, 16 Sep 2026
 18:26:23 -0700 (PDT)
Date: Wed, 16 Sep 2026 18:26:23 -0700
In-Reply-To: <6aa4a377.f81106d8.2ab401.0024.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab41bf.b398a7c9.1f86be.0004.GAE@google.com>
Subject: Forwarded: [PATCH] WARNING: suspicious RCU usage in expect_iter_name
From: syzbot <syzbot+4bd730aede2791e40bdf@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] WARNING: suspicious RCU usage in expect_iter_name
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master

Reported-by: syzbot+4bd730aede2791e40bdf@syzkaller.appspotmail.com

diff --git a/net/netfilter/nf_conntrack_netlink.c b/net/netfilter/nf_conntrack_netlink.c
index 9b4e29557..d2ce1cc1a 100644
--- a/net/netfilter/nf_conntrack_netlink.c
+++ b/net/netfilter/nf_conntrack_netlink.c
@@ -3390,7 +3390,14 @@ static bool expect_iter_name(struct nf_conntrack_expect *exp, void *data)
 	struct nf_conntrack_helper *helper;
 	const char *name = data;
 
-	helper = rcu_dereference(exp->helper);
+	/*
+	 * This runs from nf_ct_expect_iterate_net() with the
+	 * nf_conntrack_expect_lock held.  A helper is only released after all
+	 * expectations referring to it have been unlinked under that same lock,
+	 * so the lock (not an RCU read-side section) keeps exp->helper valid.
+	 */
+	helper = rcu_dereference_protected(exp->helper,
+					   lockdep_is_held(&nf_conntrack_expect_lock));
 	if (!helper)
 		return false;
 
