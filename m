Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0204EDCC3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994771; cv=none; b=SP4/DsrJvlnaDNosD1x7uz+UYVqz0HHlXXgHt4Z/6yi0WMMdnFmeKGQeUhcIxWmWw2BMoTGyzBK3+vTzOwdHqAu3sslA+N0sZqJeaqPDtGUn3OZ+mpG9aBn7R4NGolt6Q3KD9DOlcVWmW6dqwtMKMc2C/IMw2LlvTeYC3L6Jl+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994771; c=relaxed/simple;
	bh=fT31BRXck6wLmrm1EKJZG7Thy04mm4/J5d4uR4ASm/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zk8iC/JYM3vfhzHI59OSGYqOhuOzhG/FehP3zf0qp77Y/dRt+xqJg/aAbzAQH1S1gXoCtK7gA+PeADzd52isgvXk9wJHVKyQLKZOpS/TofDFxmAqSKIafQZ3WQB0ABiIcaNeLvhtTYc4w4WYvNBeIP/OaAD2yAtr5RKVvEuDWJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pLWb0ROc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YdrTjwxs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pLWb0ROc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YdrTjwxs"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbI0b467734
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BL4vTvhY22+WkGmvg7vp/kCyClFOGVcldDZlDDXoP/k=; b=pLWb0ROcOc9PtZgX
	7HgmNxOUcneULNYEVNi2ruiFZUCuFGvnp2zDcjll6fdbOygleoG3oO7ZWAqrGyAc
	8G9ok3MgrzW4YkzVXJZQJQw/NOnmnmGTV/F10ZThZuRtkc/pSL5VV0SMWlD6uwLb
	GlQZ/7OQHHy4VM6ZOmkMt1uOLOCqBP6klqeoqjAs2dlmUNaWEmGW+4UzPWsCD1rE
	Kq0ubDgtSWr9l0IqJLjC/qSAS1+zM8zxOizBiS/22t6agSJjXpA5QPGY7KA/QHEW
	sjIF9CDbcli6JuBJ69N1z64gcq3wA3FCbXJRtJNYd88Bg0nu6CjGMPcXTAVaczBD
	90ilSQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9yphkf3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:19:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e834ff4d0so1157638085a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791994768; x=1792599568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BL4vTvhY22+WkGmvg7vp/kCyClFOGVcldDZlDDXoP/k=;
        b=YdrTjwxsHGo2iYelOYC3k9HuB4K6uWCYFuMXMObmKgaZ/huq0Pvl2qOlPdykQXxB7n
         6+Q8KcGtF8b4eA9Hn0dbip3cQLeXnSukB0yZi/xHz/rQbCY59UvbavOPzx/W03snBTr1
         CKxqtWKVozFYWHv5v2ZZNo0Pf+HIklpB+Ifo04olQQKEqacGG+VRZOXyibrfQF9DFLiy
         hJX2KHSB4HhhsvepQ0i017+EFyZ4qqgh3xMUh0gc7DFJ59aCuYqJQQADSNCb+tayKj5c
         PfRid2SuiCEnjEAhMyUwZ90mvPchEmwfrtiha9Ym83LRcO1xWzr+qyRLbZ0Nb6pIphIp
         btgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791994768; x=1792599568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BL4vTvhY22+WkGmvg7vp/kCyClFOGVcldDZlDDXoP/k=;
        b=EkyAiWGvh+n5MmBMZGPx8LHADBIImztw53rG9dlOVEpnYKg7XxAQWx3919Gp6wwSMu
         pm9w98FYKleQXh9shA4X81tvcZjQfIBS8wkzzB3u7pS9pFrL3xYUdyPVBlldiSwAW+kr
         T3OeRQ6IlxVBTjd2ia9FjWa4W+0iBbKy/vbFa4pwtVgpR25uz1xjLSjrN8sAmaU7BIdb
         60GczdmnTs2Z3IuXKFwLOhTAfWuKMdPeaS6rrOUUsIFG1b/yGdaEihAM2pPhyyKaW+Tn
         T4iitCmhn3s7wljKKoIdnzfgY/k4O4SYY++RQv/1PKaxuNGHWq1c0Bihm7VAhoSN/Mm6
         ZA+A==
X-Forwarded-Encrypted: i=1; AKwUvBznKxB9goJqbiwEtfTKG63nir3QY0GGRBQJMbSa/2loIuYrR9nG94t5BymXyqXk3FjhByqVUhcIZjm2GLQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyRHUewjYNFo+Rk14GKevGtWGXkafG8jHGXfhfer98NfMYmN3v
	HWvme/GMp7H1oImej8ThqLYuw2gwUsBqlu2GwYdxcT0XwFzBcHGn77q/5zVx/lVNVicaTd/DhVU
	svq+AMvGYkP4N0vQh+8IVQGbW/SiA9TfzeG2SFPWdTfEUZaPrXfoPNjO2A+WxsGYIe5U=
X-Gm-Gg: AYBFou1980ZGrBpUCE4YRJUDOZPjr+D5dbsWwhnmEoNjS7hMZMMX0247e735wTzxxjz
	P/fhdJAcKYJRbjm9FESzHg1p4ee3CtXqVRZ3C3Y1MPp395+kd5T56MKMfAGgn4KYiboSecCRi9q
	t8iCCzXXGdI07DR8zeKr2tTd0ukj7sWn2sk+mQa93tQVDQJGb3kyQz0eraPlIRtKm+mB6PjK5Cj
	Wwa1YcNFET4LgONaBiyZMofLk6MS7GZL8z/Lhcut7rk5ISGd56dkxl+4Z7nKBGZSu596eT7kAld
	8p7dmIc7EDItqOdPKNabqtZJQgf94tdp/Wu5xS02Cp6JyvP1F0Tg1atvARJKmGInRxk1JtawZdV
	yvnkMw4Xego/M3OT2/J68V1CJrIDnXeeCu26L2PgkUr/mPOYYZSEj1AwIy9vVtwH/E8sKci3MFb
	QfgM2wc6LJtUdC
X-Received: by 2002:a05:620a:17a0:b0:93e:c12c:fbba with SMTP id af79cd13be357-93ec12d08bfmr2614210985a.71.1791994767687;
        Wed, 14 Oct 2026 09:19:27 -0700 (PDT)
X-Received: by 2002:a05:620a:17a0:b0:93e:c12c:fbba with SMTP id af79cd13be357-93ec12d08bfmr2614198985a.71.1791994766522;
        Wed, 14 Oct 2026 09:19:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d7d0f6sm740187e87.38.2026.10.14.09.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:19:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 19:19:16 +0300
Subject: [PATCH v2 1/5] dt-bindings: display: panel: add Truly NT36850 WQHD
 panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-sdm845-hdk-v2-1-6d0b4b42f267@oss.qualcomm.com>
References: <20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com>
In-Reply-To: <20261014-sdm845-hdk-v2-0-6d0b4b42f267@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqz6uGAFgE0CkXa4ltb/f9AHLvc+RyB+ghur2s4
 EONUgy3x0+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCas+rhgAKCRCLPIo+Aiko
 1XnOCACRQNTYxqCdZS4yKkEgV2Tryf5Yu4zl6pjDChuPjeenHaqwL+KrD1wNA+bbqoPPZQN0lpH
 QUBsJU0Yz/uTfuZUuDE0UBoiRJt7JUbcyedFA66VbM2yGnK5lvoxdWW+Hc01veBAna/Y2bjQoDM
 Lg5N5hp1iczJhhcxtUgjwM9kRq8cAE8IdKqoiQr6sRZQ5zVSX2cCmagiqV854kfbTRrc3M9gpWz
 5yZ64SoxTmW1MBu/K30bvLrS8tike1mU1yENkd4J7GDzTEgqqbKRSalJqP75Bh4DrJcRFHYap4S
 dBIfTBlEPIwM0Odb9kRTZq80HPX8nw3AynzOiu+y1RoN89bl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: JIb8yR49z-Idv6IjYY7BEDyEZkNGmn0C
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfX+HHfxLre0oSA
 Yd1wZoi0MaLCFa1EF+cJ8WjHUhz8+aMjSTsqEnrs22k1kswN4bBqNtIVIGEBHtW1jmwsX7iBuhO
 oI6t39xyN3RFBXc+v6DscEw06lWgtaw=
X-Proofpoint-ORIG-GUID: JIb8yR49z-Idv6IjYY7BEDyEZkNGmn0C
X-Authority-Analysis: v=2.4 cv=Uv72pOwB c=1 sm=1 tr=0 ts=6acfab90 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=od__NDLvqBWtWXuahMwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfX6CHrttfpLVe/
 FXzq+jYd3HKVQ1WsQRdBNIVE/5h2EIKqqYD5tER5xYC33zO+Q3yis6QGhuuQlipstlOWdc4qvkV
 p3lYBWbjflV0HV/mzhLtBGSUk7+wzA6TKPn4iyE55SDTJ/zsYxCqN7eupKz1pCEZeR98INvovMf
 +rtEoae6xLzdMJu//NI6hN+cI2cqDh4TehiavJH0ol7VZgs9+GSJx4LLByoOgBvPooRBuGp+mXk
 xAZC2T6ws1b07K9AtKbfJ1wZM0ZHOeTIqDdi+yDzdUyiL5qBlRhutezhcGsKtyjaiYGRb/tbC3I
 ZhEGUcXrxTpRLdJLlp/yRzkYaLUvWN+u35RMmEwvBgnyHJWnx18oIrwkx3HW6s+4kHcK1KgiWHh
 KOGoreN/uRuP0nknAoakDAKFIcwHuPWxfJzkZDx+YVdBVZh3E/IlbdSNpHWPNgZaszEHc1uoFrk
 +0bI73RvLTAfyCPQeVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140064

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

