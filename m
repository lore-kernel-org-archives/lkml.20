Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4683486412
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789161677; cv=none; b=kBJftkQ5DXPXHu5TsTRlUJieq1mvLqATzrAWZ7pcE1aXiXfTh68YSPzqzQmsOlXD/Q6qVZLoGIWfBGGmwm4jDg4+9F43Um612VnN9utd768S8dllfpLW4WfaDpfGKu92ESNQLPhTKZFPIetTlZy9snG0VKw0GVAsPEA/Ro8HikU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789161677; c=relaxed/simple;
	bh=tUGaS29lFsJmXAHbJSfhfRBSAtNRDMY5NM3rTaPK0XI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dCJSx8HjMex0oOpuDC7pl7zfzlbrnE3AL1IsQJT3taKmSRDtKvHYdjqgPi+FmNWtbQnJEC+yF07Lt/vhIfzZPiA2wRLRI3ENvrBrkHR+U1C79FObVqfKaVtA2q7r1Eb2c7M6VsJTr36WlZ82282wRz+yaMC985K8/CNN1aMvcjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x9Nn+7ye; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x9Nn+7ye"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663c1so54917066b.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789161674; x=1789766474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LiiI20XmZiZkLtdJaWOZkEQ+3eGld2Up6TgYEg78YLU=;
        b=x9Nn+7yeT29YVBJapOgpYCQty8jCxSxgTfoPu2pn/eHkjxzQfEC/E4zAZx2xbulnZr
         jf9sex7iuCGbbcjIE+yZCpOXOdsyLSu7HP1pXZsfNxBpGmlbUxUfvh9N1sUrSIaIgejq
         GJD5qT65CQDkX0dQlhWWzrrY5RjvKY+OTh4UCr6tY+CPIsW7GJkam9SpZQrbgYV3z8q9
         UWIlo90UUYJdaAAn7ZneW2H0YzRkcfve452N6s03/gwSC8qI4vK5QAdAFqyM0vjX6+Qm
         nn9w+EJdt79mF6NnrpD120CF2F9MYy+kbKEHTDuTtcr0BKYhA93zU372PR0I0XfPlJDM
         bziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789161674; x=1789766474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LiiI20XmZiZkLtdJaWOZkEQ+3eGld2Up6TgYEg78YLU=;
        b=pCuj/V8jihJ+l6K5Q+8GLUP/gMH9ghh1U4iWCBUCL3g7ayuyzHCdYpP2AhpvyY+1AU
         Vh8Dyr9tYn2UNYs9M0a/P4ByzcSWhUdYPdGd4hjUuSx0Bq2A+Rmp4fMIKypDT8W0ksEt
         Zirkrk33+X3CSuyqyopsa1v76sH9MZrhwvniAGilkvXR9tMCyNu8JKB4zchZP6qHCpJw
         c2CAiYOpZt7q5yxjnkblqql46Lf6Gwljk/TSq8zpJdblSzvsOCJqbDmo/fsFM9Ojoy8K
         Iu58ywazfcJ5q3BiFkeQ4rStbA6SMnN2qdW0YYnfZEpN/SEyJBvDmU5B2WI1GYTZgsPi
         AGiw==
X-Forwarded-Encrypted: i=1; AKwUvBwUl+BN2aVt/7fVsZVr2pAndZPMmnAF+0yNjfChBZwIp9m/TGSBIz5CWIFM2rqUbTosU7Gp0UDI0Xu4v2k=@vger.kernel.org
X-Gm-Message-State: AFuF++lZE7AoTaPJcrlaAnS9Nh8ZYoNuXfbm84x0qjQPpHLiwobDJDWx
	7JRsIezKRV93WtC0mwNJ3zL04ppkNOs/sYMcImmT/lILdhUjM+gwIS9dHUHLLN/MN9g=
X-Gm-Gg: AYBFou2DTtxSUjFsFg/kJDfYznDpJ4nTTU59KW9yCQpX1ULQvQCgN/XXPmTFtzT+cp6
	/DLqGxFlgjmh7Iq2JVJLqQC6kugrsVLj+uVbOVe2ePTG7juCg2fp2IxsIQY94jBdpOmK2GIXpbB
	KBN6MfulmqEXbV0lWwZZS8fq47UHT1RWj9v0/0kv8IPDSKGtGus8h1srCiZ6te+xroXD6QhQB3J
	1XQHupipFBhAz5RtWVNPK+K6ZOqBYr34ydEX9LqQWfdUlwEXZacPrBWaEgMNs6gfKp+U3XWwl8o
	wuI/wBEsO8fAxKriwoP5J6+eBwo387DR3N4Hbabv/5bxJRY91pRUu5tYVoB4J8LDgpMM4LC0T2V
	Wi2+/73NanDwXc4dvbH8CHolHffOcWBxvKHGvuiGq6HrVGxtSdgQXiuYxGBcegJGXeiNmoWirGr
	16TSYZOTzlbG8Ft1zWab0Hiahb4gwWMscrNFeawTYUyc0Y2WW57yDdtXlSuNScabpspyB+vc23n
	3wrR/jaYNm6Wek1hrzBcjGIEg21ZCrx0RcJbAscHyTDodr/oIOBh5vck969nnvs1Q==
X-Received: by 2002:a17:907:c1a:b0:c15:e8c8:340 with SMTP id a640c23a62f3a-c296674a92cmr569758566b.23.1789161674200;
        Fri, 11 Sep 2026 14:21:14 -0700 (PDT)
Received: from petegriffin.c.googlers.com (116.118.90.34.bc.googleusercontent.com. [34.90.118.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660234f2sm126375166b.12.2026.09.11.14.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:21:13 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 11 Sep 2026 21:21:05 +0000
Subject: [PATCH v2 1/2] dt-bindings: iommu: arm,smmu-v3: Add
 arm,instdata-override property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-arm-smmu-v3-instcfg-override-v2-1-5804e4f400b5@linaro.org>
References: <20260911-arm-smmu-v3-instcfg-override-v2-0-5804e4f400b5@linaro.org>
In-Reply-To: <20260911-arm-smmu-v3-instcfg-override-v2-0-5804e4f400b5@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Pranjal Shrivastava <praan@google.com>, 
 Daniel Mentz <danielmentz@google.com>, Mostafa Saleh <smostafa@google.com>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
 willmcvicker@google.com, jyescas@google.com, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1506;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=tUGaS29lFsJmXAHbJSfhfRBSAtNRDMY5NM3rTaPK0XI=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqpHDHk57NrYBKK636xbBtxQC8tNbhZKUpKQNvp
 K2QlPCh/LCJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaqRwxwAKCRDO6LjWAjRy
 ujZ+D/9tMuGPJ4rap7PJdDNlZUe1EQphmU7tRCCP/H5j5mI5j/BtybzMKyMpMeCjerkf+UTKYCO
 CYDG+K+6mov6T+mBwrtr0OV/soVu59lG+DCmTfa25FF7vHpDRlkOACuS0zygn3411nOr5XNGYKy
 ijLCk9JanRujXZSesqesVLBQP4fspZf2EI6kfZwB4F2bidH5mf7oery6A5avsaDOvuIRiJnPqfS
 8jcBSTwwVpeOrA9JGuuCIukNcTawPWlqJQs2yLraj/tENoamHvfvET+OrWyNEP8ekgjoQIK0FNX
 Mv51GQNIqjFSggDGxgfmEMTTd4LMm8R8xbvh/DU8x2kvNpLnRKfZBrG1IQnQelMwzsLLu1uc2lD
 dUg+whEhSIcd5iVwYHHde+2d5Z2cfbcUNa64+gz+1Di2oxp5Aap0Akpqx/PiviD4H5vdCVj77ID
 QP8Bv6r6UV4S0juavx1X43AvOvexroAdYTnPadqZQtT+OlhMKf8174TVhLgNR1gUBSBFvCnLJlq
 lJvf5hlkcFLIkbU4214oVDm4p0nISi6n0mKC0Ioel7TyyFCF0yfa2gmFG7vG/YMKRPbgVwd/SA1
 5NJGxrU3nldN418CZgg7Qg1LHi8xSPi5EUeE4zYwmLTuHNQsTOuI2CsIEzhd+2W1m1FgUyOmCS4
 QD5KHOaZtDsTSGw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

arm,instdata-override DT property is intended to be used for SMMUs that
have a silicon integration issue with the AxPROT[2] signal always being 1
making all transactions appear as instructions.

Google Tensor G5 (Laguna) is an example of an SoC with this silicon
erratum. The DT property can be specified to enable a software
workaround which overrides the incoming attribute to data.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
---
 Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
index 82957334bea24..3c044e4f03d4e 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
@@ -83,6 +83,16 @@ properties:
       register access with page 0 offsets. Set for Cavium ThunderX2 silicon that
       doesn't support SMMU page1 register space.
 
+  arm,instdata-override:
+    type: boolean
+    description:
+      Some SoCs like Google Tensor G5 (Laguna) have an SMMU integration
+      silicon erratum where AxPROT[2] signal is always 1, making all
+      transactions appear as instructions.
+
+      This property enables a software workaround to override the
+      instruction/data attribute of incoming traffic to data.
+
 allOf:
   - if:
       not:

-- 
2.55.0.1007.g17ff1f9808-goog

