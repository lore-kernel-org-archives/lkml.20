Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B655539734A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165805; cv=none; b=p5ZfYEEP/DBZMajDvZXFAdnUHCpEIf4mpL1nnFk+8JR5RBwOaKqpl1EFrq4t2dtXKf6pc5wlkum22P0LEVoPm4Yi8zKEzDTS70Vd7/Sy6L+p7Kz+zPVDw25gd4EAfn42Xjw6EtzXhXxgMhDPl714X0y/yVVjt3PUAy4O7c3K4ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165805; c=relaxed/simple;
	bh=3fuxE0K0pdKY88jlD8b9+b8jsBFzputLxXJvAFlNEoc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d1m8dzcyICMLi1t3PhdbeXpqlOa86127sEFLHu6qpmyAwIC/efYLhBu+VbV/VkyrMRhbTAT/ObfWRTyy2Xh/Uxm1M5LXBrM1Ct7puVgJKngOxi0sD2Wz8XX/5KL7oNsmGlRbzqdQBGR3RukD1Kncyun66xItJPT5JImQuBteEkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QuNQG72c; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QuNQG72c"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac898fa4so882048f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790165798; x=1790770598; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B3p/QU7OMVVYXBcpiGeqAoPHE1xk40WRckQQBqak4y4=;
        b=QuNQG72cCnzHBrizFkkcS/yV53tq09AzzS3e/jSS3v2VPdMsJ2ePthzOOVNcnU1bZN
         RsvyzwiIxurFD4zP03/1+ts4bHpmaci6jSQLBGPpprLBCJQlNGrBWDfKiB/y+UFx7EJj
         lQzs6X5iGA2y9F/8YMbGlhjajywlbvNZ9cyHaV7K/TzMd6tcDd5MN0vj2xOoP5VWKyyI
         C2tbhEYNK4a/eleB+6IsKC2hFxxo5Ib6fJaQOVvR/DoXQlljeCRuj5q1KoYVA8hzYMfO
         OIJf8m0Z+AXaSeikAyS1IKq0t1s3X+8zriwFTJb9FQgPn0QUMekv2yJ8tD2ZlcFM6ESn
         N3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790165798; x=1790770598;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B3p/QU7OMVVYXBcpiGeqAoPHE1xk40WRckQQBqak4y4=;
        b=ab0x6SSOTFujUZOGcHUNVtrmGZwnCA/KNKxV90PY/1LGJXyjkdamqey5UxQTCmUBza
         5K929dOGIktgAvaG6EEnngg0FiXP6PvO8EJ0bIdoC2KM2ApGfL5Hr6J+Rq7qJRnZ5CDX
         oxDWDljP6fPu/dtFFIIjhih4guJNnyftD0ZPUwnTlIPXJlIk+S8XPB08IqqhPr7D5b2C
         jhNhgkLq7QZdxjltTQ1iqbJUp1F8wL9zi328Do2Jhej4l0JQNFVGme1370MQhhkq82/q
         CTxPX5c0MPy5t7wnFe6HHuP0sM1uiHiz5tHtT0Qs7fBMybbATfN54awUrg7hRJU848hq
         kE2g==
X-Forwarded-Encrypted: i=1; AKwUvBz05KvTlb7huUipRtyKCIiFb4IQMxcvdC/Q4qpkB535XVJdiGJg6jvkBy96t+R0gRVKyqmOAIXsZc1pACY=@vger.kernel.org
X-Gm-Message-State: AFuF++nXqktreYsu8Pf52xiDSJctuIKAathWsv5K966xCZqkn5bqAtl7
	lamk0NRR54tMBbE5VSjenmlgbOfUPtDCoiKDn+3RFeRD8Ngaq/d1amNh4GRPh/7S1fI=
X-Gm-Gg: AYBFou3WFLBBD1Dq5IhxuGJPX4I1eygzCqjxJV30rLqE4Ogxmlb6MUVhHXNUSKWARGE
	CJ/FrxNXbdubFA888knAsUW3v+3K/REFQYMZIwLfz1zgEO1jckY7jFT1bsFhsIxu1C7KBDL1xBd
	NN9DV46hJPDyEaZUto5//+oq/v3L22KFR1aRuzK0w4MSWAe2d+55aHnXyomgQoNWxNvK+HyxYsE
	KP0FLaSeXwmBQBRo1VxWvjQpUoLU29iO8EUyNJCnR1+nMgtzXr6vT+SOD5UWi9zMHhqd5dzSGEL
	lIJKnEEDB63N3yNG5jUEvEUrM95VE7sdtNRNDymWoe4aEfxayiiEwUcK1/24zoejx9Xepiwvsq4
	isYTMFgLsfCe7U5Qm3KYSj3EM4xyUpksWdh1j3eslGNHic25KLfymi63T4DKmrovWBwFeCpidQn
	+1vH4VB7ISnmlWFe0faoH15hTTQkRs1zZRycMB2LpE/MUJ2TrvKEkJppk6JbwUan0T0r0TsAy//
	wlCXTUjxgj6XARYGZ4=
X-Received: by 2002:a05:6000:2506:b0:487:c4c:b7fc with SMTP id ffacd0b85a97d-4886704a279mr4171071f8f.4.1790165797727;
        Wed, 23 Sep 2026 05:16:37 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889376sm5410298f8f.33.2026.09.23.05.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:16:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/2] arm64: dts: qcom: sm8650: add support from Valve
 Deckard headset
Date: Wed, 23 Sep 2026 14:16:31 +0200
Message-Id: <20260923-topic-sm8650-deckard-initial-dt-v2-0-8361c4548efa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB/Ds2oC/4WOwQ6CMBAFf4X07Jq2sUU8+R+GQ2lXWMWWtJVoC
 P8uYDx7nGTy5k0sYSRM7FRMLOJIiYJfQO4KZjvjWwRyCzPJpeaVFJDDQBbS46gVB4f2bqID8pT
 J9OAyiMooLXQjeGXYsjJEvNJrK1zqL6dnc0Ob19nV6CjlEN/bhVGs3q8m/9ZGARysVFiWqnL8Y
 M49eRPDPsSW1fM8fwDIIw034QAAAA==
X-Change-ID: 20260921-topic-sm8650-deckard-initial-dt-19a5616b109a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1409;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=3fuxE0K0pdKY88jlD8b9+b8jsBFzputLxXJvAFlNEoc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqs8MjiU0x/zgmEClWkgsaJjjQSqOX50KRJE6fETJM
 vLjSdzKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCarPDIwAKCRB33NvayMhJ0dAdD/
 92PxwPuQFzpWbvqldCJYKmTFyhV7ZKbzcPXp9lnnss8iBvzHrP0EnPo5MYIXTSKtEYEz96nbuaFx3h
 5iFIVLbvPN7HgZ22YI8ibfOz8n4HNK6NXw1uYq6ywjBqyhSuK7SH+dv1glevNd9lJOgIrUmY+vKjek
 vK4sH+RfuWahRp3uPf0CyWok0KkOjV1Lz4lTjElKYnwioVU9YlwCE2TH0i4SXvWPOSLw9r8ZCt/5bs
 GkDeQ0yz5RkPLlUQg34KpihjW76ZOPYicKp0rx7wZSCLxRxbUnCI7780QdhpA/lxNCuWg4FFpGljnf
 3Dr0sDUNSXGPXMai2q7rfe4u5LY9N8inrAfOj03iYnIDB+iX2oeDguFkoYHAWl4H/lP5vMa35E1uDv
 830YxzyPXL6R/5MvahLzDabSY4AzVAMlYkNrYUGXiBTnQAWfWyNdh6VTaLDr/2h4OORl/qWWgYqqSJ
 5s5f6Nm6VqwF6ZdTPgPOcQYAfVOqKLsAtTIy6Q5pEsWAM1/vw3iCYRZIRUIEuwEFYkXDg3Rnp7cEBX
 6lQvq+kCOc/kxTYxIi7QMGrd4BxGEzjZVAOdUmYGDyzYaOUtV1IjW02YPKW9DEQt4+MeYFbx2d9u6X
 IN8LK+k7d6iliVyBXDYIr7nXeIpgIg8yM6F/3oWGD0T4OtBbOyCKXxcauVOw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document and add initial DeviceTree for the Valve "Steam Frame"
codename Deckard. The Steam Frame is a virtual reality headset
based on the Qualcomm Snapdragon 8 Gen 3 SoC (SM8650).

Product Website: [1]

Dependencies: None

[1] https://store.steampowered.com/hardware/steamframe

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Added labels to smp2p to make removal of the nodes cleaner
- Reorganized properties (ranges after #*-cells, <prop>-names after <prop>)
- Use "0" instead of "0x0" in the reserved memory reg properties
- Use proper supply properties for vcnl4040
- Link to v1: https://patch.msgid.link/20260922-topic-sm8650-deckard-initial-dt-v1-0-c25e7759d04a@linaro.org

---
Neil Armstrong (2):
      dt-bindings: arm: qcom: document the Valve Deckard headset
      arm64: dts: qcom: sm8650: Add initial Valve Deckard devicetree

 Documentation/devicetree/bindings/arm/qcom.yaml   |    1 +
 arch/arm64/boot/dts/qcom/Makefile                 |    1 +
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts | 1288 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi              |    6 +-
 4 files changed, 1293 insertions(+), 3 deletions(-)
---
base-commit: 506632261e6aeb1aa05c3ebe4da0a9439153d746
change-id: 20260921-topic-sm8650-deckard-initial-dt-19a5616b109a

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

