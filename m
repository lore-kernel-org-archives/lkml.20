Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869436;
	b=zGUO3yL/n02KxmdTsURsYnKYwDN1+FoqYOgtanz99QOMz6U2Th7DF+q0ZHUyRW1zGxoy
	 /4qVW4s7y13nB/+2kDAsicj/lS5X3AwXcafeGOaxcxCx+VzLZOPsPV+YNP0SHgzYifxLL
	 Osaj3fyiOkU5/mc+YDuDTUVV/YymMpGwCZJG5szLwrAQSrrg1+lTI2TOvm5zG6IVQLDYQ
	 ncmI23jigFUZ62SkKrCnDIW8mlFmaccVRfhjjU+I9nU0Hm1Ry6GraMWIOoRsyr4IPkTfs
	 YoLDjH6aLdx5uKj+7Sve+PtIh2uOt3B1QT3azSkhjk1h2aaGFL/pMQVxgLntbA0D7uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869436;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=tudgFORN5TyG6PTCZqP+6imVHwqL/7Btvlf2shsmRlo=;
	b=GVN1weYF1n7WzSgvfd/R6TA/+dWjkgz8v41G3vxV6rL/rC6RQ1Dyj6rB7gpVwib1cBs8
	 YN2L0/hFcwz+YML+2sF3OAxboNxtkK1IClb17BlnHDcBI+NGmvhQZ90y+v3oE8AOIfV1u
	 PpUj+FEeYqIdmy6IplXSGaNx0JKxSaQH2t0MLCmWE2QxAC5St/MO4FSZDYjRR/73m6fMQ
	 N5MTVTntw/01mmc/8XXO4bnY1kglE5xSACLh4YuUhN8TD9MMDsNH7iUcs18nfuU+0Rgca
	 yiFxeD3tk9y3TJvjI67dEeq1retVejXLEOs73HRvScADnVc43tEbS6SF361OOFXrmsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=l1OKVq9Z;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=NQTX9ptu;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01CE606A323;
	Mon, 16 Nov 2026 22:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A01CE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=l1OKVq9Z;
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=NQTX9ptu
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794869434; bh=tudgFORN5TyG6PTCZqP+6im
	VHwqL/7Btvlf2shsmRlo=; b=l1OKVq9ZgMiLaTnIHpIxTCA+1iCcBAb4WjywG+5RPr0tOy80jI
	IUZcIfse5aqEc+zuA79AtfxNaJVnpLhN+OAw==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1794869434; bh=tudgFORN5TyG6PTCZqP+6im
	VHwqL/7Btvlf2shsmRlo=; b=NQTX9ptudlcSuwUoA0UUPO+6nMoMHl0yl0T8cscc4Jrt83376V
	QpMLMsksDXzEu29ho/rERwUwHwKmUiAn/hgT9t7zegfpYr4vSQmWeOuQUIPD5tiv/9XZs6vE1yf
	dZavxHDBtemGhiYhnu6y6CfCJ9KVvCzLx53eD09tc0OK2GZxdoFbKGQPsU3Bd/7eV3+ACOxar66
	Ux2bNeS6PZstbjFiJrT5W7AlYJB+2KdB4DcfFeRNnhP+ODfDexr3dT34TjYjO/YPdhmRgkrhiTS
	HPezfFO+BaPRPmXOBVVjBWcqETznaWq00N1/YdXAgSRzH0JnZSkigVcVDfu2xlX9Nmw==;
From: erebion <erebion@erebion.eu>
Date: Mon, 16 Nov 2026 23:50:33 +0100
Subject: [PATCH v5 03/12] arm64: dts: qcom: sm6350-lena: Add qcom,rmtfs-mem
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
Message-Id: <20261116-pdx213-upstream-3-v5-3-7318a19806eb@erebion.eu>
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
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794869432; l=1232;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=6EhZPvz7qL2tkP58jiJGNmInEJYuo+/5G6TBp1uqCio=;
 b=kIkY47TJ5Q3e2bH49o+GdVGwACjGhfto1cjEfZqgI69ebN74hdgiI/f+pwBjSpIudxi12OozY
 +9dmxy3Oo9iDtO5199/kuWJTe07ZN0qmXobhlmE+kW3L+pfU5DiNLqr
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

