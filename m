Received: from mail-yw1-f225.google.com (mail-yw1-f225.google.com [209.85.128.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD40539A05D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519145; cv=none; b=QhpDpfRrX2wY0Ep5jWItdcroyDnukEvLHtkoIfmYIBMUVVnirrhVViDP7vmq0GQiOtB8iab1ugNq5kg9xJ05DK3veVO95rI4W8Iwn4tMGQ5etQAfN6kccNwYbs9d39D2EJ/XFRLWG+iOxFqhY8SLvBxYdbVesx/spDBfMRdxp8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519145; c=relaxed/simple;
	bh=NCEZsl84HHiKcZvDUyy2UoV9CL6yoj9KYOuoXiClFsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JDYnJxeWPCHDfzykPZfQu+9jAD1sR/de+edaQszkz98hLnoaKAYwqTlDY8v4jKznBKUhplMqP9WGIt6xoRW2QtOJxQqSWPDyq2a+LJd/PnP7ZITVTU04BZqZsTAUZTY630ALwFE9Sw3F7AerQRCHxjXaf3At8CVdqfOu/jocOP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=EHLe9DdO; arc=none smtp.client-ip=209.85.128.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="EHLe9DdO"
Received: by mail-yw1-f225.google.com with SMTP id 00721157ae682-85a50f6a7f7so9878617b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519142; x=1789123942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6MGbG+t89gZz/Gg0XOe1OiNev2BX7ANIyZVE4l7ZKwg=;
        b=gZYT6g0/9ZCzJkamuTfn5zNpCarF5HssxVJNHjmW9LKtxDF9EAGP9X1Wnb5V6MAVd1
         H8Svc43tWVNVcOlzf2/3Q7wUa7EE6u7VUv3/ODAPOBcB5N7qWnFkoFCu8n82o/Vq8VvU
         Nhyhz9+lUtvUmL0mLw3MMw2EgFPo3A+f4gcZXE9xI+tFqLTAFPGw29iStWpP4dLo1LLn
         Cwz9D5CK9j47bYYBtYQOKjLne8oMgOtMG1kGAWoZyWyrF4ifsoMZyvf8ansWkfthijD+
         8fyFOJ+ENFtG4Nxs124C6SAhH2XroAt8i9ZhynH0W4AYNbJ/EISF9DhxTrwH9TR0GS90
         RF5w==
X-Forwarded-Encrypted: i=1; AKwUvBzY0hjfQ3FbkKvrzLHziw9V5s18VD/8if5jMVlY8v6O3fOqGpm1WfTbW+6XadG8+pKMk67oZmVyGUpL6WU=@vger.kernel.org
X-Gm-Message-State: AFuF++nHCaAvcIIQjsUysK1Le1UvINPNai1vPWGrj8vaUIVubKC4Fzil
	S53PbbPtUI8sTlEj1qU+gt659MUHPe8lU0+ji8loOr5FELKZ/3G0BJp38xOgujwus5+CXP4yvek
	4bDIDyOoBVg/Y+4LgkYpG9kFS4hR1vbkjaL4ZRU9dAqkq1D1dOk89MwL7NcBuqRLQ3YuWwWP2Hw
	jJuzU7fIQLQlFOV18X+l2XYGbRhctPHAaGx1tAr5FgCcyZJoCavezVCo2RIOvo90DoimV+eJtZd
	GoBDfFQy8asBTBUAAmQ
X-Gm-Gg: AYBFou1SJ8IzVzZWd3adfuFVemNxrl4Vm0bL+T7leVKixI7GtIOya8iTnstmKK1/bgA
	EZypQthI2o906bOKA/j7RdS+2edo352/Ct73LojjuDqjwK+oeysVjp7iDezt7mF9yMVkZd9t9aT
	6nn47xZLjWeov8SB7he7rcndRw0PbawwAAUOTK/Xy+r2RPLhHpZH/owkriEImAbObYR3btoPFiT
	ri97IBiEdnHV2vNoGM6GT8DJgu/BjaXZ6AhYbhK7MCBx3uo2qlhm5B6m3xBLH69t6IiQzVIPRGJ
	URM8xh8W/7o+UB9rNJHuNDDLEGBlvdDhNmjZ26q0ygbv+CxwPWrT3Pi1P02v46G5QptRkFEAAMx
	bXeYUGLZ8ad26Aqxv3bRH3kX51U2fsg1W2+XcdFzig1/xCjrIkqNpWnbDMxWwHxWV8UjWaXTq+d
	p2JhQrxmSUcfh5UmBI0x4IFGHJwKw4bp1RpA==
X-Received: by 2002:a53:bc03:0:b0:66d:930:7203 with SMTP id 956f58d0204a3-66fb5a66c27mr1467853d50.38.1788519141780;
        Fri, 04 Sep 2026 03:52:21 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-87146e2b43dsm421617b3.16.2026.09.04.03.52.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Sep 2026 03:52:21 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39533bb224cso1267962a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788519140; x=1789123940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MGbG+t89gZz/Gg0XOe1OiNev2BX7ANIyZVE4l7ZKwg=;
        b=EHLe9DdOmjnIuG515OuVErJVuRjQ4M+KgMJJpKv6/FlAz0yrQReTvOlyNtxN6amB0g
         tZvP9sJXALKFS78GBRZ9nmKkKkovSvH0CP+361wUbdKD/byGyJoOQDRa8NAw//6GV5Hi
         4Mi+C1EFaGnKlOkzphlb9RFbD5dthZLfSpqus=
X-Forwarded-Encrypted: i=1; AKwUvBzstBv4LADPf6luqMHQRjk4Yc0b2YkwbnSe4YpC+VifkQVgyvUs2ic5Y5eLlrS9CZz9TH2ranj5tbIMvNc=@vger.kernel.org
X-Received: by 2002:a17:90b:5289:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-39b261d0d83mr8637701a91.16.1788519140361;
        Fri, 04 Sep 2026 03:52:20 -0700 (PDT)
X-Received: by 2002:a17:90b:5289:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-39b261d0d83mr8637631a91.16.1788519139909;
        Fri, 04 Sep 2026 03:52:19 -0700 (PDT)
Received: from mgmt5.dhcp.broadcom.net ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534d0asm6171170eec.8.2026.09.04.03.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:52:19 -0700 (PDT)
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
	Sachin Holla <sachin.holla@broadcom.com>,
	Siva Reddy Kallam <siva.kallam@broadcom.com>,
	Vikas Gupta <vikas.gupta@broadcom.com>,
	Dharmender Garg <dharmender.garg@broadcom.com>
Subject: [PATCH 03/15] bnge: reserve TX/completion rings for the RoCE MPC channel
Date: Fri,  4 Sep 2026 03:43:11 -0700
Message-ID: <20260904104328.763768-4-siva.kallam@broadcom.com>
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

From: Sachin Holla <sachin.holla@broadcom.com>

When RoCE is enabled, the bng_re driver allocates its own TX/CQ rings
for the MPC control channel out of the same per-function FW ring pool.
Enhanced bnge_reserve_rings() to account for this extra ring count to
avoid pool overflow while allocating netdev rings.

Signed-off-by: Sachin Holla <sachin.holla@broadcom.com>
Signed-off-by: Siva Reddy Kallam <siva.kallam@broadcom.com>
Reviewed-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_resc.c    | 32 ++++++++++++++++---
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
index 4711dd4945ff..9dfb22b7c7c7 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
@@ -110,9 +110,24 @@ static u16 bnge_nqs_demand(struct bnge_dev *bd)
 	return bd->nq_nr_rings + bnge_aux_get_msix(bd);
 }
 
+static u16 bnge_tx_rings_demand(struct bnge_dev *bd)
+{
+	u16 tx_rings = bd->tx_nr_rings;
+
+	if (bnge_is_roce_en(bd))
+		tx_rings += 1; /* For MPC TX ring */
+
+	return tx_rings;
+}
+
 static u16 bnge_cprs_demand(struct bnge_dev *bd)
 {
-	return bd->tx_nr_rings + bd->rx_nr_rings;
+	u16 cprs = bd->tx_nr_rings + bd->rx_nr_rings;
+
+	if (bnge_is_roce_en(bd))
+		cprs += 1; /* For MPC CQ ring */
+
+	return cprs;
 }
 
 static u16 bnge_get_avail_msix(struct bnge_dev *bd, int num)
@@ -250,7 +265,7 @@ static bool bnge_need_reserve_rings(struct bnge_dev *bd)
 	u16 nqs = bnge_nqs_demand(bd);
 	u16 vnic;
 
-	if (hw_resc->resv_tx_rings != bd->tx_nr_rings)
+	if (hw_resc->resv_tx_rings != bnge_tx_rings_demand(bd))
 		return true;
 
 	vnic = bnge_get_total_vnics(bd, rx);
@@ -275,6 +290,7 @@ int bnge_reserve_rings(struct bnge_dev *bd)
 	u16 nq = bd->nq_nr_rings;
 	u16 aux_msix = 0;
 	bool sh = false;
+	u16 tx_demand;
 	u16 tx_cp;
 	int rc;
 
@@ -293,11 +309,12 @@ int bnge_reserve_rings(struct bnge_dev *bd)
 		hwr.nq = bnge_nqs_demand(bd);
 	}
 
-	hwr.tx = bd->tx_nr_rings;
+	tx_demand = bnge_tx_rings_demand(bd);
+	hwr.tx = tx_demand;
 	hwr.rx = bd->rx_nr_rings;
 	if (bd->flags & BNGE_EN_SHARED_CHNL)
 		sh = true;
-	hwr.cmpl = hwr.rx + hwr.tx;
+	hwr.cmpl = bnge_cprs_demand(bd);
 
 	hwr.vnic = bnge_get_total_vnics(bd, hwr.rx);
 
@@ -327,6 +344,13 @@ int bnge_reserve_rings(struct bnge_dev *bd)
 	if (hwr.stat > bnge_aux_get_stat_ctxs(bd))
 		hwr.stat -= bnge_aux_get_stat_ctxs(bd);
 	hwr.nq = min_t(u16, hwr.nq, hwr.stat);
+	/* Drop MPC TX ring from L2 TX ring count; it is owned by RoCE driver */
+	if (bnge_is_roce_en(bd)) {
+		if (hwr.tx >= tx_demand)
+			hwr.tx -= 1;
+		else
+			return -ENOMEM;
+	}
 
 	/* Adjust the rings */
 	rc = bnge_adjust_rings(bd, &rx_rings, &hwr.tx, hwr.nq, sh);
-- 
2.43.5

