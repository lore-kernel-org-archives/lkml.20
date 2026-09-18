Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFAA25783C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789711748; cv=none; b=sQFXHSrPYR03YJ5rPqG5PuImhr4mHqzN5Jzb6EqEycofJyPqtwC0E8tRjQNPvle7QE+P80K4lfgbEEKbQcsaN/bIWkTqZL+M7w199nGMO50I3LkiAZkXVyiEw0behtBJXojsHDhmDos/Bn4dzDPt5rPSsA/6KLF8moWV40xeZQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789711748; c=relaxed/simple;
	bh=9MMcQqbCyatW417RSOpUlF7r32cLepJryAxtTXy4U5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GdpZ2eM5jAwJ8bK6+h1mNOdAKdZlFdZmvdUCqtBh6N2P3TOiGRc+TGxmn4UT73d28Lg5cMcPWBY/8xSa9Zzgsx69fYvJLkg/ZijEtSb1+lJH9Yrg/B8j4wVUvH51rP4uxXBOTMDznjwCOMcInmsCCPI8BEj6Butnfo2Rs/2E+sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hNsVGr6i; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hNsVGr6i"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so336241a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789711746; x=1790316546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ORxTFOuB2ucPeCFRcbiCodxruveHPk2zly7F4fcoL7c=;
        b=hNsVGr6iJ211g6Yz3v/3Zd7/ujiIO8X2ip21ScNXz4JddZbrde7ZAQZvYPCEPBqFdr
         AiDDbQ8XmLwFhLsncw+VdihGHcaDVNFKZJcTKHCX28zkzbPZFja5f7OuhE7Mx2fUOAvF
         PyX1OhbmHAZ+t5O6T6XLmotE0vOMPYuESg43+IrIGQek8UlF5ODfX3NVYNUhovU0AtM+
         mvBPCcXVdCDLS3doBHU2rGBkE3IhJ8vzQhjX7HFJoWNf20G/hRLueRfiLSr313o+h1uQ
         uLbZLW9vDYVeb+NHlZqR4FqoR2xkXg/3MUIYtq/A4qf/WS5LUDqx4VeFQbedOCT72gkl
         vqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789711746; x=1790316546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ORxTFOuB2ucPeCFRcbiCodxruveHPk2zly7F4fcoL7c=;
        b=SCa/NxC17ooWlttSVvM/WydVVGYJ2CB/ouYi5OWx4eMeQIk7eKzhM5AR7OIDyMifaz
         DuDSbRoihsQhC3Et8M67SrjCgxaS/hVkIj5XUSRxVNk3sKIptLAp0K8jvhg6xP4eGo3V
         fM320SNYvSsevZvfCtsguaNvcOKr9TmqLKQC2xiAHN7gwEp/j020R6UW1qRqMgk81XkH
         XsvB8uraTkXweGpBOF2d9SQG2EpAzBjxEIrq4tyVBcaTTGfRr7NuEtkS3PxFL6zA/YuY
         g93G5M4GC+sjrg/X5PGOvUa7P6jt9NlaFegysLoMA2H6cmDnWYyRfl1LBGKaYch1uh1u
         NozQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrOpIxoOnLMHdxmDChM1fEaeJstHqDpimgw1NYUBhoDkjY8Qdbq/gFW5iKcU0gmbo8R1wtU5JeVdQdSHY=@vger.kernel.org
X-Gm-Message-State: AFuF++klNyRfKz2EjOokX8ZKKr6x6WIbmcjY+gkKjs3zUNxP6BCZkBWt
	kM0qGKaeU5GJZFmwuF2cTd9xiLCJdFyzTazpCQnK+YUE6tPjEbfM/zka
X-Gm-Gg: AYBFou2vWMIlPXi+WxtaTwNSPdQuzBcuBoop85tSK8Kv8ev4HJYZc6vL/Vg7QSVo7VU
	DYTzbZ2AMoKu5wXdUAkyQRRdDYXOXd8zMrg8t18kDHJV8EtJiAqUCLArLL+FV54+q4bvMAFGEsO
	IU7vUA24hjsNHNHW4HQNYzzLFPwxBaTXi8lpax1Suj+qe+dDtIf9rrtDDoPcnFktmTZB44Q0AZ7
	vG8axMZCGBLc9XAL9pq9cv/JHUhS93J5+fHmdSlfB6wSw8Nx19kRL6+XoqBij0SRBu+2BjLiSui
	vDtqLxYxPnrI1kDZzRntQh1BYt5FsZIUVHKX4kDNeAj6xvjr39jc6Djb3o94RsGdIVavROA8YDU
	bA/yvdPiyb7rhqgWW0REEabHq5DJhL0Ws0HEXymychLew7H+xLNav2ukt5CIzK6L3fvChk5PR3p
	vB7iguyfbtvMlJGbUpxFwq6sHp/LscBsE9apnqyPDqBGN+NrOSFLG7nFOcS7FxiAElZiRXeIOG
X-Received: by 2002:a17:90b:4d8b:b0:39b:92bb:9ef0 with SMTP id 98e67ed59e1d1-39e54e7899dmr3123205a91.20.1789711746550;
        Thu, 17 Sep 2026 23:09:06 -0700 (PDT)
Received: from archlinux ([2402:e280:411b:ec:aa93:b1ec:5a6b:5fce])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3abada87sm7695043a91.14.2026.09.17.23.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 23:09:06 -0700 (PDT)
From: Adarsh Das <adarshdas950@gmail.com>
To: gregkh@linuxfoundation.org
Cc: rafael@kernel.org,
	dakr@kernel.org,
	driver-core@lists.linux.dev,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+4393dfdddf166f2de2b0@syzkaller.appspotmail.com,
	Adarsh Das <adarshdas950@gmail.com>
Subject: [PATCH v3] kobject: fix uevent socket use-after-free on net namespace delete
Date: Fri, 18 Sep 2026 11:38:26 +0530
Message-ID: <20260918060826.8434-1-adarshdas950@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026091732-armored-lilac-fec9@gregkh>
References: <2026091732-armored-lilac-fec9@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a network namespace is deleted, we free its uevent socket. But
sometimes a device in that namespace is still being removed and tries to
send a uevent through that socket. The socket is already freed, so KASAN
reports a use-after-free.

This patch attempts the fix of taking a lock around both the send path
and the free path, and clear the pointer before freeing so nobody uses
it after free.

Reported-by: syzbot <syzbot+4393dfdddf166f2de2b0@syzkaller.appspotmail.com>
Link: https://syzkaller.appspot.com/bug?extid=4393dfdddf166f2de2b0
Tested-by: syzbot <syzbot+4393dfdddf166f2de2b0@syzkaller.appspotmail.com>
Tested-by: Adarsh Das <adarshdas950@gmail.com>
Assisted-by: LLM
Signed-off-by: Adarsh Das <adarshdas950@gmail.com>
---
 lib/kobject_uevent.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
index ddbc4d7482d2..cb674c2c3432 100644
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -13,6 +13,7 @@
  *	Greg Kroah-Hartman	<greg@kroah.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
 #include <linux/kobject.h>
@@ -411,9 +412,14 @@ static int kobject_uevent_net_broadcast(struct kobject *kobj,
 						    devpath);
 	else {
 		const struct net *net = container_of(ns, struct net, ns);
-
-		ret = uevent_net_broadcast_tagged(net->uevent_sock->sk, env,
-						  action_string, devpath);
+		struct uevent_sock *ue_sk;
+
+		guard(mutex)(&uevent_sock_mutex);
+		ue_sk = net->uevent_sock;
+		if (ue_sk && ue_sk->sk)
+			ret = uevent_net_broadcast_tagged(ue_sk->sk, env,
+							  action_string,
+							  devpath);
 	}
 #endif
 
@@ -804,14 +810,19 @@ static int uevent_net_init(struct net *net)
 
 static void uevent_net_exit(struct net *net)
 {
-	struct uevent_sock *ue_sk = net->uevent_sock;
+	struct uevent_sock *ue_sk;
 
-	if (sock_net(ue_sk->sk)->user_ns == &init_user_ns) {
-		mutex_lock(&uevent_sock_mutex);
-		list_del(&ue_sk->list);
-		mutex_unlock(&uevent_sock_mutex);
+	{
+		guard(mutex)(&uevent_sock_mutex);
+		ue_sk = net->uevent_sock;
+		net->uevent_sock = NULL;
+		if (ue_sk && sock_net(ue_sk->sk)->user_ns == &init_user_ns)
+			list_del(&ue_sk->list);
 	}
 
+	if (!ue_sk)
+		return;
+
 	netlink_kernel_release(ue_sk->sk);
 	kfree(ue_sk);
 }
-- 
2.55.0

