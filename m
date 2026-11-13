Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533101;
	b=3cJ8WWu50jEsarFIffvfRqZPle+RpazLttTtcg84H/8/tcAU7Il+4nN8XyXc+20DQVmo
	 oa5yegEFf+t+Z/gsp6wVyrqQPY5TttJznFNhWnMDCYfBX6781gQX+DnCTUr8GAxYGZDIp
	 8LPdQWS6wGTmZ/4g8Q0o0x1k8oS6OY7SPNKc2SrrIKoFzkFuLv8T7jF0B3FDt3p62kT1n
	 4D60KlGE0/YE59f13CLM9a5qw0OioMSCn9sZKHr5MJGTxW7ZprMarScygalU92Q+5JBUp
	 7NmlZHoCNDXwWknXul821w8s6NFASrPrufZ7Vm80joVxWr3H8PL89OcZ89yOTGTjT+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533101;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=TVsGbGFloA0ewuyDVfaBKr+1x045CdcDbj7hxIb4bVo=;
	b=OmJUS/Rv05z/wizd8QnsvLAdMEP11KCywwidDqSsCk3Py0OzcEr+Ol4U6QMdMl4ba0lM
	 yXa95KT4Kwbas3gCrcEez/kcZBP6gT7WhowXGQQubWjehfOi022Va7mJ1lo2sOu48qaJc
	 +8t5X+91If6zXi75cJjFC2k8rlUwAMiojp2/mto731N7T9RI4QCD2Oiv4md+HPl1bVxlI
	 tXPgoTpD+brqGYSt+FNgVJ5grqjx+9Yw9V7S3zRq7OSnIUOiecAtzPhddMxtB4hVweo2s
	 tDtbrPB9YEaSHwy5TRmwOvBeS2fcaiWp5thXFZTH2IpVDp1c6qD8ljcs7j74NGA0iUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b="Nzy/hUrf";
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=BOTuAZcT;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAB8606A323;
	Fri, 13 Nov 2026 01:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FAB8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=Nzy/hUrf;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=BOTuAZcT
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794533096; bh=TVsGbGFloA0ewuyDVfaBKr+
	1x045CdcDbj7hxIb4bVo=; b=Nzy/hUrf6LNM42FXJ7fs9Wo3F+rut3R9GmzDX/Bl7xOIfF9b16
	tFfKyYntaFbzsfrH742vGEjaJA6+Fv7q8UAQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794533096; bh=TVsGbGFloA0ewuyDVfaBKr+
	1x045CdcDbj7hxIb4bVo=; b=BOTuAZcTtaJaSZL8f/h6UJZrUYqjfL5H7Wh5AnJbMakXG62brn
	XljM14i5uCftmLvBeXVLhzDR3bW6jM3RLG7Wv350OaNThZcghwDGVFhTHquDoTkYeaHIEvCIL6t
	2CA7StRLiLRx4IXrKMvsduY+wz0bHb+SvGpCd9t+iX9crTmeEX+VIhlUQ8KQiHBZ3F25b7xEOJG
	C13IN+n8LgHgIo0ElO6hsnV9i3QOlMJcchyE1nWaRd/6XjKqL13uNj4xXHIMA6EDbT/kty78tmg
	lTlgGkp8sLhsDcPDRuqmsg0X4upqHLF9O6UHrGPsTSdVCxWfPmqm4lIayDcdr0SjgwA==;
From: erebion <erebion@erebion.eu>
Date: Fri, 13 Nov 2026 02:24:50 +0100
Subject: [PATCH v4 06/12] arm64: dts: qcom: sm6350-lena: Enable wifi
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
Message-Id: <20261113-pdx213-upstream-3-v4-6-4b01c50a821c@erebion.eu>
References: <20261113-pdx213-upstream-3-v4-0-4b01c50a821c@erebion.eu>
In-Reply-To: <20261113-pdx213-upstream-3-v4-0-4b01c50a821c@erebion.eu>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 erebion <erebion@erebion.eu>, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794533093; l=969;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=8BOhwwcexPTIilXalqobSMw1TD9eB+fAJDqTb8Sq+L0=;
 b=wQ0FSrDjcEuCfCgtPmz8GZXvTcNtKxLfZpjqev1NclU6P7RdhRgWNxcHZW65ROazKmknF9TyB
 zXTsn5j4EnGBCNwU7ZOKvWHkC2LbOP842NhaNbYsMgG3cNcuhoDdIeF
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Configure regulators and enable it for the Xperia 10 III

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: erebion <erebion@erebion.eu>
---
 arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index ff07810c3a6a6..becaf226af88c 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -541,3 +541,13 @@ &usb_1_qmpphy {
 
 	status = "okay";
 };
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&pm6350_l4>;
+	vdd-1.8-xo-supply = <&pm6350_l7>;
+	vdd-1.3-rfa-supply = <&pm6150l_l2>;
+	vdd-3.3-ch0-supply = <&pm6150l_l10>;
+	vdd-3.3-ch1-supply = <&pm6150l_l11>;
+
+	status = "okay";
+};

-- 
2.53.0

