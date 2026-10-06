Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4349F3A9628
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 14:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791296384; cv=none; b=lejG5O19JU5kaAEDIDMXtK3Bh5CA7/YWCltQw2eryq4iHuKuxsHYMzFjMTmZJ8j4iAJTtrdKW6G96P2/bn7oPgsBfg8oSN+NjMUvyxe/BAOaQXtgJtMA1LindEK8f1KtaitpmLxfhAdRiFB1qrencsl6Nfyen6ZPoU7S6lkZAyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791296384; c=relaxed/simple;
	bh=Xf7I1h4jJsTAwYeglowmd9HCWNu1KMr7PLzC8H1W9PM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ovVuYIr0gWJf0vWRcym9etZiDjZevUiKuWXdeXt2IgXnsdawKWwXU+hOHpuUfYjMFkAAWdZo9MxpjvzJ7lQ7259PQxK1HBMsH9UWFPYf85sxwP8AqxnFbnlNJVXMrYAUhlN73Ox/MiDVKVVU+WTuH9Qn3W+JOU9NnJaUr+b4et0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bNqlPSJo; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bNqlPSJo"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso422619a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 07:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791296382; x=1791901182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qvsJ0zRtLPgkphjwJSWiqKXq4bf/xxFr4DSjG3zLC3Y=;
        b=DZrew6QTfGCDtRGewAM3fz47k+lEn/TLz7ptjO4xmZNZEuX8jusa7jtiTl8ycxr5ZG
         gzS/LmioyIG9BuEq3qTKFRKSlH54AC8S5YZVAK8NCBD57KNqEDD920EpaJhFzZ59L8WT
         lHr0WF/LXuLq295bNMMtKrav+yNwqpfai55qaVr+A6/GKsjpuX9nQ4XpsW67nnzDpXS+
         67eiBW6QPBAscfVU+nN4lLfa/0CCtoD9An/oqu6et+mJ2wR0MeA18fXTopTi4UPDEEB3
         KB3L+E/GUbFq91wnzb1mOtdJ7OAJIyYdg4uNUICNueBdwFMLc3+n5/G8GT8/8h63H5x3
         LB3Q==
X-Forwarded-Encrypted: i=1; AKwUvBw/b8TAEeNrrkdjVEdTNSsuay7DTQ/As0JwmYTb3IXebqPV3RwT81a3I2kFyBPMxbblWpcGyVshpPYb1vQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+GkTtCjI8xnyAB5uAUdOt8y7mW9ajLZ4PGxCnjYIbOAP/tpkV
	1lGUw28GPREg6x5rng+BBM2WFRv/D7/L5ZcHJ7ddhkh+W8SyZSsuCALGTa6dw0/FYZfPkAj3azc
	eEzEdaDbvkZnfoQ05vuSjmCk69xSZlE7BBso/0yEu4SAHi9sZ8zG6vTGvwUFtfqoXod5Q72dexH
	SqHUPyf+4SOtfWIbX2HLTJKY2arjf6fCkoX9MqFSJpGuW5Mb5gHrZD0H5+wRvLOK06+xqc44lQj
	C7RuBjOPLui1FbhxQ==
X-Gm-Gg: AYBFou17cP5+JHs4ZHN8M09Umg00fXxbIRcQz6JUOVFt5KD4tqUMoPTkohq4Dx14Wtp
	e2rKaUmmzagS8wsiTdy8j9bQBgVEgDI7qrGVI+/Iwuno67ReADQoMFfKHWo89gvjiEQEeeX5t39
	pnouEQOKc3esJ9obfAYQEHmxWs+hpjCmzZ+eqSoK/BzyW4EmymnOiHwWOjJAWKCiwv0ReUTsDu6
	FpeX+jgbAVSwXm01tv+lh5tlAMUg6A2djCSvCw4Og+Sq/3r1CAUag6hj08E/ainbkPTzw5My/iE
	9R3DB950otb8fzt+3tloMQbfcac7lFD8g/zzILmlNk/ippHzfZyC/xoLjjGYwZusethoPiwwma7
	2GrDMw9O6PCQhezviP+zDD/L6bZMHDDP7NIs76kdjBhZZZTtqL7C0j4g+wbX7QXCKr7YAyk7KCC
	zHsnEmzkDYmwSO385GSadffxJmgYJZ3mVc8g==
X-Received: by 2002:a17:90b:4b0b:b0:3a7:d2b5:2e99 with SMTP id 98e67ed59e1d1-3a873517526mr1079830a91.20.1791296381678;
        Tue, 06 Oct 2026 07:19:41 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a85425788csm1255494a91.6.2026.10.06.07.19.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Oct 2026 07:19:41 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a47a81e70bso3160451a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 07:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791296380; x=1791901180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qvsJ0zRtLPgkphjwJSWiqKXq4bf/xxFr4DSjG3zLC3Y=;
        b=bNqlPSJokD1gRxDQaFiYqF1QS+3eBcFfhT6Gl2WpaCpnk4NqSXaRMF36gU9k1nXFAf
         mpdLd8bDUbz6+OHeAWOnIkeMB/QYHeW5aCW43Yj81seMeGcoEW1+3Zod1TcsSJHd1B3w
         038zorx/VjfD4gvsTGcDAh034m1THVtVwBDLc=
X-Forwarded-Encrypted: i=1; AKwUvBy8UGlUh5roL37RpirHAmaD+BTVIwri7CTDfY/qoYGpaPf+Pb+5RQA6t87anreF4ce7wmluNsHF1BwPibo=@vger.kernel.org
X-Received: by 2002:a17:90a:e707:b0:39e:6c69:34da with SMTP id 98e67ed59e1d1-3a873746b81mr901491a91.62.1791296379639;
        Tue, 06 Oct 2026 07:19:39 -0700 (PDT)
X-Received: by 2002:a17:90a:e707:b0:39e:6c69:34da with SMTP id 98e67ed59e1d1-3a873746b81mr901471a91.62.1791296379056;
        Tue, 06 Oct 2026 07:19:39 -0700 (PDT)
Received: from H5S1 ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d2406b1sm2672878a12.8.2026.10.06.07.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 07:19:38 -0700 (PDT)
From: Vikas Gupta <vikas.gupta@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhargava.marreddy@broadcom.com,
	rahul-rg.gupta@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	rajashekar.hudumula@broadcom.com,
	dharmender.garg@broadcom.com,
	ajit.khaparde@broadcom.com,
	Vikas Gupta <vikas.gupta@broadcom.com>
Subject: [PATCH net] bnge: skip dev_addr when building the VNIC unicast list
Date: Tue,  6 Oct 2026 19:49:28 +0530
Message-ID: <20261006141928.1432927-1-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The default VNIC programs the device's MAC as L2 filter 0 in
bnge_init_chip() via bnge_hwrm_set_vnic_filter(bn, 0, 0, dev_addr).
bnge_cfg_rx_mode() then walks dev->uc and programs each unicast
address as a further L2 filter, without excluding dev_addr.

Skip dev_addr when building uc_list, since it is already installed as
filter 0. As dev_addr now takes neither a uc_list slot nor an
l2_filters[] slot, count only the non-dev_addr entries for the
uc_list overflow check too, otherwise an input such as
{dev_addr, A, B, C} would needlessly fall back to promiscuous mode
even though A, B and C fit in exact-match filters.
bnge_uc_list_updated() applies the same skip and count so the
change detection stays consistent and does not loop.

This issue was caught by Sashiko (nipa).

Tested on Thor Ultra device.

Fixes: 9afad4a17174 ("bng_en: Configure default VNIC")
Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Dharmender Garg <dharmender.garg@broadcom.com>
---
 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 28 +++++++++++++------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index a4288f0258f8..92aea6f6f09f 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -2182,19 +2182,21 @@ static bool bnge_uc_list_updated(struct bnge_net *bn,
 				 const struct netdev_hw_addr_list *uc)
 {
 	struct bnge_vnic_info *vnic = &bn->vnic_info[BNGE_VNIC_DEFAULT];
+	struct net_device *dev = bn->netdev;
 	struct netdev_hw_addr *ha;
-	int off = 0;
-
-	if (netdev_hw_addr_list_count(uc) != (vnic->uc_filter_count - 1))
-		return true;
+	int off = 0, count = 0;
 
 	netdev_hw_addr_list_for_each(ha, uc) {
+		if (ether_addr_equal(ha->addr, dev->dev_addr))
+			continue;
+		if (count >= vnic->uc_filter_count - 1)
+			return true;
 		if (!ether_addr_equal(ha->addr, vnic->uc_list + off))
 			return true;
-
 		off += ETH_ALEN;
+		count++;
 	}
-	return false;
+	return count != vnic->uc_filter_count - 1;
 }
 
 static bool bnge_promisc_ok(struct bnge_net *bn)
@@ -2207,9 +2209,9 @@ static int bnge_cfg_rx_mode(struct bnge_net *bn, struct netdev_hw_addr_list *uc,
 {
 	struct bnge_vnic_info *vnic = &bn->vnic_info[BNGE_VNIC_DEFAULT];
 	struct net_device *dev = bn->netdev;
+	int i, off = 0, rc, uc_count = 0;
 	struct bnge_dev *bd = bn->bd;
 	struct netdev_hw_addr *ha;
-	int i, off = 0, rc;
 
 	if (!uc_update)
 		goto skip_uc;
@@ -2225,10 +2227,20 @@ static int bnge_cfg_rx_mode(struct bnge_net *bn, struct netdev_hw_addr_list *uc,
 
 	if (!snapshot)
 		netif_addr_lock_bh(dev);
-	if (netdev_hw_addr_list_count(uc) > (BNGE_MAX_UC_ADDRS - 1)) {
+	/* dev_addr is already programmed as L2 filter 0, so it takes neither a
+	 * uc_list slot nor an l2_filters[] slot. Count only the entries that
+	 * will actually be programmed so the overflow check matches the fill
+	 * loop below (and bnge_uc_list_updated()).
+	 */
+	netdev_hw_addr_list_for_each(ha, uc)
+		if (!ether_addr_equal(ha->addr, dev->dev_addr))
+			uc_count++;
+	if (uc_count > BNGE_MAX_UC_ADDRS - 1) {
 		vnic->rx_mask |= CFA_L2_SET_RX_MASK_REQ_MASK_PROMISCUOUS;
 	} else {
 		netdev_hw_addr_list_for_each(ha, uc) {
+			if (ether_addr_equal(ha->addr, dev->dev_addr))
+				continue;
 			memcpy(vnic->uc_list + off, ha->addr, ETH_ALEN);
 			off += ETH_ALEN;
 			vnic->uc_filter_count++;
-- 
2.52.0

