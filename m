Received: from mail-vk1-f227.google.com (mail-vk1-f227.google.com [209.85.221.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A934854E0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519191; cv=none; b=I0fEMulC5aV30WLMZlkscwh9StF//61GKBJmgHFC+e2BZrScerapD4yWVIZqDUMeehedqhC9kRl4nEP9wYFdXg/EhHkBOwmEwsgK+GIwI9e1ErTKir55H2WM7/r2dtTCwydqGavcPDlxgCmm1ZDAkF5HtfzJ/zz4fVwb7fscfE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519191; c=relaxed/simple;
	bh=HkTEqZ6sjlxxGMjaeue/XW0Df3UPtwFZcq2SgGPDeto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IqV1loIf6nl8h2VxgmtmeVWiqZLjSwOQhntAaFvhkX8U+gmusOKnMVSDHce5G5HRqZRI3CwfzM1UZEzdJAmXtgA5H1fToOcKzvg7r/+jqX5f8UpE+0tfYIekocW2qm4/yuARnSq8dpmOFZdq9mnWVxGEQceqJbD/EIqv31mJXVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PA8UzAAZ; arc=none smtp.client-ip=209.85.221.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PA8UzAAZ"
Received: by mail-vk1-f227.google.com with SMTP id 71dfb90a1353d-5c652293bcdso1065641e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519176; x=1789123976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+8/JgLbE54eU7oy503citsIF4dH0n9XMNj5rOPWa5Ac=;
        b=ON7bBFEGBND0utICIcSChTA0KMuGvJBRzwBtpZMhCrLY91IsG8xGJ55amwljnl0bkf
         52Q6x358mrhUW4AkYYcpwvi2VqegRcPTM7xs9XlfgHh6u+FTGRqUAAvJAcqATeyyaacp
         +E7a6mQggzmMKQ2y92bI6bPVp+DJiPdt6afoUOVOBtcQyGRyUB2lx6cZhgVW3W0cYsuv
         TpiOQkdMBSQAMqU4j9QY3LXMXlZE0wX3qpBzvwZQ1HJL4muIqZ1Dx8NaM1BBIlQnfloZ
         dqoyIyEoucGF3SzruW/kLeT0cXuWTUhLWzVnV3UKNw5Tf9MxALNSvflcJaSCMx1Bx9JC
         DyHw==
X-Forwarded-Encrypted: i=1; AKwUvBxemBNeAi4IzZEyncR9e/vFQCSlfL8tMwvSZKYX8mZdh529hIZcCfnJzFZI9gSarr+9FAEchC8Qs4vVhFE=@vger.kernel.org
X-Gm-Message-State: AFuF++l/TIe/Mg2qy+66jwC37ZMU0Zv4XuBUFoCODHO4DH1tpN1D0fIe
	D5/KmwSXdTv3gZSyM3hH4u73Mk+dNgOypXVccyG0cOtZQ/ODFg123+qt8BpEJ6fy0faK9MOtFyY
	hhxrs3b8KvJOlDi6fjEn45RP9Wym3nyMOSqPK/3MwZ4hbTUSKBnYe5230wQeiNqcTPSJyUszMtc
	SOzH/kOUl+/tVqtA6+y9gI7C3vN3v+zFJBe8QeyEs+XhmSjJ5AzXrKIw7xspfjuzwCFNqUGvM34
	bwqQD3H6z2qWj8IhieM
X-Gm-Gg: AYBFou1G/sMzcTVo0+iTKO++bqANp3KeIPRFAswpMKzb3rDAEdnhWHHT+ZgvfnTFzxI
	TDnPwIZD6cm212kT6z/84bgGc0xLNRyOwHbDm+xY29NPsU2sSSQU1pNtiLNB98q6FYONz7P+4bc
	H9jwof7SaVhGOUzWc4yUCs++XFbsMO3eOS3itUU0+iin+NdFLdxaJw5kZ7kLhTwcOnx3HTGnpTW
	ySkHlt1IuwKTrWzgTIBs4lZoOFTVv7fX54kFFGweo8h6O2YN4RpACNgBCegMZNePUgs2Z2EsziF
	QsMgKWaUbOrrGskXFIGHROwVg8bqUeaG+j1HY/M7p+qqZfU15CsuRu7iStfdGAtDxWC0FyTiFmn
	uGk9QKHkaT+GlYtQu0327YPKFFP2apWuJwjUSFO5RW7yMX4SEfFfGx4+Zkr0vsA4fjHl1DxgIvG
	tCuGO/MgPQqmPKz6fZlY2uixcDg3Qabaubd/n7
X-Received: by 2002:a05:6122:630f:b0:5bd:71cf:e97e with SMTP id 71dfb90a1353d-5c7ed7740e2mr1782655e0c.5.1788519176400;
        Fri, 04 Sep 2026 03:52:56 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c7ec386e92sm1049194e0c.8.2026.09.04.03.52.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Sep 2026 03:52:56 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cec4226c70so11332365ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788519175; x=1789123975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+8/JgLbE54eU7oy503citsIF4dH0n9XMNj5rOPWa5Ac=;
        b=PA8UzAAZXTVKgcELafUoYixYl17EyhOVR9a1vXHt/HQwvi8KjxFxNt+kXxTlJTuXqo
         0BqXyNDYYF/lok8LVAbMoi+fk5bP8GHOlbCskjxNwfgVnQxTfCo5sxHkFq1YY8oVMvGR
         AlGmZASRuKAK4iP7bldIG8Ua9X3uqyvjbuxGI=
X-Forwarded-Encrypted: i=1; AKwUvByPblr/gcQ9NpGDIuR97OcNqS+HK8XBctqiZV1ddI8out9gVmhfH1GfoYcFs2h2KBaS+7CU8JyU8VMp5wg=@vger.kernel.org
X-Received: by 2002:a17:903:3810:b0:2d6:3c22:99bf with SMTP id d9443c01a7336-2db124afcefmr84673525ad.9.1788519175238;
        Fri, 04 Sep 2026 03:52:55 -0700 (PDT)
X-Received: by 2002:a17:903:3810:b0:2d6:3c22:99bf with SMTP id d9443c01a7336-2db124afcefmr84673015ad.9.1788519174773;
        Fri, 04 Sep 2026 03:52:54 -0700 (PDT)
Received: from mgmt5.dhcp.broadcom.net ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534d0asm6171170eec.8.2026.09.04.03.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:52:54 -0700 (PDT)
From: Siva Reddy Kallam <siva.kallam@broadcom.com>
To: leonro@nvidia.com,
	jgg@nvidia.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	Siva Reddy Kallam <siva.kallam@broadcom.com>
Subject: [PATCH 15/15] RDMA/bng_re: Register with ib-core
Date: Fri,  4 Sep 2026 03:43:23 -0700
Message-ID: <20260904104328.763768-16-siva.kallam@broadcom.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260904104328.763768-1-siva.kallam@broadcom.com>
References: <20260904104328.763768-1-siva.kallam@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This patch registers with ib-core

Signed-off-by: Siva Reddy Kallam <siva.kallam@broadcom.com>
---
 drivers/infiniband/hw/bng_re/bng_dev.c | 79 ++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/infiniband/hw/bng_re/bng_dev.c b/drivers/infiniband/hw/bng_re/bng_dev.c
index 6e9df737c751..2633bb289f09 100644
--- a/drivers/infiniband/hw/bng_re/bng_dev.c
+++ b/drivers/infiniband/hw/bng_re/bng_dev.c
@@ -5,6 +5,8 @@
 #include <linux/pci.h>
 #include <linux/auxiliary_bus.h>
 
+#include <net/addrconf.h>
+
 #include <rdma/ib_verbs.h>
 #include <rdma/bng_re-abi.h>
 
@@ -553,6 +555,73 @@ static int bng_re_dev_init(struct bng_re_dev *rdev)
 	return rc;
 }
 
+static void bng_re_dispatch_event(struct ib_device *ibdev, struct ib_qp *qp,
+				  u8 port_num, enum ib_event_type event)
+{
+	struct ib_event ib_event;
+
+	ib_event.device = ibdev;
+	if (qp) {
+		ib_event.element.qp = qp;
+		ib_event.event = event;
+		if (qp->event_handler)
+			qp->event_handler(&ib_event, qp->qp_context);
+
+	} else {
+		ib_event.element.port_num = port_num;
+		ib_event.event = event;
+		ib_dispatch_event(&ib_event);
+	}
+}
+
+static int bng_re_register_ib(struct bng_re_dev *rdev)
+{
+	struct ib_device *ibdev = &rdev->ibdev;
+	int ret;
+
+	/* ib device init */
+	ibdev->node_type = RDMA_NODE_IB_CA;
+	strscpy(ibdev->node_desc, BNG_RE_DESC " HCA");
+	ibdev->phys_port_cnt = 1;
+
+	addrconf_addr_eui48((u8 *)&ibdev->node_guid, rdev->netdev->dev_addr);
+
+	ibdev->num_comp_vectors	= rdev->nqr->num_msix - BNG_RE_MAX_RSVD_IRQ;
+	ibdev->dev.parent = &rdev->aux_dev->pdev->dev;
+	ibdev->local_dma_lkey = BNG_RE_RSVD_LKEY;
+
+	ib_set_device_ops(ibdev, &bng_re_dev_ops);
+	ret = ib_device_set_netdev(&rdev->ibdev, rdev->netdev, 1);
+	if (ret)
+		return ret;
+
+	dma_set_max_seg_size(&rdev->aux_dev->pdev->dev, UINT_MAX);
+	ibdev->uverbs_cmd_mask |= BIT_ULL(IB_USER_VERBS_CMD_POLL_CQ);
+	return ib_register_device(ibdev, "bng_re%d", &rdev->aux_dev->pdev->dev);
+}
+
+static int bng_re_ib_init(struct bng_re_dev *rdev)
+{
+	int rc;
+	u32 event;
+
+	/* Register ib dev */
+	rc = bng_re_register_ib(rdev);
+	if (rc) {
+		pr_err("Failed to register with IB: %#x\n", rc);
+		return rc;
+	}
+	dev_info(rdev_to_dev(rdev), "Device registered with IB successfully");
+	set_bit(BNG_RE_FLAG_ISSUE_ROCE_STATS, &rdev->flags);
+
+	event = netif_running(rdev->netdev) && netif_carrier_ok(rdev->netdev) ?
+		IB_EVENT_PORT_ACTIVE : IB_EVENT_PORT_ERR;
+
+	bng_re_dispatch_event(&rdev->ibdev, NULL, 1, event);
+
+	return rc;
+}
+
 static int bng_re_add_device(struct auxiliary_device *adev)
 {
 	struct bnge_auxr_priv *auxr_priv =
@@ -575,8 +644,17 @@ static int bng_re_add_device(struct auxiliary_device *adev)
 	if (rc)
 		goto re_dev_dealloc;
 
+	rc = bng_re_ib_init(rdev);
+	if (rc) {
+		pr_err("Failed to register with IB: %s",
+			auxr_priv->aux_dev.name);
+		goto re_dev_uninit;
+	}
+
 	return 0;
 
+re_dev_uninit:
+	bng_re_dev_uninit(rdev);
 re_dev_dealloc:
 	ib_dealloc_device(&rdev->ibdev);
 exit:
@@ -586,6 +664,7 @@ static int bng_re_add_device(struct auxiliary_device *adev)
 static void bng_re_remove_device(struct bng_re_dev *rdev,
 				 struct auxiliary_device *aux_dev)
 {
+	ib_unregister_device(&rdev->ibdev);
 	bng_re_dev_uninit(rdev);
 	ib_dealloc_device(&rdev->ibdev);
 }
-- 
2.43.5

