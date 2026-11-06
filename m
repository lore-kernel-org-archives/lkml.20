Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794003373;
	b=SMTpl3UPPizR57AQnanMFJYXbFP4pIGg8oIyYFAy4iGUCOgSqcUNdQ/KOMnFXZgWx29y
	 IiwjxQPOlbBbXwAH1B4cYCv68sTBcfLe/06ws2qiObA7ir/792BTHlWcVDJpd93uo+MYR
	 l7xm9QLp8TOd4uTyycnLrWvjS0waj04FQJN/4WbVwkHDt7TGgUfqAF5qaNCbP9tEim80Y
	 f4oK/bMQc6zWiJxn/OvvHwwI2zn6LT+fVDruNnaJ/A9u+6OarN38q4CM6v+ZyEUWEdcTJ
	 AxTku+6wXg3UcJAbg0l+vRx6NvHfWB7ZB28+KSyjWCw4gWbvds3BcEjm8kCSk5FEmJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794003373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=laRzMMYDJxkaw25Allc7O+S/jwUBfxfqJWPXHy4lzgc=;
	b=Zbw1+D5rJmuuuA2lOfzsTRf8x4HW2jpVUGMZKeJfT09I7yUFIHPgThepkfM67Z81d/gC
	 EdnvJcgWPZfEn1Iw43OeO+EjX8FeKkDbEpJeWiZ9E02Fihbc36YuPaULpwqyYa//YzNW9
	 fixx8Vrw7vUaPARTddi9Crpp0I8+cZvUmlmagozBmfYrkeo+Y0UQPXzlsFAWKoQyXC47C
	 PZ7b373kITNYsiOcSqPT9D3hzLYRebOesCZcmheXAXAAoI9V5hSAIwvqd4/e2vIukEa8B
	 QMQZlgsOORQLwLERsTsYKvJBdR7/sS7qCTuWYIckdo/hUlMhb6dxsposPNrQEyZ7CRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gQvBDgbF;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA803606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 22:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA803606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gQvBDgbF
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36ff9c9da34so1465214eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 14:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794003372; x=1794608172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=laRzMMYDJxkaw25Allc7O+S/jwUBfxfqJWPXHy4lzgc=;
        b=gQvBDgbFA/4j7YiasxpWEVpB7LYJeUQ/608Smr5g2DvH+4wlTZbamMoh/jom5eH60v
         7BUPKgySkmsEwxedP9Ln5xYvxRy9RA5ntDOuslgf+6PaV5oxmPqlkDmop6XQ+CmCjX9J
         w+M70TPMLFKiw85O6wmXSCoaCvINfkD6T/gjdRz24Naq2W+A3ib+9liMdZ17PfbFZQTu
         eZPbWOI6gxdKvLOlUWQJxTRYKwlJj8nnCcbUVcTsywbFwEtwodL783omRdr4HwM3TE1u
         DAKGmtbCjRtE4LGk5gYflfLh/OKzyabNe0XJx2vyd87u65ecHLu1fDD+U/3CeBEVu3QX
         tEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794003372; x=1794608172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=laRzMMYDJxkaw25Allc7O+S/jwUBfxfqJWPXHy4lzgc=;
        b=ZWoZtacohubzEb6CuDVBBAH3wQeBRyg1xjYvY92Eb+v5z32DZRTXVFmlr8CPl4tbga
         L8kmfk/7fb0u/zKzKltElMfJez9fk2kS2dbQPgyCqDVIOOFpViGrBYe0Ip6aP12PqxYa
         DTe2O9x9eT1v0xG+P2OrjF3IeN4mvq2iMVRmPqETjzV6olg/5cQKrSJBSYDBgGXhpQ2V
         KH2iwkNLy9IcGGelgXq8u9IqkxafR5yxsbAbb+4YjhNCLplAk9Z/4QI6S5WOzIxrjqtL
         elB7XGUJFCInPNuy2wPhVWHKcphz5V9c3QATfiDEJgQtIUN3LIU6JAPfsbV7Ov8unEmM
         ef5g==
X-Forwarded-Encrypted: i=1; AL+hErHx40mEtyABotEaWrw1vyX003lE93rFRv9eah8NnyDFCM9tjXfqblm5ITazB9uxeQcUX7i+nXtoGzwHkV8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+a9Mpm61KUe2ZoHkvB0ZNW2WYOmnBH+bQiV7LHtYoIjhNX5VZn
	6m8HHRQxfkq780RmLSW8Z89dIGCQcXJluzFI+lC16snn8yUflenoHAta
X-Gm-Gg: AYBFou1XyCweGQ9IVbGJjDEsMQ0KpEm3mgNE40v7emF1z60o6WX4eOEREjCIV/oWSxX
	kWghXGOcf+BJuWMCzB6RHFoyqr3M8qhmy3rU26y4bQC8dZO+myBv1a6nbDplhnN8XNcmgQwXjI3
	H1N9KoJYd3bjRTRBQ+Jy8+IjCYKgfpE3e3GXOdXJ7zt7069OE+60TIcAsycfo4x0oTHLzURZA0q
	f1ujcjvWYa/WOy517+tE+cQP5FVGOlDTPqro0b+vNdT0DcpKN5u+/JKj8hABtNAt6/T6wR6OkMz
	EdiwWs9iGYSLxg4OuBVEzaqEeCmSYsBCL1QSfoBou6HDinm74nP7DH1i4xHUpwTD2Z+hfvbmaGz
	pVLrBew8xe4t8pbQOWAedCey1NKIef5032DAz1hgmclSUpkbFc6n75gtwSOfgdOStCGCCITbdaa
	PudgxkoYrPFeCUBk80tAOfhldqUAkCdhLwU7tK9zsUCHKA2aVDdML6QOFDCsgUGUNCp34heHCij
	7KGba9UuYZ7sGcMNCGQwp2Tp9sxmPhHDpKYokW7bT/HHN1WpszmUSa3GfiWPBEzdDkxSnNvhhWW
	FASZkUsQay2a3u2BFJv/Qpa+/45Thoqjn9sjItxerHb39rXIwGM24wGK5WNRhusgvNWkhBGo/I1
	nk9ym4Jd6crqtMTQTRteufSyVMtVeUGEX724DVkf8YFKka039Ot+ASPD8EOopNK+iPydzHIQk+q
	EEsg==
X-Received: by 2002:a05:7300:ce92:b0:36f:14ef:ad08 with SMTP id 5a478bee46e88-36f75253a9dmr4860666eec.9.1794003370707;
        Fri, 06 Nov 2026 14:16:10 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa5afffasm11333663eec.25.2026.11.06.14.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:16:09 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Chris Snook <chris.snook@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: ag71xx: let both QCA9550 MACs use MII, RGMII and SGMII
Date: Fri,  6 Nov 2026 14:16:07 -0800
Message-ID: <20261106221607.16215-1-rosenp@gmail.com>
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

The GE0_SGMII bit of the QCA955x ETH_CFG register selects which GMAC
gets the SerDes (QCA9558 datasheet, 10.8.1): when it is clear, GMAC0
connects as RGMII/MII and GMAC1 as SGMII, and when it is set, the other
way around. The driver only allows the second layout, with SGMII on
GMAC0 and RGMII/MII on GMAC1, but boards like the TP-Link Archer C7
use the first one, with GMAC0 on RGMII.

Allow MII, RGMII and SGMII on both MACs.

Tested on Archer C7 v2. RGMII on port 0 of the switch works.

Fixes: 0767ec042897 ("net: ag71xx: extend link validation to support other SoCs")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/atheros/ag71xx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/atheros/ag71xx.c b/drivers/net/ethernet/atheros/ag71xx.c
index 16434a7139bc..b2d78819a0a2 100644
--- a/drivers/net/ethernet/atheros/ag71xx.c
+++ b/drivers/net/ethernet/atheros/ag71xx.c
@@ -1079,7 +1079,7 @@ static int ag71xx_phylink_setup(struct ag71xx *ag)
 	if ((ag71xx_is(ag, AR9330) && ag->mac_idx == 0) ||
 	    ag71xx_is(ag, AR9340) ||
 	    ag71xx_is(ag, QCA9530) ||
-	    (ag71xx_is(ag, QCA9550) && ag->mac_idx == 1))
+	    ag71xx_is(ag, QCA9550))
 		__set_bit(PHY_INTERFACE_MODE_MII,
 			  ag->phylink_config.supported_interfaces);
 
@@ -1089,7 +1089,7 @@ static int ag71xx_phylink_setup(struct ag71xx *ag)
 		__set_bit(PHY_INTERFACE_MODE_GMII,
 			  ag->phylink_config.supported_interfaces);
 
-	if (ag71xx_is(ag, QCA9550) && ag->mac_idx == 0)
+	if (ag71xx_is(ag, QCA9550))
 		__set_bit(PHY_INTERFACE_MODE_SGMII,
 			  ag->phylink_config.supported_interfaces);
 
@@ -1098,7 +1098,7 @@ static int ag71xx_phylink_setup(struct ag71xx *ag)
 			  ag->phylink_config.supported_interfaces);
 
 	if ((ag71xx_is(ag, AR9340) && ag->mac_idx == 0) ||
-	    (ag71xx_is(ag, QCA9550) && ag->mac_idx == 1))
+	    ag71xx_is(ag, QCA9550))
 		__set_bit(PHY_INTERFACE_MODE_RGMII,
 			  ag->phylink_config.supported_interfaces);
 
-- 
2.56.0

