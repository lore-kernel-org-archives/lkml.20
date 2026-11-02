Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615493;
	b=tSfH9cL6gi17oq4cr0T1930n1YNcOAndkWYkE4DzL1+DBYXXUZd6rfRr8CIIlfnFzQ26
	 ic9PEmGePGSW2FPeG5QE3kWAuyQYShbR9Lxv3FwRJOzIpk9dA/UFuGIf9NElgv1LbbGf/
	 KxXgI19pbZeT1zjwYqAA+gCC/BVjFzgtXolrPw4XS1CW+OzmTfAL0HXkbF9DCsGlLlixM
	 RWlMa6sfGQANs2+JgmzM8DrybeYSY338/k2Xg2cN7bQeXYwSNo9A9S0Ppgzl25fJ0Fo8v
	 JcJE2cQVnZA63+/zALApMQLGrmpALzilFYGFR6cIGH7EK2h2x6CknDP9qAUlpTUT31Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615493;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
	b=UwEzThZhf+85UytSUNdK9M9U1XqdMgV31Alz3VKPdCy2a/LrvjS/da5qqpGz2xV5I9KC
	 WzGEXANK/XELvIGpgQL9mr/RChZ/BZEgO3dPuzlFRNgjSbejXbEYMaEwyPVdp4xGr8MFk
	 xYXHDk+cWNGMn5nITndDKcrNAme9eUdk9MgKgnXfJWZxAed1NFQJZZ4N3FoS0oPRAkfuH
	 UWWBYRqpCMmAl0H9K+dq5E6WTA3/IwdTM1125E8jzqbyw271Plo2Chc0JLR8PUsOnFCIP
	 pJwiJyaXyr+PCfIb0Nz0eMg03KHaYYvxinMb+CrLJDaQwXOKO5JPIBfBWCfeMUCUUGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D5Zhrho4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JI0KRFil;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87179606A33C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87179606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D5Zhrho4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JI0KRFil
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29B1cQ4015004
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=; b=D5Zhrho4JNtM5SKc
	9C/2uQubF07fQBuHlnHO0Kl1QTSQsW1MTfZI7+pNeC8HqGDgtcbeyxAO8/pYUdoN
	Z59rwc49qm+eRxCMaZpfJo2zgr+ctuFMeN7R8jeJveOEADtkHc8YHIRoXTprVHt8
	QzHeNk6OfJeAj0S643/7ubSgf+6X0qdyxD2br1Tps5e7om/VsEaYQ6OGsvqRK8u/
	/lJWrrejt1RYd77W5vhj+6QYhAzhCXnvQWU7lYQHQHu5Ihqi/MG7HOwp0T90UaGN
	cf4oE67aT+eUini33hyJ3mFKam22Qp22EQ7eQiZ33jUS1z/Lag6BaKxeQhpkYhtp
	A02tVQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6pka3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:31:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f62934ef6so612365585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793615491; x=1794220291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=JI0KRFils6Xk0EOdtTs4ktLLaXZImqcNKBmau9dqCd6eQRPRENl0PN5ywrE8wnkR0R
         wqfDwX4MLzpsC6kDuTavb5zd5riRdgOpRjSr4NSsgAV9fO0bCW7SiK5too0GhcpuKQMT
         bt694LrXOQSAdiZ5431jVhfPSnA35nLuVhI/E1D552RAO8SIEy6ReW3nBOqwmb28Lvpi
         od3UvVICbwvT/BSxCfQoU4K222gAF2Ml5lEsEwNMyBmx2iNHtqc2fD1EwqfNl28X0PBY
         6glMbu12ftf+q1wMKfIQMpHoLLFpr3sSsEy+2Xlo1v73cWgLcwVUsXysRQunp2qQchVD
         vWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615491; x=1794220291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=CFN7r4/YMPv+LzuygtZpBwAgkUNYnHxI+BpBM8PGn39uq4IdSXCu1KcoQ1cK450EDx
         MIXr0hV2ryqU4XkFBib33CKjgv4VbkqyP6lJ6Gqf6331hSj8UI9fyN5obURpbLBds1LC
         XaRyS2FmltozXass/WIuyJPR7dWSrEuoqWigD3dAJ/sS1ZlaxyTkZlVLRI7RVZkiA+dJ
         vo0OoyeI6teNEBdcb5HRVfAQ4q/7LW0FZkxiI/1Hb0k5WZ2qJse9F3Y+QDLCiq+4uttj
         OkEc59H9fxSqhvHigmWUBBLXEr4wfFiDfwaKKKv1sqjHj6bnwHk7UfSfRlZVUFsw/u7N
         Up/A==
X-Forwarded-Encrypted: i=1; AKwUvBxeNs+tBp+DopS94h2MxY8D9cIXwhuPosLnOPoWfUHWJvuEA1lZu5xYbmskDi67zAbNWI7ppMzJN5C2JdE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLW8RQZfIR67mPYn/ml8g3qesqQeg4Hv8XWdliSPl8TEZhNLMBN
	C2DkATy7JJok44egZ8X+md84umtRVMJCknkJqOm/zGd+Xd9xvQ+EyPU/wh9SzT4raNg1IJstI5i
	K2fJLJg3z1PmLuirOTcP6ZGhLl9fWejCyab0lSLpzKhQPnjzXWlDrwYdaubjju3ncooo=
X-Gm-Gg: AYBFou3KFspgRR3qJYJs39HxNA9czBQkXQuTNEl1lJ9dE1QwVhsnQ8PWG/eNgPskw1E
	FLd75ffP/D4iR6Y8HZCo2k/s+FYdSBBMKF/IJ/5QjIHDIT2xjBrae9dOdtLw5BtI6sTJiMcPi80
	Uew8MMWivjqkXA51jX3POb2ORa0kyWYIvKXmpJu8WXWlhuS9hM4baBxYKGZK34mHeufSHtoPKbg
	Mj7//O5DPjVfDwX0tcHNeA3U2ubyKRZdxdO0/VUM0PtD2qrGX2h9Gxq0J90sKumbQWaV75QIDN1
	gTdG3GA3XX51fJFjti+sFt2U5/PqomyruJ9HQsai0HwekIZxmUOIKz1QHtTHmtoXBxH1eTPkfVK
	4xHrc44R9jlwSYeJkM1fD0jgXgcyzEBjtBC0cKNvdtJ3UViC5msb4sRXRR2TIhCUqT6HMc6jrq3
	P1eA==
X-Received: by 2002:a05:620a:31a2:b0:93f:6f8:9d74 with SMTP id af79cd13be357-9442180b5demr1569727185a.77.1793615490675;
        Mon, 02 Nov 2026 02:31:30 -0800 (PST)
X-Received: by 2002:a05:620a:31a2:b0:93f:6f8:9d74 with SMTP id af79cd13be357-9442180b5demr1569724385a.77.1793615490220;
        Mon, 02 Nov 2026 02:31:30 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7c5063e3sm327847885e9.0.2026.11.02.02.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:31:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 11:31:20 +0100
Subject: [PATCH v17 1/2] dt-bindings: phy: document the serdes PHY on
 sa8255p
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
Message-Id: <20261102-sa8255p-eth-phy-v17-1-aa138f2912a0@oss.qualcomm.com>
References: <20261102-sa8255p-eth-phy-v17-0-aa138f2912a0@oss.qualcomm.com>
In-Reply-To: <20261102-sa8255p-eth-phy-v17-0-aa138f2912a0@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1956;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BfrbL1Fwh6l+Z6nIdrB6wR8juwiurOHR3kGeK2lY/yQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6GZ+RHjr12vHBhn0eHZ4GbLtL3zdbnI1zDJio
 LxHYZvQlqCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauhmfgAKCRAFnS7L/zaE
 w35uD/9wcl/m4vYFGffyJsazxW9oQxPMi3BENRaVfoIkO3MtigFHDByww4DdmrtZkop1/RTh/bE
 BItYPSlNGtrT4UH9G7C0WVvR6aCzZrGWQOQPyX2+6R76HoOfIGeFvxpnau+JofUy8DtCDtE+XzB
 VfsT5eFTqdD2Xu4SIJFDc5W+Y4TJhP+HGYGrt22fiGFgzQtadUSHqz32Okio4pdo9zRYhduBZ9y
 7tiN84zdDnpoxoFqtB0mUvfA6E4fAPaGjdEO2CTZbOsS+qQ+2+dCSoOChNe5GESRz9Ze2wdW9To
 RUKhHGioM9QIpbv7dQQ2S9Q/Dxh5ha1/4I7h9yzT/7sbugMAYAYqUTD3LD+uFwo/Cjk2btj1cdB
 ufsqWeLCuV8wMB4xc6lU8/Mn2KE1sCYkB7WbciyXW6yV27EG50OVtAPhu1oENZxecqMPDBiQg4H
 hizZTdI0dIekxgD15e/W8FGPja8fkFeHzT1qaMH6n2i/sMDX2wSvaNREa3ZK596Tg5XLjZawTxa
 Jbjhkl0rxvtsPcHs5htcReS7pQtulZXM+6ieogpCDnNZ/NJbVlWbn4d3X4xHiB5enjrLFi2nD7g
 k3WXFd+KvOEBcmmc8MXAEDvgxHraAvcxj3+RS81K+/0AJ7oX8QR1VopSYRYI0E1c487CJ8zg9pL
 ofK0qxPLaPcC8DQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: bdK4xMkzhJy_yhlzLXgZVpkW9MJphrFD
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae86683 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wENndLYK2PIMvs9AUu4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: bdK4xMkzhJy_yhlzLXgZVpkW9MJphrFD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX9tsoPO6hQNGu
 E/vQa9MSMlIHL6pd7CYbBEYs56FgGLbEQ4Zw7K45/CX6+2xGht0HSHNhEfFypUIpQcmQG95JSBk
 N1Nb+GYV/JTM+0vWJZ7wpctxWAtVyAQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MSBTYWx0ZWRfX8xSfEeHvt01V
 9ccJ8UbTTZE54NsKO1WTaU+sok4hgQq0Ysn6Tt38tw2BwrmNMOPwycCz88tpxm1v+YCNdF+x3uT
 4Ken2s8hbLHKgHzZk/Fbg/ylrmQGXc8rINxxuntnjda5bzV8t3+5PrS5wyXb04qSPDe/zIs9eCJ
 cNxor5g+lZLuCoSQFx//K4NGY0/8nv8VBvGxDJ/T7hJXJtLmN+L0h1GgK+CzoKKfas23JzNd+1O
 bAHzrsLYG4mwQojDBXJbe2O5tLD7jcYxsIx0+QWfx2TKreD4Cr88C7wDdyd5R2E2frD971a51vJ
 9JvpYifMiGvJDIQKUXTcjFgoxOVUnJznp72HLoRmh4ICtxnoi3Kw9n9PVS6u+LE0W7sVIHRM3ls
 7S/zbLVwe7anlW4ock2Z0Z9mY7FX5pGqumjCeHCJ3gB7gz8A6/8VWnjGrOQvo+A0ETyf7+HmYCY
 soiIfgywabhEa6lkMnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020041

Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
This is essentially the same hardware as sa8775p rev3 but the PHY is
managed by firmware over SCMI.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9e846e381555514bb32177f884abf0cf2c942948
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SerDes/SGMII ethernet PHY controller (firmware managed)
+
+maintainers:
+  - Bartosz Golaszewski <brgl@kernel.org>
+
+description:
+  The SerDes PHY sits between the MAC and the external PHY and provides
+  separate Rx Tx lines.
+
+properties:
+  compatible:
+    const: qcom,sa8255p-dwmac-sgmii-phy
+
+  reg:
+    items:
+      - description: serdes
+
+  power-domains:
+    maxItems: 1
+
+  power-domain-names:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@8901000 {
+        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
+        reg = <0x08901000 0xe10>;
+        #phy-cells = <0>;
+        power-domains = <&scmi7_dvfs 0>;
+        power-domain-names = "serdes";
+    };

-- 
2.47.3

