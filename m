Received: from mail-ua1-f98.google.com (mail-ua1-f98.google.com [209.85.222.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C03249CF42
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 16:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791303853; cv=none; b=WyOFgztnSuy09DpfruUfngoFGm8IzywWsGiYP397l8z4vhXhtdubzilYev2iGVeTKdn0gUGji7Cyj7K5fYoxJKUC0/uhYCcvV2TETRJOowf7uBCMXnBI4VLkkiyBCzhncBfqJeGCXPsW8L4htd4uAjaLpEN5p7qIUe3/XKdKa0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791303853; c=relaxed/simple;
	bh=RcbvBXG/6lrsdkpqL8g9IxIvet2V3+6WRbvHO5gAYgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PM7SshFJxtnbp5sRlpkT9Bv6a4QwbYdmcMwBwJgeNIWzKUTCAaGjTV/kODq9bUJ+X9Hlqorux0NJRJtYBdIP6CA9F2iaRg00e1MrJIAAB55qHwZaafPJJJ+tUtIADZqu6+CM1pX2Gm4Die6mG/WI3w0FzxdRiS582fvaUu7pZBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=h3gxBz3D; arc=none smtp.client-ip=209.85.222.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="h3gxBz3D"
Received: by mail-ua1-f98.google.com with SMTP id a1e0cc1a2514c-980c4f5c921so250668241.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791303842; x=1791908642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8p9gZ6dHUeXfr9Ect+sOuLZTX6uktr9z7PwXXUBPJY=;
        b=nsUxhv8rhdAiooFic1aJmA8WN+0eBRPoOk5xY9WVx3bQor08yDWfzn+jVWDVAdhnF5
         2TnzQURujytIuhUs6xlWyyxhwIV8AaLMMdOTO49E/naTqt6IfOBgKsRZ5tBQvcBx6mSQ
         EeG9rXQDLVDzL8pky1jL66HnuN42M+6I+jj0YDkv0CHVq6UNSWq1mg1oGtH6JLmaPLko
         pWhRIV5JLiNEVtGv6BXvpPkBVOmonlaicnXlfOSIaJ0AquJXJq302SAvHMkQMyCHKgwn
         iTzksi4QmyU+21lBobk5X9dOow07hZmrUCVyT1kS9WMwmQqm9/1RJLQ1roY5cLEZoUGB
         oZYg==
X-Forwarded-Encrypted: i=1; AKwUvBxMvu9UCCVjZ5GVmDI9RSz9r/lEIYWxozTWXQGyyDyy0WuAKNFHJfOhdocXGhKgugssXOociIETEPOh5cs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeVkKq9ul+DxxqNUbxzH9pSXBQ7MOi0KlM7KUPsAy5NHVq+uBq
	8PJ0t5RiDewKw2h6svJZm2GKn4oXdmvWaDVwSwcwx8yc/Yo6T+own8/Li1119sFgzfhI/qtrvN5
	u7uHrOC+6ibpV0kgt8lqYKfmAulezAA/K9iZbkwRo4hYUTKkbrtZHIpI4EnD1Nq3OVcoAO7A0gZ
	4/Jk83ITtWKmGFdLOOae57vE7a0UZOlquBdF9/hF3ULlbOFR7HxFc+mFjJtHzH3euGWn3X0lLi3
	rTnxUI3wp/Oi+c+1vJw
X-Gm-Gg: AYBFou2Na4A0DbOB2LQNONvSxReMqmiOvaWMIo276hHCdRLXswXV5rmOyWx447UJAKN
	KcpA7o0hvXvcQYyqxFiWLJ5T4d16nSXNffPrv8idu6Z8KhhVL+DbxW/smVvNXYS5kmtYxjsC/bd
	7eSZgOqvN5QThzpvJzLouTC7y1GrEcR6BusZ8qGdIjlefrDkS1FFYfZF+mZbPHhkAe8D2MJJIPH
	jjt6nD0eAAWq0oQyBzeK593Ug+AL0oUG10f2FBEsY10aaU1S9r9rPdJAryfX4om3q7PQVxFRyoS
	FvNQSEQIw9qNEbL6vCuxryJZLN+YGtLEIgmplHHCv0WPTfIyPyp5khsksklOdRvSAiXHaEDIgRy
	LAA6mApxIANZJYn65GqH02RUME8duzBsPVFARD3EPai9+7etlzoG93+Xhc9/tVcGq7YqvXdqrr0
	I3hMxWgMxj55mapSAS95w2g3PohfhAg48OqQ==
X-Received: by 2002:a05:6102:41a0:b0:7b5:4f3e:709a with SMTP id ada2fe7eead31-7c87cb7c5b3mr392721137.37.1791303842209;
        Tue, 06 Oct 2026 09:24:02 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-7c100d6496bsm94579137.26.2026.10.06.09.24.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Oct 2026 09:24:02 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917baea8e5dso63339416d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 09:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791303841; x=1791908641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8p9gZ6dHUeXfr9Ect+sOuLZTX6uktr9z7PwXXUBPJY=;
        b=h3gxBz3D6k97B+mQI3Oex6nh50F8IZvF7hZoEmLHknu9f77Hi3+guupWPYkngMZxe+
         1ezv2YEWoepQziuvDsbVvqJ2EXGC4oFG9ud8p1q5KLxzC+22DtaW23c6WzhadgTAOVbN
         NHRGIGTprNn+kvTlynKT16c82xbEQ8Q0ksO0E=
X-Forwarded-Encrypted: i=1; AKwUvByT/DUrMbZLKeW/7SV9Q7hXtWK/8ur2ugJsnaEIGfir9i+DLViKBDLnbGEDWx8i6rRsrX5irPV/xj928Ug=@vger.kernel.org
X-Received: by 2002:a05:622a:312:b0:535:2283:20a3 with SMTP id d75a77b69052e-53566b24b6fmr31828981cf.33.1791303841411;
        Tue, 06 Oct 2026 09:24:01 -0700 (PDT)
X-Received: by 2002:a05:622a:312:b0:535:2283:20a3 with SMTP id d75a77b69052e-53566b24b6fmr31828551cf.33.1791303840787;
        Tue, 06 Oct 2026 09:24:00 -0700 (PDT)
Received: from mgmt5.dhcp.broadcom.net ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5356b860df8sm9020961cf.14.2026.10.06.09.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:24:00 -0700 (PDT)
From: Siva Reddy Kallam <siva.kallam@broadcom.com>
To: leonro@nvidia.com,
	jgg@nvidia.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: vikas.gupta@broadcom.com,
	ajit.khaparde@broadcom.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	Sachin Holla <sachin.holla@broadcom.com>,
	Siva Reddy Kallam <siva.kallam@broadcom.com>,
	Dharmender Garg <dharmender.garg@broadcom.com>
Subject: [net-next v2 3/3] bnge: reserve TX/completion rings for the RoCE MPC channel
Date: Tue,  6 Oct 2026 09:12:56 -0700
Message-ID: <20261006161256.1493672-4-siva.kallam@broadcom.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261006161256.1493672-1-siva.kallam@broadcom.com>
References: <20261006161256.1493672-1-siva.kallam@broadcom.com>
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

