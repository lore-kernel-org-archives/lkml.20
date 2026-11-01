Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793575953;
	b=pI99lo0heCmyTpdZMDXAnMcvFDb38MiNpZg7x3RBgQuSfxftX7GTxjoJ6ZRLV5UAMOYa
	 vmSI+eda0n8X2EvunXraGlvhL+u3naj9wkU/VHby5obT142CPOTharmpNT0W4iUPHMojs
	 B5DHafzBnSsFovT6LTkB5V7FIJipdROtxWTQ5EkHZNcoBBS4a4w2dl9SRw2Uvmot9xED/
	 FR5eRdOyCrIyNv0FKVbM5uHw1uSOSiTMGLah8P/mM+xFwXD1z5eSGw0gGeA95O1+kGGVi
	 NWxiQn5HvIkeKEmuFY7JN+ecsqwuZ+ndkZQdMzxXq1gg7/APo81pkTqFEANGht0z5/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575953;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=nnBDFfVscNSIMWRGuukkAP3sB4Yng2JMTdu5t/euvJ8=;
	b=x5HJG7Jtk+KqjEqiTQGHvT7fBOlFE/jKTnnSvFi4haM2TELs2RyKF5p58qatnr08eAIi
	 XV8IWNF1hC6SNQA/zSr6d+Dl4sVJxp901x6GDGnY6uFKavpDHa92dlzyu7F9bqCo8V/qO
	 GFARk1b9sKQw/MYN/O33HDolKzh2NvgpTFK4rFHpiEWW5kfR+lL7waXVSfLlTGzWB8kCz
	 REiDIbKrcPyJNm+8+lj1h1Aew31IGG7UFdGiMg4biqKCMzHoWoSDoYsFDWE4PXOzXYB5d
	 KPmTu/f3UjpYfH+I7vyta5ElbcDL9WjjigxCu9qy0sA0vvcWgA+qeYW4BAasZGzQ5RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=ZkWlqeoe;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=DZdRLL+f;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2064A60A261E;
	Sun,  1 Nov 2026 23:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2064A60A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=ZkWlqeoe;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=DZdRLL+f
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1793575935; bh=nnBDFfVscNSIMWRGuukkAP3
	sB4Yng2JMTdu5t/euvJ8=; b=ZkWlqeoeYOUN6cTHBwsaUVwqumbXfRRWpgyFfifj7UMKfP2J/2
	nx2VP9FFUyhQFIwQKP/eeIVYjWg9dhVJIjBA==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1793575935; bh=nnBDFfVscNSIMWRGuukkAP3
	sB4Yng2JMTdu5t/euvJ8=; b=DZdRLL+fHij1RD8G4B0/919PHvplINAtKnleTp4pjD1/FOv446
	epPuJgQ+xPShEHvMjojIRpFuV97JC66fJao3hQ8nccZnQnx/Je+fTYXR71mShgbPjgwyTRTQIso
	debIo7fTvby17nVAUEjZElEE5tmjhX7wSMtm3cDKwgSxB5+7FO/perSFD5dIQdjZTqO0XbNEKAk
	91CbO02KIZYvrvA96G9hVWg1B2r0PM32Uk/YKT/aWI7jvBXqdwJxaf8bx5ZgO225bYF4Igin6jL
	ssy4VSKIaMr+SSf7gmFiS14xFkivtcYf24J0A1Qeh3nizfy7KZ2YPfocI70OjEuJWsA==;
From: erebion <erebion@erebion.eu>
Date: Mon, 02 Nov 2026 00:32:13 +0100
Subject: [PATCH v3 09/12] arm64: dts: qcom: sm6350-lena: Add PMK8350
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
Message-Id: <20261102-pdx213-upstream-3-v3-9-cdc3be96d257@erebion.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793575929; l=1046;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=jKbReSlDndZO287vvL8FQ7RDc20bEUG6zhPvlLfoMOg=;
 b=B76EndlOSFxzN9N3fVPNeVVReXwdX00QqnqK9DRZ9ETycgU19YWLSwgOCUJxcIhHyJnEzRN3E
 1CxZlO3Ffv/CuZKM00lp4jEBVoy7C9q2a/cAA6xSYrer/J8g8Zj37Ap
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Configure the thermals for the xo-thermal thermistor connected to
PMK8350.

The trip points can really only be considered as placeholders, more
configuration with cooling etc. can be added later.

Signed-off-by: erebion <erebion@erebion.eu>
---
 .../arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index 246a290e44f77..6d5aa2fce4c0f 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -89,6 +89,20 @@ memory@fe901000 {
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
 		};
 	};
+
+	thermal-zones {
+		xo-thermal {
+			thermal-sensors = <&pmk8350_adc_tm 0>;
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

