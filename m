Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7ED468C14
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984298; cv=none; b=p3hW40k/wc5CfTdudtaAD6yD/qweQFezecmTCNp30KZM0oE5DOcgYE8FqUnT/EIe051vGJUKqlmXQOE3xs9Zoy30tMRA4j3PXrv2Im8gbVXY7CQKkl4yYpDm4dM5EfGMrkmYmm1BJoJl6RKY608FFkIWK+HoZFQDz7amesf760Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984298; c=relaxed/simple;
	bh=DdHkd2DILCtnjHQsOpuetELXTGQnreKxYeZ6GaLLDSs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XJ1fxfd9YM3UjsMFxtVaHBxm0lbnqys2gjX88IA46hmoIedc7oamRXF8ORD67QSwcBVYajGtta71waXF9qpcoddMj9swtoIAh57PnbryIAjXhHl43FCUe3/3zZG2/3faoOkRXjx983rQviabhTHnD8c8KnkZomKuSefe7whQaKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B1JG3jdk; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B1JG3jdk"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so23258085e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789984295; x=1790589095; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XUqq0qWM5yZ1uKDCBnAQOs8ZSA6blJMuz5W3lmvErTc=;
        b=B1JG3jdkH25HfJRTwVUtBAAgPoIiPCNmQmiaa7xXefh3qrpNaQooxPhrsgLVqGGJHY
         UxBryzO4yEu3mO+n0vkNvH5OuO/pZZOQ1SvWWH4wO2fNmqDATJbzo3bvFh6njS5nzcFj
         uwQmG1hdMW9qNkVlpxHsO/fF+7zK6hBq5mmvdJr4940fWJ5XhOAukq3DpVymr9iNKFZw
         ABnC3mYkyYBSZx+1CCL9ovtWpzBRGjvXFjMBy2eg54ChqWGUYCCCn/KgxFZTTQUPTWUK
         8VbN3LYEV1Ango2l4t8sNeHqJPxHPDMojrVPsGzZYYSC+/xxBR4GMvcmVDRFSNTBDnSs
         Fp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984295; x=1790589095;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XUqq0qWM5yZ1uKDCBnAQOs8ZSA6blJMuz5W3lmvErTc=;
        b=GRQJlHmZ/Kmk6Ia+/LxRR/PomdIJxxVhr64+wBX25K8AvXOBmyHQ8dd6nKDRycN7Vi
         sqZzAegZgitvELdTDxoeJiEuhyQH7DlVbBiEWXhVb34bbdzQFqsFGHbh7EKIrXGQPrpX
         BzBfs8+mM8375qvzpUWEVfLAX0ant3TgmZXjkEaxy7fL/KTUx0r2pmIhhIDIMd/G2z/u
         jaVKTRKgokjE9Ut3V26SP90nsxAveC23bauHVGvA/B6EyjHqCnxma+27SdLNUOPOL75+
         5SgG+2unLPLm/bPVOsKre6jJGbTv91FkmxK6PAy9AYkubKKImP30KA2NLwl0698cwHCE
         +QgQ==
X-Forwarded-Encrypted: i=1; AKwUvByny/BCZjh9hnOXHKhAXf528OZsA6YP+N0zRO0v0hhY/YFQTk1KVYITnlpgwmTAhejertyTbWnOXd9PN8k=@vger.kernel.org
X-Gm-Message-State: AFuF++nVYcTsvOd0urSMbY41y6uMwM0qPJk1VUBBjisXQ6Fp3dZZ/qZN
	HrOwyD3+oc3FiKiOcqo/gc2szttkzZFLUSAljaCR7t9D2ZVtFnCCRYhIGu5E/A5fUHQ=
X-Gm-Gg: AYBFou2Xf4t0r0nt0+PEEXg4WYmlTTYahaZUdEZddcB54W+zg5DyDJDkV6z19E6rf2h
	K2QIxZjAXJTlLld+/1PirDsuAMWnpS+BPPHO+XJq6IxHvv9L20HYijf+mPP0Y8/lHybvUqSt4il
	H3Bng+PybRvQw9Q1HhapR1767oiJE4URKeQa5LFbeinppqi6w/elb75e1k2NJvOJv+kbwnFGUAF
	3jZjpy7j4Uo79sUwJV3ih90ma3ZT5IQ1t/gz22Gqpn8c4Waau9CR6nGNS8JMlwLKttCySlWlHCu
	FXor8tzqL5wPhfGPSZ69IpeutPlC5PCvmC0rEe7+zpijq6+KWMwzyUxg8K06+TJk8GBRNLPp4OU
	vux7gGeDTQ8FhAqHpiOpa5HBtBoOfJSqtalS96NgiHojzaA3KVla72kfjsjbF4SwmEuiAK9xkXu
	0n3hTIz2iZU4XI9jywtu92C/AERcuzn+LYWjtN3r45nkVpRCXAM2/qUvBQ3I5UFFbV74kZUFM3a
	mFDZfyydCIYeHFH8Q2Z
X-Received: by 2002:a05:600c:a085:b0:49d:25b0:cc60 with SMTP id 5b1f17b1804b1-49fc5747f7bmr147229805e9.29.1789984294496;
        Mon, 21 Sep 2026 02:51:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd03fe55sm254330365e9.2.2026.09.21.02.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:51:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/3] regulator: add support for the Nexperia NEX10000UB
 dual output LCD bias power supply
Date: Mon, 21 Sep 2026 11:51:29 +0200
Message-Id: <20260921-topic-sm8x50-nex10000ub-v2-0-eeeaf9b0c913@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACH+sGoC/4WNQQ6CMBBFr0Jm7ZgpCEFX3sOwKGWAMdqSFgiGc
 HcLHsC/e8n//60Q2AsHuCUreJ4liLMR0lMCpte2Y5QmMqSUFnRVJY5uEIPhXS45oeVFUcxUY9a
 w0ZnJC24vENeD51aW4/lR/ThM9ZPNuN/tjV7C6PznUM9q7/23zAoJc90yFbU2TNn9JVZ7d3a+g
 2rbti+wY8VU0QAAAA==
X-Change-ID: 20260918-topic-sm8x50-nex10000ub-3deca3c56ef4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1581;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=DdHkd2DILCtnjHQsOpuetELXTGQnreKxYeZ6GaLLDSs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqsP4jz046aOzf1rIcPcYL+eSQl2LTAc4x/WnYDgx2
 V4fBUZ+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCarD+IwAKCRB33NvayMhJ0RLlD/
 9WyVWJC0tNNXP+41NKXtmU9cXPc/MqHeZHGXC5O7RiB2KcajIkszY8+IceoKeohllLg16W9F9A4i1X
 eXciXdn+8EQDhITLcm+8au2RRBn/luaaD83zdTxKPSbPM1EVGY3gBCTttoFC3ZXDA7a+AHcLdwRgM+
 hExpxNay11CfQWuUWcSRTb+SMJ7pP+MgtU82I8LH8rhjZOSDufmAfnRnh3JB2OtFes/Fja51rhLwip
 QDYiM7PKE9Y9hiAm02wafHYLblv97ACaXjGYhqoybTQvoZpN0g1jaFOpU4jtFstXyfO+AM67l2e277
 Zw+y9SonyatuBBtKtriJO8r4g6hkSrAWke/AaH9oKlzK5N5EPuqq+uAyRAQ0Dd6V/i5WBJtLDAmeBF
 pXOndfhiuj7igFuNzrPSPZCQR5ndCoI5TQrKBdTiRy1Q1rO5FpUGhmhl3FneEutb0AUvCf8yRvkbx0
 GQdFd54NZzwBankzX+Lo0KhdXcSLU3sTtFwDx6cg09TTrMSpLQBNJTgb6+B2IqxjMeCaY09JG8MGX4
 n9sXHaF38W55/+SSSYuaiw0oRFy8ljpuOskdWKoOnfrfpzARlPoJK8YOYFsKoLxdDslS3SEvYfGoGL
 MJimW8tFtBk47dADqzql38xGld71CLzXvJ7bGbEYMaIEHtU+0CDM8ngCCVtQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document and add regulator support for the Nexperia NEX10000UB dual
output LCD bias power supply which provides programmable positive
and negative output voltages mainly for display panels applications.

The driver supports setting the output voltage from 4V to 6V in
100mV steps for each output via the I2C programming interface and
supports the enable GPIOs for both outputs.

Product datashet can be found online at [1].

[1] https://assets.nexperia.com/documents/data-sheet/NEX10000UB.pdf

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Make enable-gpios mandatory
- Register gpio as OUT_LOW at probe
- Link to v1: https://patch.msgid.link/20260918-topic-sm8x50-nex10000ub-v1-0-5afe06bace03@linaro.org

---
Neil Armstrong (3):
      dt-bindings: vendor-prefixes: add vendor prefix for Nexperia B.V.
      regulator: dt-bindings: document the Nexperia NEX10000UB dual output LCD bias power supply
      regulator: add regulator driver for the Nexperia NEX10000UB

 .../bindings/regulator/nexperia,nex10000ub.yaml    |  69 ++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 drivers/regulator/Kconfig                          |   8 ++
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/nex10000ub-regulator.c           | 147 +++++++++++++++++++++
 5 files changed, 227 insertions(+)
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
change-id: 20260918-topic-sm8x50-nex10000ub-3deca3c56ef4

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

