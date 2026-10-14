Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329C12459CF
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791936820; cv=none; b=Gc96aAoKWsk4E0neIuT8/AefzOjrbNImPENLCwD4vgBPpasTfYs9smf4oPuHtpru66X4nXZuzuf5xGNaFG/BpzAyF3F4fmZAWFb5EYHiNS9ps/we5iPdIJS4RNhwp4vZuFrmIBBu88MGfpJQgK7VE6HHJp+704dSpmgrU2itxkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791936820; c=relaxed/simple;
	bh=Pk4cVGh0jjW/kLfS4OKxW4nT8KVSwSEC2IoukbeQcwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L8w0IpJ1aEawHt0DJYaiGZeY0jXVWe5J8uO875CfeauI5NPjmpJZ0qrBpGwExl//E5gdzxIz0mdzV9bH/AQ64dBKPdOJ5xTs9PhepRAu7w/6ME1VbGdNVEU2onOCQZGsRGAAga553ZrMWAXBNJeYZjkgBBaTglHbFIqFoH9jGV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKGb0dtb; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKGb0dtb"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-17bc533fda3so442573c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791936817; x=1792541617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gdl5lSwvs1BvirX8ZMQMXcZHrn9GDzZQxUX+cxMM3Ro=;
        b=cKGb0dtbiw4NezQqNbnQxlXNErXxK9H4a4XjUyD1wr5Ikf6WMiQEJ1d3cKG7axMx9K
         EkT6bo/Ahm6ugsKnA5K+eWd5I1Z5vKzURzj+n+uAZVSrIFke0mw8wCjxato/qv3M3RD9
         U7wvWnwiZ1bXduv8BJh/kTAaUEJWUzCX/BOw4xrYz0/vprCwwe3cYDO0JP6ohqmBYp36
         yM0vw2lsb3CUVrNZeMlxnvNCVk9qcYsxtKMAUUDFRUnL0pzBS/7cFi8Mt/pbKUcHJAcA
         KnH6UdpFqFwFV0LhihONYFs5WM8ygsLeiUV7pha5UUO/W6rY8yleDcDN8xscNYJZZxWI
         QGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791936817; x=1792541617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdl5lSwvs1BvirX8ZMQMXcZHrn9GDzZQxUX+cxMM3Ro=;
        b=SOeaukIUgrsaGlkvfAe1jZZLhEoTONKZz93+U2pKtjeb9SSSzf6jNl3KGmJom7huYF
         xAvW6JR1/oFmVZDMODWz3PbqCYP3AjBMpOmgUjUicFA3ZQI046bPki376e9YSgzXWR5L
         fjcCE3ZIy0erIa8JweTiF9RBDcIHaThVPzPQOvWjpmJkAzKV6l26A/vCaMOHsVqL/MVs
         ODTKKkBkkg6gW9BRW2xaEoxezkc3LNukiz0o/vJVtFw72txNisGsooLJcik31v0PLOlj
         jCxEYxNMSExCNmHI6tN3gC0gQc5zQHlNjQF6q1Lv2em6HLfILU5DQM7Cab9/N8eQkoJt
         Hi0A==
X-Forwarded-Encrypted: i=1; AKwUvBwHPBRx6fc2a1Vg6kLzy3mP0+4zjNgt7cEgc0717z8ZIivmljGOI5ihwt7SX0N16dgQ49Jmc36z7ztbuS4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIF9Retv9zVrUK9HkCq5c/UKPwzD3tpHUww3FJEx5G9OA6+I8tj
	0+yWQgpoBAlaMsgTIsusicoQufiBOGkpgDaIcSpCk6nzQDN3Xez4bJYH
X-Gm-Gg: AYBFou0DK1XLckJI14KSutQqXPiqpjQIFx16vEw9Y1fFUT2t57nVevytGjJetLCgUqn
	elEqvWksYndQ60Ql2sD0vhcwNZSLGxKP+s/gXgAZHpmrerHUCmAjIupXWxnDG5uInuiLGxDBp0s
	gnOg0lkvnQZ83nEKb4Ba5WquqnoCRx7Q0ti2CmbcukWjSs1I8ZaToVKMp6NyWv27UynLfN5txM/
	jdNPLzL7bzq6d5/WyniQ9XdKLdTHO2IYNRFo4JSKlinAWQhe0ZRz7gNzhzdrV1jODV5ivmHhcSF
	qb884rrZPMtCR9Jxgo5ddIu9vQKwj0EXrui/1VhEbBUqE9gB6dZw2/idV3K7ialnTbFMOozdH2x
	+Dczi0rW3DQ0dmqmkBx0H+XAP4FnMOiQ6zSLXEsdnklVzdNECMhr28PxWXKkxOaaJ1Qcj3L+1nP
	Rl0MJ5DG+lmepcfIuf0dyEEaGYGYLg+MAeBFoghAq5TCowQtwHVhlijubkhBLWjLVqVpcsc62ny
	fU4nmJbAjE05djAzFwBjPU1oYuRG2BlrHYZVbzoW5zmFhrV4oAjH2GNx/4E1vz0LfAJ/jRYgdIw
	vcvXVDWb4BQ4Lk59H1ot7E3UuhpSw3u5YaLjTGpQpEykOzeC
X-Received: by 2002:a05:701b:2807:b0:144:eaa7:2763 with SMTP id a92af1059eb24-16a5e49fe15mr19365662c88.16.1791936816962;
        Tue, 13 Oct 2026 17:13:36 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6f5csm40553750c88.11.2026.10.13.17.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 17:13:36 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Chris Snook <chris.snook@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next v3] net: ag71xx: align the IP header behind DSA tags
Date: Tue, 13 Oct 2026 17:13:34 -0700
Message-ID: <20261014001334.132962-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The receive buffer offset includes NET_IP_ALIGN to get the IP header
aligned behind a 14 byte Ethernet header. Most ag71xx devices use DSA
switches whose tag sits in front of the EtherType, which moves the IP
header by another 2 bytes. Every access to the IP and TCP headers then
traps and gets emulated by the unaligned access handler, around 6 times
per forwarded frame.

Take the headroom needed by the DSA tagger into account when choosing
the offset.

TP-Link Archer C7 v2 (qca8k), median of 3 runs, Mbit/s:

                       before   after
  routed up               743     855
  routed down             660     749
  local receive           554     572

The unaligned instruction counter no longer moves while forwarding.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 v3: rebase and fix sashiko warnings
 v2: rebase and add Reviewed-by.
 drivers/net/ethernet/atheros/ag71xx.c | 28 ++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/atheros/ag71xx.c b/drivers/net/ethernet/atheros/ag71xx.c
index 8a3c689f6825..73b5f8020ece 100644
--- a/drivers/net/ethernet/atheros/ag71xx.c
+++ b/drivers/net/ethernet/atheros/ag71xx.c
@@ -38,6 +38,7 @@
 #include <linux/reset.h>
 #include <linux/clk.h>
 #include <linux/io.h>
+#include <net/dsa.h>
 #include <net/selftests.h>
 
 #define AG71XX_OOM_REFILL	(1 + HZ / 10)
@@ -1396,6 +1397,26 @@ static void ag71xx_hw_disable(struct ag71xx *ag)
 	ag71xx_rings_cleanup(ag);
 }
 
+static unsigned int ag71xx_rx_offset(struct ag71xx *ag)
+{
+	unsigned int align = NET_IP_ALIGN;
+
+	if (ag71xx_is(ag, AR7100) || ag71xx_is(ag, AR9130))
+		return NET_SKB_PAD;
+
+#if IS_ENABLED(CONFIG_NET_DSA)
+	/* A tag inserted in front of the EtherType shifts the IP header,
+	 * compensate for it to avoid unaligned accesses in the stack.
+	 * This is only evaluated in ndo_open, so a DSA tree that binds to
+	 * or unbinds from a running conduit takes effect on the next open.
+	 */
+	if (netdev_uses_dsa(ag->ndev))
+		align = (align - ag->ndev->dsa_ptr->tag_ops->needed_headroom) & 3;
+#endif
+
+	return NET_SKB_PAD + align;
+}
+
 static int ag71xx_open(struct net_device *ndev)
 {
 	struct ag71xx *ag = netdev_priv(ndev);
@@ -1410,8 +1431,9 @@ static int ag71xx_open(struct net_device *ndev)
 	}
 
 	max_frame_len = ag71xx_max_frame_len(ndev->mtu);
+	ag->rx_buf_offset = ag71xx_rx_offset(ag);
 	ag->rx_buf_size =
-		SKB_DATA_ALIGN(max_frame_len + NET_SKB_PAD + NET_IP_ALIGN);
+		SKB_DATA_ALIGN(max_frame_len + ag->rx_buf_offset);
 
 	/* setup max frame length */
 	ag71xx_wr(ag, AG71XX_REG_MAC_MFL, max_frame_len);
@@ -1874,10 +1896,6 @@ static int ag71xx_probe(struct platform_device *pdev)
 	ndev->min_mtu = 68;
 	ndev->max_mtu = dcfg->max_frame_len - ag71xx_max_frame_len(0);
 
-	ag->rx_buf_offset = NET_SKB_PAD;
-	if (!ag71xx_is(ag, AR7100) && !ag71xx_is(ag, AR9130))
-		ag->rx_buf_offset += NET_IP_ALIGN;
-
 	if (ag71xx_is(ag, AR7100)) {
 		ag->tx_ring.desc_split = AG71XX_TX_RING_SPLIT;
 		tx_size *= AG71XX_TX_RING_DS_PER_PKT;
-- 
2.56.0

