Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4467947127F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519133; cv=none; b=q6NBFWiexNQeI3N4//k6jbIJfcVFi3JTZVEoz9k4bjMF5U4Xn394+Pj5AeAPPW60R4yaVLze7aK5jMBIOklt2P4OdLM636kDwtXu4X6jJWzD7Emxk368Z+NgxeoGxYPrAQzdsVRvWDqw2UqV9FtZOSqxFDa/VOBtl5s7vqwOXzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519133; c=relaxed/simple;
	bh=WRG9UgShlNfxyLPPBnUHhlfjXfFCUHshugncnalnY60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TTmpAInQmxMf2a6SkfRUb2BKQD9WDb2dLWBQ5LPRcMHKGYCtfhed08ciLOVeKxvmLv6jLue91PnWqKXBqEjYavx6LpLL4KrKAIok1DVdihe5VBc9XDBymAbYRQlwtS9xFOF8bQBb2FJc4HbLCNfwLTk4vL61HMDb0AuErzklUKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=KEZ3OCHJ; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="KEZ3OCHJ"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so905458a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519131; x=1789123931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4T8JhJl+n0cUcmlbairws+PCdmkJbE8LYyhZ18WIdqw=;
        b=L1dxEE4JIZipH3WQlnqmrNXrTpWugtBiWZjoCSLx8DWMx89kJDEVBCWHcRGD9RdxDS
         /0PCfOeU+v/ydHv5a7bgWMIrPi3gYjclLXDN/CdjTVT6hvD01u4SpFHMxzVF8bKBnI+Q
         4fyfeZoD6ku85KunKQ07KwRrRRF/L/kSoqKx31kxAvoSiUWp1TSV+oYK50ark5R6Qvvm
         kCdyd5Ynh3oz0azet4p4pEWl62AEQKMNbfiFsSRlQ4wCy+4Devkrk//6xyD5pqspTW3l
         acrJq2NgMvW5Ph/7aZQdrydeYcrKHg+Q4im3aBe8g3eeMixgf80rNoyaKZvW6dCYjvTK
         KwNA==
X-Forwarded-Encrypted: i=1; AKwUvBzoYHQrHG8H8VmyHClezlbNLV0nBI1U4L3fEPAiKBTjCs681AlCWRc3gj6Uqd9IiD6UVvJZWTKXtItZSSw=@vger.kernel.org
X-Gm-Message-State: AFuF++n3N5DVAtiiSjJ/cJahiIJluU5Z/NxkTuQadb8m9nX1V9LiNVls
	ef8ksQkS3sdTaBqIe72KIphY65B9DmHE5BsXzy+YHFTLre0hirdCuYUE6HrqqCi9gmTYOMZltlo
	5Ugo2rwE3pgtfA/LQ7xBUwIzxbNJI/nfXj45AdOxQYJEv96M19XgDTn9SNshkGZmSoANdLA74Az
	f1WDI4jpMxVltqDW33yliZZ4tzjN1ISPvuiqaI8Xcl5k2G7HqBEAHwLfMd1jw/I20APu/9ntYc0
	lQkBF+EoCUOMhg6nP9/
X-Gm-Gg: AYBFou0C1kV4y2SX6eAQx2U23T4EbItw7ERMhqgOQitzy88KFRtDSZsDe8zewx8JhbY
	ENuoJ0pbaj3w6K0TfOnQp+BmGIMHm7g5F8RVtpGv4Jz2zRrRO/rYRU4j1If5RpiuvJnBUgjl2d3
	0tXWY+02F1MTvsmoT7ZtspArNzrNqwzjc/DPcBV5yMZDS+kAziA59PoXJrvjw6O0PqbA86gzywS
	BfvIcvkfExLxBI4Iz9PrgMw2qpupTpTo1Syaco6MQTFCOpK0CxQquPJzGOm8aAwNPmOhmOuuIx1
	cRhcKQqRczE6L/ySpEDEm/OcH8kRRngmfyeG+UrONif4Naqq7Hj8vE7XNcAWqwN9eLVtDOm6Vi3
	9MQ0FaWSZeNhZpu2GuSMvo+G9C2rQSSkOuvFrhgVOBIXmz9xcM6RyJggpQU8nndqOG6ypc1TrRZ
	r8rOZP4bOBJV5NrwvHBM6JKpG+S7lWOBHrmw==
X-Received: by 2002:a17:90a:164f:b0:39b:3510:49e7 with SMTP id 98e67ed59e1d1-39b35105b52mr1025761a91.0.1788519131333;
        Fri, 04 Sep 2026 03:52:11 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39b25cdb3b0sm1242341a91.0.2026.09.04.03.52.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Sep 2026 03:52:11 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db0a41434bso16213245ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788519130; x=1789123930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4T8JhJl+n0cUcmlbairws+PCdmkJbE8LYyhZ18WIdqw=;
        b=KEZ3OCHJgsdO8DoRgYA0ZsLgUs4Kx22nxeJmcQPdYckPuecm92FRlHZ8mXY7PMXarg
         fer0gp8euIgc5cixgl2XDF+dy6DbUD5BPD1X3966kJ/oL/qmre4d+/6Y4zOGnlAIYLJN
         lnLqcDI5wd/4rkSNwReqzUnQrEoU4X3bspatc=
X-Forwarded-Encrypted: i=1; AKwUvBwuLfGW566efy+6lbEQbmUg7GSirH5a47aKQ1snPOp5MPvjtL8nzomk0kjfeldo5ga3xcRF/sQp6C5qTdU=@vger.kernel.org
X-Received: by 2002:a17:903:1a8c:b0:2d8:d4d1:313d with SMTP id d9443c01a7336-2db1267bc0emr77507245ad.20.1788519129669;
        Fri, 04 Sep 2026 03:52:09 -0700 (PDT)
X-Received: by 2002:a17:903:1a8c:b0:2d8:d4d1:313d with SMTP id d9443c01a7336-2db1267bc0emr77506395ad.20.1788519129223;
        Fri, 04 Sep 2026 03:52:09 -0700 (PDT)
Received: from mgmt5.dhcp.broadcom.net ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534d0asm6171170eec.8.2026.09.04.03.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:52:08 -0700 (PDT)
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
	Saswati Das <saswati.das@broadcom.com>,
	Siva Reddy Kallam <siva.kallam@broadcom.com>,
	Vikas Gupta <vikas.gupta@broadcom.com>,
	Dharmender Garg <dharmender.garg@broadcom.com>
Subject: [PATCH 01/15] bnge: Add infrastructure support for RoCE MPC channels
Date: Fri,  4 Sep 2026 03:43:09 -0700
Message-ID: <20260904104328.763768-2-siva.kallam@broadcom.com>
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

From: Saswati Das <saswati.das@broadcom.com>

Add the initial L2 driver plumbing for RoCE MPC (PRIMATE channel)
support:

- Plumb BAR1 through to the RoCE auxiliary device info, alongside the
  existing BAR0, so the RoCE driver can reach the doorbell BAR.

This will be used by follow-on patches to issue RoCE commands over the
MPC channels to the firmware.

Signed-off-by: Saswati Das <saswati.das@broadcom.com>
Signed-off-by: Siva Reddy Kallam <siva.kallam@broadcom.com>
Reviewed-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge_auxr.c | 1 +
 drivers/net/ethernet/broadcom/bnge/bnge_auxr.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_auxr.c b/drivers/net/ethernet/broadcom/bnge/bnge_auxr.c
index 0955b488b6fe..87ae40eab592 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_auxr.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_auxr.c
@@ -181,6 +181,7 @@ static void bnge_set_auxr_dev_info(struct bnge_auxr_dev *auxr_dev,
 	auxr_dev->pf_port_id = bd->pf.port_id;
 	auxr_dev->en_state = bd->state;
 	auxr_dev->bar0 = bd->bar0;
+	auxr_dev->bar1 = bd->bar1;
 }
 
 void bnge_rdma_aux_device_add(struct bnge_dev *bd)
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_auxr.h b/drivers/net/ethernet/broadcom/bnge/bnge_auxr.h
index 6c5c15ef2b0a..13cb9289f5b8 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_auxr.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_auxr.h
@@ -46,6 +46,7 @@ struct bnge_auxr_dev {
 	struct net_device	*net;
 	struct pci_dev		*pdev;
 	void __iomem		*bar0;
+	void __iomem		*bar1;
 
 	struct bnge_msix_info	msix_info[BNGE_MAX_ROCE_MSIX];
 
-- 
2.43.5

