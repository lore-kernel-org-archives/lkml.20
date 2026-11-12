Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490393;
	b=zWCbxBeh+aBp61VxfXDo+gB2r0EDOe0jCJgnJId8Rxn9VoOqlBA8w1ZdPRxzWUUPzrZK
	 NZ6BJGJGBtJNK0fIcO3fM29FK6OEu7gI/liwcIjbfqIprEgyWdIg7FeaG5BFkc+OaecYr
	 S89MbnkldZTxXb9PfNivJSLgxEiTmjFRW5ZFlau65Ep5AWWXIdjoBkYgTmMB0GkILQ9IR
	 mkjPZcGRkogWC4yXJMWNPUYO5aO4wAiiMrkEAAgmWgGXao1Zq4uM2ljoA6Y+IlGFdWAze
	 DNWSMX223OX+qc9XaYZI7H9w59YVeqeS/ARJPR+MgTZwSOYgLqp9HZYeT2ou/usQGUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=iflmLAY0kf4050MDdL5qSOXphw4HFfvwSOJfmWdwNFw=;
	b=C4g78O6rVGISQT2E4iEYdxg1P5tIASnz0pRGo/qm++QA6XBS7kNjGTooA995d7K7NPoh
	 hAnDK1pqUBNE0aPrefXC+dfrjmLKk9oQLPvgMgwQykK3Yp3snFoZR0F2v+D5bJ1o+tze8
	 8voGL9OyAjHEWtSe7e0ur/f4NmMLu+At5z0eQw3YcrY3zTjXBei9WxwvmZmc7UmVt5YHu
	 9OCh4kl3fxzdp/trNNv++1T7yshO4gOyd8tdU5T33evaMuMwDocGU+qb3uCNQC+0bCOjv
	 Cgjo5pOL6dqPPtwhIPKPWBiTUvktqoweFTX1M+QX7aCAuE+ZbKluHczsCWxKClbbvdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ib+38hIj;
	arc=none smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5111C606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5111C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ib+38hIj
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a49a022221so36604771fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794490391; x=1795095191; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iflmLAY0kf4050MDdL5qSOXphw4HFfvwSOJfmWdwNFw=;
        b=Ib+38hIj0RFGoFOjrvPfYEyLa4R8naqV7ydkUoB7aq201lboVxR1gaVYnmJVl09jJU
         t2N540G5RK8oyUPQK+JKEaoOeo//uc4IZDL3DWy2+PNvgm4hgGSLFDtP1WaOT5wwbM+I
         dr1g2FfJgZdFzsgn77FGw+Jf6aven/M/Gvo22Xr99P6FD0ayzE+tHxUM3ynEK8foxkx0
         Oo++IVge9uKDYRb39qZj18a9e0mqxlc1VRINBgF8tceBnQjsZraz9OgJLX/srOOs8Ufi
         h+PPH3nK964dN1uUIMXPYmfWGao/Lp9Mjs+pIt/bCNfOuEo4HCoQ8FnfwjzbZq324y8z
         Kb4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490391; x=1795095191;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iflmLAY0kf4050MDdL5qSOXphw4HFfvwSOJfmWdwNFw=;
        b=rnNgaFNh5fS4gLfbd0gDU6bArDXlBUDhWewMirkA4XDA6lCMMkII/EYK6RxO5kgMb5
         ZEAh81G0NKwPgsJco74juxSAxHtIwtvKJ1907WhhNR9kqpzf1+qq2yksLXZHXCtaExtK
         uuHkdYdDCY3/Q4zXf+LYNBZSYZMSBxDEOj0emMMaZdTnAlRvqqSJYmJlKyLH+9KE/+qt
         bWktynDqWoqredZj/UTgXmfKUVEtR8tQs5Q0bpmfvfikzL6tQIsYzdRuonKEJ8MQpfSd
         q8zV92j4nlIE4qhFamdyMt+owQumPGZJoBiAQjooYb1GYPPWRzPwHYZAQtnS53JQp5zU
         s14w==
X-Forwarded-Encrypted: i=1; AL+hErHmxsgCBcIDjgbvMmhy99t7bJ/RaS/RVBCE6FT6EKmIJQI6JSroCvhpnPVGsP9zP4XQgNV/lr3Eazvtowg=@vger.kernel.org
X-Gm-Message-State: APuU4Z94Za4I0mr7tjccTABeoLock5BHB4kARReW7Qtg59+fPISDf6YM
	0ZaEvS83tT1cNz15xjsSqLpXa4fGO4xgYRSc6IkOVIge8zj/rxeJyXiH
X-Gm-Gg: AYBFou0j9VWU9i/YhcluHdT0xUFiMLDHsg0xSUPKmJCnLhPfnLcHUjo9T7T5tZULArn
	0gR2keuSqYz1UolirD5ds7mM9E8rAgZLN3ApveriUyKfe9WVKTgXyUzKHJc/4i0nqihF9KZss14
	PyVb4XG1mUF2kA7URHj8YO+ILYW8bDc82OrFXwidlxf/AIevT6GSC05XhHZTRmPGe32zloohVLX
	Ct5/uakTFq63OAXxnR800oX/uC0jg2MX8UH2NYGRZ7pRC/IM1Pd551SxnAjokj8oCy4UUOj81RH
	bTEbhHgm0X85g6GAOJdmaYTjWDrVQPWJQz590gzivvxe8EQp7JlGrE1U9qa5u01zlGAWDP9/S4k
	AFAhBGmBhA9TZh0U5A9l12GJTvfoo3xRfMUg8BiXqDEgRDdZHGl5/+uvjbwmYbjEH2krg3Q7L/j
	dfuZ+9c2xKczWssz6/UXwlhlCLrRWRXT2skOs3lzdTKOejqhapmkZh5xTy4QwA7bI3XZvyrGbnG
	OdwI1e8C+Ha11CaJsWRp3AyGVkJpCIfzbJBhO6aghMXT6ucuj94DCnd/eMktJxgK27LayDlZ4rT
	JAaJTk/tIiOeW3r9muV93fiMminjSuYpVjJJOW16
X-Received: by 2002:a2e:a915:0:b0:3a9:87c0:7737 with SMTP id 38308e7fff4ca-3ae126b980fmr14214761fa.21.1794490391466;
        Thu, 12 Nov 2026 05:33:11 -0800 (PST)
Received: from crispy-cucumber.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae0926c65fsm19217631fa.28.2026.11.12.05.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:33:11 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH 0/2] arm64: dts: qcom: sm7125-samsung: add grip sensor
Date: Thu, 12 Nov 2026 15:32:57 +0200
Message-Id: <20261112-sm7125-samsung-grip-sensor-v1-0-d45dd9c845e7@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CQAwAwK+Qnm1CK7iJXzEeFqhrTVhIC8aE8
 HdXPM5lNnAxFYdrtYHJW12nXECnCvpnzElQh2Lgmi9ExOhjIG7R4+hrTphMZ3TJPhlypDoM7Tl
 0DUMJZpOHfo78dv/b1+4l/fIbYd+/QIFvlH4AAAA=
X-Change-ID: 20261112-sm7125-samsung-grip-sensor-2a107d537b42
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Samsung Galaxy A52 and A72 use Semtech SX9360 SAR sensor to detect if
the phone has been gripped. This sensor was initially added as part of
device introduction series, however, an older revision of the series was
picked up instead, which did not include this sensor. A link to this
series can be found here:
https://lore.kernel.org/linux-arm-msm/20261024-sm7125-samsung-v5-1-5a602ab00626@gmail.com/

This series fixes up issues mentioned in v5 and adds the grip sensor. No
changes from what was submitted before are intended.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Erikas Bitovtas (2):
      arm64: dts: qcom: sm7125-samsung: drop unused label
      arm64: dts: qcom: sm7125-samsung: add grip sensor

 .../arm64/boot/dts/qcom/sm7125-samsung-common.dtsi | 48 +++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)
---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261112-sm7125-samsung-grip-sensor-2a107d537b42

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>

