Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F083AEF3E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788332326; cv=none; b=i2YFPGI38hY+lCUA4bYj/Irk/4ejuGt6n5FZPcrYf6Xi5SH1JDIi4jIcARisgtaI+U9gTBOT6J0k+OzeYCqHGRtjSqf8Kq/ByYLRParrqREXs8vtpn4gjwoOpT1kQU01W4inmpJOEolELIdMH01mad37lhes3vpDqf4RZnZfjLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788332326; c=relaxed/simple;
	bh=iAzfWXsErr1U/mjSNoUC/0p6hO5HW9SOUrglviLFqQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PPuMQp3kKtT/QrHr4DTMlcOfqLeAObiOW/1U1kDBbqXK75qzcDjfG0fNgEPN7WVynTaRu4dld+4N0C5vlYGm+KgcxmNm0aKafXA7E9LExVGzmuN2NOPCL9ySM7YJhTEvNNd7gDBUwMVKs7Y0P8CTA8yLR6/GBrlT+W/InoaaLxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAt3I2vH; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAt3I2vH"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc149372c14so542987a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 23:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788332316; x=1788937116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jWHWfieau1Bus73U6m08/3Js6uHSvvzNbcHYCBGfH7A=;
        b=aAt3I2vHzJWSSEVfM++iAQpF61NehXRraj/Ws7xGSHkRpTaToqW90z9VowyDxPp75C
         qZXYPVCJXubJZr92B47JMiE6KQonLZQ6DBAQM/2spyYHQUPpcGQOmk/7MFqvfksTlRLp
         co4EU+4emN3LZXiNDXOANaE20xffJFRJUcYp+bfUScjWsw0Wpn0Iz5+RFY3c5A8FEhrH
         H+Q8ZYmyFWHFSl7lL2h8OLhmg5f42Y2YwNELq4xCGdo8we7FO531PW21mxV0WO09SRDF
         vrKmFB7TffMNi7lW/MukWRbEyT9KDnKj8ssln47GhuglSrN97r9UmSNtYQML5OzEuN67
         90vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788332316; x=1788937116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jWHWfieau1Bus73U6m08/3Js6uHSvvzNbcHYCBGfH7A=;
        b=Dl3xlBUgV18QX3r0kUB8KGQJen+jMQoeQ606Sv6bGwwXpnnC4V6yXhxzL7/dCcKzbV
         Oo6Oru25MiAG7SxtfS7X+1m3fwE5wqfKJBnDHorVWTV4yg3Akz0cSOFUaBqJhbTnhDHt
         /uSpwDhcJes8x4l03JBTuTOqJjOZF+Jn5P6UJtqkGIpka6d0xLCI8uu4DWwU0ZWzneVs
         QxqILxILTi0MnQiHVDSsO98SHyFT39z97PMfR51jsYLghWZG6o2tJsC19yDQHhBRAdUi
         qb5QX+V4o3ORT0/XkAZRctkoogIYGpakVcyMFnqkdM6STKx8F7XeRuhdqcSmgawj8xSD
         HCrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBDGMyXR6uZHuCx9TR33G21Fk1mAXMtFYCCyuF5OTvzLG5TlTpIAVuZ1W+TYK21rU5vNUMtg+h6wFxgSQ=@vger.kernel.org
X-Gm-Message-State: AFuF++melZxGI2NDr4Fnl5qT1g7hK8YNXrLghIFAlXMch5c/lLbjNpzV
	nC0JIIYm5NYuSuy2kjEOj176lPB2zf47n3npsHM0g2va1KjWJuKA3kU=
X-Gm-Gg: AYBFou2i2WNTelWOmXcVIpTeBp7DML2qXtpbxYvnjkJ6kk+8KdrKH0i4pfwbtSCNoFc
	4haEbKVNb6rQgBttLztODghaRwcEIXx64oMn2RdRFnX1u3Ffwv1zFl69g9sAmSN12WHeHpVYyCr
	HdbTX6BtAPTJENeWgBmwGlzjuiE4GV+EZYDFEzUlCJVpeVcJMDmpNo8W4+FWbcvo9xzv8vDanNf
	c4cG9fkZVHuUA/bHHCTua1S5yV6T/ps2PEWSwXVRVyVCftWQrHRtOtNFB8sd4l7Oi6YKzoAgoZN
	1RUV8ryhaUxyYyI3hUntC3I15Z0PfdMZKPddSJSPyFt+/6GoGIHKjIvH1RfLuq357Kw93zUaKez
	WDysOmXJ53zicNP/hMp2sMFb+npFAVNa1h4eSQmaW0JwM4o1/nqh92lhBRfizKe2cdsYwQXODBe
	ksYyzotv7ZsT5lVN4t5yZQK2Lgk8SLjxCWdPFrflpr3rjOhAXp7nRRI7J71tF1icoiSmKAnnwAL
	WqrKJQk1AThKXRN
X-Received: by 2002:a17:90b:5343:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-39aedec7bccmr4308881a91.3.1788332315799;
        Tue, 01 Sep 2026 23:58:35 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:6496:3266:4b24:78ee:4b4e:2dd4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d7bb9d7sm10205606a91.15.2026.09.01.23.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 23:58:35 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alvaro Gamez Machado <alvaro.gamez@hazent.com>
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: phy: dp83848: check phy_read() return value in config_init()
Date: Wed,  2 Sep 2026 15:58:27 +0900
Message-ID: <20260902065828.1031113-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dp83848_config_init() reads BMCR to detect whether auto-negotiation is
enabled, but does not check the phy_read() return value. On an MDIO read
failure phy_read() returns a negative errno, which is then used directly
in a bitwise test; the auto-negotiation state is left undefined while
config_init() still reports success.

Check the return value and propagate the error.

Fixes: b718e8c8f4f5 ("net: phy: dp83822: use BMCR_ANENABLE instead of BMSR_ANEGCAPABLE for DP83620")
Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
Only compile-tested; I do not have DP83848-family hardware.

 drivers/net/phy/dp83848.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/phy/dp83848.c b/drivers/net/phy/dp83848.c
index d88b1999d596..e65651ac567a 100644
--- a/drivers/net/phy/dp83848.c
+++ b/drivers/net/phy/dp83848.c
@@ -117,6 +117,9 @@ static int dp83848_config_init(struct phy_device *phydev)
 	 * we check initial value of BMCR Auto negotiation enable bit
 	 */
 	val = phy_read(phydev, MII_BMCR);
+	if (val < 0)
+		return val;
+
 	if (!(val & BMCR_ANENABLE))
 		phydev->autoneg = AUTONEG_DISABLE;
 

base-commit: 70f3995830d3f1e79faa14eb0605914f778feca9
-- 
2.53.0

