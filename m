Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794486250;
	b=vxZeNjBLfC+qCMErh2Xkyy9enyubh9xgCIhx9afDd5L5ZmTugbtreBzEX0bxlRfHFddn
	 1mxJ0n135jKgV+Z0KoEyUe77MF/vacX8dqWYArmulngRVsPC8wRMgFqG9iKBexwypkUq2
	 PV6TNbDygT7XMbC7mAxmUHzLYV6A4hDtxG2R3arjZ2HZ6xC8HlZ0NHIEOr4eldkvqBABk
	 U3fMdAm2eKNWwiuDrpBvt7D+Zbgm+nWtdmCAQhKszmBD00uB4FmnstBNTrXx+M2zMk6H9
	 nbBGGyfkUaEckvFcTDEfSj2N2Wh6FLgTCz43Y7nQU29BbVQqK8BCnSx/n4RevTi1qbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/ZBMYoBxxkgJg0D0vcbzX29og9IbLQS/nBwET3T49RQ=;
	b=b7yVpQFRIKyizBfa8sE7fcdp5wXl7wQIPFF1q3/lu5JUnWr4iDbmJmh0677oUsfnt/n1
	 qvOyRNVDZPSliRMeIBJbj6t4Ku6MlFFspQywZKKi0RXbMwvI8rAVO5FlcdBoH3plFtY7h
	 WFWwwLntl8lWIcwTTEiMRu786Ak/7wsVjjtJc8MhZgJ2E1Iek3PC1fP3gg98VNld2vwmM
	 V4CzVyZidY1AyF6uIHekA3qg+R0ZmHfkUpVwicNksdDASBXrwNvPPw7x0vX+C1rQT2wKA
	 nVxBBg7eJ/ED9zKNjqbJm8NJ9L1qAUbZGD/dB7cy6ANo9b4inYcjeEnQJBlWlLvJ5NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L23mmaik;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58255606A885
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:24:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58255606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L23mmaik
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b56bbf8330so5339072a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794486249; x=1795091049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ZBMYoBxxkgJg0D0vcbzX29og9IbLQS/nBwET3T49RQ=;
        b=L23mmaikCY+Jsd315IBXg/zTyoa42t+VmyZ8aMGiwsxXeY380o8Ap88X5Mqxl02op/
         bHe2uj8e5n02XfWkRCEhI9hln7bZO4WxZFqr09arcjJBJPde0vc82w9kXA2I3yzvuwtY
         s4A058wfU8lQtbpSfH9Nx3tZxRmY1tfIheJNflspNjHhCURoxKdqXL+Pt6P2OOTurmFS
         NEYQdyw33s9Qa6EmKiWsYojXpcW1LYz9Ea7gDHvnKG2tFKQwG/KmkFHC8JaXTb4FRfwK
         oatWn9QLLbwjn3AJDpx6X7WxREYDlaC8TiMm3heez2+AvSjmtEIS8pYMOelizS+fAVOL
         l82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486249; x=1795091049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZBMYoBxxkgJg0D0vcbzX29og9IbLQS/nBwET3T49RQ=;
        b=saO/E2nevJ3JJnSPnRT2TNjenquCpSq27cIhCRmXOdoH/n7mV0PnYw1Z+vigj83IPV
         43jkVGYjEaDdAy/4Sa19aU1Sci3JppEWH+GB0CnaxZ60Y7AvQPygg5tdYK/DSVvjWILi
         57BNqsgStzA5tw4qDeMM3scfZLHtKZT4L5a1iDIlfnmjWYIacStbMjY0NE8DdJpgXNaL
         uKedmkj5b7xW9sR8qYkTnRb+6+dCtzNL2DeTKAx8MpNFpYNSYKyjNAJpagnEJwB5l2BD
         macOfHwgqVZkijI/HMzi5XEeJWXRk7BWgMhOgQpXs4/yOQxnN7686JjUx8xmfe/swics
         PeDA==
X-Forwarded-Encrypted: i=1; AL+hErEv5QYygPC2ptYak9SgOymJvtJqJVN8cz8xV2Tn3rXvkP/sJghbYaKtOOW6rYk3uHW6sVnDh6ymqCrpUHg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WHO5P6dMtDGsVz6iPbTe3nmUazAhMl4xMK18wBD5eXprVQcRp
	haHzYlH06PY6bk5MjA5CU0aaCh3EFR/JV1P8wLBLcL15nithnUFuUBY9
X-Gm-Gg: AYBFou19zeK1K3lspT9xF+rSHy3juJFik/Jc3VLs8V2wmfr5NACmXe7w4ysHHbRLCtY
	vdhXLyq4IPa5CJRmx1mDSPVLtm72rlBTSiraeaTR+P908uajBHy6tvCjG0YAFi1aohTP/sTz3PY
	Jqq38lYqNOiyGlYnF3ucZ1FzjgAUfskOlrZ99ivnb54eAjPA96M3g3TtF14NG09A3jjugZrwukP
	ZHRuLdNBiq/aLNsPru6nsctJSfSBkSVRavCSfHgCjvY0eK78rubnfCPZkHiy2bO4iw1Qx70FRU8
	ztKGKi0YfNMyAcNPOqHZWmLiisAyvkNYzeGi01vXCR/WeADub6XutHkESPKzvARjqtNxo03JmqR
	2y7eWJKcSvtX6v1vF+o6ZFQKNOE4w+QbImc9AlSHpT+j9ymgqd6j5upwdirHbm791xqaDL5/CgR
	Heh4BDzhVUB+si/YBJNDJ3flT32lB9advWmagsizNFbDBhA0oPuBB0BtWNmzilFK7IJM0oW4SFi
	AWKVESplG+B/m2qInc1zLXcOPpsSfs+iMP8bT0s2jd51JsojvHcAa45aMXnrGredUMXf0FRSLqp
	RmYhhTfaRb7x4yaH9/txaDeYi0P19at7/75VIAcn
X-Received: by 2002:aa7:df0e:0:b0:6b6:fed8:e3bb with SMTP id 4fb4d7f45d1cf-6b7773edf13mr3161861a12.13.1794486248604;
        Thu, 12 Nov 2026 04:24:08 -0800 (PST)
Received: from crispy-cucumber.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b77918d094sm1835931a12.26.2026.11.12.04.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:24:07 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 12 Nov 2026 14:23:22 +0200
Subject: [PATCH 1/2] dt-bindings: dma: qcom-gpi: add SC7180 GPI DMA
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-sc7180-gpi-dma-v1-1-2a8eceb49563@gmail.com>
References: <20261112-sc7180-gpi-dma-v1-0-2a8eceb49563@gmail.com>
In-Reply-To: <20261112-sc7180-gpi-dma-v1-0-2a8eceb49563@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Document the device tree compatible for the SC7180 GPI DMA controller.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index dc7bdf7c4201..01766475d1b5 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -36,6 +36,7 @@ properties:
               - qcom,qdu1000-gpi-dma
               - qcom,sa8775p-gpi-dma
               - qcom,sar2130p-gpi-dma
+              - qcom,sc7180-gpi-dma
               - qcom,sc7280-gpi-dma
               - qcom,sc8280xp-gpi-dma
               - qcom,sdx75-gpi-dma

-- 
2.56.1

