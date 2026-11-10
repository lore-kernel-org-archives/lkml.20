Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354329;
	b=rg6g2C5TwchIpUdsVFcznPNIrapZOc96zTCjNMsiyjayJEu2g6OYuqIDBxQmpCuiNBIX
	 SrhGGyDXtT6wjGzFu+YfV3reXMUS/FvG2Yh/WLDhTRMZnWDTfduewlRwBjZc3+LdZd1BR
	 8wy+9enQcKXOfso4UtMBMOFeZxb1xdwBb8INDXc7VpkpEDwT+YgrYeTtIrmC+NciE3nzw
	 v6RY/Bx/SXRc8ah961RhgGsMQ9yM0Cup5Lyu5NAOBHfu4yyCtA/2R81yAv6109panwWp3
	 OJufDeHJJanEeIi7i6oxQ+Fw7BamHdNcxxC5C4NU19XKv6LBiirQ5GDcO3g+wNp9YiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bGKhvAV64lYKBnioTN7Ad3y0fCfdTBsU5Ol09e8bJr0=;
	b=gVnRkVrBYbAw5ubTa48AYrd0YRDmht9deejTqzsFsozKowgvm+0sn4fbrSPRin3qQISg
	 FzRJkFic9SuE46QPQhsnqD2igZ/KumNdepC39eBW4fitH2rKx9MjmJvU4iDm4a9EZ/jEw
	 WeWYWisZs0cRb23rRjIskre/Dir6CTtQCGRlr6uZd+zSdFh1eDbvXhutW+3F9E2NvCOza
	 QRnKnTjqkjYvVY2iLiZCBF2/CMXsxe6sOgXP5hJaRt8ZHnI7NY9ICsMimuch5/5tiuTkB
	 kZn9gyYseTFQL0tnQF6vWYsCY7afv5okYv7SgXC8rVqMJcUWvlaahdjUKo9xBYlh5ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=taU06AUQ;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D04606A334
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3D04606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=taU06AUQ
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a3c08d6928so4480659c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794354328; x=1794959128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bGKhvAV64lYKBnioTN7Ad3y0fCfdTBsU5Ol09e8bJr0=;
        b=taU06AUQNkNNZa8NoYSxfpCz8XAtyB5Zy50NRQIOM/w+85xfumIDnx6iTHwN6iOsni
         lOn/Phf1uYdUNZbbyjxnc8JtBhN8ckCkK1r5EAqJJuTVZRyLJXIWHBRrY2MYJNr9Z51+
         zMjDnitG5zCD4sBRtiTgaAM/d7zo38Nz9TuVVd2Ogrfx1tR8+JWGDuzTViDQImVxM8DM
         uVbb8SecuGpCGb4gKaynM2/Qk6D/DF4Aoo/l+Q6YtrgPNM4rklP/gkoCgFXcWyvmskvt
         +rPe5CTGv1sFs12Rly2hl+KksNq2LDAMB2JJeysPdsV5g1r7fg1JTh+wXxnPx5mISSc1
         XjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354328; x=1794959128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bGKhvAV64lYKBnioTN7Ad3y0fCfdTBsU5Ol09e8bJr0=;
        b=0hMBZ4k/si9SBvXM1GYlDnA3R6zQtEhns4kgHp9IEuX0n9fWdwSjKvpGmyY29HKpcY
         svCXDXvB3gumS3SFkDEIKFxDlL1hPmr/XRgyTwsoN6eZign3GNtCpAXQdVipjigAKLaF
         774H3DvH1AcQ9p+XafTCrsNCe3brWLwJv/dVvoibDzlshD7dNcqLM9pGjI0AabEPAwdM
         14quMkmiztszfnGvnYdLNEextL/tbfWO4vqHjEicEejwPNdKEIMgCfHtMJjQaa/EDJel
         onRorx4TSRrWRDHXa/AX4LiMJZKYkGZOV8nuHlgZC+zBumJZhMJDmT29xkVHiGEdn9de
         k5Iw==
X-Forwarded-Encrypted: i=1; AL+hErEB7OLZ+c31wM8aXWBW1dzkIrdb2xnmq2NQQr1Oi4zEhg9mhqvLVr1J+QS3n0tptPgFdg9zSxaohJX6tzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z82WPY8gBPL1LJcvRQvXmJv5mLeQkJ3wuo3lrQJfkhrEfmy8J2l
	Z8WustgxFFgSA6gzRfURrug3pQwvifWYNHJEf9V78GDVV8rD29caMhQp
X-Gm-Gg: AYBFou1uaW1srHbjmGm/JLYiDuq8VZR0W45Py+u9ETmuU4aA3P3MupkauNiVK1ps8HP
	aDLa63zzIFjH8f7pD67SRDtudk3yGRipVY0ILac0+OcTjh0AiBgVmPjp9TlgBT+8KRxHOjl4+3r
	rOqvSwnypNcNh1TmIF+8R4FbtBJXSMjCN/hICFSBH4ZNcmgDCYbbkhrVPH2HojbNlxA4+eXevDF
	mcN0KlBRBv2RS6G8Qx3uuLarEiH+4z1I8GaW2IMVT2rzgx6RRPCJFzKXQiUs4muf6nhudwiJAX4
	DbzjpHLu46LC/c9YARIPt7HPelHfUnPnGxf27i+jxC7uY3CuWRZw2aBP4l5O+8JVpPVc786FUi3
	lzi+BFvtSrIWgyWLoCd9ZoOQj3tjezTsjNrdN908mDO2cNJ0JDALEQGZPVC2c9MsyPsOyZ16RUz
	7g55n6eBUkA4Ud/7QMWQ/wGdqnl19NnLMfbfsoIWw5sGBQYBDbHo1FuL1yr/dLmqV7uhMINC9IY
	aEghaEakjUkqGULY8hJLRjampiIHyr11QKj0uwin2DquzK2x7PPOzSb+D/W1TS/XTJ35v/iPPC6
	wWVNs2nA
X-Received: by 2002:a05:701b:4591:10b0:1ab:6b10:461 with SMTP id a92af1059eb24-1b3c0376279mr534103c88.45.1794354327884;
        Tue, 10 Nov 2026 15:45:27 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b20c55sm9145881c88.8.2026.11.10.15.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:45:27 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Daniel Machon <daniel.machon@microchip.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v2 1/4] net: sb1250-mac: Add ethtool link settings support
Date: Tue, 10 Nov 2026 15:02:57 -0800
Message-ID: <20261110230300.2769327-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110230300.2769327-1-f.fainelli@gmail.com>
References: <20261110230300.2769327-1-f.fainelli@gmail.com>
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

The driver connects to its PHY through phylib, but does not provide
ethtool operations. As a result, ethtool cannot report or configure the
link settings.

Use the phylib get_link_ksettings and set_link_ksettings helpers, and
provide ethtool_op_get_link for carrier reporting. The helpers return
-ENODEV when the PHY is not attached, as the driver attaches it when
the interface is opened and disconnects it when the interface is closed.

Acked-by: Maciej W. Rozycki <macro@orcam.me.uk>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/broadcom/sb1250-mac.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/sb1250-mac.c b/drivers/net/ethernet/broadcom/sb1250-mac.c
index c839dd9804d3..1843b52e96f5 100644
--- a/drivers/net/ethernet/broadcom/sb1250-mac.c
+++ b/drivers/net/ethernet/broadcom/sb1250-mac.c
@@ -2128,6 +2128,12 @@ static void sbmac_setmulti(struct sbmac_softc *sc)
 	}
 }
 
+static const struct ethtool_ops sbmac_ethtool_ops = {
+	.get_link		= ethtool_op_get_link,
+	.get_link_ksettings	= phy_ethtool_get_link_ksettings,
+	.set_link_ksettings	= phy_ethtool_set_link_ksettings,
+};
+
 static const struct net_device_ops sbmac_netdev_ops = {
 	.ndo_open		= sbmac_open,
 	.ndo_stop		= sbmac_close,
@@ -2197,6 +2203,7 @@ static int sbmac_init(struct platform_device *pldev, long long base)
 	spin_lock_init(&(sc->sbm_lock));
 
 	dev->netdev_ops = &sbmac_netdev_ops;
+	dev->ethtool_ops = &sbmac_ethtool_ops;
 	dev->watchdog_timeo = TX_TIMEOUT;
 	dev->min_mtu = 0;
 	dev->max_mtu = ENET_PACKET_SIZE;
-- 
2.53.0

