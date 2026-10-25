Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792960324;
	b=R63Wn+uUAt6twJRAFcdApscmDBEtdalVoWApi0Fgb8MU8ODGvNeoYKfHAYs+vKfcFYpy
	 9Pb39a56Rl+u1NAAZmjpJ/ISxFOGjAWEzV2WIWlybMq7lDU8Du0hSiznleSLPL7w3treA
	 CxmDrk5WD5AGrt+7Ti9PqdY6ZH5qfSPQp6jc+9OVWGu0japEpBSvbQavUuwPagd55muq3
	 rW/n+MaG4VOdYdTsL1s8j2yvLm4pvGTNe190FI1TnHRG+lFTfkkJjunEYxrd4BR+gMMDK
	 i1kLIWjaIHytW6TF4JVu+rr99XP2vNoin6QP9wkLSzZ0++KWo4jCq3d70jYwZj0mvtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792960324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V/foU+cSI6OMyqIz8ju5t4yslf2nKCeuPGIY1Tz0xSI=;
	b=5g5xahhMy8QpDTsJ5fXZomkw03ua87GOGhHTrI94rVq7jX3b3cEV61VwC/79sWhxVTRU
	 81azKKTfxO3m/7OYvsSbtaPT/VJr9b5vidHoY9OMwdPJu+yEjZ2eiSqqVIhXRiUJSavxz
	 JTv/R1virtEhiqU4+XjzQlKUiw+DJIodnZ/k9oJos1UJGla6NGVfQyrd7UGDWM/Au/ZT1
	 ha76fbfwbdoM2i5FOrsnLHRcqB6bl4Kogcb56aIIAcu6hHPwCJeqfTekb6haBfJNjhL68
	 CjiN1qlbb+9f2U9uDqKodOQHWI7Jfxf/p67ogMbJmQe0iXMIrh+9xj8wy4KeZfvtALg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tFoNH8jO;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36332606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36332606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tFoNH8jO
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so332820366b.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792960322; x=1793565122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V/foU+cSI6OMyqIz8ju5t4yslf2nKCeuPGIY1Tz0xSI=;
        b=tFoNH8jO5oD4yvKeAuv5oUcHNujVbWhIuy8BfDaEJtcvjg3O60NTSmI+qVEElDW/X/
         A1+SQiwBj70VWpFA9/B5I2r7rA08a+GmrbgEgjSyhs6lhexzr/IODo7bBqAPHxQ4/XgQ
         qQI4eDNeaPK/vNJLPYM1y7DLAGYHFVloIIM+mQ1xD/vOdT/KuP6SjQr4bWncdSwXAycE
         ZQXLMQTzFwz1rRteUtvMVPhSEQpLGPZpxZELKIWpF6PKmJ0LAXVKfCqEWMpedNJJvckv
         7RGSf5g0Bo/tcubF6nussxJbybWCsHE7XhpNrwTySscx3iavu8qV01vEbjjA5lNbRNqp
         xeow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792960322; x=1793565122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/foU+cSI6OMyqIz8ju5t4yslf2nKCeuPGIY1Tz0xSI=;
        b=hhFZo0asGIvXbT8puO/n4aNQDB/m80SQkgOSMqGT+3hbwIaze0aLd0O4LGaWkgdw9L
         04+w8rwl85ZQgtgILDi9wAaSBB/ZkTP3q7tHsLbzsazgHLH0wDQudby3Df7/GWsVCJME
         Sp1bzqgXu5BgPSYUyDGXCXQrDwj9frDewS3NpC5rPRHPMKsB3O4qfD+5lkvJpB99Gd5s
         WEfJK4QLKg63DmF2BKqZ9C0houLeH55z6eQ0a7w3XPO2hY7M1CCo1MZj9NNlFsX/4G49
         XK3S3PWqZca5jhzWfcXcI/M4MG/xcSHkqP5+HXEIucIfExLI/aiZ2+QQdlu5009sP5SX
         acXw==
X-Forwarded-Encrypted: i=1; AKwUvBy51WSFnKJdqsXs3IO8rzfhUnPGx3jGm+QnoqvTtXMSEs7QGTIFHOEe6plOm1wLBeSMljM3BCeWwXeBIes=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdpP0chgdsdqkkHFsCwVrWTNX9m/SCh80hRsGN24zDqvTejkwu
	SuZwPIeOlJ8TllwiB42CbzEbCgpKhRRQAMVVZWo1JcJoJv5FUGQlfHL2
X-Gm-Gg: AYBFou3X63xKZhRGrbqzf9C4cA8jJGkQOmLagpaZf1xb5SEGj83AL8dR7m1boMtGiGA
	whkxCYBqrWwnSXl7rzrkSw+KHwEQJiJE3GNnU57CdAB1KZWMMItsu3ksudYlEMFqFfX+6KrJbLs
	VIXE8JOrlinbCL42RQ1q736AkPM6s3HdmVzQDaZmSnvhE20nQmHcNFDV3X97GSlDfTZfJZ+Aw0I
	M9Rgb1z3MDNh+FZqm0o1psz4dAqbtiyAX7JFp8BjR/hJTMI9sT/qxhbRb3X2RPRDagvsF2rOpUl
	OXRhrTkkw1n+QIjvSSS9gJRorzm5mWbfQXADre2YiIqDysghS2QmBgjV6I3Lz+Gh/EymC3RI2d6
	wI7gbm+sWnizmrs6iYWv8Trvvqx9xH2YQa8rg/+/RVUnhv6kSqJT70VFUashY2AyrkVfs4HgJr/
	WVs7uGX06cwD4MwT3QtIA2aGZWWDecRcXtv4G1IJTE3+F87Zv8thBSfBiLlV3an91OaXIb/Dn1b
	Jo1bRGMjV6FIH/JFgUOJv3+/V/NaF0QtenCsQpRdcyac20O/HObpf8spTRYvCQIsKC6ysNurDhQ
	HUmdCCaArk23tZ9WAnGUoe78gnYELbDGxpn4GKAXYe4bLg708kQmfJgIYHPuG4sWEFXFNbnCYL4
	zZGpWlHb4yLm4F0Ho0le2j4W0SRRDrp0GzRPRoUKEPR6A
X-Received: by 2002:a17:907:968e:b0:c32:110d:682f with SMTP id a640c23a62f3a-c46bddf7a75mr615460166b.18.1792960322486;
        Sun, 25 Oct 2026 13:32:02 -0700 (PDT)
Received: from localhost ([2605:59c1:3500:c210:a19e:c679:44e8:e9a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd79b884sm240272566b.75.2026.10.25.13.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 13:32:02 -0700 (PDT)
From: Selby Mashiki <mashikiselby@gmail.com>
To: Sunil Goutham <sgoutham@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Selby Mashiki <mashikiselby@gmail.com>
Subject: [PATCH] net: thunderx: fix fwnode_handle leak in bgx_init_of_phy()
Date: Sun, 25 Oct 2026 22:31:59 +0200
Message-ID: <20261025203159.455100-1-mashikiselby@gmail.com>
X-Mailer: git-send-email 2.56.0
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

In bgx_init_of_phy(), device_for_each_child_node(&bgx->pdev->dev, fwn)
breaks out of the loop without calling fwnode_handle_put(fwn) if
to_of_node(fwn) returns NULL.

Switch the loop to device_for_each_child_node_scoped() and remove the
manual of_node_put(node) calls so the child fwnode_handle reference is
automatically released on all loop exit paths.

Fixes: 9d28f9491258 ("net: thunder_bgx: add a missing of_node_put")
Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>
---
 drivers/net/ethernet/cavium/thunder/thunder_bgx.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
index b63039999..3fe3f80db 100644
--- a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
+++ b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
@@ -1467,11 +1467,10 @@ static int bgx_init_acpi_phy(struct bgx *bgx)
 
 static int bgx_init_of_phy(struct bgx *bgx)
 {
-	struct fwnode_handle *fwn;
 	struct device_node *node = NULL;
 	u8 lmac = 0;
 
-	device_for_each_child_node(&bgx->pdev->dev, fwn) {
+	device_for_each_child_node_scoped(&bgx->pdev->dev, fwn) {
 		struct phy_device *pd;
 		struct device_node *phy_np;
 
@@ -1506,10 +1505,8 @@ static int bgx_init_of_phy(struct bgx *bgx)
 		}
 
 		lmac++;
-		if (lmac == bgx->max_lmac) {
-			of_node_put(node);
+		if (lmac == bgx->max_lmac)
 			break;
-		}
 	}
 	return 0;
 
@@ -1524,7 +1521,6 @@ static int bgx_init_of_phy(struct bgx *bgx)
 			bgx->lmac[lmac].phydev = NULL;
 		}
 	}
-	of_node_put(node);
 	return -EPROBE_DEFER;
 }
 
-- 
2.56.0
