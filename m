Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794197117;
	b=5RGQGnOa9nckmk7oepgHm3x2z3TpItHRHmXG6sU5xr+kASjj1PD25VjM+VCXZZdLCTYO
	 VS+4bwYsj7u9IOBpjc0ibb3Urhndz96zkavmD02RzmD0otDDTooGuL0tBVGA4pTSVlk7Y
	 PkwBfVPUc0mr4XmPbOaXH+H3k1Hq9ZbOM5lkj2KUqPyTUe7z3jHjGrUQ3cLN82R4rLaSH
	 fHeHWPFaSSWidIetcAd9+5XplWvLDnnDftZNXUlK6SrSZlrt54fTANKOI7Mmu+BU1Wqom
	 j7m42YJKysx5qF1esC9xL9uFeYZ78cM24vflnx0HepDPDQKtdCtNM9+kjz5VmHvXh7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794197117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=n++rx2vPRlANelrrltmpXRwH4hFgG58r1hhbvby3m58=;
	b=skJ2+eDMsyU1sMvWPVgoIbo2Shlyhg0AjkDz4GLMRcfXRnHBHqR3TWi7JR9lnJAw5PqN
	 aSvve5+hMfc2vPqeo8J8g2X3rMFPYEhyMX0t0qVyp0pgiuLy9OxC1is/OalxeEQuUYWlU
	 HTC68CC46TT0azJAPHP6z9CrO2MZDeKsddS9AHWc/71IRpXmi9xzEjpl+x6yAKxZo/W09
	 1kmpR9EYeZNj98QjoEtYXRB+7nwDazlWwpCYGZQnHfcXQQ1vsIvD0kQOQTlH8ax6VLr1S
	 m5FPFYPadsbET9GtIRYTW1S6ZsfqQJY/KeBu1pa6LMjma1joCbK86wmdqMHjGHfbmtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I5gKMrwa;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE5B606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FE5B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I5gKMrwa
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdab938dc83so131756a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 20:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794197117; x=1794801917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n++rx2vPRlANelrrltmpXRwH4hFgG58r1hhbvby3m58=;
        b=I5gKMrwa19rWO9uB+yyStHKDiGnBXW/aY0L4wNFgNdUPc9Wa0HLrFNtNp7gDLaz8lz
         SUuHx6sALRlnpVJ/D/vnH7eNXbTUmvpD45oBmN1pLC7kIKvPbV5b+OVKcmP+9+opQkOK
         1jBNih8MgTlwHniTr0T+8bAZFkfjKDoPSzNGi6lPX7zre6ntCnsHqfhoQLXSs0qwN3dd
         niotTAQrSz+TSVH0+Px0iWPdOsvp108jwt6v0d9IU1bVTUEVWnf7GOGrC/JzWqDrheGG
         a7f9ayH04ssJ1QTvXRDWU7I6BUXFNJKrmRk+NZkIVKIZaLtijvg7pf7oM/DRYchaWJJY
         z8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794197117; x=1794801917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n++rx2vPRlANelrrltmpXRwH4hFgG58r1hhbvby3m58=;
        b=vJiJaXF+9GSb7KXp8WztGQE+s14u4acTdowr590sOD8VaMl0LWDah6g3daLKSLVX7A
         dU2IoMFigg1ewhlR1z9/3wAPiogM19REyqjb1SvmM6WLmzJ5th9elcj8l+x2DCeIUv5N
         s7tAIlKMUD3BtfY8zJHbDz70GRy1yxyBdzqR8SkVexGI0DqsJ0y1GSqe2856K7VLTHX1
         meHTZhUOiE1Y0wz1fedx8UWpHFY/E/jhMHymCn7DORK+RVwE2iI1PlLRupwAPSJIYxEs
         taiwZzL386E1uD5PqWCJPfnjkdAuOFLJHmUvCDS/jMcReszqQzbci8EmAzuS7LANZHfI
         oOUA==
X-Forwarded-Encrypted: i=1; AL+hErHPlkcG+eRfIsw4SZgVNPzkysiW6hV6eop3vLfTJHBfZ82gkMdXhIi9T4hOxCCXN/w86FqAus90TqU25wI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vmaUjUhN+iDtftvc4X1E2ILEU84neDohrRH44bZ0TuQfB3gs6
	NRiqI+saIWW2OLuhuvXpBsFLBM/7I8XGl1oJIEuMO+LVFrVlmEgDqGrG
X-Gm-Gg: AYBFou0SgzEkwUhOEYeh/YthFLngT7fZH6WN60NuUcD8G0b7khW4sAdMdg08ckUyta8
	ZkN6cbX1mjWdy4K6CTTOu3GwOxJALHhYK8dwLvQFg2r5FcnIkGBUnkl0P3R1TJc3XGG2+b1QKxk
	3vseId2ufE8fJJrc3ju+/1VHh2OXO1A2X94Sx455o9eAjGzBjkbkJZQNHMSzKEPdPm3drhJC88Q
	XmmqpBDsFyJp1BLxXSAyegwnmaGFgPGV3HCmfcp0EdollZt0BcrkbJFpEHzLq4KOsuIkEZve4GM
	pnAx57P3C5buh7HHLZ7O8V2+QaTqZn0PZTLTVv1T+kxpvmP5MwRFQUZfrnc0CcJDV//2XnH3J8t
	OtjaYHCOoNoXLCwxDSaec4iI2rFn6zRJ1LO8pg4Gi1hXLOfZx8+E4P2lGFUNDiOnFUKpFPcmuNt
	WIDaRjBDFoBvcNBMka5Rxeob1byc7eDAo6kMZ/RHBj+5Cj5TTeYT5fIuKHyMm7RVg4zMBP4pxgD
	HD7BpfV2ZB4Cg1fKfIP7HlFDxWOgLrqOD2KtbOn/j9cO2C4+1z/AYjHerWL3qA4fVqI+j6cqzMS
	EjGkKQ8f5J1XsafTEX9+PYDgFEt11V3bOej0qtcNy8Z2IYIgKy5OlabE266FZ9ggHNSZnSKXfFc
	WuevdkZqdelmI2wSP2luII2tz2MAuSdEfvZK8bIEbXcw9xPFw659tzE4E4OQRPxODS8SuC6rT3L
	Gn0rXiTjVnzkqC9p+GAxkptxg=
X-Received: by 2002:a17:90a:fc4d:b0:3ad:25f6:1dd0 with SMTP id 98e67ed59e1d1-3b12d444739mr2752350a91.11.1794197116640;
        Sun, 08 Nov 2026 20:05:16 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127891fa4sm5116170a91.4.2026.11.08.20.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:05:15 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Alban Bedel <albeu@free.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 2/2] phy: ath79-usb: support the analog reset
Date: Sun,  8 Nov 2026 20:04:51 -0800
Message-ID: <20261109040451.114135-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109040451.114135-1-rosenp@gmail.com>
References: <20261109040451.114135-1-rosenp@gmail.com>
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

From AR934x on, the analog part of the USB PHY has its own reset. The
old platform code released it after the PHY reset on AR934x, and left
it to the bootloader on QCA955x.

Take it as an optional "phy-analog" reset, release it after the PHY one
when powering on, and assert it first when powering off. This is the
reset handling OpenWrt has used on its AR934x, QCA955x and QCA956x
boards.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/phy/qualcomm/phy-ath79-usb.c | 33 +++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-ath79-usb.c b/drivers/phy/qualcomm/phy-ath79-usb.c
index 8e9565846b2f..1e7868fc0b5f 100644
--- a/drivers/phy/qualcomm/phy-ath79-usb.c
+++ b/drivers/phy/qualcomm/phy-ath79-usb.c
@@ -12,6 +12,7 @@
 
 struct ath79_usb_phy {
 	struct reset_control *reset;
+	struct reset_control *analog_reset;
 	/* The suspend override logic is inverted, hence the no prefix
 	 * to make the code a bit easier to understand.
 	 */
@@ -30,7 +31,19 @@ static int ath79_usb_phy_power_on(struct phy *phy)
 	}
 
 	err = reset_control_deassert(priv->reset);
-	if (err && priv->no_suspend_override)
+	if (err)
+		goto err_suspend_override;
+
+	err = reset_control_deassert(priv->analog_reset);
+	if (err) {
+		reset_control_assert(priv->reset);
+		goto err_suspend_override;
+	}
+
+	return 0;
+
+err_suspend_override:
+	if (priv->no_suspend_override)
 		reset_control_deassert(priv->no_suspend_override);
 
 	return err;
@@ -41,14 +54,22 @@ static int ath79_usb_phy_power_off(struct phy *phy)
 	struct ath79_usb_phy *priv = phy_get_drvdata(phy);
 	int err = 0;
 
-	err = reset_control_assert(priv->reset);
+	err = reset_control_assert(priv->analog_reset);
 	if (err)
 		return err;
 
+	err = reset_control_assert(priv->reset);
+	if (err) {
+		reset_control_deassert(priv->analog_reset);
+		return err;
+	}
+
 	if (priv->no_suspend_override) {
 		err = reset_control_deassert(priv->no_suspend_override);
-		if (err)
+		if (err) {
 			reset_control_deassert(priv->reset);
+			reset_control_deassert(priv->analog_reset);
+		}
 	}
 
 	return err;
@@ -78,6 +99,12 @@ static int ath79_usb_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->no_suspend_override))
 		return PTR_ERR(priv->no_suspend_override);
 
+	/* AR934x and later also hold the analog part in reset */
+	priv->analog_reset = devm_reset_control_get_optional(&pdev->dev,
+							     "phy-analog");
+	if (IS_ERR(priv->analog_reset))
+		return PTR_ERR(priv->analog_reset);
+
 	phy = devm_phy_create(&pdev->dev, NULL, &ath79_usb_phy_ops);
 	if (IS_ERR(phy))
 		return PTR_ERR(phy);
-- 
2.56.0

