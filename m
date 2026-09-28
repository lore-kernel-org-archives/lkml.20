Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1CC501F25
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633255; cv=none; b=rgIj+2o68IhvAv3d8CnsyLlGEIgFeuNKVwk/PI+EJNQOGMGZrMNxdm1GSyV8a7mUABwfRZre4qLRKRyZoKBEpphAktRxYutZAonC9ET/34p8GpYWyoJizCuW7KmXY+a4vBJVwvoDTHfPMTCITTgCRqxNbd7NqdrJR+w9GEmRvjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633255; c=relaxed/simple;
	bh=Ot/8R66e/mkPVx670tudpj7xs96d6ihMr8n1GprTSKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kbKgtRw1C7z8TV5E+RZ0bx2p8kDYqApGbcI2fArOUExy2QsWj9dqLNM9C9+MwID2K8jbfSeC8r3qa+od8Tc7th1xUNODRA7m3vTUBgSEC8bhs7gJ46zTkaNr+xajdU62PFhjkwFHsB/30vBa5tQ7NzA2gZ9JnGrqUNoYliLldBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMgOZV27; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMgOZV27"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a4fbc5586so550343966b.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790633252; x=1791238052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pO83qbmBUiFGt2TePIWrrliB13OXaWfE2B6nEGDhy3A=;
        b=VMgOZV273ujEOTho9QT7k8DCW4jLLHGlN61TamKFUCzMrEWcUoXHcYxcbZ4cucQDI2
         /9udYfDI84R63cFIs8b72H8UyEQrcJAmiOpBvjaXmqSBmlE6zhPvHkfrVGV2URZm7kHK
         HQ5KiiiHJawAE4UzJy1OS4QmMxdvwPVs1OlrRjv6ng27rTc899KeEo3zIRgXSj1GULhA
         5JqTiY2UWCuRDO7tWcMrYk9RE7I2r/SwCMRXGM5qmrGz+jzVyuI48crddFn2zD59ktpi
         OL2U8xH4LiFxtD1G4WvjWaJzCBi2f4iF75k6t4KavmzaeR5TK4VX2oBHimlat2tQpS7H
         oXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790633252; x=1791238052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pO83qbmBUiFGt2TePIWrrliB13OXaWfE2B6nEGDhy3A=;
        b=zMX9INmmMFhUeB46Gbdif58fo3zAooFPphkywLBVrE69yVcbRP4U99I66wX4ZK4mpk
         AvGIwWLkwf+ikXrEan1WbMUrwlh/0HzIciWlL4uEoIYDora6IcCryhIQEr0xT7dcSkgv
         2WTd4j64SLyVNauH4ijvezMS4h6BeBglPAF0Illoh1tmARtXuJMlisRNzbVRHNyYjSM2
         HfpsF7WwcFdECftM/y+YcuFNsQswLsRjhBjl73rYiYp+rzr3Gv4KH5BU2N2aIbhqT2YS
         CpRFhhFQ8r38OiGHJgCdjxG+BTNbgnx9ZaFM1DvRGza/uQA0nGyNe05P8iC0UmkIxcug
         Qivg==
X-Forwarded-Encrypted: i=1; AKwUvBzV6O7895NbKGxspspEzm67oBlUHdE4o3Cn5ZFzWKiIFXiqUKLQKJ+mCkcE0Ym8V2Q8v/3U7nro1opB3AU=@vger.kernel.org
X-Gm-Message-State: AFuF++mH9pWdPLJ9yMCfeod7JJdbOD4yptY2d0LVUP7K4B8rgQT102/E
	qBDeu1jK/R7c4IcFLWg9lBExKWkCRCVEuD0oQ6/fQXJuJJMP0b9RU2wz
X-Gm-Gg: AYBFou3zGRUUVi15IYz0WU+0LUOSfn07t77ZtRgVe06ricDUm0v31aw6fd04Cso6uyc
	1rnECD/xa5gr8A2WB3oCBXMzzKRUm/RciXqiXKt5IceF55xwvpxR3SDjcPnyDpyPpu6z+XMsWB4
	A6KoMqFNKBXHjGjg7SPXsLh4ew41bXzqnx8Wul69pK5azjbp+coLsCBPHkyGg0YP4rar3QK16mX
	N1Mgq5MSSvBaa2plt9ScTLg82U3i0ECW2f+l8cBGRzq2zJNDkQAha7eq4qKZhv05t/glSy6fPiU
	drMhjzm7X++IO9h6/yDMmfyeMzlKz0Y0e2v0DJHaEYjmWmJI1P07I5nxyuoyR8azlY1CXG3Pv5B
	Ba0W3xCD6ph1npP6fYqUokN3vvKQUUPsUOn3aycIYwNeQAHRFdwf1U/R2yiJeDc1aNJC11R7S6Z
	4oO+rb55nVIGShJhYpPD57E5l1dBzolcRem4PHnE0wnv8a4thryNi5c78d1C3RbkUlisEx+0uO8
	25N3SlQwAYiBqpSl45a8fSX+5hRcAvFSi/h4NyIuxmLPic01UCzcl1E
X-Received: by 2002:a17:907:3e87:b0:c29:f5d8:9c78 with SMTP id a640c23a62f3a-c2ac229ee9cmr1188419966b.39.1790633251888;
        Mon, 28 Sep 2026 15:07:31 -0700 (PDT)
Received: from localhost.localdomain ([2a00:801:793:68fd:c07a:9093:1956:b4bf])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757b9c1sm540308966b.33.2026.09.28.15.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 15:07:31 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	George Moussalem <george.moussalem@outlook.com>,
	Ziyang Huang <hzyitc@outlook.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 1/2] net: phy: qcom: at803x: Fix IPQ5018 short-cable DAC values
Date: Tue, 29 Sep 2026 00:07:16 +0200
Message-ID: <20260928220717.939-2-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <20260928220717.939-1-yongzhao.derek@gmail.com>
References: <20260928220717.939-1-yongzhao.derek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When "qcom,dac-preset-short-cable" is set, ipq5018_config_init()
programs the MDAC (MMD1 0x8100) and EDAC (debug 0x4380) fields. Both
fields occupy bits 15:8 (IPQ5018_PHY_DAC_MASK), but the value 0x10 is
passed unshifted as the set argument of phy_modify_mmd() and
at803x_debug_reg_mask(). Neither helper shifts or masks that argument,
so both fields are cleared to 0x00 instead of being set to 0x10, and
bit 4 of the low byte, which is outside the field, is set.

Use FIELD_PREP() to place the value in the field. This matches the
vendor SDK, which clears bits 15:8 and ORs in the value shifted left
by 8.

On a Redmi AX5400 board, where the IPQ5018 internal PHY connects to a
QCA8337 switch PHY without a cable, MDAC and EDAC read 0x6868 and
0x7800 before the write. With this change they read back 0x1068 and
0x1000, with the low byte preserved. Without it, the same writes would
leave 0x0078 and 0x0010.

No in-tree DTS sets this property yet, but it is documented in
qca,ar803x.yaml and used by several IPQ5018 boards in OpenWrt.

Fixes: d46502279a11 ("net: phy: qcom: at803x: Add Qualcomm IPQ5018 Internal PHY support")
Suggested-by: Ziyang Huang <hzyitc@outlook.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Yongzhao Chen <yongzhao.derek@gmail.com>
Assisted-by: LLM
---
 drivers/net/phy/qcom/at803x.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
index 6872dbf7785..cacbadf1f48 100644
--- a/drivers/net/phy/qcom/at803x.c
+++ b/drivers/net/phy/qcom/at803x.c
@@ -1051,11 +1051,15 @@ static int ipq5018_config_init(struct phy_device *phydev)
 	if (priv->set_short_cable_dac) {
 		/* setting MDAC (Multi-level Digital-to-Analog Converter) in MMD1 */
 		phy_modify_mmd(phydev, MDIO_MMD_PMAPMD, IPQ5018_PHY_MMD1_MDAC,
-			       IPQ5018_PHY_DAC_MASK, IPQ5018_PHY_MMD1_MDAC_VAL);
+			       IPQ5018_PHY_DAC_MASK,
+			       FIELD_PREP(IPQ5018_PHY_DAC_MASK,
+					  IPQ5018_PHY_MMD1_MDAC_VAL));
 
 		/* setting EDAC (Error-detection and Correction) in debug register */
 		at803x_debug_reg_mask(phydev, IPQ5018_PHY_DEBUG_EDAC,
-				      IPQ5018_PHY_DAC_MASK, IPQ5018_PHY_DEBUG_EDAC_VAL);
+				      IPQ5018_PHY_DAC_MASK,
+				      FIELD_PREP(IPQ5018_PHY_DAC_MASK,
+						 IPQ5018_PHY_DEBUG_EDAC_VAL));
 	}
 
 	return 0;

base-commit: a7bfaba4823e3c165bb2004c74eff7c096672bc7
-- 
2.43.0

