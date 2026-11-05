Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907294;
	b=p/ftJySRxh6K/decQRsubKmgYkuCv0gXKnm7HfX1RaIyc2Bm1jT/m+/LsqkkTGTe/rHn
	 TCVAtU0EmwFaGCEyrM0hNv5h/rOEGQ/3ahICQSxys5/b82Uk49qlWlGWgvE2WW+2ACxlM
	 KOHpZgK4HASO6x0k9n10p8S72DpgThPLI6S2hDwBqm+xgM57FwnJf6TTMlmgC4naZ+KwD
	 zal6l2RU2F0OYfxAylN6MCv/xHlm2LZc0KGtbvsRpO4BugC/Utn5ELsRDHzdeHyZp0XWC
	 XPVcGZ68UCGAWW6YtgN8vt1Tn0gYFW3SgkvWLE5kFGtB2PtazwdJN3fFJIavXfJ/aHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2Fv3H+zDanDtQ7jLhmV5almycA1hA89Pb/ACh8oQAlU=;
	b=io+UYQ9zH6bMd3uqA9aWpm2ECGVW25Zti6pVk69f8dCBwYuEic3s7JU3Iwf4aZSmwyEm
	 rW10+7qU/M8Ilv0derfOd8KR9ZNB0u7woUpwsOQwWzK/kYdnytmMtM0MzzUQmkrv9KEPX
	 Nk2IXj3pdxjuPlVc15THuAw277vK5pSE9MYJJDte5PnPDrlntvHphR1GJcvAtvNYYauhn
	 90CZYrrvz6SMmAMtBpLgmZ8LLm/d7yXtPw2z6VfA+QYko05gq5m9p+Um7N6unhcUsh69O
	 nZw14cmHTCBwvxRdaaVEIT3zw1TvJrPmlmeeDXGZY1mJQ3hzqjnYCpsoGeQ6PEF1oQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H1saw5zh;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C190860741ED
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:34:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C190860741ED
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H1saw5zh
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b2513decc3so328136c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793907293; x=1794512093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Fv3H+zDanDtQ7jLhmV5almycA1hA89Pb/ACh8oQAlU=;
        b=H1saw5zh75ifw1BXi9g9xov7UnYjJbvOSZ7pQoBLxQOXS4DxMhFcopCWl7exFRaoaR
         525kxunFQaCpaQ3JpfcGT0LOJ2jBU+cWinjflVz79VXpG+psW3Y5om04iBvty7eCsn3d
         dm5Zqry9y5XqLQ1lDVDlWzjGHcvouBvYDJU6MxH7alAbHYRCn1q4mnIcf8fL3Zc+83Vq
         XpqbSWsR7Homo/4Striad5FgPD1NbhWF1wIC9syzQ9V4tjI3xQLHpjJRvRGYbVuvj5ZV
         57+FCMzVxaloTlvU6nP8OG+zUH8H0CXYej5FgvFog9LMjVkv28iZvOIRI8OApz+alLPr
         BGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907293; x=1794512093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Fv3H+zDanDtQ7jLhmV5almycA1hA89Pb/ACh8oQAlU=;
        b=GxGihz7s6TAPjfVOPLp6rA44C3CtOa5L+F/NOefmCYRLQrB9UyyUFecHjdgP9N36dN
         SYX/vtfGSXzznTpZFT1G9YfGVLXR0hwj2/j1RvgV91OI4Yj+7q4U8Ulir6sBEuASh+u+
         vAHn6ua6yuHT/j60zhHyZYre9lQFOccw7nsqrBhqYnPJNALLgYNCWlcnqszsMxL7+gZa
         Tc4wAw2pmmcG/Rnye8y3E/Zo6KYFF4z4FnkAXl4YmLIfUNy94wPmGU6FF5GjJM6O4jdL
         +I8Mzl5ZjDzdJB+yQ+vqXuiwaSwFfZd7FwzEFaVuVqcJlmDbHm5VlYS8udcjppo+gwaH
         waQw==
X-Forwarded-Encrypted: i=1; AKwUvBzNVU8oXehQ6BoE51rgwULW7SxHfW6MD/KaYjxtH/87ItuMGqKMdOWY9ATqh1f0ROtoFax3r8F4fJIXuyM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4NQqlbvrHfVbCiHxWud6hl0BTZ+vwZg2ZmIy68zyrAzUkasJG
	WJB4Zp/6idwWI3m6d7roHBtNQ2m80deyhLy0y+dlGmnCzP9Xwp7DapBi
X-Gm-Gg: AYBFou0Km+HQZW3IMMew9TkiQ2bwlXk2JV70MidU7gZzoQdRfIOZjVN5XzRpIfNMkd5
	yd2BG3v07tc/qBhCRcT+r2aVcKIU3a/8InjYKc+YN0Vq0mLHk1xPUEHYdZ+4K9EkpZwXUEtpyqc
	qyfEgDGq8LE+q0p4Cbqm+NXgPFo4jXFpZGvsoJBe99sm/nRTwxFFKeUrw2+dUl6HfuPu0/44opq
	TMfZ5oCDR01gy4t3wCKz34FVhHzNHcIo+YGHBOt4NOZ+U/rSNH5Bf9E/tSe7ckk1g2NwjRCiQl8
	dNjoDprUvRih1covI7EsP+RrhNu84w0isIibHRSwTpgmYvhhZ82JyHj/hWAfWqgswkrxyA+mHnS
	vjsB4OXN7mqgL4k+jXhYjSypJhlZWyodUdxddsMiHe4YYTBbRj7mQu0caQbG2OGYStBRv/F9cpb
	8c0AVYm4E2/9mTASEvfe42yAFn6t2mq/vgjiFTVu8hVXEFuWVZtWbWW6Iorw8covTpr/YFBvO1L
	+Rek2u5+hjGUm6AZ0Rq7ajxV31eZ/TU86hJDJ5hXw5NxkxE4EEnOIJGXI6FcqIgttwnQGTk21wD
	NTYnfQTEwX78b52VNNdvZ8o1H9+wYg==
X-Received: by 2002:a05:7022:7f12:b0:1ab:faad:cc9 with SMTP id a92af1059eb24-1ac5bbb503dmr30695941c88.11.1793907292811;
        Thu, 05 Nov 2026 11:34:52 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c127sm18023186c88.6.2026.11.05.11.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:34:46 -0800 (PST)
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
Subject: [PATCH net-next 1/3] net: sb1250-mac: Add ethtool link settings support
Date: Thu,  5 Nov 2026 11:34:33 -0800
Message-ID: <20261105193435.2050321-2-f.fainelli@gmail.com>
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

The driver connects to its PHY through phylib, but does not provide
ethtool operations. As a result, ethtool cannot report or configure the
link settings.

Use the phylib get_link_ksettings and set_link_ksettings helpers, and
provide ethtool_op_get_link for carrier reporting. The helpers return
-ENODEV when the PHY is not attached, as the driver attaches it when
the interface is opened and disconnects it when the interface is closed.

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

