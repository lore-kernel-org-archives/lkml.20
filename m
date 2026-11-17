Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917335;
	b=pyKm8/HlD4a5yO/nw8M0wHwr4IPZC9pvS6KXl/XQEKQHaLTYVuL+xvYud3GoaCK7sGv1
	 4rm0txiU9OroouPX0u8Bq9c9w4hrr3lD9kz40BiQLNE6q8XlXe7Bia4nQ2CnbQdBvHHG0
	 ZXyaf99mPxpo0bo/tQRWBb+7KkfU2R0WH5qCgv/BC8jmbtvV/A9QIOf0b4HP29HT8o5cR
	 kHwcRmYcx+vAE3ixSAO+y6Gfv/iu+tjQEqOTdIX5SRUMfRD9kuQeT1J3ioihkg7T3E7cg
	 QCPltdhATIM8u2UC7+IXLc5Wmq8epidgwFKxUDKOrTcD74Xxg8984belmcW7ffnh7ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917335;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Received:From:
	 To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=GzNvuoUBJNj9bXeEH2hBNYOe4nzcDcK5XmHL/lMnnsY=;
	b=pkQL22sUwakldLSK8WsJOynPGzAVUc/esnCiw+/HIChZ6jvA0iYPkLzNtoJr3pdPUpM1
	 8gbUoMLZP10ba//BPMQAFQ4YU15hukWSwZLjT+vbuxczL4D28pyQ9aKqOkMI06bOtGX6u
	 5Frozmg3bpWalw/j4RupewkFZABt+I42vD7TnVnOj1SXoG7JTBgrTX04YTzD1XKPo4hOc
	 5+9UtU3V35xlQLYqv1Q5HPjCAin5/4n51UHGcDowZs+GmBw3BTfHyGAEPYUi/LTAoEQC9
	 +1NTJt3/neEYtoAQMWY1vCUN3Oq5u9dMBwTnLeqsefVZKz0PeXm19+gH1rhBjMQn2uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=aIkbXf0u;
	arc=none smtp.remote-ip=113.46.200.227
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB54606A338;
	Tue, 17 Nov 2026 12:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAB54606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=aIkbXf0u
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=GzNvuoUBJNj9bXeEH2hBNYOe4nzcDcK5XmHL/lMnnsY=;
	b=aIkbXf0uFCDZg7jxJWG7fOIMYp/nNVRHxRnG+LRpWp8XyFarXxFKOP0Naq54FQkEuxNd+qLj1
	IC8USqYNs2AgQdkjdDv6FXR/yF5zq+78PKz/nbzDJVu9h13yhi09mlWrBgLxRIaXC25H7ojKXPE
	DiiR+hy5axE3mnWxvlJm81E=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4jTNly0ZcqznTV6;
	Tue, 17 Nov 2026 20:07:58 +0800 (CST)
Received: from dggpemr200018.china.huawei.com (unknown [7.185.36.238])
	by mail.maildlp.com (Postfix) with ESMTPS id B3E2B40586;
	Tue, 17 Nov 2026 20:08:51 +0800 (CST)
Received: from whupemq100015.china.huawei.com (7.152.185.230) by
 dggpemr200018.china.huawei.com (7.185.36.238) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 17 Nov 2026 20:08:51 +0800
Received: from DESKTOP-62GVMTR.china.huawei.com (10.174.220.94) by
 whupemq100015.china.huawei.com (7.152.185.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 17 Nov 2026 20:08:49 +0800
From: Fan Gong <gongfan1@huawei.com>
To: Fan Gong <gongfan1@huawei.com>, Wu Di <wudi234@huawei.com>, Teng Peisen
	<tengpeisen@huawei.com>, <netdev@vger.kernel.org>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
	<horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Ioana Ciornei
	<ioana.ciornei@nxp.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Mohsin Bashir <mohsin.bashr@gmail.com>, Dimitri Daskalakis
	<dimitri.daskalakis1@gmail.com>, Harshitha Ramamurthy
	<hramamurthy@google.com>, Larysa Zaremba <larysa.zaremba@intel.com>, "Vadim
 Fedorenko" <vadim.fedorenko@linux.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Zhou Shuai
	<zhoushuai28@huawei.com>, Wu Like <wulike1@huawei.com>
Subject: [PATCH net-next v04 3/4] hinic3: Wrap long lines and rename q_params
Date: Tue, 17 Nov 2026 20:08:33 +0800
Message-ID: <028ead4f86274cfab980def4ef779878cae346f2.1794917917.git.gongfan1@huawei.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <cover.1794917917.git.gongfan1@huawei.com>
References: <cover.1794917917.git.gongfan1@huawei.com>
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 whupemq100015.china.huawei.com (7.152.185.230)

Wrap the long function signatures of hinic3_alloc_txrxq_resources(),
hinic3_free_txrxq_resources(), hinic3_alloc_channel_resources() and
hinic3_free_channel_resources() so that they fit in 80 columns.

While at it, rename the trxq_params argument of
hinic3_alloc_channel_resources() and hinic3_free_channel_resources()
to q_params, matching the name used by the other queue parameter
helpers. No expression, call or error path changes.

Co-developed-by: Wu Di <wudi234@huawei.com>
Signed-off-by: Wu Di <wudi234@huawei.com>
Co-developed-by: Teng Peisen <tengpeisen@huawei.com>
Signed-off-by: Teng Peisen <tengpeisen@huawei.com>
Signed-off-by: Fan Gong <gongfan1@huawei.com>
---
 .../huawei/hinic3/hinic3_netdev_ops.c         | 34 +++++++++++--------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c b/drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c
index 6007e0e58478..943310274a69 100644
--- a/drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c
+++ b/drivers/net/ethernet/huawei/hinic3/hinic3_netdev_ops.c
@@ -121,8 +121,9 @@ static void hinic3_destroy_num_qps(struct net_device *netdev)
 	kfree(nic_dev->qps_msix_entries);
 }
 
-static int hinic3_alloc_txrxq_resources(struct net_device *netdev,
-					struct hinic3_dyna_txrxq_params *q_params)
+static int
+hinic3_alloc_txrxq_resources(struct net_device *netdev,
+			     struct hinic3_dyna_txrxq_params *q_params)
 {
 	int err;
 
@@ -176,8 +177,9 @@ static int hinic3_alloc_txrxq_resources(struct net_device *netdev,
 	return err;
 }
 
-static void hinic3_free_txrxq_resources(struct net_device *netdev,
-					struct hinic3_dyna_txrxq_params *q_params)
+static void
+hinic3_free_txrxq_resources(struct net_device *netdev,
+			    struct hinic3_dyna_txrxq_params *q_params)
 {
 	hinic3_free_rxqs_res(netdev, q_params->num_qps, q_params->rq_depth,
 			     q_params->rxqs_res);
@@ -251,16 +253,17 @@ static void hinic3_remove_configure(struct net_device *netdev)
 		hinic3_rss_uninit(netdev);
 }
 
-static int hinic3_alloc_channel_resources(struct net_device *netdev,
-					  struct hinic3_dyna_qp_params *qp_params,
-					  struct hinic3_dyna_txrxq_params *trxq_params)
+static int
+hinic3_alloc_channel_resources(struct net_device *netdev,
+			       struct hinic3_dyna_qp_params *qp_params,
+			       struct hinic3_dyna_txrxq_params *q_params)
 {
 	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
 	int err;
 
-	qp_params->num_qps = trxq_params->num_qps;
-	qp_params->sq_depth = trxq_params->sq_depth;
-	qp_params->rq_depth = trxq_params->rq_depth;
+	qp_params->num_qps = q_params->num_qps;
+	qp_params->sq_depth = q_params->sq_depth;
+	qp_params->rq_depth = q_params->rq_depth;
 
 	err = hinic3_alloc_qps(nic_dev, qp_params);
 	if (err) {
@@ -268,7 +271,7 @@ static int hinic3_alloc_channel_resources(struct net_device *netdev,
 		return err;
 	}
 
-	err = hinic3_alloc_txrxq_resources(netdev, trxq_params);
+	err = hinic3_alloc_txrxq_resources(netdev, q_params);
 	if (err) {
 		netdev_err(netdev, "Failed to alloc txrxq resources\n");
 		hinic3_free_qps(nic_dev, qp_params);
@@ -278,13 +281,14 @@ static int hinic3_alloc_channel_resources(struct net_device *netdev,
 	return 0;
 }
 
-static void hinic3_free_channel_resources(struct net_device *netdev,
-					  struct hinic3_dyna_qp_params *qp_params,
-					  struct hinic3_dyna_txrxq_params *trxq_params)
+static void
+hinic3_free_channel_resources(struct net_device *netdev,
+			      struct hinic3_dyna_qp_params *qp_params,
+			      struct hinic3_dyna_txrxq_params *q_params)
 {
 	struct hinic3_nic_dev *nic_dev = netdev_priv(netdev);
 
-	hinic3_free_txrxq_resources(netdev, trxq_params);
+	hinic3_free_txrxq_resources(netdev, q_params);
 	hinic3_free_qps(nic_dev, qp_params);
 }
 
-- 
2.43.0

