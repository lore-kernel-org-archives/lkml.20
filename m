Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F66143F8B8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386836; cv=none; b=AOENgYOhrrHMHYeKJNmA2/Vj7C0pGe0stuZ4DbasRCRopnC6qrzZuVq/NJj4gV6XOCNWqrbsiOKO5+NITq7N2PUasUKYP62bk4B2P2YwAnYCguJYMoI+PA7VY4/wHU0MTqG4wyhXmyAPumx0Xr+G9/3Jd7+cv1Tt+1pHU7+16Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386836; c=relaxed/simple;
	bh=Oy9g0Rm6pD4S64HJdm3CjnBlSj9nP4TkYubvGXXUt20=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=b4nF4g/SiGFWNIdjTSzpGednHtkUNRZC4t0XxIzACxoEu/unUFZxy9mzRDjgDMSPo6L+/kAKNWy4tZuqEfsbpLIOjwHJ0X+jvczXT2EZvVU74Y6lo1/CZeblEVjTt7Sp/oL6LZyPsD2W/PDEY66wR3lsowy+s8sCE4fXXvO0if0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c34cd4bffbso851341eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789386833; x=1789991633;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3wo7UwFKH7eZA0tNkfsZQYrFComugpOZXW7NZrfaLKg=;
        b=rTPqzPMsvy58E3Cc3g4Upp1Xbsj5OibqfWbT/m6JAf2CKAMxEGFtYW5+EDfgAqgBed
         7ke9NSJ0sPXfNRN3i+VXhN+CsyS32zICmBU6FseVWkMl/ib7+HPA9yX/u309F3za6F4Z
         zMPmzI21HC2oO1hxbhTdIvKZtLXGltkL7ZA3NbzBaWJnhunXIvPVmbjZbfF3bxvUe+zx
         1aIPv0efFV4kh+WGu0uLVc76wCfM+UIGQpiaECEJbedUblVeeS3g1PY6UCDCapFj0FWd
         t7RqmHAyKWPs8gBsOImhYAzuhvfdSG5gQqK1NoArTLWYnMkXVF5pp/YOcackDUyF8wya
         BRcA==
X-Gm-Message-State: AFuF++nd5J8AdNAhXrPgcubMoj+Qz8U9ulNvrOf901zqLnuf7Th6oXsr
	GdyVBDV+RQY2xjNT2zveRgtSbG5u1qlhUc4QLQUFUHvoKwW/zyOgu1WDpxYb8TD+ZUSx1If1m9w
	fI/4jR68SbuQOelQeStGf9y9i6EwdgFVrI5cBRqUIDgEqHN8qjBfcQW1E4Og=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:3091:b0:6b7:8396:f3d4 with SMTP id
 006d021491bc7-6c541d435aemr900088eaf.54.1789386833520; Mon, 14 Sep 2026
 04:53:53 -0700 (PDT)
Date: Mon, 14 Sep 2026 04:53:53 -0700
In-Reply-To: <6aa4a377.f81106d8.2ab401.0024.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa7e051.016ef6ab.da411.001e.GAE@google.com>
Subject: Forwarded: [PATCH] WARNING: suspicious RCU usage in expect_iter_name
From: syzbot <syzbot+4bd730aede2791e40bdf@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] WARNING: suspicious RCU usage in expect_iter_name
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git 15071f2a1263e82150c77eeb1e94dbfc31950a8e

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
 
