Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D71A415F39
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633550; cv=none; b=XpRvFl2S/TBrS0Nh3qDvh1q/5lRu7SWptYtEwEVi6kTpUmM+YFWQebeA7dvlZe2GmD/22jrIBZi9oo0KC/FHrNkpv8SSlfN82dh+NMzPnNtXPImScEGabavZRWtqIy1RuTFjeCie50OIBfiYJ+3988CZvyIpb6jIhON/f5TYwHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633550; c=relaxed/simple;
	bh=tKqz8WaA5fCf8zqxAuhb+KSHy9L2ioB7dBm28PChNnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hu7U+UyW79MRLJmCPVl4ZFaIwrA2Fq0OQYMNnbs7EoSKUzGZtaUm3mZGy0MUWV1qnJFyZOW15CwfZQnaqf482kra6qfRq4gVqYvOFdl0LACb3kjeGSbCkmQgePEWbgssN0uXgvXWJ9vEUVrckI42EU9inoRJWLm7LCqvePnCdu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IDVJg5Aq; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IDVJg5Aq"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c293c683202so87392466b.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789633529; x=1790238329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T0+EbfIJEQi9Km2o4RWY1Oe967wA79enaext7ctyUJE=;
        b=IDVJg5AqZ5Y8c7H7zSYinlG5tIi5AwD653xe1nqKmyj7tZsrPP9eDHFCoxu5+v78XZ
         z7r//+jXaK1ItG7a4lVzO7wNdC8OvvPBW9rwzaghfbZRGCpL9OTTXT+bcu6z5nLUYjdJ
         yCOwUOpys8DQEkxk8s5PQcVfCbou9UeEz85BbUOsCx864wVz6ta7gT4ZNFL96mTKSDUi
         eRchZgctIDCvFsKTcHyJZdQSHo4jymsw3XwHlA5L29oFrH6slArNj5p73/AN3O3I+QYI
         1HhU7ixTJPSeHDAq8b2G57TiwRcAe+fmO95w8JTMSxTzivHi8kmnrlTAYQHLZU/jDnAy
         dzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633529; x=1790238329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0+EbfIJEQi9Km2o4RWY1Oe967wA79enaext7ctyUJE=;
        b=xC+eSNyHdKJQCY/WxVqXisJGmt20ko7uGCzLnSoSQiOMPOhu+oJgIPVOfkM715RFfD
         zrGjj6wJnaVzr72vfOhhsJU5lrbLDbH5V1ovZxuBHfb3WqxCJtO94tdvktB2Qqsv5jA/
         85Muq8OqgH5Z0VU52AZbedONfRd6A8SalRKCZJA/Ksf7m4h70P5+f/asF1b5NY0mVKuU
         cZ2FvXJym4ZicQYkUfmneX9s9L+blopEfsyJJYujvawAjsx9l0Wat/bHNlrThxP19sbT
         8j0WwIThP29By3xeiiEWduR0Yl9tQLpbBn3KyRUHeXUj6LGZvqiFBUb6OuqrZutnaINA
         Necw==
X-Forwarded-Encrypted: i=1; AKwUvBzoz6wKF9Z3jGbaiLkoOXS8mI4V/PFKfFR1bXMX66wAqycI9wtC/D02aQ5CRmO/7L8M9hivRmKASVz303o=@vger.kernel.org
X-Gm-Message-State: AFuF++nJYd4JqJQHVS+dbepvgkJs8st/oObmZVoV1g99UBFdAdG1pdk+
	wewMklGCHiHAcLZGIYdCa+uySaEQsGi0M/vZvlDw7XBWpRoBuYE05N9Iz+t+Kt5KRFk=
X-Gm-Gg: AYBFou3d7xpvSQZy8/n/jYEucEBUNbbuyowBe2PpzNuN14A0cvaQmJUD6CVszWomTdw
	gc0y6enb3s6Lhw4MaY/vID5bARcOQiAy6Y4butxqLPMaS39s3CwyycwGi0asDrkeQrtOs/wKtz9
	Cp2jcWnRqCtWZREkJLnS6V1Q+HtceAQeHvweNSQ8dUr2ElF+97t/rDGUXuHyDfIlhIdo/dGtORR
	DDNii4phNwy2h0AKDnrkVr+o/l7X+GkRcQhnxb8YGLseqUVzKdELtkxGG4CF3Oy7KmHVZ2yWAgo
	6ZVMHwkxPCYLKIiDMA4zkV3uJq8afG/wmzvDdL5KtryOIm8ibBqwUGfGmo+QNT36g2QfpMHtcX9
	fOpPdIWkCDwkcCp0C95M7tcn7adi1A1K4/FHfAAT0OOsI4uJSuqFWnx95+adjD/sfsPA9/+ZMxQ
	fV4PqlXnOz0JlWUNKHXBXTevorjiMdp+Bmkn/1Jm03Gg2/fuap0U6p6n72RmiXKDD6AqL2MLvwe
	0kTrPr1fyjVVa3K3QoN97S4MCFwWu9jIsR+iYLzFZ7lR1TT2PLN4cqMOvbK7E8=
X-Received: by 2002:a17:907:7205:b0:c29:59ea:5bf9 with SMTP id a640c23a62f3a-c29e52085bamr405665266b.14.1789633529521;
        Thu, 17 Sep 2026 01:25:29 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de0851ebsm242943966b.4.2026.09.17.01.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:25:29 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 17 Sep 2026 10:25:25 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: milos-fairphone-fp6: Add
 touchscreen
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-eswin-eph8621-v2-3-f534080a6338@fairphone.com>
References: <20260917-eswin-eph8621-v2-0-f534080a6338@fairphone.com>
In-Reply-To: <20260917-eswin-eph8621-v2-0-f534080a6338@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789633524; l=1602;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=tKqz8WaA5fCf8zqxAuhb+KSHy9L2ioB7dBm28PChNnM=;
 b=UXnL3U0l+wxPa6dEX/B0T61AEQAmzOv/3SA2eDzB+9GPdURRWB1b9TGmZdmBpcE0PZyPxTwsc
 j0/hz+WM++LBcUzDuhnIkvW3795KB3LK3CwcFy3Zl97BxeSBbPLw6ph
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the ESWIN EPH8621 touchscreen connected via SPI and the
pinctrl state for the two GPIOs connected to the touchscreen.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 29 +++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 4b7ae87270ac..498fde3d3d18 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -983,7 +983,27 @@ &sdhc_2 {
 };
 
 &spi0 {
-	/* Eswin EPH8621 touchscreen @ 0 */
+	status = "okay";
+
+	touchscreen@0 {
+		compatible = "eswin,eph8621";
+		reg = <0>;
+
+		avdd-supply = <&vreg_l22b>;
+		vddio-supply = <&vreg_l9b>;
+
+		interrupts-extended = <&tlmm 19 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&tlmm 20 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&touchscreen_default>;
+		pinctrl-names = "default";
+
+		spi-max-frequency = <2000000>;
+
+		touchscreen-size-x = <1116>;
+		touchscreen-size-y = <2484>;
+		touchscreen-inverted-x;
+	};
 };
 
 &tlmm {
@@ -991,6 +1011,13 @@ &tlmm {
 			       <13 1>, /* NC */
 			       <63 2>; /* WLAN UART */
 
+	touchscreen_default: touchscreen-default-state {
+		pins = "gpio19", "gpio20";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	sdc2_card_det_n: sdc2-card-det-state {
 		pins = "gpio65";
 		function = "gpio";

-- 
2.55.0

