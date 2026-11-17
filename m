Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906399;
	b=REQonbsIa/tk+vbT7itQoZgULvrkCwTBkzZ32iKaPf6hcvk9SJLPPbhj+8r5rIyFPgJd
	 VG7QsUO9ePLxaG2109o3hn4HAQsmQoZDATiEHzTNIu66yVwXmjNDfQnB+xFmwbvzrdn/q
	 3AouOuAaUkOv4AK7y2QhpKll1igjhMtzOf22Kpr1w9ZPZvNITYsBzqVn4rynaIJRI8VbN
	 PZv8O/74Od9XY5kAiDPzQ/1yIE9I3tkA8jswLdsA19ZjSGJWgkdb2BqyoAeqczCktBOe5
	 O0YEHZoA4TGDM1lxplUT7z9AaE3mCPXu0B3eAPECXHm3iGk2A3kFT9ThhqrtuFZQ9Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906399;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=G1aPL1MlNOGc/htpoxXZOBRFJ5I2czNFzBkTOlaU5EM=;
	b=IoPAGdQg5sf/L/E/z/EVdfUaFFLJqk6WDSqgCS0ztrDqrmxcSgcBsBlBphEmc4+185Pu
	 tcCoQy2VRbdPLP3WgMsP8ywduuGKUFcBin/0LDgahydeqZy6pA1DpziSJNzD2verjuVyb
	 yP+ruG8M+wlWr4DH4AFhpVkI56pgBryLqg1zLchJiigSqfUBD2d0EegiB9dtNTPyOL+kO
	 bQhJncJdc5JjtMdF6ShkRVW71J+5CY7BBpMk/Z99gNgcfoGuPtcBgGB+8Oe23j1Gvm6ty
	 Q4O5dJf4UtqxXo2OzM2iAPmPlEFxYCxxHaoN3OIGLqyXTHfSio/mKHI6ZS6N7N18NJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lzNYJdCQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VzKTcPB7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6A9606A899
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA6A9606A899
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lzNYJdCQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VzKTcPB7
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8flXd844332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G1aPL1MlNOGc/htpoxXZOBRFJ5I2czNFzBkTOlaU5EM=; b=lzNYJdCQ+22v8uiy
	hhXCrfC/TRosrojiSfVmW68T+xQ+kVNhKZ6z9BJtyFXWXrUmgX557PPBYZ/xL4zA
	nsTTE6HP6rVdsPhvwgvX6abtP7tninpBz3p1nIlL1LA3pFq76Z7vp5hQX2hC1O7U
	0tkbb3smj0mv68CjhHGqjmw07BkXr4FsPKV8Jvas0zsKDdqlui9sDnKrBjmzbd9h
	NloZqjuX84MHhFCPcZWvYng1dR1WBWs1lv/QcY/AmhFiGoZj7Ki2h/OakXTWORP4
	3ij0G/ueT2OGTOssKU6UXXvfPNyLVzEKEqz7rZvWKxvWKiKx00QRKN9fU6xgqyeV
	vdbBxg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h1q7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:06:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e92aad34aso874724885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794906397; x=1795511197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1aPL1MlNOGc/htpoxXZOBRFJ5I2czNFzBkTOlaU5EM=;
        b=VzKTcPB7cez9iV+rs7xGDfqELeBSFAOImRCKWvKOF2BFjZW83XivkGu6+GTRLFtZ2L
         WH8uD1lpI+BGZLnJibP/eGqxUVkqpehhZj3UIYSVZCHchExb0wxmTCDQUp+bHKmVERo7
         xdkjtkAnjakNehu9j0LfrFaBbUDHhMExnpc4YnCO8IKdEa4rD7Htir9/PiwNFHf5hu79
         hnaRpH16YC7d30nMalGn49iHI7dYOSrS5N2cPDdM4DFuSopd2LSSf0/k82KreMIFb0+g
         NsbEPPea2k3qEA+mdar6tDjCoXUi0XJWTN5kXc5YerMGg+8JVVOe1SPQ4mJvX1ym/+YF
         WCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794906397; x=1795511197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1aPL1MlNOGc/htpoxXZOBRFJ5I2czNFzBkTOlaU5EM=;
        b=wu9+NXhqNn2fdQIg30KDp0VArGU6paBZPEJw07hYfss9PhG3W42d4BG/3parobFHTY
         ZEMZL3KXUAGOjwdkupGFki8NHUlYtxNqjF0jEGM6ihJXLu7/l5A+0Z0r7kB3nxWJCHer
         wQB53dj76dvgdLA7bln1w/e4oru4gi5N6DWpAfsj6wdFZuxSpPd86P67Wwlg2zL71QoV
         hs4qxf2q+zq/3vk6LlGaAAGODROrPDuER2Vn/n+M0YkV8FSRlnzKbmwNXWVyfCXKagRs
         lUEynKi2mqAiG1YqUFVsU6Q7bPuTR5dSqXni1hGlUAsj/5vIqmNLssiolgrmWkTbXxsq
         frBg==
X-Forwarded-Encrypted: i=1; AL+hErH6gF4QnXSLs4xnqtKOAQmhrnwGwFxQpRjdX2wh3qUXO03MqaZduSv/H4sGGkYXCZv0xMpjdK/CkFOsuqY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/derLNQP/NmNWOmPih63QpDH4kh8WGAEOK9oeyUBGkkTGFB+jV
	6MfbUfuf4R+pCrgrhcLArl0WtyHKZPJ33xwlsvrnZVRSGGYhiXECUwUCbhd4KqwMM1rbiyP5SXW
	uJfPgm9SBbTRu/Uis1BRecmFazWvI3QakVwi1nREBRYwxt/J7XqJQes/f/NBSGh/Gjag=
X-Gm-Gg: AYBFou2iWhCC0QEZdgpQUA+PiNfZoFWqayiFrKP9cwmOkVZD4QbpXPswDw4GcSwBwwB
	gqQw23kANmaaVlbDdNK/nllqjVRlxBkmiQb7CTISqvhCNCoJplj9coA36Xrsl84KbWxZDVT8tDl
	ZD9fftB5vfVu1LjAYOUAdtb+Nwz8RcIx0zhqAI4ko4b1pxjiIUBrsxs6izijuvqGcXwtLogopFP
	NKPcFzybRN0MVbE60Cy9ETHS7jsabO7CuMvob6NDwDl8osL0QqyIkeAXtdLgd/eCo4lZfIFW42W
	y+P9q0yLa1xr7OWYuzHMvnoPr8Hi3C/a7j0pwUBe1e+n4ona4P8ra4OWC+Bdxn/k5R4WSvPpMTq
	t+y+wrXvz9d6UUECf4ZssvdfO9mUR1mucgbI7L5bHxZrzaQ/toO86eihT04wBrx6/nlwA8E7O9A
	8=
X-Received: by 2002:a05:620a:8390:b0:949:7497:7c1c with SMTP id af79cd13be357-949749783a0mr1047334685a.60.1794906396849;
        Tue, 17 Nov 2026 01:06:36 -0800 (PST)
X-Received: by 2002:a05:620a:8390:b0:949:7497:7c1c with SMTP id af79cd13be357-949749783a0mr1047331885a.60.1794906396291;
        Tue, 17 Nov 2026 01:06:36 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm27310657f8f.56.2026.11.17.01.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:06:35 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 10:06:28 +0100
Subject: [PATCH v3 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add the cfg_ahb clock for Nord
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
Message-Id: <20261117-qcom-nord-ahb2phy-clk-v3-1-ce5ee1073208@oss.qualcomm.com>
References: <20261117-qcom-nord-ahb2phy-clk-v3-0-ce5ee1073208@oss.qualcomm.com>
In-Reply-To: <20261117-qcom-nord-ahb2phy-clk-v3-0-ce5ee1073208@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1951;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=O068p3qvY13gpO1dapynH3Vca4Ot7GTVTMBYtc7x7LU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq/BkWaH0DVs6hwvZ7sOYbRSydJrmgAr5t8FV+A
 Gp/dGqHDFKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavwZFgAKCRAFnS7L/zaE
 w443D/9TbrlZs9tS3VbmqVk5HYrt3fS2uqe8ksEZV8PZAbNcz+UPZAC5gU1uYtHkiPYpvVnf6AD
 vzLkwE/U+kb218VDHh3A/HVNhL/16BpQjubHC2CCesAoaQDHqyEmhsamR4cbrwHCDc5t0x0GySD
 yOvQPe68WH3Jz+DMvd+I2n84K3QFTRbA2Zskx7o8eKiK7sUOYM1Z1A2pMyWUx8jTMIb+h15XxF1
 wZcw49vEJyDghi4SPkRMDZDp17zN8rAI2uWXx926io1kds3rI93zRjtWCzVZ33q2Sbea2ZmvKJs
 TZiB9LD89sg9ssvCYxk+mJjENzGvE7w4qiEO2MqOflEl+RH6P6pe9f67b6DHXPJj5x30ZjtwyMC
 NaeOsRXws4bio2w3KICUkzPDaRAVKvhdK74OZiUI6N/tfxC31fbGBmZvtwOiWswklDTE3iGgOs0
 mJRO/TaSYmQSH1mm1xpQ3waeHC3AfICnLZ2zQLfnL3ycNjQt967fGYnsmH78zZ3HCls0GAXQB1k
 Az+TX9py9CJiuIEBoN1WOcUX7NLQDi4g2Y9r4azCvjxqA9j561kwdhzd4U+lbvbFBpybosUeCRU
 nzY3tkGBQLcjZk43aVt67wUE0kuWr8oiQRqYH4i3CnH1yZZ5+MquZapgbdbJjohq4ecHwvtZzKd
 QhOVUodO7zGm8VQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 4asC6uo1ZUiS0t4g2iW9neQYgha9Uvpr
X-Proofpoint-ORIG-GUID: 4asC6uo1ZUiS0t4g2iW9neQYgha9Uvpr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNiBTYWx0ZWRfX+qO0X+lCoE6j
 UyzR81HuDmpCkSrRsY+hy8nlp76PkVw2Q2PUHssWXI5BnSzD6Uyt1fy6AgyexF5Hlp5y52DsZul
 V1jnEYox33NaT5jEMtbmsxhxAO4PjLPfIBEFbp2VJ6oJR3Mc7aOuSFDEOKWelA85F3JtPoX5fhm
 /1IuWSfzTSfdWnyMs6j+xlQVivXLzxnROBVex26s9C/MiUK3adqi/DpxRtJLulpXXjT0e26zZzI
 Pf1PYgf1iJgF8d+UY5hbQPY75dQzB8oFXwLBKZ+J4a14hznORzU9pAGlMJwvnmeLDZ3qFzsMPqA
 Ij+e21xQinpIOdXwO+OJUFLBAvG40cr2f9swXyLYjGW4rVipxP/lpYtf+UyahtUXadlXQS3u2Yd
 kszCJzOWn+jIOmvpPX+ojvhXNEhIDnT6/Df+R1eHZOn4X7WWDB4bL//a52lp1BGt5/qtZ4R9C7q
 lsdCmdMK8lBMAws3e1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNiBTYWx0ZWRfX936a4DWM+olT
 Tm86joQ2rxr/XNXjBfajmnzTZSrPMDmusbyZwFa0ohrnNjiR9tgYBKzL4igmsg8PauNuNQodvcU
 gibWcAzhXBGot0rs8mioKD0hlqpVRsY=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afc191d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=2jpwp6DS_NLBz8rowOEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170036

From: Shawn Guo <shengchao.guo@oss.qualcomm.com>

On Nord, the USB3-DP PHY registers are reached through the AHB2PHY_0
bridge, which is gated by NE_GCC_AHB2PHY_CLK. Describe the bridge clock
as a fifth "cfg_ahb" clock for Nord, using the same clock list as SC7180
and SDM845.

While at it: make the constraints stricter than the global settings: set
minItems to 5 as all three architectures require the cfg_ahb clock.

Fixes: 674e602140a1 ("dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Document the Nord QMP PHY")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
[Bartosz: fix constraints]
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 13e64fe510b8f..8d09e6937fef0 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -209,11 +209,13 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,nord-qmp-usb3-dp-phy
               - qcom,sc7180-qmp-usb3-dp-phy
               - qcom,sdm845-qmp-usb3-dp-phy
     then:
       properties:
         clocks:
+          minItems: 5
           maxItems: 5
         clock-names:
           items:
@@ -229,6 +231,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,nord-qmp-usb3-dp-phy
                 - qcom,x1e80100-qmp-usb3-dp-phy
                 - qcom,sc7180-qmp-usb3-dp-phy
                 - qcom,sdm845-qmp-usb3-dp-phy

-- 
2.47.3

