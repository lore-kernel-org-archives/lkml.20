Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA7E47CA68
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254805; cv=none; b=B3BNGJJlQPmNJ7GK5IFBBpaaT64ITpJU4BBbxjnkdNzMJond8Y9dxyt31mYCdgSijbbHTSfYtE2hWJ0kMxsrLU7Dk0afShipdrBEIawJ1ZP2LhYkpgXPsHNLCf2Zr9WzEuao3uvfXN1VbgdIvXc8JGc7w/x/IJwTZaEuA0dhHvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254805; c=relaxed/simple;
	bh=gKbqr+JbhugVzrK4haKucfxH1GbAmaJ/63Ra+8PimmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FJgCwSDPBQoY8Q24dq8yzTPoy0vx9Y+cluwpcH2G4NbWF+E1OLMmOjjhARB18bzW3ftZqztbeK2/bLBT0J6cMedzakeQ3X+DY2Bent5F5eZfIonvb828qn6CUZYQ5/10IQR9W+3GC7MomLI6QggI8BopaE9Ei6C4MvpQmH1Zmbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GzTeYvDB; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GzTeYvDB"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc1e1ff659bso724715a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254803; x=1788859603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=GzTeYvDBKgXDqnAI/yVJ+M3Wxav2Ar/x9LKCOas+qBwun97d7j0uMttwbnBTjcfqBU
         6r+CFazRkXovZ4xkohMOQ9bLhqLp8p6FLyXVX7ZhXDV7rPCvof/g6cTzuuzeu+mFJzxr
         ZZr5RO/qm+3GetnaQcTCcCJQ5AcgJr55rPFmBPUb7dKzcfI6KIPtmqbuIszBNV35GoTE
         RC4RcYpX0GFy3wr6tAjdZ2cuRJspNscgWvkelcN/ABlRXAS/R/AWIcYMoplcTXKNEiqL
         2uL7iSgmFshXFi4IJgyjSif0q6bRC+WLWCRLiFZdanL6vh7dj6IOUlLyUP3+Yd/02cDi
         pHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254803; x=1788859603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=YZBXVq3x/YlIlixgfOJvZ+4UhAI5ZxQLXWxeQ4mp+qsUh8lLCTOXbT59jdyd7s2NyX
         VyWKwbEFvqJuZP2IMs8CUeJG5SKgBYk1oWijLVDIW1tqeRjm5xrv0tGQ0BH8zFCA0jdA
         tMdmoXG06HS+ljKAqgur9jqKfznqT88IxTlN00G5kXEoEvTV8iFKGsOuYX8PKp2Ibof2
         pM8E7oJcZkWSSB09ioigs06MBe5FU+8OyItOfaATfqjtiOPaH5nePdbv7lAyby5tsc3j
         SISyjNATRUKxjrSP442SHyHvHbLOXsK4pBfu3+xto1V2KWUfPMEIUaBbzUyoTp4jXA5G
         Pt6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxlpgZjJq9cMHxxgcpUTjhgQPLHEvoJgXZXSJz550XsqyS2fQZWKABfuBkISWApVJTCDv2JoOwLd4h+38A=@vger.kernel.org
X-Gm-Message-State: AFuF++mSvuD0/Gv8ZH6zX5zFeEpMpRMFps9/NPHkgG3s5riT0hkdO3cx
	CT4Tb4atH3ySoh59u3QgG+PEareTxWKB84fUStpDrTiY7Y3tG9lBSxly
X-Gm-Gg: AYBFou3qTzNYBGGK2O11Uvx+8V3EnVqUagN/ZMdh4e+bbsCl1csc1nMPaNrqLxze9MT
	J2ODb4yOCv5TuDXKTXfw1pqxU+sd2mvRuQ1ZAY0+0KZ5vx+kmGY7Wk9tJhhAIkN+ItAlnLodzBa
	p9vKy0+2gXJlJSKTE+6U7Z8XVG9R94P9exx1yS9Tit+SutkwxRQXXRnu2lq3fqvXTaNSxx0Jt+5
	AlwYjmwCMymR3OQ2AR0u/Ykpjjhv8K/QyUPJzFTsFzD3LZSamvRPDDmbWvsAnVGso6BgVNhIwe1
	L2PK7NcJiCcJOjEjYaHP5jSYsn1NAK1EfqpnDxPKKSx6L7ox7ZCmuze8SfUt4APjGd6aMB9wa2l
	18peCQuZaXEbdw+LazbfaQmTROgsQcz/jZAsCc8qBHTLJqQUMbjc8XhgpHId3lWeIkDB2J8o7cB
	jG0S99agX7zuIKWX1161+0ug7VCgcCV2HPJCmAN/R4Qk7rGMT5yUEfcR5Tshqn7xRZuLFiEqIov
	xjq5COpZnBq
X-Received: by 2002:a17:90b:380b:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-396d0f2391cmr45758593a91.7.1788254802943;
        Tue, 01 Sep 2026 02:26:42 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm30004560eec.4.2026.09.01.02.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:26:42 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 09/12] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Tue,  1 Sep 2026 09:24:44 +0000
Message-ID: <20260901092447.3028-10-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901092447.3028-1-sreeshankar0910@gmail.com>
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f..0cbdb3b2f 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -74,6 +74,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350
-- 
2.43.0

