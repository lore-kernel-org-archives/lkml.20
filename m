Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278930;
	b=aLDMhhyutDE8d8iV4/UOI7DOSRykAbrJ+DHAFu3ZgUz/AdqLFuCoSXvp1qmF2Oy5ghX+
	 iMRCj+U1o5ce6tAizjRj2wYwgma0W1xoiFsCxvtfDT9dbiTt0Yp1AgMa3xwBVBWyhMpVC
	 6DegJKxYf2Z3SiCJplVmkGsfiLMIg7xYfhhyMyfssnPvvAK1zsxfs1s8MTcaYz/it+cYk
	 z6kUsxVp2/t7MElT6IHrm+8kUDWiOzlOx92Y53x5GU1iJP2veP+aGPGtfJrY6j34CRX8i
	 gBGAs3+2OHyyYf5MalGYIDygXTYqm/syzqp0WQJ6gTC07mMwo6ackOvIs9NUSVEUDLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OgSry7e2g9JnvLRslnsp0vdPuCB33JbamklOGcvQymQ=;
	b=oEgObQ37nxYwYD0qF7VAWwjzG9kdOnpan0cbGl6Qlw0PZNPi/X76rIr3xTNaK9N7DUcv
	 FV21suj4jlRVyRG/fWqZTwhn3V4TWedeRai6jBjiJ6GgU/pOuZ2I5aBOPSoitr04lFZgN
	 OWMKCYeba+L/dzX1L7uknRs9irXKVmB3QqHNK8nUCpC8ytN7W2RUhd/fvnhyEOr+BhuNh
	 rPV0ytQngEdp01PNjtHu13W+CHBNGgq7SYr7wqjfGJgkItBJl0Wr8qA4PndNGRqhO0pBW
	 A86ej8sibsi2yIEtfu2bSrIji7Wfy9dZmgfvXjykK+9hNxxcLICXD3YHdWLTrjhysrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qMaP2fWa;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8309F60A2624
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8309F60A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qMaP2fWa
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-55650fe1f0dso799110b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794278928; x=1794883728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OgSry7e2g9JnvLRslnsp0vdPuCB33JbamklOGcvQymQ=;
        b=qMaP2fWa1IdIP/qpMN2FaoqsVUe90F4WS+2YQT/gI47mTIIiROmHTv/9fKDHOzNFZx
         vN4+GXG9a5foFAn1JP2X5owDAeGW0GK4Z8ALOURw0QMtH3HqRKgmPsYfA7qLrl/4NkjB
         ibFNL/J+MYlFTVVXtY38+1aUyZnWoCr24llQbUfCfky/b7fHrl/OaAb5xV8eYEnpkU6Z
         VrWaFqfjl/uiQkytrUZydtLRLvcfcNT8rFAPiPVjcKaLutVjDYoI7Q+ugFstmU9yqmd1
         /v0aG7rWIUGy0aDh/Et6Fns3P0sYYs8uc6YXk0PaVJPicHMPHW4RWxUsPJkMUrnuu8r6
         LRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278928; x=1794883728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OgSry7e2g9JnvLRslnsp0vdPuCB33JbamklOGcvQymQ=;
        b=PMEgqr617e+OD4iEWsjVslnS/NHx/hCFQaqUX6rMwG13JdgdEL07ch2oyHjy8W9SJw
         97RLpfAlX1iFOqqCdcoGQxMbJQ5oYUROZMj53tE0S3Qv9fl3hXDB2VIitb32iMsZC+wk
         JtSdHhX9D5+6PvD1srl/cx/8EGIhHCIFqvBI3OBULjF3xc/9mONCMKaUMs40C3/NU3s6
         oJjPHaBveX76R+f/NxQY4HdVaqQLvgRIhIZ78gwDlDZ9HusNXb/m83OeMJG5rzvYvSB1
         icDGnr3zFl0ec8onlcEKNOg7bP+Q84CGNh0YVTivGgS4TdPV5hBangUdUzLKGkeuHujK
         6XTQ==
X-Forwarded-Encrypted: i=1; AL+hErGY/fcAMu8gEraaPyiWSpV7dDicyJTRPq2O+SrNGSCKNONDpSYwFH58V/2StefkwzQLLelnX/cMVBcL2W0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cExS2pt0/ISpDVSCsfZZnktc2gdkTwPUNlwK9aSebZNBPJYsh
	FEzbUruHPca+ss1YUf0iJFkCClySPLBbKyvGut58AWkCeS+BbD7ZqYw2D2BuroH8
X-Gm-Gg: AYBFou3dEahz1hnkgnnWUInIhIKnOfKjSVfkhp28ybhgAI/h+RS0Xs0awsEuBAJoENG
	Qa+2EwLsVXuqwhoLsmAlEF90AKrsveqvfkFuz/rKrRm3fqaxPkMbySf2i5m2IyJ4oTENjy0+6LQ
	6RjkFNR2UpcGBdKE0lTxKmdcYnrRxtrHrlSKsfjIh2emT8SqYkXPXmqBEhFYM7BcoX6w+RXMFaR
	df6jd0+vrVXjkXgL3/51VVsFQo5UY/rrRrJJwpf0e3QfHiPiEWdottfSvatqSRpF3DEImxPyRZm
	cMm/w5dUawgeNy4yJBNAMRuiPVBQiJDfnweiGnMOI2akv12eA0GIaaKRdjhdXe2MzzBk93M6q/o
	HaEVCaaVqkHOt6Hz31j+WCGBKMJxaH2GQ6Ry/mwR3QpqATI1KV2dEX7VxDNBi1cpBIfqO1O6YSP
	dfKTXBwSC964Fu2EfCPdOJ8Kr28Ic73AJOwH1q1puZXl+UxoSsWr8askpmf7ZjL4YrjMyAe512e
	x7SQsFUKLmxY6bnIZcghHIFerCszXqrxL933Ffny1XT8v098R2WRcPJhGgmxXm29XFSDn6eoCxu
	F/bbDHj85imA9IA25rW+7XC1uBy8VwWixC7ha0FAlBvomh7JcVAEzC6TAYmkFkJAL/ZQAWs/BU6
	VXZV5khESUm7iD4kUObdb80ZihpGfUqyiQIazKzFDv4BaC2PLzi2QKmilLbqxJn/blzfY8MaTxc
	9Lk+vhp4Z4KkSuaPhEub5QAbTNxGHQLujdB1njKl96OL3vQq6smuCc
X-Received: by 2002:a05:6808:c234:b0:53b:f634:83b2 with SMTP id 5614622812f47-5683c70cda6mr1164034b6e.0.1794278928446;
        Mon, 09 Nov 2026 18:48:48 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905f39c60sm943233b6e.14.2026.11.09.18.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:48:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 19:48:34 -0700
Subject: [PATCH net-next v3 3/3] net: phy: dp83tg720: report inclusive RX
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
Message-Id: <20261109-submit-acx00-phy-stats-v1-v3-3-fbc6327c5be4@gmail.com>
References: <20261109-submit-acx00-phy-stats-v1-v3-0-fbc6327c5be4@gmail.com>
In-Reply-To: <20261109-submit-acx00-phy-stats-v1-v3-0-fbc6327c5be4@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
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
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/phy/dp83tg720.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/dp83tg720.c b/drivers/net/phy/dp83tg720.c
index 391c1d868808..5824eff92937 100644
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

