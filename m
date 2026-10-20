Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792535246;
	b=Fh9S+e76Vb6k7SzvYO7xf+TWJUiHegKt6/vTYxTPBi5dieNMbYvSBIKepm//qIYNrTYY
	 xC4WtAHYBZLWWHHYrXpfvqiyyVNljfWDOf9OL4xglwV7osjLNFOf7HLn+SJq0UMyi3tkh
	 dIc4TqJVau8dVaasdmQhaY3qa/MZlJUfPKlgrOesN5MLCt6MlJXAJx3LEZP7xIhEI77UV
	 IHhxEh6NTJtbg71u4h6tYcYbQFl1mmOGTHsk5E7hNf8vyo0JRvU0GSj/UdPR95/pWXnhS
	 0Fu5CVNvorrNjp1SrBNClZNs97EUzf3Dz83/SxVdIbYMeiwJdI8KZ3IeSVphycc2T3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792535246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/8+W0UostAofXOqrRgVY9iT/+XWyOmglnbuiDK4suH8=;
	b=BeCNqoSPa7EcDo06NU5/J+EOouUKMD9jPzXv7rI8elg0KLiZ0IbONdcjNlxPswuM63EF
	 S6Sapde6/A33FWvR+BxWfUWOluKsw+pvVx5WXSNjugva5jnJWNhuMZvFpXmvwj5w4gF7o
	 qSS/5tsEXqHjYHgwBOrD4Rf3KTmh8duTduzqCBMBuD05CCSjxFzxUhxQqu7EJAQfkEshl
	 cpjmwW7B0e9JUEmu0pfHJzANGump6qFRF459mkTe0Ox7YpnRK2x4fDdHGdZ0VbBiqOIcM
	 c9JnxjnRUhzG5FbbtrsJ+VfA+GtEVTYYXLSQBfc8uuo1RPnZPcbdSpSsDykm94h8MKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NwZU2mfI;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82595606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82595606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NwZU2mfI
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso15772a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792535246; x=1793140046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/8+W0UostAofXOqrRgVY9iT/+XWyOmglnbuiDK4suH8=;
        b=NwZU2mfIchf9XjG8WbLGE4BSqGEk8u93SouTWzashManSaFl0JKV+iNLxE/iXcZdbu
         8jk0jUMtxwlySYruszZH/T6MRbcYdbg7zglMWasOKsBJFuNK+xSxTIqE0oAdX3IcIKXU
         c/eelzCNRBZ0KVZ4fxS1N12GvDtsrkjwwQdy8jK2LtnE3KZgdNnrL8Dttab0Fe0y1hLG
         qB2oXMFRWO88wIoEYy1o6Hbl0mz7eBzP6VCSBVel43E5t0aEdQdlqW9Ckh68jDTbmjhA
         GFdkSu2jbTs5sv3DS+oiLUZe8nu6k6sGg9Qj7aTNg7w978jLcc5S/cG34NtXHYVTD3HY
         jfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792535246; x=1793140046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/8+W0UostAofXOqrRgVY9iT/+XWyOmglnbuiDK4suH8=;
        b=BUgsoAKiXFIEiTm0qYhONGJt+RaDww8XK+jyKoxTrvUWlUkg6Mo9TpKjcghn/9/58N
         rDZg4M11Y9PdJo4RhS0/gslVh/vmL2oJO6inhvBt1I90uto6hYrKbx/EcXrBE/H6TgDW
         uNt0/1O91KR7yjS0UkkZB3rrvkb+28BIEFQChgam+98m8IhFS8Xqa2bLStua9oPhtul/
         3gxW/NJduhLtYdy0YxqlcUY40s+tk78STf1jrxR2Xqsxo0k+cfKlpHKvJhtQ+sGI0UUM
         T2SdSgNZ2LWzDrEIprZPjb84+HpDeNsRqV+z0oJKF35P9vdsF3S7dUZFuhozoFiPjSHy
         CZrw==
X-Forwarded-Encrypted: i=1; AKwUvBz23GsRx1iwGzVyF3bAtMcutYUdIdzC6BKp759Xkd0Zr4h9hqI3qk68pKNOMwD8F8a2+pZpPPl9wKcbWDc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKEZOkxTXzFl+L8p0g5VDrqCpHjWnkJ9ffw0lUDDbLf8e2g7Z8
	b6gPT/XsCpVJXVQ3uZ5bDGgNQtLy9Ngw7xQxdgnkcSdyg+qHuUL7gEFp
X-Gm-Gg: AYBFou0BVD+Hpp9r79Q1KBaR6O19ySAlcvUkieM9grcpcLcgdhGuw9bIH9Rh/4zkJM0
	urokZtYyaiymxPDW78DmxGV+hj7qazUGAlIsm+iYOGNkjYPg7eWEI0Gwbub2PBLXONN/2nqdbmX
	MTaKRvD2O6WMqAAm3SAuYTICaTq7wLpLcznXqJi5zR3C3St1sH/YYrel8SmuWQ8ytDrt/rSX8fS
	XldPACR7KrYZ6AcTuNVBhBuf0yzvNcK6gUv2aZOmcqjekNTZoOdiOoUKOg0TO+TuindRx8TYUAB
	aux4Gqp1+W42JEJUYEaA6F305pJ215V6J42zqlwEA4IgpHR2+CCOkT3N4V95cRAcALgSCsVjU5d
	PFOJx3i7S3KDJBCA+MkWK8tSXtW7QOE+Hruoy9jTolp73qBYw5f0CALjFC3bp1p4DD3AtSoeLgd
	SugWoL8AYvevy5hSv91XYpypty4lWYX5YTGWEPPYRakcQuX4TjIQeQmQLO9BW/t2DuJrQL6l2gJ
	RUYfQJM05XuANJEycqwpJ4FEb/y/MlDYmyPQnDiKJXEEqrL4PJBNzb7CLpI+O/aYjGx+0jha5O0
	yb2i6iXXLdVWlFMPlN31PoT6y0ctoUBFKY2sCqiqhWdWJck2Yt3zSwMgEQ==
X-Received: by 2002:a17:90b:2d0c:b0:3ab:c674:cad1 with SMTP id 98e67ed59e1d1-3ad86d39b6emr265214a91.50.1792535245784;
        Tue, 20 Oct 2026 15:27:25 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:37f::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad802917c3sm1320396a91.7.2026.10.20.15.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:27:24 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Wolfgang Grandegger <wg@grandegger.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: emac: guard PHY bitmap teardown
Date: Tue, 20 Oct 2026 15:27:23 -0700
Message-ID: <20261020222723.1746201-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PHY-less and fixed-link configurations retain a negative PHY address.
Avoid shifting by that value while removing the device, and serialize the
bitmap update with PHY discovery.

Fixes: d6f144830bdf ("ibm/emac: fix improper cleanup when device is removed to allow re-bind")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/ibm/emac/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ibm/emac/core.c b/drivers/net/ethernet/ibm/emac/core.c
index 4124a90b18c4..0f534af2f3de 100644
--- a/drivers/net/ethernet/ibm/emac/core.c
+++ b/drivers/net/ethernet/ibm/emac/core.c
@@ -3240,8 +3240,11 @@ static void emac_remove(struct platform_device *ofdev)
 	if (emac_has_feature(dev, EMAC_FTR_HAS_ZMII))
 		zmii_detach(dev->zmii_dev, dev->zmii_port);
 
-	busy_phy_map &= ~(1 << dev->phy.address);
+	mutex_lock(&emac_phy_map_lock);
+	if (dev->phy.address >= 0 && dev->phy.address < 32)
+		busy_phy_map &= ~BIT(dev->phy.address);
 	DBG(dev, "busy_phy_map now %#x" NL, busy_phy_map);
+	mutex_unlock(&emac_phy_map_lock);
 
 	mal_unregister_commac(dev->mal, &dev->commac);
 	emac_put_deps(dev);
-- 
2.56.0

