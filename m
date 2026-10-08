Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D6033CEA5
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 02:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791426531; cv=none; b=KzhK0TNkoy/39t0E5U/GsgwgdU/1x64qeAvUttglKIG/pT55ExDZGsvQwb84OQYu5aep/7L4dSOdLowh2DtM8EXtMwvSSmMXlhLaddpb1FIWA7TAMaLtFUD1EZlUI5g/+UuYMo/DEEiRDC1rvd8UwOCav1RZrhQf2DdcbchMpfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791426531; c=relaxed/simple;
	bh=QYkHG9dkoU5pZlnkpLQ1PMrqT2VPenrzpLOqtah5yes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=njcySq/IvVod6GXoxT4BrpjubEIxJqqNfv4YVggywjXENVEX+rH8NA5H858YgVBOBdmKDw3bS6fNy5XwDDino45R0yvjqnPzdJaT+SXG+dpg9r1QIgxrYZjTJlybNy1Xvhe0FS36pLcG+qYTZBR3J7QSCJQLOvsKz8J+u3nk8CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuBcZESv; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuBcZESv"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e608cd460eso9135525ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 19:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791426530; x=1792031330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sgbvJkFB0HqBTzA3hsSyDK8m6vIymZThQTGkU/au7RE=;
        b=iuBcZESvR0nIsgtPCRqg3fFVM3U5/nsCyiagEwCMD/AvHWWlWVzn45owwj7vUAEKsm
         c0+3T+WnAKxxtTjjkxQcCRPBM3qCsR2fLMB9YPHQugqaNPcXTPNk+vfCtdLYX7j4Ew5B
         dCizbgbhaf9sChQDTL0dSlr6Iz74s3EDBa3v7tVVvJ6+qasQNhMlS351WdtA1o8Zemt/
         UaOqYVlfq6wKsImmohN3PxuqnlaRpW0c2rb0ztX5ALMio8S6VlXI+BZQeXbwyOcIPjLf
         1ax30L0njiQcYOHckiIs+kQ5LtY99tmenLuOe3/lFu7+E546R5kqmkSQi8GpTbrku5ja
         b2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791426530; x=1792031330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sgbvJkFB0HqBTzA3hsSyDK8m6vIymZThQTGkU/au7RE=;
        b=ISv7dJ7KjGZ6yqzksJcbeUYf1HBWA7V3hG6SSDEHA43d21Mi1o+AI4MZJvmwBj71O0
         nxxxJXWQf8VTQblMsgKM2o/+X2Wwl/+iUv8wTPbhXBCOFAU42ZgUUh2Rw0sTYbxTU+KU
         jbba72KZiY/TA+zV+pSWHXyXvC7lKTOAKigT1Yoc7fgR1gb6R4dZo5NI3S4Q/TgLr5ug
         0vyE1/++RRQNjOMvPwFxlxsEA8tAjPUHO8Fn9A/6hwTSJM4n+5AIAFECkDc2zXriTnEc
         gG3jWFjgGcrLLUnJyl90hCsDE282syzuYH5vRELz5zAtBkFWj5/ILj2y7ZDbi3JXSTf9
         QwsQ==
X-Forwarded-Encrypted: i=1; AKwUvByNDDXAI+BK0HCsOxFe0hudRXiypc+RRjyShv+6b84zL8G5WCYnVmnQJLV4fet2y0aAzVqk0EdjT758jnE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgv2F8TorEZmbeVDqqbwoY1xcQKTvwH80lmbx4xHlzezt/HcJO
	3J4iilSh2bnCSj/zW2pYXKb52hE+oK3H/ffsRR97ZoGGBeZZUQ2qEl2B
X-Gm-Gg: AYBFou28kPJ0ZpHSywxmycIf9Vw1bJkuMr5Whq0wf/N/rFB3tPYIp+0DqtzlcMrJNQ6
	w3Ev4jEguH41ZrOp246xYGy+pk0YqM9hiiL/63A99Nwg9jOdWTjoZ8VmBTtJpSOdE6TfyB9YH2V
	TaDLawi+Eqy1Fi6QmayOQc3joqeNfXGnhsP0cg/VweHgb+rZHrlU08bhPY2ep/K7saox45AJQW9
	4f+3UOiUMkdDnSV/RNPhmWgt5Qaugnzr5CJF70sdIsxKfQ+pKgjCsXYZfStkN6YiiWVRHXedeOA
	Fql/KiBNy9pS30UqotYFg2+w+pY9+DmGppjN5PRGjUrrcVFQQyl86mVHtAKX32IRVtaDkK+UwBH
	Yj4IRwKWF1deyHPJURbMui1u/+gMkkzexDkIL4llXVa4b53i6ZU0ejvOSQYzkTnWij5xlhKJfTN
	NJxw6g1Yteb9tG836VvlyfB7B4k7bWQ7Da7z6EbLb5M6zzbgIgzjekEKmZ4yd9dTvYKnRRAqo9i
	1j5uJyq4Cm9uj5cisSJMJie18ITNXwnjUVnSg==
X-Received: by 2002:a17:903:46c8:b0:2df:7e40:6f6c with SMTP id d9443c01a7336-2e6004d67d8mr36969815ad.46.1791426529645;
        Wed, 07 Oct 2026 19:28:49 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60482cab0sm18045865ad.50.2026.10.07.19.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 19:28:48 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 02/10] net: hisilicon: hip04_eth: Move setting of netops to fix crash
Date: Thu,  8 Oct 2026 10:26:44 +0800
Message-ID: <20261008022656.3592191-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008022656.3592191-1-mmyangfl@gmail.com>
References: <20261008022656.3592191-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hip04_mac_probe() calls of_phy_connect() before ndev->netdev_ops is
assigned. phy_attach_direct() -> phy_link_topo_add_phy() reads
dev->netdev_ops through netdev_need_ops_lock() since the commit in
question, so probing crashes with a NULL pointer dereference when
CONFIG_NET_SHAPER is enabled.

Assign netdev_ops before the PHY attach, as was done for emac in commit
7c9f391ec89c ("net: emac: move setting of netops to fix crash").

Fixes: ded86da4bbb7 ("net: ethtool: relax ethnl_req_get_phydev() locking assertion")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/hisilicon/hip04_eth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/hisilicon/hip04_eth.c b/drivers/net/ethernet/hisilicon/hip04_eth.c
index fc2c47dcfaab..d0409de5c553 100644
--- a/drivers/net/ethernet/hisilicon/hip04_eth.c
+++ b/drivers/net/ethernet/hisilicon/hip04_eth.c
@@ -976,6 +976,8 @@ static int hip04_mac_probe(struct platform_device *pdev)
 		goto init_fail;
 	}
 
+	ndev->netdev_ops = &hip04_netdev_ops;
+
 	priv->phy_node = of_parse_phandle(node, "phy-handle", 0);
 	if (priv->phy_node) {
 		priv->phy = of_phy_connect(ndev, priv->phy_node,
@@ -989,7 +991,6 @@ static int hip04_mac_probe(struct platform_device *pdev)
 
 	INIT_WORK(&priv->tx_timeout_task, hip04_tx_timeout_task);
 
-	ndev->netdev_ops = &hip04_netdev_ops;
 	ndev->ethtool_ops = &hip04_ethtool_ops;
 	ndev->watchdog_timeo = TX_TIMEOUT;
 	ndev->priv_flags |= IFF_UNICAST_FLT;
-- 
2.53.0

