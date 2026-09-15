Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5632038B149
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436327; cv=none; b=tHh8jXu73Q9OE4rkJNYon8mFngYMrUmdHUUfvmDaRqwzwtJI2Dq1rOnDcUyJUpCZDIBkostjhHvnx86XesJvUKaiItGTC73QM8NF9M5OrdGbVEif1EmprLIBLbzBOUGCSP3kcH5a8qLYtWeZNfbEhOvGzKOYbVmJ+q959FLQPL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436327; c=relaxed/simple;
	bh=/TKrTZgd0YfyEjb54nAEPi+Q7v30e2+bVMpdLEFoDlw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=U085zKlEoARC+uq8s0cHoCXURqVWiIX7zO5JTs27Mpw+/hicaoh2YhOXnqgEqA22aymUhwvECuSra99aRwou+DAtJJrEYdrb+b/79znkZx90DyceZEfuAN//40Jrd4y92aojLtYgwdY4Asr109NoXLz2uCLp8RSR6bGbsdgSAxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c2bb8200b0so3511659eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789436321; x=1790041121;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hgg7l0OlgFO6mh/Pim1q7cd/wJ4O30YZyz+wzdxOAHc=;
        b=XkNDs6+0uy+0Hsw7Ia5GNq3F9k8USnkjrMdWlNDx9Vk6QFyJZfdsH4wcK8WuCDS/UU
         8TPlOm1cqr5Z/RSDQXTbVLIBDC8F00YrOMEcUbhYQo61S04IDpr+ekTgqB1dqYlc3tuj
         HzNot8ujNqR67mZstETHLX2AWuuVHrm41D2d9FflGvtwINGQRf4Fd8qB5Qjs2H+txgs3
         PQixm5v9oSgCwAKryfNQ00C9jVwdxUldN67FcsiIyj7TuJlbgfwXkJkLNTUwFHAjQG4d
         hx0Vn8DR8Ccxu7V2yQmsvxceuMPo1TxfyVaVaUwBpkuy5F9g3DkAoUm2tDDcWXFXoq2Q
         YYMQ==
X-Gm-Message-State: AFuF++nyZCoG0pbFipvqwmUc0fvD4leUrJ9Xo/kqVE3Uf3VwD/swzpen
	/4GZ/NMMrZdotc/LRLcFwTLKul43FsbSbT7FE8Ep4YkZt65jG9wW16HjMqL4flXfWVJdEbh9HBL
	0LJb7zlcGFiY3gqI2ZkxJll6QIUh1CoA9RWf2BmTd/8qKHOVHE8+k53Vt89M=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:16a3:b0:6b1:8780:70fe with SMTP id
 006d021491bc7-6c54214a0bbmr2931611eaf.2.1789436320949; Mon, 14 Sep 2026
 18:38:40 -0700 (PDT)
Date: Mon, 14 Sep 2026 18:38:40 -0700
In-Reply-To: <6aa4a377.f81106d8.2ab401.0024.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa8a1a0.a211d2ce.1a5198.02a0.GAE@google.com>
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
index 9b4e29557..2449df2e9 100644
--- a/net/netfilter/nf_conntrack_netlink.c
+++ b/net/netfilter/nf_conntrack_netlink.c
@@ -3390,7 +3390,13 @@ static bool expect_iter_name(struct nf_conntrack_expect *exp, void *data)
 	struct nf_conntrack_helper *helper;
 	const char *name = data;
 
-	helper = rcu_dereference(exp->helper);
+	/* This iterator runs under nf_conntrack_expect_lock (see
+	 * nf_ct_expect_iterate_net()), which serializes changes to exp->helper.
+	 * Use the protected accessor to document that lock-based protection and
+	 * avoid a bogus RCU lockdep splat.
+	 */
+	helper = rcu_dereference_protected(exp->helper,
+					   lockdep_is_held(&nf_conntrack_expect_lock));
 	if (!helper)
 		return false;
 
