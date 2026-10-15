Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6D248F832
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053579; cv=none; b=dYm/qR/sE7ZVHRfo6/IctXnEnPx1bI0U/zodvJe9qIM4Oo8H8DhdF+jqV1JMUGrgGFCoT6mBX9pikKpRMi79PVKUCJdM4dtQ9R03i5D9CuGG/1HYoNv4UZg7R8gpBlNM4jlk+ax2p8G21zuswJY1pqrbdPtG8KcAPCYzlC82Pe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053579; c=relaxed/simple;
	bh=fT31BRXck6wLmrm1EKJZG7Thy04mm4/J5d4uR4ASm/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PwQQhg3eZgHYPxh3mZN6nmbGNznbDMK984bZz+jy8ZRaFkbkUY+jYPCfG7KGxrUqXeZjtCp+qHrOyochdwwSWwPHDX7Udbl+tKnLC4Ae6IkQLqDGDwCrve1r0db9vUcsu8QlHqG6CNliwo6tXHDdYddc9IM3jB8NhfPoI3qZam0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PNXCkV87; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UgGkIZjZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PNXCkV87";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UgGkIZjZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F7GV9i1682879
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BL4vTvhY22+WkGmvg7vp/kCyClFOGVcldDZlDDXoP/k=; b=PNXCkV87b8V9vDl/
	WrcQkt2SMWTpKA4duTGUDYX/HcebcOmAmoe5SEA7648Bzb340yuIqOvVDoSHzozh
	y6Uc7UCWzdbEFR77Jf988//jQBU2Ogtiw6Ac1VFY1M4FNn/8iOsSTw3G+kuTKR5T
	IRLtmIyem6WhitMfR3TUvhKhAwTowX6LRYkB5mLsc8Bl1RBmmq83lUU9p8S537T4
	0414gf808jSMUQg/sWDC5I2fDuruxONmjydCaa8BxhoSz7ec/vP3+OGrTq9U5Z71
	sxFlrkXSzACZ5TgBc4hi8HCd7OpvQFLNda5Y2jR8iskUM07TtI3os3N7ApbUFk5r
	gsPFdw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacb03jrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:39:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a082c014aso436368685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792053576; x=1792658376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BL4vTvhY22+WkGmvg7vp/kCyClFOGVcldDZlDDXoP/k=;
        b=UgGkIZjZepLAmvqPb/obxCBwfBbpD1PrrPR3xzX8k6NLAxaHmYNaG/JkE67Bew0EzJ
         +gzahPxat+QGmHuPtM37ey4/LwymN3voEfedhEXf1s6gSRA7huX+V0HtC+DhpgXRCAUv
         FhV0EIu9xuz8bYhERq9qML2e/X8xENZ/1weLM24zm0ORHHGZ18mtc5RvSlQQNKBGrr/O
         wg8sPDmbFJArrItM1zDYD4Zqj+d+5WBZYRjNavHRQP7aLSH5/q4EkGmlUi8OODlepog6
         onQSp8kFkPGkyCuNKcoLcug1KP8Yfsn0J7rxZ4mFsD4nntH8m+tD+B5JeVqEofsc72y1
         oKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792053576; x=1792658376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BL4vTvhY22+WkGmvg7vp/kCyClFOGVcldDZlDDXoP/k=;
        b=q30GMF59nkSFeroOZ65oFjt2AV03K6OaSPfFBa5eJ55P/SFL7YCL/agqfL3iojBUhk
         X6OMIEiZaOkfafPFYfwuWUqAV3S9nKnvG4VxayjgiWHmYXusTy61M5yGilDTBmjCPjys
         hn5+Y5xQrGsazqURpLhdrMZieYxTq+rd1E6Z7qbVcTOcHuMXyZ0CxHIiIvgEXuqo4+if
         ckc3ypz/aixmB4xOeigsTfR3er9GbLDocPYmosWXVpxMlITq+6w/OCti4ZCNAgdExFzT
         fB4vACHc2MfWb5tAePE6pL2k4qpNWuQibAibSpn9I8UEaJSpin+t66AEHRmo7xXqNAqL
         6LSg==
X-Forwarded-Encrypted: i=1; AKwUvBwqnITpWJDJFZ01Mxh0/UoBpwgFHeAdr0KH6OzeOoMcNP5l9rI+e5Lgpaga9Gtysm1UbnTTmdP2JolMGTw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9/Yl74rQBnsIw9ZGsmMDBAon53uz5HFjq0QKgsUDzARv7/oPZ
	YZrzwT2E5n4CujaQntkBWMS2m/vjbYWcGYYwHLaNyhxS+NE3ztemlIf4OP8KDvHNgpeIs7cO3+l
	ixgnHEP1Cx1/qnOxwDxFuTyH2bnyG5f6+xUg0aYcbP3rGV0SrdO5E7xSU3x99//pjDjg=
X-Gm-Gg: AYBFou1fU93PNMHorSmdsaShj7dM5cuOWiIe1zTcYpcO5hU/gvwzpHJKxyEK0zKrY/6
	sr9vIsKdxidNcBawABDcgpJ/JRM9PvFQftO1PT/nyDztqIuYrnNSNVbICKbd0J0VIgeUZDqSKYS
	pqkSzj3a/5jZofDogGiG25Ikb8ej7E8pI3VOzJQCY/enURaLUDZrRprkdNbzaTbaybILg69mVQS
	zUNirmAgIZ5twRummkiqMbljSlQFss0LJIhVa4wWrBacbLWSu9N8GNtuL6FIkKtdscg0PLl6fX+
	CSpkQRciw04+MlaiiYCePsa67TnU2WP4N7T26KDyBfGpeLNV/syQ+gKJAkuwxUGXKF93JEHDnxf
	gMAJeSdxaORZiLY+S0k8J71hdtjEgO06Bd+qpFdZqRNESeeO1TJakEW2lGYMZPPD0eS7GcH5XgU
	OYl9haESXlMoUf
X-Received: by 2002:a05:620a:6845:b0:93e:69da:a670 with SMTP id af79cd13be357-93eb9619adbmr2871609685a.20.1792053575497;
        Thu, 15 Oct 2026 01:39:35 -0700 (PDT)
X-Received: by 2002:a05:620a:6845:b0:93e:69da:a670 with SMTP id af79cd13be357-93eb9619adbmr2871607485a.20.1792053574988;
        Thu, 15 Oct 2026 01:39:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d702a5sm1175500e87.15.2026.10.15.01.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:39:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:39:08 +0300
Subject: [PATCH v4 1/5] dt-bindings: display: panel: add Truly NT36850 WQHD
 panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sdm845-hdk-v4-1-b532b9f4029c@oss.qualcomm.com>
References: <20261015-sdm845-hdk-v4-0-b532b9f4029c@oss.qualcomm.com>
In-Reply-To: <20261015-sdm845-hdk-v4-0-b532b9f4029c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abelvesa@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3208;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fT31BRXck6wLmrm1EKJZG7Thy04mm4/J5d4uR4ASm/0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0JE9EO7FC4gbOCYABFKGkdF6EAPQMLKZk2U6A
 rKNKqcA2QOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatCRPQAKCRCLPIo+Aiko
 1bSrB/96k4zdq5RJ2xrN2ces8Sb1LrtiMozuwikBzqcee5xBxtdq0hSh3sIr2oeuDKlCDdsCzOh
 NJo1rMTjyHIwkvm/hqi6Umc0p8r6aYjP1uWUWar9vWuBO9VCtGSv8e/jhtmcQwiQpgxo8nkAJDc
 KgmQKgZPxJa+ClbeXFHSRAih1cvezCmfAg2oUuYMCuNss1MEw+p5wsbhSq0nt4nhiOqbZHXilUt
 7bNdFBVixN5OFpNh52EAYRtXqVLuFqxqtTeO9f0Y7at7cA1QAe1hb/ootFJe7FJuQuJSsVXfpxq
 KRMjhnlauAl1AM9AzmHPHSImCIR5COmpwkPP4kWz62dLaxXd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=VKpIDNPX c=1 sm=1 tr=0 ts=6ad09148 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=od__NDLvqBWtWXuahMwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNCBTYWx0ZWRfX8GJ5ffh5XV2Y
 cift0xSEV5K9b9D23b/1l1GhARwmXhpztg7ns4Z4U9464F1HFGpXOjOxh2oqZp92gn06baoOJ1c
 YLTJX3PWhnMIV/UjdWCaNFsTGvuluRg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNCBTYWx0ZWRfXwizTZRRT2qHu
 oGvMW7oYkdsos2IWPRBhHab1QmLkY7vSWJHX6Lveh4xsuXQ8Jtp/pqyTTx0Zpba7V2hJOo876S9
 bInpZnleIPT0ljorQlctU+/WyDyJczvLnmQX7W38unLEz8Lanb+7ywC+ku9B/up9K074MSjtvOl
 ZzrIspfaIzFG41bf3iU2e+9m6BrijmX1DVMjdiJZz+ePcvj2CV3E/p571bi93gk6X021J19XtT2
 6wprI/0AX4729ar3WYp37/3AuJCFlfVvD6Svd3tXSJZjECCbSPR3UEV5DWywjIpzsl2sPjZ5SFU
 FKiC2e6ZcALEkhzQghQ5GVxJl/3W78ULtZijhGIF3hVr4U0+4rDkLk+q9+t952OY9tGhL/HPXlV
 imZV6797HZ1pQ3D5qpHMvwxQmk7ABZhWoI1owInxmuDHO3pwv70VGr72cwmcoOHd1qs57f9YWNG
 1xCPAEuyMpe++I+ZumA==
X-Proofpoint-ORIG-GUID: GcWgSF_CcN34U1Qcgo4ymrMU3fcDCoBJ
X-Proofpoint-GUID: GcWgSF_CcN34U1Qcgo4ymrMU3fcDCoBJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150034

Describe the Truly 5.7" WQHD dual-DSI command mode panel based on the
Novatek NT36850, used on the display cards for the Qualcomm SDM845 and
SM8150 HDKs.

The model name of the panel is not known. Neither the vendor kernel nor
the HDK documentation mention it, and the panel block cannot be taken
apart completely to check the label. So the compatible is built from
the vendor, resolution, refresh rate and the controller name.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../display/panel/truly,wqhd60-nt36850.yaml        | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/truly,wqhd60-nt36850.yaml b/Documentation/devicetree/bindings/display/panel/truly,wqhd60-nt36850.yaml
new file mode 100644
index 000000000000..1cc63a6adc7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/truly,wqhd60-nt36850.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/truly,wqhd60-nt36850.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Truly WQHD panel based on the Novatek NT36850
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+
+description:
+  Truly 5.7" 1440x2560 60 Hz LCD panel driven by the Novatek NT36850
+  controller. It is a command mode panel using two DSI links and it is found
+  on the display cards for Qualcomm hardware development kits.
+
+allOf:
+  - $ref: panel-common-dual.yaml#
+
+properties:
+  compatible:
+    const: truly,wqhd60-nt36850
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  vddio-supply:
+    description: I/O voltage supply
+
+  avdd-supply:
+    description: positive bias supply
+
+  avee-supply:
+    description: negative bias supply
+
+  ports:
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vddio-supply
+  - avdd-supply
+  - avee-supply
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "truly,wqhd60-nt36850";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+            vddio-supply = <&vreg_l14a_1p8>;
+            avdd-supply = <&lcdb_ldo>;
+            avee-supply = <&lcdb_ncp>;
+
+            backlight = <&wled>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    panel_in_0: endpoint {
+                        remote-endpoint = <&dsi0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    panel_in_1: endpoint {
+                        remote-endpoint = <&dsi1_out>;
+                    };
+                };
+            };
+        };
+    };
+
+...

-- 
2.47.3

