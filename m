Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=142.132.183.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793575941;
	b=EZpWa0g6nNtUrg6BZKQazU1XYrKrrk/KauDIrJz07UbhafUjK3/q8giELgrwuh2jSFDp
	 2Pnkavg/gx2U4lutgQzhEUF5WW0GBzMJCtrysgVbqXG6rVkzTjoCLFUDWkUGGyfBeHPe/
	 /sTCMa90FGPoaz8vQtqLriVJaBhdNwRgXO5At9SYyiJl/oeGUETB7SoTs3pelazwJJS41
	 e8TzWeiB3xlEiawdvaA2lji4BlW4GWclJecxpusYhbY8B1vEYd+9m2AMJxKuYfLfZMkgk
	 6KBK+HiVsrl49PpSkJfXDElmQzAhG6WjrDQDv1FacHBEiQYvG1W+83DB5s69VqjENFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575941;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=pLNL6UVi3gVPSInf8873bIasTzMDMT2bPa2FgvtzUyc=;
	b=WihTg1WTiGSz8VBgb0qn2eSw/68cVupKEobRMgknRg4CD6DSnQM5vZP6fMBPTgt7U0Dp
	 cuwCz5u4qlwWFXunW16IWwFFXRhwsrMGGZ1pJ8oIBKGoaKQubgjmsp/3AYwn/++A5E5eM
	 SPvra1jYnlhSAXN4uWq7eMtfD9xF2VCdQ8tCf28tthi4cO3hCga8Bz+k8Z2f8G9OzeOwL
	 fuh7yVr2zjlbf9o7VtocDP6jq3t7fA6wBjk87yvVNI9JTHnXLD9WUaGl2cy87uvUXaW16
	 +lsB5+eeI0+kPFvd/+z2Fxn7C4i1u8Yw409Bnu27En3fuOU3He11gVFcVOv709W++iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=erebion.eu;
	spf=pass smtp.mailfrom=erebion.eu;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=rinAXkiP;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=g8rOTzW4;
	arc=none smtp.remote-ip=142.132.183.134
Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBFB606A333;
	Sun,  1 Nov 2026 23:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFBFB606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass header.d=erebion.eu header.i=@erebion.eu header.a=ed25519-sha256 header.s=202508e header.b=rinAXkiP;
	dkim=pass (2048-bit key, unprotected) header.d=erebion.eu header.i=@erebion.eu header.a=rsa-sha256 header.s=202508r header.b=g8rOTzW4
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1793575931; bh=pLNL6UVi3gVPSInf8873bIa
	sTzMDMT2bPa2FgvtzUyc=; b=rinAXkiPvxxC+rWlHQ75Cqh82+XYoB55wDCBAvWWe5t3rq2T4C
	w17b1bkAAqmPtxu3ey3Thv07nJCUoHwokOCw==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1793575931; bh=pLNL6UVi3gVPSInf8873bIa
	sTzMDMT2bPa2FgvtzUyc=; b=g8rOTzW4yC/jPD9tg0nwpMZzInKNuZGpKdExOqio7GQntuqO4S
	PsykdxGHFQWh6DcBt5s0u8jq3DPFATbJfUCTJV4C1/c+1DEgH/5OnfvBitJp7TBIozzjbbspwNB
	+4ewv2+sSl8fJzRwps3TAgWcuAcxtY4C1jrrcWQyGa+FORRHpR/C9skUxBHEOd1Q0fUMcsU1fpi
	/U5WkBsQk/ymS4Jxb0YLleotTFkDnk9TWjcuqK/JNDgqzNsiggenQZu+JOB1IvoGuLiuol+094i
	e/MIPQMe6y7DAewnZu+QDMqWP24WyKXZ8d6YzCHyVp03Fq+uhmGpzm1t+4U34+U1yTg==;
From: erebion <erebion@erebion.eu>
Date: Mon, 02 Nov 2026 00:32:07 +0100
Subject: [PATCH v3 03/12] arm64: dts: qcom: sm6350-lena: Add qcom,rmtfs-mem
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
Message-Id: <20261102-pdx213-upstream-3-v3-3-cdc3be96d257@erebion.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793575929; l=1171;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=ZX4tBF6GETRfducu02RnlxWwnjhMVMVY9sJUqJ3rc50=;
 b=m2wigLiw5j3mS1sQe1sdmoJuNvnRlC7Svc1vp2xjrPHz0IPyqhKcLvEp288EsasAH5MR/T5Ev
 lZf2VRMLeZuCJhbhoVlcUNJuw7+rOqjK/UuDXgqmLyLBMdXoXZ5pox6
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Adds the qcom,rmtfs-mem node required for the modem

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: erebion <erebion@erebion.eu>
---
 arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index 9295b2e6f179f..1e89c9798edf8 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -4,6 +4,7 @@
  */
 /dts-v1/;
 
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
@@ -63,6 +64,17 @@ touch_en_vreg: regulator-touch-en {
 
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

