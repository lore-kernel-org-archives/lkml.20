Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281035;
	b=AR+hAXDnHciGDTDX0wZ7kNH7Xjk8edVSKUZKZdUANMGGhUfh7pxDnK7+Beg82jCJuLz5
	 HRXFAaC9y7djW29Ro1qQUaGj6lrU1Vw2z1qeyEUyZ+LqWGDj+HN4+B9JKIcQqSKAnBJlj
	 +SKaMBVBwdeiiXmYrNYidCWbo4cWWNlPzEq/sJrEIZHSGDtJc0/0ekxR0LYiptO09lzJb
	 jom4+8+uv/eGJ98/BBkLOSqdKjuvr5J3Gaeb21Fbfx7H7FyULNwW/9ASvUx0PrKS/FYaY
	 s7+6Ovxoc1pnXw/KHWeLH/zgwqWOnrKX6uZdVlvEL8LUxG675gc9rBL670ontZZ+IkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=swEU0gDnT+Ur08Y/4gcNOqhZccm16g7AYsEas7N5VRQ=;
	b=XTvkmtsOpeE3WpgD4e/65/jW7vB2Stk1fmDPBUfuOs7JHr2oa0irT8QJMufGHTWR0+p7
	 xn4QJUayaMs3JapytzD4E/naTS7EakRBeOMm7ScwUgy/l6JBqC82oaPn/oHnONmXiGaLF
	 R8cr0/+LDCCa5IyvisD0K42SVwFYRsZAY+zPMhkBg1SbYhp6TbScMOzMzLEC/AG4aEkjt
	 9AtbP0d6GXmx3XfrglduanhOfE0WDPbBtX5Np2cT/MOqrtnOTWHaidWqedNgHpxZq9Y+T
	 KqAA/vqaHduI7jeV9kdEKDRwzYrO1t55FZx/9HsYv0pQwBS0gLyxuxaUdXHDa9vqnEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r5oLrkws;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C434E606DA63
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C434E606DA63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r5oLrkws
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1846bc43c28so2450957c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281034; x=1793885834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=swEU0gDnT+Ur08Y/4gcNOqhZccm16g7AYsEas7N5VRQ=;
        b=r5oLrkwsBBfgVRu+clc7J/4z+MzrJ+IO3jDMn/HO5S6EwD3wkPMG2SDgQH4U/jpQU0
         MGteoPtDNjn6z5q49UiYyeo82qS79WTzHiaStkgmEnF1EOhWDKSIGGeo0BuiXaCiCis3
         ntp3PBm2XOVBv8wx+nnYD5QV/LjugGnnFEt0/NKtrKCYn2pe8Hvp5osnT8MbCzslJS/8
         Cy0qJ6gOhFCltfdAw/Z/E1IYuRnWE47+F2FM5c5+cB8iK5ws7caX6PJe7dinSZKIpxYx
         4ie18HD27IEwrPQOfyMm9RrSKX/ZHto/QLjyH89t7q4OmRpQGtTw8sCRGCdPYbgs4+FQ
         bnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281034; x=1793885834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=swEU0gDnT+Ur08Y/4gcNOqhZccm16g7AYsEas7N5VRQ=;
        b=PRZsbTtTGdlS6DrC6q+EPOZdQ6z6yMxSSzY+1su7SEAeaBi2TzcuWaowwbWjpYJpRN
         bxVe+7WHvO9ag3aiUPZwCC7bsE+vRyVw+xoKMpQRNyY+POnlC+1mXZcBuvi37INdQepJ
         XWuZ35MIB3HIermMkxL6rQgO3HNjqQkFjEFu2juuw9R0wkng7viqNKFuQyU10ZvWih3v
         S5EhY7KxJc1j+3V6ket5GUdRbpEENmFV6/ke8V7SBn8HxO7QG3m626nLBEaAH0736p/I
         DUud3uzLkBUzyb1HsnV8w9mvR6jsGch65i0AnFMfEMh2lMLAg1OsBOv5J/hqUqVInY8z
         ZCLA==
X-Forwarded-Encrypted: i=1; AKwUvBzGhyZNF7kK3F0SEBC6SToPfccxQAOqrmbQEsY7EOlpgiFCMQodeyzPqJKtIJeDwJZo3b57TXEsmHsB1tw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8qAYnGs5ePMay5+cb6K4t8pqhu261JDf4lRLBNzaD4SXSL6L4
	/7VWQTlyLOGtcJInYJDmsBX0MpHfd1luAk3tjCyTmlxHu7oDVqEHhRTV
X-Gm-Gg: AYBFou0RSaDl95RCxuWEs2G9jsCKXIrXs0RvVCRmY6JfxTj1TTe4jTt8YY0fa19kisd
	80+NM8SWwVR8EA3bejMTuxZ5az9JrNJQJQVZ5yvRppOk6+la2a8E+Q/aHJVnr+xtWFt98NsfRtF
	chRi3g48pUcLVyPZM7j0bdQJzUafK7LNLPNpj3YfRlLYvjOiwWmdNfhffkOv1VWvffmXEX44A2g
	SvEewVcHRG1xM8A0DhmYTc1aA3gA8lyY3OHXDZsdQlPFvmo5IlkaGpfH4xeVI4Nh8gkqWR3TgRg
	WjbtHkar7+BR65W/x6HFM2tML2A45D57M5iH3tFMSHMKkH9/DTgTJx5rM3d+YgmwN7NDKT/Q8C7
	xCdD0vRbwlRvlfJuKXQWTAMEDHnohDO85M+4Z/01fuksNUmhrpYCV88MheEOFsEqk4DlvmOVvGJ
	yXTi0rSqNgaM3bAFKU3qlc/zjZsNbgGA22Mob3Ktfe0jgOzvKA5jSEvb7v4hSZUkFl991ekTXzx
	sucr8huRIv9UY5Kk/E8DPla8T2o75rw/doO4mcCwx74T2PE+MQtO0uf0ffxit/qpGP1/iuj89uH
	9Z1AmlEQ3GL55HEOT/rqltwr43XULoe+s3nHulKwWdLrwpbDiPFYXg==
X-Received: by 2002:a05:7022:c43:b0:188:e51:e86a with SMTP id a92af1059eb24-1a6c7d2be09mr5492426c88.2.1793281033511;
        Thu, 29 Oct 2026 06:37:13 -0700 (PDT)
Received: from 192.168.1.130 ([2402:a00:163:2ce9:cd0f:5122:d067:9a24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75f51bdebsm17046239c88.17.2026.10.29.06.37.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 06:37:12 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: arm: qcom: Add Vicharak Axon Pro
Date: Thu, 29 Oct 2026 19:06:53 +0530
Message-ID: <20261029133654.6585-2-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029133654.6585-1-blfizzyy@gmail.com>
References: <20261029133654.6585-1-blfizzyy@gmail.com>
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

Add the compatible string for the Vicharak Axon Pro SBC based on
the Qualcomm QCS9075 platform.

Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..02c0ebc3668e 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -472,6 +472,7 @@ properties:
               - qcom,lemans-evk
               - qcom,qcs9100-ride
               - qcom,qcs9100-ride-r3
+              - vicharak,axon-pro
           - const: qcom,qcs9100
           - const: qcom,sa8775p
 
-- 
2.50.1 (Apple Git-155)

