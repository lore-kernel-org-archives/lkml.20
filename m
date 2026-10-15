Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8A2509F19
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057795; cv=none; b=QOAdFpJKnclxIKsz+pbAt+Z1zPoXF0UEirndl243IzT9QX0JlaZfP4HZrZIWkNc4+4H5lYyqUIajfO+qv6l/ZI5CRafbxPRdzF72wZbzqlTLahgvk8GGiIiAhc6kXbb2TImnyfHCMP3bxKM8eWWkziI5PjN8ZFLImOY3q8s7TPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057795; c=relaxed/simple;
	bh=Y5mDqQIodgDg69CwquzDO95nLQX1pocUdt6jGCRougk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WVAtEoil2Bxxbmozl0CIXdqSmqKu0f9oYH0M9NDAUXEttTjoSRJxguqJ+y4+nM3g3k98Dqf55odh8Y4BLW/tiiq8KFyUYd2u9l8SXHcWp6B+v/ngb6Z1qSeziSPTy6cZWgMECYVrla/exNNvuPW8gwSuBHNhG1YXiI3HeaA54ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=KSFv9BXW; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="KSFv9BXW"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a01933b584so43562925e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1792057791; x=1792662591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6tngli+sbclxXmwFOjyHw6Lpl/UDG64/d2I1Pa40mIM=;
        b=KSFv9BXWovBKAYr1N+MCRkZ9LSjI2bW0NIqEIeo7BLLzybgi+U2/tRw5jWYlvOc24a
         EKmAafpQ1YB71dvhBXHrwMFr0G2sw8lwTnUkLMhmcct7tM2WeJnFIsWMEn8EIh3mISCm
         pJLhZ5QCi64mDnpstJly+hkmKn32sENY31ruydTfhjzLZNkf4ic7cxd+wT8FLuUr0Lt7
         ZNxz2yIS9blwbmooerWwLRoXnGeOAiuD8HSfxx69A8FxE2Wt3gBBFfL9yRM6dGahCF7h
         cgS+MrC8maea8JOBGeG6poXTUNcePXNt28nFZ4V1Wuk7KBRMGiChdFquN+bpssg+rBrg
         4w7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057791; x=1792662591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6tngli+sbclxXmwFOjyHw6Lpl/UDG64/d2I1Pa40mIM=;
        b=fqIZ1Rl9d0JsK58XZPpc7GI0awY5OOuRAxzRqy/LN51ZECp8PMV/BSBM8lYCbAX5Pk
         2ocyU9rt3C430smrjDmvmEh/REFFmMmmSRbMkGe+JDgpnECc0OKIYl+4L6m97Edufi3V
         N6g44VvycxlKsp4T0n0BXjG53hTya6+ITvXfsdjht6KYDwNvikDVm3yKHrEOIp1hcVIC
         2jnasr8Ec411xpY7WG1/xW8ussqb/GWsDOsTOUEtwiqrddk2lvalZFQuAF1HGXPnMGMD
         8SBn0EAHy2y4olMHxXcS+urynL8uhS5xYYKNbzgIEs6U81vUlUBt8lmzlNEMibVtQpZ0
         IAww==
X-Forwarded-Encrypted: i=1; AKwUvByXF87Ww18gzRGcSdeaR3iC6/KQPCjRPl9yDDFnLWzUnq8hTyVwqjjHm3Mac0evIS0hZxAUdr50xmTtE7Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTEkvgTo+hxnBlIjGSQVaUZ6BAkHkTrWMl+b+FZMYD4CjCbiSI
	F3+xDqJ3CdCLzAvcl/tg+1/WdeQVadwxfo0SN+x8gR+sxzuQKtT9FtnqcYA0vuoKfHM=
X-Gm-Gg: AYBFou3dBA2MSnh3pfBpyySyYjobuSbutIW+oz30Dsr7FwYWD/2JI2c8hS4kh8Ms4By
	kzECfvYS6twsTC+RJsrBsj+4JVJjoTuxi/Me690A+04psbv/3d3Esh3uAo8dpZiH2HWHw8wNCoq
	ooMKoppBBTcx6wf5aUq8s9YKQTVxIG1V3GWFk8Ne/U8k/1/Rccd/ZD3xLwS22P21tLkKxdfJQva
	g995Y3ZthdHWNuC2k6+DqF7amqUAoQox80bEQ9Sl/AhAG/bvF79yvwJykZQSCS2rwgzQ+p6Itz5
	rsrvd6kPhSSaPZHf5Vz7v+OFDX2Wbcst2RzUzbnGnCb3uIDRqG3gR3iIuVzTSFeICl7Hj+xqIYG
	dcJhd5sLQAf5qSllJdyCAv0n+W3wl2s2aA1AvPSJSUVz5wXTWrDjx0myf0wwMm8EeUpgHtOPWa7
	eYJwWXpBV8CxpP0sw0AsLJHF57FhKYESm2kgofsJwBdBkdyIU/lq77YLUVUOGgFUJnLGCm+xe58
	waLYvNA8b5SgowINCrqOIkD61a8656j+O2d02FGmsQ25HTMqOlbsreLAWie4987OHg/eP96AjDU
	XzQNqsGsVp4EohKDxnkhukk3anwD9Tc3WKEtnQ==
X-Received: by 2002:a05:600c:6384:b0:4a1:7741:ec43 with SMTP id 5b1f17b1804b1-4a18e4b8966mr345613225e9.26.1792057791376;
        Thu, 15 Oct 2026 02:49:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:273c:cd01:737a:1f7b:d586:a293])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc85b1sm16926246f8f.54.2026.10.15.02.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:49:51 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Thu, 15 Oct 2026 10:49:30 +0100
Subject: [PATCH v3 1/3] dt-bindings: media: qcom,sm8550-camss: Add the CSI
 TPG regions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sm8550-camss-tpg-v3-1-00fe06a3c557@imd-tec.com>
References: <20261015-sm8550-camss-tpg-v3-0-00fe06a3c557@imd-tec.com>
In-Reply-To: <20261015-sm8550-camss-tpg-v3-0-00fe06a3c557@imd-tec.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

SM8550 has three CSI test pattern generators next to the CSIPHYs.
Allow their register regions as optional trailing entries.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 .../devicetree/bindings/media/qcom,sm8550-camss.yaml    | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
index 4b9ab1352e91..683a19a1f288 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
@@ -17,7 +17,8 @@ properties:
     const: qcom,sm8550-camss
 
   reg:
-    maxItems: 19
+    minItems: 19
+    maxItems: 22
 
   reg-names:
     items:
@@ -40,6 +41,10 @@ properties:
       - const: vfe2
       - const: vfe_lite0
       - const: vfe_lite1
+      - const: csitpg0
+      - const: csitpg1
+      - const: csitpg2
+    minItems: 19
 
   clocks:
     maxItems: 36
@@ -424,7 +429,10 @@ examples:
                   <0 0x0ac71000 0 0xf000>,
                   <0 0x0ac80000 0 0xf000>,
                   <0 0x0accb000 0 0x1800>,
-                  <0 0x0accf000 0 0x1800>;
+                  <0 0x0accf000 0 0x1800>,
+                  <0 0x0acf6000 0 0x400>,
+                  <0 0x0acf7000 0 0x400>,
+                  <0 0x0acf8000 0 0x400>;
             reg-names = "csid0",
                         "csid1",
                         "csid2",
@@ -443,7 +451,10 @@ examples:
                         "vfe1",
                         "vfe2",
                         "vfe_lite0",
-                        "vfe_lite1";
+                        "vfe_lite1",
+                        "csitpg0",
+                        "csitpg1",
+                        "csitpg2";
 
             clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
                      <&camcc CAM_CC_CPAS_AHB_CLK>,

-- 
2.43.0

