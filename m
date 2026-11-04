Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816481;
	b=gK15wEE7tNKIhqxufXKLDpJQlVkc4lH4a28GMYz2/Y1yVz9Nf0xg+Xz3xGRYmgtHoErl
	 5sD2++Fd+bVmRXFlxJFIfHL7Hyd783heh00Casm4D1wrzecNM3FbdKSrmy9ZfM0QAlb8G
	 mLvxKx9bkPe0DQvmxd5Zkw/iV2V34gZyH1lw0lWtssXnVKZtK4BhOw7DPIjolwPqYrYpJ
	 m6o/etrDNPlmpClHhC9tixFFYJPyDaMPkMu9L84nnGcv/HIhcTeForsBDRQhhhqzj8kMf
	 RqlFoViWB619Mxa4YNoQOb/D9C5MLv3Cmb3lb3kbUdJd8Z//a4rR85uytl41OJQt50A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=OwabDHq3ZuxM1yP800nESKo0UbrLBX3Su4rzj0ky3Xs=;
	b=TsiPS3ROOp6taeMFDyNoqB5dGRBEDCEFAzqcn2pVRHyb25EE/4mk5r58Ossk9AW7LB3u
	 g909wfew/JW4LXnnPPVbTr+TVboExVQQKdby7Qn5PIPw8jGSo+EZRMeGbExkVuUeKq000
	 wouv6zDHY6q+z8Ou57SGhAx83tBAVBtuS3KhRejyUttGkBS+x3CfP0V4tWRgkfc+RUStg
	 8IRIb8MaLbJ3/vnZN09B45zkoPGv69qa1moNPmHHcQzuBLpmmEsYHqlEzsjeALUWe+rBU
	 x7bKtj8pA8nHTXdWBwaIRIkeiO1j7u54K7P2BwSr8z8l/jGg4eV+vU+JGWuFQ548qdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rgYBPg+z;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4BB608360A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC4BB608360A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rgYBPg+z
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48df4f540ebso545440f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816479; x=1794421279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwabDHq3ZuxM1yP800nESKo0UbrLBX3Su4rzj0ky3Xs=;
        b=rgYBPg+z8aTcOOqgqb2NigaNQAKH/UEO51ZtpRUUUQlGUwVBl9l7W1aggtunfwT//8
         h045sPyhYjb6sBMTREFpCPj3YMH2FxuBbJS9skFQpqeZeIINduFNJD135vC9sSerjMdh
         FCOoHuGdVfF0NikfDmR1G97i7H4TJKaB028BznSDF10dhnovHyZu0mOQTNhVAvc3woZJ
         gPtbxLjZ+4FyAJarICpUFq22ZSEu2VzoaGfoIGYwQeGB/nB1x5shbEDZQ2WZwrC8zRnb
         1LYLI1piVZYRcIhO/LJ1Q6Am9+tII3CWRI05YX5KRvqdhbjs1Zv5AyOwTkupSYKkdLrS
         2MjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816479; x=1794421279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OwabDHq3ZuxM1yP800nESKo0UbrLBX3Su4rzj0ky3Xs=;
        b=WMtoR4MgMxtokPcKmJ3MFdE6XtW6GJ8QxxNK1GwoicknaWtg7FgPYQ0kmaSjV0HW13
         3L29docv5sHLA3kHnSUJ9EvIWlBZ1Nh+RTKJK34Zit2RPVGSEwTjESJrMvTtyMAUKXjX
         GIAcAiOsBbDXAm2Ews/s0mqceRdzvuUDFJehEunR9WI4REYjL1IjTiht/ppuTR/CISfd
         Du4RD1TOBvKCzUlt1gWaNr+CrR136w/wtqROd5dSMLFmuJ8thsDDiTI9e72MJF38C61W
         dFtHgPK45s9XYnjC3ODdtcXq0mSxvQloV+nhvDm5K2yIuY/gjVIqk4PSduWmR/Rm07bF
         BoXQ==
X-Forwarded-Encrypted: i=1; AKwUvByT9TDfGo+QzgEweowdxs/jlyCQtenICrvBeef6hSvr4Xhd16nZ1RTn2dzetkS7SJayxZUHWvf85bXBoxc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+P81IDA1bK+u1MAsEp45shhVqfKfdcRu/womhMNj35MihEX3zC
	TuTVtErsVsX2AuI9E7yYZ//pKFrRAd+RQrO+N/cikz5FTWRDC45ndaxz
X-Gm-Gg: AYBFou0ZHHCVd1My6025WAGLwewysA7CTSP4jdr9TQgqlIBPV3nJ80fTMDDfWLGVK2M
	/1nsIdnx6wyT4+pVzrOsd8qhPpKvNAXw+7wj+svO1swxy0nRikikx+rYkYbnWbbLeK+vQYasWYV
	uPJ/ckI1RjbHvQwhU66a8uU5Bxsk32e8c2yJmkxXabTVyI9dwdGMZafqXOSbwJWs5W7UHTSywM9
	Il9FoGHIWpjZxjBLpvRBKU/kLoJCozhlyPfsfkMPIwuPOk9oxjZBmE7iGBOw/Sk6TPElYe8/S76
	hXOil7N51S+HWQEF9x5m5Xt2BnLurTQr644bPyei7JQUOhcSouAD8aKgnxb6Y/o/vtC0A0Vq0OZ
	jPwRc3djWCr/M2Bqv9SwX1OhBO6ADyPaKj9Mb/YCdZEoYBGnSTYJNwZtMkBTPDkqP0SGNBAmaXY
	EWtqnvvtVtqsuKzfPzlWVBVB3eOt/DT/ZE4eTXAe4Yj9CwPe9DdGDumbq1m1l+DiY4xPcyqIyNK
	8RwUvPiokySbv5Kk5b6It/XWtk0beeYzFPfdyE5RIcg9Ns6a816kGt0qCQVJX5uaWd73oek/833
	3pV8GlxJwpsK2yfQis4/vDrKEKkrGXvWEed8BmGJ+EGewAIxC+RCfwsFHNoteh00vrXT05+Ne8K
	3q12D52wci6eTsXPOSaL7o2dajowS1YeBUbclDg==
X-Received: by 2002:a05:6000:24c4:b0:48d:f9dd:e3de with SMTP id ffacd0b85a97d-48e6e511219mr37783890f8f.45.1793816478980;
        Wed, 04 Nov 2026 10:21:18 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:18 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Vladimir Oltean <olteanv@gmail.com>
Subject: [PATCH net-next v4 07/14] net: dsa: rzn1-a5psw: Add support for optional reset control
Date: Wed,  4 Nov 2026 18:20:55 +0000
Message-ID: <20261104182105.1102555-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for an optional reset control to the RZN1 A5PSW driver.
Obtain the reset line using
devm_reset_control_get_optional_exclusive_deasserted() during probe
to ensure that the Ethernet switch (ETHSW) block is properly released
from reset before initialization.

This change prepares the driver for use on Renesas RZ/T2H and RZ/N2H
SoCs, where the ETHSW IP block is connected to a dedicated reset line
that must be controlled by software.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
---
v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- Added RB tags
---
 drivers/net/dsa/rzn1_a5psw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 85ff1fd2bbfb..9daa5d8245df 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
+#include <linux/reset.h>
 #include <net/dsa.h>
 
 #include "rzn1_a5psw.h"
@@ -1207,6 +1208,7 @@ static int a5psw_pcs_get(struct a5psw *a5psw)
 static int a5psw_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct reset_control *reset;
 	struct device_node *mdio;
 	struct dsa_switch *ds;
 	struct a5psw *a5psw;
@@ -1243,6 +1245,12 @@ static int a5psw_probe(struct platform_device *pdev)
 		goto free_pcs;
 	}
 
+	reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(reset)) {
+		ret = PTR_ERR(reset);
+		goto free_pcs;
+	}
+
 	mdio = of_get_available_child_by_name(dev->of_node, "mdio");
 	if (mdio) {
 		ret = a5psw_probe_mdio(a5psw, mdio);
-- 
2.56.0

