Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CCE3A168C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249017; cv=none; b=loqmI412nd0AD1pMM9kTiVdLsBT1BK03UxprJa/GxgowfqfrOFqf3Ny03KRLuhZv3eHNggNx8u0RjrqreyB5WRr9QyQuMGMainNHitG/d0BDTL2ZornFgzo4WhZ6fd1GN25dvILqXoBEquk+vWZgUlMia6euRxVFSwr1IBFenCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249017; c=relaxed/simple;
	bh=389GhFdcHXE9CQfcu38KBKyKduXJD5XyKzkLeecuPRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KK1Bhpho2ZV1E/tkC8T+qh7lihQ/hPd2TgAjMoBVYAcXmoTKhS+bsDKVvJ8O1wQBaTolkM9sT1PpOZRr7H24UE2pBXAn32EY3kYBpyZMCRlLfiUl7j0uYGevuIncMaporF2guy4Yo0vKHyn8GQyLaROHmdygHN1QTFghF3cQ5L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Tg8AePCp; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tg8AePCp"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d942c7cc2fso5203935ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788249016; x=1788853816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2khEECovfca18HsEnd2rATuHpO1VYqgGWGgT+k6yyKQ=;
        b=Tg8AePCpbOf6MvGlVsF35P4pqva7iJ4KwHIrmJrV3QsjGo0UwxXn+fcyFCqdF6f9I9
         kVFUq5VZHKNeLfhOLpjf10Jh/h3/d+5x7Y/zRmgHqNi6TaETa8RnTqiS/r7DyAujX2IE
         1OFOpgZ2yye9wHV3151nWzihuaPdiBcVcPhpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249016; x=1788853816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2khEECovfca18HsEnd2rATuHpO1VYqgGWGgT+k6yyKQ=;
        b=BHQ8afox5j1pjJitr4DtJ7g6mnDIftK54v8E5192ke96jqH21SE0a0T51pVYtQtYqu
         rJih6wqkDUSR60b6CnTEzpG+tGjvGl/fm/tVvz+upWyOD4aeCklzRbssiqIA8j2uyP5d
         5ghAluLeyyYx7GK/X1HFWhWIESKixBsNvjyDGf66oQBG5FYV7d+0u1KAHkxtmK6c//VT
         k5XqhzbU4/SwGkUemetNYqrbuuCYM4aerSf01fus4/yfvLSmCfoa0pOUY2BccW/Rd4He
         PYtmV3jfbm1d4Dxcn2h9/f+DYqO4xUbwhyqq35hlL1HbRnn2InYmP6j7P2yQ00DVX7K9
         TE9w==
X-Forwarded-Encrypted: i=1; AHgh+RoGLEEEX+IVr6hJMG0beeepoJI3Uabm4wBrsomNchb/fHZjkPo6IBrvvCx3xQopaE1codMI8yygErQCzjg=@vger.kernel.org
X-Gm-Message-State: AFuF++l8RjS42CFJzLbUX020s7rde08kWHzS0yBL8SxL/NKJ2uK8ChzK
	sq3u9iEM1BUzHzPdQjXP6PLinTVjl9OA9xdv9EGQ5ZNHES8ZazKWPkQwA1r784PdBg==
X-Gm-Gg: AYBFou3Hb5H6pWdtBPycijpLStn3S6wK7rnL45VI9G3tpnlbo5ZYcYOeBboFY4rs6mk
	XZgJ2BQPyIkzeoQUQN63/LTdyPaeFGz04yvcO615l8j33mzqPmC0iyyCgN6wThmqTDPaKqhKFyo
	OWQk3eo13nYePNl2azztiUQV3MQZJfoFclsq8BIz+tu0iYO0P3x5l7ozhds8N1wY8LbhdsCoaGp
	krjlAZ26A+flqUpYCV/ek3FuzY59pm8wIJqLicO/xMyNdqFGLODxzY7td/u0vgdNXOmi5f2MK8X
	3r+hkbf7114Py1j929R0JAzEEPKWxSDAq9kJo7+BbSYOhw77I/8mhUf8mh4P++izC/H4qbkTv4F
	kfH/wup26V5KR0mvwOZemBZMoJv3FqSacdJU68TV0kTZDN4R65W2/uDqQzTnG4Eg74pZQ8kh2lh
	LkL82eNbNIG9UIIRa4/9XKkBLOovvKH647GHbD3v51pje6ZN05t+CFJCCOnyVZ1QCvAdUbVtlpR
	vSx7fJm8sfgZMz2ThEus0ZGNw5QRiCMy2osw1CtaI9oBg==
X-Received: by 2002:a17:903:324c:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2d74df1c634mr532551805ad.14.1788249015708;
        Tue, 01 Sep 2026 00:50:15 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:8cf:6df0:9c4e:f5e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b699sm48142515ad.59.2026.09.01.00.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:50:15 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v6 7/8] arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as always-on
Date: Tue,  1 Sep 2026 15:49:25 +0800
Message-ID: <20260901074930.764550-8-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
In-Reply-To: <20260901074930.764550-1-wenst@chromium.org>
References: <20260901074930.764550-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Up until now, the MT8173 elm/hana device tree has set the dedicated
regulator supplying the trackpad as always-on, simply because the Elan
driver was missing proper delays. As a result the delay for the
Synaptics trackpad was also omitted, as it was not strictly required
under such a model and delayed the availability of the trackpad to the
user.

The Elan driver recently gained proper delays after power up, with
opportunistic skipping of the delay when the regulator was originally
on. The I2C HID driver gained similar opportunistic delay skipping.
So has the I2C OF component prober library.

Now fix the device tree to have the regulator not be always on, and
let the I2C HID device have the correct post-power-on delay time.

Cc: <stable+noautosel@kernel.org> # needs matching driver changes
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Added noautosel tag
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 8 +-------
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi      | 1 -
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index 1004eb8ea52c..b9e311fcd9a0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -62,13 +62,7 @@ trackpad2: trackpad@2c {
 		pinctrl-0 = <&trackpad_irq>;
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
-		/*
-		 * The trackpad needs a post-power-on delay of 100ms,
-		 * but at time of writing, the power supply for it on
-		 * this board is always on. The delay is therefore not
-		 * added to avoid impacting the readiness of the
-		 * trackpad.
-		 */
+		post-power-on-delay-ms = <100>;
 		vdd-supply = <&mt6397_vgp6_reg>;
 		wakeup-source;
 		status = "fail-needs-probe";
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index a0573bc359fb..6b9f47f515c7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -1093,7 +1093,6 @@ mt6397_vgp6_reg: ldo_vgp6 {
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-enable-ramp-delay = <218>;
-				regulator-always-on;
 			};
 
 			mt6397_vibr_reg: ldo_vibr {
-- 
2.55.0.897.gb25b4bd76c-goog

