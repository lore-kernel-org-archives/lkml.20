Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271108;
	b=OG+FrJIULVtuq+YjUEn374dqtFFt/uHJlQnA+Y42Vtvmq0VxSq/ZpueOJnb5VPGQL2Eu
	 i5Gmnix3l7OIT/6Wb3gu8yPRzfrj98NAgMEY3yb77OXBxkAf0KYNowG9GPOLCEjioI9B2
	 NdI7NnQsZoh2PMKQWfwy0UMLMNotj5Sd5nnfCFzSrJ4x2wwnvU/kZT+RZ3j6RaVITxPl3
	 dJly6qD2hDEDdsRXSF8cFrVOz0mZpiw5j2JizTI/EqsSksA6sO8EHFAYnMEa6+DFPcRV5
	 +TFRMikqlbQPHzGYL15A/ou5tSA3PQr/HTIIpUsvpCQ/FwzdcEBYeV2YXmdXLHdAUKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mP84m2R3RTnJmL7bh8t5NoWh+UIYojXhPPzkKJZg4tI=;
	b=m6iiJlrEaqv5JihO4djHk0QraC6PusgkTeGycKx/ygyUPQ6tODv++tmxvsYHyIXIz1LP
	 kj/G2VJSvgBiVB8eaKqtERV3GZvl/C8bxobRW+2KNmS56v3tCXQw8yUtiLqMVFUbHYdjf
	 xm0GGlM2YO+BPpuuR86TPtTzwoXrmLmpJ5I60N05BkOKqTlud9gYITAHYzxrigbV3ef9O
	 lBowF/06qmOfTwiVft/rHt0UYIjD4XFmKInWY2fRup/g9B9EHj83EdliPET7bgB8VQ8VH
	 6dFEG2SlMn2rngWRj78ixBTe4WNUV/wWCWas9fyASnDT5etQGnUIDOUBD0R9sjGK6CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CmtVFNCa;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF88606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECF88606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CmtVFNCa
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1846bc43c28so2278653c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271107; x=1793875907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mP84m2R3RTnJmL7bh8t5NoWh+UIYojXhPPzkKJZg4tI=;
        b=CmtVFNCaGzjVGcasjVEAQQAeYw8tbHXs/xyOx4y9rNKqxKeS8unOu2QUfJqur/L5lV
         O4M6EamxNbGJ2D28PYWbAWUKiphy49379WXPGIzuhm2E+O6Wzetstmpl06KIgy8oimk2
         mIzTC8ykXbXy1p3cQAKnztVRXBGpcIfMqpqo4x65A9UtfFwzAFWWfEe6bOIlEAN17Hzq
         2Rb0V/GHLPJosnFc4y9Nei3vToTX/Xe4xHozIa2ILdUdDShAUKfDToJp66FKsxq8Ru2/
         Eo0CeCQ2Cxc+nNTX2NqkDAYfbCko+VO5dXTZAkiTXessgxjkgrRU+LBRFdyF9jpKN68c
         QWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271107; x=1793875907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mP84m2R3RTnJmL7bh8t5NoWh+UIYojXhPPzkKJZg4tI=;
        b=NExDLaL6LcRgApBsAqpxWRcrz4le/39RiPbJ9zz9KG+jG7XX00uBbKKeOXU0NUq0eL
         224flcOXJ6UUUmOsIcqFAE1Rt0Jtq0kDMj1FaiHbZQ9dIyWI7aO9pHLbhI8svx5Gp4xc
         zcW6xtl5pfXQsBiBNTlKV6gbdSZwFTc5ErMDvemPSXp0UHs2kvv+Cu2W53+8t4dXlcyf
         XAFJswbUi3SEUgFK/QGz2wjWhtx3QYaf4gNRhc4wdR0orGpHxhqvhANAloB3oqmonw4v
         ginr/hNywt1jStKHaqlNQvVGTrokXG8S7us4dlRVZbNv3DP+FaWwy1kzDnL+7UnruJSG
         D1vQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUywzysdyWcmAStwb9tzv1+kBdIBsa0MNRtW371r1IJTVjyx5k/oU7EMbFfOYh8RYd598Pr5rMNPqJuEE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjCLvLTcXR5Sg8epajPzVqLBcJN45l52hU/ZRtqjfkwuvvUtO0
	vHzLidMuyXN9IfxsoGBwEZbXgBW79YKEwwW0P2LzTjS2CnfokJEgY9q7
X-Gm-Gg: AYBFou1u32lSPg1LPwQDC+wSMRKch6FgB6OaI6pk9/NeqnW+xjD7ahxoJUe1Sw6ndCB
	yaJF99rPlo3XWJLct6z7+lmPSQvdZqyywv8flV4+ot+fhdHFPP4cATlcHCFkRgijWyV04qkh5rY
	3E6f7ERyzu122eY9L2rPy/UwVb5pm18y+JAa6SA1CAqhuBKnzs81MJ+p6e5UL6s/DQRmsfFJbRC
	WVMnRpwmXpIMnCjyecdjBO/jhtJ31xjEYpkuZwrd43L+KrZLJi7+bzJdnIWafOJQrSRBk3MylSk
	4USmbWC8+EPleziCMSUdYExVYDRNj9HK9nGk2AFNYj8Jzwyz2fsPXzXssHnUPiVZ3zWRo2Tju3o
	vhP9BNRXlRf4g/BzkLBwc9qvJa0oI7o+kh5HxEaXUG35lmcjHzY5ow7fQ3zHqr2/bl53ULHIjzh
	Lf+/0LAMVvGDGEgZxBEgr+wsz+HbBiT9K3gjt11ptZfCAZf4rCABSJYceFjAr/Ya38hP8ZXiJo6
	KrjOzz08+isNkjB6vI4wFW8Ui6E0abcvnVQYhWB7pwugsjDq6gwy8OEeXnZfCFmRtWpWuy767/V
	Q4bKXUaSlb+kHOtAxTzxQAoQUUE6lWFaL2WprhQoMFhh
X-Received: by 2002:a05:701b:2311:b0:16a:f5cd:365 with SMTP id a92af1059eb24-1a6c7d2be52mr5911291c88.5.1793271106955;
        Thu, 29 Oct 2026 03:51:46 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a7549528ebsm12858707c88.0.2026.10.29.03.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:51:46 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: mani@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	christopher.lew@oss.qualcomm.com,
	deepak.singh@oss.qualcomm.com,
	pranav.phansalkar@oss.qualcomm.com,
	andersson@kernel.org,
	effeffe99@gmail.com,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH net v3] net: qrtr: announce local services again once our HELLO is sent
Date: Thu, 29 Oct 2026 19:51:42 +0900
Message-ID: <20261029105142.2503-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

Since commit 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint
register"), qrtr_node_enqueue() drops every packet but HELLO with
-EAGAIN until our HELLO has gone out to the node. When the remote's
HELLO arrives first, the NEW_SERVER replies from the name service are
dropped, and so are the broadcasts for services registered before our
HELLO goes out. Nothing announces these services again, so the remote
never learns about them.

On Kaanapali the modem sends its HELLO before it accepts ours. With
rmtfs started first, the modem never learns about rmtfs and its
watchdog resets the SoC about 40 s later.

Remember that the remote has sent a HELLO. Once our HELLO has been
sent to such a node, pass a HELLO from it to the local name service
again, so that it announces the services it has at that point. Retry
the replay if it cannot be queued, and queue it under ep_lock only
while the endpoint is registered, so that it cannot follow the BYE
from qrtr_endpoint_unregister().

The flag is not cleared when qrtr_endpoint_hello() restarts the
handshake on resume, so a HELLO that the remote sent before then is
not lost. The cost is that the remote gets the same NEW_SERVER
announcements twice when its HELLO arrives before ours goes out but
the name service handles it after, and on every resume.

Fixes: 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint register")
Cc: stable@vger.kernel.org
Tested-by: Filippo Falezza <effeffe99@gmail.com> # Motorola Moto G 5G Plus nairo (SM7250)
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Changes in v3:
- Retry the replayed HELLO if it cannot be allocated or queued, without
  sending our HELLO again [Mani, Sashiko]
- Queue the replayed HELLO under ep_lock only while node->ep is set, so
  that it is ordered before the BYE from qrtr_endpoint_unregister()
  [Sashiko]
- Keep Filippo's Tested-by from v2: when nothing fails, v3 only adds the
  ep_lock around queueing the replay
- v2: https://lore.kernel.org/all/20261022163116.1042-1-26rote@gmail.com/

Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali; out-of-tree board
support) with rmtfs started before the modem: the replayed HELLO
follows the modem's, rmtfs gets the modem_fs1/2 opens and the modem
stays up, also with an error injected into the first replay, which is
then retried.

 net/qrtr/af_qrtr.c | 53 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 45 insertions(+), 8 deletions(-)

diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
index e7b364742..45cb8e8c3 100644
--- a/net/qrtr/af_qrtr.c
+++ b/net/qrtr/af_qrtr.c
@@ -122,6 +122,7 @@ static DEFINE_XARRAY_ALLOC(qrtr_ports);
  * @qrtr_tx_flow: xarray of qrtr_tx_flow, keyed by node << 32 | port
  * @qrtr_tx_lock: lock for qrtr_tx_flow inserts
  * @hello_sent: hello packet send successful
+ * @hello_rcvd: remote has sent a hello packet
  * @rx_queue: receive queue
  * @item: list item for broadcast list
  * @say_hello: delayed work for sending hello packet
@@ -136,6 +137,7 @@ struct qrtr_node {
 	struct mutex qrtr_tx_lock; /* for qrtr_tx_flow */
 
 	bool hello_sent;
+	bool hello_rcvd;
 
 	struct sk_buff_head rx_queue;
 	struct list_head item;
@@ -541,6 +543,11 @@ int qrtr_endpoint_post(struct qrtr_endpoint *ep, const void *data, size_t len)
 		qrtr_node_assign(node, le32_to_cpu(pkt->server.node));
 	}
 
+	if (cb->type == QRTR_TYPE_HELLO) {
+		/* Pairs with smp_load_acquire() in qrtr_hello_work() */
+		smp_store_release(&node->hello_rcvd, true);
+	}
+
 	if (cb->type == QRTR_TYPE_RESUME_TX) {
 		qrtr_tx_resume(node, skb);
 	} else {
@@ -599,6 +606,8 @@ static void qrtr_hello_work(struct work_struct *work)
 	struct qrtr_node *node;
 	struct qrtr_sock *ctrl;
 	struct sk_buff *skb;
+	bool hello_sent;
+	int rc = 0;
 
 	node = container_of(to_delayed_work(work), struct qrtr_node, say_hello);
 
@@ -609,17 +618,45 @@ static void qrtr_hello_work(struct work_struct *work)
 		return;
 	}
 
-	skb = qrtr_alloc_ctrl_packet(&pkt, GFP_KERNEL);
-	if (!skb) {
-		qrtr_port_put(ctrl);
-		schedule_delayed_work(&node->say_hello, msecs_to_jiffies(100));
-		return;
+	mutex_lock(&node->ep_lock);
+	hello_sent = node->hello_sent;
+	mutex_unlock(&node->ep_lock);
+
+	from.sq_node = qrtr_local_nid;
+	if (!hello_sent) {
+		skb = qrtr_alloc_ctrl_packet(&pkt, GFP_KERNEL);
+		if (!skb)
+			goto retry;
+
+		pkt->cmd = cpu_to_le32(QRTR_TYPE_HELLO);
+		to.sq_node = node->nid;
+		if (qrtr_node_enqueue(node, skb, QRTR_TYPE_HELLO, &from, &to))
+			goto out;
 	}
 
+	/* Pairs with smp_store_release() in qrtr_endpoint_post() */
+	if (!smp_load_acquire(&node->hello_rcvd))
+		goto out;
+
+	skb = qrtr_alloc_ctrl_packet(&pkt, GFP_KERNEL);
+	if (!skb)
+		goto retry;
+
 	pkt->cmd = cpu_to_le32(QRTR_TYPE_HELLO);
-	from.sq_node = qrtr_local_nid;
-	to.sq_node = node->nid;
-	qrtr_node_enqueue(node, skb, QRTR_TYPE_HELLO, &from, &to);
+	to.sq_node = READ_ONCE(node->nid);
+
+	mutex_lock(&node->ep_lock);
+	if (node->ep)
+		rc = qrtr_local_enqueue(NULL, skb, QRTR_TYPE_HELLO, &to, &from);
+	else
+		kfree_skb(skb);
+	mutex_unlock(&node->ep_lock);
+	if (!rc)
+		goto out;
+
+retry:
+	schedule_delayed_work(&node->say_hello, msecs_to_jiffies(100));
+out:
 	qrtr_port_put(ctrl);
 }
 

base-commit: abeacca61eea4f6803df4a595b656ea45c2d3249
-- 
2.43.0

