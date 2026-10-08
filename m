Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523413932D1
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 02:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791426565; cv=none; b=lYSMbHhxoVzHmoIsLyKSd2VQvTHdTGa6ovYeOjXRa3vJ1A8oR8Jj2RoJ5aVCkEBtr62WEhKcKLJerku7A1kKakUDdQpOt399X4fwoPGh5uypRPyzdCEBkv8TaPpRwTGYHTgGbAMVZKu3az+Kbr/k4X10A7GZb4h0YviwSh6Jyqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791426565; c=relaxed/simple;
	bh=8g5sVw7LgI28H1lF/6IkIvLtR3BzqkWWOa/ZXwuoDos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aBL2P6b1wZovkN5J0VUTTjdBvTKdrCJjufsp4y3S8ZHoqqjBM4KCukQaC05Xt60b+OO/gj/eZCjN8vK5KUQEuOgdOYZde1xXGRePp/uiAamm5Q9XfFGNpLsW0yzrUP+hWL6tsFgF8gjd89RwzoLr0wvWtGiamW4rCuXyU5ePbSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZqIXa+t; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZqIXa+t"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e81738d24eso308515ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 19:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791426564; x=1792031364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ix0mpplBwU1S+BIW8OSYHid9teBN6VPfjdXj8f3U0XI=;
        b=QZqIXa+tqg05b4O/exwhqqu816h2ZCXRW0nxbqTxDYJAkIjjJllZ1Nsgj4ghjN/vS4
         wGtLhpgB4iTM0nbSSRYwPhPz9fUvkvU9/ftF73M6ZlKBo5VOwy3gYgOxlcr1dV+9FrdP
         1TfHUQ6D6axiyMEMTak7MlCUPAt8/ZV1S5/ZcHU6neNcK6eXaFll/E7mOQAHr0tqucow
         jVls1lMG1m/nFBITiVSucwdgvC48WrkZljOnjGvCIk02UKBgBvUPfI0EVoq6ocDA7xRl
         YUb0qdCnBiA9fdENhFLkxyXumLz9QlCsEZjufxqm9FbaGI74vWlQp8PDFDkja1NK/1L0
         CM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791426564; x=1792031364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ix0mpplBwU1S+BIW8OSYHid9teBN6VPfjdXj8f3U0XI=;
        b=2f+5vxhIXgeicZNYTvJaaVa01pkyBfwvSy7uD3aNJ0xv+VBweTjlgkZ1DR1OZ6fAIa
         dLk22F1z2C9Wbg/aDoLk3kWDz0FQhM1JQH+Lh8sDgE/UM+cc8BOqs+VenivUm63/bl9V
         zloCxevQ1pHc+auHV9vV16YTlX5jhvxz2JdIZ/rV965r8jnsgBRDksf2mQorb5Puw9kb
         L5VfSAS/Cs+s3gwhy+A+sTCetIi9nIalN/bLvK8caEGvNv1/eBXYrSRepBfZrOYjsh/v
         xWbZCTI+zsGo/ozG2fDkKKM3t3zH202G/CbK/6TWq2vQnYkSgiFLMMexDXtK4VrLh5JY
         VCTg==
X-Forwarded-Encrypted: i=1; AKwUvByKbftdx3TyUEH9m3AaZsGXlCxrhdZnJAK0h13LsH/81cr4276CceoZ5glqwP6kwznYp668CqmmdSci2Y0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4OSD5ZaTKZ/z11Tg+LLc2K5vQlIat0XA9nY+CEHaKRFFhQXpI
	2U+MD4cn4F7l6spkqJ+M/CzZ2YZ/9G1P4HPYjhMrYBCAaSUIXjN1cYCn
X-Gm-Gg: AYBFou1pETdOCPn5B8s9AXmoIXOT3RlN6hN7JtP7Qjqo2HT41pXHSyA7GLvhREHf4au
	h0ywt6tAm4e8NVlm8iu9WNWNJbOStwPP9qX7T06FjuBLIQwFRLGAfrUVZ6RMCAnMRv16T9ANywA
	kw34svpWuDNQoAdisCfZADh6/Awe7U4VVKNWLDckVj7h238Jc1nnAgu3Wpkn7LVHIQzrjln8bhn
	v69HREgJMvUvA0L4wDc3vNwvEaLAJo4XV47wMa6JzdxCKLSyWWm1x3wPLqWaeJEgegXJrzOieNt
	7jEcETFzOyDEYG22YsKhV+yxNVlk6KQsDeizQbgZNv5Jxyrqcb1PrH5L84jmGvFPKPaBF2o0v2G
	HBgYBhRTslNSJUOqyTqzWv9JSWG07EWPAc03N98uJc1TYj96sjksT5XljC73oKzOYE/pQf/gVGh
	a2w1/fjoKXl3gRk3pm4ub2ttKzXD6TLteHSv0p/dfn72C8UvLR5wk9Z3P/Urts1B0VA3pLzUzYl
	Tv6wJsfbrQtVwgf4KyNReAc8w==
X-Received: by 2002:a17:903:2984:b0:2e7:4a2f:68e6 with SMTP id d9443c01a7336-2e74a2f695cmr13802655ad.39.1791426563684;
        Wed, 07 Oct 2026 19:29:23 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60482cab0sm18045865ad.50.2026.10.07.19.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 19:29:23 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 10/10] microchip: lan865x: move setting of netops to fix crash
Date: Thu,  8 Oct 2026 10:26:52 +0800
Message-ID: <20261008022656.3592191-11-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008022656.3592191-1-mmyangfl@gmail.com>
References: <20261008022656.3592191-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lan865x_probe() assigns netdev_ops only after oa_tc6_init(), which
connects the internal MAC-PHY through phy_connect_direct().
phy_attach_direct() -> phy_link_topo_add_phy() reads dev->netdev_ops
through netdev_need_ops_lock() since the commit in question, so probing
crashes with a NULL pointer dereference when CONFIG_NET_SHAPER is
enabled.

Assign netdev_ops before the PHY attach, as was done for emac in commit
7c9f391ec89c ("net: emac: move setting of netops to fix crash").

Fixes: ded86da4bbb7 ("net: ethtool: relax ethnl_req_get_phydev() locking assertion")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/microchip/lan865x/lan865x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/lan865x/lan865x.c b/drivers/net/ethernet/microchip/lan865x/lan865x.c
index 26a2761332a5..633d00857774 100644
--- a/drivers/net/ethernet/microchip/lan865x/lan865x.c
+++ b/drivers/net/ethernet/microchip/lan865x/lan865x.c
@@ -346,6 +346,8 @@ static int lan865x_probe(struct spi_device *spi)
 	spi_set_drvdata(spi, priv);
 	INIT_WORK(&priv->multicast_work, lan865x_multicast_work_handler);
 
+	netdev->netdev_ops = &lan865x_netdev_ops;
+
 	priv->tc6 = oa_tc6_init(spi, netdev, NULL);
 	if (!priv->tc6) {
 		ret = -ENODEV;
@@ -397,7 +399,6 @@ static int lan865x_probe(struct spi_device *spi)
 
 	netdev->if_port = IF_PORT_10BASET;
 	netdev->irq = spi->irq;
-	netdev->netdev_ops = &lan865x_netdev_ops;
 	netdev->ethtool_ops = &lan865x_ethtool_ops;
 
 	ret = register_netdev(netdev);
-- 
2.53.0

