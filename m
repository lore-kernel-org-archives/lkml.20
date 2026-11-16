Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869441;
	b=ThE5Iv+bkfLzBz2F5FCdJw/CDHSixNweWx4DvmrKODTgMCWD8aPkKs+8Qpg9TL+5z3/k
	 3aDTrb74KbBCtzYCAbTHQ5ER+N7WHGnH9/w/dljirBZxrksPVx39coOVAIMwQP9aIYq/j
	 EhuE2MAm6yJNTODTKqyJ9eLKCz+r4xKH07g7LA9dluKoujDuHHxFOo77flFZbAYv4hr+y
	 wlR6pU1nQxBF6uvFxHBIrvonbwqytonJCgsB9KBht7IbONImNQHAdgDY4w+N46PlzBc3p
	 sf8Ru1zaAJhSv7BlQ+GlJx+elE6ot3D1uT1+t4qXg7MrHwfY4D58/vdnTbAI9nptCKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869441;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=YXt9SF0ihBDdAJABJv+iTyKU1xOuLf23v92Bg7tLx/I=;
	b=FjG6jGjZfD3T3tWUE5rZ1GvTxNF/rC2KzwTP70kFgEPjvWn4rj/vCxo+GNKw7hvyXUUe
	 xvbfl/5CoxdCtSdBI8q6eLdrLa0OR+ollobNAYIcjZgRokTDI+DpFTGDoGvaZm7ZKbntz
	 oYLPKW/tyQgRWFijAU7B4eybtaqM+5mYihMptn473UPSsrGJfJ/0koZgBl2y5baNVIyxc
	 apEhtJ0F5VUAt5K8N7OhnIW43vEX7eXOdrJjOlmws+Hy/Dn8DZ6lCC7U8YtfsqMJv0tuo
	 PZF9GiEILXjLJmnZnb1z9O09GimfmN4KmlNFps50HHGaM1UMFrpgMp2I+wsco2VXQ2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b="/lxt+dAV";
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=VjmDMRlc;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC4060A2610;
	Mon, 16 Nov 2026 22:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CC4060A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=/lxt+dAV;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=VjmDMRlc
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794869439; bh=YXt9SF0ihBDdAJABJv+iTyK
	U1xOuLf23v92Bg7tLx/I=; b=/lxt+dAVt7LACMaOo7xV0AQSglEhI8CkAbEJljutLM3rr4bMNa
	v52jjsS8F0osmhPvOm5YMxLIfYK9aqqYB0Bg==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794869439; bh=YXt9SF0ihBDdAJABJv+iTyK
	U1xOuLf23v92Bg7tLx/I=; b=VjmDMRlcf5R/09/QNdBeACznyqB1ZM0R9vCVwuyTDypZlNUMUP
	Xr3O8PL1bDxyXdHJ829sXtErnCUCeX5RZNyXFsMTb4lBQvDKc/ljsRR0knrs1aJ9b9orV2dAUvn
	PJabiKivjBLZq2jMqk5vc0K+erQfMxUlkdAn3TT5DBycP9APdoqDlcbjd/M0FrS2xszHjm4Ol6/
	wARLxS32yz2KxzsuIL5T5OUiztFDGBjoibw+CLC4hC56+EMrpGTslw8HU9f4npuB1tCgHJ0ZDSb
	474RifnysVbL7vauzgraZAYAAqneB/t6VftXgW2CwXxvQLB3werD1TDmR1E00C3HAJA==;
From: erebion <erebion@erebion.eu>
Date: Mon, 16 Nov 2026 23:50:42 +0100
Subject: [PATCH v5 12/12] arm64: dts: qcom: sm6350-lena: enable remaining
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
Message-Id: <20261116-pdx213-upstream-3-v5-12-7318a19806eb@erebion.eu>
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
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
 phone-devel@vger.kernel.org, erebion <erebion@erebion.eu>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794869432; l=1288;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=aJ4a5j34i33LlYaZRgYkFWaqGNsRhdjaN3iOozfuSAs=;
 b=5q49vin0DlBDVK7S+dZOd1wKqBOyiBVZ9xoSGcWf5iWBnHsFgIrrKQ8Rv8iLmz63aYEkUXzWx
 /BVW488XL2aDZ9vyNoGSiybBFNjYcUBpfu0zPMV5Q2Pqhcq59AQnMBt
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Enable all i2c busses where something is connected on this phone. Add
comments as placeholders for which components are still missing.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: erebion <erebion@erebion.eu>
---
 .../boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index b19e76b3c1a75..08647584af0ce 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -438,6 +438,13 @@ &gpi_dma1 {
 	status = "okay";
 };
 
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
@@ -455,6 +462,17 @@ touchscreen@48 {
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
 	firmware-name = "qcom/sm6350/Sony/lena/ipa_fws.mbn";
 

-- 
2.53.0

