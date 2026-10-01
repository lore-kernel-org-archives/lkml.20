Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1DC5326B1
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869426; cv=none; b=owcrpKqhqWNS9zzuvmeceHnXbXgncbYXp4mgNfyD/jxeNAl+3u22hFLTBg/uBjrq7gnkf/zBX24RCoA1vXr1irQaKNHeO4VB8hKVfA7Qxsu+VKlG3nY31zsjvhdGVLYH1u//Dd6KmcoDuaKixbJlPQEk5dcIs/9OoPzVXOrTgTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869426; c=relaxed/simple;
	bh=VvKTppGNRfCJQy/hfPQRfmRYdr38rRvDH4X3/CkpjSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l+kN334oupbn6WGtp44BQDvY0NnQ1QHMf8ayAAsrV2wigPZ3s0n8EeCEhg0OjPRN9FqLHUC+Hjst4i1RcCMonEJTUPUQ0VYvzHnLFLbTlAX04gihu/A+VnhZ7sDdbAx+2gwhZypjc03zhibWpYvOOOklLRgOOJu1ADHMiPoDc+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muBVL9Zn; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muBVL9Zn"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so49292245e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790869421; x=1791474221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJYgC0qYDLIu82QOmmbXhf4D3HyIB0ff4AiNtPS2CKs=;
        b=muBVL9ZnYXXMLsA47KqwJBdXEgK1FtaF5bkh8eE/7vyR4gDjG5I1jg+vZf4wE1xkmZ
         GH/qPr7mql2XAE6jaGTlBw9677dsmB9GguldNM3iOkWx3dkRMRJv6eXKmt5rPKdog6wg
         N7iUkmJ8EnZvx10TdX5mbVbEdCrtHy6qIveQSV1rgXCkZwjswbrZCKGfdUfUV2lAXIF1
         N6umUXXiNCHWy9tRTIrcCWpCXg7PU1po2El1e8plMyBpNx23nuaRg+n4Cx8lktaIQUkc
         ABm0h9On3277Y61UXJ1RbfXs69RxKPGYt3n/XQgiNlOeMQI5UIkksnCKYmqnSG/+10P+
         Y38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869421; x=1791474221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tJYgC0qYDLIu82QOmmbXhf4D3HyIB0ff4AiNtPS2CKs=;
        b=YQZbSbS+pMtf0oGudP1wFfUoX8NKtidxOD+PxhQORFnlxgUvA0mopnVij55bWAXgNp
         nY4OqiyoSluWnuP1sP8jOurWH58eg5zjk3E8v6MWFenKiPPwi120vigb5LAfV3+QJAkA
         p8dSVnNOZ6f4K8wekxKVZDnGHI5y8MxM4IZGZmSv1q8b6rQVwKQz3SVt3aEPDLYUekfA
         OzVG3Qac4eTwRC+LUIktfL2MMasP5i2J8zxPpwPLFkaL7JgSZSr2oohU20mPtjZq07L5
         Z30I+ay4mXZaQR5Qh8ew+65SvInjSNfhzDUn1/QaZ2Qap07Z8pts0JqkSb7deU4IW6tS
         9OgA==
X-Forwarded-Encrypted: i=1; AKwUvBx8KgHVA0oti3ynqfrk1VNvGzf0iWzUOw+LRNYonKniOZL6+Q3NdE28/hec3GUz+YqyQbk1oXNbLsSL61c=@vger.kernel.org
X-Gm-Message-State: AFuF++moH9W3XKR28zCqsY0IMTdjK0nUDuYXXawmmgP+3yA/RcQ4poy9
	kpy//B4NVOw6xQ6zfNPY6PnFX9zk0l2SqzqW+MBuejyAamkmOFwb5sdo
X-Gm-Gg: AYBFou3Cl2ZO+2/H8PZqABdUYZb3wpflg6S6om9AfAqEYyjhEaKAeKsnnGgIsvwBnZd
	gN+EvzJfs4N7cF0ojpR1dPY5WAkI1vt99RyBeC2aDpsHpvX3huZHJYmKQLQOb6uquYkKjS+ayb1
	X3synWtAHi5TxANX+cH5CFNINpm65laqYkDdxp565z7u8PeCc1+djKWx1fqGwl6B/IGvYsTD4Sk
	3NV6JCEGGxNebo9XbQvVAzD5JkxFhU4dZ82Z49qekpa2hVNuJUYrtl+dDy2fbb05RD1zaVxXC1D
	xn6qgluHiYBPiBvFFmHhR7+PqkX4ep5HZO4P6OFTSQy5i1RuiLKJjfVtb4EnotvL7wodUSuXNvO
	CL3QKeZwELayB+xUX+A1Yt5UCfK4kCbsJuXNAOoXdRiHPO1LWS9D6NZMlAxUKHR8ANIMXmEDODn
	rpsvNfBCP4H767nERSvnza5Kh2v3/ovlXyHDEjabz2WeE0O6CE67sVk6KyQzxDACprbdEbFKWv9
	yq2n3+ohQRIlhhLFHO8KqNC7PkZ6FqQya0j/RBGfXqxxxJJASHaciUMMcQ1JFvwda3alSocDIkM
	sJwG2l+7ZFMJo5RT4OY=
X-Received: by 2002:a05:600c:c089:b0:49f:eddb:bcb1 with SMTP id 5b1f17b1804b1-4a0275a0a9bmr134335e9.25.1790869420845;
        Thu, 01 Oct 2026 08:43:40 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f6db98fsm65195615e9.0.2026.10.01.08.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:43:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v2 07/12] net: dsa: rzn1-a5psw: Make use dev_err_probe()
Date: Thu,  1 Oct 2026 16:43:20 +0100
Message-ID: <20261001154326.754314-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001154326.754314-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001154326.754314-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace dev_err() with dev_err_probe() when reporting failures from
devm_clk_get_enabled(). Clock retrieval may legitimately return
-EPROBE_DEFER, and the current use of dev_err() incorrectly reports
such cases as hard errors.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 846216f22bc3..bdfa84745eda 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1234,15 +1234,15 @@ static int a5psw_probe(struct platform_device *pdev)
 
 	a5psw->hclk = devm_clk_get_enabled(dev, "hclk");
 	if (IS_ERR(a5psw->hclk)) {
-		dev_err(dev, "failed get hclk clock\n");
 		ret = PTR_ERR(a5psw->hclk);
+		dev_err_probe(dev, ret, "failed get hclk clock\n");
 		goto free_pcs;
 	}
 
 	a5psw->clk = devm_clk_get_enabled(dev, "clk");
 	if (IS_ERR(a5psw->clk)) {
-		dev_err(dev, "failed get clk_switch clock\n");
 		ret = PTR_ERR(a5psw->clk);
+		dev_err_probe(dev, ret, "failed get clk_switch clock\n");
 		goto free_pcs;
 	}
 
-- 
2.55.0

