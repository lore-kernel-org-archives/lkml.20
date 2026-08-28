Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8EA30FC0F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787887779; cv=none; b=kioJ2HqlHb0i/HpgKPTaCD5AXyuq0N46z5ppbvhihPUF1Lo2UdphCowc+RDPPcITsRmdlp57L7eEJKmfTiDr+ab1jD7u/46EPgVa0MmK5nSkA1BMYTyYdNAeSPcM48Yy4MHRd4N3s2xsQdjTF5xl/p9OV9MWxrXhlTlECtQqI3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787887779; c=relaxed/simple;
	bh=jPjlin0tmMCDRTUW+snF3PCNw9aRjkrQLg8rejx6Ly4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bJjfZJfspEeWhFzC0JjJG9yYwQNGRtBRzfN0azPwBgtas52mUWpewPHSzp1wuCbzaqoNA0ltnN9EthlC6HV6131hMMrnXz/TUl30moxzgnX/YhAPQuywQDv+Ogudtd9nm6WZvp+U0nXfeYVimshke/OQLRPezhimQOIleC+JEgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQZGM383; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQZGM383"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-848643382fcso729573b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787887777; x=1788492577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nm+oSzw2CJimOwrmR4fmonPKPbwcboKbls/SrfJtGuk=;
        b=ZQZGM383K2s1zkYeHdJcoSVFaHA33CHT89DmYEYIU/ylCJmPbAibUdK2EHIWXFeiZx
         /Vxd+Fwop1tgVMKhpcu8b4SYswRqcH+CcaMsS75+BF1ft6hist5CHui2eF/HrSjmeRFY
         9fDvRwiht1K1b6VRVBskyFS1IYBwzKMdHsKnctvQN78nIY6yBMB9rxUmQO8uyy99e0kL
         8NnmthT4C/vDWRNPc4w4jPy245ICoqprQHkj3dq7Quev+rf2g62ZsySiK4O+1ilwKr1A
         /59neHNjS3Gn8uqdahUPhODiFG9kg0Ryv/n97JsvQaNIhkNJ2G3UGOnfUwPPNgeOmTPl
         cIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787887777; x=1788492577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nm+oSzw2CJimOwrmR4fmonPKPbwcboKbls/SrfJtGuk=;
        b=f3RK8cL84TjH5gqgp22c4H3srs51VYmCJntvEObcQuZwhWo80ymPgRvn4WJsWBef2X
         xmYLQgq2eiRa7kEGzfkQdyMzDcNU48JDUNQA5Fj177GCerfuORXSBlxDBLzhDFP3oVM8
         zG16uz4piPsZW2STK1Dy+iyTA7xOHI17PiAlvEgAIyHA+ucdj/R0OJAUkeAagoPBPu9t
         1OTwRfxeVU+opR7OgdoBG765dXd76zCa2ECAf8kAoyeeva9CqMEtzXK1CUb6SWNS6c76
         XkX6IC+GQqVunU9gf+1/GOnAnoZsowFyLfBR/cW2kwL6wgrDXXtlpRyay9QKmvEY3GNI
         LWMQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGWrCQ7ljVILb3qD+ckGQlMHKhgCSWbk/3iS0Z0YuM4IkunZcd0qLWCxghpbKo5OtJcSCG9ZRuwec+4HM=@vger.kernel.org
X-Gm-Message-State: AFuF++n1G61ol43medAPec+RGVFoqNsL+fC5d8f5jJi07XKhfbk6qGDp
	YXpLWkx69r9Fcj4DUqJVZwH780iQr3BaVFdRyknc0Vzcx3dYmhQfHOs3
X-Gm-Gg: AR+sD133BnUldW5+UpzYvC1jLABOatqPzaFvPeCNfYMhquJpj2ov4fq7SVALsljXRXU
	8gndewPUXAmt66K8r2JP06vpps/UBexsh5b+0iA0bD4hFZKDXSb3rzolV9mMRfQ6XFyCQSHr+pe
	gKhQAXrZOq/Pd0biVGTSh7T21HihvVnlLYNOmssR4EjY+sLKv9HIyAZnKtPfEaYuRPUecJcvcY0
	wPgM5aWkMqUD+TKbHI8O41semSLyFM3VsjyG95QoUOvLWAoRZZKnsW0pLGxm6e7PQ1waMV8g6H+
	OwIaKVpB7YWZ22NUQ9Ech9MPQ8lUVAR3lImS2EYaw1RxyFThNWPcFOqOmY63O+MKV8pAlbxq8/+
	PLrSbOBwT9vn+R26MTdHEUpsgtC0D5+cryf60bu27NWuaDj9JSJ8BeTc+oeWW9Pq8wZhHncVQZb
	z9iDQX/ZSEfDc6FaCkSZJ1GpFkMv8Sp6MGpAsaoFQP5fReFu17XQGzYuhdmkUooCBF
X-Received: by 2002:a05:6a00:13a0:b0:855:a211:6679 with SMTP id d2e1a72fcca58-85628b7d138mr6941183b3a.5.1787887776957;
        Thu, 27 Aug 2026 20:29:36 -0700 (PDT)
Received: from DESKTOPHOME.lan ([240e:3a3:9304:9820:f4a6:931b:cf31:308])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-856a3d6c845sm135770b3a.59.2026.08.27.20.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 20:29:36 -0700 (PDT)
From: Ziyou Xu <xuziyougm@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	bjorn@mork.no,
	ericwouds@gmail.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net v2] net: phy: air_en8811h: restore AN8811HB LED GPIO after MCU restart
Date: Fri, 28 Aug 2026 11:29:22 +0800
Message-ID: <20260828032922.469449-1-xuziyougm@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 03b4702fc5e3 ("net: phy: air_en8811h: move LED GPIO
configuration to config_init") moved the EN8811H LED GPIO setup from
probe to config_init because an MD32 restart clears the output-enable
bits.

AN8811HB follows the same initialization sequence: an8811hb_probe()
enables GPIO3/4/5, and later config_init() calls restart MD32.

Move the AN8811HB GPIO setup to the end of an8811hb_config_init(),
matching the current EN8811H path.

Fixes: 5afda1d734ed ("net: phy: air_en8811h: add Airoha AN8811HB support")
Suggested-by: Jakub Kicinski <kuba@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Ziyou Xu <xuziyougm@gmail.com>
---
Changes in v2:
- Drop the EN8811H change, merged independently as commit 03b4702fc5e3
  ("net: phy: air_en8811h: move LED GPIO configuration to config_init").
- Apply the same fix to AN8811HB per Jakub's review.
- Rebase onto netdev/main.

Not tested on AN8811HB hardware.

v1: https://lore.kernel.org/netdev/20260820141034.1400439-1-xuziyougm@gmail.com/

---
 drivers/net/phy/air_en8811h.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/air_en8811h.c b/drivers/net/phy/air_en8811h.c
index 0eeb7b9a4..6ee5df63c 100644
--- a/drivers/net/phy/air_en8811h.c
+++ b/drivers/net/phy/air_en8811h.c
@@ -1125,13 +1125,6 @@ static int an8811hb_probe(struct phy_device *phydev)
 	if (ret)
 		goto err_dev_create;
 
-	/* Configure led gpio pins as output */
-	ret = air_phy_buckpbus_reg_modify(phydev, AN8811HB_GPIO_OUTPUT,
-					  AN8811HB_GPIO_OUTPUT_345,
-					  AN8811HB_GPIO_OUTPUT_345);
-	if (ret < 0)
-		goto err_dev_create;
-
 	return 0;
 
 err_dev_create:
@@ -1265,10 +1258,19 @@ static int an8811hb_config_init(struct phy_device *phydev)
 
 	ret = air_leds_init(phydev, EN8811H_LED_COUNT, AIR_PHY_LED_DUR,
 			    AIR_LED_MODE_USER_DEFINE);
-	if (ret < 0)
+	if (ret < 0) {
 		phydev_err(phydev, "Failed to initialize leds: %d\n", ret);
+		return ret;
+	}
 
-	return ret;
+	/* Restore LED GPIO output enables after MCU initialization. */
+	ret = air_phy_buckpbus_reg_modify(phydev, AN8811HB_GPIO_OUTPUT,
+					  AN8811HB_GPIO_OUTPUT_345,
+					  AN8811HB_GPIO_OUTPUT_345);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int en8811h_config_init(struct phy_device *phydev)

base-commit: 1b78070aaef63512688aebfbc82365ef9d6660f1
-- 
2.43.0
