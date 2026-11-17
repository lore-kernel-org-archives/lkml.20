Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794896314;
	b=yokKjmQg+Q8yntbOf3VO3RfmKiS4AtyyzTXItR5hVx6GvYNzTVxQ9tS1Z3vvI6WbqCWE
	 vwSM+oduP+OR+LCBrmSTM3QukGgTMwxEDJBQK1+LnzH35kt7Xm+siq43G9C+eojyhLVf2
	 a5Eh/1PndNLGL1Zc6hVRTgvnY87dkw0FT/kIMCFQRwdt/ggZ9hbr9XN/iSxMi8lWyfrhb
	 nZ5MlnnuS+Nm5Q/hkbKQ2lW+68PHxWAfOf0aajUE83U0w7Dhqbzc6azGRski0V94MYewQ
	 QmO1SIO1VyuhozdyUhpI4y1zJ6ypCMxulo7rwh0WyogBcOQy5sObrJ+awqKcUbOqcMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896314;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Rv/M/BLrXytABMMZ13xfxagRIduwscka1wcKUW0xeIY=;
	b=EFR2gq8Osii9K8KwMqJXI56gYkk57K8jtM70AHujwRbLGi8+qOxy3jOnKoVnAHCgIcDR
	 kPMNhakFZtlTogkTwuzGq2WF5Pv2EZ7glq+rYkctrSYmBKPufTExHxF4/NaFwIjNtY6os
	 jHAeP68pHMl9iE7Yx+6ZO32bW8CQS9NNVcr0vS5q6VR2HK54QGC39LfogkmclfwEVu9aO
	 5m5R/ijU38CFDzRuAcrcxAOiiOeJ1VHPEVixZUF6uAOgzsrx+N9D9g/ZYWQCPDRXOeBXa
	 oR1BFXTZ2qopmUG6WkmFMbnWuu6vp6csmXRPguVsYiG1JvoSceeqe2AwV9G3A67dt7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PRmyR5m6;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2D4606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F2D4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PRmyR5m6
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso1829584a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:18:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896314; x=1795501114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rv/M/BLrXytABMMZ13xfxagRIduwscka1wcKUW0xeIY=;
        b=aMvvwPcBOWAKEyNW0sE56hKnMkjkWgoQCPBGLYZbZL1PYcYHOXqocPa+kzhJtkyZG6
         QKvxGelBaMBC7hfGC8k5lTdyZ36wonpoTSEPwGshZZz38kbhNoSevmpXdfLhgk/HWt4d
         QhkHQtS7uypSOr64tXZYaZ+Z3xX84pRMHRFloyjkh8ykAdDtgmb8UR1OqTFudsPeu65H
         1BF5eW/Nekcvl8HQ4HPcQ6hZhXnGpRXlfeswNtMjo7IlIJ+OQkrKKpStcnRwuqFbKFkM
         lSstCcn2BAVhtH3yVOGPAoQ934D/9OTSgDjl5kOYDkqkvzySQFplM2dlVHJ7Tu3mTU10
         p25g==
X-Forwarded-Encrypted: i=1; AL+hErH2YsZOV/UuhMZreG0pn6/MV9IgAsVl0NRAbklAm5B6MdCeO4liMXzmKCdyRBbRjtX5cRYSrB/LR/wubBc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Pa4QkIfVjXuRmATUJKf555/FvNsu8rmGU0jtONC+u+w4eCO/R
	RttXC09Z5qDUteGNhGsvQ5XDtpjc90jZ6LUGMVwKdWCV+NS+GtbJn72KrgzACjQSES9B4ipWlzV
	+iCh1A6bV6YjKymsCp32xak1EWyKDyYdCgRAVWvy1BR6rDInh0Tw0IDYCBjl1zYimp+P+RmcEeY
	84VR/EoQcVyWoBHYj1yjFXDGTsDGZTsKxzqB0fGbA6sLPx7An0EfnnAEbGoP0K7q9bSm0Bn19fj
	fo1vCASexG4CkFwwLLXDQ8nZg==
X-Gm-Gg: AZFdTZcgCXEzeOT8sCaOmONjV1PSk3YXCz/AjhOmvKixWffg7wuEzTLnYeqnbOKE/Hz
	YPxMA72absRb3P1+96aym5og+/y2/wgOr2/3dJfPFaJexO+l+aljUehuPXuVdKU+MWZgaWuXxJD
	pwj4yECs9f7NBJImO8FetWqvsUXQi4YPq+TSf0L0Lr520vyjzaEdSgBxKxQiW9OfoG+6VtouDSi
	x5MgROzzYN2w9SCCLFjGDOK/rNNaKztFgprNhp+cIBUXH+wzhXNhPO+bWss2s9TKYnvJSNFw6Z3
	T2+jRI3Pfe0Yya5RTbGDZ5mpqZUmtwIZ6+HJ8xYg/JzsBkVOfgRKoU+1LZJQYPYIHLWnCPvLsix
	3y5lQD6aY27sFy4hxNVOaX05ISyhkm9rOOaQDbJLTXYI0Cckhizsb2Yod9xB0q3/cTX+o/34W3X
	OCTJeDzZsSEBB02k2P0V37jFR6uRKGdXfcwKfZ4a1HgA==
X-Received: by 2002:a17:90b:55cf:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3b1b0b5c1eamr11712765a91.58.1794896313522;
        Mon, 16 Nov 2026 22:18:33 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ab9f98bdsm1276788a91.0.2026.11.16.22.18.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 22:18:33 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdd48746a49so2470566a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794896311; x=1795501111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rv/M/BLrXytABMMZ13xfxagRIduwscka1wcKUW0xeIY=;
        b=PRmyR5m6HpdF6gFIg9QX8fymYWgSprpOtOrSvhHkM7Sdo+Txq2yWNppaWYoZhlsb09
         Qd5TU4jUlaOZ2s4hs9+QjIFQ//Ld4H3D/Juet6r7EweG554nHDCDwlHiLY1O0yRR3qqI
         4zEr0AiP9nF96KJiUh/FeVwHZc1D0GDq32dww=
X-Forwarded-Encrypted: i=1; AL+hErEK2+XKqLuc5ZD7tu9oMV7RKoFB5w6uDt3y7wEt613HB2sRHhHF/LuWtucEKIOzCw4aAGMKyyRGd8sNgUI=@vger.kernel.org
X-Received: by 2002:a17:903:182:b0:2ed:128f:73fa with SMTP id d9443c01a7336-2ee0e0b490bmr132591605ad.46.1794896311460;
        Mon, 16 Nov 2026 22:18:31 -0800 (PST)
X-Received: by 2002:a17:903:182:b0:2ed:128f:73fa with SMTP id d9443c01a7336-2ee0e0b490bmr132591435ad.46.1794896311010;
        Mon, 16 Nov 2026 22:18:31 -0800 (PST)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d8668sm8669335ad.6.2026.11.16.22.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:18:30 -0800 (PST)
From: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	vikas.gupta@broadcom.com,
	Bhargava Marreddy <bhargava.marreddy@broadcom.com>,
	Dharmender Garg <dharmender.garg@broadcom.com>,
	Kumar Mudide <kumar.mudide@broadcom.com>,
	Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
Subject: [PATCH net-next v5 2/5] bnge: add bnge_err()/bnge_warn()/bnge_dbg() logging helpers
Date: Tue, 17 Nov 2026 06:16:38 +0000
Message-ID: <20261117061641.122942-3-bhargava.marreddy@broadcom.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117061641.122942-1-bhargava.marreddy@broadcom.com>
References: <20261117061641.122942-1-bhargava.marreddy@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

netdev_err() and netdev_warn() print "(unnamed net_device)
(uninitialized)" instead of the interface name while the netdev has not
been registered yet. Later patches in this series run NQ0 init before
register_netdev() in probe, so messages from the HWRM ring alloc/free
paths and from NQ0's async event handling would be logged that way.

Add bnge_err(), bnge_warn() and bnge_dbg(), which take a struct bnge_dev
and log through the netdev once it has been registered, including while
it is being unregistered and after, where it keeps its name. Before
that, fall back to dev_err()/dev_warn()/dev_dbg() on the PCI device.

Convert the HWRM ring alloc/free error messages, the IRQ affinity hint
warning and the async event debug message, which are reachable from
those paths. No other message is changed.

No functional change, apart from the log prefix of these messages
before register_netdev().

Signed-off-by: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
Reviewed-by: Kumar Mudide <kumar.mudide@broadcom.com>
Reviewed-by: Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge.h      | 18 ++++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_hwrm_lib.c |  8 +++++---
 .../net/ethernet/broadcom/bnge/bnge_netdev.c   |  5 ++---
 drivers/net/ethernet/broadcom/bnge/bnge_txrx.c |  4 ++--
 4 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge.h b/drivers/net/ethernet/broadcom/bnge/bnge.h
index 4479ccd071f5..e76ba4e063bb 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge.h
@@ -220,6 +220,24 @@ struct bnge_dev {
 	u32			phy_flags;
 };
 
+/* The netdev has no name until register_netdev(), so log through the PCI
+ * device before that (e.g. during probe).
+ */
+#define bnge_log(level, bd, fmt, ...)					\
+	do {								\
+		struct bnge_dev *__bd = (bd);				\
+									\
+		if (__bd->netdev &&					\
+		    READ_ONCE(__bd->netdev->reg_state) != NETREG_UNINITIALIZED)\
+			netdev_##level(__bd->netdev, fmt, ##__VA_ARGS__);\
+		else							\
+			dev_##level(__bd->dev, fmt, ##__VA_ARGS__);	\
+	} while (0)
+
+#define bnge_err(bd, fmt, ...)	bnge_log(err, bd, fmt, ##__VA_ARGS__)
+#define bnge_warn(bd, fmt, ...)	bnge_log(warn, bd, fmt, ##__VA_ARGS__)
+#define bnge_dbg(bd, fmt, ...)	bnge_log(dbg, bd, fmt, ##__VA_ARGS__)
+
 static inline bool bnge_is_roce_en(struct bnge_dev *bd)
 {
 	return bd->flags & BNGE_EN_ROCE;
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
index 01547311add8..227de771f2ef 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
@@ -1303,7 +1303,8 @@ int hwrm_ring_free_send_msg(struct bnge_net *bn,
 	bnge_hwrm_req_drop(bd, req);
 exit:
 	if (rc) {
-		netdev_err(bd->netdev, "hwrm_ring_free type %d failed. rc:%d\n", ring_type, rc);
+		bnge_err(bd, "hwrm_ring_free type %d failed. rc:%d\n",
+			 ring_type, rc);
 		return -EIO;
 	}
 	return 0;
@@ -1396,7 +1397,7 @@ int hwrm_ring_alloc_send_msg(struct bnge_net *bn,
 		req->int_mode = RING_ALLOC_REQ_INT_MODE_MSIX;
 		break;
 	default:
-		netdev_err(bn->netdev, "hwrm alloc invalid ring type %d\n", ring_type);
+		bnge_err(bd, "hwrm alloc invalid ring type %d\n", ring_type);
 		return -EINVAL;
 	}
 
@@ -1407,7 +1408,8 @@ int hwrm_ring_alloc_send_msg(struct bnge_net *bn,
 
 exit:
 	if (rc) {
-		netdev_err(bd->netdev, "hwrm_ring_alloc type %d failed. rc:%d\n", ring_type, rc);
+		bnge_err(bd, "hwrm_ring_alloc type %d failed. rc:%d\n",
+			 ring_type, rc);
 		return -EIO;
 	}
 	ring->fw_ring_id = ring_id;
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index 04f5aa75f70e..d95c3c1469da 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -2702,9 +2702,8 @@ static int bnge_nq_request_irq(struct bnge_net *bn, struct bnge_napi *bnapi)
 		cpumask_set_cpu(cpumask_local_spread(bnapi->index, numa_node),
 				irq->cpu_mask);
 		if (irq_set_affinity_hint(irq->vector, irq->cpu_mask))
-			netdev_warn(bn->netdev,
-				    "Set affinity failed, IRQ = %d\n",
-				    irq->vector);
+			bnge_warn(bd, "Set affinity failed, IRQ = %d\n",
+				  irq->vector);
 	}
 	return 0;
 }
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_txrx.c b/drivers/net/ethernet/broadcom/bnge/bnge_txrx.c
index 472b02cc43b3..2f382514c6ea 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_txrx.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_txrx.c
@@ -1135,8 +1135,8 @@ static void bnge_async_event_process(struct bnge_net *bn,
 	u32 data1 = le32_to_cpu(cmpl->event_data1);
 	u32 data2 = le32_to_cpu(cmpl->event_data2);
 
-	netdev_dbg(bn->netdev, "hwrm event 0x%x {0x%x, 0x%x}\n",
-		   event_id, data1, data2);
+	bnge_dbg(bn->bd, "hwrm event 0x%x {0x%x, 0x%x}\n",
+		 event_id, data1, data2);
 
 	switch (event_id) {
 	case ASYNC_EVENT_CMPL_EVENT_ID_LINK_SPEED_CFG_CHANGE:
-- 
2.47.3

