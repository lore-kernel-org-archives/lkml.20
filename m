Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794639245;
	b=G8rAbpNsENpwoqYTPpR/jdA0Ae5Fc+i/3FQR1VgBYFFSLpbWWa8BHLr3vMemNiBg1lxQ
	 Ws3l6mpaR4cA/OokPi9z5p08fH5A01nmnUP8i7i85fJPSB36moSWcP3fJrAaoN2SrCZK+
	 KeQyl5HjXXUHOVEkp8R5wlMaJIGcgtYjrGNzo18D5lFHs2G9SXG0gEG7tLntks8gLdV42
	 r5UtiEPpr9WphJ8ZJvyDtS9On5YXwV4uMB1eqHmkJSCklgyOHitl94NxOkOndWxw8abDh
	 gKsKU0jJ0uQWrsD5G8UNVxvKmkHTRyQKE6x43BL+YfWOnJ9M9xBIf/W2CQfLb0V9Img==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794639245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jpc7xYgRbp0PzEsHnP3QCuDwXQdtcMONN5oNV3WRItQ=;
	b=Ft2wK3UEZU7Fm7HhVVnNnzvtxwtFzwKn40cUldf8NgODsYUpCOQ0pDhrPdQOV4SjbSqL
	 4zcW10mmgzVZAWJOyJ3NgNOhMd9HNmyaoN8zYLnGXw7x5eG/bESsZrLti8J3zQLovzs36
	 dDnESQwlOXGUH5t4fHMwXbO8S0VFas5n28zgmbD1p5EU9iqwO9oYyAgrx5bP7cUDJZWVQ
	 rHdzsELXkAPiXolSjIMLQ9P3wiRB+2uI5BTtfiGbSE+RxUM2P2XfrGz2aXXxvFj0Xpe7p
	 Qc3FeRh/ua7uxVfAbkRg4J4hPwA647Q6T9PWn5UtGHsIO1UEP4frQZFFVsbcKyDMGmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bGPtVb5D;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419FF606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 419FF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bGPtVb5D
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3360673eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794639244; x=1795244044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jpc7xYgRbp0PzEsHnP3QCuDwXQdtcMONN5oNV3WRItQ=;
        b=bGPtVb5DVnXyHuArAWU3QQt4Uni/sTb1VbSfPsJj5O7lruPR0h4KdsQlcD8U+Wkhzi
         v6e6BMZPdm99X9r95d6ZqBUqBU53+CWHrEDgBOslM0DRUUnWJ5Bp9I+u/Mox39mfKqEM
         o5C7mos2LaQZrcci2bJSAVItt+jmf2pQf5JZoxgmCEeVV6gCEccFu4YgZ9BemGQ4OI77
         hF2BC8NLFszsF7SwMSmIbGlsIBGwXASTjGyeTClni2lkGvob/APThpeiUyuDL6DixNV0
         3tJvClwlwGog60x10XghCogBeF1jdxI47/mQdHGsKQoqd+0gFQeRl//qdQA5mo16VHFm
         94Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794639244; x=1795244044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jpc7xYgRbp0PzEsHnP3QCuDwXQdtcMONN5oNV3WRItQ=;
        b=JTU71ZDvlT8pQZF71PyPQ2aZ6B6XkQNtxttInpQZVRnUcMcDBQObAJywYsLAz3yMHY
         6xUa8dU/sGAPVdvoghkAwinn0aMQYDI0B6VcvalAhGT9Jf5T+PEAFS/qupBNpzgRrK/n
         lGJyFNohPASLkZ2ceKtZ0l8U+8rmYMDneWdgBLVXW68fk+VX98gwCZ1a0V22JGgNmE4R
         OJXazNmEczGTHGpMv44IWqwiogChrtiSpw38WXrl3HXN0vGxRXoHLf0KoR2Db2LsRvzT
         dKpoAV5+EIUmLdAGBIJLhc/OHud9JE31guPnaRXYjOthLl7p+W6sAjr0gZB07aB3G5+q
         ZzIA==
X-Forwarded-Encrypted: i=1; AL+hErH4vAZtZlKLOA5TU2DJtztXLgl9+9dRBrAvq/9Xxulkvwa2FbRGbZDcmC6M7fReCd3Ts/0LBN7f9J87QKA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5/mcdRPP/EMtxIUhsPBZP/V0Et1q/ta14hlDQYxGoQdavvVl6
	SQOF8oQHHL0Hsg0LTj6Mo66OxFco9JOtn1SJAYOeaDQb/g6rW5kbwiG2
X-Gm-Gg: AYBFou2l3t2xagdQhCZw+IhxM1zVFGZaPNF+HzhRhzcBksZXwQrOWFVD6deIioCqPl2
	EAsjfZxYb4q8KJyNi3DPy6EZ9lixsEay3juAxI13qeksVdJbWmY8RvymSy1zPuWTDomySv5+Clu
	N44c4iqV2ktQ3daRcDzY3Ik0szpl56fHXCOBaGu3Iky20ECr/msFP1t+Y3+jK/po4peEXyDAq5k
	Z5+7QpcgfyQZn9gB/Wda3kVP9KVWtmX7zK0LuZZ5UQPBdC1VPmqFQL4FRHhufLBk0exFyTwCcxq
	TRzUgluduQxYZnP5wd+M5owd8bGUpsKrj6mwWCrCKjZ7o8qLFEbnMkuidN8Fe8Sn8S5f6nDxnjv
	zRA5YY0B6yj5fQ0dpTELu0zZRHytOsyXQBvQY9D/WlzLPWtdjJINVTABQEsgoEJnFiTHwSNBHIe
	PRUZ0dRxUy4MwKgZhrt4lE729aKTc9ZcNqR6KQ5AN1vpEdAMUa0hyBPLLM2g6bEkUChEl++mUON
	cJ0AZrdbwe9tICQkCCMMwr2WUShTK9O0jrUFL3Leiyt5Ljgpqd9IwyZWiqb1sjKIEvaWV6s7VEw
	Z3ikmgHNClFH2IWK3ZjlRvT94dMT39xEQeMzyTHMXko5o1yYflSYZNpJuddGE5lj5/vmIqhFA0J
	q+zuX605QDyIu4exPVtBVxwiVSw==
X-Received: by 2002:a05:7301:2024:b0:36a:18e2:64c with SMTP id 5a478bee46e88-379655d3d12mr4902007eec.11.1794639244069;
        Fri, 13 Nov 2026 22:54:04 -0800 (PST)
Received: from kdev ([131.179.133.114])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm13297026eec.3.2026.11.13.22.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:54:03 -0800 (PST)
From: Niloy Meharchandani <niloymeharchandani@gmail.com>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Niloy Meharchandani <niloymeharchandani@gmail.com>
Subject: [PATCH] staging: most: net: use guard(mutex) for probe_disc_mt
Date: Fri, 13 Nov 2026 22:53:58 -0800
Message-ID: <20261114065358.149853-1-niloymeharchandani@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace manual mutex_lock() and mutex_unlock() calls on probe_disc_mt
with guard(mutex)(&probe_disc_mt) in most_nd_open(), comp_probe_channel(),
and comp_disconnect_channel(). Include <linux/cleanup.h> and
<linux/mutex.h> explicitly.

This simplifies error paths by removing the unlock goto labels and
temporary return variables while ensuring the mutex is always released
on scope exit.

No functional change intended. Compile-tested only.

Signed-off-by: Niloy Meharchandani <niloymeharchandani@gmail.com>
---
 drivers/staging/most/net/net.c | 57 ++++++++++++----------------------
 1 file changed, 20 insertions(+), 37 deletions(-)

diff --git a/drivers/staging/most/net/net.c b/drivers/staging/most/net/net.c
index e6e4498d33ab..e08804c8ec6e 100644
--- a/drivers/staging/most/net/net.c
+++ b/drivers/staging/most/net/net.c
@@ -13,7 +13,9 @@
 #include <linux/init.h>
 #include <linux/list.h>
 #include <linux/wait.h>
+#include <linux/cleanup.h>
 #include <linux/kobject.h>
+#include <linux/mutex.h>
 #include <linux/most.h>
 
 #define MEP_HDR_LEN 8
@@ -175,21 +177,18 @@ static void on_netinfo(struct most_interface *iface,
 static int most_nd_open(struct net_device *dev)
 {
 	struct net_dev_context *nd = netdev_priv(dev);
-	int ret = 0;
 
-	mutex_lock(&probe_disc_mt);
+	guard(mutex)(&probe_disc_mt);
 
 	if (most_start_channel(nd->iface, nd->rx.ch_id, &comp)) {
 		netdev_err(dev, "most_start_channel() failed\n");
-		ret = -EBUSY;
-		goto unlock;
+		return -EBUSY;
 	}
 
 	if (most_start_channel(nd->iface, nd->tx.ch_id, &comp)) {
 		netdev_err(dev, "most_start_channel() failed\n");
 		most_stop_channel(nd->iface, nd->rx.ch_id, &comp);
-		ret = -EBUSY;
-		goto unlock;
+		return -EBUSY;
 	}
 
 	netif_carrier_off(dev);
@@ -201,9 +200,7 @@ static int most_nd_open(struct net_device *dev)
 	if (nd->iface->request_netinfo)
 		nd->iface->request_netinfo(nd->iface, nd->tx.ch_id, on_netinfo);
 
-unlock:
-	mutex_unlock(&probe_disc_mt);
-	return ret;
+	return 0;
 }
 
 static int most_nd_stop(struct net_device *dev)
@@ -299,7 +296,6 @@ static int comp_probe_channel(struct most_interface *iface, int channel_idx,
 	struct net_dev_channel *ch;
 	struct net_device *dev;
 	unsigned long flags;
-	int ret = 0;
 
 	if (!iface)
 		return -EINVAL;
@@ -307,15 +303,13 @@ static int comp_probe_channel(struct most_interface *iface, int channel_idx,
 	if (ccfg->data_type != MOST_CH_ASYNC)
 		return -EINVAL;
 
-	mutex_lock(&probe_disc_mt);
+	guard(mutex)(&probe_disc_mt);
 	nd = get_net_dev(iface);
 	if (!nd) {
 		dev = alloc_netdev(sizeof(struct net_dev_context), "meth%d",
 				   NET_NAME_UNKNOWN, most_nd_setup);
-		if (!dev) {
-			ret = -ENOMEM;
-			goto unlock;
-		}
+		if (!dev)
+			return -ENOMEM;
 
 		nd = netdev_priv(dev);
 		nd->iface = iface;
@@ -330,22 +324,18 @@ static int comp_probe_channel(struct most_interface *iface, int channel_idx,
 		ch = ccfg->direction == MOST_CH_TX ? &nd->tx : &nd->rx;
 		if (ch->linked) {
 			netdev_err(nd->dev, "direction is allocated\n");
-			ret = -EINVAL;
-			goto unlock;
+			return -EINVAL;
 		}
 
 		if (register_netdev(nd->dev)) {
 			netdev_err(nd->dev, "register_netdev() failed\n");
-			ret = -EINVAL;
-			goto unlock;
+			return -EINVAL;
 		}
 	}
 	ch->ch_id = channel_idx;
 	ch->linked = true;
 
-unlock:
-	mutex_unlock(&probe_disc_mt);
-	return ret;
+	return 0;
 }
 
 static int comp_disconnect_channel(struct most_interface *iface,
@@ -354,23 +344,18 @@ static int comp_disconnect_channel(struct most_interface *iface,
 	struct net_dev_context *nd;
 	struct net_dev_channel *ch;
 	unsigned long flags;
-	int ret = 0;
 
-	mutex_lock(&probe_disc_mt);
+	guard(mutex)(&probe_disc_mt);
 	nd = get_net_dev(iface);
-	if (!nd) {
-		ret = -EINVAL;
-		goto unlock;
-	}
+	if (!nd)
+		return -EINVAL;
 
-	if (nd->rx.linked && channel_idx == nd->rx.ch_id) {
+	if (nd->rx.linked && channel_idx == nd->rx.ch_id)
 		ch = &nd->rx;
-	} else if (nd->tx.linked && channel_idx == nd->tx.ch_id) {
+	else if (nd->tx.linked && channel_idx == nd->tx.ch_id)
 		ch = &nd->tx;
-	} else {
-		ret = -EINVAL;
-		goto unlock;
-	}
+	else
+		return -EINVAL;
 
 	if (nd->rx.linked && nd->tx.linked) {
 		spin_lock_irqsave(&list_lock, flags);
@@ -390,9 +375,7 @@ static int comp_disconnect_channel(struct most_interface *iface,
 		free_netdev(nd->dev);
 	}
 
-unlock:
-	mutex_unlock(&probe_disc_mt);
-	return ret;
+	return 0;
 }
 
 static int comp_resume_tx_channel(struct most_interface *iface,
-- 
2.53.0

