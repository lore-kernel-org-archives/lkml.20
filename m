Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793575936;
	b=IxJmaSoZNC3JfSr03Cp2d2tvDiRzdv5so+WY6VBYrPZ8qGeFyXL5/FoXEH5WcCvFdPQZ
	 f8GJxofe5rQ8uTWfPUEotlz1EDtSXY60wXQ/GRBJpVUOfXpzVXbGbgAg0rnfVXJvAs8ZA
	 WQdujF24AXNKWZHzaRdU4ite71mF8y8FEu4JEOes5rFjT4r6SSaQzROuUC+D0ylHLidtR
	 hu+6n5ZK/ywU5LHEpWiPs1lqbPjg3d9giXyI8q5A+VdvIxw37Z7Y/VjN/1cVkbr06oija
	 00XkuNyjC+dKR5Nns7VvEVPiuBdWZLgcxrlKmlSdir2AwdMjYyYthcbSBH6nvgrh3cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575936;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=A3HrRK4FvbWtY7EL2njqxBfMd8XMbZtTC9D8yv8diuw=;
	b=QX0lWXySux3ZFS00elBkcycE8FSPrl3upVQuJk+PmjpQLPSq5H8r1T1uqP8jG65MpfeB
	 WlAh48+znNfmGfwLacD5V3cITCqYIkjRnZVWwej/G5XbMc5SdlGNLlhvN2Lg7koD3Okzh
	 z/fa+y4mA/8ul3JUpyD9FDNswaCeIe77CDpY848xlzCrrxilg4We6+G2k7tNKndOY50pZ
	 GnNAYqrO6lhvekzXnVvow26emxHQbsybtvlWn6Q5cOX5AbHoN1NnTw+obAW/scwqJoe5A
	 n1SehossQFKB3d1DvScCjfWyN2YdC/fKFzZbDlaZ7KSBfXTgWT+1WFLjg9Oaj77I1Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b="F/1X/NFu";
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=TO6qucVG;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E3F606A327;
	Sun,  1 Nov 2026 23:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32E3F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=F/1X/NFu;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=TO6qucVG
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1793575931; bh=A3HrRK4FvbWtY7EL2njqxBf
	Md8XMbZtTC9D8yv8diuw=; b=F/1X/NFuycUrE89JwGnDEUfCn71c2S3BJ6wzD8h9w8ExF0oukp
	s/EgLg63VZ5Qi2kXnOGDONZYyDXymmcuV8AA==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1793575931; bh=A3HrRK4FvbWtY7EL2njqxBf
	Md8XMbZtTC9D8yv8diuw=; b=TO6qucVG/CTpHAO2Nvo6m3GDO6cNdG5I+pILqvGfeoqOHon4sl
	MCESROwyS0Zd2+SA6kn9DggXbR9wKqb51EmyWwS4j+hOoLeoAG5CuKXMEAssLqkfFrMujbCnRds
	PvU3ZJbOkLQ4GULpf59kh1K71YgqaJkDhw38DME4WSkbUUc7aXKTOhoqw5T9yvjSEK21hhuzrgl
	gJJk+VdHfrm4RTyM6LH2iBNOBUVr/L99lUPOr4leMPs7kV+X4d09cOgV9riKSbAhFY6b74ARBRs
	OCWimeiegV0V3M3MerCJjqtpnzd7KprdT7hfTNyJXGtAbXuHzmhW7xQlOQlEuPZaPRg==;
From: erebion <erebion@erebion.eu>
Date: Mon, 02 Nov 2026 00:32:06 +0100
Subject: [PATCH v3 02/12] arm64: dts: qcom: sm6350-lena: rename
 touch-en-regulator
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
Message-Id: <20261102-pdx213-upstream-3-v3-2-cdc3be96d257@erebion.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793575929; l=1159;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=mWMUpJaqurQNInIdHEEH2VFWKS03NCWRKZqnMFtZxOI=;
 b=eOTlD5j8uKA+goKG7TzsmPU2Hj2451Yciedozlbdb4QiKxaxCxrFq1EZY1ca19dk6LWicJYYU
 KYngx+CWr0MByLKGZ6iKKZpDkxnZOMs+NKzV717uRIvah2bEMDfajly
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

rename touch-en-regulator -> regulator-touch-en, to
keep any future fixed-regulator sorted together

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: erebion <erebion@erebion.eu>
---
 arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index 6942a117d41cf..9295b2e6f179f 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -46,7 +46,16 @@ key-volume-down {
 		};
 	};
 
-	touch_en_vreg: touch-en-regulator {
+	lcdb_dummy: regulator-lcdb-dummy {
+		compatible = "regulator-fixed";
+		regulator-name = "lcdb_dummy";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	touch_en_vreg: regulator-touch-en {
 		compatible = "regulator-fixed";
 		regulator-name = "touch_en_vreg";
 		gpio = <&tlmm 10 GPIO_ACTIVE_HIGH>;

-- 
2.53.0

