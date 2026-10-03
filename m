Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03A1471D0C
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 20:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791058928; cv=none; b=qQPQj5ULfbutE3pmpqGQpNZmDoJVtt102jUJinTVOIZAOkPcUXR6qO8QXk49fsNL7RMvlHOSBAKThy8ujHYgXk/YfBqCrdTeqxZzmC/k230beneclepqc43tW5T1hkbretP6ZKyrtZB4bTW2GjlsIFtbDfOpmIVEnmGDNBMCQf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791058928; c=relaxed/simple;
	bh=vHlNApf1n0eU2OktVinpI4zv/MZunnjQ95s6jli1xzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nzH7rPR0pACnlwcdmGYjbqIALxEVC9Wk1101zO63puTfbJ4VBcQzlvV7dAmBEnUzOwOwdthERxj0J3k91mQFZxn+zL1INlRoG4OaG9IpzatPb2F5chAlpWy0zgOUvBzynQd9dDeEKjbFyoXrv9xXaRt/1oAcW0+BV9Px4lUjMuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9CpxOpQ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9CpxOpQ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso6766795e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 13:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791058919; x=1791663719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jdTRy1oUzdTMPfJnHsa0F48c4vY6O6GHObHAbcTX0Q8=;
        b=E9CpxOpQvqdDyv5L3mchbAdOH00kUUYB8lcQJjG10gcp6tkpDTJacm0DgQWTRhLV0T
         tAwTjRZwqcREb4depS7jx7wRB8pupFAd5/eWZlx+d1KO2N1OzFJk7d07pG36kIMRg3cw
         MWFmEjYqSCc343DZ+IlEeGeifBDF7hKrk+hKO01txOXbMwydszp98Fcm052sbI6I4WXd
         5UPZpXJRrm3S+XbzfdIGMSBuneyVb+5VXYi3rF+RBqdaRkJoVyEGifmF2Z67N/hq0UbE
         33V4fUhOJlJAcxcL6qVPi9UUPtZECO/DS03hKW0gfQQrtCzcNfiHnOGjqJNLq5Hy6t5x
         KvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791058919; x=1791663719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jdTRy1oUzdTMPfJnHsa0F48c4vY6O6GHObHAbcTX0Q8=;
        b=dAsNWAq4VJVj4orvmekmf4yKUgQIUD5G6YbZc5rcocamQTvEF0eBi9bfYugFW7K7bk
         a8e1C1fQgTOTqVtioEbeFeypbXM/c/pIqtpYqNBJ60X0TrNzpSsFAfUosDVn8dZIjMs2
         fm21K9kwtRPYviWVtq7cYDBR30SwLop1bZSJ3uhyHyLYJh2tcGMFDbVAK932Vlz+9XJz
         s5NPRu0+EEMYXHbfW5Qt2PHCQWHKOKxCbhjMX6G3tgydHsdHW6/NFdfxO7e/EKU1pQzb
         gFzJoEpfeJiUgQEJTK66MiTEUtmTd93v9vOAwBX+SRpPeEkHIGAQUyakuW3LTeWKtquK
         3amQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBlAGOlDy5T5JXQjsr8zMWVNvFh3oEYMsJ04Nq20o0clk8nrN94lYiWGalhxiywQAzzCaFLN6nyptcLpY=@vger.kernel.org
X-Gm-Message-State: AFuF++kLp1gxHPhsqETEcrzuOpZ6Fcxg7fCBgw+xP6GjAjJz+BaL/Vdr
	ix+17NTUjONu9onRJLKM78pmiTs1jj22idlopuDo8UCIeTsm+shR3Jx5
X-Gm-Gg: AYBFou3ct075r01o+Qen1oUXBeG+YSvuTXUjwjoC56V+73NcYxBTkNoITi4Rl9PVmKy
	Udfu1m7dLdR4lKTvRrzImrIqfRk0RiBzm5NVNUf8iH+5zDMwlUL6+2sZeYN485835p4a7YBVppY
	qsBPEzBRinXQ8ZHQHvlpYlMCBYayI/Z6FfETYYFeva7JURBNPNE7unK3dewn+PEKDLpYHqNByAo
	uzInpWukALuY3SGheCDCfcdEtIDBszoOKmiF/jxIqh43DTO8HtE1NshRt0jMNlZO4NGOyh4mqTL
	bSm1AUIm9F4/myWQ+CuhJYk/6C3FRuGmfrQ3bxis5TOyuhiaAqZPljrC5w6430Fl/wXFtiEhrSl
	zf63EEzXXJy190GfOqYfDyt1HI03THg/xHdUdKp9RoErT0o52pCucYP/7TvHD51Z1r0AyXqvikm
	s+wpyMuJ9I7VPkCl1w9sOucZPbZ9F0DG5giII+sQJBvaMekglu54E6ieOcpIFM81SeGGQ79e3XZ
	N0feg==
X-Received: by 2002:a05:600c:608d:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a02750fa51mr115371465e9.4.1791058918814;
        Sat, 03 Oct 2026 13:21:58 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.11])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48b380facfesm15083316f8f.23.2026.10.03.13.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 13:21:58 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v5 3/3] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the embedded controller
Date: Sat,  3 Oct 2026 22:21:43 +0200
Message-ID: <20261003202143.4697-4-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003202143.4697-1-okerixx@gmail.com>
References: <20261003202143.4697-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the Compal embedded controller on I2C at address 0x70. It
provides the board thermistors and the CPU fan speed, and drives the
keyboard backlight. Its interrupt line is TLMM gpio66, falling edge, for
which the file already carries a pin state.

That state leaves the pin without a bias. gpio66 has no external pull
and floats when the EC is not driving it, which shows up as a steady
stream of spurious edges; the vendor ACPI tables describe the same pin
as GpioInt(Edge, ActiveLow, Exclusive, PullUp). Enable the pull-up.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts      | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
index 769f195c99d9..bc840fd8e458 100644
--- a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
@@ -659,7 +659,15 @@ &i2c9 {
 
 	status = "okay";
 
-	/* EC @ 0x70, irq = TLMM 66 */
+	embedded-controller@70 {
+		compatible = "lenovo,yoga-slim7x-gen11-ec";
+		reg = <0x70>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &lpass_vamacro {
@@ -990,7 +998,7 @@ reset-n-pins {
 	ec_int_n_default: ec-int-n-state {
 		pins = "gpio66";
 		function = "gpio";
-		bias-disable;
+		bias-pull-up;
 	};
 
 	kybd_default: kybd-default-state {
-- 
2.55.0

