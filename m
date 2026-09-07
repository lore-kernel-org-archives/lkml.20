Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EBC381EB7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 05:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788759995; cv=none; b=bR8Rxgi5HuXnHJskdPQhPfm3K0LdmH/S88m+XORC3kPrLG02VxFQewC5WdbG/MgfGWZWJUKt4lIyoFKOe6VZL64vERySSClpbsVvIt02/pjaMgX8ZC3q8lyLc3xjWHAQUYcydb+93HNtjI2dBDALpCQhgCapvmEVoNaUB+5HkJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788759995; c=relaxed/simple;
	bh=TGGp65HQw/cMtOZ6c34YE/ci3z+cTavJC4fOlegELGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j77Usz6cQuhOCW0p3Q46fmnyf5mrBpJ/c8YM5q3SgvuPpqhGgnqdCsTHVx+/h09vI/FzlmDNBThNwP1i4RJMqw2IKUyvp5R2i9We87INC0J8pltEqtB9w4b10gIi1Qx8LeQsazNL7F2il2rGz37OyCA7CPOsiIkjrJLiq1bFL6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EL4s0+TV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=auY3pszw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EL4s0+TV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="auY3pszw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873l1M92820009
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 05:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x7xPpPd/gMAwc7gipdn+TzoHtpnTabWshZ97q2TAFrM=; b=EL4s0+TVhvnidJAO
	BJ+aBA+5w4xsi51FaUaHt+rkM7rWDQc5cdEsO3HaRzChyPu0jMpb+dr/0W4VLWZY
	3023ABlY/aU5uBmHREt7O7qI2oLj/zWymAfluSkJfNkq0SfOqJgv0HNBdPWKqPsB
	q5veqk8BCYxpUjK4HVBI2uWmVXoKIqLGxZnBiii0xFagI8haVyWXdzzuGYzaysWZ
	b+HMiq6z6N48yz01WzW3OcqlQyKfc5mKGsh43l0ErtlgQNhXWj8kXlhkSyiAsF1Y
	G+crE98cbBe4PGp6yxJCQllc0Yf0LVwPP3SYEPpJapjsoMGYcyYegTh9XZsQXDRP
	RiFJDA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggadhn7gf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:46:31 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-85602449126so6297989b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 22:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788759991; x=1789364791; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x7xPpPd/gMAwc7gipdn+TzoHtpnTabWshZ97q2TAFrM=;
        b=auY3pszwZcUdT7GqU7XlliHLS9VcRgJdIQTL9kQQ21sSNu/i4PB8XWqBc1VRltPHVl
         p3tdPwUNxNzd5+ZhdTbLnlGPE/fwZNDiu4rMmfLvuhg25I0RrdbMlhpz0Z0BfUaNPLlL
         1zNUVCyrJllX/Uh2cqGLn1osspiabKM38TZhbWBv+QWE52ImdzsYMKD5MrPbHI262bpL
         Ko/H8gt2cj/Ux+BaZF9oKT3v3UFgsWXyE+i2nBr/aF7ih+eWqEbf9cZZgZl/qV245uie
         9lTKz/luVbvw7etKRRhJ6JVyq0f23CciyrrhoQmEG+aV1uWMb0YP2AR5HRAQ2ZNS2BlC
         Ct3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788759991; x=1789364791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x7xPpPd/gMAwc7gipdn+TzoHtpnTabWshZ97q2TAFrM=;
        b=UainnUZH6McIEeaYnwK/m6VY80JZF4yumLkPwWaGVIqr9pLIuHzDQOxp9Vycc3ObdM
         XTPrMIDeoOvIJxGwW4fZxD92GpWcPcEO4gGJEC0kDGmJOvbGpr031fyC8xIqA9HmgBgw
         Ai1lovAl0wJ4+25NfBvMeE6ucVH406OadZb9a0bDHDKKg9OgolhQw191Hv2MqVSeLZ5o
         UxAXaJEzO/+dCvcbIejg72/wuYwG9STHSEOiPgg4REKanWNap4NAvFP41MnhquZQEfH9
         ROXJT0avqBoZEtFKcxtAjsZy0Y/QG7awrfYZRcujknwaOYeVfNrDFXc7Zs2wDE5Xxjip
         beVA==
X-Gm-Message-State: AFuF++lPKAL1naZdw4SG+Fh9eDkLzshKOiOoMScqgyzuiPnOu6gB5XgV
	ZyqxSZ9OI8M9gLsPFsuo80TX6orguLsLZFeLXpQlTlJFJqEVQfKlddpDDl0xzM8nwxRVHg+pGtp
	UiJap4jbLBDj4M9zcBM3CxLb7tS67WKBQ2DNjAKe0I31VcSHP5LQjLQ91P8IKPDrC5eI=
X-Gm-Gg: AYBFou1zDwO1dentwOQ35KV6C2CUBwEE7ln9S6xveXCEKaqMxs3ehO/Ap0W+2OJoZ90
	KuI5cqjidegCENurS3DQpQg94Rt9NcqKeDwoLmmHp45qORNfDFx+62AGQy7EfR2bzg7iFQu0vl6
	59eHNYfgE/J0jiwIRSePSnkf+AIT3RXR5RYLekpZ8GtUujyEUVrr1MS1eFMFRq09HvK14S62Ess
	zVkLqCqsW7jqaEXkmGuClCAXnNoUcVKBbLLfx8sgBo2DUweEpFLpwpleLN6st5xieQQMFSy977S
	z+Eb/J4vjXPl+w8I8hax74X9tfWiQPGPmNxPR3YHQqeTw+HUPc4Iwr1Lu5cZpDO/oYd4nJVmz9E
	egMbSe4QpJyyXCvPJJaBMNBYbL1G/YWmu032o
X-Received: by 2002:a05:6a21:4e01:b0:3d3:ae50:97cb with SMTP id adf61e73a8af0-3da3a178a99mr32448178637.24.1788759990950;
        Sun, 06 Sep 2026 22:46:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:4e01:b0:3d3:ae50:97cb with SMTP id adf61e73a8af0-3da3a178a99mr32448137637.24.1788759990513;
        Sun, 06 Sep 2026 22:46:30 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm24022589eec.22.2026.09.06.22.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 22:46:29 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 11:16:07 +0530
Subject: [PATCH v2 1/2] dt-bindings: regulator: rpi-panel-v2: Add required
 vcc-supply property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-rpi_reg-v2-1-0c59aa60d31f@oss.qualcomm.com>
References: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
In-Reply-To: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788759980; l=1463;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=TGGp65HQw/cMtOZ6c34YE/ci3z+cTavJC4fOlegELGU=;
 b=HGqHYzefSsJiIaceJpBRFr7bUOzhMrcj8IGMVMJXpA5rttKU+yhWh2DxTHVq4N1MHRPikfKsu
 ubODr/32dUADgvFEFgN+dVi94V8ak6A+snFiqQVu9PCSDNRZSmLLi8C
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-ORIG-GUID: xtC5Z0e4BPWDU-53a3rrFb-2e3eP6Zh5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA1OSBTYWx0ZWRfXxKrDBIsNepCl
 bhBIWksMu1o061lmKn8e3uM0ot5jFgjZrTFKM5rJTELw4vMWXu+GY2bgaRsC9f4JZ+WBa5SSdYD
 k7ChjNdQNrgIQLEFsr8Nb4YxBeaRDULJD5UObF3f+qsY8lVZ/raKpReTHCf9MsEYsyo0qssx+Mg
 tqTa11QxbzPeiKiS30pNlCRs7FGKknkBNmCVQgC1sHNOhbXdVbc/K+CXoyADeU0/hIc2lENlubG
 O9I7zfOmTCqiauuXVkReSe7fMn2dzZUX5LV2fcVl4uYccw/QQv+FmydA30JZN1xETVa9DemOlw/
 NZPl7MASS1tGQKLzpyaPYN/YHUGMpEf9G0RhtZSXzsFX21I4dGLox16jmPnBvSemKbkr1Cf4yOq
 jXN+z8qfoM3A7UTxK+ZsgtvAOSbA1ra5eGOLeekSYZDY1YZVZ+mjqI/ClzobRMAkqjeD5kq6oE+
 w6aBjw4MmHzxV2nDixA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA1OSBTYWx0ZWRfX7MCy8afVDOTL
 Eqc1msyMWNNhgYwWYlWZCcplYj1LyOJYn1PQsji1kOYUFAccpRZzjYJ/xsUh0wGqvF5U40iS6F4
 ydPVy6ejp2buC5GRhu3OOOZYNplgDxU=
X-Authority-Analysis: v=2.4 cv=OceoyBTY c=1 sm=1 tr=0 ts=6a9e4fb7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=H1PRAqIjwE-dPk8C70UA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: xtC5Z0e4BPWDU-53a3rrFb-2e3eP6Zh5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070059

Add a vcc-supply property to the Raspberry Pi 7" touchscreen panel V2
regulator binding and mark it as required. The panel controller MCU
needs an external power rail to be supplied before any I2C communication
can take place.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
---
 .../regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml  | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
index 37b9ed371b67..a6195e53be16 100644
--- a/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
+++ b/Documentation/devicetree/bindings/regulator/raspberrypi,7inch-touchscreen-panel-regulator-v2.yaml
@@ -35,6 +35,9 @@ properties:
     const: 3
     description: See ../../pwm/pwm.yaml for description of the cell formats.
 
+  vcc-supply:
+    description: Regulator supplying power to the panel controller.
+
 additionalProperties: false
 
 required:
@@ -43,6 +46,7 @@ required:
   - gpio-controller
   - "#gpio-cells"
   - "#pwm-cells"
+  - vcc-supply
 
 examples:
   - |
@@ -55,6 +59,7 @@ examples:
         gpio-controller;
         #gpio-cells = <2>;
         #pwm-cells = <3>;
+        vcc-supply = <&vcc_reg>;
       };
     };
 

-- 
2.34.1

