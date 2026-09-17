Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9AA50128A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664914; cv=none; b=t4lBnu9eq54EWEs/XrzVpyXkCuKADgNX4iT3az8/zrR/ooRuGwjfunSPt5avVwq3WHfUFud8YWVrEaLyLR9faPgyuDL2+MvTpl7RlfoxOtFnK+J0rICoa8ow6Nyi+snxa/v4JuWFgKiHq5lUJJ/S2oKiA6ME1Du6jWgkOQ7Grqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664914; c=relaxed/simple;
	bh=KjkJcTuJHjrmVijk9slNWWr20w469I1INEteAa7loK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KxZnAyhY/lpujc7XBpDFFkGmn+tvj8Zer7DqYyf48s15ZFNd2tuxbnJ5Bu210MLZl29t1VwIqCaO1bkXWX+rzhbWCpxgT5MKDr8SM/KmNT9A0Bs+kd/Yx2qSeoVo8UljIJY4O/CKppv1xCE7mowfUPa498NkQt3ax4j3a7jRFmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tL2mKUIl; arc=none smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tL2mKUIl"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2d747f05ffcso8235875ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789664913; x=1790269713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=auzHkbE4quU1N/0aznjpHRbsdXF6x1Ysfc7XFJa0Adc=;
        b=tL2mKUIlq2hfjPttlLj3nNl58QyYVBYUZ+26GLuuEapLsN96w2uLqd2cq77X0edfz7
         V+mWnHphBzy/fcbW6Wlif3VbxU3ebrVBvpJk4sPQ6pWv/m+oovFp14a3EY1ER9iZ6axn
         9UQoDkyT/lva3RQip78D2WrRUVzviU7ClWJcOULBvVjhPUVTBE48HCOPO/o+Uj11pb9S
         zh4cwonjjMjPrqilPvN96jYUN89ar9N8gpGsearEH34D7ce4HeEHSMzqQukF7qhW4uBR
         C0gi4G9IzPnSFWP+VkCT1NXGQJGyaB8xJmz2FAxcf4V0HZJ936ph5daPp+VCjQQ01Pih
         aCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664913; x=1790269713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=auzHkbE4quU1N/0aznjpHRbsdXF6x1Ysfc7XFJa0Adc=;
        b=p4nRt1CHSbBFuOq5w6c06Te6jlMz6tlCprTyakxbO21rpg5QQKWXpz5yw7WBgxYm2A
         SE4m51c83ATnete8q0LoPLdE5ZXU1H1y3GFEIeqpZObVBgTY9FnPf7rzKTcA7Z6txrQ+
         MAE8sFnr6hc7k7KLmEulIodTQf6JGVisb93l6Dd3iTguyixUpEg3linQLpg8sxxqqwDo
         Z0eooKDgfncIGFbL7WNqS1Bzfh7DAppcMgPSngpeO1CdSIbhyA+yfgyhTO0jEZRANGTP
         1jULim7+t9a9hgmiI7De13L5qKBH2Sq0Ps2En6ovXaCp2D04DQ/Fo6TaYmoH7qJ8hNHs
         ngjg==
X-Forwarded-Encrypted: i=1; AKwUvBwsS+eohRUckGvRFN2PMCCLTWF2JZs08w+BUushGMd4lOunhlvILolIk0x3tUzzq0sCmDgnI4zZ2JKxq0w=@vger.kernel.org
X-Gm-Message-State: AFuF++lEjMwiATtyoxW5HljHpP2dy+5ykdIxbCEp+XTnZ6qYZ9SGR7O/
	mVoLRj7liS/YBBpxqI94TLTnCuv8HG9FnumfektIPcZFV+nU6RH6782P
X-Gm-Gg: AYBFou2HtJpAZ4fycTcFCawjZlnlxcxg8DCefD9j7HT4cUlxKeQT0I3/bv9s8i0qiso
	B3I/Yx5Z4N+MNjGsjhBQ197brZxHQVx488OeS+fAT//MR0cFl69mjOdXhQMGeZXhmcwyhwS+4Yz
	z2ZpGSE/7CgkvnYZ4WiAW7gYrB1CeGSR+GUVtSSBtbV+KYbqusChvaBWSdmVwmengpA68P6zQKu
	mvtcmslSjhGgVn07JOeQ20oOdF6A/9vCW4aQzQQ5+ETUf+OdtlQPsYfLSoZZo6oSlFEPAaj85gE
	yyGSLleCxHP6GV70xpW60BHacDxY9SiiQmU1KXRxLbEJIqNi/4HDpLFKcfJxqkJr7mbGCjBFnXa
	1i7y4sP0sl1yZsNtoJhHNhF6bs5rTuLD4EnA1JfTRNmL+kxlabt/aH5+qHuwaF7r8QGRHQt8x3R
	LXXmNk+K1hd55f5zZS2c+b8o3P3cZ4dRWdleBu1G+hgzdgSeLqYC5Icvd3LVdrAYNo7sUQ1loSd
	vgMJ7iRS18p
X-Received: by 2002:a17:902:ed45:b0:2dd:ad74:ac2c with SMTP id d9443c01a7336-2ddad74ade4mr14163785ad.30.1789664912433;
        Thu, 17 Sep 2026 10:08:32 -0700 (PDT)
Received: from archlinux ([2402:e280:411b:ec:aa93:b1ec:5a6b:5fce])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d8fe2esm30438215ad.6.2026.09.17.10.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:08:31 -0700 (PDT)
From: Adarsh Das <adarshdas950@gmail.com>
To: gregkh@linuxfoundation.org
Cc: rafael@kernel.org,
	dakr@kernel.org,
	driver-core@lists.linux.dev,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adarsh Das <adarshdas950@gmail.com>,
	syzbot <syzbot+4393dfdddf166f2de2b0@syzkaller.appspotmail.com>
Subject: [PATCH v2] kobject: fix uevent socket use-after-free on net namespace delete
Date: Thu, 17 Sep 2026 22:38:26 +0530
Message-ID: <20260917170826.102362-1-adarshdas950@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917144206.85836-1-adarshdas950@gmail.com>
References: <20260917144206.85836-1-adarshdas950@gmail.com>
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
Assisted-by: Cursor AI
Signed-off-by: Adarsh Das <adarshdas950@gmail.com>
---
 lib/kobject_uevent.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

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
-- 
2.55.0

