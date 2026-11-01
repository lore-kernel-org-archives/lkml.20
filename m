Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793575953;
	b=mcGN2OfB2OfAd80oIZxz/+2Sc6PIDyY6trFEbls7A4XIWHCmkDR6dx6SxRA6DJLo99GV
	 CigPYRbirPGnaKrF6XKx5HZzNPT0hnPYK0nfu3+SUd3hQVMaqvrH7dDYTTy29+NSO8a03
	 JaodehTguMkAqdmVHINCAPEbQ3uC3zy4UxsH3+s1/n6wghrGseLaBxTLKjwMp8NZlcoF4
	 svLUyIaCwDrzkGRRmZ9nWOLXJEq7WYRmP+JvMYEIloubQtmzfkNwfA9WAPYSBbC1RrL56
	 2elMOtBr9v1Nlwup86j17sZBawkn7fiFdw/JDWkKXwtB0Z7dQPmj3qhSzXiAuWfKB3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575953;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=iz/yeK2fOPP8+jQttB1dzqiW2pcugn1b23xJp6HtfRM=;
	b=S2hY42S9C1SnyuoHy+lGZg35JHqNbXf5VJ4FbVPHgg7d1VUCXCdfPIUMn8YPULoNnnXR
	 YsZqkcA6idGiAJO7X4H/1rxJJD2U+83uS6GvE9RgCgn9/RG67dfa8Zi7IEnUeltvReR82
	 OtSvsArFKzFdtPxyHYWLBdJYuaj0nZ6pNXMBAOzgEQ+NrE/4MtGK1XU+hQU8yayA0qLdN
	 HlU3d09Wm2QE6X9UzPFGeShtYMYy+fAx9dVx3SZkwYYB7RfqJbMf2LSn3BfzUaiZ95OdH
	 0354EI0uUEl60JoWkSMZmbRCE5GIH5SIUrpwEkB6h3ua3FSPC8rca19sn57Mm+WErrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=G1zr4VMZ;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=ILCOhLUU;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAB060A2627;
	Sun,  1 Nov 2026 23:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EAB060A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=G1zr4VMZ;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=ILCOhLUU
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1793575936; bh=iz/yeK2fOPP8+jQttB1dzqi
	W2pcugn1b23xJp6HtfRM=; b=G1zr4VMZOQ/A29VXEPHd4Ut9KCzIIojtzKypEYhaeHld02Sw+L
	lvZ4YN/XRqVpmcHn+k68ggdAv5U4aRMdRoBg==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1793575936; bh=iz/yeK2fOPP8+jQttB1dzqi
	W2pcugn1b23xJp6HtfRM=; b=ILCOhLUUgOPKpdmblSjTYWDCgA1/PeaZBg3XIcWm8DuIfT9ukL
	PWEbPBnUn2FoIVJ4w+kaJsvnEX1qr5wLg8mtJJA/dpp7kiNBs0DxoVjmVLIouLUcfAM60q0PNZB
	X4TUN8CsH4oBlZwDp+YZgB9+MVHryGphzUTEz9T05WEjb5xaaBLk/Zwt5m9fCNwAPxfSf6jJwTQ
	+OR7M1XuGpuXkbReHMk6fUQBfykLWeQC2KRWgIf8OC3tKELSzxJ4xPApZvmsd/tF6SbuVs8Rd/8
	AL1dK6Xn6aKN8fTHyeNd/g1L1aufez41DfRiFs4nzjkim4qYDJRJyYLbwva7fORV/nw==;
From: erebion <erebion@erebion.eu>
Date: Mon, 02 Nov 2026 00:32:16 +0100
Subject: [PATCH v3 12/12] arm64: dts: qcom: sm6350-lena: enable remaining
 i2c busses
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
Message-Id: <20261102-pdx213-upstream-3-v3-12-cdc3be96d257@erebion.eu>
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
 erebion <erebion@erebion.eu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793575929; l=1388;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=ymLKUXMTdBOYqzoQQuAQGR3AHNoKiUIhl/PVXRBCxns=;
 b=+/iLs3UKxuAi3slpEDtBfrzmi3YqszAfU7d+UkIHAV6zraCpBC/6iD8zyhe6qSLx29UX3XCuu
 DRdUQEHpZNTDgDiiKa5RtDKll06+XBi7zucpWClDD3vCHIifkDImkfd
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Enable all i2c busses where something is connected on this phone. Add
comments as placeholders for which components are still missing.

Signed-off-by: erebion <erebion@erebion.eu>
---
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index 487ef75f2f1de..d2b3aa6e61ab6 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -470,6 +470,21 @@ &gpi_dma1 {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sm6350/sony/pdx213/a615_zap.mbn";
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	/* PN553 NFC @ 28 */
+};
+
 &i2c8 {
 	clock-frequency = <400000>;
 	status = "okay";
@@ -487,6 +502,17 @@ touchscreen@48 {
 	};
 };
 
+&i2c10 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	/* PM8008 PMIC @ 8 and 9 */
+	/* SMB1395 PMIC @ 34 and 35 */
+	/* AW882xx amplifier @ 34 */
+	/* Foursemi FS16xx amplifier @ 35 */
+	/* FSA4480 Analog Audio Switch @ 42 */
+};
+
 &ipa {
 	firmware-name = "qcom/sm6350/sony/pdx213/ipa_fws.mbn";
 	memory-region = <&pil_ipa_fw_mem>;

-- 
2.53.0

