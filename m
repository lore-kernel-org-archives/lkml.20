Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793215131;
	b=JnohXUyi9o1J49KmNNKJ5pCoDjk9qZ4mJOD7gm12zH83cDfmfEqPafQ7U/12YCNdJvTI
	 ZGv6TF9WjCW3geH4xt603fz/qtT+HUgsw46WpmABiudQFd3k08WE6iuY4I4QrHVRFLGwf
	 zgkAtJR1KEZL8EEE4wUTqP/DtdkydK/q+rrzt+RCh9BQbS5iIF/RbQUiI6ztVfDRSBE5D
	 VAJue7bWyyQ59IzvBI/68uER+j91wEyEK8mSTsfnthqFCfn5c90tmbX/zvQ5tBA7ovO/s
	 apSbM1OaCVC/8oiqO9IJsk1RY6nz0qVCZ0ru/BE7T6O6UyyXyMiUVjBtY7XkpDL0mTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793215131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6vZ6om9FYtHLuxxt/jURe4tARN2iOgMfaZorU75wv6Q=;
	b=C1eSaqOqLQkzWlYDhHMxFxzW0wyttgjd6kitDbf4Gi+SX6XYfJFTRXPDwH0xY0Sx8ZBi
	 2bBMMCoYJ03OGcX79oMtGjtfaXpPGKXHlAAPv0wl2d/CWnr+EkhHj1eGQODVXYwP5Dxpq
	 3W78Yh+YD4UwPu8TCq11B6UG363E8Cawj+KAbtqXYeWfgXSFpkoaMtBYl83xBHc0HbpjT
	 T1hoISwTXkSA3fjWe43uWv7a+Nlel7FUUmu0BJK/vsa7duBgq4pZutvbIA6ELNq79GgZm
	 VcklchX6UyUA9D46osLfymLmet7Oc8h1oPlTvTLvrvzHAViGOTr6VdvwB6Aq7MFZMXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J+RuMQEl;
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D887606A330
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D887606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J+RuMQEl
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4911df1e196so778974fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793215130; x=1793819930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vZ6om9FYtHLuxxt/jURe4tARN2iOgMfaZorU75wv6Q=;
        b=J+RuMQEl+CDTv1rs2v9if+ss4fqRXbOFUOBe2GhOpXnYmU7dtUpjkqOcgPbWfcEwsc
         2xzL4Imz6fjBvp2J477zmWlEOZH6B/DAz+NKXHPQC+Rspn5nAQDRZICCmEmsZ6Pn7Ynr
         cIwMSU1jE926r8CMKTJvIfv9Ga2Y50fEREkdeVEl3pLHRaMjjpflA8cGuFrvoOL75JHh
         xfpk1o0RRm0eMi5kPKOe8qTawIUCfqpA/WT0b6bOKco5C25TzEAfTsfd9ldF62YfiqYk
         7yECTGl5T68dL//nguthVLe5tM02V5NrTOallrtKk6xukvgJvDQ3plPQrdR8nN612JOg
         zC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793215130; x=1793819930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6vZ6om9FYtHLuxxt/jURe4tARN2iOgMfaZorU75wv6Q=;
        b=b+r6caChL8I7eoz2iwVXdJQvVECqAfyIcxg8om4arTaEZ/w5+QDKFdzvrMVy6NOIME
         Pk1zroDYaFfkyKE4iw33NzV3993WON6L/zP4g7exMtc1TFYZOwIZGNhXWRdIli9XC85s
         S1RZXuaWwo0O4AX7WnQIj418ldcyHexmJDrvbCTvu80IliVD9CAEGmSkJ4ux2Bo6pAHQ
         b/mnS9pXeVncw/aRlx6TqyZYagtHeFK9Mxah8JSO+tVLBq/TTDTsovwwjjhDTWbDbkWK
         ME7ZdmtDhWyyl8U02eXMvvmoMX9bVhJBaHjC7s7+s0+jEEZmL2BbZCirKLc60Td/RHQi
         pHwQ==
X-Forwarded-Encrypted: i=1; AKwUvByCKUtQXYuw8gbCwH1R/3kS+fj0UhfyslSjp/BW3UUv3Lb0guVWYqgJv8GriRuDQbTnTOOt3IOtWPf29Yk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLESDjZo5ZDmQTQkaU4nwBHxiJAYlLHh4Yjm5V1/gFT75v9onrz
	mmML2alEny/WcaruuwVnktztUMhmzbzAsWmDDRDw2kJuuVLW7hRnS/CQ
X-Gm-Gg: AYBFou16CUZ/xYrSHsDxIQrUy4VSADbCesvk8Y+VlGL9mX5fPLniFk7wJGWaYxoX2Sl
	eG8e9Em1eyd7nHr+DDBuAKYhNdmeWkGteeVtKke95U5Ox6yCFtVaqeZsLgegDnbFyEyuwFcvWS7
	psJm0uM29nLQL8SM+mhC7Wh81kHKBtocOJkigWLliBukvMKEXT53oJJfs6pvM1hLkEljHcUKroo
	pz35HHW7dhzhnaBt/PhEwgzel8VY/gOYti2aLL/ORcQuEZwHL4Q4hrPF1YAWirbUr7vwy9h7Feo
	t2jaC5Dhu4Q7J4MfIpopAktHTf2v7e94Kclkp5pewR2dbLo1hG032YaM/2reaf/hTR+G/lhBFI2
	OljGHaknV5gMEp1nln1hzX8DN2txLvSO6VzuL2zSKq1bqmXfR6yaWZ2zgxY7JRtGFdra74r7yAn
	d9DMP4Xb677m3IORybFqB5nFFQV/Ua/7ipMkNUErPOOTWqsVOk0qAfaHEuIAHxZmHli3eOzNM3/
	c8xwNFS7QKpechKJ4+n97hkQ9XpVhzMA+ulCNcC198IT1dKHDWkywTv5LRFa2WLd6LXXHziMXss
	hUYE6eTmo2hIlJgBnvvy99lfzbgP7JFhQ8WOSCGMAMSOaWDBNgsWzU50IA==
X-Received: by 2002:a05:6870:f114:b0:49e:7c51:3b19 with SMTP id 586e51a60fabf-4a8bbb059c3mr2712734fac.48.1793215130440;
        Wed, 28 Oct 2026 12:18:50 -0700 (PDT)
Received: from jeffmr.mynetworksettings.com ([2600:1014:a112:1526:f26:718f:8dc1:b185])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b785d108sm3092916fac.9.2026.10.28.12.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 12:18:50 -0700 (PDT)
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
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
Date: Wed, 28 Oct 2026 14:17:59 -0500
Message-ID: <20261028191800.27829-2-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261028191800.27829-1-jeff.roach0@gmail.com>
References: <20261028191800.27829-1-jeff.roach0@gmail.com>
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
index 121ca557ce..4dd57e8663 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -191,6 +191,7 @@ properties:
 
       - items:
           - enum:
+              - hp,omnibook-x16-cp1
               - qcom,mahua-crd
           - const: qcom,mahua
 
-- 
2.55.0

