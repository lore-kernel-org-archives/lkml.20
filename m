Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917340;
	b=Ow1NjJ+QCBunPBCVDUqFNm3/+3zavt6o7FEtsjVYL3Ye6B1gVYosOV9CqGICve6ZG/G/
	 9a8Epc0T3gSMDzn+c5SfRyUPVXTQvIo6G+A1nwfQl1gNMEfVmBReuRKIv64rLtOi6mSpq
	 sXj2NPj06wiRBG9/MjTslpo22W7q/ks7KX3N9kPW+LwV4VonGNRgtAJbT+N0gRrtOCRSm
	 nC3J+UUH5HPUKZvIp5i3hwvIKLY3JK8yq+7kvE5YqEuqOdHbNuhYdtyw8LzNUaAgYDhfM
	 KWwjJp2lBUAlD2CoF/+LW+a4nGHPsmVCyriOAZwo680EY/Bf8bb8eRJJN923KvCGCSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917340;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Received:From:
	 To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=PoDtJSC43svapjp0Q29QbBH0PC+qqsFl8+vlkydhoZ8=;
	b=l0+rQ/quu/OgPBMpuxeFTRe8QrPokpepDAX1gQlCFAYUBxN4ZUe6CQFukMQ9adeH4jO/
	 N309VRKqGRxUY5Dtc/QZhb4LGoIAC6XxyBCNHT0GDaxvQjUe1rJStQSXKBMfaFAZYD+le
	 vOGFwu6NK4dIx6BbshS3sDis+Vhus21tOnB1c+A6iR8cAsq5LnfbmOAtK+DgQeImobrYK
	 0d6q9HKJs7NkwUVrwOhhxeKy5+cPNqZWNGlObKG/MDo5MaEE116ENw1pzHDxYCfpdKAnS
	 HM9KxLeRM207+IcnEH2lXwBWYqCKAkM7jze9Bf8VnQPZ6RkiJU1djLFN9UVujaOKjBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=riDSBGgB;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33872606A337;
	Tue, 17 Nov 2026 12:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33872606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=riDSBGgB
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=PoDtJSC43svapjp0Q29QbBH0PC+qqsFl8+vlkydhoZ8=;
	b=riDSBGgBhHP1kqHczQhiju1zVZe493dusXrrA7h7K8RdcVL7VDqjFyJzMSIOqV1x4UsAaA6Y9
	fsCC3MRftKSw8utZ2MkVgejzon/QhxuXYmu2Yq4ZRtqNo3tkaO0QOUmSFUclzfqrrX8s1iTJQs1
	rwF1BfmA3Gh8LwAqp6pbMI4=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jTNmm3sCxzRhTB;
	Tue, 17 Nov 2026 20:08:40 +0800 (CST)
Received: from dggpemr500016.china.huawei.com (unknown [7.185.36.29])
	by mail.maildlp.com (Postfix) with ESMTPS id 952D54058C;
	Tue, 17 Nov 2026 20:08:54 +0800 (CST)
Received: from whupemq100015.china.huawei.com (7.152.185.230) by
 dggpemr500016.china.huawei.com (7.185.36.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 17 Nov 2026 20:08:54 +0800
Received: from DESKTOP-62GVMTR.china.huawei.com (10.174.220.94) by
 whupemq100015.china.huawei.com (7.152.185.230) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 17 Nov 2026 20:08:52 +0800
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
Subject: [PATCH net-next v04 4/4] hinic3: Keep max_qps at the hardware maximum when RSS setup fails
Date: Tue, 17 Nov 2026 20:08:34 +0800
Message-ID: <42bd527d0000cfffe9a9924e588d80b0979d3559.1794917917.git.gongfan1@huawei.com>
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

nic_dev->max_qps sizes the per-queue software arrays: txqs, rxqs,
intr_coalesce and qps_msix_entries are allocated with one entry per
max_qps by hinic3_sw_init() and hinic3_open().  The number of queues the
driver uses is nic_dev->q_params.num_qps: decide_num_qps() clamps it to
max_qps and hinic3_config_num_qps() forces it to 1 on every open while
HINIC3_RSS_ENABLE is clear.

hinic3_try_to_enable_rss() also shrank max_qps to 1 on its error paths.
The netdev is created with alloc_etherdev_mq(..., max_qps) queues, while
netif_set_real_num_queues() only lowers real_num_{tx,rx}_queues on a
successful open, so between probe and the first open the queue count the
netdev advertises and the size of these arrays disagreed.

This is a design change, not a bug fix, so it carries no Fixes: tag: the
old fallback was self consistent (one txq, one rxq, one coalesce entry,
one MSI-X entry and num_qps = 1), and nothing can reach the mismatch
today.  hinic3_xmit_frame() is bounded by q_params.num_qps and
hinic3_get_stats64() by max_qps, and the queue count cannot grow later
either, as the driver has no ethtool set_channels or set_rxfh callback.
Keeping the arrays at the hardware maximum is what the per-queue
statistics that will walk real_num_*_queues need, since they must not be
able to index past the end of a one-element array.

After this change nothing sets max_qps to 1 any more.  Keep it at
hinic3_func_max_qnum() in every branch, which is also the value
hinic3_init_nic_io() uses for the hardware queue capacity, and reduce
only q_params.num_qps.  err_reset_q_params() now sets it to 1 explicitly
instead of copying max_qps, since one queue is what the device uses while
RSS is disabled.

Co-developed-by: Wu Di <wudi234@huawei.com>
Signed-off-by: Wu Di <wudi234@huawei.com>
Co-developed-by: Teng Peisen <tengpeisen@huawei.com>
Signed-off-by: Teng Peisen <tengpeisen@huawei.com>
Signed-off-by: Fan Gong <gongfan1@huawei.com>
---
 drivers/net/ethernet/huawei/hinic3/hinic3_rss.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_rss.c b/drivers/net/ethernet/huawei/hinic3/hinic3_rss.c
index 25db74d8c7dd..a5717e728545 100644
--- a/drivers/net/ethernet/huawei/hinic3/hinic3_rss.c
+++ b/drivers/net/ethernet/huawei/hinic3/hinic3_rss.c
@@ -312,10 +312,8 @@ void hinic3_try_to_enable_rss(struct net_device *netdev)
 		goto err_reset_q_params;
 
 	err = alloc_rss_resource(netdev);
-	if (err) {
-		nic_dev->max_qps = 1;
+	if (err)
 		goto err_reset_q_params;
-	}
 
 	set_bit(HINIC3_RSS_ENABLE, &nic_dev->flags);
 	decide_num_qps(netdev);
@@ -324,7 +322,6 @@ void hinic3_try_to_enable_rss(struct net_device *netdev)
 	if (err) {
 		dev_err(hwdev->dev, "Failed to set hardware rss parameters\n");
 		hinic3_clear_rss_config(netdev);
-		nic_dev->max_qps = 1;
 		goto err_reset_q_params;
 	}
 
@@ -332,5 +329,5 @@ void hinic3_try_to_enable_rss(struct net_device *netdev)
 
 err_reset_q_params:
 	clear_bit(HINIC3_RSS_ENABLE, &nic_dev->flags);
-	nic_dev->q_params.num_qps = nic_dev->max_qps;
+	nic_dev->q_params.num_qps = 1;
 }
-- 
2.43.0

