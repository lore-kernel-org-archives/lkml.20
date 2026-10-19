Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400D34AA3FC
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401499; cv=none; b=S2zKLgY4vRhcD0M6IRxt4/bid2acfww0XKCD5TNuZ2s25CsrLaIjOJf3wNobNc9D3vG0vbGz+WTV6suoz/8Nl33jryjFjlRyY6k7Utm6ExUBTmxg1LkgUqa4BdDFagf/V3123adR4IDHa+jUVtAzXNRWXQeSwqiI9Zv9Ycq1vFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401499; c=relaxed/simple;
	bh=FUR3zv3ZZDVPFSKArK7sPMtEQuW7+6U9gHUlSMhh/U0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t3phnFmo8PtatV1Cq7dZrFYDgpLXmwpp9XIm+nhKXKkF5g4Iwc0p8Y3mRuQx2nos/NPYm21zetsietvEqwahPvpMFmxZT2j5zENsIoTLb+J7o8n0TBcvbfRcALu6e80OrqrrlJMZ7PbTakeCWYzCAS3ke8UdIm8E2FAYprS/Yhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=khHrW0tS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ub0uFDKb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="khHrW0tS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ub0uFDKb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OsYv723129
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AgUYNODUiYWHIRoHV8RdT5emAtiRnqkIOPJGLCENO0E=; b=khHrW0tSwhUduI+x
	e/J8OB76mrxEgyhZBdOQpu+RAdcFMcmcg75fIfOL4YvVx1j3bxyoFMmO2RjmtfB9
	iSD0AVSUez2w5IN5AaHWuC59SMnJGPtaFKuxEDq6/TbwbTXsX0Sn954enSDm35lM
	tbPCCTD5ZlpDrg1JSAotnaYvo7GD3MGmcu/KmpWqQk8QIcbCrZQ5sE3olrgVPxur
	AEOtUi2HbTrvBsl8GxCcMCPu/e3sIaTukddA5uIxwvqk+7IYV/uOkKuPsL83Rwj+
	3FqkDofr2sPOfouwP1T7hoqWCz9n2orx/hCWZyu5sxXqznTVABUg8FmAOGJ35//K
	SfC+cw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65gapc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:18:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f26dd2165so669983585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792401495; x=1793006295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AgUYNODUiYWHIRoHV8RdT5emAtiRnqkIOPJGLCENO0E=;
        b=Ub0uFDKbyNBjKwqipLYI5viWuNTul5RUWfduzmD3lGGHzPE5KaogqlkGoR1yNWh4Bu
         fi2gq3fCfGj6mm5W9QJ/GVVWeMxGIAFbflg7yTAnCsqpaWqMmFaOY6uV3k5LMe2y4ssq
         SWk0dUvqRu79BVSovWjx8lVUHt95/VPS3Z/Po90m04HTYKMCXdPaIxgvH3n1drps1vjr
         vZIpDFMsoa5y/NxQbUfE/wWWtjzF6K9LzY5P3Zg0wWR++vB4XgzUxn8IHH0bIIrgwAo6
         /XhUdqB0qYaYEwukJHYmH8XfO6m6FLbL1J7JDjNXzFcCpm02Tu6XsI37ZAZgYe8Bs8ar
         sybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401495; x=1793006295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AgUYNODUiYWHIRoHV8RdT5emAtiRnqkIOPJGLCENO0E=;
        b=UT8i585u2PIkjiME7y9UGplUhzhUAO9QwGCdnTRJkM1Uf7MZV3gI5evge1rbIjyFaT
         jvdqS+BdP3RdL2asUZAFbTvFFSP2wVROpeY6zbHbTyO6HDRCMPrZKEgIjcmalNDS8wnY
         6VdboeNWW8lDm9jYSNYs24Bald+AycF78N5zExSD4A55Zz67wg5/7FEXfmNUoqqnMT+a
         kb2KYGen6uohh34GeXMUqL1+Cwvfdg6mPXPRaXlL/dMqe5JQHCQOZeU+6bvAx9OIR/43
         Ya15N3fv7mmlZnK9iSPq9JUTr0JKly/sW0Dh/m/CBKpDmJcZQjnrCaF6O9bMNtN+++UF
         sqtQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7Zt6v3pSoQHw00JytM5s7dwG+5//p8NLDC0h0XLOs+vw+1AsnYK9Z1lSnNQaRhIwUZ8W/zzlFK7O6eJg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7CcBCtEdyh9rCVXasEkusL99Nj1JETy3iL4+xxN6oCdEmHpKQ
	6lyYY2CwaZyombhXpjfwhBErxjsNaI6aZeRkd4Nze9M29YY1MH6fLfb4XmFIyvwicMoXwN/02EQ
	k7VxagOY3soZGpf8FKpcKk+Sepo3TnC2ckM0TyM2ARQOyKsg2GSZqF5ReI9nmftO3Dwk=
X-Gm-Gg: AYBFou0Ko1kiVNrgGe2CVpDyfFRH+rJIUe+Gny+3icSKRriGPEVRKB/AJq+fhkcTDQ+
	L55/v14RGQPuZiPU6iqTEDvqQ9Q3ufGqmGyu61TIY5eJ7ORPgIr6uj0XjScJoiqrRU3bTFPpNwE
	HsNUbj66t0ZLYGShzDepIj97bwgM9fzjH7dYyPv22zODp05cBXQvgUKLcyAKCgcOaKoNSl/+p/+
	I00MV1r/1PiOQD4b1OjYfSlq3L4TaIDzxOoBF07o8dZCrpYZ9hwLmX8TaP+EYjftt3AZkkkWu1W
	mutn4hi0Vi/SBE2QAy79QByxMnaEvdSWHaydm9Y3ufRUNHvYh0ACnOThZwIC/PcEgKgoBqUr2zF
	NUGSGL/u0p7vC5FHkuJDgmeIkM3c9RjDs6zd7hIAsScaNnAnIuegdSAFLcigLLgoUApby58s3D/
	qPXh5dSSQI1go5
X-Received: by 2002:a05:620a:4547:b0:93f:1b70:52a with SMTP id af79cd13be357-93f29d53d1cmr1275118585a.46.1792401495363;
        Mon, 19 Oct 2026 02:18:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4547:b0:93f:1b70:52a with SMTP id af79cd13be357-93f29d53d1cmr1275114185a.46.1792401494838;
        Mon, 19 Oct 2026 02:18:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab2e4e05c2sm15893441fa.25.2026.10.19.02.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:18:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:18:03 +0300
Subject: [PATCH v5 1/5] dt-bindings: display: panel: add Truly NT36850 WQHD
 panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-sdm845-hdk-v5-1-4aa7e22cd0ed@oss.qualcomm.com>
References: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
In-Reply-To: <20261019-sdm845-hdk-v5-0-4aa7e22cd0ed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3258;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FUR3zv3ZZDVPFSKArK7sPMtEQuW7+6U9gHUlSMhh/U0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1eBPDDiwCNLY+8Sta1NZOSsWVbU9ix5MG3v7h
 niSHLtKtH2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatXgTwAKCRCLPIo+Aiko
 1YtIB/9A6QWWUiEeAwS5BszeA6o206fN2mxnUbkWpxM42EsZXmNaMq19doW6gD2ylyErAX5rwmo
 FkFtAQFQai6eWSn/s92V7+3OYpBkpYkBKdKNxBja+Wh+FNZYdcIQxw+482wmF2mnNl9I91d6amL
 AC+sY6zg64VP3R7nacc1FH76S6z2byaNCcK/DWWoChEPMCgIOzOI8jOF8ei0RR0QKGnqsUXqkAf
 swgUsac+00GTJI/BFHVsMTH3g0vt5nouj6phgM2ugHmt8KlGM1sW8t90NmlJzANDaYnL0TdTxm2
 oSFB4vEL07IW+5FlNWj7uQypEYPqhn9tLWv7RWJ4elFpmu6X
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX+lIrl6rYA67B
 BJXgZ2dWEeFeAyXD6U47/DElzDUoQo82N6gSe0xK6VY4YbL+BSRNALv+ewq2z2dlAz5bfV4SgH7
 tRI+ti3BTQ0pKqo2uHUDRWxEcbgik7A=
X-Proofpoint-ORIG-GUID: BGiOHAalIgj82dkbwERWndMMkA4Q-vER
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad5e058 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=od__NDLvqBWtWXuahMwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX6HO45fLnOU86
 aquq4SyUHQRFD2LaUsMsNSAIr3W3KiA4+95BLotd44k/nNDwwe+pEiGRLs98bHQEE1Vlg1dWURA
 m59xIcOB+DiFsVP3+jm/BV6G8hx2thHO++pqwetzdwUYpv75LOv8PZx/Ef2OqsQ1vTv26R2yzC9
 61QoJXaEMv7k+4Tg5s+xM71/9FX/aDppYq0Sw+4nThe6QEKdJ3y5X60Ydxa5wpR47lMLCvCAp5I
 5BODRG4sg6WlLPj0CCwt6nRq2JKpY+HW3VCfsnPv6t8OphNNQ102mCRBotwF+vbbxAxpi7okdJ6
 QbbK6CnVlvXtzpx3AF1fcM9vk6rbOvivq070bPUP2B9cEYxOJZPk6Wcy6AEO14qm90K3ASkXpZg
 0OYcNcBks8B3L360+IGrvsNTWG7QtsTAPSOlokLLsmrhKZN+P6UBsl4ra+2+pfS8TnfIXXRgmes
 qBL6WNvK+i1huYf24pQ==
X-Proofpoint-GUID: BGiOHAalIgj82dkbwERWndMMkA4Q-vER
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190036

Describe the Truly 5.7" WQHD dual-DSI command mode panel based on the
Novatek NT36850, used on the display cards for the Qualcomm SDM845 and
SM8150 HDKs.

The model name of the panel is not known. Neither the vendor kernel nor
the HDK documentation mention it, and the panel block cannot be taken
apart completely to check the label. So the compatible is built from
the vendor, resolution, refresh rate and the controller name.

Assisted-by: LLM
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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

