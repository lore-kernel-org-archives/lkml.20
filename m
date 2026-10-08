Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8C53B6C16
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 03:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791431486; cv=none; b=kUJlKpWdg1VWt6rk7UrCpkah6pRJvdPlr8swsLL8uLNMyX4jCg3kWduMZxgcpoEmFcenNiL3Zvm3mpAMgGggIUqDZri+sISxAZ2oRokBEq2GrecUijYd3lHHycHjfXEER3uh4+Qafp6JfVnxrn4FPuEZtZN5y7t9FxOuwE/978k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791431486; c=relaxed/simple;
	bh=xhLkSd1D9jfqTLozRjJgJWeln/Fczbg9IndjTnOzr0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nIYGf7siiGJUXSY8SKgXgFT3fSiGnL3jaZSWJiFDAt5qemB8fN5FHLr+yBoYVTsL7m2HF0sb6mNROVmt585mz0NckA76itqzJAmTEZy+OVt0p0niRjIQSNU24khSF2EkzIuO1Hial9V7OhD2kN4D1NAgThe2ThiUm2fUvUmkU8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a54SWN+T; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a54SWN+T"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc50ad2d650so1537118a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 20:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791431484; x=1792036284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6O+xEMq4ZI9MDp+iEEfqaVQlLs3dagod9S+W0ern5k0=;
        b=a54SWN+TAZan2/IpvR7DqyCuP67wX4RgfOJFJEUoS1xkI7rFfEhC3/gUNUv+qUhDI+
         FY0b4R+JQu4aX2D2pv/Xn05uG5qOmFGbv3rD7EYhmWBxcvtGcczEKDXUInqNNXPW9uO7
         zqQozt5amOGeRKg0qEfYE11sGSXHHfhufSn8DRgYEydfPec/PnBfHIM+OX7UX+YY+U8n
         89iQ8KUSluoQkc4gcsfsZ6FwciNT4H3whZDHc5iaBgTASzkeWol7ThkWA5WdtE9A/je6
         7k98N3Fo8PUsEf4pyZ2IPNy8SfXijaHKW3qXbwY3A5Q9NO3hWpSAHLe8w7+Xz48WQesC
         pE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791431484; x=1792036284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6O+xEMq4ZI9MDp+iEEfqaVQlLs3dagod9S+W0ern5k0=;
        b=rjiiBIaGumITOTxH9XgB8/NBzAkuvOE3bSr6k8kiNJzC2lsEjaCVMpdLhToeigtqra
         WZlHlRiN0L8xKgfZth5PQzIHawHsTJUAyFlOOl5wu6v4HZzKsVf3emchrKiJiLLMnkxQ
         oAjGNoYsnDnNpElSyuiL8FDE9UwFyY+x1we98wM1mxj6FJV14RZkSZL7y4TmApspsO0d
         3Qq28j85+UkOfoYQFNxzM0o2wR5NW6VdswI85dDVIUnccoljwNAz1h9zFipPydVdSqwd
         NlEwZxFzdE4bYk7684pnZD8TYyB+H/mw/D2C9h7Yq7g08zAftgQirwT3VTGTD24fCtxz
         Zb6g==
X-Forwarded-Encrypted: i=1; AKwUvBxfujLFST1HWpfKDQsOyQoM4Y0uzOBf0CIwdD4xzm4/RujP9bZB2cUdBmJF6Y+RIUrgrrTCZyybPCEOAD0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLl+WbaDVp6Cp8yFGv4bjfl54BfzRvGYtE7n/sNZvnOSWDcvvHS
	AsMLaP9XQPQbGUH4Web4Gvooywn5vCOpG/uMAyGqzNbc1ylhBaeWXYVV
X-Gm-Gg: AYBFou3Z/TgPYn+wsJmREVbCn2FeJJk7Fz1a1AIdUQsx80iDWFul8/hXAY7VhD37uKO
	O24FGZKOWZUFe+yXtH6ncZ55AKf8gA35xckQcqMDZEg/jt6Is5S9XOwQYONPT9ckqfRBfumPEJo
	li4ZmDMjf08UrTqEjloqUwpFW0y0eY0kRwGAixJ50kwshx5kl52d5zYP67sWK9316Yobce0Ukv8
	7Ht9kBjnOBUE2eb9yN2nZRiDYmQ04tmADZ22P6UIjXKFTbhVUtZtuh5lbMDM/DlxHhYXSGgR5Nx
	1ava+RqB1aWEmMsjkvfqPOv/lPSrGURDVDXbZzOksw2W1aeXp7haIO8b1JLIIMmaMt/EGv0aXQS
	TZLzt7/fUSsIW6yz/xsoMbM7OJ4JkWD22oiGO8Ep1nELGrdRvsQe2MSI63EgLaakyX3jS+LHsQ1
	NfeGnEZrayZ7efaqZO47MYQslHDWu9hdrC5e3FQ+CNP1X3G4BMYf9Rr/f/QwQ3uY0nJHUlfgaYW
	vhfYVTCWSm+RjqG0kSOjUWGeNI92ojk3ivW0EpEdt07lLW9tyCoNm+hOXgIsG+j1KlizC3uqpXe
	Sr0QngTo6zK2bolktHxqRuy8LC0CU1DviieGdG1iAJPmyzyk
X-Received: by 2002:a17:90b:3d90:b0:3a0:8050:2ed1 with SMTP id 98e67ed59e1d1-3a8a14f00f2mr3686274a91.63.1791431484358;
        Wed, 07 Oct 2026 20:51:24 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a50d32sm2199520a91.2.2026.10.07.20.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:51:23 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next] net: ibm: emac: size RX buffers for the MTU
Date: Wed,  7 Oct 2026 20:51:22 -0700
Message-ID: <20261008035122.3182851-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Any MTU above ETH_DATA_LEN selects the largest MAL buffer size of 4080
bytes. A DSA conduit always runs with a slightly larger MTU for the
switch tag (1502 for qca8k), so every received frame then uses an 8K
slab object and a 4K cache invalidate even though it is at most 1520
bytes long. Size the buffers for the MTU instead, capped at the MAL
maximum as before. Larger jumbo frames still span several descriptors.

emac_change_mtu() only resized the ring, which is also where the jumbo
mode and the APM821xx maximum jumbo size are programmed, when the RX skb
size changed. 1500 and 1502 now share a skb size, so also resize the
ring whenever the old or new MTU is a jumbo one. Otherwise jumbo mode
stays off and 1502 byte frames are dropped when the MTU is raised while
the interface is up.

Routing a single TCP stream through the qca8k switch of a Meraki MX60
(APM82181, iperf3 median of 3, A/B in the same boot):

          LAN->WAN   WAN->LAN  (Mbit/s)
  before  538        476
  after   564        498

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/ibm/emac/core.c | 7 +++++--
 drivers/net/ethernet/ibm/emac/core.h | 5 +----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/ibm/emac/core.c b/drivers/net/ethernet/ibm/emac/core.c
index 248bc49ba8c6..1d2668905dcf 100644
--- a/drivers/net/ethernet/ibm/emac/core.c
+++ b/drivers/net/ethernet/ibm/emac/core.c
@@ -1116,8 +1116,11 @@ static int emac_change_mtu(struct net_device *ndev, int new_mtu)
 	DBG(dev, "change_mtu(%d)" NL, new_mtu);
 
 	if (netif_running(ndev)) {
-		/* Check if we really need to reinitialize RX ring */
-		if (emac_rx_skb_size(ndev->mtu) != emac_rx_skb_size(new_mtu))
+		/* Check if we really need to reinitialize RX ring. The
+		 * jumbo frame settings are only updated by a resize.
+		 */
+		if (emac_rx_skb_size(ndev->mtu) != emac_rx_skb_size(new_mtu) ||
+		    ndev->mtu > ETH_DATA_LEN || new_mtu > ETH_DATA_LEN)
 			ret = emac_resize_rx_ring(dev, new_mtu);
 	}
 
diff --git a/drivers/net/ethernet/ibm/emac/core.h b/drivers/net/ethernet/ibm/emac/core.h
index 0e571475849e..8f8b75eaf565 100644
--- a/drivers/net/ethernet/ibm/emac/core.h
+++ b/drivers/net/ethernet/ibm/emac/core.h
@@ -56,10 +56,7 @@
 /* RX BD size for the given MTU */
 static inline int emac_rx_size(int mtu)
 {
-	if (mtu > ETH_DATA_LEN)
-		return MAL_MAX_RX_SIZE;
-	else
-		return mal_rx_size(ETH_DATA_LEN + EMAC_MTU_OVERHEAD);
+	return mal_rx_size(max(mtu, ETH_DATA_LEN) + EMAC_MTU_OVERHEAD);
 }
 
 /* Size of RX skb for the given MTU */
-- 
2.56.0

