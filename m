Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533097;
	b=rjfYMlNWmHJPx2/jZvZzXWPRA4Fkj57ADEJGaTUMBww4YzoPuO2ptDoC1wwpEKHnImVR
	 ZnhNtsLRjlLOxXcYfqLlFpwZ2V+G2/C/s4aHnMVTLpllL/KWt6ltcaL6BvHiS0aw1EJ8G
	 kLCac3XqCa+eqQ47V6l6GzYrRpFX/Wt4sHDnbeZdkouCgL++zUqxLOVgFqB4Q25b4V8r7
	 +CfFOiCfaVfs5ZWSIMgjFfsXq3dXE8WMjh63obmFUa35OVtNiWkesednXYjN5oeBqWfVM
	 q7HxbF9I+McrhFkXOqhhipbpqHqfXhqMYo/ZcFvSgLYaYSrpdXnQl0xoQ2DHk+dIwrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533097;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=tudgFORN5TyG6PTCZqP+6imVHwqL/7Btvlf2shsmRlo=;
	b=tJQjFr5VX63+T4k6VU2vI5z8BKJAUIyWCRYOxz30Lmpb9Xm0pekO4oVGSTxde1FxhKYJ
	 OuBPzMgwjYzqX30koocW5RanZI4i82VEio0msRjCtGC3J7BYoWfXia6Jm4IKx8gIVc2Ir
	 tD53bpPHFqvC5gqPCcr9igoeI2Nevf4osuvhglALo4thY5MH7WsTNQHjcqI2zO9ObM92d
	 oeakgoMbjSYhCZadGdqpCADSnJxz8p2NBGTiaQnjJ9ehF53nCCgTEAHZXyuMmsCJkTSFc
	 EEKROj/Ugk04palU+RZWlFkviHa+Nrxt+qYX8VExJTvdwxY/v/jtWbQsrU4h6Gsis2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=0CHx4QDf;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=qEVlxNvA;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D28A606A323;
	Fri, 13 Nov 2026 01:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D28A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=0CHx4QDf;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=qEVlxNvA
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794533095; bh=tudgFORN5TyG6PTCZqP+6im
	VHwqL/7Btvlf2shsmRlo=; b=0CHx4QDfnFRmuZJmBXW9Y6KXtFuh9CGPo/2KoN5GrdMwj0RfwX
	oeD1OWHHUHegHWXITLv3Kh6GA2UmXivP45Dg==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794533095; bh=tudgFORN5TyG6PTCZqP+6im
	VHwqL/7Btvlf2shsmRlo=; b=qEVlxNvAjt0qwQFhhiq2Cuyxhxjwr9oe79KBSVGdhAViXEroq6
	wZfSHBLl7l1zxmeP9iv8KdPRvpoD6eMidDG3MNHHAcf4gVZFWj2sB0HBRsrwsjwC0nrxhHUVdPW
	Ntu6fNQ0wIosPP3Q014nKMMQBCxmJVHHm9ZtwSCaSB/BvpAuotVw+iNhKwQPaoFVIRUz6SqWJcL
	NG+bGupPDRSN2my+tnFdw3zCroPsmwesyAM1K+RY91jxg65D6Hzorv+xarjTYQhBqcCQNdx+AjY
	Sqp1vbb1z2iA4ShWRFTiMMSqnYCZLVysPzi8uaYFayASzv+EjZWNQQMhzyp258YRdiw==;
From: erebion <erebion@erebion.eu>
Date: Fri, 13 Nov 2026 02:24:47 +0100
Subject: [PATCH v4 03/12] arm64: dts: qcom: sm6350-lena: Add qcom,rmtfs-mem
 node
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
Message-Id: <20261113-pdx213-upstream-3-v4-3-4b01c50a821c@erebion.eu>
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
 erebion <erebion@erebion.eu>, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794533093; l=1232;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=6EhZPvz7qL2tkP58jiJGNmInEJYuo+/5G6TBp1uqCio=;
 b=4iafPFGARMEhy8AG/fFPhlHdIRT8VjAcR9J/vnSuZjFuLuSr7O6AKhaanHLGjAOiMfCnDq9hr
 oFMDB+SL8LJA0ZWJFumgnbg97HAv9kLi/vbuNHa/ynQmb8y4L0Peuy1
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Adds the qcom,rmtfs-mem node required for the modem

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: erebion <erebion@erebion.eu>
---
 arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index ca44219e1a67d..a393b7533ccbf 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -4,6 +4,7 @@
  */
 /dts-v1/;
 
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
@@ -54,6 +55,17 @@ touch_en_vreg: regulator-touch-en {
 
 		vin-supply = <&pm6350_l6>;
 	};
+
+	reserved-memory {
+		memory@fe901000 {
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

