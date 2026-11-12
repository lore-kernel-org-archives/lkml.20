Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794459249;
	b=ZvKanQDAVxZ4GwrssJq/8ATujLn9DYqbGCtlCpwxdgyEpsYNIMKbWltXI0w1RzK8EjAz
	 1awqeMU4Q0j9GzelK0/qaMM89p45uXp/ia9JKF0WdyIxKd5l+U5zb5G2CZQPkC5yCvVX9
	 hXYR7iDexj9PpC13UqwngY8TiQwcDOtOPye889i559D/zJSpHm9vXO2YF/9imMUzZvaH2
	 9HiQJpq1ztfeoNhAR+lzr0k3sc1LbuGVzt8zFAETB+iklR6OMWWhw4cY5XgvdBnaThHBC
	 JPNG4CVlsOUSDetsr8YKclWWRDGZQevzhsvJ82qCBNH5eBcvMFPaRjYxtRncy/pqQqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dqIx5LsR/HwfztDB85RdaApxnUG5lE8MuIP3HnTqRgI=;
	b=RRCEJG92OJwRpQ/BIQa/JybwCK7fRj8DSpAlS/2sPEEQI2B2zgeJp0TkjD1s6A5WfOmF
	 PUQY8rijawlDl7xVaEQLlEmPiFn2y6IsSF2DxP+ISpV2y5W4rzyDMgbqniO4cOLlnwoTh
	 HIyhiD6fbwIxvmX+NSA/72uEOe+7GhKLOya/ZJJAKQVtkBwYg+83qTL3mL6/RG7LKwhc3
	 +2FZfOqeBvszcQ6JCDaTlSUOlrd/C72CuQTaUQGoGa4+ZDbege83lLeriYEXcHbEgZBS3
	 oL6OEtXMBfy8LXyN3lSBH9Ab/GLd6mk1W0wEDtGVEdtvHMZMvWOGk5gnWcw08QA/i1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ZUoeEYu;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8F8606A8BD
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F8F8606A8BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0ZUoeEYu
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36a315ed211so517916eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794459249; x=1795064049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dqIx5LsR/HwfztDB85RdaApxnUG5lE8MuIP3HnTqRgI=;
        b=0ZUoeEYu64A5AK4Aikilw/mQmQdbSE1csS/sNAEQhiIEeLfVnhuPd6kDp440TTmIoX
         9f1NpWflM/niuQZZ+psr9+Gad4GHhL6iavkyugBfVreov3EvFvjj8Jh4kQS1C5fVoFW1
         h+q251hIdgubq2qORguRE/e088v35YX65KRqK/a3JWxfB9YAcD/PG9ecxYf94ehkqUKy
         RmIgMQSaZSI25N0mMoYbAW0YC3HLZN3KaMbHrW865GdVLx23EiLX2BhN7A7gBUtzq+mO
         FSOdsuianyvie4wKGzcjHjE14F7+7k08knn0MiG8BozmrG2ANGTRVnueM/2pu4+DdvM8
         Rw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794459249; x=1795064049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dqIx5LsR/HwfztDB85RdaApxnUG5lE8MuIP3HnTqRgI=;
        b=XD9AQMP63fF5BYHy7nARa3P/LfQQDFytkX7ddQ/f/YxRfBq6xOy4PRP7lpqAZTwDSI
         fCGfKXUPCx+NFHQx+3hckgFeIdB87AMQnudSE5mI+pxONY3lH3vs3oyMtGPaAtP7a8as
         nSBrAn0E3SSM9W7Jr1lSKAdxGiPtSpdo/BsgMtQJ0ouOpIXGtCGvn+xF6Wnll+Z03+KS
         Olf4L+WlWvJY8d8kjoCASlFzMQV68whRkz9Fn51UVc/NrGPtdsIVPqMFTrFCdVsaSp3i
         pUKUYFvGfv2dg98ljuiQjWdCHm5GXHMCEl4ApqvgDYSsfmOdjtQGUZotcHXxJE1vEM23
         QUQg==
X-Forwarded-Encrypted: i=1; AL+hErHfoy8qZ6TTcMWxxJuzjwdkGit99t1O7AGLEJZl5gERX9In0fSLtwvM3RwNf/XytrHrVznM70Tipuwb0RM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tIBVA7f1uQTDco96hBNrUW8qHwVQaGIfNnOy0vwLrKxnIyOVS
	ZZ55lkiwSHDe93NA6eC45FQLDfmFP+gEbhLvxhGkZOCdT5K8F84UBQn2
X-Gm-Gg: AYBFou1d7ty38E+ZtsSzMAZHCvdaq6UyFEXGJYr/2xjPpZ57t+RgKwsTvA0hQOTJRCG
	0PAezOz26Ue27j1CDxJDuD5zMulB2lcCaG3/IoFZ0KbS9+fn5NMdMjT6+ZPvGSpGbXGoK+FiXJZ
	prXRe5Pbs4FRZBhXHjQxSzgnCipv3AQ6HbkTgU5VnEZP1cxF/pMvbcH8thTJWMx8wQvr5PfZrBa
	Oww/l8pvhJ/gdSLxX3+Q8XGU6NYgwgo8xbEhL0btUWBUgAIYPSxBmkbDzCatuL0K+LHSh8tSgtV
	YgpJTFHboRE41T80JDo2qPse+e0TYpvg5mhSf65OtZbAco4fPLwc5r78ZaQUnh/+ynAzcxIuV2t
	CxlPYD7jLuQiNsb4QIbDzYU8LK0zTf5jN9kh2Z7nV1RZSVGTJLbgHBvEtqR3Bk/6QhunHtyE3Oo
	AYFLM5Vuq0lupNTXyhTTI04xMA4Tp3KiFoP5hLSfm8IDwyHKJMZfDRaP7HYKeP4hUVAczZUhNPR
	73k3cwBAEvGuzJpHMr1hV6EkXBdGPWLL96wBW7xDK/0lMBFibhr9vDUyLdtW4G4CUGDJ8o+5GjU
	F7uNpOOs
X-Received: by 2002:a05:7301:1527:b0:36c:a26f:83c4 with SMTP id 5a478bee46e88-377e101681cmr1458475eec.13.1794459248610;
        Wed, 11 Nov 2026 20:54:08 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm23921585eec.17.2026.11.11.20.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:54:05 -0800 (PST)
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
Subject: [PATCH net v2 09/12] net: au1000: restore RX buffer addresses when restarting the MAC
Date: Wed, 11 Nov 2026 20:52:51 -0800
Message-ID: <20261112045301.3669532-10-f.fainelli@gmail.com>
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

The MAC DMA engine updates each receive descriptor's address as it
transfers data. Clearing the descriptor control bits during reset does
not restore the buffer's starting address.

au1000_init() only set RX_DMA_ENABLE on the address left in the
descriptor. After closing and reopening the interface, a receive could
therefore start partway through its buffer and overwrite memory beyond
the allocation.

Reload each RX descriptor from rx_db_inuse before enabling it, as the
receive completion path already does.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 67f4899c34a6..8b7a88ceb3c5 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -722,7 +722,8 @@ static int au1000_init(struct net_device *dev)
 
 
 	for (i = 0; i < NUM_RX_DMA; i++)
-		aup->rx_dma_ring[i]->buff_stat |= RX_DMA_ENABLE;
+		writel(lower_32_bits(aup->rx_db_inuse[i]->dma_addr) |
+		       RX_DMA_ENABLE, &aup->rx_dma_ring[i]->buff_stat);
 
 	wmb(); /* drain writebuffer */
 
-- 
2.53.0

