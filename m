Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86483B3895
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 15:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790524317; cv=none; b=JTjAw6IUP3Eo0jVh750S6yDgEOzRN6woydaOqIVCvmNeU7tYP+so3e1hROEYTwcYtxHutL7hUrB72k7Eutr4gD4EKo5Yp1CFI0KRSRG+FV36wkZ2DXexrNQhWEBHg+DlLnXSJiJNFl4f8DqeQQP/YYZcn32/GFggWAkEZZ3oWrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790524317; c=relaxed/simple;
	bh=WO3e2dAPCPDJj1H3hgMeqWQVcfphj8Iotq8V+3nAnAo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iwMqHKHgKGZoHQ3PX9pjSz/9LbpTE5db+rzvWDqmP3XZoLU+KLXUYW7C0TDxSnzG4bwaSS1IdkgMwWorZkbFFytzo18lJnkghpw474AjWhWydB6swSTroBkpmh3aMmGqDafQG5OOT/KBBN+M32brM8ZnixeghHjxS0wUIQ19C9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pZc639Nq; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pZc639Nq"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so315130966b.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 08:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790524310; x=1791129110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GKLDYDc3mePfDnzMg61PcdHyuIyXuIN6+B/oZsoaduw=;
        b=pZc639Nq52ZJPeF3aLBEl3F35m2KgmpE69jI7bV2dmRGD1z+HGO/0UpWREVRZTpnVg
         EQdOA4Hzse/piKpwhRoaS9BJWLU9Cu71NkVGXUhxv24hCqbMNFxIbPOo52Bp3vBYF2UG
         Tl/9Y+7o1kCCnTJLtNZX7qOyx23OBY5mEtuLtDsWdgyU0zr9jEXKNAl4ZnMz+KKoARkv
         Tsg4ATer+q5mhH2RAWYPl2GK9QfMG59O6PMSpjdMKtURFGk5z7WJk4XZA+0Kr7mqWZ8S
         XSxpzc61Dna3erDu8iLMMnLbx6MM7fVO84hfP5t4i0fWP0xT9YqYuQ2RYL0FY+Go6Q/S
         WZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790524310; x=1791129110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GKLDYDc3mePfDnzMg61PcdHyuIyXuIN6+B/oZsoaduw=;
        b=SCFA1uBNUkHnX7Lk2jrJtefhpnCa0O41YsBqtDo2CE9382taNHmi7tIeCZl7StFe2M
         fDQR2O18vhzc/haXjWWflfKiN53U25+kVSp4+z6J7b5OLUGsDlLA8/PKFyvSJk7SZ7VY
         z1xkJxrT5S4v1lTrsIW+btzoXQPqmQR2+eam5gjiib7dFTMXHR85lAbu0+HC7lMN7DuM
         ZCiW4+Q+GfAWjQlMjG7DfmpnZJphacLTtEtcJq8jZJQ6aItmV6OaDsMWffK8plgWbCCq
         W4LntTPrWojM9QUgp17uH6PkAjcru9ujbPu4APLFPOiJP63SxAc1rpMBZsnhgr1jhnpW
         r4TQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUNDmrwSoNJ/oxzEnkAZXHHAQsR5+PdGLKoCz2aCwoG+fvrg0biTLNXVFgjRoznV3K0RbMq5U2NeZ892k=@vger.kernel.org
X-Gm-Message-State: AFuF++kq+zB30nzoEtzZgffTrIM6PWga9U5mEqy1UV2PXIBwDB9Vqi5c
	g/dZkas1O2PS8qem495VE92uL462Z0nVEzs8FEenwFwuizTFfkJNPtC+
X-Gm-Gg: AYBFou3+3Q+Zr6uFJ+7YzRYydjIUMNUbnHHs6CrcMD1odBR0Vy7PH7WiZ4UfvjQR0J4
	8TAiHd9lXOsVjqPgqLt8Ce7gPDhsvOurZ3jTjAYfk6Xu0qVbGrYcoMg8b+mfUag2DBpE7ndlkQl
	AaCvRKiFwpPu75MrdU+Er/C5meiQ84i5dIt3AK5aO1ry8hONliLYpDoS209RQY2bzyplTQwryaL
	3vQTj3Plci41KZjn00gjNwASHrl9WVoClGPSdM1vIT+2jS2HUJKCz0Oe19ff/19wMc+pKHjGzrS
	sGg5dkFoEkgfBgnBKSL7ARotBeFXdoibm0JogFJCJPgazV3CeImAVTduyz1po2xMR6fdlr7lYjj
	T1BXCtkMHUynUkN4J2unI4li0uavjfOvkrp7g84zovOFD+5h+nhju19NX7Z+Yve8SSdvKXQAgId
	1Luvs7simlQuC89GSk+egbCzKLHJ1oUzKTUt0krZ9zigztoadqCSanfbZEV6iInEhtjr9rG9xLS
	BFYzLRxtEftUXYnsfaPaWWetqLWJKppN1afEN5E9snP4jf7FQW95Pro
X-Received: by 2002:a17:907:3d08:b0:c25:2a78:15ed with SMTP id a640c23a62f3a-c2ac22db502mr895963766b.6.1790524309994;
        Sun, 27 Sep 2026 08:51:49 -0700 (PDT)
Received: from localhost.localdomain ([2a02:aa1:165c:44c1:e5d5:dfb4:8450:1cdb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dbd3a0424sm158684066b.70.2026.09.27.08.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:51:49 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	George Moussalem <george.moussalem@outlook.com>,
	Ziyang Huang <hzyitc@outlook.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: phy: qcom: at803x: Fix IPQ5018 short-cable DAC values
Date: Sun, 27 Sep 2026 17:51:36 +0200
Message-ID: <20260927155136.2489-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
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
Signed-off-by: Yongzhao Chen <yongzhao.derek@gmail.com>
Assisted-by: LLM
---
Testing: the register read-back above is from six boots of the Redmi
AX5400 running OpenWrt's Linux 6.18.52 kernel with this change
backported. On net, this was build-tested for arm64 (defconfig, W=1)
without new warnings; the generated code of ipq5018_config_init()
differs only in the two immediates (0x10 -> 0x1000).

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
-- 
2.43.0

