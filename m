Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527B938BF7A;
	Sat, 26 Sep 2026 10:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=142.132.183.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790418040; cv=none; b=SivEtuKqoPA3juaRdHX95dR33uKlbiAHKT+lGEqc/5rWT+TzjRtbfLM6XLazc9e5slVcSBvrD7w90q0SoGEXVuUvH1/+wPfE1f3ohXVcVlN2+hcJBqDVHHVa8E3yYaNN3an0hdytRTY40gX8WeMdei0xaBVunrzL/3k+70SjcBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790418040; c=relaxed/simple;
	bh=iA1q1pIzfra+wLZHe0RRYckFNgRWQVBo0q0XvsN3PtY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DQV9D86fypf7eI12p3uLfVZqA+ljs303F6gB8RHcIKQ17+LcQJApjunV7EOEAvv/TUdjH+XLNA+4OiXr/IoI6tp/bPe1nsALVs0ZZxsRoItyCEio1s4aXOhOTP6a7zKEi/OdW/c7CvozV5vWnCBiT1J7G3zBblMiVV9UVIICVgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu; spf=pass smtp.mailfrom=erebion.eu; dkim=permerror (0-bit key) header.d=erebion.eu header.i=@erebion.eu header.b=SM68rivk; dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.b=JVYJTdI/; arc=none smtp.client-ip=142.132.183.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=erebion.eu header.i=@erebion.eu header.b="SM68rivk";
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.b="JVYJTdI/"
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1790418022; bh=8AGPwDSqEz2LX3saMt7CBR1
	dAiSZVMcMXlYT9ypB6D8=; b=SM68rivkillGJyq0X2Yp/kyOZnu5+5kXdhaA023btIy/0Z6BEH
	r9mT6O44rUMZwdK3j0ZYRbmSDx2pgd+z/pDQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1790418022; bh=8AGPwDSqEz2LX3saMt7CBR1
	dAiSZVMcMXlYT9ypB6D8=; b=JVYJTdI/DgmAEHdh9VZA3kuczLfmXaGfZR4QlBrdIZELQJeNXF
	DUuQlq7eNX6xUu6Qp8Va4QUvcsYNNTfT6Bs8M79bpFwoLiDUdRnnqRUjOx0pQ/IJMarEqd/0si8
	eEloQGM7ipFaZY4br8/xBTZXePLc4S5LTGMc2bu+2OJZtpimWFDqlq3pXHXQPo7IHzy3f5SUcdd
	84xo0EKbLlvKG/VFhQaHRfiuob/NIBF9zFtenkv0jZEjlmmYPlB/JJCGgJi/BvqdyZ/Oi+B63jB
	sUjgItrjzwuUQuiBKI7MN2I4z6VlBNJjxT7PPinsBZB0Zhp0uHuzwXlV3xZgXEaK+Vw==;
From: erebion <erebion@erebion.eu>
Date: Sat, 26 Sep 2026 12:20:19 +0200
Subject: [PATCH 2/8] arm64: dts: qcom: sm6350-lena: Add qcom,rmtfs-mem node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-pdx213-upstream-3-v1-2-1609c18b5c1d@erebion.eu>
References: <20260926-pdx213-upstream-3-v1-0-1609c18b5c1d@erebion.eu>
In-Reply-To: <20260926-pdx213-upstream-3-v1-0-1609c18b5c1d@erebion.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790418021; l=1334;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=iA1q1pIzfra+wLZHe0RRYckFNgRWQVBo0q0XvsN3PtY=;
 b=FTIL4v9aGi6msjqAoS9nNWnFpI2lhQqBUwecRN1wjugUom1OoDGGMH324KquuDRB3Z+fzTT21
 F0+x1SM/BK0B8IOowqOs4F48jny6eYHuuentXnNaVH+w8cnzwFDNPsp
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Adds the qcom,rmtfs-mem node required for the modem

Signed-off-by: erebion <erebion@erebion.eu>
---
 .../boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index c72ccb5544589..56a863eb8e167 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -4,6 +4,7 @@
  */
 /dts-v1/;
 
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
@@ -54,6 +55,22 @@ touch_en_vreg: touch-en-regulator {
 
 		vin-supply = <&pm6350_l6>;
 	};
+
+	reserved-memory {
+		/*
+		 * The rmtfs memory region in downstream is 'dynamically allocated'
+		 * but given the same address every time. Hard code it as this address is
+		 * where the modem firmware expects it to be.
+		 */
+		rmtfs@fe901000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0x0 0xfe901000 0x0 0x280000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
+		};
+	};
 };
 
 &apps_rsc {

-- 
2.53.0


