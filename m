Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA902DEA61
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 02:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791426539; cv=none; b=ONvEdFniWILKV1+EWOekbFDqEwLt8k+DRbdd6gBS9TkjBcTXVXnKIseaf9zOHZnbjOjf3iIijy6SojQtnr3Zu/GMWpvVko3SAuB1qZSwDEfACCDywy2jfoLIBaHzRSJs60LCioteFthQGuRayu1l7B2L0BCmfmvUjlBiqiM/fZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791426539; c=relaxed/simple;
	bh=CFLOuVQOgam3jkBVURC4w92TAktjOLOypT6fEBEUKiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=umJxN1TNyxlUSQ42nZ8nXD6to3dtrrFvBlISodWCj6eCBsU9PeUT+7oSrFrTEGgNl6i8h4Y/w1gNuH9YawCqvrOb4cbCysRjNV1h2JIGSPZ/SZoyWAhm8XY28jFKvlxROCQ1BsJLes6WU5lDSTzk+S0pau/QxxPFXlCw7F855Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RumpQAW5; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RumpQAW5"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2db18e5cb56so21293085ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 19:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791426538; x=1792031338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MPbrsivg4lBVveFygK2YCavyoi4TzFrSrERw+gfW+Uw=;
        b=RumpQAW5BUEc5j6h/3j5q0X9OQFLl+RJb7Qc+TCrVNM45krK6E/NrQNW2haC23maI8
         QKfpcwNFsj+d8pBOd+gV5pWH7fBkTXlv0VFrHwUS5UKp7sLv9/gnPxSYU8yf9xxHVvUL
         6Wcg9Vr99Eq1Is5eljE8JI3SQllkcqsg643ShGS36CwYi5dKQBYugdqts/W2V+TErb6E
         1XaKLuCkOpH1iqK7xDfCerguMCpts0IQFar9q9b3Lg3QTzuNIQP3sdArdo6xVOOE9RSO
         kWhraCQn9VenWKuRQRFVzsBBU3ihTqK0ZSMZmIWGQOLME+bVsEg1HBAeswb6GJqAojGa
         JXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791426538; x=1792031338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MPbrsivg4lBVveFygK2YCavyoi4TzFrSrERw+gfW+Uw=;
        b=kM0iV7DQcFzLbzs2bNwRHKyCNHlwEPLi6tYmsgoLj8CRs2O2WRaJczmvNruvWA3nHP
         TF9OxfDzgD2bFY4Kp6ZkyY43vfMrr87dCD5i975FqhvE7m+zyP9B02//T8FwmgzIPhCb
         xYa4PVBJSNsa6E4CIVudloPpj5OY6tg9834nhowKN+6+cEWItvkeK5GkJ1WugwFjGjW3
         mXPEbnJEtaj3KH9bJl9tY0JOKcq4l81UYArd5ULv+EzB6p++Hrs8DB1YbCa6suGCdVo9
         1OndEcKQh6prVnqkYyuxMSaMqCsA5AG30G1/v8iliR7KDO8j1wIDD294lteYxY7QBxUG
         tYcw==
X-Forwarded-Encrypted: i=1; AKwUvBxc7PEais8/jTyaT4cbPx49PbQKCb1xfMyHjNVYlJLdYSEUXv7wrTJTz3twN81p7bLde6Z/UXQSRxvpTq4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLF67ZelL+suEQOvrNdrhRa/bIN4laSHQHtx+Rqkrids7VrRb6j
	DALmAjoegHFThG92i8aop7LHXyW7PeK8tNqdg3RcexIdxRYOxwBsyJxY
X-Gm-Gg: AYBFou0zZQv81Su2hulEPDqpTNdmSObmmQs5eOsrr8qNfcADRKont28mysmve0w751T
	J2+7adduN8kjHbz981m470mHNQY9foAIlg79zcOrvCGxmiu8ZZcBzscVQEVqL+Opds8FrtUErt5
	KGTqQ3xFRAFmMUL0spUZ3ohefIhXV4plY0p3RHeylBypeUgKwuD3i8cEdAYB0HF+hWtqpmI0Iin
	D/QP7B/ZBEqkjKjMQ/P1YY9YU9RzbRQUGvZwNK54y2mz6dTh4kItq6rJGfk8PKU5jSluRkgD/4w
	eYp9+OohgC9hlLJDbXOyfF2LCgQvvfGYD4fVhzFJVaWGoXHZ+re9zx+1M/wnmGSC2+6jJpzsbkq
	fHeLLLClnirZ/2J+HF8GPK6wuzDPm7g6ClBSrS/MdKJcCBd9546/r6rvJWKnUDxCnVCX5cKx3IQ
	Dubu2XjLrLr6cVKTccTttnmfx5vAHaX35P2woET7tYOEkBfzrELdlP/h9lE+YRr41v2ecU24wAd
	uCUQoqkvVeS2KqMa5DOCGSTBn8TmXqkRosi
X-Received: by 2002:a17:903:4b03:b0:2e6:1828:59fa with SMTP id d9443c01a7336-2e618286095mr22273805ad.18.1791426537739;
        Wed, 07 Oct 2026 19:28:57 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60482cab0sm18045865ad.50.2026.10.07.19.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 19:28:57 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Ciprian Regus <ciprian.regus@analog.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 04/10] net: ethernet: adi: Move setting of netops to fix crash
Date: Thu,  8 Oct 2026 10:26:46 +0800
Message-ID: <20261008022656.3592191-5-mmyangfl@gmail.com>
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

adin1140_probe() calls adin1140_phy_init(), which connects the PHY,
before netdev->netdev_ops is assigned. phy_attach_direct() ->
phy_link_topo_add_phy() reads dev->netdev_ops through
netdev_need_ops_lock() since the commit in question, so probing crashes
with a NULL pointer dereference when CONFIG_NET_SHAPER is enabled.

Assign netdev_ops before the PHY attach, as was done for emac in commit
7c9f391ec89c ("net: emac: move setting of netops to fix crash").

Fixes: ded86da4bbb7 ("net: ethtool: relax ethnl_req_get_phydev() locking assertion")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/adi/adin1140.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/adi/adin1140.c b/drivers/net/ethernet/adi/adin1140.c
index 93710baca151..ca96a919c24b 100644
--- a/drivers/net/ethernet/adi/adin1140.c
+++ b/drivers/net/ethernet/adi/adin1140.c
@@ -733,6 +733,8 @@ static int adin1140_probe(struct spi_device *spi)
 	if (ret)
 		return ret;
 
+	netdev->netdev_ops = &adin1140_netdev_ops;
+
 	ret = adin1140_phy_init(priv, spi);
 	if (ret)
 		return ret;
@@ -748,7 +750,6 @@ static int adin1140_probe(struct spi_device *spi)
 
 	netdev->if_port = IF_PORT_10BASET;
 	netdev->irq = spi->irq;
-	netdev->netdev_ops = &adin1140_netdev_ops;
 	netdev->ethtool_ops = &adin1140_ethtool_ops;
 	netdev->netns_immutable = true;
 	netdev->priv_flags |= IFF_LIVE_ADDR_CHANGE |
-- 
2.53.0

