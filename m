Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48384AFE18
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442067; cv=none; b=tmVP001wkLKIzMQHMcbTKEF0fBDsLR58RnLEcF8ngL2V7kmeas8zNzIiVfZFxaCCykjn2ztoEpGo4KgRMnX7XnYvv42TRCUy30DAASQV9xhPdz3Mx4vnJydBxCE7yd+hdJ5fOfQ5TMbpSerlDSjS6/msgXkjvi9iAXUcsOMCMM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442067; c=relaxed/simple;
	bh=FJCBFWXQ4JRn4p4I/3YHNA52Ktz3R5HZeu2CU4E/4lc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jNLmaWnP0HSLLO3HpXCSSEFyCyF7Kp0qWy911NxzaWtxn1tI13gPyzh9qCgZByiaZHCepKx0T9Tc6BY50cOiBDpu712Q1q56f4d6dzvs6mSuoOU9eQnEPTYcJzDkKpwupnbn1Qrb9YsyOEInUvrmQBDHq7HR85GZL+xNBGP4BNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LxlkCM/F; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxlkCM/F"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c253425b253so350106766b.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788442049; x=1789046849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZDOCEIZcLPlm5WXvcUnbGXYJIo9YbDVlXEqCB5lDmx0=;
        b=LxlkCM/F58qVgb3mAZGFQtJUAKOobcV6qMM5jvgiYSioVclcGdvF4l3fBpWo2L8BD/
         Pa8mwo17irpDPhNR1LTAGLSr+dYNRAnlfL7QsDd/fe7GRA8zprNOqRWpZadT3nCekIR4
         5E9QDqqeAN3CnjUZXUl2YXTK3HoiyQeZGj+Jip4V/0qEfrY3ahoZBMGVPhSyX6dD79Hw
         TdzqkseRbEabAFq0iMPlgySi5OYFMN6uBqI0nCwIlX56uPWOVCvU/OZ+zBl6XLI/21iJ
         UF7X8k+jX8HVbeUp9BKaI/CsBLt48E7KSASDQJ0RfOwBa2RXNbS/OJlKzg43pA+45Wav
         dzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788442049; x=1789046849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZDOCEIZcLPlm5WXvcUnbGXYJIo9YbDVlXEqCB5lDmx0=;
        b=K3ElIcg8+cCMqVXMgRh438N1tDA+e5mB+TtbW/RGojkR2mVijsh3kXe+KF8u0BEwRj
         nfHo7gjJ78Qv76EvxiE5Aj4mMQ92iPmPQB1D92FTWX3uXVS2uSYSal11S2eoXWdS3WSZ
         zAaeDpOb77sZu9MDUycBRSowdGltF2C9jb48UG0dXnHZrUOQBTasY7/8qNRPS6dWQNQt
         ss8szjpeLPAzFblyTsMIbIPuEn61qpwHRxg0RNUrxK9nx48wlsSok6wAu7ZvpsCssiJP
         ZkHCWZu6gtdhpjy8Y1KS7i8ZmN3gz1QcbN6qfoylnwTzVWkWsLFqntBOysgB2ypINH0w
         xWXA==
X-Forwarded-Encrypted: i=1; AKwUvBxRftjGhL8rPbyECvNqIXdybe5bETvStqoaCdw1I9cY0JzmWFy60o6Kh73Ou/s5/HPBrTRb+OCF3NrN8ec=@vger.kernel.org
X-Gm-Message-State: AFuF++kiXTyBJ+znBKujMdIibiQwDNZ7kttg7z9d52aXS8Hqu6YY9gS9
	pJKtKAGSANx1qzynVyIE9qjWxTTN1cvJpjfobb6ENvDTfqkS0KWszFrN
X-Gm-Gg: AYBFou1KMNAq3qGwT8PmJ6tvwOgaIzzzIXmYr11VFho1WG5XP+Zgk5y3hcNoeTBqNX+
	RBjDcekdmjTUzVSqDbMN/lFw+ReaVB70SPUXdQxUTUIe0x0MWXfIxbaOPGSLtBxE81uIg+cYR64
	XMjbt3earkc/ZtBH4ib+nHttuhCvkooLyEBS+mJMfjTbMNI+iQyCr1tRzO70JgkSkoO4IY4XKqo
	UGqtLO4PE8YVVgDuqVS/Nl4jmk5j79QFUpFpW1es2e2ZHspjUv8Pb9sTMXeVORmUV2hz3ah3Ebi
	h89hziPoLjrpBBZ3g3+8d+1PzDnpEdJGvJvxZ+U7XI8QMHYIkQtvRRpTnMRjwY1xK05oLqkSAPK
	zQvogvZHXTFTp3ewcR3NOY+zP/1LWhrtcfLrcvOTkGYeLLeSsiF7llW+Y1REUQk83RYsDRHJT+Q
	JnsRYW1YBeyMsiBBVSg9evXQ4PVplCkTxRmF+oOS86p43fBXShYWda3m7gyekHfpBGKhVVdeo=
X-Received: by 2002:a17:906:8d86:b0:c25:10a:4020 with SMTP id a640c23a62f3a-c26047db192mr21855566b.16.1788442048941;
        Thu, 03 Sep 2026 06:27:28 -0700 (PDT)
Received: from grower.astralinux.ru ([82.22.172.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f419e965sm99514966b.25.2026.09.03.06.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:27:28 -0700 (PDT)
From: Alexander Martyniuk <alexevgmart@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexander Martyniuk <alexevgmart@gmail.com>,
	lvc-project@linuxtesting.org,
	Antonio Quartulli <antonio@openvpn.net>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ralf Lici <ralf@mandelbit.com>
Subject: [PATCH 6.18] ovpn: run deferred work on a module-owned workqueue
Date: Thu,  3 Sep 2026 16:26:59 +0300
Message-ID: <20260903132715.3823803-1-alexevgmart@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ralf Lici <ralf@mandelbit.com>

commit e9714db8041763f59dde152c812b96b3de05c6d9 upstream.

ovpn queues several work items whose callbacks execute module text.
These works currently run on the global system workqueues, so module
exit has no driver-owned drain point that guarantees the callbacks have
fully returned before the module text can be freed.

Object references protect the objects used by the callbacks, but they do
not prove that a workqueue function has returned. In particular, a
worker can drop the final reference that unblocks device teardown while
it is still executing ovpn code.

Add a module-owned workqueue and queue all ovpn work items on it. During
module exit, unregister rtnl and netlink first, flush the workqueue so
ordinary ovpn workers finish, run the final RCU barrier, and destroy the
workqueue last. This keeps the workqueue available for cleanup work
queued from RCU callbacks, while ensuring no ovpn work item can outlive
the module text.

The per-device delayed keepalive work remains explicitly disabled during
netdev teardown (disable_delayed_work_sync in ndo_uninit), since
flush_workqueue does not flush delayed work that is still only pending
on its timer.

Fixes: 3ecfd9349f40 ("ovpn: implement keepalive mechanism")
Fixes: 11851cbd60ea ("ovpn: implement TCP transport")
Signed-off-by: Ralf Lici <ralf@mandelbit.com>
Signed-off-by: Antonio Quartulli <antonio@openvpn.net>
Signed-off-by: Alexander Martyniuk <alexevgmart@gmail.com>
---
Backport fix for CVE-2026-80753
 drivers/net/ovpn/main.c     | 19 ++++++++++++++++++-
 drivers/net/ovpn/ovpnpriv.h |  4 ++++
 drivers/net/ovpn/peer.c     |  8 ++++----
 drivers/net/ovpn/tcp.c      |  9 ++++-----
 4 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ovpn/main.c b/drivers/net/ovpn/main.c
index 0262926449f2..c18ed8690baf 100644
--- a/drivers/net/ovpn/main.c
+++ b/drivers/net/ovpn/main.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/netdevice.h>
 #include <linux/inetdevice.h>
+#include <linux/workqueue.h>
 #include <net/gro_cells.h>
 #include <net/ip.h>
 #include <net/rtnetlink.h>
@@ -26,6 +27,9 @@
 #include "tcp.h"
 #include "udp.h"
 
+/* module-owned workqueue on which all ovpn-specific work is queued */
+struct workqueue_struct *ovpn_wq;
+
 static void ovpn_priv_free(struct net_device *net)
 {
 	struct ovpn_priv *ovpn = netdev_priv(net);
@@ -264,10 +268,16 @@ static int __init ovpn_init(void)
 
 	ovpn_tcp_init();
 
+	ovpn_wq = alloc_workqueue("ovpn", WQ_PERCPU, 0);
+	if (!ovpn_wq) {
+		pr_err("ovpn: cannot allocate workqueue\n");
+		return -ENOMEM;
+	}
+
 	err = rtnl_link_register(&ovpn_link_ops);
 	if (err) {
 		pr_err("ovpn: can't register rtnl link ops: %d\n", err);
-		return err;
+		goto destroy_wq;
 	}
 
 	err = ovpn_nl_register();
@@ -280,6 +290,9 @@ static int __init ovpn_init(void)
 
 unreg_rtnl:
 	rtnl_link_unregister(&ovpn_link_ops);
+destroy_wq:
+	destroy_workqueue(ovpn_wq);
+	ovpn_wq = NULL;
 	return err;
 }
 
@@ -288,7 +301,11 @@ static __exit void ovpn_cleanup(void)
 	ovpn_nl_unregister();
 	rtnl_link_unregister(&ovpn_link_ops);
 
+	flush_workqueue(ovpn_wq);
 	rcu_barrier();
+
+	destroy_workqueue(ovpn_wq);
+	ovpn_wq = NULL;
 }
 
 module_init(ovpn_init);
diff --git a/drivers/net/ovpn/ovpnpriv.h b/drivers/net/ovpn/ovpnpriv.h
index 5898f6adada7..84499140e4bd 100644
--- a/drivers/net/ovpn/ovpnpriv.h
+++ b/drivers/net/ovpn/ovpnpriv.h
@@ -15,6 +15,10 @@
 #include <uapi/linux/if_link.h>
 #include <uapi/linux/ovpn.h>
 
+struct workqueue_struct;
+
+extern struct workqueue_struct *ovpn_wq;
+
 /**
  * struct ovpn_peer_collection - container of peers for MultiPeer mode
  * @by_id: table of peers index by ID
diff --git a/drivers/net/ovpn/peer.c b/drivers/net/ovpn/peer.c
index 412ef09abd5e..6b9f5f12fc5a 100644
--- a/drivers/net/ovpn/peer.c
+++ b/drivers/net/ovpn/peer.c
@@ -62,7 +62,7 @@ void ovpn_peer_keepalive_set(struct ovpn_peer *peer, u32 interval, u32 timeout)
 	/* now that interval and timeout have been changed, kick
 	 * off the worker so that the next delay can be recomputed
 	 */
-	mod_delayed_work(system_wq, &peer->ovpn->keepalive_work, 0);
+	mod_delayed_work(ovpn_wq, &peer->ovpn->keepalive_work, 0);
 }
 
 /**
@@ -1366,7 +1366,7 @@ static time64_t ovpn_peer_keepalive_work_single(struct ovpn_peer *peer,
 			   peer->id);
 		if (WARN_ON(!ovpn_peer_hold(peer)))
 			return 0;
-		if (!schedule_work(&peer->keepalive_work))
+		if (!queue_work(ovpn_wq, &peer->keepalive_work))
 			ovpn_peer_put(peer);
 	}
 
@@ -1458,8 +1458,8 @@ void ovpn_peer_keepalive_work(struct work_struct *work)
 		netdev_dbg(ovpn->dev,
 			   "scheduling keepalive work: now=%llu next_run=%llu delta=%llu\n",
 			   next_run, now, next_run - now);
-		schedule_delayed_work(&ovpn->keepalive_work,
-				      (next_run - now) * HZ);
+		queue_delayed_work(ovpn_wq, &ovpn->keepalive_work,
+				   (next_run - now) * HZ);
 	}
 	unlock_ovpn(ovpn, &release_list);
 }
diff --git a/drivers/net/ovpn/tcp.c b/drivers/net/ovpn/tcp.c
index 0af14055c39a..8fe8a8e750a4 100644
--- a/drivers/net/ovpn/tcp.c
+++ b/drivers/net/ovpn/tcp.c
@@ -151,7 +151,7 @@ static void ovpn_tcp_rcv(struct strparser *strp, struct sk_buff *skb)
 	/* take reference for deferred peer deletion. should never fail */
 	if (WARN_ON(!ovpn_peer_hold(peer)))
 		goto err_nopeer;
-	if (!schedule_work(&peer->tcp.defer_del_work))
+	if (!queue_work(ovpn_wq, &peer->tcp.defer_del_work))
 		ovpn_peer_put(peer);
 	ovpn_dev_dstats_rx_dropped(peer->ovpn->dev);
 err_nopeer:
@@ -284,13 +284,12 @@ static void ovpn_tcp_send_sock(struct ovpn_peer *peer, struct sock *sk)
 			 * stream therefore we abort the connection
 			 */
 			ovpn_peer_hold(peer);
-			if (!schedule_work(&peer->tcp.defer_del_work))
+			if (!queue_work(ovpn_wq, &peer->tcp.defer_del_work))
 				ovpn_peer_put(peer);
 
 			/* we bail out immediately and keep tx_in_progress set
 			 * to true. This way we prevent more TX attempts
-			 * which would lead to more invocations of
-			 * schedule_work()
+			 * which would lead to more invocations of queue_work()
 			 */
 			return;
 		}
@@ -487,7 +486,7 @@ static void ovpn_tcp_write_space(struct sock *sk)
 	rcu_read_lock();
 	sock = rcu_dereference_sk_user_data(sk);
 	if (likely(sock && sock->peer)) {
-		schedule_work(&sock->tcp_tx_work);
+		queue_work(ovpn_wq, &sock->tcp_tx_work);
 		sock->peer->tcp.sk_cb.sk_write_space(sk);
 	}
 	rcu_read_unlock();
-- 
2.43.0

