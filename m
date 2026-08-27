Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D94407CCF
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847166; cv=none; b=RxOTB+tnBUqw4EZdvGZlxfjJUaB27j4DeBgIu+S0ljfQzuTD1kQ4CFP3UqMXMH3u8Sia+EPJwGxW0Tt+IwTpa/N6hCCUOYkRHuJaFg42CUiMkQTc36tuNybbSD8L8n6hombSfRTkkVPuxbXvmxAHJ9+g2yP+ysXYe9UeN3/NrG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847166; c=relaxed/simple;
	bh=ZiQ/nn9ANVloPJIK/b0D8sPCCqQJrkIokYi9sJvhR7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YUH3tfgxg2F3oTwu2UWEupuZ/IFiX10iLwM1LJwqY7kpDcygcYu/D5ZAi/DUdzviLN2CVYYlHMnreRV5EQ6XDaacZfjRRrYLBbjnojUkK2yetpcWQKZdeQFp0DtN6UQRD28rZ8N5iPFK7PJzBdcuI8BqcdwGpBb5f6Noh29hYi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FcmBbM5G; arc=none smtp.client-ip=209.85.215.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FcmBbM5G"
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-ca12086c06eso54700a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787847164; x=1788451964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pGyTFP/ZSQ2pi6NB0HQ1eQMbojy+m9ryJYHVSeuqsrk=;
        b=h+jOko2AGrbgLd0SFV8VSJ6xT5wK0lZ6oxHjVbeR3WmLhmjefThBDkKjZUIpCqkOqu
         oJZmOrfg0P/SahNHIBwJ+OlpH+Dsm6NghDj7AINTNf6J/MW0uyiGSX69QTk8RFsjsY4x
         H2Kgh7XBNDTjBi/eRRYyiTim5UcmyHCZ+uRdDAHYIfaoF+bhTeNvXlHrwyMubd6I3fAL
         R1P3c8+K1ApmcB5bz2XHDX5EkjV+CJTIe/bwow98qeXKCOWN9ZE+Ar4qVn5EzF14QGfc
         TBOdRG9grpnna80arS3cLJOFPL+nuOdd1S0JxTMULeAvcNypjd3l+MUzRoI9Ji1K8I1B
         O86Q==
X-Forwarded-Encrypted: i=1; AHgh+RrPCBh8/gh9CQ8A4Eex5uahJu3AAnak+/a+hgwRdC+hb+zHkD9U0PUSoseDP5K1js1YxY2ATFHVlyxvfhI=@vger.kernel.org
X-Gm-Message-State: AFuF++mjirWrcm/ptML7f22S+ZlZ8pc4TiPdpjz/3bb8U64T+SDWn0hk
	Yp27wZwcFFO0Of0YdpUtsJa+X2qGQmH4lx0pZulsKJ1haYEkFVzGESFLR500NNF9r9868pz7A+O
	jrtu+iULTZ9WcGIjqdOhFJKyA1JdWpGOr4s8gk9KLlMytD0NAO7yA6Kb2vyMV5rxKf5HkKv4bQr
	Qwc0svgpMpuslgDBKgjk5lQPC7rAcEWw8dbnBwoJKOcYhPLl/+PdihX7ujS9KP4Csg6N4PqUfUV
	ITBNd+DS8BwMlTuTA==
X-Gm-Gg: AR+sD12XaeEB6kgEU9EhmyUAeIGaelSkytoxQjUczLOdKvIVXQiqt+scL26cFBStkc3
	uFTWYwGEx9JOe/RpmBhfkbadpvUTP8+liHeTZSFrfcPuIxMoM9Qn91Fwwk33VuYRelfFBMBJ543
	eOwIHoRhZOexY1uvDL2gvEBvkQ8EN2scgQSSpS9HnL7CqdtNKZwqdkc6938x1ohIsTLdFKKOpfp
	fg3vl9usFd9LIWIFTFSAQ4mBfh5YSz3f2bQS1P5164JBvXaX3sASmBJmOwWRWE4hcYF5HyTka+5
	1GPFJ7ZWfsx+n4P+Y783zd+tIeaRkjPeBlpKiDD1R+HmblICXtJkvLBbTPby7MYl70To+F92lYr
	8HgcR8tV4YdKMyk6eH4qk+6+9xOVgyDVdBs8wAXwavBMmBedYF3HznJI+Ik7QPaAluc3i8iP2EA
	x2RnH3f1bEYNKF3JjzVepfGtKcYJWW4DTURw==
X-Received: by 2002:a17:90a:dfd0:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-396d0fccf78mr591062a91.13.1787847163571;
        Thu, 27 Aug 2026 09:12:43 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-396b1832cbfsm1127393a91.8.2026.08.27.09.12.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Aug 2026 09:12:43 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfe48ca1efso144345ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787847161; x=1788451961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pGyTFP/ZSQ2pi6NB0HQ1eQMbojy+m9ryJYHVSeuqsrk=;
        b=FcmBbM5G4chrK/wzYf9EZ5K0EXvbzLWGgYIGnTq1FecEaJK+rF6o/m0VJjlEoYdXNl
         E0xCJPJzAm+K2nF1rm8goN0hnFYGE+nO0a4HsCdvYO+IdCt8Ekv0Yub2vw7HasyUx8dA
         nCt+X/Fsx7rwIU8zS16P0Dp7eoFzqYQ/tE0gY=
X-Forwarded-Encrypted: i=1; AHgh+Rox/WHprwUEXzqZrpFbXnSE5LOAzkcO58N+t1V/SoBGTt8XJ6iIAp9nIuRu695ifXDXy3NnC5P21Pvikd0=@vger.kernel.org
X-Received: by 2002:a17:903:144b:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d74dc2fe73mr1875615ad.4.1787847161619;
        Thu, 27 Aug 2026 09:12:41 -0700 (PDT)
X-Received: by 2002:a17:903:144b:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2d74dc2fe73mr1874475ad.4.1787847161104;
        Thu, 27 Aug 2026 09:12:41 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32854db74eesm11005486eec.18.2026.08.27.09.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:12:39 -0700 (PDT)
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
Subject: [PATCH net v2] bnge: add missing ndo_set_features
Date: Thu, 27 Aug 2026 21:42:30 +0530
Message-ID: <20260827161230.1724658-1-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The driver advertises togglable RX aggregation offloads (LRO and
GRO_HW) in netdev->hw_features but is missing the ndo_set_features
callback, so it is never notified of a feature change.

For example:

  ethtool -K ethX rx-gro-hw off

is accepted - netdev_update_features() clears the bit in dev->features
but the driver never reprograms the hardware, so the TPA engine keeps
aggregating and dev->features no longer reflects the actual hardware
state.

Add ndo_set_features to reprogram TPA (LRO/GRO_HW) and the RX ring
parameters when these features change.

Fixes: c2effd12c96d ("bng_en: Add support for TPA events")
Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Bhargava Chenna Marreddy <bhargava.marreddy@broadcom.com>
---
v2:
 - Sashiko's points addressed.
  Sending FUNC_DRV_IF_CHANGE_REQ_FLAGS_UP twice is safe and no DOWN is
  ever skipped. Reworking the handshake so if_change sits only at the
  ndo_open/ndo_stop boundary is a reasonable cleanup, but it's out of
  scope for this patch and will be handled in a follow-up.

 .../net/ethernet/broadcom/bnge/bnge_netdev.c  | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
index a4288f0258f8..13573a2b78ef 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_netdev.c
@@ -3155,6 +3155,9 @@ static void bnge_close_core(struct bnge_net *bn)
 {
 	struct bnge_dev *bd = bn->bd;
 
+	if (!bn->bnapi)
+		return;
+
 	bnge_tx_disable(bn);
 
 	clear_bit(BNGE_STATE_OPEN, &bd->state);
@@ -3267,6 +3270,44 @@ static const struct netdev_stat_ops bnge_stat_ops = {
 	.get_base_stats		= bnge_get_base_stats,
 };
 
+static int bnge_set_features(struct net_device *dev, netdev_features_t features)
+{
+	struct bnge_net *bn = netdev_priv(dev);
+	struct bnge_dev *bd = bn->bd;
+	u32 old_flags = bn->priv_flags;
+	u32 flags = old_flags;
+	int rc;
+
+	flags &= ~BNGE_NET_EN_TPA;
+	if (features & NETIF_F_GRO_HW)
+		flags |= BNGE_NET_EN_GRO;
+	else if (features & NETIF_F_LRO)
+		flags |= BNGE_NET_EN_LRO;
+
+	if (flags == old_flags)
+		return 0;
+
+	if (!netif_running(dev)) {
+		bn->priv_flags = flags;
+		bnge_set_ring_params(bd);
+		return 0;
+	}
+
+	bnge_close_core(bn);
+	bn->priv_flags = flags;
+	bnge_set_ring_params(bd);
+
+	rc = bnge_open_core(bn);
+	if (rc) {
+		netdev_err(dev, "bnge_open_core err: %d\n", rc);
+		bn->priv_flags = old_flags;
+		bnge_set_ring_params(bd);
+		netif_close(dev);
+	}
+
+	return rc;
+}
+
 static const struct net_device_ops bnge_netdev_ops = {
 	.ndo_open		= bnge_open,
 	.ndo_stop		= bnge_close,
@@ -3274,6 +3315,7 @@ static const struct net_device_ops bnge_netdev_ops = {
 	.ndo_get_stats64	= bnge_get_stats64,
 	.ndo_set_rx_mode_async	= bnge_set_rx_mode,
 	.ndo_features_check	= bnge_features_check,
+	.ndo_set_features	= bnge_set_features,
 };
 
 static void bnge_init_mac_addr(struct bnge_dev *bd)
-- 
2.47.1

