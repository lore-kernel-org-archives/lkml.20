Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0254E2F1A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651243; cv=none; b=g2/POytrjMny4rr2PENUIrzsSpZqe1EXdBpj1zVo3b7koSMqZUNgVcH+6gJAGaWBqURo0WTZlyfzn+cUqOhDSWx9al7Ap4XvS3pBUmDl2xMPjHPmoWuCu3ZRTGCeJQF/o/ylLH2ILDsuOMXj+7pOHP6KcR3mAckJdF7gST1XEqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651243; c=relaxed/simple;
	bh=+aqwF76bmGuoROezb+nvEDmDHsS/wS2MOU1mkrZoh44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kdy38W/ezFi549t4BMneSCisq9yAIvQl9Hhoho0sz+i6xFWgvZha7wSBtBcIN6a5NovX0rplh5/UdFV7U3uH8uMOMhr1p5kiXthYmsv1/K6ClHlM/GqIK9dP+ZqyIXWSgKUWr0LSqe6+1HWpW692TqWTnGPgJzojnalHV7UveLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=onRWxRhk; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="onRWxRhk"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ef15c1so102787866b.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789651239; x=1790256039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sw8narYg57G2c3SebOo4F7LFE05D5g/xxty2317u7/0=;
        b=onRWxRhkBmLoeIk7AoWyZJ57JoMiew7zt51QbTSh8GV8cUtHpmRLQPUVJLsKBI0MXQ
         Buo+SgGX5vHqp+VESS3IvNmDg6p5JTJ6YlCQoQrPVWt9dj2LSSKcPgKk5uWiNZylg+ws
         yDK4zpvZXLH5Uqb18sQxCIku+14GCtPAbu5MbM3IE3bh/kPh6V+Wknas0sVp0/Cb0Tas
         +iMlGZ/SHanv1gD+6bjqurUqDyqFfZkiwS066FomwbG/cLghYaxBMngP7ZfIRUkyJxC2
         j9kG9lLcF0NKKc0D33A0tIRwLbcGOGQ2IfCO7w6sKm+19ZY1pNnpmi1VNE/bXbZgmA29
         JN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651239; x=1790256039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sw8narYg57G2c3SebOo4F7LFE05D5g/xxty2317u7/0=;
        b=vm4LFhUpKOy86KuLVY4zibAMLvx7xwys0RErWAhrai2wudV3Oha0Z3SoYcY5wAIkxv
         8RIsa32J0Ba+JxXtieEYtF6O1BkHKrhO5qwAruP9qOQR2qQ5iS5pBa9MHYtBxnAQo2dd
         ioMUWTzdH/x8XaO6eLUBr3ibc9TUxLWH7q63j5XjjSgiT9JOxExXJRptvOBb9G9X5z/k
         ZCHGXS/3cWPjx2Nk+jyawCi9FB1FTPDuJ+vseXbBZJoLDpNooMgTXT5QZ5CyhSvS5psl
         mWEKC50cYPGPKmfjx212F0YS1wyUXgbZcKh9RLRVaFG2ClCB088numnWYSTAvbsIDyWP
         mb9w==
X-Forwarded-Encrypted: i=1; AKwUvBxSb5NiG5qLV30ge6oMlhMNqtSqzjyy4CbBjJmv6sdMyvwnXcs7cSPMYVH7ntNM6jf9I2p+kvAe4cvkIxY=@vger.kernel.org
X-Gm-Message-State: AFuF++kyixL2r5AysEsIYcvMW1xD6LCD/KEgiOKl7m8oTtn68nGaMBO3
	0GBGrHHpVXeAqmolP99VpWCy37hUDlMX56fneTW026L9XS+RY3ZJ//nctHFKfmrVfPY=
X-Gm-Gg: AYBFou2La3RntFgnri8cuHFtHDvZs4BHtDl7djCH9+LpEz2J9RYvSTLU99lZG4+hXm9
	4ouNMj5+sl0YDtIMvYY3uf8GoQxfJibFUHEm5ZJ565o4UnHL7EmWx5P05e2Wa2ZFDAwvf8i6CEf
	sfwhB8eXysiw4gt6jLXpPzSOm6wCrN3ms4/r2bXMwy42wIUT0QqQu3nJQl1FajloRZ4byY9lIyh
	regbcmqX1h6krKmXOgoVlAsGVZ6ym2VhWjnKf/u8rtDsZiZX5qrVZZXHAci/ax7krH6Eu6rndUh
	+3cI9bWSTbnP6vTDnysB3Z7YGBWjtNawnE3KyS8JOdZ7uyOvKREHG166dp7Z0cma4bttH0o+rYs
	bji+7aH5reIJMn9LHkLZ0cpdT+7d+8EOjyCkeBiFRtpN3K/Q+5SD1BrCbdjnq5aOz926wmc2jH9
	eKvFhLGDO2pyjrGeegoTRH0rtJXyIWqyczIrBhOGLbtdDttMCH84LxXU3+Ng5VA//ImlbsE7e+X
	XRu5v+VVQ==
X-Received: by 2002:a17:907:1c91:b0:c29:462b:f908 with SMTP id a640c23a62f3a-c29e51fdf44mr464817966b.10.1789651238738;
        Thu, 17 Sep 2026 06:20:38 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5e4ca9sm279681166b.42.2026.09.17.06.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:20:38 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Sep 2026 14:20:27 +0100
Subject: [PATCH v7 02/12] dt-bindings: media: qcom,x1e80100-camss: Make
 vdd-csiphy supplies optional
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-x1e-camss-csi2-phy-dtsi-v7-2-1a63eb35838b@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=+aqwF76bmGuoROezb+nvEDmDHsS/wS2MOU1mkrZoh44=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqq+kfxyMPRBkR6ZgYigY7HJmqBr6TOfNnZIae+
 yb/gGHhIgaJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaqvpHwAKCRAicTuzoY3I
 OvMVEAC3F1/ReQshCg4ujnXh0OrkiBZnbMg6YvIdbK9ETJoVbEI0yM5IUyo+H/XVSTwBqe99dRf
 Hm+djDmfVGxQ3d3IEY2d3Q3bCY4XyNYlMJmB+3kMbWRHtChNeTdgDguXNneqyic4GtjlPHDvRTT
 pbQO6SGRNNP/bmkKaZtNNxjZ09qxrfomtEuv6ETZtGiic8+rL0adknMXboWRnVt0wDG4VQPnrBJ
 YNhNBPp/MGdUWz1xBVw0t7aQe37YkzWC4bkvVd7HpBJHIRPsmnf6LZgcLD0JjsoKzNCvrdI1OOW
 yeFWI1BM0kSINqnfczC5n0pr4Fyo18OQYQhZ5GcBmHu0trIQfs2yfV8YS4WN9H7hBGoUMKlmhd0
 TvuXfXm/7A43NT9GRByDYQYGJHd5kHhL+rut0TTP3+jR+8tTrNHEsduJ+ESulQj5RDRv9MH71ho
 HyvvNKDxAst2A7y2579HTG8ezUsLBeQrbVmSH6+ngSmRXgMqdpHqra/lXetTWPdz6e1yy94OMdi
 0J9LUN2qrBfZREkaLJ03cj6UJQmUonFygJ9U/ojh6nrtu8uh1UysEdBmYnbmgsWEjVW7tBflT/Q
 wbz4hI1YPy0/76u+vA22+ytTMEOsMN5B7yjg4gxYrUU1Msb9n3gm4/E3e+Ldf4UNRctQum1Z4mA
 G0X0hxKrHRjSTew==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

The vdd-csiphy supplies power the CSIPHY blocks. CSIPHYs may be
described as standalone phy nodes carrying their own supplies, in which
case the CAMSS node has none. Make the supplies optional; existing DTS
remain valid.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 126400772d028..57a838fe2d229 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -186,8 +186,6 @@ required:
   - iommus
   - power-domains
   - power-domain-names
-  - vdd-csiphy-0p8-supply
-  - vdd-csiphy-1p2-supply
   - ports
 
 additionalProperties: false

-- 
2.55.0

