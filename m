Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3115187F5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167112; cv=none; b=VDdYWJkTVwKgsOW1cafA0K2BV9qGUrIGLM+oDK+rqjfOJEz6//wzVlse4h6jSfLWlU4LSv6c3zjWGdorDUVluRQ/TxRsaO9/S3a0t1CiGrx2DUHOiX51hbYMlkSui8QgieXL0Ar3rd3ioA6kaGVw9LLCltzODlh5HXzzPP/AwsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167112; c=relaxed/simple;
	bh=ajBlGar5lLVf70pEAWc6gwQBG7Kn+no2fIRZYpDmLvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OhXiJRByQRCzttMo/Qgb+V0Qt8xEfsr0qfM4VEgdP+HKbFf+zJ9FCuU2n+k6M0omoKkMP+s1NGZ3200rwXX7rBxRNFZAD0WWQpptu2k+Pb66WsvIIdz4cRxlXOSS5eHet9rHH0ksOlLUQp4aBz61L5Z5XAuKJtDcacDsIASYjXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSnlDsXc; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSnlDsXc"
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2ddbf74c12cso6656095ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790167108; x=1790771908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1UQRnFmVHWe9Z/cGe8zLRoDzdcB8ekJGDg85/atBZHs=;
        b=YSnlDsXc7uyB9jWq106LrfbjH4j1eUU9ilUC25tbDHhSt7ahs8UzR43ZGwmHafFJ8k
         SkpeNwbB96A7S+3ZlIUAhyqb0v8AyG+f7kDs01tVFD7mo/W5oFOS0b8MLwqybnFDtrRR
         gahgmRz+JMxgM4ZIcQjHfZEUgeSFfrfMlLFJJ5+Ecy6AdlFKN3jIxTV0MYXw4XJBx3zP
         835/0qzYsljPu6aUe7bcCh0mBacAKslrAsrFFOSy8665e0h6o/pAnYoCSP9kcZyA+Jt7
         R/OXj1zaLFSQgpiMMntpEMxeWnQ2U2pjQQWLCbeSxSbtNURQTL3NIQZOyS7dQtJUOAur
         iOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167108; x=1790771908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UQRnFmVHWe9Z/cGe8zLRoDzdcB8ekJGDg85/atBZHs=;
        b=GLb5tsMJQ/5eL5bATfu1kjTCLc8nxxukyB8uvVvAOf4ZLvoP94UkVfvGRre8Idm006
         8RZsLEo239unG8FnWnWhsPUp8/LiqzCAGQhWmbh9/zLCZ0om00dqhOzbndlOQ3MM1k1M
         TZtsoEuENO6ckP3rqa8g11FzDfup2y2bVzrqdoeoAr+JcrQrxiyPeVZh+JKA0XlMwoMm
         pPOVWFeieH+QRFOtBBlt4wskeD1PjZPZemJAZ/YzElwtiWeIHL0pq3Mvz7VoQylOA3I/
         1B/RDIfKCJaymDzS3mGQDFxJrJLbe0q7eBQ6UONT0yuDp4ElGob6gjJlBvUT5WyVQWjI
         5Fbw==
X-Forwarded-Encrypted: i=1; AKwUvBwB71wzdSeMPURlWXoL7H1Xmv9dTmnQacIp0sV2O0qjWzOHy3RpE9ne6Bz/nJjMDyMjkLlAd0U/Nby46io=@vger.kernel.org
X-Gm-Message-State: AFuF++lTt1wNHiIokHTaE9J3xjmzGm1EMLvi6sSV2eHcXDD5hS3e+fj6
	99FJlgd+Q6sRx5ZTJ9Ca6TrKPKhL3O/a7OmNCjhfwPwm8YtT4XrArU4R
X-Gm-Gg: AYBFou3xI1+LY8ssM2gDHjklAElmwg3Y5S9IADXzugJIcx5RrVJoX//KwJ8HMOUE8Yg
	fOcV95DA+ifpJ6ePQYngRamYsLYayN5v5EO5SWFFzBLlEqSMjk9UWz08rP+RLFJPwcyYV3LWMd4
	m4GRIyEt06jq2E7smdlvjC/TxXIJtPTW4WVPMcvPNXFQ2fg7SvnPoVFkOIX/P1CGnlWyoJqJGSf
	V+mUrmJ/rXyiv6dtmkPfKuren++j6qICwmdWLLKUtFSRJX3eUQHw5xh8byN/FAiilZVP+iBj52u
	Cy+G7li2EO7elNAzrhndAc8no2AGBPvvTybloVoVErby5n8ndT5dUlIACIsIiJ74OjU0X/AKwa5
	v4tfxh3ZTWbuA1XgiSZc0ZT4S4jRCCm5P5AoIw6JS8tVW/KZZxkOboJf2HyNomabHyuwu2QOOWa
	ecwXzwIkujV0iE7RYTyK1VFVZLu2bLifErVinKmVVHAzmWwW2WbaRLwyFJx5YAOoxej3qqvjv+0
	TksQ/I=
X-Received: by 2002:a17:903:1a86:b0:2df:5a5b:5763 with SMTP id d9443c01a7336-2df69d1ae2cmr22719205ad.10.1790167107749;
        Wed, 23 Sep 2026 05:38:27 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6afc80easm9220405ad.30.2026.09.23.05.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:38:27 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH net v2] net: ethernet: stmmac: dwmac-rk: fix bulk clock leak when the PHY clock fails
Date: Wed, 23 Sep 2026 20:37:13 +0800
Message-ID: <20260923123713.3137146-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gmac_clk_enable() enables the bulk clocks first and then the optional
PHY clock. If clk_prepare_enable() on the PHY clock fails, the function
returns without rolling back the bulk clocks, and bsp_priv->clk_enabled
stays false, so the later gmac_clk_enable(bsp_priv, false) becomes a
no-op and the bulk clock references are leaked.

Add the missing clk_bulk_disable_unprepare() on that failure path.

Fixes: ea449f7fa0bf ("net: ethernet: stmmac: dwmac-rk: rework optional clock handling")
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 8d7042e689261..72bdbcb5e863a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1162,8 +1162,11 @@ static int gmac_clk_enable(struct rk_priv_data *bsp_priv, bool enable)
 				return ret;
 
 			ret = clk_prepare_enable(bsp_priv->clk_phy);
-			if (ret)
+			if (ret) {
+				clk_bulk_disable_unprepare(bsp_priv->num_clks,
+							   bsp_priv->clks);
 				return ret;
+			}
 
 			rk_configure_io_clksel(bsp_priv);
 			rk_ungate_rmii_clock(bsp_priv);
-- 
2.47.3

