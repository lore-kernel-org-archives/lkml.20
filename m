Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794459231;
	b=tN6fJ2TDA/Umw+TQnXeusU6Lc7TP8EnPxc6VKCEgoOzCg17av1bLcJaZdXHfZUUmgu5Q
	 dyih+HsaYkszLbiyTvz64KHNISlQCeRC1WAHiTZmKva831YjCeJGq/X0DU85YdHJNlOsW
	 /L/4/1OPgzp/nXCYrnxwT7jNycOrxI/CtfpaL3bgqA2H4GYjNi4EQa28CIDpguEDBKlKQ
	 UPt2GDyzj2tYO0pyKR5lNRNt6RJ73z28oS4FVbu6WJjVQzaTz4Ue1Rp6Vp2oSM+hKgnZG
	 s8+sLD0c/qwdEWuRYQWMpriyeWONhegKH0uF4YO2JoTqx8SXKb4vBm1iIPksA/uqlfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+gfCrFXYRMyWY3Xonnf4UjyxCNLD1fV1UxPQdwpxQ3A=;
	b=Q+ZR5Xxpv6DJwjUXEK37N8jIO2uvyB125Ki6s3gl0n0rTgQdRpsIWmIRLuQzVzfxlA7x
	 JKoZ3vKDZJ7wkAOkUG7H1VQvPlF5SVcsFLfLKlo94L94M6pGcTcfLocTXYRwUCPlKbKua
	 XXn8gCjbwEU3PmqJ6ULVKROV0YnqM7UvUloSLpF3FbXq2Zq5MSPG8RgyOR6r1deYD3Flh
	 nWOpNHL0AHWmPFguuzcBX0aN+T60gy3oh/GbsT/AvwvLbPDU+pw02nfFta+tiS1aj7jfe
	 E/vmCvKppr8roRfVMOdmsPTsmbobkF/KCekUMVeWHtciVRbZHo7Pu785jKCqmWDEO4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QyTFHIBb;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEF3606A8A4
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AEF3606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QyTFHIBb
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36f8cdd30beso7154621eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794459230; x=1795064030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+gfCrFXYRMyWY3Xonnf4UjyxCNLD1fV1UxPQdwpxQ3A=;
        b=QyTFHIBbI+luA16GlKdCi75gXJO6oiFHHdS+5tVnCfRV/DoEu75AlWJt0ZsSAo6mN6
         Nlg7CXH8WIzQMcFzr5MAGlokCXMTQgvyvnkhWOQbhJUu0wFdrADTHy+I4/JYRmD71Wu4
         Am0JowvfYk+Yd1dVcq9B7M7aMu8bp5H7bY7FD3kfrvwVJP0k6j+eKBvVM0do/oVyu13l
         SGOVgX0pNL5sY5xRBsWpzHoe2/8fhWjJgrvVRD+0YXHDNkOmR6EZpeCNGAItcOwRMDhB
         3wi4WFJXXD2qOP8KuUz3FQJ/Y5L0IsjxHEJ2qMOG7APRFNiBVHWVJJAZCdbCZV2V1l9d
         bOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794459230; x=1795064030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+gfCrFXYRMyWY3Xonnf4UjyxCNLD1fV1UxPQdwpxQ3A=;
        b=fT+ZKDpWnZ+SFXCsKLXTasbzZ80nvnZwtntbtow9seP4GBGNgqSI3QyAR2ZzmQg21H
         L7gJzBCShL9GUyG+rexLaiw7WoYZeLLLs2swubQv0c6HsREpBwwy8+LH266UHdoZMPZQ
         Wd7Th2FjM/SskmIbqJ3FxfLZXbZT5Jzqu46xHq2vspFI1OHg71CmorHfoHHe1uC2b4xo
         IrMUnsY9KNipBFFGx8eg+tStcVRykResLWAqqxRT6DLnFSTe3s98U3VgTy9SOoin2MSp
         OivkcEYuMCHxoSepIGxQC63DQJBIowadK1DpE3g7cht9r0qeSoczSd4sIaQjBVtic0hV
         hAhw==
X-Forwarded-Encrypted: i=1; AL+hErFMoFa4l4L6Xj9eKWUABMEMCJYYcu9y2HzqwW4bY1uo1OFVqCHme2VzAeD/Tt+VGt0aIfUVKckTEEW0+1I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YIy0DwaqK/bAIutRKfKi/7xZYu71OS2WAkF+QgyPD6+889LO8
	3xp2+RkQFAnM/bmZ0U44RvX2rjvKNeswpSC8q5hcmCm2B6CXvo1/CEja
X-Gm-Gg: AYBFou2NmLmNazE+SaRtiCpUcx2gpjKJ+YNz5eSY0cNfhWdXoAbVhRqdJeWiqPcCDMd
	L/PPqjQZnYxcRLTn2qHajRFUokQAFMEuLhWp6muSvXDOpEHqLWpHYWoB+DGFD2UaHWWIzowxqUX
	QAJjTNGelpv6/FkQ+aGaTU+f79X0zEJ0zq1QiMiv32qYKKac4eKIE3uwfMB1lQDvv7uTr6X1b/r
	80F6EaMQxQD03kPjPtz5kvBwuQ23zEp2x3bmMWBVgekEu7/rlOO2ervkhN8w5H5WOQBs4r5TNC4
	POQrAIW4+69Nh0pPdBTh3fOBTn5SKYFv4ZopFHZMag2sevQe/4vneRhtLHi8+P4KBEdggo2s7De
	EALyEcO1pOGTq/Li/LIAewuV28MPkO0a8rz82sNtQzE8Ku+FQV3ZU1TgILrfH2ns+MGkrvx/P0E
	Imk4ucRtmI3KFTGlAzbDYoig8x2y6MztqI5AngvJ9vziThYFw/PD2zuuN7XcyP8KBrwhi0ezjER
	yPrMu9ifreYdJZljMdSE/KB5EPqav7/gkgZsqsEzdCbSCaN/AY66JVnVjK0yOgvYC9HQyAC4AzA
	dQlpWd0B
X-Received: by 2002:a05:693c:69d4:b0:36d:25e:1961 with SMTP id 5a478bee46e88-37686660c99mr4780113eec.22.1794459230230;
        Wed, 11 Nov 2026 20:53:50 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm23921585eec.17.2026.11.11.20.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:53:46 -0800 (PST)
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
Subject: [PATCH net v2 06/12] net: au1000: assign a valid MAC address without platform data
Date: Wed, 11 Nov 2026 20:52:48 -0800
Message-ID: <20261112045301.3669532-7-f.fainelli@gmail.com>
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

The supported no-platform-data path leaves dev_addr as all zeroes. The
device can register but eth_validate_addr() prevents it from opening.
Generate a random address just as for platform data containing an
invalid address.

Fixes: 7718f2c27dbd ("au1000_eth: use eth_hw_addr_random() instead of random_ether_addr()")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 5ce106d0389f..ea8f7787dd5d 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -1196,6 +1196,7 @@ static int au1000_probe(struct platform_device *pdev)
 		dev_info(&pdev->dev, "no platform_data passed,"
 					" PHY search on MAC0\n");
 		aup->phy1_search_mac0 = 1;
+		eth_hw_addr_random(dev);
 	} else {
 		if (is_valid_ether_addr(pd->mac)) {
 			eth_hw_addr_set(dev, pd->mac);
-- 
2.53.0

