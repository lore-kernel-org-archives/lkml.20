Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342352;
	b=sUxKEKxE3moQnQ6CAcxNe0kY4Hkt0kWDcRltS8Ntf+OtSxIQgRQ2aQxZjRQiekeePgP5
	 qdniicAZRiopLlU4+W/hlT8iaeJaGiXAA1LavzZZPW3qIIfb1EMoTXsz65p2Mrhrub1uj
	 uNpEONgBBxQ5a/Gkha40hoybBa+stZht4Zn7/5wQUta3bXIgm6XM5Na+amuzoKvsBWwLS
	 z2aVowbcFIgA2BVNirCPz0oHaw2iLszSidyAOpQAleHogUs6UDh0EjDjmO6+tIuo109Du
	 j/ei4UnFA9whPIvb4TpjMs3W54dFkvKLegd0NuaIMtZP/JhZjMat1qv1zXfwmFsCWuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6vfZ2pfCdW0E1Bkxu7fl5iG/Vuzu2dNyvSDl3DRJkiE=;
	b=aADvA9Pe1YWRJrT0y1LUYWQ/SMK4t9qkAtLf5Izix6xENAsOppBlDcTWkGEEu3Z4AjsY
	 g/c4WxL149rSA9mhHoKWSxQg0mELKwSp1A24jqskuiKThQlkRB68PtbJtF/ZRzRCP46NZ
	 v7G5eeebi6ariYdCPbtI+Ibo6x/fflWgSdRuibEhO2u3uN7xe0nXbzxCwG855OwUVp1Y1
	 KNBszyluQXBu6eCCtwQ55OMESljXdU9MhqwVBwnOYivP5EwWstR+N/Fev86HgR70eWcI+
	 a0NFw+DkCc477CNB25nHh4Kj5Uk6WeZhl7BKbfhMaYBGXFarhmPh6PGBAOdPFcUWiHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EWN4Qepk;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1616A60A2629
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1616A60A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EWN4Qepk
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6de2f213b7aso906298eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794342351; x=1794947151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vfZ2pfCdW0E1Bkxu7fl5iG/Vuzu2dNyvSDl3DRJkiE=;
        b=EWN4QepkIXCVIdcKNmzFh36ehq8MrWn5PnXbuYBRx4cSX37gjR0oS+0Cs8X7utggTx
         hfOXC/O5QoRI/uM8+EWmnlP9JYuAihv7Ikg6fYJYpzL/sj30Oln7vW+jYkPJAbdTmr/K
         uq9qV2iBwRWdpoe5a2mKAIgxNMJhFISq7Sxtct9eJxcVY0fFYrOjde/3uW7iBeRvyxOP
         MG505TuGjvQZBr+D1dKg5KezNUOE3S/FlBegk4ZGChrKotKmmXYs81fa106oxqs/rtV2
         gvjSXGok7gq87RucKQuCeqd4KJU0MTXl+FvFzHXK0Dh/yAe+ozAOV1LMYrLgjvO+hRMc
         vh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342351; x=1794947151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6vfZ2pfCdW0E1Bkxu7fl5iG/Vuzu2dNyvSDl3DRJkiE=;
        b=CpDZdDC2YjIUNflmTN5RFBUYxWNld1KBDRG5OdFZ9fd3NKKxiOLX57lG4/nvjzCxqd
         kLzFUGuvkcssbYavyPDnyIOKrAA2CyEI5WizcyltEJpkzBFEkwwAwKLpklaD6tH2trPp
         DtAruO0WalWqIcGuc2uOhvkK66gtJDp2MG+QXjoha1F70X9EPvoFYdcIIF+LJQbKemjG
         8qfCwmZ4sNsIGCty+1hToj/q+wrt7vsXq7foXe0me1veDjVQ7jxiWplG6q6Wg7V6TQXo
         uyqMzkyH/6asuSabtgYcTcCkIn+tnbn7m1e/47wc7X8Q0ZtCfRm4X60CFSCrcV546tDd
         5zyQ==
X-Forwarded-Encrypted: i=1; AL+hErFQDxgQpCclvQO7TVVcY3ZUqy7B/0QigYLCpRsn9ii40h6W3sepBVINRmc/ccyLpjnqQxCC0cDjYLgXCKw=@vger.kernel.org
X-Gm-Message-State: APuU4Z86F8XZyPCTIrfSOuvlZSu7v5/rhGDspQgYrSqhnx4d+Z2EhwW6
	j8ha9qNQ8P1PlmZnhxmSPut45EZqLgNy0jwuVPJYjsmORO4aQa3rNP3R
X-Gm-Gg: AYBFou0GsiDjqI2P1eGO5hTgUu1YsvqokPp+1nVw4wpuDi4DNzGwr1J247j1zuLLqzO
	ut88CvHo+uEH6SR0nR4WthUzSL5wEjCYKCxO6EjnfUJa3NkXWUX6Y1cNzSV1AFwV5JwH+UF9Ljr
	0+fthDoQ5Rt1tXiSN+e3qSvImGvHjlTDAwQryF2UTKkS6XGXlhQnnJSGlYSlszFC9jsc44DiucD
	f5KkHXsWL7kGe+DP19inpBfSJYo6aIn1SJqJUJ8EEpwLHcKPxvIPTc867qNmFsRGU2YRbBXlimw
	R8wLm3RaZgHA7EsR0oh2SBxz5IIacmMfcsmuq0leLsd2Fx5nVNsk2cq/Nl4McYZIWm+Cfizgxv3
	+gxWg9cXkgCKkwvLV3CeSBNlvsiLDFkH3MyHDDV4m+nsK9f/OlWs3tXJUg/CVdAyYYY3MSXJhPR
	YoMmSRab+f/h0TotGJ1tP74Z6R33pBaG60C9Vdgbd4t6pbZSXooxKJ2pasT6QarZwesdq1K7cW3
	F/FlGHUdEH4PbM9GRwOP8ZofdUoK6Vviunwr1zz8MBa4Z28sJN9fBI/bZZB06Efd3FaBkSXQ2gv
	QcbAd6tAa9eNBgo2LctsynpDmsVkgHykCIlZlIbPlBFB2KtIsPuP9w==
X-Received: by 2002:a05:6820:c0c2:10b0:716:cea4:5adb with SMTP id 006d021491bc7-71917976877mr70777eaf.68.1794342351084;
        Tue, 10 Nov 2026 12:25:51 -0800 (PST)
Received: from jeffmr (63-152-14-173.cdrr.qwest.net. [63.152.14.173])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a8f645d4sm2353252eaf.5.2026.11.10.12.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 12:25:50 -0800 (PST)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
Date: Tue, 10 Nov 2026 14:24:44 -0600
Message-ID: <20261110202445.14100-2-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110202445.14100-1-jeff.roach0@gmail.com>
References: <20261110202445.14100-1-jeff.roach0@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the HP OmniBook X 16-cp1 laptop, based on the Qualcomm Mahua
(Snapdragon X2 Elite, 12 cores) SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jeff Roach <jeff.roach0@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f6998..c3b6014ad6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -212,6 +212,7 @@ properties:
 
       - items:
           - enum:
+              - hp,omnibook-x16-cp1
               - microsoft,surface-laptop-8-13p8
               - qcom,mahua-crd
               - qcom,mahua-qcb
-- 
2.55.0

