Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864316;
	b=yW8dAGl00uXYONbcrC+qOtMMepw3sSmqI2BIqndfHSqOgEWAWdB8Ot+mtz7WY29sE1/f
	 m91Qi44hvCqVRgX+/onGLQT6hWtgrSbifVyYXfOG6qmNl9i9GEp3TmDi0xMAAGm26T2W3
	 8TQ/sQuNdnOc4HcKYXOD4IIQxQXEOvYyOzEsjBqef90f6dsLckI5O0ADMmsOrtbCLNk+b
	 kmv4TAkWXsbEW3qgNDR+SIp6TpW14BT1EdWOwcR+Kytlu3Nd6RFipW4qPflt9vOAqay8O
	 7JecAN0G7hfrAeXM0qV765YtnrL2HfxaJUPSm0ty0OQtCCveTXbSyQenyQIIIdJwoCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=sqWf0ZqjfW7jYj0FTgNGieSVB4q6BkczPYaUBzocbio=;
	b=oFkUZeWQ8zbUffd415sVURWmi8ZaPUvhP/tx3S5MbXaKlVD18/1Mltm8D7vkNYVnmn6S
	 SKAQ7NqzWrvt2YUZMYYT6n5IM2zlUlMhnmO/8GoxouJSUqbAr1ALrpC8EyXV6DIybWWyz
	 0G8BDpN4L2RhpQiKqflBXQ7KJ0DDauztOpFFsix9cPf8fzcX1bVXYcUQJlXJysmzlIzCT
	 +OEAnhmdRjQJLGdQMfWb6+XsmDrAsQr5M9f02yJECk3hXkfg+KZCYp4KRNy8BpAakt9yy
	 AAwfLwEZMtRLCNMoV4eGrMg0Pk3PCbZUpl39ibkQpQxxMgpu1wn+BGWSIH+xUyNi6Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iseyRQOE;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD35C606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:25:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD35C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iseyRQOE
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb61185057so16918405e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864314; x=1795469114; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sqWf0ZqjfW7jYj0FTgNGieSVB4q6BkczPYaUBzocbio=;
        b=iseyRQOE/E32bBmFMCAGUZXSR/qaLS4KuLAqOaM+SdB1JDnfrcopkhfWQ8b3jLTZCD
         qnnDF/TT02D8xCrqB4uYGpagOG6wlWE4ePRpg8iEyCytXx0rLcuO5fHP96J6BIpDA9gk
         iLegNl1FcpOeWC+AHGYP8S/mBYbuBSsoLoq1b7+0p3YSyh7zfJ3Gh365uu37gQWPYdx9
         sRQ1K/GlWzE328os4/xKBsZiUoCzRXcrQhKQfvT+wt8D9oV1SyfpnJHrxcPhviF8ImRF
         nq1pKotED9Wn0jay0acJ9SaPH1qUzXlfvAzx6TQMAmwR2F+FrUQxqO1IV8FBYfMkmPfX
         W99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864314; x=1795469114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sqWf0ZqjfW7jYj0FTgNGieSVB4q6BkczPYaUBzocbio=;
        b=F6pgEx8B9nNBPukmuauYlNLupdou88Dzyes6G/3fjqKHX8MMCSIo5OJ5TcBTqIbV1x
         5QboUjLcbfUHB76vU1sPfmRIFhveJ5T4Zx1AZe5GvNYubNvgR2pM+CuAs3PHWpUDvewN
         FAhlxSdADpm1gzzZeWBPxhKvAW1plca5hHVV3axH2+N2MB4z7AILOdAsvz3Rl+NkoYoP
         bdr4uNdEx4OST5hAsI516dfuYGkNrjcvUIfEh5+eKSW4RA72znRAz3xM9wlO82jdesj0
         +7PWzHO+TIFuwxrEeGvo7bi7pS999RDCBnLLdzJKY44kEMAEchVhBFOr63MTgvw1ifWs
         LWTQ==
X-Forwarded-Encrypted: i=1; AL+hErF5XdkTq7XszUGAfNdqf0Oziivf7YQhP6vJLE1Bk6b6A3GEoNtV/4AfOXz5sF15WGB/tBQKG3kNi1NftVA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LWiJqWm8plllIKtsIJDmBmuQLXaNUlqNkATUZkfV8UV6yjTTy
	TmM8/Y6ukEg/kX0+R/ACYimaArhir8jSl4vogswXxKfuno1TrvsJXvZu
X-Gm-Gg: AYBFou35OEEX3lPLP3UdDfJH/TAAwB7bVvPGF83Fxc8S80bZsTIESWsPkaVviX9wGx7
	mZnANiyuOf6IfXzCpL/x3RB+QfIznjjspKom3DP6A9bIpsR97itY5aEUB9aU+Vu+bx0WaIyRioT
	bhziM0q2JP0pf9ItAOGZ02kncI7aVaU4LE2VyuuxKajZhPP085plvXkRdzK3zt+OEfo3PFD6vpW
	LoZq85GxH5uDmxfM9/KHsCjCL2sNtW9zd0T4Eby9WKLbic3JfW1OrzBFRf5uCPz+BhE9yKLcS6M
	AF9UQXXHQbZc2BGDV7BRlUs2Hg/oiFkqvWU3k3ZTzbbwy0gbdDxJ3NCHyk2PYEctNBu+2IeaLc7
	44Gr979ulKgSFH0kEsizieOEsgxezNI9eutKaCQxCjwLTKycT1vnIkcbkv41d80cNKR0CwC+gt8
	ZJWrRKGMpKSo1Eg+dfUtQf/p0z7xua4PmD3/RFYEENuSUMIxbNoTUtneN34T0wmCCnX92MIhNzg
	P9bMfl5BrDOOykg0Kujhue/DZvl8ZMAiObVaBMfIJY6TYTZvqqvk2q2UoG+P5XjWIw5SGaBUym5
	lB5IsF1xLMi2awrdsM+vK/VIK/FjxThlAMWOBOg+KJYjrCzIygJLb7fN+Y8vDg==
X-Received: by 2002:a05:600c:4e88:b0:4bb:7033:c936 with SMTP id 5b1f17b1804b1-4bb7033cd72mr93163065e9.24.1794864314291;
        Mon, 16 Nov 2026 13:25:14 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783854cesm26340475e9.1.2026.11.16.13.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:25:13 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:25:06 +0000
Subject: [PATCH v2 1/2] dt-bindings: cpufreq: qcom-hw: Document Halliday
 CPUFREQ hardware
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
Message-Id: <20261116-halliday-cpufreq-v2-1-e518cc055457@gmail.com>
References: <20261116-halliday-cpufreq-v2-0-e518cc055457@gmail.com>
In-Reply-To: <20261116-halliday-cpufreq-v2-0-e518cc055457@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864310; l=1136;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=/5q7xJNdAtVYNP2eKqnOFRxkwGs69ZAxtJgwpCpPYPc=;
 b=Nu0RqZZ5Ivs9eeDLVKmj50eQ2veH0BxWIj/S/nAk4YibWF4bJq1xDQ9cK7u9JqZQViYI1Hn/b
 VTSNe8I5N9lCjoKUbRO4u4YsnoQGGy5myEbsLjX4rzZ50PPP5EVJWt+
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the CPUFREQ hardware (EPSS) on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff172..d6040cd293f9 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -36,6 +36,7 @@ properties:
         items:
           - enum:
               - qcom,eliza-cpufreq-epss
+              - qcom,halliday-cpufreq-epss
               - qcom,milos-cpufreq-epss
               - qcom,qcs8300-cpufreq-epss
               - qcom,qdu1000-cpufreq-epss
@@ -135,6 +136,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,halliday-cpufreq-epss
               - qcom,qcs615-cpufreq-hw
               - qcom,qdu1000-cpufreq-epss
               - qcom,sa8255p-cpufreq-epss

-- 
2.55.0

