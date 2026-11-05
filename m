Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907304;
	b=UDhhulUKguOjOJnjCw4KAnc0O6DmeKHIWYgKySaA99eqG9DNcOY0YH1iGaUcO01JBDaN
	 KzHtcsOB4DvIEO4u9EZ6VSr7QtFXZ0xSKDrT8wyraaEjbMll9IN0zMKJIizH7+wF5ZnY9
	 pUpE+F3RrPlUYTM7rJtm705vVEfewIANU1RBJ6iJVCerN1iv7mVOhyPWkGvCankcUAolR
	 EJDtPHRrB6XTn9r8YNZ8fUIBDuRCuGc/qqopPWN1xqsn9IbFUszKdY/3NHQw1QqgFj+Hq
	 CwEB0IP+s8+P0N2p3krwWuAyWul+L/iVEvZexS9eYIDF2eTZJx+YfxPBTODvzJqdNqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6waUMbBW3PMNNkalcsbpj+noxC1InsPmZ1SepMjhk0E=;
	b=ouLfP7THnU1LXh04BioQkdcdxBKXVDlrrbtFO3bg3jps6aAu3mGiHlJ//axjx02OVtpS
	 j9TyRpIaMy0mrAZFcbLMWV2qzRBKZnQqHBpqO+d1x+aofuXYAuOeQcYL8qTQymCHhjyBL
	 uKedUgDKHZhCvNLI88i6nj7+Qzne0cyjDMAY9+KPMaIGu8pDNTTvRipTHvGWGzt4/eoyd
	 /9aPEOkS81NrDYeFqswPRDZ9Np1LQ/sfg/hLKa8y/nY4p+Qn3mW/yqP02vrUWL4CTLMuc
	 ExOy1YLFcfoF/DLXAdYzlCojaZreNa96v73Z0wNT0AkV/sWgRNywTN9E/FfU/wE7/pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gF2H0qML;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F273F6075327
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F273F6075327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gF2H0qML
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15ea896ddc8so3796520c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793907303; x=1794512103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6waUMbBW3PMNNkalcsbpj+noxC1InsPmZ1SepMjhk0E=;
        b=gF2H0qMLqJEILl2WdYpdXO/kF4o/xA+zA11jGsk7q3DYsSiVSR4QAvQ4vNa8mrlh4T
         2PViehKuLqppi/478eA40zl39pgH9MZIfHzlgQqNuwY9J9Vpn2rJbUAAW0OIOpsDag38
         Cf2BEGqBCqhcr1Phfk9FSyg7cSv7ghsJX2sB4iF7m0JkqWJKYhadaDRqWeiJ6RCDfpV9
         S0XrT0JWFCMmCZskgEcesX0AJUGVCJ0UX76I7jBWE4rjK0rAYZHICCCqPG9/mUQMcy6b
         FZDlNrbQjfZimM3eqBJy7l9hijgjz0cseq5LkQyXt8hCmEqxuIDbJieVioSE0u9uAUfJ
         XuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907303; x=1794512103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6waUMbBW3PMNNkalcsbpj+noxC1InsPmZ1SepMjhk0E=;
        b=GdA8VHIS/O1GW/ZZm7t7+JpoCTPb8pDFREbXiORXSCwXsktZHFGLV8bj+ituLcCgGr
         z0LuEK+FYw+B1cliqmxk0l30K4zIkZmGAzdVIrMVSgbFXUdn+5pd6OszD0yFkOAFjJV3
         CRPe15tyhMG8v2j8xvs5KDmM778cfUStZNfP2wysB5yaG5BMjk2LIpciq0Y15jvux5d+
         tlPBP9aCtYgEa/K0ZFYlG9eZj0mOl+AozYiPBiaTo340d3vNwb+8EtffBiUtUhDRFEYt
         YTVOT7lu51GAcSnmfkYJ293Tl4WjiQLuk4vhbLUf3s5ue8CSJjK4orOrlJ95CjZ9x0jx
         RlwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzDaZ20m3FAoLf6fwf1QG6bFCNmZ2ungne3t6TjeOhVp3J5Zav0Z020Yv0oY64hlioBstyr69qb4+ixuY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DUicjpnnXrLAC9154wATDbvc45RBh2EAdn3NKu63c8spOl+7+
	1zWVWTbNMVAIMsLTB3DZU+iQsPZlIBWnIRvMUX4qsvL4O+65BO2eispO
X-Gm-Gg: AYBFou213kenS5kJKxhDH3TY47ZA4XGy94DD3mOvEw0qRXxOjbC/q77OufrivCjRLLn
	ESnu6+oAh+aWH8jS8htbYa8NZi8OqvYb6pntlXFk5ZrsKQKK8UIp3FFnPluK+QZ1uuq5pNSKcZG
	stySDz9aAEpNo5EA6Ejf4UofIym9hJSh+HDyiDd9Yk6tzpH5O5VLJlYd2jpPOEqWPJHBfxvSf2b
	ItxKVUMQ7ZELnBvzTe9Tg0RrG/Uk+xsucd93UFEd6wAlsaZ+XAlWUwyG9D6NVy8odAmc8exHU9J
	Xn3DS0exrgg8q28YknQTsJJ6lgwGGissfsw65/ZVPfJNd+d4yHNihguszm6WzRgyKIb061PdAZy
	RPEbAonZWWHj5b5p5w7xMxW/DSiVuI/5F+8itl3Bd9YpeRCq0xCL3qmXT5P2I2y0FeTexVqalyv
	2SAHmvYG6RMVR876ySYr6iyWKheDRL6H/9pBfxCFj978bzchhKkM99oObcrgFXWPryjbODxqIm4
	f4AGx62LZH6pnT0fu4E4NGhBOPQJolRWCLopIh3TYzG8zLA+lXLm/TY//Q3zG3NWxIhaKzutk9D
	fRVVAGwR+G03cbTr7+xDKfTXS35n7g==
X-Received: by 2002:a05:701b:4513:10b0:1b2:490b:6fdd with SMTP id a92af1059eb24-1b2490b7174mr7487167c88.24.1793907303014;
        Thu, 05 Nov 2026 11:35:03 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c127sm18023186c88.6.2026.11.05.11.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:34:58 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list),
	macro@orcam.me.uk
Subject: [PATCH net-next 3/3] net: sb1250-mac: Add ethtool autonegotiation restart support
Date: Thu,  5 Nov 2026 11:34:35 -0800
Message-ID: <20261105193435.2050321-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105193435.2050321-1-f.fainelli@gmail.com>
References: <20261105193435.2050321-1-f.fainelli@gmail.com>
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

Wire up the nway_reset callback to phy_ethtool_nway_reset() so that
ethtool -r can restart PHY autonegotiation. The phylib helper handles
PHY locking and returns -ENODEV when the interface has no attached PHY.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/broadcom/sb1250-mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/broadcom/sb1250-mac.c b/drivers/net/ethernet/broadcom/sb1250-mac.c
index 546415d3134c..433aa1e24439 100644
--- a/drivers/net/ethernet/broadcom/sb1250-mac.c
+++ b/drivers/net/ethernet/broadcom/sb1250-mac.c
@@ -2129,6 +2129,7 @@ static void sbmac_setmulti(struct sbmac_softc *sc)
 }
 
 static const struct ethtool_ops sbmac_ethtool_ops = {
+	.nway_reset		= phy_ethtool_nway_reset,
 	.get_link		= ethtool_op_get_link,
 	.get_link_ksettings	= phy_ethtool_get_link_ksettings,
 	.set_link_ksettings	= phy_ethtool_set_link_ksettings,
-- 
2.53.0

