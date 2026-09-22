Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCDE2E7F20
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055047; cv=none; b=aHObWFPwtsxoMM3PGQd6E1RFxQQtilIT0nt/bDOpTQ5fZnnCCkWTjBNl1UyvRlgMzSOMDeSWaszVs4KmDJmjAInPajFJ37b6f2rSIueK6DX+nHmpRR/daM/XGFv7bGtwh5qrEvGb+rihDnXQVd23vklVQ3vreLS0HUo3Zmyk2m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055047; c=relaxed/simple;
	bh=xuxYnRMr0gJHNE+YhHEeh99xU9e2M8kDtnKD3F7vd2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p8QSDIZk1i+z4jmhhkRBFGjU5bthcKJLMKkc5vm0Y0gJ3Ana6LQYBJ2AGr0cGQkCB+PLDn0mWsNejVJ8aUs8iTQ7lv1t2qbqC36ZGNkMCaxaCx7md9h8m5E7gkxtIng0nvzO+F6sHPiLrjBAR8Gdm27f+wAKKvMpRdZyx0Up44g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hXx1f6aI; arc=none smtp.client-ip=209.85.216.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hXx1f6aI"
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3964e480f76so1954191a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:30:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055043; x=1790659843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HRZ3B1Ko8/WCM77tME79PUcj2CiBKcaRJ7ZjElWoLfY=;
        b=x0j3nmZBvJHM9Czvhtk/Dg4AbBa3nVuW0G8x6iSrbM8u3/DrfnLOdq08PS5Xy4P7vv
         7WYALW6c1sOKAs0GVbhiwStDY42czADKNm49pQbTmWbMCBCSEeDaVqY1poLxWHxjvuvP
         SCG13SBn2loRTijNaKc2RWh0VqHTPYm9+TGiAeBQq/vKGlq8a213cd1yOvQZVCY2iFvM
         faJwXYR0VMHzshUnAw+YNBy4xU9PTkCZ46yjF/GrUaOySumnL4HiB15fEv8E4520RWwJ
         Riq50ukZz3sACAPUEcZmXAj80jJ7kPMmMphr/AP60iPEOlB2WChDx416VvKKQhTj+lcn
         Nsug==
X-Forwarded-Encrypted: i=1; AKwUvBxqblLpO6s80EY4sGmxVVrxQRaeVp5t5BVTmOgse5g1H8s1IPttEgRCrypZfx0ht4H/ovoJmv7n99fqt2U=@vger.kernel.org
X-Gm-Message-State: AFuF++kM+3AApNiOjr4TnouGGBcs/EmfgRK+MREi7BGqK4UMuyx0LVdr
	vcec+kgPHR132MEoferd+T2LDsLqUZ921BgwQrUnmgoBOVG988l4+3LJlNkTj5C8wyGOLgqYsA1
	pe5QFcWHr1gTk1+GE7tij4M7qz3ERBupVrsfZTL0Pjt+qxinpmHnakcCdkZXsLRHN7RUXIcwSFU
	54gb0Lm18dEOCvq4GhqOUSiS7ENxhy9ua583YVQ9+wkH7zMYrm0Wx7ZMnRVeWHXICfBwJ1dMC78
	DJwUGDnC2ajCL/h0mfr7HnF3Q==
X-Gm-Gg: AYBFou0gls3ZvlIJs8QVTdfvr3vFILroJypDRCOoOwoFxNA5X4JCvQUZzhGj/aw4HJO
	jqIXsPkzqiblN9oYlavr74Mq5G9lu4Ytv02we6NNyEL874HdOhZfAfcSKIPpI9FhYeDq7W0o88B
	7y/zcAlJTIPbJe+XRcf4BZzCV/CiBupP+mcpTwlDvX7VYo98y09MzuPlmCpHDIxSyfOFYRbOaj4
	PpPMLD2ALY0gc0Dum8hYlkOdlyiTVQDqVtEPui6M9rTitn0PuRKS5klaYuNPY86X18hECbJZBND
	ZcLB1RnapBpJzJo0QgJ96esjZkJjtMjfuRSTLtA1vINZkA3Q5+8kMvyOzXkh++rkbqO/Dy027T+
	tga02Ct3SbMKIQYwe4lim6kGaul+fEdZneiZLGqpQ1fOEtdP5Gkj3o/p7h4tTPSlvkg6dhDUcb1
	7w67Iq+lWg8R5IBOgjGzeskbkN0lQxLGHUc1CUbdj9YTru
X-Received: by 2002:a17:90b:4483:b0:39d:eda9:febf with SMTP id 98e67ed59e1d1-3a0730d295emr62988a91.18.1790055042599;
        Mon, 21 Sep 2026 22:30:42 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a066cbc29asm994367a91.5.2026.09.21.22.30.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2026 22:30:42 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39e3c10ac70so9298511a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790055041; x=1790659841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HRZ3B1Ko8/WCM77tME79PUcj2CiBKcaRJ7ZjElWoLfY=;
        b=hXx1f6aIHcDMMQHE8rrNb3gKfRcSg/UQT/606ZNbsmRMTmSDDgsFBDj35dILHQMtS8
         1Wj5GZtvVjZpzxNOrLjaOL/CxaUehyVvNOQHzsFwV9iSnrPvpAPpGRv051Dd59NcQuwb
         YXrlTMM8Lqb07gPAD61j/poNGGTmjRQOfcTnk=
X-Forwarded-Encrypted: i=1; AKwUvBwzVzFtzC2ACL2NIf1j3aDf+x0/QluVtpk8/6zFvEj5wyBaIBDnuuG+6+K0Y6PImhAe5U+yPe7yX/0y/LA=@vger.kernel.org
X-Received: by 2002:a17:90b:3143:b0:39e:21a7:5dff with SMTP id 98e67ed59e1d1-3a07309d174mr70321a91.11.1790055040713;
        Mon, 21 Sep 2026 22:30:40 -0700 (PDT)
X-Received: by 2002:a17:90b:3143:b0:39e:21a7:5dff with SMTP id 98e67ed59e1d1-3a07309d174mr70300a91.11.1790055040290;
        Mon, 21 Sep 2026 22:30:40 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f29dc903sm2029025c88.3.2026.09.21.22.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 22:30:39 -0700 (PDT)
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
	Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
Subject: [PATCH net-next v2 1/6] bnge: Extract bnapi allocation and cleanup into helpers
Date: Tue, 22 Sep 2026 10:58:59 +0530
Message-ID: <20260922052904.59237-2-bhargava.marreddy@broadcom.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922052904.59237-1-bhargava.marreddy@broadcom.com>
References: <20260922052904.59237-1-bhargava.marreddy@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Factor bn->bnapi allocation and free logic out of bnge_{alloc,free}_core()
into new bnge_{alloc,free}_bnapi_mem() helpers.

Prepare the driver to move bnapi allocation out of the open/close path,
and add NULL guards for rx_ring and tx_ring in core driver cleanup paths.

Signed-off-by: Bhargava Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 38 ++++++++++++++++---
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index a4288f0258f8..c1810a309888 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -825,6 +825,9 @@ static void bnge_free_tpa_info(struct bnge_net *bn)
 	struct bnge_dev *bd = bn->bd;
 	int i, j;
 
+	if (!bn->rx_ring)
+		return;
+
 	for (i = 0; i < bd->rx_nr_rings; i++) {
 		struct bnge_rx_ring_info *rxr = &bn->rx_ring[i];
 
@@ -881,6 +884,9 @@ static void bnge_free_rx_rings(struct bnge_net *bn)
 	struct bnge_dev *bd = bn->bd;
 	int i;
 
+	if (!bn->rx_ring)
+		return;
+
 	bnge_free_tpa_info(bn);
 	for (i = 0; i < bd->rx_nr_rings; i++) {
 		struct bnge_rx_ring_info *rxr = &bn->rx_ring[i];
@@ -1024,6 +1030,9 @@ static void bnge_free_tx_rings(struct bnge_net *bn)
 	struct bnge_dev *bd = bn->bd;
 	int i;
 
+	if (!bn->tx_ring)
+		return;
+
 	for (i = 0; i < bd->tx_nr_rings; i++) {
 		struct bnge_tx_ring_info *txr = &bn->tx_ring[i];
 		struct bnge_ring_struct *ring;
@@ -1195,6 +1204,12 @@ static int bnge_init_ring_grps(struct bnge_net *bn)
 	return 0;
 }
 
+static void bnge_free_bnapi_mem(struct bnge_net *bn)
+{
+	kfree(bn->bnapi);
+	bn->bnapi = NULL;
+}
+
 static void bnge_free_core(struct bnge_net *bn)
 {
 	bnge_free_vnic_attributes(bn);
@@ -1211,15 +1226,13 @@ static void bnge_free_core(struct bnge_net *bn)
 	bn->tx_ring = NULL;
 	kfree(bn->rx_ring);
 	bn->rx_ring = NULL;
-	kfree(bn->bnapi);
-	bn->bnapi = NULL;
+	bnge_free_bnapi_mem(bn);
 }
 
-static int bnge_alloc_core(struct bnge_net *bn)
+static int bnge_alloc_bnapi_mem(struct bnge_net *bn)
 {
 	struct bnge_dev *bd = bn->bd;
-	int i, j, size, arr_size;
-	int rc = -ENOMEM;
+	int i, size, arr_size;
 	void *bnapi;
 
 	arr_size = L1_CACHE_ALIGN(sizeof(struct bnge_napi *) *
@@ -1227,7 +1240,7 @@ static int bnge_alloc_core(struct bnge_net *bn)
 	size = L1_CACHE_ALIGN(sizeof(struct bnge_napi));
 	bnapi = kzalloc(arr_size + size * bd->nq_nr_rings, GFP_KERNEL);
 	if (!bnapi)
-		return rc;
+		return -ENOMEM;
 
 	bn->bnapi = bnapi;
 	bnapi += arr_size;
@@ -1241,6 +1254,19 @@ static int bnge_alloc_core(struct bnge_net *bn)
 		nqr->ring_struct.ring_mem.flags = BNGE_RMEM_RING_PTE_FLAG;
 	}
 
+	return 0;
+}
+
+static int bnge_alloc_core(struct bnge_net *bn)
+{
+	struct bnge_dev *bd = bn->bd;
+	int i, j, rc;
+
+	rc = bnge_alloc_bnapi_mem(bn);
+	if (rc)
+		return rc;
+
+	rc = -ENOMEM;
 	bn->rx_ring = kzalloc_objs(struct bnge_rx_ring_info, bd->rx_nr_rings);
 	if (!bn->rx_ring)
 		goto err_free_core;
-- 
2.47.3

