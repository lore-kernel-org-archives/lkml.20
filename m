Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794369936;
	b=LkBk43CWgOCVOuXlLT+opyxYxbkSVf8J7Jwk4vDJggoxQjnHfg87gce255n2LSHXpjlc
	 DOLmt9I2wC89akmwcXOgHzmfvkoOx3qbyQfWCf6yRD/Vq6yNyIous98aNO2qZ2ZSQLF5S
	 ORObfOPlODa/oFnvs2mS0l+hSwdQZ/1LxiEV6Baq2ZMueH3NHSPqmYeYBRnUlgA/DTpcP
	 haXIBymcrpxG2jihuzQpOlmZjNdzWSc60ou/kFsSnZRjiuixH2uHbifLzxv395Edw8NKY
	 2EMGORKN2IYSDUREnmWlTNTBjAjwMceyspNO+PEC1ql+4J3Fb3q+CiJCuJVaZq1tbAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794369936;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=tSA1+GFQIt70Wj3YeIzzeqvo/K06zA4UMNZsoNbW2xI=;
	b=z6jnGcJastSsLFT1qW0m0m2s1JMdYQ+IHpKp4pmyBtb+c236+guqnEAe+EU3R6gfcOhV
	 k5iC92XMuleAPC0oIgHNsK4zGuq/pYjG8ssNmtt+/XXy4ZxWCgoGdBUNbtMgNnGX51m1O
	 uFNzjiM92dCOcpinGPStECA1oi0ZJmVf22PVkd30dqO+hRFAEeKjSBHq2S00pyeawqcvC
	 /aoUhRGmpQXpF/kaahoCv8KOp+jRacU8q4PuuY94uACj6O/YWxyeNomSP1/7Kht0n7vgo
	 fTkVZekM367annZ6VPksoxtEea5J5Gyh6C0mWQm5/6Q+0YJJQX8pp9DlSFRYw5ohp2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A58KdBWy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E24606A326;
	Wed, 11 Nov 2026 04:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A58KdBWy
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794369935;
	b=pBe4vSFgzWXqlOo8iLDackscUsIOa49yYlyWQEFLIMwXoHYvDIfqIS/RUl0eEs6dURFK
	 3qWwcrMGSz+oATKozR7QxCiPVopiU8mK/o9YwPGbSpssGri4G4MnR3zNkg2Gq95yFhzo2
	 pEoql0nERYdWSquNyF9PC+UJDMiQVUa29yJG7xNziT13bREKm7FeyUD5pA7tOrRIckGBI
	 KpgrMDTH5eYIXADMU7/2+/E+1btv+GgsTaZVkf0D9JI8IOP7bUMX8sV2CI/8CVWBkyn7o
	 nGes3rCTSKJVTr92aixiSCBRdD/9HmQnQp5YmpGBkuyqFkBSUVDaXk09RAkQCOQ3hyA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794369935;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=tSA1+GFQIt70Wj3YeIzzeqvo/K06zA4UMNZsoNbW2xI=;
	b=TWPKL42iX18ggtW9SesclpLgA0/fPirfOpOuuMVgd2eMlUV1VL+kD/C2goDH5tQPmZu7
	 fD8RlZn7ZibVeBqdvAkqHBT/OtzVP6CR9zezqUm1y4nKNtge36NZlABTuMNQyb+ODT7r/
	 /uQW+d+PUG6EHsYhutIAKPlI0AiSO+nP5JheBianYyLF2SBeGqpI7Y7w2oUdEwlxc2Oss
	 HcdIHJfMwhprCuS28kMg+fh9cZLB9lgnvTJGniCDiBCDSNtjtWm0V7xosLbLGqU8r8iRW
	 rYzleHtlJr5KA4nYLjT+UKONfG2dOM3Z3v4nTLm1sq9eChTuICEL5GgifU21ZMHWY0w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9992F1F0089F;
	Wed, 11 Nov 2026 04:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794369935;
	bh=tSA1+GFQIt70Wj3YeIzzeqvo/K06zA4UMNZsoNbW2xI=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=A58KdBWy58ILU0IdUWfCkJE8pEZwSxz63UIYFRpKGEUNdWYv37nGBS0oDeGXs+a2p
	 v5/+wqJUkEHYLj84h1/Eo9iblym6p9EYqYZpWyb18V2aq6fXURf9W/OGfUmH2kMHG+
	 W1WFYaLR7++6IqwOGRR2USDwullk1InS0RUD4J+eVD21cn60T2XmGaTWZuUFHUeYI3
	 n9w9Or+/zh8+GV5nzejj/X0wIuEzObALXp39Ys03Me2NwnYytDlzLldGEW2e74SDYb
	 BxncvGmFd8yE20bnZ7KMcB/nUVjafkLJ9mke3fzfd+7dPy07reF80e834eUpPBgKGY
	 WtnPwYr8tAicQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 05F9F48D63;
	Wed, 11 Nov 2026 04:05:34 +0000 (UTC)
From: Vishal Balasubramanian via B4 Relay <devnull+vishal.bala.nps.gmail.com@kernel.org>
Subject: [PATCH 0/2] (no cover subject)
Date: Wed, 11 Nov 2026 09:35:31 +0530
Message-Id: <20261111-master-v1-0-07b4f06a9dd5@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAIvp82oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDINDNTSwuSS3SNTdJMjZNtjRIMzFJVgIqLihKTcusABsUHVtbCwABg2f
 AWAAAAA==
X-Change-ID: 20261111-master-74b35c90f44c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vishal Balasubramanian <vishal.bala.nps@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794369932; l=986;
 i=vishal.bala.nps@gmail.com; s=20261111; h=from:subject:message-id;
 bh=KiusWAhSK4OQ0JyY8lYHbC/AU+upoKs1lAbK8klr2jE=;
 b=7pIQL4mHz0R9KgBAWaTCzFrikBumWNR5t+7mupL34uYw+c034KWw6nGylSvp1QVRl6FDZ1rqZ
 SjPD0enwYxjAL4KlOLT3tgtYkAiocR4MZbLDBHFYdbjQIwGZvSdPn6R
X-Developer-Key: i=vishal.bala.nps@gmail.com; a=ed25519;
 pk=GDcoc+SAK+BHD1Eq17X/BJa9U2HZkBW+dmxS8s1xMAY=
X-Endpoint-Received: by B4 Relay for vishal.bala.nps@gmail.com/20261111
 with auth_id=1486
X-Original-From: Vishal Balasubramanian <vishal.bala.nps@gmail.com>
Reply-To: vishal.bala.nps@gmail.com

This series adds initial support for the Samsung Galaxy Tab S7 FE LTE
(SM-T735), a tablet based on the Qualcomm SM7225 SoC.

Supported in this initial version:
- Display via simple-framebuffer
- Volume keys and power button
- UFS and microSD
- USB
- Wi-Fi and Bluetooth (WCN3991)
- ADSP, CDSP and modem, including mobile data

Signed-off-by: Vishal Balasubramanian <vishal.bala.nps@gmail.com>
---
Vishal Balasubramanian (2):
      dt-bindings: arm: qcom: Add Samsung Galaxy Tab S7 FE LTE
      arm64: dts: qcom: sm7225: Add Samsung Galaxy Tab S7 FE LTE

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/sm7225-samsung-gts7xllite.dts    | 575 +++++++++++++++++++++
 3 files changed, 577 insertions(+)
---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261111-master-74b35c90f44c

Best regards,
-- 
Vishal Balasubramanian <vishal.bala.nps@gmail.com>


