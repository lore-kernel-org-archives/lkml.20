Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E2653A3B0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790076524; cv=none; b=EqvOZS3H6B5F6ER8fEBdRLQMn5qzIoc03TI4LFXX+TKEx5dtUzkVLYv+0rnTu6SWCrenNm0E3uTSIgN8jrpz+eaoVGP/rlqyOZOcDQREk7lgri0En6fOaWVLKryZWHXR9S3WBZB9GiSAjqnUx0xJ2/VKBF2qb7Wv94xvmBgIP6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790076524; c=relaxed/simple;
	bh=DRDBx8uJu/gmNOt8neF/NrrQZ8Y1qYuByeAf3Z74Z9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pBxqQDj09MSvYPur814KaewUo1Pawtxza8nyKBAk4PBa5TIBMUHv8yUkdeT/XYtVWCyYnHsF9mR0mgdeo6Jy3Wf2j9/w6NXPDeu0E9n2aLzBtoN3biODgOR0VvJALcZp9Y3/WWLZnnDIzLS7rlU0m8cjY/Q+YnQ7dbEmWjhaBiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rbU6YrFG; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rbU6YrFG"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso19640335e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790076519; x=1790681319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZcSVYTseMvcfqltwTfiGnUkc5ciw/nLJHbubGeUkOo=;
        b=rbU6YrFGbcjNEkfvefVv1fNf2f+5oRulBJQeyLfjyYn/IP/MoyEPatuwdGg8mfJgWO
         QoW0creJTfScZfE5h2WIETa5yMjxHFaicQ2S6Fdo3sc6atTLJqtLxZerl/3DzherM6Zl
         +OW4HbWQuWQPPS897xntWgGGg+sbh7DrYSmlEC2UKGzb57eLFBt84lvhYIzlxIKxFV9k
         MqQKxpCZg+ttyOO87H4hkk6K+Ti/kTzm1EVOdbGQu/XIqUeyHEJtIeyzAI1HAvW7QOJi
         x+wC9EatA3rII2FiEMZ45c+kw2BoaNuwFJ+L+F+7l7VCkHmUQpvU5tDGUZAC4tYEvWz8
         CHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790076519; x=1790681319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZcSVYTseMvcfqltwTfiGnUkc5ciw/nLJHbubGeUkOo=;
        b=2EkTR+hnMO9KvqkjCcIlrWg9qPej57D4SuJrFHZg/bWCVEOonJdVNW/xph7N5cMTyI
         16qpRazqLWEkDSy3DVtMKyE0dVuwe6B7Z+1zMb3FhNWpw98c/nLHxrm8FojXlMWVA4g0
         t2W/s75a1D3fFjLV2z1bQ7W90OK0PL1frVs7icfPwvRmXedgKLSx+L47znyT69IlzKxj
         tr4qhmQ54cDKzS4DTE3dkV5yKFSWxONj8Hv7B7Fz9wmZ4E0VFJ3f1VG1BV3WkCJ9NBp4
         OCCimIFqkYc5Y3g+saccEOeSB1g1iRHbK1UJcNJH40Fmfua3+4dTBgjrwTkdfzDNKrsV
         JGlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxi4xWI5gB+cQpw5i0uB+6MdBoKa2q3TH9bhVhz9gCvJocXVq0x3uDMyuiL1T9zqsId2jzGXjUVpzebtjM=@vger.kernel.org
X-Gm-Message-State: AFuF++m6fMnMxQ9S8r1HzmLFMKfw34xZ75hryiNXsJbGjRJUlCd1shwI
	BsguB/Qo9X1GYH6bMGLaFIvjAcs4u27zrugkM8TJVQtEivpYt+gZ06qpDTGoyxgk/Tk=
X-Gm-Gg: AYBFou0jN0qLTC6mbwgJkYtzn7ZsDqKMl2tyS5VY2lIfvPYClWyqJhL8ENfBLuy4lfP
	KW8BHh4AkYnGr8qeF2zz9jD0iAGic5kkRZZsj6hyynFBA7Arh0AebUuwHaNOrqDMXlNKu1BOu0w
	EHRg1M57alzygylwbPajvFfQpJSVPw3kfoZ5AKw33lUifS4FaKr2XFYQ1DfTNvrbAIJ0R6CowJ/
	IuD3BobDJ8qTDc9dPEQkZoJNAIY4G8VOHTt2/+HonJ7YcuKPLrVkKylMlcD67wD77QbnWOHCOs5
	yFHmpQDb8ipNNa3Vc7gDBATUOwSGRLDs1Pb+8rzrXwX801bNuvJ/3KPsMPmHS8scoJZLxyySCCS
	KkZ+kHQB3M5AekGHUgXpl4rBkEfycQlhKNntdIpjLZu6DfDW+KXXbSahoAvMrfpXLZy9AoYEIvr
	QN0jVS2+RbXwMLHth3xThN/NBjScoL2aK0ckZsmT/oPSnRjLWUdJNl9Hn9mfbekbY3W7FGUWFYd
	xwmVKhexN4MTDUu0BA=
X-Received: by 2002:a05:600c:3584:b0:49d:286:83d5 with SMTP id 5b1f17b1804b1-49fc5722755mr248984825e9.13.1790076519490;
        Tue, 22 Sep 2026 04:28:39 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdab0e46fsm6687485e9.3.2026.09.22.04.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 04:28:39 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 22 Sep 2026 13:28:35 +0200
Subject: [PATCH 1/2] dt-bindings: arm: qcom: document the Valve Deckard
 headset
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-topic-sm8650-deckard-initial-dt-v1-1-c25e7759d04a@linaro.org>
References: <20260922-topic-sm8650-deckard-initial-dt-v1-0-c25e7759d04a@linaro.org>
In-Reply-To: <20260922-topic-sm8650-deckard-initial-dt-v1-0-c25e7759d04a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=811;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=DRDBx8uJu/gmNOt8neF/NrrQZ8Y1qYuByeAf3Z74Z9c=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqsmZlyJKDWoV2ssgh24kWwz2H/hQYohfE8pwcdwwS
 59II9b+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCarJmZQAKCRB33NvayMhJ0fIlEA
 CsJCKN3Knnm5FXJGJ8YaA84ahFOOo1s8QDCQqFythWfxOblnDtLd7HvZyGyRotxb50HCXZDUIz3Got
 ebTqZs+D9jzUERH5lYO5eDq226etSqv4wQNJxqCAqfue5tdeYXhr2yyeJe29yhDejz0vHfSdYCWdcN
 GiG5qvhVzUYksSEutSnDFW/elIpBkOhTrQfJoA3VbGWgi5kiQmEyJ1aGFSTFBnvqXqOZgYJYraawGi
 nYHwLz3+kD9LtG4Pa4MZ5qw/fVVSvlSSraSfHZhhv46xMiEY25rOr1Wmi9Z7yR+s5aisZ7o1Dg6M7i
 MR9d0R+JjoKMSvThMLr2XR9oY3ivgOwpUgfZAA7B3VejWp4g8kVo7i9cOzUjV6YrQNx6vwMSMOcEXV
 7DNDifKRNG9gxXR/zWgHa4Jjs3Rz9b7jFJ1retp3veE9UJXmzu/LFZSrU1iaHG1nMWE2hQuvRmfw4d
 hKZTuiGxMI+9UKe/oTzMtrsgFmEYjdNxGREEharOs+I14umUUvjZljz7pI7IzjEoWEXTAI4Szb2+Kj
 GGp3Y+wQEMueCRzpwWhOkrWPKpnYac8EyvkfGiWAB7SJ+VVMDjHehmACF8M/Bp58f3pore44M1ITO7
 +900hzU6EZX4+Qi678Wng/Lti9pGUKyyiLW+H/EorD+YpavsBJNfK6WN/89g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Valve "Steam Frame" codename Deckard.
The Steam Frame is a virtual reality headset based on the
Qualcomm Snapdragon 8 Gen 3 SoC (SM8650).

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..0130bf93987c 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1164,6 +1164,7 @@ properties:
               - qcom,sm8650-hdk
               - qcom,sm8650-mtp
               - qcom,sm8650-qrd
+              - valve,deckard
           - const: qcom,sm8650
 
       - items:

-- 
2.34.1

