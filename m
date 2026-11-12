Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497810;
	b=IM2GwWs5bI/xLrqgzCOnuBmou//67zE+Oj3mbh3IxmPSdKc3u383Fu+Hwd4Y9d0S2hBg
	 OqE+I6m+m5RhFraVf1+MS5btbWBp4nY5yFRfgs2QPi1mhZ1ARnKjYVZrJl+cfBYsO0wk3
	 1/EUGJzUcUKGsKIcYyQHvHQPTRwjfvChsj3U3TiUd+JtjGqrLNGhalr4DiLMRC3Le6kCm
	 OUtjGBgAYyypribOkY/rN+wSkh01OS6iQa2xS1mLKpnsaKw3tVUDHdIARMErC8i9fO+Z4
	 LPpxp2OGAP8Z7hOtbyVdTo1KhgvCD6Coxa3rRBljsyJrRkKd8Bc8ru5Qrrs45GFXjOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497810;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5o0W5j75J312TRJZEeDeuGSiHrZG94Q7/QvaFifJOmk=;
	b=2YlCCJEWKCDVjRWQJWnsUdkJhrrrVMNAlDGYeZ1nd3uEYjj4HmLP7h1/DZQmEImeAKij
	 vio+H+dnENR7Tu6RvHHsSf/LaPWXk+fuIljk3xRaYk2idk8f30nILqQRs4x2ItZg5vTe3
	 dyrKlTEZjfmSCjMBX8wCtEaXfEmDdMfcwqLc5GikHzpf6mpRJ9WbIbateoRY2+ZMjMT09
	 KfEbZXPIMzQ51BLZLxsxOA3nUped41r/niA9O2C1TLqNKunfqpC0QBPI6I2d1zP3sNSl5
	 uB9agKCA0FMCFFMa4/4r0LkjplIaR8seZvtWWoQk6mFSd5wrCO88uUJO+ByFeLb0eMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bH0ZZBbw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ivQLuG8I;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E0B606A891
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8E0B606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bH0ZZBbw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ivQLuG8I
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZWfV1736604
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5o0W5j75J312TRJZEeDeuGSiHrZG94Q7/QvaFifJOmk=; b=bH0ZZBbwFAtooZ6+
	aUvXug+ZyNhrwWkGVectFsOPazk2nJo1XbmVYJP9qkLXebpbyYil/xlmKsWCfZej
	dCLQcXspY13eJ/VR5QkpMNVBXfuPCA5WZq3dPjQ9BE6Cc3r+gSGhGNVTDxEZanxp
	6Wmc9IqIA0XDazAheDnHc7wZFlWwBMgNEmNwOeKc+Jafy7UN19315ZRI2UXzgIxx
	7C7h0BiMqdgOiDX0Nzfe9U71wRwbP+z/fG9r2YaKPa1LMEIeH/e0LU4vxgkTsXp4
	Dju4ZmeiPrznfc8JJzuRre+w3tO7s9IHyVu4KAyAw5D56uO017IQt6HhHiaRHzdK
	0TGUyA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc24a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:36:49 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc36b97a77so1015879137.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794497808; x=1795102608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5o0W5j75J312TRJZEeDeuGSiHrZG94Q7/QvaFifJOmk=;
        b=ivQLuG8I0QFJH0JGM2PdO5B+Xy5Bxm1lXM7ZNkLjPu8Ono7nh5flL1+WagJzfH6ZN9
         1jt2RQqqRVwIfdIiI4nFuxhWGwBkXW+n/NORh64j8a+tpbMQTDEXM0w1RCiWN6oKPfKi
         Xeu59U0293/t5iw1uWj2EvnEelTCkxojjasBC3z5IQM0Z15pxTPGoqK7+JGgVGGZpNWf
         Rw7mtuLeaozF3OW8BGQpyFCgE2sTH/1gRp8NZ0VWkdCFMhBUKM/2dqYTDpX9K3+HBnFw
         nJyHBOqOIwN093d5TrD0WdfJTdW2PRGBhwrehwZqzJjc/+vHOuLRtmPpidZCgtiyixTx
         /qiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497808; x=1795102608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5o0W5j75J312TRJZEeDeuGSiHrZG94Q7/QvaFifJOmk=;
        b=HtCT2L+/lS91/AAoK4T6a9xRDxDm7uPVY7OvHZT7/6x9plNIALXyVX1qG0hceB4DmN
         5IwuPaPbHbMhIWJvDLhQq6eibMIZe/SuYH4Nt0uNIyyKXEhzRan5XlYI+2TgGOTKoEJ6
         ymeLDx/+LFqoYrcaaCBFas6Jf6ixBtvVGKeH8rcX5RtMQk379yGWak+8u6xaZavz3xj6
         Hk/M3lK3bF8kKEld1hqbrlFBUa/3rLJRMmIiKiF3aVVHc5sWwRmxihuOpKoVjWxhKU94
         OBdxTbbdo0JOFrqcPCstRILP1HxlKpcU4wkdHMC9wYfyycEXXXot3vBzTbP/6WraMJjZ
         oa2g==
X-Forwarded-Encrypted: i=1; AL+hErF8DDBYMZa9h4+ecuKaPWYHw/KwlhwAre/SJ+msfOcbtjSsqaVUowv6bvYbqAY+DtwYILL8gm2p1kyjgXo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XTinLtnxQYylIKHa1VMvv0fXh2PXwkvD9hp2Xbz7QZpyiAzmE
	SBHkj+0zXDN0w+Sawn8sVtQPpJ1wfyEMJVatyHBN3SgB7wo1BS8gFjhFFtqTLr7bqJQtCeSxG51
	Zxp+6wa9b9nx4GY6nyD3gbXlJ/g3BxdsLk+T+UGh6sHKV9eAgqjNy9yDI2PfN51WG530=
X-Gm-Gg: AYBFou263G2a12PUsi/QLG0bvlP0216d9XPQWR6eA4QytL7GX8x0Kx/8DXgXuALuTwI
	1ykTafA03As1HbBBQrrQHusVazFsyPG2jni/H3mMakQoTz4PtneFrXmlOCr+pGAnnIPJUKxbLIt
	KwfUDEfaeP44Y5Y0zxWpzN5BpD/fHF2HPmj3uFerL2e3t55gTF+3vwyjxpuMzM9wSN7ybQH50DB
	EaY4dk6l9mnCgL8pWSs6DwxxCmcfvmXNEOO+WwPRbkQ5xFqi72+WNhSwOnDa9/RvGRgVn7EOHei
	R5yeibuNdZXr4KwtVJ1BBG+hW5+VKOwl/kC1hUTxC4OHXEgnnfqfX/MCbIhwftweBCijFa2awGw
	KlocMyx5D+zbHx4bvtLkUKywEj2LKyJvgc+hx+XOiCc/e+0hYbuQDY8ei4XrxOH/rvYZPGs6Sc0
	0p5w==
X-Received: by 2002:a05:6102:418c:b0:7d2:7f93:7708 with SMTP id ada2fe7eead31-7d4fb2c2e29mr2099515137.8.1794497808167;
        Thu, 12 Nov 2026 07:36:48 -0800 (PST)
X-Received: by 2002:a05:6102:418c:b0:7d2:7f93:7708 with SMTP id ada2fe7eead31-7d4fb2c2e29mr2099502137.8.1794497807693;
        Thu, 12 Nov 2026 07:36:47 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba09536ebfsm138353235e9.5.2026.11.12.07.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:36:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 16:36:39 +0100
Subject: [PATCH v2 2/3] dt-bindings: phy: qcom,snps-eusb2-phy: Add Nord bus
 clock
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
Message-Id: <20261112-qcom-nord-ahb2phy-clk-v2-2-30ad3d947217@oss.qualcomm.com>
References: <20261112-qcom-nord-ahb2phy-clk-v2-0-30ad3d947217@oss.qualcomm.com>
In-Reply-To: <20261112-qcom-nord-ahb2phy-clk-v2-0-30ad3d947217@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2593;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=P2V+JNK6+l1UtqbbRQrYDDi6Drwba1YCgJEpyneVFMg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9d0I6t40xtjdl+V+j7iVm5y8G3QJhQgQiKuyb
 hBTtNqP0DqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavXdCAAKCRAFnS7L/zaE
 w4ZmD/wMCXWaCFC9VAweSsB8FI/e0bIqdjmRpNlodYp/YPRkCeGqFuia7xy37qYNm+u73hfriRE
 hNTahZzVjpooPaJfPy974giG3artxayNeKbY0k1JrmbriqL0NkFG8MCMvYo5GKJ7yRrttD5B59R
 AfG1P3JOWA7kasQiexiDIfzhvyc4XImEOQ6d3JS51iJegHtLC1PjCACWx4OVyL6Yjrdc7prUNcG
 5gmpq40zypC+yxSNgoCTg9PPacuEw9libt6weqeB5KlY6ad6wFN6TsuXVjXvmAB1W/triFS1PrW
 07XzzSdMLshPntyqBNDAcirhmf7unN+2QCqfeaxXaqYntqi8HAfXUt9LcriLGyYYNwgScsssO4g
 jdwLUsFyBvLyJ+rOrqfiwbcb1hLxK2B86nSv8bY3gPp+NxVJndqsSCI4wqIisHr/FkkLdhN7Sh2
 0aiTHq3llXqjQaQYOvNDrmZOzB74f0B0Lkfd0/WoTAN2hGNfLnuP6mJDZITi6QrRSJzDm3D1sZL
 qi9IvhrLogEfPEAeXk4iRmzwTvXeZEkDz1qTqptcJacHDl9Nvxd9aTsz9jRmZk0QhZrg+WFogvW
 I80EX9CT452JASeY4eatTRCzNRghDk7c87XgX2/3f9bEiCj3T9QzMf2f6ZBs7m9iu8KssYWeQx2
 G5YAexuE/58Dsmg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: JFKcVskV2RXz7iRu2wb0mEJawQtxSF5p
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2MiBTYWx0ZWRfX/A72ddvDhjgL
 yHAa52Vznt9If1lvHcVacTnt/Sen+q9G38W/sLrBVERgQPLz4Zl7HLW1qsst5LfkhL93wX6uoQw
 sbU4ZZKr/0nJezeSnJfKzmL3/QUo2Kc=
X-Proofpoint-GUID: JFKcVskV2RXz7iRu2wb0mEJawQtxSF5p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2MiBTYWx0ZWRfX+JZ2Tly4DUA/
 BOa4P8xPenDkfwwVvxr4At8gAw45uXQOU/eMF+maIPU4Lbb7gKrYSyZCc0O1SpncJVgFiOBHCeP
 LAkCAjO9DBgCQfDm1P5dCW/gd6Htf9VkOBELAtpdlgFvpBL+lRPmf4VniAuGTjmVzboqI+4fuGx
 A1MsWFo28RK5QnqnKDtwdZLuu+wWMNDLS2BGDqvr5Lsm56L5s6QoXRXSaOyNC7nstAaleKBHhJx
 1jxI82j5GS5vSfAHuah0ChKUZMZY2hhOU2kScZCT8wKklmt1Az4z/B4DD7+g2Y69hcbu6QKIimf
 CpY8mvrDL/FQLjOzXKYD/YXbYPeAZjhHkhwPJpik0ddSprKRfXMcVUnuJldyEO1SUpGLfv9nW4u
 ndWt26gyF6pHmAsfzD2k0w8YBQtZElMioqDPj68ss/gugRN1K+1OfHi1b1lMDGbZzlKRJW92KZ3
 dMNKivKFOmGNX3pbSxg==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af5dd11 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=tP9VjBngxETQ9kDmeHQA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120062

From: Shawn Guo <shengchao.guo@oss.qualcomm.com>

On Nord, the eUSB2 PHY registers are reached through the AHB2PHY_0
bridge, which is gated by NE_GCC_AHB2PHY_CLK. Allow an optional
second "bus" clock for the AHB2PHY bridge, require it for
qcom,nord-snps-eusb2-phy, and keep other compatibles at the single
"ref" clock. Since the Nord PHY needs the second bus clock, it's not
really compatible with sm8550 so drop the fall-back. This is fine as no
DT source uses it yet.

Fixes: 4d1f3875f328 ("dt-bindings: phy: qcom,snps-eusb2-phy: Document the Nord eUSB2 PHY")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
[Bartosz: don't use the "qcom,sm8550-snps-eusb2-phy" fallback]
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/phy/qcom,snps-eusb2-phy.yaml          | 24 +++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 931cd0e7d297e..fbea2129939f9 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -19,13 +19,13 @@ properties:
           - enum:
               - qcom,eliza-snps-eusb2-phy
               - qcom,milos-snps-eusb2-phy
-              - qcom,nord-snps-eusb2-phy
               - qcom,sar2130p-snps-eusb2-phy
               - qcom,sdx75-snps-eusb2-phy
               - qcom,sm8650-snps-eusb2-phy
               - qcom,x1e80100-snps-eusb2-phy
           - const: qcom,sm8550-snps-eusb2-phy
       - const: qcom,sm8550-snps-eusb2-phy
+      - const: qcom,nord-snps-eusb2-phy
 
   reg:
     maxItems: 1
@@ -34,12 +34,16 @@ properties:
     const: 0
 
   clocks:
+    minItems: 1
     items:
       - description: ref
+      - description: AHB2PHY bridge clock for register access
 
   clock-names:
+    minItems: 1
     items:
       - const: ref
+      - const: bus
 
   resets:
     maxItems: 1
@@ -77,6 +81,24 @@ allOf:
       required:
         - resets
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,nord-snps-eusb2-phy
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:

-- 
2.47.3

