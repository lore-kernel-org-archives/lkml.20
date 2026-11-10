Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326805;
	b=5SLXu309Qdn3rIaehE+gxXy0I0VYIi+rbohGfEB3wIQxhcgMwivaae8qOiNiCbEh6IVQ
	 7KhPUCQaFyd+NCLpTeeivPr5Ofwu8pzCiuVINYA4f3vy/lrcu12Did5jCUT2QHEWla/7D
	 oYCJEComAne9CwxkiAKE3sjpGrOIH04J93haxvl66r91WMxBJBsa1925JEi26dsILMhEz
	 SlRzb2ltm/dRbebbkPmU9AalIvUerIdghkvtt4XWmmb8yVnxbo5z62L87rQRik+sX4+SV
	 HzL6yGyy6fAMYVTPqHbbyceaZvMl6wSHl4xIhG9+RpCzH2P2nIawns3eiCpxCGCaZ1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sVnxZNWX6ViUZL7bQPqGM+4jUAh9aQEpBFmSldUmrlQ=;
	b=jyunuWNgfV/A+ttjudkovfBKL7tX91bsGTl/LxIKM3F0QNyurWCcDfNFMDcyKmsKc/pF
	 I7kXv7VmT3rrclN1/L/hcjYuL2t8PIJH1BbD7yVhlz3QgY+uTEHimbc8zLG2vIqKGkX6G
	 B9JYz/Ifb0D+mm/kmGh7n6wOGxAqgXbYQD+khm59U5fPJ61bkzY2Er0Yrz7xUhclurBeq
	 K8mCRPkcvGJVl1y7a3kKaJsZA1qph9JihkR0O0zTVRfEYcFtwa9sN+rSaGcDT9Xtnm3VZ
	 NKoullXPV0v1kUp0NBlMVYQlTypVgYbo3RVZ4T8b2lp1wgpNEHnUnqSLFYRUPfa7jAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mBxOG0bK;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC668606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC668606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mBxOG0bK
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a6ce64b95so1483839eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326804; x=1794931604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sVnxZNWX6ViUZL7bQPqGM+4jUAh9aQEpBFmSldUmrlQ=;
        b=mBxOG0bKFPNB8BAYNGC/GRDeSNoUY8M2/yeZm4RkRzznq/7Y0v8/B0/nw2fkQ/kwai
         5HFo/7seH/bAOTE9jl7xxKtp+QlN8JKQZqXMOI3i1mGq5MhB3hv54o/UXcp783iaXdw7
         d1MMGFjeRL1mwWAvWDthSn3iNzrasBBjAmKU6cyqmZ9fNHvfUiv6k8L3T+7a2bzhhc08
         nELZuHfOzK6QlKftUOPwmMBVaavAecCM8T4J+7O9ugntOqi0IulvcWvZ+qXTmWzoDvjp
         pHUE4JMmJbORzhToVY7qCdbyPC9NxKOpg4mngNgwASiJjMqzSvFQ35UjHA+Jw1/oDIGz
         sh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326804; x=1794931604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sVnxZNWX6ViUZL7bQPqGM+4jUAh9aQEpBFmSldUmrlQ=;
        b=O6ancPNfK4fpwOeMI8fJUgwD0c/7uA6ebPwI2hM/3iwiln/Gl4lfIvAcbmnG8VQ2oz
         jFsGJZa/NqvYPJTTWPrYxB4JnDuIN2SYged9JoL2OXEwvX+6ha0syBQzgWs4UftEZoa7
         9B3Cb5s7JgrV0z0axJkmIzYwldJ24Wv6tC9US/sPL4/VAASOK0VH0WBuIuuaf151C+AO
         se7NDNP5iilOzmU/KxGbjUD8hSCSiPDv2G5dawAOqUBGD+BZxL2YqNKWgWqrgS2eceRH
         6Y4g5/ZRaupPmhxmWvLBJxY9EVMtdhkEGhkij/KOutGRrEgMuQHAC+FocOR0M0Y74nDb
         TKRg==
X-Forwarded-Encrypted: i=1; AL+hErEwapwCOW42l47kxJ8ljkYUaBOUc5P16wqeqYwqTj4lwrSBsBBhxpDej+shImX3sK70NvF4GkT3/8RIZQ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8L3hOZs7SYU78vue8z7B+VjVsTSUG4COxpabZCZZBCrP4S9BO7
	FLVL3aTY/aWN7I8rte6oQFj2p6OW7fw2ZfTQqrGFWGcVymDxGWjk7vpt
X-Gm-Gg: AYBFou2IVtex5SNM8/sIFYaa/rV9xnAikcvkrJeRSDiqQ8Ljnzrqumb4WCoWkRNIIzA
	MCmXSfbbMAN58uiISQN7/7+m2bTtx76ewJGl3+RAlri5PlMi3FPtdLHEuEjDff3Z/xKL9X9Xj6Y
	8Cfp5aoxHWh44/riGG4RXoSEdXdaAucSg+pPzc1sg/DeYwd6FaJjfxomvHbNxWmVLZBiVewTdWU
	tbcjqQjRw3tmwtmWgYrHubi2mt+zDOcqqJrNxyNiRS6qreOywydGY9CFlVofL2yLGSBR7ZNIgN9
	/4MdBNmmMJC5Ho9Qk+EUyAZNguAfzHOw90pUGeWYTPoYq9pPsO3LX0UjIJU1QvsHrpN1BAB6b/W
	YyFlVLQ0mT73H9RWPFTeS5tlkKWZ3YWuS8lYGDrQziJ1jM37s51gDeVmjlQiJQTwvOwnOoOLL1A
	rqL9dm3nf4HWDjl+RXOwOjtMH306R4bEOe1yeMvQMdN3W5R3e8xc8/yoqIzuApKjy64I3VEMxuY
	QvF7RhsodQpnaniil40pPUrUj4ZaskXlLuuz15Sz2hRrncXbTCkazOCs8L/ez3kHKi21o50jUx3
	J9G/FBXeJP32hnvNjE/Q2/vXZkFK8nNFrAlOB/CW1wLiKvS6
X-Received: by 2002:a05:7022:1505:b0:1b3:ac53:da84 with SMTP id a92af1059eb24-1b3b603ea3cmr4271960c88.32.1794326803608;
        Tue, 10 Nov 2026 08:06:43 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306e3sm8453403eec.7.2026.11.10.08.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:06:42 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiko Stuebner <heiko@sntech.de>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Fabio Baltieri <fabio.baltieri@gmail.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v4 2/2] net: pcs: xpcs: make supported_interfaces authoritative
Date: Wed, 11 Nov 2026 00:05:54 +0800
Message-ID: <20261110160554.918652-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110160554.918652-1-coiaprant@gmail.com>
References: <20261110160554.918652-1-coiaprant@gmail.com>
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

pcs.supported_interfaces is the mask of interfaces a given xpcs
instance actually supports. The compat table describes what the
Synopsys IP can do in general, but a specific integration may support
a different subset. For example, the RK3568 XPCS supports 1000BASE-X,
SGMII and QSGMII in hardware, but does not implement the C73,
10GBASE-R or 2500BASE-X modes that the Synopsys compat table
advertises.

However, xpcs_find_compat() only walks desc->compat[] and does not look
at pcs.supported_interfaces. If a caller ever passes an interface
outside the mask, the core would still find and configure a compat
entry for it, contradicting the mask the glue already set. This was a
known gap: the mask was written but never consulted by the core.

Fix both sides:

- In xpcs_find_compat(), return NULL when the interface is not in
  pcs.supported_interfaces, so the mask is authoritative for what the
  core will configure.
- In the Rockchip glue, build a platform mask with the three modes
  supported by RK3568 (1000BASE-X, SGMII, QSGMII) and intersect it
  with the core's supported_interfaces using phy_interface_and().
  This narrows the mask inherited from the generic compat table so it
  reflects the actual SoC capabilities.

Note that QSGMII is currently filtered out (a no-op) because the core's
compat table does not support it yet, which demonstrates the intended
filtering behavior of this intersection. If the core adds QSGMII
support in the future, the glue will automatically pick it up.

This is a logical inconsistency rather than a user-visible bug in a
released kernel: the affected Rockchip platform is not present in any
released version, and the MAC side forces the phy mode, so phylink does
not normally pass an interface outside the mask. The patch makes the
mask the single source of truth for both the core and the glue.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/pcs/pcs-xpcs-rk.c | 10 ++++++++++
 drivers/net/pcs/pcs-xpcs.c    |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
index ad187fba4e9d..e29f473776b2 100644
--- a/drivers/net/pcs/pcs-xpcs-rk.c
+++ b/drivers/net/pcs/pcs-xpcs-rk.c
@@ -480,6 +480,7 @@ MODULE_DEVICE_TABLE(of, xpcs_rk_of_ids);
 
 struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *pcs, int port)
 {
+	DECLARE_PHY_INTERFACE_MASK_ZERO(supported_interfaces);
 	struct platform_device *pdev;
 	struct dw_xpcs_rk *pxpcs;
 	struct dw_xpcs *xpcs;
@@ -536,6 +537,15 @@ struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *pcs, int
 		return xpcs;
 	}
 
+	/*
+	 * The RK3568 XPCS supports 1000BASE-X, SGMII and QSGMII.
+	 */
+	__set_bit(PHY_INTERFACE_MODE_1000BASEX, supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_SGMII, supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_QSGMII, supported_interfaces);
+	phy_interface_and(xpcs->pcs.supported_interfaces, xpcs->pcs.supported_interfaces,
+			  supported_interfaces);
+
 	xpcs_config_eee_mult_fact(xpcs, pxpcs->eee_mult_fact);
 	put_device(&pdev->dev);
 	return xpcs;
diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 6466e0ff2a98..46878a66064e 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -169,6 +169,9 @@ xpcs_find_compat(struct dw_xpcs *xpcs, phy_interface_t interface)
 {
 	const struct dw_xpcs_compat *compat;
 
+	if (!test_bit(interface, xpcs->pcs.supported_interfaces))
+		return NULL;
+
 	for (compat = xpcs->desc->compat; compat->supported; compat++)
 		if (compat->interface == interface)
 			return compat;
-- 
2.47.3

