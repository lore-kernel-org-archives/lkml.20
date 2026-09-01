Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33CF43DA20
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246548; cv=none; b=qgbmiB7+4vpMiEdwRecnDyDrnAnof1nRbMR/OA/2IEBhm9p/9oqkYDpfgQamelQ76LcFkZB7aQnYdLUlQvpPc2uJsazz7m9Vo5LHSgN6U8sPjnpCKQJO6ajHK1VH4/DTQfD5Nw64ism4uEvLY1FzalUk035eS9UqRi0vffYXs98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246548; c=relaxed/simple;
	bh=gKbqr+JbhugVzrK4haKucfxH1GbAmaJ/63Ra+8PimmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pYRFxnelODW0++sLm3bE6qqcjeiYOS7jm21mc36YoMkk0cC8fLq79F7/UpIopLWoJgwbCn70iDWvNP5EBQN1rq3Qczk0cULMViVcKYkUEgkkJPZuznRo9gx2hUrgGI7jfR5iTQdPjnBmV2RLF+iFBtmjDRBXNR26z2S/yepDsag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Phe2JqIW; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Phe2JqIW"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d8f265cbe6so4930275ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246543; x=1788851343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=Phe2JqIWVhkcmHMVwV4x2jf2mFz8ddFaX6MdeHWdvR/6x5yIqugoX1/+4DNNjJSft2
         X/SeOAojkzak60UQ4rU5+7jkXN3iHR3Syt+yxmHap99/P6Xy/oS9OVIdxqPPldnh4K/v
         GloILvN2f/iUIKDlNJ1SZipjw1grWQcNMbXC4uZy3W4TfytoHk/NxbYbrq8t6a/nbURt
         3mGjVpq1tJVR1ptSQGyzJPD18OoUvExs5LKZMp2Y9ugzSXVcqzU5mTXJtIjT4qJrb8VM
         SKAUd/t7s2ZGvoHsAKfZWuCzgdIC8fwrxw8G2LeysDcKCEu+K16wWO64xZkqPbZhXGP0
         MCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246543; x=1788851343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rRyq9W1nPrd5M7AXluKRAa4K58WRzpGWnzgIJ9MVQJI=;
        b=eNBOr4kzZZoj8dNL7+mX77MBL5vV7wI7gjRVMNJcCptLkWRg6u6CCnQEolMSDZCNLw
         KUUwlHA5TbYKxVJ6YfNRAxzLugNrnhdjSyLM/Ye24P/0kCXnRkB7G+fPtnnKu5irAVYl
         FxZgG7Zqa4ikINNnJ1bdRvjac53dRjeylH4/MV91WcQ48Q3mVAE4YB5Dt8w4kfrcmja+
         BdTQxjmSEulOiusbhPdpzddmItOrGtaDLcDwzUaU4nIOvoFa6TNjQCmwAvwJvNQHfllp
         J6A59NXlzXXpxU9eCdEHBcIrTC97bm9sXlHiXZZuzpQ8NfPBqyddetaHvUvc8fCZ6l9i
         PUCA==
X-Forwarded-Encrypted: i=1; AKwUvBzR3Wcqv+L/lsSaTnL6y3e5kFlf0bRloaqns5EhUFZamsm/Uzk75HXjgWpsas81g2107cosVXlHWOV5Vgw=@vger.kernel.org
X-Gm-Message-State: AFuF++klP0Cftu3ECpRMm6v/gZuRpH2V73cFvME7QNHIhpY0LkqbZwDr
	7DndqkwB6qW2uXOY351fWQd0fZ9QQUit5Rl41GuQm4c2LfSviwbBcWdb
X-Gm-Gg: AYBFou1CM1uv5t5MBqY4QaeD53469vtf/73fd4vK59vdjVY/q1viS3CZmfyA6HafB14
	pjMS2B0o/nqjTgpwmisLKC9QkUbU4MWCWUolr8MKL3m6NsJyTjq4T4OqEv0JdLbcN6moTifWtSy
	Z2f0etYjJvT/hpw9K6bkmKYO9mKt67EYsrMIOiHX8W+Vc3o6VpHb/ckXsMlFGHNGOdlkresFKS8
	n/zUHki846ORJBAO20WGUmcdYb452HiHH3cE+/CYbaVKXdMs4ipurdcYjHwFbFwqWWJQVBFCkz1
	4/tOXfGIfSLlhX/vqUogBPGL6aFDkr0p6gEpgPIjP6S9Wfk0NUqNKlFSsM2JF437Hpuf/GIH11P
	B+RfarSbI++fKjqtDBjPwYAMCcAMRMS898r5o29KgGw4s2c5bpLZASq1uPFkdnTRu6Ejxt302Ua
	ZG/+v33nDMDtEjdMa+3ERdRbNUC48rcc1DFm4qETGfs995mMRi6rePxLtiKQM48baKCiQWaUPyq
	n6Vp33SShjMOw==
X-Received: by 2002:a17:903:3803:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2d74df0328amr524510515ad.12.1788246542738;
        Tue, 01 Sep 2026 00:09:02 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:09:01 -0700 (PDT)
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
Subject: [PATCH v8 09/12] dt-bindings: firmware: qcom,scm: Document SM7250 SCM
Date: Tue,  1 Sep 2026 07:07:14 +0000
Message-ID: <20260901070717.20513-10-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901070717.20513-1-sreeshankar0910@gmail.com>
References: <20260901070717.20513-1-sreeshankar0910@gmail.com>
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

