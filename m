Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5E63B9D80
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 04:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791345624; cv=none; b=KvHgSf/DfUNcNzEsLU9iN48wTxSBaiNE0nbt7IxT4xW+AwzoEuLdbE0QIgPq70bZDfRq/8jat1nLXKbvFELLZQET3agRhYuubw4AWthnF4SCzpc8AdFRJQ8yMJzw0/iJh6hI2o9+A/9243wju6+yLQTg0yKk+F+tY3sfQo6QYPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791345624; c=relaxed/simple;
	bh=hheZvmOEH09cE+6MPGzC3rNluQJSpQxVhr9j9vbtbl4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q7hUZCYfgDEqg6NJ1wA2Z8VBFp6vNZpk3i/PB9g5v6eZdCx2ltJHpwLn6sVyB9IiKcMt5WYxV7SjxFFuA/geRiFyKmTY1VeVh8NJrXA2mRIL54YowTv61jSmzy7apy4hl5smnYmrkBPnvKRJFPsQfjAcCBtobp+26mNhCli14y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=skNurNMH; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="skNurNMH"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ab432273c5so15600687b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 21:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791345622; x=1791950422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nO74/poHHriVQQGcUChNQm9h4u4fWQR/w7rKBXdaFA0=;
        b=skNurNMHEvtMyVahVOioPfdql3HZ3ldXQEtBeLDaHfdccpEMxx26cwif1z3gkDr1fS
         TG9CzHa8Eytnn24Ft5RaCDsKMT4Rh74gC9VLekqoYnHI1i+i72ZPuRB7MeNqn4p1qqjx
         8oC7xRcW+wowb73hFX6tbcXoPzloPg4/R20MK9BpinYyDfDiuLCm7rE90hRUe4kYqD17
         cm9RQQ851d4OBi4r/Oh9v3nAn1AykE9Un8ZUgW2Lv9M99gjjD1tjqZHvHSPL1b0MpCej
         7Ogtecf8lgsQ/BxolnKoQRoW+rEBYQb5R6SPP5IstyWwGPkPA1g7i1zHN8Y5l9YTV+45
         xn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791345622; x=1791950422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nO74/poHHriVQQGcUChNQm9h4u4fWQR/w7rKBXdaFA0=;
        b=wWYXpI6PgUghgZ82EMNXRH7f0GCiUir4Y/fIVhF6ghv5ploUT+FDRveKRlww5mAA9Z
         gK2DVqF7t2u3xtfob/udCncLW4EH59sHJ+AVwvq12XqfAX9Ztc1z732C7EObQ8W5kXry
         Tm/PWERwSpptQnNJ/8GcjgXm+74bkLfB0/4X4OUW0lic3oR+tyFQxW3DAaoZjk/wAlMc
         8NQTAxIDt0fbbgKeFH4Z2B6XfDesIfY4A3Qi6JDd6Y/aJPTzhJDChrw3HGIObESN3Mtg
         vk/wUrCZiFbjfvhDg4/gwPLM4yfaSv+EWew/3Oyxr+AluF6T12DavFITBv8yygNK2C5E
         TwKA==
X-Forwarded-Encrypted: i=1; AKwUvBz4aGeEE1N0wC1KHQ1CI+lUJwLTGiil9fjuEmZ19F8hhyzYG7/rY3pOCrbyfo1dHfpx4tsDrvapIZczPh8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPb4mN38HEYybtyOT1nuUNbbZyZcYO8bru+ygl8UcStFCAbxmd
	l96cnVOkFq6XvbW8QrGWe/4Q/oaivv00ZCQiWdg4P4axcTEVhk3PqzRv
X-Gm-Gg: AYBFou0qaZjDZh4lE+Tq1cqeMj5wmLQgqZp60epPUpNjg/xgRES5x29FbpUqfUAwpaq
	jaY/cD87jRo0zoE/NW/lXhnyrF70e/0RPSOYovQzFEBG20zNy5lnPqDJFQoIv2X0GmLMPnHWqfw
	h4NPI+oc4Txf9pQZmDB+UCBsHSYrWnq4LSV22kepR4GDhHZvewmMstBlgyko11AYOhFblh1qepV
	msq34/bKs2xI24lKNAd9T9Xdz+9uUcl92S6J4+mHer0mprcZbLax44XQG7RG3FDi1G+XRRlAcSb
	JPqwJk90+I5naDnoCAU5MdrqbgazA0rLwf75rWXwcmBRdIB9tcpkEToCDCYdhzwg7LsEmfvnKSk
	KTXsqtdryScqNWgf9ntCV0i4+AbxQagzrQRLBYQVwsDOb8D3z5JGHPo++vBNaC8BYncu/7tAO7G
	yv9hRkBV6yafYnXoU2sswVvHv/DVwg+bJ6hTqx5rymeUV7gAg8Qyc2jasLDU4DW2oC1Q9ldc5sk
	f+wC10aGJyGDrHuwoB1L4AR674F2YkAcYmqVV6x8s1F8VhB0co2Z5yPBkBu59iV1iCd3wZyOieF
	ctr5PSNZ0BZqXWqfF+ryFwvsq6oqBq3HB6Q2JyK1KahdjmFK/IIVDoalEwl3RhiK4tjqWc50Sy9
	6uc0sG2zmn1CTjLnrcLqQ7QNShYVBO2nMd0+YByk2Y3jZjv1RH4jHefsWeZrDCO2v/q4QwSy2i1
	1rtGD42VM6EvFs5rsDkoJ9Khk4X7c4XDRXF9OD7vTGUm3YryfR/l8uWFWqD5reMo27kA==
X-Received: by 2002:a05:690c:6b01:b0:8a8:6fac:21af with SMTP id 00721157ae682-8b05ad74f5amr11479597b3.12.1791345621604;
        Tue, 06 Oct 2026 21:00:21 -0700 (PDT)
Received: from tokyo (c-73-137-217-102.hsd1.ga.comcast.net. [73.137.217.102])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b05abdbdd4sm4888637b3.40.2026.10.06.21.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 21:00:18 -0700 (PDT)
From: Atharva Vartak <atharva.a.vartak@gmail.com>
To: "D. Wythe" <alibuda@linux.alibaba.com>,
	Dust Li <dust.li@linux.alibaba.com>,
	Sidraya Jayagond <sidraya@linux.ibm.com>,
	Mahanta Jambigi <mjambigi@linux.ibm.com>,
	Tony Lu <tonylu@linux.alibaba.com>,
	Wen Gu <guwen@linux.alibaba.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Ursula Braun <ubraun@linux.ibm.com>,
	Hans Wippel <hwippel@linux.ibm.com>,
	linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Atharva Vartak <atharva.a.vartak@gmail.com>,
	Willy Tarreau <w@1wt.eu>
Subject: [PATCH v2] net/smc: hold a reference on net_device returned by pnet_find_base_ndev()
Date: Wed,  7 Oct 2026 00:00:09 -0400
Message-ID: <20261007040009.137568-1-atharva.a.vartak@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pnet_find_base_ndev() resolves the base net_device for stacked devices
under RTNL, then drops the lock and returns the raw pointer without
taking a reference.  All three callers dereference the pointer after
RTNL has been released, creating a use-after-free window if the device
is concurrently unregistered.

Take a reference with netdev_hold() before dropping RTNL and add the
matching netdev_put() in every return path of the three callers:

  - smc_pnet_add_eth()
  - smc_pnet_find_roce_by_pnetid()
  - smc_pnet_find_ism_by_pnetid()

Fixes: 0afff91c6f5e ("net/smc: add pnetid support")
Fixes: 1619f770589a ("net/smc: add pnetid support for SMC-D and ISM")
Cc: "D. Wythe" <alibuda@linux.alibaba.com>
Cc: Dust Li <dust.li@linux.alibaba.com>
Cc: Sidraya Jayagond <sidraya@linux.ibm.com>
Cc: Mahanta Jambigi <mjambigi@linux.ibm.com>
Cc: Tony Lu <tonylu@linux.alibaba.com>
Cc: Wen Gu <guwen@linux.alibaba.com>
Cc: Willy Tarreau <w@1wt.eu>
Cc: linux-rdma@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: netdev@vger.kernel.org
Signed-off-by: Atharva Vartak <atharva.a.vartak@gmail.com>
---
v2: use netdev_hold()/netdev_put() with a netdevice_tracker instead of
    the deprecated dev_hold()/dev_put() (Jakub Kicinski).
v1: https://lore.kernel.org/netdev/6aba080c.b933486d.297b72.5042@mx.google.com/

 net/smc/smc_pnet.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/net/smc/smc_pnet.c b/net/smc/smc_pnet.c
index ff9c9c35cc2f..61ef1d697eee 100644
--- a/net/smc/smc_pnet.c
+++ b/net/smc/smc_pnet.c
@@ -30,7 +30,8 @@
 #include "smc_core.h"
 
 static struct net_device *__pnet_find_base_ndev(struct net_device *ndev);
-static struct net_device *pnet_find_base_ndev(struct net_device *ndev);
+static struct net_device *pnet_find_base_ndev(struct net_device *ndev,
+					      netdevice_tracker *tracker);
 
 static const struct nla_policy smc_pnet_policy[SMC_PNETID_MAX + 1] = {
 	[SMC_PNETID_NAME] = {
@@ -356,6 +357,7 @@ static int smc_pnet_add_eth(struct smc_pnettable *pnettable, struct net *net,
 	struct smc_pnetentry *tmp_pe, *new_pe;
 	struct net_device *ndev, *base_ndev;
 	u8 ndev_pnetid[SMC_MAX_PNETID_LEN];
+	netdevice_tracker base_tracker;
 	bool new_netdev;
 	int rc;
 
@@ -365,10 +367,13 @@ static int smc_pnet_add_eth(struct smc_pnettable *pnettable, struct net *net,
 	rc = -EEXIST;
 	ndev = dev_get_by_name(net, eth_name);	/* dev_hold() */
 	if (ndev) {
-		base_ndev = pnet_find_base_ndev(ndev);
+		base_ndev = pnet_find_base_ndev(ndev, &base_tracker);
 		if (!smc_pnetid_by_dev_port(base_ndev->dev.parent,
-					    base_ndev->dev_port, ndev_pnetid))
+					    base_ndev->dev_port, ndev_pnetid)) {
+			netdev_put(base_ndev, &base_tracker);
 			goto out_put;
+		}
+		netdev_put(base_ndev, &base_tracker);
 	}
 
 	/* add a new netdev entry to the pnet table if there isn't one */
@@ -945,10 +950,13 @@ static struct net_device *__pnet_find_base_ndev(struct net_device *ndev)
  * (for instance with bonding slaves), just the first device
  * is used to reach a base device.
  */
-static struct net_device *pnet_find_base_ndev(struct net_device *ndev)
+static struct net_device *pnet_find_base_ndev(struct net_device *ndev,
+					      netdevice_tracker *tracker)
 {
 	rtnl_lock();
 	ndev = __pnet_find_base_ndev(ndev);
+	/* keep ndev alive after dropping RTNL, callers must netdev_put() */
+	netdev_hold(ndev, tracker, GFP_KERNEL);
 	rtnl_unlock();
 	return ndev;
 }
@@ -1085,17 +1093,20 @@ static void smc_pnet_find_roce_by_pnetid(struct net_device *ndev,
 {
 	u8 ndev_pnetid[SMC_MAX_PNETID_LEN];
 	struct net_device *base_ndev;
+	netdevice_tracker base_tracker;
 	struct net *net;
 
-	base_ndev = pnet_find_base_ndev(ndev);
+	base_ndev = pnet_find_base_ndev(ndev, &base_tracker);
 	net = dev_net(ndev);
 	if (smc_pnetid_by_dev_port(base_ndev->dev.parent, base_ndev->dev_port,
 				   ndev_pnetid) &&
 	    smc_pnet_find_ndev_pnetid_by_table(base_ndev, ndev_pnetid) &&
 	    smc_pnet_find_ndev_pnetid_by_table(ndev, ndev_pnetid)) {
 		smc_pnet_find_rdma_dev(base_ndev, ini);
+		netdev_put(base_ndev, &base_tracker);
 		return; /* pnetid could not be determined */
 	}
+	netdev_put(base_ndev, &base_tracker);
 	_smc_pnet_find_roce_by_pnetid(ndev_pnetid, ini, NULL, net);
 }
 
@@ -1103,13 +1114,16 @@ static void smc_pnet_find_ism_by_pnetid(struct net_device *ndev,
 					struct smc_init_info *ini)
 {
 	u8 ndev_pnetid[SMC_MAX_PNETID_LEN];
+	netdevice_tracker base_tracker;
 	struct smcd_dev *ismdev;
 
-	ndev = pnet_find_base_ndev(ndev);
+	ndev = pnet_find_base_ndev(ndev, &base_tracker);
 	if (smc_pnetid_by_dev_port(ndev->dev.parent, ndev->dev_port,
 				   ndev_pnetid) &&
-	    smc_pnet_find_ndev_pnetid_by_table(ndev, ndev_pnetid))
+	    smc_pnet_find_ndev_pnetid_by_table(ndev, ndev_pnetid)) {
+		netdev_put(ndev, &base_tracker);
 		return; /* pnetid could not be determined */
+	}
 
 	mutex_lock(&smcd_dev_list.mutex);
 	list_for_each_entry(ismdev, &smcd_dev_list.list, list) {
@@ -1123,6 +1137,7 @@ static void smc_pnet_find_ism_by_pnetid(struct net_device *ndev,
 		}
 	}
 	mutex_unlock(&smcd_dev_list.mutex);
+	netdev_put(ndev, &base_tracker);
 }
 
 /* PNET table analysis for a given sock:
-- 
2.56.0

