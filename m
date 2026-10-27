Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140333;
	b=TydRn/0JSvuZM/nzAeKLOEU0vX36m8sJyljTL+kgWImdL0XB1YWjPulKmWsMssHHv+wf
	 q9+oVl/ZBnrQ8usO2v3J626ILa+xll+LHZp6wZkDaA9ZMmUChQmd8IPH95n2BFnmq9XXh
	 ZNg2st/iAdGhq/lBYVMgOTiaza2wYu0EOJRQGeWXWMxWGSdAXeAB6+s8rR3LTcklk+CyI
	 I6UxVjA3GBzPEqwrlPkvUFewNjtvb8gQgLHqUkEyAnVBKLOI2te6RiMR1UIE0OGveKWKx
	 w687AGovOfESchdwYpJkTb2X00zaKU7PING3Klr0ZfqgPjoLS6xszftdBneQWYXAHpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vFxoxFWBOlhshfxwALIfxaK+Lb04zfCNYo+3DVPtQOA=;
	b=daWaiHx8A5B26WCtg1O8jmbCWp60XAFeu66As2DkXmZa2oeIjzQyI7O2UyDQqBNs18bC
	 km38nqA6Gr0r7448ThnbvE6I5tTzQr4IT7fYh9SZVsf+gocRKHIPFjPAFT+gdSG91x+CT
	 VRlHC/J/D10Eeilr27X6B55W418vtmDBXDk3ET8g3ZZWdtlWM8heeLPWrZNtQR/Y4JC4Z
	 /6lws3t9cYZlK/kp3fV9+pbtb/8tDlo+3KsFeSB/VippyGlIWHOxHo4nICcp7pzlG/Yy6
	 /c9YzUYMMrlDM5UbIGoo7ZWrvFIj+juJtrzNiPdE1BoVRLT8ZtpFe5FxjRdigWF+YYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0pS5BrSH;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9D660A260A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B9D660A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0pS5BrSH
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-156cbe59622so364000c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793140333; x=1793745133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vFxoxFWBOlhshfxwALIfxaK+Lb04zfCNYo+3DVPtQOA=;
        b=0pS5BrSHWg6OtG5b8mJ3ZzcWHFBUygIBnHkcF+py+PlavFQ+NNeaJx28AS0ig0jf8s
         iLs4SAUhObBEEEVRkbPMdnJRomFqb4ds5au43SOpoMh55KMRuD8L1xtg7sFuRI20JG/m
         zgZnf2fDEhq734UOYTl5Lq+HPkXIBLUbD3kGw+AObHJ/s2evtZb91+trHl0bMPZ47oso
         4jzuLg/GQ4XT7F+8iSZdclha93GExR4b+iyCGeFLh/uRSsuoNMZPq6CRwa5FeGEAhjUv
         wr2ZbBPAlTuqEoJXtz3PxHtU2L5nCFADmkKDN1ym8uU/e8OuS4adrbneGLmEBqPrX4Dm
         8ztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140333; x=1793745133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vFxoxFWBOlhshfxwALIfxaK+Lb04zfCNYo+3DVPtQOA=;
        b=ZW/eyGxxLA72ABnxvb9BAsQksR7PJTa9fGUYGCSOYRp70hP9QbNWdyJPh7OWSiDKGZ
         0EfX48FWkXV0ayFKWUW6fKU59feqO0/IOIwtuE4ShVTGXSf9ocJf/vbyskxQ4OevljEg
         HIY3OfTEgd50vSVW7h1wGosQI7nuano7omFgJU9nkwf3kGL3dQh/YhE1xzkCzgZnpsjA
         0B5LbtY9nkp7BXHa4sgsWc2SuSR4N+L0BSLstqtYg3X3vDDq/Zt367Wrb5yJrXKyJOoq
         BBHL8xyotqMnSfoVS5AHKseF8gSBJSEvd6hODkJYpjCC2RZ18M6j5uuayEX0BlORWa27
         L7QQ==
X-Forwarded-Encrypted: i=1; AKwUvBxN6bNINW0x35gLhgLtiW3AxIU/wzF0/2TGvnuOENo+re+W9e3W8bueUgCZa3FrezrZEAowciRfl2x//l4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4PqK+byM3BWuM9OqSymv8xugnna1wjPxu/jUGzycEEb3YNtM0
	fHU4yvdAC2YG6d8zL50o1MqanK4lmdxj4BCD+2a4aayy+SVslasgtsct
X-Gm-Gg: AYBFou0NNwQizisR95wop5oYB/LJ6lCyS2IeAuxVWXWM8iTknQbDCDV3Ce5GHxt4I3V
	O7A9Bg+P+KzjDYxcOtaTDvzJqhtxs05wBgGrE8sBruY23hrKGM5HQny36KoULTI7VGgVPUFQnpK
	y5j5xdJw8LeiSq842Icj+LZ1hGIMPkpfmz9LQw5NipjProl8ykSPo0DTrLEyMBFpTIfudpn6CIe
	xgtF7+W5x/8P6gHuZPcS/100JrkqVH6vKaRRPKM+nFZtxS+1bSYbsvKuM6y82TcJJ/jooSVJInT
	fc9oD6eWrwKU1R1XG6qQ5yPvHTTQGYPCYGDDcYYEJS2wvZAnn7XTXJ/ek0fdu7cOFKq8A9jRMU2
	rppfR0Wt0j1S4KN5e/au+u803g2GQnJ0wgA3VxvKY1ZOGYMmYK52s5iA8UilAgp5PF00iA7/aXY
	FskMDbB2Yojzrlfe9OPugrN4TvgNdCb1JdgCxxGVfVX1EYwmLp/Dld198G2HmE7ftj5kBdCBwq1
	dVppNOOBlo3alZGTDnPhZKi9YVdVpLSX0ZX5GP6nCH5vhsLNDzwF1OZfSrs2eB6BhXNp18lNUHI
	r9xBqQ==
X-Received: by 2002:a05:701b:4212:20b0:156:6676:d0e2 with SMTP id a92af1059eb24-1a6ced913fbmr775607c88.10.1793140332370;
        Tue, 27 Oct 2026 15:32:12 -0700 (PDT)
Received: from eldorado (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d98c93d7sm1130735c88.13.2026.10.27.15.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:32:10 -0700 (PDT)
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
Subject: [PATCH net 09/11] net: au1000: restore RX buffer addresses when restarting the MAC
Date: Tue, 27 Oct 2026 15:31:38 -0700
Message-ID: <20261027223140.3774570-10-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027223140.3774570-1-f.fainelli@gmail.com>
References: <20261027223140.3774570-1-f.fainelli@gmail.com>
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
index 6b817d18329b..8c2dbf72652e 100644
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

