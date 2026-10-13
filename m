Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7F65540B3
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924345; cv=none; b=S2cO7ed/6o2o6+AQ1nvJqHD71kxnuNkFOjPuytPFPdU+jBjHViyEPF3MljRokpu8bKrGpIyPKvhpg4nKCHVOiELhp518xjMMGgNgUoR7rAHY9o6vu6MUgyIIVlq5nXtbC5ArQDJmIdU1BM0J9NdTiW6OjxIWOyKWbNQWlG9Rpac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924345; c=relaxed/simple;
	bh=vUpcsez7CgnIpw4YbzcmYEoAjaaVFIIoSzz7dzlZask=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jrhquA20jt7BM8LoKyIJ8kiXvVqjRtm9eYYHVF0XKHVTohcXxHpChc5VqCQG9loNM6k4z4DCvtRPGyIJCxm6bwqMIl7ILXOQ1cpzw0vbb8FfPsVDw5Apt/Div29Nkrt68kKVEkkJS5zmOlnSAv16wrkLJtYzfQKxxoBjnW1jdaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=dAdlRnSI; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="dAdlRnSI"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ab066bef7dso147634a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924343; x=1792529143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mjx/TM1iArDbn30rqgVOcHhn4GsE6BcqrxggBQfCUl4=;
        b=APZ7i62E79m16KaawPe6RRmLxQFUCvOTnZmPz4aYUmkGQagYPW2Cu1Aj9WrO2qb419
         BfaMKQ2lt/SJ/M0fhoYxCmCnqAAcSbNd8vYVsxzKuV3xeOS5ig8bJUgOzqaV2j5rO09j
         HOQWAVy1b2OyrR+nVmBleuVgt2SAiTd6B6ldDqpBeoaOGR3oKAmxf/XD2EJ6331LFV79
         4N3ATXBommOQ+Dh8d8uZTsm4VUeV4dVWZFIulmKXf/1DTvX+6N10ae64RKLmcv4kF6xE
         hpVkCtoAsRimQ/dJvUHSW2fR2YTLUBw9Hwm5HRhekXduiDkFzMJpT4W3i7r4zNFFrqb8
         eW6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxR7ZziOoaOxpypxIk7zkRUHSgVztr9JgCamKOliIGJaEMviQaEiG4bsPDx80c2QdvKqlksD/F4o9/wHW8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOvjpkBJHEuSwIpjwTFk8hKz2eCAQW2G/OjEyOKxGmXznsjTKD
	XEtGSIa3JV15pf6SyEHWa4rzW18UQZBQa9autoH+9db2Grhdfme6Y/Fg9yrBUh0VYua2pJv+PW6
	zezqt+w2muHytAi3ju8pH2z2LFjt5oMf7lVK7xCdevCbyGeUauIBJ+rfpIqwCR7+3AfrsbDXB2t
	BIaroo7GFrodIrs3oBq3T72C9KZSw8e9C+IOWzo03e9Lz9Al67BwAVblEeCOPyNKRzNfIbCIerO
	8JzAMwC6zgxz+l+4KOQYyVo
X-Gm-Gg: AYBFou1UpFLI3o6htYNo8es0wwkFjU280GC+4RkMBCQCQStX7Dq/aPOK4cHk3+3YS9k
	n2SIcLQ+1rI+WXsWiggYrMia445k/P2CP9iwSl662wEiXFk1YfE8mU/5wgcm4+cxRH8X3cQlskK
	uq3XEHUehm4Vr0VeBY2rSIe49dYXCebkfXww5PIrCvvOySok2gyoMdqvCXsxIBl+lBdQZIXZ54l
	PbXB06GpUIWhQdHrWOyDSlYKE7WF2Ncvben/qR4HitlwcoS27eDtwCPdgJo1UXjCwbsrNxE2f8g
	7DnR+d4SaVDTLGlz9uWKJ5ppWgV24n//6tFHZNxEG16ohAhTmlGSkJ1v+mCuavEg0hsRow9PKQy
	HcEkty30PE5O2SkawZGsNEZz8h7P6o+vycvlJHEgn3mLGOZgtX1ymF0rDZl2T6vpXH+uBmyZm8V
	W5HLpZE2r1ppV0Y4ey0Stjyb9w86dF+jUHULlaOb80PZs=
X-Received: by 2002:a17:90b:1d4f:b0:3a8:699f:959d with SMTP id 98e67ed59e1d1-3ab3a955988mr11267672a91.31.1791924342969;
        Tue, 13 Oct 2026 13:45:42 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ac5ede81a4sm394561a91.0.2026.10.13.13.45.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:45:42 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53514fbd4a3so74988701cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791924342; x=1792529142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mjx/TM1iArDbn30rqgVOcHhn4GsE6BcqrxggBQfCUl4=;
        b=dAdlRnSIIeEdxo0s4fRVwwJqkWmEez+ti4E5lfu8EmjYHZQWHZ88PB/jOT/PhSJcy8
         gvAikqFm95R1N3LwulwTCQmN+ffmMlMBWV8Q8NFcaiwTrZB4YmfmcSlavOx6FxQ+cQSS
         HMB+lO9cJhE726uMr/NYENzZHD1GFxSY+29GY=
X-Forwarded-Encrypted: i=1; AKwUvBw5Kr9BukH9RSIEmQuumI6sWB2CbmS3Kh7ygOzaxR90+zRP9jofJc3CYPEVfZEe1a7GXUwO16baD1B0ZvI=@vger.kernel.org
X-Received: by 2002:a05:622a:481b:b0:535:864:82cf with SMTP id d75a77b69052e-5359f46d548mr217193291cf.10.1791924341734;
        Tue, 13 Oct 2026 13:45:41 -0700 (PDT)
X-Received: by 2002:a05:622a:481b:b0:535:864:82cf with SMTP id d75a77b69052e-5359f46d548mr217193031cf.10.1791924341240;
        Tue, 13 Oct 2026 13:45:41 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-535f4eee7bcsm15879231cf.30.2026.10.13.13.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:45:40 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Zak Kemble <zakkemble@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Ryo Takakura <ryotkkr98@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Nicolai Buchwitz <nb@tipi-net.de>
Subject: [PATCH net v3 RESEND 6/6] net: bcmasp: fix network filter lookup and wake filter pair allocation
Date: Tue, 13 Oct 2026 13:44:39 -0700
Message-Id: <20261013204439.3494046-7-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261013204439.3494046-1-florian.fainelli@broadcom.com>
References: <20261013204439.3494046-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

In bcmasp_netfilt_get_init(), when looking up an existing filter (!init)
for a specified location, if the filter at loc was not claimed, the
previous loop continued searching higher indices and could return an
arbitrary unrelated filter belonging to the port. This caused flow get or
delete operations on an empty rule location to return or delete an
unintended filter.

Fix this by checking only the requested location on lookup and rejecting
RX_CLS_LOC_ANY when !init. In addition, harden wake filter allocation
and release by ensuring wake filter pair searches stay on even boundaries
where both entries are free, checking that loc + 1 is free for positioned
wake filters, and validating parity and bounds on release.

Fixes: c5d511c49587 ("net: bcmasp: Add support for wake on net filters")
Assisted-by: LLM
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/ethernet/broadcom/asp2/bcmasp.c | 121 +++++++++++---------
 1 file changed, 70 insertions(+), 51 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp.c b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
index 972474893a6b..f41a79529f10 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp.c
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
@@ -511,6 +511,13 @@ static int bcmasp_netfilt_wr_to_hw(struct bcmasp_priv *priv,
 	return 0;
 }
 
+static bool bcmasp_netfilt_is_companion(struct bcmasp_priv *priv, int i)
+{
+	return i > 0 && (i % 2) &&
+	       priv->net_filters[i].wake_filter &&
+	       priv->net_filters[i - 1].wake_filter;
+}
+
 void bcmasp_netfilt_suspend(struct bcmasp_intf *intf)
 {
 	struct bcmasp_priv *priv = intf->parent;
@@ -524,9 +531,7 @@ void bcmasp_netfilt_suspend(struct bcmasp_intf *intf)
 		    priv->net_filters[i].port != intf->port)
 			continue;
 
-		if (i > 0 && (i % 2) &&
-		    priv->net_filters[i].wake_filter &&
-		    priv->net_filters[i - 1].wake_filter)
+		if (bcmasp_netfilt_is_companion(priv, i))
 			continue;
 
 		ret = bcmasp_netfilt_wr_to_hw(priv, &priv->net_filters[i]);
@@ -556,9 +561,7 @@ int bcmasp_netfilt_get_all_active(struct bcmasp_intf *intf, u32 *rule_locs,
 		    priv->net_filters[i].port != intf->port)
 			continue;
 
-		if (i > 0 && (i % 2) &&
-		    priv->net_filters[i].wake_filter &&
-		    priv->net_filters[i - 1].wake_filter)
+		if (bcmasp_netfilt_is_companion(priv, i))
 			continue;
 
 		if (j == *rule_cnt)
@@ -583,9 +586,7 @@ int bcmasp_netfilt_get_active(struct bcmasp_intf *intf)
 			continue;
 
 		/* Skip over a wake filter pair */
-		if (i > 0 && (i % 2) &&
-		    priv->net_filters[i].wake_filter &&
-		    priv->net_filters[i - 1].wake_filter)
+		if (bcmasp_netfilt_is_companion(priv, i))
 			continue;
 
 		cnt++;
@@ -607,6 +608,9 @@ bool bcmasp_netfilt_check_dup(struct bcmasp_intf *intf,
 		    priv->net_filters[i].port != intf->port)
 			continue;
 
+		if (bcmasp_netfilt_is_companion(priv, i))
+			continue;
+
 		cur = &priv->net_filters[i].fs;
 
 		if (cur->flow_type != fs->flow_type ||
@@ -659,7 +663,7 @@ bool bcmasp_netfilt_check_dup(struct bcmasp_intf *intf,
 }
 
 /* If no network filter found, return open filter.
- * If no more open filters return NULL
+ * If no more open filters return error.
  */
 struct bcmasp_net_filter *bcmasp_netfilt_get_init(struct bcmasp_intf *intf,
 						  u32 loc, bool wake_filter,
@@ -669,45 +673,55 @@ struct bcmasp_net_filter *bcmasp_netfilt_get_init(struct bcmasp_intf *intf,
 	struct bcmasp_priv *priv = intf->parent;
 	int i, open_index = -1;
 
-	/* Check whether we exceed the filter table capacity */
+	if (!init) {
+		if (loc == RX_CLS_LOC_ANY || loc >= priv->num_net_filters)
+			return ERR_PTR(-EINVAL);
+
+		if (priv->net_filters[loc].claimed &&
+		    priv->net_filters[loc].port == intf->port &&
+		    !bcmasp_netfilt_is_companion(priv, loc))
+			return &priv->net_filters[loc];
+
+		return ERR_PTR(-ENOENT);
+	}
+
 	if (loc != RX_CLS_LOC_ANY && loc >= priv->num_net_filters)
 		return ERR_PTR(-EINVAL);
 
 	/* If the filter location is busy (already claimed) and we are initializing
 	 * the filter (insertion), return a busy error code.
 	 */
-	if (loc != RX_CLS_LOC_ANY && init && priv->net_filters[loc].claimed)
-		return ERR_PTR(-EBUSY);
-
-	/* We need two filters for wake-up, so we cannot use an odd filter */
-	if (wake_filter && loc != RX_CLS_LOC_ANY && (loc % 2))
-		return ERR_PTR(-EINVAL);
-
-	/* Initialize the loop index based on the desired location or from 0 */
-	i = loc == RX_CLS_LOC_ANY ? 0 : loc;
-
-	for ( ; i < priv->num_net_filters; i++) {
-		/* Found matching network filter */
-		if (!init &&
-		    priv->net_filters[i].claimed &&
-		    priv->net_filters[i].hw_index == i &&
-		    priv->net_filters[i].port == intf->port)
-			return &priv->net_filters[i];
-
-		/* If we don't need a new filter or new filter already found */
-		if (!init || open_index >= 0)
-			continue;
-
-		/* Wake filter conslidates two filters to cover more bytes
-		 * Wake filter is open if...
-		 * 1. It is an even filter
-		 * 2. The current and next filter is not claimed
-		 */
-		if (wake_filter && !(i % 2) && !priv->net_filters[i].claimed &&
-		    !priv->net_filters[i + 1].claimed)
-			open_index = i;
-		else if (!priv->net_filters[i].claimed)
-			open_index = i;
+	if (loc != RX_CLS_LOC_ANY) {
+		if (priv->net_filters[loc].claimed)
+			return ERR_PTR(-EBUSY);
+
+		/* We need two filters for wake-up, so we cannot use an odd filter */
+		if (wake_filter) {
+			if ((loc % 2) || loc + 1 >= priv->num_net_filters)
+				return ERR_PTR(-EINVAL);
+			if (priv->net_filters[loc + 1].claimed)
+				return ERR_PTR(-EBUSY);
+		}
+		open_index = loc;
+	} else {
+		for (i = 0; i < priv->num_net_filters; i++) {
+			/* Wake filter consolidates two filters to cover more bytes.
+			 * Wake filter is open if:
+			 * 1. It is an even filter
+			 * 2. The current and next filter is not claimed
+			 */
+			if (wake_filter) {
+				if (!(i % 2) && (i + 1 < priv->num_net_filters) &&
+				    !priv->net_filters[i].claimed &&
+				    !priv->net_filters[i + 1].claimed) {
+					open_index = i;
+					break;
+				}
+			} else if (!priv->net_filters[i].claimed) {
+				open_index = i;
+				break;
+			}
+		}
 	}
 
 	if (open_index >= 0) {
@@ -716,16 +730,20 @@ struct bcmasp_net_filter *bcmasp_netfilt_get_init(struct bcmasp_intf *intf,
 		nfilter->port = intf->port;
 		nfilter->ch = intf->channel + priv->tx_chan_offset;
 		nfilter->hw_index = open_index;
-	}
 
-	if (wake_filter && open_index >= 0) {
-		/* Claim next filter */
-		priv->net_filters[open_index + 1].claimed = true;
-		priv->net_filters[open_index + 1].wake_filter = true;
-		nfilter->wake_filter = true;
+		if (wake_filter) {
+			/* Claim next filter */
+			priv->net_filters[open_index + 1].claimed = true;
+			priv->net_filters[open_index + 1].wake_filter = true;
+			priv->net_filters[open_index + 1].hw_index = open_index + 1;
+			priv->net_filters[open_index + 1].port = intf->port;
+			priv->net_filters[open_index + 1].ch = intf->channel +
+							       priv->tx_chan_offset;
+			nfilter->wake_filter = true;
+		}
 	}
 
-	return nfilter ? nfilter : ERR_PTR(-EINVAL);
+	return nfilter ? nfilter : ERR_PTR(-ENOSPC);
 }
 
 void bcmasp_netfilt_release(struct bcmasp_intf *intf,
@@ -733,7 +751,8 @@ void bcmasp_netfilt_release(struct bcmasp_intf *intf,
 {
 	struct bcmasp_priv *priv = intf->parent;
 
-	if (nfilt->wake_filter) {
+	if (nfilt->wake_filter && !(nfilt->hw_index % 2) &&
+	    nfilt->hw_index + 1 < priv->num_net_filters) {
 		memset(&priv->net_filters[nfilt->hw_index + 1], 0,
 		       sizeof(struct bcmasp_net_filter));
 	}
-- 
2.34.1

