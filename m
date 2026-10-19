Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FC83438BB
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792374284; cv=none; b=ECBHxHhn/Onz/r/Bs+4sIYIokE4bgbt91SKyxuPNcDQrmrbAH37ScC5SiX8FmWaQFQCcKKLUyuLCdfLThbRcMo9gDKC+Ntdwt/5MaMyGpConSkX5lbOIRV38LSGjzoHkLKbDjg5rhR1lwc1w/Fk3QuMr7BDB1GuKyHUKyYYm4MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792374284; c=relaxed/simple;
	bh=a0J3FcO7C50B6i2a2DYt5WLB4X7g0vN0yPxqAQ4CJUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y1+158yaB/FL6n/wpAqJJzNo1DgJQXiYg6idtczVLoVtHJjx3Iv/32R5vs4A99wlQAX/Hlr9NNJMCLgfTsFMWfsG53Zxw8K0KuMzhO3QGWnxlRo0pV2rl48UZp+EjXXBh1usYLCDFTdi8DWA41D924Wagf7ar1DNauEtzuAePVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYLBjd+d; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYLBjd+d"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd632f7a4a1so472783a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792374282; x=1792979082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BwZE7jZHLNKMeHkPINUNIDY2evG+lo1XyYLgVhgwXDU=;
        b=XYLBjd+ddB0RCpfnTS41rSIFn77OvIgkjJsrnfzrPOs0C6bE0o2QvUBlLOAZkFUkZS
         JmeFm1SSI+crhNBm/lwTDWp3lIl4PmBq7XEPlQKk/1PTzUZTuAxVOeOISS85WppijBhJ
         lpoXdN1SYe+wTl6d5T6WDQVD6BTKpuCgQiq7SPCN/QY+zXvjOufaCERRM1FfN4tOouKp
         Ff16IRxjiom+ntaoCbYfSlcV4He5xXfFvAlqcl4rXZJrFTId4lO36SEoJVQZj2WxJiJ1
         WG9jNRwIQjCTYorG3sqtA/NQX8LavIR0GyozR+z55NgaX34BMJjgwETXhI7QdIP6bYD6
         +zvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792374282; x=1792979082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BwZE7jZHLNKMeHkPINUNIDY2evG+lo1XyYLgVhgwXDU=;
        b=HRwU/lrcaaQiRKs6sGyowRgr77iL8oYk/h6Ilsq4SaTXNTfieDoL1W6xd/06jAxT5H
         zNyK20KYbtLNlXgJdEcEiRwdAlR6l41ktN2yUATIg4wxPstDxD7vO4qR+LO1pRdtY2Hc
         +txzgPSLLJyT3ArTsGYwMzJRjM8DvrxT33dCIjlrZ+AOCHERaOVdNYD2jTaWtD/ZwiAK
         xKxj7UgWpcx2iFjg6aejYndu5yyOrKBsHGQlX1+HME66VTKhZW6jnogpIhc3hWkyq/Ge
         ME00ZDXBBTMFGJMdfWQhvNA6AcDOeAd0tG7Zru1Qbxct9kzE5QVhzDbEAGsU76A0CEID
         usSg==
X-Forwarded-Encrypted: i=1; AKwUvByCBC83itrBxXNgv8SGtI6FVY/K9eg3f5hPgBryVcT9ZaEeFcQ2FTDw0yk8eP7QDa7J1c20cdGMWkdPXeQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXMh02Im5Uu2NXOEQBNnvXP20H9lM8r8ruftfUPBWQrNjkyu1c
	STUiTD5/Lu+hPGqpNPQQTlPtr+pu0OZl1uisfyuQis8CscddtZ+8J31R
X-Gm-Gg: AYBFou2S5x2DCbqGQVKaTlasf+1E6QWHmo4qincP7EaxK78Mlyo1N/nK1ae6FSbQQpG
	q4MmduZ0+4FbphUwXWxeqBFonLjRdvVcYCXV6OXmEVVZpf9iWuPmmB0LyeJlmek3THNCZ+LTvOc
	uqWJ/XZseNv8+1/obRVRtv2+Bg2udaoSuUjv2kpjSM/VOd33TMmkqybCEQSEkRVz1UOaQv7wjH+
	Mb2QgTNd3iOEWu1uyWlqRL0s7uz7t6MBoHQATkBaZYZnfaMS1RxBZZzeqNEcRFQah3BmM/Fw/4e
	2k05sfsjT6pzG9QLI6LXXJirRuUybOJXjy1oRmfdd9pqdRf8psERcsJm13P/n0eHL2xqe2ZW6UY
	Vp0m0Hr57sJoEseM/i3TxJJcc+jjojldPNOUBS0HQZNKZYqO5VjcnyggTWnJAmdjwc4hfAG7mh+
	fXo+ZqQO+r24mxmVFSEu1dTSdQZQtmCeDIcj7rnHx7SONfhhHefTnJZo8XHg6GKbOT2T2YkyLgl
	Q/wbYiacVql1+Z8VrHaMGQ7tC9/Q4GnpUaBk3hqAaaBEHT2dI07PPExKwWLekhNTpOMpaYFE/22
	XdYUvS+qq1h8LilnxgA55c2puMBq5fAIGIv5aR1LA1XSX+no
X-Received: by 2002:a17:90b:4ac6:b0:39d:efa9:cd1a with SMTP id 98e67ed59e1d1-3acee280e87mr5676727a91.4.1792374281891;
        Sun, 18 Oct 2026 18:44:41 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad42878d72sm565608a91.5.2026.10.18.18.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 18:44:40 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Chris Snook <chris.snook@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: ag71xx: reallocate rx buffers when changing the MTU
Date: Sun, 18 Oct 2026 18:44:38 -0700
Message-ID: <20261019014438.199718-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rx buffers are sized from the MTU in ag71xx_open(), but
ag71xx_change_mtu() writes the new maximum frame length straight to
the MAC while the interface is running. The rx descriptors carry no
buffer length, so after raising the MTU the MAC accepts and DMAs
frames larger than the mapped buffer, overwriting the skb_shared_info
at the end of the fragment and whatever follows it.

This is reachable without user action: DSA raises the MTU of a
running conduit to make room for the switch tag.

Restart the interface when the MTU changes while it is up, so the
rings are refilled with buffers sized for the new MTU before the MAC
is programmed with the new frame length.

Fixes: d51b6ce441d3 ("net: ethernet: add ag71xx driver")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/atheros/ag71xx.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/atheros/ag71xx.c b/drivers/net/ethernet/atheros/ag71xx.c
index 8a3c689f6825..3c9de8c2ba64 100644
--- a/drivers/net/ethernet/atheros/ag71xx.c
+++ b/drivers/net/ethernet/atheros/ag71xx.c
@@ -1761,11 +1761,19 @@ static irqreturn_t ag71xx_interrupt(int irq, void *dev_id)
 
 static int ag71xx_change_mtu(struct net_device *ndev, int new_mtu)
 {
-	struct ag71xx *ag = netdev_priv(ndev);
+	bool running = netif_running(ndev);
+
+	/* The rx buffers are sized for the MTU at open time and the rx
+	 * descriptors carry no buffer length, so a larger MTU must not
+	 * reach the MAC before the rings have been refilled.
+	 */
+	if (running)
+		ag71xx_stop(ndev);
 
 	WRITE_ONCE(ndev->mtu, new_mtu);
-	ag71xx_wr(ag, AG71XX_REG_MAC_MFL,
-		  ag71xx_max_frame_len(ndev->mtu));
+
+	if (running)
+		return ag71xx_open(ndev);
 
 	return 0;
 }
-- 
2.56.0

