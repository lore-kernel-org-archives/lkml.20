Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69434DEC05
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789663726; cv=none; b=Dyqloqc829y2wHB7xS4qnxZZbE63gSQEfaX1oxKqc17IdjvBpbZqUH98Y1ZVYRP7bnlek5cBAjEveSLAHAWESEV3vHGQL10wwIgOLLTbW292LHFcVhkDSKgqAHkt7yBu9vkJlnUNVvGa9ZkRfXx2ihcpDip6R/jZfs5BTbKu49U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789663726; c=relaxed/simple;
	bh=dnNSjv6xLEel0IBLPtV4HS3EBau0mn9uPwhapcfw/Zo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=FO/3Sr3L691GNu4Yde94bsZkTYLDAvHunDWcMaBXcK1AIVasA3E2uAAWaOSCd7hf3cvCSVFEdx8YF33VbSkQolwt4TZbV6i1UwZ5Y+ssqxSEjuEeJRKD/K7h9GxPT2KtmSffB76mVAPMtAIqfTeRTKdFYodzbC2Kqoj1EjRtj5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b2f2b8d88fso1555214b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789663723; x=1790268523;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nFZh9Cy3YRkgXARijTiARDYrMQR43FdwLIY1MsdhbWA=;
        b=cXU0Ju5lbG/EU40JqqHp33qwiE+8V+TssoJSSIlV7ksYC3/vXhUX4jh/uUaux9aPkq
         zr3Kuf3WO7G4oomr0+bsAXzgQcD2uFtWSwaLxyPDkiyu0owPxvJeyQK6yBLnRWGn5wWt
         p46fUN8SafT913CT1arirRzTbNKIUduaPyEYqg/5RrTKCJ+6vS08LBN4oW0NKEkrKfF/
         aHBdPTH2Uf5TnWDOb1Fget562vsEylGvsUCP6j48ZTPbHzKYXBQG0Glqa6XkF0DPYrQ5
         qcuQFyIsffKSe03yA/GkYr5KBaA0UtPr7akb7iuXRKPJJxJlsxbPsCmwFP/dH+bCOzxf
         JMuA==
X-Gm-Message-State: AFuF++lvVxUtfyR4hT/DdOd65czYR3lTbagVRY4hueRexT7AhtoeYJ3C
	ZSpQa05xDJ9MYXoCrvhmOg8K2nhlqqJyZ2EsYAZGB+1uE8bdjrSAR92MJnX+rx3uc9W7n8GhGJy
	We0PLKVR6OVzJhDjIuoqtZu34vv+d6buTYRzSc/CLij7fpHhdUWMGCzUdHJg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1242:b0:4c5:a75f:c5e1 with SMTP id
 5614622812f47-4ca4bf7b68fmr9501807b6e.13.1789663723766; Thu, 17 Sep 2026
 09:48:43 -0700 (PDT)
Date: Thu, 17 Sep 2026 09:48:43 -0700
In-Reply-To: <6a8278d8.dbb3a75c.20434b.0041.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aac19eb.87c06881.1db2b3.0017.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Read in disable_device
From: syzbot <syzbot+4393dfdddf166f2de2b0@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Read in disable_device
Author: adarshdas950@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
index ddbc4d7482d2..ecba33abb6b1 100644
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -411,9 +411,15 @@ static int kobject_uevent_net_broadcast(struct kobject *kobj,
 						    devpath);
 	else {
 		const struct net *net = container_of(ns, struct net, ns);
+		struct uevent_sock *ue_sk;
 
-		ret = uevent_net_broadcast_tagged(net->uevent_sock->sk, env,
-						  action_string, devpath);
+		mutex_lock(&uevent_sock_mutex);
+		ue_sk = net->uevent_sock;
+		if (ue_sk && ue_sk->sk)
+			ret = uevent_net_broadcast_tagged(ue_sk->sk, env,
+							  action_string,
+							  devpath);
+		mutex_unlock(&uevent_sock_mutex);
 	}
 #endif
 
@@ -804,13 +810,17 @@ static int uevent_net_init(struct net *net)
 
 static void uevent_net_exit(struct net *net)
 {
-	struct uevent_sock *ue_sk = net->uevent_sock;
+	struct uevent_sock *ue_sk;
 
-	if (sock_net(ue_sk->sk)->user_ns == &init_user_ns) {
-		mutex_lock(&uevent_sock_mutex);
+	mutex_lock(&uevent_sock_mutex);
+	ue_sk = net->uevent_sock;
+	net->uevent_sock = NULL;
+	if (ue_sk && sock_net(ue_sk->sk)->user_ns == &init_user_ns)
 		list_del(&ue_sk->list);
-		mutex_unlock(&uevent_sock_mutex);
-	}
+	mutex_unlock(&uevent_sock_mutex);
+
+	if (!ue_sk)
+		return;
 
 	netlink_kernel_release(ue_sk->sk);
 	kfree(ue_sk);
