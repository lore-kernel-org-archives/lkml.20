Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3122B46D54F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984298; cv=none; b=Y377JX7mKMMvZsk7+GaxA+TXoaByEdps8Pz1X9z07iKKo6XzyMvBt1n/HVg/lEn/Ac0mtTXCkSijLfyXuE6nKqDM3XSAYy42n7CrKrXOYKu3PNAodoMXIbvsx2UAleMnyTYWFIo4Hbpgrc64taCLx0FFK6QvdiIvupveVPGWpm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984298; c=relaxed/simple;
	bh=pCk2J+fgptwUO4ZKmoJEpMZTEt2qL0pw+tfe5x+LU3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uns1DERPjaTedArvNFD22+jsp8pCGGaijRhJlyuNz0DjzxEazg9krSApTY3dOTzKd5kK8vTledr9JMcf7irkTxNT3xFhnFbnn0sTxMOQj8D8JX2mDp7oHIwqudlF28RF3eWSURe/Shl4OOptThS8dg3UlXC6XUpcXrJT+AUf5rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UX/jzr+r; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UX/jzr+r"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so27405925e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789984295; x=1790589095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r05tTilDhW1mEwckTpWxKtNRtIR6JTrQLuNfaUJ+HZk=;
        b=UX/jzr+rLEUggisfIcql3SlkHjiHdQw23gCjbHwBTndwEyoj6FGx7xtV1oksyyFpAM
         5+R12JDBmBXjlJHsbtdv712pcw9Dh3rfKCyVaPYwP5AkCVJogHTvGCeOtZACNElLPPW8
         6cK7OjCi9yUGNe4xFLv8vPPJC2gNCTlaN6cOXmlED3MN5S+6Ok3KRh4cVJt624UvJ34p
         g0Va5FJz90sLlu8mgDYMUQoUI5NgRJxzZMeWH1oMMlEwbFZjHMVK+6d7DNq5VoRDLfJE
         3fBu7x2ZpZ+Kh5xpG6HvTcf6ry64mi2tDyE4EhLU35YnwlFvtvf12n2D8R8d6s1RPpqa
         ciJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984295; x=1790589095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r05tTilDhW1mEwckTpWxKtNRtIR6JTrQLuNfaUJ+HZk=;
        b=kq/8qVD4SU6MvzDkDD04vHgf9PAcA+FYwWMPRT0bobro9cxiopXoqLfPnYTZvER3Wv
         kF8QHRQDl1rsBFKIpY3u1igmuaXU0WYi2ncLA2ea8tx2prbkyt6fEmKrRRoU/kNb5QAz
         gr1+2f+xzg7qYj4SiE5gT3MowkhL/GV6mzmWNyb+Ty/hbEpuV/1Z7FQCCoOxBfDyQbwP
         lTR7pICVOFXo7O0UDB14CtpXFJAFppueml0Xm5mJUAyJcRqov0rw4UQvY4HyyXXbRcbJ
         gqxy2ssrY7U0q5LDrI2AOfIxoYoym1Y5pAEsPsn9pTDeZG86ErVUkt7InoZTvQcZMHYf
         4ymg==
X-Forwarded-Encrypted: i=1; AKwUvBxNhXOrYr4RLKd/gxef2vpcB0FSfBqVgO2kkTofOCqohswmVu5cKg4C2EEXpuwODlHPgIDWZ1KpFeG4dXI=@vger.kernel.org
X-Gm-Message-State: AFuF++l9tKBAX4yUnvqrRffMwEykT6+pvxWH1enXLbKm38h5iE+KGPZ5
	ZKa/nnNaN5bnqD+esLPbkJHX8uk7Xzi8+bX5UdauffISoYgsvLN6YJKmacZjt9CDyJA=
X-Gm-Gg: AYBFou0jEdL/M7hXinj0Ar0/ZN5R8fG4yOD5hrhFT+W/1A4cgcMjo1ppRDsBuo0cgr0
	DBbz/q1+B4t6N8oXXqn7wcB+/pEoE7Oc05a7naS/HkOPDZyZMQ4ExlL4Kbbf67+rPjMDwAstBUa
	oeVQIIkhBC4w99fUiTEWWhnVblEsWF0Va3MuOZskIDAp4dfAcLkCGDZCLXfI4MhbYX6PQJbJJSb
	xlAi1l2YjnSvo9hqP5ulCRSThWHEpkM6rOsJeinMXEKBtGoNI4rLsIq46pl1TIyuh6i0fL59vZY
	9GHuvO4bRfYiWiRvkXsudEZFeCHqDhl7/eQVaoNN+nM0QODtHLb4zDUe3iq8qqYsa/XHWHQUUBt
	OzOwQB92E53HaIkvyB29DyKcypTQ7dGl0/IOwDx1NQFrKqprmTVpHKofVqVRzMAz+VkQtNsfo1m
	LoZLgN0XJFuMtgy86/frzoWB746nS3jBjEFegWX52pmp9PVEULZXBwhsbimfdWXzFR2xCL3EeMj
	lJQu6R75PptHkfuhiMNnNSUdyw3yvg=
X-Received: by 2002:a05:600c:8518:b0:49d:28c4:b304 with SMTP id 5b1f17b1804b1-49fc5741563mr151069775e9.29.1789984295217;
        Mon, 21 Sep 2026 02:51:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd03fe55sm254330365e9.2.2026.09.21.02.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:51:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 21 Sep 2026 11:51:30 +0200
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add vendor prefix for
 Nexperia B.V.
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-topic-sm8x50-nex10000ub-v2-1-eeeaf9b0c913@linaro.org>
References: <20260921-topic-sm8x50-nex10000ub-v2-0-eeeaf9b0c913@linaro.org>
In-Reply-To: <20260921-topic-sm8x50-nex10000ub-v2-0-eeeaf9b0c913@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=863;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=pCk2J+fgptwUO4ZKmoJEpMZTEt2qL0pw+tfe5x+LU3Y=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqsP4kn+i7QDYzFQK9AJldHJpt0k7kboBMnFIuviIu
 NlKp0OSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCarD+JAAKCRB33NvayMhJ0aI5D/
 0bld5/uI/Qv6blo/iae1l4nF+nV+njaeOX0ZnOnFAxToMdY4kNQaPDMTLbs9qGSqC/2O9Ugjrbw9+Y
 c65rs4Ez/6yrox2g3S5/R2x2HbTS/TyhfzYwTcD5dylKxKhPKmV8Oden5rNhs8w7qjnToQe1lRVy4X
 XH84bGXccG1K2dvuTyOuindeh/qs0XR2UD3rHqCP3L1xBNWKHAoqguQFxWyBSUTc/UBVfoEbqjsBNJ
 Ccev4BmMBpXm+GpfOBlPOfZVu9+cinnefVRo+pVUTTVuVIT0WtU6e/ygPbpTX6I78tGoXr4tVeeoEP
 HQm6Jq+VNT713ETQspWX2LUQcm1FIu9e+OHKqUR59atUO3+5HjsIxSQFfxCstf/FhbhGgP5auCGVsL
 M/9yMNzP0pVVBTX4wiXDOnIsL3/AyzmUpfUF04Slzh8m4ruY/QUUCXDmvIcYbBBRPMSiC4PNRv39d0
 Y1FydLKu+HJg8sq1/ObWV+cVcRCB6eJPWm120aOebO7mKW5g5/fnwiEsYL5kbds8j4GBjzkPWRH0yQ
 z+o30Pmtg8b7VA29w4nHFDGXCpzyQtejN2FEpYhHFR8aOEaKuTIEmMzTkVno1rTGwwrOdpnsOy3rjt
 MB2k5V0V+22i3AMGvm8JwdEC/d3fozCJ7aXWGzokZLU5uTPk6knKp9hoWBkA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the vendor prefix for the semiconductor company Nexperia B.V.

The company website is https://www.nexperia.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..9103ced78b91 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1192,6 +1192,8 @@ patternProperties:
     description: New Vision Display (Shenzhen) Co., Ltd.
   "^nexbox,.*":
     description: Nexbox
+  "^nexperia,.*":
+    description: Nexperia B.V.
   "^nextthing,.*":
     description: Next Thing Co.
   "^ni,.*":

-- 
2.34.1

