Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793575951;
	b=10BtyU4lW0IuA1c33eC3uXCr9WvRaWURB0uIFLzYj9AmWzivzCfhCPYwjsdNvaTXuQjK
	 XVRFYTBGYC8/eid57O+NTlGGvDDU2tmDeDn5EQUN8fdXw/zfBCDpMpxZVcqUsgboAmELY
	 BEmRgRiofhcuDGlilTxIxpzOHcn6JjwMecigRHkECmO0vNfKxPUB1GRlFkqmGEjjdnlWX
	 DCXjUMWTjaUvF6F6JPLnE+51O1UHF02Cutpir+CRSez3ml6x1kL1Wac56rN/e8BqZlQ3s
	 PB1Ud+uUCthXyyVhuGTL6Z95I+TVyXOe+6bOs02/WWwau/v8Q9HRr53Xmamkt7ZfUaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575951;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=V5kMEWOWStmeGmgMF/BJEUgZUgxLSW+v/YxZPxelhhg=;
	b=YApXC7oVdJf8SvAP9toT0YJVaa+8jkmu4lYsORqj16/+vvWlSTsKSIRK3PjhM3LWdGvB
	 MjdSWs0l0dMxhygGnlG0gWUyxuaNLHOQvKgVkcQjJsw+K2FKdW4M+bQSgv8RffQTFR7RN
	 qKIZ9NlGDPrKslu/tdNkQCYIaDGvqdEv7rFEAdM7yAHr5jIVvk8bDFkT3DNq99IzalwQf
	 uLNMf49Bn+Fr2wJJb9jENaSP7CmMgpWWM/xXRDl0tYiqUfZdjNAi9qJr63vvrAMINTeUS
	 oLdWFsAPGqTsC25M9p2T6mryDRjNJ6Mg/FMba5HPDrof2TG2ndWD3CQrJgVpG9RL1oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=fR10vgYz;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=CQ3cTI1z;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8C2606A32D;
	Sun,  1 Nov 2026 23:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B8C2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=fR10vgYz;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=CQ3cTI1z
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1793575932; bh=V5kMEWOWStmeGmgMF/BJEUg
	ZUgxLSW+v/YxZPxelhhg=; b=fR10vgYz0YgDWdVclmZsM9JBIbGMJ1I5r/9RHlcCaZArGMntoC
	qCKHC0z42oZAceqKWCwD8I0Cz51TN1SINUAw==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1793575932; bh=V5kMEWOWStmeGmgMF/BJEUg
	ZUgxLSW+v/YxZPxelhhg=; b=CQ3cTI1z3O2DX+6uWDB1Xdu2zC4O038J+z9Epv2vRVkeB9udF5
	w83db1D/MeDhKFOZ9FTfTAI4EFZFVhotR3H/whntLQjurEkvOT0HXlY1QhamoFuqPtWKANcjOs0
	+MDztOn7N6hluhZwxsDxgY4W9IgPehAl3jtbAyVK/EoRkAJ5icETIdvgRXIOc0ZL0GLjDIWHOca
	M8+w1Dlt7DkXDJpUxcmXaEiSljmTYnVhjm1EubAuRVTYXtb8u/V8FLFMdPWNcA4uqIwT40cw1Fu
	G5tauo3fw4DBD6T2kXuc+sOfu9LoQonoFyn8kYuFOyRrsPPEdBgAQxsc335iwUWK0iw==;
From: erebion <erebion@erebion.eu>
Date: Mon, 02 Nov 2026 00:32:08 +0100
Subject: [PATCH v3 04/12] arm64: dts: qcom: sm6350-lena: Enable ADSP, CDSP,
 IPA & MPSS
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
Message-Id: <20261102-pdx213-upstream-3-v3-4-cdc3be96d257@erebion.eu>
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
In-Reply-To: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
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
 erebion <erebion@erebion.eu>, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793575929; l=1399;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=6UaL7C25ePkHcRL+70+tYB3sl30nVmMZGTDmYO5sUbw=;
 b=wSFtKdl5ogTP4U11DdWV+QMFAgpYNNLJBrDICQiJ5lypss4qaZdhkmwP9wunccsYdtWZxFXY8
 L/vR/v9E3QzBpHPepe8iddgVQljX/+qeECYjDFlqdx3FYll+kZMyaXu
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Enable the ADSP, CDSP, IPA and MPSS (Modem) nodes for the Xperia 10 III.

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: erebion <erebion@erebion.eu>
---
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index 1e89c9798edf8..ce351a3fa8727 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -77,6 +77,12 @@ memory@fe901000 {
 	};
 };
 
+&adsp {
+	firmware-name = "qcom/sm6350/sony/pdx213/adsp.mbn";
+
+	status = "okay";
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm6350-rpmh-regulators";
@@ -300,6 +306,12 @@ pm6150l_bob: bob {
 	};
 };
 
+&cdsp {
+	firmware-name = "qcom/sm6350/sony/pdx213/cdsp.mbn";
+
+	status = "okay";
+};
+
 &gpi_dma0 {
 	status = "okay";
 };
@@ -325,6 +337,20 @@ touchscreen@48 {
 	};
 };
 
+&ipa {
+	firmware-name = "qcom/sm6350/sony/pdx213/ipa_fws.mbn";
+	memory-region = <&pil_ipa_fw_mem>;
+	qcom,gsi-loader = "self";
+
+	status = "okay";
+};
+
+&mpss {
+	firmware-name = "qcom/sm6350/sony/pdx213/modem.mbn";
+
+	status = "okay";
+};
+
 &pm6150l_flash {
 	status = "okay";
 

-- 
2.53.0

