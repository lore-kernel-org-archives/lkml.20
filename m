Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794459204;
	b=dg4TWJWlKp5bjSCnC6xLCF2aOSAN02Q7efWN+0c7DD0hADhmIuX201T19KsDv/F/FhzY
	 FhRDa7ZIfchRCiPw1P86TqX6HsCu0+EJLrvTW01EBabpCiUEO/ThFPYp23YAQkv0wbWsv
	 95csrxU7FQo9hy+mi8KYy+UB+CAmcDg8AxpJRaxcdd2wAiAHc8sxx7QaozU+wQSOfyfQ0
	 poTC98sbx5ByENes18s6VnDulbyqXbzgovlSZFvJrp/HrEvIln4DqiOOsKecDB9lFBpCf
	 cBm3/UxH1vGdbjDEMEanYkYWTPwJCzhadj9XgWUP0XP2dVqzqAAuH2xmnzMcStzDvZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fq7eVjoo8xJhvVi6unc9XNet04qh3ukyVn0blU6xcQE=;
	b=yMkroTiNQ5f4IAC3f/o54I056rMroal9XafKDNPkZMqUcW0cd4vWjHVGISM6cgSXpZv6
	 vAEPLKnpXCtCNk+zyvOx5czAijQe7kFHH46bdWgeoTSngI3QiPXPlsS7Orxz9TobkBDW2
	 9qz+HntlQTx5MlcvZarE3wVepMGz6NnqOKlDjWVsf7i4xoIbs7wYJdBPZPVnO+qQmIuf8
	 lD40GEotA0YjjQJ+3Qm6T8CsdmoJw8/lbxc9sx3FykFGseJMf1eslpbO1bM3EE2cTjpWF
	 +pxr+LEn00OQ9Y2H50Tl38etosQe8tpW3dFP1sY7qIVkLCkFTTuMOFeMASnuCBTba/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iA+HoZy4;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8981A606A324
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8981A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iA+HoZy4
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so5914507c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794459204; x=1795064004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fq7eVjoo8xJhvVi6unc9XNet04qh3ukyVn0blU6xcQE=;
        b=iA+HoZy44jRRP+FrtcYQ+dzOjnHFESP0hqTtmIbHTcoAQIGHvpOXovN6NII6YUYUDr
         yU41ZxiDZA3rZbxrr8DM1Gq0MdfXLanv3G1khEWjTQLnvHzYiKeX5yqvm0vQ7IE7jFqo
         d+BOnbJc9TD3fCIojejExHFGjYv2sfzir4cc9tzPyAWUSQgtdVRll7YiHb9jhdSVbWhL
         kiVAjXCFvMtWrNwpIpmQ1k7BPnnq6hP+Ycaxx6SJ3P0ioFyX79m2zpafaAWWDQ8MW9em
         FMxBvtFiIZUxqFdhFxj4kJjyQZhNr42Fr2HftNPqJwXnApTEMv8CaS+TRSuQfkNAewdR
         ju4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794459204; x=1795064004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fq7eVjoo8xJhvVi6unc9XNet04qh3ukyVn0blU6xcQE=;
        b=n4yDDLClz5vhEkb3x7sfXt/qElO5NeKGBMn6nT2R0jGFXqeKtPyH1YfqIlLh2518Wp
         OiN5l1GGWBCyHdxYRIpvRfciZuKPoDJxLVVo5BwuWjuVixwC+XxGJ1OjXEtV+AxyypGB
         V7hy3xDEsWtamiQ2ENujAuGnMuqGbACU1TVYHTWBPwFD/iezBOXKl7OSVJOSIlOVQWCd
         oYbbIIA5jTJhKejfL0JpPq/cCFtVvE7q08nEebcxsD6TeQ9yy4uhmnVoPhnI5YfUwxFb
         nLz/th28qosCXrQUGxic+2uVOPZkHQBpcnYZBL5yZhJGTqJEaYqouv+uJPYee5UIe2WP
         o1ow==
X-Forwarded-Encrypted: i=1; AL+hErEco8ClkXxKD6+W4l2z0b6fIMa/iE/LLwZwSApRIv0bDKkU5pJSZEW63KjDa4jsXP9paM2ldg82GMf+6GQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wNvWB9pvytodam+K8WmbWMw8eDVbNs+IKXg2rdQLmd8YGolyH
	rPyWHBbAgfhfOtASq4Da4xrWhvVRN8gBQrY1f1wq8wrrlCBJX9Qg6LqS
X-Gm-Gg: AYBFou249JBokKwY9lB98MAgD9jJJO/RQZPG/tmjZB3ymL/T/vTLSc3EBH/4OQXBsZz
	zJcNg3O4/eNWSc87wuPKzT+oXTScTouLKEqCJrGMpDlqGq8l7jtiakpMkOyrjZzT0jqe7orl+k1
	5XGPD7M6pNAF7RH+/9DRRCiu0I/MTcm11mgxNzgo+7+wJJGmJMX/KGOlPjdkIPJ3NE8nDivCsg0
	JN//QCSdVTmLwPNGRxWC+xumXSNO1ccAo6w3CBuflXw+7RsAPiTbBTdpOzKifG23/s4OHQe1Lv4
	hcyYdaAksMIVUXgiVyfNXLpxDx8BDbiMpntW1CbgKxaE9TC7lSnkkYCKix47FaKZONaP551/CQs
	Y7ybXkU2cjfVyKuWjvxxjTj1vVLTQ1PndyD3IxpF1xbl84GuxQnSyGmQLKmIxbvIQWUuqoaBOcr
	iKsmTzzEI+dqP0Y90rPV+2iQrPieBYBydMdN+zPtkzSYHm+eFSMeVjZIESSk9DZWe21IdyaQtFd
	NHCLCjpkfI5aTEVM1dynzGY87JUsUfxSNLykXnNZIwMJaJtUwMq5ORTr/si1VZpZAhA7MFhkf3e
	HHszEpWiutWqsjFGcScjp8KqB3qeCd8=
X-Received: by 2002:a05:7300:5410:b0:351:1bdb:e3b7 with SMTP id 5a478bee46e88-37686072206mr6620613eec.15.1794459203572;
        Wed, 11 Nov 2026 20:53:23 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm23921585eec.17.2026.11.11.20.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:53:16 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jijie Shao <shaojijie@huawei.com>,
	Simon Horman <horms@kernel.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	David Yang <mmyangfl@gmail.com>,
	Herbert Valerio Riedel <hvr@gnu.org>,
	Jeff Garzik <jeff@garzik.org>,
	Danny Kukawka <danny.kukawka@bisect.de>,
	Mugunthan V N <mugunthanvnm@ti.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH net v2 01/12] net: au1000: recycle RX descriptors on allocation failure
Date: Wed, 11 Nov 2026 20:52:43 -0800
Message-ID: <20261112045301.3669532-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112045301.3669532-1-f.fainelli@gmail.com>
References: <20261112045301.3669532-1-f.fainelli@gmail.com>
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

An skb allocation failure retries the same completed descriptor forever
in hard IRQ context. Return the buffer to DMA and advance the ring even
when the packet must be dropped.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 8682323d693f..cd25248f4e3a 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -788,7 +788,7 @@ static int au1000_rx(struct net_device *dev)
 			skb = netdev_alloc_skb(dev, frmlen + 2);
 			if (!skb) {
 				dev->stats.rx_dropped++;
-				continue;
+				goto next;
 			}
 			skb_reserve(skb, 2);	/* 16 byte IP header align */
 			skb_copy_to_linear_data(skb,
@@ -820,6 +820,7 @@ static int au1000_rx(struct net_device *dev)
 				pr_cont("\n");
 			}
 		}
+next:
 		prxd->buff_stat = lower_32_bits(pDB->dma_addr) | RX_DMA_ENABLE;
 		aup->rx_head = (aup->rx_head + 1) & (NUM_RX_DMA - 1);
 		wmb(); /* drain writebuffer */
-- 
2.53.0

