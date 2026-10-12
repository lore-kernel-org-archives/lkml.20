Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3358E345EBE
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810206; cv=none; b=tA+lLeNzM0w9AR0vaAngF1WvqbS0kBXCBHtTjBmiqo4GQml/FIMSdGeMcQBT49z7mXoNIlKbH7yuNvWPhRdR/zrHjLkXiHLW2FqIwTH+FnnifFj4ngvg3P6NTj0VrP3IM+1ZytVuuvkkB+y+r8vzrlgXpYL932R62gOlPMgQi8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810206; c=relaxed/simple;
	bh=81EjrDsuc5jeR02Yg18zw0dlV7+6SEPswLXQ0dSABZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MysjSYqNRcDW5nBc/QAwH9AFvYsmx2zkCypcesSeO9EQO3mSs871pn/F0aMoDj2wJafjFbWiLV850hnmePm08ppZvLT5PWSgkD9DYkCiaklDgDnfxmgSZ+G4xdLuMHfWOc/k8Jawjd4kkJ3OsFipMpe9zjVFSTOI5L4BgUTemCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=VJKWhq/d; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="VJKWhq/d"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c6955a7c3so364877f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791810203; x=1792415003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uDN4rkDRcDd7KJm9/0ncoICuBmRQ5PhNK4vBzfJMTiU=;
        b=VJKWhq/dPlPAYhObQPgYLrOSF5wkt6j6sdx4WBolJJbFIhmPQ5hCmwNd9BqEcZ+h+I
         5Uo92QLMrWy9XCcg6NlnueIThKOYkwXdxavoYmH+VK47pAtrxfZSDQFKUf8qlZ61GEn2
         LNynWiHzTMiCvrxO72PwEQ2XpllgUViuHfzMh1YY9jATZUxMroIJpnB8joy1khcKBiqj
         ProqseWSlmhg/kWq6452scCnxVasI3IWKpI8wqX1PSpdK6br/XShHsVgSwHo9qLUkced
         WZGPT9ZfAlhWgnktipgSCE3uVrEQQdioyH6+IYuicln2GjeyPja4Qdf8WIDDqPeC5t/m
         ZRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810203; x=1792415003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uDN4rkDRcDd7KJm9/0ncoICuBmRQ5PhNK4vBzfJMTiU=;
        b=eJByZcJaOt1egB7BShnaxYLOgh6KWfFBm8rZoC7ddc2SC5vmj/PtWn9wnEQTmsFrHg
         VJAqV6Ozf7lKySoK2gNxHnYxwYj3svZ0htYbOxj//Pc3OOk9t6vnjtw9lB0CfNnmPq82
         irFeAm9hXTdr71k6qA3rLQgrbE+UboNJxj31dxcknEkppAQ6HlLAANhcUKzR7920h6W3
         taZocg19ivkG1QXLJyx1ByETDhkIeHF6sTAR/LR8nG3ZliysoRUAuesdAIENZldl7+JQ
         fbHYy7E4/08aEJni04FhgWS32zED9AVbWPsLEGzU3nY3HxHYtl5B2LQH9aLddlsQtNdz
         rfRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMYfzT7QZcQnUgBo3fz6koCbFsfqPzGbf+uQ+pUIw4o06GebEA3ourvEyxE8oC79vh56yBEUw8FJPjw8s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbf6hQwu56uQabJrr3zQaXFXSByVz7CY4hWXyAd73lq7KCH4LR
	vJmOBhtvKpL7LwnlgHGDkxvvBKkgMISYSVArTJvr815aC25XEwxGNKYoCRs3jQiaGu0=
X-Gm-Gg: AYBFou3XahroATPNa9eFBA4X9TfIV9Qq7mXy+Z2dLMefV2DRRRKQlQdexT0RbvFI1E0
	2ip4BGVtr3Rtrin65phMH1S3ENDaiQCYQRMBMChFqeP1YBxjjf7c4QXHd/SDx/Z6t2VOWvvWx0R
	leWElenmeobrYlNQ7CzpI9hAkeo7Y2duf8oOc3AxJaCyyFkNvC54P1c1kjdRz/sYqNZJndKUGlT
	LX8QQcKr4/iymZbvQq+jYZM66Rq7bfnTRdYQd2uHXu0KYzf4D21UgszDzctOtVgBkpi6d1SYajH
	i5fG24ACND8YUWexRyTR/FexhHmWWEZdEUOFKK9MqeAVYpKEZKJlneHL/pAMgRx21TNh68emdSL
	s86k2ck0HY1XuCsgcfov7xKA7RdWGOnjkp49jrAr5izoK7tBx9HirHFDUFdESRTuZEvVC3ry/We
	//5c5iOAV+8hxAdeIs3/7nMl+f0LIynJjhEtPODVPiunfk5Dc7IIGxEiLlw2iCwnfk5PikKDpnC
	iW+8C8ssl6ZwIltAj67gZ4jqm2+kNZwsKWbX9PGttFjvuopiaijQQOQ8XgCKzbcLV+WxBGbznVl
	Bnkz0B1zSrGRmbBtXLz0OwKGMVLweRo6
X-Received: by 2002:a05:6000:2212:b0:48c:5cf9:88d6 with SMTP id ffacd0b85a97d-48dba7bea17mr17686645f8f.2.1791810203273;
        Mon, 12 Oct 2026 06:03:23 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abdaa5sm20088782f8f.35.2026.10.12.06.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:03:21 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Mon, 12 Oct 2026 14:03:03 +0100
Subject: [PATCH 1/3] dt-bindings: media: qcom,sm8550-camss: Add the CSI TPG
 regions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sm8550-camss-tpg-v1-1-620ab6f151dd@imd-tec.com>
References: <20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com>
In-Reply-To: <20261012-sm8550-camss-tpg-v1-0-620ab6f151dd@imd-tec.com>
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
 Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-camss.yaml
index 4b9ab1352e91..05101dc97711 100644
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

-- 
2.43.0

