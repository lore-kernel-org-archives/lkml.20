Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655803;
	b=ULmrbL0Ws4GG0X5iBM9uOc6e9tAyf7TryE53wtiDRTe5oNOF/Sfa6ZuL3xVQJx482Ssd
	 2zCWULuBm2XGIm85gnCq+SmZKOijLXH0DE+ZUeoWNOIdsnQMEzrk9LLrAr50pUYmvBA3a
	 ee7qpYEnPvIOqG2M9XTYmjb93dwQwIZQGcyb9wIqlOIXI5QaB+KkLAkNOVVRZuwMVx7nk
	 r9MR1HfHrgIXk+ohS3GIqORyokkxIw/Dvkj5/HqEjhx1frcmLfOm+73IAcWUCeeHuLime
	 1eNmgnbiGOlC4YcZkBmIqihZWy0jsx4BqoiGft/F8rPCTKqu3UVuRk5CN4rQ+nIdTBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655803;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=StjpzzgV3K5FMka2TqMOP7NLAIJFL8U/IFU/fNStwV0=;
	b=zULI+sIKbQKUH3kAxQlpGCwHwRLaFezrpLmMYJppUTbFATQmi7iaKU1FxOxJ3ShaTJn1
	 BBnqH2SUc8LTb18lppABMclgPTrQrf5Leo5+ZrIzFgTszMnzB27H4iAs/7A09L5AgwfH3
	 AK8DHLu6JtRbh+FMvn5HYLyuz1YEDSnJ9u52B2pEFYOSSGeRAgJ469CL06coIVZ9+dX0O
	 6MgdiM6Lw2WkcrN28vAYWhA+Z0Nj0DO0WSCj/7VyL0n1+dNAjmOOymgfJYwURDWqEbZNl
	 03aEmExJ/Skjj+EW3+vT2LCBg26wxvi5slfcSCuFazmrJp+2xwJLTpB3IB6R2GgsBQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l1PCjtMg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bVgWY2tA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6210606A8A9
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6210606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l1PCjtMg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bVgWY2tA
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9w1Ui2709023
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	StjpzzgV3K5FMka2TqMOP7NLAIJFL8U/IFU/fNStwV0=; b=l1PCjtMgREQfKx4P
	zjv2l9uRq5lMe43qTPNoJN0Tgj6vGJILER7VcC32DvWY2sX+zSIKQ8OTrq0TE+7D
	fjcH2qGfoVzvYn2ZhyEwUs+cxRtx0qpm06b3raicfchLlLbpW3xk0c+yqaTz3Leu
	KcsIsdAzM50jijoUyYsiGhDnUZvQh4kxAi5XzHPDDTYPm1fCWtELPxbmkJTWJYth
	Eg4wv+nGokkQGHpPLq/dYUMk4XYdoglyVlZm4C7n3d0vf1gH5ZwOMcnwOJypuWdS
	wa6AlcnnAwH+RqnjbnCFpyWq28cE7AtGpE3wuwQCqeMOC0vinla7fOSW4FbYyx48
	LnlicQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhgm62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:30:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so417786085a.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655801; x=1795260601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=StjpzzgV3K5FMka2TqMOP7NLAIJFL8U/IFU/fNStwV0=;
        b=bVgWY2tAD01OCKJ/mba2Y0ESA3h8UP4edt6Dxo0NHS/BjVkux5aR0n73hlnzhCrVQu
         vJpGaqRuIhjug2C8IYSrJYh7SZM60BfXPYR4a3Hx04CkNyrNFTxrr4piePuxo7ObWcdd
         gigXCcYYtnf8y8d4P7WHlakzvmOzUr+woXz7SUCXBehAMQAgw7nz9rotd6NeQr+0vkng
         0D1rk79BC0tskVhFvMDMEieSyXy0SnNbwnsoKUosE9A9/j8hTA2WbO9QGQ+M7Yxn2d9v
         IdEWk1Aku4kZ4Ny05Yt6KgoQJ1az/WGnY4Dgk7p++EdsoV1c2LegrUAICAtdAq2seRPb
         +u1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655801; x=1795260601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=StjpzzgV3K5FMka2TqMOP7NLAIJFL8U/IFU/fNStwV0=;
        b=bV5Q22DIDde1DKdqNjVr7Vo5uS4/1lkbjbtIyOQ8dRQ0G2DWSjkq+gMeDMlLleQZJE
         sQZTTf3qJ9U3l2kS94RXpRrowsKI+SXjVGubJNRbNX046cB+hKj0hEqXHLDtV7binIkb
         QHPi3CmcfIkNJkF4vO2UXe4hLVVeNc7Di923B2Hit2xfaY/GsIa+vylfImDiScc8jdYA
         pxJJcopm9OBcB8yyV7YNZMjvgb2zCHJ6DaYbmBxs4GZA57XWNXx9c6o5+WWipwed2w2Q
         FC6SwklowSAq6qQzy+WXhCbvJ+GLFUs/6MNzEqvLg8uKwoNlIrj/2AW6ITsIFpYvqTZu
         1UaQ==
X-Forwarded-Encrypted: i=1; AL+hErHMuiRkiIC9XPoQ+utxlIcmuzjRCxgp0Wh2WNfpebzm/32eoxfffgCbZROfaKty9FwkP8e0ZRi4sQktEls=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cMHgftBw1mcw2CQlK8ovS4gb+IJGqa0gwaYbugs2rdg4+0JrR
	EeEjlvOpXDK/K1HlQTb0yxV4d/7BDTMomhbaEo93N7IDrSgycZzMZDmgpQC9k3OHotqWLDaadVj
	hdetH1m9tqp874+GoYPeuVnHhjkMT003m8XnM2WAOLSPCbUSLqhejiYR54htmEt3bruE=
X-Gm-Gg: AYBFou3hiUT30IQ6W/OgjWTc5bFm+oQ7j2ipz9clsLgjwqQASzFsMmKACcWW2rbSOzW
	vsZvpJCfXu1UF13dBu18EDJwDmdGxEHpsR8GBgq5GE/J1K2KFampShwsQ76o7LeLssU5Fdup/MX
	Hyh/Bb6DKOTCjvHXNlu+Xs/qmt/aohrI3HYE+bYzTRhj2CN20aSQAuIyLSpO43yzPZa+HdhEh+D
	SrnebJItEaIJe28VxW4wwhiw/JGMZAGvZpvuycz1FVQ+GgN7HW6Pjrmi2iqCEkmgVF8vcRM29Lt
	K1LexXKeoNfwUyh9fltEp7Yg3ZoHozK/hyWtVbkERcSODkXzNKC+/34cqrvbj2s5sxoswr1Vicc
	FLWl8JQ8nQH9M3d2/H0SSNR+XNZvQhzkIepzEKVXqm7JsYe/9PEgmuKOezzBgcRi99b4h6soOAE
	yvTxSySfhBDcAXP2Kwvffh7sF2T0mFBteYvWt022Ct
X-Received: by 2002:a05:620a:2b96:b0:93e:5fbf:a41c with SMTP id af79cd13be357-9494bbb7e8dmr822387985a.16.1794655801411;
        Sat, 14 Nov 2026 03:30:01 -0800 (PST)
X-Received: by 2002:a05:620a:2b96:b0:93e:5fbf:a41c with SMTP id af79cd13be357-9494bbb7e8dmr822385185a.16.1794655800997;
        Sat, 14 Nov 2026 03:30:00 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:30:00 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:19 +0800
Subject: [PATCH v7 02/23] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Eliza CSI2 PHY
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-2-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=1564;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=QtLaeWAMwSvDdk5BkCV2zOXsDrkSYOKz3w000Imr2GU=;
 b=ayq0vPZ8usswe3DyeKH5IP05zg0wiuLc2SqaQYyKdo7ap2j6Eu99cswy46uQjGiABqtEkkTgk
 NJnxyDfwEYnBqhIjRcSBPIsviU6LYc8w5T8W63QcoOphFlwacdYlmcP
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: qrS2dh9ZCOFjnf0v8nZe3CT_nhchzTLO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX8RZSR60UiApf
 ZD646WRc/jbr8gRbt48FmM7C6CtROBZ4DE15vSqI/ZH7Y13UB/YP0qOWxzRzVurNoRUQtuSakcz
 unQdXSnMv5Xn4+IP+iznYnBEFHZRnUY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfXyIJMdekPqooP
 +6EdYzCna5kgEi17ldS/F7MclrdlctJlgvMQd1gX5QxIz3KVRhG/MdcEn4hBU7WNhGwz8fvLGl2
 ngw+3FBv2dlT5XDRbqMZXc2cQJOjIfBXmsvTqAXp+ZFoe0BAK66Ty27ORY3i9BRfRWNaPCBpF2j
 3aMo0Ukemu/eTO1BxevLMFglnFguQtIRgiTDWAtqhkxejkH92iqQx+GZJDNVmUe9REaTbIvcfLM
 wqPgtYvEannAvTCurDOj7LWbfopJI/8/nOpz2WewFHUd/vbL6gZsN39XkayP0uHPPcH6D3SMYEd
 aqshAzxFpkXoJzk/ThSf57sKIs8bZD5Tt+dQBIIP5VZ8vJVGeLLxDJxYqizbD9kFk2DK3q6cQi0
 /UD4KhoZc1NPIY6hOtJS0JG79qqUQD3uuldMr9UzY07guXDI7KS54TrdrG64hQN92DXmL8p3Vbg
 0ItynDX3BUdmIobxFhw==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6af8463a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Cn39VxbTSVwEGcu4l40A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: qrS2dh9ZCOFjnf0v8nZe3CT_nhchzTLO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

Add "qcom,eliza-csi2-phy" falling back to "qcom,x1e80100-csi2-phy", as
Eliza integrates the same CSI2 PHY IP.

Eliza has no MMCX and MXC rails: CX feeds the existing "mmcx" input and
MX the "mx" input, so only the power-domain descriptions need updating.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 8ff3df1d0d2787b2af0499c1e4106b86f56ff82c..884984f6f6b9e595df9bb3b0027c0bcf285b8058 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -22,7 +22,9 @@ properties:
           - qcom,sm8750-csi2-phy
           - qcom,x1e80100-csi2-phy
       - items:
-          - const: qcom,glymur-csi2-phy
+          - enum:
+              - qcom,eliza-csi2-phy
+              - qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy
 
   reg:
@@ -48,8 +50,8 @@ properties:
   power-domains:
     items:
       - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
-      - description: MMCX voltage rail
-      - description: MXC or MXA voltage rail
+      - description: MMCX or CX voltage rail
+      - description: MXC, MXA or MX voltage rail
 
   power-domain-names:
     items:

-- 
2.34.1

