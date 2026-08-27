Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205F437A826
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787794599; cv=none; b=dAQtfuWs4loLknwIUxVP1TAXz0abL4wQ6g1aLBIDPq6qGr5gGbDDtucwsZQRf3ATcmr3E+nUTFCn0uIzAweJQhF6Amvm0HFAAlMf2Yu2Clxml5RhTHdlGdk0cYUOUEt1ztR6Y1Ta80BBwKV8Bj61uCcEGRD5G5AHhbm/CTA6McE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787794599; c=relaxed/simple;
	bh=8o4QhqDTzyiRPqZdKBYvXh4MWPFiKRWcYZxGTdgZi7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OImX/Ayq5Szu8FzlycbEFr0fZgRiKIvrFzwHN2ZI7P2eFAImL/TNuzrFb+JbQoZpVmRP4VFYWigjnpGhhZ1x0RmzAwBjVSWUFPURNc60Eb1m17ZSD3KEZVD1kZB5XbK8yDieBLT3TFef+fBhT6SxXvvGk1hy4oC4bpUn1k/GzD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PaS8bosp; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PaS8bosp"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso2187978a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787794596; x=1788399396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P8RslJAAyqdhFQpyr/sYYgRXhKwruiBZvG6osvNqKxk=;
        b=PaS8bospJeklCDTCXrREPGzFxpUsdegBhhhnglLtejoTiXIl4pt1yCQNesm3++5lQy
         XFrnFrtDRzBOjgeSo3B8wyUBa2YohkYLYXHSARZUS9Dtf0jVSZR9phnfKjLlvVYghTGT
         GoagHLY4PuqgEG7J0QwEtz7v0lSe3cK0T2az6wtqcGW/EshQLP14Dg+vdszfMBcBRfOl
         dsc/xoTJr30MsAQc5PeySFm3XJI3ph2ZHgCPpNZvQptLo2S55x/bUdQeJdTLrSG3XQmI
         Q0TohLUBFzjKZNq8LP4MKhZFLy1nVqP4pqE+CSmE1Lcv8Qz2bjA9QBustVolr/pDDTyy
         onzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787794596; x=1788399396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P8RslJAAyqdhFQpyr/sYYgRXhKwruiBZvG6osvNqKxk=;
        b=L6ekY6v7CU/ogKxqvzppx36+v47OEEUTMVS1IS7JaRc3TPSc9JX2p5xATDSc9hzcOx
         aa/2fgAUp1dj5k+5R4va7ZIAs59OMTX8HfJHgjoBlk8mzWyl+vjNqUwYFcZAiehcVdQs
         yjN7S3wLRSRSicyq5ejfKF/SdFYEW8HX9ihqKL2pQt5Q3TqXR6a0R7wG7r/3E9pnOakl
         VO8K+2H9bS26L6DADBynLHC/MTwAqCCiTQh80cCRoIXy/IZFgc0c9mQ2bkwmUli4N2eM
         NhMQmPOYjqNTVTXMRe9kiD0ukLoAGSLPEgO5bC8kYxX0F0xw3LIdburvmJJsjNatTe5c
         6bDA==
X-Forwarded-Encrypted: i=1; AHgh+RqVpa/rmsLW5IV96oiYapmNFPqTSImEg4lik+l1XjVyVv57HAw12dbbWRSon5scyAWi0jivMpcf1onLmQ4=@vger.kernel.org
X-Gm-Message-State: AFuF++lFwOURuPRY4akUQ8qeNGNmLjqzg68UR61t3/M0mzcDpl4vmKC5
	lZADkT9tfifmlaYrCVsdeJA4kbMJ08o7lBLMSOdxT0bmNBbdv9iG9Uco
X-Gm-Gg: AR+sD13B/VpCK7XWu7tF1x3k13MyFvdbtdhcY1IFmOMjI9Q43ZN36H13Zax1eCNLBPu
	BGDNZlLqc2zksWdBLYhzIvCBK4WcWdktoS9LsbzSdenMfIk3Xa1n+PCso7z3Wx+y2dfrYuZ3FAd
	nIx4D25hislqSsZ2s3EJretHq8YK8Z9OUeUrCsX8Qo8cRoqNcFXpEltcQvdmHBa6AJQEoKKGnN5
	CRMxhD/L5Y2Sjp4chtQGyd1JpT3jb7DgOIvuRvz8CC2f97qDhvjnEOOe8nL9fRSZmUt6Q+gNEq8
	DARbnlR/iXdECGvcK1Nz0Kh2FJW/PYaq/2gJs2wHknKtC2xTx+ZO9svhu8+NCYiXpG+kODGOu1J
	a2ZWh4ETH0oaAxn85mtQyP49FS+wBXorxxKXtoHZ4erbpQvHHR933nSqE3S8OYTRf5D/dA1yCPU
	4c69E1tLdAyDqpgUL/P3xeCXepwb+Ku+KcvAv/2dZwV3283Klbp4s76KFNX90yPSbBSEfoAZ1KS
	d+RMJzXYxlPSBnEQ33hND4ySlZp2WErSKchr+UQG22SQ77c4PB5aqXr0kJcHK194J6FLcmHRhtn
	Hlo/ACvJwBMx9hr7QvP/aRwpCLZUA5FxnPr+PCAa0gmfcf8K
X-Received: by 2002:a17:90b:390a:b0:396:5785:843 with SMTP id 98e67ed59e1d1-3966d203a94mr20643518a91.8.1787794596431;
        Wed, 26 Aug 2026 18:36:36 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea7fa9sm551887a91.4.2026.08.26.18.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 18:36:35 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/INTEL IXP4XX ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: ixp4xx_eth: handle probe deferral from of_get_mac_address()
Date: Wed, 26 Aug 2026 18:36:34 -0700
Message-ID: <20260827013634.167932-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ixp4xx_of_get_platdata() returns NULL on failure, which the probe converts
to -ENODEV, discarding the real cause of the failure. Return ERR_PTR()
with the appropriate error so callers can distinguish cases such as
missing DT properties (-EINVAL) and, importantly, handle -EPROBE_DEFER
from of_get_mac_address().

Fixes: 95aafe911db6 ("net: ethernet: ixp4xx: Support device tree probing")
Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/xscale/ixp4xx_eth.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/xscale/ixp4xx_eth.c b/drivers/net/ethernet/xscale/ixp4xx_eth.c
index b0faa0f1780d..b8889f87ca03 100644
--- a/drivers/net/ethernet/xscale/ixp4xx_eth.c
+++ b/drivers/net/ethernet/xscale/ixp4xx_eth.c
@@ -1444,13 +1444,13 @@ static struct eth_plat_info *ixp4xx_of_get_platdata(struct device *dev)
 
 	plat = devm_kzalloc(dev, sizeof(*plat), GFP_KERNEL);
 	if (!plat)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	ret = of_parse_phandle_with_fixed_args(np, "intel,npe-handle", 1, 0,
 					       &npe_spec);
 	if (ret) {
 		dev_err(dev, "no NPE engine specified\n");
-		return NULL;
+		return ERR_PTR(-EINVAL);
 	}
 	/* NPE ID 0x00, 0x10, 0x20... */
 	plat->npe = (npe_spec.args[0] << 4);
@@ -1468,7 +1468,7 @@ static struct eth_plat_info *ixp4xx_of_get_platdata(struct device *dev)
 					       &queue_spec);
 	if (ret) {
 		dev_err(dev, "no rx queue phandle\n");
-		return NULL;
+		return ERR_PTR(-EINVAL);
 	}
 	plat->rxq = queue_spec.args[0];
 
@@ -1477,11 +1477,13 @@ static struct eth_plat_info *ixp4xx_of_get_platdata(struct device *dev)
 					       &queue_spec);
 	if (ret) {
 		dev_err(dev, "no txready queue phandle\n");
-		return NULL;
+		return ERR_PTR(-EINVAL);
 	}
 	plat->txreadyq = queue_spec.args[0];
 
 	ret = of_get_mac_address(np, mac);
+	if (ret == -EPROBE_DEFER)
+		return ERR_PTR(ret);
 	if (!ret) {
 		dev_info(dev, "Setting macaddr from DT %pM\n", mac);
 		memcpy(plat->hwaddr, mac, ETH_ALEN);
@@ -1501,8 +1503,8 @@ static int ixp4xx_eth_probe(struct platform_device *pdev)
 	int err;
 
 	plat = ixp4xx_of_get_platdata(dev);
-	if (!plat)
-		return -ENODEV;
+	if (IS_ERR(plat))
+		return PTR_ERR(plat);
 
 	if (!(ndev = devm_alloc_etherdev(dev, sizeof(struct port))))
 		return -ENOMEM;
-- 
2.55.0

