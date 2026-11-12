Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506639;
	b=MLfq0ugtVB27Wq+TMC97xNHCQDanHtc0erJn4e4eiYhSqSRIUPrA/9uFxXmpdfoqXmd+
	 i1E+Ajjz1kvGBXBJEFkdkB8na9WtN0taYPLb402dQuPzPiby18vLWdRiz0YlQXFTlmiGY
	 OgA6iBeiFGxzJpnCex3D9Ny8wcG/ykLWYKTxT6f9ec7BrID8dr54zvOUdJ+mKvK4dZPuL
	 mdKGzFet0uI4wRNz/XEl15M/NHAjppmb4Ossf6daH2h3Bu+hgN3zpkAg56KKpdZY6hWoK
	 6K1lqt+6ycvIhy+mtNFg9D1S8aA4jbJxqJnkk2D2ECDZJzcHA9MSXdVuwn2MA8teYUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506639;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=4vlXeE9enSxQAZM/AVNB/6k7VuHl6mXvqO/NCZEaN1w=;
	b=4rFXWMJTw3Z0EygoYkF+pEbGpqDWtD2nSUnKR2xZY4fR22MSyxCWndc55FoTeTvLgtzI
	 NAZYlrGGjzT9dZgufZJwB0VpsEBTRRc5kaAZIjyvZ2LMXy27M7Ui3DBHYA4pc3nfgwCSN
	 3bBZpbyRcHuvMPYTgVOJqBScjESSAtgnGLmzLa/NVx4WdAc9w0uzIpL6mH4A7bQMFYj5Y
	 izCteE8jUX1bPkHf88fZdmoTiCetiPZ4rZqAj2y8oQCQC4IIh89nvNdAbl+UTuGa5yiyg
	 Hjs/Hk8U13pbwvTTCFPq2Qr5EXg2Nw/cqloQn9E7gDif+jJnZ9dekQP3Uzaixkf/Yxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fQFpGwjw;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2677606A880
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2677606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fQFpGwjw
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so28254a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:03:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506638; x=1795111438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4vlXeE9enSxQAZM/AVNB/6k7VuHl6mXvqO/NCZEaN1w=;
        b=KzRYMbq41DVNZjuWpw5YkWLEk/YpYc+2qmN1LR7bvGMacN8jtcxbd7FhZr64pWlgO5
         lNTNNpyM7Aw9YGSuGwM2KbyF0VQNOh1qrfCli62+Hq+7cjcy39GvOmeuvmaZTJu1IT9Q
         pi7bkY/ya9ZBxRlYsnSoAde3gUSuq8sKTYjNRD8K105UJ1r0n2eUSN2JVpZO+uRGKTaJ
         2aUnxTCfXGw5cPs4UzZrkETOwdZtB7+WjOSbip1iowvObQicRqLqj/kHT+Ml93mT61QY
         F4kBG15GtyMkQHW+AlBjszCR531R6hsuTKljaQ/mTDzdkDoBQ/456ejrLCCqKrYZp20O
         11FQ==
X-Forwarded-Encrypted: i=1; AL+hErFsYGXKzhJsEo8OSDFFCfVKjpjmg2Et/G0W7Pj3RXSKt83KIAU+rLRr2wUTcfYAs9eyHziwvL4JxRZqGUI=@vger.kernel.org
X-Gm-Message-State: APuU4Z88ST3uQk2TsRe2wg5Xx8VYL0w4vg1M/h17TuBgEVfoouvyysXs
	pNbivsaameEQPSkLBBxxSO4+IaTxSztLVX3sz2ZKppHHe1y9LGEDwvm/2/U92OjQGg5DuVIVCh0
	PuZ+0mFa71LDcjHsBpHnKbsV0UxiXSuupPM/lqehP6KySIol3AcWDhU69cAdffqwqRyCToBQJML
	Zqg8+x9fQlm0hIwh8blA/WT6GbjU21uvRa0VLYDgIBWmacFUrDTA36ygVT5BMymQF8CwtF4IeRq
	gWf+7O+ai66gukqenxNAWa4
X-Gm-Gg: AYBFou2SbWsCK0/9acvqNEIHkgQpaj+3iUuhXUuTgdgwFXdXfdMSsSustVk2MXfLI8b
	HrG3Ts8P6H9IymdhvESmuKeJsoZ5wP3XJHCAc4DxGeIxuDnTRlgq++2eohYLoZFrIO9JxM1Uhp2
	WkeAotsSxpNIkwskFkURfNqn/pWXaz1YHi7vvE/2fAN5k/EBxKhpEhqRD1mbXZ3KvX2gp4+zye2
	4v1HsZLk/DF2SDbUO8FEBy+myGeKMwbu6bxO+5BruwzDSuyREUzc1S3kmU8lXNa5EiQj74eWeOG
	1MYURkkt+KjC7M6m0wIkj07Xt4kTWypQPh0UvFDfwqbz6fPxLfCkslMRTq38n6WNU1wIf7M88oJ
	um9VKY6zVztJs4fjPiC9miNnUSfVvJTg+YGcmaRicPnyPEsjSgVJ1Ai69oH8ohDXJor6Lyo0781
	oueNQFAOSKIQIiw1KaP4Jf2LLPYefXybtN5gIwZogl
X-Received: by 2002:a17:90b:1c02:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3b182eabbd9mr6151443a91.22.1794506637938;
        Thu, 12 Nov 2026 10:03:57 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae97e783sm380102a91.6.2026.11.12.10.03.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Nov 2026 10:03:57 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so75298a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794506635; x=1795111435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4vlXeE9enSxQAZM/AVNB/6k7VuHl6mXvqO/NCZEaN1w=;
        b=fQFpGwjwMbR3NB0o6to9uADuPFS7ufipGTgnVsMMohE3zzImvVR0+vV21hmppLVX3f
         lSJ83JELBKocUBbnCRb4QaOwnsbFo0cX03gp8q2CDpuFjtk6+aQGGzur8jvFYsYaqEUR
         yPLJCt9vE5vEUqYPSx2XaUIlJUvoAMBXbmerg=
X-Forwarded-Encrypted: i=1; AL+hErE+xayzguBZURSR4M2EO9DgV023PLDHWwFEctjZHmg+xQVBBBDYVczWo13YpukiYfKlpkSGyputlw4IrOY=@vger.kernel.org
X-Received: by 2002:a05:6a21:9216:b0:3e1:9071:acdd with SMTP id adf61e73a8af0-3f2ff0dc5cfmr6424023637.35.1794506634799;
        Thu, 12 Nov 2026 10:03:54 -0800 (PST)
X-Received: by 2002:a05:6a21:9216:b0:3e1:9071:acdd with SMTP id adf61e73a8af0-3f2ff0dc5cfmr6423986637.35.1794506634267;
        Thu, 12 Nov 2026 10:03:54 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18abc06sm95004a12.22.2026.11.12.10.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:03:53 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v5 5/8] net: dsa: b53: use the correct override register 2 Gbps bit
Date: Thu, 12 Nov 2026 10:01:59 -0800
Message-ID: <20261112180202.324504-6-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112180202.324504-1-florian.fainelli@broadcom.com>
References: <20261112180202.324504-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The IMP and per-port GMII override registers swap the override-enable and 2
Gbps speed bits. Using the IMP speed bit on a GMII port clears its override
enable and leaves any previous 2 Gbps selection intact. Select the speed
bit alongside the register and enable bit so lower speeds clear the correct
bit and 2 Gbps sets it.

Fixes: b6a8a5477fe9 ("net: dsa: b53: fix resetting speed and pause on forced link")
Reviewed-by: Jonas Gorski <jonas.gorski@gmail.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index 715a0969eacb..6b4a94a97d66 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -1427,17 +1427,19 @@ static void b53_force_port_config(struct b53_device *dev, int port,
 				  int speed, int duplex,
 				  bool tx_pause, bool rx_pause)
 {
-	u8 reg, val, off;
+	u8 reg, val, off, speed2000;
 
 	/* Override the port settings */
 	if (port == dev->imp_port) {
 		off = B53_PORT_OVERRIDE_CTRL;
 		val = PORT_OVERRIDE_EN;
+		speed2000 = PORT_OVERRIDE_SPEED_2000M;
 	} else if (is5325(dev)) {
 		return;
 	} else {
 		off = B53_GMII_PORT_OVERRIDE_CTRL(port);
 		val = GMII_PO_EN;
+		speed2000 = GMII_PO_SPEED_2000M;
 	}
 
 	b53_read8(dev, B53_CTRL_PAGE, off, &reg);
@@ -1449,11 +1451,12 @@ static void b53_force_port_config(struct b53_device *dev, int port,
 
 	reg &= ~(0x3 << GMII_PO_SPEED_S);
 	if (is5301x(dev) || is58xx(dev))
-		reg &= ~PORT_OVERRIDE_SPEED_2000M;
+		reg &= ~speed2000;
 
 	switch (speed) {
 	case 2000:
-		reg |= PORT_OVERRIDE_SPEED_2000M;
+		if (is5301x(dev) || is58xx(dev))
+			reg |= speed2000;
 		fallthrough;
 	case SPEED_1000:
 		reg |= PORT_OVERRIDE_SPEED_1000M;
-- 
2.53.0

