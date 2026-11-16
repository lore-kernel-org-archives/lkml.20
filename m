Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869453;
	b=BodzPMd2/N8CajV2r9wKACsjQ44+vzH1bH7dtzFjVhs51Zge4zFi+K7iV2dUK69JutAQ
	 Pxnj9w6N/UVpBbdR7spnkzs7XzvyP9/MPe6j8RE3S+iBQQhrIacJC3MEHB+j+aG7MVRrU
	 FLg1KMih+KJkQUaO1vf34ITEuSIrowGZYKZwTZY3dIUJoz4eChvoqCrimV93JvUWzQeFg
	 Tzl/TJ6J1zT9E/m8hwNdfzsdUZDsix/kSChW0xeQVycDC1e+w3wrGajEmzOEVhjynieru
	 OomRysNYXdcHw1VK8Y4n0wlCi12ZM8ikjh3K5R+CqzwgYkNtXQ95a/CcqSorOWq9+pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869453;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=TdOweBnFk+YgUurQpAEREszzl1ec/OctyqKBzrefpY0=;
	b=NoH3KmkuxuoNnpgajKZXO16X/d84JxYxu5r7UF4YtVY60s09pYgSfl0ekIFUGlq85Bic
	 UyYBGpZRxsIP/OKvRJlz+yDL+NBMiQyEIwATEa6MdfqVkB2VSLj3zKGT7OknSyhMuaSJB
	 U0uyVVlkS1weOPocXxrvauLJVatx5QAD0LV6lHe5Jtk8xVb/9XbLnUm4ZyLetuO6yPcFU
	 QpKQjbs5OzlLTi0Cbhh65yoHTXptbACnXk/l/sVCE4p9fmekSFgEz/G2aXoYu/hltdeC3
	 FwEjaHfqbjwbPcfVacFQfRNht2XNMQ9h6wBGLxZqk640/vZVxum1snpuE/kbKhZRM+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=8bTyDPZx;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=pgyg61Gp;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDE3606A896;
	Mon, 16 Nov 2026 22:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABDE3606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=8bTyDPZx;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=pgyg61Gp
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794869437; bh=TdOweBnFk+YgUurQpAEREsz
	zl1ec/OctyqKBzrefpY0=; b=8bTyDPZx0sPQ+3nB7V/Z2Iy/q56Wi88G8xYxWr05bre2qe2V06
	j63ZoTIdjX2Hlmp68zxtiBqkHkF0P1oScKDw==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794869437; bh=TdOweBnFk+YgUurQpAEREsz
	zl1ec/OctyqKBzrefpY0=; b=pgyg61GpONNzuMRktNw/yBz0gYk9Vhj/nDK3F8sQkgz7e/P9c+
	ppVnGVMTbdEWPIJzSs69ioL6pFtnWmydrzlJcXH/nLoX2fJjtxSB4S8tYBnJ11K97wUYnOqCunw
	H77XteEY2Q3zLzN/RAojs4OTuENYX7DckP3+apLXHq4FxfvcKnkjdZBI9Y4NIJKzOFwf9U6u+WB
	v9B/rC8/nhYW24oODmM7luhJWcC4jgwhC85CPWJ+ru8B+6NRd/zprfvM6otP4bwkwIz1EW8MniG
	psMt837/YgwSqnT2OwduVw0nceBFBUefpJojPWnDOTgHpVuJwStH6MPvmwejs7FlFTw==;
From: erebion <erebion@erebion.eu>
Date: Mon, 16 Nov 2026 23:50:39 +0100
Subject: [PATCH v5 09/12] arm64: dts: qcom: sm6350-lena: Add PM7250B
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
Message-Id: <20261116-pdx213-upstream-3-v5-9-7318a19806eb@erebion.eu>
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
 phone-devel@vger.kernel.org, erebion <erebion@erebion.eu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794869432; l=1287;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=Z0Zc6CdBaHZsIyccJCXI4QDk4FauyCUu0g9kMBwTYiU=;
 b=vi7X2OVMC0XFLpEGG5x59ZMtwBLoBoiKHNKdX4seDrGrSgY/6ZfGucFnTRItMfRAuEAv8QokY
 YdjML0XADNgBNJEGOm4MZ1lXYRqZChBTEBQYkmT4My/XxxpqkOXgkrT
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
index 50a235d6fb6df..0bb714eed13f4 100644
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

