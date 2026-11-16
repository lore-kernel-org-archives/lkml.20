Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794795656;
	b=BfGuhtz6X67W6pAQ07LuiTNZQIKZnsDiBE65GYq/czc6VNgTO09TJJ88P8UDZ9KR2uCK
	 833uYdhMPPOHRazB+or/tJq2tGaZPI1Q5y5slwzjd6rkB0aHVKiVlyjK6pNmUxOhMHPU1
	 84NafAwrtLp27WVwD7ysPwIqBXNxefufdWJz2SExLBrYGVQWCFDf+aLgyMHGxoDCoOvWv
	 vu7vAGG4AJDADGGr2YVF+WN/+ZCb6COpwRfEmwJeXBMxP37gTxcCi54Tnn2c5F4OHP9+l
	 0kJq8D5mwHgnOw2x3EEyHK6T8AKZJ2Gx9YesgpGbIEuwj/WlpeYG3c8rQ/J2HmPFrlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794795656;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=nYuf4lLW8ZPmXHqpnOuPr0ZDNokzTrQhhyDwL6mufFw=;
	b=tTc67gA7ERA+u+cvrPeAsLitan1942ShbrAyxxr+D15KHLyZfm9ETwK4GoFj+/yrQ23Z
	 KgGhweFFa8n9LPFi6J0hUYOGvd7j9KE6ZUyl57KwwjjKcNCkL0N1Ckstyq93KuEiXdHIg
	 qK7tXKsr1vQdiQ/WeAPZdTjfLLEZG/iKD6PBUmwztVKHk+ai7eHtQIawJTA3toP5GftBK
	 CdOA8rCmdLpqc4Pf5rWbW9mKtCwbbnwLbHcvo74EnioApLTMY7rZA1MQL1n5Yar1Dbsfs
	 yKiNqKcQBNg1xLGUUM8kAy4WaiFRF8Pjj270o15cHABt5fCiKjKPoidV/B9uK4FHaVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=eTsEvky2;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C274606A32C;
	Mon, 16 Nov 2026 02:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C274606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=eTsEvky2
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=nYuf4lLW8ZPmXHqpnOuPr0ZDNokzTrQhhyDwL6mufFw=;
	b=eTsEvky2jVy2K8xAoKyqu4YtWp8ky2nRS0gJjVgDqhDI7R5AWkwI8z0MJYcL07MHC5CNedP9e
	1vAdg8XC/ywFt1fpdvLl7HxFy14E3WkWdCHBe/tl2UorOfKlJPKh3kHoXfU8qfI4K8yLfpLLeDQ
	gWOqJEnZzggoH0yo1KIE/uI=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jSWn11YSbz12LD3;
	Mon, 16 Nov 2026 10:20:53 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 92AC24056E;
	Mon, 16 Nov 2026 10:20:45 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 10:20:44 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <cai.huoqing@linux.dev>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
	<edumazet@kernel.org>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH net] net: hinic: Don't fail probe when firmware lacks rx-vlan-filter
Date: Mon, 16 Nov 2026 10:18:58 +0800
Message-ID: <20261116021858.273519-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)

nic_dev_init() calls set_features() with force_change set, so it
unconditionally sends HINIC_PORT_CMD_SET_VLAN_FILTER once
NETIF_F_HW_VLAN_CTAG_FILTER is advertised.  Firmware that predates
rx-vlan-filter support answers with HINIC_MGMT_CMD_UNSUPPORTED (0xff).

hinic_set_vlan_fliter() already distinguishes that status and returns it
without a message, but set_features() treats any non-zero return as
fatal: it folds it into err and returns -EIO, and nic_dev_init() then
bails out without printing a sub-error either.  The only visible symptom
is

	hinic 0000:29:00.0: Failed to initialize NIC device
	hinic 0000:29:00.0: probe with driver hinic failed with error -5

and the device stays unusable although nothing is actually broken.

Treat HINIC_MGMT_CMD_UNSUPPORTED as "feature not available": keep probing
and drop the feature from the advertised set.  Write netdev->features
back whenever failed_features is non-empty, not only on the fatal path,
so the cleared bit really takes effect.

Fixes: 2acf960e3be6 ("net: hinic: Add support for configuration of rx-vlan-filter by ethtool")
Cc: stable@vger.kernel.org
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/net/ethernet/huawei/hinic/hinic_main.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/huawei/hinic/hinic_main.c b/drivers/net/ethernet/huawei/hinic/hinic_main.c
index 34ed5ea9e46e..e837140f7c17 100644
--- a/drivers/net/ethernet/huawei/hinic/hinic_main.c
+++ b/drivers/net/ethernet/huawei/hinic/hinic_main.c
@@ -1098,16 +1098,26 @@ static int set_features(struct hinic_dev *nic_dev,
 		ret = hinic_set_vlan_fliter(nic_dev,
 					    !!(features &
 					       NETIF_F_HW_VLAN_CTAG_FILTER));
-		if (ret) {
+		if (ret == HINIC_MGMT_CMD_UNSUPPORTED) {
+			dev_info(&nic_dev->hwdev->hwif->pdev->dev,
+				 "Firmware does not support rx-vlan-filter, feature disabled\n");
+			failed_features |= NETIF_F_HW_VLAN_CTAG_FILTER;
+		} else if (ret) {
 			err = ret;
 			failed_features |= NETIF_F_HW_VLAN_CTAG_FILTER;
 		}
 	}
 
-	if (err) {
+	/*
+	 * A feature the firmware rejects is dropped from the advertised set,
+	 * whether it was rejected fatally or not (e.g. rx-vlan-filter on
+	 * firmware that predates it).
+	 */
+	if (failed_features)
 		nic_dev->netdev->features = features ^ failed_features;
+
+	if (err)
 		return -EIO;
-	}
 
 	return 0;
 }
-- 
2.34.1

