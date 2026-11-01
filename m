Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793575947;
	b=4d43uTv5gjCIYrgKaX+mN5cIWz5OBfpDyOvxkcfqr+c6DsTFfRNf7Wq6/ssP6UepHFF4
	 bWcqBkWgYmuiYrn5bEysiBtVSaHMG/cNP7XxrH7tqj73xIWJjiM7Wtfkfa4/HqXMj5F0e
	 uVnFwT/uTXUkQQVCLB9dop5i/BWKHgLVayJ9V4ZTWCoBsox6OBWxCN/t9SnZQk0zlqFuo
	 U7/3uKlBePSdP4a23I2A9OCA19zWg2lEfHl6zyFRFekLyA8DQwKp2BH4HnisAGWnChbC6
	 Vsw4G4CzudWBErs97yIi1X7mUl9AJznnopM1Y4OIViWoKJDQEJ4xTioo+ew8jjHiF3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575947;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=GPXltLOZnrnsWMqleRNI+/GoCMyVYPKdu31vR8p/h6E=;
	b=uWMkxh5Au1tI/x4jxELDT/elNbMH/fSDsAk2+ifxwejCV2R/GvNODJU+JVGvB04fkEZ/
	 swlak67bO01lYoA0rCtea0foJqkAIiAcuTJ4n2lja//hfxcEWSuFPzXdrQuns7fnTz5Na
	 JARPqV1q9tCDdt4bYVag2D3K3YbLuWXqlFmpClZfQ1XLsBODVqlQT9OetPN6diGsLFOHL
	 FaMNQwMoC4ns1GW2XdkELHmVFouKR9viCUliZxCmuGQUmQZJN29iRjirjLvJrCZGoFX7d
	 3S2ZVhaH++gVSgjLPZlKJttOID/b7zDC1/t3eoOwmiB3SAgd1Ycg5osgJkM/5PzTqyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=XTyDD+Tj;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=pFUwh24r;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66F760A2614;
	Sun,  1 Nov 2026 23:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A66F760A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=XTyDD+Tj;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=pFUwh24r
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1793575933; bh=GPXltLOZnrnsWMqleRNI+/G
	oCMyVYPKdu31vR8p/h6E=; b=XTyDD+TjzEx+P+NEjRBRVIEOGkCXTbcr6/ftG/Z2hxWhtSW4rO
	6GQy1/e2EXEvN2pwss0xweKu7yNJ9iCXkJCQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1793575933; bh=GPXltLOZnrnsWMqleRNI+/G
	oCMyVYPKdu31vR8p/h6E=; b=pFUwh24rdyjzLIDqbY9tpm918F9eDpnCgAbhOxjjDpvQ5hS2uH
	mUhLF3QLTTAS8SbAyuzqEcmV7YsL3NC2NkpvhCJolKHT/w8nLftl9Xoa432UEQT3S0lbd3ax3wJ
	CUrGBviL39CIFOP+XGp4PTq2EQ5bVUhhL4QJyl14fWGUJ6QASjCDEwJPwWmqy2JxVH4W8e5EyyM
	xuNYKijwN4Vme566/TkhC75NG0oZkgAESOD3Hp9vBvXqWM0DV/FTi4xXPaVMzarktySZhYO3Rz9
	oC36S3n+KfhBD/hTiBmSigqA1rLsKdf3spi1iYhwduh0PMhkcpLeXZfj4/KzgDTH6qw==;
From: erebion <erebion@erebion.eu>
Date: Mon, 02 Nov 2026 00:32:10 +0100
Subject: [PATCH v3 06/12] arm64: dts: qcom: sm6350-lena: Enable wifi
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
Message-Id: <20261102-pdx213-upstream-3-v3-6-cdc3be96d257@erebion.eu>
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
 erebion <erebion@erebion.eu>, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793575929; l=969;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=XtTq4JnLTEWRP2w7u35ltbCzleX5q+xZyXQ+K8WGutQ=;
 b=WiqgwtBTf0VUpP6BilvAkkcO4Nwhc2GPRL5kbzz3c3BkRSaCzGQhXA+i9UhHSsTUjHQ++l+9+
 EVZPpIJvSehDgEJQWeAnP+A5fmvPE2Z1XGI3wQGwtoP8gDxDTk+oBGJ
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
index f1958f4bad05a..1b54d9869855e 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -552,3 +552,13 @@ &usb_1_qmpphy {
 
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

