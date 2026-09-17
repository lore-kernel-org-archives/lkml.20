Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E03B52123D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651241; cv=none; b=nKtuL/T54/wPb3wLoaQW5aeaUat2EhHtWLxnk92B2CT+00Vf7p/Mm8bxkgVJk7J/P32/wR7VBSOIIC7vWskWPX4XPViUIS61vphPZMkVhWcYu6mGV4w5w/gL+PB122hedhj7B+H5Z6K/tLf6UJ0ip0QVYM40cCL7gPkqudCjf5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651241; c=relaxed/simple;
	bh=lZbSOiq6PpWvGtztIT8irq1yq+3657nUu17HzUf8NSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KdLTAe67fONCHYCfwBlxF1CLE5VGi0CVu1ncDaXtyXRhme3wIEd7qUzJBZBJYw74NVWAiMafSSNbqKNkVFCn15JZ+mkJeWh0xVeyWtJdoymfpfsWK84ffvoihcPvc/tyWV7tAn5eJx4xGzC6GzUzDnUDnZCAXOegXvPPMgMA+b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BYQZjLwE; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BYQZjLwE"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa65080so118514666b.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789651237; x=1790256037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFACwW3FzP5DW2PPT2LJDEH+gbA8r2g7VY7yrdZmoeQ=;
        b=BYQZjLwExNXX76pnNKh7XEC9IXSXTqEm69hAmLKVaOtbltR7Qv2mtdMZh/AqOpFp9I
         y+/XWS1DYl56pttwEPAm6lxxWQZEA12Mik6+jgPQCjuAPo/vTOOAHPqpzqViHOhbDD8C
         fnX98RbJ1nMPZlD0Tt4pH/+zAomvIrDvfHgR+nWwtAjI+2volskUBBaE9Ir1BHgQqkBU
         LzGsFu5lmwOVgqtoV/nm6sBjFjpLz19n22e5YxwLa0fIndlYKXcXpTRCXrA07M0ulwdg
         ANxezCEBFDYJsnSeUhhEh+1qR3bE6+W4HQlsWiWsiFNSwT/H+UXZahaiU4rvB+Em5gKp
         ZOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651237; x=1790256037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jFACwW3FzP5DW2PPT2LJDEH+gbA8r2g7VY7yrdZmoeQ=;
        b=SiuoHwO6gKPBMh2NuJcnUmMxL0ij8ttLg6bZAHeuHrA2D82ZCZZ1jXS4wDSaNEQVLX
         SJNWR4T+FtV6QZTHIxs2QO+CiuU0YFQQUJGxbdhVgF+Opwo/5dLIn6P7K2AT8RiTaE7S
         39w+G8OUnD1plGZA3bM1RRpqC44YHGO/5pw0zwrUJ4psMOlGcbUtVhTasptRnTmsSmwr
         1kGLePQFoS/EnZ9KsZvtgdqWKDwoLHQzCWXm+xu08WkyL4mtYzk9JpsC1do4WGRByPac
         SIA5qp1ZIqp45ikGgqLN4biOaVFlLirZG8P9kdmzpzjqLfPOXaYHI6nsT7Cx3KqOiKX4
         XmMw==
X-Forwarded-Encrypted: i=1; AKwUvByLlFWZugMdH+K1NmNPdMOOCKcE4qJUM72iJ+U8BVQwfhgHcDsomKMTaRHVUK71cp0dmhp9inMll8FHAWM=@vger.kernel.org
X-Gm-Message-State: AFuF++kFNT30+DYTufIR2mVquFkbxaowJNg3HC+hjBknmB7/cxx8UiC2
	mjD0Ak1QhgfTU7UdYokjL28o7P6VtGnN2WMlgaGOhANQcmJbiPHC13Ybwz3CJO+A8YI=
X-Gm-Gg: AYBFou1qCvd8sK7qPZtt52TPxcA6SJPpPXU0bMy+2SViJc+LaUGLxyii30eOs7rJyN7
	AvDMPnU9JwdIC7baNOH9mQA1VY1Dp2psQCnd/9FWd3ZekqSzbKn2w6zesj5AwatagvZsse58RMz
	FwuRkmvbcIO/ZLvZbkXI4TWjAXZqUGxw+Ne3Jph76j0KMXdHwp1pj93u2XvtqgVbDEODNKNftUm
	aKc53tM0eH/sLhn9C2c9nXttRX2uCFO16PDsMLw2WYNrfKhSSB8OpxWFyzNQDBJp/i2SZ7kV+67
	bXjLMb3F46iyWwJkIl1O/x53JqO2BXXcMKtVjPnuahZt10hXn0gfZCxbPzXjIoK4u4J74B7vBP+
	O4fhuQEttbtyodChy0F7LZ15jSMDUwl12WDhm8rXIaREsF2aQzE0/sZp6se9Y75UBYfkJedGlIm
	nODJ0hHm/HjEev5F8kTjh9g2e/ih4kMLLYKQDEpK2r3ryzTC2OvX4/ubGTreOOsD6zybFmxy3Hb
	oX2aONLxw==
X-Received: by 2002:a17:907:9724:b0:c29:41d1:a0c9 with SMTP id a640c23a62f3a-c29e53470d8mr483725166b.44.1789651237600;
        Thu, 17 Sep 2026 06:20:37 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5e4ca9sm279681166b.42.2026.09.17.06.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:20:37 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Sep 2026 14:20:26 +0100
Subject: [PATCH v7 01/12] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-x1e-camss-csi2-phy-dtsi-v7-1-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2799;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=lZbSOiq6PpWvGtztIT8irq1yq+3657nUu17HzUf8NSs=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqq+keqijn37SlNYPk/SJ0Ua7jYu14UW02jkM4B
 R/Yh6htdg+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaqvpHgAKCRAicTuzoY3I
 OifQD/4ngbGzsIdbxtwf9bv5vb3czNBbM5a0INNa142RWq+XEpqLeoMezQJuxytdPcRQ+6vLmo6
 Ac7krVZQaPW4BrzCq1/AI+ursv9HIY/cOyxno7X4S9tYppax0hFGvusQgX0cAvPvpG3zh/nCOPO
 2QAYxBiD6/+8ZhnB25EjUfj/+5aL/CSsZCwSZtCdZUkWaAt/plMPq4H4cQxcLPB+mV5fg5Uwze7
 xx1A9AqhKs3nt6IK89kS5l0J9e3KtBhOf0bOGwWlFh4F88Lo8uUkR78IybImxstOxGKrWQ3ikYI
 pqXsrvoUQOgYXtSr3X6YdR3i0qb9iXYlzdPAXMNsEt/RV1dNFsZ61mKHZBrC061DDPyYvCv4p68
 4Tsjx2xMgAYWcm6WVwf/uUCFQC+r4HghM1qtCJCjbTgOdKNC07uRVPGpN0FzPEDhHaYBuSYYamw
 5LX0aE6ARfZ72takLdVNzFXluQ987C6iLY/EpkC2L5HsUhsr8RDEmUDSXL+Y8NLBj2t4G5VOKwz
 tpf5cxdj7n6n+X7Hp3FUT8A+AKcJIverm9Rg6viJVSMTO67+5A355tCZhpRYtzGW1HC70LWGkMB
 vMnwa8MIK6SKEINYbCRhql4L8H5D6lIFK74Wv+hpHsSXLJINpQJYaxpWj1drQOAHAkmvBde0ff8
 Q2aoc/HbZSSgysg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

The original iommus list included entries for ICP and BPS/IPE S1
contexts. Only the five S1 HLOS stream IDs are required by the CAMSS
ISP hardware: IFE/IFE_LITE read and write, SFE read and write, and
CDM IFE. The remaining entries serve other hardware blocks which will
be described in their own nodes as support is added.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org> # Lenovo Slim 7x X1E80100
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 2d1662ef522b7..126400772d028 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -104,7 +104,22 @@ properties:
       - const: sf_icp_mnoc
 
   iommus:
-    maxItems: 8
+    oneOf:
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
+          - description: Legacy slot 0 - do not use
+          - description: Legacy slot 1 - do not use
+          - description: Legacy slot 2 - do not use
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
 
   power-domains:
     items:
@@ -332,13 +347,10 @@ examples:
                                  "sf_icp_mnoc";
 
             iommus = <&apps_smmu 0x800 0x60>,
+                     <&apps_smmu 0x820 0x60>,
+                     <&apps_smmu 0x840 0x60>,
                      <&apps_smmu 0x860 0x60>,
-                     <&apps_smmu 0x1800 0x60>,
-                     <&apps_smmu 0x1860 0x60>,
-                     <&apps_smmu 0x18e0 0x00>,
-                     <&apps_smmu 0x1980 0x20>,
-                     <&apps_smmu 0x1900 0x00>,
-                     <&apps_smmu 0x19a0 0x20>;
+                     <&apps_smmu 0x18a0 0x0>;
 
             power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
                             <&camcc CAM_CC_IFE_1_GDSC>,

-- 
2.55.0

