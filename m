Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC34D3FC5DD
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789326084; cv=none; b=p6U6jsM0+F0FJkmB+kJQvc7gmcheB8fSl+B+Zc5YpVVpmuz/VG+vW445wXMUQcXtpNVmgu1SRCGV3vzMDyQS7NAf2AZ0nCiLH/UQcm0NyudDSbARg3uXFCi7AoALiYbODP/X38ia9AWH4rVD7RHarnBsyg1fVHGNcR7jYbDnxdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789326084; c=relaxed/simple;
	bh=nHafMZ2XTe7EQPlPZqClpxTD8fS1jL3tscvPWXqEAxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QNxpANa5LAUmUw+z1YowcPujPVvnPFJZWrzeeGEDXI2poOzepiQ8o11miXJygiXwlN0Jp0a4SL8s20sCIeXxskjTAhOa0Zmb1W4m7b02uT0PFwwVWCmAhexcLwYAqkyhDOklxxk+vEk7R31g0dVSfXhRmITXE9uC09rl3ni3yOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rPyZu+/k; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rPyZu+/k"
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d942de6574so15902275ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789326080; x=1789930880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQ2IdKH/7qjrKGR31C/pLtiJWP+p6fNr1pFwJZ+2Nhc=;
        b=rPyZu+/kk2XMIIwSsUHuuioNHncKg4sF3/zzv33gi8dnPxp8fWVYCSi2gBVXJVBgko
         /ypDWFofgTUWY/9kn2bd8zZgB71+XtJNCEaeGRV9f56V44iJ05a0Eu6Xfliac6x+oYYP
         EIY1w8vphq4EhGpJKFL7r2ibARmdGCJsx5sFe/6o35RGr737S7ryvLZ+or+6tDJ5Asxs
         5jWzfTW103Q0wsqAfVi7TkaQwn83RgW787/de450zR2IANPJgNElSuxa3/8HCSySYHXG
         dLEGmYX2MJfzXfrD2icalr7g2Kfi1bclX0AY16FGNJKwyddvYO6v/2XjkR5ceXrS+kNR
         Yn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789326080; x=1789930880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zQ2IdKH/7qjrKGR31C/pLtiJWP+p6fNr1pFwJZ+2Nhc=;
        b=L7DuYsDmiZAekRnFjLWl3pYn35PR3yvGA0jaOTper2WHaL6kPcJWd+CPf9u7AWI4dh
         nYzUM35M3G495yBgbUqhOFypPncXoNVb5YUEImuBeSR3mpzlVBGNCpxPyA10XN6XzmyQ
         8xP8GykhFEJRue5l1J9t8Jdkmrfns4MWqg+MH5N2tzz1pUWD0ZEjJNtnzoqEjovuSxQl
         V4mi6X1AnwpfilGlLcCJuMCAkXl+V4NwJRk4ptuZ/AQAKhbOTbfKPzo0Or+DmmjoY3Pg
         g4WX+oZgIAoq+2dqnTD8T2xorY8Gf1C6qQY4vT/GuQgqD8MrTSpzMCZE2icI/EHG8pu5
         eiCg==
X-Forwarded-Encrypted: i=1; AKwUvBw1E1TLO4HgdGqhHiYRG5YBkAp8Q5lZodmkuYVw8F7nO48ZYKBteAPtHD+hUa2PVQOJ/+qwRONhj558VX0=@vger.kernel.org
X-Gm-Message-State: AFuF++mbGJHpmIrK7QztNW+xF/EUDx52e5HiwLU7YiipU1Z7LH1m4Uzl
	eb7ixvBmTNVNaOTaUyFpTR5WIsGO/FT3iqkir7un8ZO1afQ6SHoWaLLu
X-Gm-Gg: AYBFou3yaQ5R0NPu+hGzrN5bAjo4Xf6PMkVmhJVmN4ezW0y1qIyF152Z5O95vi+Oq9h
	FmwqBb4Gdv97LvPyHsVtFHbP3NtgY6AgZ3pAEr3OOBfV6WmUcSe/bYfMcGBKRn/q6+AWlf3DV2M
	WucVMr6cKxPVCiqFw0ibwpkdDNOr+59mnfiRJt7c2vECJXYN+vIRpLKYxX6X+M/l1AeCl+5YJES
	StDfihpUpaiW3V7Of3mGNMMdB8o2eYT7hgJXYpJBvYrFynhxTeGnv+9pFECWocNTq9v3AW2oMaE
	RXn9j/JlVId2VffEKApZTwkbNev/ZZizhu/pR015FTL5YZSYutforvvozrWKuSUmC3X0WKluoA7
	sQxFqxmYNrijQkcjNIx564/90IsT2znLPWnDS+EWom+UlG/VEV4IS/DADS+UY2LYQ5WZHDSc/XD
	UfTZd+giVGd8E44WqJiZertTlJj5J3I8aI2zzLwtSPQmr7ES0Gabnyome+E0OpOJJcPYmR+g==
X-Received: by 2002:a17:903:1a2e:b0:2d8:d4cc:be63 with SMTP id d9443c01a7336-2dd2a35aa1cmr275548375ad.16.1789326080540;
        Sun, 13 Sep 2026 12:01:20 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca6b7bsm36808655ad.3.2026.09.13.12.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 12:01:19 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v5 11/11] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Mon, 14 Sep 2026 02:58:46 +0800
Message-ID: <20260913185849.907479-12-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260913185849.907479-1-coiaprant@gmail.com>
References: <20260913185849.907479-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry for the Rockchip RK3568 XPCS platform driver
and its device tree binding.

Include the relevant mailing lists (netdev and linux-rockchip) so that
future patches are properly distributed.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c2414447892c2..960a53afa8357 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23739,6 +23739,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 F:	sound/soc/rockchip/rockchip_sai.*
 
+ROCKCHIP XPCS DRIVER
+M:	Coia Prant <coiaprant@gmail.com>
+L:	netdev@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
+F:	drivers/net/pcs/pcs-xpcs-rk.c
+F:	include/linux/pcs/pcs-xpcs-rk.h
+
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
 L:	netdev@vger.kernel.org
-- 
2.47.3

