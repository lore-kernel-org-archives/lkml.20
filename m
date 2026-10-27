Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140328;
	b=UTZLWCVzVBPMDig1lJ6En/HvjKjOQGtaJV22HB1sZrUErM9g+n1p7e7j36wRw5SrNGOl
	 GqmKWM35MfGo41+4GH2CVtN9yyYh00EBhAqAqhtXLKxywuCT+oAcixVXvBkzyLRVK/iJ2
	 rWa7Gjdq3oo0+VW2TG79e91HJpZin7Kq9yPH2NI1zTI7P+Bz7GRW3lPFZyDY3jj5vzIiL
	 yHwRWarzajgl0pHoA00JKzMUSXRxxx/9muOEIE5j1ESxnu9NZm4DhH0nWwKa1GbqW26GC
	 xC8QVd7C4DzWpMTz6u41VzYugFEHsVSXz+lrLCSbE20IX122RLx/OIxtnrs2bW+9FPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JEwn/LebwMC44j3K5FGc9e2/8pQkU9pC11hZEDGdjzQ=;
	b=TMaBVr6AwBB6lQsXC3ItYhxYQ+bG4eyg15Wceo5iVuUCKzdoADow7BnK+OranMU2MxjD
	 YZrof7xI59eSbWN9610bTh6y9OCtFPtkx/bxSjZk+WdM6WfutEEtaYhr8A2APqYBnVAQB
	 7Gxu9vSekWyfErE45Vw1OnMzS6t6PiuQyjQp3G7HTbMW/sFqIuz1WaJKGTtoIKet9OPV2
	 dkXaofwjkMpzT2bgVZ/VrCKk4jxOm1LE93/wd1fWZ9UnqBHbkhC+VqI3HgnwPGaDoN6qW
	 fxIm8vS+mAKB35dxn7mTgD6qJmkAcYr3RcXrT9JAxMNHaKeSEJYy9uD65WYgIO7cyCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ICQ2xeVG;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C77360A260E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C77360A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ICQ2xeVG
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-14fc585291cso232293c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793140326; x=1793745126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JEwn/LebwMC44j3K5FGc9e2/8pQkU9pC11hZEDGdjzQ=;
        b=ICQ2xeVGzmWE24Bl8MUYq5aXG06gvrlMMo8wHLIEXuyyvSmITuiPetpYC0VRhKwSk2
         HbKhRUo4Xk6xayoeRdUCSHLTb3Q7pOMHWpVjxZlj51UDhQc4i70lgi1XpvckU9guYl2O
         NdFaL9nh0/Nlrr5rrYdDKmDzjj3+81b/MKPsVqAGIU3xVYIJX1p3QblGtYxYR0WunAqk
         2AWUQTQNEWmTwj8eJN8gHfGeAAW1JiECDJsAtGAT2eEQ97dsKybnfmQbnFg7vBvnVfgR
         ofbslCCTf03wiFw3u7j+kVRan2NIoWWpETPvn/zkQQMnCB9qAcfnEJzd41FpTAK7yW8Z
         1R6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140326; x=1793745126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JEwn/LebwMC44j3K5FGc9e2/8pQkU9pC11hZEDGdjzQ=;
        b=ouLvtNFA8vBx/joiLDqvOoy2iy7ePGPapH0gKYTN37IW8X2EG1nCPOEqua7Cs6zPha
         dDxICMoxlHUDBwh7LteDmTs2ZDpmdKndrQ8ko9CKYyht2jtkM0yH1sxmxkZ6E6zf0ipR
         EGhZLcHIcmespz4eUswrTksj+Wz1Ly9CDDKSz6Sw9bD3h2K1xZPB/qtKgN44nacQ8jKQ
         UmYBmym0iHEv3zPHEVdRCfrMbRq46eC3lIq+wCuvHs5hfnI9Ub3dp7HBQU5E6MMaZLjG
         Y0bYAsCd4/4R3dh5I5MPe0kU5MfIIlp3olqg5Gsy36JAA06H82DSOp+mybpgGdy4vbZK
         c0Ww==
X-Forwarded-Encrypted: i=1; AKwUvByHw0MYxQtScU7ljW00qc0NzcQjWoUnVPEp/t7ym7jf3uVpNXBtSz4BKIje6QnF+2AlO1O0HJn6AotLPoY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxhej/CcZiKL111SVcmiI1Xc7g3nqxRSjdmgtg6X1sG18woBqd
	2ZThawB7hV3w0Q8LlfZcS+F4E/9o5mVwHMQICuL3BkiElhDLDTHVfbDm
X-Gm-Gg: AYBFou0ibqxXksPhkDm2YU673wLtcqIv0CphDQi3QjKxm4OglWDI18lE3bd/2ZEpOBo
	JRCADgPuO+ImxTIKi+Upa6IrD7ODNv33IH7XmYOKxBNiWGHwlBf9oWxITZqnUXzaPFsiEczUjm8
	rAtfiwitBzki656tD3/t7PCkrPm7bxYnz+AdTxf9binf7LRJ3FBT9hAgw8bslaVFBMHEjqf9uRD
	89j1AmxD2iSu4sEfVzN/VdBYIWSmmWwa4Tse8YWKXLGGKneUZ/bpAsijBnFeBNGHOK7LVA+5tv/
	bkLN9sTnwoYDfPxu+U4m6BVp3CEdnSRbQ9P8Gg1kG83JPl7Gc1Z96khb+QeiRzxpMEcLbwhHbAm
	1LQGVHcVv/P7oFQjT5jlzzZwDjtWRxgl+Fa792KIj5OfuEg9AENO32SIcjysmxBbyEfCIqFCMwK
	JRJYFt/SXT/HFziHCVfNXy/z2B73AyfOvslzxoYG1tlrbQgNU6y7Ai7gYDqOb2/UApMJNnE7Owl
	NM/YiK9lvnT8gXo/xuVgCIclnp6Yd9uw6GzKajmDRp5p3lUIi3Gz+glVEXbhJ8BK2ywYpb8hrKj
	rAF/ng==
X-Received: by 2002:a05:7022:1003:b0:19c:c396:37aa with SMTP id a92af1059eb24-1a6ce1136b3mr904232c88.22.1793140326215;
        Tue, 27 Oct 2026 15:32:06 -0700 (PDT)
Received: from eldorado (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d98c93d7sm1130735c88.13.2026.10.27.15.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:32:05 -0700 (PDT)
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
Subject: [PATCH net 06/11] net: au1000: assign a valid MAC address without platform data
Date: Tue, 27 Oct 2026 15:31:35 -0700
Message-ID: <20261027223140.3774570-7-f.fainelli@gmail.com>
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
index 90887dac26bc..c0e38a507f89 100644
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

