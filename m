Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB314EBAE2
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972113; cv=none; b=dcxR5C+qeGXVDFEk25jJHbp0eVN0HBssLBSiocDqFZiRqyod05d1PscTgMBis8OdJBfB8Ni5nrpMQ59QibrClfkcYmcdNmHE4NCohinVtnUnSBBessULMimcsWGl02g6tBEXZudoxIP4c3OP4kLzjR3hMbFBPM1JTSS7vdSuq5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972113; c=relaxed/simple;
	bh=BfrbL1Fwh6l+Z6nIdrB6wR8juwiurOHR3kGeK2lY/yQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UVZlbG7AEscj1UX15ZfRJxlQN8xT+Wbq5+wvRG9Cu5SoEhPP+XluZzJo+qJ0hRrc0USY5UuQoAZQ6QW+UL0B6C7dCXli3xu4sMOiyS3NiZm5aIBfNO/+nkUPkaE0YbmSOJIQ10X1Ru9Du55axErq0Ukk6pYDtrYqpuw7oSmZ/Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HnIfoncM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aveufr4J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HnIfoncM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aveufr4J"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E8oUOC3000901
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=; b=HnIfoncMqut518Pp
	KF99unefWyv6KwxN/qzfWnOjeXIfZtPbW6wZWzwN3xcnMoKP/5TDHC+sMHSpkI4d
	sHFAUqH94BRe/rnyGUvoeagY1zaxel0sNwDWaphzw3rNlP13YQ7OxRyn4xX8BRNq
	bMrjdWRFUJl5KkdaQe0RUMJlrfrfSAaxa0o+Q0UHzt5mOcD/RDPyoSBeE8xKbrKr
	QBUXHphKyNRSk8a6uRe60QOY4KtsoXEf/dK8Q6G+sVdAXPMuo+s23EKs7JSitPUM
	ZBl5YGry0XJx7NzyW+sI1TeM1IecJvdmbW9bX4bSAjnT+S2dxKVwYdqafM5BhWQq
	ZkiR0w==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbeucuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:01:51 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98c88cefeb3so103744241.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791972110; x=1792576910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=aveufr4JOSrsH4763mUDWXFYZduuQs7q1LoFd8osKHnTAVdfPz9omdZ2ZNO/57IkCK
         HEtzQfskKQvelLZb4pY1tUXgvArwKgu9iIdDEYWTfd9BQYvmYTuxWu7jw/uxZP4GvCNv
         WxPZ/fz3u6Kpqy0D6v3M6Emm0brtY58LrpNRoYgt/kkHqwl8FjnE/m6InhY5a4ahwV3b
         rd5/RiZKTBV4teSEnX3l/F8AB3iJ0lJTMQiFoL5Oo3SNyRSzIjEryKnvNxHJnhfCoiqO
         W6nh7XeKsGOnwxvfyOnFH+RQvmuHslPVG3tqPC3zR+J42n7B1fuzimK9Edlj1KswaO9D
         cOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791972110; x=1792576910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=JD0fAOpyJVVnmtLq9GtY0oiPhIMt6kXtgaS6CgnRaSX7pygKYxoeoz3B+VPWHJo5WM
         nOTHmswsCyTBdZmI8z8LELwYfo4ubzfjt7VDTiVlzu9CRcnpm/BqhU9CmEY0X1XPi78h
         AVWVzUFTgc0AOJzDu91fWoI1h0T+lJEt4orxk9KuCyB0zB4EspkzZHKMBDERe8FjuBVJ
         WnLP7+6CG+C8wYbcptUaM5VrT4+sranB31zd4UJbX++jrrumyw9QxlQaLKs62IjL+GhZ
         lMy3yyuNzU7a8KcxTE6MoGJWI92gEzhjvPGs7IJ8brSQBIaFzLnVbymtTeRlNcT9Z/Dj
         zkiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIM6QR3TuCNP6wQ5DvZEsa1wj+CJ5alOSUB/ie76COmhKwadluMyFpOTpJQ7uNWCpIpEJdyFRRUg2JecY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI06B4xVyRNx78ldMHk6rcfwGpFQP8U0g++Jxj5zG7peU7hQpM1
	vG2ih2PxvVc6xz32F78YuqdUOThPhgeYoO3E4ZljkYNvRHMvsseGtFcVJ6DvClg/+UUhaBiHk70
	Uve7DAu6PbArHHXNBQeazD0LlH3yWpEiHT7LEdJV5AbSAT+0feK4ay4eHSfLiUgxvN04=
X-Gm-Gg: AYBFou1NNVs0VxWQQw9hHOMIrTvf8KuBTLG4SaJw6JLSn6e3cuftlgOYU1vYQkajmry
	zgC208puJ8QtEdRuSfievzOZOZj4JWrJB6w41HdPPrle0KPUr3uMQsJSE+hXrHpkIbBeZ1sry2R
	1VJTURmtxdisy0CIltyvWj86nsv9bgnuKMQFCgh/LwMtDNJPPP2t8AhP8ucZnh9nNYbgoEgP4AO
	JrjorAHBSH0gg87VA2LFGkJ+eyP2TkxsU2ZaUMXxByTZB3YxQxOR/VGn32c49WgNuvhVp3V9Cng
	VMzWk7EnVVqOLP5sQTXVIQyyH0t5W/QUpCo4PCUxuhw9guZNOsgTpQ9GzWiAaFeboTrQuwXOsAG
	rlHvdyEmY+FiInCEgF7ltadK6UxdP
X-Received: by 2002:a67:e713:0:b0:7c3:c0b9:8d50 with SMTP id ada2fe7eead31-7cb37311326mr4327360137.21.1791972109950;
        Wed, 14 Oct 2026 03:01:49 -0700 (PDT)
X-Received: by 2002:a67:e713:0:b0:7c3:c0b9:8d50 with SMTP id ada2fe7eead31-7cb37311326mr4327351137.21.1791972109436;
        Wed, 14 Oct 2026 03:01:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc85b1sm10382169f8f.54.2026.10.14.03.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:01:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 12:01:34 +0200
Subject: [PATCH v16 1/2] dt-bindings: phy: document the serdes PHY on
 sa8255p
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-sa8255p-eth-phy-v16-1-6310fac52e85@oss.qualcomm.com>
References: <20261014-sa8255p-eth-phy-v16-0-6310fac52e85@oss.qualcomm.com>
In-Reply-To: <20261014-sa8255p-eth-phy-v16-0-6310fac52e85@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqz1MGPCatuhXBWyqnGPIrQoLYFB1FN4AG0VT/9
 yFM7KKje4WJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas9TBgAKCRAFnS7L/zaE
 w9KmD/963fQjVivQDEGeX90B9rOqkHBd8uzEGRyI5dKkZ0jgVY4+4y3zhvRzzTASXWM854PVC3/
 CPOT+jUys2jUnmCf09Q0+KFJ9I8Z1xUZI0Oe6raazt6su+HETNI6MOnQ5RaWvKXWO4xP2GoA7+K
 0YVCwhsvmOTr954rElIvsCCo4+3v0jqrHsd1+nbqlh6zCRHdvWEARkTLz/Z4Y+qd/ORuewWLQCe
 6K8K+IaxNfZzafBg7nT5Opv1JsTtclZuBfsPsrHAWVpwmLPIrmCE/I8l5pgM21YvTmN35lKCmzO
 oypRAm1JCM10N5zqYIzQRo8+NcBD/lHqNy+1SmI/3pokUE0szMHhxElXhjqSPdB4xPyjudYHHlp
 wmV6vd4oU6j9skDpdmPx3HkDJCDJUHutFLBk6glRULVIp7tH7cXo14U+kflZc9TOVH54QJMJdsw
 aC0dT5zLny8qi09RuuxgAG+f+qYqW7etVO09PjNtBe08n2oR8VZmGTooBUfJqOHwSGCDjjEc1Dt
 2vOj+UKDNg8vFRwudS9tC8QPMrPEU9yJg6oaI5JG3KoUA2oHd7u6UP0Z+WvGesjYlhhNgbFpJAY
 Dvye+wSjHrwh368r/S7GFXzb4qz0Sy/k+JcvnLx70F6ETwzEMz5ZU2Z2l7krwT5TEN6rGOQnAVS
 fCNk+lCXul4yqyg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 4bYcRM-jVzYLTTWUvDYooigAI1XFgHId
X-Proofpoint-GUID: 4bYcRM-jVzYLTTWUvDYooigAI1XFgHId
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzOSBTYWx0ZWRfX+nk33evYbPob
 Jco1zCthB2iacFFJGoG6VuA4uXbwMzehnHMQLpkIxv3qKJpiaiIylKQkdGHrQhc1NzNtw1Fx1Ot
 iBpHfWQ8koY8Mi5EcyqZb4saErnnsne5pQT/AWBN6N8nEUzUOxoWR2SpNZFyqPdoZQVo2MHTs2+
 GbRyjYQZFu9t8fVHXaZr50Jf5ypAHGj+W4k4aZ/1ycXXp9CYwfHHe833uhiESbRbGt1QNNBHo0o
 P1GWWEQeUsUWvsp0gHbQ6gdITujmvHKTp1QZ3NZi+h/QVWYIGApxyjwTSFEVVF7OR8DDJY7geek
 1OrqvtKfn+SXfpEOYavN7StawPFv1TW4XQVOnmmJAO6PbFpEvN7ALb8fSiBSnNI2Dm6O966Kf9e
 1awGsdNl+PlsWo8CpUxxHwSUwaZ2kdfpke1GCJAEnrP7gBS5/rnyhkUXKN218tMb6ZmmCEKM1rP
 5C/R3yqzMtsxL6otC5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzOSBTYWx0ZWRfX70fkm3h0oPvd
 njc6Ip1RQrT/PhJFuijVmD1jQVSgmXjRE/9nuIkjeI+gGaCk+rdZC7b8uXRItTE63fRX4nW2Oao
 lK7ZHDmcF8ajIAV9WI3/pM4hBNDUePA=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf530f cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wENndLYK2PIMvs9AUu4A:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140039

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

