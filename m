Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DF43AB46F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790577436; cv=none; b=Gps9CbtqbHRIhUx30Gilt0qjZbaryKUdnjtHRuXrz5sqMKp7I5gDh93Z5HMqYOmKYeFi2gMHNKtlYVSz263kRpWtPuHGFHj3kSpNtLbOfML1GI4iSXRVLZJdhVCIBjF7IaVAa5GKHbgtYBItk2QE7Evm2i44At4fRWWENnqL0ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790577436; c=relaxed/simple;
	bh=ZvfNexsX5Cqvdxj3Vy+av/oLoVCsdXqDXsj3RFn10Js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TVThfJDr5+AwzQ9m6tRld9/Qr+/Tzta6YXy5bRk9Kj3OjvDVGBUXI029LIx8o9Fv9DMEM9LaBBC7Ky6ahh+bePUlhtNw7i4kTwc4KbcqsLNx81d1v10MakAErT2Lot9+JoXeHjG3lZd1bcQIJnO3P0y45IZzOgNXURalVuPpgAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L7cHNXQ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NoD1CEHc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L7cHNXQ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NoD1CEHc"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S1BAoQ3455871
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	srxqTQBK+zwaPAssFeQan2gCNJo8bXf94ZcM17bxUUI=; b=L7cHNXQ7Q9IWNiV1
	ilYRl4Uu9LZikD+17pCDTLbQTHLQh91/pY3GC7BiQhxcl6JeideClX+PzeSBfwGf
	i48hlsITceQhBjhhrzFVyT4FKwysbNKbMwOGDLbTI8fD6ifx4DlMclwGNZ5tdF1L
	EH5wcHZ+biQwG/rgXTdofSiUse1junirQvtnj4d+ZBM0cVNReKVYb3ECrVlqXhGk
	E7aqWKQCfZLylkCe0+NCfwazbPTMHk4tY4/rK0LAi35W2gIpyiht1bl9Q9XEm1qF
	SrVeRl1SL/xJDak4QXjYTfaRrU7tAmaoxWy4xvUJSQyVauGD9tfroxl+qd7aXK4f
	zcO5Og==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq0u52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:37:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d9336581a2so41424165ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790577434; x=1791182234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=srxqTQBK+zwaPAssFeQan2gCNJo8bXf94ZcM17bxUUI=;
        b=NoD1CEHcAqSVCu5vXX0mmczBgRpxyQyc4FG1EUkGEQhWepU3LLawMEFtofotaZk8zp
         PTRu27r2oZxvbS7s5vDi6EJ4aDmgFDn5Awvw7bXxgKGZUJGEKrZRdAltbcJJiEb0ihZE
         aVaRCwqJSNzqQ24FXUmS8agow5Nd3NU+pp2SU8ULJvajedevQYBEmpVOsW4+g1OA56Hw
         fsyV1Yc4UZUMgfZPTDhqq/bVJz3Se5viY4z82KCAwGXAi9ODSaZ4xvHOt5IP/rTEFpAa
         +hgQq4DxtMndkr00Fxtls9qpdPCHZ//OfeQYmovD0tDF6iXBHA0f5y6j5935lo5ufXU6
         O6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790577434; x=1791182234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=srxqTQBK+zwaPAssFeQan2gCNJo8bXf94ZcM17bxUUI=;
        b=LJA/hphs8vZ3tEMAiOVQC9pNxEyP9Li7GivWYKFVvEhxV8HNXEFL09jsMRLlxComlC
         vxiVLl1bqbnqgEJw5goZsjZuDmo/AsHG5nErbD92fEld/7XZzIG3ECGFNWARO8NfBMyG
         VKLrWutp5CZpaEo0HUkKfrlfdGichVp5oOufm/OTk08CkVfwNH3jHpwgOolmHJgUCIqF
         bn6ZScyi395wswlP6gJiAGREEAO93HHhNuF06yA4sEcm8QqqK6pPlpTzzGtL83cGpUI9
         gEjTE1IaaBWtqH8EQtYPKv6/W0d9Yzf65UrAJ/VvykO48J8iNBZ1PTrQcI9tdSjc+Bdv
         2wZg==
X-Forwarded-Encrypted: i=1; AKwUvBxKskuQtHePLhQHrK990OfuPm5wCzFWpSgk3GqXPj4+i74fC8mVbElTbCYMXb043quhLZvhjOhDrkQN+lU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4Bj3GGhady2Q6Ebw0FEkT0iWxfcULJLE5eHJd1c03aLEUrol4
	1pqw4GgrF7kuGFe0CIW8LpIxftMOySy56Un/3Rz/2GwIjxg2z4qLUI+T+4KY7fFwRbmum0DlL2N
	QIpS6O6g+H6+Uoqu53Vw8s/sGKSBARjP4dnBsnwNpU3VnnRU/nL8ebtQgzn048E3QSiQ=
X-Gm-Gg: AYBFou3CPsZbeC3rNn2fX/X0abfOqWICtI4gQnpL2vr38s0uWY5SrKSztrhO5izLqS1
	cZOXkrEjPb8cI1XitqmyjR6qQnPN8Zd3dv64+qEZsl8/DZdFmiZY7U2f73XXdekShySljT2uJ3E
	gPciL6xURHO+/ItJHWVRlAjRWCQuji6UC5WmN1ebOQm+PN2xJux+hyC7X81pvzIgT+xB04WkKLj
	Fxv7BaWpZF/PA8iR7CFuTW5/fB0eSqhm17SsN9qjN3IYaylLRyO6DZjRUHqwOMfV3K387eL06B1
	y4SqW3j8+cIfvog7O82bmFtjm8nEJZlbpJyCWFJfR9X8gm0a5JVPlpDav03sMasAZEo3Vys3w9w
	xzzjYYTvPcubfgdcuGHuG+L0rQoA87YWFm0mNc7Vpik+G1pg4KQ8gDqqBCRm3iSnopyJI8Bs7Ty
	K93QaUraX+lfpi
X-Received: by 2002:a17:903:2408:b0:2dd:c100:9435 with SMTP id d9443c01a7336-2df94c1bc19mr59631425ad.51.1790577433591;
        Sun, 27 Sep 2026 23:37:13 -0700 (PDT)
X-Received: by 2002:a17:903:2408:b0:2dd:c100:9435 with SMTP id d9443c01a7336-2df94c1bc19mr59631215ad.51.1790577433128;
        Sun, 27 Sep 2026 23:37:13 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91468978sm35292685ad.79.2026.09.27.23.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:37:12 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 12:06:37 +0530
Subject: [PATCH 1/3] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add thermal sensors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-ec_thermistor_support-v1-1-d9c1bae4cd0d@oss.qualcomm.com>
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
In-Reply-To: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790577422; l=1724;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=ZvfNexsX5Cqvdxj3Vy+av/oLoVCsdXqDXsj3RFn10Js=;
 b=xYdcz72tTsuUB3zatuTTdzn67OLfEme3Jki9qjGNkar6ms/AjKcIxzouA9EK7DAaDTvEJ5yn4
 fiuZyuUnW5YBN3oqH+2lkHvtJ/H7DmlHVAtwLQ+IvpWyYZ9pV5kMgj3
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-ORIG-GUID: sQoLv7cQ-rZA27ChDPYCSrjmfDA1t2Bp
X-Proofpoint-GUID: sQoLv7cQ-rZA27ChDPYCSrjmfDA1t2Bp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNiBTYWx0ZWRfX5lO/XnD7NFd7
 P40sNhit0DjsZNKZIP+B7i1yZIa+q1Ph0Ei2b8AtNOhkqhRV7SEUJJGH859+E3TUrr7YOpdEOOR
 j2mVLJ6PRh/26MTUa9s+88qvNyILxfU=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba0b1a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=E-ebOgB6S8F8S_20uhkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNiBTYWx0ZWRfX1Axdxmp5ZXq8
 vxAa1a5ti/bvoEmsWhzq/tSyhGUiHFkbYlQVtavzyTsIKjf6/KbM5ljapSQPhJjTMh0bY3YtHGd
 YyOfRrFlYRKBUzPa2mBiyS+X1F+cGiskidlAOuwEb2EZxWX69UAOuLEGxiN5LOdJ67TG13scB8S
 mK1fN7UzT/M91C+/M5YhKtTV4rdAukfBG28SNf3lnpocmJZIXnhM3rHaXkylfFmQOR7NYf74bBD
 8CBDD631W2wA/HrNFuZzkqTbNKAGx1nHBUFIzGe2TJYIWAj1m1DONvzMWl3AKXaWysRQJkMWw4o
 7I7W0ZqOGE9rQcWt3bQP5tYKUfGmioioLTChfdvTEk96uf44foCGU2vSpKTy26gb0BLwEskM3iS
 HNGqYzVL8BZ0IOAAEjwgiIbyixmkoaq4dVOU7hd7icB5GDgpYHQzEO/rSIvtNZ+FIkqHRJP9+Ur
 y8WXvG3yPl44DuzLKow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280026

Describe the Hamoa embedded controller as a thermal-sensor provider for
firmware-reported thermistors. The populated channels are discovered from
the EC firmware capability response.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 .../bindings/embedded-controller/qcom,hamoa-crd-ec.yaml      | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
index ac5a08f8f76d..13de6bed8129 100644
--- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
@@ -15,6 +15,9 @@ description:
   EC running on different MCU chips. The EC handles things like fan control,
   temperature sensors, access to EC internal state changes.
 
+allOf:
+  - $ref: /schemas/thermal/thermal-sensor.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -32,6 +35,14 @@ properties:
   interrupts:
     maxItems: 1
 
+  "#thermal-sensor-cells":
+    description:
+      The EC exposes up to 7 onboard thermistors (indices 0-6). Which
+      indices are physically populated on a given board is discovered at
+      runtime from EC firmware capabilities; a board may reference any index
+      0-6.
+    const: 1
+
 required:
   - compatible
   - reg
@@ -49,6 +60,7 @@ examples:
         embedded-controller@76 {
             compatible = "qcom,hamoa-crd-ec";
             reg = <0x76>;
+            #thermal-sensor-cells = <1>;
 
             interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_HIGH>;
         };

-- 
2.34.1

