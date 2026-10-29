Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257432;
	b=5inhg+QYkqUVkRgqbhOlT9Iyh7Dp4mwPQjSdO4j+XgJzo7L1obUpFhWZhlJn7AyZo2Xh
	 NPgYc+5oeq4CUe1LlqpWMTx41ZN6PQgJB0E5DEVSMmBcY8E5rHP2j+r5N6XF+pIdcrjAC
	 wAFxOLWY1izOxD6YN/2dQkhJ/0eKQeHO+023vOz2XBZrxheCpADtdC8XVDO9VVwO6Tmqi
	 22o3x4yX5EeBV79u41JF1DEIyf70+egqs9+Px2dH9yZYh4Eb/zZprVae6obUsjSUB0fo0
	 BlLe53SUETV4n6KdfAiv0bxcEmjA/q+isUg7cm9FpcMdRMXC9Rn0Oz8qTsWFAhPxZyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
	b=KW+lnt40O8I1i0/MdeQ21v40fTNQopQEQIBKzct9KDIQPUwLeRFde4anFiutS2n+IIIy
	 9tzi4r8BQou5ypcQpP05opWV1eJBZAa0qcuynvbp+wAciRHr7M/p94df+3Tf6A5flX3kU
	 BXcF29bFNSvLvj6PK51ufOqQVvsPDDzpiSIGAjIPglLTamNMH2RNymGPhQmecmIxkJxzm
	 Phkl37s2HdcFG804ygslNiMKfqvs+I8SwkVBckbeZ8xEC5dZj7MzQrRkyn6SnLstGmCH/
	 cCw3g9mlut1PWnNkGeESwgOjC/NjLhHzis1zOoz6+0a9H8MlQ6FLHfdcFdmO2zT8Hmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F+pudE1W;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6617606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6617606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F+pudE1W
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so2546684eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793257430; x=1793862230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
        b=F+pudE1Wz7CqOqPaimvu4Pl/+YNsvoQM/t+U/mEYukGErBeyHWCN272+UtDoWNvHMC
         vAbOVjw5jNDZKqVWvZIigAyIF/4ESJZJg24DbMqgqsPrjUo1VXoyaa84Qnoc6dpgsKow
         JnXYjABw0qcn7QpUtnBpbMfNOIp8jsS/bzIG1KqgA32WsNOOhrTRm0M8ilMrd+WFoIIj
         2Hu6CwA/ZyDT2GE4BajHITQmDKwrg38kvYBXwKRGjaijJByJT/VazKfta/CnxRw+8FlJ
         ut22x4oOCDQDYQeIdnZqr9s59cDhITvsT3mB0kPl54Nkafg1zi2Q1XTY7Hd5k28YU8XO
         lt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257430; x=1793862230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
        b=ukzL6dCYsc7pMsXJgqtI015dszpOLX2T5VPFsUJbZwdtTArT9Kr1HYuJ27+gRY55uT
         eTHy5ejEoSJmagEqG5HmmwKotf0EM31WpCONw1LqpJrKny6H5QtYIY4oRYPVXPkh/YXS
         diJYuvbsRU9N+zN4kHfMERFpHFRBTfaMD7ZxuAXlYzgWGFMC2f0g7831ulkRMB4M+x0X
         vrPNilBHq4sGQhaUtAD/z+L1DIyLK9eqJ3MUyJ+ETctm8agj1ZqfCxqD9zpeHxCMdNb9
         UUAa4TQZCdhLtBy3dd+udJIFgWXa0gbgQUzBpeX1FFF82WPK3JU7XNG547e845OQZLSl
         9/Xw==
X-Forwarded-Encrypted: i=1; AKwUvBzRSxKS1gE2J1id7cE+sqRdG+O1lV6QkL3YPuuf1wN+dwcA1rpISiquaIRZ1k6WWLQVEJINbgzIRcsq6WA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqjS5dTvdi1Nht3hKrOzOXBOb0dKoQuB5YzAn9m6Z1TGBoDe00
	Od+YKbcsW505g2uCaJ0ifXmuiOipoWqlOtmKGk+i6Ej5hTIf0V+5I18K
X-Gm-Gg: AYBFou1WwZTa3s29smZPXk8EqgM4Xk+tk8zkbruDYe2aHN2pjfrKwnwyq1+DpF7kfvq
	jD0Jvp8fCkHlvCpdU9/o8OF9U3EkYG4CBYvBfTQSIQFWxBRqg8FpyXZ+4527v14q8ujeKEBtnbO
	MyMTY2FuNvwj73CZC+7ZzUo0LbLmX2gGr22tEitRFVOYyrz956uW7Fw7BOcq74y7E6EwTboXDRj
	gVqRaetZiUOvD8PEuAB/BUxWd4r62L3UOAUkEwsqf5geFm8SYPZ0TM/g0kxTeJ4Xd0h4kiGVvzh
	HGayaMBK4kkB8cCrUprUJLzWCsVLAzosIloTzzsSE30NVh8Jm3oNFM1fGkosEN3QSpcmjoPYQto
	ukykZ7x62N8i4qS2koiI51FAMfi0SaT2ozfHYid/URnNr9SFjHz9spcXkJYZjYZK/WDrjSdPtIe
	ASkDGVtIs4oXYhdHcdg3rEfGHaKOFXJqEvdwu6rh2mdXf+RjE+ozlQoVpkiMKDlbW/YOObFoTWB
	tHZezRqU+3RfECGqIv2eJpdxzxpw9n+Yx1xVYRmAuojxYt74i76HlO1yApj2ntqyawILXQSXtcE
	Z3QP2m/5oiobO5vaZiKuM1Cm6hXx+hwX61wHSaKkL7jVV2bQMN3IcXTCj/S4TYDE149udYZxyeb
	NAkoGojEmy6FM3DbuHtzwITBl00QK
X-Received: by 2002:a05:7300:e11a:b0:353:7d17:9a86 with SMTP id 5a478bee46e88-36a200bea2cmr7029875eec.26.1793257429997;
        Thu, 29 Oct 2026 00:03:49 -0700 (PDT)
Received: from Sobhana.localdomain ([152.58.200.233])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2398fa4csm16955443eec.24.2026.10.29.00.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:03:49 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 29 Oct 2026 07:03:00 +0000
Subject: [PATCH RESEND v11 3/5] dt-bindings: firmware: qcom,scm: Document
 SM7250 SCM
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
Message-Id: <20261029-master-v11-3-2c29e382162c@gmail.com>
References: <20261029-master-v11-0-2c29e382162c@gmail.com>
In-Reply-To: <20261029-master-v11-0-2c29e382162c@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Danila Tikhonov <danila@mainlining.org>, 
 David Wronek <davidwronek@gmail.com>, Abel Vesa <abelvesa@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793257394; l=838;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=n/5l0LzNHQkrbMmziTZYOIF2FEcc8PMKPnj4oscjta0=;
 b=gjdaSkAxoqehvftK1W3o4GIVUIA72A6eMiGKTKK8PKFf4JbbGxuhscbbg/ywU6MqKNl0mpR9g
 xohlD0CPLyOAVuyH5IEDoVDWsgs3nVO3qP+to1jabBDFYp6pcoRN6tB
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54..ee02a9c20 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -76,6 +76,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350

-- 
2.43.0

