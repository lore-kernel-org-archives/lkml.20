Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590035;
	b=EoqA1BIRyoJsj7aJXAkdLCblHL4ZqOvp2UePOH6rU2m/29seHSp3Yx22NuK+f7+p5rLg
	 uy2ZCZoWRYwSSCZI79LFgaOQzSYnQeSR3oxRc8TiUOA7Ud+bm390WTcWYQX6nsG8nBsyA
	 RtEe+hVq+bI/cR2fmL+AcphPjMCbgnhxJkokty6ZPQeocmGJMBNlzLSTAy/CpX9vjCigX
	 SpHc3xzjYJol2YhEtr8XFh1TT5j1YzjLhX+N2oI3nHaZl9JLROCSDIs2v6XMFqMuIyMjc
	 tUo/wnZ9HVRv2FeeU3M+L5V44I9z6WlcEoeEsZL/K81fswVYzjNqEB5kN3NLZR0n6KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=WndszmS84HjiqSPdoUwyV3DcA5YhceFMCYMxOP4FTNE=;
	b=fKTBNhCstMCUzha7OvsEcXipzEeWQX390dYo/9MuCwA8px1GQAB1rbqL56QC5ZigQAYL
	 pUriAggDmTLWQ1h9wR62+eZkqaWLINgdhIPmAMRNlu9CCsY+/G3qxhQdWRfAD9byslOe2
	 Ig8+deQEa03oQq9FJYodGEnKkQcvYZ25J4PqgDiZAeFeMEMJ5ZL36mNXXe+d4aLQVepn4
	 mws/UKEXxIne+FP+CGI5engUZww8Fp5Eh591zm5chRwiNEWwCN2h2LzlLA/NEOdCyELo3
	 ycp7B/YySOpFs2FxPL0We6DFTJpmOk1cZHQ7RZAqGcQFhFDoANM4uBPlszQNHvxDszw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owj7+2Df;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA2D60A6F6E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DA2D60A6F6E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owj7+2Df
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-53dbe9b8d6eso1831085b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794590033; x=1795194833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WndszmS84HjiqSPdoUwyV3DcA5YhceFMCYMxOP4FTNE=;
        b=owj7+2Dfmf835bdocKPx6HgeCYJj9vwIXyQDR/lGwQ1CLivf1zCoPclGyvaaliEXf7
         doZuUw3CqjvjoT+sjaLe/AfyUbxwilBkB3/WtREIUsNDgVvAn34NakRs14M6E60jA6dz
         Yd4U+UJ1sgCsUBP8xbopnVcKQbH1icRkxm8wSHdai+Y/Szip9jixkL+fgoNEwE+iDNnv
         /cQu86hstYhkwQAZku2h5zZ7zGmE5PGYKNMgWaiJzAuofNkMLiMZlkWYcS4sgLaX9prN
         uHF/3BAHTE7JgfRVJxami4+iPZxUVXPW1OCu853ZX4DrqSMjss/arXLzKbw82fET5Bk5
         DQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590033; x=1795194833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WndszmS84HjiqSPdoUwyV3DcA5YhceFMCYMxOP4FTNE=;
        b=QEEQnmJS7whamHcbnrA1yMQj/nOCeL9Mo3x4CztHl2sjf60U/VdAxJ2OFtFXko46ZD
         M0oSAqagAcaj3oRbTaSaqdnGQ+yKc1/PmwmTO6wvBgGZ8YVHm1IAiSmrTXQBKJRYUqhP
         5Sk38ZD3KmffP+2gWFxmNeSNodhUDAZqjHqWke22aqQD252PUGGOk/sUUkDu360nhR/L
         f9CAV6cjlAQskSIQfqCADMlKUppI0Ok3Cm9oZ8lWKAIzRXX7fGRx/1bXOWLD73v31WGl
         tWPgbz8KZKf8LR7psWyEYJ/L/wugQ7oGpL8up58uRUjX/eCJ/9cMPrhof/mofuXHRl+5
         pqmA==
X-Forwarded-Encrypted: i=1; AL+hErFHwbi9CMtAjvwRLgEIufeIaaDlUAVthGoyIfdyJZnek8UYwoqa8zWgiwkPnlNM4Iva6CfX70F/DWdLsvY=@vger.kernel.org
X-Gm-Message-State: APuU4Z99UJRXeHTn0fa8zpGjNM74hpdcGgDEo/rdF4mJFsRqbttv7RPC
	LTnwyW2Zs7NRMDyVXLfPaW3MkyvcQv7HxhwgF+tsDR+HcWiNuOQTG0fe
X-Gm-Gg: AYBFou0D1xihGg/NeXLbVyXFLFEaSXPpPJD4yKP5tCuk1HNeW7dCYz9gFYuY+xr5ky6
	V6xogXdIPqUle7pMt6g7QfKsC7lnuS4ZOaookJA+zplHa6lltj+jiHNe4yr/3nLbaf9LcqDJL9P
	YEEKeIDopWgK1ZkwArcdi49tNv9dICP88gixbZu00kGTk97Gf6BcAA84VNOgMs+TSiU+Xsd32zF
	79x9HW3MDJ5172dAl9GaCyj140R+VW53qZRoV0Xs/cJzMwGrqswBcP9Knxr26V2uO7U65D21zx7
	S1BGmDkuKb00qdYfwtGRKcjBuK7P7El4OlouNQ1HVTh3EI7U/bT/DKuRmeW6Xbqod0K86tGFkjp
	L5o7u6JUzBuG49gzuNoajIDcN7XGedeVnfviaaLRfYBUhFchljG4UQ0l4L94LQygYnnKbfRx+BJ
	LZ+/V5GW509eDGDspmX2ROH1dj0CzZyN66kQjIBT2Iy879OS4fUUOsRHWYeoouTypqbEWRlz9Sa
	1e8TGfHUTiy6KxKw/eA4GeLVLv6TBwPCgwLCo0/GPB3YPUqHgC1p9VZthjye/FBotT79v+Y9hFF
	HovR1Ay4Nwcu8VHZaDy+cEAscbhjSt363mS4zdg6xGxVLSZLrbLhBKCv7bObr9k1M35gTAM5pHe
	wajNcVspZi/ObvdcVRBriXLX+q47WO4++mJhEhhAs0kKfJe9OYPkD8Kbbj/54C/dwuDC/+fAEqv
	wtSFoGA6JAzWkvCBroDhIY5R3bi2dvsR/1j6hI3eBJyg6noBCBQZdxHQ==
X-Received: by 2002:a05:6808:c3d2:b0:550:6056:aa66 with SMTP id 5614622812f47-56cd761c123mr4042742b6e.16.1794590033339;
        Fri, 13 Nov 2026 09:13:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7044690dsm2565805b6e.9.2026.11.13.09.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:13:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 10:12:07 -0700
Subject: [PATCH net-next v4 3/3] net: phy: dp83tg720: report inclusive RX
 packet totals
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-submit-acx00-phy-stats-v1-v4-3-986b8a4a1871@gmail.com>
References: <20261113-submit-acx00-phy-stats-v1-v4-0-986b8a4a1871@gmail.com>
In-Reply-To: <20261113-submit-acx00-phy-stats-v1-v4-0-986b8a4a1871@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable+noautosel@kernel.org
X-Mailer: b4 0.15.2

The DP83TG720S-Q1 datasheet describes PKT_STAT_4 and PKT_STAT_5
(0x063c and 0x063d) as the total received packet count, including packets
with errors. The driver currently reports this count through rx_packets,
which is defined as successfully received packets.

Report the accumulated count through rx_packets_total instead. This
exposes it as RxFramesTotal rather than RxFrames in the ethtool phydev
statistics group, matching the hardware counter's semantics.

Fixes: 677d895af1cc ("net: phy: dp83tg720: add statistics support")
Link: https://www.ti.com/lit/ds/symlink/dp83tg720s-q1.pdf
Cc: <stable+noautosel@kernel.org> # Requires the new PHY receive-total statistics API
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/phy/dp83tg720.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/dp83tg720.c b/drivers/net/phy/dp83tg720.c
index 807ff5525ecd..6c0c8c6007e6 100644
--- a/drivers/net/phy/dp83tg720.c
+++ b/drivers/net/phy/dp83tg720.c
@@ -309,7 +309,7 @@ static void dp83tg720_get_phy_stats(struct phy_device *phydev,
 
 	stats->tx_packets = priv->stats.tx_pkt_cnt;
 	stats->tx_errors = priv->stats.tx_err_pkt_cnt;
-	stats->rx_packets = priv->stats.rx_pkt_cnt;
+	stats->rx_packets_total = priv->stats.rx_pkt_cnt;
 	stats->rx_errors = priv->stats.rx_err_pkt_cnt;
 }
 

-- 
2.53.0

