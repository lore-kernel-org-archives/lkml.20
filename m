Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268414;
	b=O9ldYaPcNLjpe3/97JpdOV6XH0CXACVFw3qPZ59J0j3wQfC52JbDBbydwNJYRSxZSXrX
	 F+Mc/8EWUjBxwduAP4gu0/N4NM8JpeNV7g/p+7Yu643qBD7VVqys+3YQSIcDiUYn2M4UP
	 JoLnSWOGzlzK+CFi1+h7ZySmKerxIEeKL8yk8x3X9yoAI+9KCNGh8mnASUsKM8rBtnsPO
	 BqNoLY/eJUOzwkhNUWveFoZ24Pw/5mgqmJB/0mt1HRMDM7s68bP3AhaAVZwGt7dTFbr8K
	 3Z2I2DT2e4Z+w0z9qy2pK3owpbwlXStCO4wVEF3iNW5pwafauNJ4KtW2lgK/xPF7DWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0SbZPVThhtjU5v2CJr4ClagjjvnIt2bp8J9XxZctWA4=;
	b=MzoxPseJDAoOX+PSuHtrFFWX0+W6FKStc0V0EnHf3XBinVT/Q/kqXIWl6CWBcnPicBTX
	 zNJzGefOchKR+kVSEI2aIfwtCLdEOK/FGcnU/m3PXGyqmbOAPiTDARdy9KXL9uygE4bBR
	 Jb8biC0j9XI5ZFscORnaQkqUfFvxhOk7WnCrUJTfci9lbSInq2V4VgKz2Jva0q2F2+6vs
	 VTNoBSf9APnlmByOn2lBVoMkt+Ijc4l+OabA7lUA8pXtOoIxrQUtOLj4g3UZJORAkmqO+
	 ntH9Ju35Uk4PwSgV5bsuzYGHKm0QSpy5/8P5ryHUzk5VgR5gG1BS7/YioNg/HiDNQBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lAFFjDnK;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0354360A2606
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0354360A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lAFFjDnK
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so12568495e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268412; x=1793873212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SbZPVThhtjU5v2CJr4ClagjjvnIt2bp8J9XxZctWA4=;
        b=lAFFjDnKXk3yH9RHcKlULdwN/XxVDGn0oMA8mXORaKO4pb2jDfGpEFQuvU2GdRYBrp
         odpaKHZhwiUMxt/EhkksTRDQKBX23YlXeGuXC0spnbFsv4oV/poSijzq+2qP/JhgEc/d
         kU8NIECqSVobeduQxcoT20A1EpeYj4nSO/JzjAojX4gqStiVhWoMojgLLiSH2fpGShX+
         K3p3JmvcAFy+T7yFWuGZT4Gj5Xow/XlQl/KVGMKiReFsU0RZOR2bCKv7Pki2IukrhFwv
         2paWFfgdWETuDBSmNXXM/GNoRDbiJtDQ8mQXuUJ9ku/CPcKcrrg1Cdb/NOBB0OYvmTVA
         Y5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268412; x=1793873212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0SbZPVThhtjU5v2CJr4ClagjjvnIt2bp8J9XxZctWA4=;
        b=gz5lsn+vuT7pAWSB68un5vTwRFeDtLCmnNGlO5wK5J8C0izWnlxcKvXrDXdJakf6Fv
         iN401kmFNwFLEtNceJ+B+YqJ0jC5YlCHRfpeCQc0BPjREfyvEHJ2E49FvNHONyYRWHI/
         6AfNInbNtUEVCfhBHV527i4hVHqSbF8pq113zuB4CExcqo1fxwe27FTMK/QuVFcbujf9
         3D7qD09lnJ+RbqBiuqbmwNztC0zkdHcyFoU3tG0ntS87XhHizdxsDejgoC7rZN7mN1uQ
         IKXeXZ4sWvL3Fpwetj5d1L4NZ94n1b9MgFPvMBo+bZp95UVAWzd122cOy3ku21Qo2b3M
         yZ8w==
X-Forwarded-Encrypted: i=1; AKwUvBwirZm4GuMQzIst7U9LV9bIAfWG2VdeANB55Hv1W8cV7SgqavI8sDP7ya8RBF4ZwnszBFV44qKBh0YXPbI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWKnVjfDfU7Q3zY/Vz2zqXueD8wh5gJlB+zYjcsdRGB/NxuGGD
	ULivgTHeEdzFJWqFcwwrASHW+rW2xbgdEXDJ0F/J9SKeZmMHIGVLXTSp
X-Gm-Gg: AYBFou1BkE/3r3MNs+guh8MOgolkEKjr9vXw8amqXrmZb6kIxC/DmnZnhoiogx20thc
	S7cxPlnnWeTNAxmqzRAsFehyEiUhiMAqXx71nVhCtIwbK1yOmBe7fC9aeZtSflz0fyy/wb70CK/
	M4CRGQMDRiU6KUGyuEqisYYjCDWe+b+5SnH5BKvFcm1N+194EnCtfnxX7KfhGHbMwdh92AgVdqH
	3UJcdjq0OJzxcWadW01Z4bzTAXfPQZJg/TY0+Utd73XrlIWo6gQpFsS2jioH4u41GuqvZzdsORi
	Y7C6IvDx0ZjXLeYqjQrV4HCAX+U/+e/e+pYLwc3nbEfI76B7aUWXuYnytbGSZqUH/GgC/r5hPca
	IKDFzlEjxjy/wT9VS37ai3o7YJjzi3v8jrJLlHAPDv3TUK5MtwuVU9BqTm+hi+KY0jtDoLb3PP8
	WohFJX6gR2h0XfzB/OFZeYi6QDHqM8P1WnOBXlXbZ778ytFBP33sr0YpgT54vmyE5PDoWhiJHgc
	rM5RDOtn8BXIuO6rV5ctc0yj20vpydQnsxBpyGc/3pV3/1o0IcL2zo9ZBCg/al2Z9AhRr3yKSpz
	ij1DWaVnI+DMCZNmW3wZDQfkVl52Ke4yqbklnsVhHO6cjjJG9sFAOvRjDkRa+VOBKWg27JgzgqK
	jcBfIWUiy
X-Received: by 2002:a05:600c:4ec7:b0:4a2:a9:ed5a with SMTP id 5b1f17b1804b1-4a9660b5041mr117976975e9.8.1793268412452;
        Thu, 29 Oct 2026 03:06:52 -0700 (PDT)
Received: from [127.0.1.1] (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm53082825e9.11.2026.10.29.03.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:06:51 -0700 (PDT)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
Date: Thu, 29 Oct 2026 11:06:26 +0100
Subject: [PATCH 4/4] arm64: dts: rockchip: put the PMIC into sleep mode in
 suspend on RK3588 Tiger
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-4-cb12621c1fb4@cherry.de>
References: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
In-Reply-To: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Joseph Chen <chenjh@rock-chips.com>, Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, 
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793268406; l=1641;
 i=jakob.unterwurzacher@cherry.de; s=20261029; h=from:subject:message-id;
 bh=SDfGdhdTbDViPNWR7gWVkSFVjA2d78IFMYAVeDi6pgc=;
 b=+lV6mFqZezu/+F0xruZF+cG3BHg9hNr6TFfbzH6ls2C4+aEQv2qB9TmeiX4sbnF59e3EHmvUT
 spRbBmKPD3LBiX00XMbFZ9MHPNkvGrR2KGQSbwdMr2iUT+IH87yeXEr
X-Developer-Key: i=jakob.unterwurzacher@cherry.de; a=ed25519;
 pk=0v1L7pjG4d7PcaYPMOmzP4SjaRtnB+8bMzZLZCRzB8I=

From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

The RK806's PWRCTRL1 pin is connected to the SoC's pmic_sleep1 output,
which the firmware (TF-A) asserts when the SoC enters suspend-to-ram.
It is configured for no function, though, so the PMIC ignores it: all
regulators stay on in suspend and the regulator-state-mem settings have
no effect.

Configure the pin for the sleep function instead, like other RK806
boards do.

Measured on RK3588 Tiger on Haikou, suspend-to-ram with the logic
domain powered off by the firmware, module supply current (5 V):

  PMIC pin with no function: 0.218 A (1.09 W)
  PMIC pin with sleep function: 0.086 A (0.43 W)
---
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
index 161c89c62bcda..592a2d11b36b9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
@@ -471,7 +471,7 @@ pmic@0 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_null>,
+		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_slp>,
 			    <&rk806_dvs2_null>, <&rk806_dvs3_null>;
 		spi-max-frequency = <1000000>;
 		system-power-controller;
@@ -492,9 +492,9 @@ pmic@0 {
 		vcca-supply = <&vcc5v0_sys>;
 		rockchip,reset-mode = <RK806_RESTART>;
 
-		rk806_dvs1_null: dvs1-null-pins {
+		rk806_dvs1_slp: dvs1-slp-pins {
 			pins = "gpio_pwrctrl1";
-			function = "pin_fun0";
+			function = "pin_fun1";
 		};
 
 		rk806_dvs2_null: dvs2-null-pins {

-- 
2.47.3

