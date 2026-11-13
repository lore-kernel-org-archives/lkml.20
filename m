Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533112;
	b=pyuz2KS4sNgVQoKsrMGiNQldaIWsnchrYfz40AeOSDL8yYkJMGxw/i/SaPomgzBsai76
	 EGc79VDd0KxN4NiTPa8IwW/NL/FMnGAlzsOWxxL/8doEQysMnogfgVZazM8WKMyP7znpF
	 r0l+9gZSFAa2NvKfZ5y0lRZrR3cNUhuehfyoSuscPIVEUOmJGZ1X2Xb2kFe7Mr4e0fueu
	 9MxC3te3doKypp+eJys9R9D9wwQDwylkK65Qpvgd54UBOHtGPKVXKDnkKQMxQs2j712Hf
	 6ZVv9PywQi3hPaN/gp4enQQ57Goy6R3CpLeQojV+hZrawRnbKLC5Fs/6uGHNmzRzTdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533112;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=toaiJ6xRzRwCiqQcoMYQQ4KlPimfwK+TpP/19ypXGuo=;
	b=4fUqyqny24G4W7PhTtZrt5oBoSGIHibPKcu/2UXEYHIIRfDYUkJDTcboSPsa7DTICsfc
	 RgDgQj7dp+wrxcEgeLYQFTEaL6V4e2rYsaj7DAUFgJ5nq0ruUXIqPzS3jKkHhqpUKJtzD
	 RwfE2Enxw/Ka5xV8tx+k4jFSsFTyJJ/dCylNUSFDIgPs7P0bTcGzn6fxAYnR0NG9BeoU8
	 t89MZ6XQLIJL6kprfFdgX7n8WAJ+D9T6hszBqBazk+LFgtW5aBixfKiJxZmi6pLObH/9w
	 ClXnSDq7chI54dfkp/jvm01IW4tg0u+oCEW34M2YCrKSDEYuIi8/nYjitIlxd0TnErA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=FXt5kdIY;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=hdWWgIRb;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E72606A88A;
	Fri, 13 Nov 2026 01:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09E72606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=FXt5kdIY;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=hdWWgIRb
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794533098; bh=toaiJ6xRzRwCiqQcoMYQQ4K
	lPimfwK+TpP/19ypXGuo=; b=FXt5kdIYy+F/bIlV0oHXP4dINEBX/+AHX40sj11zx1tz4sHlTG
	5PG+Qf1VRp4HU/X0HCbWkIoZOSmylDRrGyAg==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794533098; bh=toaiJ6xRzRwCiqQcoMYQQ4K
	lPimfwK+TpP/19ypXGuo=; b=hdWWgIRbEee09411QaXuwrtze4JPWYOVcETQNraOeU6HkcXn3C
	x6fVoRvqvxCpCdCI9ZrBbASSE4HcYpFgMTtHdp9c125S+QvHhxwg9KjL62Q+Sl8GJRHTKVubK5G
	x0LRIsKLNyRJCxI38zGkec/F3q75R5rCJUqsDjz97AFQPnyla7IcJnVYFLNqk0XL8ssMItfMt98
	BqKQWsiMQEZ86iHL9v1m3QEQc+sjPV1XrviOVX5OyUsb0krFI5N4OWNn2O+AkVg0ZSwmYEZsH4H
	nWTbnhvTiQkoKabXn2QRkyXdCR8zS6kEvoODlezd3jjlTv43Dzu6JaUvRZt8wy4lymg==;
From: erebion <erebion@erebion.eu>
Date: Fri, 13 Nov 2026 02:24:53 +0100
Subject: [PATCH v4 09/12] arm64: dts: qcom: sm6350-lena: Add PM7250B
 thermals
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
Message-Id: <20261113-pdx213-upstream-3-v4-9-4b01c50a821c@erebion.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794533093; l=1287;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=XZdwyvJDFwgUmhYR8i66OVWnfBf8i7F33o8/IDxYXnc=;
 b=2Xkqf5lBGGdZAa8J+gBkJi9kikAS7DWnEnk9RCkDSIKjXAirg3yRnianu+8oyVAqw9pO5j2l6
 ZsHWsYmlJyBAP2I80Gsb9J66x0NJFKu5wgdOHwRXGgju1vvpPmN1vDM
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Configure the thermals for the chg-skin-thermal and conn-therm thermistors connected to
PM7250B.

The trip points can really only be considered as placeholders, more
configuration with cooling etc. can be added later.

Signed-off-by: erebion <erebion@erebion.eu>
---
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index 361ed8ec96c81..d37f5090dbfa7 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -80,6 +80,32 @@ memory@fe901000 {
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
 		};
 	};
+
+	thermal-zones {
+		chg-skin-thermal {
+			thermal-sensors = <&pm7250b_adc_tm 0>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
+		conn-thermal {
+			thermal-sensors = <&pm7250b_adc_tm 1>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+	};
 };
 
 &adsp {

-- 
2.53.0

