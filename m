Received: from mail-pz2-f10.google.com (mail-pz2-f10.google.com [74.125.228.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAF7429CE8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274983; cv=none; b=Ttv8rzhcgLvO958p8sX7tsePwV1gDZWRsYlHCFm7+FMvXpf4GHKasTGlm+UkSAacDfv5+dOB6hBHMjMcsKofDYG2WbNobasJx0/wS82xyconaNyr43n5FYIuaCO5kTN+IQcrsuXgn53/hlYuMAB7NgQulWK5AT6IZqOYHXxjYiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274983; c=relaxed/simple;
	bh=iCQafZpFqsdcijM7wQ/VBsqWEiby6qk8Gp6Xz65rtD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZHDz3vQPjowcNb15pfhV+mXBxYIdH4xDeZHI1iN98tD9e4uwpPVLTT7qK42q6F5KHvR/opxKOJMvAqrPJeCuyRuPNtM2cHeDT3Fg7REyD7euHHl5GyWlEn4Zj/sngcLGqXeIUW5SxGlelZHw6rnmzfmqay7Q93Cf/dXDUZF+FiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rkktWk4S; arc=none smtp.client-ip=74.125.228.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rkktWk4S"
Received: by mail-pz2-f10.google.com with SMTP id 41be03b00d2f7-cc1c753b1bbso1220991a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788274980; x=1788879780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7inwahIcNU1aV9djAHi258zSUQz0eW0dslHEgzobBAI=;
        b=rkktWk4SfofP6WnpAL5ws1bWPxRUKhfc1yDrgKLcjuibn4VjzSdmuTsdpUVs5Vkrl9
         aFZohe9LfrVWYyNiW7yWYapLl9W/3KhGA6I5ubzudlBMgUeyTRhhcB+jjH/6b5nTTgFz
         wmUcz2W7UJQRpnoGI2xAGfnJ0pmuHlkrGcP11+Axk4ofyvpB5fTJGcnT+XaqgLooCl3q
         Qr81TNjne90RGvlUN5NeP3RmbgKi6DhQHeRwwCfS4E8rgRDBX6i6VsYsxg8ya8JAReVU
         A7TsaK4tjgk66McWdiM1i7p/JPHrOo4THDXLt2rHiuIQqDwUhOXN/Y+usZAxx38ZzZvQ
         gihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274980; x=1788879780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7inwahIcNU1aV9djAHi258zSUQz0eW0dslHEgzobBAI=;
        b=lp/ttOHCMiXSq0Opj86pbluZQHylASKz2nA/ug13PgYIC2t4rE6RYLz91hjfFLxbp2
         WIaT4vKLaPp7XuTSXVaTh3H6c+nHRHVgtAIUZnfFkGM+h277wezeZEHkVbxrEAtUK5F1
         4HayaKB0MH8ciBsNFvOG35+6iBw3yzVSJIYR+vQD0BHUXbpGFrj2PiNC89yxmubJOGN9
         6ZqdputumWN2IHLM8gq0ju6uI35UGAFuBxlx2JSkqehSYtpKvXXPlnPaGKDSSwGnt0yb
         pmTyDRFNIptx5E+jrf+owAgTCseXfERTyYEF5x3oA0ED7mOtjpA+5OnLpO4Ez9Z+BtxZ
         NMDg==
X-Forwarded-Encrypted: i=1; AHgh+RpCukNjnKVWGQP6ZamBh18pZIMF3hP5c2RZrzJdSHno2q7RVO/09US+nc1QCjr4rYjq+fITZg21ACgEP2A=@vger.kernel.org
X-Gm-Message-State: AFuF++nckCiXyNiWQvBssc9R/Yc9OX3JAM/8kIIzLLCdBambSPVOX0YB
	c4h1mKbBDhpgs06BC2xjDt4lpB0oFH/ZN+6I99a9t5POp9v/nmI3qMM6
X-Gm-Gg: AR+sD12ONjDWB4+TG81YPF60sn+3Er/jk1Z+wMAMQ1sireSmqaSuIRyzMplBg3Z/Ow1
	e7oWstStKgKKTg3I3vS/2vPQIo1t3L+dPLiyucp9GOm1b5Az36mjGCFx17axbPIIb3JjsXl8jgK
	3174ZIrvUibeKftnvtlbwGISvEatiqG/NqbvCcEka+D+xnns+2cQJr9f0i8M/LOHvGN3rzT4NHe
	jBohIxoxIRwJJVWP1qHn7kHbu77FG1PwRF59ut5cZnhuyVSEtrapvZs3/k0UVGqcClDRxw47n4o
	zanLQsqsIqjKelwAfDqg22xkUOjvPl4nhCslYMnc5eNgxg1Pc8JdnUczp/JkSJR4Fp7YI4MCXoq
	S18O0Rl1btmCHXHuovFq1YC2lD6log/QeJ/4yzZT7lk2kzHYeSWTbTRLSkwHJ7PP0aSGNOayaae
	q3Ly+c61ftlJNXs+CvUpzKjkkt4/tqsMewqK7gQQSlqlSXaMvwJkaeAie1Xhk=
X-Received: by 2002:a05:6a00:3d0a:b0:848:417a:d1a6 with SMTP id d2e1a72fcca58-85b5b321d25mr11818840b3a.15.1788274979663;
        Tue, 01 Sep 2026 08:02:59 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc0716846sm27914b3a.45.2026.09.01.08.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:02:58 -0700 (PDT)
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
	linux-renesas-soc@vger.kernel.org,
	Jiawen Wu <jiawenwu@trustnetic.com>
Subject: [PATCH net-next v3 06/10] net: pcs: xpcs: add ANRESTART support for SGMII link recovery
Date: Tue,  1 Sep 2026 23:01:06 +0800
Message-ID: <20260901150111.141037-7-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901150111.141037-1-coiaprant@gmail.com>
References: <20260901150111.141037-1-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some hardware using the DesignWare XPCS IP (e.g., RK3568 MAC side
SGMII), the PCS does not automatically restart auto-negotiation when the
link goes down and comes back up. Without an explicit ANRESTART, the link
stays down forever.

Add BMCR_ANRESTART in two places:
1. In xpcs_config_aneg_c37_sgmii(), when starting AN, set ANRESTART
   alongside ANENABLE to initiate a fresh negotiation.
2. In xpcs_get_state_c37_sgmii(), when link is down and AN completion is
   detected, clear the interrupt and trigger ANRESTART to restart the
   negotiation process.

Tested-by: Jiawen Wu <jiawenwu@trustnetic.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/net/pcs/pcs-xpcs.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 0337e2bcc0125..50b9cdf94fdaa 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -816,9 +816,14 @@ static int xpcs_config_aneg_c37_sgmii(struct dw_xpcs *xpcs,
 	if (ret < 0)
 		return ret;
 
+	/* Clear CL37 AN complete status */
+	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
+	if (ret < 0)
+		return ret;
+
 	if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
 		ret = xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
-				 mdio_ctrl | BMCR_ANENABLE);
+				 mdio_ctrl | BMCR_ANENABLE | BMCR_ANRESTART);
 
 	return ret;
 }
@@ -1093,10 +1098,15 @@ static int xpcs_get_state_c37_sgmii(struct dw_xpcs *xpcs,
 		return 0;
 	}
 
-	/* Clear AN complete status or interrupt */
-	if (state->an_complete)
+	if (state->an_complete) {
+		/* Clear AN complete status or interrupt */
 		xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
 
+		/* Initiate the next round of AN */
+		xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR, BMCR_ANRESTART,
+			    BMCR_ANRESTART);
+	}
+
 	return 0;
 }
 
-- 
2.47.3

