Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F294D47206A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 22:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790375211; cv=none; b=ItZwO/gYTs1IBXyOKoyocU0qO3mHEyz7bj6lDxugGrvSLzEGkt3HIH332FE77hqg6xtEzEH4XDMCiT1uVr/9k+txrdOU7+M/xY4pB0wTrAvo7iFOk6WNOCI+dU/55whKHHTsi5V4tiFd3t+dKDEqp/EuCDV7UxEohkogJ1JFnsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790375211; c=relaxed/simple;
	bh=pbG/AYM9kJMiCDDL1oq4EHAKeqkUEcL5mAGVpm4Ljf0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FfP4k9FhP4EpGTb0O4I2fZF5L7Q39Sa4BAZFWUX4b2c06ITeLKpNbt4r5Lmqtp+M19VW3Lk3SUxaXcIgPffqQ9/4pVvCsNTE0lf53fLx0nI0nljqNcJpNOJiA/booNBcXld06dcN08elVYOcMhGJbSOrtO4MlQq4yGmkAE/WKuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=monogon.tech; spf=pass smtp.mailfrom=monogon.tech; dkim=pass (2048-bit key) header.d=monogon-tech.20251104.gappssmtp.com header.i=@monogon-tech.20251104.gappssmtp.com header.b=epU7J9D7; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=monogon.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=monogon.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monogon-tech.20251104.gappssmtp.com header.i=@monogon-tech.20251104.gappssmtp.com header.b="epU7J9D7"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so8190935e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monogon-tech.20251104.gappssmtp.com; s=20251104; t=1790375208; x=1790980008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xVJh1LUOI1qqCZmZziafmPKKwrteIiiL63WKB73QvIk=;
        b=epU7J9D70dit7j1M5kkTIruzf4Isv1PkkPYxxgN4tDDXJLwnTGOKm1C/ID+kz1H7EF
         J/iJPV6cb32QfHQe9hpAvBGzdeqz6GiVnvQ5pgn+DHbE2zX1Oo+CA3NeMMwpj7Dg1q10
         Sg+6tNODoT3qLjRzP2YYFVuCJJJMlpSzx8yN5DS4jn3GrfnXHUW51EqrYBOLtTTsYAy5
         3lBHEIfKAViGn5+85sMlB/ZA9kIPPrzcZslTPkW40dIMAWPCeQSi0yr9f7+V1YM8ujJn
         mOJg8I0M0NXmHfh0yiGxpDPjOcrhPTFFOq+3CqeIGDZrIbGdpH8V1971YU672lVEGFtk
         rHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790375208; x=1790980008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVJh1LUOI1qqCZmZziafmPKKwrteIiiL63WKB73QvIk=;
        b=JHr4yCR89siwXX61CnG8ct7RF4zKZgu5A/h5NTLE7EsVmj9nTq+KUWl6qyL3ik7U4i
         5WvPjZ66v0NpMBwEYmzEF9ZOigFV3XubuNdoQJF7v5PZQPzssTt7QV/hXQnjCrhj1tOP
         Ah7fnEO9NmKPKpI8WW1J8T+rnCaVLf75kwroD+uQuDugIs945iEQmaDytqKMqFmazy32
         QULpkKL2G8v7NMzvNHq13CmwAInJFROtdkQwiCshpBMHMT17Qs5B35Y8IlQaVk4w+2Fl
         wNO3I9zIo/MIb61zTFN0clSH84iLysdvWL6MSax1msXGWxHoUPpH5ZsdZ4Krl1qeyrOg
         oeAA==
X-Forwarded-Encrypted: i=1; AKwUvBw1L1ggw7Oqgl1lH4W0dnipeesz8faKnxTm8kzYTjRddpn3bEd/7ISFAJlL7646BuwDeQjkMShBt2t8sZU=@vger.kernel.org
X-Gm-Message-State: AFuF++nvgSyNMTt97VcccZFDDN+//vOLxOxurHcHdTKkgMgDVcgB3+yL
	aJAffI3NlriHbSpZt3W1neZSok/2RUXKA9oDEumCNSZWgJLDTIamYrOZmI3gqIcM4BI=
X-Gm-Gg: AYBFou3WpD0yX/m1BmAMrj7Lmt6qxw5xaQRCxV+ZeQx3ndZEsr38VWKjfS3hEbGiCHo
	pF2E1W8H9IZB3KsIYn/e4O+ms6UvVTiS+FycYrhTdZ1fBf7DCsgX6lLKBqBUV3ax+HvJU8wt8p8
	8wOR6DruAHAvfwOn6euWsKoNXNs5JNlzvATSZ85phhq0jVfTl0KU3uzELROqRwqWgAShs6Hc4N4
	Xl72qjmN+UIJ8I7eFM8OsCQk9vt75XXhUb65fsoFAUHo2zkvnSAdl6sn/X39psroM+x4bMxPDb/
	7wGZFZbS3w+boArTAEdy4WDys1lbKzyZJDnNkPyggbJUjSzb3Fg4zO6YsJT200nujyN/aoYV6uK
	ik4zM8FGZJufc0x7Yc46wB/uAhxaM+xfmt2YeAHVfFOsX9o2kv0sWn8uHw6kPy3VvYSwxtLpalA
	rLH7DFhTK9OhBegfWD8U39Aq2kBqDoiDiB1tbTja8kZ2l1p3mz2je1KqowNeUPHjehMB2imCy4P
	Qm46prFug==
X-Received: by 2002:a05:600c:468d:b0:49f:f9d1:e618 with SMTP id 5b1f17b1804b1-49ff9d1e6b1mr6117185e9.17.1790375208314;
        Fri, 25 Sep 2026 15:26:48 -0700 (PDT)
Received: from localhost ([2a02:21b4:a206:6d0c:a5d9:765b:ca48:8993])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fe5cd4271sm260036395e9.5.2026.09.25.15.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 15:26:46 -0700 (PDT)
From: Lorenz Brun <lorenz@monogon.tech>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ice: fix pktgen crash in eswitch mode
Date: Sat, 26 Sep 2026 00:26:44 +0200
Message-ID: <20260925222645.354053-1-lorenz@monogon.tech>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When pktgen reuses an skb on an ICE port representor, the representor
forwards it to the uplink through dev_queue_xmit(). If the lower qdisc
retains the skb, a subsequent transmission of the same skb overwrites
its list pointers. Dequeuing it from qdisc->gso_skb then dereferences a
NULL skb->next in __skb_unlink().

Disable SKB reuse for this ice path to prevent this.

Crash signature:
   __dev_queue_xmit+0x5c9/0xf20
   ice_eswitch_port_start_xmit+0x83/0xd0 [ice]
   pktgen_thread_worker+0x82f/0x1c10 [pktgen]

Signed-off-by: Lorenz Brun <lorenz@monogon.tech>
---
 drivers/net/ethernet/intel/ice/ice_repr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/intel/ice/ice_repr.c b/drivers/net/ethernet/intel/ice/ice_repr.c
index 096566c697f4..2603cb0f6a54 100644
--- a/drivers/net/ethernet/intel/ice/ice_repr.c
+++ b/drivers/net/ethernet/intel/ice/ice_repr.c
@@ -305,6 +305,7 @@ ice_repr_reg_netdev(struct net_device *netdev, const struct net_device_ops *ops)
 	eth_hw_addr_random(netdev);
 	netdev->netdev_ops = ops;
 	ice_set_ethtool_repr_ops(netdev);
+	netdev->priv_flags &= ~IFF_TX_SKB_SHARING;
 
 	netdev->hw_features |= NETIF_F_HW_TC;
 
-- 
2.54.0

