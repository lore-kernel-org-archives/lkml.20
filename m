Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533108;
	b=MsFBdYlxJIZHR6HTAXUylpMsYJTRW+ihDY/BXn7HBE14Plsdru77aI+GfUg0S2nYY7Bu
	 C2H6lnZj35oPQPQod+c4Jba7M/StHGeZtqGZrPOMenDYQSdUj7WYJlUCawWsebgYIBuDK
	 +8GYm6Xs6UQxdF+omF9cW2uCz0nrksB9QCfSSN6+nk07EfJVS9I1ULmSvtmu7fRFuyUTQ
	 S9WAtkxmGVA9oDBZ1vmcTnCJq6qDGVwCAuNKd3PxwR5aQb8ViOUOuEpb+VTMeKfarQ35l
	 rPAh+Tqes3DVrVktcxp5SS+FzaBG7Z6bd3fmgR4qX6skxkO4YC89iJag55gnYi5N2aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533108;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=u4p5bylx/tgUz5l7NLz60THe1CpAntXjpezc0SG+fuo=;
	b=XSyqb+3djBS5k5kn7UAohEvTCa+T7nG494lFBxI2DK4wzxPnlXEiA0tsiTrncs8qMwMW
	 39cpkaARB43k0IIeF+zDgIfHnCdptQTWWeh7gXKTPBVnPNvyX4wyZzowbS+JfalHGorLK
	 KMA0rYiJgOS4a8i4VPZttLw+NxaB6a9zGBiDkmyw81sBmyu160qOrw9K2/TGA0HXKIwxb
	 3LdZ8/gqhhq9fqLxqLTzMKY/CZQgx/y2Wi2yiRwutVPj2m1ZfJyVTsLdBoh98UjhmFoDe
	 BhznK4hhgVcdIGe19pWAX1Fp+0wn8JybEKGO29PjqCbsDwC2fTq7ZbEB9YNeEAunjNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=xfb7VfCh;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=b856NOS0;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CBE606A8B3;
	Fri, 13 Nov 2026 01:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99CBE606A8B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=xfb7VfCh;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=b856NOS0
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794533095; bh=u4p5bylx/tgUz5l7NLz60TH
	e1CpAntXjpezc0SG+fuo=; b=xfb7VfCheXgQIiXGwDsPEpLN1sgejBCDyrsD3HEUqIh8TD1xOh
	VHxwZorv/aVV5qWxoGBSkDjrfkLbLqLVp6AA==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794533095; bh=u4p5bylx/tgUz5l7NLz60TH
	e1CpAntXjpezc0SG+fuo=; b=b856NOS0clylANjqUfXdUBeDRzAKYo3WOnlMluJv+XhZSLxLat
	BfjTZIYlItZEgix8nVuYzoyZoKAAoqu7ksYNJ5ZXhueQQ5PgPTin2qWwcAEXu1lWN24V5GXOAzn
	O3Wig7yv9y9hDGuqfJadpqqBe6Wi62C5Bq8qQWGE/X+ppJxq0VCDeV1GFw0ZJFyjPbusGvwSIp5
	C1LkXfSqEppEbpmH3wqhwD8Km0N3ueFrttr0h4nKTaO275K7gT853y6l9UVDsf189Nne6Eiak5+
	ml4ownTN5jS7dnXCqTzFbO9OyfcpAEEeoJLfWhZwkr2v7VUMBdqYQ1wlgb83dLQvJgQ==;
From: erebion <erebion@erebion.eu>
Date: Fri, 13 Nov 2026 02:24:48 +0100
Subject: [PATCH v4 04/12] arm64: dts: qcom: sm6350-lena: Enable ADSP, CDSP,
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
Message-Id: <20261113-pdx213-upstream-3-v4-4-4b01c50a821c@erebion.eu>
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
 erebion <erebion@erebion.eu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794533093; l=1280;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=p7IGpE4GSfbTPqOkJvsD/WcIlRbHfevxeKq472wglug=;
 b=2nog4EF91YRxMCs4cp3SMBPgnEmm0xA8qos/X5KbynLLY+wxr3RgDslj/vxX6N8yAcgmULUid
 /cYUftSqFyJAnyACNxskI04VhJY4NwY+YKeV2UGc2vVhZVh77s8rg24
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Enable the ADSP, CDSP, IPA and MPSS (Modem) nodes for the Xperia 10 III.

Signed-off-by: erebion <erebion@erebion.eu>
---
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index a393b7533ccbf..4066de20ea23a 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -68,6 +68,12 @@ memory@fe901000 {
 	};
 };
 
+&adsp {
+	firmware-name = "qcom/sm6350/Sony/pdx213/adsp.mbn";
+
+	status = "okay";
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm6350-rpmh-regulators";
@@ -291,6 +297,12 @@ pm6150l_bob: bob {
 	};
 };
 
+&cdsp {
+	firmware-name = "qcom/sm6350/Sony/pdx213/cdsp.mbn";
+
+	status = "okay";
+};
+
 &gpi_dma0 {
 	status = "okay";
 };
@@ -316,6 +328,18 @@ touchscreen@48 {
 	};
 };
 
+&ipa {
+	firmware-name = "qcom/sm6350/Sony/pdx213/ipa_fws.mbn";
+
+	status = "okay";
+};
+
+&mpss {
+	firmware-name = "qcom/sm6350/Sony/pdx213/modem.mbn";
+
+	status = "okay";
+};
+
 &pm6150l_flash {
 	status = "okay";
 

-- 
2.53.0

