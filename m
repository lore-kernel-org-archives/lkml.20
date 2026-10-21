Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551734;
	b=k/TBjVT19la8J4w7pJlWqbuYDGqqoWHFeL79FTWTcOrsuXfknsRvme6Fkcexbc5yIbT4
	 8FOUjy7S21VI9dr0KszCijLXp0vpcjznYgrRtm/WfKTKcAqZHPy4ZI8YQbmbRX2U6vCHn
	 y8+KwIj/iZWCdUsJlVP00TOFNzmHScCIcqFRG24hycZRKXcGTAOW+8stPU0uA7RBoSZU3
	 s/dTw1zNZrX2EqcEnM5rQrvRkm8VAsJgOEASG7SF1tBSJqLnXoYdGSTcbXLZsBOzeTDZS
	 3MzJ3cGefigbeNcRsSVP7nj/nJprE9ZWWAgnWwt4c4PTbafrjCwXg7TNdWToeRoVRfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
	b=qzZs7BYFfV00MvdCUyDGDreZPcRElzq1q0hT4hwDWaxDGWEMOe5Gj+rHAq8ipSqBbgKr
	 XvwjC47dHHJY/Q68nqLUJjtMhb71GEkE7cNFhqcHYg5jPjd1NOaa6V+R7NlBTGmMyJjHD
	 LIUuXtTFVZrORCV1UbRlI1uk/bvd43rfO1a6gZQ4Q0YivaW2J+6H06wnF+8kX6TdbCMIf
	 Z8wGPxWjKSNXPrUExBHI0OBV19Q0mN5ui36t6quBtvtvRq1dp1Yf9xZkBiLdYfX4xpKA9
	 U8qu+T7aLl6S89WvR4m+0Rj9g82PO8rFZaMUqamtvAYEgyhJMd7szslq6U150cL09nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=X8kWAAgG;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44484606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44484606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=X8kWAAgG
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35ef6b49813so338379eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792551732; x=1793156532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
        b=X8kWAAgGwp0SKv+CFS7ojR51KNSrqnta/qAkbfHkLtuT0riX+O6xGeNfLd/TJMB+kt
         n//S5DfSTuB3UBax1bjyFY8/IedkMSGEBMUZDVleIyW9E4urbhooEfjcQcrDYB2UmeDb
         KXJdCDF5wSU1ufbez/VijPdHZeBSZ41H+EOHQGlh1gTl6qIfJv8VTfND/LHVohkMF1SK
         ScI+He46Fa3sLjoabRoa7RO5t95OBKUFWrkUzn9Xgglz6+Ua2q+pye8dDH5hpJ7ZPO85
         5wJ+jvaQuRjgGQwXvGDv+8FXxSdf/OLIK6nthEo+ioQZeF+YFfcjXjLPkkSix8CrD0zB
         8u0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792551732; x=1793156532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
        b=K4PXcWJG8GsnNKkrlcvl3Er03PbIMEp8PmA1mQekxdBWw3hVHbAwboHMnhhtv+AnvM
         R77xebBs4ZGsr11Jh8YqT5HIircaH2pwVQsI1fKPqhIkz6QCctYXxHkFN39B7/LvJtpW
         xOLTgCLcd4ploaMY8zAtKhCxhmrJgEXu5Ek3H2vwQL2dxuklIOoao60FqXlRqw1mlIZw
         YRK26rhTLe0hVuyTkle/BGz6fLQUOgeGUxtBZ9JNYlo8sGiGUIlJsCvYQP+Ly+j7pzNQ
         8zDLSBA5UjKLS4nxWRuy5fMBYD6XJLEv6YAvki9LhRIkv73tZ4VZ4ENop18iRFWPdM5D
         BQcQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2Lddgku239xSpaB/xkhqMWrdEv44gGRddZkzNvdP16EwWsVr4rNI0zXuTI4r0l5Cz3VLRLhSQX6n6NVw=@vger.kernel.org
X-Gm-Message-State: AFq9FYImY0YbFKXE3JmbhRsjVh7PItMCQM3WAVJEa5Jijvi4TMk8Ui5j
	DOIYeh4pBOV2vO9rW/r89fRqnRk3buJSsuW02RR+h8Ho/MG2zRcOWEeo6HDOoBCta8o=
X-Gm-Gg: AYBFou3W2lNPcAgWfM9UrNQDSzsLUoVpWzJdkpt96Qg4FtQI5dnzn4FH2CkdXAvbEP7
	7lZ5lK6BOO1FEsLRqqmf/xTrwp2lRqZhbTqjIv3951Cg/3v5ARINUMWGWPhNXboCRhtdYU7jki/
	i/X6gddynZHanFe03/zmZIoz4eo6leCrusZ2FdbyYXKQmHlZ7Eg826Jtr6D45Gj6AP+S/q2pMnP
	BV5DMMLilAUJlI4vD3zIkTMKwgcCsny88sl5v8dxRmEJNWbbGRWMmX0/jBBxXXmOcjVMGsFEJpY
	zVcbGm0kJEFwZABDBhh0TvWNsEMQ6+xGSH1JSli/4kM+jY6HCXWsYqrgMApecv62bT6lzpEUl9N
	OqKGXvnFuWeEQ3QSAnBoJRjtaGXoEKx9TBbQH9d6I9DUgoTdkZEVeUO3f/cgxich6Wq116mwfIL
	saZPgQN/aFaMpAdR0SpN56HMhBLrAl68b2iv9VkJEe6XeZAOCkwUOuNLeHDQDEi1lWjHPERK/K6
	E1AWEpR1HN40jU4DGPGWjvtVrxVxuu+W9dfEut2qHwjLlrnmPU83gNyeANm5X84cQdar85uCcnf
	YiaQ
X-Received: by 2002:a05:7300:80d6:b0:35d:2c2b:215a with SMTP id 5a478bee46e88-3674f11d996mr1956331eec.35.1792551732270;
        Tue, 20 Oct 2026 20:02:12 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm4436294eec.2.2026.10.20.20.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 20:02:10 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 20:02:05 -0700
Subject: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Add TDK Corporation
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
Message-Id: <20261020-hwmon-pmbus-fs1412-v4-1-27ece4e43d04@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792551729; l=969;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=lNuNT+gSUpQSUsDkNUaVAjvOE/3h1o85CLNGkLI/j7o=;
 b=rko2sOAQYQ6YKmixqBcMieuEhqCema6ugmvbB19RSjqYLJ6NH3/YxenCEWl9qOkYndCiSaPqT
 niDkVQkKgGdD5uBHGU+odEvuQ/LIugQuoWlYefGKh2frpz7WWdi9J/6
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Add the vendor prefix for TDK Corporation, the maker of the FS1412
point-of-load regulator.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..a7c484d1113b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1680,6 +1680,8 @@ patternProperties:
     description: Shenzhen City Tang Cheng Technology Co., Ltd.
   "^tcu,.*":
     description: TC Unterhaltungselektronik AG
+  "^tdk,.*":
+    description: TDK Corporation
   "^tdo,.*":
     description: Shangai Top Display Optoelectronics Co., Ltd
   "^team-source-display,.*":

-- 
2.54.0

